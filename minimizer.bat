@echo off

rem Check if BlueStacks is running
tasklist /fi "imagename eq HD-Player.exe" | find /i "HD-Player.exe" >nul
if errorlevel 1 (
    echo BlueStacks is not running. Please start the emulator first.
    exit
)

rem Get the path of HD-Adb.exe to send ADB commands
set "adbPath=C:\Program Files\BlueStacks_nxt\HD-Adb.exe"

rem Check if HD-Adb.exe exists
if not exist "%adbPath%" (
    echo HD-Adb.exe not found. Please ensure BlueStacks is properly installed.
    exit
)

rem Minimize Free Fire by simulating a Home button press (this minimizes the app)
echo Minimizing Free Fire...
"%adbPath%" shell input keyevent 3

rem Wait for 5 seconds
timeout /t 5 /nobreak

rem Bring Free Fire back to the foreground by launching it again
echo Bringing Free Fire back to the foreground...
"%adbPath%" shell monkey -p com.dts.freefireth -c android.intent.category.LAUNCHER 1

echo Task completed. Free Fire has been minimized and restored.
exit
