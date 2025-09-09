import 'dotenv/config'
import { APIGatewayProxyEventV2, APIGatewayProxyResultV2, Context } from 'aws-lambda'
import { ApolloServer } from '@apollo/server'
import { startServerAndCreateLambdaHandler } from '@as-integrations/aws-lambda'
import { readFileSync } from 'fs'
import path from 'path'
import { resolvers } from './resolvers'
import { createContext } from './context'

// Load SDL from file
const schemaPath = path.join(__dirname, 'graphql', 'schema.graphql')
const typeDefs = readFileSync(schemaPath, 'utf8')

const server = new ApolloServer({
  typeDefs,
  resolvers,
  introspection: true
})

// Create the Lambda handler
const graphqlHandler = startServerAndCreateLambdaHandler(server, {
  context: async ({ event }: { event: APIGatewayProxyEventV2 }) => {
    return createContext({ 
      req: {
        headers: event.headers || {},
        body: event.body
      } as any
    })
  }
})

// Main Lambda handler that routes requests
export const handler = async (
  event: APIGatewayProxyEventV2,
  context: Context
): Promise<APIGatewayProxyResultV2> => {
  // Handle health check
  if (event.rawPath === '/health' && event.requestContext.http.method === 'GET') {
    return {
      statusCode: 200,
      headers: {
        'Content-Type': 'application/json',
        'Access-Control-Allow-Origin': '*',
        'Access-Control-Allow-Headers': 'Content-Type, Authorization',
        'Access-Control-Allow-Methods': 'GET, POST, OPTIONS'
      },
      body: JSON.stringify({ 
        status: 'OK', 
        timestamp: new Date().toISOString() 
      })
    }
  }

  // Handle GraphQL requests
  return graphqlHandler(event, context)
}