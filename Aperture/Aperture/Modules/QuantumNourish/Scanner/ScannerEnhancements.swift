// ScannerEnhancements.swift
// SCANNER POWER-UPS — History, Aliases, Red Flags, Blend Detection, Value Nudges
// ☀️ SunFlow: Reignited

import SwiftUI

// MARK: - Scan History Manager

@MainActor
class ScanHistoryManager: ObservableObject {
  static let shared = ScanHistoryManager()

  @Published var scans: [SavedScan] = []
  @Published var favorites: [SavedScan] = []

  private let scansKey = "quantum.scan.history"
  private let favoritesKey = "quantum.scan.favorites"

  init() {
    load()
  }

  func save(_ scan: SavedScan) {
    scans.insert(scan, at: 0)
    if scans.count > 200 { scans = Array(scans.prefix(200)) }
    persist()
  }

  func toggleFavorite(_ scan: SavedScan) {
    if let idx = favorites.firstIndex(where: { $0.id == scan.id }) {
      favorites.remove(at: idx)
    } else {
      favorites.insert(scan, at: 0)
    }
    persist()
  }

  func isFavorite(_ scan: SavedScan) -> Bool {
    favorites.contains(where: { $0.id == scan.id })
  }

  func clearHistory() {
    scans.removeAll()
    persist()
  }

  private func load() {
    if let data = UserDefaults.standard.data(forKey: scansKey),
      let decoded = try? JSONDecoder().decode([SavedScan].self, from: data)
    {
      scans = decoded
    }
    if let data = UserDefaults.standard.data(forKey: favoritesKey),
      let decoded = try? JSONDecoder().decode([SavedScan].self, from: data)
    {
      favorites = decoded
    }
  }

  private func persist() {
    if let data = try? JSONEncoder().encode(scans) {
      UserDefaults.standard.set(data, forKey: scansKey)
    }
    if let data = try? JSONEncoder().encode(favorites) {
      UserDefaults.standard.set(data, forKey: favoritesKey)
    }
  }
}

// MARK: - Saved Scan Model

struct SavedScan: Identifiable, Codable, Equatable {
  let id: String
  let productName: String
  let ingredientText: String
  let overallScore: String
  let redFlagCount: Int
  let totalIngredients: Int
  let date: Date
  let isBarcodeSource: Bool

  static func == (lhs: SavedScan, rhs: SavedScan) -> Bool {
    lhs.id == rhs.id
  }

  init(
    productName: String, ingredientText: String, overallScore: String, redFlagCount: Int,
    totalIngredients: Int, isBarcodeSource: Bool = false
  ) {
    id = UUID().uuidString
    self.productName = productName
    self.ingredientText = ingredientText
    self.overallScore = overallScore
    self.redFlagCount = redFlagCount
    self.totalIngredients = totalIngredients
    date = Date()
    self.isBarcodeSource = isBarcodeSource
  }
}

// MARK: - Scan History View

struct ScanHistoryView: View {
  @Environment(\.dismiss) var dismiss
  @StateObject private var history = ScanHistoryManager.shared
  @State private var showFavoritesOnly = false
  @State private var searchText = ""
  @State private var showClearConfirm = false

  private var displayedScans: [SavedScan] {
    let source = showFavoritesOnly ? history.favorites : history.scans
    if searchText.isEmpty { return source }
    return source.filter {
      $0.productName.localizedCaseInsensitiveContains(searchText)
        || $0.ingredientText.localizedCaseInsensitiveContains(searchText)
    }
  }

  var body: some View {
    NavigationStack {
      ZStack {
        Color.black.ignoresSafeArea()

        ScrollView(showsIndicators: false) {
          VStack(spacing: 16) {
            // Toggle
            HStack(spacing: 0) {
              tabButton("All Scans", icon: "clock.arrow.circlepath", active: !showFavoritesOnly) {
                showFavoritesOnly = false
              }
              tabButton("Favorites", icon: "heart.fill", active: showFavoritesOnly) {
                showFavoritesOnly = true
              }
            }
            .background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.04)))

            // Search
            HStack(spacing: 10) {
              Image(systemName: "magnifyingglass").foregroundColor(
                Color(hex: "#E74C3C").opacity(0.6))
              TextField("Search scans...", text: $searchText)
                .font(.system(size: 14)).foregroundColor(Palette.text.primary)
            }
            .padding(12)
            .background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.05)))

            // Stats bar
            let flaggedCount: Int = history.scans.filter { $0.redFlagCount > 0 }.count
            HStack(spacing: 16) {
              statPill("\(history.scans.count)", "scans", Color(hex: "#E74C3C"))
              statPill("\(history.favorites.count)", "favorites", Color(hex: "#FFD700"))
              statPill("\(flaggedCount)", "flagged", .red)
            }

            if displayedScans.isEmpty {
              VStack(spacing: 12) {
                Image(systemName: showFavoritesOnly ? "heart.slash" : "barcode.viewfinder")
                  .font(.system(size: 40)).foregroundColor(Palette.text.muted)
                Text(showFavoritesOnly ? "No favorites yet" : "No scans yet")
                  .font(.system(size: 16, weight: .bold)).foregroundColor(Palette.text.muted)
                Text("Scan ingredients to build your history")
                  .font(.system(size: 13)).foregroundColor(Palette.text.muted)
              }
              .padding(.top, 60)
            } else {
              ForEach(displayedScans) { scan in
                scanCard(scan)
              }
            }

            Spacer(minLength: 100)
          }
          .padding(.horizontal, 20).padding(.top, 16)
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
            }.foregroundColor(Color(hex: "#E74C3C"))
          }
        }
        ToolbarItem(placement: .principal) {
          Text("SCAN HISTORY").font(.system(size: 14, weight: .bold, design: .rounded)).tracking(2)
            .foregroundColor(Color(hex: "#E74C3C"))
        }
        ToolbarItem(placement: .navigationBarTrailing) {
          if !history.scans.isEmpty {
            Button {
              showClearConfirm = true
            } label: {
              Image(systemName: "trash").foregroundColor(.red.opacity(0.7))
            }
          }
        }
      }
      .alert("Clear History?", isPresented: $showClearConfirm) {
        Button("Clear All", role: .destructive) { history.clearHistory() }
        Button("Cancel", role: .cancel) {}
      } message: {
        Text("This will delete all scan history. Favorites will be preserved.")
      }
    }
  }

  private func scanCard(_ scan: SavedScan) -> some View {
    VStack(alignment: .leading, spacing: 10) {
      HStack {
        VStack(alignment: .leading, spacing: 4) {
          HStack(spacing: 6) {
            Image(systemName: scan.isBarcodeSource ? "barcode" : "text.viewfinder")
              .font(.system(size: 10)).foregroundColor(Color(hex: "#E74C3C"))
            Text(scan.productName.isEmpty ? "Manual Scan" : scan.productName)
              .font(.system(size: 15, weight: .bold, design: .rounded)).foregroundColor(
                Palette.text.primary)
          }
          Text(scan.date, style: .relative).font(.system(size: 11)).foregroundColor(
            Palette.text.muted)
        }
        Spacer()
        // Score badge
        Text(scan.overallScore)
          .font(.system(size: 11, weight: .bold, design: .rounded))
          .foregroundColor(scoreColor(scan.overallScore))
          .padding(.horizontal, 10).padding(.vertical, 5)
          .background(Capsule().fill(scoreColor(scan.overallScore).opacity(0.15)))
        // Favorite
        Button {
          history.toggleFavorite(scan)
          HapticManager.shared.light()
        } label: {
          Image(systemName: history.isFavorite(scan) ? "heart.fill" : "heart")
            .foregroundColor(history.isFavorite(scan) ? .red : Palette.text.muted)
        }
      }

      HStack(spacing: 12) {
        Label("\(scan.totalIngredients) ingredients", systemImage: "list.bullet").font(
          .system(size: 11)
        ).foregroundColor(Palette.text.muted)
        if scan.redFlagCount > 0 {
          Label("\(scan.redFlagCount) red flags", systemImage: "exclamationmark.triangle.fill")
            .font(.system(size: 11, weight: .bold)).foregroundColor(.red)
        }
      }

      Text(scan.ingredientText.prefix(120) + (scan.ingredientText.count > 120 ? "..." : ""))
        .font(.system(size: 11, design: .monospaced)).foregroundColor(Palette.text.muted).lineLimit(
          2)
    }
    .padding(14)
    .background(
      RoundedRectangle(cornerRadius: 14).fill(Color.white.opacity(0.04))
        .overlay(
          RoundedRectangle(cornerRadius: 14).stroke(
            scoreColor(scan.overallScore).opacity(0.15), lineWidth: 1)))
  }

  private func tabButton(_ title: String, icon: String, active: Bool, action: @escaping () -> Void)
    -> some View
  {
    Button(action: action) {
      HStack(spacing: 6) {
        Image(systemName: icon).font(.system(size: 11))
        Text(title).font(.system(size: 13, weight: .bold))
      }
      .frame(maxWidth: .infinity).padding(.vertical, 10)
      .background(active ? Color(hex: "#E74C3C").opacity(0.15) : Color.clear)
      .foregroundColor(active ? Color(hex: "#E74C3C") : Palette.text.muted)
      .cornerRadius(10)
    }.buttonStyle(PlainButtonStyle())
  }

  private func statPill(_ value: String, _ label: String, _ color: Color) -> some View {
    VStack(spacing: 2) {
      Text(value).font(.system(size: 16, weight: .bold, design: .rounded)).foregroundColor(color)
      Text(label).font(.system(size: 9, weight: .medium)).foregroundColor(Palette.text.muted)
    }.frame(maxWidth: .infinity)
  }

  private func scoreColor(_ score: String) -> Color {
    if score.contains("AVOID") || score.contains("TOXIC") { return .red }
    if score.contains("CAUTION") || score.contains("LOW") { return .orange }
    if score.contains("OK") || score.contains("MODERATE") { return .yellow }
    return .green
  }
}

// MARK: - Expanded Red Flags (+16 chemicals beyond original)

enum ExpandedRedFlagDatabase {
  /// Original scanner had ~17 keywords. This adds 16 more documented harmful ingredients.
  static let expandedRedFlags: [RedFlagIngredient] = [
    // Original set enhanced
    RedFlagIngredient(
      name: "Titanium Dioxide", aliases: ["E171", "TiO2", "CI 77891"], category: .additive,
      dangerLevel: .high,
      explanation:
        "Nanoparticle that crosses the blood-brain barrier. Banned in the EU since 2022 for food use. Still legal in the US. Found in candy, gum, coffee creamer, supplements.",
      whereItHides: [
        "Supplement capsule coatings", "Chewing gum", "Coffee creamer", "Salad dressing",
        "Frosting", "Protein bars",
      ]),
    RedFlagIngredient(
      name: "Carrageenan", aliases: ["E407", "Irish moss extract", "processed eucheuma seaweed"],
      category: .additive,
      dangerLevel: .high,
      explanation:
        "Triggers inflammation and intestinal permeability (leaky gut). Linked to ulcerative colitis in animal studies. Used as a thickener in 'health' products.",
      whereItHides: [
        "Almond milk", "Coconut milk", "Ice cream", "Deli meat", "Infant formula", "Protein shakes",
      ]),
    RedFlagIngredient(
      name: "Acesulfame Potassium", aliases: ["Ace-K", "E950", "acesulfame K"],
      category: .sweetener,
      dangerLevel: .high,
      explanation:
        "Artificial sweetener 200x sweeter than sugar. Contains methylene chloride, a known carcinogen. Disrupts gut microbiome and insulin response.",
      whereItHides: [
        "Diet soda", "Sugar-free gum", "Protein powder", "Flavored water",
        "Pre-workout supplements",
      ]),
    RedFlagIngredient(
      name: "Propylparaben",
      aliases: ["E214", "propyl 4-hydroxybenzoate", "propyl parahydroxybenzoate"],
      category: .preservative,
      dangerLevel: .medium,
      explanation:
        "Endocrine disruptor that mimics estrogen. Detected in breast cancer tissue. Used as a preservative in food and cosmetics.",
      whereItHides: ["Tortillas", "Muffins", "Food-based dyes", "Trail mix"]),
    RedFlagIngredient(
      name: "Sodium Nitrite", aliases: ["E250", "curing salt", "Prague powder"],
      category: .preservative,
      dangerLevel: .high,
      explanation:
        "Reacts with amino acids to form nitrosamines — potent carcinogens. WHO classified processed meats as Group 1 carcinogens partly due to nitrites.",
      whereItHides: ["Bacon", "Hot dogs", "Deli meat", "Beef jerky", "Pepperoni", "Canned meat"]),
    RedFlagIngredient(
      name: "Potassium Bromate", aliases: ["E924", "bromated flour", "potassium bromate"],
      category: .additive,
      dangerLevel: .high,
      explanation:
        "Classified as possibly carcinogenic (Group 2B) by IARC. Banned in EU, UK, Canada, Brazil. Still legal in US flour. Strengthens dough but at what cost?",
      whereItHides: [
        "White bread", "Rolls", "Pizza dough", "Fast food buns", "Packaged baked goods",
      ]),
    RedFlagIngredient(
      name: "PFAS", aliases: ["perfluoroalkyl substances", "forever chemicals", "PTFE", "GenX"],
      category: .contaminant,
      dangerLevel: .high,
      explanation:
        "Forever chemicals that never break down. Linked to cancer, thyroid disease, immune suppression. Found in food packaging and non-stick coatings.",
      whereItHides: [
        "Microwave popcorn bags", "Fast food wrappers", "Pizza boxes", "Non-stick cookware residue",
        "Some dental floss",
      ]),
    RedFlagIngredient(
      name: "Dimethylpolysiloxane", aliases: ["E900", "PDMS", "silicone oil", "dimethicone"],
      category: .additive,
      dangerLevel: .medium,
      explanation:
        "Anti-foaming agent — yes, the same silicone in shampoo. Added to frying oil at fast food restaurants. Also used in Silly Putty.",
      whereItHides: ["McDonald's fries", "Chicken nuggets", "Fountain drinks", "Fast food oils"]),
    RedFlagIngredient(
      name: "Azodicarbonamide", aliases: ["E927a", "ADA", "azo flour treatment"],
      category: .additive,
      dangerLevel: .high,
      explanation:
        "Dough conditioner also used to make yoga mats and shoe soles. Banned in EU and Australia. Breaks down into urethane (animal carcinogen) during baking.",
      whereItHides: [
        "Subway bread (removed 2014 after backlash)", "Packaged breads", "Frozen dough",
        "Fast food buns",
      ]),
    RedFlagIngredient(
      name: "Tertiary Butylhydroquinone", aliases: ["TBHQ", "E319", "tert-butylhydroquinone"],
      category: .preservative,
      dangerLevel: .high,
      explanation:
        "Petroleum-derived preservative. 1g can cause nausea, delirium. 5g is lethal. Suppresses immune function. In MANY processed foods.",
      whereItHides: [
        "Frozen pizza", "Microwave popcorn", "Chicken nuggets", "Crackers", "Fast food fries",
        "Ramen noodles",
      ]),
    RedFlagIngredient(
      name: "Butylated Hydroxyanisole", aliases: ["BHA", "E320", "tert-butyl-4-hydroxyanisole"],
      category: .preservative,
      dangerLevel: .high,
      explanation:
        "Reasonably anticipated to be a human carcinogen (NTP). Endocrine disruptor. California Prop 65 listed. Still FDA approved.",
      whereItHides: [
        "Cereal", "Chewing gum", "Butter", "Instant potatoes", "Preserved meats", "Beer",
      ]),
    RedFlagIngredient(
      name: "Polysorbate 80", aliases: ["E433", "Tween 80", "polyoxyethylene sorbitan monooleate"],
      category: .emulsifier,
      dangerLevel: .medium,
      explanation:
        "Emulsifier that disrupts gut barrier function and promotes inflammation. Linked to metabolic syndrome in animal studies. Breaks down protective mucus layer.",
      whereItHides: ["Ice cream", "Pickles", "Vitamins", "Vaccines", "Cosmetics", "Condiments"]),
    RedFlagIngredient(
      name: "Partially Hydrogenated Oils",
      aliases: ["trans fat", "shortening", "margarine", "interesterified fat"], category: .oil,
      dangerLevel: .high,
      explanation:
        "Trans fats increase LDL, decrease HDL, and cause systemic inflammation. FDA banned PHOs in 2018 but allowed existing stock. Some products still contain traces.",
      whereItHides: [
        "Coffee creamer", "Frosting", "Frozen pie crust", "Biscuit dough", "Margarine sticks",
      ]),
    RedFlagIngredient(
      name: "Propyl Gallate", aliases: ["E310", "gallic acid propyl ester"],
      category: .preservative,
      dangerLevel: .medium,
      explanation:
        "Antioxidant preservative often paired with BHA/BHT. Suspected endocrine disruptor. Limited studies but concerning animal data.",
      whereItHides: [
        "Mayonnaise", "Dried meats", "Baked goods", "Chicken soup base", "Chewing gum",
      ]),
    RedFlagIngredient(
      name: "Brominated Vegetable Oil", aliases: ["BVO", "E443", "brominated soybean oil"],
      category: .additive,
      dangerLevel: .high,
      explanation:
        "Contains bromine — same element in flame retardants. Accumulates in body fat. Linked to memory loss, skin lesions. Banned in EU, Japan. FDA banned 2024.",
      whereItHides: [
        "Mountain Dew (removed)", "Some citrus sodas", "Sports drinks", "Cheap juice brands",
      ]),
    RedFlagIngredient(
      name: "Silicon Dioxide", aliases: ["E551", "silica", "SiO2", "colloidal silicon dioxide"],
      category: .additive,
      dangerLevel: .low,
      explanation:
        "Anti-caking agent. Generally recognized as safe in food quantities, but nano-sized particles raise questions about gut absorption. Used in almost every supplement and powder.",
      whereItHides: [
        "Supplements", "Protein powder", "Spice mixes", "Powdered coffee creamer",
        "Dried soup mixes",
      ]),
  ]
}

// MARK: - Red Flag Model

struct RedFlagIngredient: Identifiable {
  let id = UUID()
  let name: String
  let aliases: [String]
  let category: RedFlagCategory
  let dangerLevel: RedFlagDangerLevel
  let explanation: String
  let whereItHides: [String]

  enum RedFlagCategory: String {
    case additive = "Additive"
    case preservative = "Preservative"
    case sweetener = "Sweetener"
    case emulsifier = "Emulsifier"
    case contaminant = "Contaminant"
    case oil = "Oil"

    var icon: String {
      switch self {
      case .additive: return "flask.fill"
      case .preservative: return "shield.slash.fill"
      case .sweetener: return "drop.triangle.fill"
      case .emulsifier: return "arrow.triangle.merge"
      case .contaminant: return "hazardsign.fill"
      case .oil: return "drop.fill"
      }
    }

    var color: Color {
      switch self {
      case .additive: return .orange
      case .preservative: return .red
      case .sweetener: return .purple
      case .emulsifier: return .yellow
      case .contaminant: return Color(hex: "#FF0000")
      case .oil: return Color(hex: "#FF6600")
      }
    }
  }

  enum RedFlagDangerLevel: String {
    case low = "Watch"
    case medium = "Caution"
    case high = "Avoid"

    var color: Color {
      switch self {
      case .low: return .yellow
      case .medium: return .orange
      case .high: return .red
      }
    }
  }
}

// MARK: - Ingredient Alias Engine

enum IngredientAliasEngine {
  /// Maps hidden names to their real identity. Consumers can't avoid what they can't recognize.
  static let aliases: [String: [String]] = [
    "MSG": [
      "monosodium glutamate", "glutamic acid", "hydrolyzed vegetable protein",
      "hydrolyzed plant protein", "autolyzed yeast extract", "yeast extract", "sodium caseinate",
      "calcium caseinate", "textured protein", "hydrolyzed protein", "hydrolyzed soy protein",
    ],
    "Sugar": [
      "sucrose", "dextrose", "maltose", "glucose", "fructose", "galactose", "lactose", "corn syrup",
      "high fructose corn syrup", "evaporated cane juice", "cane sugar", "turbinado", "muscovado",
      "demerara", "agave nectar", "rice syrup", "barley malt", "diastatic malt", "ethyl maltol",
      "maltodextrin", "dextrin", "treacle", "panela", "jaggery", "coconut sugar", "date sugar",
      "fruit juice concentrate", "honey", "molasses", "sorghum syrup", "golden syrup", "caramel",
      "buttered syrup", "carob syrup", "corn sweetener", "crystalline fructose", "malt syrup",
      "maple syrup", "sucanat", "panocha", "refiner's syrup", "florida crystals",
    ],
    "Sucralose": [
      "splenda", "E955", "trichlorogalactosucrose", "1,6-dichloro-1,6-dideoxyfructose",
    ],
    "Aspartame": ["NutraSweet", "Equal", "E951", "aspartyl-phenylalanine-1-methyl ester", "APM"],
    "Trans Fat": [
      "partially hydrogenated oil", "shortening", "margarine", "hydrogenated vegetable oil",
      "interesterified oil", "PHO",
    ],
    "Artificial Colors": [
      "Red 40", "Red 3", "Yellow 5", "Yellow 6", "Blue 1", "Blue 2", "Green 3", "FD&C",
      "tartrazine", "sunset yellow", "allura red", "erythrosine", "brilliant blue", "indigotine",
      "fast green",
    ],
    "Seed Oils": [
      "canola oil", "rapeseed oil", "soybean oil", "corn oil", "sunflower oil", "safflower oil",
      "cottonseed oil", "grapeseed oil", "rice bran oil", "vegetable oil",
    ],
    "Fluoride": [
      "sodium fluoride", "stannous fluoride", "fluorosilicic acid", "sodium fluorosilicate",
      "calcium fluoride",
    ],
  ]

  /// Returns the real identity if this ingredient is hiding under an alias
  static func identify(_ ingredient: String) -> (realName: String, aliases: [String])? {
    let lower = ingredient.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
    for (real, aliasList) in aliases {
      if aliasList.contains(where: { lower.contains($0.lowercased()) }) {
        return (real, aliasList)
      }
    }
    return nil
  }
}

// MARK: - Proprietary Blend Detector

enum ProprietaryBlendDetector {
  static let blendKeywords = [
    "proprietary blend", "proprietary formula", "matrix", "complex", "blend",
    "synergy blend", "performance matrix", "energy blend", "focus blend",
    "recovery complex", "amino blend", "herbal blend", "specialized blend",
  ]

  static func detect(in text: String) -> ProprietaryBlendResult? {
    let lower = text.lowercased()
    for keyword in blendKeywords {
      if lower.contains(keyword) {
        return ProprietaryBlendResult(
          detected: true,
          keyword: keyword,
          warning:
            "⚠️ PROPRIETARY BLEND DETECTED — \"\(keyword)\" means individual ingredient amounts are HIDDEN. You only see the total blend weight, not how much of each ingredient you're actually getting. A 500mg 'energy blend' could be 490mg caffeine and 10mg of everything else. Brands use this to under-dose expensive ingredients while legal. DEMAND transparency — if they won't tell you how much, they're hiding something."
        )
      }
    }
    return nil
  }
}

struct ProprietaryBlendResult {
  let detected: Bool
  let keyword: String
  let warning: String
}

// MARK: - Post-Scan Value Nudge

enum PostScanNudgeEngine {
  enum NudgeType {
    case redFlagAlert(count: Int)
    case premiumTeaser
    case scanStreakEncouragement(count: Int)
    case alternativeSuggestion
    case sharePrompt
  }

  static func nudge(for scan: SavedScan, totalScans: Int) -> NudgeType {
    if scan.redFlagCount >= 3 {
      return .redFlagAlert(count: scan.redFlagCount)
    }
    if totalScans == 1 {
      return .premiumTeaser
    }
    if totalScans % 5 == 0 {
      return .scanStreakEncouragement(count: totalScans)
    }
    if scan.redFlagCount > 0 {
      return .alternativeSuggestion
    }
    return .sharePrompt
  }

  static func nudgeView(type: NudgeType) -> some View {
    Group {
      switch type {
      case .redFlagAlert(let count):
        nudgeCard(
          icon: "exclamationmark.triangle.fill", color: .red,
          title: "\(count) RED FLAGS DETECTED",
          message:
            "This product contains \(count) ingredients linked to health concerns. Tap to see safer alternatives.",
          cta: "VIEW ALTERNATIVES")
      case .premiumTeaser:
        nudgeCard(
          icon: "sparkles", color: Color(hex: "#FFD700"),
          title: "YOU JUST DECODED YOUR FIRST PRODUCT",
          message: "Premium unlocks unlimited scans, barcode scanning, and your full scan history.",
          cta: "UNLOCK PREMIUM")
      case .scanStreakEncouragement(let count):
        nudgeCard(
          icon: "flame.fill", color: Color(hex: "#FF6B35"),
          title: "🔥 \(count) PRODUCTS SCANNED",
          message: "You're building awareness. Every scan is a step toward conscious consumption.",
          cta: "KEEP SCANNING")
      case .alternativeSuggestion:
        nudgeCard(
          icon: "arrow.triangle.swap", color: Color(hex: "#2ECC71"),
          title: "SWAP FOR BETTER",
          message:
            "We found cleaner alternatives for the flagged ingredients. Check the Kill List.",
          cta: "SEE ALTERNATIVES")
      case .sharePrompt:
        nudgeCard(
          icon: "square.and.arrow.up.fill", color: Color(hex: "#3498DB"),
          title: "CLEAN PRODUCT ✓",
          message: "Share this result with someone who needs to see it.",
          cta: "SHARE SCAN")
      }
    }
  }

  private static func nudgeCard(
    icon: String, color: Color, title: String, message: String, cta: String
  ) -> some View {
    VStack(spacing: 10) {
      HStack(spacing: 10) {
        Image(systemName: icon).font(.system(size: 20)).foregroundColor(color)
        VStack(alignment: .leading, spacing: 3) {
          Text(title).font(.system(size: 11, weight: .bold)).tracking(0.5).foregroundColor(color)
          Text(message).font(.system(size: 12, weight: .medium)).foregroundColor(
            Palette.text.secondary
          ).lineLimit(2)
        }
        Spacer()
      }
      Button {
      } label: {
        Text(cta).font(.system(size: 11, weight: .bold)).tracking(1).foregroundColor(.black)
          .frame(maxWidth: .infinity).padding(10)
          .background(Capsule().fill(color))
      }.buttonStyle(PlainButtonStyle())
    }
    .padding(14)
    .background(
      RoundedRectangle(cornerRadius: 14).fill(color.opacity(0.06))
        .overlay(RoundedRectangle(cornerRadius: 14).stroke(color.opacity(0.2), lineWidth: 1)))
  }
}
