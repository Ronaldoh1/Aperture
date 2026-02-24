#!/bin/bash
# ============================================================
# setup_gitignore.sh
# Aperture — Generate/update .gitignore with logs & build dirs
# ============================================================

GITIGNORE=".gitignore"
MARKER="# ── Aperture auto-generated ──────────────────────────────"

# Create file if it doesn't exist
if [ ! -f "$GITIGNORE" ]; then
  touch "$GITIGNORE"
  echo "📄 Created $GITIGNORE"
else
  echo "📄 Updating existing $GITIGNORE"
fi

# Don't double-add if already present
if grep -qF "$MARKER" "$GITIGNORE"; then
  echo "✅ Aperture rules already present — nothing to do."
  exit 0
fi

cat >> "$GITIGNORE" << 'BLOCK'

# ── Aperture auto-generated ──────────────────────────────

# ── Xcode Build Folders ──────────────────────────────────
build/
DerivedData/
*.xcarchive
*.xcworkspace/xcuserdata/
*.xcodeproj/xcuserdata/
*.xcodeproj/project.xcworkspace/xcuserdata/
xcuserdata/

# ── Logs ─────────────────────────────────────────────────
*.log
logs/
log/
*.crash
*.ips
*.trace
CrashReporter/
DiagnosticReports/

# ── iOS / macOS Artifacts ─────────────────────────────────
*.ipa
*.dSYM
*.dSYM.zip
*.app.dSYM/
*.app/
Payload/
*.xcresult

# ── SPM / CocoaPods / Carthage ────────────────────────────
.build/
Pods/
Carthage/Build/
*.resolved          # keep Package.resolved? remove line if yes

# ── Simulators & Instruments ─────────────────────────────
*.siminfo
*.trace/

# ── OS & Editor Noise ────────────────────────────────────
.DS_Store
.DS_Store?
Thumbs.db
*.swp
*.swo
*~
.vscode/
.idea/
*.sublime-project
*.sublime-workspace

# ── Environment / Secrets ────────────────────────────────
.env
.env.*
secrets.xcconfig
GoogleService-Info.plist
firebase_credentials.json

# ── Temp & Cache ─────────────────────────────────────────
tmp/
.tmp/
.cache/
*.tmp

BLOCK

echo "✅ Rules added to $GITIGNORE"
echo ""
echo "── Preview of added rules ──────────────────────────────"
grep -A 999 "Aperture auto-generated" "$GITIGNORE"
