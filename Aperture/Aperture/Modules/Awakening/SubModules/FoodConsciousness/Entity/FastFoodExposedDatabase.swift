import Foundation
import SwiftUI

// MARK: - Fast Food Chain Model

struct FastFoodChain: Identifiable, Codable {
  let id: String
  let name: String
  let logo: String  // SF Symbol
  let overallScore: HealthScore
  let exposedIngredients: [ExposedIngredient]
  let dirtySecrets: [DirtySecret]
  let lawsuits: [Lawsuit]
  let marketingLies: [String]
  let healthierAlternatives: [String]

  enum HealthScore: Int, Codable, CaseIterable {
    case toxic = 1
    case unhealthy = 2
    case poor = 3
    case questionable = 4

    var name: String {
      switch self {
      case .toxic: return "Toxic"
      case .unhealthy: return "Unhealthy"
      case .poor: return "Poor"
      case .questionable: return "Questionable"
      }
    }

    var color: Color {
      switch self {
      case .toxic: return Color(hex: "#8B0000")
      case .unhealthy: return .red
      case .poor: return .orange
      case .questionable: return .yellow
      }
    }

    var icon: String {
      switch self {
      case .toxic: return "xmark.shield.fill"
      case .unhealthy: return "exclamationmark.octagon.fill"
      case .poor: return "exclamationmark.triangle.fill"
      case .questionable: return "questionmark.circle.fill"
      }
    }
  }

  struct ExposedIngredient: Identifiable, Codable {
    var id: String {
      ingredient
    }

    let ingredient: String
    let foundIn: [String]
    let issue: String
    let dangerLevel: Int  // 1-5
  }

  struct DirtySecret: Identifiable, Codable {
    var id: String {
      title
    }

    let title: String
    let description: String
    let source: String
  }

  struct Lawsuit: Identifiable, Codable {
    var id: String {
      title
    }

    let year: Int
    let title: String
    let outcome: String
  }
}

// MARK: - State Statistics

struct StateStats: Identifiable, Codable {
  let id: String  // State abbreviation
  let stateName: String
  let fastFoodDensity: Double  // Per 10,000 people
  let obesityRate: Double
  let diabetesRate: Double
  let topChains: [String]  // IDs of most prevalent chains
  let localWarnings: [String]
}

// MARK: - Fast Food Database

class FastFoodExposedDatabase: ObservableObject {
  static let shared = FastFoodExposedDatabase()

  @Published var chains: [FastFoodChain] = []
  @Published var stateStats: [StateStats] = []

  init() {
    loadChains()
    loadStateStats()
  }

  private func loadChains() {
    chains = [
      // McDONALD'S
      FastFoodChain(
        id: "mcdonalds",
        name: "McDonald's",
        logo: "m.circle.fill",
        overallScore: .toxic,
        exposedIngredients: [
          .init(
            ingredient: "TBHQ", foundIn: ["Chicken McNuggets", "Fries", "Hash Browns"],
            issue: "Petroleum-based preservative, form of butane", dangerLevel: 4),
          .init(
            ingredient: "Dimethylpolysiloxane", foundIn: ["Fries", "McNuggets"],
            issue: "Silicone-based anti-foaming agent (also in Silly Putty)", dangerLevel: 3),
          .init(
            ingredient: "Sodium Phosphate", foundIn: ["Most menu items"],
            issue: "Linked to kidney damage and heart disease", dangerLevel: 4),
          .init(
            ingredient: "Azodicarbonamide", foundIn: ["Buns"],
            issue: "Yoga mat chemical, banned in EU", dangerLevel: 5),
          .init(
            ingredient: "High Fructose Corn Syrup", foundIn: ["Buns", "Sauces", "Drinks"],
            issue: "Liver damage, obesity, diabetes", dangerLevel: 4),
          .init(
            ingredient: "Sodium Nitrite", foundIn: ["Bacon", "Breakfast meats"],
            issue: "Creates carcinogenic nitrosamines", dangerLevel: 5),
        ],
        dirtySecrets: [
          .init(
            title: "Fries have 19 ingredients",
            description:
              "McDonald's fries contain 19 ingredients including TBHQ, dimethylpolysiloxane, and 'natural beef flavor' (made from wheat and milk derivatives).",
            source: "McDonald's ingredient list"),
          .init(
            title: "Pink Slime History",
            description:
              "Until 2012, McDonald's used 'lean beef trimmings' (pink slime) treated with ammonia in their burgers.",
            source: "ABC News Investigation"),
          .init(
            title: "Engineered Addiction",
            description:
              "The exact combination of salt, sugar, and fat is scientifically engineered to be maximally addictive and override satiety signals.",
            source: "Salt Sugar Fat by Michael Moss"),
          .init(
            title: "Meat Quality",
            description:
              "Beef patties come from multiple cows from multiple countries, increasing contamination risk.",
            source: "Food Inc. Documentary"),
        ],
        lawsuits: [
          .init(
            year: 2002, title: "Hot Coffee Case",
            outcome: "Woman awarded $2.7M for severe burns from improperly hot coffee"),
          .init(
            year: 2010, title: "Happy Meal Lawsuit",
            outcome: "Sued for marketing unhealthy food to children"),
          .init(
            year: 2023, title: "Child Labor Violations",
            outcome: "Fined for employing children illegally at franchises"),
        ],
        marketingLies: [
          "'Real beef' - but from where and treated with what?",
          "'Fresh cracked eggs' - from factory-farmed chickens",
          "'100% chicken breast' - but processed with 40+ ingredients",
          "'Balanced meal' - 1000+ calories and 50g of fat",
        ],
        healthierAlternatives: [
          "Chipotle (if you skip the tortilla and cheese)",
          "Home-cooked burgers with grass-fed beef",
          "Any local restaurant with real ingredients",
        ]
      ),

      // TACO BELL
      FastFoodChain(
        id: "tacobell",
        name: "Taco Bell",
        logo: "bell.fill",
        overallScore: .toxic,
        exposedIngredients: [
          .init(
            ingredient: "Soy Lecithin", foundIn: ["Beef", "Tortillas", "Sauces"],
            issue: "Usually from GMO soybeans", dangerLevel: 2),
          .init(
            ingredient: "Maltodextrin", foundIn: ["Seasoned beef", "Sauces"],
            issue: "Spikes blood sugar higher than table sugar", dangerLevel: 3),
          .init(
            ingredient: "Autolyzed Yeast", foundIn: ["Beef seasoning"], issue: "Hidden MSG",
            dangerLevel: 3),
          .init(
            ingredient: "Cellulose", foundIn: ["Cheese", "Tortillas"], issue: "Wood pulp filler",
            dangerLevel: 2),
          .init(
            ingredient: "Torula Yeast", foundIn: ["Beef"], issue: "Another hidden MSG source",
            dangerLevel: 3),
          .init(
            ingredient: "TBHQ", foundIn: ["Cinnamon Twists", "Fried items"],
            issue: "Petroleum preservative", dangerLevel: 4),
        ],
        dirtySecrets: [
          .init(
            title: "Only 36% Beef",
            description:
              "Taco Bell's 'seasoned beef' is only 36% actual beef. The rest is water, oat filler, and chemicals.",
            source: "2011 Lawsuit"),
          .init(
            title: "Cheese Contains Cellulose",
            description:
              "Their nacho cheese contains wood pulp (cellulose) as an anti-caking agent.",
            source: "Ingredient list"),
          .init(
            title: "12 different types of MSG",
            description:
              "Their beef seasoning contains multiple forms of MSG disguised under different names.",
            source: "Ingredient analysis"),
          .init(
            title: "Cross-Contamination",
            description:
              "Nearly everything is made in shared equipment, making allergen-free eating nearly impossible.",
            source: "Allergen warnings"),
        ],
        lawsuits: [
          .init(
            year: 2011, title: "Beef Quality Lawsuit",
            outcome: "Sued for false advertising of 'beef' - dropped after reformulation"),
          .init(
            year: 2019, title: "Hepatitis A Outbreak",
            outcome: "Linked to contaminated food handling"),
        ],
        marketingLies: [
          "'Seasoned beef' - 64% NOT beef",
          "'Made with real cheese' - plus wood pulp",
          "'Fresh ingredients' - shipped frozen nationwide",
          "'Power Bowl' - still 600+ calories of processed food",
        ],
        healthierAlternatives: [
          "Any authentic Mexican restaurant",
          "Homemade tacos with real ingredients",
          "Chipotle (fresher ingredients)",
        ]
      ),

      // BURGER KING
      FastFoodChain(
        id: "burgerking",
        name: "Burger King",
        logo: "crown.fill",
        overallScore: .unhealthy,
        exposedIngredients: [
          .init(
            ingredient: "Calcium Peroxide", foundIn: ["Buns"],
            issue: "Dough conditioner that may cause digestive issues", dangerLevel: 2),
          .init(
            ingredient: "DATEM", foundIn: ["Buns"], issue: "Potential heart damage in animals",
            dangerLevel: 3),
          .init(
            ingredient: "Sodium Acid Pyrophosphate", foundIn: ["Hash Browns"],
            issue: "Contains phosphates linked to health issues", dangerLevel: 3),
          .init(
            ingredient: "Propylene Glycol", foundIn: ["Vanilla shake"],
            issue: "Also used in antifreeze", dangerLevel: 4),
          .init(
            ingredient: "Polysorbate 80", foundIn: ["Ice cream products"],
            issue: "Gut microbiome damage", dangerLevel: 3),
        ],
        dirtySecrets: [
          .init(
            title: "Flame-Broiled Flavoring",
            description:
              "The 'flame-broiled' taste is partially from artificial smoke flavoring, not actual flames.",
            source: "Ingredient analysis"),
          .init(
            title: "Impossible Whopper Processing",
            description:
              "Their 'healthy' Impossible Whopper has similar calories and more sodium than the regular Whopper.",
            source: "Nutrition facts"),
          .init(
            title: "Cross-Contamination",
            description: "The Impossible Whopper is cooked on the same broiler as beef.",
            source: "BK statement"),
        ],
        lawsuits: [
          .init(
            year: 2019, title: "Whopper Size Lawsuit",
            outcome: "Sued for making burgers appear larger in ads"),
          .init(
            year: 2022, title: "Impossible Whopper Lawsuit",
            outcome: "Vegan sued for cross-contamination"),
        ],
        marketingLies: [
          "'Flame-Grilled' - with artificial smoke flavor",
          "'Have It Your Way' - from pre-made ingredients",
          "'100% Beef' - but what quality?",
        ],
        healthierAlternatives: [
          "Five Guys (fresher ingredients, no freezers)",
          "Home-cooked burgers",
          "Local burger joints",
        ]
      ),

      // WENDY'S
      FastFoodChain(
        id: "wendys",
        name: "Wendy's",
        logo: "w.circle.fill",
        overallScore: .poor,
        exposedIngredients: [
          .init(
            ingredient: "Dimethylpolysiloxane", foundIn: ["Fries", "Fried items"],
            issue: "Silicone anti-foaming agent", dangerLevel: 3),
          .init(
            ingredient: "Sodium Phosphates", foundIn: ["Chicken"],
            issue: "Linked to cardiovascular issues", dangerLevel: 3),
          .init(
            ingredient: "Sodium Aluminum Phosphate", foundIn: ["Biscuits"],
            issue: "Aluminum accumulation concerns", dangerLevel: 3),
          .init(
            ingredient: "Caramel Color", foundIn: ["Sodas", "Sauces"],
            issue: "Contains 4-MEI, a potential carcinogen", dangerLevel: 4),
        ],
        dirtySecrets: [
          .init(
            title: "Chili Meat Source",
            description:
              "Wendy's chili is made from old hamburger patties that were cooked but not sold.",
            source: "Former employees"),
          .init(
            title: "'Fresh, Never Frozen' Loophole",
            description: "While beef is 'never frozen,' nearly everything else is.",
            source: "Supply chain analysis"),
          .init(
            title: "Salad Calories",
            description: "Many salads have more calories than burgers when dressed.",
            source: "Nutrition facts"),
        ],
        lawsuits: [
          .init(
            year: 2005, title: "Finger in Chili Hoax",
            outcome: "Woman planted finger, sent to prison for fraud"),
          .init(
            year: 2023, title: "Surge Pricing Controversy",
            outcome: "Public backlash over dynamic pricing announcement"),
        ],
        marketingLies: [
          "'Fresh, Never Frozen' - only applies to beef",
          "'Natural-Cut Fries' - still fried in processed oil",
          "'Real Fruit' Frosty - made with corn syrup",
        ],
        healthierAlternatives: [
          "At least they use fresh beef",
          "Skip the fries and soda",
          "Side salad instead of fries (no dressing)",
        ]
      ),

      // SUBWAY
      FastFoodChain(
        id: "subway",
        name: "Subway",
        logo: "s.circle.fill",
        overallScore: .poor,
        exposedIngredients: [
          .init(
            ingredient: "Azodicarbonamide", foundIn: ["Bread (removed 2014)"],
            issue: "Was in bread until public outcry", dangerLevel: 5),
          .init(
            ingredient: "Sodium Nitrite", foundIn: ["Deli meats"],
            issue: "Carcinogenic nitrosamines", dangerLevel: 5),
          .init(
            ingredient: "Sodium Stearoyl Lactylate", foundIn: ["Bread"],
            issue: "Emulsifier with limited safety data", dangerLevel: 2),
          .init(
            ingredient: "Soybean Oil", foundIn: ["Most items"], issue: "Inflammatory omega-6 oils",
            dangerLevel: 3),
        ],
        dirtySecrets: [
          .init(
            title: "Tuna DNA Mystery",
            description:
              "Lab tests found no identifiable tuna DNA in Subway's tuna. They claim it's too processed to test.",
            source: "NY Times Investigation 2021"),
          .init(
            title: "Chicken is 50% Soy",
            description:
              "Canadian study found Subway chicken was about 50% soy protein, not chicken.",
            source: "CBC Marketplace"),
          .init(
            title: "Yoga Mat Chemical",
            description:
              "Until 2014, their bread contained azodicarbonamide, used in yoga mats and shoe rubber.",
            source: "Food Babe investigation"),
          .init(
            title: "Bread is Too Sugary",
            description:
              "Irish courts ruled Subway bread has too much sugar to be legally called 'bread'.",
            source: "Irish Supreme Court 2020"),
        ],
        lawsuits: [
          .init(
            year: 2021, title: "Tuna Lawsuit", outcome: "Ongoing - alleged tuna isn't actually tuna"
          ),
          .init(
            year: 2013, title: "Footlong Lawsuit",
            outcome: "Sued because 'footlong' subs were less than 12 inches"),
          .init(
            year: 2014, title: "Azodicarbonamide Removal",
            outcome: "Removed yoga mat chemical after petition"),
        ],
        marketingLies: [
          "'Eat Fresh' - with processed deli meats full of nitrites",
          "'Healthy Alternative' - bread has too much sugar to be bread",
          "'100% Tuna' - no identifiable tuna DNA found",
          "'All-White Meat Chicken' - was 50% soy",
        ],
        healthierAlternatives: [
          "Make sandwiches at home with real ingredients",
          "Jersey Mike's (slightly better quality)",
          "Any deli with real sliced meat",
        ]
      ),

      // CHICK-FIL-A
      FastFoodChain(
        id: "chickfila",
        name: "Chick-fil-A",
        logo: "bird.fill",
        overallScore: .poor,
        exposedIngredients: [
          .init(
            ingredient: "MSG", foundIn: ["Chicken sandwich", "Nuggets", "Most items"],
            issue: "Excitotoxin, engineered addiction", dangerLevel: 3),
          .init(
            ingredient: "TBHQ", foundIn: ["Fried items"], issue: "Petroleum preservative",
            dangerLevel: 4),
          .init(
            ingredient: "Dimethylpolysiloxane", foundIn: ["Fried items"],
            issue: "Silicone anti-foaming agent", dangerLevel: 3),
          .init(
            ingredient: "Yellow #5", foundIn: ["Sauces"], issue: "Hyperactivity, allergies",
            dangerLevel: 4),
          .init(
            ingredient: "Sodium Aluminum Phosphate", foundIn: ["Biscuits"],
            issue: "Aluminum concerns", dangerLevel: 3),
        ],
        dirtySecrets: [
          .init(
            title: "MSG in Everything",
            description: "MSG is in almost every menu item, which is why it's so 'craveable.'",
            source: "Ingredient list"),
          .init(
            title: "Pickle Juice Brine",
            description:
              "Chicken is brined in pickle juice - including MSG and artificial flavors.",
            source: "Recipe analysis"),
          .init(
            title: "Factory Farming",
            description: "Sources chicken from factory farms with poor animal welfare standards.",
            source: "Animal welfare reports"),
          .init(
            title: "No Antibiotics Claims",
            description: "Only applied to specific menu items, not all chicken.",
            source: "Company statements"),
        ],
        lawsuits: [
          .init(
            year: 2023, title: "No Antibiotics Lawsuit",
            outcome: "Sued for misleading 'no antibiotics ever' claims")
        ],
        marketingLies: [
          "'My Pleasure' service hides factory-farmed chicken",
          "'No Antibiotics' - only applies to some items",
          "'Quality ingredients' - with MSG and TBHQ",
          "'Fresh' - from frozen, factory-farmed chicken",
        ],
        healthierAlternatives: [
          "Rotisserie chicken from grocery store",
          "Home-cooked chicken",
          "Local restaurants with organic chicken",
        ]
      ),

      // KFC
      FastFoodChain(
        id: "kfc",
        name: "KFC",
        logo: "k.circle.fill",
        overallScore: .unhealthy,
        exposedIngredients: [
          .init(
            ingredient: "MSG", foundIn: ["Original Recipe", "Most items"],
            issue: "Excitotoxin, addiction", dangerLevel: 3),
          .init(
            ingredient: "Sodium Phosphate", foundIn: ["Chicken"],
            issue: "Water retention, health issues", dangerLevel: 3),
          .init(
            ingredient: "Maltodextrin", foundIn: ["Breading"], issue: "Blood sugar spikes",
            dangerLevel: 3),
          .init(
            ingredient: "Palm Oil", foundIn: ["Fried items"],
            issue: "Environmental destruction, saturated fat", dangerLevel: 3),
          .init(
            ingredient: "TBHQ", foundIn: ["Fried items"], issue: "Petroleum preservative",
            dangerLevel: 4),
        ],
        dirtySecrets: [
          .init(
            title: "11 Herbs and MSG",
            description: "The 'secret recipe' prominently features MSG for addictive taste.",
            source: "Recipe leak"),
          .init(
            title: "Factory Farming Cruelty",
            description: "Chickens are bred to grow so fast their legs often can't support them.",
            source: "Animal welfare investigations"),
          .init(
            title: "Double-Fried",
            description: "Chicken is often pressure-fried twice, maximizing oil absorption.",
            source: "Employee reports"),
        ],
        lawsuits: [
          .init(
            year: 2019, title: "False Advertising Lawsuit",
            outcome: "Sued for bucket showing more chicken than provided")
        ],
        marketingLies: [
          "'Finger Lickin' Good' - because of MSG addiction",
          "'Secret Recipe' - it's mostly MSG and salt",
          "'Original' - from factory-farmed birds",
          "'Real chicken' - pumped with solutions",
        ],
        healthierAlternatives: [
          "Rotisserie chicken",
          "Home-fried chicken with real ingredients",
          "Local soul food restaurants",
        ]
      ),

      // PIZZA HUT
      FastFoodChain(
        id: "pizzahut",
        name: "Pizza Hut",
        logo: "p.circle.fill",
        overallScore: .unhealthy,
        exposedIngredients: [
          .init(
            ingredient: "Sodium Stearoyl Lactylate", foundIn: ["Dough"],
            issue: "Emulsifier with limited safety data", dangerLevel: 2),
          .init(
            ingredient: "L-Cysteine", foundIn: ["Dough"],
            issue: "Often derived from human hair or duck feathers", dangerLevel: 2),
          .init(
            ingredient: "BHT", foundIn: ["Various items"],
            issue: "Potentially carcinogenic preservative", dangerLevel: 4),
          .init(
            ingredient: "Artificial Flavors", foundIn: ["Almost everything"],
            issue: "Unknown chemical combinations", dangerLevel: 3),
        ],
        dirtySecrets: [
          .init(
            title: "Cheese Isn't Always Cheese",
            description: "Some pizzas use cheese substitutes or blends with fillers.",
            source: "Ingredient analysis"),
          .init(
            title: "Sodium Overload",
            description: "One slice can contain 600+ mg sodium - 25% of daily limit.",
            source: "Nutrition facts"),
          .init(
            title: "Dough Conditioners",
            description:
              "Contains L-cysteine which is often derived from human hair sourced from China.",
            source: "Ingredient sourcing"),
        ],
        lawsuits: [],
        marketingLies: [
          "'Hand-Tossed' - assembled from pre-made dough",
          "'Fresh ingredients' - many are processed",
          "'Real cheese' - blended with fillers",
        ],
        healthierAlternatives: [
          "Local pizzeria with real ingredients",
          "Homemade pizza",
          "Blaze Pizza (fresher options)",
        ]
      ),

      // DOMINO'S
      FastFoodChain(
        id: "dominos",
        name: "Domino's",
        logo: "d.circle.fill",
        overallScore: .poor,
        exposedIngredients: [
          .init(
            ingredient: "L-Cysteine", foundIn: ["Dough"], issue: "Derived from hair/feathers",
            dangerLevel: 2),
          .init(
            ingredient: "Sodium Phosphate", foundIn: ["Meat toppings"],
            issue: "Cardiovascular concerns", dangerLevel: 3),
          .init(
            ingredient: "Sodium Nitrite", foundIn: ["Pepperoni", "Meats"],
            issue: "Carcinogenic compounds", dangerLevel: 5),
          .init(
            ingredient: "TBHQ", foundIn: ["Fried items"], issue: "Petroleum preservative",
            dangerLevel: 4),
        ],
        dirtySecrets: [
          .init(
            title: "Dough Contains Hair-Derived Ingredient",
            description:
              "L-cysteine in their dough is often sourced from human hair or duck feathers.",
            source: "Ingredient sourcing"),
          .init(
            title: "Cheese Reality",
            description:
              "Their 'Part-Skim Mozzarella' is heavily processed and contains multiple additives.",
            source: "Ingredient list"),
          .init(
            title: "Sodium Bomb",
            description: "A medium pizza can contain over 200% of daily sodium needs.",
            source: "Nutrition facts"),
        ],
        lawsuits: [],
        marketingLies: [
          "'Fresh ingredients' - shipped frozen",
          "'Hand-made' - from premixed dough",
          "'Quality cheese' - heavily processed",
        ],
        healthierAlternatives: [
          "Local Italian pizzeria",
          "Homemade pizza",
          "Cauliflower crust options",
        ]
      ),

      // STARBUCKS
      FastFoodChain(
        id: "starbucks",
        name: "Starbucks",
        logo: "star.fill",
        overallScore: .questionable,
        exposedIngredients: [
          .init(
            ingredient: "Carrageenan", foundIn: ["Plant milks", "Some drinks"],
            issue: "Gut inflammation", dangerLevel: 3),
          .init(
            ingredient: "Caramel Color", foundIn: ["Many drinks"],
            issue: "4-MEI carcinogen concerns", dangerLevel: 3),
          .init(
            ingredient: "High Fructose Corn Syrup", foundIn: ["Syrups", "Pastries"],
            issue: "Metabolic damage", dangerLevel: 4),
          .init(
            ingredient: "Sodium Benzoate", foundIn: ["Bottled drinks"],
            issue: "Benzene formation with Vitamin C", dangerLevel: 4),
        ],
        dirtySecrets: [
          .init(
            title: "Sugar Content",
            description:
              "A grande Frappuccino can contain 50+ grams of sugar - more than a can of soda.",
            source: "Nutrition facts"),
          .init(
            title: "Burnt Beans",
            description:
              "Starbucks intentionally over-roasts beans for consistency, destroying antioxidants.",
            source: "Coffee industry analysis"),
          .init(
            title: "Calorie Bombs",
            description: "Many drinks exceed 500 calories - a quarter of daily needs.",
            source: "Menu analysis"),
        ],
        lawsuits: [
          .init(
            year: 2022, title: "Fruit Drinks Lawsuit",
            outcome: "Sued for 'fruit' drinks containing mostly sugar and juice")
        ],
        marketingLies: [
          "'Premium coffee' - over-roasted for consistency",
          "'Refreshers' - loaded with sugar",
          "'Plant-based options' - still processed",
        ],
        healthierAlternatives: [
          "Black coffee or espresso",
          "Local coffee shops with quality beans",
          "Home-brewed specialty coffee",
        ]
      ),

      // DUNKIN
      FastFoodChain(
        id: "dunkin",
        name: "Dunkin'",
        logo: "cup.and.saucer.fill",
        overallScore: .unhealthy,
        exposedIngredients: [
          .init(
            ingredient: "Titanium Dioxide", foundIn: ["Donuts", "Icing"],
            issue: "Nanoparticle concerns, banned in EU for food", dangerLevel: 5),
          .init(
            ingredient: "Artificial Colors", foundIn: ["Donuts", "Drinks"],
            issue: "Hyperactivity, allergies", dangerLevel: 4),
          .init(
            ingredient: "Sodium Stearoyl Lactylate", foundIn: ["Baked goods"],
            issue: "Emulsifier concerns", dangerLevel: 2),
          .init(
            ingredient: "TBHQ", foundIn: ["Donuts"], issue: "Petroleum preservative", dangerLevel: 4
          ),
          .init(
            ingredient: "Potassium Bromate", foundIn: ["Some baked goods"],
            issue: "Known carcinogen, banned in EU", dangerLevel: 5),
        ],
        dirtySecrets: [
          .init(
            title: "Titanium Dioxide",
            description: "Used in icing and glazes - banned in EU food products as of 2022.",
            source: "EU food regulations"),
          .init(
            title: "Sugar Overload",
            description: "One donut can contain 300+ calories and 30g of sugar.",
            source: "Nutrition facts"),
          .init(
            title: "Trans Fat Loopholes",
            description: "Can claim 0g trans fat with up to 0.5g per serving.",
            source: "FDA labeling rules"),
        ],
        lawsuits: [],
        marketingLies: [
          "'America Runs on Dunkin' - on sugar and chemicals",
          "'Fresh' donuts - often frozen and reheated",
          "'Real fruit' drinks - loaded with added sugars",
        ],
        healthierAlternatives: [
          "Local bakeries with real ingredients",
          "Black coffee only",
          "Homemade pastries",
        ]
      ),

      // POPEYES
      FastFoodChain(
        id: "popeyes",
        name: "Popeyes",
        logo: "flame.fill",
        overallScore: .unhealthy,
        exposedIngredients: [
          .init(
            ingredient: "MSG", foundIn: ["Chicken", "Seasonings"], issue: "Excitotoxin, addiction",
            dangerLevel: 3),
          .init(
            ingredient: "TBHQ", foundIn: ["Fried items"], issue: "Petroleum preservative",
            dangerLevel: 4),
          .init(
            ingredient: "Sodium Phosphates", foundIn: ["Chicken"],
            issue: "Water retention, health issues", dangerLevel: 3),
          .init(
            ingredient: "Yellow 5 & 6", foundIn: ["Sauces", "Sides"],
            issue: "Hyperactivity, cancer concerns", dangerLevel: 4),
        ],
        dirtySecrets: [
          .init(
            title: "Sodium Bomb",
            description: "A chicken sandwich contains over 1400mg sodium - 60% of daily limit.",
            source: "Nutrition facts"),
          .init(
            title: "MSG Addiction",
            description: "The 'famous' taste comes heavily from MSG and salt, not spices.",
            source: "Ingredient analysis"),
          .init(
            title: "Factory Farming", description: "Sources from industrial chicken operations.",
            source: "Supply chain"),
        ],
        lawsuits: [],
        marketingLies: [
          "'Louisiana Kitchen' - from factory farms",
          "'Cajun spices' - MSG and salt",
          "'Handcrafted' - mass-produced",
        ],
        healthierAlternatives: [
          "Authentic Cajun restaurants",
          "Home-cooked Cajun recipes",
          "Rotisserie chicken with Cajun seasoning",
        ]
      ),
    ]
  }

  private func loadStateStats() {
    stateStats = [
      StateStats(
        id: "TX",
        stateName: "Texas",
        fastFoodDensity: 8.2,
        obesityRate: 35.8,
        diabetesRate: 12.4,
        topChains: ["mcdonalds", "wendys", "tacobell", "chickfila", "whataburger"],
        localWarnings: [
          "Highest fast food density in the South", "Limited food desert initiatives",
        ]
      ),
      StateStats(
        id: "CA",
        stateName: "California",
        fastFoodDensity: 7.1,
        obesityRate: 26.8,
        diabetesRate: 9.8,
        topChains: ["mcdonalds", "tacobell", "innout", "carls", "jackinthebox"],
        localWarnings: ["Prop 65 warnings required on many items", "Some cities have soda taxes"]
      ),
      StateStats(
        id: "FL",
        stateName: "Florida",
        fastFoodDensity: 7.8,
        obesityRate: 28.4,
        diabetesRate: 11.2,
        topChains: ["mcdonalds", "burgerking", "wendys", "chickfila", "publix"],
        localWarnings: [
          "High elderly population vulnerable to sodium", "Tourism drives fast food density",
        ]
      ),
      StateStats(
        id: "NY",
        stateName: "New York",
        fastFoodDensity: 6.2,
        obesityRate: 27.6,
        diabetesRate: 10.5,
        topChains: ["mcdonalds", "subway", "dunkin", "burgerking", "wendys"],
        localWarnings: [
          "NYC has calorie posting requirements", "Sodium warning labels required in NYC",
        ]
      ),
      StateStats(
        id: "MS",
        stateName: "Mississippi",
        fastFoodDensity: 9.1,
        obesityRate: 40.8,
        diabetesRate: 14.8,
        topChains: ["mcdonalds", "wendys", "sonic", "tacobell", "popeyes"],
        localWarnings: [
          "Highest obesity rate in nation", "Severe food desert issues", "Limited healthy options",
        ]
      ),
      StateStats(
        id: "WV",
        stateName: "West Virginia",
        fastFoodDensity: 8.9,
        obesityRate: 39.7,
        diabetesRate: 15.7,
        topChains: ["mcdonalds", "wendys", "tacobell", "arbys", "subway"],
        localWarnings: [
          "Highest diabetes rate in nation", "Limited healthcare access", "Food deserts prevalent",
        ]
      ),
      StateStats(
        id: "CO",
        stateName: "Colorado",
        fastFoodDensity: 5.8,
        obesityRate: 23.8,
        diabetesRate: 7.4,
        topChains: ["mcdonalds", "chipotle", "subway", "wendys", "chickfila"],
        localWarnings: ["Lower fast food density than average", "More health-conscious population"]
      ),
    ]
  }

  // MARK: - Query Functions

  func getChain(_ id: String) -> FastFoodChain? {
    chains.first { $0.id == id }
  }

  func getChainsByScore(_ score: FastFoodChain.HealthScore) -> [FastFoodChain] {
    chains.filter { $0.overallScore == score }
  }

  func getWorstChains(count: Int = 5) -> [FastFoodChain] {
    Array(chains.sorted { $0.overallScore.rawValue < $1.overallScore.rawValue }.prefix(count))
  }

  func getStateStats(_ stateId: String) -> StateStats? {
    stateStats.first { $0.id == stateId }
  }

  func getChainsForState(_ stateId: String) -> [FastFoodChain] {
    guard let stats = getStateStats(stateId) else { return [] }
    return stats.topChains.compactMap { getChain($0) }
  }
}
