@echo off

rem Check if HD-Player.exe (BlueStacks) is running
tasklist /fi "imagename eq HD-Player.exe" | find /i "HD-Player.exe" >nul
if errorlevel 1 (
    echo "BlueStacks (HD-Player.exe) is not running. Please start BlueStacks."
    exit
)

rem If BlueStacks is running, check if HD-Adb.exe exists
set "bluestacksDir=%ProgramFiles%\BlueStacks_nxt"
set "adbPath=%bluestacksDir%\HD-Adb.exe"

if not exist "%adbPath%" (
    echo "Reinstall the emulator as HD-Adb.exe is missing."
    exit
)

rem Kill any existing HD-Adb.exe process
echo Killing any existing HD-Adb.exe processes...
for /f "tokens=2" %%a in ('tasklist /fi "imagename eq HD-Adb.exe" /nh') do (
    taskkill /f /pid %%a
)

rem Start the new HD-Adb.exe process
echo Starting HD-Adb.exe...
start "" "%adbPath%" shell monkey -p com.dts.freefireth -c android.intent.category.LAUNCHER 1

rem Wait for a bit to allow the game to launch
timeout /t 10 /nobreak

rem Check if the ADB process started successfully
tasklist /fi "imagename eq HD-Adb.exe" | find /i "HD-Adb.exe" >nul
if errorlevel 1 (
    echo "Failed to start HD-Adb.exe."
    exit
)

rem Now monitor if BlueStacks (HD-Player.exe) is still running
echo Monitoring BlueStacks (HD-Player.exe)...
:monitorBlueStacks
tasklist /fi "imagename eq HD-Player.exe" | find /i "HD-Player.exe" >nul
if errorlevel 1 (
    rem If BlueStacks is closed, kill the last HD-Adb.exe process
    echo BlueStacks is closed. Killing the last HD-Adb.exe process...
    for /f "tokens=2" %%a in ('tasklist /fi "imagename eq HD-Adb.exe" /nh') do (
        taskkill /f /pid %%a
    )
    echo Last HD-Adb.exe process killed.
    exit
)

rem Wait before checking again
timeout /t 5 /nobreak
goto :monitorBlueStacks
