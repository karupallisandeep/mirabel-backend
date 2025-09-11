const { execSync } = require('child_process');
const fs = require('fs');
const path = require('path');

console.log('🔧 Windows-specific Prisma client generation...');

// Function to retry Prisma generation with delays
async function generatePrismaWithRetry(maxRetries = 3) {
  for (let i = 0; i < maxRetries; i++) {
    try {
      console.log(`📦 Attempt ${i + 1} to generate Prisma client...`);
      
      // Try to remove the .prisma folder first
      const prismaPath = path.join('node_modules', '.prisma');
      if (fs.existsSync(prismaPath)) {
        try {
          fs.rmSync(prismaPath, { recursive: true, force: true });
          console.log('🗑️  Cleared existing Prisma cache');
        } catch (error) {
          console.log('⚠️  Could not clear Prisma cache, continuing...');
        }
      }
      
      // Wait a bit for file locks to release
      await new Promise(resolve => setTimeout(resolve, 1000));
      
      // Try to generate
      execSync('npx prisma generate', { stdio: 'inherit' });
      console.log('✅ Prisma client generated successfully!');
      return true;
    } catch (error) {
      console.log(`❌ Attempt ${i + 1} failed:`, error.message);
      if (i < maxRetries - 1) {
        console.log('⏳ Waiting before retry...');
        await new Promise(resolve => setTimeout(resolve, 2000));
      }
    }
  }
  
  console.log('⚠️  All Prisma generation attempts failed. Deployment will continue with fallback schema.');
  return false;
}

// Run the generation
generatePrismaWithRetry().catch(error => {
  console.error('❌ Prisma generation script failed:', error);
  process.exit(0); // Exit with success to continue deployment
});