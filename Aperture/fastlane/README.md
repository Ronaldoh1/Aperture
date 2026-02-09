# 🚀 Aperture - Fastlane Distribution Guide

Distribute Aperture to testers via **Firebase App Distribution** (instant) or **TestFlight** (Apple review).

---

## 📋 Table of Contents

1. [Quick Start](#-quick-start)
2. [Prerequisites](#-prerequisites)
3. [Firebase Setup](#-firebase-setup)
4. [TestFlight Setup](#-testflight-setup)
5. [Code Signing Setup](#-code-signing-setup)
6. [Available Commands](#-available-commands)
7. [Adding Testers](#-adding-testers)
8. [Troubleshooting](#-troubleshooting)

---

## ⚡ Quick Start

```bash
# 1. Install dependencies
cd Aperture
bundle install

# 2. Distribute to Firebase (fastest)
bundle exec fastlane firebase

# 3. OR distribute to TestFlight
bundle exec fastlane beta
```

---

## 📦 Prerequisites

### 1. Install Homebrew (if not installed)
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### 2. Install Ruby & Bundler
```bash
brew install ruby
gem install bundler
```

### 3. Install Fastlane
```bash
# Option A: Via Bundler (recommended)
bundle install

# Option B: Via Homebrew
brew install fastlane
```

### 4. Install Firebase CLI (for Firebase distribution)
```bash
brew install firebase-cli
firebase login
```

---

## 🔥 Firebase Setup

Firebase App Distribution lets you share builds **instantly** - no Apple review required!

### Step 1: Create Firebase Project

1. Go to [Firebase Console](https://console.firebase.google.com)
2. Click "Add Project" → Name it "Aperture"
3. Disable Google Analytics (optional) → Create Project

### Step 2: Add iOS App

1. In Firebase Console, click the iOS icon
2. Enter bundle ID: `com.sunflow.aperture`
3. Download `GoogleService-Info.plist`
4. Add it to your Xcode project (if not already there)

### Step 3: Get Firebase App ID

1. Firebase Console → Project Settings (gear icon)
2. Scroll to "Your apps" → iOS app
3. Copy the "App ID" (looks like `1:123456789:ios:abcdef`)

### Step 4: Get Firebase CLI Token

```bash
firebase login:ci
# Copy the token that's printed
```

### Step 5: Configure Environment

```bash
cd Aperture/fastlane
cp .env.default .env

# Edit .env and add:
# FIREBASE_APP_ID=1:123456789:ios:abcdef
# FIREBASE_CLI_TOKEN=your-token-here
```

### Step 6: Create Tester Group

1. Firebase Console → App Distribution
2. Click "Testers & Groups" tab
3. Create a group named "testers"
4. Add tester emails

### Step 7: Distribute! 🎉

```bash
bundle exec fastlane firebase
# or shorthand:
bundle exec fastlane fb
```

---

## ✈️ TestFlight Setup

TestFlight is Apple's official beta testing platform.

### Step 1: App Store Connect Setup

1. Go to [App Store Connect](https://appstoreconnect.apple.com)
2. Click "My Apps" → "+" → "New App"
3. Fill in details:
   - Platform: iOS
   - Name: Aperture
   - Bundle ID: com.sunflow.aperture
   - SKU: aperture-001

### Step 2: Configure Credentials

```bash
cd Aperture/fastlane
cp .env.default .env

# Edit .env and add:
# APPLE_ID=your-apple-id@email.com
# TEAM_ID=XXXXXXXXXX  (from developer.apple.com/account)
```

### Step 3: App-Specific Password (for automation)

1. Go to [appleid.apple.com](https://appleid.apple.com)
2. Security → App-Specific Passwords → Generate
3. Name it "Fastlane"
4. Add to .env: `FASTLANE_APPLE_APPLICATION_SPECIFIC_PASSWORD=xxxx-xxxx-xxxx-xxxx`

### Step 4: Distribute! 🎉

```bash
bundle exec fastlane beta
# or shorthand:
bundle exec fastlane tf
```

---

## 🔐 Code Signing Setup

Use **Match** to sync certificates across your team.

### Step 1: Create Private Git Repository

1. Create a **private** GitHub repo (e.g., `ios-certificates`)
2. Don't add any files - Match will manage it

### Step 2: Initialize Match

```bash
bundle exec fastlane match init

# Choose "git" for storage
# Enter your repo URL: https://github.com/yourusername/ios-certificates.git
```

### Step 3: Generate Certificates

```bash
# Development (for testing on device)
bundle exec fastlane match development

# Ad-hoc (for Firebase distribution)
bundle exec fastlane match adhoc

# App Store (for TestFlight/App Store)
bundle exec fastlane match appstore
```

### Step 4: Update Xcode Project

1. Open Xcode → Aperture target → Signing & Capabilities
2. Uncheck "Automatically manage signing"
3. Select the Match provisioning profiles:
   - Debug: `match Development com.sunflow.aperture`
   - Release: `match AppStore com.sunflow.aperture`

---

## 📱 Available Commands

| Command | Description |
|---------|-------------|
| `fastlane build` | Build app (no signing, verification only) |
| `fastlane firebase` | Distribute to Firebase App Distribution |
| `fastlane fb` | Quick Firebase build (shorthand) |
| `fastlane beta` | Distribute to TestFlight |
| `fastlane tf` | Quick TestFlight build (shorthand) |
| `fastlane distribute` | Distribute to BOTH Firebase AND TestFlight |
| `fastlane release` | Submit to App Store |
| `fastlane certs` | Sync all certificates |
| `fastlane add_device` | Register new test device |
| `fastlane test` | Run tests |
| `fastlane clean` | Clean build artifacts |
| `fastlane version` | Show current version |

### Command Options

```bash
# Firebase with custom notes
fastlane firebase notes:"Fixed the dragon bug 🐉"

# Firebase to specific group
fastlane firebase groups:"beta-testers,vip"

# TestFlight with changelog
fastlane beta changelog:"New consciousness assessment feature"

# TestFlight to specific group
fastlane beta groups:"Internal Testers"

# Release with version
fastlane release version:"1.0.0"
```

---

## 👥 Adding Testers

### Firebase Testers

1. Firebase Console → App Distribution → Testers & Groups
2. Add email addresses
3. Create groups (e.g., "friends", "beta", "vip")

```bash
# Distribute to specific group
fastlane firebase groups:"friends"
```

### TestFlight Testers

**Internal Testers** (up to 100, instant access):
1. App Store Connect → Users and Access
2. Add them as App Store Connect users

**External Testers** (up to 10,000, requires review):
1. App Store Connect → TestFlight → External Testing
2. Create a group → Add testers by email

### Device Registration (for Ad-Hoc/Firebase)

```bash
# Interactive device registration
fastlane add_device

# Or from file (devices.txt format):
# Device ID	Device Name
# 00008030-001234567890802E	Ron's iPhone 15

fastlane add_devices
```

---

## 🔧 Troubleshooting

### "No signing certificate found"

```bash
# Regenerate certificates
fastlane match development --force
fastlane match adhoc --force
fastlane match appstore --force
```

### "Firebase upload failed"

```bash
# Re-authenticate
firebase login:ci
# Update FIREBASE_CLI_TOKEN in .env
```

### "Could not find app on App Store Connect"

1. Ensure app is created in App Store Connect
2. Bundle ID matches exactly
3. TEAM_ID is correct

### "Build failed - code signing"

1. Open Xcode → Clean Build Folder (Cmd+Shift+K)
2. Delete DerivedData: `rm -rf ~/Library/Developer/Xcode/DerivedData`
3. Re-run: `fastlane certs`

### "Session expired"

```bash
# Re-authenticate with Apple
fastlane spaceauth -u your@email.com
```

---

## 📁 File Structure

```
Aperture/
├── fastlane/
│   ├── Fastfile          # Lane definitions
│   ├── Appfile           # App configuration
│   ├── Matchfile         # Code signing config
│   ├── Pluginfile        # Fastlane plugins
│   ├── .env.default      # Environment template
│   ├── .env              # Your secrets (git-ignored)
│   └── README.md         # This file
├── Gemfile               # Ruby dependencies
└── build/                # Build outputs (git-ignored)
```

---

## 🔐 Security Notes

1. **Never commit `.env`** - it contains secrets
2. Use a **private** repository for Match certificates
3. Use **app-specific passwords**, not your main Apple password
4. Rotate `FIREBASE_CLI_TOKEN` periodically

---

## 💡 Pro Tips

### Distribute to Both Platforms at Once
```bash
fastlane distribute notes:"Big update! 🚀"
```

### Skip Git Check (for quick builds)
```bash
SKIP_GIT_CHECK=1 fastlane firebase
```

### Wait for TestFlight Processing
```bash
fastlane beta wait:true
```

### Distribute to External TestFlight Testers
```bash
fastlane beta external:true groups:"Beta Testers"
```

---

## 📚 Resources

- [Fastlane Docs](https://docs.fastlane.tools)
- [Firebase App Distribution](https://firebase.google.com/docs/app-distribution)
- [TestFlight Documentation](https://developer.apple.com/testflight/)
- [Match (Code Signing)](https://docs.fastlane.tools/actions/match/)

---

## 🐉 Happy Distributing!

Questions? Check the docs or ping Ron.
