// LocalizationManager.swift
// Handles localization for SunFlow: Reignited
// Supports 12 languages for global reach

import SwiftUI

// MARK: - Localization Manager

class LocalizationManager: ObservableObject {

    static let shared = LocalizationManager()

    @Published var currentLanguage: AppLanguage {
        didSet {
            UserDefaults.standard.set(currentLanguage.code, forKey: "app_language")
        }
    }

    private init() {
        if let savedCode = UserDefaults.standard.string(forKey: "app_language"),
           let language = AppLanguage.allCases.first(where: { $0.code == savedCode }) {
            self.currentLanguage = language
        } else {
            let systemLanguage = Locale.current.language.languageCode?.identifier ?? "en"
            self.currentLanguage = AppLanguage.fromCode(systemLanguage)
        }
    }

    static let supportedLanguages: [AppLanguage] = AppLanguage.allCases

}

// MARK: - Supported Languages (12 Total)

enum AppLanguage: String, CaseIterable, Identifiable {
    case english = "English"
    case spanish = "Español"
    case chinese = "中文"
    case vietnamese = "Tiếng Việt"
    case tagalog = "Tagalog"
    case arabic = "العربية"
    case korean = "한국어"
    case french = "Français"
    case portuguese = "Português"
    case hindi = "हिन्दी"
    case russian = "Русский"
    case haitianCreole = "Kreyòl Ayisyen"

    var id: String { rawValue }

    var code: String {
        switch self {
        case .english: return "en"
        case .spanish: return "es"
        case .chinese: return "zh-Hans"
        case .vietnamese: return "vi"
        case .tagalog: return "tl"
        case .arabic: return "ar"
        case .korean: return "ko"
        case .french: return "fr"
        case .portuguese: return "pt-BR"
        case .hindi: return "hi"
        case .russian: return "ru"
        case .haitianCreole: return "ht"
        }
    }

    var flag: String {
        switch self {
        case .english: return "🇺🇸"
        case .spanish: return "🇪🇸"
        case .chinese: return "🇨🇳"
        case .vietnamese: return "🇻🇳"
        case .tagalog: return "🇵🇭"
        case .arabic: return "🇸🇦"
        case .korean: return "🇰🇷"
        case .french: return "🇫🇷"
        case .portuguese: return "🇧🇷"
        case .hindi: return "🇮🇳"
        case .russian: return "🇷🇺"
        case .haitianCreole: return "🇭🇹"
        }
    }

    var nativeName: String { rawValue }

    var isRTL: Bool {
        self == .arabic
    }

    static func fromCode(_ code: String) -> AppLanguage {
        switch code {
        case "es": return .spanish
        case "zh-Hans", "zh": return .chinese
        case "vi": return .vietnamese
        case "tl", "fil": return .tagalog
        case "ar": return .arabic
        case "ko": return .korean
        case "fr": return .french
        case "pt-BR", "pt": return .portuguese
        case "hi": return .hindi
        case "ru": return .russian
        case "ht": return .haitianCreole
        default: return .english
        }
    }
}

// MARK: - Language Selector View

struct LanguageSelectorView: View {

    @ObservedObject private var localization = LocalizationManager.shared
    @Environment(\.dismiss) private var dismiss

    var body: some View {

        NavigationStack {

            ZStack {

                Color.black.ignoresSafeArea()

                ScrollView {

                    VStack(spacing: 8) {

                        ForEach(LocalizationManager.supportedLanguages) { language in
                            languageButton(language)
                        }

                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 20)

                }

            }
            .navigationTitle("Language")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        dismiss()
                    }
                    .foregroundColor(Palette.accent.gold)
                }
            }

        }

    }

    private func languageButton(_ language: AppLanguage) -> some View {

        let isSelected = localization.currentLanguage == language

        return Button(action: {
            withAnimation(.spring(response: 0.3)) {
                localization.currentLanguage = language
            }
        }) {
            HStack(spacing: 14) {

                Text(language.flag)
                    .font(.title2)

                VStack(alignment: .leading, spacing: 2) {
                    Text(language.nativeName)
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(.white)

                    if language.isRTL {
                        Text("RTL")
                            .font(.system(size: 10, weight: .medium))
                            .foregroundColor(Palette.text.muted)
                    }
                }

                Spacer()

                if isSelected {
                    Image(systemName: "checkmark.circle.fill")
                        .font(.title3)
                        .foregroundColor(Palette.accent.gold)
                }

            }
            .padding(.horizontal, 16)
            .padding(.vertical, 14)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(isSelected ? Palette.accent.gold.opacity(0.15) : Color.white.opacity(0.05))
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(isSelected ? Palette.accent.gold.opacity(0.3) : Color.clear, lineWidth: 1)
                    )
            )
        }

    }

}

// MARK: - Localized Rights Scripts Helper

struct LocalizedRightsScripts {

    // Returns the 7 critical scripts in current language
    static func getScripts() -> [RightsScript] {
        [
            RightsScript(
                key: "silence",
                icon: "hand.raised.fill",
                english: "I invoke my Fifth Amendment right to remain silent."
            ),
            RightsScript(
                key: "nosearch",
                icon: "magnifyingglass.circle.fill",
                english: "I do not consent to any searches."
            ),
            RightsScript(
                key: "detained",
                icon: "figure.walk",
                english: "Am I being detained or am I free to go?"
            ),
            RightsScript(
                key: "attorney",
                icon: "person.crop.rectangle.fill",
                english: "I want to speak to an attorney."
            ),
            RightsScript(
                key: "noentry",
                icon: "house.fill",
                english: "I do not consent to entry into my home."
            ),
            RightsScript(
                key: "warrant",
                icon: "doc.text.fill",
                english: "Please show me a warrant signed by a judge."
            ),
            RightsScript(
                key: "nosign",
                icon: "pencil.slash",
                english: "I do not wish to sign any documents."
            )
        ]
    }

}

struct RightsScript: Identifiable {
    let id = UUID()
    let key: String
    let icon: String
    let english: String

    var localizedText: String {
        NSLocalizedString("rights.script.\(key)", comment: "")
    }
}

// MARK: - Preview

#Preview {
    LanguageSelectorView()
}
