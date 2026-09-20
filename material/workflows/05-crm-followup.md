# Aurenta 05: CRM und KI-Follow-up

**Zweck:** Einen Kontakt aus Aurenta lesen, die Kontaktfreigabe prüfen und einen strukturierten KI-Entwurf zur menschlichen Prüfung erzeugen. Dreizehn Knoten. Diese Variante verbindet den Datenbankabruf aus 04 mit der Modellverarbeitung aus 02.

## Voraussetzungen

Variante 04 kann einen Kontakt lesen. Variante 02 kann mit der vorbereiteten Modellverbindung eine strukturierte Ausgabe erzeugen. Erst danach beide Bausteine zusammenführen. Benötigt werden die Postgres-Credential **Aurenta – Übungsfall (Lesen)** und die freigegebene Modellverbindung. Ein kostenloses Browser-Chatkonto allein stellt keine API-Verbindung bereit.

## Import und Start

1. `05-crm-followup.json` als neuen Workflow importieren und speichern.
2. Im Knoten **Kontakt aus CRM lesen** die Aurenta-Postgres-Credential auswählen.
3. Im Knoten **Kursmodell** die bereitgestellte Modellverbindung und das freigegebene Modell auswählen. `gemini-3.1-flash-lite` ist nur die austauschbare Voreinstellung. Bei einem anderen Anbieter den passenden Chat-Model-Knoten an denselben Modelleingang anschließen und erneut testen.
4. Im Knoten **Kontakt auswaehlen** zunächst `K-01` belassen. Den gesamten Workflow starten.
5. Das Ergebnis in **Ergebnis zur Pruefung** anhand des Fallpakets prüfen. Kontakt-ID und `freigabe = offen` kommen aus fester Logik. Entscheidung, Begründung und Entwurf kommen vom Modell.

Das Fallpaket ist wie in 02 bereits im Prompt enthalten. Dieser Starter ruft es nicht zusätzlich aus der Datenbank ab. Die Datenbank liefert nur den ausgewählten Kontakt. Die Ausgabe bleibt im Ausführungsprotokoll, es gibt keine automatische CRM-Ablage und keinen Versand.

## Drei Pflichtprüfungen

| Fall | Erwartung |
|---|---|
| K-01 | Passende Empfehlung zum Erstgespräch, Aussagen durch das Fallpaket gedeckt |
| K-05 | **Gesperrt zur Pruefung**, leerer Entwurf, weder Chain noch Modell werden ausgeführt |
| K-06 | Leeres Anliegen bleibt leer; Modell soll eine Klärung empfehlen, keinen Bedarf erfinden |

Zusätzlich K-99: sichtbarer Fehler vor dem Modellschritt. Nur eine ausdrücklich erlaubte Kontaktaufnahme (`ja`) gelangt zur KI. Das Ausgabeschema prüft die Form, nicht die fachliche Qualität. Die festen Kontaktsperren bleiben auch bei unpassenden Modellantworten vorgeschaltet.

## Fehlersuche

Bei Verbindungsproblemen zuerst 04 ausführen. Bei Modell- oder Parserproblemen 02 mit demselben Kontakt prüfen. So lässt sich die Ursache einem Baustein zuordnen. Den Parser nicht umgehen, um einen fehlgeschlagenen Lauf als Erfolg erscheinen zu lassen. Der Import ist noch kein ausgeführter oder fachlich geprüfter Workflow.
