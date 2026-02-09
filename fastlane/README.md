# 🚀 Aperture - Fastlane Setup

Quick guide to distribute Aperture to friends via TestFlight.

## 📋 Prerequisites

1. **Xcode 15+** installed
2. **Apple Developer Account** ($99/year)
3. **Fastlane** installed:
   ```bash
   brew install fastlane
   # OR
   gem install fastlane
   ```

## ⚡ Quick Start (5 minutes)

### 1. Configure Your Apple ID

Edit `fastlane/Appfile`:
```ruby
app_identifier("com.sunflow.aperture")  # Your bundle ID
apple_id("your@email.com")              # Your Apple ID
```

### 2. Build Check (No Signing Required)

Verify the app compiles:
```bash
cd Aperture
fastlane build
```

### 3. Deploy to TestFlight

```bash
fastlane beta
```

That's it! Friends get notified automatically.

---

## 🎯 Available Commands

| Command | Description |
|---------|-------------|
| `fastlane build` | Quick build check (no signing) |
| `fastlane beta` | Deploy to TestFlight |
| `fastlane quick_beta` | Fast TestFlight (auto build #) |
| `fastlane adhoc` | Create IPA for direct sharing |
| `fastlane release` | Submit to App Store |
| `fastlane certs` | Set up code signing |
| `fastlane register_device` | Add friend's device |
| `fastlane test` | Run test suite |

---

## 👥 Adding Friends to TestFlight

### Option A: Internal Testers (Fastest)
1. Go to [App Store Connect](https://appstoreconnect.apple.com)
2. Select your app → TestFlight → Internal Testing
3. Click + next to "App Store Connect Users"
4. Add their Apple ID email
5. They get an email invite immediately

### Option B: External Testers (Up to 10,000)
1. App Store Connect → TestFlight → External Testing
2. Create a group (e.g., "Friends")
3. Add email addresses
4. Submit build for review (usually <24 hours)

### Option C: Public Link
1. App Store Connect → TestFlight → External Testing
2. Enable "Public Link"
3. Share the link with anyone!

---

## 📱 Direct Device Distribution (Ad-Hoc)

For when TestFlight is too slow:

### 1. Get Friend's Device UDID
Have them:
- Connect iPhone to Mac
- Open Finder → Select iPhone
- Click on device info to reveal UDID
- Copy and send to you

### 2. Register Device
```bash
fastlane register_device
# Enter their device name and UDID
```

### 3. Build & Share
```bash
fastlane adhoc
```

Share the IPA via AirDrop or file transfer.

---

## 🔐 Code Signing Setup (First Time)

### Option 1: Automatic (Recommended)
Xcode handles it:
1. Open Aperture.xcodeproj
2. Signing & Capabilities → Check "Automatically manage signing"
3. Select your team

### Option 2: Match (Team Sharing)
For sharing certs across team:

1. Create a private GitHub repo for certificates
2. Run:
   ```bash
   fastlane match init
   # Follow prompts
   ```
3. Generate certs:
   ```bash
   fastlane certs
   ```

---

## 🐛 Troubleshooting

### "No signing certificate"
```bash
# Reset signing in Xcode:
# 1. Signing & Capabilities → Uncheck/recheck automatic signing
# 2. Or run:
fastlane certs
```

### "Build failed"
```bash
# Clean build:
rm -rf ~/Library/Developer/Xcode/DerivedData
fastlane build
```

### "Upload failed"
```bash
# Ensure you're logged into App Store Connect:
fastlane spaceauth -u your@email.com
```

### "Device not registered"
```bash
fastlane register_device
# Then rebuild with: fastlane adhoc
```

---

## 📊 Build Numbers

Fastlane auto-generates build numbers using timestamp format:
- `20240209.1430` = Feb 9, 2024 at 2:30 PM

This ensures unique, sequential builds.

---

## 🔄 Typical Workflow

```bash
# 1. Make your changes in Xcode

# 2. Verify it builds
fastlane build

# 3. Deploy to TestFlight
fastlane beta

# 4. Friends get notified and can update!
```

---

## 📁 Files Reference

```
Aperture/
├── fastlane/
│   ├── Fastfile      # Lane definitions
│   ├── Appfile       # App configuration
│   └── README.md     # This file
├── Gemfile           # Ruby dependencies
└── build/            # Output IPAs (gitignored)
```

---

## 💡 Pro Tips

1. **Skip Git Check**: `SKIP_GIT_CHECK=1 fastlane beta`
2. **Custom Changelog**: `fastlane beta changelog:"Fixed the dragon bug 🐉"`
3. **CI/CD**: Use GitHub Actions with fastlane for auto-deploys

---

## 🐉 Happy Deploying!

Questions? Check [fastlane docs](https://docs.fastlane.tools) or ping Ron.
