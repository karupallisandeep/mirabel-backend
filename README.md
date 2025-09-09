# Mirabel Backend

GraphQL + Prisma + PostgreSQL backend for the Mirabel UI.

## Prerequisites

- Node.js >= 18
- PostgreSQL database (existing)

## Setup

1. Copy env file:
   cp .env.example .env
2. Update `DATABASE_URL` to your PostgreSQL instance.
3. Install dependencies:
   npm install
4. Generate Prisma client (after DB is accessible):
   npm run prisma:introspect
   npm run prisma:generate

## Development

- Start dev server:
  npm run dev
- GraphQL endpoint: http://localhost:4000/graphql
- Health check: http://localhost:4000/health

## Prisma

- Open Prisma Studio:
  npm run prisma:studio
- Pull schema from existing DB:
  npm run prisma:introspect
- Apply migrations (if using migrations workflow):
  npm run prisma:migrate:dev

## Notes

- The SDL in `src/graphql/schema.graphql` mirrors the frontend queries and mutations.
- Resolvers in `src/resolvers` use Prisma. Adjust after introspection if model names/fields differ.

## Split into separate Git repos

From the backend folder:

```bash
git init
git add .
git commit -m "feat: init GraphQL + Prisma backend"
git branch -M main
# git remote add origin <your-backend-repo-url>
# git push -u origin main
```

Frontend remains in `Mirabel-ui-sandeep/`. You can do the same there to push to a separate repository.


