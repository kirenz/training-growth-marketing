-- Aurenta: vorbereitete Leseabfragen für den normalen Postgres-Knoten in n8n.
-- Verbindung: aurenta_training. Keine Abfrage verändert Daten.

-- Genau ein Kontakt; die sieben Felder entsprechen dem Kontakt-Knoten im Starter.
SELECT kontakt_id, rolle, unternehmen, webinar_status, anliegen, sprache, kontakt_erlaubt
FROM uebungskontakte
WHERE kontakt_id = 'K-01';

-- Alle Entwicklungsfälle zur Übersicht. Im Starter weiterhin nur einen Fall verarbeiten.
SELECT * FROM uebungskontakte ORDER BY kontakt_id;

-- Die drei zusätzlichen Testfälle erst beim Vergleich am Mittwoch verwenden.
SELECT * FROM transferkontakte ORDER BY kontakt_id;

-- Fallwissen für eine spätere Erweiterung; der Starter enthält es bereits im Prompt.
SELECT titel, inhalt FROM fallwissen WHERE material_id = 'fallpaket';

-- Unabhängige synthetische Kampagnenzahlen, keine Aggregation der neun Kontakte.
SELECT kampagne, anmeldungen, teilnahmen, followups, antworten,
       gebuchte_gespraeche, qualifizierte_gespraeche,
       ROUND(100.0 * gebuchte_gespraeche / NULLIF(followups, 0), 1) AS buchungsquote_prozent
FROM kampagnen_kennzahlen ORDER BY kampagne;
