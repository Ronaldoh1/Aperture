#!/usr/bin/env bash
set -uo pipefail

SCHEME="${SCHEME:-Aperture}"
CONFIGURATION="${CONFIGURATION:-Debug}"
DESTINATION="${DESTINATION:-platform=iOS Simulator,name=iPhone 16 Pro Max,OS=latest}"

WORKSPACE="$(find . -maxdepth 1 -name "*.xcworkspace" -print | head -n 1 || true)"
PROJECT="$(find . -maxdepth 1 -name "*.xcodeproj" -print | head -n 1 || true)"

if [[ -z "$WORKSPACE" && -z "$PROJECT" ]]; then
  echo "❌ I do not see a .xcworkspace or .xcodeproj in: $(pwd)"
  echo "Run this from the iOS repo root."
  return 0 2>/dev/null || exit 0
fi

LOG_DIR=".build-logs"
mkdir -p "$LOG_DIR"

echo "🔊 LOUD BUILD MODE"
echo "Scheme: $SCHEME"
echo "Config: $CONFIGURATION"
echo "Dest:   $DESTINATION"
echo ""

attempt=1

while true; do
  TS="$(date +"%Y%m%d-%H%M%S")"
  LOG="$LOG_DIR/build-$TS-$attempt.log"

  echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
  echo "🚨 BUILD ATTEMPT #$attempt"
  echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

  if [[ -n "$WORKSPACE" ]]; then
    CMD=(xcodebuild
      -workspace "$WORKSPACE"
      -scheme "$SCHEME"
      -configuration "$CONFIGURATION"
      -destination "$DESTINATION"
      -showBuildTimingSummary
      build
    )
  else
    CMD=(xcodebuild
      -project "$PROJECT"
      -scheme "$SCHEME"
      -configuration "$CONFIGURATION"
      -destination "$DESTINATION"
      -showBuildTimingSummary
      build
    )
  fi

  "${CMD[@]}" \
    GCC_TREAT_WARNINGS_AS_ERRORS=YES \
    OTHER_SWIFT_FLAGS='$(inherited) -Xfrontend -diagnostic-style=llvm -Xfrontend -warn-long-function-bodies=100 -Xfrontend -warn-long-expression-type-checking=100 -Xfrontend -debug-time-function-bodies -Xfrontend -debug-time-expression-type-checking' \
    OTHER_CFLAGS='$(inherited) -Wall -Wextra -Wpedantic' \
    | tee "$LOG"

  status=${PIPESTATUS[0]}

  if [[ $status -eq 0 ]]; then
    echo ""
    echo "✅ BUILD SUCCEEDED"
    echo "📄 $LOG"
    echo "Returning to shell."
    return 0 2>/dev/null || exit 0
  fi

  echo ""
  echo "❌ BUILD FAILED"
  echo "📄 Log saved: $LOG"
  echo ""
  echo "🧨 FIRST COMPILER ERRORS:"
  grep -nE "error:|fatal error:" "$LOG" | head -n 80 || true

  echo ""
  echo "🛠 Fix the FIRST real error."
  echo "↩ Press ENTER to rebuild, Ctrl+C to stop (shell stays alive)."
  read -r
  attempt=$((attempt + 1))
done
