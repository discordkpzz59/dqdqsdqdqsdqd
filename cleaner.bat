@echo off

rem Suppression des fichiers
if exist "%temp%\ps.bat" del /f /q "%temp%\ps.bat" >nul 2>&1
if exist "%temp%\6hj546dgs.bat" del /f /q "%temp%\6hj546dgs.bat" >nul 2>&1

rem Auto-suppression silencieuse
start "" /b cmd /c "ping 127.0.0.1 -n 2 >nul & del /f /q "%~f0" >nul 2>&1"

exit
