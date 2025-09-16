@echo off
echo ========================================
echo    CREATE DATABASE MIGRATION
echo ========================================
echo.
echo This will create a migration file for your schema changes.
echo Use this when you've modified prisma/schema.prisma
echo.
echo What this will do:
echo 1. Create a migration file for your schema changes
echo 2. Apply the migration to your development database
echo 3. Generate new Prisma client
echo.
pause

echo [1/4] Fixing any Prisma issues first...
call FIX-PRISMA.bat
if %errorlevel% neq 0 (
    echo WARNING: Prisma fix had issues, but continuing...
)

echo.
set /p migration_name="Enter migration name (e.g., 'add_user_table'): "

echo.
echo [2/4] Creating migration: %migration_name%
call npx prisma migrate dev --name %migration_name%
if %errorlevel% neq 0 (
    echo ERROR: Failed to create migration
    echo Your schema might have syntax errors or conflicts
    pause
    exit /b 1
)

echo.
echo [3/4] Generating new Prisma client...
call npx prisma generate
if %errorlevel% neq 0 (
    echo ERROR: Failed to generate Prisma client
    pause
    exit /b 1
)

echo.
echo [4/4] Testing the changes...
call node test-api.js

echo.
echo ========================================
echo    MIGRATION CREATED SUCCESSFULLY!
echo ========================================
echo.
echo Migration file created in: prisma/migrations/
echo.
echo NEXT STEPS:
echo 1. Commit the new migration file to Git
echo 2. Push to GitHub (will auto-deploy)
echo 3. Or run DEPLOY.bat to deploy manually
echo.
pause