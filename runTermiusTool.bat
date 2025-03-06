@echo off
:: Batch script to run TermiusTool.py using PowerShell with admin rights

:: Get absolute path to Python script and requirements file
set "SCRIPT_PATH=%~dp0TermiusTool.py"
set "REQUIREMENTS_PATH=%~dp0requirements.txt"

:: Launch PowerShell as admin, install requirements and run the Python script
echo Launching PowerShell as administrator to install requirements and run TermiusTool.py...

:: Check if requirements.txt exists
if exist "%REQUIREMENTS_PATH%" (
    powershell -Command "Start-Process powershell -ArgumentList '-NoExit', '-ExecutionPolicy', 'Bypass', '-Command', 'Write-Host \"Installing required packages from requirements.txt...\" -ForegroundColor Green; pip install -r \"%REQUIREMENTS_PATH%\"; Write-Host \"Running TermiusTool.py...\" -ForegroundColor Green; python \"%SCRIPT_PATH%\"' -Verb RunAs"
) else (
    echo Requirements file not found. Installing only the essential 'requests' package.
    powershell -Command "Start-Process powershell -ArgumentList '-NoExit', '-ExecutionPolicy', 'Bypass', '-Command', 'Write-Host \"Installing requests package...\" -ForegroundColor Yellow; pip install requests; Write-Host \"Running TermiusTool.py...\" -ForegroundColor Green; python \"%SCRIPT_PATH%\"' -Verb RunAs"
)

exit