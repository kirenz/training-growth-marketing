#!/bin/sh
# Baut material/workflows/aurenta-n8n-starterpaket.zip neu.
# Die drei Transfer-Testfälle kommen nur ins Paket, wenn der Mittwoch freigeschaltet ist.
set -e
cd "$(dirname "$0")"

ZIP="$PWD/material/workflows/aurenta-n8n-starterpaket.zip"
TMP=$(mktemp -d)
mkdir -p "$TMP/daten" "$TMP/fall"

cp material/workflows/*.json material/workflows/*.md material/workflows/prompt-n8n.txt "$TMP/"
rm -f "$TMP/aurenta-n8n-starterpaket.zip"
cp material/daten/kampagnen.csv material/daten/kontakte-webinar.csv "$TMP/daten/"
cp material/fall/fallpaket-kompakt.txt "$TMP/fall/"

if [ -f tage/mittwoch.qmd ]; then
  cp material/daten/testfaelle-transfer.csv "$TMP/daten/"
  echo "Transfer-Testfälle enthalten (Mittwoch ist freigeschaltet)."
else
  echo "Ohne Transfer-Testfälle (Mittwoch noch gesperrt)."
fi

rm -f "$ZIP"
(cd "$TMP" && zip -q -r -X -D "$ZIP" . -x ".*")
rm -rf "$TMP"
unzip -l "$ZIP" | tail -2
