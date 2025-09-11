@echo off
echo ========================================
echo    DATABASE SCHEMA UPDATE
echo ========================================
echo.
echo This will update your database schema after you've made changes
echo to the prisma/schema.prisma file.
echo.
echo WARNING: This may affect your existing data!
echo Make sure you have a database backup before proceeding.
echo.
echo What this will do:
echo 1. Generate new Prisma client (based on your schema changes)
echo 2. Push schema changes to the database
echo 3. Deploy updated backend to AWS
echo.
pause

echo [1/4] Fixing any Prisma issues first...
call FIX-PRISMA.bat
if %errorlevel% neq 0 (
    echo WARNING: Prisma fix had issues, but continuing...
)

echo.
echo [2/4] Generating new Prisma client...
call npx prisma generate
if %errorlevel% neq 0 (
    echo ERROR: Failed to generate Prisma client
    echo Your schema might have syntax errors
    pause
    exit /b 1
)

echo.
echo [3/4] Pushing schema changes to database...
call npx prisma db push
if %errorlevel% neq 0 (
    echo ERROR: Failed to update database schema
    echo Check your schema for conflicts with existing data
    pause
    exit /b 1
)

echo.
echo [4/4] Deploying updated backend to AWS...
call npm run deploy
if %errorlevel% neq 0 (
    echo ERROR: Failed to deploy updated backend
    pause
    exit /b 1
)

echo.
echo ========================================
echo    SCHEMA UPDATE COMPLETED SUCCESSFULLY!
echo ========================================
echo.
echo Your database schema has been updated and deployed!
echo.
echo Testing the updated API...
call node test-api.js

echo.
echo Schema update process completed!
pause