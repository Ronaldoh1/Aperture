#!/bin/bash
# ═══════════════════════════════════════════════════════════════════════════
# APERTURE - Local Development Scripts
# ═══════════════════════════════════════════════════════════════════════════
#
# Usage:
#   ./scripts/run.sh device          # Build & run on device (no tests)
#   ./scripts/run.sh simulator       # Build for simulator
#   ./scripts/run.sh test            # Run all tests
#   ./scripts/run.sh test:unit       # Unit tests only
#   ./scripts/run.sh test:ui         # UI tests only
#   ./scripts/run.sh adhoc           # Build ad-hoc IPA
#   ./scripts/run.sh firebase        # Deploy to Firebase
#   ./scripts/run.sh beta            # Deploy to TestFlight
#   ./scripts/run.sh audit           # Full code audit
#   ./scripts/run.sh clean           # Clean build
#
# ═══════════════════════════════════════════════════════════════════════════

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Project settings
SCHEME="Aperture"
PROJECT="Aperture.xcodeproj"
BUILD_DIR="./build"

# ─────────────────────────────────────────────────────────────────────────────
# Helper functions
# ─────────────────────────────────────────────────────────────────────────────

print_header() {
    echo ""
    echo -e "${PURPLE}═══════════════════════════════════════════════════════════════${NC}"
    echo -e "${PURPLE}  $1${NC}"
    echo -e "${PURPLE}═══════════════════════════════════════════════════════════════${NC}"
    echo ""
}

print_step() {
    echo -e "${CYAN}▶ $1${NC}"
}

print_success() {
    echo -e "${GREEN}✅ $1${NC}"
}

print_error() {
    echo -e "${RED}❌ $1${NC}"
}

print_warning() {
    echo -e "${YELLOW}⚠️  $1${NC}"
}

# ─────────────────────────────────────────────────────────────────────────────
# Commands
# ─────────────────────────────────────────────────────────────────────────────

cmd_device() {
    print_header "📱 Building for Device (No Tests)"
    
    print_step "Running fastlane device..."
    bundle exec fastlane device
    
    print_success "Device build complete!"
    echo "IPA location: $BUILD_DIR/Aperture-Device.ipa"
}

cmd_device_clean() {
    print_header "📱 Clean Build for Device"
    
    print_step "Cleaning and building..."
    bundle exec fastlane device_clean
    
    print_success "Clean device build complete!"
}

cmd_simulator() {
    print_header "🖥️  Building for Simulator"
    
    DEVICE=${2:-"iPhone 15 Pro"}
    print_step "Target: $DEVICE"
    
    bundle exec fastlane simulator device:"$DEVICE"
    
    print_success "Simulator build complete!"
}

cmd_test() {
    print_header "🧪 Running ALL Tests"
    
    bundle exec fastlane test
    
    print_success "All tests passed!"
}

cmd_test_unit() {
    print_header "🧪 Running Unit Tests Only"
    
    bundle exec fastlane test_unit
    
    print_success "Unit tests passed!"
}

cmd_test_ui() {
    print_header "🧪 Running UI Tests Only"
    
    bundle exec fastlane test_ui
    
    print_success "UI tests passed!"
}

cmd_adhoc() {
    print_header "📦 Building Ad-Hoc IPA"
    
    bundle exec fastlane adhoc
    
    print_success "Ad-hoc IPA ready!"
    echo "Location: $BUILD_DIR/Aperture-AdHoc.ipa"
}

cmd_firebase() {
    print_header "🔥 Deploying to Firebase"
    
    if [ -z "$FIREBASE_CLI_TOKEN" ]; then
        print_warning "FIREBASE_CLI_TOKEN not set!"
        echo "Run: firebase login:ci"
        echo "Then: export FIREBASE_CLI_TOKEN='your_token'"
        exit 1
    fi
    
    bundle exec fastlane firebase
    
    print_success "Firebase deployment complete!"
}

cmd_beta() {
    print_header "🚀 Deploying to TestFlight"
    
    bundle exec fastlane beta
    
    print_success "TestFlight deployment complete!"
}

cmd_beta_all() {
    print_header "🚀🔥 Deploying to TestFlight + Firebase"
    
    bundle exec fastlane beta_all
    
    print_success "Deployed to both platforms!"
}

cmd_audit() {
    print_header "🔬 Running Full Code Audit"
    
    bundle exec fastlane full_audit
    
    print_success "Audit complete! Check $BUILD_DIR/ for reports"
}

cmd_analyze() {
    print_header "🔍 Running Static Analysis"
    
    bundle exec fastlane analyze
    
    print_success "Analysis complete!"
}

cmd_security() {
    print_header "🔐 Running Security Audit"
    
    bundle exec fastlane security_audit
    
    print_success "Security audit complete!"
}

cmd_spanish() {
    print_header "🌍 Checking Spanish Localization"
    
    bundle exec fastlane lint_spanish
    
    print_success "Localization check complete!"
}

cmd_persistence() {
    print_header "💾 Checking Persistence"
    
    bundle exec fastlane check_persistence
    
    print_success "Persistence check complete!"
}

cmd_clean() {
    print_header "🧹 Cleaning Build"
    
    print_step "Removing build directory..."
    rm -rf "$BUILD_DIR"
    rm -rf ~/Library/Developer/Xcode/DerivedData/Aperture-*
    
    print_step "Cleaning Xcode build..."
    xcodebuild -project "$PROJECT" -scheme "$SCHEME" clean 2>/dev/null || true
    
    print_success "Clean complete!"
}

cmd_build() {
    print_header "🔨 Building (No Signing)"
    
    bundle exec fastlane build
    
    print_success "Build successful!"
}

cmd_certs() {
    print_header "🔐 Syncing Certificates"
    
    bundle exec fastlane certs
    
    print_success "Certificates synced!"
}

cmd_register() {
    print_header "📱 Register New Device"
    
    bundle exec fastlane register_device
    
    print_success "Device registered!"
}

cmd_help() {
    echo ""
    echo -e "${CYAN}Aperture Development Scripts${NC}"
    echo ""
    echo "Usage: ./scripts/run.sh <command>"
    echo ""
    echo "Commands:"
    echo "  ${GREEN}device${NC}        Build & run on connected device (no tests)"
    echo "  ${GREEN}device:clean${NC}  Clean build for device"
    echo "  ${GREEN}simulator${NC}     Build for simulator"
    echo "  ${GREEN}build${NC}         Verify build (no signing)"
    echo ""
    echo "  ${YELLOW}test${NC}          Run ALL tests"
    echo "  ${YELLOW}test:unit${NC}     Unit tests only"
    echo "  ${YELLOW}test:ui${NC}       UI tests only"
    echo ""
    echo "  ${BLUE}adhoc${NC}         Build ad-hoc IPA"
    echo "  ${BLUE}firebase${NC}      Deploy to Firebase"
    echo "  ${BLUE}beta${NC}          Deploy to TestFlight"
    echo "  ${BLUE}beta:all${NC}      Deploy to BOTH platforms"
    echo ""
    echo "  ${PURPLE}audit${NC}         Full code audit"
    echo "  ${PURPLE}analyze${NC}       Static analysis"
    echo "  ${PURPLE}security${NC}      Security audit"
    echo "  ${PURPLE}spanish${NC}       Check Spanish localization"
    echo "  ${PURPLE}persistence${NC}   Check persistence implementation"
    echo ""
    echo "  ${CYAN}certs${NC}         Sync certificates"
    echo "  ${CYAN}register${NC}      Register new device"
    echo "  ${CYAN}clean${NC}         Clean build"
    echo ""
}

# ─────────────────────────────────────────────────────────────────────────────
# Main
# ─────────────────────────────────────────────────────────────────────────────

# Ensure we're in the project directory
cd "$(dirname "$0")/.."

# Parse command
case "${1:-help}" in
    device)
        cmd_device
        ;;
    device:clean)
        cmd_device_clean
        ;;
    simulator)
        cmd_simulator "$@"
        ;;
    build)
        cmd_build
        ;;
    test)
        cmd_test
        ;;
    test:unit)
        cmd_test_unit
        ;;
    test:ui)
        cmd_test_ui
        ;;
    adhoc)
        cmd_adhoc
        ;;
    firebase)
        cmd_firebase
        ;;
    beta)
        cmd_beta
        ;;
    beta:all)
        cmd_beta_all
        ;;
    audit)
        cmd_audit
        ;;
    analyze)
        cmd_analyze
        ;;
    security)
        cmd_security
        ;;
    spanish)
        cmd_spanish
        ;;
    persistence)
        cmd_persistence
        ;;
    certs)
        cmd_certs
        ;;
    register)
        cmd_register
        ;;
    clean)
        cmd_clean
        ;;
    help|--help|-h)
        cmd_help
        ;;
    *)
        print_error "Unknown command: $1"
        cmd_help
        exit 1
        ;;
esac
