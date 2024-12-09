@echo off
rem Navigate to the directory where HD-Adb.exe is located
cd "C:\Program Files\MSI App Player"

rem Launch Free Fire using HD-Adb.exe
HD-Adb.exe shell monkey -p com.dts.freefireth -c android.intent.category.LAUNCHER 1
