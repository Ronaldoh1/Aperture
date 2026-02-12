#!/bin/bash

# ═══════════════════════════════════════════════════════════════════════════
# APERTURE - Fastlane Setup Script
# ═══════════════════════════════════════════════════════════════════════════
#
# This script sets up Fastlane for TestFlight + Firebase App Distribution
#
# Usage: ./fastlane/setup.sh
#

set -e

echo "═══════════════════════════════════════════════════════════════════════════"
echo "🚀 APERTURE - Fastlane Setup"
echo "═══════════════════════════════════════════════════════════════════════════"
echo ""

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# ─────────────────────────────────────────────────────────────────────────────
# STEP 1: Check Prerequisites
# ─────────────────────────────────────────────────────────────────────────────

echo -e "${BLUE}Step 1: Checking prerequisites...${NC}"

# Check for Xcode
if ! command -v xcodebuild &> /dev/null; then
    echo -e "${RED}❌ Xcode not found. Please install Xcode from the App Store.${NC}"
    exit 1
fi
echo "✅ Xcode installed"

# Check for Homebrew
if ! command -v brew &> /dev/null; then
    echo -e "${YELLOW}⚠️  Homebrew not found. Installing...${NC}"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
echo "✅ Homebrew installed"

# ─────────────────────────────────────────────────────────────────────────────
# STEP 2: Install Fastlane
# ─────────────────────────────────────────────────────────────────────────────

echo ""
echo -e "${BLUE}Step 2: Installing Fastlane...${NC}"

if ! command -v fastlane &> /dev/null; then
    brew install fastlane
else
    echo "✅ Fastlane already installed ($(fastlane --version | head -1))"
fi

# ─────────────────────────────────────────────────────────────────────────────
# STEP 3: Install Firebase CLI
# ─────────────────────────────────────────────────────────────────────────────

echo ""
echo -e "${BLUE}Step 3: Installing Firebase CLI...${NC}"

if ! command -v firebase &> /dev/null; then
    brew install firebase-cli
else
    echo "✅ Firebase CLI already installed"
fi

# ─────────────────────────────────────────────────────────────────────────────
# STEP 4: Install Fastlane Plugins
# ─────────────────────────────────────────────────────────────────────────────

echo ""
echo -e "${BLUE}Step 4: Installing Fastlane plugins...${NC}"

cd "$(dirname "$0")/.."

# Install Firebase plugin
fastlane add_plugin firebase_app_distribution 2>/dev/null || true
echo "✅ Firebase App Distribution plugin ready"

# ─────────────────────────────────────────────────────────────────────────────
# STEP 5: Firebase Login
# ─────────────────────────────────────────────────────────────────────────────

echo ""
echo -e "${BLUE}Step 5: Firebase Authentication${NC}"
echo ""
echo "To upload to Firebase App Distribution, you need a CLI token."
echo ""
echo -e "${YELLOW}Run this command in your terminal:${NC}"
echo ""
echo "    firebase login:ci"
echo ""
echo "Then save the token as an environment variable:"
echo ""
echo "    export FIREBASE_CLI_TOKEN=\"your_token_here\""
echo ""
echo "Add to your ~/.zshrc or ~/.bashrc for persistence."
echo ""

# ─────────────────────────────────────────────────────────────────────────────
# STEP 6: Configuration Checklist
# ─────────────────────────────────────────────────────────────────────────────

echo ""
echo -e "${BLUE}Step 6: Configuration Checklist${NC}"
echo ""
echo "Before deploying, update these files:"
echo ""
echo "  📄 fastlane/Appfile:"
echo "     - apple_id (your Apple ID email)"
echo "     - team_id (your Developer Team ID)"
echo ""
echo "  📄 .env.default or environment:"
echo "     - FIREBASE_APP_ID (from Firebase Console)"
echo "     - FIREBASE_CLI_TOKEN (from firebase login:ci)"
echo ""
echo "  📄 fastlane/testers.txt:"
echo "     - Add beta tester emails"
echo ""
echo "  📄 fastlane/devices.txt:"
echo "     - Add test device UDIDs"
echo ""

# ─────────────────────────────────────────────────────────────────────────────
# STEP 7: Quick Reference
# ─────────────────────────────────────────────────────────────────────────────

echo ""
echo -e "${GREEN}═══════════════════════════════════════════════════════════════════════════${NC}"
echo -e "${GREEN}✅ Setup Complete!${NC}"
echo -e "${GREEN}═══════════════════════════════════════════════════════════════════════════${NC}"
echo ""
echo "Available Commands:"
echo ""
echo -e "  ${YELLOW}fastlane build${NC}       - Verify compilation (no signing)"
echo -e "  ${YELLOW}fastlane beta${NC}        - Deploy to TestFlight"
echo -e "  ${YELLOW}fastlane firebase${NC}    - Deploy to Firebase"
echo -e "  ${YELLOW}fastlane beta_all${NC}    - Deploy to BOTH 🔥"
echo -e "  ${YELLOW}fastlane adhoc${NC}       - Build IPA for direct sharing"
echo -e "  ${YELLOW}fastlane release${NC}     - Submit to App Store"
echo ""
echo "Quick Start:"
echo ""
echo "  1. Update fastlane/Appfile with your credentials"
echo "  2. Run: fastlane build"
echo "  3. Run: fastlane beta (TestFlight)"
echo ""
echo "Need help? Check fastlane/README.md"
echo ""
