# Growth Marketing: Kurswebsite und Lehrvorbereitung

Stand: 20.09.2026. Lernpfad für die Blocktage 21.–23.09.2026. Die Website wird mit Quarto gebaut und auf GitHub Pages veröffentlicht. Diese README ist für die Lehrperson und nicht Teil der Renderliste.

## Didaktischer Zuschnitt

Fiktive KI-Beratung Aurenta, Dienstleistung „KI-Praxischeck Marketing“: zwei Wochen, Workshop und ein kleiner Prototyp mit synthetischen Daten, 2.400 Euro netto. Ausgangsproblem ist die passende Nachbereitung von Webinar-Kontakten. Keine Angaben beschreiben Zoi. Preis und Kernangebot sind vollständig, damit die Übungen fachliche Entscheidungen statt künstlicher Informationsfallen behandeln.

Montag: sechs Dreierteams, Zugang zu Gemini einrichten, 60 Minuten Teamfindung, Growth-Hypothese, erster Prompt, n8n mit ersten eigenen Schritten vor der Pause. Dienstag: Zoi-Briefing, Projektbrief, Ablauf und gezielter Ausbau. Mittwoch: Tests, fairer Vergleich und Übergabe. Mittagspause an allen Tagen 13:00–14:00 Uhr. Die 90 Minuten im Semester sind Coaching, keine Begrenzung der eigenständigen Projektarbeit.

Keine ECTS-Zahl erfunden. Prüfungsgewichte und bekannte Termine bleiben unverändert. Der konkrete fachliche Semesterumfang wird nach dem Briefing abgestimmt. Browser-Chat und n8n-API sind getrennte Zugänge. Kein privates Bezahlabo für Pflichtübungen; das Studierendenangebot Google AI Plus ist ausdrücklich freiwillig und steht mit seinen Bedingungen (Zahlungsmethode, automatische Verlängerung) auf der Vorbereitungsseite.

## Lokal ansehen

```sh
./render.sh
quarto preview --no-browser
```

`render.sh` rendert die Kurswebsite und danach das Teilprojekt `aurenta/` (fiktive Unternehmenswebsite, Ausgabe `_site/aurenta/`). Ein alleiniges `quarto render` leert `_site/` und entfernt damit die Aurenta-Seiten; dann `cd aurenta && quarto render` nachholen.

Lokale Styles, keine externe Schrift. Downloads unter material/. Im Montagsstand werden 12 Kursseiten, 4 Foliensätze und die 5 Aurenta-Seiten gebaut; Dienstag und Mittwoch kommen bei der Freischaltung dazu.

## Freischaltung der Blocktage

Am Montag sind nur die Startseite, die Vorbereitung, der Montag, der Werkzeugkasten, das Semesterprojekt und die Materialien online. Dienstag und Mittwoch liegen als `tage/_dienstag.qmd` und `tage/_mittwoch.qmd` im Projekt. Quarto ignoriert Dateien mit Unterstrich, sie werden also weder gebaut noch ins `_site` kopiert und sind auch über die Adresse nicht erreichbar. Ebenso gesperrt sind die Folien `slides/_tag2-briefing.qmd` und `slides/_tag3-testen.qmd`, die tagesgebundenen Zeilen auf der Materialseite und, bis Mittwoch, die drei Transfer-Testfälle im Starterpaket.

Freischalten mit einem Befehl:

```sh
cd ~/code/presentation/training-growth-marketing
./freischalten.sh dienstag     # am Dienstagmorgen
./freischalten.sh mittwoch     # am Mittwochmorgen
./veroeffentlichen.sh
```

Das Skript benennt die Quelldateien um, nimmt sie in Renderliste und Navigation auf, ersetzt die Platzhalter auf Startseite, Tagesseite und Materialseite, baut beim Mittwoch das Starterpaket mit den Transferfällen neu und rendert die Website. Rückgängig, solange nichts veröffentlicht ist: `git checkout -- . && git clean -fd`.

Die Tagesseiten nennen bewusst keine Uhrzeiten mehr, sondern Bausteine mit geschätzter Dauer. Fest sind nur Beginn, Mittagspause, Ende und das Zoi-Briefing am Dienstag ab 10:00 Uhr. Damit widerspricht die Website nicht dem tatsächlichen Verlauf, wenn ein Baustein länger dauert oder entfällt.

## Passwortschutz

Die Website blendet den Inhalt aus und zeigt ein Eingabefeld. Kurspasswort: **`growth-hdm-26`**. Nach der Eingabe wird die Freigabe im Browser gespeichert (`localStorage`, Schlüssel `gm26_zugang`) und gilt für alle Seiten derselben Adresse, also auch für die Foliensätze und die Aurenta-Website. Auf `localhost` wird nicht gefragt, die lokale Vorschau bleibt ungestört.

Bewusst kein `prompt()`: Manche Browser, darunter etliche In-App-Browser, blockieren Systemdialoge. Dort wirft der Aufruf einen Fehler, die Abfrage bricht ab und die Seite wäre offen sichtbar. Das Formular funktioniert überall und blendet den Inhalt bis zur Freigabe aus.

Passwort ändern: in `passwortschutz.html` die Liste `KENNWOERTER` anpassen und neu veröffentlichen. Eingebunden ist die Datei über `include-in-header` an drei Stellen: `_quarto.yml` (Kursseiten), `slides/_metadata.yml` (Foliensätze) und `aurenta/_quarto.yml` (Aurenta-Website).

Das ist ein Schutz vor Gelegenheitszugriffen, keine echte Zugangskontrolle: Der Code läuft im Browser und ist im Quelltext lesbar, das HTML lässt sich auch ohne Passwort herunterladen, und das GitHub-Repository ist öffentlich. Für eine geschlossene Kursgruppe reicht das, für vertrauliche Inhalte nicht.

## Veröffentlichung

```sh
cd ~/code/presentation/training-growth-marketing
./veroeffentlichen.sh
```

Das Skript wechselt selbst ins Projektverzeichnis, rendert beide Quarto-Projekte und ruft dann `quarto publish gh-pages --no-prompt --no-render` auf. `--no-render` ist zwingend. Ohne die Option rendert Quarto selbst, leert dabei `_site/` und die Aurenta-Seiten fehlen anschließend auf der veröffentlichten Website. Deshalb immer zuerst `./render.sh` (oder `./freischalten.sh`), das beide Projekte baut, und erst danach veröffentlichen.

Das Repository ist öffentlich, GitHub Pages benötigt das im kostenlosen Konto. Ein Passwortschutz ist bisher nicht eingerichtet.

## Vorlesungsvorbereitung

Die Dateien liefern Inhalte, Vorlagen und inaktive Workflow-Exporte. Sie bestätigen keine betriebsbereite Kursumgebung. Vor der Vorlesung sind funktionierende Chat-Zugänge, sechs Teamzugänge in n8n, eine autorisierte Modellverbindung mit ausreichendem Kontingent und ein gemeinsamer Lauf zu prüfen. Kein API-Schlüssel wird an Studierende als Text verteilt.

Die [Kompetenzabfrage in Google Forms](https://docs.google.com/forms/d/1NZ7ugXitJttdEcySjipi20Y0PY1y8UyMnTLf3cWoupo/edit) wurde am 19.09.2026 überarbeitet und liegt als unveröffentlichter Entwurf in „Kirenz Ops“. Sie enthält dreizehn Frageblöcke sowie die verpflichtende E-Mail-Erfassung per Eingabe. Die Kompetenzfragen erfassen konkrete Arbeitsweisen in KI, Automatisierung, Daten und Marketing. Der Einstieg führt über Stärken, Lerninteressen und Marketingpraxis. Automatisierung und Programmierung stehen als freiwillige Zusatzinformationen am Ende; Vorkenntnisse werden ausdrücklich nicht vorausgesetzt. Programmierpraxis wird in fünf verhaltensbezogenen Stufen erfragt; Sprachen und Werkzeuge sind ebenfalls optional. Studiengang und interne Hinweise zur Zusammensetzung des Kurses entfallen. Projektbeispiel und organisatorische Hinweise sind optional; bei den Stärken sind genau zwei Tätigkeiten auszuwählen. Keine Einladungen versendet.

Die spätere automatische Teameinteilung nutzt die Antworten: zuerst gemeinsame Arbeitszeiten aus dem Raster (Montag bis Sonntag, sechs Zwei-Stunden-Fenster von 08 bis 20 Uhr), dann ergänzende Erfahrungen in Programmierung, Automatisierung, Daten und Marketing sowie Stärken und Lerninteressen. Name und E-Mail dienen nur der Zuordnung. Die Pflichtfrage zur Verlässlichkeit unterscheidet regelmäßige, vorläufige und noch unbekannte Verfügbarkeit sowie abweichende Zeitfenster. Leere Raster bei noch offener Planung gelten als unbekannt, nicht als fehlende Verfügbarkeit. Vorläufige Überschneidungen, abweichende Zeiten, widersprüchliche Antworten und fehlende Angaben müssen bei der Auswertung sichtbar bleiben. Es gibt keinen pauschalen Kompetenz-Gesamtwert. Die Einteilung soll sechs arbeitsfähige Dreierteams ergeben, mit kurzer Begründung je Team. Eine Einteilung liegt noch nicht vor; sie setzt eingegangene Antworten voraus.

Die sechs n8n-Exporte nutzen native Knoten, Manual Trigger und je einen Kontakt pro Lauf. 00 funktioniert ohne Modell und Datenbank; 01/02 nutzen das Kursmodell, 04 ausschließlich die Aurenta-Datenbank, 05 beide Verbindungen. 03 ist die optionale Agenten-Demo. Alle Vorlagen mit Anleitungen stehen als `material/workflows/aurenta-n8n-starterpaket.zip` bereit. Sie sind nicht an eine produktive Instanz gebunden. Voreinstellung models/gemini-3.1-flash-lite ist austauschbar und muss auf dem verwendeten Gemini-Schlüssel verfügbar sein. Die Agenten-Demo enthält zwei vorbereitete Code Tools, die ausschließlich statisches Fallwissen liefern; Studierende programmieren sie nicht. Versand, Terminbuchung und produktive Schreibzugriffe fehlen vollständig.

Ausgaben bleiben zunächst im Ausführungsprotokoll. Sie werden für die Teamablage gesichert. Eine dauerhafte Ablage oder CRM-Anbindung ist eine spätere eigene Erweiterung. Bei Ausfall kann im Chat fachlich weitergearbeitet werden; diese Simulation ersetzt den ausstehenden echten n8n-Lauf nicht.

## Material und Konsistenz

K-01 bis K-06 sind Entwicklungsfälle; T-01 bis T-03 zusätzliche Prüffälle. Letztere werden erst Mittwoch geöffnet. Die Erwartungshilfe wird nach eigener Festlegung verwendet. Drei synthetische Kampagnen ergeben 330 Anmeldungen, 198 Teilnahmen und Follow-ups, 39 Antworten, 16 Buchungen und 10 qualifizierte Gespräche. Kontaktliste und Kampagnentabelle sind getrennte synthetische Datensätze.

Fallpaket kompakt enthält Unternehmensprofil, Angebot, Entscheidungsregeln und Tonalität. Die n8n-Prompts enthalten denselben Stand. Änderungen am Angebot müssen über beide Formate und die Agentenwerkzeuge mitgezogen werden. CSV: UTF-8-BOM, Semikolon. Keine echten Kontaktdaten.

Seit 19.09.2026 liegt unter `material/prozess/` das Aurenta-Beispiel als Swimlane-Diagramm (BPMN 2.0, Ist und Soll) mit Lesehilfe für Übung 2.2. Quelle und Pipeline: `~/code/process-lab` (Validierung, Layout, Render). Änderungen am Prozess dort vornehmen und die Dateien erneut kopieren.

## Quellen und Abgrenzungen

Seit 19.09.2026 liegt der Aurenta-Fall zusätzlich in der separaten, nur lesbaren Datenbank `aurenta_training`. Sie enthält exakt die Kontaktfälle, Kampagnenzahlen und das kompakte Fallpaket der Website. Die Datenbanken für das spätere Zoi-Projekt bleiben unverändert. Einrichtung und Tunnelzugriff sind geprüft; eine eigene Postgres-Credential muss noch in n8n gespeichert und dort getestet werden. Einzelheiten: `/Users/jankirenz/code/hdm/database-crm/aurenta/README.md`. Die erste Übung bleibt beim manuell eingetragenen Kontakt.

- /Users/jankirenz/code/hdm-projekte/projekte/ws-2026/agentic-ai-growth-marketing.qmd: Termine, 5 SWS, Gewichte 10/20/40/30.
- Lokaler Zoi-Briefingentwurf: Kontext der vier Arbeitsbereiche, keine bestätigte Leistungsvereinbarung.
- Öffentliche Quellen stehen direkt auf der Growth-Seite und in den Werkzeugseiten. Anbieterfälle als Selbstauskünfte kennzeichnen, keine Effektraten übertragen.
- Die Vorprüfungsleistung wird nicht neu geregelt. Die bisher veröffentlichte 80-Prozent-Anforderung muss mit den konkreten Anbieterprüfungen und dem tatsächlichen Nachweisweg abgestimmt werden. Keine pauschale Zertifikatsausnahme erfunden.

## Technische Prüfung

Die lokale Prüfung umfasst Quarto-Render, Links und Anker, responsive Browserdarstellung, Download-Dateien und Workflow-Struktur. Der konkrete Prüfstand steht unten und in [output/validation/review.md](output/validation/review.md). Es wurde keine Bezahl-API aufgerufen.


### Ergebnis der isolierten n8n-Prüfung, 19.09.2026

n8n 2.39.8 in einem temporären Container ohne externes Netzwerk. Alle drei Referenzen und zwei zusätzliche Fallvarianten wurden importiert. Fünf Ausführungsprüfungen bestanden: Starter, strukturierte Ausgabe, Kontaktsperre K-05 ohne Modellaufruf, leeres Anliegen K-06 mit korrekter Feldweitergabe und Agenten-Demo mit tatsächlich ausgeführtem Wissenswerkzeug. Kontakt-IDs und der feste Freigabestatus blieben korrekt.

Die Modellantworten kamen aus einem lokalen deterministischen API-Mock. Dies prüft Verbindungen, Parser, Zweige, Feldzuordnungen und Werkzeugausführung. Es ist ausdrücklich kein Qualitätsnachweis des echten Modells und kein Lasttest der Kursumgebung. Ein nicht schemakonformer Mock-Output wurde vom Parser gestoppt. Der vollständige Lauf mit den tatsächlichen Kurszugängen und der Test der fachlichen Erwartungen bleiben vor der Vorlesung erforderlich.

Quarto-Render erfolgreich. Statische Prüfung: 14 Seiten, 681 lokale Verweise, keine defekten Links oder Anker; CSV-Struktur und Workflow-Verbindungen geprüft. Alle Seiten bei 1440 und 390 Pixel Breite ohne seitlichen Überlauf. Mobile Navigation, Prompt-Kopierfunktion und Suche geprüft. Alle 33 Materialverweise liefern erfolgreich eine nicht leere Datei. Der temporäre n8n-Testcontainer wurde entfernt.

### Ergänzung: sechs Starter und CRM-Anbindung

Die zusätzlichen Varianten 00, 04 und 05 wurden in n8n 2.39.8 ausgeführt. Neun Tests bestanden, darunter drei erwartete Fehler bei unbekannter oder als SQL-Ausdruck formulierter Kontakt-ID. Die CRM-Felder stimmen exakt mit der Quelle überein. Gesperrte Kontakte gelangen in 05 nicht zum Modell. Der Test nutzt eine isolierte PostgreSQL-18-Kopie mit dem Lesezugang und ein lokales Modell-Mock in einem internen Docker-Netzwerk ohne veröffentlichte Ports. Kein Zugriff auf die echte CRM-Datenbank und keine bezahlten Modellaufrufe in diesen Workflowtests. Beide Testcontainer und das temporäre Netzwerk wurden nach Abschluss entfernt.

Alle sechs Exporte wurden importiert; die unveränderten Varianten 01 bis 03 sind durch die vorherige Laufprüfung abgedeckt. Das ZIP enthält 19 geprüfte Dateien, keine Credentials. Erneuter Build und Linkprüfung: 14 Seiten, 700 lokale Verweise, keine defekten Ziele. Details: [Starter-Prüfbericht](output/validation/starter-review.md). Die Exporte sind noch nicht in der HdM-n8n-Instanz importiert.

### Abschluss und Löschung der Kompetenzabfrage

Das Formular endet mit einem Dank und einem Hinweis auf „Senden“. Nach dem Absenden bestätigt eine persönliche Nachricht die Speicherung und den Abschluss. Im Einstieg wird die Löschung der Umfrageangaben nach abgeschlossener Gruppenzuteilung angekündigt. Diese Löschung umfasst die Antworten in Google Forms sowie gegebenenfalls angelegte Antworttabellen, Exporte und Arbeitskopien der Antworten. Sie ist Teil des späteren Abschlusses der Teameinteilung; eine automatische Löschroutine ist derzeit nicht eingerichtet.
