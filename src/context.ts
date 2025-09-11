let PrismaClient: any
let prisma: any

try {
  console.log('🔄 Attempting to load Prisma client...')
  console.log('DATABASE_URL exists:', !!process.env.DATABASE_URL)
  
  const prismaModule = require('@prisma/client')
  PrismaClient = prismaModule.PrismaClient
  
  console.log('✅ Prisma module loaded successfully')
  
  const globalForPrisma = global as unknown as { prisma?: any }
  
  prisma = globalForPrisma.prisma ?? 
    new PrismaClient({ 
      log: ['error', 'warn', 'info'],
      datasources: {
        db: {
          url: process.env.DATABASE_URL
        }
      }
    })

  if (process.env.NODE_ENV !== 'production') {
    globalForPrisma.prisma = prisma
  }
  
  console.log('✅ Prisma client initialized successfully')
  
  // Test the connection
  prisma.$connect().then(() => {
    console.log('✅ Database connection established')
  }).catch((error: any) => {
    console.error('❌ Database connection failed:', error instanceof Error ? error.message : String(error))
  })
  
} catch (error) {
  console.error('❌ Failed to initialize Prisma client:', error instanceof Error ? error.message : String(error))
  console.error('Full error:', error)
  prisma = null
}

export interface GraphQLContext {
  prisma: any
  requestId?: string
}

export function createContext(_params: { req: any }): GraphQLContext {
  return {
    prisma
  }
}

export { prisma }


