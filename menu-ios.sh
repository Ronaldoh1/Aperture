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

find_root() {
  local dir="$PWD"
  while [[ "$dir" != "/" ]]; do
    if [[ -d "$dir/Aperture.xcodeproj" ]] ||
       [[ -d "$dir/Aperture.xcworkspace" ]] ||
       [[ -f "$dir/Podfile" ]] ||
       [[ -f "$dir/fastlane/Fastfile" ]]; then
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
  echo -e "\n${MAGENTA}══════════════════════════════════════════════════════════════${RESET}"
  echo -e "${YELLOW}→ $title${RESET}"
  echo -e "${MAGENTA}══════════════════════════════════════════════════════════════${RESET}\n"
  eval "$cmd" || error "Command failed"
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

  echo -e "${DIM}Enter description (optional). Press Enter on empty line to finish.${RESET}"
  body=""
  while IFS= read -r line; do
    [[ -z "$line" ]] && break
    body+="$line\n"
  done

  git add . || { error "git add failed"; return; }

  if [[ -n "$body" ]]; then
    git commit -m "$title" -m "$body" || { error "Commit failed"; return; }
  else
    git commit -m "$title" || { error "Commit failed"; return; }
  fi

  success "Committed: $title"
  echo -e "\n${GREEN}Press Enter...${RESET}"
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
  printf "  ${GREEN}3)${RESET} Fastlane gym (archive)\n"
  printf "  ${GREEN}4)${RESET} Fastlane test\n"
  printf "  ${GREEN}5)${RESET} swiftlint\n"
  printf "  ${GREEN}6)${RESET} swiftformat\n"
  printf "  ${GREEN}7)${RESET} pod install/update\n"
  printf "  ${GREEN}8)${RESET} Open in Xcode\n"
  printf "  ${GREEN}9)${RESET} Open Simulator\n"
  printf " ${GREEN}10)${RESET} Clean DerivedData (nuke Xcode cache)\n"
  printf " ${GREEN}11)${RESET} Quick Git Commit\n"
  printf "  ${RED}0)${RESET} Exit (terminal stays open)\n\n"

  printf "${BLUE}Choice [0-11]: ${RESET}"
}

while true; do
  show_menu
  read -r c

  case $c in
    0)
      echo -e "\n${CYAN}Thanks!${RESET} Terminal stays open — type ${YELLOW}exit${RESET} when ready."
      exec $SHELL -l
      ;;
    1) run "xcodebuild -scheme Aperture -configuration Debug -sdk iphonesimulator -destination 'platform=iOS Simulator,name=iPhone 16' build && xcrun simctl install booted build/Debug-iphonesimulator/Aperture.app && xcrun simctl launch booted com.ronaldoh1.aperture" "Build & run on simulator" ;;
    2) run "xcodebuild -scheme Aperture -configuration Debug -sdk iphonesimulator -destination 'platform=iOS Simulator,name=iPhone 16' -verbose build" "Build LOUD (verbose debug)" ;;
    3) run "fastlane gym" "Fastlane gym (archive)" ;;
    4) run "fastlane test" "Fastlane test" ;;
    5) run "swiftlint --strict" "swiftlint" ;;
    6) run "swiftformat ." "swiftformat" ;;
    7) run "pod install --repo-update" "pod install/update" ;;
    8) run "open -a Xcode Aperture.xcworkspace || open -a Xcode Aperture.xcodeproj" "Open in Xcode" ;;
    9) run "open -a Simulator" "Open Simulator" ;;
    10)
      if [[ "$(read -p "${YELLOW}Delete ALL DerivedData? (y/N) ${RESET}" choice; echo "$choice")" == "y" ]]; then
        rm -rf ~/Library/Developer/Xcode/DerivedData/*
        success "DerivedData cleaned – Xcode will re-generate on next build"
      else
        echo -e "${YELLOW}Cancelled.${RESET}"
      fi
      echo -e "\n${GREEN}Press Enter...${RESET}"
      read -r
      ;;
    11) quick_commit ;;
    *) echo -e "${YELLOW}Invalid${RESET}"; sleep 1 ;;
  esac
done
