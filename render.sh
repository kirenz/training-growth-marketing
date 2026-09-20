#!/bin/sh
# Kurswebsite und Aurenta-Teilprojekt rendern. Reihenfolge wichtig: Der Haupt-Render leert _site/,
# deshalb kommt Aurenta danach.
set -e
cd "$(dirname "$0")"
quarto render
(cd aurenta && quarto render)
echo "Fertig: _site/ (Kurs) und _site/aurenta/ (Aurenta-Website)"
