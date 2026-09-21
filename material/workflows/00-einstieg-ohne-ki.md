# Aurenta 00: Erster Lauf ohne KI

**Zweck:** Einen Workflow starten, die Daten zwischen Knoten ansehen und eine feste Regel ausprobieren. Fünf Knoten, keine Modell- oder Datenbankverbindung erforderlich.

## Start in fünf Minuten

1. In n8n einen neuen Workflow öffnen und über das Workflow-Menü „Import from File“ die Datei `00-einstieg-ohne-ki.json` importieren. Einen eigenen Namen vergeben und speichern.
2. Den Knoten **Kontakt** öffnen. Er enthält K-01 bereits vollständig. Die sieben Felder entsprechen der Kontaktliste.
3. **Execute Workflow** wählen. Den letzten ausgeführten Knoten **Ergebnis ablegen** öffnen.
4. Prüfen: `kontakt_id = K-01`, das ursprüngliche Anliegen, die Sprache und `freigabe = offen` stehen in der Ausgabe. Es wurde kein Text durch ein Modell erzeugt.
5. Im Kontakt-Knoten nur `kontakt_erlaubt` auf `nein` setzen und erneut starten. Jetzt läuft **Gesperrt zur Pruefung**: `entscheidung = kein_followup`, der Nachrichtenentwurf bleibt leer. Anschließend auf `ja` zurückstellen.

## Was hier gelernt wird

Ein Knoten verarbeitet Eingabedaten und reicht seine Ausgabe weiter. Der If-Knoten lässt ausschließlich den Wert `ja` passieren. `nein`, ein leerer Wert oder ein anderer Text führen in den gesperrten Zweig. Der zugelassene Zweig empfiehlt nur eine manuelle fachliche Prüfung. Er nimmt keine automatische Bedarfsbewertung vor.

Die Kontakte dürfen in dieser Übung verändert werden; sie liegen nur im Workflow. Ergebnisse bleiben im Ausführungsprotokoll. Der Workflow verschickt nichts und schreibt nicht ins CRM. Für den ersten Modellaufruf anschließend Variante **01** verwenden. Diese ist ein eigener Import, kein automatisches Update von 00.

## Fehler und Prüfung

Der Import erfordert keine Credential. Bei ausbleibender Ausgabe prüfen, ob der gesamte Workflow gestartet wurde und in welchem Zweig die letzte Ausführung endete. Referenztests: `ja` und `nein`. Die Ausgaben vergleichen und den tatsächlich ausgeführten Pfad erklären.
