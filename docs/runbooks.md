# Runbooks

## Zweck
Diese Datei sammelt wiederkehrende Abläufe, Prüfschritte und Troubleshooting-Anleitungen.

## Typische Inhalte
- Start- und Testbefehle.
- Build-, Deploy- oder Prüfabläufe.
- Fehlerbilder und bekannte Ursachen.
- Manuelle Verifikationsschritte.
- Rückfall- oder Rollback-Schritte.

## Beispiele
### Python prüfen
1. Virtuelle Umgebung aktivieren.
2. Tests mit `pytest` ausführen.
3. Betroffene Funktion mit realistischem Beispiel prüfen.

### PowerShell prüfen
1. Relevantes Modul laden.
2. Tests mit `Pester` ausführen.
3. Parameter mit echten, aber sicheren Beispielen prüfen.

### Lange Aufgaben
1. Zwischenstand kurz zusammenfassen.
2. Dauerhaftes Wissen in passende `docs/*.md` übernehmen.
3. Danach neue Session oder kompakten Kontext für den nächsten Schritt verwenden.
