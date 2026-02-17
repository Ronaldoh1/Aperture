#!/usr/bin/env bash

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
  eval "$cmd" || error "Command failed (code $?)"
  echo -e "\n${GREEN}Press Enter to return...${RESET}"
  read -r
}

quick_commit() {
  echo -e "${YELLOW}Quick Commit${RESET}"
  echo -e "──────────────────────────────────────────────────────────────"

  read -p "${BLUE}Commit title (required): ${RESET}" title
  if [[ -z "$title" ]]; then
    error "Title is required. Aborting."
    echo -e "\n${GREEN}Press Enter...${RESET}"
    read -r
    return
  fi

  echo -e "${DIM}(Press Enter twice to finish description or leave empty)${RESET}"
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
  printf "  ${GREEN}2)${RESET} Fastlane gym (archive)\n"
  printf "  ${GREEN}3)${RESET} Fastlane test\n"
  printf "  ${GREEN}4)${RESET} swiftlint\n"
  printf "  ${GREEN}5)${RESET} swiftformat\n"
  printf "  ${GREEN}6)${RESET} pod install/update\n"
  printf "  ${GREEN}7)${RESET} Open in Xcode\n"
  printf "  ${GREEN}8)${RESET} Open Simulator\n"
  printf "  ${GREEN}9)${RESET} Clean DerivedData\n"
  printf " ${GREEN}10)${RESET} Quick Git Commit (title + optional body)\n"
  printf "  ${RED}0)${RESET} Exit (terminal stays open)\n\n"

  printf "${BLUE}Choice [0-10]: ${RESET}"
}

while true; do
  show_menu
  read -r c

  case $c in
    0)
      echo -e "\n${CYAN}Thanks!${RESET} Terminal stays open – type ${YELLOW}exit${RESET} when ready."
      exec $SHELL -l
      ;;
    1) run "xcodebuild -scheme Aperture -configuration Debug -sdk iphonesimulator -destination 'platform=iOS Simulator,name=iPhone 16' build && xcrun simctl install booted build/Debug-iphonesimulator/Aperture.app && xcrun simctl launch booted com.ronaldoh1.aperture" "Build & run on simulator" ;;
    2) run "fastlane gym" "Fastlane gym (archive)" ;;
    3) run "fastlane test" "Fastlane test" ;;
    4) run "swiftlint --strict" "swiftlint" ;;
    5) run "swiftformat ." "swiftformat" ;;
    6) run "pod install --repo-update" "pod install/update" ;;
    7) run "open -a Xcode Aperture.xcworkspace || open -a Xcode Aperture.xcodeproj" "Open in Xcode" ;;
    8) run "open -a Simulator" "Open Simulator" ;;
    9)
      if confirm "Delete ALL DerivedData? (y/N)"; then
        rm -rf ~/Library/Developer/Xcode/DerivedData/*
        success "DerivedData cleaned"
      else
        warning "Cancelled"
      fi
      echo -e "\n${GREEN}Press Enter...${RESET}"
      read -r
      ;;
    10) quick_commit ;;
    *) echo -e "${YELLOW}Invalid${RESET}"; sleep 1 ;;
  esac
done
