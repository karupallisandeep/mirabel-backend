const { execSync } = require('child_process');
const fs = require('fs');
const path = require('path');

/**
 * Configures Git for automated commits
 */
function configureGit() {
  try {
    console.log('[GIT] Configuring Git for automated commits...');
    
    // Set Git user for automated commits
    execSync('git config user.name "Auto Migration System"', { stdio: 'pipe' });
    execSync('git config user.email "auto-migration@system.local"', { stdio: 'pipe' });
    
    console.log('[GIT] Git configuration completed');
  } catch (error) {
    console.warn('[GIT] Warning: Could not configure Git user:', error.message);
    // Don't throw error - this might be handled by CI/CD system
  }
}

/**
 * Checks if we're in a Git repository
 * @returns {boolean} - True if in a Git repository
 */
function isGitRepository() {
  try {
    execSync('git rev-parse --git-dir', { stdio: 'pipe' });
    return true;
  } catch (error) {
    return false;
  }
}

/**
 * Checks if there are uncommitted changes in the migrations directory
 * @returns {boolean} - True if there are uncommitted migration files
 */
function hasUncommittedMigrations() {
  try {
    const status = execSync('git status --porcelain prisma/migrations/', { 
      stdio: 'pipe', 
      encoding: 'utf8' 
    });
    
    return status.trim().length > 0;
  } catch (error) {
    console.warn('[GIT] Could not check Git status:', error.message);
    return false;
  }
}

/**
 * Stages migration files for commit
 * @param {string} migrationPath - Path to the migration directory
 */
function stageMigrationFiles(migrationPath) {
  try {
    console.log(`[GIT] Staging migration files: ${migrationPath}`);
    
    // Stage the specific migration directory
    execSync(`git add "${migrationPath}"`, { stdio: 'pipe' });
    
    // Also stage the migration lock file if it changed
    const lockFile = 'prisma/migrations/migration_lock.toml';
    if (fs.existsSync(lockFile)) {
      execSync(`git add "${lockFile}"`, { stdio: 'pipe' });
    }
    
    console.log('[GIT] Migration files staged successfully');
  } catch (error) {
    throw new Error(`Failed to stage migration files: ${error.message}`);
  }
}

/**
 * Commits migration files with a descriptive message
 * @param {string} migrationName - Name of the migration
 * @param {string} description - Description of the changes
 */
function commitMigration(migrationName, description) {
  try {
    console.log(`[GIT] Committing migration: ${migrationName}`);
    
    const commitMessage = generateCommitMessage(migrationName, description);
    
    execSync(`git commit -m "${commitMessage}"`, { stdio: 'pipe' });
    
    console.log('[GIT] Migration committed successfully');
    console.log(`[GIT] Commit message: ${commitMessage}`);
  } catch (error) {
    throw new Error(`Failed to commit migration: ${error.message}`);
  }
}

/**
 * Generates a descriptive commit message for the migration
 * @param {string} migrationName - Name of the migration
 * @param {string} description - Description of the changes
 * @returns {string} - Generated commit message
 */
function generateCommitMessage(migrationName, description) {
  const baseMessage = `Add migration: ${migrationName}`;
  
  if (description && description !== 'No changes detected') {
    return `${baseMessage}\n\n${description}`;
  }
  
  return baseMessage;
}

/**
 * Commits migration files automatically
 * @param {string} migrationName - Name of the migration
 * @param {string} migrationPath - Path to the migration directory
 * @param {string} description - Description of the changes
 */
async function commitMigrationFiles(migrationName, migrationPath, description) {
  try {
    if (!isGitRepository()) {
      console.log('[GIT] Not in a Git repository, skipping commit');
      return { committed: false, reason: 'Not a Git repository' };
    }
    
    configureGit();
    
    // Check if migration files exist
    if (!fs.existsSync(migrationPath)) {
      throw new Error(`Migration path does not exist: ${migrationPath}`);
    }
    
    // Stage migration files
    stageMigrationFiles(migrationPath);
    
    // Check if there's anything to commit
    const status = execSync('git status --porcelain --cached', { 
      stdio: 'pipe', 
      encoding: 'utf8' 
    });
    
    if (!status.trim()) {
      console.log('[GIT] No changes to commit');
      return { committed: false, reason: 'No changes to commit' };
    }
    
    // Commit the changes
    commitMigration(migrationName, description);
    
    return { committed: true, reason: 'Migration committed successfully' };
    
  } catch (error) {
    console.error('[GIT] Error committing migration:', error.message);
    return { committed: false, reason: error.message };
  }
}

/**
 * Pushes committed changes to remote repository (if configured)
 */
function pushToRemote() {
  try {
    console.log('[GIT] Attempting to push to remote...');
    
    // Check if there's a remote configured
    const remotes = execSync('git remote', { stdio: 'pipe', encoding: 'utf8' });
    if (!remotes.trim()) {
      console.log('[GIT] No remote repository configured, skipping push');
      return { pushed: false, reason: 'No remote configured' };
    }
    
    // Try to push
    execSync('git push', { stdio: 'pipe' });
    
    console.log('[GIT] Successfully pushed to remote');
    return { pushed: true, reason: 'Pushed successfully' };
    
  } catch (error) {
    console.warn('[GIT] Could not push to remote:', error.message);
    return { pushed: false, reason: error.message };
  }
}

/**
 * Gets the current Git branch name
 * @returns {string} - Current branch name
 */
function getCurrentBranch() {
  try {
    const branch = execSync('git rev-parse --abbrev-ref HEAD', { 
      stdio: 'pipe', 
      encoding: 'utf8' 
    }).trim();
    
    return branch;
  } catch (error) {
    return 'unknown';
  }
}

/**
 * Gets the latest commit hash
 * @returns {string} - Latest commit hash
 */
function getLatestCommit() {
  try {
    const commit = execSync('git rev-parse HEAD', { 
      stdio: 'pipe', 
      encoding: 'utf8' 
    }).trim();
    
    return commit.substring(0, 8); // Short hash
  } catch (error) {
    return 'unknown';
  }
}

module.exports = {
  configureGit,
  isGitRepository,
  hasUncommittedMigrations,
  stageMigrationFiles,
  commitMigration,
  commitMigrationFiles,
  pushToRemote,
  getCurrentBranch,
  getLatestCommit,
  generateCommitMessage
};