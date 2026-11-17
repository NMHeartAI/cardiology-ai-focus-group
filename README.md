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
uv tool install jupyter-book==2.1.7   # once
./build-site.sh                        # build the slides into slides/
jupyter-book start                     # serve the book at http://localhost:3000
```

Book pages reload as you save. After editing a deck in `marp/`, run `./build-site.sh` again (the
server can keep running) and reload the browser page.

Meeting pages embed slides with a site-root path (`/slides/YYYY-MM-DD.html`), so the preview shows
your local slides. `plugins/base-url.mjs` adds the repository's base path to that address when the
deploy workflow sets `BASE_URL`.

`.gitignore` ignores everything by default; add a file to its allow-list before committing it.
