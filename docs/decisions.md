# Entscheidungen

## Zweck
Diese Datei dokumentiert technische oder organisatorische Entscheidungen, damit sie nicht in jeder Session neu hergeleitet werden müssen.

## Vorlage
### [Titel der Entscheidung]
- Datum: [YYYY-MM-DD]
- Status: vorgeschlagen | angenommen | verworfen
- Kontext: [Welches Problem oder welche Randbedingung?]
- Entscheidung: [Was wurde festgelegt?]
- Begründung: [Warum?]
- Auswirkungen: [Was ändert sich dadurch?]

### Ei-Vermessung „auf Display legen" über Karten-Kalibrierung
- Datum: 2026-06-20
- Status: angenommen
- Kontext: Feature-Wunsch wie in nativer Konkurrenz-App: echtes Ei auf den Bildschirm legen und Umriss einpassen, um Länge/Breite zu messen. Als Web-PWA kennt der Browser die physische Bildschirm-DPI nicht (CSS-`mm` ≠ echte mm, `devicePixelRatio` liefert nur das CSS-Pixel-Verhältnis).
- Entscheidung: Einmalige Kalibrierung mit EC-/Kreditkarte (ISO/IEC 7810 ID-1: 85,6 × 53,98 mm). Daraus `pxPerMm` berechnen und in `localStorage['em_pxPerMm']` speichern. Danach Ei per zwei Reglern (Länge/Breite) in einen bottom-left-verankerten Umriss einpassen; Ergebnis wird in `eggL`/`eggB` zurückgeschrieben (geclamped auf Slider-Range 45–75 / 35–58 mm).
- Begründung: Keine zuverlässige Web-API für physische Bildschirmgröße; Referenzobjekt bekannter Größe ist der Standard-Trick solcher Tools. Kein Kamerazugriff nötig, passt in die Single-File-Architektur (`index.html`), keine neuen Abhängigkeiten.
- Auswirkungen: Lokale Vorschau via `python -m http.server 8081` (`.claude/launch.json` ergänzt). Genauigkeit hängt an sauberer Kalibrierung; „Neu kalibrieren" im Ei-Panel verfügbar.

## Hinweise
- Nur dauerhafte, wiederverwendbare Entscheidungen eintragen.
- Keine flüchtigen Chat-Zwischenstände hier speichern.
- Wenn eine Entscheidung Sicherheits- oder Betriebsfolgen hat, auch in `docs/rules.md` oder `docs/context.md` referenzieren.
