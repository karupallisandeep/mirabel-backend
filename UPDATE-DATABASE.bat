@echo off
echo ========================================
echo    DATABASE SCHEMA UPDATE
echo ========================================
echo.
echo This will create and deploy database migrations after you've made changes
echo to the prisma/schema.prisma file.
echo.
echo WARNING: This may affect your existing data!
echo Make sure you have a database backup before proceeding.
echo.
echo What this will do:
echo 1. Create a new migration file (if schema changed)
echo 2. Generate new Prisma client (based on your schema changes)
echo 3. Deploy migrations to the database
echo 4. Deploy updated backend to AWS
echo.
pause

echo [1/5] Fixing any Prisma issues first...
call FIX-PRISMA.bat
if %errorlevel% neq 0 (
    echo WARNING: Prisma fix had issues, but continuing...
)

echo.
echo [2/5] Creating migration for schema changes...
set /p migration_name="Enter migration name (e.g., 'add_user_table'): "
call npx prisma migrate dev --name %migration_name%
if %errorlevel% neq 0 (
    echo ERROR: Failed to create migration
    echo Your schema might have syntax errors or conflicts
    pause
    exit /b 1
)

echo.
echo [3/5] Generating new Prisma client...
call npx prisma generate
if %errorlevel% neq 0 (
    echo ERROR: Failed to generate Prisma client
    pause
    exit /b 1
)

echo.
echo [4/5] Deploying migrations to production database...
call npx prisma migrate deploy
if %errorlevel% neq 0 (
    echo ERROR: Failed to deploy migrations to production
    echo Check your database connection and migration conflicts
    pause
    exit /b 1
)

echo.
echo [5/5] Deploying updated backend to AWS...
call npm run deploy
if %errorlevel% neq 0 (
    echo ERROR: Failed to deploy updated backend
    pause
    exit /b 1
)

echo.
echo ========================================
echo    MIGRATION COMPLETED SUCCESSFULLY!
echo ========================================
echo.
echo Your database migration has been created and deployed!
echo Migration files are saved in: prisma/migrations/
echo.
echo Testing the updated API...
call node test-api.js

echo.
echo Schema update process completed!
pause