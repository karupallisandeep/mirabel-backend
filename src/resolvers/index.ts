// Swap to publications-backed resolvers per user's DB schema
import productResolvers from './productResolversPublications'

export const resolvers = {
  ...productResolvers
}


