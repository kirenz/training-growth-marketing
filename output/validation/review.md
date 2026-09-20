# Lokaler Prüfbericht, 19.09.2026

## Inhaltlicher Stand

14 Kursseiten überarbeitet beziehungsweise ergänzt. Durchgehender fiktiver Dienstleistungsfall Aurenta, kostenlose ChatGPT-Textübungen, erste eigene n8n-Schritte am Montag, 60 Minuten Teamfindung, tägliche Mittagspause 13:00–14:00 Uhr. Zehn Kernübungen mit Zeit, Material, Arbeitsschritten und Ergebnissen. Growth-Grundlagen, Fallpaket, Daten, Prompts, Team- und Projektvorlagen sowie drei n8n-Referenzen sind enthalten. Coaching und eigenständige Semesterarbeit werden getrennt; bekannte Prüfungstermine und Gewichte bleiben erhalten. Die lokale öffentliche Projektbeschreibung wurde entsprechend angeglichen.

## Technische Ergebnisse

- Vollständiger Quarto-Build erfolgreich: 14 HTML-Seiten.
- 681 lokale Links und Anker geprüft, keine defekten Ziele.
- 28 Browserprüfungen: alle 14 Seiten bei 1440 und 390 Pixel Breite, jeweils eine Hauptüberschrift und kein seitlicher Überlauf.
- Startseite und Tagesseite am Desktop sowie mobile Seiten visuell geprüft. Der lange mobile Seitentitel erhält einen passenden Umbruch.
- Mobile Navigation zur Materialseite erfolgreich. Prompt-Kopierfunktion bestätigt „Kopiert“. Suche nach „Aurenta“ liefert passende Inhalte.
- Alle 33 Materiallinks über HTTP abgerufen: Status 200 und nicht leere Dateien.
- CSV-Struktur, UTF-8-BOM, Kontakt-IDs, Pausenzeiten und Workflow-Verbindungen geprüft.
- Drei Workflow-Exporte in n8n 2.39.8 importiert. Fünf isolierte Ausführungen bestanden: Starter, strukturierte Ausgabe, K-05-Kontaktsperre ohne Modellaufruf, K-06-Feldweitergabe sowie Agent mit tatsächlich ausgeführtem Wissenswerkzeug.

Die Workflow-Prüfung lief ohne externes Netzwerk gegen einen lokalen deterministischen API-Mock. Sie prüft technische Verarbeitung, nicht die Antwortqualität eines echten Sprachmodells. Der temporäre Container wurde anschließend entfernt. Es wurden keine Kurszugänge geändert und keine bezahlten Modellaufrufe ausgelöst.

## Prüfgrenzen

Vor der Vorlesung bleibt ein vollständiger Lauf mit den tatsächlichen Teamzugängen und dem vorgesehenen Kursmodell erforderlich, einschließlich fachlicher Bewertung der Antworten und ausreichendem Kontingent. Die Kompetenzabfrage ist eine Vorlage, kein versendetes Formular. Die Website und die Projektbeschreibung wurden lokal bearbeitet, nicht veröffentlicht.

Details: [Browserprüfungen](browser.json), [Downloads und Kopierfunktion](interactions.json), [n8n-Ausführungen](n8n-runtime.json). Screenshots liegen unter `output/playwright/`.

## Ergänzung: separate Aurenta-Datenbank

Der spätere [Starter-Prüfbericht](starter-review.md) dokumentiert die Erweiterung auf sechs Workflow-Vorlagen und den abschließenden Stand von 700 lokalen Verweisen.

Im Anschluss wurde `aurenta_training` als separate, nur lesbare Übungsdatenbank eingerichtet. Alle acht bisherigen Kursdatenbanken bleiben unverändert. Der optionale Zugriff und eine SQL-Datei mit vorbereiteten Leseabfragen sind auf der Materialseite ergänzt. Erneuter Quarto-Build erfolgreich; 14 Seiten und jetzt 682 lokale Verweise ohne defekte Ziele. Die zusätzliche Datenbankverbindung wurde über SSH geprüft, aber noch nicht als Credential in n8n gespeichert. Prüfbericht: `/Users/jankirenz/code/hdm/database-crm/aurenta/VALIDATION.md`.
