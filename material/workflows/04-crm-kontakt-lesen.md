# Aurenta 04: Einen CRM-Kontakt lesen

**Zweck:** Einen echten Datenbankabruf in n8n ausführen. Sieben Knoten, kein Sprachmodell nötig. Die Daten stammen aus der separaten Übungsdatenbank `aurenta_training`.

## Einrichtung und erster Lauf

1. `04-crm-kontakt-lesen.json` als neuen Workflow importieren und unter einem eigenen Namen speichern.
2. Im Knoten **Kontakt aus CRM lesen** die von der Lehrperson eingerichtete Postgres-Credential **Aurenta – Übungsfall (Lesen)** auswählen. Die Datenbank ist bereits vorhanden; die Credential muss separat in n8n gespeichert und getestet sein. Keine bestehende Zoi-Verbindung auf eine andere Datenbank umstellen.
3. Im Knoten **Kontakt auswaehlen** steht `kontakt_id = K-01`. Den gesamten Workflow starten.
4. **Ergebnis zur Pruefung** öffnen: ID, Rolle, Unternehmen, Webinarstatus, Anliegen, Sprache und Kontaktstatus müssen der CSV-Datei entsprechen. `freigabe` bleibt `offen`.
5. Nur die ID auf `K-02` ändern und erneut ausführen. Es muss jetzt das Anliegen zur Webinaraufzeichnung erscheinen.

K-01 bis K-06 sind die Entwicklungsfälle. T-01 bis T-03 erst am Mittwoch verwenden. Der Workflow verarbeitet genau einen Kontakt je Lauf. Er liest auch gesperrte Kontakte, erzeugt aber keinerlei Nachricht und führt keine KI-Bewertung aus.

## Die drei technischen Schritte

**Auswahl:** Eine Kontakt-ID festlegen. **Datenbank:** Die vorbereitete SQL-Abfrage sucht diese ID. **Prüfung:** Bei einem Treffer stehen die sieben Felder im Knoten Kontakt bereit. Eine unbekannte ID stoppt den Lauf mit einer verständlichen Fehlermeldung.

Die SQL-Abfrage verwendet `$1` und die Option Query Parameters mit `{{ [$json.kontakt_id] }}`. Das übergibt die ID als Wert. Diese Zuordnung unverändert lassen; eine ID nicht durch Zusammensetzen von SQL-Text einfügen. „Always Output Data“ am Datenbankknoten ermöglicht die sichtbare Fehlermeldung auch bei null Treffern.

## Prüfungen und Fehler

- K-01 und K-02: exakt ein passender Kontakt.
- K-05: `kontakt_erlaubt = nein` bleibt erhalten.
- K-99: Fehler **Unbekannte Kontakt-ID**, keine scheinbar erfolgreiche leere Ausgabe.
- Verbindungsfehler: Credential, Datenbankname und SSH-Tunnel prüfen. Das Gemini-Konto ist hier nicht beteiligt.

Es gibt keinen Schreibzugriff auf das CRM. Ausgaben bei Bedarf für das Testprotokoll sichern. Für die Kombination mit dem Modell anschließend Variante **05** importieren. Beide Varianten lassen die Knotennamen für die vorbereiteten Feldzuordnungen unverändert.
