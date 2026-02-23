#!/usr/bin/env zsh

set -euo pipefail

RESET='\033[0m'
BOLD='\033[1m'
CYAN='\033[36m'
GREEN='\033[32m'
YELLOW='\033[33m'
RED='\033[31m'
MAGENTA='\033[35m'
BLUE='\033[34m'
DIM='\033[2m'

mkdir -p logs

clean_derived_data() {
  local path="/Users/ron/Library/Developer/Xcode/DerivedData"
  echo -e "${YELLOW}Cleaning DerivedData at: $path${RESET}"
  rm -rf "$path"/* 2>/dev/null || true
  success "DerivedData cleaned successfully"
}

find_root() {
  local dir="$PWD"
  while [[ "$dir" != "/" ]]; do
    if [[ -d "$dir/Aperture.xcodeproj" ]] || [[ -d "$dir/Aperture.xcworkspace" ]] || [[ -f "$dir/Podfile" ]] || [[ -f "$dir/fastlane/Fastfile" ]]; then
      echo "$dir"
      return 0
    fi
    dir="$(dirname "$dir")"
  done
  echo -e "${RED}Error: No iOS project root found${RESET}" >&2
  exit 1
}

ROOT=$(find_root)
cd "$ROOT" || exit 1

success() { echo -e "${GREEN}✓ $1${RESET}"; }
error()   { echo -e "${RED}✗ $1${RESET}"; }

run() {
  local cmd="$1"
  local title="$2"
  local log="logs/$(date +%Y%m%d-%H%M%S)-$title.log"

  echo -e "\n${MAGENTA}══════════════════════════════════════════════════════════════${RESET}"
  echo -e "${YELLOW}→ $title${RESET} (log → $log)"
  echo -e "${MAGENTA}══════════════════════════════════════════════════════════════${RESET}\n"

  eval "$cmd" 2>&1 | tee "$log" || error "Command failed"
  echo -e "\n${GREEN}Press Enter to return...${RESET}"
  read -r
}

quick_commit() {
  echo -e "${YELLOW}Quick Commit${RESET}"
  echo -e "──────────────────────────────────────────────────────────────"

  read -r "title?${BLUE}Commit title (required): ${RESET}"
  if [[ -z "$title" ]]; then
    error "Title is required. Aborting."
    echo -e "\n${GREEN}Press Enter...${RESET}"
    read -r
    return
  fi

  read -r "body?${BLUE}Description (optional): ${RESET}"

  git add . || { error "git add failed"; return; }

  if [[ -n "$body" ]]; then
    git commit -m "$title" -m "$body" || { error "Commit failed"; return; }
  else
    git commit -m "$title" || { error "Commit failed"; return; }
  fi

  success "Committed: $title"
  echo -e "\n${GREEN}Press Enter to return to menu...${RESET}"
  read -r
}

show_menu() {
  clear
  echo -e "${CYAN}${BOLD}══════════════════════════════════════════════════════════════${RESET}"
  echo -e "          ${CYAN}${BOLD}Aperture iOS Menu${RESET}"
  echo -e "${CYAN}${BOLD}══════════════════════════════════════════════════════════════${RESET}"
  echo -e "Root: ${YELLOW}$ROOT${RESET}\n"

  printf "  ${GREEN}1)${RESET} Build & run on simulator\n"
  printf "  ${GREEN}2)${RESET} Build LOUD (verbose debug)\n"
  printf "  ${GREEN}3)${RESET} Run Unit Tests\n"
  printf "  ${GREEN}4)${RESET} Run UI Tests\n"
  printf "  ${GREEN}5)${RESET} Run All Tests + Coverage\n"
  printf "  ${GREEN}6)${RESET} SwiftLint + SwiftFormat\n"
  printf "  ${GREEN}7)${RESET} Periphery (unused code)\n"
  printf "  ${GREEN}8)${RESET} Xcode Analyze (Apple static analyzer)\n"
  printf "  ${GREEN}9)${RESET} pod install/update\n"
  printf " ${GREEN}10)${RESET} Clean Build Folder (Cmd+Shift+K)\n"
  printf " ${GREEN}11)${RESET} Clean DerivedData (nuke cache)\n"
  printf " ${GREEN}12)${RESET} Full Static Analysis (all tools chained)\n"
  printf " ${GREEN}13)${RESET} Quick Git Commit\n"
  printf " ${GREEN}14)${RESET} Open in Xcode\n"
  printf " ${GREEN}15)${RESET} Open Simulator\n"
  printf "  ${RED}0)${RESET} Exit (terminal stays open)\n\n"

  printf "${BLUE}Choice [0-15]: ${RESET}"
}

while true; do
  show_menu
  read -r c

  case $c in
    0)
      echo -e "\n${CYAN}Thanks!${RESET} Terminal stays open — type ${YELLOW}exit${RESET} when ready."
      exec $SHELL -l
      ;;
    1) run "xcodebuild -scheme Aperture -configuration Debug -sdk iphonesimulator -derivedDataPath ./build -destination 'platform=iOS Simulator,name=iPhone 16' build && xcrun simctl install booted ./build/Build/Products/Debug-iphonesimulator/Aperture.app && xcrun simctl launch booted com.ronaldoh1.aperture" "Build & run on simulator" ;;
    2) run "xcodebuild -scheme Aperture -configuration Debug -sdk iphonesimulator -destination 'platform=iOS Simulator,name=iPhone 16' -verbose build" "Build LOUD" ;;
    3) run "xcodebuild test -scheme Aperture -destination 'platform=iOS Simulator,name=iPhone 16' -only-testing:ApertureTests" "Run Unit Tests" ;;
    4) run "xcodebuild test -scheme Aperture -destination 'platform=iOS Simulator,name=iPhone 16' -only-testing:ApertureUITests" "Run UI Tests" ;;
    5) run "xcodebuild test -scheme Aperture -destination 'platform=iOS Simulator,name=iPhone 16' -enableCodeCoverage YES" "Run All Tests + Coverage" ;;
    6) run "swiftlint --strict && swiftformat ." "SwiftLint + SwiftFormat" ;;
    7) run "periphery scan --config .periphery.yml || echo 'Run periphery scan --setup first'" "Periphery (unused code)" ;;
    8) run "xcodebuild analyze -scheme Aperture -destination 'platform=iOS Simulator,name=iPhone 16'" "Xcode Analyze" ;;
    9) run "pod install --repo-update" "pod install/update" ;;
    10) run "xcodebuild clean -scheme Aperture" "Clean Build Folder (Cmd+Shift+K)" ;;
    11) clean_derived_data ;;
    12) full_analysis ;;
    13) quick_commit ;;
    14) run "open -a Xcode Aperture.xcworkspace || open -a Xcode Aperture.xcodeproj" "Open in Xcode" ;;
    15) run "open -a Simulator" "Open Simulator" ;;
    *) echo -e "${YELLOW}Invalid${RESET}"; sleep 1 ;;
  esac
done
