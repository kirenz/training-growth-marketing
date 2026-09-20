# Ablaufskizze als Swimlane-Diagramm

Die beiden Bilder zeigen den Aurenta-Übungsfall: die Webinar-Nachbereitung heute (`aurenta-webinar-ist`) und ein Entwurf mit KI-Agent (`aurenta-webinar-soll`). Notation ist BPMN 2.0, dieselbe, die Prozessmanagement-Werkzeuge wie SAP Signavio verwenden. Für die Übung reichen die Bahnen und sechs Symbole.

| Element | Bedeutung |
|---|---|
| Waagerechte Bahn (Lane) | Wer den Schritt ausführt: Marketing-Team, KI-Agent, Workflow-System |
| Rechteck mit Person | Ein Mensch entscheidet oder arbeitet |
| Rechteck mit Tabelle | Feste Regel ohne KI, zum Beispiel die Kontaktsperre |
| Rechteck mit Zahnrädern | Modellschritt oder Systemaufruf, zum Beispiel der KI-Entwurf oder das Lesen aus dem CRM |
| Rechteck mit Briefumschlag | Versand einer Nachricht |
| Raute mit X | Entscheidung; die Pfeile tragen die Antworten (ja, nein) |
| Dünner Kreis, dicker Kreis | Start und Ende |

Lesen: von links nach rechts entlang der Pfeile. Jeder Schritt liegt in genau einer Bahn. Ein Modellschritt liegt immer in der Bahn „KI-Agent“, eine feste Regel im „Workflow-System“, Freigabe und Versand bleiben beim Menschen.

Selbst zeichnen: in draw.io (diagrams.net, Formenbibliothek „BPMN 2.0“ aktivieren, speichert in Google Drive) oder direkt die `.bpmn`-Datei in <https://demo.bpmn.io> öffnen und verändern. Beide Werkzeuge sind kostenlos. Für die Projektablage genügt ein Export als PNG oder SVG im Drive-Ordner des Teams.

Der Übungsfall ist synthetisch. Keine Angabe beschreibt Zoi oder einen realen Kunden.
