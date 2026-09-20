# Foliendecks für die Blocktage

Quarto reveal.js, Theme `deck.scss` (dunkles KI-Grundlagen-Theme, Inter, Grün), Titelfolie `title-slide.html`, Hintergrund `includes/bg-grid.html`. Rendern mit `quarto render slides/<deck>.qmd`, Ausgabe unter `_site/slides/`. Auf Folien mit Reglern, Buttons oder Eingabefeldern mit den Pfeiltasten weiterblättern.

| Deck | Einsatz | Interaktive Elemente |
|---|---|---|
| `tag1-projektstart.qmd` | Montag 09:00, Projektstart und Teams | Karten als Fragments |
| `growth-marketing.qmd` | Montag, Input Growth Marketing am Fall; Abschnitt A/B-Test für Mittwoch oder Semester | Kundenweg-Strom, Trichter, Zyklus, Growth Loop, A/B-Simulator, Kreuztabelle |
| `ki-und-prompting.qmd` | Montag vor Übung 1.2 | Kontext-Check, Prompt-Baukasten |
| `n8n-workflows.qmd` | Montag Demo vor Übung 1.3, Dienstag Ausbau | n8n-Simulator (Starter und Ausbau, K-01/K-02/K-05) |
| `tag2-briefing.qmd` | Dienstag | Aussagen sortieren, BPMN-Legende, Bausteine sortieren, Prozessbilder |
| `tag3-testen.qmd` | Mittwoch | Rubrik zum Bewerten, Zeitvergleich mit Break-even |

## Includes

Alle unter `includes/`, jeweils Markup, CSS und JS in einer Datei, als roher HTML-Block (```` ```{=html} ````), ohne externe Bibliotheken. Daten und Texte stehen am Anfang des Scripts.

- `kundenweg-anim.html`, `funnel.html`, `zyklus.html`, `growthloop.html`, `abtest-sim.html`, `kreuztabelle.html`: siehe Deck Growth Marketing
- `kontext-check.html`, `aussagen-sortieren.html`, `bausteine-sortieren.html`: Sortierübungen aus einer Vorlage generiert (Aussage anklicken, Kategorie wählen, Rückmeldung mit Erklärung)
- `prompt-bausteine.html`: vier Bausteine an- und abschalten, rechts die typische Schwäche der Ausgabe
- `n8n-flow.html`: Knotenkette mit Ausführung, Variante Starter oder Struktur und Sperre, Kontakt wählbar, Knoten anklickbar
- `rubrik.html`: Beispielausgabe für K-02 mit fünf Kriterien, Auflösung markiert die Fehler
- `vergleich-zeiten.html`: Zeiten je Fall und Variante eingeben, Summen und Break-even der Einrichtung
- `bpmn-legende.html`: Bahnen und sechs Symbole, anklickbar

Beispielausgaben in Prompt-Baukasten, n8n-Simulator und Rubrik sind nachgestellt und so gekennzeichnet. Zahlen für Angebote und Aufträge im Kundenweg sind Annahmen, der Fall enthält dazu keine Daten.

Storyboard des Growth-Marketing-Decks: `storyboard-growth-marketing.md`.
