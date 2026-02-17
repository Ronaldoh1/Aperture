import Foundation
import SwiftUI

// MARK: - Toxic Chemical Model

struct ToxicChemical: Identifiable, Codable {
  let id: String
  let name: String
  let aliases: [String]  // Other names it might appear as
  let category: ToxicCategory
  let dangerLevel: DangerLevel
  let effects: [HealthEffect]
  let description: String
  let bannedIn: [String]  // Countries where it's banned
  let commonlyFoundIn: [String]
  let safeAlternatives: [String]

  enum ToxicCategory: String, Codable, CaseIterable {
    case preservative = "Preservative"
    case colorant = "Artificial Color"
    case sweetener = "Artificial Sweetener"
    case flavor = "Artificial Flavor"
    case emulsifier = "Emulsifier"
    case pesticide = "Pesticide Residue"
    case hormone = "Hormone/Antibiotic"
    case heavyMetal = "Heavy Metal"
    case transFat = "Trans Fat"
    case gmo = "GMO Ingredient"
    case other = "Other"

    var icon: String {
      switch self {
      case .preservative: return "clock.badge.exclamationmark"
      case .colorant: return "paintpalette.fill"
      case .sweetener: return "cube.fill"
      case .flavor: return "nose"
      case .emulsifier: return "drop.triangle.fill"
      case .pesticide: return "leaf.fill"
      case .hormone: return "syringe.fill"
      case .heavyMetal: return "bolt.trianglebadge.exclamationmark.fill"
      case .transFat: return "heart.slash.fill"
      case .gmo: return "dna"
      case .other: return "exclamationmark.triangle.fill"
      }
    }

    var color: Color {
      switch self {
      case .preservative: return .orange
      case .colorant: return .purple
      case .sweetener: return .pink
      case .flavor: return .yellow
      case .emulsifier: return .cyan
      case .pesticide: return .green
      case .hormone: return .red
      case .heavyMetal: return .gray
      case .transFat: return .brown
      case .gmo: return .indigo
      case .other: return .secondary
      }
    }
  }

  enum DangerLevel: Int, Codable, CaseIterable {
    case caution = 1  // Consume sparingly
    case warning = 2  // Avoid when possible
    case danger = 3  // Should not consume
    case severe = 4  // Banned in other countries
    case critical = 5  // Known carcinogen/neurotoxin

    var name: String {
      switch self {
      case .caution: return "Caution"
      case .warning: return "Warning"
      case .danger: return "Danger"
      case .severe: return "Severe"
      case .critical: return "Critical"
      }
    }

    var color: Color {
      switch self {
      case .caution: return .yellow
      case .warning: return .orange
      case .danger: return Color(hex: "#FF6B35")
      case .severe: return .red
      case .critical: return Color(hex: "#8B0000")
      }
    }

    var icon: String {
      switch self {
      case .caution: return "exclamationmark.circle"
      case .warning: return "exclamationmark.triangle"
      case .danger: return "exclamationmark.octagon"
      case .severe: return "xmark.octagon"
      case .critical: return "xmark.shield.fill"
      }
    }
  }

  struct HealthEffect: Codable, Identifiable {
    var id: String {
      effect
    }

    let effect: String
    let description: String
    let bodySystem: BodySystem

    enum BodySystem: String, Codable {
      case brain = "Brain/Nervous System"
      case heart = "Cardiovascular"
      case gut = "Digestive System"
      case immune = "Immune System"
      case hormones = "Endocrine/Hormones"
      case cancer = "Cancer Risk"
      case liver = "Liver/Kidneys"
      case skin = "Skin/Allergies"
      case development = "Child Development"
      case behavior = "Behavior/Mood"
    }
  }
}

// MARK: - Toxic Chemicals Database

class ToxicChemicalsDatabase: ObservableObject {
  static let shared = ToxicChemicalsDatabase()

  @Published var chemicals: [ToxicChemical] = []

  init() {
    loadChemicals()
  }

  private func loadChemicals() {
    chemicals = [
      // ARTIFICIAL SWEETENERS
      ToxicChemical(
        id: "aspartame",
        name: "Aspartame",
        aliases: ["E951", "NutraSweet", "Equal", "Canderel", "951"],
        category: .sweetener,
        dangerLevel: .severe,
        effects: [
          .init(
            effect: "Neurotoxicity",
            description: "Breaks down into methanol and formaldehyde in the body",
            bodySystem: .brain),
          .init(
            effect: "Headaches/Migraines", description: "One of the most reported side effects",
            bodySystem: .brain),
          .init(
            effect: "Mood Changes", description: "Linked to depression and anxiety",
            bodySystem: .behavior),
          .init(
            effect: "Cancer Concerns", description: "WHO classified as 'possibly carcinogenic'",
            bodySystem: .cancer),
        ],
        description:
          "Artificial sweetener 200x sweeter than sugar. Metabolizes into phenylalanine, aspartic acid, and methanol.",
        bannedIn: ["Japan (limited)"],
        commonlyFoundIn: [
          "Diet sodas", "Sugar-free gum", "Light yogurt", "Crystal Light", "Diet foods",
        ],
        safeAlternatives: ["Stevia", "Monk fruit", "Raw honey", "Dates"]
      ),

      ToxicChemical(
        id: "sucralose",
        name: "Sucralose",
        aliases: ["E955", "Splenda", "955"],
        category: .sweetener,
        dangerLevel: .danger,
        effects: [
          .init(
            effect: "Gut Microbiome Damage", description: "Kills beneficial gut bacteria",
            bodySystem: .gut),
          .init(
            effect: "Insulin Disruption", description: "May spike insulin despite zero calories",
            bodySystem: .hormones),
          .init(
            effect: "Carcinogenic when heated", description: "Creates chloropropanols when cooked",
            bodySystem: .cancer),
        ],
        description:
          "Chlorinated sugar molecule. The body cannot digest it, but it still affects metabolism.",
        bannedIn: [],
        commonlyFoundIn: [
          "Protein powders", "Sugar-free drinks", "Baked goods", "Splenda products",
        ],
        safeAlternatives: ["Stevia", "Erythritol", "Raw honey"]
      ),

      ToxicChemical(
        id: "hfcs",
        name: "High Fructose Corn Syrup",
        aliases: ["HFCS", "Corn syrup", "Glucose-fructose syrup", "Isoglucose", "Maize syrup"],
        category: .sweetener,
        dangerLevel: .danger,
        effects: [
          .init(
            effect: "Fatty Liver Disease",
            description: "Fructose metabolized only in liver, creates fat", bodySystem: .liver),
          .init(
            effect: "Obesity", description: "Bypasses satiety signals, promotes overeating",
            bodySystem: .hormones),
          .init(
            effect: "Insulin Resistance", description: "Major driver of Type 2 diabetes",
            bodySystem: .hormones),
          .init(
            effect: "Heart Disease", description: "Raises triglycerides and LDL cholesterol",
            bodySystem: .heart),
        ],
        description:
          "Cheap corn-derived sweetener that the body processes differently than regular sugar. Engineered for maximum addiction.",
        bannedIn: ["Limited in EU", "UK"],
        commonlyFoundIn: [
          "Sodas", "Bread", "Salad dressings", "Ketchup", "Cereals", "Most processed foods",
        ],
        safeAlternatives: ["Raw honey", "Maple syrup", "Coconut sugar", "Dates"]
      ),

      // ARTIFICIAL COLORS
      ToxicChemical(
        id: "red40",
        name: "Red 40",
        aliases: ["E129", "Allura Red AC", "FD&C Red No. 40", "129"],
        category: .colorant,
        dangerLevel: .severe,
        effects: [
          .init(
            effect: "Hyperactivity in Children", description: "Linked to ADHD symptoms",
            bodySystem: .behavior),
          .init(
            effect: "Allergic Reactions", description: "Can trigger hives and asthma",
            bodySystem: .immune),
          .init(
            effect: "Cancer Concerns", description: "Contains benzidine, a known carcinogen",
            bodySystem: .cancer),
        ],
        description:
          "Petroleum-derived dye. Most widely used food dye in the US. Requires warning labels in Europe.",
        bannedIn: [
          "Denmark", "Belgium", "France", "Germany", "Switzerland", "Sweden", "Austria", "Norway",
        ],
        commonlyFoundIn: ["Candy", "Cereals", "Fruit snacks", "Sports drinks", "Popsicles"],
        safeAlternatives: ["Beet juice", "Paprika", "Tomato paste"]
      ),

      ToxicChemical(
        id: "yellow5",
        name: "Yellow 5",
        aliases: ["E102", "Tartrazine", "FD&C Yellow No. 5", "102"],
        category: .colorant,
        dangerLevel: .severe,
        effects: [
          .init(
            effect: "Hyperactivity", description: "Triggers behavioral issues in children",
            bodySystem: .behavior),
          .init(
            effect: "Allergic Reactions", description: "Especially dangerous for asthmatics",
            bodySystem: .immune),
          .init(
            effect: "Zinc Depletion", description: "May interfere with zinc absorption",
            bodySystem: .immune),
        ],
        description:
          "Coal tar derivative. One of the most reactive food dyes. Banned or restricted in many countries.",
        bannedIn: ["Norway", "Austria", "Finland"],
        commonlyFoundIn: ["Mac and cheese", "Candy", "Pickles", "Chips", "Mountain Dew"],
        safeAlternatives: ["Turmeric", "Saffron", "Annatto"]
      ),

      ToxicChemical(
        id: "yellow6",
        name: "Yellow 6",
        aliases: ["E110", "Sunset Yellow FCF", "FD&C Yellow No. 6", "110"],
        category: .colorant,
        dangerLevel: .severe,
        effects: [
          .init(
            effect: "ADHD Symptoms", description: "Behavioral changes in children",
            bodySystem: .behavior),
          .init(
            effect: "Adrenal Tumors", description: "Linked to adrenal gland tumors in animals",
            bodySystem: .cancer),
          .init(
            effect: "Allergic Reactions", description: "Hives, swelling, asthma",
            bodySystem: .immune),
        ],
        description: "Petroleum-based dye. Contains carcinogens benzidine and 4-aminobiphenyl.",
        bannedIn: ["Norway", "Finland"],
        commonlyFoundIn: ["Orange soda", "Candy", "Cheese-flavored snacks", "Cereals"],
        safeAlternatives: ["Carrot juice", "Paprika", "Annatto"]
      ),

      ToxicChemical(
        id: "blue1",
        name: "Blue 1",
        aliases: ["E133", "Brilliant Blue FCF", "FD&C Blue No. 1", "133"],
        category: .colorant,
        dangerLevel: .danger,
        effects: [
          .init(
            effect: "Crosses Blood-Brain Barrier", description: "Can reach the brain",
            bodySystem: .brain),
          .init(effect: "Chromosomal Damage", description: "May damage DNA", bodySystem: .cancer),
          .init(
            effect: "Allergic Reactions", description: "Skin rashes, breathing issues",
            bodySystem: .immune),
        ],
        description: "Synthetic dye derived from petroleum. Can cross the blood-brain barrier.",
        bannedIn: ["Austria", "Belgium", "France", "Germany", "Norway", "Sweden", "Switzerland"],
        commonlyFoundIn: ["Blue candy", "Ice cream", "Canned peas", "Icings", "Sports drinks"],
        safeAlternatives: ["Spirulina", "Butterfly pea flower", "Red cabbage"]
      ),

      // PRESERVATIVES
      ToxicChemical(
        id: "tbhq",
        name: "TBHQ",
        aliases: ["E319", "Tertiary butylhydroquinone", "tert-Butylhydroquinone", "319"],
        category: .preservative,
        dangerLevel: .danger,
        effects: [
          .init(
            effect: "Immune System Damage", description: "May weaken immune response to infections",
            bodySystem: .immune),
          .init(
            effect: "ADHD Symptoms", description: "Linked to hyperactivity", bodySystem: .behavior),
          .init(
            effect: "Stomach Tumors", description: "Caused tumors in animal studies",
            bodySystem: .cancer),
        ],
        description: "Petroleum-derived preservative used to extend shelf life. A form of butane.",
        bannedIn: ["Japan"],
        commonlyFoundIn: [
          "Chicken nuggets", "Microwave popcorn", "Fast food", "Crackers", "Frozen pizza",
        ],
        safeAlternatives: ["Vitamin E (tocopherols)", "Rosemary extract"]
      ),

      ToxicChemical(
        id: "bha",
        name: "BHA",
        aliases: ["E320", "Butylated hydroxyanisole", "320"],
        category: .preservative,
        dangerLevel: .severe,
        effects: [
          .init(
            effect: "Carcinogen", description: "Reasonably anticipated to be a human carcinogen",
            bodySystem: .cancer),
          .init(
            effect: "Hormone Disruption", description: "Acts as endocrine disruptor",
            bodySystem: .hormones),
          .init(
            effect: "Behavioral Effects", description: "May affect brain chemistry",
            bodySystem: .behavior),
        ],
        description: "Petroleum-derived preservative. Listed by California as a known carcinogen.",
        bannedIn: ["Japan", "UK", "EU (restricted)"],
        commonlyFoundIn: ["Butter", "Cereals", "Chewing gum", "Snack foods", "Meat"],
        safeAlternatives: ["Vitamin E", "Citric acid", "Rosemary extract"]
      ),

      ToxicChemical(
        id: "bht",
        name: "BHT",
        aliases: ["E321", "Butylated hydroxytoluene", "321"],
        category: .preservative,
        dangerLevel: .danger,
        effects: [
          .init(
            effect: "Liver/Kidney Damage", description: "Toxic to these organs at high doses",
            bodySystem: .liver),
          .init(
            effect: "Hormone Disruption", description: "Mimics estrogen", bodySystem: .hormones),
          .init(
            effect: "Cancer Concerns", description: "Mixed results in studies", bodySystem: .cancer),
        ],
        description: "Petroleum-derived preservative similar to BHA. Often used together.",
        bannedIn: ["Australia", "EU (restricted)", "Japan"],
        commonlyFoundIn: ["Cereals", "Chips", "Vegetable oils", "Chewing gum"],
        safeAlternatives: ["Vitamin E", "Ascorbic acid"]
      ),

      ToxicChemical(
        id: "sodium_nitrite",
        name: "Sodium Nitrite",
        aliases: ["E250", "250", "Nitrite"],
        category: .preservative,
        dangerLevel: .critical,
        effects: [
          .init(
            effect: "Forms Nitrosamines", description: "Creates carcinogenic compounds when heated",
            bodySystem: .cancer),
          .init(
            effect: "Colorectal Cancer", description: "Strong link to colon cancer",
            bodySystem: .cancer),
          .init(
            effect: "Pancreatic Cancer", description: "Increased risk with processed meats",
            bodySystem: .cancer),
        ],
        description:
          "Preservative and color fixer in processed meats. WHO classifies processed meat as Group 1 carcinogen.",
        bannedIn: [],
        commonlyFoundIn: ["Bacon", "Hot dogs", "Deli meats", "Sausages", "Ham"],
        safeAlternatives: ["Celery powder", "Fresh meat", "Uncured options"]
      ),

      // EMULSIFIERS
      ToxicChemical(
        id: "carrageenan",
        name: "Carrageenan",
        aliases: ["E407", "407", "Irish moss extract"],
        category: .emulsifier,
        dangerLevel: .warning,
        effects: [
          .init(
            effect: "Gut Inflammation", description: "Triggers inflammatory response in intestines",
            bodySystem: .gut),
          .init(
            effect: "Digestive Issues", description: "Bloating, IBS symptoms", bodySystem: .gut),
          .init(
            effect: "Cancer Concerns", description: "Degraded carrageenan is a known carcinogen",
            bodySystem: .cancer),
        ],
        description:
          "Seaweed-derived thickener. Even undegraded form causes inflammation in studies.",
        bannedIn: ["EU (in infant formula)"],
        commonlyFoundIn: ["Almond milk", "Ice cream", "Yogurt", "Deli meats", "Chocolate milk"],
        safeAlternatives: ["Guar gum", "Locust bean gum", "Products without thickeners"]
      ),

      ToxicChemical(
        id: "polysorbate80",
        name: "Polysorbate 80",
        aliases: ["E433", "433", "Tween 80"],
        category: .emulsifier,
        dangerLevel: .danger,
        effects: [
          .init(
            effect: "Gut Microbiome Damage", description: "Alters intestinal bacteria",
            bodySystem: .gut),
          .init(
            effect: "Intestinal Inflammation", description: "May contribute to IBD",
            bodySystem: .gut),
          .init(
            effect: "Metabolic Syndrome", description: "Linked to obesity and glucose intolerance",
            bodySystem: .hormones),
        ],
        description:
          "Synthetic emulsifier that disrupts the gut mucus layer and promotes inflammation.",
        bannedIn: [],
        commonlyFoundIn: ["Ice cream", "Pickles", "Vitamins", "Vaccines", "Cosmetics"],
        safeAlternatives: ["Sunflower lecithin", "Products without emulsifiers"]
      ),

      // MSG & FLAVOR ENHANCERS
      ToxicChemical(
        id: "msg",
        name: "MSG",
        aliases: [
          "E621", "Monosodium glutamate", "621", "Glutamic acid", "Hydrolyzed protein",
          "Autolyzed yeast", "Natural flavors",
        ],
        category: .flavor,
        dangerLevel: .warning,
        effects: [
          .init(
            effect: "Excitotoxicity", description: "Overstimulates neurons, may cause cell death",
            bodySystem: .brain),
          .init(
            effect: "Headaches", description: "'Chinese Restaurant Syndrome'", bodySystem: .brain),
          .init(
            effect: "Obesity", description: "Disrupts appetite regulation, promotes overeating",
            bodySystem: .hormones),
          .init(
            effect: "Addiction", description: "Engineered to make food irresistible",
            bodySystem: .behavior),
        ],
        description:
          "Flavor enhancer that tricks your brain into thinking food tastes better. Often hidden under 'natural flavors.'",
        bannedIn: [],
        commonlyFoundIn: [
          "Chinese food", "Chips", "Fast food", "Canned soups", "Frozen dinners", "Ranch dressing",
        ],
        safeAlternatives: ["Real herbs and spices", "Sea salt", "Nutritional yeast"]
      ),

      // TRANS FATS
      ToxicChemical(
        id: "trans_fat",
        name: "Partially Hydrogenated Oils",
        aliases: ["Trans fat", "Hydrogenated vegetable oil", "Shortening", "Margarine"],
        category: .transFat,
        dangerLevel: .critical,
        effects: [
          .init(
            effect: "Heart Disease", description: "Raises LDL, lowers HDL cholesterol",
            bodySystem: .heart),
          .init(
            effect: "Inflammation", description: "Systemic inflammatory response",
            bodySystem: .immune),
          .init(
            effect: "Diabetes", description: "Worsens insulin resistance", bodySystem: .hormones),
          .init(effect: "Stroke", description: "Increases clot formation", bodySystem: .heart),
        ],
        description:
          "Artificially created fats. Banned by FDA in 2018 but still found in some products.",
        bannedIn: ["USA (partially)", "Denmark", "Switzerland", "Austria"],
        commonlyFoundIn: [
          "Fried foods", "Baked goods", "Margarine", "Microwave popcorn", "Coffee creamers",
        ],
        safeAlternatives: ["Butter", "Coconut oil", "Olive oil", "Avocado oil"]
      ),

      // GROWTH HORMONES
      ToxicChemical(
        id: "rbgh",
        name: "rBGH/rBST",
        aliases: ["Recombinant bovine growth hormone", "Bovine somatotropin", "Posilac"],
        category: .hormone,
        dangerLevel: .severe,
        effects: [
          .init(
            effect: "IGF-1 Increase", description: "Raises cancer-promoting growth factor",
            bodySystem: .cancer),
          .init(
            effect: "Breast Cancer", description: "Linked to increased risk", bodySystem: .cancer),
          .init(
            effect: "Prostate Cancer", description: "Linked to increased risk", bodySystem: .cancer),
          .init(
            effect: "Early Puberty", description: "May contribute to precocious puberty",
            bodySystem: .development),
        ],
        description:
          "Synthetic hormone injected into cows to increase milk production. Increases IGF-1 in milk.",
        bannedIn: ["EU", "Canada", "Australia", "Japan", "New Zealand"],
        commonlyFoundIn: ["Conventional milk", "Cheese", "Yogurt", "Ice cream"],
        safeAlternatives: ["Organic dairy", "rBGH-free labeled products", "Plant-based milk"]
      ),

      // POTASSIUM BROMATE
      ToxicChemical(
        id: "potassium_bromate",
        name: "Potassium Bromate",
        aliases: ["E924", "Bromated flour", "924"],
        category: .other,
        dangerLevel: .critical,
        effects: [
          .init(
            effect: "Kidney Cancer", description: "Known carcinogen in animals", bodySystem: .cancer
          ),
          .init(
            effect: "Thyroid Tumors", description: "Disrupts thyroid function",
            bodySystem: .hormones),
          .init(effect: "Kidney Damage", description: "Nephrotoxic", bodySystem: .liver),
        ],
        description: "Added to flour to strengthen dough. Known carcinogen still legal in the US.",
        bannedIn: ["EU", "UK", "Canada", "Brazil", "China", "India"],
        commonlyFoundIn: ["Bread", "Rolls", "Buns", "Flour", "Fast food buns"],
        safeAlternatives: ["Unbromated flour", "Organic bread", "European bread products"]
      ),

      // ARTIFICIAL FLAVOR
      ToxicChemical(
        id: "artificial_flavor",
        name: "Artificial Flavors",
        aliases: ["Natural flavors", "Flavoring", "Flavor"],
        category: .flavor,
        dangerLevel: .warning,
        effects: [
          .init(
            effect: "Unknown Chemicals", description: "Can contain 50+ undisclosed chemicals",
            bodySystem: .immune),
          .init(effect: "Allergic Reactions", description: "Hidden allergens", bodySystem: .immune),
          .init(
            effect: "Addiction", description: "Engineered to be hyperpalatable",
            bodySystem: .behavior),
        ],
        description:
          "'Natural flavors' can contain up to 100 different chemicals. Companies don't have to disclose what's in them.",
        bannedIn: [],
        commonlyFoundIn: ["Almost everything processed", "Drinks", "Snacks", "Candy"],
        safeAlternatives: ["Whole foods", "Real fruit", "Real herbs and spices"]
      ),

      // SODIUM BENZOATE
      ToxicChemical(
        id: "sodium_benzoate",
        name: "Sodium Benzoate",
        aliases: ["E211", "211", "Benzoic acid"],
        category: .preservative,
        dangerLevel: .danger,
        effects: [
          .init(
            effect: "Benzene Formation",
            description: "Combines with Vitamin C to form benzene (carcinogen)", bodySystem: .cancer
          ),
          .init(
            effect: "ADHD", description: "Linked to hyperactivity in children",
            bodySystem: .behavior),
          .init(
            effect: "Cell Damage", description: "Damages mitochondrial DNA", bodySystem: .immune),
        ],
        description:
          "Preservative that forms benzene when combined with ascorbic acid (Vitamin C).",
        bannedIn: [],
        commonlyFoundIn: ["Soda", "Salad dressings", "Jams", "Fruit juices", "Pickles"],
        safeAlternatives: ["Fresh foods", "Citric acid", "Refrigeration"]
      ),

      // PROPYL GALLATE
      ToxicChemical(
        id: "propyl_gallate",
        name: "Propyl Gallate",
        aliases: ["E310", "310"],
        category: .preservative,
        dangerLevel: .warning,
        effects: [
          .init(
            effect: "Hormone Disruption", description: "Estrogenic activity", bodySystem: .hormones),
          .init(
            effect: "Allergic Reactions", description: "Skin rashes, breathing issues",
            bodySystem: .immune),
          .init(effect: "Stomach Issues", description: "Digestive problems", bodySystem: .gut),
        ],
        description: "Antioxidant preservative often used with BHA and BHT.",
        bannedIn: [],
        commonlyFoundIn: [
          "Vegetable oil", "Meat products", "Potato sticks", "Chicken soup base", "Chewing gum",
        ],
        safeAlternatives: ["Vitamin E", "Rosemary extract"]
      ),

      // AZODICARBONAMIDE
      ToxicChemical(
        id: "azodicarbonamide",
        name: "Azodicarbonamide",
        aliases: ["E927a", "ADA", "927a", "Yoga mat chemical"],
        category: .other,
        dangerLevel: .severe,
        effects: [
          .init(
            effect: "Respiratory Issues", description: "Known to cause asthma in workers",
            bodySystem: .immune),
          .init(
            effect: "Carcinogen Formation",
            description: "Breaks down into urethane (carcinogen) when baked", bodySystem: .cancer),
          .init(effect: "Skin Sensitization", description: "Causes dermatitis", bodySystem: .skin),
        ],
        description:
          "Flour bleaching agent also used to make yoga mats and shoe soles. Banned in most countries.",
        bannedIn: ["EU", "UK", "Australia", "Singapore"],
        commonlyFoundIn: ["Bread", "Fast food buns", "Frozen dinners", "Packaged pastries"],
        safeAlternatives: ["Unbleached flour", "Organic bread", "European products"]
      ),
    ]
  }

  // MARK: - Search Functions

  func searchIngredient(_ ingredient: String) -> [ToxicChemical] {
    let searchTerm = ingredient.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)

    return chemicals.filter { chemical in
      // Check main name
      if chemical.name.lowercased().contains(searchTerm) { return true }

      // Check aliases
      for alias in chemical.aliases {
        if alias.lowercased().contains(searchTerm) { return true }
      }

      return false
    }
  }

  func analyzeIngredientList(_ ingredients: String) -> [ToxicChemical] {
    var foundChemicals: [ToxicChemical] = []

    // Split by common separators
    let components =
      ingredients
      .replacingOccurrences(of: ":", with: ",")
      .replacingOccurrences(of: ";", with: ",")
      .replacingOccurrences(of: "(", with: ",")
      .replacingOccurrences(of: ")", with: ",")
      .replacingOccurrences(of: "[", with: ",")
      .replacingOccurrences(of: "]", with: ",")
      .components(separatedBy: ",")
      .map { $0.trimmingCharacters(in: .whitespacesAndNewlines).lowercased() }
      .filter { !$0.isEmpty }

    for component in components {
      let matches = searchIngredient(component)
      for match in matches {
        if !foundChemicals.contains(where: { $0.id == match.id }) {
          foundChemicals.append(match)
        }
      }
    }

    // Sort by danger level (highest first)
    return foundChemicals.sorted { $0.dangerLevel.rawValue > $1.dangerLevel.rawValue }
  }

  func getChemicalsByCategory(_ category: ToxicChemical.ToxicCategory) -> [ToxicChemical] {
    chemicals.filter { $0.category == category }
  }

  func getChemicalsByDangerLevel(_ level: ToxicChemical.DangerLevel) -> [ToxicChemical] {
    chemicals.filter { $0.dangerLevel == level }
  }

  func getCriticalChemicals() -> [ToxicChemical] {
    chemicals.filter { $0.dangerLevel.rawValue >= ToxicChemical.DangerLevel.severe.rawValue }
  }
}
