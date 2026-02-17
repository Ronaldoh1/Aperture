// QuantumFitnessView.swift
// QUANTUM FITNESS — High-Performance Consciousness Nutrition
// Train hard. Eat high-vibe. No compromises.
// ☀️ SunFlow: Reignited

import SwiftUI

// MARK: - Athlete Archetype

enum AthleteArchetype: String, CaseIterable, Identifiable {
  case crossfitter = "CrossFitter"
  case gymLifter = "Gym / Lifter"
  case runner = "Runner"
  case swimmer = "Swimmer"
  case yogaPractitioner = "Yoga / Movement"
  case teamSport = "Team Sport (Soccer/Football)"
  case martialArtist = "Martial Artist"
  case generalActive = "Generally Active"

  var id: String {
    rawValue
  }

  var icon: String {
    switch self {
    case .crossfitter: return "figure.strengthtraining.traditional"
    case .gymLifter: return "dumbbell.fill"
    case .runner: return "figure.run"
    case .swimmer: return "figure.pool.swim"
    case .yogaPractitioner: return "figure.mind.and.body"
    case .teamSport: return "figure.soccer"
    case .martialArtist: return "figure.martial.arts"
    case .generalActive: return "figure.walk"
    }
  }

  var color: Color {
    switch self {
    case .crossfitter: return Color(hex: "#FF6B35")
    case .gymLifter: return Color(hex: "#E74C3C")
    case .runner: return Color(hex: "#3498DB")
    case .swimmer: return Color(hex: "#00BFFF")
    case .yogaPractitioner: return Color(hex: "#9B59B6")
    case .teamSport: return Color(hex: "#2ECC71")
    case .martialArtist: return Color(hex: "#F39C12")
    case .generalActive: return Color(hex: "#1ABC9C")
    }
  }

  var dailyProteinGrams: String {
    switch self {
    case .crossfitter: return "1.6–2.2g per kg bodyweight"
    case .gymLifter: return "1.8–2.4g per kg bodyweight"
    case .runner: return "1.2–1.6g per kg bodyweight"
    case .swimmer: return "1.4–1.8g per kg bodyweight"
    case .yogaPractitioner: return "1.0–1.4g per kg bodyweight"
    case .teamSport: return "1.4–2.0g per kg bodyweight"
    case .martialArtist: return "1.6–2.0g per kg bodyweight"
    case .generalActive: return "1.0–1.6g per kg bodyweight"
    }
  }

  var keyNutrientFocus: [String] {
    switch self {
    case .crossfitter:
      return [
        "Complete protein (all 9 amino acids)", "Complex carbs for glycogen",
        "Magnesium for muscle recovery", "Electrolytes (sodium, potassium)",
        "Anti-inflammatory foods post-WOD",
      ]
    case .gymLifter:
      return [
        "High leucine protein sources", "Creatine-supporting foods",
        "Zinc for testosterone support", "B-vitamins for energy metabolism",
        "Iron for oxygen delivery",
      ]
    case .runner:
      return [
        "Easily digestible carbs (pre-run)", "Potassium-rich foods",
        "Iron (especially female runners)", "Omega-3 for joint health",
        "Antioxidants for oxidative stress",
      ]
    case .swimmer:
      return [
        "High calorie density", "Chlorine recovery antioxidants",
        "Vitamin D (indoor pool athletes)", "Calcium for bone density",
        "Complex carbs for endurance",
      ]
    case .yogaPractitioner:
      return [
        "Anti-inflammatory foods", "Magnesium for flexibility", "Light easily-digestible meals",
        "Adaptogens for balance", "Hydration and electrolytes",
      ]
    case .teamSport:
      return [
        "Quick-energy carbs", "Protein for recovery windows", "Electrolyte replacement",
        "Iron and B12", "Anti-inflammatory for contact impact",
      ]
    case .martialArtist:
      return [
        "Lean complete protein", "Anti-inflammatory powerfoods", "Joint-supporting nutrients",
        "Fast-absorbing pre-training fuel", "Adaptogenic herbs for focus",
      ]
    case .generalActive:
      return [
        "Balanced macros", "Whole food protein sources", "Leafy greens for micronutrients",
        "Healthy fats for sustained energy", "Hydration basics",
      ]
    }
  }
}

// MARK: - High-Vibe Protein Sources

struct HighVibeProtein: Identifiable {
  let id: String
  let name: String
  let proteinPer100g: Int  // grams
  let mhzEstimate: Int
  let bestFor: [AthleteArchetype]
  let notes: String
  let pinealSafe: Bool
}

class QuantumProteinDatabase {
  static let proteins: [HighVibeProtein] = [
    HighVibeProtein(
      id: "hemp_seeds", name: "Hemp Seeds", proteinPer100g: 31, mhzEstimate: 42,
      bestFor: [.crossfitter, .gymLifter, .runner, .generalActive],
      notes:
        "Complete protein with all 9 essential amino acids. Perfect omega-3:6 ratio. One of the highest-vibe protein sources available.",
      pinealSafe: true),
    HighVibeProtein(
      id: "spirulina", name: "Spirulina", proteinPer100g: 57, mhzEstimate: 65,
      bestFor: [.crossfitter, .gymLifter, .swimmer, .martialArtist],
      notes:
        "57% protein by weight — higher than any meat. Complete amino acid profile. Iron-rich. Ancient superfood used by Aztec warriors before battle.",
      pinealSafe: true),
    HighVibeProtein(
      id: "chlorella", name: "Chlorella", proteinPer100g: 58, mhzEstimate: 74,
      bestFor: [.swimmer, .crossfitter, .runner],
      notes:
        "Highest chlorophyll content of any plant. Heavy metal chelator. Swimmers: helps counteract chlorine exposure. 58% protein.",
      pinealSafe: true),
    HighVibeProtein(
      id: "bee_pollen", name: "Bee Pollen", proteinPer100g: 40, mhzEstimate: 74,
      bestFor: [.runner, .crossfitter, .teamSport, .martialArtist],
      notes:
        "40% protein. Contains every nutrient needed for human survival. Olympic athletes have used it for decades. Start with small amounts (allergy test).",
      pinealSafe: true),
    HighVibeProtein(
      id: "pumpkin_seeds", name: "Pumpkin Seeds", proteinPer100g: 30, mhzEstimate: 38,
      bestFor: [.gymLifter, .generalActive, .yogaPractitioner],
      notes:
        "High in zinc (testosterone support), magnesium (muscle function), and iron. 30g protein per 100g. Great post-workout snack.",
      pinealSafe: true),
    HighVibeProtein(
      id: "lentils", name: "Organic Lentils", proteinPer100g: 25, mhzEstimate: 22,
      bestFor: [.runner, .teamSport, .generalActive],
      notes:
        "25g protein + complex carbs in one food. Iron-rich. Slow-digesting for sustained energy. Ancient athletic fuel.",
      pinealSafe: true),
    HighVibeProtein(
      id: "quinoa", name: "Quinoa", proteinPer100g: 14, mhzEstimate: 24,
      bestFor: [.runner, .yogaPractitioner, .swimmer, .generalActive],
      notes:
        "Complete protein (all 9 amino acids) from a grain. High magnesium. Incan 'mother grain' — warriors ate this before battle.",
      pinealSafe: true),
    HighVibeProtein(
      id: "wild_salmon", name: "Wild-Caught Salmon", proteinPer100g: 25, mhzEstimate: 28,
      bestFor: [.gymLifter, .crossfitter, .swimmer, .martialArtist],
      notes:
        "25g protein + omega-3 EPA/DHA. MUST be wild-caught — farm-raised contains antibiotics, dyes, and lower omega-3. Joint recovery powerhouse.",
      pinealSafe: true),
    HighVibeProtein(
      id: "free_range_eggs", name: "Free-Range Organic Eggs", proteinPer100g: 13, mhzEstimate: 18,
      bestFor: [.gymLifter, .crossfitter, .generalActive],
      notes:
        "Complete protein with all essential aminos. Choline for brain function. MUST be organic free-range — conventional eggs are low-vibe from stressed animals.",
      pinealSafe: true),
    HighVibeProtein(
      id: "almonds", name: "Raw Almonds", proteinPer100g: 21, mhzEstimate: 40,
      bestFor: [.runner, .yogaPractitioner, .generalActive],
      notes:
        "21g protein + vitamin E + magnesium. Must be RAW (roasted = oxidized oils). Soak overnight for maximum nutrient absorption.",
      pinealSafe: true),
    HighVibeProtein(
      id: "tempeh", name: "Organic Tempeh", proteinPer100g: 19, mhzEstimate: 48,
      bestFor: [.crossfitter, .gymLifter, .yogaPractitioner],
      notes:
        "Fermented soy = pre-digested protein with live probiotics. 19g protein + gut health support. Superior to tofu (unfermented).",
      pinealSafe: true),
    HighVibeProtein(
      id: "moringa", name: "Moringa Leaf Powder", proteinPer100g: 27, mhzEstimate: 78,
      bestFor: AthleteArchetype.allCases,
      notes:
        "27g complete protein + 92 nutrients. Called 'the miracle tree.' More iron than spinach, more calcium than milk. Works for EVERY athlete type.",
      pinealSafe: true),
    HighVibeProtein(
      id: "grass_fed_beef", name: "Grass-Fed Beef (Limited)", proteinPer100g: 26, mhzEstimate: 16,
      bestFor: [.gymLifter, .crossfitter, .teamSport],
      notes:
        "26g protein + creatine + B12 + iron + zinc. MUST be grass-fed (not grain-finished). Lower frequency than plant proteins — use strategically, not daily.",
      pinealSafe: true),
    HighVibeProtein(
      id: "sacha_inchi", name: "Sacha Inchi Seeds", proteinPer100g: 27, mhzEstimate: 45,
      bestFor: [.runner, .swimmer, .yogaPractitioner],
      notes:
        "27g complete protein + highest plant omega-3 content. Ancient Incan superfood. Underrated powerhouse for endurance athletes.",
      pinealSafe: true),
  ]

  static func proteinsFor(_ archetype: AthleteArchetype) -> [HighVibeProtein] {
    proteins.filter { $0.bestFor.contains(archetype) }.sorted { $0.mhzEstimate > $1.mhzEstimate }
  }
}

// MARK: - Sport-Specific Meal Plans

struct FitnessMealPlan: Identifiable {
  let id: String
  let archetype: AthleteArchetype
  let dayTitle: String
  let preworkout: MealSlot
  let postworkout: MealSlot
  let mainMeals: [MealSlot]
  let snacks: [String]
  let dailyMhzTarget: Int
  let hydrationNote: String
}

struct MealSlot: Identifiable {
  let id = UUID()
  let timing: String
  let name: String
  let foods: [String]
  let proteinGrams: Int
  let mhzEstimate: Int
  let tip: String
}

class QuantumFitnessMealPlans {
  static func mealPlan(for archetype: AthleteArchetype) -> FitnessMealPlan {
    switch archetype {
    case .crossfitter:
      return FitnessMealPlan(
        id: "crossfit_plan", archetype: .crossfitter, dayTitle: "WOD Day Fuel Protocol",
        preworkout: MealSlot(
          timing: "60-90 min before WOD", name: "Pre-WOD Ignition",
          foods: [
            "Organic oatmeal with banana + hemp seeds",
            "Green tea or matcha (not coffee — less cortisol spike)",
            "Pinch of sea salt for electrolytes",
          ],
          proteinGrams: 20, mhzEstimate: 35,
          tip: "Eat 60-90 min before — too close and blood diverts to digestion instead of muscles"),
        postworkout: MealSlot(
          timing: "Within 30 min post-WOD", name: "Post-WOD Recovery",
          foods: [
            "Spirulina + banana + hemp protein smoothie", "Raw honey (fast glycogen replenishment)",
            "Pinch of turmeric + black pepper (anti-inflammatory)",
          ],
          proteinGrams: 35, mhzEstimate: 55,
          tip:
            "The 30-min anabolic window is real. Liquid meals absorb faster than solid food post-workout"
        ),
        mainMeals: [
          MealSlot(
            timing: "Morning", name: "Foundation Meal",
            foods: [
              "3 free-range eggs scrambled with turmeric", "Avocado on sprouted grain toast",
              "Side of sauerkraut (gut-brain axis support)",
            ],
            proteinGrams: 28, mhzEstimate: 32,
            tip: "Turmeric in eggs = bioavailable curcumin + fat for absorption"),
          MealSlot(
            timing: "Evening", name: "Rebuild Feast",
            foods: [
              "Wild-caught salmon or organic tempeh", "Sweet potato with ghee",
              "Large raw salad with lemon-olive oil dressing", "Bone broth (collagen for joints)",
            ],
            proteinGrams: 40, mhzEstimate: 38,
            tip: "Evening meal is where deep recovery happens. Don't skimp."),
        ],
        snacks: [
          "Raw almonds + pumpkin seeds", "Apple with almond butter",
          "Moringa energy balls (moringa + dates + coconut)",
        ],
        dailyMhzTarget: 45,
        hydrationNote:
          "Minimum 3L spring/filtered water. Add trace minerals or sea salt. Avoid tap water (chlorine destroys gut bacteria that produce serotonin for mental toughness)."
      )

    case .gymLifter:
      return FitnessMealPlan(
        id: "gym_plan", archetype: .gymLifter, dayTitle: "Lifting Day Fuel Protocol",
        preworkout: MealSlot(
          timing: "60 min before training", name: "Pre-Lift Charge",
          foods: [
            "Rice cakes with almond butter + banana", "Green tea or black coffee (organic only)",
            "Optional: beet juice shot (nitric oxide boost)",
          ],
          proteinGrams: 15, mhzEstimate: 30,
          tip:
            "Beet juice increases nitric oxide = more blood flow to muscles = better pump. Organic only."
        ),
        postworkout: MealSlot(
          timing: "Within 45 min post-lift", name: "Anabolic Recovery",
          foods: [
            "Hemp + pea protein shake with frozen berries",
            "Creatine from whole foods (or clean mono supplement)", "Raw honey for glycogen",
          ],
          proteinGrams: 40, mhzEstimate: 45,
          tip: "Leucine triggers muscle protein synthesis. Hemp seeds are high in leucine."),
        mainMeals: [
          MealSlot(
            timing: "Meal 1", name: "Power Breakfast",
            foods: [
              "4 egg omelette with spinach + mushrooms", "Organic turkey or tempeh sausage",
              "Sprouted grain toast with avocado",
            ],
            proteinGrams: 45, mhzEstimate: 28,
            tip: "Zinc from pumpkin seeds + eggs supports natural testosterone production"),
          MealSlot(
            timing: "Meal 2", name: "Muscle Builder",
            foods: [
              "Grass-fed beef or wild salmon (6-8oz)", "Quinoa or sweet potato",
              "Steamed broccoli with olive oil + garlic",
            ],
            proteinGrams: 50, mhzEstimate: 30,
            tip:
              "Broccoli contains DIM (diindolylmethane) which supports healthy estrogen metabolism"),
        ],
        snacks: [
          "Cottage cheese (organic) + walnuts", "Hard-boiled eggs + sea salt",
          "Protein-rich trail mix (pumpkin seeds, almonds, goji berries)",
        ],
        dailyMhzTarget: 38,
        hydrationNote:
          "1 gallon filtered water daily. Add electrolytes during long sessions. Creatine requires extra hydration."
      )

    case .runner:
      return FitnessMealPlan(
        id: "runner_plan", archetype: .runner, dayTitle: "Run Day Fuel Protocol",
        preworkout: MealSlot(
          timing: "90-120 min before run", name: "Pre-Run Fuel",
          foods: [
            "Banana + small handful of almonds",
            "Matcha with oat milk (sustained energy without crash)",
            "Small portion overnight oats if long run",
          ],
          proteinGrams: 12, mhzEstimate: 35,
          tip:
            "Runners need easily digestible pre-run food. Heavy protein before running = GI distress. Carbs are king here."
        ),
        postworkout: MealSlot(
          timing: "Within 30 min post-run", name: "Recovery Refuel",
          foods: [
            "Tart cherry juice (reduces inflammation 30%+)", "Banana + hemp protein smoothie",
            "Pinch of sea salt for sodium replacement",
          ],
          proteinGrams: 25, mhzEstimate: 45,
          tip:
            "Tart cherry juice is backed by significant research for reducing running-induced inflammation and muscle soreness"
        ),
        mainMeals: [
          MealSlot(
            timing: "Morning", name: "Endurance Base",
            foods: [
              "Steel-cut oats with berries + chia seeds + hemp hearts", "Organic coffee or matcha",
              "Small side of fruit",
            ],
            proteinGrams: 18, mhzEstimate: 38,
            tip: "Chia seeds form a gel in your stomach — sustained energy release over hours"),
          MealSlot(
            timing: "Evening", name: "Rebuild & Rest",
            foods: [
              "Lentil soup or stew (protein + carbs + iron)",
              "Large salad with beets, leafy greens, lemon dressing", "Sweet potato or brown rice",
            ],
            proteinGrams: 30, mhzEstimate: 32,
            tip:
              "Iron is critical for runners (especially female). Lentils + vitamin C (lemon) = maximum iron absorption"
          ),
        ],
        snacks: [
          "Medjool dates + almond butter (natural energy gel)", "Banana with sea salt",
          "Trail mix: goji berries + walnuts + dark chocolate",
        ],
        dailyMhzTarget: 42,
        hydrationNote:
          "Electrolytes are non-negotiable for runners. Spring water + trace minerals. For runs over 60 min, add coconut water or homemade electrolyte (water + lemon + honey + sea salt)."
      )

    case .yogaPractitioner:
      return FitnessMealPlan(
        id: "yoga_plan", archetype: .yogaPractitioner, dayTitle: "Practice Day Nourishment",
        preworkout: MealSlot(
          timing: "2 hours before practice", name: "Pre-Practice Light",
          foods: [
            "Warm lemon water", "Small portion of fruit or a few almonds", "Optional: green tea",
          ],
          proteinGrams: 5, mhzEstimate: 35,
          tip:
            "Yoga on a full stomach restricts breathing and twists. Eat light or practice fasted."),
        postworkout: MealSlot(
          timing: "30-60 min post-practice", name: "Post-Practice Restore",
          foods: [
            "Coconut water for natural electrolytes", "Kitchari (Ayurvedic mung bean + rice dish)",
            "Fresh fruit",
          ],
          proteinGrams: 15, mhzEstimate: 40,
          tip:
            "Kitchari is the ultimate yogic food — easy to digest, complete protein, used in Ayurvedic healing for thousands of years"
        ),
        mainMeals: [
          MealSlot(
            timing: "Morning", name: "Sattvic Breakfast",
            foods: [
              "Fresh fruit bowl with berries + mango", "Soaked almonds + dates",
              "Herbal tea or warm water with ginger",
            ],
            proteinGrams: 10, mhzEstimate: 50,
            tip:
              "In Ayurveda, 'sattvic' foods promote clarity and peace. Fresh, organic, minimally processed."
          ),
          MealSlot(
            timing: "Evening", name: "Grounding Dinner",
            foods: [
              "Organic tempeh or lentil curry", "Steamed vegetables with turmeric + coconut oil",
              "Brown rice or quinoa",
            ],
            proteinGrams: 25, mhzEstimate: 38,
            tip:
              "Evening meals should be grounding. Root vegetables (sweet potato, beets, carrots) balance the upward energy of practice"
          ),
        ],
        snacks: [
          "Fresh fruit", "Soaked almonds + raw honey",
          "Herbal tea with adaptogens (ashwagandha, reishi)",
        ],
        dailyMhzTarget: 50,
        hydrationNote:
          "Warm/room temperature water preferred (cold water constricts channels in Ayurvedic understanding). Add lemon, ginger, or tulsi."
      )

    default:
      // General active plan for swimmer, team sport, martial artist, general
      return FitnessMealPlan(
        id: "general_plan", archetype: archetype, dayTitle: "\(archetype.rawValue) Fuel Protocol",
        preworkout: MealSlot(
          timing: "60-90 min before", name: "Pre-Training Fuel",
          foods: [
            "Banana + almond butter on rice cake", "Green tea or matcha",
            "Small handful of trail mix",
          ],
          proteinGrams: 15, mhzEstimate: 35,
          tip:
            "Adapt timing to your sport — contact sports need more pre-fuel; swimming needs less to avoid cramping"
        ),
        postworkout: MealSlot(
          timing: "Within 45 min post", name: "Recovery Window",
          foods: [
            "Protein smoothie: hemp + spirulina + banana + berries",
            "Coconut water for electrolytes", "Optional: raw honey for glycogen",
          ],
          proteinGrams: 30, mhzEstimate: 48,
          tip:
            "The post-workout window is universal across all sports. Protein + carbs together maximize recovery."
        ),
        mainMeals: [
          MealSlot(
            timing: "Morning", name: "Foundation Meal",
            foods: [
              "Eggs or tempeh scramble with vegetables", "Sprouted grain toast or sweet potato",
              "Side of fermented food (sauerkraut/kimchi)",
            ],
            proteinGrams: 30, mhzEstimate: 32,
            tip:
              "Start every day with protein + fermented food. Gut health = performance foundation."),
          MealSlot(
            timing: "Evening", name: "Recovery Feast",
            foods: [
              "Wild salmon, grass-fed meat, or lentil dish", "Large serving of vegetables",
              "Complex carb: quinoa, sweet potato, or brown rice",
            ],
            proteinGrams: 40, mhzEstimate: 34,
            tip:
              "Eat the rainbow — different colored vegetables provide different phytonutrients for recovery"
          ),
        ],
        snacks: ["Raw nuts + seeds", "Fresh fruit + nut butter", "Hummus + raw vegetables"],
        dailyMhzTarget: 40,
        hydrationNote:
          "Minimum 2.5L filtered water daily. Add electrolytes during intense training. Avoid sports drinks with artificial colors and HFCS."
      )
    }
  }
}

// MARK: - Supplement Red Flag Scanner

struct SupplementIngredient: Identifiable {
  let id: String
  let name: String
  let verdict: SupplementVerdict
  let explanation: String
  let alternatives: [String]
}

enum SupplementVerdict: String {
  case avoid = "AVOID"
  case caution = "CAUTION"
  case acceptable = "ACCEPTABLE"
  case recommended = "RECOMMENDED"

  var color: Color {
    switch self {
    case .avoid: return Color(hex: "#E74C3C")
    case .caution: return Color(hex: "#F39C12")
    case .acceptable: return Color(hex: "#3498DB")
    case .recommended: return Color(hex: "#2ECC71")
    }
  }

  var icon: String {
    switch self {
    case .avoid: return "xmark.octagon.fill"
    case .caution: return "exclamationmark.triangle.fill"
    case .acceptable: return "checkmark.circle"
    case .recommended: return "star.fill"
    }
  }
}

class SupplementRedFlagDatabase {
  static let ingredients: [SupplementIngredient] = [
    // AVOID
    SupplementIngredient(
      id: "sucralose_supp", name: "Sucralose", verdict: .avoid,
      explanation:
        "Destroys up to 50% of gut bacteria. Found in most flavored protein powders and pre-workouts. Chlorinated sugar compound.",
      alternatives: ["Stevia-sweetened", "Monk fruit sweetened", "Unflavored + add raw honey"]),
    SupplementIngredient(
      id: "ace_k", name: "Acesulfame Potassium (Ace-K)", verdict: .avoid,
      explanation:
        "Artificial sweetener linked to gut microbiome disruption. Often combined with sucralose in supplements. Contains methylene chloride (carcinogen).",
      alternatives: ["Stevia", "Monk fruit", "Coconut sugar"]),
    SupplementIngredient(
      id: "artificial_colors_supp", name: "Artificial Colors (Red 40, Blue 1, Yellow 5)",
      verdict: .avoid,
      explanation:
        "Petroleum-derived dyes with zero nutritional value. Why does your protein powder need to be bright pink? Ask that question.",
      alternatives: [
        "Unflavored/uncolored supplements", "Beet powder (natural color)",
        "Spirulina (natural blue-green)",
      ]),
    SupplementIngredient(
      id: "soy_lecithin", name: "Soy Lecithin (non-organic)", verdict: .caution,
      explanation:
        "Commonly GMO soy. Used as emulsifier. Organic sunflower lecithin is a better alternative. Small amounts may be acceptable.",
      alternatives: ["Sunflower lecithin", "Organic soy lecithin"]),
    SupplementIngredient(
      id: "maltodextrin", name: "Maltodextrin", verdict: .caution,
      explanation:
        "Ultra-processed carb with glycemic index higher than table sugar (GI: 95-136). Often from GMO corn. Spikes insulin rapidly.",
      alternatives: ["Raw honey", "Coconut sugar", "Organic dextrose (post-workout only)"]),
    SupplementIngredient(
      id: "titanium_dioxide", name: "Titanium Dioxide", verdict: .avoid,
      explanation:
        "Nanoparticle used as whitening agent. Linked to gut inflammation. Banned as food additive in the EU since 2022. Still in US supplements.",
      alternatives: ["Supplements without whitening agents", "Capsules over tablets"]),
    SupplementIngredient(
      id: "magnesium_stearate", name: "Magnesium Stearate", verdict: .caution,
      explanation:
        "Flow agent used in manufacturing. Not harmful in small amounts but indicates heavy processing. Reduces nutrient absorption slightly.",
      alternatives: ["Supplements without flow agents", "Liquid or powder forms"]),
    SupplementIngredient(
      id: "carrageenan", name: "Carrageenan", verdict: .avoid,
      explanation:
        "Seaweed-derived thickener linked to gut inflammation and digestive issues. Found in many protein shakes and plant milks.",
      alternatives: ["Guar gum (safer thickener)", "Products without thickeners"]),
    // ACCEPTABLE
    SupplementIngredient(
      id: "creatine_mono", name: "Creatine Monohydrate", verdict: .recommended,
      explanation:
        "Most researched supplement in existence. Naturally found in meat. Supports ATP production, cognitive function, and muscle recovery. Safe and effective.",
      alternatives: []),
    SupplementIngredient(
      id: "vitamin_d3", name: "Vitamin D3 (Cholecalciferol)", verdict: .recommended,
      explanation:
        "Most people are deficient. Critical for bone health, immune function, mood. Get from sunlight first, supplement in winter or if deficient.",
      alternatives: ["Sunlight exposure", "Mushrooms (D2)", "Cod liver oil"]),
    SupplementIngredient(
      id: "magnesium_glycinate", name: "Magnesium Glycinate", verdict: .recommended,
      explanation:
        "Highly bioavailable magnesium form. Supports sleep, muscle recovery, stress management, 300+ enzymatic reactions. Most athletes are deficient.",
      alternatives: ["Magnesium threonate (brain-focused)", "Magnesium citrate (gut-focused)"]),
    SupplementIngredient(
      id: "omega3_algae", name: "Algae-Based Omega-3 (DHA/EPA)", verdict: .recommended,
      explanation:
        "Plant-based omega-3 without heavy metal risk of fish oil. Fish get their omega-3 from algae anyway — go to the source.",
      alternatives: [
        "Wild-caught fish oil (molecularly distilled)",
        "Chia seeds + flax (ALA form, less efficient)",
      ]),
  ]

  static let dangerKeywords: [String: String] = [
    "sucralose": "Gut bacteria destroyer",
    "acesulfame": "Contains methylene chloride",
    "aspartame": "Neurotoxic amino acid combination",
    "red 40": "Petroleum-derived dye",
    "blue 1": "Petroleum-derived dye",
    "yellow 5": "Petroleum-derived dye",
    "yellow 6": "Petroleum-derived dye",
    "titanium dioxide": "Nanoparticle — banned in EU",
    "carrageenan": "Gut inflammation trigger",
    "hydrogenated": "Trans fat — cardiovascular damage",
    "high fructose": "Liver-damaging processed sugar",
    "corn syrup": "Ultra-processed sugar",
    "sodium benzoate": "Forms benzene with vitamin C",
    "BHA": "Possible carcinogen",
    "BHT": "Endocrine disruptor",
    "propylene glycol": "Also used in antifreeze",
    "polysorbate 80": "Gut barrier disruptor",
    "silicon dioxide": "Anti-caking agent — unnecessary filler",
  ]

  static func scanIngredients(_ text: String) -> [(keyword: String, warning: String)] {
    let lower = text.lowercased()
    return dangerKeywords.compactMap { keyword, warning in
      lower.contains(keyword) ? (keyword: keyword, warning: warning) : nil
    }
  }
}

// MARK: - Main Quantum Fitness View

struct QuantumFitnessView: View {
  @Environment(\.dismiss) var dismiss
  @State private var selectedArchetype: AthleteArchetype?
  @State private var showSupplementScanner = false
  @State private var showProteinGuide = false
  @State private var pulsePhase: CGFloat = 0

  var body: some View {
    NavigationStack {
      ZStack {
        Color.black.ignoresSafeArea()

        ScrollView(showsIndicators: false) {
          VStack(spacing: 20) {
            // Header
            VStack(spacing: 8) {
              Image(systemName: "figure.strengthtraining.traditional")
                .font(.system(size: 40))
                .foregroundColor(Color(hex: "#FF6B35"))
              Text("QUANTUM FITNESS").font(.system(size: 10, weight: .bold)).tracking(4)
                .foregroundColor(Color(hex: "#FF6B35"))
              Text("Train Hard. Eat High-Vibe.")
                .font(.system(size: 22, weight: .bold, design: .rounded)).foregroundColor(
                  Palette.text.primary)
              Text("No compromises. Your body is your temple AND your gym.")
                .font(.system(size: 13, weight: .medium)).foregroundColor(Palette.text.muted)
                .multilineTextAlignment(.center)
            }
            .padding(.top, 12)

            // Disclaimers
            DisclaimerStack(types: [.fitness, .nutritional])
              .padding(.horizontal, 4)

            // Sport Archetype Selection
            VStack(alignment: .leading, spacing: 10) {
              Text("YOUR TRAINING STYLE").font(.system(size: 10, weight: .bold)).tracking(2)
                .foregroundColor(Palette.text.muted)

              LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 10) {
                ForEach(AthleteArchetype.allCases) { archetype in
                  Button {
                    selectedArchetype = archetype
                    HapticManager.shared.medium()
                  } label: {
                    HStack(spacing: 8) {
                      Image(systemName: archetype.icon)
                        .font(.system(size: 16))
                        .foregroundColor(archetype.color)
                      Text(archetype.rawValue)
                        .font(.system(size: 11, weight: .bold, design: .rounded))
                        .foregroundColor(Palette.text.primary)
                        .lineLimit(1)
                      Spacer()
                    }
                    .padding(12)
                    .background(
                      RoundedRectangle(cornerRadius: 10)
                        .fill(archetype.color.opacity(0.06))
                        .overlay(
                          RoundedRectangle(cornerRadius: 10).stroke(
                            archetype.color.opacity(0.2), lineWidth: 1))
                    )
                  }
                  .buttonStyle(.plain)
                }
              }
            }

            // Quick Actions
            HStack(spacing: 12) {
              quickAction(title: "Protein Guide", icon: "bolt.fill", color: Color(hex: "#E74C3C")) {
                showProteinGuide = true
              }
              quickAction(
                title: "Scan Supplement", icon: "barcode.viewfinder", color: Color(hex: "#9B59B6")
              ) {
                showSupplementScanner = true
              }
            }

            // Research Note
            VStack(spacing: 8) {
              Text("🐉").font(.system(size: 20))
              Text(
                "\"Meal plans are based on publicly available nutritional research as of 2025. We encourage you to do your own additional research and consult with professionals. We'll continue updating as new science emerges. Your body, your responsibility, your power.\""
              )
              .font(.system(size: 12, weight: .medium, design: .rounded))
              .foregroundColor(Palette.text.secondary).italic().multilineTextAlignment(.center)
              .lineSpacing(3)
            }
            .padding(14)
            .background(RoundedRectangle(cornerRadius: 12).fill(Palette.accent.gold.opacity(0.06)))

            Spacer(minLength: 100)
          }
          .padding(.horizontal, 20)
        }
      }
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItem(placement: .principal) {
          Text("QUANTUM FITNESS").font(.system(size: 12, weight: .bold, design: .rounded)).tracking(
            2
          ).foregroundColor(Color(hex: "#FF6B35"))
        }
        ToolbarItem(placement: .navigationBarTrailing) {
          Button("Done") { dismiss() }.foregroundColor(Color(hex: "#FF6B35"))
        }
      }
      .sheet(item: $selectedArchetype) { archetype in
        FitnessMealPlanDetailView(archetype: archetype)
      }
      .sheet(isPresented: $showSupplementScanner) {
        SupplementScannerView()
      }
      .sheet(isPresented: $showProteinGuide) {
        HighVibeProteinGuideView()
      }
    }
  }

  private func quickAction(title: String, icon: String, color: Color, action: @escaping () -> Void)
    -> some View
  {
    Button(action: action) {
      VStack(spacing: 8) {
        Image(systemName: icon).font(.system(size: 20)).foregroundColor(color)
        Text(title).font(.system(size: 11, weight: .bold, design: .rounded)).foregroundColor(
          Palette.text.primary)
      }
      .frame(maxWidth: .infinity)
      .padding(14)
      .background(
        RoundedRectangle(cornerRadius: 12)
          .fill(color.opacity(0.06))
          .overlay(RoundedRectangle(cornerRadius: 12).stroke(color.opacity(0.2), lineWidth: 1))
      )
    }
    .buttonStyle(.plain)
  }
}

// MARK: - Meal Plan Detail View

struct FitnessMealPlanDetailView: View {
  @Environment(\.dismiss) var dismiss
  let archetype: AthleteArchetype

  var body: some View {
    let plan = QuantumFitnessMealPlans.mealPlan(for: archetype)

    NavigationStack {
      ZStack {
        Color.black.ignoresSafeArea()
        ScrollView(showsIndicators: false) {
          VStack(spacing: 16) {
            // Header
            VStack(spacing: 8) {
              Image(systemName: archetype.icon).font(.system(size: 36)).foregroundColor(
                archetype.color)
              Text(plan.dayTitle.uppercased()).font(.system(size: 10, weight: .bold)).tracking(3)
                .foregroundColor(archetype.color)
              Text("Target: \(plan.dailyMhzTarget)+ MHz").font(
                .system(size: 14, weight: .bold, design: .rounded)
              ).foregroundColor(Palette.text.primary)
              Text("Protein: \(archetype.dailyProteinGrams)").font(
                .system(size: 12, weight: .medium)
              ).foregroundColor(Palette.text.muted)
            }
            .padding(.top, 12)

            // Disclaimers
            DisclaimerBanner(type: .fitness)

            // Key Nutrients
            VStack(alignment: .leading, spacing: 8) {
              Text("KEY NUTRIENT FOCUS").font(.system(size: 9, weight: .bold)).tracking(1)
                .foregroundColor(archetype.color)
              ForEach(archetype.keyNutrientFocus, id: \.self) { nutrient in
                HStack(spacing: 6) {
                  Circle().fill(archetype.color).frame(width: 4, height: 4)
                  Text(nutrient).font(.system(size: 12, weight: .medium)).foregroundColor(
                    Palette.text.secondary)
                }
              }
            }
            .padding(12)
            .background(RoundedRectangle(cornerRadius: 12).fill(archetype.color.opacity(0.04)))

            // Pre-Workout
            mealCard(plan.preworkout, label: "PRE-WORKOUT", color: Color(hex: "#F39C12"))

            // Post-Workout
            mealCard(plan.postworkout, label: "POST-WORKOUT", color: Color(hex: "#2ECC71"))

            // Main Meals
            ForEach(plan.mainMeals) { meal in
              mealCard(meal, label: meal.timing.uppercased(), color: archetype.color)
            }

            // Snacks
            VStack(alignment: .leading, spacing: 8) {
              Text("HIGH-VIBE SNACKS").font(.system(size: 9, weight: .bold)).tracking(1)
                .foregroundColor(Palette.text.muted)
              ForEach(plan.snacks, id: \.self) { snack in
                HStack(spacing: 6) {
                  Image(systemName: "leaf.fill").font(.system(size: 9)).foregroundColor(
                    Color(hex: "#2ECC71"))
                  Text(snack).font(.system(size: 12, weight: .medium)).foregroundColor(
                    Palette.text.secondary)
                }
              }
            }
            .padding(12)
            .background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.03)))

            // Hydration
            VStack(alignment: .leading, spacing: 6) {
              HStack(spacing: 4) {
                Image(systemName: "drop.fill").foregroundColor(Color(hex: "#00BFFF"))
                Text("HYDRATION").font(.system(size: 9, weight: .bold)).tracking(1).foregroundColor(
                  Color(hex: "#00BFFF"))
              }
              Text(plan.hydrationNote).font(.system(size: 12, weight: .medium)).foregroundColor(
                Palette.text.secondary
              ).lineSpacing(3)
            }
            .padding(12)
            .background(
              RoundedRectangle(cornerRadius: 10).fill(Color(hex: "#00BFFF").opacity(0.04)))

            // Research encouragement
            Text(
              "Research is current as of 2025. We encourage additional research and professional consultation. Updates will be ongoing."
            )
            .font(.system(size: 10, weight: .medium)).foregroundColor(Palette.text.muted)
            .multilineTextAlignment(.center).padding(.top, 8)

            Spacer(minLength: 100)
          }
          .padding(.horizontal, 20)
        }
      }
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItem(placement: .navigationBarTrailing) {
          Button("Done") { dismiss() }.foregroundColor(archetype.color)
        }
      }
    }
  }

  private func mealCard(_ meal: MealSlot, label: String, color: Color) -> some View {
    VStack(alignment: .leading, spacing: 10) {
      HStack {
        Text(label).font(.system(size: 9, weight: .bold)).tracking(1).foregroundColor(color)
        Spacer()
        Text("\(meal.proteinGrams)g protein").font(.system(size: 10, weight: .bold))
          .foregroundColor(Color(hex: "#E74C3C").opacity(0.7))
        Text("~\(meal.mhzEstimate) MHz").font(.system(size: 10, weight: .bold)).foregroundColor(
          Color(hex: "#2ECC71").opacity(0.7))
      }
      Text(meal.name).font(.system(size: 15, weight: .bold, design: .rounded)).foregroundColor(
        Palette.text.primary)
      Text(meal.timing).font(.system(size: 10, weight: .medium)).foregroundColor(Palette.text.muted)

      ForEach(meal.foods, id: \.self) { food in
        HStack(spacing: 6) {
          Image(systemName: "checkmark.circle.fill").font(.system(size: 9)).foregroundColor(
            color.opacity(0.5))
          Text(food).font(.system(size: 12, weight: .medium)).foregroundColor(
            Palette.text.secondary)
        }
      }

      if !meal.tip.isEmpty {
        HStack(spacing: 4) {
          Text("💡").font(.system(size: 10))
          Text(meal.tip).font(.system(size: 11, weight: .medium, design: .rounded)).foregroundColor(
            Palette.accent.gold
          ).italic().lineSpacing(2)
        }
        .padding(8)
        .background(RoundedRectangle(cornerRadius: 6).fill(Palette.accent.gold.opacity(0.06)))
      }
    }
    .padding(14)
    .background(
      RoundedRectangle(cornerRadius: 14)
        .fill(color.opacity(0.04))
        .overlay(RoundedRectangle(cornerRadius: 14).stroke(color.opacity(0.15), lineWidth: 1))
    )
  }
}

// MARK: - Supplement Scanner View

struct SupplementScannerView: View {
  @Environment(\.dismiss) var dismiss
  @State private var ingredientText = ""
  @State private var scanResults: [(keyword: String, warning: String)] = []
  @State private var hasScanned = false

  var body: some View {
    NavigationStack {
      ZStack {
        Color.black.ignoresSafeArea()
        ScrollView(showsIndicators: false) {
          VStack(spacing: 16) {
            VStack(spacing: 8) {
              Image(systemName: "pills.fill").font(.system(size: 36)).foregroundColor(
                Color(hex: "#9B59B6"))
              Text("SUPPLEMENT SCANNER").font(.system(size: 10, weight: .bold)).tracking(4)
                .foregroundColor(Color(hex: "#9B59B6"))
              Text("Paste Supplement Ingredients").font(
                .system(size: 18, weight: .bold, design: .rounded)
              ).foregroundColor(Palette.text.primary)
            }
            .padding(.top, 12)

            DisclaimerBanner(type: .supplement)

            // Input
            TextEditor(text: $ingredientText)
              .font(.system(size: 13, weight: .medium, design: .monospaced))
              .foregroundColor(Palette.text.primary)
              .scrollContentBackground(.hidden)
              .frame(minHeight: 120)
              .padding(12)
              .background(RoundedRectangle(cornerRadius: 12).fill(Color.white.opacity(0.04)))
              .overlay(
                RoundedRectangle(cornerRadius: 12).stroke(
                  Color(hex: "#9B59B6").opacity(0.2), lineWidth: 1))

            Button {
              scanResults = SupplementRedFlagDatabase.scanIngredients(ingredientText)
              hasScanned = true
              HapticManager.shared.medium()
            } label: {
              HStack {
                Image(systemName: "magnifyingglass")
                Text("SCAN FOR RED FLAGS")
              }
              .font(.system(size: 14, weight: .bold, design: .rounded))
              .foregroundColor(.black)
              .frame(maxWidth: .infinity).padding(14)
              .background(RoundedRectangle(cornerRadius: 12).fill(Color(hex: "#9B59B6")))
            }

            if hasScanned {
              if scanResults.isEmpty {
                VStack(spacing: 8) {
                  Image(systemName: "checkmark.circle.fill").font(.system(size: 30))
                    .foregroundColor(Color(hex: "#2ECC71"))
                  Text("No known red flags detected").font(.system(size: 14, weight: .bold))
                    .foregroundColor(Color(hex: "#2ECC71"))
                  Text(
                    "This doesn't guarantee safety — always research individual ingredients and consult your healthcare provider."
                  )
                  .font(.system(size: 11, weight: .medium)).foregroundColor(Palette.text.muted)
                  .multilineTextAlignment(.center)
                }
                .padding(16)
              } else {
                VStack(spacing: 8) {
                  HStack {
                    Image(systemName: "exclamationmark.triangle.fill").foregroundColor(
                      Color(hex: "#E74C3C"))
                    Text("\(scanResults.count) RED FLAG\(scanResults.count == 1 ? "" : "S") FOUND")
                      .font(.system(size: 12, weight: .bold)).foregroundColor(Color(hex: "#E74C3C"))
                  }
                  ForEach(scanResults, id: \.keyword) { result in
                    HStack(spacing: 8) {
                      Image(systemName: "xmark.circle.fill").foregroundColor(Color(hex: "#E74C3C"))
                      VStack(alignment: .leading, spacing: 2) {
                        Text(result.keyword.capitalized).font(.system(size: 13, weight: .bold))
                          .foregroundColor(Palette.text.primary)
                        Text(result.warning).font(.system(size: 11, weight: .medium))
                          .foregroundColor(Palette.text.muted)
                      }
                      Spacer()
                    }
                    .padding(10)
                    .background(
                      RoundedRectangle(cornerRadius: 8).fill(Color(hex: "#E74C3C").opacity(0.06)))
                  }
                }
              }
            }

            // Known ingredients guide
            VStack(alignment: .leading, spacing: 8) {
              Text("QUICK REFERENCE").font(.system(size: 9, weight: .bold)).tracking(1)
                .foregroundColor(Palette.text.muted)
              ForEach(SupplementRedFlagDatabase.ingredients.prefix(6)) { ingredient in
                HStack(spacing: 8) {
                  Image(systemName: ingredient.verdict.icon).font(.system(size: 12))
                    .foregroundColor(ingredient.verdict.color)
                  Text(ingredient.name).font(.system(size: 12, weight: .bold)).foregroundColor(
                    Palette.text.primary)
                  Spacer()
                  Text(ingredient.verdict.rawValue).font(.system(size: 9, weight: .bold))
                    .foregroundColor(ingredient.verdict.color)
                }
              }
            }
            .padding(12)
            .background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.03)))

            Spacer(minLength: 100)
          }
          .padding(.horizontal, 20)
        }
      }
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItem(placement: .navigationBarTrailing) {
          Button("Done") { dismiss() }.foregroundColor(Color(hex: "#9B59B6"))
        }
      }
    }
  }
}

// MARK: - High-Vibe Protein Guide

struct HighVibeProteinGuideView: View {
  @Environment(\.dismiss) var dismiss
  @State private var filterArchetype: AthleteArchetype? = nil

  var filteredProteins: [HighVibeProtein] {
    if let arch = filterArchetype {
      return QuantumProteinDatabase.proteinsFor(arch)
    }
    return QuantumProteinDatabase.proteins.sorted { $0.mhzEstimate > $1.mhzEstimate }
  }

  var body: some View {
    NavigationStack {
      ZStack {
        Color.black.ignoresSafeArea()
        ScrollView(showsIndicators: false) {
          VStack(spacing: 16) {
            proteinHeader
            DisclaimerBanner(type: .nutritional)
            archetypeFilter
            proteinList
            Spacer(minLength: 100)
          }
          .padding(.horizontal, 20)
        }
      }
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItem(placement: .navigationBarTrailing) {
          Button("Done") { dismiss() }.foregroundColor(Color(hex: "#E74C3C"))
        }
      }
    }
  }

  private var proteinHeader: some View {
    VStack(spacing: 8) {
      Text("HIGH-VIBE PROTEIN SOURCES").font(.system(size: 10, weight: .bold)).tracking(3)
        .foregroundColor(Color(hex: "#E74C3C"))
      Text("Consciousness-Friendly Power").font(.system(size: 20, weight: .bold, design: .rounded))
        .foregroundColor(Palette.text.primary)
    }
    .padding(.top, 12)
  }

  private var archetypeFilter: some View {
    ScrollView(.horizontal, showsIndicators: false) {
      HStack(spacing: 8) {
        filterChip(label: "All", selected: filterArchetype == nil) { filterArchetype = nil }
        ForEach(AthleteArchetype.allCases) { arch in
          filterChip(label: arch.rawValue, selected: filterArchetype == arch) {
            filterArchetype = arch
          }
        }
      }
    }
  }

  private var proteinList: some View {
    ForEach(filteredProteins) { protein in
      ProteinCardView(protein: protein)
    }
  }

  private func filterChip(label: String, selected: Bool, action: @escaping () -> Void) -> some View
  {
    Button(action: action) {
      Text(label).font(.system(size: 10, weight: .bold, design: .rounded))
        .foregroundColor(selected ? .black : Palette.text.muted)
        .padding(.horizontal, 10).padding(.vertical, 6)
        .background(Capsule().fill(selected ? Color(hex: "#E74C3C") : Color.white.opacity(0.06)))
    }
    .buttonStyle(.plain)
  }
}

// MARK: - Protein Card (extracted for type-checker)

private struct ProteinCardView: View {
  let protein: HighVibeProtein

  var body: some View {
    VStack(alignment: .leading, spacing: 8) {
      headerRow
      Text(protein.notes)
        .font(.system(size: 12, weight: .medium))
        .foregroundColor(Palette.text.secondary)
        .lineSpacing(3)
      if protein.pinealSafe {
        pinealBadge
      }
    }
    .padding(12)
    .background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.03)))
  }

  private var headerRow: some View {
    HStack {
      Text(protein.name)
        .font(.system(size: 15, weight: .bold, design: .rounded))
        .foregroundColor(Palette.text.primary)
      Spacer()
      Text("\(protein.proteinPer100g)g/100g")
        .font(.system(size: 11, weight: .bold))
        .foregroundColor(Color(hex: "#E74C3C"))
      Text("~\(protein.mhzEstimate) MHz")
        .font(.system(size: 11, weight: .bold))
        .foregroundColor(Color(hex: "#2ECC71"))
    }
  }

  private var pinealBadge: some View {
    HStack(spacing: 4) {
      Image(systemName: "eye.fill").font(.system(size: 9)).foregroundColor(Color(hex: "#9B59B6"))
      Text("Pineal safe").font(.system(size: 9, weight: .bold)).foregroundColor(
        Color(hex: "#9B59B6"))
    }
  }
}
