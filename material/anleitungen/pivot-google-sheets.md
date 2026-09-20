# Pivot-Tabellen in Google Sheets: die Webinar-Kontakte von Aurenta auswerten

Etwa 15 Minuten. Am Ende hat das Team zwei Pivot-Tabellen: den Trichter je Kampagne und eine Kreuztabelle Anliegen gegen Buchung.

## Die Daten

Das Google Sheet „Webinar-Kontakte Aurenta" enthält den Export der drei Webinare: 330 Anmeldungen, eine Zeile pro Kontakt. https://docs.google.com/spreadsheets/d/1ri_Z7epna2iRNSJYo7tQtC3cjAihbDuxn6-DSZN12q0/edit

| Spalte | Bedeutung |
|---|---|
| kontakt_id, kampagne | Laufende Nummer und Webinar (A, B oder C) |
| rolle, branche, beschaeftigte | Angaben aus dem Anmeldeformular |
| webinar_status | teilgenommen oder nicht teilgenommen |
| anliegen_kategorie | Was die Person ins Feld „Was möchten Sie klären?" geschrieben hat, in vier Gruppen: leer, nachlesen, frage, gespraech |
| kontakt_erlaubt | Häkchen im Anmeldeformular |
| followup_gesendet, antwort, gespraech_gebucht, gespraech_durchgefuehrt | 1 = ja, 0 = nein. Nur Teilnehmende haben eine Nachricht bekommen |

## 1. Eine eigene Kopie anlegen

Im Sheet oben links auf „Datei" klicken, dann „Kopie erstellen". Die Kopie in der Teamablage speichern. Im Original kann nichts verändert werden.

## 2. Erste Pivot-Tabelle: der Trichter je Kampagne

1. In der Kopie eine beliebige Zelle in der Tabelle anklicken.
2. Menü „Einfügen", dann „Pivot-Tabelle". Im Fenster „Neues Tabellenblatt" wählen und auf „Erstellen" klicken.
3. Rechts erscheint der Pivot-Tabellen-Editor. Bei „Zeilen" auf „Hinzufügen" klicken und `kampagne` wählen.
4. Bei „Werte" viermal auf „Hinzufügen" klicken und nacheinander `followup_gesendet`, `antwort`, `gespraech_gebucht` und `gespraech_durchgefuehrt` wählen. Bei jedem Wert muss unter „Zusammenfassen nach" SUM stehen. Das ist die Voreinstellung für Zahlen.
5. Das Ergebnis zeigt pro Kampagne, wie viele Nachrichten rausgingen, wie viele Antworten kamen, wie viele Gespräche gebucht und wie viele durchgeführt wurden. Die Zeile „Gesamtsumme" unten liefert 198, 39, 16 und 10.

Jetzt die Quoten rechnen. In einer freien Zelle neben der Pivot-Tabelle: `=16/198` ergibt die Buchungsquote nach Follow-up, `=10/198` die Quote der durchgeführten Gespräche. Beide Zahlen haben denselben Nenner, deshalb sind sie vergleichbar. `=10/16` wäre eine andere Kennzahl: Gespräche je Buchung.

## 3. Zweite Pivot-Tabelle: Anliegen gegen Buchung

1. Wieder eine Zelle in der Datentabelle anklicken, dann „Einfügen", „Pivot-Tabelle", „Neues Tabellenblatt".
2. Bei „Zeilen" `anliegen_kategorie` hinzufügen.
3. Bei „Spalten" `gespraech_gebucht` hinzufügen.
4. Bei „Werte" `kontakt_id` hinzufügen und unter „Zusammenfassen nach" COUNTA wählen. Das zählt die Kontakte.
5. Bei „Filter" `followup_gesendet` hinzufügen und nur den Wert 1 anhaken, damit nur Kontakte gezählt werden, die überhaupt eine Nachricht bekommen haben.

Das Ergebnis ist eine Kreuztabelle: Zeilen sind die vier Anliegen, Spalten sind „0" (nicht gebucht) und „1" (gebucht). Wer zum Vergleich Anteile statt Anzahlen sehen will: im Editor bei „Werte" auf „Anzeigen als" klicken und „% der Zeile" wählen.

## 4. Was sich daraus ergibt

Drei Fragen, die das Team mit den beiden Tabellen beantwortet und in die Experimentkarte schreibt:

- An welcher Stelle des Weges gehen die meisten Kontakte verloren?
- Welche Anliegen-Gruppe bucht fast nie ein Gespräch, welche vergleichsweise oft?
- Alle 198 Kontakte haben dieselbe Gesprächseinladung bekommen. Was folgt aus der Kreuztabelle für diese Regel?

Die Kreuztabelle beschreibt, was in diesen drei Webinaren passiert ist. Ob der Unterschied zwischen den Gruppen mehr als Zufall ist, lässt sich mit einem statistischen Test prüfen. Das kommt später im Semester.
