#!/usr/bin/env bash
# Build the website: each Marp deck in marp/ becomes slides/<name>.html, then Jupyter Book
# builds the site into _build/html. Needs jupyter-book on PATH (pip install jupyter-book).
#
# Usage: build-site.sh [jupyter-book build options]   e.g. build-site.sh --html
#   For a local preview, run `jupyter-book start` after this instead of build.
set -euo pipefail

here="$(cd "$(dirname "$0")" && pwd)"
cd "$here"

rm -rf slides
mkdir -p slides
for deck in marp/*.md; do
  ./build.sh "$deck"
  mv "${deck%.md}.html" "slides/$(basename "${deck%.md}").html"
done

if [[ $# -gt 0 ]]; then
  jupyter-book build "$@"
fi
