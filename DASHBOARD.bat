@echo off
title Mirabel Backend Dashboard
color 0A

:menu
cls
echo.
echo ========================================
echo    MIRABEL BACKEND DASHBOARD
echo ========================================
echo.
echo Current API: https://8kihckwkhf.execute-api.us-east-1.amazonaws.com/graphql
echo.
echo 🎯 SIMPLIFIED: Option 1 handles ALL changes automatically!
echo    (Code, database, schema - everything in one click)
echo.
echo 🌐 NEW: You can also deploy via GitHub Actions!
echo    See "🚀 GITHUB ACTIONS DEPLOYMENT GUIDE.md" for details
echo.
echo Choose an option:
echo.
echo [1] 🚀 Deploy Backend (handles everything automatically)
echo [2] 🧪 Test API Health (check if working)
echo [3] 🔧 Fix Issues (if you get errors)
echo [4] 📖 View Help Guide (documentation)
echo [5] ❌ Exit
echo.
echo 💡 TIP: Option 1 automatically handles any database changes!
echo.
set /p choice="Enter your choice (1-5): "

if "%choice%"=="1" goto deploy
if "%choice%"=="2" goto test
if "%choice%"=="3" goto fix
if "%choice%"=="4" goto guide
if "%choice%"=="5" goto exit
goto menu

:deploy
cls
echo Starting deployment...
call DEPLOY.bat
pause
goto menu

:test
cls
echo Testing API...
call TEST-API.bat
pause
goto menu

:fix
cls
echo Fixing Prisma issues...
call FIX-PRISMA.bat
pause
goto menu

:guide
cls
echo Opening help documentation...
start CEO-DEPLOYMENT-GUIDE.md
start SCHEMA-CHANGES-GUIDE.md
start "📱 QUICK START FOR CEO.md"
start "🚀 GITHUB ACTIONS DEPLOYMENT GUIDE.md"
pause
goto menu

:exit
echo.
echo Thank you for using Mirabel Backend Dashboard!
echo.
pause
exit