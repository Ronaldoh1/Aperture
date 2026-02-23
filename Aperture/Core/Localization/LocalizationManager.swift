// LocalizationManager.swift
// SunFlow: Reignited — Aperture
// Manages in-app language selection with LATAM Spanish (es-419) support

import Foundation
import SwiftUI

// MARK: - Supported Languages

enum AppLanguage: String, CaseIterable, Identifiable {
    case systemDefault          = "system"
    case english                = "en"
    case latinAmericanSpanish   = "es-419"

    var id: String { rawValue }

    var displayName: String {
        switch self {
        case .systemDefault:        return "System Default"
        case .english:              return "English"
        case .latinAmericanSpanish: return "Español (Latinoamérica)"
        }
    }

    var nativeName: String {
        switch self {
        case .systemDefault:        return "Sistema"
        case .english:              return "English"
        case .latinAmericanSpanish: return "Español"
        }
    }

    var flag: String {
        switch self {
        case .systemDefault:        return "🌐"
        case .english:              return "🇺🇸"
        case .latinAmericanSpanish: return "🌎"
        }
    }
}

// MARK: - Manager

@MainActor
final class LocalizationManager: ObservableObject {

    static let shared = LocalizationManager()
    private let storageKey = "aperture_app_language"

    @Published private(set) var currentLanguage: AppLanguage {
        didSet {
            persist(currentLanguage)
            NotificationCenter.default.post(name: .appLanguageDidChange, object: currentLanguage)
        }
    }

    private init() {
        let saved = UserDefaults.standard.string(forKey: "aperture_app_language")
        currentLanguage = AppLanguage(rawValue: saved ?? "system") ?? .systemDefault
    }

    func setLanguage(_ language: AppLanguage) {
        currentLanguage = language
    }

    // MARK: - String lookup (MainActor — use inside @MainActor contexts)

    func localized(_ key: String) -> String {
        LocalizationManager.localizedKey(key, language: currentLanguage)
    }

    // MARK: - Nonisolated lookup (safe from any context, e.g. String extensions)
    // Reads language from UserDefaults directly — no actor hop required.

    nonisolated static func localizedKey(_ key: String, language: AppLanguage? = nil) -> String {
        let lang: AppLanguage
        if let language {
            lang = language
        } else {
            let saved = UserDefaults.standard.string(forKey: "aperture_app_language")
            lang = AppLanguage(rawValue: saved ?? "system") ?? .systemDefault
        }
        guard lang != .systemDefault else {
            return NSLocalizedString(key, comment: "")
        }
        let fallbackChain: [String]
        switch lang {
        case .latinAmericanSpanish: fallbackChain = ["es-419", "es"]
        default:                    fallbackChain = [lang.rawValue]
        }
        for code in fallbackChain {
            if let path = Bundle.main.path(forResource: code, ofType: "lproj"),
               let bundle = Bundle(path: path) {
                let val = bundle.localizedString(forKey: key, value: nil, table: nil)
                if val != key { return val }
            }
        }
        return NSLocalizedString(key, comment: "")
    }

    // MARK: - Private

    private func persist(_ language: AppLanguage) {
        UserDefaults.standard.set(language.rawValue, forKey: storageKey)
        // Set Apple language preference for Text() auto-localization
        if language == .systemDefault {
            UserDefaults.standard.removeObject(forKey: "AppleLanguages")
        } else {
            let codes: [String] = language == .latinAmericanSpanish
                ? ["es-419", "es", "en"]
                : [language.rawValue, "en"]
            UserDefaults.standard.set(codes, forKey: "AppleLanguages")
        }
        UserDefaults.standard.synchronize()
    }
}

// MARK: - Notification

extension Notification.Name {
    static let appLanguageDidChange = Notification.Name("aperture.languageDidChange")
}

// MARK: - String helpers

extension String {
    // Uses the nonisolated static lookup — safe to call from any context.
    var localized: String { LocalizationManager.localizedKey(self) }

    func localizedFormat(_ args: CVarArg...) -> String {
        String(format: localized, arguments: args)
    }
}

// MARK: - SwiftUI Environment

struct LocalizationManagerKey: EnvironmentKey {
    @MainActor static var defaultValue: LocalizationManager { LocalizationManager.shared }
}

extension EnvironmentValues {
    var localizationManager: LocalizationManager {
        get { self[LocalizationManagerKey.self] }
        set { self[LocalizationManagerKey.self] = newValue }
    }
}

// MARK: - Language Picker UI

struct LanguagePickerView: View {
    @ObservedObject private var manager = LocalizationManager.shared
    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationStack {
            ZStack {
                Color(red: 0.02, green: 0.02, blue: 0.08).ignoresSafeArea()
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 10) {
                        Spacer().frame(height: 20)
                        VStack(spacing: 6) {
                            Text("🌐").font(.system(size: 44))
                            Text("Language").font(.system(size: 24, weight: .black)).foregroundColor(.white)
                            Text("Idioma").font(.system(size: 14)).foregroundColor(.white.opacity(0.4))
                        }.padding(.bottom, 16)

                        ForEach(AppLanguage.allCases) { lang in
                            languageRow(lang)
                        }

                        Text("Language changes take effect on next launch.\nLos cambios de idioma se aplican al siguiente inicio.")
                            .font(.system(size: 10)).foregroundColor(.white.opacity(0.3))
                            .multilineTextAlignment(.center)
                            .padding(.top, 24).padding(.horizontal, 32)

                        Spacer(minLength: 40)
                    }
                    .padding(.horizontal, 20)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button { dismiss() } label: {
                        Image(systemName: "xmark").foregroundColor(.white)
                    }
                }
                ToolbarItem(placement: .principal) {
                    Text("Language / Idioma")
                        .font(.system(size: 15, weight: .bold)).foregroundColor(.white)
                }
            }
        }
    }

    private func languageRow(_ lang: AppLanguage) -> some View {
        let selected = manager.currentLanguage == lang
        return Button { manager.setLanguage(lang) } label: {
            HStack(spacing: 14) {
                Text(lang.flag).font(.system(size: 28))
                VStack(alignment: .leading, spacing: 3) {
                    Text(lang.nativeName).font(.system(size: 16, weight: .bold)).foregroundColor(.white)
                    Text(lang.displayName).font(.system(size: 11)).foregroundColor(.white.opacity(0.4))
                }
                Spacer()
                if selected {
                    Image(systemName: "checkmark.circle.fill").font(.system(size: 20)).foregroundColor(.purple)
                }
            }
            .padding(16)
            .background(RoundedRectangle(cornerRadius: 14)
                .fill(selected ? Color.purple.opacity(0.08) : Color.white.opacity(0.01))
                .overlay(RoundedRectangle(cornerRadius: 14)
                    .stroke(selected ? Color.purple.opacity(0.3) : Color.white.opacity(0.04), lineWidth: 1)))
        }
    }
}
