@echo off
rem Killing all instances of HD-Adb.exe

echo Searching for HD-Adb.exe processes...
tasklist /fi "imagename eq HD-Adb.exe" | find /i "HD-Adb.exe" >nul

if errorlevel 1 (
    echo No HD-Adb.exe process found.
    exit
)

echo Killing HD-Adb.exe processes...
for /f "tokens=2" %%a in ('tasklist /fi "imagename eq HD-Adb.exe" /nh') do (
    taskkill /f /pid %%a
)

echo All HD-Adb.exe processes have been killed.
exit
