// QuantumNourishModel.swift
// QUANTUM NOURISH — The Ultimate Consciousness Diet Engine
// ☀️ SunFlow: Reignited

import SwiftUI

// MARK: - Frequency Tier

enum FrequencyTier: String, CaseIterable, Codable {
  case destructive = "Destructive"
  case acidic = "Acidic"
  case low = "Low"
  case neutral = "Neutral"
  case mediumLow = "Medium Low"
  case mediumHigh = "Medium High"
  case high = "High"
  case superHigh = "Super High"

  var mhzRange: String {
    switch self {
    case .destructive: return "0-5 MHz"
    case .acidic: return "5-10 MHz"
    case .low: return "10-15 MHz"
    case .neutral: return "15-25 MHz"
    case .mediumLow: return "25-50 MHz"
    case .mediumHigh: return "50-72 MHz"
    case .high: return "72-90 MHz"
    case .superHigh: return "90-320+ MHz"
    }
  }

  var color: Color {
    switch self {
    case .destructive: return Color(hex: "#4A0000")
    case .acidic: return Color(hex: "#FF0000")
    case .low: return Color(hex: "#FF6600")
    case .neutral: return Color(hex: "#FFCC00")
    case .mediumLow: return Color(hex: "#99CC00")
    case .mediumHigh: return Color(hex: "#00CC66")
    case .high: return Color(hex: "#0099FF")
    case .superHigh: return Color(hex: "#9933FF")
    }
  }

  var icon: String {
    switch self {
    case .destructive: return "xmark.octagon.fill"
    case .acidic: return "exclamationmark.triangle.fill"
    case .low: return "arrow.down.circle.fill"
    case .neutral: return "minus.circle.fill"
    case .mediumLow: return "arrow.up.right.circle.fill"
    case .mediumHigh: return "arrow.up.circle.fill"
    case .high: return "star.circle.fill"
    case .superHigh: return "sparkles"
    }
  }

  var description: String {
    switch self {
    case .destructive:
      return
        "Actively destroys cellular coherence. Calcifies the pineal gland. Disrupts the electromagnetic field."
    case .acidic:
      return "Creates acidic environment. Feeds inflammation. Lowers energy body resonance."
    case .low:
      return "Minimal life force. Heavily processed. Dead frequency — no biophotonic activity."
    case .neutral:
      return "Neither harmful nor elevating. Maintains baseline but doesn't raise vibration."
    case .mediumLow:
      return
        "Beginning to carry life force. Some biophotonic activity. Supports basic cellular function."
    case .mediumHigh:
      return "Strong life force. Active enzymes. Supports chakra alignment and mental clarity."
    case .high:
      return
        "Powerful vibrational food. Enhances intuition, pineal activation, and electromagnetic coherence."
    case .superHigh:
      return
        "Transcendent frequency. Essential oils, raw superfoods, and sacred plant medicines that activate dormant DNA."
    }
  }

  var vibeScore: Int {
    switch self {
    case .destructive: return -3
    case .acidic: return -2
    case .low: return -1
    case .neutral: return 0
    case .mediumLow: return 1
    case .mediumHigh: return 2
    case .high: return 3
    case .superHigh: return 5
    }
  }

  var chakraConnection: String {
    switch self {
    case .destructive: return "Blocks all energy centers"
    case .acidic: return "Destabilizes root chakra"
    case .low: return "Weighs down sacral energy"
    case .neutral: return "Solar plexus baseline"
    case .mediumLow: return "Supports heart opening"
    case .mediumHigh: return "Activates throat expression"
    case .high: return "Opens third eye perception"
    case .superHigh: return "Crown chakra illumination"
    }
  }
}

// MARK: - Food Item

struct QuantumFood: Identifiable, Codable, Hashable {
  let id: String
  let name: String
  let tier: FrequencyTier
  let mhzEstimate: Int  // Approximate MHz
  let category: FoodCategory
  let effects: [String]
  let avoidReasons: [String]
  let alternatives: [String]
  let quantumNote: String  // The SunFlow deep-dive
  let pinealImpact: PinealImpact
  let gutBrainScore: Int  // -3 to +3
}

enum FoodCategory: String, CaseIterable, Codable {
  case fruit = "Fruits"
  case vegetable = "Vegetables"
  case grain = "Grains & Legumes"
  case protein = "Protein"
  case dairy = "Dairy"
  case beverage = "Beverages"
  case superfood = "Superfoods"
  case herb = "Herbs & Spices"
  case oil = "Oils"
  case processed = "Processed"
  case additive = "Additives & Chemicals"
  case sacredPlant = "Sacred Plants"
  case essentialOil = "Essential Oils"

  var icon: String {
    switch self {
    case .fruit: return "🍎"
    case .vegetable: return "🥬"
    case .grain: return "🌾"
    case .protein: return "🥩"
    case .dairy: return "🧀"
    case .beverage: return "🥤"
    case .superfood: return "✨"
    case .herb: return "🌿"
    case .oil: return "🫒"
    case .processed: return "🏭"
    case .additive: return "⚠️"
    case .sacredPlant: return "🌱"
    case .essentialOil: return "💧"
    }
  }
}

enum PinealImpact: String, Codable {
  case calcifies = "Calcifies"
  case neutral = "Neutral"
  case supports = "Supports"
  case activates = "Activates"
  case decalcifies = "Decalcifies"

  var color: Color {
    switch self {
    case .calcifies: return .red
    case .neutral: return .gray
    case .supports: return .green
    case .activates: return Color(hex: "#9933FF")
    case .decalcifies: return Color(hex: "#00CCFF")
    }
  }

  var icon: String {
    switch self {
    case .calcifies: return "eye.slash.fill"
    case .neutral: return "minus.circle"
    case .supports: return "eye.circle"
    case .activates: return "eye.fill"
    case .decalcifies: return "sparkle"
    }
  }
}

// MARK: - Six Pillars of Quantum Nutrition

enum QuantumPillar: String, CaseIterable {
  case gutBrain = "Gut-Brain Axis"
  case pineal = "Pineal Activation"
  case pituitary = "Pituitary Support"
  case mitochondrial = "Mitochondrial Fuel"
  case emField = "EM Field Support"
  case quantumFeast = "Quantum Feast"

  var icon: String {
    switch self {
    case .gutBrain: return "brain.head.profile"
    case .pineal: return "eye.fill"
    case .pituitary: return "circle.hexagongrid"
    case .mitochondrial: return "bolt.fill"
    case .emField: return "waveform.circle.fill"
    case .quantumFeast: return "atom"
    }
  }

  var color: Color {
    switch self {
    case .gutBrain: return Color(hex: "#FF6B6B")
    case .pineal: return Color(hex: "#9B59B6")
    case .pituitary: return Color(hex: "#3498DB")
    case .mitochondrial: return Color(hex: "#F1C40F")
    case .emField: return Color(hex: "#2ECC71")
    case .quantumFeast: return Color(hex: "#E74C3C")
    }
  }

  var description: String {
    switch self {
    case .gutBrain:
      return
        "The gut produces 90% of serotonin and 50% of dopamine. Heal your gut, heal your consciousness. Prebiotics, probiotics, and fermented foods rebuild the neural highway between belly and brain."
    case .pineal:
      return
        "Your pineal gland is the seat of the third eye — the antenna for higher consciousness. Fluoride, heavy metals, and processed foods calcify it. Specific foods decalcify and reactivate this sacred organ."
    case .pituitary:
      return
        "The master gland that orchestrates your entire endocrine system. Proper nutrition supports hormonal balance, growth hormone production, and the body's ability to regenerate at cellular level."
    case .mitochondrial:
      return
        "Your mitochondria are the power plants of consciousness. They convert food into ATP — the energy currency that powers every thought, every insight, every moment of awareness."
    case .emField:
      return
        "Your bioelectromagnetic field extends 3-5 feet from your body. High-frequency foods strengthen this field. Low-frequency foods create holes. Your aura is literally what you eat."
    case .quantumFeast:
      return
        "The synthesis of all pillars. Eating becomes ceremony. Food becomes medicine. Your plate becomes a portal for consciousness elevation."
    }
  }

  var topFoods: [String] {
    switch self {
    case .gutBrain:
      return [
        "Sauerkraut", "Kimchi", "Kefir", "Bone Broth", "Prebiotic Fiber", "Miso",
        "Apple Cider Vinegar",
      ]
    case .pineal:
      return ["Raw Cacao", "Turmeric", "Chlorella", "Spirulina", "Oregano Oil", "Neem", "Tamarind"]
    case .pituitary:
      return [
        "Raw Coconut Oil", "Manganese-rich foods", "Vitamin E foods", "Pumpkin Seeds",
        "Brazil Nuts",
      ]
    case .mitochondrial:
      return [
        "CoQ10 foods", "PQQ foods", "NAD+ precursors", "Wild-caught Salmon", "Grass-fed Liver",
      ]
    case .emField:
      return [
        "Living Sprouts", "Raw Greens", "Spring Water", "Grounding Foods", "Rose Essential Oil",
      ]
    case .quantumFeast:
      return [
        "Raw Organic Everything", "Blessed Water", "Conscious Preparation", "Sun-charged Foods",
      ]
    }
  }
}

// MARK: - Scan Result

struct IngredientScanResult: Identifiable {
  let id = UUID()
  let ingredientName: String
  let matchedFood: QuantumFood?
  let dangerLevel: FrequencyTier
  let explanation: String
  let alternatives: [String]
}

// MARK: - Daily Vibe Log

struct DailyVibeLog: Identifiable, Codable {
  let id: String
  let date: Date
  var meals: [MealEntry]

  var dailyVibeScore: Double {
    guard !meals.isEmpty else { return 0 }
    let total = meals.reduce(0.0) { $0 + Double($1.vibeScore) }
    return total / Double(meals.count)
  }

  var auraAverage: Int {
    guard !meals.isEmpty else { return 0 }
    let total = meals.reduce(0) { $0 + $1.estimatedMhz }
    return total / meals.count
  }
}

struct MealEntry: Identifiable, Codable {
  let id: String
  let timestamp: Date
  let mealType: MealType
  let foods: [String]  // food IDs
  var vibeScore: Int
  var estimatedMhz: Int
  var note: String
}

enum MealType: String, CaseIterable, Codable {
  case morning = "Morning Ritual"
  case midday = "Solar Peak"
  case evening = "Twilight Feast"
  case snack = "Conscious Snack"
  case elixir = "Elixir / Tonic"

  var icon: String {
    switch self {
    case .morning: return "sunrise.fill"
    case .midday: return "sun.max.fill"
    case .evening: return "sunset.fill"
    case .snack: return "leaf.fill"
    case .elixir: return "drop.fill"
    }
  }
}
