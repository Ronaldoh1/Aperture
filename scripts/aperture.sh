#!/usr/bin/env bash
set -euo pipefail

PROJECT_NAME="Aperture"
SCHEME="Aperture"
PROJ="Aperture.xcodeproj"
WORKSPACE="Aperture.xcworkspace"

has_cmd() { command -v "$1" >/dev/null 2>&1; }

xcb() {
  if [ -d "$WORKSPACE" ]; then
    xcodebuild -workspace "$WORKSPACE" -scheme "$SCHEME" "$@"
  else
    xcodebuild -project "$PROJ" -scheme "$SCHEME" "$@"
  fi
}

pretty() {
  if has_cmd xcpretty; then xcpretty; else cat; fi
}

usage() {
  echo ""
  echo "Aperture CLI"
  echo ""
  echo "  aperture commit \"message\""
  echo "  aperture run"
  echo "  aperture build"
  echo "  aperture dd"
  echo "  aperture vim"
  echo ""
}

case "${1:-}" in
  commit)
    msg="${2:-}"
    [ -z "$msg" ] && echo "Commit message required" && exit 1
    git add -A
    git commit -m "$msg"
    echo "Committed: $msg"
    ;;

  build)
    echo "Building Aperture…"
    xcb -sdk iphonesimulator build | pretty
    ;;

  run)
    echo "Running Aperture (build only)…"
    DEST="platform=iOS Simulator,name=iPhone 15"
    xcb -destination "$DEST" build | pretty
    ;;

  dd)
    echo "Deleting DerivedData…"
    rm -rf ~/Library/Developer/Xcode/DerivedData/*
    echo "Done."
    ;;

  vim)
    echo ""
    echo "────────────── VIM EXTENDED CHEAT SHEET ──────────────"
    echo ""
    echo "MODES"
    echo "  esc            normal mode"
    echo "  i / a / o      insert / append / new line"
    echo "  v / V / ctrl+v visual char / line / block"
    echo ""
    echo "MOVEMENT"
    echo "  h j k l        left down up right"
    echo "  w / b / e      word forward / back / end"
    echo "  0 / ^ / $      line start / first char / end"
    echo "  gg / G         top / bottom of file"
    echo "  :n             go to line n"
    echo ""
    echo "EDITING"
    echo "  x / X          delete char forward / back"
    echo "  dd / D         delete line / to end"
    echo "  yy / Y         yank line"
    echo "  p / P          paste after / before"
    echo "  r / R          replace char / overwrite"
    echo "  .              repeat last command"
    echo ""
    echo "UNDO / REDO"
    echo "  u              undo"
    echo "  ctrl+r         redo"
    echo ""
    echo "SEARCH & REPLACE"
    echo "  /text          search forward"
    echo "  ?text          search backward"
    echo "  n / N          next / prev match"
    echo "  :%s/a/b/g      replace all"
    echo "  :%s/a/b/gc     replace with confirm"
    echo ""
    echo "VISUAL MODE"
    echo "  > / <          indent / outdent"
    echo "  =              auto-indent"
    echo ""
    echo "WINDOWS & BUFFERS"
    echo "  :split         horizontal split"
    echo "  :vsplit        vertical split"
    echo "  ctrl+w h/j/k/l move between panes"
    echo "  :bd            close buffer"
    echo ""
    echo "FILES"
    echo "  :w             save"
    echo "  :wa            save all"
    echo "  :q             quit"
    echo "  :q!            force quit"
    echo "  :wq            save and quit"
    echo ""
    echo "──────────────────────────────────────────────────────"
    echo ""
    ;;

  *)
    usage
    ;;
esac
