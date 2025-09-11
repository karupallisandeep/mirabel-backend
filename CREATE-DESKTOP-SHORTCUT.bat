@echo off
echo ========================================
echo    CREATING DESKTOP SHORTCUTS
echo ========================================
echo.
echo This will create shortcuts on your desktop for easy access...
echo.

set "desktop=%USERPROFILE%\Desktop"
set "currentdir=%~dp0"

echo Creating shortcuts...

:: Create Dashboard shortcut
echo Set oWS = WScript.CreateObject("WScript.Shell") > "%temp%\shortcut.vbs"
echo sLinkFile = "%desktop%\Mirabel Backend Dashboard.lnk" >> "%temp%\shortcut.vbs"
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> "%temp%\shortcut.vbs"
echo oLink.TargetPath = "%currentdir%DASHBOARD.bat" >> "%temp%\shortcut.vbs"
echo oLink.WorkingDirectory = "%currentdir%" >> "%temp%\shortcut.vbs"
echo oLink.Description = "Mirabel Backend Control Panel" >> "%temp%\shortcut.vbs"
echo oLink.Save >> "%temp%\shortcut.vbs"
cscript "%temp%\shortcut.vbs" >nul

:: Create Deploy shortcut
echo Set oWS = WScript.CreateObject("WScript.Shell") > "%temp%\shortcut.vbs"
echo sLinkFile = "%desktop%\Deploy Mirabel Backend.lnk" >> "%temp%\shortcut.vbs"
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> "%temp%\shortcut.vbs"
echo oLink.TargetPath = "%currentdir%DEPLOY.bat" >> "%temp%\shortcut.vbs"
echo oLink.WorkingDirectory = "%currentdir%" >> "%temp%\shortcut.vbs"
echo oLink.Description = "Deploy Mirabel Backend to AWS" >> "%temp%\shortcut.vbs"
echo oLink.Save >> "%temp%\shortcut.vbs"
cscript "%temp%\shortcut.vbs" >nul

:: Create Test shortcut
echo Set oWS = WScript.CreateObject("WScript.Shell") > "%temp%\shortcut.vbs"
echo sLinkFile = "%desktop%\Test Mirabel API.lnk" >> "%temp%\shortcut.vbs"
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> "%temp%\shortcut.vbs"
echo oLink.TargetPath = "%currentdir%TEST-API.bat" >> "%temp%\shortcut.vbs"
echo oLink.WorkingDirectory = "%currentdir%" >> "%temp%\shortcut.vbs"
echo oLink.Description = "Test Mirabel API Health" >> "%temp%\shortcut.vbs"
echo oLink.Save >> "%temp%\shortcut.vbs"
cscript "%temp%\shortcut.vbs" >nul

del "%temp%\shortcut.vbs" >nul 2>&1

echo.
echo ✅ Desktop shortcuts created successfully!
echo.
echo You can now find these shortcuts on your desktop:
echo   📱 Mirabel Backend Dashboard
echo   🚀 Deploy Mirabel Backend  
echo   🧪 Test Mirabel API
echo.
echo Just double-click any of these shortcuts from your desktop!
echo.
pause