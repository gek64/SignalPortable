@echo off

@REM utf8
chcp 65001

@REM root location
set base=%~dp0
cd /d %base%

@REM proxy
set proxy=""
for /f "tokens=3" %%i in ('reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v "ProxyServer"') do (
    set proxy=%%i
)
if %proxy%=="" (
    echo no proxy set
) else (
    set http_proxy=http://%proxy%
    set https_proxy=http://%proxy%
)

start SignalPortable.exe