#!/usr/bin/env bash

set -euo pipefail

# ──────────────────────────────────────────────────────────────────────────────
#  Aperture Android CLI Menu - Colorful & Persistent
#  Works from any subfolder in the project
# ──────────────────────────────────────────────────────────────────────────────

RESET='\033[0m'
BOLD='\033[1m'
CYAN='\033[36m'
GREEN='\033[32m'
YELLOW='\033[33m'
RED='\033[31m'
MAGENTA='\033[35m'
BLUE='\033[34m'
DIM='\033[2m'

find_project_root() {
  local dir="$PWD"
  while [[ "$dir" != "/" ]]; do
    if [[ -f "$dir/gradlew" ]]; then
      echo "$dir"
      return 0
    fi
    dir="$(dirname "$dir")"
  done
  echo -e "${RED}Error: No gradlew found in any parent directory${RESET}" >&2
  exit 1
}

PROJECT_ROOT=$(find_project_root)
cd "$PROJECT_ROOT" || exit 1

success() { echo -e "${GREEN}✓ $1${RESET}"; }
error()   { echo -e "${RED}✗ $1${RESET}"; }

show_menu() {
  clear
  echo -e "${CYAN}${BOLD}╔════════════════════════════════════════════════════════════╗${RESET}"
  echo -e "${CYAN}${BOLD}║          ${MAGENTA}Aperture Android Development Menu${CYAN}               ║${RESET}"
  echo -e "${CYAN}${BOLD}╚════════════════════════════════════════════════════════════╝${RESET}"
  echo -e "${DIM}Project:${RESET} ${YELLOW}$PROJECT_ROOT${RESET}\n"

  printf "  ${GREEN}1)${RESET} Build debug APK\n"
  printf "  ${GREEN}2)${RESET} Install debug on device/emulator\n"
  printf "  ${GREEN}3)${RESET} Clean project\n"
  printf "  ${GREEN}4)${RESET} Fastlane ${BLUE}build_debug${RESET}\n"
  printf "  ${GREEN}5)${RESET} Fastlane ${BLUE}build_release${RESET}\n"
  printf "  ${GREEN}6)${RESET} Fastlane ${BLUE}beta${RESET}\n"
  printf "  ${GREEN}7)${RESET} Lint (detekt + ktlint + Android lint)\n"
  printf "  ${GREEN}8)${RESET} Run tests (unit + instrumented)\n"
  printf "  ${GREEN}9)${RESET} Start emulator (test_avd)\n"
  printf " ${GREEN}10)${RESET} List devices & emulators\n"
  printf " ${GREEN}11)${RESET} Open in Android Studio\n"
  printf " ${GREEN}12)${RESET} Show logcat (Aperture filter)\n"
  printf "  ${RED}0)${RESET} Exit\n\n"

  printf "${BLUE}Enter choice [0-12]: ${RESET}"
}

run_command() {
  local title="$1"
  echo -e "\n${MAGENTA}══════════════════════════════════════════════════════════════${RESET}"
  echo -e "${YELLOW}→ $title${RESET}"
  echo -e "${MAGENTA}══════════════════════════════════════════════════════════════${RESET}\n"

  local status=0

  case "$title" in
    "Build debug APK")              ./gradlew assembleDebug --stacktrace || status=1 ;;
    "Install debug on device/emulator") ./gradlew installDebug || status=1 ;;
    "Clean project")
      ./gradlew clean && rm -rf .gradle/caches build app/build 2>/dev/null || status=1
      ;;
    "Fastlane build_debug")         fastlane build_debug || status=1 ;;
    "Fastlane build_release")       fastlane build_release || status=1 ;;
    "Fastlane beta")                fastlane beta || status=1 ;;
    "Lint (detekt + ktlint + Android lint)")
      ./gradlew lint detekt ktlintCheck || status=1
      echo -e "\n${YELLOW}Reports:${RESET}"
      echo "  • Android lint: app/build/reports/lint-results-debug.html"
      echo "  • Detekt:       app/build/reports/detekt/detekt.html"
      echo "  • ktlint:       app/build/reports/ktlint/.../ktlintMainSourceSetCheck.html"
      ;;
    "Run tests (unit + instrumented)")
      ./gradlew testDebugUnitTest connectedDebugAndroidTest || status=1
      echo -e "\n${YELLOW}Reports:${RESET}"
      echo "  • Unit:         app/build/reports/tests/testDebugUnitTest/index.html"
      echo "  • Instrumented: app/build/reports/androidTests/connected/index.html"
      ;;
    "Start emulator (test_avd)")
      emulator -avd test_avd &>/dev/null &
      success "Emulator started in background"
      ;;
    "List devices & emulators")
      echo -e "${BLUE}Devices:${RESET}"
      adb devices
      echo -e "\n${BLUE}AVDs:${RESET}"
      emulator -list-avds
      ;;
    "Open in Android Studio")
      open -a "Android Studio" . || error "Android Studio not found"
      ;;
    "Show logcat (Aperture filter)")
      adb logcat | grep -i --color=always Aperture
      ;;
    *)
      error "Invalid choice"
      status=1
      ;;
  esac

  echo -e "\n${MAGENTA}──────────────────────────────────────────────────────────────${RESET}"
  if [[ $status -eq 0 ]]; then
    success "Command completed successfully"
  else
    error "Command finished with errors (exit code $status)"
  fi

  echo -e "\n${GREEN}Press Enter${RESET} to return to menu..."
  read -r
}

# Main loop
while true; do
  show_menu
  read -r choice

  case $choice in
    0) echo -e "\n${CYAN}Goodbye!${RESET}"; exit 0 ;;
    1) run_command "Build debug APK" ;;
    2) run_command "Install debug on device/emulator" ;;
    3) run_command "Clean project" ;;
    4) run_command "Fastlane build_debug" ;;
    5) run_command "Fastlane build_release" ;;
    6) run_command "Fastlane beta" ;;
    7) run_command "Lint (detekt + ktlint + Android lint)" ;;
    8) run_command "Run tests (unit + instrumented)" ;;
    9) run_command "Start emulator (test_avd)" ;;
    10) run_command "List devices & emulators" ;;
    11) run_command "Open in Android Studio" ;;
    12) run_command "Show logcat (Aperture filter)" ;;
    *) echo -e "${YELLOW}Invalid — try again${RESET}"; sleep 1 ;;
  esac
done
