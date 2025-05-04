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

@REM set system proxy
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

start %APPROOT%SignalPortable
