@echo off
rem ---------------------------------------------
rem Batch file to launch Free Fire in MSI App Player 5
rem ---------------------------------------------

rem Navigate to MSI App Player installation directory
cd "C:\Program Files\MSI App Player"

rem Check if MSI App Player is already running
tasklist /FI "IMAGENAME eq HD-Player.exe" | find /I "HD-Player.exe" >nul
if errorlevel 1 (
    echo Starting MSI App Player...
    start "" "HD-Player.exe"
    rem Wait for the emulator to initialize (adjust time if necessary)
    timeout /t 15 /nobreak
) else (
    echo MSI App Player is already running.
)

rem Launch Free Fire using HD-Abd.exe
echo Launching Free Fire...
HD-Abd.exe shell monkey -p com.dts.freefireth -c android.intent.category.LAUNCHER 1

rem Optional: Close Command Prompt after execution
exit
