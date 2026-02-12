# 🌟 Aperture - Awaken Your Consciousness

<p align="center">
  <strong>A consciousness education platform disguised as an iOS app</strong>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/iOS-17.0+-blue.svg" alt="iOS 17+">
  <img src="https://img.shields.io/badge/Swift-5.9-orange.svg" alt="Swift 5.9">
  <img src="https://img.shields.io/badge/SwiftUI-5.0-purple.svg" alt="SwiftUI">
  <img src="https://img.shields.io/badge/Architecture-VIPER-green.svg" alt="VIPER">
</p>

---

## 📖 Table of Contents

1. [Overview](#-overview)
2. [Getting Started](#-getting-started)
3. [Project Structure](#-project-structure)
4. [Architecture](#-architecture)
5. [Features](#-features)
6. [Code Standards](#-code-standards)
7. [Localization](#-localization)
8. [Widget Setup](#-widget-setup)
9. [Testing Checklist](#-testing-checklist)
10. [Changelog](#-changelog)
11. [Troubleshooting](#-troubleshooting)

---

## 🌅 Overview

**Aperture** is an iOS application designed to facilitate consciousness awakening through educational content, gamification, and a unique dragon companion system. The app teaches users what traditional education systems omit: financial literacy, constitutional rights, digital security, and expanded awareness.

### Mission Statement
> "Open your aperture. See beyond the matrix. Awaken to truth."

### Target Audience
- Individuals seeking alternative education
- Those questioning mainstream narratives
- People interested in consciousness expansion
- Users wanting practical life skills (finance, rights, security)

---

## 🚀 Getting Started

### Requirements
- Xcode 15.0+
- iOS 17.0+
- CocoaPods or Swift Package Manager
- Firebase project (for auth/analytics)

### Installation

```bash
# Clone the repository
git clone https://github.com/sunflow/aperture.git
cd aperture

# Install dependencies (if using CocoaPods)
pod install

# Open workspace
open Aperture.xcworkspace
```

### Firebase Setup
1. Create a Firebase project at console.firebase.google.com
2. Download `GoogleService-Info.plist`
3. Place in `Aperture/Aperture/` folder
4. Enable Authentication (Apple, Email/Password)
5. Enable Firestore Database
6. Enable Crashlytics

### First Build
1. Select the `Aperture` scheme
2. Choose a simulator or device
3. Press `Cmd+R` to build and run

---

## 📁 Project Structure

```
Aperture/
├── Aperture/                    # Main App Target
│   ├── App/                     # App entry point
│   │   ├── ApertureApp.swift    # @main entry
│   │   └── AppRootView.swift    # Root navigation
│   │
│   ├── Core/                    # Shared components
│   │   ├── Achievements/        # Achievement system
│   │   ├── Auth/                # Authentication
│   │   ├── Colors/              # Palette & themes
│   │   ├── Components/          # Reusable UI
│   │   ├── Dragon/              # Dragon companion
│   │   ├── Extensions/          # Swift extensions
│   │   ├── Haptics/             # HapticManager
│   │   ├── Intelligence/        # Recommendations
│   │   ├── Keychain/            # Secure storage
│   │   ├── Persistence/         # Core Data
│   │   ├── Progress/            # ProgressTracker
│   │   └── Sharing/             # SparkManager
│   │
│   ├── Modules/                 # Feature modules (VIPER)
│   │   ├── Alexandria/          # Resources library
│   │   ├── Awakening/           # Courses hub
│   │   ├── Cosmos/              # Sacred geometry
│   │   ├── DragonCompanion/     # Dragon UI
│   │   ├── Landing/             # Home screen
│   │   ├── More/                # Settings
│   │   ├── Onboarding/          # First-run flow
│   │   ├── PsyopScanner/        # Media analysis
│   │   ├── RootTabView/         # Tab navigation
│   │   └── Timeline/            # Historical events
│   │
│   ├── Resources/               # Assets & localization
│   │   ├── Assets.xcassets/     # Images & colors
│   │   └── Localization/        # String catalogs
│   │
│   ├── DI/                      # Dependency injection
│   └── ApertureWidgets/         # Widget extension
│
└── Aperture.xcodeproj           # Xcode project
```

---

## 🏗 Architecture

### VIPER Pattern

Each feature module follows VIPER:

```
┌─────────────────────────────────────────────────────────────┐
│                         MODULE                               │
├─────────────────────────────────────────────────────────────┤
│                                                              │
│  ┌─────────┐    ┌─────────────┐    ┌────────────────┐       │
│  │  VIEW   │◄───│  PRESENTER  │◄───│   INTERACTOR   │       │
│  │ SwiftUI │    │  Business   │    │  Data/Network  │       │
│  └────┬────┘    └──────┬──────┘    └───────┬────────┘       │
│       │                │                    │                │
│       │                ▼                    ▼                │
│       │         ┌─────────────┐    ┌────────────────┐        │
│       └────────►│   ROUTER    │    │    ENTITY      │        │
│                 │  Navigation │    │  Data Models   │        │
│                 └─────────────┘    └────────────────┘        │
│                                                              │
│  ┌─────────────────────────────────────────────────────┐    │
│  │                    ASSEMBLY                          │    │
│  │           Dependency Injection (Swinject)            │    │
│  └─────────────────────────────────────────────────────┘    │
└─────────────────────────────────────────────────────────────┘
```

### Component Responsibilities

| Component | Responsibility |
|-----------|---------------|
| **View** | UI rendering, user input |
| **Presenter** | Business logic, state management |
| **Interactor** | Data fetching, processing |
| **Entity** | Data models, DTOs |
| **Router** | Navigation, deep linking |
| **Assembly** | Dependency injection |

### Data Flow

```
User Action → View → Presenter → Interactor → Entity/Repository
                                      ↓
                              Core Data / Firebase
                                      ↓
User sees ← View ← Presenter ← Interactor ← Response
```

---

## ✨ Features

### 🐉 Dragon Companion System
- **5 Evolution Stages**: Naga → Serpent → Dragon → Awakened → Enlightened
- **XP Progression**: Earn experience through learning
- **Persistent State**: Core Data + CloudKit sync
- **Animated Companion**: Breathing animations, particle effects

### 📚 Educational Courses
| Category | Courses |
|----------|---------|
| **Financial** | Money Fundamentals, Stock Market, Crypto, Anti-Scam |
| **Rights** | Know Your Rights, Immigration Law, Constitution 101 |
| **Security** | Password Management, Privacy, Encryption |
| **Consciousness** | Dragon Ball Awakening, Mirror Principle, Sacred Etymology |

### 🌌 Cosmic Features
- **Timeline View**: Historical events through awakened lens
- **Cosmos View**: Sacred geometry visualizations
- **Alexandria Library**: Curated resources

### 🔐 Security
- Face ID / Touch ID authentication
- Keychain secure storage
- Auto-lock with configurable timeout
- Crashlytics error reporting

### 📱 iOS Integration
- Widgets (Home/Lock Screen)
- Deep Links
- Share Sheet
- Haptic Feedback (35+ touch points)
- VoiceOver & Dynamic Type support

---

## 📝 Code Standards

### Closure Rules (CRITICAL)

**Never mix `$0` with explicit parameter names in nested closures:**

```swift
// ❌ BAD - Causes compiler error
.filter { !progress.contains { prog in prog.courseId == $0.id } }

// ✅ GOOD - Use explicit names consistently
.filter { course in !progress.contains { prog in prog.courseId == course.id } }
```

### ForEach with Ranges

```swift
// ❌ BAD
ForEach(0..<5) { i in ... }

// ✅ GOOD
ForEach(0..<5, id: \.self) { i in ... }
```

### onChange Syntax (iOS 17+)

```swift
// ❌ DEPRECATED
.onChange(of: value) { _ in doSomething() }

// ✅ PREFERRED
.onChange(of: value) { doSomething() }
.onChange(of: value) { newValue in doSomething(newValue) }
```

### Spacer Parameters

```swift
// ❌ WRONG
Spacer(minHeight: 100)

// ✅ CORRECT
Spacer(minLength: 100)
```

### View Decomposition

**Keep view bodies under 100 lines. Extract to computed properties:**

```swift
var body: some View {
    ScrollView {
        VStack {
            headerSection      // Extracted
            contentSection     // Extracted
            footerSection      // Extracted
        }
    }
}

private var headerSection: some View {
    // Implementation
}

@ViewBuilder
private var contentSection: some View {
    // Use @ViewBuilder for conditional content
}
```

### File Size Guidelines

| File Type | Max Lines |
|-----------|-----------|
| View file | 300 |
| ViewModel | 200 |
| Model | 100 |

---

## 🌐 Localization

### Supported Languages
- English (en) - Base
- Spanish (es) - 96%+ complete
- Chinese Simplified (zh-Hans) - Planned
- Hindi (hi) - Planned
- Portuguese (pt-BR) - Planned
- French (fr) - Planned

### Adding Translations

1. Open `Localizable.xcstrings` in Xcode
2. Click "+" to add language
3. Translate strings (or use export/import for translators)
4. Test with scheme language override

### String Usage

```swift
// In code
Text("Welcome to Aperture")  // Auto-localized if in .xcstrings

// With parameters
Text("Hello, \(userName)")
```

---

## 📱 Widget Setup

### Widget Extension Structure

```
ApertureWidgets/
├── ApertureWidgets.swift       # Widget definitions
├── DragonWidget.swift          # Dragon companion widget
├── StreakWidget.swift          # Learning streak widget
└── Info.plist                  # Widget configuration
```

### Adding to Project

1. File → New → Target → Widget Extension
2. Name: `ApertureWidgets`
3. Include Configuration Intent: Yes (for customization)
4. Add App Groups capability to both targets
5. Share data via UserDefaults(suiteName: "group.com.sunflow.aperture")

### Widget Sizes

| Size | Use Case |
|------|----------|
| `.systemSmall` | Dragon face + XP |
| `.systemMedium` | Dragon + streak + next lesson |
| `.systemLarge` | Full stats dashboard |
| `.accessoryCircular` | Lock screen dragon |
| `.accessoryRectangular` | Lock screen streak |

---

## ✅ Testing Checklist

### Authentication Flow
- [ ] Fresh install → Onboarding → Legal → Age → Main
- [ ] Reinstall (data cleared) → Same as fresh
- [ ] Login → Logout → Login (clean state)
- [ ] Session expires mid-use → Redirect to login
- [ ] Sign in with Apple revoked → Handle gracefully

### Age Verification
- [ ] User < 13 → Block (COPPA)
- [ ] User 13-17 → Limited features
- [ ] User 18+ → Full access
- [ ] Birthday edge case (turns 18 today)

### Terms & Conditions
- [ ] First launch → Must accept
- [ ] Terms updated → Re-prompt
- [ ] Decline → Cannot use app

### Offline Scenarios
- [ ] Launch offline → Cached content
- [ ] Network drops mid-request → Retry/error
- [ ] Slow network → Timeout handling

### Timeline
- [ ] First launch → "You're here" at top (Awakening)
- [ ] Scroll to bottom → Ancient eras
- [ ] Tap era → back → Return to position

### Dragon Companion
- [ ] First naming → Persists
- [ ] XP gain offline → Queue sync
- [ ] Evolution threshold → Celebrate

---

## 📋 Changelog

### [1.7.0] - 2026-02-04
- **Added**: Mirror Principle, Wealth Consciousness, Levels of Thinking, Sacred Etymology courses
- **Fixed**: Build errors, duplicate file references

### [1.5.0] - 2026-01-25
- **Added**: Biometric auth, Financial courses, Widgets, Share system
- **Added**: Keychain Manager, Deep Links, Review Manager

### [1.4.0] - 2026-01-24
- **Added**: Firebase Crashlytics, Error handling system

### [1.3.0] - 2026-01-23
- **Added**: Haptic feedback (35 touch points), Accessibility helpers

### [1.2.0] - 2026-01-22
- **Added**: 12 language localization, Digital Security course

### [1.1.0] - 2026-01-20
- **Added**: Dragon Companion system (5 stages, XP, animations)

### [1.0.0] - 2026-01-18
- **Initial Release**: VIPER architecture, 5 main modules, Firebase integration

---

## 🔧 Troubleshooting

### Build Errors

**"Cannot type-check expression in reasonable time"**
- Break up the view into smaller computed properties
- Add explicit type annotations

**"Anonymous closure arguments cannot be used..."**
- Use explicit parameter names consistently in nested closures
- Change `$0` to named parameter like `course in`

**"Undefined symbol _main"**
- Swift files not in Compile Sources
- Check Build Phases → Compile Sources

### Clean Build

```bash
# Delete derived data
rm -rf ~/Library/Developer/Xcode/DerivedData/Aperture*

# Clean in Xcode
Cmd+Shift+K
```

### Firebase Issues

**Crash on launch**
- Verify `GoogleService-Info.plist` is in target
- Check Bundle ID matches Firebase config

**Auth not working**
- Enable Sign in with Apple in Firebase Console
- Add capability in Xcode

---

## 📄 License

Proprietary - SunFlow: Reignited © 2026

---

*Last Updated: February 2026*
