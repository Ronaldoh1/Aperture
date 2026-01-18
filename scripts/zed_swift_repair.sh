#!/usr/bin/env bash
set -euo pipefail

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
ZED_DIR="$HOME/.config/zed"
ZED_SETTINGS="$ZED_DIR/settings.json"
BACKUP_DIR="$ZED_DIR/backups"
TS="$(date +"%Y%m%d_%H%M%S")"

mkdir -p "$BACKUP_DIR" "$ZED_DIR"

# Backup settings
if [ -f "$ZED_SETTINGS" ]; then
  cp "$ZED_SETTINGS" "$BACKUP_DIR/settings.json.$TS.bak"
fi

# Keep diagnostics ON (errors + warnings + hints all allowed)
# If you prefer "errors only", change "hint" -> "error"
cat > "$ZED_SETTINGS" <<'JSON'
{
  "diagnostics_max_severity": "hint",
  "languages": {
    "Swift": {
      "enable_language_server": true
    }
  }
}
JSON

echo "✅ Zed: Swift language server enabled, diagnostics on"

# Clear Zed caches (best effort)
rm -rf "$HOME/Library/Caches/Zed" 2>/dev/null || true
rm -rf "$HOME/Library/Application Support/Zed/Indexed" 2>/dev/null || true
echo "✅ Cleared Zed caches (best effort)"

# Clear Xcode DerivedData
rm -rf "$HOME/Library/Developer/Xcode/DerivedData"/* 2>/dev/null || true
echo "✅ Cleared Xcode DerivedData"

cd "$PROJECT_ROOT"

# Resolve Swift packages and build once so SourceKit has a clean compile context
if [ -d "Aperture.xcworkspace" ]; then
  echo "📦 Resolving packages (workspace)..."
  xcodebuild -workspace "Aperture.xcworkspace" -scheme "Aperture" -resolvePackageDependencies >/dev/null
  echo "🏗️ Building (workspace)..."
  xcodebuild -workspace "Aperture.xcworkspace" -scheme "Aperture" -sdk iphonesimulator build >/dev/null
elif [ -d "Aperture.xcodeproj" ]; then
  echo "📦 Resolving packages (project)..."
  xcodebuild -project "Aperture.xcodeproj" -scheme "Aperture" -resolvePackageDependencies >/dev/null
  echo "🏗️ Building (project)..."
  xcodebuild -project "Aperture.xcodeproj" -scheme "Aperture" -sdk iphonesimulator build >/dev/null
else
  echo "❌ Could not find Aperture.xcodeproj or Aperture.xcworkspace in $PROJECT_ROOT"
  exit 1
fi

echo ""
echo "Done."
echo "Now: Quit Zed completely and reopen the Aperture folder."
echo "If RootTabView is still 'not in scope', it is almost certainly target membership."
echo "Restore settings backup: cp \"$BACKUP_DIR/settings.json.$TS.bak\" \"$ZED_SETTINGS\""
