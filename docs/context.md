# Projektkontext

## Zweck
Diese Datei enthält langfristigen Projektkontext, Architekturüberblick, relevante Systeme und wichtige Hintergründe. Sie ist für Informationen gedacht, die häufig gebraucht werden, aber nicht in jeder Session vollständig im Hauptprompt stehen sollen.

## Eintragen
- Projektziel und fachlicher Zweck.
- Betroffene Systeme, Dienste, APIs und Laufzeitumgebungen.
- Relevante Verzeichnisstruktur.
- Wichtige Abhängigkeiten.
- Betriebsgrenzen, z. B. produktive Umgebung, sensible Systeme, erlaubte Zugriffe.

## Beispielstruktur
- Projekt: [Name]
- Ziel: [Kurzbeschreibung]
- Stack: [Python, PowerShell, Bash, APIs, Datenbanken]
- Wichtige Pfade: [z. B. src/, scripts/, tests/, docs/]
- Kritische Komponenten: [z. B. Auth, DB, Tenant, Automationen]
- Nicht anfassen ohne Freigabe: [z. B. produktive Jobs, Deployment, Mandantenkonfiguration]

## Nutzung
Vor einer Aufgabe nur lesen, wenn Hintergrund, Architektur oder Systemgrenzen relevant sind.
