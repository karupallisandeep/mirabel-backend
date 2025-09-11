import { GraphQLContext } from '../context'

const scalarResolvers = {
  DateTime: {
    serialize: (date: Date) => new Date(date).toISOString(),
    parseValue: (value: string) => new Date(value),
    parseLiteral: (ast: any) => new Date(ast.value)
  },
  // Decimal scalar no longer needed; map to Float via numbers
  JSON: {
    serialize: (value: any) => value,
    parseValue: (value: any) => value,
    parseLiteral: (ast: any) => JSON.parse(ast.value)
  }
}

function mapSortField(sortBy: string): string {
  const map: Record<string, string> = {
    name: 'pubname',
    createdAt: 'createdon',
    updatedAt: 'updatedon',
    basePrice: 'nep'
  }
  return map[sortBy] || 'createdon'
}

function mapPublicationToProduct(p: any) {
  return {
    id: String(p.gspublicationid),
    organizationId: p.app_product_extras?.organizationId || 'org1',
    name: p.pubname ?? p.pubabbrev ?? `Publication ${p.gspublicationid}`,
    description: p.app_product_extras?.description ?? null,
    type: (p.app_product_extras?.type || 'PRINT'),
    sku: p.pubabbrev ?? null,
    category: p.tblproductcategory?.name ?? null,
    subcategory: p.app_product_extras?.subcategory ?? null,
    tags: p.app_product_extras?.tags || [],
    isActive: Number(p.isactive ?? 1) === 1,
    isFeatured: Boolean(p.app_product_extras?.isFeatured) || false,
    basePrice: p.nep != null ? Number(p.nep) : null,
    currency: p.app_product_extras?.currency || 'USD',
    pricingModel: p.app_product_extras?.pricingModel ?? null,
    billingCycle: p.app_product_extras?.billingCycle ?? null,
    createdAt: p.createdon ?? new Date(0),
    updatedAt: p.updatedon ?? new Date(0),
    files: []
  }
}

const productResolvers = {
  ...scalarResolvers,

  Query: {
    health: () => 'OK',
    
    products: async (_: unknown, args: any, { prisma }: GraphQLContext) => {
      if (!prisma) {
        console.error('Prisma client not available')
        return {
          products: [],
          totalCount: 0,
          page: args.page || 1,
          limit: args.limit || 25,
          hasMore: false
        }
      }
      
      try {
      const {
        page = 1,
        limit = 25,
        status,
        search,
        category,
        sortBy = 'createdAt',
        sortOrder = 'desc',
        minPrice,
        maxPrice,
        featuredOnly = false
      } = args

      const where: any = {}

      if (search) {
        where.OR = [
          { pubname: { contains: search, mode: 'insensitive' } },
          { pubabbrev: { contains: search, mode: 'insensitive' } }
        ]
      }

      if (status === 'active') where.isactive = 1
      else if (status === 'inactive') where.isactive = 0

      if (typeof category === 'string' && category && category !== 'all') {
        where.tblproductcategory = { is: { name: { equals: category } } }
      }

      if (minPrice !== undefined || maxPrice !== undefined) {
        where.nep = {}
        if (minPrice !== undefined) where.nep.gte = Number(minPrice)
        if (maxPrice !== undefined) where.nep.lte = Number(maxPrice)
      }

      if (featuredOnly) {
        // No featured field in publications; keep same set
      }

      const orderByField = mapSortField(sortBy)
      const orderBy = { [orderByField]: String(sortOrder).toLowerCase() === 'asc' ? 'asc' : 'desc' } as any

      const offset = (page - 1) * limit

      const totalCount = await prisma.gspublications.count({ where })
      const pubs = await prisma.gspublications.findMany({
        where,
        orderBy,
        skip: offset,
        take: limit,
        include: { tblproductcategory: true, app_product_extras: true }
      })

      return {
        products: pubs.map(mapPublicationToProduct),
        totalCount,
        page,
        limit,
        hasMore: offset + limit < totalCount
      }
      } catch (error) {
        console.error('Error in products query:', error)
        return {
          products: [],
          totalCount: 0,
          page: args.page || 1,
          limit: args.limit || 25,
          hasMore: false
        }
      }
    },

    product: async (_: unknown, { id }: any, { prisma }: GraphQLContext) => {
      if (!prisma) throw new Error('Database not available')
      try {
        const p = await prisma.gspublications.findUnique({
          where: { gspublicationid: Number(id) },
          include: { tblproductcategory: true, app_product_extras: true }
        })
        if (!p) throw new Error(`Product not found with id: ${id}`)
        return mapPublicationToProduct(p)
      } catch (error) {
        console.error('Error in product query:', error)
        throw error
      }
    },

    productStats: async (_: unknown, _args: any, { prisma }: GraphQLContext) => {
      if (!prisma) {
        console.error('Prisma client not available in productStats')
        return {
          totalProducts: 0,
          activeProducts: 0,
          featuredProducts: 0,
          uniqueTypes: 0,
          uniqueCategories: 0,
          averagePrice: 0,
          minPrice: 0,
          maxPrice: 0
        }
      }
      
      try {
        const [totalProducts, activeProducts, avg] = await Promise.all([
          prisma.gspublications.count(),
          prisma.gspublications.count({ where: { isactive: 1 } }),
          prisma.gspublications.aggregate({ _avg: { nep: true }, _min: { nep: true }, _max: { nep: true } })
        ])

        return {
          totalProducts,
          activeProducts,
          featuredProducts: 0,
          uniqueTypes: 1,
          uniqueCategories: (await prisma.gspublications.findMany({
            where: { productcategoryid: { not: null } },
            distinct: ['productcategoryid'],
            select: { productcategoryid: true }
          })).length,
          averagePrice: Number((avg as any)._avg.nep || 0),
          minPrice: Number((avg as any)._min.nep || 0),
          maxPrice: Number((avg as any)._max.nep || 0)
        }
      } catch (error) {
        console.error('Error in productStats:', error)
        return {
          totalProducts: 0,
          activeProducts: 0,
          featuredProducts: 0,
          uniqueTypes: 0,
          uniqueCategories: 0,
          averagePrice: 0,
          minPrice: 0,
          maxPrice: 0
        }
      }
    },

    productsByType: async (_: unknown, _args: any, { prisma }: GraphQLContext) => {
      if (!prisma) return [{ type: 'PRINT', count: 0, activeCount: 0, averagePrice: 0 }]
      try {
        const total = await prisma.gspublications.count()
        const active = await prisma.gspublications.count({ where: { isactive: 1 } })
        return [{ type: 'PRINT', count: total, activeCount: active, averagePrice: 0 }]
      } catch (error) {
        console.error('Error in productsByType:', error)
        return [{ type: 'PRINT', count: 0, activeCount: 0, averagePrice: 0 }]
      }
    },

    productsByCategory: async (_: unknown, _args: any, { prisma }: GraphQLContext) => {
      if (!prisma) return [{ category: 'uncategorized', count: 0, activeCount: 0, averagePrice: 0 }]
      try {
        const groups = await prisma.gspublications.groupBy({
          by: ['productcategoryid'],
          _count: true,
          _avg: { nep: true }
        })
        const ids = groups.map((g: any) => g.productcategoryid).filter((x: any) => x != null)
        const cats = ids.length
          ? await prisma.tblproductcategory.findMany({
              where: { productcategoryid: { in: ids } },
              select: { productcategoryid: true, name: true }
            })
          : []
        const idToName = new Map<number, string>(cats.map((c: any) => [c.productcategoryid, c.name]))
        return groups.map((g: any) => ({
          category: g.productcategoryid != null ? (idToName.get(g.productcategoryid) || String(g.productcategoryid)) : 'uncategorized',
          count: g._count,
          activeCount: g._count,
          averagePrice: Number(g._avg.nep || 0)
        }))
      } catch (error) {
        console.error('Error in productsByCategory:', error)
        return [{ category: 'uncategorized', count: 0, activeCount: 0, averagePrice: 0 }]
      }
    },

    searchProducts: async (_: unknown, { searchTerm, limit = 10, includeInactive = false }: any, { prisma }: GraphQLContext) => {
      const where: any = {
        OR: [
          { pubname: { contains: searchTerm, mode: 'insensitive' } },
          { pubabbrev: { contains: searchTerm, mode: 'insensitive' } }
        ]
      }
      if (!includeInactive) where.isactive = 1
      const pubs = await prisma.gspublications.findMany({ where, take: limit, orderBy: { pubname: 'asc' }, include: { tblproductcategory: true, app_product_extras: true } })
      return pubs.map(mapPublicationToProduct)
    },

    recentProducts: async (_: unknown, { limit = 10, days = 30 }: any, { prisma }: GraphQLContext) => {
      const dateThreshold = new Date()
      dateThreshold.setDate(dateThreshold.getDate() - days)
      const pubs = await prisma.gspublications.findMany({ where: { createdon: { gte: dateThreshold } }, orderBy: { createdon: 'desc' }, take: limit, include: { tblproductcategory: true, app_product_extras: true } })
      return pubs.map(mapPublicationToProduct)
    },

    checkSkuAvailability: async (_: unknown, { sku }: any, { prisma }: GraphQLContext) => {
      const existing = await prisma.gspublications.findFirst({ where: { pubabbrev: sku } })
      return { sku, available: !existing }
    }
  },

  Mutation: {
    createProduct: async (_: unknown, { input }: any, { prisma }: GraphQLContext) => {
      const now = new Date()
      const data: any = {
        pubname: input.name ?? null,
        pubabbrev: input.sku ?? null,
        isactive: input.isActive === false ? 0 : 1,
        nep: input.basePrice != null ? Number(input.basePrice) : undefined,
        createdon: now,
        updatedon: now,
        producttypeid: 1
      }

      // Optional: map category string to productcategoryid (by id or by name)
      if (typeof input.category === 'string' && input.category.trim().length > 0) {
        const catStr = input.category.trim()
        const numeric = Number(catStr)
        if (!Number.isNaN(numeric)) {
          data.productcategoryid = numeric
        } else {
          const cat = await prisma.tblproductcategory.findFirst({ where: { name: { equals: catStr } }, select: { productcategoryid: true } })
          if (cat) data.productcategoryid = cat.productcategoryid
        }
      }

      const created = await prisma.gspublications.create({ data })
      await prisma.app_product_extras.create({
        data: {
          gspublicationid: created.gspublicationid,
          organizationId: input.organizationId || 'org1',
          description: input.description ?? null,
          type: input.type ?? 'PRINT',
          isFeatured: input.isFeatured ?? false,
          currency: input.currency ?? 'USD',
          pricingModel: input.pricingModel ?? null,
          billingCycle: input.billingCycle ?? null,
          subcategory: input.subcategory ?? null,
          tags: Array.isArray(input.tags) ? input.tags : []
        }
      })

      const p = await prisma.gspublications.findUnique({ where: { gspublicationid: created.gspublicationid }, include: { tblproductcategory: true, app_product_extras: true } })
      return mapPublicationToProduct(p)
    },
    updateProduct: async (_: unknown, { id, input }: any, { prisma }: GraphQLContext) => {
      const pubId = Number(id)
      const existing = await prisma.gspublications.findUnique({ where: { gspublicationid: pubId } })
      if (!existing) throw new Error(`Product not found with id: ${id}`)

      const data: any = { updatedon: new Date() }
      if (typeof input.name === 'string') data.pubname = input.name
      if (typeof input.sku === 'string') data.pubabbrev = input.sku
      if (typeof input.isActive === 'boolean') data.isactive = input.isActive ? 1 : 0
      if (input.basePrice != null) data.nep = Number(input.basePrice)
      if (typeof input.category === 'string' && input.category.trim().length > 0) {
        const catStr = input.category.trim()
        const numeric = Number(catStr)
        if (!Number.isNaN(numeric)) {
          data.productcategoryid = numeric
        } else {
          const cat = await prisma.tblproductcategory.findFirst({ where: { name: { equals: catStr } }, select: { productcategoryid: true } })
          if (cat) data.productcategoryid = cat.productcategoryid
        }
      }

      await prisma.gspublications.update({ where: { gspublicationid: pubId }, data })
      await prisma.app_product_extras.upsert({
        where: { gspublicationid: pubId },
        update: {
          organizationId: input.organizationId || undefined,
          description: input.description ?? undefined,
          type: input.type ?? undefined,
          isFeatured: input.isFeatured ?? undefined,
          currency: input.currency ?? undefined,
          pricingModel: input.pricingModel ?? undefined,
          billingCycle: input.billingCycle ?? undefined,
          subcategory: input.subcategory ?? undefined,
          tags: Array.isArray(input.tags) ? input.tags : undefined
        },
        create: {
          gspublicationid: pubId,
          organizationId: input.organizationId || 'org1',
          description: input.description ?? null,
          type: input.type ?? 'PRINT',
          isFeatured: input.isFeatured ?? false,
          currency: input.currency ?? 'USD',
          pricingModel: input.pricingModel ?? null,
          billingCycle: input.billingCycle ?? null,
          subcategory: input.subcategory ?? null,
          tags: Array.isArray(input.tags) ? input.tags : []
        }
      })

      const p = await prisma.gspublications.findUnique({ where: { gspublicationid: pubId }, include: { tblproductcategory: true, app_product_extras: true } })
      return mapPublicationToProduct(p)
    },
    deleteProduct: async () => {
      throw new Error('DeleteProduct not supported for gspublications (read-only mapping)')
    },
    bulkDeleteProducts: async () => ({ successCount: 0, failureCount: 0, errors: [] }),
    bulkUpdateProductStatus: async () => ({ successCount: 0, failureCount: 0, errors: [] })
  }
}

export default productResolvers


