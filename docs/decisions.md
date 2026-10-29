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

### iOS-Alarm: Audio-Session statt Stummschalter-Hinweis
- Datum: 2026-10-29
- Status: angenommen
- Kontext: Zielplattform ist iOS. Web Audio respektiert dort den Stummschalter; nach Sperre/Anruf steht der AudioContext auf `interrupted`. JS pausiert bei gesperrtem Display komplett.
- Entscheidung: `navigator.audioSession.type = 'playback'` (iOS 17+), sonst stilles `<audio>` in Schleife (nur iOS). `ensureAudioCtx()` setzt bei jedem Zustand ≠ `running` fort; jeder `pointerdown` während einer Kochung reaktiviert Audio + Wake Lock. Benachrichtigungen über `serviceWorker.ready.showNotification` (Android kennt `new Notification` nicht), Wiederholton startet vorher.
- Begründung: Ohne Server/Push ist kein Alarm bei gesperrtem iPhone möglich; daher Fokus auf „Display an lassen" + zuverlässiger Ton im Vordergrund.
- Auswirkungen: Nur am echten iPhone prüfbar (Stummschalter, Sperren/Entsperren).

### Persistenz in localStorage
- Datum: 2026-10-29
- Status: angenommen
- Entscheidung / Schlüssel:
  - `em_eggs` – Ei-Einstellungen (max. 4, beim Laden geclamped)
  - `em_alt` – manuelle Höhe; gesetzt ⇒ GPS wird ignoriert, leeres Feld im Modal löscht sie
  - `em_session` – laufende Kochung (`timers`: egg/total/started/stopped/inserted) oder `coldStartAt`; wird nach > 1 h bzw. wenn alles gestoppt verworfen
  - `em_sync` – „Alle gleichzeitig fertig" (Einlegen-Modus, > 1 Ei; kürzere Eier mit `started` in der Zukunft, `inserted=false`)
  - `em_corr` – persönlicher Zeitfaktor aus Rückmeldung (±3 % je Klick, 0,85–1,15), wirkt in `cookSec()`
  - `em_pxPerMm` – Display-Kalibrierung (siehe oben)
- Begründung: iOS Safari beendet Hintergrund-Tabs aggressiv; Zeit wird absolut über `Date.now()` gerechnet, daher ist Wiederherstellung trivial.

## Hinweise
- Nur dauerhafte, wiederverwendbare Entscheidungen eintragen.
- Keine flüchtigen Chat-Zwischenstände hier speichern.
- Wenn eine Entscheidung Sicherheits- oder Betriebsfolgen hat, auch in `docs/rules.md` oder `docs/context.md` referenzieren.
