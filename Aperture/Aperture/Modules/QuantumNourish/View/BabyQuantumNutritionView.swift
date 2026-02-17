// BabyQuantumNutritionView.swift
// QUANTUM NOURISH: TINY HUMANS — Protect the Next Generation
// ☀️ SunFlow: Reignited
//
// Clean nutrition for babies 0-24 months.
// Because they didn't choose to be here — we owe them the cleanest start possible.

import SwiftUI

// MARK: - Baby Age Stage

enum BabyAgeStage: String, CaseIterable, Identifiable, Codable {
  case newborn = "Newborn"  // 0-3 months
  case infant = "Infant"  // 3-6 months
  case firstFoods = "First Foods"  // 6-9 months
  case explorer = "Explorer"  // 9-12 months
  case toddlerEarly = "Early Toddler"  // 12-18 months
  case toddlerLate = "Late Toddler"  // 18-24 months

  var id: String {
    rawValue
  }

  var ageRange: String {
    switch self {
    case .newborn: return "0–3 months"
    case .infant: return "3–6 months"
    case .firstFoods: return "6–9 months"
    case .explorer: return "9–12 months"
    case .toddlerEarly: return "12–18 months"
    case .toddlerLate: return "18–24 months"
    }
  }

  var icon: String {
    switch self {
    case .newborn: return "moon.stars.fill"
    case .infant: return "heart.fill"
    case .firstFoods: return "leaf.fill"
    case .explorer: return "hand.wave.fill"
    case .toddlerEarly: return "figure.walk"
    case .toddlerLate: return "star.fill"
    }
  }

  var color: Color {
    switch self {
    case .newborn: return Color(red: 0.7, green: 0.8, blue: 1.0)
    case .infant: return Color(red: 1.0, green: 0.75, blue: 0.8)
    case .firstFoods: return Color(red: 0.6, green: 0.9, blue: 0.6)
    case .explorer: return Color(red: 1.0, green: 0.85, blue: 0.4)
    case .toddlerEarly: return Color(red: 1.0, green: 0.6, blue: 0.4)
    case .toddlerLate: return Color(red: 0.8, green: 0.6, blue: 1.0)
    }
  }

  var tagline: String {
    switch self {
    case .newborn: return "Liquid gold only. Breast milk or the cleanest formula."
    case .infant: return "Building the foundation. Every drop matters."
    case .firstFoods: return "First taste of Earth. Make it count."
    case .explorer: return "Textures, flavors, curiosity. The world on a spoon."
    case .toddlerEarly: return "Independence begins. Real food, real standards."
    case .toddlerLate: return "They eat what you eat. Lead by example."
    }
  }

  var feedingFocus: [String] {
    switch self {
    case .newborn:
      return [
        "Breast milk is the gold standard — living probiotic food",
        "If formula: choose organic, no corn syrup solids",
        "Feed on demand — every 2-3 hours",
        "No water, juice, or solid food yet",
        "Vitamin D supplement (400 IU/day) if breastfeeding",
      ]
    case .infant:
      return [
        "Breast milk or formula remains primary nutrition",
        "Watch for readiness signs around 5-6 months",
        "Head control + sitting support = almost ready",
        "Tongue thrust reflex fading = getting close",
        "Iron stores from birth start depleting — plan ahead",
      ]
    case .firstFoods:
      return [
        "Single-ingredient purees: sweet potato, avocado, banana",
        "Introduce one food at a time, wait 3-5 days",
        "Watch for reactions: rash, vomiting, diarrhea",
        "Iron-rich foods first: pureed meat, lentils, fortified cereal",
        "Breast milk / formula still provides 70%+ of calories",
      ]
    case .explorer:
      return [
        "Mashed and soft finger foods — build texture tolerance",
        "Introduce allergens early: egg, peanut butter (thinned), fish",
        "Self-feeding with soft pieces builds motor skills",
        "Offer water in open cup — practice, not volume",
        "No honey until 12 months (botulism risk)",
      ]
    case .toddlerEarly:
      return [
        "Transition to whole milk (if tolerated) or continue nursing",
        "3 meals + 2-3 snacks daily rhythm",
        "Healthy fats critical: avocado, coconut oil, olive oil, ghee",
        "Iron + zinc from real food: red meat, beans, dark greens",
        "Division of responsibility: you decide what, they decide how much",
      ]
    case .toddlerLate:
      return [
        "Eating mostly family foods now — cook clean for everyone",
        "DHA for brain: wild salmon, sardines, pastured eggs",
        "Limit added sugar to near zero — their palate is still forming",
        "Gut microbiome is being established NOW — fiber + ferments",
        "Every meal is programming their taste preferences for life",
      ]
    }
  }
}

// MARK: - Baby Food Red Flag Database

enum BabyFoodRedFlagDatabase {
  // ═══════════════════════════════════════════════════════
  // HEAVY METALS — The #1 hidden threat in baby food
  // Congressional report (Feb 2021) found dangerous levels
  // in products from major brands.
  // ═══════════════════════════════════════════════════════

  static let heavyMetals: [BabyRedFlag] = [
    BabyRedFlag(
      name: "Arsenic (inorganic)",
      icon: "exclamationmark.triangle.fill",
      severity: .critical,
      description:
        "Found in rice-based baby cereals, rice puffs, and teething biscuits. Inorganic arsenic is a Group 1 carcinogen. Rice absorbs arsenic from soil at 10x the rate of other grains.",
      commonProducts: [
        "Rice cereal", "Rice puffs/snacks", "Rice-based formula", "Teething biscuits",
        "Brown rice syrup sweetened products",
      ],
      saferAlternatives: [
        "Oat cereal", "Barley cereal", "Multi-grain options", "Sweet potato puffs",
        "Millet-based snacks",
      ],
      parentAction:
        "Limit rice-based products. If using rice cereal, cook in excess water (6:1 ratio) and drain — reduces arsenic 40-60%. Or choose oat cereal instead."
    ),
    BabyRedFlag(
      name: "Lead",
      icon: "exclamationmark.triangle.fill",
      severity: .critical,
      description:
        "No safe level of lead exposure exists for children. Found in root vegetables (carrots, sweet potatoes) grown in contaminated soil, and in some spice blends. Damages developing brain and nervous system.",
      commonProducts: [
        "Carrot-based purees", "Sweet potato snacks", "Mixed fruit juices", "Some spice blends",
        "Imported candy/snacks",
      ],
      saferAlternatives: [
        "Organic carrots (lower but not zero)", "Variety of vegetables", "Whole fruits over juices",
        "Single-origin spices", "Homemade purees with washed/peeled produce",
      ],
      parentAction:
        "Rotate foods — no single food daily. Peel root vegetables. Wash produce thoroughly. Variety is the best defense against any single contaminant accumulating."
    ),
    BabyRedFlag(
      name: "Cadmium",
      icon: "exclamationmark.triangle.fill",
      severity: .critical,
      description:
        "Accumulates in kidneys over a lifetime. Found in spinach, wheat, and some chocolate products. Baby kidneys are immature and especially vulnerable.",
      commonProducts: [
        "Spinach purees", "Wheat-based cereals", "Cocoa/chocolate snacks", "Some dried fruit",
        "Sunflower seed products",
      ],
      saferAlternatives: [
        "Rotate greens: kale, peas, broccoli", "Oat-based cereals", "Carob instead of cocoa",
        "Fresh fruit", "Pumpkin seed alternatives",
      ],
      parentAction:
        "Don't feed spinach daily — rotate greens. Organic doesn't mean cadmium-free (it's in soil). Diversity protects."
    ),
    BabyRedFlag(
      name: "Mercury",
      icon: "exclamationmark.triangle.fill",
      severity: .high,
      description:
        "Primarily from fish consumption. Methylmercury is a potent neurotoxin that crosses the blood-brain barrier and placenta. Developing brains are 5-10x more sensitive.",
      commonProducts: [
        "Tuna (especially albacore)", "Swordfish", "King mackerel", "Shark", "Tilefish",
      ],
      saferAlternatives: [
        "Wild salmon (lowest mercury)", "Sardines", "Tilapia", "Pollock", "Shrimp",
      ],
      parentAction:
        "Fish is excellent brain food — just choose low-mercury species. Wild salmon and sardines are ideal: high DHA, low mercury."
    ),
  ]

  // ═══════════════════════════════════════════════════════
  // FORMULA RED FLAGS — What's hiding in the bottle
  // ═══════════════════════════════════════════════════════

  static let formulaRedFlags: [BabyRedFlag] = [
    BabyRedFlag(
      name: "Corn Syrup Solids",
      icon: "drop.triangle.fill",
      severity: .high,
      description:
        "Used as the primary carbohydrate source in many popular formulas instead of lactose. It's cheaper to produce but metabolized differently. Programs taste preference for sweetness from day one.",
      commonProducts: [
        "Similac Sensitive", "Similac Soy Isomil", "Many store-brand formulas",
        "Some specialty formulas",
      ],
      saferAlternatives: [
        "Formulas with lactose as first carb", "European formulas (HiPP, Holle, Kendamil)",
        "Byheart", "Bobbie",
      ],
      parentAction:
        "Read the ingredient list — if corn syrup solids or glucose syrup is the first carbohydrate, the baby is basically drinking sugar water with vitamins. Lactose should be the primary carb (it's what's in breast milk)."
    ),
    BabyRedFlag(
      name: "Carrageenan",
      icon: "exclamationmark.triangle.fill",
      severity: .high,
      description:
        "Thickener linked to intestinal inflammation and gut barrier disruption. Found in some ready-to-feed formulas. An infant's gut is still developing — introducing an inflammatory agent is concerning.",
      commonProducts: [
        "Some ready-to-feed liquid formulas", "Toddler nutritional drinks", "Some soy formulas",
      ],
      saferAlternatives: [
        "Powder formula (usually carrageenan-free)", "Brands that explicitly exclude it",
        "European formulas",
      ],
      parentAction:
        "Check liquid/ready-to-feed versions specifically — the powder version of the same brand may not contain it. When in doubt, choose powder."
    ),
    BabyRedFlag(
      name: "DHA/ARA Extracted with Hexane",
      icon: "flask.fill",
      severity: .medium,
      description:
        "DHA and ARA are essential fatty acids added to formula — that's good. But many brands extract them from algae/fungus using hexane, a neurotoxic petroleum solvent. Trace residues may remain.",
      commonProducts: [
        "Most US formulas use hexane-extracted DHA (Martek/DSM oils)",
        "Listed as 'Crypthecodinium cohnii oil' or 'Mortierella alpina oil'",
      ],
      saferAlternatives: [
        "Formulas using water/enzyme-extracted DHA",
        "European formulas (different extraction standards)",
        "Brands that specify solvent-free DHA",
      ],
      parentAction:
        "Look for 'water-extracted' or 'solvent-free' DHA on label. If it doesn't say, assume hexane. Not a reason to avoid formula entirely — DHA matters for brain development."
    ),
    BabyRedFlag(
      name: "Soy-Based Formula (Phytoestrogens)",
      icon: "leaf.fill",
      severity: .medium,
      description:
        "Soy formula contains phytoestrogens (plant estrogens). A soy-fed infant receives the estrogenic equivalent of 3-5 birth control pills per day relative to body weight. Use only when medically necessary (galactosemia, true milk allergy).",
      commonProducts: ["Enfamil ProSobee", "Similac Soy Isomil", "Store brand soy formulas"],
      saferAlternatives: [
        "Hydrolyzed whey formulas for milk sensitivity",
        "Goat milk formula (closer to breast milk)", "Amino acid-based formula for severe allergy",
      ],
      parentAction:
        "Soy formula should be a last resort, not a first choice for fussiness. Talk to your pediatrician about hydrolyzed options first."
    ),
    BabyRedFlag(
      name: "Palm Oil (Palmitic Acid Source)",
      icon: "drop.fill",
      severity: .low,
      description:
        "Added to mimic the palmitic acid in breast milk, but plant-derived palm oil has a different structure (sn-1,3 vs sn-2 position). This leads to calcium soap formation in the gut, reducing calcium absorption by up to 38% and causing harder stools.",
      commonProducts: [
        "Many standard formulas list 'palm olein oil'", "Look for it in the fat blend",
      ],
      saferAlternatives: [
        "Palm-oil-free formulas (Similac, Kendamil)",
        "Formulas using OPO fat (structured like breast milk fat)", "Breast milk",
      ],
      parentAction:
        "If your baby has hard stools on formula, check for palm oil. Switching to a palm-oil-free version often resolves it within days."
    ),
  ]

  // ═══════════════════════════════════════════════════════
  // BABY FOOD ADDITIVES — Hidden in 'healthy' pouches
  // ═══════════════════════════════════════════════════════

  static let babyFoodAdditives: [BabyRedFlag] = [
    BabyRedFlag(
      name: "Added Sugars / Concentrated Fruit Juice",
      icon: "chart.bar.fill",
      severity: .high,
      description:
        "Many 'vegetable' baby pouches are 60-80% apple or pear concentrate to make them sweet. This trains the palate for sweetness, makes vegetables taste 'wrong' on their own, and spikes blood sugar.",
      commonProducts: [
        "Pouches labeled 'spinach kale pear' (check: pear is first ingredient)", "Toddler snacks",
        "'Yogurt' melts", "Juice 'blends'",
      ],
      saferAlternatives: [
        "Single-ingredient purees", "Homemade — you control the ratio",
        "Pouches where the vegetable is first ingredient", "Whole mashed fruit",
      ],
      parentAction:
        "Flip the pouch over. Read ingredients in order. If the 'vegetable' pouch starts with apple/pear concentrate, it's a fruit pouch wearing a vegetable costume."
    ),
    BabyRedFlag(
      name: "Citric Acid (Excessive)",
      icon: "bolt.fill",
      severity: .low,
      description:
        "Used as a preservative in pouches and purees. Generally safe, but excessive amounts can contribute to tooth enamel erosion in developing teeth and may irritate sensitive stomachs.",
      commonProducts: ["Most fruit pouches", "Shelf-stable purees", "Toddler fruit snacks"],
      saferAlternatives: [
        "Fresh or frozen homemade purees", "Pouches with minimal additives", "Whole soft fruits",
      ],
      parentAction:
        "Not a deal-breaker, but be mindful with pouch frequency. Dentists recommend not letting babies suck on pouches for extended periods — the acid + sugar contact time damages enamel."
    ),
    BabyRedFlag(
      name: "Artificial Colors (Red 40, Yellow 5, Blue 1)",
      icon: "paintpalette.fill",
      severity: .high,
      description:
        "Petroleum-derived dyes linked to hyperactivity, behavioral issues, and allergic reactions in children. Banned or require warning labels in the EU. Still unregulated in US children's food.",
      commonProducts: [
        "Toddler snacks", "Flavored yogurt", "Juice drinks", "Cereal", "Gummy vitamins",
        "Popsicles",
      ],
      saferAlternatives: [
        "Foods colored with beet juice, turmeric, spirulina", "Plain yogurt + real fruit",
        "Dye-free vitamins", "Homemade popsicles",
      ],
      parentAction:
        "If it's a color that doesn't exist in nature, it shouldn't go in your baby. Period. Check toddler vitamins — many popular brands are loaded with dyes."
    ),
    BabyRedFlag(
      name: "Sodium / Salt (Hidden)",
      icon: "drop.fill",
      severity: .medium,
      description:
        "Baby kidneys can't process excess sodium. Under 12 months: no added salt. 1-3 years: max 800mg/day. Many toddler foods contain adult-level sodium that can strain developing kidneys.",
      commonProducts: [
        "Toddler meals/trays", "Crackers", "Cheese snacks", "Canned vegetables", "Bread",
        "Pasta sauce",
      ],
      saferAlternatives: [
        "No-salt-added versions", "Homemade meals", "Fresh vegetables", "Unsalted rice cakes",
        "Low-sodium cheese",
      ],
      parentAction:
        "Compare labels: some toddler crackers have 200mg sodium per serving. For a 20lb baby, that's proportionally massive. Cook without salt for the first year — they don't know what they're 'missing.'"
    ),
    BabyRedFlag(
      name: "Pesticide Residues",
      icon: "leaf.arrow.triangle.circlepath",
      severity: .medium,
      description:
        "Babies are more vulnerable to pesticides per pound of body weight. The 'Dirty Dozen' applies even more to baby food. Organic reduces pesticide load by 80-90%.",
      commonProducts: [
        "Conventional strawberries", "Apples", "Grapes", "Spinach", "Peaches", "Pears",
      ],
      saferAlternatives: [
        "Organic versions of high-pesticide fruits",
        "Clean Fifteen: avocado, sweet corn, pineapple, peas", "Frozen organic (often cheaper)",
        "Local farmer's market",
      ],
      parentAction:
        "You don't need to buy ALL organic. Prioritize the Dirty Dozen (strawberries, spinach, apples, grapes, peaches). The Clean Fifteen are low-risk conventional."
    ),
  ]

  // ═══════════════════════════════════════════════════════
  // ABSOLUTE NO LIST — Zero tolerance for babies
  // ═══════════════════════════════════════════════════════

  static let absoluteNoList: [BabyAbsoluteNo] = [
    BabyAbsoluteNo(
      item: "Honey",
      reason: "Botulism risk — Clostridium botulinum spores. Infant gut can't fight it.",
      ageRestriction: "Under 12 months", icon: "xmark.shield.fill"),
    BabyAbsoluteNo(
      item: "Cow's Milk (as drink)",
      reason:
        "Too much protein/sodium for immature kidneys. Low in iron. Can cause microscopic GI bleeding.",
      ageRestriction: "Under 12 months", icon: "xmark.shield.fill"),
    BabyAbsoluteNo(
      item: "Whole Nuts / Nut Pieces",
      reason:
        "Choking hazard #1. Smooth nut butters thinned with breast milk are fine from 6 months.",
      ageRestriction: "Under 4 years", icon: "exclamationmark.triangle.fill"),
    BabyAbsoluteNo(
      item: "Whole Grapes / Cherry Tomatoes",
      reason: "Perfect size to block airway. Always cut lengthwise into quarters.",
      ageRestriction: "Under 4 years (unless quartered)", icon: "exclamationmark.triangle.fill"),
    BabyAbsoluteNo(
      item: "Added Sugar",
      reason:
        "Zero nutritional value. Programs taste buds for sweetness. WHO recommends no added sugar under 2.",
      ageRestriction: "Under 24 months", icon: "xmark.shield.fill"),
    BabyAbsoluteNo(
      item: "Added Salt",
      reason:
        "Immature kidneys can't excrete excess sodium. Can cause lasting kidney damage at high doses.",
      ageRestriction: "Under 12 months", icon: "xmark.shield.fill"),
    BabyAbsoluteNo(
      item: "Juice",
      reason:
        "AAP recommends zero juice under 12 months. Even after: it's just sugar water with less fiber than whole fruit.",
      ageRestriction: "Under 12 months", icon: "xmark.shield.fill"),
    BabyAbsoluteNo(
      item: "Hot Dogs / Sausage Rounds",
      reason:
        "The #1 choking death food for children. If serving, cut lengthwise then into small pieces.",
      ageRestriction: "Under 4 years (unless properly cut)", icon: "exclamationmark.triangle.fill"),
    BabyAbsoluteNo(
      item: "Rice Milk",
      reason:
        "Contains inorganic arsenic. Inadequate nutrition for growing babies. Not a suitable milk alternative.",
      ageRestriction: "Under 5 years as primary drink", icon: "xmark.shield.fill"),
    BabyAbsoluteNo(
      item: "Artificial Sweeteners",
      reason:
        "No safety data for infants. May disrupt developing gut microbiome. Zero reason to use.",
      ageRestriction: "Under 24 months", icon: "xmark.shield.fill"),
  ]

  /// All red flags combined for scanner integration
  static var allRedFlags: [BabyRedFlag] {
    heavyMetals + formulaRedFlags + babyFoodAdditives
  }
}

// MARK: - Baby Red Flag Model

struct BabyRedFlag: Identifiable {
  let id = UUID()
  let name: String
  let icon: String
  let severity: BabySeverity
  let description: String
  let commonProducts: [String]
  let saferAlternatives: [String]
  let parentAction: String
}

enum BabySeverity: String {
  case critical = "Critical"
  case high = "High Risk"
  case medium = "Caution"
  case low = "Watch"

  var color: Color {
    switch self {
    case .critical: return Color(red: 0.7, green: 0.0, blue: 0.0)
    case .high: return .red
    case .medium: return .orange
    case .low: return .yellow
    }
  }

  var icon: String {
    switch self {
    case .critical: return "xmark.octagon.fill"
    case .high: return "exclamationmark.triangle.fill"
    case .medium: return "exclamationmark.circle.fill"
    case .low: return "info.circle.fill"
    }
  }
}

struct BabyAbsoluteNo: Identifiable {
  let id = UUID()
  let item: String
  let reason: String
  let ageRestriction: String
  let icon: String
}

// MARK: - Baby Profile Manager

@MainActor
class BabyProfileManager: ObservableObject {
  static let shared = BabyProfileManager()

  @Published var babyName: String = ""
  @Published var birthDate: Date = .init()
  @Published var hasProfile: Bool = false
  @Published var feedingMethod: FeedingMethod = .breastfed
  @Published var knownAllergies: [String] = []
  @Published var introducedFoods: [IntroducedFood] = []

  private let profileKey = "baby.quantum.profile"
  private let foodLogKey = "baby.quantum.foodlog"

  enum FeedingMethod: String, CaseIterable, Codable {
    case breastfed = "Breastfeeding"
    case formula = "Formula"
    case combination = "Combination"

    var icon: String {
      switch self {
      case .breastfed: return "heart.fill"
      case .formula: return "cup.and.saucer.fill"
      case .combination: return "heart.circle.fill"
      }
    }
  }

  struct IntroducedFood: Identifiable, Codable {
    let id: String
    let name: String
    let dateIntroduced: Date
    let reaction: FoodReaction
    let notes: String

    init(
      id: String = UUID().uuidString, name: String, dateIntroduced: Date = Date(),
      reaction: FoodReaction = .none, notes: String = ""
    ) {
      self.id = id
      self.name = name
      self.dateIntroduced = dateIntroduced
      self.reaction = reaction
      self.notes = notes
    }
  }

  enum FoodReaction: String, CaseIterable, Codable {
    case none = "No Reaction"
    case mild = "Mild Reaction"
    case moderate = "Moderate Reaction"
    case severe = "Severe Reaction"
    case loved = "Loved It"
    case refused = "Refused"

    var icon: String {
      switch self {
      case .none: return "checkmark.circle.fill"
      case .mild: return "exclamationmark.circle"
      case .moderate: return "exclamationmark.triangle"
      case .severe: return "xmark.octagon.fill"
      case .loved: return "heart.fill"
      case .refused: return "hand.raised.fill"
      }
    }

    var color: Color {
      switch self {
      case .none: return .green
      case .mild: return .yellow
      case .moderate: return .orange
      case .severe: return .red
      case .loved: return .pink
      case .refused: return .gray
      }
    }
  }

  var currentStage: BabyAgeStage {
    let months = Calendar.current.dateComponents([.month], from: birthDate, to: Date()).month ?? 0
    switch months {
    case 0...3: return .newborn
    case 4...6: return .infant
    case 7...9: return .firstFoods
    case 10...12: return .explorer
    case 13...18: return .toddlerEarly
    default: return .toddlerLate
    }
  }

  var ageInMonths: Int {
    Calendar.current.dateComponents([.month], from: birthDate, to: Date()).month ?? 0
  }

  var ageDisplayString: String {
    let months = ageInMonths
    if months < 1 { return "Newborn" }
    if months == 1 { return "1 month" }
    if months < 12 { return "\(months) months" }
    let years = months / 12
    let remainingMonths = months % 12
    if remainingMonths == 0 { return "\(years) year\(years > 1 ? "s" : "")" }
    return "\(years)y \(remainingMonths)m"
  }

  init() {
    load()
  }

  func saveProfile() {
    let profile = BabyProfile(
      name: babyName,
      birthDate: birthDate,
      feedingMethod: feedingMethod,
      knownAllergies: knownAllergies
    )
    if let data = try? JSONEncoder().encode(profile) {
      UserDefaults.standard.set(data, forKey: profileKey)
    }
    hasProfile = true
    persistFoodLog()
  }

  func addIntroducedFood(_ food: IntroducedFood) {
    introducedFoods.insert(food, at: 0)
    persistFoodLog()
  }

  func removeFood(at offsets: IndexSet) {
    introducedFoods.remove(atOffsets: offsets)
    persistFoodLog()
  }

  func resetProfile() {
    babyName = ""
    birthDate = Date()
    feedingMethod = .breastfed
    knownAllergies = []
    introducedFoods = []
    hasProfile = false
    UserDefaults.standard.removeObject(forKey: profileKey)
    UserDefaults.standard.removeObject(forKey: foodLogKey)
  }

  private func load() {
    if let data = UserDefaults.standard.data(forKey: profileKey),
      let profile = try? JSONDecoder().decode(BabyProfile.self, from: data)
    {
      babyName = profile.name
      birthDate = profile.birthDate
      feedingMethod = profile.feedingMethod
      knownAllergies = profile.knownAllergies
      hasProfile = true
    }
    if let data = UserDefaults.standard.data(forKey: foodLogKey),
      let foods = try? JSONDecoder().decode([IntroducedFood].self, from: data)
    {
      introducedFoods = foods
    }
  }

  private func persistFoodLog() {
    if let data = try? JSONEncoder().encode(introducedFoods) {
      UserDefaults.standard.set(data, forKey: foodLogKey)
    }
  }
}

private struct BabyProfile: Codable {
  let name: String
  let birthDate: Date
  let feedingMethod: BabyProfileManager.FeedingMethod
  let knownAllergies: [String]
}

// MARK: - ═══════════════════════════════════════════════════

// MAIN VIEW: Baby Quantum Nutrition Hub
// ═══════════════════════════════════════════════════════════

struct BabyQuantumNutritionView: View {
  @Environment(\.dismiss) var dismiss
  @StateObject private var profile = BabyProfileManager.shared
  @State private var selectedSection: BabySection? = nil
  @State private var showProfileSetup = false
  @State private var pulsePhase: CGFloat = 0

  enum BabySection: String, Identifiable {
    case stageGuide = "Stage Guide"
    case formulaCheck = "Formula Check"
    case redFlags = "Red Flags"
    case absoluteNos = "Never Feed"
    case foodIntroLog = "Food Intro Log"
    case cleanBrands = "Clean Brands"
    case homemadeGuide = "Homemade Guide"
    case allergenTracker = "Allergen Tracker"

    var id: String {
      rawValue
    }
  }

  var body: some View {
    NavigationStack {
      ZStack {
        babyBackground

        ScrollView(showsIndicators: false) {
          VStack(spacing: 24) {
            heroSection

            if profile.hasProfile {
              babyProfileCard
              stageFocusCard
            } else {
              setupPromptCard
            }

            quickActionsGrid
            absoluteNosPreview
            heavyMetalsWarning
            formulaInsightCard

            babyDisclaimer

            Spacer(minLength: 120)
          }
          .padding(.horizontal, 20)
        }
      }
      .navigationTitle("")
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItem(placement: .navigationBarLeading) {
          Button {
            dismiss()
          } label: {
            Image(systemName: "chevron.left")
              .font(.system(size: 16, weight: .semibold))
              .foregroundColor(.white)
          }
        }
        ToolbarItem(placement: .principal) {
          Text("Tiny Humans")
            .font(.system(size: 17, weight: .bold))
            .foregroundColor(.white)
        }
        ToolbarItem(placement: .navigationBarTrailing) {
          Button {
            showProfileSetup = true
          } label: {
            Image(
              systemName: profile.hasProfile
                ? "person.crop.circle.fill" : "person.crop.circle.badge.plus"
            )
            .font(.system(size: 18))
            .foregroundColor(Color(red: 1.0, green: 0.75, blue: 0.8))
          }
        }
      }
      .sheet(isPresented: $showProfileSetup) {
        BabyProfileSetupView(profile: profile)
      }
      .sheet(item: $selectedSection) { section in
        sectionDestination(section)
      }
    }
  }

  // MARK: - Background

  private var babyBackground: some View {
    LinearGradient(
      gradient: Gradient(colors: [
        Color(red: 0.06, green: 0.04, blue: 0.12),
        Color(red: 0.08, green: 0.06, blue: 0.16),
        Color(red: 0.05, green: 0.03, blue: 0.10),
      ]),
      startPoint: .top, endPoint: .bottom
    )
    .ignoresSafeArea()
    .overlay(
      Circle()
        .fill(Color(red: 1.0, green: 0.75, blue: 0.8).opacity(0.03))
        .frame(width: 400, height: 400)
        .blur(radius: 80)
        .offset(y: -100)
    )
  }

  // MARK: - Hero

  private var heroSection: some View {
    VStack(spacing: 12) {
      Text("👶")
        .font(.system(size: 56))
        .scaleEffect(1 + sin(pulsePhase) * 0.05)
        .onAppear {
          withAnimation(.easeInOut(duration: 3).repeatForever(autoreverses: true)) {
            pulsePhase = .pi * 2
          }
        }

      Text("QUANTUM NOURISH")
        .font(.system(size: 10, weight: .bold))
        .tracking(4)
        .foregroundColor(Color(red: 1.0, green: 0.75, blue: 0.8).opacity(0.6))

      Text("Tiny Humans")
        .font(.system(size: 28, weight: .bold, design: .rounded))
        .foregroundColor(.white)

      Text("They didn't choose to be here.\nWe owe them the cleanest start possible.")
        .font(.system(size: 13, weight: .medium))
        .foregroundColor(.white.opacity(0.6))
        .multilineTextAlignment(.center)
        .lineSpacing(4)
    }
    .padding(.top, 10)
  }

  // MARK: - Baby Profile Card

  private var babyProfileCard: some View {
    VStack(spacing: 14) {
      HStack {
        VStack(alignment: .leading, spacing: 4) {
          HStack(spacing: 6) {
            Image(systemName: profile.currentStage.icon)
              .foregroundColor(profile.currentStage.color)
            Text(profile.babyName.isEmpty ? "Baby" : profile.babyName)
              .font(.system(size: 18, weight: .bold))
              .foregroundColor(.white)
          }
          Text("\(profile.ageDisplayString) • \(profile.currentStage.rawValue)")
            .font(.system(size: 12, weight: .medium))
            .foregroundColor(.white.opacity(0.5))
        }
        Spacer()

        VStack(alignment: .trailing, spacing: 4) {
          Image(systemName: profile.feedingMethod.icon)
            .font(.system(size: 20))
            .foregroundColor(Color(red: 1.0, green: 0.75, blue: 0.8))
          Text(profile.feedingMethod.rawValue)
            .font(.system(size: 10, weight: .medium))
            .foregroundColor(.white.opacity(0.4))
        }
      }

      if !profile.knownAllergies.isEmpty {
        HStack(spacing: 4) {
          Image(systemName: "exclamationmark.triangle.fill")
            .font(.system(size: 10))
            .foregroundColor(.orange)
          Text("Allergies: \(profile.knownAllergies.joined(separator: ", "))")
            .font(.system(size: 11, weight: .medium))
            .foregroundColor(.orange.opacity(0.8))
          Spacer()
        }
      }

      HStack(spacing: 6) {
        Image(systemName: "leaf.fill")
          .font(.system(size: 10))
          .foregroundColor(.green.opacity(0.7))
        Text("\(profile.introducedFoods.count) foods introduced")
          .font(.system(size: 11, weight: .medium))
          .foregroundColor(.white.opacity(0.4))
        Spacer()
      }
    }
    .padding(16)
    .background(
      RoundedRectangle(cornerRadius: 16)
        .fill(Color.white.opacity(0.04))
        .overlay(
          RoundedRectangle(cornerRadius: 16)
            .stroke(profile.currentStage.color.opacity(0.2), lineWidth: 1)
        )
    )
  }

  // MARK: - Stage Focus Card

  private var stageFocusCard: some View {
    let stage = profile.currentStage
    return VStack(alignment: .leading, spacing: 12) {
      HStack(spacing: 8) {
        Image(systemName: stage.icon)
          .font(.system(size: 16))
          .foregroundColor(stage.color)
        Text("Stage Focus: \(stage.rawValue)")
          .font(.system(size: 14, weight: .bold))
          .foregroundColor(.white)
        Spacer()
        Text(stage.ageRange)
          .font(.system(size: 10, weight: .medium))
          .foregroundColor(.white.opacity(0.4))
      }

      Text(stage.tagline)
        .font(.system(size: 12, weight: .medium, design: .rounded))
        .foregroundColor(stage.color.opacity(0.8))
        .italic()

      Divider().background(Color.white.opacity(0.1))

      ForEach(Array(stage.feedingFocus.enumerated()), id: \.offset) { _, tip in
        HStack(alignment: .top, spacing: 8) {
          Text("•")
            .font(.system(size: 12, weight: .bold))
            .foregroundColor(stage.color.opacity(0.6))
          Text(tip)
            .font(.system(size: 12, weight: .regular))
            .foregroundColor(.white.opacity(0.7))
            .lineSpacing(3)
          Spacer()
        }
      }
    }
    .padding(16)
    .background(
      RoundedRectangle(cornerRadius: 16)
        .fill(stage.color.opacity(0.04))
        .overlay(
          RoundedRectangle(cornerRadius: 16)
            .stroke(stage.color.opacity(0.15), lineWidth: 1)
        )
    )
  }

  // MARK: - Setup Prompt

  private var setupPromptCard: some View {
    VStack(spacing: 16) {
      Image(systemName: "person.crop.circle.badge.plus")
        .font(.system(size: 36))
        .foregroundColor(Color(red: 1.0, green: 0.75, blue: 0.8))

      Text("Set up baby's profile")
        .font(.system(size: 16, weight: .bold))
        .foregroundColor(.white)

      Text(
        "Enter their birthdate and we'll personalize nutrition guidance for their exact age and stage."
      )
      .font(.system(size: 12, weight: .medium))
      .foregroundColor(.white.opacity(0.5))
      .multilineTextAlignment(.center)

      Button {
        showProfileSetup = true
      } label: {
        Text("Create Profile")
          .font(.system(size: 14, weight: .bold))
          .foregroundColor(.black)
          .padding(.horizontal, 24)
          .padding(.vertical, 10)
          .background(Capsule().fill(Color(red: 1.0, green: 0.75, blue: 0.8)))
      }
    }
    .padding(24)
    .background(
      RoundedRectangle(cornerRadius: 16)
        .fill(Color.white.opacity(0.04))
        .overlay(
          RoundedRectangle(cornerRadius: 16)
            .stroke(Color(red: 1.0, green: 0.75, blue: 0.8).opacity(0.2), lineWidth: 1)
        )
    )
  }

  // MARK: - Quick Actions Grid

  private var quickActionsGrid: some View {
    let actions: [(BabySection, String, String, Color)] = [
      (.stageGuide, "Age Guide", "calendar.circle.fill", Color(red: 0.7, green: 0.8, blue: 1.0)),
      (.formulaCheck, "Formula", "cup.and.saucer.fill", Color(red: 1.0, green: 0.75, blue: 0.8)),
      (.redFlags, "Red Flags", "exclamationmark.triangle.fill", .red),
      (.absoluteNos, "Never Feed", "xmark.octagon.fill", Color(red: 0.7, green: 0.0, blue: 0.0)),
      (.foodIntroLog, "Food Log", "list.bullet.clipboard.fill", .green),
      (.homemadeGuide, "Homemade", "frying.pan.fill", Color(red: 1.0, green: 0.85, blue: 0.4)),
      (.cleanBrands, "Clean Brands", "checkmark.seal.fill", Color(red: 0.6, green: 0.9, blue: 0.6)),
      (.allergenTracker, "Allergens", "allergens.fill", .orange),
    ]

    return VStack(spacing: 8) {
      HStack(spacing: 6) {
        Image(systemName: "square.grid.2x2.fill")
          .font(.system(size: 10))
          .foregroundColor(Color(red: 1.0, green: 0.75, blue: 0.8).opacity(0.5))
        Text("MODULES")
          .font(.system(size: 10, weight: .bold))
          .tracking(2)
          .foregroundColor(Color(red: 1.0, green: 0.75, blue: 0.8).opacity(0.5))
        Spacer()
      }

      LazyVGrid(
        columns: [
          GridItem(.flexible(), spacing: 10),
          GridItem(.flexible(), spacing: 10),
        ], spacing: 10
      ) {
        ForEach(Array(actions.enumerated()), id: \.offset) { _, action in
          Button {
            selectedSection = action.0
          } label: {
            HStack(spacing: 10) {
              Image(systemName: action.2)
                .font(.system(size: 18))
                .foregroundColor(action.3)
                .frame(width: 30)
              Text(action.1)
                .font(.system(size: 13, weight: .semibold))
                .foregroundColor(.white)
              Spacer()
            }
            .padding(12)
            .background(
              RoundedRectangle(cornerRadius: 12)
                .fill(action.3.opacity(0.06))
                .overlay(
                  RoundedRectangle(cornerRadius: 12)
                    .stroke(action.3.opacity(0.12), lineWidth: 1)
                )
            )
          }
        }
      }
    }
  }

  // MARK: - Absolute Nos Preview

  private var absoluteNosPreview: some View {
    VStack(alignment: .leading, spacing: 12) {
      HStack(spacing: 6) {
        Image(systemName: "xmark.octagon.fill")
          .foregroundColor(Color(red: 0.7, green: 0.0, blue: 0.0))
        Text("ABSOLUTE NO LIST")
          .font(.system(size: 10, weight: .bold))
          .tracking(2)
          .foregroundColor(Color(red: 0.7, green: 0.0, blue: 0.0))
        Spacer()
        Button {
          selectedSection = .absoluteNos
        } label: {
          Text("See All")
            .font(.system(size: 11, weight: .medium))
            .foregroundColor(.white.opacity(0.4))
        }
      }

      ForEach(Array(BabyFoodRedFlagDatabase.absoluteNoList.prefix(4)), id: \.id) { item in
        HStack(spacing: 10) {
          Image(systemName: item.icon)
            .font(.system(size: 12))
            .foregroundColor(.red)
            .frame(width: 20)
          VStack(alignment: .leading, spacing: 2) {
            Text(item.item)
              .font(.system(size: 13, weight: .semibold))
              .foregroundColor(.white)
            Text(item.ageRestriction)
              .font(.system(size: 10, weight: .medium))
              .foregroundColor(.red.opacity(0.6))
          }
          Spacer()
        }
      }
    }
    .padding(16)
    .background(
      RoundedRectangle(cornerRadius: 16)
        .fill(Color.red.opacity(0.04))
        .overlay(
          RoundedRectangle(cornerRadius: 16)
            .stroke(Color.red.opacity(0.15), lineWidth: 1)
        )
    )
  }

  // MARK: - Heavy Metals Warning

  private var heavyMetalsWarning: some View {
    VStack(alignment: .leading, spacing: 12) {
      HStack(spacing: 6) {
        Image(systemName: "atom")
          .foregroundColor(.orange)
        Text("HEAVY METALS IN BABY FOOD")
          .font(.system(size: 10, weight: .bold))
          .tracking(2)
          .foregroundColor(.orange)
        Spacer()
      }

      Text(
        "A 2021 Congressional investigation found dangerous levels of arsenic, lead, cadmium, and mercury in baby foods from major brands. The FDA has proposed limits but enforcement is slow."
      )
      .font(.system(size: 12, weight: .regular))
      .foregroundColor(.white.opacity(0.6))
      .lineSpacing(4)

      HStack(spacing: 12) {
        heavyMetalPill("Arsenic", "Rice cereals")
        heavyMetalPill("Lead", "Root vegs")
        heavyMetalPill("Cadmium", "Spinach")
      }

      Button {
        selectedSection = .redFlags
      } label: {
        Text("Learn How to Protect Your Baby →")
          .font(.system(size: 12, weight: .bold))
          .foregroundColor(.orange)
      }
    }
    .padding(16)
    .background(
      RoundedRectangle(cornerRadius: 16)
        .fill(Color.orange.opacity(0.04))
        .overlay(
          RoundedRectangle(cornerRadius: 16)
            .stroke(Color.orange.opacity(0.15), lineWidth: 1)
        )
    )
  }

  private func heavyMetalPill(_ metal: String, _ source: String) -> some View {
    VStack(spacing: 4) {
      Text(metal)
        .font(.system(size: 11, weight: .bold))
        .foregroundColor(.orange)
      Text(source)
        .font(.system(size: 9, weight: .medium))
        .foregroundColor(.white.opacity(0.4))
    }
    .padding(.horizontal, 10)
    .padding(.vertical, 6)
    .background(
      RoundedRectangle(cornerRadius: 8)
        .fill(Color.orange.opacity(0.08))
    )
  }

  // MARK: - Formula Insight

  private var formulaInsightCard: some View {
    VStack(alignment: .leading, spacing: 12) {
      HStack(spacing: 6) {
        Image(systemName: "cup.and.saucer.fill")
          .foregroundColor(Color(red: 1.0, green: 0.75, blue: 0.8))
        Text("FORMULA REALITY CHECK")
          .font(.system(size: 10, weight: .bold))
          .tracking(2)
          .foregroundColor(Color(red: 1.0, green: 0.75, blue: 0.8))
        Spacer()
      }

      Text(
        "The first ingredient in many popular US formulas is corn syrup solids — not lactose. Your baby's first food is sugar water with vitamins. European formulas are held to stricter standards."
      )
      .font(.system(size: 12, weight: .regular))
      .foregroundColor(.white.opacity(0.6))
      .lineSpacing(4)

      Button {
        selectedSection = .formulaCheck
      } label: {
        Text("Check Your Formula →")
          .font(.system(size: 12, weight: .bold))
          .foregroundColor(Color(red: 1.0, green: 0.75, blue: 0.8))
      }
    }
    .padding(16)
    .background(
      RoundedRectangle(cornerRadius: 16)
        .fill(Color(red: 1.0, green: 0.75, blue: 0.8).opacity(0.04))
        .overlay(
          RoundedRectangle(cornerRadius: 16)
            .stroke(Color(red: 1.0, green: 0.75, blue: 0.8).opacity(0.15), lineWidth: 1)
        )
    )
  }

  // MARK: - Baby Disclaimer

  private var babyDisclaimer: some View {
    VStack(spacing: 10) {
      HStack(spacing: 6) {
        Image(systemName: "cross.case.fill")
          .font(.system(size: 10))
          .foregroundColor(.red.opacity(0.6))
        Text("IMPORTANT")
          .font(.system(size: 9, weight: .bold))
          .tracking(2)
          .foregroundColor(.red.opacity(0.6))
        Spacer()
      }

      Text(
        "Tiny Humans is for educational purposes only and is not a substitute for pediatric medical advice. Always consult your pediatrician before making changes to your baby's diet, especially regarding formula choice, food introduction timing, and allergy management. Every baby is different."
      )
      .font(.system(size: 11, weight: .regular))
      .foregroundColor(.white.opacity(0.4))
      .lineSpacing(4)
    }
    .padding(14)
    .background(
      RoundedRectangle(cornerRadius: 12)
        .fill(Color.red.opacity(0.03))
        .overlay(
          RoundedRectangle(cornerRadius: 12)
            .stroke(Color.red.opacity(0.1), lineWidth: 1)
        )
    )
  }

  // MARK: - Section Router

  @ViewBuilder
  private func sectionDestination(_ section: BabySection) -> some View {
    switch section {
    case .stageGuide:
      BabyStageGuideView()
    case .formulaCheck:
      BabyRedFlagListView(
        title: "Formula Red Flags", subtitle: "What's hiding in the bottle",
        flags: BabyFoodRedFlagDatabase.formulaRedFlags)
    case .redFlags:
      BabyRedFlagListView(
        title: "Baby Food Red Flags", subtitle: "Heavy metals, additives, and hidden dangers",
        flags: BabyFoodRedFlagDatabase.allRedFlags)
    case .absoluteNos:
      BabyAbsoluteNoListView()
    case .foodIntroLog:
      BabyFoodIntroLogView(profile: profile)
    case .cleanBrands:
      BabyCleanBrandsView()
    case .homemadeGuide:
      BabyHomemadeGuideView()
    case .allergenTracker:
      BabyAllergenTrackerView(profile: profile)
    }
  }
}

// MARK: - ═══════════════════════════════════════════════════

// PROFILE SETUP VIEW
// ═══════════════════════════════════════════════════════════

struct BabyProfileSetupView: View {
  @Environment(\.dismiss) var dismiss
  @ObservedObject var profile: BabyProfileManager
  @State private var nameInput: String = ""
  @State private var dateInput: Date = .init()
  @State private var methodInput: BabyProfileManager.FeedingMethod = .breastfed
  @State private var allergyInput: String = ""
  @State private var allergiesInput: [String] = []

  var body: some View {
    NavigationStack {
      ZStack {
        Color(red: 0.06, green: 0.04, blue: 0.12).ignoresSafeArea()

        ScrollView(showsIndicators: false) {
          VStack(spacing: 24) {
            Text("👶")
              .font(.system(size: 48))

            Text("Baby Profile")
              .font(.system(size: 22, weight: .bold))
              .foregroundColor(.white)

            Text(
              "We'll personalize nutrition guidance based on your baby's age and needs. All data stays on this device."
            )
            .font(.system(size: 13, weight: .medium))
            .foregroundColor(.white.opacity(0.5))
            .multilineTextAlignment(.center)

            // Name
            VStack(alignment: .leading, spacing: 8) {
              Text("Baby's Name")
                .font(.system(size: 12, weight: .bold))
                .foregroundColor(.white.opacity(0.6))
              TextField("Name (optional)", text: $nameInput)
                .font(.system(size: 15))
                .foregroundColor(.white)
                .padding(12)
                .background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.06)))
            }

            // Birth Date
            VStack(alignment: .leading, spacing: 8) {
              Text("Date of Birth")
                .font(.system(size: 12, weight: .bold))
                .foregroundColor(.white.opacity(0.6))
              DatePicker("", selection: $dateInput, in: ...Date(), displayedComponents: .date)
                .datePickerStyle(.compact)
                .labelsHidden()
                .colorScheme(.dark)
            }

            // Feeding Method
            VStack(alignment: .leading, spacing: 8) {
              Text("Primary Feeding")
                .font(.system(size: 12, weight: .bold))
                .foregroundColor(.white.opacity(0.6))

              HStack(spacing: 10) {
                ForEach(BabyProfileManager.FeedingMethod.allCases, id: \.self) { method in
                  Button {
                    methodInput = method
                  } label: {
                    VStack(spacing: 6) {
                      Image(systemName: method.icon)
                        .font(.system(size: 20))
                      Text(method.rawValue)
                        .font(.system(size: 10, weight: .medium))
                    }
                    .foregroundColor(methodInput == method ? .white : .white.opacity(0.4))
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 12)
                    .background(
                      RoundedRectangle(cornerRadius: 10)
                        .fill(
                          methodInput == method
                            ? Color(red: 1.0, green: 0.75, blue: 0.8).opacity(0.2)
                            : Color.white.opacity(0.04)
                        )
                        .overlay(
                          RoundedRectangle(cornerRadius: 10)
                            .stroke(
                              methodInput == method
                                ? Color(red: 1.0, green: 0.75, blue: 0.8).opacity(0.4)
                                : Color.clear, lineWidth: 1)
                        )
                    )
                  }
                }
              }
            }

            // Known Allergies
            VStack(alignment: .leading, spacing: 8) {
              Text("Known Allergies")
                .font(.system(size: 12, weight: .bold))
                .foregroundColor(.white.opacity(0.6))

              HStack {
                TextField("Add allergy (e.g., dairy, eggs)", text: $allergyInput)
                  .font(.system(size: 14))
                  .foregroundColor(.white)
                  .padding(10)
                  .background(RoundedRectangle(cornerRadius: 8).fill(Color.white.opacity(0.06)))

                Button {
                  let trimmed = allergyInput.trimmingCharacters(in: .whitespaces)
                  if !trimmed.isEmpty {
                    allergiesInput.append(trimmed)
                    allergyInput = ""
                  }
                } label: {
                  Image(systemName: "plus.circle.fill")
                    .font(.system(size: 24))
                    .foregroundColor(Color(red: 1.0, green: 0.75, blue: 0.8))
                }
              }

              if !allergiesInput.isEmpty {
                FlowLayoutCompat(spacing: 6) {
                  ForEach(Array(allergiesInput.enumerated()), id: \.offset) { index, allergy in
                    HStack(spacing: 4) {
                      Text(allergy)
                        .font(.system(size: 12, weight: .medium))
                        .foregroundColor(.white)
                      Button {
                        allergiesInput.remove(at: index)
                      } label: {
                        Image(systemName: "xmark.circle.fill")
                          .font(.system(size: 12))
                          .foregroundColor(.white.opacity(0.5))
                      }
                    }
                    .padding(.horizontal, 10)
                    .padding(.vertical, 6)
                    .background(Capsule().fill(Color.orange.opacity(0.2)))
                  }
                }
              }
            }

            // Privacy Note
            HStack(spacing: 8) {
              Image(systemName: "lock.shield.fill")
                .font(.system(size: 14))
                .foregroundColor(.green.opacity(0.6))
              Text("All baby data is stored locally on this device only. Never uploaded.")
                .font(.system(size: 11, weight: .medium))
                .foregroundColor(.white.opacity(0.4))
            }
            .padding(10)
            .background(RoundedRectangle(cornerRadius: 8).fill(Color.green.opacity(0.04)))

            // Save Button
            Button {
              profile.babyName = nameInput
              profile.birthDate = dateInput
              profile.feedingMethod = methodInput
              profile.knownAllergies = allergiesInput
              profile.saveProfile()
              dismiss()
            } label: {
              Text("Save Profile")
                .font(.system(size: 16, weight: .bold))
                .foregroundColor(.black)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 14)
                .background(Capsule().fill(Color(red: 1.0, green: 0.75, blue: 0.8)))
            }

            if profile.hasProfile {
              Button {
                profile.resetProfile()
                dismiss()
              } label: {
                Text("Remove Profile")
                  .font(.system(size: 13, weight: .medium))
                  .foregroundColor(.red.opacity(0.6))
              }
            }

            Spacer(minLength: 40)
          }
          .padding(.horizontal, 24)
          .padding(.top, 20)
        }
      }
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItem(placement: .navigationBarTrailing) {
          Button {
            dismiss()
          } label: {
            Image(systemName: "xmark.circle.fill")
              .foregroundColor(.white.opacity(0.4))
          }
        }
      }
      .onAppear {
        nameInput = profile.babyName
        dateInput = profile.birthDate
        methodInput = profile.feedingMethod
        allergiesInput = profile.knownAllergies
      }
    }
  }
}

/// Simple flow layout for allergy tags
struct FlowLayoutCompat<Content: View>: View {
  let spacing: CGFloat
  @ViewBuilder let content: () -> Content

  var body: some View {
    // Simplified — wraps in HStack for now
    // Full FlowLayout already exists in Core/Preferences/FlowLayout.swift
    HStack(spacing: spacing) {
      content()
    }
  }
}

// MARK: - ═══════════════════════════════════════════════════

// STAGE GUIDE VIEW
// ═══════════════════════════════════════════════════════════

struct BabyStageGuideView: View {
  @Environment(\.dismiss) var dismiss

  var body: some View {
    NavigationStack {
      ZStack {
        Color(red: 0.06, green: 0.04, blue: 0.12).ignoresSafeArea()

        ScrollView(showsIndicators: false) {
          VStack(spacing: 20) {
            ForEach(BabyAgeStage.allCases) { stage in
              stageCard(stage)
            }
            Spacer(minLength: 40)
          }
          .padding(.horizontal, 20)
          .padding(.top, 10)
        }
      }
      .navigationTitle("Age & Stage Guide")
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItem(placement: .navigationBarTrailing) {
          Button {
            dismiss()
          } label: {
            Image(systemName: "xmark.circle.fill")
              .foregroundColor(.white.opacity(0.4))
          }
        }
      }
    }
  }

  private func stageCard(_ stage: BabyAgeStage) -> some View {
    VStack(alignment: .leading, spacing: 12) {
      HStack(spacing: 10) {
        Image(systemName: stage.icon)
          .font(.system(size: 22))
          .foregroundColor(stage.color)
        VStack(alignment: .leading, spacing: 2) {
          Text(stage.rawValue)
            .font(.system(size: 16, weight: .bold))
            .foregroundColor(.white)
          Text(stage.ageRange)
            .font(.system(size: 11, weight: .medium))
            .foregroundColor(.white.opacity(0.4))
        }
        Spacer()
      }

      Text(stage.tagline)
        .font(.system(size: 12, weight: .medium, design: .rounded))
        .foregroundColor(stage.color.opacity(0.8))
        .italic()

      Divider().background(Color.white.opacity(0.08))

      ForEach(Array(stage.feedingFocus.enumerated()), id: \.offset) { _, tip in
        HStack(alignment: .top, spacing: 8) {
          Circle()
            .fill(stage.color.opacity(0.4))
            .frame(width: 5, height: 5)
            .padding(.top, 5)
          Text(tip)
            .font(.system(size: 12, weight: .regular))
            .foregroundColor(.white.opacity(0.7))
            .lineSpacing(3)
          Spacer()
        }
      }
    }
    .padding(16)
    .background(
      RoundedRectangle(cornerRadius: 16)
        .fill(stage.color.opacity(0.04))
        .overlay(
          RoundedRectangle(cornerRadius: 16)
            .stroke(stage.color.opacity(0.15), lineWidth: 1)
        )
    )
  }
}

// MARK: - ═══════════════════════════════════════════════════

// RED FLAG LIST VIEW (Reusable)
// ═══════════════════════════════════════════════════════════

struct BabyRedFlagListView: View {
  @Environment(\.dismiss) var dismiss
  let title: String
  let subtitle: String
  let flags: [BabyRedFlag]
  @State private var expandedId: UUID? = nil

  var body: some View {
    NavigationStack {
      ZStack {
        Color(red: 0.06, green: 0.04, blue: 0.12).ignoresSafeArea()

        ScrollView(showsIndicators: false) {
          VStack(spacing: 12) {
            Text(subtitle)
              .font(.system(size: 13, weight: .medium))
              .foregroundColor(.white.opacity(0.5))
              .padding(.bottom, 8)

            ForEach(flags) { flag in
              redFlagCard(flag)
            }
            Spacer(minLength: 40)
          }
          .padding(.horizontal, 20)
          .padding(.top, 10)
        }
      }
      .navigationTitle(title)
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItem(placement: .navigationBarTrailing) {
          Button {
            dismiss()
          } label: {
            Image(systemName: "xmark.circle.fill")
              .foregroundColor(.white.opacity(0.4))
          }
        }
      }
    }
  }

  private func redFlagCard(_ flag: BabyRedFlag) -> some View {
    let isExpanded = expandedId == flag.id

    return VStack(alignment: .leading, spacing: 0) {
      // Header — always visible
      Button {
        withAnimation(.spring(response: 0.3)) {
          expandedId = isExpanded ? nil : flag.id
        }
      } label: {
        HStack(spacing: 10) {
          Image(systemName: flag.severity.icon)
            .font(.system(size: 16))
            .foregroundColor(flag.severity.color)

          VStack(alignment: .leading, spacing: 2) {
            Text(flag.name)
              .font(.system(size: 14, weight: .bold))
              .foregroundColor(.white)
            Text(flag.severity.rawValue)
              .font(.system(size: 10, weight: .bold))
              .foregroundColor(flag.severity.color)
          }

          Spacer()

          Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
            .font(.system(size: 12, weight: .semibold))
            .foregroundColor(.white.opacity(0.3))
        }
        .padding(14)
      }

      // Expanded content
      if isExpanded {
        VStack(alignment: .leading, spacing: 14) {
          Divider().background(Color.white.opacity(0.08))

          Text(flag.description)
            .font(.system(size: 12, weight: .regular))
            .foregroundColor(.white.opacity(0.7))
            .lineSpacing(4)

          // Common Products
          VStack(alignment: .leading, spacing: 6) {
            Text("WHERE IT HIDES")
              .font(.system(size: 9, weight: .bold))
              .tracking(1.5)
              .foregroundColor(.red.opacity(0.6))
            ForEach(flag.commonProducts, id: \.self) { product in
              HStack(spacing: 6) {
                Text("•").foregroundColor(.red.opacity(0.4))
                Text(product)
                  .font(.system(size: 11, weight: .medium))
                  .foregroundColor(.white.opacity(0.6))
              }
            }
          }

          // Safer Alternatives
          VStack(alignment: .leading, spacing: 6) {
            Text("SAFER ALTERNATIVES")
              .font(.system(size: 9, weight: .bold))
              .tracking(1.5)
              .foregroundColor(.green.opacity(0.6))
            ForEach(flag.saferAlternatives, id: \.self) { alt in
              HStack(spacing: 6) {
                Text("✓").foregroundColor(.green.opacity(0.4))
                Text(alt)
                  .font(.system(size: 11, weight: .medium))
                  .foregroundColor(.white.opacity(0.6))
              }
            }
          }

          // Parent Action
          VStack(alignment: .leading, spacing: 6) {
            Text("WHAT TO DO")
              .font(.system(size: 9, weight: .bold))
              .tracking(1.5)
              .foregroundColor(Color(red: 0.4, green: 0.7, blue: 1.0))
            Text(flag.parentAction)
              .font(.system(size: 12, weight: .medium))
              .foregroundColor(Color(red: 0.4, green: 0.7, blue: 1.0).opacity(0.8))
              .lineSpacing(4)
          }
          .padding(10)
          .background(
            RoundedRectangle(cornerRadius: 8).fill(
              Color(red: 0.4, green: 0.7, blue: 1.0).opacity(0.06)))
        }
        .padding(.horizontal, 14)
        .padding(.bottom, 14)
      }
    }
    .background(
      RoundedRectangle(cornerRadius: 14)
        .fill(flag.severity.color.opacity(0.04))
        .overlay(
          RoundedRectangle(cornerRadius: 14)
            .stroke(flag.severity.color.opacity(isExpanded ? 0.2 : 0.1), lineWidth: 1)
        )
    )
  }
}

// MARK: - ═══════════════════════════════════════════════════

// ABSOLUTE NO LIST VIEW
// ═══════════════════════════════════════════════════════════

struct BabyAbsoluteNoListView: View {
  @Environment(\.dismiss) var dismiss

  var body: some View {
    NavigationStack {
      ZStack {
        Color(red: 0.06, green: 0.04, blue: 0.12).ignoresSafeArea()

        ScrollView(showsIndicators: false) {
          VStack(spacing: 12) {
            Text(
              "Zero tolerance. These items are dangerous or inappropriate for babies and young children."
            )
            .font(.system(size: 13, weight: .medium))
            .foregroundColor(.white.opacity(0.5))
            .padding(.bottom, 8)

            ForEach(BabyFoodRedFlagDatabase.absoluteNoList) { item in
              HStack(alignment: .top, spacing: 12) {
                Image(systemName: item.icon)
                  .font(.system(size: 18))
                  .foregroundColor(.red)
                  .frame(width: 24)
                  .padding(.top, 2)

                VStack(alignment: .leading, spacing: 6) {
                  HStack {
                    Text(item.item)
                      .font(.system(size: 15, weight: .bold))
                      .foregroundColor(.white)
                    Spacer()
                    Text(item.ageRestriction)
                      .font(.system(size: 10, weight: .bold))
                      .foregroundColor(.red)
                      .padding(.horizontal, 8)
                      .padding(.vertical, 3)
                      .background(Capsule().fill(Color.red.opacity(0.15)))
                  }

                  Text(item.reason)
                    .font(.system(size: 12, weight: .regular))
                    .foregroundColor(.white.opacity(0.6))
                    .lineSpacing(3)
                }
              }
              .padding(14)
              .background(
                RoundedRectangle(cornerRadius: 14)
                  .fill(Color.red.opacity(0.04))
                  .overlay(
                    RoundedRectangle(cornerRadius: 14)
                      .stroke(Color.red.opacity(0.1), lineWidth: 1)
                  )
              )
            }
            Spacer(minLength: 40)
          }
          .padding(.horizontal, 20)
          .padding(.top, 10)
        }
      }
      .navigationTitle("Never Feed List")
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItem(placement: .navigationBarTrailing) {
          Button {
            dismiss()
          } label: {
            Image(systemName: "xmark.circle.fill")
              .foregroundColor(.white.opacity(0.4))
          }
        }
      }
    }
  }
}

// MARK: - ═══════════════════════════════════════════════════

// FOOD INTRODUCTION LOG
// ═══════════════════════════════════════════════════════════

struct BabyFoodIntroLogView: View {
  @Environment(\.dismiss) var dismiss
  @ObservedObject var profile: BabyProfileManager
  @State private var showAddFood = false
  @State private var newFoodName = ""
  @State private var newFoodReaction: BabyProfileManager.FoodReaction = .none
  @State private var newFoodNotes = ""
  @State private var newFoodDate = Date()

  var body: some View {
    NavigationStack {
      ZStack {
        Color(red: 0.06, green: 0.04, blue: 0.12).ignoresSafeArea()

        ScrollView(showsIndicators: false) {
          VStack(spacing: 16) {
            Text(
              "Track every new food introduction. Wait 3-5 days between new foods to identify reactions."
            )
            .font(.system(size: 13, weight: .medium))
            .foregroundColor(.white.opacity(0.5))

            // Add Food Button
            Button {
              showAddFood.toggle()
            } label: {
              HStack {
                Image(systemName: "plus.circle.fill")
                Text("Log New Food")
                  .font(.system(size: 14, weight: .bold))
              }
              .foregroundColor(.black)
              .frame(maxWidth: .infinity)
              .padding(.vertical, 12)
              .background(Capsule().fill(Color(red: 0.6, green: 0.9, blue: 0.6)))
            }

            // Add Food Form
            if showAddFood {
              addFoodForm
            }

            // Stats
            if !profile.introducedFoods.isEmpty {
              foodStats
            }

            // Food List
            if profile.introducedFoods.isEmpty {
              VStack(spacing: 12) {
                Image(systemName: "leaf.fill")
                  .font(.system(size: 36))
                  .foregroundColor(.green.opacity(0.3))
                Text("No foods logged yet")
                  .font(.system(size: 14, weight: .medium))
                  .foregroundColor(.white.opacity(0.4))
                Text("Start logging when baby begins solids (around 6 months)")
                  .font(.system(size: 12))
                  .foregroundColor(.white.opacity(0.3))
              }
              .padding(40)
            } else {
              ForEach(profile.introducedFoods) { food in
                foodRow(food)
              }
            }

            Spacer(minLength: 40)
          }
          .padding(.horizontal, 20)
          .padding(.top, 10)
        }
      }
      .navigationTitle("Food Introduction Log")
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItem(placement: .navigationBarTrailing) {
          Button {
            dismiss()
          } label: {
            Image(systemName: "xmark.circle.fill")
              .foregroundColor(.white.opacity(0.4))
          }
        }
      }
    }
  }

  private var addFoodForm: some View {
    VStack(spacing: 12) {
      TextField("Food name (e.g., sweet potato)", text: $newFoodName)
        .font(.system(size: 14))
        .foregroundColor(.white)
        .padding(10)
        .background(RoundedRectangle(cornerRadius: 8).fill(Color.white.opacity(0.06)))

      DatePicker(
        "Date introduced", selection: $newFoodDate, in: ...Date(), displayedComponents: .date
      )
      .font(.system(size: 13))
      .foregroundColor(.white)
      .colorScheme(.dark)

      VStack(alignment: .leading, spacing: 6) {
        Text("Reaction")
          .font(.system(size: 11, weight: .bold))
          .foregroundColor(.white.opacity(0.5))

        ScrollView(.horizontal, showsIndicators: false) {
          HStack(spacing: 8) {
            ForEach(BabyProfileManager.FoodReaction.allCases, id: \.self) { reaction in
              Button {
                newFoodReaction = reaction
              } label: {
                HStack(spacing: 4) {
                  Image(systemName: reaction.icon)
                    .font(.system(size: 12))
                  Text(reaction.rawValue)
                    .font(.system(size: 11, weight: .medium))
                }
                .foregroundColor(newFoodReaction == reaction ? .white : .white.opacity(0.4))
                .padding(.horizontal, 10)
                .padding(.vertical, 6)
                .background(
                  Capsule().fill(
                    newFoodReaction == reaction
                      ? reaction.color.opacity(0.3) : Color.white.opacity(0.04))
                )
              }
            }
          }
        }
      }

      TextField("Notes (optional)", text: $newFoodNotes)
        .font(.system(size: 13))
        .foregroundColor(.white)
        .padding(10)
        .background(RoundedRectangle(cornerRadius: 8).fill(Color.white.opacity(0.06)))

      Button {
        let trimmed = newFoodName.trimmingCharacters(in: .whitespaces)
        guard !trimmed.isEmpty else { return }
        let food = BabyProfileManager.IntroducedFood(
          name: trimmed,
          dateIntroduced: newFoodDate,
          reaction: newFoodReaction,
          notes: newFoodNotes
        )
        profile.addIntroducedFood(food)
        newFoodName = ""
        newFoodNotes = ""
        newFoodReaction = .none
        showAddFood = false
      } label: {
        Text("Save")
          .font(.system(size: 14, weight: .bold))
          .foregroundColor(.black)
          .frame(maxWidth: .infinity)
          .padding(.vertical, 10)
          .background(Capsule().fill(Color(red: 0.6, green: 0.9, blue: 0.6)))
      }
    }
    .padding(14)
    .background(
      RoundedRectangle(cornerRadius: 14)
        .fill(Color.green.opacity(0.04))
        .overlay(RoundedRectangle(cornerRadius: 14).stroke(Color.green.opacity(0.15), lineWidth: 1))
    )
  }

  private var foodStats: some View {
    let loved = profile.introducedFoods.filter { $0.reaction == .loved }.count
    let reactions = profile.introducedFoods.filter {
      $0.reaction == .mild || $0.reaction == .moderate || $0.reaction == .severe
    }.count
    let refused = profile.introducedFoods.filter { $0.reaction == .refused }.count

    return HStack(spacing: 0) {
      statPill("\(profile.introducedFoods.count)", "Total", .white)
      statPill("\(loved)", "Loved", .pink)
      statPill("\(reactions)", "Reactions", .orange)
      statPill("\(refused)", "Refused", .gray)
    }
    .padding(4)
    .background(RoundedRectangle(cornerRadius: 12).fill(Color.white.opacity(0.03)))
  }

  private func statPill(_ value: String, _ label: String, _ color: Color) -> some View {
    VStack(spacing: 2) {
      Text(value)
        .font(.system(size: 18, weight: .bold))
        .foregroundColor(color)
      Text(label)
        .font(.system(size: 9, weight: .medium))
        .foregroundColor(.white.opacity(0.4))
    }
    .frame(maxWidth: .infinity)
  }

  private func foodRow(_ food: BabyProfileManager.IntroducedFood) -> some View {
    HStack(spacing: 12) {
      Image(systemName: food.reaction.icon)
        .font(.system(size: 16))
        .foregroundColor(food.reaction.color)
        .frame(width: 24)

      VStack(alignment: .leading, spacing: 2) {
        Text(food.name)
          .font(.system(size: 14, weight: .semibold))
          .foregroundColor(.white)
        HStack(spacing: 8) {
          Text(food.dateIntroduced, style: .date)
            .font(.system(size: 10, weight: .medium))
            .foregroundColor(.white.opacity(0.4))
          Text(food.reaction.rawValue)
            .font(.system(size: 10, weight: .bold))
            .foregroundColor(food.reaction.color)
        }
        if !food.notes.isEmpty {
          Text(food.notes)
            .font(.system(size: 11))
            .foregroundColor(.white.opacity(0.4))
            .lineLimit(2)
        }
      }
      Spacer()
    }
    .padding(12)
    .background(
      RoundedRectangle(cornerRadius: 12)
        .fill(Color.white.opacity(0.03))
    )
  }
}

// MARK: - ═══════════════════════════════════════════════════

// CLEAN BRANDS VIEW
// ═══════════════════════════════════════════════════════════

struct BabyCleanBrandsView: View {
  @Environment(\.dismiss) var dismiss

  struct CleanBrand: Identifiable {
    let id = UUID()
    let name: String
    let category: String
    let whyClean: String
    let icon: String
    let color: Color
  }

  let brands: [CleanBrand] = [
    CleanBrand(
      name: "Kendamil", category: "Formula",
      whyClean:
        "Whole milk-based, no palm oil, no corn syrup, no soy. Made in UK. Uses natural milk fat structure (sn-2 palmitate). Organic and Classic lines.",
      icon: "cup.and.saucer.fill", color: Color(red: 1.0, green: 0.75, blue: 0.8)),
    CleanBrand(
      name: "Bobbie", category: "Formula",
      whyClean:
        "USDA Organic, European-style. Lactose-based, no corn syrup, no palm oil. DHA from water-extracted algal oil. FDA-registered.",
      icon: "cup.and.saucer.fill", color: Color(red: 1.0, green: 0.75, blue: 0.8)),
    CleanBrand(
      name: "HiPP", category: "Formula",
      whyClean:
        "European organic. Lactose first ingredient, prebiotics/probiotics. Stricter EU pesticide standards. Stage-based for age progression.",
      icon: "cup.and.saucer.fill", color: Color(red: 1.0, green: 0.75, blue: 0.8)),
    CleanBrand(
      name: "Serenity Kids", category: "Baby Food",
      whyClean:
        "Meat + veggie pouches with healthy fats. No fruit fillers, no added sugars. Ethically sourced pastured/grass-fed proteins. Low in heavy metals.",
      icon: "leaf.fill", color: .green),
    CleanBrand(
      name: "Once Upon a Farm", category: "Baby Food",
      whyClean:
        "Cold-pressed, organic, refrigerated (not shelf-stable = fewer preservatives). No concentrates. Transparent heavy metal testing.",
      icon: "leaf.fill", color: .green),
    CleanBrand(
      name: "Square Baby", category: "Baby Food",
      whyClean:
        "100% daily nutrition in their meal plans. Pediatrician-designed. Allergen introduction system. No fillers.",
      icon: "leaf.fill", color: .green),
    CleanBrand(
      name: "Little Spoon", category: "Baby Food",
      whyClean:
        "Fresh, organic baby food delivered. Unique blends with superfoods. No artificial anything. Cold-pressed.",
      icon: "leaf.fill", color: .green),
    CleanBrand(
      name: "Cerebelly", category: "Baby Food",
      whyClean:
        "Neuroscientist-created. Targeted nutrients for brain development by age. 16+ brain-supporting nutrients per pouch. Heavy metal tested.",
      icon: "brain.head.profile", color: .purple),
  ]

  var body: some View {
    NavigationStack {
      ZStack {
        Color(red: 0.06, green: 0.04, blue: 0.12).ignoresSafeArea()

        ScrollView(showsIndicators: false) {
          VStack(spacing: 12) {
            Text(
              "Brands that actually prioritize baby health over profit margins. Not sponsored — just researched."
            )
            .font(.system(size: 13, weight: .medium))
            .foregroundColor(.white.opacity(0.5))
            .padding(.bottom, 8)

            ForEach(brands) { brand in
              HStack(alignment: .top, spacing: 12) {
                Image(systemName: brand.icon)
                  .font(.system(size: 18))
                  .foregroundColor(brand.color)
                  .frame(width: 24)
                  .padding(.top, 2)

                VStack(alignment: .leading, spacing: 6) {
                  HStack {
                    Text(brand.name)
                      .font(.system(size: 15, weight: .bold))
                      .foregroundColor(.white)
                    Spacer()
                    Text(brand.category)
                      .font(.system(size: 10, weight: .bold))
                      .foregroundColor(brand.color)
                      .padding(.horizontal, 8)
                      .padding(.vertical, 3)
                      .background(Capsule().fill(brand.color.opacity(0.15)))
                  }

                  Text(brand.whyClean)
                    .font(.system(size: 12, weight: .regular))
                    .foregroundColor(.white.opacity(0.6))
                    .lineSpacing(3)
                }
              }
              .padding(14)
              .background(
                RoundedRectangle(cornerRadius: 14)
                  .fill(brand.color.opacity(0.04))
                  .overlay(
                    RoundedRectangle(cornerRadius: 14)
                      .stroke(brand.color.opacity(0.1), lineWidth: 1)
                  )
              )
            }

            disclaimerNote

            Spacer(minLength: 40)
          }
          .padding(.horizontal, 20)
          .padding(.top, 10)
        }
      }
      .navigationTitle("Clean Brands")
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItem(placement: .navigationBarTrailing) {
          Button {
            dismiss()
          } label: {
            Image(systemName: "xmark.circle.fill")
              .foregroundColor(.white.opacity(0.4))
          }
        }
      }
    }
  }

  private var disclaimerNote: some View {
    HStack(spacing: 8) {
      Image(systemName: "info.circle")
        .font(.system(size: 12))
        .foregroundColor(.white.opacity(0.3))
      Text(
        "Not sponsored or affiliated. Brands change formulations — always verify current ingredients. Consult your pediatrician."
      )
      .font(.system(size: 10, weight: .medium))
      .foregroundColor(.white.opacity(0.3))
    }
    .padding(10)
    .background(RoundedRectangle(cornerRadius: 8).fill(Color.white.opacity(0.02)))
  }
}

// MARK: - ═══════════════════════════════════════════════════

// HOMEMADE BABY FOOD GUIDE
// ═══════════════════════════════════════════════════════════

struct BabyHomemadeGuideView: View {
  @Environment(\.dismiss) var dismiss

  struct HomemadeRecipe: Identifiable {
    let id = UUID()
    let name: String
    let ageStage: BabyAgeStage
    let ingredients: [String]
    let instructions: String
    let nutritionNote: String
    let icon: String
  }

  let recipes: [HomemadeRecipe] = [
    HomemadeRecipe(
      name: "First Avocado Mash", ageStage: .firstFoods,
      ingredients: ["1 ripe organic avocado", "Breast milk or formula (to thin)"],
      instructions:
        "Mash avocado with fork until smooth. Add breast milk or formula to reach desired consistency. Serve at room temperature.",
      nutritionNote:
        "Avocado is nature's perfect first food: healthy fats for brain development, potassium, folate, and fiber. No cooking needed.",
      icon: "🥑"),
    HomemadeRecipe(
      name: "Sweet Potato Puree", ageStage: .firstFoods,
      ingredients: [
        "1 organic sweet potato", "Filtered water", "Pinch of cinnamon (optional, 8mo+)",
      ],
      instructions:
        "Peel and cube sweet potato. Steam 15 min until fork-tender. Blend with steaming water until silky smooth. Freeze extras in ice cube trays.",
      nutritionNote:
        "Beta-carotene powerhouse — converts to vitamin A for immune function and eye development. Naturally sweet without any added sugar.",
      icon: "🍠"),
    HomemadeRecipe(
      name: "Iron-Rich Lentil Mash", ageStage: .firstFoods,
      ingredients: [
        "½ cup red lentils (rinsed)", "1 cup filtered water", "1 tsp ghee or coconut oil",
      ],
      instructions:
        "Simmer lentils in water 15-20 min until completely soft and falling apart. Mash or blend. Stir in ghee. The fat helps absorb iron.",
      nutritionNote:
        "Red lentils are iron + protein dense. Baby's iron stores from birth deplete around 6 months — plant iron paired with vitamin C (add a squeeze of lemon) absorbs better.",
      icon: "🫘"),
    HomemadeRecipe(
      name: "Banana Egg Pancakes", ageStage: .explorer,
      ingredients: ["1 ripe banana", "1 pastured egg", "1 tbsp oat flour (optional)"],
      instructions:
        "Mash banana, whisk in egg. Add oat flour for structure if desired. Cook small silver-dollar sized pancakes on low heat with coconut oil. Soft enough for gums.",
      nutritionNote:
        "Two-ingredient base packs protein, potassium, choline, and B vitamins. Egg is a complete protein with all essential amino acids. Great for baby-led weaning.",
      icon: "🥞"),
    HomemadeRecipe(
      name: "Bone Broth Veggie Soup", ageStage: .explorer,
      ingredients: [
        "1 cup organic bone broth (no salt added)", "¼ cup diced zucchini", "¼ cup diced carrot",
        "1 tbsp pastured butter or ghee",
      ],
      instructions:
        "Simmer veggies in bone broth until very soft (15-20 min). Mash or blend to appropriate texture for age. Stir in butter.",
      nutritionNote:
        "Bone broth provides collagen, glycine, and minerals in bioavailable form. Supports gut lining development. The gelatin is especially healing for developing intestines.",
      icon: "🍲"),
    HomemadeRecipe(
      name: "Wild Salmon + Broccoli Mash", ageStage: .toddlerEarly,
      ingredients: [
        "2 oz wild salmon (fresh or canned)", "½ cup steamed broccoli florets", "1 tsp olive oil",
        "Squeeze of lemon",
      ],
      instructions:
        "Steam or poach salmon until flaky. Steam broccoli until very soft. Mash together with fork, add olive oil and lemon. Texture can be chunkier for 12mo+.",
      nutritionNote:
        "DHA from wild salmon is the #1 brain-building nutrient. Broccoli adds vitamin C (boosts iron absorption), fiber, and sulforaphane. Lemon brightens flavor naturally.",
      icon: "🐟"),
  ]

  var body: some View {
    NavigationStack {
      ZStack {
        Color(red: 0.06, green: 0.04, blue: 0.12).ignoresSafeArea()

        ScrollView(showsIndicators: false) {
          VStack(spacing: 16) {
            Text(
              "You know what's in it because you made it. Homemade baby food is cheaper, cleaner, and teaches real flavors from the start."
            )
            .font(.system(size: 13, weight: .medium))
            .foregroundColor(.white.opacity(0.5))
            .padding(.bottom, 4)

            ForEach(recipes) { recipe in
              recipeCard(recipe)
            }

            safetyTips

            Spacer(minLength: 40)
          }
          .padding(.horizontal, 20)
          .padding(.top, 10)
        }
      }
      .navigationTitle("Homemade Guide")
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItem(placement: .navigationBarTrailing) {
          Button {
            dismiss()
          } label: {
            Image(systemName: "xmark.circle.fill")
              .foregroundColor(.white.opacity(0.4))
          }
        }
      }
    }
  }

  private func recipeCard(_ recipe: HomemadeRecipe) -> some View {
    VStack(alignment: .leading, spacing: 12) {
      HStack {
        Text(recipe.icon)
          .font(.system(size: 28))
        VStack(alignment: .leading, spacing: 2) {
          Text(recipe.name)
            .font(.system(size: 15, weight: .bold))
            .foregroundColor(.white)
          HStack(spacing: 4) {
            Image(systemName: recipe.ageStage.icon)
              .font(.system(size: 10))
            Text(recipe.ageStage.rawValue)
              .font(.system(size: 10, weight: .medium))
          }
          .foregroundColor(recipe.ageStage.color)
        }
        Spacer()
      }

      VStack(alignment: .leading, spacing: 4) {
        Text("INGREDIENTS")
          .font(.system(size: 9, weight: .bold))
          .tracking(1.5)
          .foregroundColor(.white.opacity(0.4))
        ForEach(recipe.ingredients, id: \.self) { ingredient in
          Text("• \(ingredient)")
            .font(.system(size: 12, weight: .regular))
            .foregroundColor(.white.opacity(0.6))
        }
      }

      Divider().background(Color.white.opacity(0.06))

      Text(recipe.instructions)
        .font(.system(size: 12, weight: .regular))
        .foregroundColor(.white.opacity(0.6))
        .lineSpacing(3)

      Text(recipe.nutritionNote)
        .font(.system(size: 11, weight: .medium, design: .rounded))
        .foregroundColor(Color(red: 0.6, green: 0.9, blue: 0.6).opacity(0.8))
        .lineSpacing(3)
        .padding(10)
        .background(RoundedRectangle(cornerRadius: 8).fill(Color.green.opacity(0.04)))
    }
    .padding(16)
    .background(
      RoundedRectangle(cornerRadius: 16)
        .fill(Color.white.opacity(0.03))
        .overlay(
          RoundedRectangle(cornerRadius: 16)
            .stroke(recipe.ageStage.color.opacity(0.12), lineWidth: 1)
        )
    )
  }

  private var safetyTips: some View {
    VStack(alignment: .leading, spacing: 10) {
      HStack(spacing: 6) {
        Image(systemName: "shield.checkered")
          .foregroundColor(.blue)
        Text("KITCHEN SAFETY")
          .font(.system(size: 9, weight: .bold))
          .tracking(1.5)
          .foregroundColor(.blue.opacity(0.6))
      }

      let tips = [
        "Always test temperature on your wrist before serving",
        "Use stainless steel or glass — avoid plastic for hot food",
        "Freeze portions in ice cube trays → pop into silicone bags",
        "Homemade purees last 3 days in fridge, 3 months frozen",
        "Steaming preserves more nutrients than boiling",
        "Introduce potential allergens one at a time, early (6-12mo)",
      ]

      ForEach(tips, id: \.self) { tip in
        HStack(alignment: .top, spacing: 6) {
          Text("•")
            .foregroundColor(.blue.opacity(0.4))
          Text(tip)
            .font(.system(size: 11, weight: .regular))
            .foregroundColor(.white.opacity(0.6))
        }
      }
    }
    .padding(14)
    .background(
      RoundedRectangle(cornerRadius: 14)
        .fill(Color.blue.opacity(0.04))
        .overlay(
          RoundedRectangle(cornerRadius: 14)
            .stroke(Color.blue.opacity(0.1), lineWidth: 1)
        )
    )
  }
}

// MARK: - ═══════════════════════════════════════════════════

// ALLERGEN INTRODUCTION TRACKER
// ═══════════════════════════════════════════════════════════

struct BabyAllergenTrackerView: View {
  @Environment(\.dismiss) var dismiss
  @ObservedObject var profile: BabyProfileManager

  struct MajorAllergen: Identifiable {
    let id = UUID()
    let name: String
    let icon: String
    let whenToIntroduce: String
    let howToIntroduce: String
    let signsOfReaction: [String]
  }

  let majorAllergens: [MajorAllergen] = [
    MajorAllergen(
      name: "Peanut", icon: "🥜",
      whenToIntroduce: "6 months (4-6 months if high-risk per LEAP study)",
      howToIntroduce:
        "Thin smooth peanut butter with breast milk or warm water. Never whole nuts. Start with ½ tsp, wait 10 min, give more if no reaction.",
      signsOfReaction: [
        "Hives or rash", "Swelling of lips/tongue", "Vomiting within 2 hours",
        "Difficulty breathing (call 911)",
      ]),
    MajorAllergen(
      name: "Egg", icon: "🥚",
      whenToIntroduce: "6 months",
      howToIntroduce:
        "Well-cooked scrambled egg (not runny). Start with a small pinch. Cooked egg is less allergenic than raw. Both white and yolk.",
      signsOfReaction: ["Hives around mouth", "Eczema flare", "Vomiting", "Stomach pain"]),
    MajorAllergen(
      name: "Dairy (Cow's Milk)", icon: "🥛",
      whenToIntroduce: "6 months (as food, not drink — no cow's milk as drink until 12mo)",
      howToIntroduce:
        "Full-fat plain yogurt or soft cheese. These are partially broken down by fermentation and easier to digest than straight milk.",
      signsOfReaction: ["Hives", "Blood in stool", "Chronic congestion", "Eczema", "Vomiting"]),
    MajorAllergen(
      name: "Tree Nuts", icon: "🌰",
      whenToIntroduce: "6 months",
      howToIntroduce:
        "Smooth almond or cashew butter thinned with breast milk. Never whole nuts or pieces (choking hazard until age 4+).",
      signsOfReaction: ["Hives", "Swelling", "Vomiting", "Coughing or wheezing"]),
    MajorAllergen(
      name: "Wheat/Gluten", icon: "🌾",
      whenToIntroduce: "6 months",
      howToIntroduce:
        "Well-cooked pasta, small pieces of soft bread, or wheat-based baby cereal. Start small.",
      signsOfReaction: ["Rash", "Bloating/gas", "Diarrhea", "Vomiting", "Eczema flare"]),
    MajorAllergen(
      name: "Fish", icon: "🐟",
      whenToIntroduce: "6 months",
      howToIntroduce:
        "Well-cooked, flaked, boneless fish. Start with low-mercury: salmon, cod, tilapia. Check for tiny bones.",
      signsOfReaction: ["Hives", "Swelling", "Vomiting", "Tingling mouth"]),
    MajorAllergen(
      name: "Shellfish", icon: "🦐",
      whenToIntroduce: "6-9 months",
      howToIntroduce:
        "Well-cooked shrimp or crab, finely minced or pureed. One of the top 8 allergens — introduce carefully.",
      signsOfReaction: [
        "Hives", "Swelling of face/throat", "Stomach cramps", "Difficulty breathing",
      ]),
    MajorAllergen(
      name: "Soy", icon: "🫘",
      whenToIntroduce: "6 months",
      howToIntroduce:
        "Soft tofu, mashed or cubed. Edamame pureed. Avoid soy sauce (too much sodium for babies).",
      signsOfReaction: ["Hives", "Eczema flare", "Vomiting", "Diarrhea"]),
    MajorAllergen(
      name: "Sesame", icon: "🫓",
      whenToIntroduce: "6 months (added to top 9 allergens in 2023)",
      howToIntroduce:
        "Tahini thinned with breast milk or water. Hummus (contains tahini). Small amount of sesame oil in puree.",
      signsOfReaction: ["Hives", "Eczema", "Vomiting", "Anaphylaxis (rare but possible)"]),
  ]

  var body: some View {
    NavigationStack {
      ZStack {
        Color(red: 0.06, green: 0.04, blue: 0.12).ignoresSafeArea()

        ScrollView(showsIndicators: false) {
          VStack(spacing: 14) {
            Text(
              "Current pediatric guidelines (AAP 2023): introduce allergens EARLY (around 6 months), not late. Early introduction reduces allergy risk by up to 80%."
            )
            .font(.system(size: 13, weight: .medium))
            .foregroundColor(.white.opacity(0.5))
            .padding(.bottom, 4)

            emergencyNote

            ForEach(majorAllergens) { allergen in
              allergenCard(allergen)
            }

            Spacer(minLength: 40)
          }
          .padding(.horizontal, 20)
          .padding(.top, 10)
        }
      }
      .navigationTitle("Allergen Guide")
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItem(placement: .navigationBarTrailing) {
          Button {
            dismiss()
          } label: {
            Image(systemName: "xmark.circle.fill")
              .foregroundColor(.white.opacity(0.4))
          }
        }
      }
    }
  }

  private var emergencyNote: some View {
    HStack(spacing: 10) {
      Image(systemName: "phone.fill")
        .font(.system(size: 16))
        .foregroundColor(.red)
      VStack(alignment: .leading, spacing: 2) {
        Text(
          "EMERGENCY: If baby has difficulty breathing, swelling of face/throat, or becomes limp — call 911 immediately."
        )
        .font(.system(size: 12, weight: .bold))
        .foregroundColor(.red)
        .lineSpacing(2)
        Text(
          "Always introduce allergens when you can monitor for 2+ hours. Have Benadryl dose confirmed with pediatrician beforehand."
        )
        .font(.system(size: 11, weight: .medium))
        .foregroundColor(.red.opacity(0.6))
        .lineSpacing(2)
      }
    }
    .padding(14)
    .background(
      RoundedRectangle(cornerRadius: 14)
        .fill(Color.red.opacity(0.06))
        .overlay(
          RoundedRectangle(cornerRadius: 14)
            .stroke(Color.red.opacity(0.3), lineWidth: 1)
        )
    )
  }

  private func allergenCard(_ allergen: MajorAllergen) -> some View {
    let isIntroduced = profile.introducedFoods.contains {
      $0.name.lowercased().contains(allergen.name.lowercased())
    }
    let isKnownAllergy = profile.knownAllergies.contains {
      $0.lowercased().contains(allergen.name.lowercased())
    }

    return VStack(alignment: .leading, spacing: 10) {
      HStack {
        Text(allergen.icon)
          .font(.system(size: 24))
        VStack(alignment: .leading, spacing: 2) {
          Text(allergen.name)
            .font(.system(size: 15, weight: .bold))
            .foregroundColor(.white)
          Text(allergen.whenToIntroduce)
            .font(.system(size: 10, weight: .medium))
            .foregroundColor(.white.opacity(0.4))
        }
        Spacer()

        if isKnownAllergy {
          Text("ALLERGY")
            .font(.system(size: 9, weight: .bold))
            .foregroundColor(.red)
            .padding(.horizontal, 8)
            .padding(.vertical, 4)
            .background(Capsule().fill(Color.red.opacity(0.2)))
        } else if isIntroduced {
          Image(systemName: "checkmark.circle.fill")
            .font(.system(size: 18))
            .foregroundColor(.green)
        } else {
          Text("NOT YET")
            .font(.system(size: 9, weight: .bold))
            .foregroundColor(.white.opacity(0.3))
            .padding(.horizontal, 8)
            .padding(.vertical, 4)
            .background(Capsule().fill(Color.white.opacity(0.06)))
        }
      }

      Text(allergen.howToIntroduce)
        .font(.system(size: 12, weight: .regular))
        .foregroundColor(.white.opacity(0.6))
        .lineSpacing(3)

      VStack(alignment: .leading, spacing: 4) {
        Text("WATCH FOR")
          .font(.system(size: 9, weight: .bold))
          .tracking(1)
          .foregroundColor(.orange.opacity(0.6))
        HStack(spacing: 0) {
          ForEach(allergen.signsOfReaction, id: \.self) { sign in
            if sign != allergen.signsOfReaction.first {
              Text(" • ").foregroundColor(.white.opacity(0.2))
            }
            Text(sign)
              .font(.system(size: 11, weight: .regular))
              .foregroundColor(.orange.opacity(0.7))
          }
        }
        .lineLimit(2)
      }
    }
    .padding(14)
    .background(
      RoundedRectangle(cornerRadius: 14)
        .fill(isKnownAllergy ? Color.red.opacity(0.04) : Color.white.opacity(0.03))
        .overlay(
          RoundedRectangle(cornerRadius: 14)
            .stroke(
              isKnownAllergy ? Color.red.opacity(0.2) : Color.white.opacity(0.06), lineWidth: 1)
        )
    )
  }
}

// MARK: - ═══════════════════════════════════════════════════

// BABY SCAN OVERLAY — Integrates with existing scanner
// ═══════════════════════════════════════════════════════════

enum BabyScanOverlay {
  /// Check scanned ingredient text against baby-specific red flags.
  /// Call this from the existing scanner result flow.
  static func checkForBabyRedFlags(ingredientText: String) -> [BabyScanAlert] {
    let text = ingredientText.lowercased()
    var alerts: [BabyScanAlert] = []

    let babyKeywords: [(pattern: String, alert: String, severity: BabySeverity, detail: String)] = [
      (
        "corn syrup", "Corn Syrup Solids in Baby Formula", .high,
        "This is sugar, not lactose. Consider switching to a lactose-first formula."
      ),
      (
        "glucose syrup", "Glucose Syrup in Formula", .high,
        "Another name for sugar as the primary carbohydrate source."
      ),
      (
        "carrageenan", "Carrageenan Detected", .high,
        "Linked to gut inflammation. Especially concerning for developing infant intestines."
      ),
      (
        "soy protein isolate", "Soy Protein Isolate", .medium,
        "Contains concentrated phytoestrogens. Use soy formula only if medically necessary."
      ),
      (
        "palm olein", "Palm Olein Oil", .low,
        "May reduce calcium absorption and cause harder stools. Palm-oil-free alternatives exist."
      ),
      (
        "palm oil", "Palm Oil Detected", .low,
        "Different fat structure than breast milk fat. Can affect calcium absorption."
      ),
      (
        "rice", "Rice-Based Product", .medium,
        "Rice products carry higher arsenic risk. Limit rice-based baby foods and rotate grains."
      ),
      (
        "rice flour", "Rice Flour Detected", .medium,
        "Contains inorganic arsenic. Oat or barley flour are safer alternatives."
      ),
      (
        "brown rice syrup", "Brown Rice Syrup", .critical,
        "Concentrated source of inorganic arsenic. Used as sweetener. Avoid for babies."
      ),
      (
        "artificial color", "Artificial Colors", .high,
        "Petroleum-derived dyes. No place in baby food. Linked to behavioral issues."
      ),
      (
        "red 40", "Red 40 Dye", .high,
        "Petroleum-derived. Linked to hyperactivity in children. Banned with warnings in EU."
      ),
      (
        "yellow 5", "Yellow 5 Dye", .high,
        "Artificial color with no nutritional value. Should not be in children's food."
      ),
      (
        "yellow 6", "Yellow 6 Dye", .high,
        "Artificial color linked to allergic reactions and behavioral changes."
      ),
      (
        "blue 1", "Blue 1 Dye", .high,
        "Synthetic dye. Not appropriate for babies or young children."
      ),
      (
        "sodium benzoate", "Sodium Benzoate", .medium,
        "Preservative that can form benzene (carcinogen) when combined with vitamin C."
      ),
      (
        "potassium sorbate", "Potassium Sorbate", .low,
        "Common preservative. Generally recognized as safe, but unnecessary in baby food."
      ),
      (
        "dimethylpolysiloxane", "Silicone Anti-Foamer", .high,
        "Industrial chemical with no place in baby food."
      ),
      (
        "tbhq", "TBHQ Preservative", .high,
        "Petroleum-derived. Can cause nausea at small doses. Avoid for babies."
      ),
      (
        "bha", "BHA Preservative", .high,
        "Reasonably anticipated carcinogen. Should not be in children's food."
      ),
      (
        "bht", "BHT Preservative", .medium,
        "Synthetic antioxidant with limited safety data for infants."
      ),
      (
        "aspartame", "Aspartame Detected", .critical,
        "Artificial sweetener. No safety data for infants. Zero reason to be in baby food."
      ),
      (
        "sucralose", "Sucralose Detected", .high,
        "Artificial sweetener. Not tested for infant safety. Avoid."
      ),
      (
        "acesulfame", "Acesulfame-K Detected", .high,
        "Artificial sweetener containing methylene chloride. Not for babies."
      ),
      (
        "honey", "Honey Detected", .critical,
        "DANGER: Botulism risk for babies under 12 months. Clostridium botulinum spores."
      ),
      (
        "added sugar", "Added Sugar", .high,
        "WHO recommends zero added sugar for children under 2 years."
      ),
      (
        "high fructose", "High Fructose Corn Syrup", .critical,
        "Metabolic disruptor. Absolutely no place in baby or toddler food."
      ),
      (
        "natural flavors", "Natural Flavors (Undefined)", .low,
        "Umbrella term that can hide MSG, castoreum, or other additives. Ask manufacturer for specifics."
      ),
    ]

    for keyword in babyKeywords {
      if text.contains(keyword.pattern) {
        alerts.append(
          BabyScanAlert(
            title: keyword.alert,
            severity: keyword.severity,
            detail: keyword.detail
          ))
      }
    }

    return alerts
  }
}

struct BabyScanAlert: Identifiable {
  let id = UUID()
  let title: String
  let severity: BabySeverity
  let detail: String
}

// MARK: - ═══════════════════════════════════════════════════

// BABY SCAN RESULT BANNER (Attach to scan result view)
// ═══════════════════════════════════════════════════════════

struct BabyScanResultBanner: View {
  let alerts: [BabyScanAlert]

  var body: some View {
    if alerts.isEmpty {
      EmptyView()
    } else {
      VStack(alignment: .leading, spacing: 10) {
        HStack(spacing: 6) {
          Text("👶")
            .font(.system(size: 16))
          Text("BABY SAFETY ALERTS")
            .font(.system(size: 10, weight: .bold))
            .tracking(2)
            .foregroundColor(.red)
          Spacer()
          Text("\(alerts.count) found")
            .font(.system(size: 10, weight: .bold))
            .foregroundColor(.red.opacity(0.6))
        }

        ForEach(alerts) { alert in
          HStack(alignment: .top, spacing: 8) {
            Image(systemName: alert.severity.icon)
              .font(.system(size: 12))
              .foregroundColor(alert.severity.color)
              .frame(width: 16)
              .padding(.top, 1)

            VStack(alignment: .leading, spacing: 2) {
              Text(alert.title)
                .font(.system(size: 12, weight: .bold))
                .foregroundColor(.white)
              Text(alert.detail)
                .font(.system(size: 11, weight: .regular))
                .foregroundColor(.white.opacity(0.6))
                .lineSpacing(2)
            }
          }
        }
      }
      .padding(14)
      .background(
        RoundedRectangle(cornerRadius: 14)
          .fill(Color.red.opacity(0.06))
          .overlay(
            RoundedRectangle(cornerRadius: 14)
              .stroke(Color.red.opacity(0.25), lineWidth: 1.5)
          )
      )
    }
  }
}
