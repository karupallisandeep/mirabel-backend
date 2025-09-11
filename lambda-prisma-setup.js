
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
