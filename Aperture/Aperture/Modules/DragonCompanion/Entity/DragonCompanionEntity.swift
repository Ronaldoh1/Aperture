// DragonCompanionEntity.swift
// Your dragon companion grows with your awakening

import SwiftUI

// MARK: - Dragon Companion

struct DragonCompanion: Identifiable, Codable {

    let id: UUID
    var name: String
    var stage: DragonStage
    var primaryElement: DragonElement
    var secondaryElement: DragonElement?
    var chakraProgress: [ChakraLevel]
    var traits: [DragonTrait]
    var birthDate: Date
    var totalXP: Int
    var currentMood: DragonMood

    var age: Int {
        Calendar.current.dateComponents([.day], from: birthDate, to: Date()).day ?? 0
    }

    var level: Int {
        // Every 1000 XP = 1 level
        return totalXP / 1000
    }

    var xpToNextLevel: Int {
        return 1000 - (totalXP % 1000)
    }

    var dominantChakra: ChakraType? {
        chakraProgress.max(by: { $0.progress < $1.progress })?.chakra
    }

}

// MARK: - Dragon Stage

enum DragonStage: String, Codable, CaseIterable {

    case egg = "Egg"
    case hatching = "Hatching"
    case hatchling = "Hatchling"
    case young = "Young Dragon"
    case adolescent = "Adolescent"
    case adult = "Adult Dragon"
    case elder = "Elder Dragon"
    case ascended = "Ascended"

    var description: String {
        switch self {
        case .egg:
            return "A mysterious egg pulses with potential energy. Something stirs within..."
        case .hatching:
            return "Cracks appear! Your dedication has awakened the spirit inside."
        case .hatchling:
            return "A tiny dragon emerges, curious and full of wonder. The journey begins."
        case .young:
            return "Growing stronger each day. Wings are forming. Fire is kindling."
        case .adolescent:
            return "Scales shimmer with newfound colors. The dragon tests its abilities."
        case .adult:
            return "A magnificent creature of wisdom and power. Ready to soar."
        case .elder:
            return "Ancient knowledge flows through. A guide for others on the path."
        case .ascended:
            return "Transcendent. The dragon has become one with the cosmic flow."
        }
    }

    var requiredXP: Int {
        switch self {
        case .egg: return 0
        case .hatching: return 500
        case .hatchling: return 2000
        case .young: return 5000
        case .adolescent: return 10000
        case .adult: return 20000
        case .elder: return 40000
        case .ascended: return 100000
        }
    }

    var icon: String {
        switch self {
        case .egg: return "oval.fill"
        case .hatching: return "oval.lefthalf.filled"
        case .hatchling: return "bird.fill"
        case .young: return "flame.fill"
        case .adolescent: return "wind"
        case .adult: return "bolt.fill"
        case .elder: return "sparkles"
        case .ascended: return "sun.max.fill"
        }
    }

    static func stageFor(xp: Int) -> DragonStage {
        for stage in DragonStage.allCases.reversed() {
            if xp >= stage.requiredXP {
                return stage
            }
        }
        return .egg
    }

}

// MARK: - Dragon Element

enum DragonElement: String, Codable, CaseIterable {

    case fire = "Fire"
    case water = "Water"
    case earth = "Earth"
    case air = "Air"
    case void = "Void"
    case light = "Light"
    case shadow = "Shadow"
    case cosmic = "Cosmic"

    var color: Color {
        switch self {
        case .fire: return Color(hex: "#FF6B35")
        case .water: return Color(hex: "#4FC3F7")
        case .earth: return Color(hex: "#8D6E63")
        case .air: return Color(hex: "#B0BEC5")
        case .void: return Color(hex: "#7C5CFF")
        case .light: return Color(hex: "#FFD700")
        case .shadow: return Color(hex: "#37474F")
        case .cosmic: return Color(hex: "#E040FB")
        }
    }

    var icon: String {
        switch self {
        case .fire: return "flame.fill"
        case .water: return "drop.fill"
        case .earth: return "leaf.fill"
        case .air: return "wind"
        case .void: return "circle.hexagongrid.fill"
        case .light: return "sun.max.fill"
        case .shadow: return "moon.fill"
        case .cosmic: return "sparkles"
        }
    }

    var description: String {
        switch self {
        case .fire: return "Passion, transformation, will to act"
        case .water: return "Emotion, intuition, adaptability"
        case .earth: return "Stability, patience, grounding"
        case .air: return "Intellect, communication, freedom"
        case .void: return "Mystery, potential, the unknown"
        case .light: return "Truth, clarity, divine wisdom"
        case .shadow: return "Hidden knowledge, inner work"
        case .cosmic: return "Universal connection, transcendence"
        }
    }

    // Element determined by dominant course completions
    static func elementFor(coursePath: CoursePath) -> DragonElement {
        switch coursePath {
        case .truthSeeker: return .light
        case .historyReclaimer: return .earth
        case .consciousnessExplorer: return .cosmic
        case .systemsBreaker: return .fire
        case .spiritualWarrior: return .void
        case .patternRecognizer: return .air
        case .innerAlchemist: return .water
        case .shadowIntegrator: return .shadow
        }
    }

}

// MARK: - Course Path

enum CoursePath: String, Codable, CaseIterable {

    case truthSeeker = "Truth Seeker"
    case historyReclaimer = "History Reclaimer"
    case consciousnessExplorer = "Consciousness Explorer"
    case systemsBreaker = "Systems Breaker"
    case spiritualWarrior = "Spiritual Warrior"
    case patternRecognizer = "Pattern Recognizer"
    case innerAlchemist = "Inner Alchemist"
    case shadowIntegrator = "Shadow Integrator"

    var courses: [String] {
        switch self {
        case .truthSeeker:
            return ["Institutional Lies", "Master Lies", "Lies Exposed"]
        case .historyReclaimer:
            return ["Hidden History", "Colonial Christianity", "Egyptian Yeshua"]
        case .consciousnessExplorer:
            return ["PhD Consciousness", "Quantum Reality", "Sacred Geometry"]
        case .systemsBreaker:
            return ["The Matrix", "Control Systems", "Great Scams"]
        case .spiritualWarrior:
            return ["Religion Exposed", "Bible Decoded", "Gnostic Wisdom"]
        case .patternRecognizer:
            return ["Pattern Recognition", "Left vs Right", "Race Lie"]
        case .innerAlchemist:
            return ["SunFlow State", "Divine Feminine", "Inner Work"]
        case .shadowIntegrator:
            return ["Demiurge", "Shadow Work", "Anime Wisdom"]
        }
    }

}

// MARK: - Chakra Level

struct ChakraLevel: Codable, Identifiable {

    var id: String { chakra.rawValue }
    let chakra: ChakraType
    var progress: Double  // 0.0 to 1.0
    var isActivated: Bool

}

enum ChakraType: String, Codable, CaseIterable {

    case root = "Root"
    case sacral = "Sacral"
    case solarPlexus = "Solar Plexus"
    case heart = "Heart"
    case throat = "Throat"
    case thirdEye = "Third Eye"
    case crown = "Crown"

    var color: Color {
        switch self {
        case .root: return Color(hex: "#FF0000")
        case .sacral: return Color(hex: "#FF7F00")
        case .solarPlexus: return Color(hex: "#FFFF00")
        case .heart: return Color(hex: "#00FF00")
        case .throat: return Color(hex: "#00BFFF")
        case .thirdEye: return Color(hex: "#4B0082")
        case .crown: return Color(hex: "#9400D3")
        }
    }

    var position: Int {
        switch self {
        case .root: return 1
        case .sacral: return 2
        case .solarPlexus: return 3
        case .heart: return 4
        case .throat: return 5
        case .thirdEye: return 6
        case .crown: return 7
        }
    }

    // Tesla's numerology connection
    var teslaNumber: Int {
        switch self {
        case .root: return 1
        case .sacral: return 2
        case .solarPlexus: return 3  // ← 3
        case .heart: return 9        // ← 9 (center, love)
        case .throat: return 5
        case .thirdEye: return 6     // ← 6
        case .crown: return 0        // ← 0 (infinite/source)
        }
    }

    var courses: [String] {
        switch self {
        case .root:
            return ["Institutional Lies", "Control Systems"]  // Survival, security
        case .sacral:
            return ["Divine Feminine", "Inner Work"]  // Creation, emotion
        case .solarPlexus:
            return ["SunFlow State", "The Matrix"]  // Will, power
        case .heart:
            return ["Anime Wisdom", "Consciousness"]  // Love, connection
        case .throat:
            return ["Pattern Recognition", "Bible Decoded"]  // Truth, expression
        case .thirdEye:
            return ["Gnostic Wisdom", "Hidden History"]  // Intuition, insight
        case .crown:
            return ["Quantum Reality", "Sacred Geometry"]  // Divine connection
        }
    }

}

// MARK: - Dragon Trait

struct DragonTrait: Codable, Identifiable {

    let id: String
    let name: String
    let description: String
    let icon: String
    let rarity: TraitRarity
    let unlockedBy: String  // Course or achievement that unlocked it

}

enum TraitRarity: String, Codable {

    case common = "Common"
    case uncommon = "Uncommon"
    case rare = "Rare"
    case epic = "Epic"
    case legendary = "Legendary"
    case mythic = "Mythic"

    var color: Color {
        switch self {
        case .common: return .gray
        case .uncommon: return .green
        case .rare: return .blue
        case .epic: return .purple
        case .legendary: return Color(hex: "#FFD700")
        case .mythic: return Color(hex: "#FF6B6B")
        }
    }

}

extension DragonTrait {

    static let availableTraits: [DragonTrait] = [

        // Truth Path Traits
        DragonTrait(
            id: "truth_seeker",
            name: "Truth Seeker",
            description: "Can see through deception. Institutional lies no longer work.",
            icon: "eye.fill",
            rarity: .uncommon,
            unlockedBy: "Institutional Lies"
        ),
        DragonTrait(
            id: "lie_detector",
            name: "Lie Detector",
            description: "Instinctively recognizes manipulation patterns.",
            icon: "exclamationmark.triangle.fill",
            rarity: .rare,
            unlockedBy: "Master Lies"
        ),

        // History Path Traits
        DragonTrait(
            id: "memory_keeper",
            name: "Memory Keeper",
            description: "Carries the knowledge of hidden history.",
            icon: "book.closed.fill",
            rarity: .uncommon,
            unlockedBy: "Hidden History"
        ),
        DragonTrait(
            id: "ancestor_connected",
            name: "Ancestor Connected",
            description: "Channel wisdom from those who came before.",
            icon: "person.3.fill",
            rarity: .rare,
            unlockedBy: "Colonial Christianity"
        ),

        // Consciousness Path Traits
        DragonTrait(
            id: "third_eye_open",
            name: "Third Eye Open",
            description: "Perceives beyond the material realm.",
            icon: "eye.trianglebadge.exclamationmark.fill",
            rarity: .epic,
            unlockedBy: "PhD Consciousness"
        ),
        DragonTrait(
            id: "quantum_aware",
            name: "Quantum Aware",
            description: "Understands the observer affects reality.",
            icon: "atom",
            rarity: .legendary,
            unlockedBy: "Quantum Reality"
        ),

        // Systems Path Traits
        DragonTrait(
            id: "matrix_vision",
            name: "Matrix Vision",
            description: "Sees the code behind the simulation.",
            icon: "rectangle.on.rectangle.angled",
            rarity: .rare,
            unlockedBy: "The Matrix"
        ),
        DragonTrait(
            id: "unchained",
            name: "Unchained",
            description: "Free from systemic control mechanisms.",
            icon: "link.badge.plus",
            rarity: .epic,
            unlockedBy: "Control Systems"
        ),

        // Spiritual Path Traits
        DragonTrait(
            id: "gnostic_flame",
            name: "Gnostic Flame",
            description: "Carries the divine spark of direct knowing.",
            icon: "flame.fill",
            rarity: .epic,
            unlockedBy: "Religion Exposed"
        ),
        DragonTrait(
            id: "scripture_decoder",
            name: "Scripture Decoder",
            description: "Reads between the lines of sacred texts.",
            icon: "scroll.fill",
            rarity: .rare,
            unlockedBy: "Bible Decoded"
        ),

        // Flow Path Traits
        DragonTrait(
            id: "flow_master",
            name: "Flow Master",
            description: "Enters flow state on command.",
            icon: "water.waves",
            rarity: .legendary,
            unlockedBy: "SunFlow State"
        ),
        DragonTrait(
            id: "ultra_instinct",
            name: "Ultra Instinct",
            description: "The body moves before the mind thinks.",
            icon: "sparkles",
            rarity: .mythic,
            unlockedBy: "Complete SunFlow State"
        ),

        // Anime Wisdom Traits
        DragonTrait(
            id: "saiyan_spirit",
            name: "Saiyan Spirit",
            description: "Gets stronger after every defeat.",
            icon: "bolt.fill",
            rarity: .epic,
            unlockedBy: "Dragon Ball Awakening"
        ),
        DragonTrait(
            id: "cosmos_burn",
            name: "Cosmos Burn",
            description: "Burns with the power of the constellations.",
            icon: "star.fill",
            rarity: .epic,
            unlockedBy: "Saint Seiya"
        ),

        // Ultimate Traits
        DragonTrait(
            id: "awakened_one",
            name: "Awakened One",
            description: "Fully conscious. No longer asleep.",
            icon: "sun.max.fill",
            rarity: .legendary,
            unlockedBy: "Complete All Core Courses"
        ),
        DragonTrait(
            id: "light_bringer",
            name: "Light Bringer",
            description: "Illuminates the path for others.",
            icon: "light.max",
            rarity: .mythic,
            unlockedBy: "Help 10 Others Awaken"
        ),
        DragonTrait(
            id: "creator_of_good",
            name: "Creator of Good",
            description: "Uses knowledge to make the world better.",
            icon: "heart.fill",
            rarity: .mythic,
            unlockedBy: "Complete Journey + Create Content"
        )

    ]

}

// MARK: - Dragon Mood

enum DragonMood: String, Codable, CaseIterable {

    case sleeping = "Sleeping"
    case curious = "Curious"
    case excited = "Excited"
    case proud = "Proud"
    case meditative = "Meditative"
    case playful = "Playful"
    case fierce = "Fierce"
    case transcendent = "Transcendent"

    var emoji: String {
        switch self {
        case .sleeping: return "😴"
        case .curious: return "🤔"
        case .excited: return "🔥"
        case .proud: return "😤"
        case .meditative: return "🧘"
        case .playful: return "😜"
        case .fierce: return "😈"
        case .transcendent: return "✨"
        }
    }

    var animation: String {
        switch self {
        case .sleeping: return "breathing"
        case .curious: return "head_tilt"
        case .excited: return "bouncing"
        case .proud: return "chest_puff"
        case .meditative: return "floating"
        case .playful: return "spinning"
        case .fierce: return "roaring"
        case .transcendent: return "glowing"
        }
    }

}
