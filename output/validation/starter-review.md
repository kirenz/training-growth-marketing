# Aurenta-Starter: Prüfung am 19.09.2026

## Lieferumfang

Sechs eigenständige Workflow-JSONs, sechs passende Anleitungen, eine Startübersicht, Prompt und Schema sowie Kontakte, Transferfälle, Kampagnenzahlen und Fallpaket. Das ZIP enthält 19 Dateien und wurde bytegenau gegen die Quellen geprüft. Keine Credential-Bindungen, Zugangsdaten oder angehefteten Ausgabedaten; alle Workflows sind inaktiv.

Neu: 00 ohne KI, 04 CRM-Lesezugriff, 05 CRM mit strukturierter KI-Ausgabe. Bestehend: 01 einfacher Modellaufruf, 02 Struktur und Kontaktsperre, 03 Agenten-Demo. Die Kursseiten nennen die nötigen Verbindungen je Variante und eine schrittweise Reihenfolge.

## Ausführung

Alle sechs Exporte wurden in n8n 2.39.8 importiert. Für die CRM-Prüfung lief eine PostgreSQL-18-Kopie mit dem vollständigen Aurenta-Datensatz und dem eingeschränkten Lesezugang. Container liefen in einem internen Docker-Netzwerk ohne veröffentlichte Ports. Modellantworten lieferte ein lokaler deterministischer Mock; es gab keine echten Modellaufrufe.

Neun Prüfungen bestanden:

| Variante | Fall | Erwartetes Ergebnis |
|---|---|---|
| 00 | K-01 mit `ja` | Eingaben und fester Prüfstatus sichtbar |
| 00 | Kontaktstatus auf `nein` gesetzt | Gesperrter Zweig, leerer Entwurf |
| 04 | K-01 | Exakt die sieben Kontaktfelder aus der Datenbank |
| 04 | K-99 | Sichtbarer Fehler „Unbekannte Kontakt-ID“ |
| 04 | ID mit SQL-Sonderzeichen | Als Parameter behandelt, kein anderer Kontakt, sichtbarer Fehler |
| 05 | K-01 | CRM-Felder korrekt, Modellschritt, strukturierte Ausgabe |
| 05 | K-05 | Gesperrter Zweig, kein Modellaufruf |
| 05 | K-06 | Leeres Anliegen unverändert weitergegeben, Mock-Ausgabe korrekt zugeordnet |
| 05 | K-99 | Fehler vor dem Modell, kein scheinbarer Erfolg |

Die drei Fehlerläufe sind erwartete erfolgreiche Prüfungen der Fehlerbehandlung. Die fachliche Qualität echter Modellantworten wird dadurch nicht belegt. Die unveränderten Varianten 01 bis 03 wurden zuvor isoliert ausgeführt; deren Bericht bleibt unter `n8n-runtime.json` erhalten.

## Website und Grenzen

Quarto-Build erfolgreich. 14 Seiten und 700 lokale Verweise ohne defekte Ziele. Downloads und ZIP werden über die lokale Kursvorschau ausgeliefert. An den live eingerichteten Datenbanken wurden in dieser Ergänzung keine Änderungen vorgenommen. Keine Workflows wurden in die HdM-Instanz importiert oder dort aktiviert. Ein dortiger Lauf mit Aurenta-Credential und Kursmodell bleibt erforderlich.

Maschinenlesbare Ergebnisse: [starter-runtime.json](starter-runtime.json).
