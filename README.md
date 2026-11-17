# Cardiology in AI Focus Group

Meeting notes and slides for the Cardiology in AI focus group, published as a
[Jupyter Book](https://jupyterbook.org/) at <https://nmheartai.github.io/cardiology-ai-focus-group/>.

- `myst.yml`: book configuration and table of contents.
- `index.md`: landing page, with the list of meetings.
- `meetings/YYYY-MM-DD.md`: one page per meeting; each embeds that meeting's slides.
- `marp/YYYY-MM-DD.md`: [Marp](https://marp.app/) slide decks. Speaker notes are in HTML comments;
  press `p` in the slides for presenter view.
- `rose-pine-moon.css`: the [Rosé Pine Moon](https://github.com/rainbowflesh/Rose-Pine-For-Marp)
  Marp theme by rainbowflesh (MIT), vendored unchanged.
- `build.sh`: builds one Marp deck to HTML (`./build.sh --pdf marp/2026-11-17.md` also builds a PDF).
  Any `{{DATE}}` in a deck is replaced with the build date.
- `build-site.sh`: builds every deck into `slides/`, then the book into `_build/html`.
- `.github/workflows/pages.yml`: on every push to `main`, builds the site and deploys it to
  GitHub Pages.

## Adding a meeting

1. Write the slides in `marp/YYYY-MM-DD.md`.
2. Copy `meetings/2026-11-17.md` to `meetings/YYYY-MM-DD.md` and change the date, subtitle and slide
   URLs.
3. Add the page to `toc` in `myst.yml` and to the list in `index.md`.

## Preview locally

```sh
pip install jupyter-book   # or: uv tool install jupyter-book
./build-site.sh
jupyter-book start
```

The meeting pages embed the slides from the live site, so the preview shows the deployed slides,
not local edits. To check local slide edits, open `slides/YYYY-MM-DD.html` directly.

`.gitignore` ignores everything by default; add a file to its allow-list before committing it.
