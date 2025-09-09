import 'dotenv/config'
import express from 'express'
import cors from 'cors'
import bodyParser from 'body-parser'
import { ApolloServer } from '@apollo/server'
import { expressMiddleware } from '@apollo/server/express4'
import { readFileSync } from 'fs'
import path from 'path'
import { resolvers } from './resolvers'
import { createContext, GraphQLContext } from './context'

async function bootstrap(): Promise<void> {
  const app = express()
  const port = Number(process.env.PORT || 4000)

  app.use(cors())
  app.use(bodyParser.json())

  // Health check endpoint
  app.get('/health', (_req, res) => {
    res.status(200).json({ status: 'OK', timestamp: new Date().toISOString() })
  })

  // Load SDL from file to match frontend schema exactly
  const schemaPath = path.join(__dirname, 'graphql', 'schema.graphql')
  const typeDefs = readFileSync(schemaPath, 'utf8')

  const server = new ApolloServer<GraphQLContext>({
    typeDefs,
    resolvers
  })

  await server.start()

  app.use(
    '/graphql',
    expressMiddleware(server, {
      context: async ({ req }) => createContext({ req })
    })
  )

  app.listen(port, () => {
    // eslint-disable-next-line no-console
    console.log(`GraphQL server ready at http://localhost:${port}/graphql`)
  })
}

bootstrap().catch((error) => {
  // eslint-disable-next-line no-console
  console.error('Failed to start server:', error)
  process.exit(1)
})


