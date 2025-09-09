import { PrismaClient } from '@prisma/client'

export interface GraphQLContext {
  prisma: PrismaClient
  requestId?: string
}

const globalForPrisma = global as unknown as { prisma?: PrismaClient }

export const prisma: PrismaClient =
  globalForPrisma.prisma ?? new PrismaClient({ log: ['error', 'warn'] })

if (process.env.NODE_ENV !== 'production') {
  globalForPrisma.prisma = prisma
}

export function createContext(_params: { req: any }): GraphQLContext {
  return {
    prisma
  }
}


