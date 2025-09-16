const { execSync } = require('child_process');
const fs = require('fs');
const path = require('path');
const { detectSchemaChanges } = require('./detect-schema-changes');
const { generateFromAnalysis } = require('./generate-migration-name');
const { commitMigrationFiles } = require('./git-integration');

/**
 * Main auto-migration function that orchestrates the entire process
 * @returns {Promise<{success: boolean, migrationCreated: boolean, fallbackUsed: boolean, migrationName?: string}>}
 */
async function autoMigrate() {
  console.log('========================================');
  console.log('    AUTO-MIGRATION SYSTEM');
  console.log('========================================');
  console.log('');
  
  try {
    // Step 1: Detect schema changes
    console.log('[AUTO-MIGRATE] Step 1: Detecting schema changes...');
    const schemaChanges = await detectSchemaChanges();
    
    if (!schemaChanges.hasChanges) {
      console.log('[AUTO-MIGRATE] No schema changes detected, applying existing migrations...');
      return await applyExistingMigrations();
    }
    
    // Step 2: Generate migration name
    console.log('[AUTO-MIGRATE] Step 2: Generating migration name...');
    const migrationName = generateFromAnalysis(schemaChanges);
    console.log(`[AUTO-MIGRATE] Generated migration name: ${migrationName}`);
    
    // Step 3: Create migration
    console.log('[AUTO-MIGRATE] Step 3: Creating migration...');
    const migrationResult = await createMigration(migrationName);
    
    if (!migrationResult.success) {
      console.log('[AUTO-MIGRATE] Migration creation failed, attempting fallback...');
      return await fallbackToDbPush();
    }
    
    // Step 4: Commit migration to Git
    console.log('[AUTO-MIGRATE] Step 4: Committing migration to Git...');
    const commitResult = await commitMigrationFiles(
      migrationName,
      migrationResult.migrationPath,
      schemaChanges.description
    );
    
    if (commitResult.committed) {
      console.log('[AUTO-MIGRATE] Migration committed to Git successfully');
    } else {
      console.log(`[AUTO-MIGRATE] Migration not committed: ${commitResult.reason}`);
    }
    
    console.log('');
    console.log('========================================');
    console.log('    AUTO-MIGRATION COMPLETED SUCCESSFULLY!');
    console.log('========================================');
    console.log('');
    console.log(`✅ Migration created: ${migrationName}`);
    console.log(`✅ Schema changes: ${schemaChanges.description}`);
    console.log(`✅ Migration applied to database`);
    if (commitResult.committed) {
      console.log(`✅ Migration committed to Git`);
    }
    console.log('');
    
    return {
      success: true,
      migrationCreated: true,
      fallbackUsed: false,
      migrationName: migrationName,
      description: schemaChanges.description
    };
    
  } catch (error) {
    console.error('[AUTO-MIGRATE] Error in auto-migration process:', error.message);
    console.log('[AUTO-MIGRATE] Attempting fallback to db push...');
    
    return await fallbackToDbPush();
  }
}

/**
 * Creates a migration using prisma migrate dev
 * @param {string} migrationName - Name for the migration
 * @returns {Promise<{success: boolean, migrationPath?: string}>}
 */
async function createMigration(migrationName) {
  try {
    console.log(`[AUTO-MIGRATE] Creating migration: ${migrationName}`);
    
    // Use prisma migrate dev to create the migration
    const command = `npx prisma migrate dev --name "${migrationName}" --skip-generate`;
    
    execSync(command, {
      stdio: 'pipe',
      cwd: process.cwd()
    });
    
    // Find the created migration directory
    const migrationsDir = path.join(process.cwd(), 'prisma', 'migrations');
    const migrationDirs = fs.readdirSync(migrationsDir)
      .filter(dir => dir.includes(migrationName))
      .sort()
      .reverse(); // Get the most recent
    
    if (migrationDirs.length === 0) {
      throw new Error('Migration directory not found after creation');
    }
    
    const migrationPath = path.join(migrationsDir, migrationDirs[0]);
    
    console.log(`[AUTO-MIGRATE] Migration created successfully: ${migrationDirs[0]}`);
    
    return {
      success: true,
      migrationPath: migrationPath
    };
    
  } catch (error) {
    console.error('[AUTO-MIGRATE] Failed to create migration:', error.message);
    return {
      success: false,
      error: error.message
    };
  }
}

/**
 * Applies existing migrations without creating new ones
 * @returns {Promise<{success: boolean, migrationCreated: boolean, fallbackUsed: boolean}>}
 */
async function applyExistingMigrations() {
  try {
    console.log('[AUTO-MIGRATE] Applying existing migrations...');
    
    execSync('npx prisma migrate deploy', {
      stdio: 'inherit',
      cwd: process.cwd()
    });
    
    console.log('[AUTO-MIGRATE] Existing migrations applied successfully');
    
    return {
      success: true,
      migrationCreated: false,
      fallbackUsed: false
    };
    
  } catch (error) {
    console.error('[AUTO-MIGRATE] Failed to apply existing migrations:', error.message);
    console.log('[AUTO-MIGRATE] Attempting fallback to db push...');
    
    return await fallbackToDbPush();
  }
}

/**
 * Fallback mechanism using prisma db push
 * @returns {Promise<{success: boolean, migrationCreated: boolean, fallbackUsed: boolean}>}
 */
async function fallbackToDbPush() {
  try {
    console.log('');
    console.log('⚠️  FALLBACK: Using Prisma DB Push');
    console.log('');
    console.log('[FALLBACK] Applying schema changes directly to database...');
    
    execSync('npx prisma db push', {
      stdio: 'inherit',
      cwd: process.cwd()
    });
    
    console.log('');
    console.log('========================================');
    console.log('    FALLBACK DEPLOYMENT COMPLETED');
    console.log('========================================');
    console.log('');
    console.log('⚠️  Schema changes applied using db push');
    console.log('⚠️  No migration file was created');
    console.log('⚠️  Consider creating a migration manually later');
    console.log('');
    
    return {
      success: true,
      migrationCreated: false,
      fallbackUsed: true
    };
    
  } catch (error) {
    console.error('');
    console.error('❌ FALLBACK FAILED');
    console.error('');
    console.error('[FALLBACK] DB push also failed:', error.message);
    console.error('');
    console.error('Please check:');
    console.error('- Database connection');
    console.error('- Schema syntax');
    console.error('- Database permissions');
    console.error('');
    
    return {
      success: false,
      migrationCreated: false,
      fallbackUsed: true,
      error: error.message
    };
  }
}

/**
 * Generates Prisma client after migration
 */
async function generatePrismaClient() {
  try {
    console.log('[AUTO-MIGRATE] Generating Prisma client...');
    
    execSync('npx prisma generate', {
      stdio: 'pipe',
      cwd: process.cwd()
    });
    
    console.log('[AUTO-MIGRATE] Prisma client generated successfully');
  } catch (error) {
    console.warn('[AUTO-MIGRATE] Warning: Failed to generate Prisma client:', error.message);
    // Don't fail the entire process for client generation issues
  }
}

// Run auto-migrate if this script is executed directly
if (require.main === module) {
  autoMigrate()
    .then(result => {
      if (result.success) {
        process.exit(0);
      } else {
        process.exit(1);
      }
    })
    .catch(error => {
      console.error('Auto-migration failed:', error);
      process.exit(1);
    });
}

module.exports = {
  autoMigrate,
  createMigration,
  applyExistingMigrations,
  fallbackToDbPush,
  generatePrismaClient
};