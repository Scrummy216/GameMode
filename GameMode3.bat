@echo off
mode 80,20
:menu
CLS
Color 0f
echo. [96mCreated by Scrummy[0m
echo ===============================================================================
:menu
echo.  Press 1 -  GAME MODE ON (AFTER LAUNCHING GAME)
echo.  Press 2 -  GAME MODE OFF (AFTER GAMING SESSION IS DONE)
echo                 **DO NOT CLOSE OUT OF THIS WINDOW**
echo ===============================================================================
set /p userinp= ^> Enter Your Option: 
if [%userinp%]==[] echo.&echo Invalid User Input&echo.&pause&goto :menu
if %userinp% gtr 2 echo.&echo Invalid User Selection&echo.&pause&goto :menu
if %userinp%==1 goto :opt1
if %userinp%==2 goto :opt2

:opt1
powercfg -setacvalueindex scheme_current sub_processor 5d76a2ca-e8c0-402f-a133-2158492d58ad 1
powercfg -setactive scheme_current
taskkill /IM explorer.exe /F
powershell -Command "Set-MpPreference -DisableRealtimeMonitoring $true"
goto :menu

:opt2
powercfg -setacvalueindex scheme_current sub_processor 5d76a2ca-e8c0-402f-a133-2158492d58ad 0
powercfg -setactive scheme_current
start "1" "explorer"
powershell -Command "Set-MpPreference -DisableRealtimeMonitoring $false"
goto :menu