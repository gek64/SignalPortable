@echo off

@REM utf8
chcp 65001

@REM bat root location
set BATROOT=%~dp0
cd /d %BATROOT%

@REM app root location
if exist App (
    set APPROOT=%BATROOT%
) else if exist ../App (
    for %%I in (.) do set APPROOT=%%~dpI
) else (
    echo APP root not found
    pause
    exit 0
)

reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "SignalPortable" /t "REG_SZ" /d "%APPROOT%SignalPortable.exe --start-in-tray" /f
