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
echo Choose an option:
echo.
echo [1] Deploy Backend to AWS (normal deployment)
echo [2] Test API Health (check if working)
echo [3] Fix Prisma Issues (if you get errors)
echo [4] Update Database Schema (after schema changes)
echo [5] View Deployment Guide (help documentation)
echo [6] Schema Changes Help (database changes guide)
echo [7] Exit
echo.
echo NOTE: If you changed prisma/schema.prisma, use option 4!
echo.
set /p choice="Enter your choice (1-6): "

if "%choice%"=="1" goto deploy
if "%choice%"=="2" goto test
if "%choice%"=="3" goto fix
if "%choice%"=="4" goto update
if "%choice%"=="5" goto guide
if "%choice%"=="6" goto schemahelp
if "%choice%"=="7" goto exit
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

:update
cls
echo Updating database...
call UPDATE-DATABASE.bat
pause
goto menu

:guide
cls
echo Opening deployment guide...
start CEO-DEPLOYMENT-GUIDE.md
pause
goto menu

:schemahelp
cls
echo Opening schema changes guide...
start SCHEMA-CHANGES-GUIDE.md
pause
goto menu

:exit
echo.
echo Thank you for using Mirabel Backend Dashboard!
echo.
pause
exit