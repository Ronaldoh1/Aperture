#!/bin/bash
# ═══════════════════════════════════════════════════════════════════════════
# APERTURE P1 — DEVICE DEPLOYMENT PRE-FLIGHT
# ═══════════════════════════════════════════════════════════════════════════
#
# Run this ONCE before your first `fastlane device` to make sure
# everything is wired correctly after integrating the P1 ZIP.
#
# Usage:
#   chmod +x scripts/preflight.sh
#   ./scripts/preflight.sh
#
# ═══════════════════════════════════════════════════════════════════════════

set -e

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m'

PASS=0
FAIL=0
WARN=0

check_pass() { echo -e "  ${GREEN}✅ $1${NC}"; ((PASS++)); }
check_fail() { echo -e "  ${RED}❌ $1${NC}"; ((FAIL++)); }
check_warn() { echo -e "  ${YELLOW}⚠️  $1${NC}"; ((WARN++)); }

cd "$(dirname "$0")/.."

echo ""
echo -e "${CYAN}═══════════════════════════════════════════════════════════════${NC}"
echo -e "${CYAN}  APERTURE P1 — PRE-FLIGHT CHECKLIST${NC}"
echo -e "${CYAN}═══════════════════════════════════════════════════════════════${NC}"
echo ""

# ─────────────────────────────────────────────────────────────────────────
# 1. PROJECT FILE
# ─────────────────────────────────────────────────────────────────────────
echo -e "${CYAN}[1/8] Xcode Project${NC}"

if [ -d "Aperture.xcodeproj" ]; then
    check_pass "Aperture.xcodeproj found"
else
    check_fail "Aperture.xcodeproj NOT FOUND — cannot build without it"
fi

# ─────────────────────────────────────────────────────────────────────────
# 2. NEW P1 FILES PRESENT
# ─────────────────────────────────────────────────────────────────────────
echo ""
echo -e "${CYAN}[2/8] P1 Feature Files${NC}"

P1_FILES=(
    "Aperture/Modules/QuantumNourish/Scanner/ScannerEnhancements.swift"
    "Aperture/Modules/QuantumNourish/View/SupplementAlternativesView.swift"
    "Aperture/Modules/QuantumNourish/View/BudgetShoppingMarketViews.swift"
    "Aperture/Core/Audio/AudioNarrationEnhancements.swift"
    "Aperture/Modules/QuantumNourish/Entity/CleansingEnhancements.swift"
    "Aperture/Core/Preferences/ContentCustomizationView.swift"
    "Aperture/Modules/Timeline/View/TimelineEraNavigator.swift"
    "Aperture/Modules/Timeline/View/TimelineAvatarManager.swift"
    "Aperture/Modules/PsyopScanner/View/ProgrammingDetectorView.swift"
)

for f in "${P1_FILES[@]}"; do
    if [ -f "$f" ]; then
        check_pass "$(basename $f)"
    else
        check_fail "MISSING: $f"
    fi
done

# ─────────────────────────────────────────────────────────────────────────
# 3. INFO.PLIST KEYS
# ─────────────────────────────────────────────────────────────────────────
echo ""
echo -e "${CYAN}[3/8] Info.plist Privacy Keys${NC}"

PLIST="Aperture/Info.plist"

check_plist_key() {
    if grep -q "$1" "$PLIST" 2>/dev/null; then
        check_pass "$1"
    else
        check_fail "MISSING: $1 — add to Info.plist"
    fi
}

check_plist_key "NSCameraUsageDescription"
check_plist_key "NSLocationWhenInUseUsageDescription"
check_plist_key "NSPhotoLibraryUsageDescription"

# ─────────────────────────────────────────────────────────────────────────
# 4. SWIFT FILE COUNT
# ─────────────────────────────────────────────────────────────────────────
echo ""
echo -e "${CYAN}[4/8] Swift Files${NC}"

SWIFT_COUNT=$(find Aperture -name "*.swift" | wc -l | tr -d ' ')
if [ "$SWIFT_COUNT" -ge 485 ]; then
    check_pass "$SWIFT_COUNT Swift files (expected ≥ 485)"
else
    check_warn "$SWIFT_COUNT Swift files (expected ≥ 485 — some files may be missing)"
fi

# ─────────────────────────────────────────────────────────────────────────
# 5. FASTLANE SETUP
# ─────────────────────────────────────────────────────────────────────────
echo ""
echo -e "${CYAN}[5/8] Fastlane${NC}"

if command -v fastlane &>/dev/null || [ -f "Gemfile" ]; then
    check_pass "Fastlane available"
else
    check_fail "Fastlane not installed — run: gem install fastlane"
fi

if [ -f "fastlane/Appfile" ]; then
    if grep -q "XXXXXXXXXX" "fastlane/Appfile"; then
        check_fail "Appfile still has placeholder TEAM_ID (XXXXXXXXXX)"
    else
        check_pass "Appfile configured"
    fi
else
    check_fail "fastlane/Appfile missing"
fi

# ─────────────────────────────────────────────────────────────────────────
# 6. CONNECTED DEVICE
# ─────────────────────────────────────────────────────────────────────────
echo ""
echo -e "${CYAN}[6/8] Connected Device${NC}"

if command -v xcrun &>/dev/null; then
    DEVICES=$(xcrun xctrace list devices 2>/dev/null | grep -v "Simulator" | grep -v "==" | grep -v "^$" | head -5)
    if [ -n "$DEVICES" ]; then
        check_pass "Device(s) detected:"
        echo "$DEVICES" | while read -r line; do echo -e "         $line"; done
    else
        check_warn "No physical devices detected — connect your iPhone via USB"
    fi
else
    check_warn "xcrun not available — run from macOS with Xcode installed"
fi

# ─────────────────────────────────────────────────────────────────────────
# 7. SIGNING
# ─────────────────────────────────────────────────────────────────────────
echo ""
echo -e "${CYAN}[7/8] Code Signing${NC}"

if [ -d "Aperture.xcodeproj" ]; then
    if grep -q "DEVELOPMENT_TEAM" Aperture.xcodeproj/project.pbxproj 2>/dev/null; then
        TEAM=$(grep "DEVELOPMENT_TEAM" Aperture.xcodeproj/project.pbxproj | head -1 | sed 's/.*= //' | tr -d '";')
        if [ "$TEAM" != "" ] && [ "$TEAM" != "XXXXXXXXXX" ]; then
            check_pass "Development Team: $TEAM"
        else
            check_fail "No Development Team set in project"
        fi
    else
        check_warn "Check Signing & Capabilities in Xcode"
    fi
else
    check_warn "Can't verify signing without .xcodeproj"
fi

# ─────────────────────────────────────────────────────────────────────────
# 8. FRAMEWORKS
# ─────────────────────────────────────────────────────────────────────────
echo ""
echo -e "${CYAN}[8/8] Required Frameworks${NC}"

REQUIRED_IMPORTS=("MapKit" "MediaPlayer" "VisionKit" "PhotosUI")

for framework in "${REQUIRED_IMPORTS[@]}"; do
    COUNT=$(grep -rl "import $framework" Aperture/ 2>/dev/null | wc -l | tr -d ' ')
    if [ "$COUNT" -gt 0 ]; then
        check_pass "import $framework ($COUNT files)"
    else
        check_warn "$framework not imported — may need to add framework to project"
    fi
done

# ─────────────────────────────────────────────────────────────────────────
# SUMMARY
# ─────────────────────────────────────────────────────────────────────────
echo ""
echo -e "${CYAN}═══════════════════════════════════════════════════════════════${NC}"
echo -e "  ${GREEN}Passed: $PASS${NC}  ${RED}Failed: $FAIL${NC}  ${YELLOW}Warnings: $WARN${NC}"
echo -e "${CYAN}═══════════════════════════════════════════════════════════════${NC}"
echo ""

if [ "$FAIL" -eq 0 ]; then
    echo -e "${GREEN}🚀 ALL CLEAR — Ready to build!${NC}"
    echo ""
    echo "  Run one of:"
    echo "    bundle exec fastlane device        # Build + install on phone"
    echo "    ./scripts/run.sh device             # Same thing via wrapper"
    echo ""
else
    echo -e "${RED}⛔ FIX $FAIL ISSUE(S) BEFORE BUILDING${NC}"
    echo ""
    echo "  See details above. Most common fixes:"
    echo "    1. Set your Team ID in Xcode → Signing & Capabilities"
    echo "    2. Add missing Info.plist keys (see step 3)"
    echo "    3. Make sure all P1 files are in Xcode's file navigator"
    echo ""
fi
