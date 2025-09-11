const { execSync } = require('child_process');
const fs = require('fs');
const path = require('path');

console.log('🚀 Starting deployment process...');

try {
  // Clean dist folder
  if (fs.existsSync('dist')) {
    fs.rmSync('dist', { recursive: true, force: true });
  }

  // Create dist directory
  fs.mkdirSync('dist', { recursive: true });

  console.log('📦 Generating Prisma client...');
  try {
    // Use Windows-specific script for better error handling
    execSync('node prisma-generate-windows.js', { stdio: 'inherit' });
  } catch (error) {
    console.log('⚠️  Prisma generate failed locally, will generate in Lambda...');
  }

  console.log('📦 Ensuring Prisma client will be available in Lambda...');
  // Create a simple script that will run prisma generate in Lambda if needed
  const lambdaPrismaScript = `
const { execSync } = require('child_process');
const fs = require('fs');
const path = require('path');

// Check if Prisma client exists, if not generate it
const prismaClientPath = path.join(__dirname, 'node_modules', '.prisma', 'client');
if (!fs.existsSync(prismaClientPath)) {
  console.log('🔧 Generating Prisma client in Lambda environment...');
  try {
    execSync('npx prisma generate', { stdio: 'inherit' });
    console.log('✅ Prisma client generated successfully in Lambda');
  } catch (error) {
    console.error('❌ Failed to generate Prisma client in Lambda:', error.message);
  }
}
`;
  
  fs.writeFileSync('lambda-prisma-setup.js', lambdaPrismaScript);

  console.log('🔨 Building TypeScript...');
  execSync('npx tsc', { stdio: 'inherit' });

  console.log('📋 Copying GraphQL schema...');
  // Copy GraphQL schema to dist
  const srcSchema = path.join('src', 'graphql', 'schema.graphql');
  const distGraphql = path.join('dist', 'graphql');
  const distSchema = path.join(distGraphql, 'schema.graphql');
  
  if (!fs.existsSync(distGraphql)) {
    fs.mkdirSync(distGraphql, { recursive: true });
  }
  
  if (fs.existsSync(srcSchema)) {
    fs.copyFileSync(srcSchema, distSchema);
  }

  console.log('🚀 Deploying to AWS Lambda...');
  execSync('npx serverless deploy', { stdio: 'inherit' });

  console.log('✅ Deployment completed successfully!');
} catch (error) {
  console.error('❌ Deployment failed:', error.message);
  process.exit(1);
}