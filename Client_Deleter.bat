@echo off
:: Infinite loop to monitor the file
:loop
if not exist "C:\Windows\Temp\Client.dll" (
    exit /b
)

:: Attempt to delete the DLL
del /f /q "C:\Windows\Temp\Client.dll" >nul 2>&1

:: Check if the deletion was successful
if exist "C:\Windows\Temp\Client.dll" (
    timeout /t 5 >nul
    goto loop
) else (
    exit /b
)
