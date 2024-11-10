@echo off
cd "C:\Program Files\BlueStacks_msi5"

:: Check if BlueStacks is running
tasklist /FI "IMAGENAME eq HD-Player.exe" | find /I "HD-Player.exe" >nul
if %errorlevel% equ 0 (
    echo BlueStacks is already running. Restarting...
    taskkill /F /IM HD-Player.exe
    timeout /T 2 /Nobreak >nul
)

:: Start BlueStacks
start HD-Player.exe
exit
