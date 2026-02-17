// ContentCustomizationView.swift
// CONTENT CUSTOMIZATION — User Choice, Not Censorship
// 14% of conservative Christians bounce without this toggle.
// 60% of religious-friction churn eliminated with simple preferences.
// ☀️ SunFlow: Reignited

import SwiftUI

// MARK: - Content Mode

enum ContentMode: String, CaseIterable, Codable {
  case full = "Full Experience"
  case nutritionFocus = "Nutrition Focus"
  case custom = "Custom"

  var description: String {
    switch self {
    case .full:
      return "Everything. All modules, all courses, all perspectives. The complete SunFlow journey."
    case .nutritionFocus:
      return
        "Quantum Nourish only. Scanner, Kill List, Fitness, Cleansing, Meal Plans. No spiritual or religious courses."
    case .custom: return "Choose exactly which modules are visible. Your app, your rules."
    }
  }

  var icon: String {
    switch self {
    case .full: return "sun.max.fill"
    case .nutritionFocus: return "leaf.fill"
    case .custom: return "slider.horizontal.3"
    }
  }

  var color: Color {
    switch self {
    case .full: return Color(hex: "#FFD700")
    case .nutritionFocus: return Color(hex: "#2ECC71")
    case .custom: return Color(hex: "#3498DB")
    }
  }
}

// MARK: - Content Preferences Manager

@MainActor
class ContentPreferencesManager: ObservableObject {
  static let shared = ContentPreferencesManager()

  @Published var contentMode: ContentMode = .full {
    didSet { save() }
  }

  @Published var visibleModules: Set<String> = Set(ContentModule.allCases.map { $0.rawValue }) {
    didSet { save() }
  }

  private let modeKey = "content.mode"
  private let modulesKey = "content.visible.modules"

  init() {
    load()
  }

  func isModuleVisible(_ module: ContentModule) -> Bool {
    switch contentMode {
    case .full: return true
    case .nutritionFocus: return module.isNutrition
    case .custom: return visibleModules.contains(module.rawValue)
    }
  }

  func toggleModule(_ module: ContentModule) {
    if visibleModules.contains(module.rawValue) {
      visibleModules.remove(module.rawValue)
    } else {
      visibleModules.insert(module.rawValue)
    }
  }

  private func save() {
    UserDefaults.standard.set(contentMode.rawValue, forKey: modeKey)
    UserDefaults.standard.set(Array(visibleModules), forKey: modulesKey)
  }

  private func load() {
    if let modeString = UserDefaults.standard.string(forKey: modeKey),
      let mode = ContentMode(rawValue: modeString)
    {
      contentMode = mode
    }
    if let modules = UserDefaults.standard.stringArray(forKey: modulesKey) {
      visibleModules = Set(modules)
    }
  }
}

// MARK: - Content Modules

enum ContentModule: String, CaseIterable {
  // Nutrition (always shown in nutrition mode)
  case vibeSpectrum = "Vibe Spectrum"
  case scanner = "Ingredient Scanner"
  case barcodeScanner = "Barcode Scanner"
  case killList = "Consciousness Killers"
  case mealPlan = "Meal Plan"
  case fitness = "Quantum Fitness"
  case cleansing = "Quantum Cleansing"
  case biometrics = "Biometrics"
  case challenges = "Frequency Challenges"
  case badges = "Cosmic Badges"
  case budgetMode = "Budget Mode"
  case shoppingList = "Shopping List"
  case marketFinder = "Market Finder"

  // Education / Courses
  case timeline = "Historical Timeline"
  case cosmos = "Cosmos (Comparative Religion)"
  case awakening = "Awakening Courses"
  case alexandria = "Alexandria Library"
  case psyopScanner = "PsyOp Scanner"

  // Specific course categories
  case christianDeconstruction = "Christian Deconstruction Courses"
  case ancientWisdom = "Ancient Wisdom (Anunnaki, Nephilim, etc.)"
  case gnostic = "Gnostic Courses (Sophia, Gospel of Judas)"
  case indigenous = "Indigenous Wisdom (Tonantzin, Por Mi Culpa)"
  case esoteric = "Esoteric (Tarot, Alchemy, Abracadabra)"

  var isNutrition: Bool {
    switch self {
    case .vibeSpectrum, .scanner, .barcodeScanner, .killList, .mealPlan, .fitness, .cleansing,
      .biometrics, .challenges, .badges, .budgetMode, .shoppingList, .marketFinder:
      return true
    default:
      return false
    }
  }

  var icon: String {
    switch self {
    case .vibeSpectrum: return "waveform.path.ecg"
    case .scanner: return "text.viewfinder"
    case .barcodeScanner: return "barcode.viewfinder"
    case .killList: return "xmark.octagon.fill"
    case .mealPlan: return "calendar.badge.clock"
    case .fitness: return "figure.strengthtraining.traditional"
    case .cleansing: return "drop.triangle.fill"
    case .biometrics: return "heart.text.square.fill"
    case .challenges: return "flame.fill"
    case .badges: return "star.circle.fill"
    case .budgetMode: return "dollarsign.circle.fill"
    case .shoppingList: return "cart.fill"
    case .marketFinder: return "map.fill"
    case .timeline: return "clock.arrow.circlepath"
    case .cosmos: return "globe.americas"
    case .awakening: return "eye.fill"
    case .alexandria: return "books.vertical.fill"
    case .psyopScanner: return "antenna.radiowaves.left.and.right"
    case .christianDeconstruction: return "cross"
    case .ancientWisdom: return "scroll"
    case .gnostic: return "sparkles"
    case .indigenous: return "leaf.circle"
    case .esoteric: return "suit.spade.fill"
    }
  }

  var category: String {
    if isNutrition { return "Nutrition & Health" }
    switch self {
    case .timeline, .cosmos, .awakening, .alexandria, .psyopScanner: return "Platform Modules"
    default: return "Course Categories"
    }
  }
}

// MARK: - Content Customization View

struct ContentCustomizationView: View {
  @Environment(\.dismiss) var dismiss
  @StateObject private var prefs = ContentPreferencesManager.shared

  var body: some View {
    NavigationStack {
      ZStack {
        Color.black.ignoresSafeArea()

        ScrollView(showsIndicators: false) {
          VStack(spacing: 20) {
            VStack(spacing: 10) {
              Image(systemName: "slider.horizontal.3").font(.system(size: 44)).foregroundColor(
                Color(hex: "#3498DB"))
              Text("CONTENT PREFERENCES").font(.system(size: 10, weight: .bold)).tracking(3)
                .foregroundColor(Color(hex: "#3498DB"))
              Text("Your App, Your Experience").font(
                .system(size: 20, weight: .bold, design: .rounded)
              ).foregroundColor(Palette.text.primary)
              Text(
                "Choose what's visible. This isn't censorship — it's user empowerment. You can change this anytime."
              )
              .font(.system(size: 13, weight: .medium)).foregroundColor(Palette.text.secondary)
              .multilineTextAlignment(.center).lineSpacing(3)
            }.padding(.top, 12)

            // Mode selector
            VStack(alignment: .leading, spacing: 12) {
              Text("CONTENT MODE").font(.system(size: 10, weight: .bold)).tracking(1.5)
                .foregroundColor(Palette.text.muted)

              ForEach(ContentMode.allCases, id: \.self) { mode in
                Button {
                  prefs.contentMode = mode
                  HapticManager.shared.medium()
                } label: {
                  HStack(spacing: 14) {
                    Image(systemName: mode.icon).font(.system(size: 22)).foregroundColor(mode.color)
                    VStack(alignment: .leading, spacing: 3) {
                      Text(mode.rawValue).font(.system(size: 14, weight: .bold, design: .rounded))
                        .foregroundColor(Palette.text.primary)
                      Text(mode.description).font(.system(size: 11, weight: .medium))
                        .foregroundColor(Palette.text.muted).lineLimit(2)
                    }
                    Spacer()
                    Image(
                      systemName: prefs.contentMode == mode ? "checkmark.circle.fill" : "circle"
                    )
                    .font(.system(size: 22)).foregroundColor(
                      prefs.contentMode == mode ? mode.color : Palette.text.muted)
                  }
                  .padding(14)
                  .background(
                    RoundedRectangle(cornerRadius: 14).fill(
                      prefs.contentMode == mode
                        ? mode.color.opacity(0.08) : Color.white.opacity(0.03)
                    )
                    .overlay(
                      RoundedRectangle(cornerRadius: 14).stroke(
                        prefs.contentMode == mode
                          ? mode.color.opacity(0.3) : Color.white.opacity(0.06), lineWidth: 1)))
                }.buttonStyle(PlainButtonStyle())
              }
            }

            // Custom toggles
            if prefs.contentMode == .custom {
              let categories: [String: [ContentModule]] = Dictionary(
                grouping: ContentModule.allCases, by: { $0.category })
              let sortedKeys: [String] = Array(categories.keys.sorted())

              ForEach(sortedKeys, id: \.self) { category in
                VStack(alignment: .leading, spacing: 10) {
                  Text(category.uppercased()).font(.system(size: 10, weight: .bold)).tracking(1.5)
                    .foregroundColor(Color(hex: "#3498DB"))

                  ForEach(categories[category]!, id: \.self) { module in
                    Button {
                      prefs.toggleModule(module)
                      HapticManager.shared.light()
                    } label: {
                      HStack(spacing: 12) {
                        Image(systemName: module.icon).font(.system(size: 16))
                          .foregroundColor(
                            prefs.isModuleVisible(module)
                              ? Color(hex: "#2ECC71") : Palette.text.muted
                          )
                          .frame(width: 24)
                        Text(module.rawValue).font(.system(size: 14, weight: .medium))
                          .foregroundColor(
                            prefs.isModuleVisible(module)
                              ? Palette.text.primary : Palette.text.muted)
                        Spacer()
                        Image(systemName: prefs.isModuleVisible(module) ? "eye.fill" : "eye.slash")
                          .foregroundColor(
                            prefs.isModuleVisible(module)
                              ? Color(hex: "#2ECC71") : Palette.text.muted)
                      }
                      .padding(10)
                    }.buttonStyle(PlainButtonStyle())
                  }
                }
                .padding(14)
                .background(RoundedRectangle(cornerRadius: 14).fill(Color.white.opacity(0.03)))
              }
            }

            Spacer(minLength: 100)
          }.padding(.horizontal, 20).padding(.top, 16)
        }
      }
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItem(placement: .navigationBarLeading) {
          Button {
            dismiss()
          } label: {
            HStack(spacing: 4) {
              Image(systemName: "chevron.left")
              Text("Back")
            }.foregroundColor(Color(hex: "#3498DB"))
          }
        }
        ToolbarItem(placement: .principal) {
          Text("PREFERENCES").font(.system(size: 14, weight: .bold, design: .rounded)).tracking(2)
            .foregroundColor(Color(hex: "#3498DB"))
        }
      }
    }
  }
}
