#!/bin/zsh

set -e

PROJECT_NAME="Aperture"
DERIVED_DATA_DIR="$HOME/Library/Developer/Xcode/DerivedData"

echo "🧹 Cleaning DerivedData for project: $PROJECT_NAME"
echo "📂 DerivedData location: $DERIVED_DATA_DIR"
echo

if [ ! -d "$DERIVED_DATA_DIR" ]; then
  echo "⚠️ DerivedData directory does not exist yet (Xcode may not have built)."
  exit 0
fi

FOUND=false

for dir in "$DERIVED_DATA_DIR"/*; do
  if [[ -d "$dir" && "$(basename "$dir")" == ${PROJECT_NAME}-* ]]; then
    FOUND=true
    echo "🔥 Removing: $(basename "$dir")"
    rm -rf "$dir"
  fi
done

if [ "$FOUND" = false ]; then
  echo "✅ No DerivedData found for $PROJECT_NAME (already clean)."
else
  echo
  echo "✨ Done. DerivedData cleared for $PROJECT_NAME."
fi