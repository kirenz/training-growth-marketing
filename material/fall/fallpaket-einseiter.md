# Der Fall Aurenta auf einer Seite

Aurenta ist erfunden. Alle Namen, Zahlen und Texte wurden für die Vorlesung gemacht. Mit dem Unternehmen Zoi hat der Fall nichts zu tun, das kommt erst am Dienstag.

## Wer ist Aurenta?

Eine kleine KI-Beratung für Marketingabteilungen mittelständischer B2B-Unternehmen. Sie hat ein einziges Produkt: den „KI-Praxischeck Marketing“, zwei Wochen, 2.400 Euro netto. Wie das Unternehmen nach außen auftritt, zeigt die Website von Aurenta auf der Kursseite.

Kunden kommen auf diesem Weg zu Aurenta: Fachbeitrag lesen, Webinar besuchen, Nachricht nach dem Webinar erhalten, kostenloses Erstgespräch (30 Minuten), Angebot, Auftrag.

## Was ist das Problem?

Nach jedem Webinar schreibt Aurenta allen Teilnehmenden dieselbe Nachricht: eine Einladung zum Erstgespräch. In den letzten drei Webinaren bekamen 198 Kontakte diese Nachricht. 39 haben geantwortet, 16 haben ein Gespräch gebucht, und 10 Gespräche haben tatsächlich stattgefunden und waren brauchbar.

Aurenta vermutet: Für viele Kontakte kommt die Einladung zu früh. Manche wollen erst nachlesen, manche haben eine Frage, nur wenige wollen sofort sprechen.

## Was soll der Workflow tun?

Für jeden Kontakt aus der Webinar-Liste entscheiden, was er als Nächstes bekommt, und dazu eine kurze Nachricht schreiben (höchstens 120 Wörter). Es gibt drei Möglichkeiten:

- **Material.** Der Kontakt bekommt eine Arbeitshilfe. Aurenta hat drei: M1 ist die Checkliste „Einen KI-Anwendungsfall auswählen“, M2 die schriftliche Zusammenfassung des Webinars, M3 das Leistungsblatt zum Praxischeck.
- **Rückfrage.** Etwas ist unklar. Aurenta stellt eine konkrete Frage.
- **Erstgespräch.** Der Kontakt wird zum kostenlosen 30-Minuten-Gespräch eingeladen.

## Die fünf Regeln für die Entscheidung

| Wenn … | dann … | Beispiel für ein Anliegen |
|---|---|---|
| der Kontakt keine Nachrichten möchte (Spalte „Kontakt erlaubt“ = nein) | keine Nachricht, gar nichts | „Bitte keine weitere Kontaktaufnahme.“ |
| der Kontakt ausdrücklich sprechen will und eine Marketingaufgabe nennt | Erstgespräch | „Unsere Newsletter-Texte dauern ewig. Können wir dazu telefonieren?“ |
| der Kontakt um Informationen bittet, aber kein Gespräch will | Material, je nach Frage M1, M2 oder M3 | „Haben Sie eine Übersicht, was der Praxischeck genau umfasst?“ Das wäre M3. |
| etwas Wichtiges fehlt, oder die Anfrage passt nicht zum Angebot | Rückfrage | „Können Sie uns ein eigenes Sprachmodell aufbauen?“ Aurenta baut keine Modelle, also nachfragen, worum es eigentlich geht. |
| das Anliegen leer ist | Rückfrage | Nur Name und Firma, kein Text. Nichts hineindeuten. |

Die Regeln sind eine Startversion. Die Teams dürfen sie ändern, wenn sie die Änderung begründen und an Kontakten prüfen. Nur die erste Regel bleibt immer.

## Vier Regeln für die Nachricht

- Freundlich, sachlich, in der Sie-Form, und auf das Anliegen eingehen.
- Nichts erfinden: keine Aufzeichnung des Webinars (es gibt keine), keine Termine, keine Links, keine Anhänge, keine Erfolgsversprechen.
- Preis und Leistungen dürfen genannt werden, wenn sie zur Frage passen.
- Genau ein nächster Schritt pro Nachricht.

## Die sechs Kontakte aus dem letzten Webinar

| ID | Wer | Webinar | Anliegen | Kontakt erlaubt |
|---|---|---|---|---|
| K-01 | Marketingleitung, B2B-Dienstleister, 250 Beschäftigte | teilgenommen | „Wir möchten unsere Content-Briefings verbessern. Können wir besprechen, ob der Praxischeck dafür passt?“ | ja |
| K-02 | Content Marketing, technischer Handel, 180 Beschäftigte | nicht teilgenommen | „Ich konnte nicht teilnehmen. Gibt es eine Aufzeichnung? Ich möchte zunächst die Inhalte nacharbeiten.“ | ja |
| K-03 | Marketing Operations, Industrieunternehmen, 600 Beschäftigte | teilgenommen | „Was kostet der Praxischeck, und ist der laufende Betrieb unserer CRM-Automatisierung enthalten?“ | ja |
| K-04 | Marketing Manager, B2B-Softwareunternehmen, 120 Beschäftigte (Englisch) | teilgenommen | “We are collecting ideas for AI use in marketing. Could you recommend a checklist before we discuss a consulting project?” | ja |
| K-05 | Marketingleitung, B2B-Dienstleister, 400 Beschäftigte | teilgenommen | „Bitte keine weitere Kontaktaufnahme.“ | nein |
| K-06 | Marketing, Industrieunternehmen, 300 Beschäftigte | angemeldet, nicht erschienen | (leer) | ja |

## Woher die Daten kommen

Wer sich bei Aurenta zum Webinar anmeldet, füllt ein kurzes Formular aus: Name, E-Mail, Unternehmen und Rolle, dazu ein freiwilliges Textfeld „Was möchten Sie klären?“ und ein Häkchen „Aurenta darf mich nach dem Webinar kontaktieren“. Das Webinar-Tool ergänzt nach dem Termin, wer tatsächlich dabei war. Aurenta exportiert das Ganze als Tabelle, eine Zeile pro Kontakt.

Genau diese Tabelle bekommen die Teams als Datei `kontakte-webinar.csv`, mit den Spalten:

| Spalte | Herkunft | Beispiel K-02 |
|---|---|---|
| kontakt_id | Laufende Nummer, ersetzt Name und E-Mail | K-02 |
| rolle, unternehmen | Anmeldeformular | Content Marketing, technischer Handel, 180 Beschäftigte |
| webinar_status | Webinar-Tool: angemeldet, teilgenommen oder nicht teilgenommen | nicht teilgenommen |
| anliegen | Textfeld „Was möchten Sie klären?“, kann leer sein | „Ich konnte nicht teilnehmen. Gibt es eine Aufzeichnung? …“ |
| sprache | Sprache der Anmeldung | Deutsch |
| kontakt_erlaubt | Häkchen im Formular, ja oder nein | ja |

K-02 ist also eine Person aus dem Content Marketing, die sich angemeldet hat, beim Webinar nicht dabei war und ins Textfeld geschrieben hat, dass sie eine Aufzeichnung sucht. Namen und E-Mail-Adressen fehlen, weil alle Kontakte erfunden sind. Die Kampagnenzahlen (198 Follow-ups, 10 Gespräche) stammen aus derselben Art von Export, nur über drei Webinare zusammengezählt.

## Für Gemini gibt es eine längere Fassung

Die Datei „Kontext für Gemini“ auf der Materialseite enthält alle Details zu Aurenta, damit das Modell nichts erfindet. Sie wird in Übung 1.3 in den Chat kopiert und muss nicht gelesen werden.
