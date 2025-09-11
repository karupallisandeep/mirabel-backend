@echo off
echo ========================================
echo    FIX PRISMA ISSUES
echo ========================================
echo.
echo This will fix common Prisma problems on Windows...
echo.
pause

echo [1/3] Stopping Node processes...
taskkill /f /im node.exe 2>nul
timeout /t 3 /nobreak >nul

echo [2/3] Clearing Prisma cache...
if exist "node_modules\.prisma" (
    rmdir /s /q "node_modules\.prisma"
    echo Prisma cache cleared
) else (
    echo No Prisma cache found
)

echo [3/3] Regenerating Prisma client...
call npx prisma generate
if %errorlevel% neq 0 (
    echo ERROR: Still having issues with Prisma
    echo Please contact technical support
    pause
    exit /b 1
)

echo.
echo ========================================
echo    PRISMA ISSUES FIXED!
echo ========================================
echo.
pause