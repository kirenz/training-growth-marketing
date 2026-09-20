#!/bin/sh
# Einen Blocktag für die Studierenden freischalten.
#
#   ./freischalten.sh dienstag
#   ./freischalten.sh mittwoch
#
# Schaltet die Tagesseite, die zugehörigen Folien und das Material dieses Tages frei,
# baut die Website neu und, beim Mittwoch, das Starterpaket mit den Transfer-Testfällen.
#
# Danach veröffentlichen:  quarto publish gh-pages --no-prompt
# Rückgängig, solange nichts veröffentlicht ist:  git checkout -- . && git clean -fd
set -e
cd "$(dirname "$0")"

TAG="$1"
case "$TAG" in
  dienstag|mittwoch) ;;
  *) echo "Aufruf: ./freischalten.sh dienstag|mittwoch"; exit 1 ;;
esac

python3 - "$TAG" <<'PYEOF'
import sys, os, pathlib

tag = sys.argv[1]

DATEIEN = {
    "dienstag": [("tage/_dienstag.qmd", "tage/dienstag.qmd"),
                 ("slides/_tag2-briefing.qmd", "slides/tag2-briefing.qmd")],
    "mittwoch": [("tage/_mittwoch.qmd", "tage/mittwoch.qmd"),
                 ("slides/_tag3-testen.qmd", "slides/tag3-testen.qmd")],
}

ERSETZUNGEN = {
"dienstag": [
 ("index.qmd",
  "| Dienstag, 22.09. | Briefing durch Zoi um 10 Uhr, Projektbrief, Ablaufskizze, Ausbau des Workflows | wird am Morgen freigeschaltet |",
  "| Dienstag, 22.09. | Briefing durch Zoi um 10 Uhr, Projektbrief, Ablaufskizze, Ausbau des Workflows | [Zum Tag](tage/dienstag.html) |"),
 ("tage/montag.qmd",
  "Wie es am Dienstag weitergeht, sehen wir am Dienstagmorgen.",
  "[**Weiter zum Dienstag: Vom Übungsfall zum Zoi-Auftrag**](dienstag.qmd)"),
 ("materialien.qmd",
  "| Projektbrief | wird am Dienstag freigeschaltet |",
  "| [Projektbrief](https://docs.google.com/document/d/1Jwbhg5CbI-mxCJvRw1oSLBkLR7ZoPOQrwN0jsluFtIM/edit) | Dienstag: Zuschnitt nach dem Zoi-Briefing |"),
 ("materialien.qmd",
  "| Ablaufskizze: Lesehilfe und Aurenta-Beispiel | wird am Dienstag freigeschaltet |",
  "| [Ablaufskizze: Lesehilfe und Aurenta-Beispiel](https://docs.google.com/document/d/1pO28YSUSkvbrn8drNZqMMVqimBHT2fiyT0LEfXeF_tY/edit) | Dienstag: Swimlane-Diagramm für Übung 2.2, Beispiel [heute](material/prozess/aurenta-webinar-ist.svg) und [mit KI-Agent](material/prozess/aurenta-webinar-soll.svg), BPMN-Dateien zum Öffnen in demo.bpmn.io |"),
],
"mittwoch": [
 ("index.qmd",
  "| Mittwoch, 23.09. | Testfälle, Vergleich mit einer einfachen Lösung, Live-Demo, Start ins Semesterprojekt | wird am Morgen freigeschaltet |",
  "| Mittwoch, 23.09. | Testfälle, Vergleich mit einer einfachen Lösung, Live-Demo, Start ins Semesterprojekt | [Zum Tag](tage/mittwoch.html) |"),
 ("tage/dienstag.qmd",
  "Wie es am Mittwoch weitergeht, sehen wir am Mittwochmorgen.",
  "[**Weiter zum Mittwoch: Testen, vergleichen und übergeben**](mittwoch.qmd)"),
 ("materialien.qmd",
  "| Zusätzliche Testfälle T-01 bis T-03 | wird am Mittwoch freigeschaltet |",
  "| [Zusätzliche Testfälle T-01 bis T-03](material/daten/testfaelle-transfer.csv) | Erst am Mittwoch für den zusätzlichen Vergleich verwenden |"),
 ("materialien.qmd",
  "| Experimentkarte, ausführliche Fassung mit Testdesign | wird am Mittwoch freigeschaltet |",
  "| [Experimentkarte](https://docs.google.com/document/d/1JrrMgJ6fCEae3trCWNqdAonEc9EHbZ-PWskl8wtli-s/edit) | Ausführliche Fassung mit Testdesign, ab Mittwoch |"),
],
}

# 1. Quelldateien sichtbar machen
schon_da = True
for src, dst in DATEIEN[tag]:
    if os.path.exists(dst):
        continue
    if not os.path.exists(src):
        sys.exit(f"Fehler: weder {src} noch {dst} gefunden.")
    os.rename(src, dst)
    schon_da = False
    print("freigegeben:", dst)

# 2. Renderliste und Navigation
p = pathlib.Path("_quarto.yml")
s = p.read_text(encoding="utf-8")
neu = "\n".join(z[len(f"#FREI:{tag}"):] if z.startswith(f"#FREI:{tag}") else z
                for z in s.split("\n"))
if neu != s:
    p.write_text(neu, encoding="utf-8")
    print("Renderliste und Navigation aktualisiert.")

# 3. Verweise auf den Seiten
for datei, alt, neu_text in ERSETZUNGEN[tag]:
    f = pathlib.Path(datei)
    if not f.exists():
        continue
    t = f.read_text(encoding="utf-8")
    if alt in t:
        f.write_text(t.replace(alt, neu_text, 1), encoding="utf-8")
        print("aktualisiert:", datei)

if schon_da:
    print(f"Hinweis: {tag} war bereits freigeschaltet.")
PYEOF

if [ "$TAG" = "mittwoch" ]; then
  ./paket-bauen.sh
fi

./render.sh
echo
echo "$TAG ist freigeschaltet. Jetzt veröffentlichen:"
echo "  quarto publish gh-pages --no-prompt"
