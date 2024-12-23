@echo off
REM Change to the directory where the script is located
cd /d "%~dp0\src"

REM Run the build_iso.py script
python build_iso.py
pause