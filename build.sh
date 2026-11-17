#!/usr/bin/env bash
# Render the Mermaid diagrams to SVG, then build a deck. Needs network access only the
# first time npx fetches the pinned tools; the built deck is fully offline.
#
# Usage: build.sh [--pdf] [FILE.md]
#   FILE.md  Marp source to build (default: deck.md next to this script). Outputs are written
#            next to it with the same name: FILE.html, and FILE.pdf with --pdf.
set -euo pipefail

usage() { echo "usage: $0 [--pdf] [FILE.md]" >&2; exit 2; }

pdf=false
input=""
for arg in "$@"; do
  case "$arg" in
    --pdf) pdf=true ;;
    -h|--help) usage ;;
    -*) echo "unknown option: $arg" >&2; usage ;;
    *) [[ -z "$input" ]] || usage; input="$arg" ;;
  esac
done

here="$(cd "$(dirname "$0")" && pwd)"
input="${input:-$here/deck.md}"
[[ -f "$input" ]] || { echo "no such file: $input" >&2; exit 1; }
[[ "$input" == *.md ]] || { echo "not a Markdown file: $input" >&2; exit 1; }
stem="${input%.md}"

MMDC="npx --yes @mermaid-js/mermaid-cli@12.2.0"
MARP="npx --yes @marp-team/marp-cli@4.3.1"
THEME="$here/rose-pine-moon.css"

mkdir -p "$here/assets"
shopt -s nullglob
for src in "$here"/diagrams/*.mmd; do
  name="$(basename "$src" .mmd)"
  $MMDC -i "$src" -o "$here/assets/$name.svg" -c "$here/diagrams/mermaid-config.json" \
    -b transparent -q
done

# Fill in {{DATE}} with the build date. The rendered copy sits next to the input so
# relative asset paths still resolve.
rendered="$stem.rendered.md"
trap 'rm -f "$rendered"' EXIT
sed "s/{{DATE}}/$(date '+%B %-d, %Y')/g" "$input" > "$rendered"

$MARP "$rendered" --theme-set "$THEME" --allow-local-files -o "$stem.html"
if $pdf; then
  $MARP "$rendered" --theme-set "$THEME" --allow-local-files --pdf -o "$stem.pdf"
fi
