"""Erzeugt aus gerenderten reveal.js-Decks je eine PDF (eine Seite je Folie, Endzustand).

Jede Folie wird wie im Browser gezeigt: alle Klickschritte aufgedeckt, Zähler
hochgezählt, ohne Steuerelemente und Sprechernotizen. Text bleibt markierbar.
Die PDF landet neben dem Deck (``deck.html`` -> ``deck.pdf``).

Aufruf:
    python scripts/deck_pdf.py DECK.html [DECK2.html ...]
    python scripts/deck_pdf.py --index _site/index.html [--index _site/wochen/w01.html ...]
Mit ``--index`` entstehen PDFs nur für die Decks, die auf diesen Seiten verlinkt
sind, und neben jeden Deck-Link kommt ein Link „PDF“ (class ``deck-pdf``, bei
Buttons zusätzlich deren Klassen).

Braucht ``playwright`` und ``pypdf``, lokal etwa:
    uv run --no-project --with playwright --with pypdf python scripts/deck_pdf.py ...
Ohne passendes Playwright-Chromium nimmt das Skript das installierte Google Chrome.
"""

from pathlib import Path
import argparse
import io
import re

from playwright.sync_api import sync_playwright
from pypdf import PdfReader, PdfWriter

W, H = 1600, 900
HIDE = """
.reveal .controls, .reveal .progress, .reveal .slide-number, .slide-menu-button,
.reveal .slide-chalkboard-buttons, .reveal aside.notes, .ba-timer button { display: none !important; }
.reveal .slides section .fragment { transition: none !important; }
"""
LINK = re.compile(r'<a\b[^>]*\bhref="([^"#?:]+)\.html"[^>]*>.*?</a>', re.S)
CLASS = re.compile(r'\bclass="([^"]*)"')


def is_deck(html: Path) -> bool:
    return html.is_file() and 'class="reveal' in html.read_text(encoding="utf-8", errors="ignore")


def deck_pdf(page, html: Path) -> Path:
    page.goto(html.resolve().as_uri())
    page.wait_for_function("window.Reveal && Reveal.isReady && Reveal.isReady()")
    page.add_style_tag(content=HIDE)
    page.evaluate("document.fonts.ready")
    page.emulate_media(media="screen")
    slides = page.evaluate(
        "Reveal.getSlides().map(s => { const i = Reveal.getIndices(s); return [i.h, i.v || 0]; })"
    )
    out = PdfWriter()
    for h, v in slides:
        page.evaluate(f"Reveal.slide({h}, {v}, -1)")
        animated = page.evaluate("""() => {
            let n = 0; while (Reveal.nextFragment() && n < 200) n++;
            return n > 0 || !!Reveal.getCurrentSlide().querySelector('[data-count]');
        }""")
        page.wait_for_timeout(1500 if animated else 250)
        pdf = page.pdf(width=f"{W}px", height=f"{H}px", print_background=True, page_ranges="1")
        out.add_page(PdfReader(io.BytesIO(pdf)).pages[0])
    target = html.with_suffix(".pdf")
    with target.open("wb") as fh:
        out.write(fh)
    return target


def link_index(index: Path, decks: list[Path]) -> None:
    """Decks aus den Links der Seite holen und neben jeden Link einen PDF-Link setzen."""
    text = index.read_text(encoding="utf-8")

    def add(m: re.Match) -> str:
        html = (index.parent / f"{m.group(1)}.html").resolve()
        if not is_deck(html):
            return m.group(0)
        if html not in decks:
            decks.append(html)
        if f'href="{m.group(1)}.pdf"' in text:
            return m.group(0)
        # Buttons (Quarto: btn ...) bekommen einen PDF-Button im gleichen Stil.
        cls = CLASS.search(m.group(0).split(">", 1)[0])
        cls = f"{cls.group(1)} deck-pdf" if cls and "btn" in cls.group(1) else "deck-pdf"
        return f'{m.group(0)} <a class="{cls}" href="{m.group(1)}.pdf" download>PDF</a>'

    index.write_text(LINK.sub(add, text), encoding="utf-8")


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    parser.add_argument("decks", nargs="*", type=Path)
    parser.add_argument("--index", type=Path, action="append", default=[],
                        help="Seite mit Deck-Links (mehrfach möglich): PDFs nur für dort verlinkte Decks")
    args = parser.parse_args()
    decks = [d.resolve() for d in args.decks]
    for index in args.index:
        link_index(index, decks)
    if not decks:
        raise SystemExit("Keine Decks gefunden.")
    with sync_playwright() as pw:
        try:
            browser = pw.chromium.launch()
        except Exception:
            browser = pw.chromium.launch(channel="chrome")
        page = browser.new_page(viewport={"width": W, "height": H})
        for html in decks:
            target = deck_pdf(page, html)
            print(f"PDF: {target} ({len(PdfReader(target).pages)} Seiten)")
        browser.close()


if __name__ == "__main__":
    main()
