import { GraphQLContext } from '../context'

const scalarResolvers = {
  DateTime: {
    serialize: (date: Date) => date.toISOString(),
    parseValue: (value: string) => new Date(value),
    parseLiteral: (ast: any) => new Date(ast.value)
  },
  Decimal: {
    serialize: (value: any) => parseFloat(value),
    parseValue: (value: any) => parseFloat(value),
    parseLiteral: (ast: any) => parseFloat(ast.value)
  },
  JSON: {
    serialize: (value: any) => value,
    parseValue: (value: any) => value,
    parseLiteral: (ast: any) => JSON.parse(ast.value)
  }
}

const productResolvers = {
  ...scalarResolvers,

  Query: {
    products: async (_: unknown, args: any, { prisma }: GraphQLContext) => {
      const {
        page = 1,
        limit = 25,
        type,
        status,
        search,
        category,
        organizationId = 'org1',
        sortBy = 'createdAt',
        sortOrder = 'desc',
        tags = [],
        minPrice,
        maxPrice,
        featuredOnly = false
      } = args

      const where: any = { organizationId }

      if (type) where.type = type
      if (status === 'active') where.isActive = true
      else if (status === 'inactive') where.isActive = false
      if (category && category !== 'all') where.category = category

      if (search) {
        where.OR = [
          { name: { contains: search, mode: 'insensitive' } },
          { description: { contains: search, mode: 'insensitive' } },
          { sku: { contains: search, mode: 'insensitive' } }
        ]
      }

      if (tags.length > 0) {
        where.tags = { hasSome: tags }
      }

      if (minPrice !== undefined) {
        where.basePrice = { ...where.basePrice, gte: minPrice }
      }
      if (maxPrice !== undefined) {
        where.basePrice = { ...where.basePrice, lte: maxPrice }
      }
      if (featuredOnly) where.isFeatured = true

      const orderBy: any = {}
      orderBy[sortBy] = String(sortOrder).toLowerCase() === 'asc' ? 'asc' : 'desc'

      const offset = (page - 1) * limit

      const totalCount = await prisma.product.count({ where })
      const products = await prisma.product.findMany({
        where,
        orderBy,
        skip: offset,
        take: limit,
        include: { files: true }
      })

      return {
        products,
        totalCount,
        page,
        limit,
        hasMore: offset + limit < totalCount
      }
    },

    product: async (_: unknown, { id, organizationId = 'org1' }: any, { prisma }: GraphQLContext) => {
      const product = await prisma.product.findFirst({
        where: { id, organizationId },
        include: { files: true }
      })
      if (!product) throw new Error(`Product not found with id: ${id}`)
      return product
    },

    productStats: async (_: unknown, { organizationId = 'org1' }: any, { prisma }: GraphQLContext) => {
      const [
        totalProducts,
        activeProducts,
        featuredProducts,
        typeStats,
        categoryStats,
        priceStats
      ] = await Promise.all([
        prisma.product.count({ where: { organizationId } }),
        prisma.product.count({ where: { organizationId, isActive: true } }),
        prisma.product.count({ where: { organizationId, isFeatured: true } }),
        prisma.product.groupBy({ by: ['type'], where: { organizationId }, _count: true }),
        prisma.product.groupBy({ by: ['category'], where: { organizationId, category: { not: null } }, _count: true }),
        prisma.product.aggregate({ where: { organizationId, basePrice: { not: null } }, _avg: { basePrice: true }, _min: { basePrice: true }, _max: { basePrice: true } })
      ])

      return {
        totalProducts,
        activeProducts,
        featuredProducts,
        uniqueTypes: typeStats.length,
        uniqueCategories: categoryStats.length,
        averagePrice: (priceStats as any)._avg.basePrice || 0,
        minPrice: (priceStats as any)._min.basePrice || 0,
        maxPrice: (priceStats as any)._max.basePrice || 0
      }
    },

    productsByType: async (_: unknown, { organizationId = 'org1' }: any, { prisma }: GraphQLContext) => {
      const typeStats = await prisma.product.groupBy({
        by: ['type'],
        where: { organizationId },
        _count: true,
        _avg: { basePrice: true }
      })

      const activeTypeStats = await prisma.product.groupBy({
        by: ['type'],
        where: { organizationId, isActive: true },
        _count: true
      })

      const activeCountMap = activeTypeStats.reduce((acc: Record<string, number>, stat: any) => {
        acc[stat.type] = stat._count
        return acc
      }, {} as Record<string, number>)

      return typeStats.map((stat: any) => ({
        type: stat.type,
        count: stat._count,
        activeCount: activeCountMap[stat.type] || 0,
        averagePrice: stat._avg.basePrice || 0
      }))
    },

    productsByCategory: async (_: unknown, { organizationId = 'org1' }: any, { prisma }: GraphQLContext) => {
      const categoryStats = await prisma.product.groupBy({
        by: ['category'],
        where: { organizationId, category: { not: null } },
        _count: true,
        _avg: { basePrice: true }
      })

      const activeCategoryStats = await prisma.product.groupBy({
        by: ['category'],
        where: { organizationId, category: { not: null }, isActive: true },
        _count: true
      })

      const activeCountMap = activeCategoryStats.reduce((acc: Record<string, number>, stat: any) => {
        acc[stat.category] = stat._count
        return acc
      }, {} as Record<string, number>)

      return categoryStats.map((stat: any) => ({
        category: stat.category,
        count: stat._count,
        activeCount: activeCountMap[stat.category] || 0,
        averagePrice: stat._avg.basePrice || 0
      }))
    },

    searchProducts: async (_: unknown, { searchTerm, limit = 10, organizationId = 'org1', includeInactive = false }: any, { prisma }: GraphQLContext) => {
      const where: any = {
        organizationId,
        OR: [
          { name: { contains: searchTerm, mode: 'insensitive' } },
          { description: { contains: searchTerm, mode: 'insensitive' } },
          { sku: { contains: searchTerm, mode: 'insensitive' } },
          { category: { contains: searchTerm, mode: 'insensitive' } }
        ]
      }

      if (!includeInactive) where.isActive = true

      const products = await prisma.product.findMany({
        where,
        take: limit,
        orderBy: { name: 'asc' },
        include: { files: true }
      })

      return products
    },

    recentProducts: async (_: unknown, { limit = 10, days = 30, organizationId = 'org1' }: any, { prisma }: GraphQLContext) => {
      const dateThreshold = new Date()
      dateThreshold.setDate(dateThreshold.getDate() - days)

      const products = await prisma.product.findMany({
        where: { organizationId, createdAt: { gte: dateThreshold } },
        orderBy: { createdAt: 'desc' },
        take: limit,
        include: { files: true }
      })

      return products
    },

    checkSkuAvailability: async (_: unknown, { sku, organizationId = 'org1', excludeId }: any, { prisma }: GraphQLContext) => {
      const where: any = { sku, organizationId }
      if (excludeId) where.id = { not: excludeId }

      const existingProduct = await prisma.product.findFirst({ where })
      return { sku, available: !existingProduct }
    }
  },

  Mutation: {
    createProduct: async (_: unknown, { input }: any, { prisma }: GraphQLContext) => {
      // Minimal validation; can be expanded or wired to your frontend validators
      const product = await prisma.product.create({
        data: input,
        include: { files: true }
      })
      return product
    },

    updateProduct: async (_: unknown, { id, input, organizationId = 'org1' }: any, { prisma }: GraphQLContext) => {
      const existing = await prisma.product.findFirst({ where: { id, organizationId } })
      if (!existing) throw new Error(`Product not found with id: ${id}`)

      if (input.sku && input.sku !== existing.sku) {
        const dup = await prisma.product.findFirst({ where: { sku: input.sku, organizationId, id: { not: id } } })
        if (dup) throw new Error(`Product with SKU '${input.sku}' already exists`)
      }

      const updated = await prisma.product.update({
        where: { id },
        data: input,
        include: { files: true }
      })
      return updated
    },

    deleteProduct: async (_: unknown, { id, organizationId = 'org1' }: any, { prisma }: GraphQLContext) => {
      const existing = await prisma.product.findFirst({ where: { id, organizationId } })
      if (!existing) throw new Error(`Product not found with id: ${id}`)
      await prisma.product.delete({ where: { id } })
      return true
    },

    bulkDeleteProducts: async (_: unknown, { productIds, organizationId = 'org1' }: any, { prisma }: GraphQLContext) => {
      const results = { successCount: 0, failureCount: 0, errors: [] as Array<{ productId: string; error: string }> }
      for (const productId of productIds) {
        try {
          const existing = await prisma.product.findFirst({ where: { id: productId, organizationId } })
          if (!existing) {
            results.failureCount++
            results.errors.push({ productId, error: `Product not found with id: ${productId}` })
            continue
          }
          await prisma.product.delete({ where: { id: productId } })
          results.successCount++
        } catch (err: any) {
          results.failureCount++
          results.errors.push({ productId, error: err.message })
        }
      }
      return results
    },

    bulkUpdateProductStatus: async (_: unknown, { productIds, isActive, organizationId = 'org1' }: any, { prisma }: GraphQLContext) => {
      const updateResult = await prisma.product.updateMany({
        where: { id: { in: productIds }, organizationId },
        data: { isActive }
      })
      return { successCount: updateResult.count, failureCount: productIds.length - updateResult.count, errors: [] }
    }
  }
}

export default productResolvers


