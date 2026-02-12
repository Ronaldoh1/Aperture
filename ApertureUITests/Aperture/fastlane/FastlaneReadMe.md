# 🚀 Aperture Fastlane Setup

Automated deployment to **TestFlight** and **Firebase App Distribution**.

## Quick Start

```bash
# 1. Run setup script
./fastlane/setup.sh

# 2. Update credentials
# Edit fastlane/Appfile with your Apple ID and Team ID

# 3. Verify build
fastlane build

# 4. Deploy to TestFlight
fastlane beta

# 5. Deploy to Firebase
fastlane firebase

# 6. Deploy to BOTH 🔥
fastlane beta_all
```

---

## 📋 Available Lanes

| Command | Description |
|---------|-------------|
| `fastlane build` | Verify compilation (no signing required) |
| `fastlane beta` | Deploy to TestFlight |
| `fastlane firebase` | Deploy to Firebase App Distribution |
| `fastlane beta_all` | Deploy to BOTH platforms |
| `fastlane adhoc` | Build ad-hoc IPA for direct sharing |
| `fastlane release` | Submit to App Store |
| `fastlane certs` | Sync all certificates via Match |
| `fastlane register_device` | Add a new test device |
| `fastlane test` | Run unit tests |

---

## 🔧 Initial Setup

### Step 1: Install Tools

```bash
# Install Fastlane
brew install fastlane

# Install Firebase CLI
brew install firebase-cli

# Install Firebase plugin
cd /path/to/Aperture
fastlane add_plugin firebase_app_distribution
```

### Step 2: Configure Appfile

Edit `fastlane/Appfile`:

```ruby
app_identifier("com.sunflow.aperture")
apple_id("your@email.com")        # Your Apple ID
team_id("XXXXXXXXXX")             # Your Team ID
```

**Find your Team ID:**
1. Go to https://developer.apple.com/account
2. Click "Membership" in the sidebar
3. Copy your "Team ID"

### Step 3: Firebase Setup

1. **Get your Firebase App ID:**
   - Go to [Firebase Console](https://console.firebase.google.com)
   - Select your project
   - Click ⚙️ → Project Settings
   - Scroll to "Your apps" → iOS app
   - Copy the "App ID" (looks like `1:123456789:ios:abcdef`)

2. **Get a CLI Token:**
   ```bash
   firebase login:ci
   # Follow the browser prompt
   # Copy the token that appears
   ```

3. **Set environment variables:**
   ```bash
   # Add to ~/.zshrc or ~/.bashrc
   export FIREBASE_APP_ID="1:123456789:ios:abcdef"
   export FIREBASE_CLI_TOKEN="your_token_here"
   ```

### Step 4: Add Testers

**For Firebase:**
Edit `fastlane/testers.txt`:
```
ron@sunflow.io
tester1@example.com
tester2@example.com
```

**Or create a group in Firebase Console:**
1. Firebase Console → App Distribution
2. Click "Testers & Groups"
3. Create a group named `aperture-testers`
4. Add tester emails

---

## 🔐 Code Signing (Match)

Match stores your certificates in a private Git repo for team sharing.

### Setup Match

```bash
# 1. Create a PRIVATE repo for certificates
# Example: github.com/your-org/aperture-certificates

# 2. Initialize Match
fastlane match init

# 3. Generate certificates
fastlane match development
fastlane match adhoc
fastlane match appstore
```

### Using Match

```bash
# Sync all certs (read-only)
fastlane certs

# Force regenerate (if expired)
fastlane match development --force
```

---

## 📱 Device Registration

### Add a Single Device

```bash
fastlane register_device
# Enter device name and UDID when prompted
```

### Add Multiple Devices

Edit `fastlane/devices.txt`:
```
Device ID	Device Name
00008030-001234567890ABCD	Ron's iPhone 15 Pro
00008030-001234567890EFGH	Test iPhone 14
```

Then run:
```bash
fastlane register_devices_file
```

### Find Device UDID

1. Connect device to Mac
2. Open Finder
3. Click on your device
4. Click on the device info text under the name
5. Copy the UDID

---

## 🔑 Environment Variables

Create `fastlane/.env` from template:
```bash
cp fastlane/.env.default fastlane/.env
```

**Required Variables:**

| Variable | Description |
|----------|-------------|
| `APPLE_ID` | Your Apple ID email |
| `TEAM_ID` | Apple Developer Team ID |
| `FIREBASE_APP_ID` | Firebase iOS App ID |
| `FIREBASE_CLI_TOKEN` | Token from `firebase login:ci` |

**Optional Variables:**

| Variable | Description |
|----------|-------------|
| `MATCH_PASSWORD` | Password for Match encryption |
| `SLACK_URL` | Slack webhook for notifications |

---

## 🏃 Usage Examples

### Deploy to TestFlight

```bash
fastlane beta
# Builds, signs, uploads to TestFlight
# Build available in ~15-30 minutes
```

### Deploy to Firebase

```bash
fastlane firebase
# Builds ad-hoc, uploads to Firebase
# Testers get email immediately
```

### Deploy to Both

```bash
fastlane beta_all
# Uploads to TestFlight AND Firebase in one command
```

### With Custom Changelog

```bash
fastlane beta changelog:"Fixed bug X, added feature Y"
fastlane firebase notes:"New scanning UI"
```

### App Store Release

```bash
fastlane release version:"1.0.0"
# Builds, uploads, creates git tag
```

---

## 🔄 CI/CD Integration

### GitHub Actions

```yaml
name: Deploy

on:
  push:
    branches: [main]

jobs:
  deploy:
    runs-on: macos-latest
    steps:
      - uses: actions/checkout@v3
      
      - name: Install Fastlane
        run: brew install fastlane
        
      - name: Deploy to TestFlight
        env:
          APPLE_ID: ${{ secrets.APPLE_ID }}
          TEAM_ID: ${{ secrets.TEAM_ID }}
          MATCH_PASSWORD: ${{ secrets.MATCH_PASSWORD }}
          FIREBASE_CLI_TOKEN: ${{ secrets.FIREBASE_CLI_TOKEN }}
        run: fastlane beta_all
```

---

## 🐛 Troubleshooting

### "No signing certificate found"

```bash
fastlane match development --force
fastlane match adhoc --force
```

### "Invalid credentials"

```bash
# Clear stored credentials
fastlane fastlane-credentials remove --username your@email.com

# Re-enter credentials
fastlane beta
```

### Firebase upload fails

```bash
# Verify token is valid
firebase login:ci --reauth

# Update token
export FIREBASE_CLI_TOKEN="new_token"
```

### Build number conflict

```bash
# Fastlane auto-increments, but if you need to reset:
agvtool new-version -all 1
```

---

## 📁 File Structure

```
fastlane/
├── Appfile          # App identifier, Apple ID, Team ID
├── Fastfile         # Lane definitions
├── Matchfile        # Code signing configuration
├── Pluginfile       # Fastlane plugins
├── .env.default     # Environment template (safe to commit)
├── .env             # Your secrets (DO NOT COMMIT)
├── testers.txt      # Firebase tester emails
├── devices.txt      # Test device UDIDs
├── setup.sh         # Setup script
└── README.md        # This file
```

---

## 🆘 Help

```bash
# List all lanes
fastlane list

# Lane details
fastlane action build_app

# Verbose output
fastlane beta --verbose
```

**Fastlane Docs:** https://docs.fastlane.tools
**Firebase Docs:** https://firebase.google.com/docs/app-distribution

---

Made with 🔥 for Aperture
