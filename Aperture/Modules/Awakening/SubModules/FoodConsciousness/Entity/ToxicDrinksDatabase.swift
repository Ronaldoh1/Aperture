import Foundation
import SwiftUI

// MARK: - Toxic Drink Model

struct ToxicDrink: Identifiable, Codable {
    let id: String
    let name: String
    let brand: String
    let category: DrinkCategory
    let dangerLevel: DangerLevel
    let sugarGrams: Double
    let artificialSweeteners: [String]
    let harmfulIngredients: [HarmfulIngredient]
    let healthEffects: [String]
    let marketingClaim: String
    let reality: String
    let healthierAlternative: String
    
    enum DrinkCategory: String, Codable, CaseIterable {
        case soda = "Soda"
        case energyDrink = "Energy Drink"
        case sportsDrink = "Sports Drink"
        case juice = "Juice/Juice Drink"
        case coffee = "Coffee Drink"
        case tea = "Tea/Iced Tea"
        case water = "Enhanced Water"
        case smoothie = "Smoothie"
        case other = "Other"
        
        var icon: String {
            switch self {
            case .soda: return "bubbles.and.sparkles"
            case .energyDrink: return "bolt.fill"
            case .sportsDrink: return "figure.run"
            case .juice: return "leaf.fill"
            case .coffee: return "cup.and.saucer.fill"
            case .tea: return "mug.fill"
            case .water: return "drop.fill"
            case .smoothie: return "carrot.fill"
            case .other: return "takeoutbag.and.cup.and.straw.fill"
            }
        }
        
        var color: Color {
            switch self {
            case .soda: return .brown
            case .energyDrink: return .green
            case .sportsDrink: return .orange
            case .juice: return .yellow
            case .coffee: return Color(hex: "#8B4513")
            case .tea: return Color(hex: "#DAA520")
            case .water: return .cyan
            case .smoothie: return .pink
            case .other: return .gray
            }
        }
    }
    
    enum DangerLevel: Int, Codable {
        case caution = 1
        case warning = 2
        case danger = 3
        case severe = 4
        case toxic = 5
        
        var name: String {
            switch self {
            case .caution: return "Caution"
            case .warning: return "Warning"
            case .danger: return "Danger"
            case .severe: return "Severe"
            case .toxic: return "Toxic"
            }
        }
        
        var color: Color {
            switch self {
            case .caution: return .yellow
            case .warning: return .orange
            case .danger: return Color(hex: "#FF6B35")
            case .severe: return .red
            case .toxic: return Color(hex: "#8B0000")
            }
        }
    }
    
    struct HarmfulIngredient: Identifiable, Codable {
        var id: String { name }
        let name: String
        let effect: String
    }
}

// MARK: - Toxic Drinks Database

class ToxicDrinksDatabase: ObservableObject {
    static let shared = ToxicDrinksDatabase()
    
    @Published var drinks: [ToxicDrink] = []
    
    init() {
        loadDrinks()
    }
    
    private func loadDrinks() {
        drinks = [
            // SODAS
            ToxicDrink(
                id: "coca_cola",
                name: "Coca-Cola",
                brand: "The Coca-Cola Company",
                category: .soda,
                dangerLevel: .severe,
                sugarGrams: 39,
                artificialSweeteners: [],
                harmfulIngredients: [
                    .init(name: "High Fructose Corn Syrup", effect: "Liver damage, obesity, diabetes"),
                    .init(name: "Phosphoric Acid", effect: "Bone density loss, tooth decay"),
                    .init(name: "Caramel Color (4-MEI)", effect: "Potential carcinogen"),
                    .init(name: "Natural Flavors", effect: "Undisclosed chemicals")
                ],
                healthEffects: [
                    "Spikes blood sugar within 20 minutes",
                    "Caffeine blocks adenosine, preventing tiredness",
                    "Phosphoric acid binds calcium, magnesium, zinc",
                    "Sugar crash after 60 minutes triggers craving for more"
                ],
                marketingClaim: "Open Happiness",
                reality: "Open diabetes, obesity, and addiction. One can = 10 teaspoons of sugar.",
                healthierAlternative: "Sparkling water with lemon"
            ),
            
            ToxicDrink(
                id: "diet_coke",
                name: "Diet Coke",
                brand: "The Coca-Cola Company",
                category: .soda,
                dangerLevel: .severe,
                sugarGrams: 0,
                artificialSweeteners: ["Aspartame", "Acesulfame-K"],
                harmfulIngredients: [
                    .init(name: "Aspartame", effect: "Neurotoxin, breaks down into methanol and formaldehyde"),
                    .init(name: "Acesulfame-K", effect: "Possible carcinogen, contains methylene chloride"),
                    .init(name: "Phosphoric Acid", effect: "Bone density loss"),
                    .init(name: "Caramel Color", effect: "Contains 4-MEI, a potential carcinogen")
                ],
                healthEffects: [
                    "Tricks brain but body still expects sugar",
                    "May increase appetite and cravings",
                    "Disrupts gut microbiome",
                    "Associated with stroke and dementia risk"
                ],
                marketingClaim: "Zero Sugar, Zero Calories",
                reality: "Zero sugar, maximum chemicals. Aspartame is classified as 'possibly carcinogenic' by WHO.",
                healthierAlternative: "Sparkling water with fresh fruit"
            ),
            
            ToxicDrink(
                id: "mountain_dew",
                name: "Mountain Dew",
                brand: "PepsiCo",
                category: .soda,
                dangerLevel: .toxic,
                sugarGrams: 46,
                artificialSweeteners: [],
                harmfulIngredients: [
                    .init(name: "High Fructose Corn Syrup", effect: "46g sugar - almost 12 teaspoons"),
                    .init(name: "Brominated Vegetable Oil (BVO)", effect: "Banned in EU/Japan, accumulates in tissues"),
                    .init(name: "Yellow 5 (Tartrazine)", effect: "Hyperactivity, allergies, possibly lowers sperm count"),
                    .init(name: "Sodium Benzoate", effect: "Forms benzene with Vitamin C")
                ],
                healthEffects: [
                    "BVO can cause skin lesions, memory loss, nerve disorders",
                    "Yellow 5 linked to behavioral issues in children",
                    "Extreme caffeine (54mg) plus sugar = addiction",
                    "'Mountain Dew Mouth' - severe tooth decay in Appalachia"
                ],
                marketingClaim: "Do the Dew",
                reality: "Contains an ingredient banned in over 100 countries. 'Mountain Dew Mouth' is a documented condition.",
                healthierAlternative: "Lemon-lime sparkling water"
            ),
            
            ToxicDrink(
                id: "sprite",
                name: "Sprite",
                brand: "The Coca-Cola Company",
                category: .soda,
                dangerLevel: .danger,
                sugarGrams: 38,
                artificialSweeteners: [],
                harmfulIngredients: [
                    .init(name: "High Fructose Corn Syrup", effect: "38g sugar per can"),
                    .init(name: "Sodium Citrate", effect: "Can trigger migraines in sensitive individuals"),
                    .init(name: "Natural Flavors", effect: "Undisclosed chemical cocktail")
                ],
                healthEffects: [
                    "Nearly 10 teaspoons of sugar",
                    "Blood sugar spike and crash",
                    "Acidic pH damages tooth enamel",
                    "No nutritional value"
                ],
                marketingClaim: "Obey Your Thirst",
                reality: "Obey your dentist instead. Pure sugar water with lemon-lime flavor.",
                healthierAlternative: "Sparkling water with lime"
            ),
            
            // ENERGY DRINKS
            ToxicDrink(
                id: "red_bull",
                name: "Red Bull",
                brand: "Red Bull GmbH",
                category: .energyDrink,
                dangerLevel: .severe,
                sugarGrams: 27,
                artificialSweeteners: [],
                harmfulIngredients: [
                    .init(name: "Caffeine (80mg)", effect: "Cardiovascular stress when combined with sugar"),
                    .init(name: "Taurine", effect: "Effects unknown with high caffeine"),
                    .init(name: "Sucrose & Glucose", effect: "27g sugar spikes insulin"),
                    .init(name: "Artificial Colors", effect: "Behavioral effects")
                ],
                healthEffects: [
                    "Immediate blood pressure and heart rate increase",
                    "Blood becomes 'stickier' within hour of consumption",
                    "Sugar crash leads to fatigue worse than before",
                    "Linked to cardiac events in young people"
                ],
                marketingClaim: "Red Bull Gives You Wings",
                reality: "Red Bull gives you cardiovascular stress. Banned or restricted in several countries.",
                healthierAlternative: "Green tea, black coffee, or a good night's sleep"
            ),
            
            ToxicDrink(
                id: "monster",
                name: "Monster Energy",
                brand: "Monster Beverage Corporation",
                category: .energyDrink,
                dangerLevel: .toxic,
                sugarGrams: 54,
                artificialSweeteners: [],
                harmfulIngredients: [
                    .init(name: "Caffeine (160mg)", effect: "Double Red Bull's caffeine"),
                    .init(name: "High Fructose Corn Syrup", effect: "54g sugar - 13.5 teaspoons"),
                    .init(name: "Sodium Benzoate", effect: "Forms benzene, preservative concerns"),
                    .init(name: "Artificial Flavors", effect: "Unknown chemical cocktail"),
                    .init(name: "Sucralose", effect: "Gut microbiome damage")
                ],
                healthEffects: [
                    "Linked to multiple deaths from cardiac arrest",
                    "160mg caffeine per can (4x coffee)",
                    "Combination of stimulants creates synergistic risk",
                    "Extremely addictive combination"
                ],
                marketingClaim: "Unleash the Beast",
                reality: "Unleash a heart attack. Multiple wrongful death lawsuits filed.",
                healthierAlternative: "B-vitamin complex and proper sleep"
            ),
            
            ToxicDrink(
                id: "bang",
                name: "Bang Energy",
                brand: "Vital Pharmaceuticals",
                category: .energyDrink,
                dangerLevel: .toxic,
                sugarGrams: 0,
                artificialSweeteners: ["Sucralose", "Acesulfame-K"],
                harmfulIngredients: [
                    .init(name: "Caffeine (300mg)", effect: "Nearly 4x a cup of coffee"),
                    .init(name: "Sucralose", effect: "Gut microbiome disruption"),
                    .init(name: "Acesulfame-K", effect: "Possible carcinogen"),
                    .init(name: "Super Creatine", effect: "False claims - it's not creatine")
                ],
                healthEffects: [
                    "300mg caffeine can cause anxiety, jitters, heart palpitations",
                    "False marketing claims about 'Super Creatine'",
                    "Artificial sweeteners affect insulin response",
                    "Extreme cardiovascular stress"
                ],
                marketingClaim: "Potent Brain & Body Fuel",
                reality: "Company sued for false advertising. 300mg caffeine is dangerous for many.",
                healthierAlternative: "Matcha tea or cold brew coffee"
            ),
            
            // SPORTS DRINKS
            ToxicDrink(
                id: "gatorade",
                name: "Gatorade",
                brand: "PepsiCo",
                category: .sportsDrink,
                dangerLevel: .warning,
                sugarGrams: 36,
                artificialSweeteners: [],
                harmfulIngredients: [
                    .init(name: "Sugar/Dextrose", effect: "36g sugar - designed for elite athletes, not desk workers"),
                    .init(name: "Artificial Colors (Yellow 5, Blue 1)", effect: "Hyperactivity, allergies"),
                    .init(name: "Brominated Vegetable Oil", effect: "Removed 2013, was in some flavors"),
                    .init(name: "Modified Food Starch", effect: "Usually from GMO corn")
                ],
                healthEffects: [
                    "Only beneficial if exercising intensely for 60+ minutes",
                    "For most people, it's just expensive sugar water",
                    "Artificial colors linked to behavioral issues",
                    "Acidic pH damages tooth enamel"
                ],
                marketingClaim: "Is It In You?",
                reality: "Only needed for intense athletics. For average people, it's colored sugar water.",
                healthierAlternative: "Water with a pinch of sea salt and lemon"
            ),
            
            ToxicDrink(
                id: "powerade",
                name: "Powerade",
                brand: "The Coca-Cola Company",
                category: .sportsDrink,
                dangerLevel: .warning,
                sugarGrams: 34,
                artificialSweeteners: [],
                harmfulIngredients: [
                    .init(name: "High Fructose Corn Syrup", effect: "34g sugar per bottle"),
                    .init(name: "Artificial Colors", effect: "Blue 1, Yellow 5, Yellow 6"),
                    .init(name: "Sodium Hexametaphosphate", effect: "Emulsifier with limited safety data")
                ],
                healthEffects: [
                    "Same issues as Gatorade",
                    "HFCS is worse than regular sugar",
                    "Artificial colors are concerning",
                    "Not needed for normal hydration"
                ],
                marketingClaim: "Power Through",
                reality: "Power through what? A dental appointment for cavities?",
                healthierAlternative: "Coconut water or water with electrolyte tablets"
            ),
            
            // JUICE DRINKS
            ToxicDrink(
                id: "sunny_d",
                name: "Sunny D",
                brand: "Harvest Hill Beverage Company",
                category: .juice,
                dangerLevel: .severe,
                sugarGrams: 27,
                artificialSweeteners: [],
                harmfulIngredients: [
                    .init(name: "High Fructose Corn Syrup", effect: "Main ingredient after water"),
                    .init(name: "Corn Syrup", effect: "Additional sugar on top of HFCS"),
                    .init(name: "Yellow 5 & 6", effect: "Artificial colors linked to hyperactivity"),
                    .init(name: "Contains only 2% juice", effect: "It's basically orange-colored sugar water")
                ],
                healthEffects: [
                    "Only 2% real orange juice",
                    "Can turn skin yellow/orange if consumed excessively",
                    "Blood sugar spike with minimal nutrition",
                    "Children think it's healthy juice"
                ],
                marketingClaim: "The Good Stuff Kids Go For",
                reality: "2% juice, 98% sugar water and chemicals. Not juice.",
                healthierAlternative: "Fresh-squeezed orange juice or whole oranges"
            ),
            
            ToxicDrink(
                id: "capri_sun",
                name: "Capri Sun",
                brand: "Kraft Heinz",
                category: .juice,
                dangerLevel: .danger,
                sugarGrams: 18,
                artificialSweeteners: [],
                harmfulIngredients: [
                    .init(name: "High Fructose Corn Syrup", effect: "Main sweetener"),
                    .init(name: "Citric Acid", effect: "Tooth enamel erosion"),
                    .init(name: "Natural Flavor", effect: "Undisclosed chemicals"),
                    .init(name: "Minimal Juice Content", effect: "Varies by variety, often under 10%")
                ],
                healthEffects: [
                    "Marketed to children but loaded with sugar",
                    "Mold contamination recalls",
                    "Tooth decay from sugar and acid",
                    "Children drink multiple pouches"
                ],
                marketingClaim: "Made With Real Fruit Juice",
                reality: "Made WITH juice doesn't mean made OF juice. Mostly sugar water.",
                healthierAlternative: "Actual fruit or water"
            ),
            
            ToxicDrink(
                id: "tropicana",
                name: "Tropicana Orange Juice",
                brand: "PepsiCo",
                category: .juice,
                dangerLevel: .caution,
                sugarGrams: 22,
                artificialSweeteners: [],
                harmfulIngredients: [
                    .init(name: "Natural Sugars", effect: "22g sugar per glass - equal to soda"),
                    .init(name: "Flavor Packs", effect: "Added back to 'not from concentrate' juice"),
                    .init(name: "Pasteurization", effect: "Kills nutrients along with bacteria")
                ],
                healthEffects: [
                    "Even '100% juice' has as much sugar as soda",
                    "Fiber is removed, leaving only sugar",
                    "'Flavor packs' add engineered tastes back",
                    "Blood sugar spikes without fiber to slow absorption"
                ],
                marketingClaim: "100% Pure Orange Juice",
                reality: "100% of the fiber removed. 'Flavor packs' are added. It's processed.",
                healthierAlternative: "Eat a whole orange instead"
            ),
            
            // COFFEE DRINKS
            ToxicDrink(
                id: "frappuccino",
                name: "Starbucks Frappuccino (Bottled)",
                brand: "Starbucks/PepsiCo",
                category: .coffee,
                dangerLevel: .danger,
                sugarGrams: 45,
                artificialSweeteners: [],
                harmfulIngredients: [
                    .init(name: "Sugar", effect: "45g per bottle - 11 teaspoons"),
                    .init(name: "Carrageenan", effect: "Gut inflammation"),
                    .init(name: "Natural Flavors", effect: "Undisclosed chemicals"),
                    .init(name: "Sodium Caseinate", effect: "Dairy derivative, allergen")
                ],
                healthEffects: [
                    "More sugar than a candy bar",
                    "Caffeine + sugar creates addiction cycle",
                    "Empty calories",
                    "Carrageenan linked to digestive issues"
                ],
                marketingClaim: "Coffee Experience On The Go",
                reality: "Milkshake experience on the go. 45g of sugar per bottle.",
                healthierAlternative: "Cold brew with a splash of real cream"
            ),
            
            // ENHANCED WATERS
            ToxicDrink(
                id: "vitaminwater",
                name: "Vitaminwater",
                brand: "The Coca-Cola Company",
                category: .water,
                dangerLevel: .danger,
                sugarGrams: 32,
                artificialSweeteners: [],
                harmfulIngredients: [
                    .init(name: "Crystalline Fructose", effect: "Processed fructose, worse than HFCS"),
                    .init(name: "Cane Sugar", effect: "32g sugar total"),
                    .init(name: "Artificial Colors", effect: "Added for visual appeal"),
                    .init(name: "Synthetic Vitamins", effect: "Poor absorption compared to food")
                ],
                healthEffects: [
                    "Coca-Cola's lawyer said 'no consumer could reasonably be misled into thinking Vitaminwater was a healthy beverage'",
                    "32g sugar negates any vitamin benefit",
                    "Crystalline fructose may be worse than HFCS",
                    "Creates false health halo"
                ],
                marketingClaim: "Hydrate and Nourish",
                reality: "Coca-Cola's own lawyers admitted no one should think it's healthy.",
                healthierAlternative: "Plain water + a multivitamin"
            ),
            
            // TEA DRINKS
            ToxicDrink(
                id: "arizona_iced_tea",
                name: "Arizona Iced Tea",
                brand: "Arizona Beverages",
                category: .tea,
                dangerLevel: .danger,
                sugarGrams: 51,
                artificialSweeteners: [],
                harmfulIngredients: [
                    .init(name: "High Fructose Corn Syrup", effect: "51g sugar in the large can"),
                    .init(name: "Citric Acid", effect: "Tooth enamel erosion"),
                    .init(name: "Natural Flavors", effect: "Undisclosed")
                ],
                healthEffects: [
                    "51g sugar = 13 teaspoons per can",
                    "More sugar than most sodas",
                    "Large 23oz can consumed in one sitting",
                    "'Tea' health halo is misleading"
                ],
                marketingClaim: "Real Brewed Tea",
                reality: "Real brewed sugar water with tea flavoring.",
                healthierAlternative: "Home-brewed iced tea with a little honey"
            ),
            
            ToxicDrink(
                id: "snapple",
                name: "Snapple",
                brand: "Keurig Dr Pepper",
                category: .tea,
                dangerLevel: .danger,
                sugarGrams: 40,
                artificialSweeteners: [],
                harmfulIngredients: [
                    .init(name: "Sugar", effect: "40g per bottle"),
                    .init(name: "Citric Acid", effect: "Enamel erosion"),
                    .init(name: "Natural Flavors", effect: "Unknown chemicals")
                ],
                healthEffects: [
                    "40g sugar = 10 teaspoons",
                    "'Made from the best stuff on earth' is marketing",
                    "Perceived as healthier than soda but isn't",
                    "Blood sugar spike"
                ],
                marketingClaim: "Made From The Best Stuff On Earth",
                reality: "The best stuff on earth is 40 grams of sugar?",
                healthierAlternative: "Unsweetened iced tea"
            ),
            
            // SMOOTHIES
            ToxicDrink(
                id: "naked_juice",
                name: "Naked Juice",
                brand: "PepsiCo",
                category: .smoothie,
                dangerLevel: .warning,
                sugarGrams: 53,
                artificialSweeteners: [],
                harmfulIngredients: [
                    .init(name: "Concentrated Fruit Sugars", effect: "53g sugar - all 'natural' but still sugar"),
                    .init(name: "Soy Ingredients", effect: "Usually GMO soy"),
                    .init(name: "Synthetic Vitamins", effect: "Added back after processing")
                ],
                healthEffects: [
                    "53g sugar is more than most sodas",
                    "'All natural' doesn't mean healthy",
                    "Fiber removed during processing",
                    "Class action lawsuit over 'all natural' claims"
                ],
                marketingClaim: "No Sugar Added - All Natural",
                reality: "No sugar ADDED because it's already 53g of fruit sugar. Settled lawsuit for $9M.",
                healthierAlternative: "Homemade smoothie with whole fruit and vegetables"
            ),
            
            ToxicDrink(
                id: "odwalla",
                name: "Odwalla",
                brand: "The Coca-Cola Company (discontinued 2020)",
                category: .smoothie,
                dangerLevel: .warning,
                sugarGrams: 49,
                artificialSweeteners: [],
                harmfulIngredients: [
                    .init(name: "Fruit Sugar Concentrate", effect: "49g sugar"),
                    .init(name: "Flash Pasteurization", effect: "Destroys some nutrients")
                ],
                healthEffects: [
                    "E. coli outbreak in 1996 killed a child",
                    "49g sugar per bottle",
                    "Discontinued in 2020",
                    "Health halo was misleading"
                ],
                marketingClaim: "Nourishing The Body Whole",
                reality: "Discontinued after years of being glorified sugar water.",
                healthierAlternative: "Make your own smoothie with whole fruits"
            )
        ]
    }
    
    // MARK: - Query Functions
    
    func getDrinksByCategory(_ category: ToxicDrink.DrinkCategory) -> [ToxicDrink] {
        drinks.filter { $0.category == category }
    }
    
    func getWorstDrinks(count: Int = 5) -> [ToxicDrink] {
        Array(drinks.sorted { $0.dangerLevel.rawValue > $1.dangerLevel.rawValue }.prefix(count))
    }
    
    func getDrinksBySugarContent(minGrams: Double) -> [ToxicDrink] {
        drinks.filter { $0.sugarGrams >= minGrams }.sorted { $0.sugarGrams > $1.sugarGrams }
    }
    
    func searchDrinks(_ query: String) -> [ToxicDrink] {
        let searchTerm = query.lowercased()
        return drinks.filter {
            $0.name.lowercased().contains(searchTerm) ||
            $0.brand.lowercased().contains(searchTerm)
        }
    }
}
