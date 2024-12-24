@echo off
REM Change to the directory where the script is located
cd /d "%~dp0\src"

REM Ensure Python is installed
python --version >nul 2>&1
IF %ERRORLEVEL% NEQ 0 (
    echo Python is not installed. Please install Python and try again.
    echo Download Python from: https://www.python.org/downloads/
    pause
    exit /b 1
)

REM Check if Chocolatey is installed and functional
where choco >nul 2>&1
IF %ERRORLEVEL% NEQ 0 (
    echo Chocolatey is not installed or not functional. Attempting to install Chocolatey...
    @powershell -NoProfile -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))"
    IF %ERRORLEVEL% NEQ 0 (
        echo Failed to install Chocolatey. Please install it manually.
        echo Download Chocolatey from: https://chocolatey.org/install
        pause
        exit /b 1
    )
) ELSE (
    choco --version >nul 2>&1
    IF %ERRORLEVEL% NEQ 0 (
        echo Chocolatey is installed but not functional. Please fix the installation manually.
        echo Refer to: https://chocolatey.org/install
        pause
        exit /b 1
    )
)

REM Install cdrtools if not available
where genisoimage >nul 2>&1
IF %ERRORLEVEL% NEQ 0 (
    echo genisoimage is not installed. Installing cdrtools via Chocolatey...
    choco install cdrtools -y
    IF %ERRORLEVEL% NEQ 0 (
        echo Failed to install cdrtools. Please install it manually.
        echo Download cdrtools from: https://sourceforge.net/projects/cdrtools/
        pause
        exit /b 1
    )
)

REM Run the build_iso.py script
python build_iso.py
pause