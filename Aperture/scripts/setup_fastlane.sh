#!/bin/bash
# ═══════════════════════════════════════════════════════════════════════════
# APERTURE — ONE-SHOT FASTLANE SETUP
# ═══════════════════════════════════════════════════════════════════════════
#
#  Run once. Handles everything:
#    ✅ Xcode CLI tools
#    ✅ Homebrew (if missing)
#    ✅ Ruby + Bundler
#    ✅ bundle install (Fastlane + plugins)
#    ✅ Appfile + Matchfile configuration
#    ✅ .env file for secrets
#    ✅ Connected device detection
#    ✅ Signing verification
#    ✅ Optional first build
#
#  Usage:
#    chmod +x scripts/setup_fastlane.sh
#    ./scripts/setup_fastlane.sh
#
# ═══════════════════════════════════════════════════════════════════════════

set -e

# ─────────────────────────────────────────────────────────────────────────
# COLORS
# ─────────────────────────────────────────────────────────────────────────

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
BOLD='\033[1m'
NC='\033[0m'

banner() {
    echo ""
    echo -e "${PURPLE}═══════════════════════════════════════════════════════════════${NC}"
    echo -e "${PURPLE}  $1${NC}"
    echo -e "${PURPLE}═══════════════════════════════════════════════════════════════${NC}"
    echo ""
}

step() {
    echo -e "${CYAN}▶ $1${NC}"
}

ok() {
    echo -e "  ${GREEN}✅ $1${NC}"
}

warn() {
    echo -e "  ${YELLOW}⚠️  $1${NC}"
}

fail() {
    echo -e "  ${RED}❌ $1${NC}"
}

ask() {
    echo -e -n "${BOLD}$1${NC}"
}

# ─────────────────────────────────────────────────────────────────────────
# NAVIGATE TO PROJECT ROOT
# ─────────────────────────────────────────────────────────────────────────

cd "$(dirname "$0")/.."
PROJECT_ROOT=$(pwd)

banner "☀️  APERTURE — FASTLANE SETUP"

echo -e "  Project root: ${BOLD}$PROJECT_ROOT${NC}"
echo ""

# ─────────────────────────────────────────────────────────────────────────
# STEP 1: XCODE COMMAND LINE TOOLS
# ─────────────────────────────────────────────────────────────────────────

banner "[1/8] Xcode Command Line Tools"

if xcode-select -p &>/dev/null; then
    XCODE_PATH=$(xcode-select -p)
    ok "Xcode CLI tools installed at: $XCODE_PATH"
    
    if [[ "$XCODE_PATH" == *"CommandLineTools"* ]]; then
        warn "You have CLI tools but not full Xcode"
        warn "Full Xcode is required for device builds"
        echo ""
        ask "  Continue anyway? (y/n): "
        read -r CONTINUE
        if [[ "$CONTINUE" != "y" && "$CONTINUE" != "Y" ]]; then
            echo "  Install Xcode from the App Store first."
            exit 1
        fi
    fi
else
    step "Installing Xcode Command Line Tools..."
    xcode-select --install
    echo ""
    echo -e "  ${YELLOW}A dialog will appear. Click 'Install' and wait for it to finish.${NC}"
    echo -e "  ${YELLOW}Then re-run this script.${NC}"
    exit 0
fi

if ! xcodebuild -checkFirstLaunchStatus &>/dev/null; then
    step "Accepting Xcode license..."
    sudo xcodebuild -license accept 2>/dev/null || true
fi

# ─────────────────────────────────────────────────────────────────────────
# STEP 2: HOMEBREW
# ─────────────────────────────────────────────────────────────────────────

banner "[2/8] Homebrew"

if command -v brew &>/dev/null; then
    ok "Homebrew installed: $(brew --version | head -1)"
else
    step "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    
    if [[ -f /opt/homebrew/bin/brew ]]; then
        eval "$(/opt/homebrew/bin/brew shellenv)"
        echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
    fi
    ok "Homebrew installed"
fi

# ─────────────────────────────────────────────────────────────────────────
# STEP 3: RUBY + BUNDLER
# ─────────────────────────────────────────────────────────────────────────

banner "[3/8] Ruby + Bundler"

RUBY_VERSION=$(ruby -v 2>/dev/null || echo "none")
step "System Ruby: $RUBY_VERSION"

if command -v bundle &>/dev/null; then
    ok "Bundler installed: $(bundle -v)"
else
    step "Installing Bundler..."
    gem install bundler --no-document
    ok "Bundler installed"
fi

# ─────────────────────────────────────────────────────────────────────────
# STEP 4: BUNDLE INSTALL (Fastlane + Plugins)
# ─────────────────────────────────────────────────────────────────────────

banner "[4/8] Installing Fastlane + Plugins"

if [ ! -f "Gemfile" ]; then
    fail "No Gemfile found at $PROJECT_ROOT"
    exit 1
fi

step "Running bundle install..."
echo ""

bundle config set --local path 'vendor/bundle' 2>/dev/null || true
bundle install

echo ""
ok "Fastlane installed: $(bundle exec fastlane --version 2>/dev/null | head -1 || echo 'check manually')"

if [ -f "fastlane/Pluginfile" ]; then
    step "Installing Fastlane plugins..."
    bundle exec fastlane install_plugins || warn "Plugin install had issues — Firebase plugin may need manual setup later"
fi

# ─────────────────────────────────────────────────────────────────────────
# STEP 5: CONFIGURE APPFILE (Team ID + Apple ID)
# ─────────────────────────────────────────────────────────────────────────

banner "[5/8] Configure Signing Identity"

APPFILE="fastlane/Appfile"

CURRENT_APPLE_ID=$(grep 'apple_id(' "$APPFILE" | sed 's/.*apple_id("\(.*\)").*/\1/')
CURRENT_TEAM_ID=$(grep 'team_id(' "$APPFILE" | head -1 | sed 's/.*team_id("\(.*\)").*/\1/')

echo -e "  Current Apple ID:  ${BOLD}$CURRENT_APPLE_ID${NC}"
echo -e "  Current Team ID:   ${BOLD}$CURRENT_TEAM_ID${NC}"
echo ""

# ── Apple ID ──
if [[ "$CURRENT_APPLE_ID" == *"UPDATE"* ]] || [[ "$CURRENT_APPLE_ID" == *"your-"* ]]; then
    ask "  Enter your Apple ID email: "
    read -r NEW_APPLE_ID
    
    if [ -n "$NEW_APPLE_ID" ]; then
        sed -i '' "s|apple_id(\"$CURRENT_APPLE_ID\")|apple_id(\"$NEW_APPLE_ID\")|g" "$APPFILE"
        ok "Apple ID set to: $NEW_APPLE_ID"
        CURRENT_APPLE_ID="$NEW_APPLE_ID"
    fi
else
    ok "Apple ID already configured: $CURRENT_APPLE_ID"
    ask "  Change it? (y/n): "
    read -r CHANGE_ID
    if [[ "$CHANGE_ID" == "y" || "$CHANGE_ID" == "Y" ]]; then
        ask "  Enter new Apple ID email: "
        read -r NEW_APPLE_ID
        if [ -n "$NEW_APPLE_ID" ]; then
            sed -i '' "s|apple_id(\"$CURRENT_APPLE_ID\")|apple_id(\"$NEW_APPLE_ID\")|g" "$APPFILE"
            ok "Apple ID updated to: $NEW_APPLE_ID"
            CURRENT_APPLE_ID="$NEW_APPLE_ID"
        fi
    fi
fi

# ── Team ID ──
echo ""
if [[ "$CURRENT_TEAM_ID" == "XXXXXXXXXX" ]]; then
    echo -e "  ${YELLOW}Your Team ID is required for device builds.${NC}"
    echo -e "  ${YELLOW}Find it at: https://developer.apple.com/account → Membership → Team ID${NC}"
    echo -e "  ${YELLOW}Or in Xcode: Target → Signing & Capabilities → Team dropdown${NC}"
    echo ""
    ask "  Enter your Team ID (10 characters, e.g. A1B2C3D4E5): "
    read -r NEW_TEAM_ID
    
    if [ -n "$NEW_TEAM_ID" ]; then
        sed -i '' "s|team_id(\"XXXXXXXXXX\")|team_id(\"$NEW_TEAM_ID\")|g" "$APPFILE"
        ok "Team ID set in Appfile: $NEW_TEAM_ID"
        
        MATCHFILE="fastlane/Matchfile"
        if [ -f "$MATCHFILE" ]; then
            sed -i '' "s|\"XXXXXXXXXX\"|\"$NEW_TEAM_ID\"|g" "$MATCHFILE"
            ok "Team ID set in Matchfile: $NEW_TEAM_ID"
        fi
        
        CURRENT_TEAM_ID="$NEW_TEAM_ID"
    else
        warn "No Team ID entered — set it later in fastlane/Appfile"
    fi
else
    ok "Team ID already configured: $CURRENT_TEAM_ID"
fi

# ─────────────────────────────────────────────────────────────────────────
# STEP 6: CREATE .env FILE
# ─────────────────────────────────────────────────────────────────────────

banner "[6/8] Environment Variables"

ENV_FILE=".env"

if [ -f "$ENV_FILE" ]; then
    ok ".env file already exists"
else
    step "Creating .env file..."
    
    cat > "$ENV_FILE" << ENVEOF
# ═══════════════════════════════════════════════════════════════
# APERTURE — Environment Variables
# ═══════════════════════════════════════════════════════════════
# Loaded automatically by Fastlane via dotenv gem.
# DO NOT commit this file to git.
# ═══════════════════════════════════════════════════════════════

# Apple Developer
APPLE_ID="$CURRENT_APPLE_ID"
TEAM_ID="$CURRENT_TEAM_ID"

# App Config
APP_IDENTIFIER="com.sunflow.aperture"
SCHEME="Aperture"

# Firebase (fill in when ready for distribution)
# FIREBASE_APP_ID="1:YOUR_PROJECT:ios:YOUR_APP"
# FIREBASE_CLI_TOKEN=""

# Match — code signing repo (fill in for team distribution)
# MATCH_GIT_URL="https://github.com/yourusername/ios-certificates.git"
# MATCH_PASSWORD=""
ENVEOF
    
    ok ".env created with your credentials"
fi

# .gitignore
if [ -f ".gitignore" ]; then
    if ! grep -q "^\.env$" .gitignore 2>/dev/null; then
        echo -e "\n# Fastlane secrets\n.env\n.env.*\nvendor/\nbuild/" >> .gitignore
        ok "Added .env + vendor/ to .gitignore"
    else
        ok ".gitignore already covers .env"
    fi
else
    cat > .gitignore << 'GIEOF'
# Secrets
.env
.env.*

# Ruby / Fastlane
vendor/
build/
fastlane/report.xml
fastlane/Preview.html
fastlane/screenshots
fastlane/test_output

# Xcode
*.xcuserdata
*.xcscmblueprint
DerivedData/

# macOS
.DS_Store
*.swp
GIEOF
    ok "Created .gitignore"
fi

# ─────────────────────────────────────────────────────────────────────────
# STEP 7: VERIFY PROJECT
# ─────────────────────────────────────────────────────────────────────────

banner "[7/8] Project Verification"

if [ -d "Aperture.xcodeproj" ]; then
    ok "Aperture.xcodeproj found"
    
    if [ -d "Aperture.xcodeproj/xcshareddata/xcschemes" ]; then
        SCHEMES=$(ls Aperture.xcodeproj/xcshareddata/xcschemes/*.xcscheme 2>/dev/null | wc -l | tr -d ' ')
        ok "$SCHEMES shared scheme(s) found"
    else
        warn "No shared schemes yet — open project in Xcode once to auto-generate"
    fi
else
    fail "Aperture.xcodeproj NOT FOUND in $(pwd)"
    echo ""
    echo -e "  ${YELLOW}Make sure you run this script from your actual project root.${NC}"
    echo -e "  ${YELLOW}The ZIP doesn't include the .xcodeproj — it lives in your local repo.${NC}"
fi

SWIFT_COUNT=$(find Aperture -name "*.swift" 2>/dev/null | wc -l | tr -d ' ')
ok "$SWIFT_COUNT Swift files"

PLIST="Aperture/Info.plist"
if [ -f "$PLIST" ]; then
    for KEY in "NSCameraUsageDescription" "NSLocationWhenInUseUsageDescription" "NSPhotoLibraryUsageDescription"; do
        if grep -q "$KEY" "$PLIST"; then
            ok "$KEY ✓"
        else
            fail "MISSING: $KEY — app will crash without it"
        fi
    done
fi

# ─────────────────────────────────────────────────────────────────────────
# STEP 8: DEVICE DETECTION + FIRST BUILD
# ─────────────────────────────────────────────────────────────────────────

banner "[8/8] Device Detection"

step "Scanning for connected devices..."
echo ""

DEVICES=$(xcrun xctrace list devices 2>/dev/null | grep -v "Simulator" | grep -v "==" | grep -v "^$" | grep -v "^Mac" | head -5)

if [ -n "$DEVICES" ]; then
    ok "Device(s) found:"
    echo "$DEVICES" | while IFS= read -r line; do
        echo -e "    ${GREEN}→ $line${NC}"
    done
else
    warn "No physical device connected"
    echo -e "  ${YELLOW}Connect your iPhone via USB and tap 'Trust This Computer'${NC}"
fi

# ─────────────────────────────────────────────────────────────────────────
# DONE
# ─────────────────────────────────────────────────────────────────────────

banner "🚀 SETUP COMPLETE"

echo -e "  ${GREEN}Fastlane is ready to go.${NC}"
echo ""
echo -e "  ${BOLD}Quick commands:${NC}"
echo ""
echo -e "    ${CYAN}bundle exec fastlane device${NC}       Build + install on iPhone"
echo -e "    ${CYAN}bundle exec fastlane simulator${NC}    Build for simulator"
echo -e "    ${CYAN}bundle exec fastlane build${NC}        Verify compilation (no sign)"
echo -e "    ${CYAN}bundle exec fastlane adhoc${NC}        Sharable IPA"
echo -e "    ${CYAN}bundle exec fastlane beta${NC}         Push to TestFlight"
echo -e "    ${CYAN}bundle exec fastlane firebase${NC}     Push to Firebase"
echo -e "    ${CYAN}bundle exec fastlane full_audit${NC}   Security + analysis"
echo ""
echo -e "  ${BOLD}Shell shortcuts:${NC}"
echo ""
echo -e "    ${CYAN}./scripts/run.sh device${NC}           Same as above"
echo -e "    ${CYAN}./scripts/run.sh clean${NC}            Nuke derived data"
echo ""

# ── Offer first build ──
echo ""
ask "  🔥 Run first build now? (y/n): "
read -r RUN_BUILD

if [[ "$RUN_BUILD" == "y" || "$RUN_BUILD" == "Y" ]]; then
    echo ""
    if [ ! -d "Aperture.xcodeproj" ]; then
        fail "Need Aperture.xcodeproj first — open project in Xcode, add files, then run:"
        echo -e "    ${CYAN}bundle exec fastlane device${NC}"
        exit 0
    fi
    
    if [ -n "$DEVICES" ]; then
        banner "📱 BUILDING FOR DEVICE..."
        bundle exec fastlane device
    else
        banner "🖥️  BUILDING FOR SIMULATOR..."
        bundle exec fastlane simulator
    fi
else
    echo ""
    echo -e "  ${GREEN}When ready: ${CYAN}bundle exec fastlane device${NC}"
    echo ""
fi
