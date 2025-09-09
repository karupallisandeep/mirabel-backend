## Products GraphQL + DB mapping

This document captures the exact GraphQL operations and the underlying PostgreSQL tables/columns used by the backend for creating and fetching Products.

### Environment/Endpoints

- GraphQL endpoint: `http://localhost:4000/graphql`
- Prisma datasource: `DATABASE_URL` in `mirabel-backend/.env`
  - If connecting to AWS Aurora/Postgres, add `&sslmode=require` when needed

### Tables used

- Primary table: `gspublications`
  - Columns used by the current resolvers:
    - `gspublicationid` Int (PK, autoincrement) → GraphQL `Product.id`
    - `pubname` String? → GraphQL `Product.name`
    - `pubabbrev` String? → GraphQL `Product.sku`
    - `isactive` Decimal?(1,0) → GraphQL `Product.isActive` (1 = true, 0 = false)
    - `nep` Decimal?(18,4) → GraphQL `Product.basePrice`
    - `productcategoryid` Int? → joins to `tblproductcategory`
    - `createdon` Timestamp? → GraphQL `Product.createdAt`
    - `updatedon` Timestamp? → GraphQL `Product.updatedAt`

- Related lookup: `tblproductcategory`
  - Columns referenced:
    - `productcategoryid` Int (PK)
    - `name` String (used for name→id resolution when creating/updating)

### GraphQL schema (relevant parts)

```
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
```

### Field mapping (GraphQL → DB)

| GraphQL Product / Input | DB table.column |
|---|---|
| `id` | `gspublications.gspublicationid` |
| `name` | `gspublications.pubname` |
| `sku` | `gspublications.pubabbrev` |
| `isActive` | `gspublications.isactive` (1/0) |
| `basePrice` | `gspublications.nep` |
| `category` (string) | resolved to `tblproductcategory.productcategoryid` if provided; stored in `gspublications.productcategoryid` |
| `createdAt` | `gspublications.createdon` |
| `updatedAt` | `gspublications.updatedon` |

Notes:
- `type`, `tags`, `isFeatured`, `currency`, `pricingModel`, `billingCycle`, `description`, `subcategory`, `files` are surfaced at the GraphQL layer for UI parity; only the subset above is persisted in the current gspublications mapping.
- `category` accepts either a numeric id (as string or number) or a category name. If a name is provided and found, its id is stored.

### Create example (works with current backend)

Mutation:

```graphql
mutation CreateProduct($input: CreateProductInput!) {
  createProduct(input: $input) {
    id
    name
    sku
    isActive
    basePrice
    category
    createdAt
    updatedAt
  }
}
```

Variables:

```json
{
  "input": {
    "organizationId": "org1",
    "name": "Sample Publication",
    "sku": "SAMP-001",
    "type": "PRINT",
    "category": "Magazine", // or a numeric id as string
    "isActive": true,
    "basePrice": 99.5
  }
}
```

Resolver behavior (create):
- Writes to `gspublications` with:
  - `pubname` ← `name`
  - `pubabbrev` ← `sku`
  - `isactive` ← `isActive ? 1 : 0`
  - `nep` ← `basePrice`
  - `productcategoryid` ← looked up from `tblproductcategory` by name OR set directly if numeric
  - `createdon`/`updatedon` ← `now()`
- Returns a `Product` mapped back from the inserted row.

### Fetch examples

Products list with filters and pagination:

```graphql
query GetProducts(
  $page: Int = 1,
  $limit: Int = 25,
  $type: ProductType,
  $status: String,
  $search: String,
  $category: String,
  $organizationId: String = "org1",
  $sortBy: String = "createdAt",
  $sortOrder: String = "desc",
  $tags: [String!] = [],
  $minPrice: Float,
  $maxPrice: Float,
  $featuredOnly: Boolean = false
) {
  products(
    page: $page,
    limit: $limit,
    type: $type,
    status: $status,
    search: $search,
    category: $category,
    organizationId: $organizationId,
    sortBy: $sortBy,
    sortOrder: $sortOrder,
    tags: $tags,
    minPrice: $minPrice,
    maxPrice: $maxPrice,
    featuredOnly: $featuredOnly
  ) {
    products { id name sku category isActive basePrice createdAt updatedAt }
    totalCount
    page
    limit
    hasMore
  }
}
```

Resolver behavior (fetch):
- Builds a Prisma `where` against `gspublications` using:
  - `search` → `pubname`/`pubabbrev` contains (insensitive)
  - `status` → `isactive` (1 for active, 0 for inactive)
  - `category` → matches `productcategoryid` (when provided)
  - `minPrice`/`maxPrice` → compares against `nep`
  - `orderBy` is derived from `sortBy` and `sortOrder` (mapped to `createdon`, `updatedon`, `pubname`, `nep`)
- Joins `tblproductcategory` to return category name.

### Known considerations

- Connection errors like `ECONNRESET` from Prisma usually require:
  - Ensuring the RDS security group allows your current IP/VPN on `5432`
  - Adding `&sslmode=require` to `DATABASE_URL` if your instance enforces SSL
- The frontend form had a non-schema field `showInDigitalStudio`; the client service strips it before mutations.


