@echo off
echo Suppression des fichiers...

if exist "%temp%\ps.bat" del /f /q "%temp%\ps.bat"
if exist "%temp%\6hj546dgs.bat" del /f /q "%temp%\6hj546dgs.bat"

echo Auto-suppression...

ping 127.0.0.1 -n 2 > nul
del /f /q "%~f0"

exit