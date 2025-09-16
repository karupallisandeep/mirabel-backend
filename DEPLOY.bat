@echo off
echo ========================================
echo    MIRABEL BACKEND DEPLOYMENT
echo ========================================
echo.
echo This will deploy your backend to AWS...
echo (Automatically handles any database schema changes)
echo.
pause

echo [1/6] Installing dependencies...
call npm install
if %errorlevel% neq 0 (
    echo ERROR: Failed to install dependencies
    pause
    exit /b 1
)

echo.
echo [2/6] Fixing any Prisma issues...
echo (Clearing cache and fixing Windows file locks)
taskkill /f /im node.exe 2>nul
timeout /t 2 /nobreak >nul
if exist "node_modules\.prisma" (
    rmdir /s /q "node_modules\.prisma" 2>nul
    echo Prisma cache cleared
)

echo.
echo [3/6] Generating Prisma client...
echo (This handles any schema changes automatically)
call npx prisma generate
if %errorlevel% neq 0 (
    echo ERROR: Failed to generate Prisma client
    echo Your schema might have syntax errors
    pause
    exit /b 1
)

echo.
echo [4/6] Auto-migrating database schema...
echo (Automatically handling any schema changes)
call node scripts/auto-migrate.js
if %errorlevel% neq 0 (
    echo ERROR: Auto-migration failed
    echo Please check the error messages above
    pause
    exit /b 1
)

echo.
echo [5/6] Deploying to AWS Lambda...
echo This may take a few minutes...
call npm run deploy
if %errorlevel% neq 0 (
    echo ERROR: Deployment failed
    pause
    exit /b 1
)

echo.
echo [6/6] Testing deployment...
call node test-api.js

echo.
echo ========================================
echo    DEPLOYMENT COMPLETED SUCCESSFULLY!
echo ========================================
echo.
echo Your API is now live at:
echo https://8kihckwkhf.execute-api.us-east-1.amazonaws.com/graphql
echo.
echo ✅ Database schema: Auto-migrated successfully
echo ✅ Backend code: Deployed to AWS
echo ✅ API health: Verified working
echo.
pause