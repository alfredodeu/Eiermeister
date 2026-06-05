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

:: Browser nach kurzer Wartezeit oeffnen
start "" timeout /t 1 /nobreak >nul
start "" "http://localhost:8081"

:: Python HTTP-Server starten
python -m http.server 8081 --directory "%~dp0"

pause
