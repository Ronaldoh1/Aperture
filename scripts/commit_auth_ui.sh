#!/bin/bash

set -e

echo "🔍 Checking git status..."
git status

echo ""
read -p "Proceed with commit and push? (y/n): " CONFIRM

if [[ "$CONFIRM" != "y" ]]; then
  echo "❌ Aborted."
  exit 0
fi

COMMIT_MESSAGE="Auth UI: wire forgot password flow, fix SwiftUI inference, lock form sizing"

echo "📦 Staging changes..."
git add Aperture/Modules/Auth \
        Aperture/DesignSystem \
        Aperture/scripts

echo "📝 Committing..."
git commit -m "$COMMIT_MESSAGE"

echo "🚀 Pushing to current branch..."
git push

echo "✅ Done."
