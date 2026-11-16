#!/bin/sh
# Kurswebsite und Aurenta-Teilprojekt rendern. Reihenfolge wichtig: Der Haupt-Render leert _site/,
# deshalb kommt Aurenta danach.
set -e
cd "$(dirname "$0")"
quarto render
(cd aurenta && quarto render)
# PDF je verlinktem Deck, Link „PDF“ neben jeder Folienzeile (Tagesseiten).
set --
for f in _site/tage/*.html; do set -- "$@" --index "$f"; done
uv run --no-project --with playwright --with pypdf python scripts/deck_pdf.py "$@"
echo "Fertig: _site/ (Kurs) und _site/aurenta/ (Aurenta-Website)"
