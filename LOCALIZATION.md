# Aperture — Localization Guide
## SunFlow: Reignited

---

## Supported Languages

| Code | Language | Status |
|------|----------|--------|
| `en` | English (US) | ✅ Source language |
| `es` | Spanish (neutral) | ✅ 1,877 keys |
| `es-419` | Spanish (Latin America) | ✅ 1,877 keys + LATAM overrides |

---

## Architecture

### String Catalog
All strings live in:
```
Aperture/Resources/Localization/Localizable.xcstrings
```
This is the **single source of truth**. Xcode 15+ uses `.xcstrings` as the catalog format.

### Fallback Chain
Apple automatically falls back in order:
```
es-419 → es → en
```
So if a string is only in `es`, LATAM users see it. If it's only in `en`, both Spanish locales fall back to English.

### lproj Files
Generated from the xcstrings catalog for compatibility and runtime bundle lookups:
```
Resources/Localization/
  en.lproj/Localizable.strings
  es.lproj/Localizable.strings
  es-419.lproj/Localizable.strings   ← LATAM-specific overrides
```

---

## How SwiftUI Text() Localization Works

SwiftUI `Text()` automatically looks up the string in `Localizable.xcstrings`:

```swift
// This is automatically localized:
Text("Sign In")
// → looks up "Sign In" in Localizable.xcstrings
// → returns "Iniciar sesión" for es-419 users
```

**No extra code needed** for standard UI strings. Just make sure the key exists in xcstrings.

---

## Adding New Strings

### 1. For UI strings (Text, labels, buttons)

Just write `Text("Your String")` — Xcode will flag it for localization during export.

To add manually to xcstrings, add an entry like:
```json
"Your New String": {
  "localizations": {
    "es": {
      "stringUnit": {
        "state": "translated",
        "value": "Tu nueva cadena"
      }
    },
    "es-419": {
      "stringUnit": {
        "state": "translated",
        "value": "Tu nueva cadena"
      }
    }
  }
}
```

### 2. For programmatic strings (in Swift code)

Use the `.localized` extension:
```swift
let message = "Error occurred".localized
label.text = "Hello %@".localizedFormat(userName)
```

### 3. For course content (long-form text)

Course body text is stored in Swift data files. To localize:
1. Add a `bodyES: String?` property to the content struct
2. Return `bodyES ?? body` based on current locale
3. Or use the `LocalizationManager` to select content blocks

---

## LATAM Spanish Guidelines

### ✅ Use
- `ustedes` (not `vosotros`)  
- `computadora` / `computador` (not `ordenador`)
- `celular` (not `móvil`)
- `tomar`, `obtener`, `agarrar` (not `coger` — vulgar in LATAM)
- `tú` forms throughout (tuteo is universal in LATAM)
- `app` (same in LATAM — widely understood)

### ❌ Avoid
- `vosotros` / `vuestro` / `vuestra`
- `ordenador`
- `coger` in any context
- Spain-specific idioms: `tío`, `hostia`, `molar` etc.
- `vos` forms (unless specifically targeting Argentina/Uruguay)

### Tone
Match the SunFlow brand voice: **direct, awakened, powerful.**
- English: "Discover the pattern of who you came here to be"
- Spanish: "Descubre el patrón de quién viniste a ser"  
  *(not "Descubra usted..." — keep tú, keep the energy)*

---

## Adding a New Language

1. Add the `AppLanguage` case in `Core/Localization/LocalizationManager.swift`
2. Create `Resources/Localization/[code].lproj/Localizable.strings`
3. Add the language to Xcode project → Project → Info → Localizations
4. Add translations to `Localizable.xcstrings`
5. Update `LanguagePickerView` if needed

---

## In-App Language Switching

`LocalizationManager.shared` handles language selection. Wire the picker into Settings:

```swift
// In SettingsView or ProfileView:
@State private var showLanguagePicker = false

Button { showLanguagePicker = true } label: {
    HStack {
        Text("🌐")
        Text("Language")
        Spacer()
        Text(LocalizationManager.shared.currentLanguage.nativeName)
            .foregroundColor(.secondary)
    }
}
.sheet(isPresented: $showLanguagePicker) {
    LanguagePickerView()
}
```

Language selection persists across launches via `UserDefaults`.
Full language switch takes effect on the next app launch (iOS system requirement).

---

## Build Process

To regenerate `.lproj` files from the xcstrings catalog (after adding translations):
```bash
# Run from project root:
python3 Scripts/generate_lproj.py
```

This script is in `Scripts/generate_lproj.py`.

---

## Files Changed in Build 38 (Localization Sprint)

| File | Change |
|------|--------|
| `Core/Localization/LocalizationManager.swift` | **NEW** — language manager, picker UI, String extension |
| `Resources/Localization/Localizable.xcstrings` | +93 new keys, +1,877 es-419 translations |
| `Resources/Localization/es-419.lproj/Localizable.strings` | **NEW** — 140 LATAM-specific overrides |
| `Resources/Localization/es.lproj/Localizable.strings` | **NEW** — 1,877 base Spanish keys |
| `Modules/Auth/Interactor/AuthInteractor.swift` | Fixed: missing closing `}` |
| `Core/Services/GoogleSignInService.swift` | Fixed: duplicate protocol+class removed |
| `Modules/Awakening/Courses/ChosenOnes/ChosenOnesAnimations.swift` | Fixed: `PulseRing(id:)` |
| `Modules/Awakening/Courses/DemocracyDecoded/DemocracyDecodedData.swift` | Fixed: `[:]` dict literal |
