# Aurenta: n8n-Starterpaket

Alle JSON-Dateien sind inaktive, eigenständige Workflows ohne Zugangsdaten. Für jeden Import einen neuen Workflow verwenden. Kein Ablauf versendet Nachrichten, bucht Termine oder verändert CRM-Daten.

| Einstieg | Datei | Verbindung |
|---|---|---|
| Erster eigener Lauf, etwa 5 Minuten | `00-einstieg-ohne-ki.json` | Keine |
| Erster Modellaufruf | `01-followup-starter.json` | Kursmodell |
| Strukturierte Ausgabe und feste Kontaktsperre | `02-followup-strukturiert.json` | Kursmodell |
| Kontakt aus der Übungsdatenbank lesen | `04-crm-kontakt-lesen.json` | Aurenta-Postgres |
| CRM und KI zusammenführen | `05-crm-followup.json` | Aurenta-Postgres und Kursmodell |
| Zusätzliche Lehrdemo zur Werkzeugwahl | `03-agenten-demo.json` | Kursmodell |

Empfohlene Reihenfolge: **00 → 01 → 02**, danach bei verfügbarer Datenbankverbindung **04 → 05**. Variante 03 ist eine optionale Lehrdemo. Nicht alle Varianten müssen an einem Tag bearbeitet werden.

## Import

In n8n einen neuen Workflow öffnen. Im Workflow-Menü „Import from File“ wählen, die gewünschte JSON-Datei importieren, einen eigenen Namen vergeben und speichern. Die Markdown-Datei mit demselben Namen erklärt Einrichtung, Testfälle und Ergebnisse. Die Eingabedaten für den ersten Lauf sind bereits gesetzt.

Zunächst den gesamten Workflow mit „Execute Workflow“ starten. Dann die tatsächlichen Ein- und Ausgaben an den Knoten ansehen. Ein früheres Ergebnis oder ein angehefteter Beispieldatensatz ersetzt keinen neuen Lauf. Zugangsdaten werden ausschließlich über die bereitgestellten Credentials ausgewählt.

Die Dateien `daten/kontakte-webinar.csv`, `daten/testfaelle-transfer.csv` und `fall/fallpaket-kompakt.txt` im ZIP entsprechen der Kurswebsite. Bei einzelnen Downloads stehen sie auf der Materialseite. Die drei Transferfälle erst beim Vergleich am Mittwoch öffnen.

## Modellverbindung

Der Knoten **Kursmodell** ist ein *Google Gemini Chat Model*. Er benötigt eine Credential vom Typ „Google Gemini (PaLM) API“, die von der Lehrperson bereitgestellt wird. Voreingestellt ist `models/gemini-3.1-flash-lite`; jedes andere Modell, das auf dem verwendeten Schlüssel verfügbar ist, kann eingetragen werden. Das eigene Gemini-Konto aus dem Browser wird hier nicht eingetragen: Die Gemini-App und die Gemini-API sind getrennte Zugänge mit eigenen Kontingenten.

## Stand und Prüfgrenze

Stand: 20.09.2026. Technische Referenz: n8n 2.39.8. Der technische Prüfbericht in der Kurswebsite unter `output/validation/` bezieht sich auf die vorherige Fassung mit einem OpenAI-Knoten; Ablauflogik, Feldzuordnungen und Testfälle sind unverändert, getauscht wurde nur der Modellknoten. Die Tests verwenden eine isolierte Kopie der Aurenta-Daten und simulierte Modellantworten. Ein echter Lauf mit einer Gemini-Credential steht noch aus und bleibt vor der Vorlesung erforderlich. Die Workflow-Dateien sind noch nicht in die HdM-n8n-Instanz importiert.
