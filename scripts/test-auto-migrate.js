const { detectSchemaChanges } = require('./detect-schema-changes');
const { generateFromAnalysis } = require('./generate-migration-name');

/**
 * Simple test script to verify auto-migration components work
 */
async function testAutoMigration() {
  console.log('Testing Auto-Migration System Components...');
  console.log('');
  
  try {
    // Test 1: Schema change detection
    console.log('Test 1: Schema Change Detection');
    const schemaChanges = await detectSchemaChanges();
    console.log('✅ Schema detection completed');
    console.log(`   Has changes: ${schemaChanges.hasChanges}`);
    console.log(`   Change type: ${schemaChanges.changeType}`);
    console.log(`   Description: ${schemaChanges.description}`);
    console.log('');
    
    // Test 2: Migration name generation
    console.log('Test 2: Migration Name Generation');
    const migrationName = generateFromAnalysis(schemaChanges);
    console.log('✅ Migration name generated');
    console.log(`   Migration name: ${migrationName}`);
    console.log('');
    
    // Test 3: Test various naming scenarios
    console.log('Test 3: Migration Naming Scenarios');
    const testScenarios = [
      { changeType: 'add_table', tableName: 'User', description: 'Added User table' },
      { changeType: 'add_column', tableName: 'Product', columnName: 'price', description: 'Added price column' },
      { changeType: 'modify_column', tableName: 'User', columnName: 'email', description: 'Modified email column' },
      { changeType: 'complex', description: 'Multiple changes' }
    ];
    
    testScenarios.forEach((scenario, index) => {
      const name = generateFromAnalysis(scenario);
      console.log(`   Scenario ${index + 1}: ${scenario.changeType} → ${name}`);
    });
    
    console.log('');
    console.log('✅ All tests completed successfully!');
    console.log('Auto-migration system is ready to use.');
    
  } catch (error) {
    console.error('❌ Test failed:', error.message);
    process.exit(1);
  }
}

// Run tests if this script is executed directly
if (require.main === module) {
  testAutoMigration();
}

module.exports = { testAutoMigration };