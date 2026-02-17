// VibeSpectrumDatabaseExtended.swift
// EXTENDED FOOD DATABASE — 50+ Additional Foods for Complete Coverage
// ☀️ SunFlow: Reignited

import Foundation

extension VibeSpectrumDatabase {
  static func extendedFoods() -> [QuantumFood] {
    var foods: [QuantumFood] = []

    // ═══════════════════════════════════════
    // DESTRUCTIVE TIER — MORE KILLERS
    // ═══════════════════════════════════════
    foods.append(contentsOf: [
      QuantumFood(
        id: "sucralose", name: "Sucralose (Splenda)", tier: .destructive, mhzEstimate: 0,
        category: .additive,
        effects: [
          "Destroys gut bacteria by up to 50%", "Chlorinated sugar compound",
          "Disrupts insulin signaling", "Accumulates in fat tissue",
        ],
        avoidReasons: ["Diet products", "Sugar-free drinks", "Protein powders", "Chewing gum"],
        alternatives: ["Raw honey", "Monk fruit", "Stevia leaf"],
        quantumNote:
          "Sucralose is sugar bonded with CHLORINE atoms. Your gut bacteria — the foundation of your serotonin production — don't survive chlorine. Every packet of Splenda is a chemical weapon against your consciousness infrastructure.",
        pinealImpact: .calcifies, gutBrainScore: -3),

      QuantumFood(
        id: "red_40", name: "Red 40 / Artificial Colors", tier: .destructive, mhzEstimate: 0,
        category: .additive,
        effects: [
          "Petroleum-derived", "Linked to hyperactivity", "Potential carcinogen",
          "Banned in several EU countries",
        ],
        avoidReasons: ["Candy", "Cereal", "Sports drinks", "Fruit snacks"],
        alternatives: ["Beet juice (natural red)", "Turmeric (yellow)", "Spirulina (blue-green)"],
        quantumNote:
          "Artificial food dyes are made from petroleum — the same crude oil used for gasoline. Banned or warning-labeled in the EU, but freely fed to American children. Your kids are eating paint.",
        pinealImpact: .calcifies, gutBrainScore: -2),

      QuantumFood(
        id: "glyphosate", name: "Glyphosate (Roundup residue)", tier: .destructive, mhzEstimate: 0,
        category: .additive,
        effects: [
          "Destroys gut microbiome", "Chelates minerals", "Endocrine disruptor",
          "Found in 80%+ of non-organic food",
        ],
        avoidReasons: ["All non-organic wheat, oats, corn, soy"],
        alternatives: ["100% organic everything", "Grow your own", "Local farms"],
        quantumNote:
          "Glyphosate was patented as an ANTIBIOTIC before it became an herbicide. It kills bacteria — including the 40 trillion in your gut that produce 90% of your serotonin. Every non-organic meal is a dose of antibiotic you didn't consent to.",
        pinealImpact: .calcifies, gutBrainScore: -3),

      QuantumFood(
        id: "sodium_benzoate", name: "Sodium Benzoate", tier: .destructive, mhzEstimate: 0,
        category: .additive,
        effects: [
          "Forms benzene (carcinogen) when combined with vitamin C", "DNA damage", "Hyperactivity",
          "Mitochondrial dysfunction",
        ],
        avoidReasons: ["Sodas", "Fruit juices", "Salad dressings", "Pickles"],
        alternatives: ["Fresh-made alternatives", "Vinegar-preserved foods"],
        quantumNote:
          "Sodium benzoate + ascorbic acid (vitamin C) = benzene, a known carcinogen. Many sodas and 'healthy' fruit drinks contain BOTH ingredients. The chemistry is simple. The deception is criminal.",
        pinealImpact: .calcifies, gutBrainScore: -2),
    ])

    // ═══════════════════════════════════════
    // ACIDIC TIER — MORE DRAINERS
    // ═══════════════════════════════════════
    foods.append(contentsOf: [
      QuantumFood(
        id: "energy_drinks", name: "Energy Drinks", tier: .acidic, mhzEstimate: 3,
        category: .beverage,
        effects: [
          "Extreme caffeine + sugar combo", "Synthetic taurine", "Cardiac stress",
          "Adrenal burnout",
        ],
        avoidReasons: ["All major brands — Monster, Red Bull, Bang"],
        alternatives: ["Green tea", "Yerba mate", "Matcha", "Lion's mane coffee"],
        quantumNote:
          "Energy drinks give you borrowed energy through stimulants while destroying the systems that produce real energy. It's a payday loan for your adrenals — and the interest rate is your health.",
        pinealImpact: .calcifies, gutBrainScore: -2),

      QuantumFood(
        id: "canola_oil", name: "Canola / Vegetable Oil", tier: .acidic, mhzEstimate: 5,
        category: .oil,
        effects: [
          "Hexane extraction (neurotoxin)", "Inflammatory omega-6 overload", "Oxidizes at low heat",
          "Often GMO rapeseed",
        ],
        avoidReasons: ["Restaurant cooking oil #1", "Most packaged foods", "Salad dressings"],
        alternatives: ["Extra virgin olive oil", "Coconut oil", "Avocado oil", "Ghee"],
        quantumNote:
          "Canola oil requires hexane extraction, deodorization, and bleaching before it looks 'clear.' Your cell membranes deserve better building materials than an industrial solvent byproduct.",
        pinealImpact: .neutral, gutBrainScore: -2),

      QuantumFood(
        id: "tap_water", name: "Unfiltered Tap Water", tier: .acidic, mhzEstimate: 6,
        category: .beverage,
        effects: [
          "Chlorine destroys gut bacteria", "Fluoride calcifies pineal", "Pharmaceutical residues",
          "Microplastics",
        ],
        avoidReasons: ["All municipal water unless filtered"],
        alternatives: ["Spring water", "Reverse osmosis + remineralization", "Berkey filter"],
        quantumNote:
          "Tap water contains chlorine (gut killer), fluoride (pineal calcifier), pharmaceutical residues, and microplastics. The water meant to give you life is contaminated at the source.",
        pinealImpact: .calcifies, gutBrainScore: -2),

      QuantumFood(
        id: "microwave_food", name: "Microwaved Food", tier: .acidic, mhzEstimate: 5,
        category: .processed,
        effects: [
          "Destroys molecular structure", "Eliminates biophotons",
          "Reduces nutrient content dramatically", "Changes amino acid configurations",
        ],
        avoidReasons: ["Any food heated via microwave"],
        alternatives: ["Stovetop reheating", "Toaster oven", "Steaming"],
        quantumNote:
          "Microwaves heat food by violently agitating water molecules 2.4 billion times per second. This doesn't just heat — it destroys molecular bonds, eliminates enzymes, and neutralizes biophotonic activity. Dead food factory.",
        pinealImpact: .neutral, gutBrainScore: -1),
    ])

    // ═══════════════════════════════════════
    // LOW TIER — MORE ENTRIES
    // ═══════════════════════════════════════
    foods.append(contentsOf: [
      QuantumFood(
        id: "white_bread", name: "White Bread", tier: .low, mhzEstimate: 10,
        category: .grain,
        effects: [
          "Higher glycemic index than table sugar", "Stripped of fiber and nutrients",
          "Often contains added sugar", "Bleached with chemicals",
        ],
        avoidReasons: ["Most sandwich bread", "Burger buns", "Dinner rolls"],
        alternatives: ["Sprouted grain bread (Ezekiel)", "Real sourdough", "Almond flour bread"],
        quantumNote:
          "Commercial white bread has a glycemic index higher than table sugar. You'd be better off eating a spoonful of honey — at least honey has enzymes.",
        pinealImpact: .neutral, gutBrainScore: -1),

      QuantumFood(
        id: "pork", name: "Pork", tier: .low, mhzEstimate: 12,
        category: .protein,
        effects: [
          "Highly acidic", "Slow digestion (6-8 hours)", "Parasite-prone",
          "Carries growth hormones",
        ],
        avoidReasons: ["Multiple ancient traditions banned it for a reason"],
        alternatives: ["Free-range poultry", "Wild-caught fish", "Plant protein"],
        quantumNote:
          "Pigs don't sweat — they can't expel toxins through skin. Every toxin they consume stays in their tissue. Multiple ancient traditions banned pork not as arbitrary law but as health code. The ancients understood bioaccumulation before we had a word for it.",
        pinealImpact: .neutral, gutBrainScore: -1),

      QuantumFood(
        id: "commercial_cereal", name: "Commercial Breakfast Cereal", tier: .low, mhzEstimate: 8,
        category: .processed,
        effects: [
          "Extrusion process destroys nutrients", "Coated in sugar",
          "Artificial colors and flavors", "BHT preservative in packaging",
        ],
        avoidReasons: ["Most boxed cereals — even 'healthy' ones"],
        alternatives: ["Overnight oats (organic)", "Chia pudding", "Smoothie bowls"],
        quantumNote:
          "Cereal is made through extrusion — grain forced through a machine at extreme heat and pressure. Studies showed rats fed extruded grain died faster than rats fed the CARDBOARD BOX. The box was more nutritious than the food.",
        pinealImpact: .neutral, gutBrainScore: -1),
    ])

    // ═══════════════════════════════════════
    // NEUTRAL TIER — MORE OPTIONS
    // ═══════════════════════════════════════
    foods.append(contentsOf: [
      QuantumFood(
        id: "oatmeal", name: "Organic Oatmeal", tier: .neutral, mhzEstimate: 20,
        category: .grain,
        effects: [
          "Beta-glucan for cholesterol", "Slow energy release", "MUST be organic (glyphosate)",
          "Soothing to gut lining",
        ],
        avoidReasons: ["Non-organic oats = glyphosate bath"],
        alternatives: [],
        quantumNote:
          "Oats are one of the most heavily sprayed crops with glyphosate (used as a drying agent before harvest). Organic oats are a different food entirely. Always buy organic — or you're eating herbicide porridge.",
        pinealImpact: .neutral, gutBrainScore: 1),

      QuantumFood(
        id: "bananas", name: "Bananas", tier: .neutral, mhzEstimate: 22,
        category: .fruit,
        effects: [
          "Potassium-rich", "Natural prebiotic (when slightly green)", "Quick energy",
          "Tryptophan for serotonin",
        ],
        avoidReasons: [], alternatives: [],
        quantumNote:
          "Green-tipped bananas contain resistant starch — one of the best prebiotics for gut bacteria. As they ripen, the starch converts to sugar. For gut health, eat them slightly green. For energy, eat them ripe. Nature gives you options.",
        pinealImpact: .neutral, gutBrainScore: 1),

      QuantumFood(
        id: "quinoa", name: "Quinoa", tier: .neutral, mhzEstimate: 24,
        category: .grain,
        effects: [
          "Complete protein (all 9 amino acids)", "High in magnesium", "Gluten-free",
          "Ancient Incan 'mother grain'",
        ],
        avoidReasons: [], alternatives: [],
        quantumNote:
          "The Incas called quinoa 'chisaya mama' — the mother of all grains. It's one of the few plant foods with all 9 essential amino acids. When the Spanish colonizers arrived, they banned its cultivation to weaken the indigenous people. They knew food is power.",
        pinealImpact: .supports, gutBrainScore: 1),
    ])

    // ═══════════════════════════════════════
    // MEDIUM LOW TIER (25-50 MHz)
    // ═══════════════════════════════════════
    foods.append(contentsOf: [
      QuantumFood(
        id: "sweet_potato", name: "Sweet Potato", tier: .mediumLow, mhzEstimate: 32,
        category: .vegetable,
        effects: ["Beta-carotene rich", "Low glycemic", "Gut-healing", "Grounding"],
        avoidReasons: [], alternatives: [],
        quantumNote:
          "Sweet potatoes grow underground and carry that Earth energy. High in beta-carotene — precursor to vitamin A, which supports both outer and inner vision.",
        pinealImpact: .supports, gutBrainScore: 2),

      QuantumFood(
        id: "hemp_seeds", name: "Hemp Seeds", tier: .mediumLow, mhzEstimate: 42,
        category: .protein,
        effects: [
          "Complete protein", "Perfect omega-3:6 ratio", "GLA (rare anti-inflammatory)",
          "Easily digestible",
        ],
        avoidReasons: [], alternatives: [],
        quantumNote:
          "Hemp is one of the most suppressed plants in history — perfect protein ratio, ideal fatty acids, and GLA found in almost no other food. They made it illegal because it heals too many things.",
        pinealImpact: .supports, gutBrainScore: 2),

      QuantumFood(
        id: "beets", name: "Beets (Raw)", tier: .mediumLow, mhzEstimate: 36,
        category: .vegetable,
        effects: [
          "Nitric oxide booster", "Blood purifier", "Liver detox",
          "Increases oxygen delivery to brain",
        ],
        avoidReasons: [], alternatives: [],
        quantumNote:
          "Beets increase nitric oxide production — which dilates blood vessels and delivers more oxygen to your brain. More oxygen to the brain = clearer thinking, better meditation, sharper intuition. Consciousness fuel.",
        pinealImpact: .supports, gutBrainScore: 2),

      QuantumFood(
        id: "lemon", name: "Lemon / Lime (Fresh)", tier: .mediumLow, mhzEstimate: 34,
        category: .fruit,
        effects: [
          "Alkaline-forming despite acidity", "Vitamin C", "Liver flush",
          "Enhances mineral absorption",
        ],
        avoidReasons: [], alternatives: [],
        quantumNote:
          "Lemons are acidic in the bottle but alkaline-forming in the body. Warm lemon water on an empty stomach triggers your liver's detox pathways. Simple, ancient, powerful.",
        pinealImpact: .supports, gutBrainScore: 1),
    ])

    // ═══════════════════════════════════════
    // MEDIUM HIGH TIER (50-72 MHz)
    // ═══════════════════════════════════════
    foods.append(contentsOf: [
      QuantumFood(
        id: "garlic", name: "Raw Garlic", tier: .mediumHigh, mhzEstimate: 52,
        category: .herb,
        effects: [
          "Allicin = natural antibiotic", "Antifungal", "Cardiovascular support",
          "Parasite deterrent",
        ],
        avoidReasons: [], alternatives: [],
        quantumNote:
          "In Ayurveda, garlic is the universal medicine. Allicin is a broad-spectrum antimicrobial that even pharma acknowledges. Crush raw garlic and wait 10 minutes before eating — this maximizes allicin activation.",
        pinealImpact: .supports, gutBrainScore: 2),

      QuantumFood(
        id: "fermented_foods", name: "Fermented Foods (Kimchi/Sauerkraut)", tier: .mediumHigh,
        mhzEstimate: 55,
        category: .superfood,
        effects: [
          "Trillions of probiotics per serving", "Pre-digested nutrients",
          "Serotonin production support", "Ancient preservation wisdom",
        ],
        avoidReasons: ["Ensure unpasteurized — pasteurized = dead"],
        alternatives: [],
        quantumNote:
          "One tablespoon of raw sauerkraut contains more probiotics than an entire bottle of supplements. Fermentation is alchemy — bacteria transform dead vegetables into living medicine. But it MUST be unpasteurized. Heat kills the magic.",
        pinealImpact: .supports, gutBrainScore: 3),

      QuantumFood(
        id: "coconut_oil", name: "Virgin Coconut Oil", tier: .mediumHigh, mhzEstimate: 52,
        category: .oil,
        effects: [
          "Lauric acid (antimicrobial)", "MCTs for brain fuel", "Stable at high heat",
          "Supports ketone production",
        ],
        avoidReasons: [], alternatives: [],
        quantumNote:
          "Coconut oil's medium-chain triglycerides (MCTs) are converted directly into ketones — brain fuel that bypasses glucose entirely. When monks fast and gain clarity, their brains are running on ketones. Coconut oil mimics that state.",
        pinealImpact: .supports, gutBrainScore: 2),

      QuantumFood(
        id: "matcha", name: "Ceremonial Grade Matcha", tier: .mediumHigh, mhzEstimate: 58,
        category: .beverage,
        effects: [
          "L-theanine (calm alertness)", "EGCG (powerful antioxidant)", "Chlorophyll-rich",
          "Sustained energy without crash",
        ],
        avoidReasons: ["Must be ceremonial grade — culinary grade is weak"],
        alternatives: [],
        quantumNote:
          "Matcha gives you caffeine + L-theanine together — alertness with calm. Coffee spikes adrenaline; matcha elevates awareness. The Zen monks who meditated for hours drank matcha, not espresso. Different chemistry, different consciousness.",
        pinealImpact: .supports, gutBrainScore: 1),

      QuantumFood(
        id: "acv", name: "Raw Apple Cider Vinegar", tier: .mediumHigh, mhzEstimate: 50,
        category: .beverage,
        effects: [
          "Probiotic 'mother' culture", "Blood sugar stabilizer", "Digestive enzyme activator",
          "Alkalizing",
        ],
        avoidReasons: ["Must have 'the mother' — clear ACV is dead"],
        alternatives: [],
        quantumNote:
          "The cloudy 'mother' in raw ACV is a living probiotic colony. One tablespoon before meals kickstarts digestive enzyme production and stabilizes blood sugar for hours. Hippocrates prescribed it 2,400 years ago.",
        pinealImpact: .supports, gutBrainScore: 2),
    ])

    // ═══════════════════════════════════════
    // HIGH TIER (72-90 MHz)
    // ═══════════════════════════════════════
    foods.append(contentsOf: [
      QuantumFood(
        id: "moringa", name: "Moringa Leaf", tier: .high, mhzEstimate: 78,
        category: .superfood,
        effects: [
          "92 nutrients", "46 antioxidants", "18 amino acids",
          "More vitamin C than oranges, more calcium than milk, more potassium than bananas",
        ],
        avoidReasons: [], alternatives: [],
        quantumNote:
          "Moringa is called 'the miracle tree' because one plant provides more nutrition than almost any food combination. It grows in the poorest regions of Earth where people need it most. Nature puts the cure where the disease is.",
        pinealImpact: .activates, gutBrainScore: 3),

      QuantumFood(
        id: "sea_moss", name: "Sea Moss (Irish Moss)", tier: .high, mhzEstimate: 76,
        category: .superfood,
        effects: [
          "92 of 102 minerals in the human body", "Thyroid support (iodine)", "Gut lining repair",
          "Mucilaginous — soothes everything",
        ],
        avoidReasons: [], alternatives: [],
        quantumNote:
          "Sea moss contains 92 of the 102 minerals your body needs. It's essentially a mineral supplement from the ocean. Dr. Sebi built his entire healing philosophy around sea moss and alkaline foods. The ocean remembers what the land forgot.",
        pinealImpact: .activates, gutBrainScore: 3),

      QuantumFood(
        id: "reishi", name: "Reishi Mushroom", tier: .high, mhzEstimate: 80,
        category: .superfood,
        effects: [
          "Adaptogenic — balances everything", "Immune modulator", "Sleep enhancer",
          "Called 'mushroom of immortality'",
        ],
        avoidReasons: [], alternatives: [],
        quantumNote:
          "Reishi was so prized in ancient China that only royalty could consume it. It modulates the immune system — not boosting or suppressing but BALANCING. It enhances deep sleep where most cellular repair and spiritual processing occurs.",
        pinealImpact: .activates, gutBrainScore: 2),

      QuantumFood(
        id: "bee_pollen", name: "Bee Pollen", tier: .high, mhzEstimate: 74,
        category: .superfood,
        effects: [
          "Complete food — contains every nutrient for human survival", "40% protein",
          "Enzyme-rich", "Ancient athlete fuel",
        ],
        avoidReasons: ["Allergy caution — start with tiny amounts"],
        alternatives: [],
        quantumNote:
          "Bee pollen is the only food that contains every single nutrient necessary for human survival. Olympic athletes have used it for decades. It's collected by bees from thousands of flowers — concentrated botanical intelligence.",
        pinealImpact: .activates, gutBrainScore: 2),
    ])

    // ═══════════════════════════════════════
    // SUPER HIGH TIER (90-320+ MHz)
    // ═══════════════════════════════════════
    foods.append(contentsOf: [
      QuantumFood(
        id: "lavender_oil", name: "Lavender Essential Oil", tier: .superHigh, mhzEstimate: 118,
        category: .essentialOil,
        effects: [
          "Calming frequency", "Sleep enhancement", "Anxiety reduction", "Cellular repair support",
        ],
        avoidReasons: [], alternatives: [],
        quantumNote:
          "Lavender vibrates at 118 MHz — high enough to affect brain wave patterns through olfactory input alone. The scent triggers GABA production, the neurotransmitter that quiets the mind. Monks who used lavender in meditation weren't just enjoying the smell — they were chemically inducing receptivity.",
        pinealImpact: .activates, gutBrainScore: 0),

      QuantumFood(
        id: "myrrh", name: "Myrrh (Essential Oil/Resin)", tier: .superHigh, mhzEstimate: 105,
        category: .essentialOil,
        effects: [
          "Anti-inflammatory", "Ancient wound healer", "Spiritual purification",
          "Used in embalming — preservation at cellular level",
        ],
        avoidReasons: [], alternatives: [],
        quantumNote:
          "Myrrh was the second gift to Christ and has been used in sacred ceremonies for 5,000+ years across every major civilization. It contains sesquiterpenes that cross the blood-brain barrier and affect the limbic system — the seat of emotion and memory.",
        pinealImpact: .activates, gutBrainScore: 0),

      QuantumFood(
        id: "shilajit", name: "Shilajit (Himalayan Mineral Pitch)", tier: .superHigh,
        mhzEstimate: 92,
        category: .superfood,
        effects: [
          "85+ ionic minerals", "Fulvic acid (nutrient delivery system)", "Mitochondrial enhancer",
          "Ayurvedic 'destroyer of weakness'",
        ],
        avoidReasons: [], alternatives: [],
        quantumNote:
          "Shilajit takes thousands of years to form — compressed ancient plant matter pushed through Himalayan rock by tectonic forces. It contains fulvic acid, which acts as a delivery system for nutrients at the cellular level. Time-compressed Earth intelligence.",
        pinealImpact: .activates, gutBrainScore: 2),
    ])

    return foods
  }

  /// Call this to merge extended foods into the database
  func loadExtended() {
    let extended = Self.extendedFoods()
    let existingIDs = Set(allFoods.map { $0.id })
    let newFoods = extended.filter { !existingIDs.contains($0.id) }
    allFoods.append(contentsOf: newFoods)
  }
}
