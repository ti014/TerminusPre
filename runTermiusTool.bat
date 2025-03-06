@echo off
:: Batch script to run TermiusTool.py and install libraries from requirements.txt

:: Ensure the script is run with administrative privileges
:: Check for administrative privileges
openfiles >nul 2>&1
if %errorlevel% neq 0 (
    echo Requesting administrative privileges...
    powershell -Command "Start-Process '%~f0' -Verb runAs"
    exit /b
)

:: Install required libraries
where pip >nul 2>&1
if %errorlevel% neq 0 (
    echo Pip not found. Please install Python and Pip, and add them to your PATH.
    exit /b
)
pip install -r "%~dp0requirements.txt"

:: Run the Python script
python "%~dp0TermiusTool.py"