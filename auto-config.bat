@echo off
:: Batch file to download and run a .reg file from GitHub

set URL=https://raw.githubusercontent.com/DiadNetworks/eas/main/iesecurity.reg
set FILE=%TEMP%\iesecurity.reg

echo Downloading registry file...
powershell -Command "(New-Object Net.WebClient).DownloadFile('%URL%', '%FILE%')"

if exist "%FILE%" (
    echo Importing registry settings...
    reg import "%FILE%"
    echo Cleanup...
    del "%FILE%"
) else (
    echo Failed to download the file.
    exit /b 1
)

echo Done.
pause   
