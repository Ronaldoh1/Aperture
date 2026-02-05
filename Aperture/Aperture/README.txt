# 🌟 Aperture - Awaken Your Consciousness

<p align="center">
  <img src="Assets.xcassets/AppIcon.appiconset/icon.png" width="120" height="120" alt="Aperture Logo">
</p>

<p align="center">
  <strong>A consciousness education platform disguised as an iOS app</strong>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/iOS-17.0+-blue.svg" alt="iOS 17+">
  <img src="https://img.shields.io/badge/Swift-5.9-orange.svg" alt="Swift 5.9">
  <img src="https://img.shields.io/badge/SwiftUI-5.0-purple.svg" alt="SwiftUI">
  <img src="https://img.shields.io/badge/Architecture-VIPER-green.svg" alt="VIPER">
  <img src="https://img.shields.io/badge/License-Proprietary-red.svg" alt="License">
</p>

---

## 📖 Table of Contents

- [Overview](#-overview)
- [Features](#-features)
- [Architecture](#-architecture)
- [Tech Stack](#-tech-stack)
- [Project Structure](#-project-structure)
- [Getting Started](#-getting-started)
- [Configuration](#-configuration)
- [Authentication](#-authentication)
- [Core Modules](#-core-modules)
- [Debugging](#-debugging)
- [Testing](#-testing)
- [Performance](#-performance)
- [Localization](#-localization)
- [Contributing](#-contributing)
- [Troubleshooting](#-troubleshooting)

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

## ✨ Features

### 🐉 Dragon Companion System
- **5 Evolution Stages**: Naga (Cucumber) → Serpent → Dragon → Awakened → Enlightened
- **XP Progression**: Earn experience through learning
- **Persistent State**: Core Data + CloudKit sync
- **Animated Companion**: Breathing animations, particle effects

### 📚 Educational Courses
| Category | Courses |
|----------|---------|
| **Financial Literacy** | Money Fundamentals, Stock Market, Crypto, Anti-Scam |
| **Constitutional Rights** | Know Your Rights, Immigration Law, Police Encounters |
| **Digital Security** | Password Management, Privacy, Encryption |
| **Consciousness** | Dragon Ball Awakening, Master Lies, Birth Chart |

### 🌌 Cosmic Features
- **Timeline View**: Historical events through awakened lens
- **Cosmos View**: Sacred geometry visualizations
- **Alexandria Library**: Curated documentaries and resources

### 🔐 Security Features
- **Face ID / Touch ID**: Biometric authentication
- **Keychain Storage**: Secure credential management
- **Auto-Lock**: Configurable timeout
- **Error Handling**: Crash prevention with Crashlytics

### 📱 iOS Integration
- **Widgets**: Dragon companion on Home/Lock Screen
- **Deep Links**: URL scheme navigation
- **Share Sheet**: Social sharing
- **Haptic Feedback**: 35+ touch points
- **Accessibility**: VoiceOver, Dynamic Type support

---

## 🏗 Architecture

### VIPER Pattern

Aperture follows the **VIPER** architectural pattern for clean separation of concerns:

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
│       │                │                    ▼                │
│       │                │           ┌────────────────┐        │
│       │                │           │    ENTITY      │        │
│       │                │           │  Data Models   │        │
│       │                │           └────────────────┘        │
│       │                │                                     │
│       │                ▼                                     │
│       │         ┌─────────────┐                              │
│       └────────►│   ROUTER    │                              │
│                 │  Navigation │                              │
│                 └─────────────┘                              │
│                                                              │
│  ┌─────────────────────────────────────────────────────┐    │
│  │                    ASSEMBLY                          │    │
│  │           Dependency Injection (Swinject)            │    │
│  └─────────────────────────────────────────────────────┘    │
│                                                              │
└─────────────────────────────────────────────────────────────┘
```

### Component Responsibilities

| Component | Responsibility | Protocol |
|-----------|---------------|----------|
| **View** | UI rendering, user input | `ViewProtocol` |
| **Presenter** | Business logic, state management | `PresenterProtocol` |
| **Interactor** | Data fetching, processing | `InteractorProtocol` |
| **Entity** | Data models, DTOs | Codable structs |
| **Router** | Navigation, deep linking | `RouterProtocol` |
| **Assembly** | Dependency injection | Swinject Container |

### Data Flow

```
User Action → View → Presenter → Interactor → Entity/Repository
                                      ↓
                              Core Data / Firebase
                                      ↓
User sees ← View ← Presenter ← Interactor ← Response
```

---

## 🛠 Tech Stack

### Core Frameworks

| Framework | Version | Purpose |
|-----------|---------|---------|
| **SwiftUI** | 5.0 | Declarative UI |
| **Combine** | - | Reactive programming |
| **Core Data** | - | Local persistence |
| **CloudKit** | - | Cloud sync |
| **LocalAuthentication** | - | Biometrics |
| **WidgetKit** | - | Home/Lock Screen widgets |

### Dependencies (Swift Package Manager)

| Package | Version | Purpose |
|---------|---------|---------|
| **Firebase** | 11.x | Auth, Crashlytics, Firestore |
| **Swinject** | 2.9.x | Dependency injection |
| **SwiftyBeaver** | 2.x | Logging |

### Firebase Services

```swift
// Configured in GoogleService-Info.plist
- FirebaseAuth        // User authentication
- FirebaseCrashlytics // Crash reporting
- FirebaseFirestore   // Cloud database
- FirebaseAnalytics   // Usage analytics
```

---

## 📁 Project Structure

```
Aperture/
├── 📱 App/
│   ├── ApertureApp.swift          # App entry point
│   ├── AppDelegate.swift          # Firebase init, lifecycle
│   └── ContentView.swift          # Root view
│
├── 🧱 Core/
│   ├── Accessibility/
│   │   └── AccessibilityHelpers.swift
│   ├── Auth/
│   │   ├── AuthenticationManager.swift
│   │   ├── AuthenticationView.swift
│   │   ├── BiometricAuth.swift
│   │   └── SignInWithApple.swift
│   ├── DeepLinks/
│   │   └── DeepLinkHandler.swift
│   ├── Error/
│   │   └── ErrorHandling.swift
│   ├── Haptics/
│   │   └── HapticManager.swift
│   ├── Keychain/
│   │   └── KeychainManager.swift
│   ├── Localization/
│   │   └── LocalizationManager.swift
│   ├── Persistence/
│   │   └── PersistenceController.swift
│   ├── Review/
│   │   └── ReviewManager.swift
│   ├── Services/
│   │   ├── APIServiceType.swift
│   │   └── StorageService.swift
│   ├── Share/
│   │   └── ShareManager.swift
│   └── Widget/
│       └── WidgetDataSync.swift
│
├── 📦 Modules/
│   ├── Awakening/
│   │   ├── Assembly/
│   │   ├── Contract/
│   │   ├── Entity/
│   │   ├── Interactor/
│   │   ├── Presenter/
│   │   ├── Router/
│   │   ├── View/
│   │   └── SubModules/
│   │       ├── Courses/
│   │       │   ├── FinancialLiteracy/
│   │       │   ├── DragonBallAwakening/
│   │       │   ├── MasterLies/
│   │       │   └── BirthChart/
│   │       ├── KnowYourRights/
│   │       ├── DigitalSecurity/
│   │       ├── Constitution101/
│   │       └── ImmigrationLaw/
│   │
│   ├── DragonCompanion/
│   │   ├── Assembly/
│   │   ├── Contract/
│   │   ├── Entity/
│   │   ├── Interactor/
│   │   ├── Presenter/
│   │   ├── Router/
│   │   └── View/
│   │
│   ├── Timeline/
│   ├── Cosmos/
│   ├── Alexandria/
│   ├── More/
│   ├── Tutorial/
│   └── Root TabView/
│
├── 🧩 Extensions/
│   └── ApertureWidget/
│       ├── ApertureWidgets.swift
│       └── ApertureWidgetBundle.swift
│
├── 🎨 Resources/
│   ├── Assets.xcassets/
│   ├── GoogleService-Info.plist
│   └── Localizable.strings
│
├── 📊 Aperture.xcdatamodeld/      # Core Data model
├── 📋 Info.plist
└── 📖 README.md
```

---

## 🚀 Getting Started

### Prerequisites

- **Xcode 15.0+**
- **iOS 17.0+ SDK**
- **macOS Sonoma 14.0+** (recommended)
- **Apple Developer Account** (for device testing)

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/sunflow/aperture.git
   cd aperture
   ```

2. **Open in Xcode**
   ```bash
   open Aperture.xcodeproj
   ```

3. **Resolve Swift Packages**
   - Xcode will automatically fetch dependencies
   - If not: File → Packages → Resolve Package Versions

4. **Configure Firebase**
   - Add your `GoogleService-Info.plist` to the project
   - Or use the existing development configuration

5. **Build and Run**
   - Select target device/simulator
   - Press `Cmd + R`

### First Run Checklist

- [ ] Swift packages resolved
- [ ] GoogleService-Info.plist present
- [ ] Signing configured (Team ID)
- [ ] Info.plist has Face ID usage description

---

## ⚙️ Configuration

### Info.plist Keys

```xml
<!-- Biometric Authentication -->
<key>NSFaceIDUsageDescription</key>
<string>Use Face ID for quick, secure access to Aperture</string>

<!-- Camera (if needed) -->
<key>NSCameraUsageDescription</key>
<string>Take photos for your profile</string>

<!-- Photo Library -->
<key>NSPhotoLibraryUsageDescription</key>
<string>Select photos for your profile</string>
```

### Build Configurations

| Configuration | Use Case |
|--------------|----------|
| **Debug** | Development, logging enabled |
| **Release** | App Store, optimizations enabled |

### Environment Variables

```swift
// In scheme settings or xcconfig
FIREBASE_ENV = development | staging | production
API_BASE_URL = https://api.aperture.app
ENABLE_LOGGING = true | false
```

---

## 🔐 Authentication

### Authentication Flow

```
┌──────────────────┐
│   App Launch     │
└────────┬─────────┘
         │
         ▼
┌──────────────────┐     No      ┌──────────────────┐
│ Session exists?  │────────────►│ AuthenticationView│
└────────┬─────────┘             └────────┬─────────┘
         │ Yes                            │
         ▼                                ▼
┌──────────────────┐             ┌──────────────────┐
│ Biometric enabled?│            │ • Face ID        │
└────────┬─────────┘             │ • Email/Password │
         │ Yes                   │ • Guest Mode     │
         ▼                       └────────┬─────────┘
┌──────────────────┐                      │
│  LockScreenView  │                      │
│  (Face ID prompt)│                      │
└────────┬─────────┘                      │
         │                                │
         ▼                                ▼
┌──────────────────────────────────────────┐
│            Main App Content              │
└──────────────────────────────────────────┘
```

### Authentication Manager

```swift
// Check auth state
AuthenticationManager.shared.state // .authenticated, .locked, .unauthenticated

// Trigger biometric unlock
await AuthenticationManager.shared.unlockWithBiometrics()

// Sign out
AuthenticationManager.shared.signOut()

// Wrap views requiring auth
ContentView()
    .requireAuthentication()
```

### Keychain Storage

```swift
// Save secure data
KeychainManager.shared.save("token", forKey: .authToken)

// Retrieve
let token = KeychainManager.shared.getString(forKey: .authToken)

// Delete
KeychainManager.shared.delete(key: .authToken)
```

---

## 🧩 Core Modules

### Dragon Companion

The central gamification system that tracks user progress.

```swift
// Access dragon state
let dragon = DragonCompanionInteractor.shared.currentDragon

// Add XP
DragonCompanionInteractor.shared.addXP(50, reason: "Completed lesson")

// Evolution check
if dragon.canEvolve {
    DragonCompanionInteractor.shared.evolve()
}
```

**Dragon Stages:**
| Stage | Name | XP Required | Visual |
|-------|------|-------------|--------|
| 1 | Naga | 0 | 🥒 Cucumber |
| 2 | Serpent | 500 | 🐍 Snake |
| 3 | Dragon | 1,500 | 🐉 Dragon |
| 4 | Awakened | 4,000 | 🌟 Star |
| 5 | Enlightened | 10,000 | ☀️ Sun |

### Course System

```swift
// Course structure
struct Course {
    let id: String
    let title: String
    let lessons: [Lesson]
    let category: CourseCategory
}

// Track completion
CourseProgressManager.shared.completeLesson(courseId: "money", lessonId: "lesson-1")

// Get progress
let progress = CourseProgressManager.shared.getProgress(for: "money") // 0.0 - 1.0
```

### Haptic Feedback

```swift
// Use throughout app for tactile feedback
HapticManager.shared.light()    // Subtle tap
HapticManager.shared.medium()   // Button press
HapticManager.shared.heavy()    // Important action
HapticManager.shared.success()  // Completion
HapticManager.shared.warning()  // Caution
HapticManager.shared.error()    // Failure
```

---

## 🐛 Debugging

### Logging

```swift
import SwiftyBeaver

let log = SwiftyBeaver.self

// Usage
log.debug("Debug message")
log.info("Info message")
log.warning("Warning message")
log.error("Error message")
```

### Console Filters

In Xcode console, filter by:
- `[Aperture]` - App logs
- `[Firebase]` - Firebase SDK logs
- `[Auth]` - Authentication logs
- `[Dragon]` - Dragon companion logs

### Debug Menu (Debug builds only)

```swift
#if DEBUG
Button("Reset Onboarding") {
    UserDefaults.standard.removeObject(forKey: "hasCompletedOnboarding")
}

Button("Add 1000 XP") {
    DragonCompanionInteractor.shared.addXP(1000, reason: "Debug")
}

Button("Force Crash (Test Crashlytics)") {
    fatalError("Test crash")
}
#endif
```

### Common Issues

#### Build Errors

| Error | Solution |
|-------|----------|
| "Multiple commands produce..." | Remove duplicate files (check Core/ subfolders) |
| "No such module 'Firebase'" | File → Packages → Resolve Package Versions |
| "Signing requires a development team" | Select team in Signing & Capabilities |

#### Runtime Errors

| Error | Solution |
|-------|----------|
| Crash on Firebase init | Ensure GoogleService-Info.plist is in target |
| Face ID not working | Add NSFaceIDUsageDescription to Info.plist |
| Core Data crash | Delete app from simulator, rebuild |

### Crashlytics

```swift
// Log non-fatal errors
ErrorHandler.shared.handle(error, context: "Loading course")

// Custom keys for crash reports
Crashlytics.crashlytics().setCustomValue(userId, forKey: "user_id")

// Log breadcrumbs
Crashlytics.crashlytics().log("User tapped lesson: \(lessonId)")
```

### Network Debugging

```swift
// In Debug scheme, enable network logging
URLSession.shared.configuration.httpAdditionalHeaders = [
    "X-Debug": "true"
]

// Use Charles Proxy or Proxyman for MITM debugging
```

---

## 🧪 Testing

### Unit Tests

```bash
# Run all tests
Cmd + U

# Run specific test
# Click diamond next to test function
```

```swift
// Example test
class DragonCompanionTests: XCTestCase {
    func testXPAddition() {
        let interactor = DragonCompanionInteractor()
        interactor.addXP(100, reason: "Test")
        XCTAssertEqual(interactor.currentDragon.xp, 100)
    }
}
```

### UI Tests

```swift
class ApertureUITests: XCTestCase {
    func testLoginFlow() {
        let app = XCUIApplication()
        app.launch()
        
        // Test biometric button exists
        XCTAssertTrue(app.buttons["Continue with Face ID"].exists)
    }
}
```

### Test Coverage

- Target: **70%+ coverage**
- Focus areas: Interactors, Presenters, Utilities
- Skip: Views (UI tests instead)

---

## ⚡ Performance

### Optimization Guidelines

1. **Images**
   - Use SF Symbols when possible
   - Compress assets with TinyPNG
   - Use `@2x` and `@3x` only

2. **Lists**
   ```swift
   // Use LazyVStack for long lists
   LazyVStack {
       ForEach(items) { item in
           ItemRow(item: item)
       }
   }
   ```

3. **Animations**
   ```swift
   // Respect reduce motion preference
   @Environment(\.accessibilityReduceMotion) var reduceMotion
   
   .animation(reduceMotion ? nil : .spring(), value: state)
   ```

4. **Memory**
   - Use `weak self` in closures
   - Cancel Combine subscriptions
   - Profile with Instruments

### Instruments Profiling

```bash
# Open Instruments
Cmd + I (from Xcode)

# Key instruments:
- Time Profiler    # CPU usage
- Allocations      # Memory leaks
- Core Animation   # UI performance
- Network          # API calls
```

---

## 🌍 Localization

### Supported Languages

| Language | Code | Status |
|----------|------|--------|
| English | `en` | ✅ Complete |
| Spanish | `es` | ✅ Complete |
| French | `fr` | ✅ Complete |
| German | `de` | ✅ Complete |
| Portuguese | `pt` | ✅ Complete |
| Chinese (Simplified) | `zh-Hans` | ✅ Complete |
| Japanese | `ja` | ✅ Complete |
| Korean | `ko` | ✅ Complete |
| Arabic | `ar` | ✅ Complete |
| Hindi | `hi` | ✅ Complete |
| Russian | `ru` | ✅ Complete |
| Italian | `it` | ✅ Complete |

### Adding Translations

```swift
// Use LocalizationManager
Text(LocalizationManager.shared.localizedString(for: "welcome_title"))

// Or SwiftUI native
Text("welcome_title", comment: "Welcome screen title")
```

### String Files Location

```
Resources/
├── en.lproj/
│   └── Localizable.strings
├── es.lproj/
│   └── Localizable.strings
└── ...
```

---

## 🤝 Contributing

### Branch Strategy

```
main           # Production releases
├── develop    # Integration branch
│   ├── feature/dragon-evolution
│   ├── feature/new-course
│   └── bugfix/crash-on-login
└── hotfix/    # Emergency fixes
```

### Commit Convention

```
feat: Add new financial literacy course
fix: Resolve crash on biometric auth
docs: Update README with debug instructions
refactor: Simplify dragon evolution logic
test: Add unit tests for CourseProgress
```

### Pull Request Checklist

- [ ] Code compiles without warnings
- [ ] All tests pass
- [ ] New code has tests
- [ ] Documentation updated
- [ ] No duplicate files
- [ ] Follows VIPER architecture

---

## 🔧 Troubleshooting

### Reset Everything

```bash
# Clean build folder
Cmd + Shift + K

# Delete derived data
rm -rf ~/Library/Developer/Xcode/DerivedData/Aperture-*

# Reset simulator
Device → Erase All Content and Settings
```

### Package Issues

```bash
# Reset package cache
File → Packages → Reset Package Caches

# Update packages
File → Packages → Update to Latest Package Versions
```

### Core Data Issues

```swift
// Delete and recreate persistent store (DEBUG only)
#if DEBUG
PersistenceController.shared.destroyPersistentStore()
#endif
```

### Firebase Issues

1. Ensure `GoogleService-Info.plist` is in the project
2. Check bundle ID matches Firebase console
3. Verify Firebase is initialized in `AppDelegate`

---

## 📄 License

Copyright © 2024-2026 SunFlow: Reignited. All rights reserved.

This software is proprietary and confidential. Unauthorized copying, distribution, or use is strictly prohibited.

---

## 📞 Support

- **Documentation**: [docs.aperture.app](https://docs.aperture.app)
- **Issues**: GitHub Issues
- **Email**: support@sunflow.app

---

<p align="center">
  <strong>Built with ❤️ by SunFlow: Reignited</strong>
</p>

<p align="center">
  <em>"The truth shall set you free, but first it will piss you off."</em>
</p>
