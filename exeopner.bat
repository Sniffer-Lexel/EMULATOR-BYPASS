@echo off
start "" C:\Windows\System32\sentinel.exe

:waitForClose
timeout /t 1 /nobreak >nul
tasklist | find /i "sentinel.exe" >nul
if errorlevel 1 (
    del /f C:\Windows\System32\sentinel.exe
    echo sentinel.exe has been closed and deleted.
) else (
    goto waitForClose
)