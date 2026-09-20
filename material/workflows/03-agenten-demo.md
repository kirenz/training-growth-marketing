# Aurenta: Agentenvergleich

Neun Knoten. Lehrdemo mit zwei vorbereiteten, ausschließlich lesenden Wissenswerkzeugen. Die kurzen Code-Tool-Inhalte sind fertig mitgeliefert; Studierende schreiben keinen Code. Werkzeugwahl im Laufprotokoll prüfen, maximal drei Agenteniterationen.

## Import und Verbindung

JSON in einen neuen eigenen n8n-Workflow importieren. Der Export ist inaktiv und enthält keine Zugangsdaten. Im Knoten Kursmodell die von der Lehrperson bereitgestellte Gemini-Verbindung und das freigegebene Modell auswählen. Voreinstellung ist gemini-3.1-flash-lite, keine Zusage über das Kontingent des Kurskontos. Alternativ einen freigegebenen Chat-Model-Knoten mit demselben KI-Eingang verbinden; danach erneut testen.

## Eingabe und Ergebnis

Der Knoten Kontakt enthält kontakt_id, rolle, unternehmen, webinar_status, anliegen, sprache und kontakt_erlaubt. Die Daten eines Kontakts aus kontakte-webinar.csv übernehmen. Ein manueller Lauf verarbeitet genau einen Fall. Keine Zugangsdaten in Eingabefelder kopieren.

Die Ausgabe steht im letzten Knoten des Ausführungsprotokolls. kontakt_id wird aus der Eingabe übernommen; freigabe wird unabhängig vom Modell auf offen gesetzt. Die Ausgabe ist keine dauerhafte CRM-Ablage. Für die Übung Ergebnis herunterladen/kopieren und in der Teamablage sichern. Es gibt keine Versand-, Buchungs- oder CRM-Schreibaktion.

## Test und Fehler

K-01, K-02 und K-03 einzeln ausführen. In Variante 02 und 03 außerdem K-05: Der Modellknoten darf nicht ausgeführt werden. Verbindungs-, Quoten- und Parserfehler werden nicht als Erfolg behandelt. Nach einer Änderung den betroffenen und einen zuvor bestandenen Fall erneut prüfen. Ein Importtest ersetzt keinen Modelllauf mit den Kurszugängen.

Die vollständige Bauanleitung steht auf werkzeuge/workflows.html der Kurswebsite. Der technische Prüfstand ist in der README der Website dokumentiert.
