#!/bin/bash
# ═══════════════════════════════════════════════════════════════════════════
# APERTURE - SwiftLint Build Script
# ═══════════════════════════════════════════════════════════════════════════
#
# Add this as a "Run Script Phase" in Xcode:
#   Build Phases → + → New Run Script Phase
#   Shell: /bin/bash
#   Script: "${SRCROOT}/scripts/swiftlint.sh"
#
# ═══════════════════════════════════════════════════════════════════════════

set -e

# Configuration
SWIFTLINT_CONFIG="${SRCROOT}/.swiftlint.yml"
SWIFTLINT_PATH="/opt/homebrew/bin/swiftlint"  # Homebrew on Apple Silicon
SWIFTLINT_PATH_INTEL="/usr/local/bin/swiftlint"  # Homebrew on Intel

# Find SwiftLint
if [ -f "$SWIFTLINT_PATH" ]; then
    LINT="$SWIFTLINT_PATH"
elif [ -f "$SWIFTLINT_PATH_INTEL" ]; then
    LINT="$SWIFTLINT_PATH_INTEL"
elif which swiftlint > /dev/null; then
    LINT=$(which swiftlint)
else
    echo "warning: SwiftLint not installed. Install with: brew install swiftlint"
    exit 0
fi

# Check if config exists
if [ ! -f "$SWIFTLINT_CONFIG" ]; then
    echo "warning: SwiftLint config not found at $SWIFTLINT_CONFIG"
    exit 0
fi

# Run SwiftLint
echo "Running SwiftLint..."

# Autocorrect first (optional, uncomment if desired)
# "$LINT" --fix --config "$SWIFTLINT_CONFIG"

# Then lint
"$LINT" lint --config "$SWIFTLINT_CONFIG" --reporter xcode

echo "SwiftLint complete!"
