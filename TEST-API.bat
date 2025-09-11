@echo off
echo ========================================
echo    API HEALTH CHECK
echo ========================================
echo.
echo Testing your deployed API...
echo.

call node test-api.js

echo.
echo ========================================
echo    TEST COMPLETED
echo ========================================
echo.
echo If you see "OK" responses above, your API is working!
echo If you see errors, try running DEPLOY.bat again.
echo.
pause