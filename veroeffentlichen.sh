#!/bin/sh
# Website bauen und auf GitHub Pages veröffentlichen.
#
#   ./veroeffentlichen.sh
#
# Das Skript wechselt selbst ins Projektverzeichnis. Es baut zuerst beide Quarto-Projekte
# (Kurswebsite und Aurenta) und veröffentlicht danach den fertigen Stand mit --no-render.
# Ohne --no-render würde Quarto selbst rendern, dabei _site leeren und die Aurenta-Seiten
# von der veröffentlichten Website entfernen.
set -e
cd "$(dirname "$0")"

./render.sh
quarto publish gh-pages --no-prompt --no-render

echo
echo "Online: https://kirenz.github.io/training-growth-marketing/"
