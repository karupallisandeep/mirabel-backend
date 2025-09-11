@echo off
echo ========================================
echo    SYSTEM SETUP CHECKER
echo ========================================
echo.
echo Checking if your system is ready for deployment...
echo.

echo [1/4] Checking Node.js...
node --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Node.js is NOT installed
    echo Please download from: https://nodejs.org/
    goto end
) else (
    echo ✅ Node.js is installed
    node --version
)

echo.
echo [2/4] Checking npm...
npm --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ npm is NOT available
    goto end
) else (
    echo ✅ npm is available
    npm --version
)

echo.
echo [3/4] Checking AWS CLI...
aws --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ⚠️  AWS CLI is NOT installed (optional for basic deployment)
    echo Download from: https://aws.amazon.com/cli/
) else (
    echo ✅ AWS CLI is installed
    aws --version
)

echo.
echo [4/4] Checking project dependencies...
if exist "node_modules" (
    echo ✅ Dependencies are installed
) else (
    echo ⚠️  Dependencies need to be installed
    echo Run DEPLOY.bat to install them automatically
)

echo.
echo ========================================
echo    SETUP CHECK COMPLETED
echo ========================================
echo.
echo If you see ✅ for Node.js and npm, you're ready to deploy!
echo.

:end
pause