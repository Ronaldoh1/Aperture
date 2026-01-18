#!/usr/bin/env bash
set -euo pipefail

# ----------------------------
# Switches
# ----------------------------
DISABLE_SWIFT_LSP_ONLY=true     # true: kills Swift language server in Zed (no squiggles, no autocomplete)
HIDE_DIAGNOSTICS_GLOBALLY=false # true: disables diagnostics for all languages in Zed
CLEAR_DERIVED_DATA=true         # true: clears Xcode DerivedData
RESET_ZED_CACHE=true            # true: clears Zed caches (safe, but resets some local state)
RESOLVE_SPM=true                # true: resolves Swift Package Manager deps for the project

# ----------------------------
# Paths
# ----------------------------
PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
ZED_DIR="$HOME/.config/zed"
ZED_SETTINGS="$ZED_DIR/settings.json"
BACKUP_DIR="$ZED_DIR/backups"
TS="$(date +"%Y%m%d_%H%M%S")"

mkdir -p "$BACKUP_DIR"

echo "📌 Project: $PROJECT_ROOT"
echo "📌 Zed settings: $ZED_SETTINGS"

# ----------------------------
# Backup Zed settings
# ----------------------------
if [ -f "$ZED_SETTINGS" ]; then
  cp "$ZED_SETTINGS" "$BACKUP_DIR/settings.json.$TS.bak"
  echo "✅ Backed up settings.json to $BACKUP_DIR/settings.json.$TS.bak"
else
  mkdir -p "$ZED_DIR"
  echo "{}" > "$ZED_SETTINGS"
  echo "✅ Created new settings.json"
fi

# ----------------------------
# Update Zed settings safely (no jq required)
# We overwrite with a small, controlled JSON file.
# If you already have lots of settings, we keep them in the backup.
# ----------------------------
if [ "$HIDE_DIAGNOSTICS_GLOBALLY" = true ]; then
  cat > "$ZED_SETTINGS" <<'JSON'
{
  "diagnostics_max_severity": "off"
}
JSON
  echo "✅ Zed: diagnostics disabled globally"
elif [ "$DISABLE_SWIFT_LSP_ONLY" = true ]; then
  cat > "$ZED_SETTINGS" <<'JSON'
{
  "languages": {
    "Swift": {
      "enable_language_server": false
    }
  }
}
JSON
  echo "✅ Zed: Swift language server disabled (no Swift squiggles)"
else
  cat > "$ZED_SETTINGS" <<'JSON'
{
  "diagnostics_max_severity": "error"
}
JSON
  echo "✅ Zed: showing only errors (warnings and hints hidden)"
fi

# ----------------------------
# Clear Zed caches (optional)
# ----------------------------
if [ "$RESET_ZED_CACHE" = true ]; then
  # Typical cache locations on macOS
  rm -rf "$HOME/Library/Caches/Zed" 2>/dev/null || true
  rm -rf "$HOME/Library/Application Support/Zed/Indexed" 2>/dev/null || true
  echo "✅ Cleared Zed caches (best effort)"
fi

# ----------------------------
# Clear DerivedData (optional)
# ----------------------------
if [ "$CLEAR_DERIVED_DATA" = true ]; then
  rm -rf "$HOME/Library/Developer/Xcode/DerivedData"/* 2>/dev/null || true
  echo "✅ Cleared Xcode DerivedData"
fi

# ----------------------------
# Resolve Swift packages (optional)
# ----------------------------
if [ "$RESOLVE_SPM" = true ]; then
  cd "$PROJECT_ROOT"

  if [ -d "Aperture.xcodeproj" ]; then
    echo "📦 Resolving Swift packages (xcodebuild -resolvePackageDependencies)..."
    xcodebuild -project "Aperture.xcodeproj" -scheme "Aperture" -resolvePackageDependencies >/dev/null
    echo "✅ Swift packages resolved"
  elif [ -d "Aperture.xcworkspace" ]; then
    echo "📦 Resolving Swift packages for workspace..."
    xcodebuild -workspace "Aperture.xcworkspace" -scheme "Aperture" -resolvePackageDependencies >/dev/null
    echo "✅ Swift packages resolved"
  else
    echo "⚠️ Could not find Aperture.xcodeproj or Aperture.xcworkspace in $PROJECT_ROOT"
  fi
fi

echo ""
echo "Done."
echo "Next:"
echo "  1) Quit Zed completely"
echo "  2) Reopen the Aperture folder in Zed"
echo ""
echo "If you want to restore your previous Zed settings:"
echo "  cp \"$BACKUP_DIR/settings.json.$TS.bak\" \"$ZED_SETTINGS\""
