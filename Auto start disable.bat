@echo off

@REM utf8
chcp 65001

@REM root location
set base=%~dp0
cd /d %base%

reg delete "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "SignalPortable" /f
