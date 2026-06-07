@echo off
title Eiermeister
echo.
echo  ===========================
echo   Eiermeister starten...
echo  ===========================
echo.
echo  Oeffne http://localhost:8081 im Browser
echo  Zum Beenden: Strg+C druecken
echo.

:: In den App-Ordner wechseln
cd /d "%~dp0"

:: Browser nach 2 Sekunden oeffnen (Hintergrund)
start /b cmd /c "timeout /t 2 /nobreak >nul && start """" http://localhost:8081"

:: Python HTTP-Server starten
python -m http.server 8081

pause
