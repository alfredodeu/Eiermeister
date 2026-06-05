# Regeln

## Arbeitsprinzipien
- Änderungen minimal und lokal halten.
- Bestehende Funktionalität schützen.
- Erst analysieren, dann planen, dann gezielt umsetzen.
- Keine Spekulation und kein Trial-and-Error.
- Maximal drei Dateien gleichzeitig lesen, wenn es zur Kontextkontrolle sinnvoll ist.

## Sicherheitsregeln
- Keine schreibenden Entra-365-API-Aufrufe ohne explizite Freigabe.
- Vor Datenbankänderungen immer Backup erstellen: `cp <db> <db>.backup.$(date +%s)`.
- Geheimnisse, Tokens, API-Keys und Zugangsdaten nie unnötig in Chat oder globale Prompt-Dateien schreiben.
- Externe Verbindungen nur aktivieren, wenn sie für die aktuelle Aufgabe wirklich gebraucht werden.

## Kontextregeln
- Diese Datei für dauerhafte Regeln nutzen.
- Detaillierter Projektkontext gehört nach `docs/context.md`.
- Wiederkehrende Abläufe gehören nach `docs/runbooks.md`.
- Entscheidungen und Begründungen gehören nach `docs/decisions.md`.
