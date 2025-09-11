export const typeDefs = `
scalar DateTime
"""Use Float for price-like numbers to simplify client integration"""
scalar JSON

type Query {
  health: String!
  products(
    page: Int = 1
    limit: Int = 25
    type: ProductType
    status: String
    search: String
    category: String
    organizationId: String = "org1"
    sortBy: String = "createdAt"
    sortOrder: String = "desc"
    tags: [String!]
    minPrice: Float
    maxPrice: Float
    featuredOnly: Boolean = false
  ): ProductsResponse!
  product(id: ID!, organizationId: String = "org1"): Product
  productStats(organizationId: String = "org1"): ProductStats!
  productsByType(organizationId: String = "org1"): [ProductTypeBreakdown!]!
  productsByCategory(organizationId: String = "org1"): [ProductCategoryBreakdown!]!
  searchProducts(
    searchTerm: String!
    limit: Int = 10
    organizationId: String = "org1"
    includeInactive: Boolean = false
  ): [Product!]!
  recentProducts(
    limit: Int = 10
    days: Int = 30
    organizationId: String = "org1"
  ): [Product!]!
  checkSkuAvailability(
    sku: String!
    organizationId: String = "org1"
    excludeId: ID
  ): SkuAvailability!
}

type Mutation {
  createProduct(input: CreateProductInput!): Product!
  updateProduct(id: ID!, input: UpdateProductInput!, organizationId: String = "org1"): Product!
  deleteProduct(id: ID!, organizationId: String = "org1"): Boolean!
  bulkDeleteProducts(
    productIds: [ID!]!
    organizationId: String = "org1"
  ): BulkOperationResult!
  bulkUpdateProductStatus(
    productIds: [ID!]!
    isActive: Boolean!
    organizationId: String = "org1"
  ): BulkOperationResult!
}

type Product {
  id: ID!
  organizationId: String!
  name: String!
  description: String
  type: ProductType!
  sku: String
  category: String
  subcategory: String
  tags: [String!]!
  isActive: Boolean!
  isFeatured: Boolean!
  basePrice: Float
  currency: String!
  pricingModel: String
  billingCycle: String
  createdAt: DateTime!
  updatedAt: DateTime!
  files: [ProductFile!]!
}

type ProductFile {
  id: ID!
  productId: ID!
  filename: String!
  originalName: String!
  fileSize: Int!
  mimeType: String!
  filePath: String!
  createdAt: DateTime!
}

type ProductsResponse {
  products: [Product!]!
  totalCount: Int!
  page: Int!
  limit: Int!
  hasMore: Boolean!
}

type ProductStats {
  totalProducts: Int!
  activeProducts: Int!
  featuredProducts: Int!
  uniqueTypes: Int!
  uniqueCategories: Int!
  averagePrice: Float!
  minPrice: Float!
  maxPrice: Float!
}

type ProductTypeBreakdown {
  type: ProductType!
  count: Int!
  activeCount: Int!
  averagePrice: Float!
}

type ProductCategoryBreakdown {
  category: String!
  count: Int!
  activeCount: Int!
  averagePrice: Float!
}

type SkuAvailability {
  sku: String!
  available: Boolean!
}

type BulkOperationResult {
  successCount: Int!
  failureCount: Int!
  errors: [BulkOperationError!]!
}

type BulkOperationError {
  productId: ID!
  error: String!
}

input CreateProductInput {
  organizationId: String = "org1"
  name: String!
  description: String
  type: ProductType!
  sku: String
  category: String
  subcategory: String
  tags: [String!] = []
  isActive: Boolean = true
  isFeatured: Boolean = false
  basePrice: Float
  currency: String = "USD"
  pricingModel: String
  billingCycle: String
}

input UpdateProductInput {
  name: String
  description: String
  type: ProductType
  sku: String
  category: String
  subcategory: String
  tags: [String!]
  isActive: Boolean
  isFeatured: Boolean
  basePrice: Float
  currency: String
  pricingModel: String
  billingCycle: String
}

enum ProductType {
  DIGITAL
  PRINT
  SERVICE
  SUBSCRIPTION
  EVENT
  EDITORIAL
}
`