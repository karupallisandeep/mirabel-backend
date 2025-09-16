/**
 * Generates descriptive migration names based on schema changes
 * @param {string} changeType - Type of change (add_table, add_column, etc.)
 * @param {Object} changeInfo - Additional information about the change
 * @returns {string} - Generated migration name
 */
function generateMigrationName(changeType, changeInfo = {}) {
  const timestamp = new Date().toISOString().replace(/[-:T]/g, '').split('.')[0];
  
  switch (changeType) {
    case 'add_table':
      if (changeInfo.tableName) {
        return `add_${sanitizeTableName(changeInfo.tableName)}_table`;
      }
      return 'add_new_table';
      
    case 'remove_table':
      if (changeInfo.tableName) {
        return `remove_${sanitizeTableName(changeInfo.tableName)}_table`;
      }
      return 'remove_table';
      
    case 'add_column':
      if (changeInfo.tableName && changeInfo.columnName) {
        return `add_${sanitizeColumnName(changeInfo.columnName)}_to_${sanitizeTableName(changeInfo.tableName)}`;
      }
      return 'add_column';
      
    case 'remove_column':
      if (changeInfo.tableName && changeInfo.columnName) {
        return `remove_${sanitizeColumnName(changeInfo.columnName)}_from_${sanitizeTableName(changeInfo.tableName)}`;
      }
      return 'remove_column';
      
    case 'modify_column':
      if (changeInfo.tableName && changeInfo.columnName) {
        return `modify_${sanitizeTableName(changeInfo.tableName)}_${sanitizeColumnName(changeInfo.columnName)}`;
      }
      return 'modify_column';
      
    case 'add_index':
      if (changeInfo.tableName) {
        return `add_index_to_${sanitizeTableName(changeInfo.tableName)}`;
      }
      return 'add_index';
      
    case 'remove_index':
      if (changeInfo.tableName) {
        return `remove_index_from_${sanitizeTableName(changeInfo.tableName)}`;
      }
      return 'remove_index';
      
    case 'complex':
    case 'multiple':
      return `auto_schema_update_${timestamp}`;
      
    default:
      return `auto_migration_${timestamp}`;
  }
}

/**
 * Sanitizes table names for use in migration names
 * @param {string} tableName - Raw table name
 * @returns {string} - Sanitized table name
 */
function sanitizeTableName(tableName) {
  if (!tableName) return 'table';
  
  return tableName
    .toLowerCase()
    .replace(/[^a-z0-9]/g, '_')  // Replace non-alphanumeric with underscore
    .replace(/_+/g, '_')         // Replace multiple underscores with single
    .replace(/^_|_$/g, '');      // Remove leading/trailing underscores
}

/**
 * Sanitizes column names for use in migration names
 * @param {string} columnName - Raw column name
 * @returns {string} - Sanitized column name
 */
function sanitizeColumnName(columnName) {
  if (!columnName) return 'column';
  
  return columnName
    .toLowerCase()
    .replace(/[^a-z0-9]/g, '_')  // Replace non-alphanumeric with underscore
    .replace(/_+/g, '_')         // Replace multiple underscores with single
    .replace(/^_|_$/g, '');      // Remove leading/trailing underscores
}

/**
 * Generates a migration name from schema change analysis
 * @param {Object} schemaAnalysis - Result from analyzeSchemaDiff
 * @returns {string} - Generated migration name
 */
function generateFromAnalysis(schemaAnalysis) {
  return generateMigrationName(schemaAnalysis.changeType, {
    tableName: schemaAnalysis.tableName,
    columnName: schemaAnalysis.columnName,
    description: schemaAnalysis.description
  });
}

/**
 * Validates that a migration name is acceptable
 * @param {string} migrationName - The proposed migration name
 * @returns {boolean} - Whether the name is valid
 */
function validateMigrationName(migrationName) {
  if (!migrationName || typeof migrationName !== 'string') {
    return false;
  }
  
  // Check length (Prisma has limits)
  if (migrationName.length > 100) {
    return false;
  }
  
  // Check for valid characters (alphanumeric and underscores only)
  if (!/^[a-z0-9_]+$/.test(migrationName)) {
    return false;
  }
  
  // Check that it doesn't start or end with underscore
  if (migrationName.startsWith('_') || migrationName.endsWith('_')) {
    return false;
  }
  
  return true;
}

/**
 * Creates a fallback migration name when automatic generation fails
 * @returns {string} - Fallback migration name with timestamp
 */
function createFallbackName() {
  const timestamp = new Date().toISOString().replace(/[-:T]/g, '').split('.')[0];
  return `auto_migration_${timestamp}`;
}

module.exports = {
  generateMigrationName,
  generateFromAnalysis,
  sanitizeTableName,
  sanitizeColumnName,
  validateMigrationName,
  createFallbackName
};