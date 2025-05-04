@echo off

@REM utf8
chcp 65001

@REM bat root location
set BATROOT=%~dp0
cd /d %BATROOT%

reg delete "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "SignalPortable" /f
