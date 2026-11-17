# Cardiology AI Focus Group

Slides for the Cardiology in AI focus group, published at
<https://nmheartai.github.io/cardiology-ai-focus-group/>. Speaker notes are in HTML comments; press
`p` in the published deck for presenter view.

- `focus-group.md`: Marp source.
- `rose-pine-moon.css`: the [Rosé Pine Moon](https://github.com/rainbowflesh/Rose-Pine-For-Marp)
  Marp theme by rainbowflesh (MIT), vendored unchanged; deck-specific tweaks live in
  `focus-group.md`.
- `build.sh`: builds `focus-group.html` (`./build.sh --pdf focus-group.md` also builds the PDF).
  Any `{{DATE}}` in the source is replaced with the build date.
- `.github/workflows/pages.yml`: on every push to `main`, builds the deck and deploys it to GitHub
  Pages, so the date on the title slide is the deploy date.

`.gitignore` ignores everything by default; add a file to its allow-list before committing it.
