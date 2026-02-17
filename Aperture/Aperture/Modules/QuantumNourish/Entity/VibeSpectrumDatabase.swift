// VibeSpectrumDatabase.swift
// THE VIBE SPECTRUM — Complete Food Frequency Database
// ☀️ SunFlow: Reignited
// Based on bioresonance research, Tainio Technology, and esoteric nutrition

import SwiftUI

class VibeSpectrumDatabase: ObservableObject {
  static let shared = VibeSpectrumDatabase()

  @Published var allFoods: [QuantumFood] = []

  init() {
    allFoods = Self.buildDatabase()
    loadExtended()
  }

  // MARK: - Queries

  func foods(for tier: FrequencyTier) -> [QuantumFood] {
    allFoods.filter { $0.tier == tier }
  }

  func foods(for category: FoodCategory) -> [QuantumFood] {
    allFoods.filter { $0.category == category }
  }

  func search(_ query: String) -> [QuantumFood] {
    let q = query.lowercased()
    return allFoods.filter {
      $0.name.lowercased().contains(q) || $0.effects.joined().lowercased().contains(q)
        || $0.category.rawValue.lowercased().contains(q)
    }
  }

  func pinealFoods() -> [QuantumFood] {
    allFoods.filter { $0.pinealImpact == .activates || $0.pinealImpact == .decalcifies }
  }

  func destroyers() -> [QuantumFood] {
    allFoods.filter { $0.tier == .destructive || $0.tier == .acidic }
  }

  func highVibeElite() -> [QuantumFood] {
    allFoods.filter { $0.tier == .high || $0.tier == .superHigh }
  }

  /// Match ingredient text against known items
  func matchIngredient(_ ingredient: String) -> QuantumFood? {
    let clean = ingredient.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
    return allFoods.first {
      $0.name.lowercased() == clean
        || $0.effects.contains(where: { $0.lowercased().contains(clean) })
    }
  }

  // MARK: - Build Database

  private static func buildDatabase() -> [QuantumFood] {
    var foods: [QuantumFood] = []

    // ═══════════════════════════════════════════════════════
    // DESTRUCTIVE TIER (0-5 MHz) — CONSCIOUSNESS KILLERS
    // ═══════════════════════════════════════════════════════

    foods.append(contentsOf: [
      QuantumFood(
        id: "fluoride", name: "Fluoride (in water/toothpaste)", tier: .destructive, mhzEstimate: 0,
        category: .additive,
        effects: [
          "Calcifies pineal gland", "Neurotoxin at cumulative doses", "Disrupts thyroid function",
          "Lowers IQ in studies",
        ],
        avoidReasons: [
          "Added to 70%+ of US water supply", "Found in non-organic tea",
          "In most commercial toothpaste",
        ],
        alternatives: [
          "Spring water", "Reverse osmosis water", "Fluoride-free toothpaste",
          "Hydroxyapatite toothpaste",
        ],
        quantumNote:
          "Fluoride is the #1 pineal calcifier. The pineal gland accumulates more fluoride than any other tissue in the body. A calcified pineal = a closed third eye. This isn't conspiracy — it's published endocrinology.",
        pinealImpact: .calcifies, gutBrainScore: -2),

      QuantumFood(
        id: "aspartame", name: "Aspartame (NutraSweet, Equal)", tier: .destructive, mhzEstimate: 0,
        category: .additive,
        effects: [
          "Excitotoxin — overstimulates neurons to death", "Converts to formaldehyde in body",
          "Disrupts serotonin production", "Linked to headaches, seizures, mood disorders",
        ],
        avoidReasons: ["In 6,000+ products", "Diet sodas", "Sugar-free gum", "Low-calorie foods"],
        alternatives: ["Raw honey", "Stevia leaf", "Monk fruit", "Dates"],
        quantumNote:
          "Aspartame breaks down into methanol → formaldehyde → formic acid in your body. You are literally embalming yourself from the inside. Every 'diet' product is a consciousness suppressant.",
        pinealImpact: .calcifies, gutBrainScore: -3),

      QuantumFood(
        id: "msg", name: "MSG (Monosodium Glutamate)", tier: .destructive, mhzEstimate: 0,
        category: .additive,
        effects: [
          "Excitotoxin", "Overstimulates glutamate receptors", "Causes inflammation",
          "Hidden under 40+ names on labels",
        ],
        avoidReasons: [
          "Most processed foods", "Restaurant food", "Chips, snacks",
          "Disguised as 'natural flavors'",
        ],
        alternatives: ["Nutritional yeast", "Sea salt", "Herbs & spices", "Coconut aminos"],
        quantumNote:
          "MSG is hidden under names like 'hydrolyzed protein,' 'autolyzed yeast extract,' 'natural flavoring,' and 'calcium caseinate.' Learn the 40+ aliases. They're hiding a neurotoxin in plain sight.",
        pinealImpact: .calcifies, gutBrainScore: -3),

      QuantumFood(
        id: "hfcs", name: "High Fructose Corn Syrup", tier: .destructive, mhzEstimate: 1,
        category: .additive,
        effects: [
          "Mercury contamination from processing", "Bypasses satiety signals",
          "Fatty liver disease", "Insulin resistance",
        ],
        avoidReasons: ["Sodas", "Bread", "Cereals", "Condiments", "Most packaged foods"],
        alternatives: ["Raw honey", "Maple syrup", "Coconut sugar", "Blackstrap molasses"],
        quantumNote:
          "HFCS is not 'just sugar.' The mercury-contaminated processing and the way it bypasses your body's fullness signals make it a metabolic weapon. It's in everything because it's cheap to produce and addictive by design.",
        pinealImpact: .calcifies, gutBrainScore: -3),

      QuantumFood(
        id: "hydrogenated_oils", name: "Hydrogenated / Trans Fats", tier: .destructive,
        mhzEstimate: 0,
        category: .oil,
        effects: [
          "Destroys cell membrane integrity", "Blocks nutrient absorption", "Chronic inflammation",
          "Heart disease",
        ],
        avoidReasons: [
          "Margarine", "Fried fast food", "Commercial baked goods", "Non-dairy creamers",
        ],
        alternatives: ["Coconut oil", "Olive oil", "Ghee", "Avocado oil"],
        quantumNote:
          "Your cell membranes are made of fat. When you eat hydrogenated fats, your body uses them to build cell walls — but they're the WRONG shape. Your cells become rigid, can't communicate properly, and nutrients can't get in. You're building your body with broken bricks.",
        pinealImpact: .calcifies, gutBrainScore: -3),

      QuantumFood(
        id: "aluminum", name: "Aluminum (in food/products)", tier: .destructive, mhzEstimate: 0,
        category: .additive,
        effects: [
          "Neurotoxin", "Crosses blood-brain barrier", "Linked to cognitive decline",
          "Accumulates in pineal gland",
        ],
        avoidReasons: [
          "Antacids", "Aluminum cookware", "Some baking powders", "Commercial deodorant",
        ],
        alternatives: [
          "Stainless steel cookware", "Aluminum-free baking powder", "Natural deodorant",
        ],
        quantumNote:
          "Aluminum accumulates in the brain and pineal gland over a lifetime. Every antacid tablet, every meal cooked in aluminum foil, every swipe of commercial deodorant adds to the total load. The body has no biological use for aluminum — it's pure contamination.",
        pinealImpact: .calcifies, gutBrainScore: -2),
    ])

    // ═══════════════════════════════════════════════════════
    // ACIDIC TIER (5-10 MHz) — ENERGY DRAINERS
    // ═══════════════════════════════════════════════════════

    foods.append(contentsOf: [
      QuantumFood(
        id: "alcohol", name: "Alcohol", tier: .acidic, mhzEstimate: 5,
        category: .beverage,
        effects: [
          "Dissolves myelin sheath (nerve insulation)", "Disrupts gut microbiome",
          "Lowers vibrational frequency for 72+ hours", "Depletes B vitamins, magnesium, zinc",
        ],
        avoidReasons: ["All forms — beer, wine, spirits"],
        alternatives: [
          "Kombucha", "Kava tea", "Sparkling water with herbs", "Cacao ceremony drink",
        ],
        quantumNote:
          "In Arabic, alcohol = 'al-kuhl' = 'body-eating spirit.' The ancients knew. Alcohol literally means 'spirit' — and it opens your energetic field to lower frequencies while shutting down your higher faculties. There's a reason every spiritual tradition eventually restricts it.",
        pinealImpact: .calcifies, gutBrainScore: -3),

      QuantumFood(
        id: "processed_meat", name: "Processed Meats", tier: .acidic, mhzEstimate: 5,
        category: .protein,
        effects: [
          "Nitrates convert to carcinogenic nitrosamines", "Extremely acidic",
          "No life force — zero biophotonic activity",
          "Contains suffering frequency from factory farming",
        ],
        avoidReasons: ["Hot dogs", "Bacon", "Deli meats", "Sausages"],
        alternatives: ["Organic free-range poultry", "Wild-caught fish", "Hemp seeds", "Tempeh"],
        quantumNote:
          "Dead food carries the frequency of death. Factory-farmed meat carries the electromagnetic imprint of suffering, fear, and confinement. You're not just eating protein — you're absorbing the energetic signature of how that animal lived and died.",
        pinealImpact: .neutral, gutBrainScore: -2),

      QuantumFood(
        id: "soda", name: "Soda / Soft Drinks", tier: .acidic, mhzEstimate: 3,
        category: .beverage,
        effects: [
          "Phosphoric acid leaches calcium from bones", "Sugar crash destroys focus",
          "Acidifies entire system", "Caramel color = carcinogen",
        ],
        avoidReasons: ["All commercial sodas — diet and regular"],
        alternatives: [
          "Sparkling mineral water", "Fresh-squeezed citrus", "Herbal infusions", "Coconut water",
        ],
        quantumNote:
          "A can of Coca-Cola has a pH of 2.5 — acidic enough to dissolve a nail. Your blood needs to maintain pH 7.35-7.45 to survive. Every soda forces your body to sacrifice alkaline minerals (calcium, magnesium) to neutralize the acid. You're dissolving yourself.",
        pinealImpact: .calcifies, gutBrainScore: -3),

      QuantumFood(
        id: "white_sugar", name: "Refined White Sugar", tier: .acidic, mhzEstimate: 5,
        category: .additive,
        effects: [
          "Feeds candida/parasites", "Spikes insulin → crash", "Inflammatory", "Depletes minerals",
          "Addictive as cocaine in studies",
        ],
        avoidReasons: ["In 80%+ of packaged foods"],
        alternatives: ["Raw honey", "Coconut sugar", "Dates", "Stevia leaf"],
        quantumNote:
          "Sugar is the control frequency. It keeps you oscillating between high and crash, never stable, always craving. A population addicted to sugar is a population that can't think clearly, can't meditate, can't sit still long enough to question anything.",
        pinealImpact: .calcifies, gutBrainScore: -2),

      QuantumFood(
        id: "fast_food", name: "Fast Food (General)", tier: .acidic, mhzEstimate: 3,
        category: .processed,
        effects: [
          "Combination of every low-frequency ingredient",
          "MSG + HFCS + trans fats + preservatives", "Near-zero nutritional value",
          "Engineered for addiction",
        ],
        avoidReasons: ["All major fast food chains"],
        alternatives: [
          "Home-cooked meals", "Local organic restaurants", "Meal prep with real ingredients",
        ],
        quantumNote:
          "Fast food is engineered by food scientists to hit your brain's reward centers as hard as possible while providing as little nutrition as possible. It's not food — it's a delivery system for addictive chemicals wrapped in advertising.",
        pinealImpact: .calcifies, gutBrainScore: -3),
    ])

    // ═══════════════════════════════════════════════════════
    // LOW TIER (10-15 MHz)
    // ═══════════════════════════════════════════════════════

    foods.append(contentsOf: [
      QuantumFood(
        id: "white_flour", name: "White Flour / Refined Grains", tier: .low, mhzEstimate: 10,
        category: .grain,
        effects: [
          "Stripped of all nutrients", "Spikes blood sugar like sugar", "Mucus-forming",
          "Often bleached with chlorine gas",
        ],
        avoidReasons: ["White bread", "Pasta", "Most crackers", "Commercial baked goods"],
        alternatives: ["Sprouted grain bread", "Quinoa", "Buckwheat", "Almond flour"],
        quantumNote:
          "White flour has been stripped of the bran (fiber), germ (nutrients), and bleached. What remains is pure starch — essentially sugar in a different form. Then they 'enrich' it by adding back synthetic vitamins. You're eating a ghost of what wheat once was.",
        pinealImpact: .neutral, gutBrainScore: -1),

      QuantumFood(
        id: "pasteurized_dairy", name: "Pasteurized Dairy", tier: .low, mhzEstimate: 12,
        category: .dairy,
        effects: [
          "Enzymes destroyed by pasteurization", "Mucus-forming", "Hormone and antibiotic residues",
          "Casein difficult to digest",
        ],
        avoidReasons: ["Most commercial milk", "Cheese", "Yogurt", "Ice cream"],
        alternatives: [
          "Raw dairy (if legal/available)", "Coconut milk", "Almond milk", "Oat milk",
        ],
        quantumNote:
          "Raw milk is alive — full of enzymes, probiotics, and nutrients. Pasteurization kills everything. What you're drinking from the store is dead white liquid with synthetic vitamin D added back in. The dairy industry sells you death and calls it calcium.",
        pinealImpact: .neutral, gutBrainScore: -1),

      QuantumFood(
        id: "conventional_eggs", name: "Conventional Eggs", tier: .low, mhzEstimate: 13,
        category: .protein,
        effects: [
          "Hormone/antibiotic residues", "Lower omega-3 than pastured", "Caged hen stress hormones",
        ],
        avoidReasons: ["Factory farmed eggs"],
        alternatives: ["Pastured/free-range eggs", "Duck eggs", "Quail eggs"],
        quantumNote:
          "A hen in a cage produces eggs with a different electromagnetic signature than a hen in sunlight eating bugs. The nutrition label might look similar, but the frequency is not the same. How the animal lived is stored in what it produces.",
        pinealImpact: .neutral, gutBrainScore: 0),

      QuantumFood(
        id: "coffee_conventional", name: "Conventional Coffee", tier: .low, mhzEstimate: 12,
        category: .beverage,
        effects: [
          "Adrenal fatigue with chronic use", "Acidic", "One of most pesticide-sprayed crops",
          "Blocks adenosine → sleep disruption",
        ],
        avoidReasons: ["Non-organic coffee", "Coffee with sugar/creamers"],
        alternatives: [
          "Organic shade-grown coffee", "Cacao drink", "Lion's mane tea", "Chicory root",
        ],
        quantumNote:
          "Coffee borrows energy from tomorrow. It doesn't CREATE energy — it blocks the signal that tells you you're tired. Over time, you need more to feel less. It's a loan shark disguised as a friend.",
        pinealImpact: .neutral, gutBrainScore: -1),
    ])

    // ═══════════════════════════════════════════════════════
    // NEUTRAL TIER (15-25 MHz)
    // ═══════════════════════════════════════════════════════

    foods.append(contentsOf: [
      QuantumFood(
        id: "rice", name: "Brown Rice / Wild Rice", tier: .neutral, mhzEstimate: 20,
        category: .grain,
        effects: [
          "Grounding", "Good energy source", "Contains some arsenic (rinse well)",
          "Slow-burning carb",
        ],
        avoidReasons: [], alternatives: ["Quinoa", "Millet", "Amaranth"],
        quantumNote:
          "Rice is the foundation grain of most awakened cultures (Japan, India, Southeast Asia). It grounds without suppressing. Wild rice and black rice carry higher frequencies than white.",
        pinealImpact: .neutral, gutBrainScore: 0),

      QuantumFood(
        id: "beans", name: "Beans & Lentils", tier: .neutral, mhzEstimate: 22,
        category: .grain,
        effects: ["Plant protein", "High fiber", "Prebiotic", "Grounding"],
        avoidReasons: [], alternatives: [],
        quantumNote:
          "Beans are among the most ancient human foods. They ground the energy body while providing steady fuel. Soak and sprout them to unlock maximum life force.",
        pinealImpact: .neutral, gutBrainScore: 1),

      QuantumFood(
        id: "kale", name: "Kale", tier: .neutral, mhzEstimate: 25,
        category: .vegetable,
        effects: [
          "Rich in vitamins K, A, C", "Detoxifying", "Cancer-protective compounds", "Good fiber",
        ],
        avoidReasons: [], alternatives: [],
        quantumNote:
          "Kale sits at the threshold between neutral and elevating. Raw kale carries more life force than cooked. Massage it with lemon and olive oil to break down oxalates and unlock nutrients.",
        pinealImpact: .supports, gutBrainScore: 1),
    ])

    // ═══════════════════════════════════════════════════════
    // MEDIUM LOW TIER (25-50 MHz)
    // ═══════════════════════════════════════════════════════

    foods.append(contentsOf: [
      QuantumFood(
        id: "apples", name: "Organic Apples", tier: .mediumLow, mhzEstimate: 30,
        category: .fruit,
        effects: [
          "Pectin feeds good gut bacteria", "Quercetin (anti-inflammatory)", "Detoxifying",
          "Hydrating",
        ],
        avoidReasons: [], alternatives: [],
        quantumNote:
          "An apple a day keeps the doctor away' isn't just folk wisdom — pectin is one of the most powerful prebiotics known. It selectively feeds the gut bacteria that produce serotonin. Your happiness literally starts in your gut.",
        pinealImpact: .supports, gutBrainScore: 2),

      QuantumFood(
        id: "blueberries", name: "Wild Blueberries", tier: .mediumLow, mhzEstimate: 40,
        category: .fruit,
        effects: [
          "Highest antioxidant fruit", "Crosses blood-brain barrier", "Neuroprotective",
          "Removes heavy metals",
        ],
        avoidReasons: [], alternatives: [],
        quantumNote:
          "Wild blueberries (not cultivated) contain up to 2x the antioxidants. They are one of the few foods that cross the blood-brain barrier and directly nourish brain tissue. They literally feed your consciousness hardware.",
        pinealImpact: .supports, gutBrainScore: 2),

      QuantumFood(
        id: "avocado", name: "Avocado", tier: .mediumLow, mhzEstimate: 35,
        category: .fruit,
        effects: [
          "Heart-healthy fats", "Boosts nutrient absorption", "Supports hormone production",
          "Satiating",
        ],
        avoidReasons: [], alternatives: [],
        quantumNote:
          "Avocado fat is the building block for every hormone in your body, including the ones that govern mood, sleep, and spiritual sensitivity. It's brain food in the most literal sense.",
        pinealImpact: .supports, gutBrainScore: 1),

      QuantumFood(
        id: "almonds", name: "Raw Almonds", tier: .mediumLow, mhzEstimate: 38,
        category: .protein,
        effects: ["Alkaline-forming", "High in magnesium", "Brain fuel", "Supports bones"],
        avoidReasons: [], alternatives: [],
        quantumNote:
          "Almonds are one of the few nuts that are alkaline-forming in the body. The magnesium content alone makes them a consciousness food — magnesium is involved in 300+ enzymatic reactions including neurotransmitter synthesis.",
        pinealImpact: .supports, gutBrainScore: 1),

      QuantumFood(
        id: "broccoli", name: "Broccoli (especially sprouts)", tier: .mediumLow, mhzEstimate: 42,
        category: .vegetable,
        effects: [
          "Sulforaphane — most potent natural detoxifier", "Anti-cancer", "Supports liver detox",
          "Gut healing",
        ],
        avoidReasons: [], alternatives: [],
        quantumNote:
          "Broccoli SPROUTS contain 50-100x more sulforaphane than mature broccoli. Sulforaphane activates your body's own detoxification pathways (Nrf2). It's your internal cleaning crew — and sprouts are the manager.",
        pinealImpact: .supports, gutBrainScore: 2),
    ])

    // ═══════════════════════════════════════════════════════
    // MEDIUM HIGH TIER (50-72 MHz) — AWAKENING FOODS
    // ═══════════════════════════════════════════════════════

    foods.append(contentsOf: [
      QuantumFood(
        id: "ginger", name: "Fresh Ginger", tier: .mediumHigh, mhzEstimate: 55,
        category: .herb,
        effects: [
          "Powerful anti-inflammatory", "Increases digestive fire", "Clears energy channels",
          "Enhances circulation",
        ],
        avoidReasons: [], alternatives: [],
        quantumNote:
          "In Ayurveda, ginger is called 'vishwabhesaj' — the universal medicine. It increases 'agni' (digestive fire), which in energetic terms means it accelerates the transformation of food into consciousness fuel.",
        pinealImpact: .supports, gutBrainScore: 2),

      QuantumFood(
        id: "turmeric", name: "Turmeric (with Black Pepper)", tier: .mediumHigh, mhzEstimate: 60,
        category: .herb,
        effects: [
          "Curcumin = most studied anti-inflammatory", "Crosses blood-brain barrier",
          "Neuroprotective", "Pineal decalcifier",
        ],
        avoidReasons: [], alternatives: [],
        quantumNote:
          "Turmeric is sacred in Hindu tradition for a reason — it purifies both the physical and energy body. The curcumin requires black pepper (piperine) for absorption. Together they're 2,000% more bioavailable. Nature designed them as a pair.",
        pinealImpact: .decalcifies, gutBrainScore: 2),

      QuantumFood(
        id: "raw_honey", name: "Raw Unprocessed Honey", tier: .mediumHigh, mhzEstimate: 58,
        category: .superfood,
        effects: [
          "Contains every nutrient needed to sustain life", "Antimicrobial", "Prebiotic",
          "Never spoils", "Contains biophotons",
        ],
        avoidReasons: [], alternatives: [],
        quantumNote:
          "Raw honey found in Egyptian tombs 3,000 years old was still edible. It contains biophotons — particles of light stored by bees from flowers that absorbed sunlight. You are literally eating captured light. That's not metaphor — it's quantum biology.",
        pinealImpact: .supports, gutBrainScore: 2),

      QuantumFood(
        id: "spirulina", name: "Spirulina", tier: .mediumHigh, mhzEstimate: 65,
        category: .superfood,
        effects: [
          "Complete protein (65%)", "Heavy metal chelator", "Phycocyanin = anti-inflammatory",
          "NASA space food",
        ],
        avoidReasons: [], alternatives: [],
        quantumNote:
          "Spirulina is one of the oldest life forms on Earth — 3.5 billion years old. NASA selected it as the #1 food for space missions. It chelates heavy metals, provides complete nutrition, and its blue pigment (phycocyanin) is structurally similar to human hemoglobin. Ancient life feeding modern consciousness.",
        pinealImpact: .decalcifies, gutBrainScore: 2),

      QuantumFood(
        id: "raw_cacao", name: "Raw Cacao (not cocoa)", tier: .mediumHigh, mhzEstimate: 68,
        category: .superfood,
        effects: [
          "Highest food source of magnesium", "Anandamide (bliss molecule)", "PEA (love chemical)",
          "Theobromine (gentle stimulant)", "MAO inhibitor",
        ],
        avoidReasons: ["Don't confuse with processed cocoa/chocolate"],
        alternatives: [],
        quantumNote:
          "Cacao = 'food of the gods' (Theobroma). It contains anandamide (from Sanskrit 'ananda' = bliss) — the same compound your brain produces during meditation and flow states. Raw cacao is literally a consciousness shortcut. The Maya knew. Ceremony-grade cacao can induce altered states of awareness.",
        pinealImpact: .activates, gutBrainScore: 1),
    ])

    // ═══════════════════════════════════════════════════════
    // HIGH TIER (72-90 MHz) — CONSCIOUSNESS FOODS
    // ═══════════════════════════════════════════════════════

    foods.append(contentsOf: [
      QuantumFood(
        id: "chlorella", name: "Chlorella", tier: .high, mhzEstimate: 75,
        category: .superfood,
        effects: [
          "Strongest detoxifier known", "Binds mercury, lead, cadmium", "Rebuilds nerve tissue",
          "Contains CGF (Chlorella Growth Factor)",
        ],
        avoidReasons: [], alternatives: [],
        quantumNote:
          "Chlorella's Growth Factor (CGF) accelerates cellular repair at a rate unmatched by any other food. It pulls heavy metals from your tissues like a magnet. If you've ever had amalgam fillings, eaten tuna, or lived near traffic — chlorella is not optional. It's essential.",
        pinealImpact: .decalcifies, gutBrainScore: 3),

      QuantumFood(
        id: "living_sprouts", name: "Living Sprouts (any seed)", tier: .high, mhzEstimate: 80,
        category: .vegetable,
        effects: [
          "10-100x nutrients of mature plant", "Maximum enzyme content", "Peak life force",
          "Biophotonic activity off the charts",
        ],
        avoidReasons: [], alternatives: [],
        quantumNote:
          "A sprout is a seed that has been activated — it contains the FULL blueprint of the plant in its most concentrated, alive form. Sprouts are the highest-frequency plant food because they're in the process of BECOMING. They carry the frequency of transformation itself.",
        pinealImpact: .activates, gutBrainScore: 3),

      QuantumFood(
        id: "wheatgrass", name: "Wheatgrass Juice", tier: .high, mhzEstimate: 82,
        category: .superfood,
        effects: [
          "Chlorophyll = liquid sunlight",
          "Identical molecular structure to hemoglobin (except Mg vs Fe)", "Blood builder",
          "Alkalizing",
        ],
        avoidReasons: [], alternatives: [],
        quantumNote:
          "Chlorophyll and hemoglobin are nearly identical molecules — chlorophyll centers on magnesium, hemoglobin on iron. When you drink wheatgrass, you're drinking liquid sunlight restructured into a form your blood recognizes as its own. Photosynthesis → your bloodstream. Sun → you.",
        pinealImpact: .activates, gutBrainScore: 3),

      QuantumFood(
        id: "spring_water", name: "Living Spring Water", tier: .high, mhzEstimate: 85,
        category: .beverage,
        effects: [
          "Structured water with coherent molecular arrangement",
          "Carries Earth's electromagnetic signature", "Mineralized naturally",
          "Alive with biophotons",
        ],
        avoidReasons: [], alternatives: [],
        quantumNote:
          "Spring water emerges from the earth already structured — its molecules arranged in coherent hexagonal patterns that your cells recognize. Tap water has been pumped, pressured, chlorinated, and fluoridated until its structure is chaotic. Your body is 70% water. The quality of that water IS the quality of your consciousness.",
        pinealImpact: .supports, gutBrainScore: 2),
    ])

    // ═══════════════════════════════════════════════════════
    // SUPER HIGH TIER (90-320+ MHz) — TRANSCENDENCE
    // ═══════════════════════════════════════════════════════

    foods.append(contentsOf: [
      QuantumFood(
        id: "rose_oil", name: "Rose Essential Oil", tier: .superHigh, mhzEstimate: 320,
        category: .essentialOil,
        effects: [
          "Highest measured frequency of any substance", "Opens heart chakra", "Emotional healing",
          "Cellular regeneration",
        ],
        avoidReasons: [], alternatives: [],
        quantumNote:
          "Rose essential oil vibrates at 320 MHz — the highest measured frequency of any natural substance on Earth. It takes 60,000 roses to make one ounce of rose oil. This isn't a product — it's concentrated love frequency. The ancients anointed with rose oil because they understood frequency before we had the instruments to measure it.",
        pinealImpact: .activates, gutBrainScore: 0),

      QuantumFood(
        id: "frankincense", name: "Frankincense (Boswellia)", tier: .superHigh, mhzEstimate: 147,
        category: .essentialOil,
        effects: [
          "Crosses blood-brain barrier", "Anti-tumor properties", "Pineal activation",
          "Used in every ancient spiritual tradition",
        ],
        avoidReasons: [], alternatives: [],
        quantumNote:
          "Frankincense was one of three gifts brought to Christ. It's been used in spiritual ceremonies for 5,000+ years across Egypt, Babylon, Greece, Rome, and India. Modern research shows it contains compounds that cross the blood-brain barrier and activate brain regions associated with spiritual experience. The ancients weren't guessing.",
        pinealImpact: .activates, gutBrainScore: 0),

      QuantumFood(
        id: "oregano_oil", name: "Oil of Oregano", tier: .superHigh, mhzEstimate: 152,
        category: .essentialOil,
        effects: ["Natural antibiotic", "Antifungal", "Antiviral", "Parasite killer"],
        avoidReasons: [], alternatives: [],
        quantumNote:
          "Oil of oregano destroys pathogens that antibiotics can't touch. It's one of the most powerful natural antimicrobials known to science. In frequency terms, it operates so high that low-frequency organisms simply cannot survive in its presence.",
        pinealImpact: .decalcifies, gutBrainScore: 2),

      QuantumFood(
        id: "raw_organic_greens", name: "Raw Organic Green Juice (fresh)", tier: .superHigh,
        mhzEstimate: 95,
        category: .superfood,
        effects: [
          "Maximum biophotonic activity", "Enzyme-rich", "Alkalizing", "Living chlorophyll",
        ],
        avoidReasons: [], alternatives: [],
        quantumNote:
          "Fresh-pressed green juice consumed within 15 minutes of juicing carries the highest food frequency measurable. The enzymes are alive, the chlorophyll is active, the biophotons are radiating. After 15 minutes, the frequency drops. After pasteurization, it's dead. Timing is everything.",
        pinealImpact: .activates, gutBrainScore: 3),

      QuantumFood(
        id: "chaga", name: "Chaga Mushroom", tier: .superHigh, mhzEstimate: 100,
        category: .superfood,
        effects: [
          "Highest ORAC score of any food", "Immune modulator", "DNA repair", "Adaptogenic",
        ],
        avoidReasons: [], alternatives: [],
        quantumNote:
          "Chaga grows on birch trees in extreme cold — it's one of the most resilient organisms on Earth. Its ORAC (antioxidant) score is higher than any other food measured. It doesn't just protect cells — it helps repair damaged DNA. This is consciousness maintenance at the hardware level.",
        pinealImpact: .activates, gutBrainScore: 2),

      QuantumFood(
        id: "lions_mane", name: "Lion's Mane Mushroom", tier: .superHigh, mhzEstimate: 92,
        category: .superfood,
        effects: [
          "Stimulates Nerve Growth Factor (NGF)", "Neurogenesis — grows new brain cells",
          "Repairs myelin sheath", "Enhanced cognition",
        ],
        avoidReasons: [], alternatives: [],
        quantumNote:
          "Lion's Mane is the only food known to stimulate Nerve Growth Factor production. It literally grows new neurons and repairs the myelin sheath that insulates them. If consciousness is software, Lion's Mane upgrades the hardware it runs on.",
        pinealImpact: .activates, gutBrainScore: 3),
    ])

    return foods
  }
}
