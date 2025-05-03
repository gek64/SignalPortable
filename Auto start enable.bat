@echo off

@REM utf8
chcp 65001

@REM root location
set base=%~dp0
cd /d %base%

reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "SignalPortable" /t "REG_SZ" /d "%base%SignalPortable.exe --start-in-tray" /f
