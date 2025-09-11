import 'dotenv/config'
import { APIGatewayProxyEventV2, APIGatewayProxyResultV2, Context } from 'aws-lambda'
import { ApolloServer } from '@apollo/server'
import { startServerAndCreateLambdaHandler, handlers } from '@as-integrations/aws-lambda'

// Ensure Prisma client is available in Lambda
try {
  const fs = require('fs')
  const path = require('path')
  const setupScript = path.join(__dirname, '..', 'lambda-prisma-setup.js')
  if (fs.existsSync(setupScript)) {
    require(setupScript)
  }
} catch (error) {
  console.log('⚠️ Lambda Prisma setup script not found or failed:', error instanceof Error ? error.message : String(error))
}

let typeDefs: string
let resolvers: any
let createContext: any

try {
    // Try to load the full GraphQL setup
    const schemaModule = require('./graphql/schema')
    typeDefs = schemaModule.typeDefs

    console.log('✅ Loaded GraphQL schema')

    const resolversModule = require('./resolvers')
    resolvers = resolversModule.resolvers

    console.log('✅ Loaded resolvers')

    const contextModule = require('./context')
    createContext = contextModule.createContext

    console.log('✅ Loaded context')
    console.log('✅ Full GraphQL setup loaded successfully')
} catch (error) {
    console.log('⚠️ Failed to load full schema, using fallback. Error:', error instanceof Error ? error.message : String(error))
    console.log('Stack:', error instanceof Error ? error.stack : 'No stack trace available')

    // Fallback to simple schema that matches the expected structure
    typeDefs = `
    scalar DateTime
    scalar JSON
    
    type Query {
      hello: String
      health: String
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
    }
    
    type Product {
      id: ID!
      name: String!
      type: ProductType!
    }
    
    type ProductsResponse {
      products: [Product!]!
      totalCount: Int!
      page: Int!
      limit: Int!
      hasMore: Boolean!
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

    resolvers = {
        Query: {
            hello: () => 'Hello from Mirabel Backend!',
            health: () => 'OK',
            products: () => ({
                products: [],
                totalCount: 0,
                page: 1,
                limit: 25,
                hasMore: false
            })
        }
    }

    createContext = () => ({})
}

const server = new ApolloServer({
    typeDefs,
    resolvers,
    introspection: true,
    csrfPrevention: false, // Disable CSRF for easier frontend integration
})

// Create the GraphQL handler
const graphqlHandler = startServerAndCreateLambdaHandler(
    server,
    handlers.createAPIGatewayProxyEventV2RequestHandler(),
    {
        context: async () => {
            try {
                return createContext({ req: {} as any })
            } catch (error) {
                console.error('Context creation failed:', error)
                return {}
            }
        }
    }
)

// Main handler with CORS support
export const handler = async (
    event: APIGatewayProxyEventV2,
    context: Context
): Promise<APIGatewayProxyResultV2> => {

    // Handle preflight OPTIONS requests
    if (event.requestContext.http.method === 'OPTIONS') {
        return {
            statusCode: 200,
            headers: {
                'Access-Control-Allow-Origin': '*',
                'Access-Control-Allow-Headers': 'Content-Type, Authorization, x-apollo-operation-name, apollo-require-preflight',
                'Access-Control-Allow-Methods': 'GET, POST, OPTIONS',
                'Access-Control-Max-Age': '86400'
            },
            body: ''
        }
    }

    // Handle GraphQL requests
    try {
        const result = await graphqlHandler(event, context, () => { })

        // Add CORS headers to the response
        if (result && typeof result === 'object' && 'headers' in result) {
            result.headers = {
                ...result.headers,
                'Access-Control-Allow-Origin': '*',
                'Access-Control-Allow-Headers': 'Content-Type, Authorization, x-apollo-operation-name, apollo-require-preflight',
                'Access-Control-Allow-Methods': 'GET, POST, OPTIONS'
            }
        }

        return result as APIGatewayProxyResultV2
    } catch (error) {
        console.error('GraphQL Handler Error:', error)
        return {
            statusCode: 500,
            headers: {
                'Content-Type': 'application/json',
                'Access-Control-Allow-Origin': '*',
                'Access-Control-Allow-Headers': 'Content-Type, Authorization, x-apollo-operation-name, apollo-require-preflight',
                'Access-Control-Allow-Methods': 'GET, POST, OPTIONS'
            },
            body: JSON.stringify({
                error: 'Internal Server Error',
                message: error instanceof Error ? error.message : 'Unknown error'
            })
        }
    }
}