const { execSync } = require('child_process');
const fs = require('fs');
const path = require('path');

/**
 * Detects schema changes by comparing current schema with database state
 * @returns {Promise<{hasChanges: boolean, changeType: string, description: string, sqlPreview: string}>}
 */
async function detectSchemaChanges() {
  try {
    console.log('[SCHEMA-DETECT] Checking for schema changes...');
    
    // First validate the schema syntax
    await validateSchema();
    
    // Check if there are any pending migrations by comparing schema with database
    const diffResult = await getSchemaDatabase();
    
    if (!diffResult.hasChanges) {
      console.log('[SCHEMA-DETECT] No schema changes detected');
      return {
        hasChanges: false,
        changeType: 'none',
        description: 'No changes detected',
        sqlPreview: ''
      };
    }
    
    // Analyze the diff to determine change type
    const analysis = analyzeSchemaDiff(diffResult.diff);
    
    console.log(`[SCHEMA-DETECT] Schema changes detected: ${analysis.changeType}`);
    console.log(`[SCHEMA-DETECT] Description: ${analysis.description}`);
    
    return {
      hasChanges: true,
      changeType: analysis.changeType,
      description: analysis.description,
      sqlPreview: diffResult.diff
    };
    
  } catch (error) {
    console.error('[SCHEMA-DETECT] Error detecting schema changes:', error.message);
    throw new Error(`Schema change detection failed: ${error.message}`);
  }
}

/**
 * Validates the Prisma schema syntax
 */
async function validateSchema() {
  try {
    console.log('[SCHEMA-DETECT] Validating schema syntax...');
    execSync('npx prisma validate', { 
      stdio: 'pipe',
      cwd: process.cwd()
    });
    console.log('[SCHEMA-DETECT] Schema validation passed');
  } catch (error) {
    const errorOutput = error.stdout ? error.stdout.toString() : error.message;
    throw new Error(`Schema validation failed: ${errorOutput}`);
  }
}

/**
 * Gets the diff between schema and database using prisma migrate diff
 */
async function getSchemaDatabase() {
  try {
    console.log('[SCHEMA-DETECT] Comparing schema with database...');
    
    // Use prisma migrate diff to compare schema with database
    const diffOutput = execSync('npx prisma migrate diff --from-schema-datamodel prisma/schema.prisma --to-schema-datasource prisma/schema.prisma', {
      stdio: 'pipe',
      cwd: process.cwd(),
      encoding: 'utf8'
    });
    
    // If diff is empty or only contains comments, no changes
    const cleanDiff = diffOutput.replace(/^--.*$/gm, '').trim();
    
    if (!cleanDiff || cleanDiff.length === 0) {
      return { hasChanges: false, diff: '' };
    }
    
    return { hasChanges: true, diff: diffOutput };
    
  } catch (error) {
    // If migrate diff fails, it might mean there are changes that need migration
    // or there's a connection issue
    if (error.message.includes('database')) {
      throw new Error(`Database connection failed: ${error.message}`);
    }
    
    // For other errors, assume there might be changes
    console.log('[SCHEMA-DETECT] Migrate diff failed, assuming changes exist');
    return { hasChanges: true, diff: 'Unable to determine exact changes' };
  }
}

/**
 * Analyzes the schema diff to determine the type of changes
 * @param {string} diff - The SQL diff output
 */
function analyzeSchemaDiff(diff) {
  const lowerDiff = diff.toLowerCase();
  
  // Detect table operations
  if (lowerDiff.includes('create table')) {
    const tableMatch = diff.match(/create table ["`]?(\w+)["`]?/i);
    const tableName = tableMatch ? tableMatch[1] : 'unknown';
    return {
      changeType: 'add_table',
      tableName: tableName,
      description: `Added new table: ${tableName}`
    };
  }
  
  if (lowerDiff.includes('drop table')) {
    const tableMatch = diff.match(/drop table ["`]?(\w+)["`]?/i);
    const tableName = tableMatch ? tableMatch[1] : 'unknown';
    return {
      changeType: 'remove_table',
      tableName: tableName,
      description: `Removed table: ${tableName}`
    };
  }
  
  // Detect column operations
  if (lowerDiff.includes('add column')) {
    const columnMatch = diff.match(/add column ["`]?(\w+)["`]?/i);
    const tableMatch = diff.match(/alter table ["`]?(\w+)["`]?/i);
    const columnName = columnMatch ? columnMatch[1] : 'unknown';
    const tableName = tableMatch ? tableMatch[1] : 'unknown';
    return {
      changeType: 'add_column',
      tableName: tableName,
      columnName: columnName,
      description: `Added column ${columnName} to table ${tableName}`
    };
  }
  
  if (lowerDiff.includes('drop column')) {
    const columnMatch = diff.match(/drop column ["`]?(\w+)["`]?/i);
    const tableMatch = diff.match(/alter table ["`]?(\w+)["`]?/i);
    const columnName = columnMatch ? columnMatch[1] : 'unknown';
    const tableName = tableMatch ? tableMatch[1] : 'unknown';
    return {
      changeType: 'remove_column',
      tableName: tableName,
      columnName: columnName,
      description: `Removed column ${columnName} from table ${tableName}`
    };
  }
  
  if (lowerDiff.includes('alter column')) {
    const columnMatch = diff.match(/alter column ["`]?(\w+)["`]?/i);
    const tableMatch = diff.match(/alter table ["`]?(\w+)["`]?/i);
    const columnName = columnMatch ? columnMatch[1] : 'unknown';
    const tableName = tableMatch ? tableMatch[1] : 'unknown';
    return {
      changeType: 'modify_column',
      tableName: tableName,
      columnName: columnName,
      description: `Modified column ${columnName} in table ${tableName}`
    };
  }
  
  // Detect index operations
  if (lowerDiff.includes('create index') || lowerDiff.includes('create unique index')) {
    return {
      changeType: 'add_index',
      description: 'Added database index'
    };
  }
  
  if (lowerDiff.includes('drop index')) {
    return {
      changeType: 'remove_index',
      description: 'Removed database index'
    };
  }
  
  // Complex changes (multiple operations or unrecognized patterns)
  return {
    changeType: 'complex',
    description: 'Multiple or complex schema changes detected'
  };
}

/**
 * Checks if migrations directory exists and has pending migrations
 */
function hasPendingMigrations() {
  const migrationsDir = path.join(process.cwd(), 'prisma', 'migrations');
  
  if (!fs.existsSync(migrationsDir)) {
    return false;
  }
  
  try {
    // Check migration status
    const statusOutput = execSync('npx prisma migrate status', {
      stdio: 'pipe',
      encoding: 'utf8'
    });
    
    return statusOutput.includes('pending') || statusOutput.includes('not applied');
  } catch (error) {
    // If status check fails, assume no pending migrations
    return false;
  }
}

module.exports = {
  detectSchemaChanges,
  validateSchema,
  analyzeSchemaDiff,
  hasPendingMigrations
};