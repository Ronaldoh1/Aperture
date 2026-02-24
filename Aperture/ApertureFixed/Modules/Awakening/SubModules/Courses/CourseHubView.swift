// THE AWAKENING ACADEMY - All Courses In One Place

import SwiftUI

// MARK: - Course Catalog

struct CourseInfo: Identifiable {
    let id: String
    let title: String
    let subtitle: String
    let icon: String
    let colorHex: String
    let moduleCount: Int
    let estimatedHours: Double
    let category: CourseCategory
    let difficulty: CourseDifficulty
    
    var color: Color { Color(hex: colorHex) }
    
    enum CourseCategory: String, CaseIterable {
        case consciousness = "Consciousness"
        case spirituality = "Spirituality"
        case anime = "Anime Wisdom"
        case science = "Science"
        case systems = "Systems"
        case practical = "Practical"
        case financial = "Financial"
        
        var icon: String {
            switch self {
            case .consciousness: return "brain.head.profile"
            case .spirituality: return "sparkles"
            case .anime: return "tv"
            case .science: return "atom"
            case .systems: return "network"
            case .practical: return "hammer"
            case .financial: return "dollarsign.circle"
            }
        }
    }
    
    enum CourseDifficulty: String {
        case beginner = "Beginner"
        case intermediate = "Intermediate"
        case advanced = "Advanced"
        
        var color: Color {
            switch self {
            case .beginner: return .green
            case .intermediate: return .orange
            case .advanced: return .red
            }
        }
    }
}

struct CourseCatalog {
    static let courses: [CourseInfo] = [
        // ══════════════════════════════════════════════════
        // CORE AWAKENING (Start Here)
        // ══════════════════════════════════════════════════
        CourseInfo(
            id: "journeys_of_awakening",
            title: "Journeys of Awakening",
            subtitle: "Every tradition. Every path. Same territory.",
            icon: "sunrise.fill",
            colorHex: "#FF9933",
            moduleCount: 13,
            estimatedHours: 16,
            category: .consciousness,
            difficulty: .intermediate
        ),
        CourseInfo(
            id: "serpent_decoded",
            title: "The Serpent Decoded",
            subtitle: "The forbidden truth hidden for 2,000 years",
            icon: "waveform.path",
            colorHex: "#00FF66",
            moduleCount: 6,
            estimatedHours: 4,
            category: .consciousness,
            difficulty: .intermediate
        ),
        CourseInfo(
            id: "living_name",
            title: "The Living Name",
            subtitle: "What they buried when they changed his name",
            icon: "textformat.abc",
            colorHex: "#FFD700",
            moduleCount: 6,
            estimatedHours: 4,
            category: .consciousness,
            difficulty: .intermediate
        ),
        CourseInfo(
            id: "word_spells",
            title: "The Word Spells",
            subtitle: "Truth hidden in the words themselves",
            icon: "character.book.closed.fill",
            colorHex: "#9D4EDD",
            moduleCount: 6,
            estimatedHours: 3,
            category: .consciousness,
            difficulty: .beginner
        ),
        CourseInfo(
            id: "psyop_detection",
            title: "How to Spot a Psyop",
            subtitle: "The science of mass manipulation decoded",
            icon: "brain.head.profile",
            colorHex: "#FF3B30",
            moduleCount: 9,
            estimatedHours: 6,
            category: .systems,
            difficulty: .intermediate
        ),
        CourseInfo(
            id: "council_of_nicaea",
            title: "The Council of Nicaea",
            subtitle: "1,700 years of programming exposed",
            icon: "cross.fill",
            colorHex: "#8B0000",
            moduleCount: 6,
            estimatedHours: 4,
            category: .systems,
            difficulty: .advanced
        ),
        CourseInfo(
            id: "godmode_esoteric",
            title: "GodMode: Esoteric Path",
            subtitle: "7 Gates to the operant power",
            icon: "sparkle",
            colorHex: "#FFD700",
            moduleCount: 7,
            estimatedHours: 6,
            category: .consciousness,
            difficulty: .intermediate
        ),
        CourseInfo(
            id: "pattern_recognition",
            title: "Pattern Recognition",
            subtitle: "The skill that changes everything",
            icon: "eye.trianglebadge.exclamationmark",
            colorHex: "#FF6D00",
            moduleCount: 3,
            estimatedHours: 2,
            category: .consciousness,
            difficulty: .beginner
        ),
        CourseInfo(
            id: "consciousness_phd",
            title: "PhD Consciousness",
            subtitle: "The science & philosophy of mind",
            icon: "brain.head.profile",
            colorHex: "#9C27B0",
            moduleCount: 6,
            estimatedHours: 3,
            category: .consciousness,
            difficulty: .advanced
        ),
        CourseInfo(
            id: "drone_self",
            title: "The Drone Self",
            subtitle: "Quantum fields & embodied consciousness",
            icon: "antenna.radiowaves.left.and.right",
            colorHex: "#00E5FF",
            moduleCount: 7,
            estimatedHours: 6,
            category: .consciousness,
            difficulty: .advanced
        ),
        CourseInfo(
            id: "thoth_consciousness",
            title: "Thoth's Teachings",
            subtitle: "Consciousness is the fabric, not the byproduct",
            icon: "eye.trianglebadge.exclamationmark",
            colorHex: "#00E5FF",
            moduleCount: 8,
            estimatedHours: 4,
            category: .consciousness,
            difficulty: .intermediate
        ),
        CourseInfo(
            id: "emerald_tablets",
            title: "The Emerald Tablets",
            subtitle: "Ancient wisdom from the halls of Amenti",
            icon: "scroll.fill",
            colorHex: "#00FF88",
            moduleCount: 5,
            estimatedHours: 3,
            category: .consciousness,
            difficulty: .advanced
        ),
        CourseInfo(
            id: "ai_consciousness",
            title: "AI & Consciousness",
            subtitle: "The mirror that reveals who you really are",
            icon: "brain.head.profile",
            colorHex: "#00D4FF",
            moduleCount: 4,
            estimatedHours: 2.5,
            category: .consciousness,
            difficulty: .intermediate
        ),
        
        // ══════════════════════════════════════════════════
        // SPIRITUAL TRADITIONS
        // ══════════════════════════════════════════════════
        CourseInfo(
            id: "solar_sovereignty",
            title: "Solar Sovereignty",
            subtitle: "Align with the oldest rhythm",
            icon: "sun.max.fill",
            colorHex: "#FF9500",
            moduleCount: 2,
            estimatedHours: 1.5,
            category: .spirituality,
            difficulty: .beginner
        ),
        CourseInfo(
            id: "buddha_meditation",
            title: "Buddha's Path",
            subtitle: "The original awakening technology",
            icon: "figure.mind.and.body",
            colorHex: "#FF9800",
            moduleCount: 4,
            estimatedHours: 2.5,
            category: .spirituality,
            difficulty: .intermediate
        ),
        CourseInfo(
            id: "demiurge",
            title: "The Demiurge",
            subtitle: "Gnostic cosmology & the false god",
            icon: "eye.trianglebadge.exclamationmark",
            colorHex: "#8B0000",
            moduleCount: 3,
            estimatedHours: 1.5,
            category: .spirituality,
            difficulty: .advanced
        ),
        CourseInfo(
            id: "sacred_geometry",
            title: "Sacred Geometry",
            subtitle: "The language of creation",
            icon: "hexagon.fill",
            colorHex: "#7C4DFF",
            moduleCount: 4,
            estimatedHours: 2,
            category: .spirituality,
            difficulty: .intermediate
        ),
        // ☉ SunFlow: Reignited — Course I
        CourseInfo(
            id: "vortex_369_math",
            title: "The Key to the Universe",
            subtitle: "3-6-9, Vortex Math, Solfeggio & the Divine Matrix",
            icon: "infinity",
            colorHex: "#7B2FBE",
            moduleCount: 8,
            estimatedHours: 5,
            category: .spirituality,
            difficulty: .intermediate
        ),
        CourseInfo(
            id: "solar_theology",
            title: "Solar Theology",
            subtitle: "All religions trace back to sun worship",
            icon: "sun.max.fill",
            colorHex: "#FFD700",
            moduleCount: 6,
            estimatedHours: 4,
            category: .spirituality,
            difficulty: .advanced
        ),
        
        // ══════════════════════════════════════════════════
        // ANIME WISDOM
        // ══════════════════════════════════════════════════
        CourseInfo(
            id: "dragonball",
            title: "Dragon Ball Awakening",
            subtitle: "DB • DBZ • DBS consciousness teachings",
            icon: "sparkles",
            colorHex: "#FF6B00",
            moduleCount: 6,
            estimatedHours: 3.5,
            category: .anime,
            difficulty: .beginner
        ),
        CourseInfo(
            id: "saint_seiya",
            title: "Saint Seiya",
            subtitle: "The 12 Houses & warrior philosophy",
            icon: "shield.lefthalf.filled",
            colorHex: "#FFD700",
            moduleCount: 3,
            estimatedHours: 2,
            category: .anime,
            difficulty: .intermediate
        ),
        
        // ══════════════════════════════════════════════════
        // SCIENCE & REALITY
        // ══════════════════════════════════════════════════
        CourseInfo(
            id: "arrow_of_time",
            title: "The Arrow of Time",
            subtitle: "Why cups shatter but never unshatter",
            icon: "arrow.right.circle.fill",
            colorHex: "#7C4DFF",
            moduleCount: 3,
            estimatedHours: 2,
            category: .science,
            difficulty: .intermediate
        ),
        CourseInfo(
            id: "quantum",
            title: "Quantum Reality",
            subtitle: "Physics that changed everything",
            icon: "atom",
            colorHex: "#00BCD4",
            moduleCount: 3,
            estimatedHours: 1.5,
            category: .science,
            difficulty: .intermediate
        ),
        CourseInfo(
            id: "paradoxes",
            title: "Reality Paradoxes",
            subtitle: "When logic meets its limits",
            icon: "infinity",
            colorHex: "#9C27B0",
            moduleCount: 1,
            estimatedHours: 1,
            category: .science,
            difficulty: .intermediate
        ),
        CourseInfo(
            id: "recursion",
            title: "Recursion",
            subtitle: "The pattern that contains itself",
            icon: "repeat.circle.fill",
            colorHex: "#00BFA5",
            moduleCount: 3,
            estimatedHours: 1.5,
            category: .science,
            difficulty: .intermediate
        ),
        
        // ══════════════════════════════════════════════════
        // TECHNICAL AWAKENING
        // ══════════════════════════════════════════════════
        CourseInfo(
            id: "awakening_code",
            title: "Awakening Through Code",
            subtitle: "Swift as spiritual practice",
            icon: "chevron.left.forwardslash.chevron.right",
            colorHex: "#FF5722",
            moduleCount: 4,
            estimatedHours: 2.5,
            category: .practical,
            difficulty: .intermediate
        ),
        
        // ══════════════════════════════════════════════════
        // PRACTICAL TOOLS
        // ══════════════════════════════════════════════════
        CourseInfo(
            id: "planetary_cycles",
            title: "Planetary Cycles",
            subtitle: "Why your resolutions fail",
            icon: "calendar.circle.fill",
            colorHex: "#4CAF50",
            moduleCount: 3,
            estimatedHours: 1,
            category: .practical,
            difficulty: .beginner
        ),
        CourseInfo(
            id: "birth_chart",
            title: "Birth Chart",
            subtitle: "Your cosmic blueprint + calculator",
            icon: "star.circle.fill",
            colorHex: "#673AB7",
            moduleCount: 3,
            estimatedHours: 1.5,
            category: .practical,
            difficulty: .beginner
        ),
        
        // ══════════════════════════════════════════════════
        // SYSTEMS & TRUTH
        // ══════════════════════════════════════════════════
        CourseInfo(
            id: "scams_exposed",
            title: "The Great Scams",
            subtitle: "American Dream, College, Debt, Taxes",
            icon: "dollarsign.arrow.circlepath",
            colorHex: "#D32F2F",
            moduleCount: 4,
            estimatedHours: 2,
            category: .systems,
            difficulty: .beginner
        ),
        CourseInfo(
            id: "master_lies",
            title: "The Master Lies",
            subtitle: "Everything they told you was wrong",
            icon: "exclamationmark.triangle.fill",
            colorHex: "#FF1744",
            moduleCount: 9,
            estimatedHours: 4,
            category: .systems,
            difficulty: .intermediate
        ),
        CourseInfo(
            id: "systems_control",
            title: "Systems of Control",
            subtitle: "How power operates",
            icon: "eye.slash.circle.fill",
            colorHex: "#B71C1C",
            moduleCount: 4,
            estimatedHours: 2,
            category: .systems,
            difficulty: .advanced
        ),
        
        // ══════════════════════════════════════════════════
        // FINANCIAL LITERACY (Don't Get Played)
        // ══════════════════════════════════════════════════
        CourseInfo(
            id: "money-fundamentals",
            title: "Money Fundamentals",
            subtitle: "What they should have taught in school",
            icon: "dollarsign.circle.fill",
            colorHex: "#2E7D32",
            moduleCount: 4,
            estimatedHours: 4.5,
            category: .financial,
            difficulty: .beginner
        ),
        CourseInfo(
            id: "anti-scam-awareness",
            title: "Don't Fall For The Vibes",
            subtitle: "Protection from manipulation & scams",
            icon: "exclamationmark.shield.fill",
            colorHex: "#D32F2F",
            moduleCount: 4,
            estimatedHours: 3.5,
            category: .financial,
            difficulty: .beginner
        ),
        CourseInfo(
            id: "stock-market-fundamentals",
            title: "Stock Market Decoded",
            subtitle: "Investing vs gambling - know the difference",
            icon: "chart.xyaxis.line",
            colorHex: "#1976D2",
            moduleCount: 4,
            estimatedHours: 4.5,
            category: .financial,
            difficulty: .intermediate
        ),
        CourseInfo(
            id: "crypto-fundamentals",
            title: "Crypto Without The Hype",
            subtitle: "Understanding blockchain, not gambling",
            icon: "bitcoinsign.circle.fill",
            colorHex: "#FF9800",
            moduleCount: 4,
            estimatedHours: 4.5,
            category: .financial,
            difficulty: .intermediate
        ),
        
        // ══════════════════════════════════════════════════
        // ALEXANDRIA EXPANSION — NEW MODULES
        // ══════════════════════════════════════════════════
        CourseInfo(
            id: "antichrist_decoded",
            title: "The Anti-Christ Decoded",
            subtitle: "The lie behind the greatest fear — only 4 verses",
            icon: "eye.slash.fill",
            colorHex: "#FF2D55",
            moduleCount: 3,
            estimatedHours: 2.5,
            category: .consciousness,
            difficulty: .intermediate
        ),
        CourseInfo(
            id: "baphomet_mirror",
            title: "Baphomet — The Mirror",
            subtitle: "The truth behind the symbol of fear",
            icon: "pentagon.fill",
            colorHex: "#9D4EDD",
            moduleCount: 2,
            estimatedHours: 2,
            category: .consciousness,
            difficulty: .advanced
        ),
        CourseInfo(
            id: "gospel_judas",
            title: "The Gospel of Judas",
            subtitle: "Traitor or guardian of the forbidden secret?",
            icon: "key.fill",
            colorHex: "#C0392B",
            moduleCount: 1,
            estimatedHours: 1.5,
            category: .spirituality,
            difficulty: .advanced
        ),
        CourseInfo(
            id: "guilt_power",
            title: "Por Mi Culpa — Guilt & Power",
            subtitle: "The prayer that broke the spirit",
            icon: "heart.slash.fill",
            colorHex: "#8B0000",
            moduleCount: 1,
            estimatedHours: 1.5,
            category: .spirituality,
            difficulty: .intermediate
        ),
        CourseInfo(
            id: "tonantzin",
            title: "Tonantzin — The Mother They Erased",
            subtitle: "The Virgin of Guadalupe decoded",
            icon: "figure.stand.dress",
            colorHex: "#006847",
            moduleCount: 1,
            estimatedHours: 2,
            category: .spirituality,
            difficulty: .intermediate
        ),
        CourseInfo(
            id: "cross_solar",
            title: "The Cross — Solar Portal",
            subtitle: "Not punishment. Rebirth.",
            icon: "cross.fill",
            colorHex: "#FFD700",
            moduleCount: 1,
            estimatedHours: 1.5,
            category: .spirituality,
            difficulty: .intermediate
        ),
        CourseInfo(
            id: "crucifixion_initiation",
            title: "Death as Initiation",
            subtitle: "The universal death-rebirth mystery",
            icon: "arrow.up.to.line.alt",
            colorHex: "#E8D44D",
            moduleCount: 1,
            estimatedHours: 1.5,
            category: .spirituality,
            difficulty: .advanced
        ),
        CourseInfo(
            id: "twelve_plus_one",
            title: "12 + 1 = 13",
            subtitle: "The sacred code hidden in plain sight",
            icon: "circle.hexagongrid.fill",
            colorHex: "#00BCD4",
            moduleCount: 1,
            estimatedHours: 1,
            category: .consciousness,
            difficulty: .beginner
        ),
        CourseInfo(
            id: "anunnaki",
            title: "The Anunnaki",
            subtitle: "Before the beginning — 450,000 years of history",
            icon: "sparkles",
            colorHex: "#C0A060",
            moduleCount: 1,
            estimatedHours: 2,
            category: .consciousness,
            difficulty: .advanced
        ),
        CourseInfo(
            id: "elohim",
            title: "The Divine Plural — Elohim",
            subtitle: "Who was never a single god",
            icon: "person.3.fill",
            colorHex: "#7B68EE",
            moduleCount: 1,
            estimatedHours: 1.5,
            category: .consciousness,
            difficulty: .intermediate
        ),
        CourseInfo(
            id: "nephilim_watchers",
            title: "Nephilim & The Watchers",
            subtitle: "The forbidden union that changed everything",
            icon: "figure.stand.line.dotted.figure.stand",
            colorHex: "#4ECDC4",
            moduleCount: 1,
            estimatedHours: 1.5,
            category: .consciousness,
            difficulty: .advanced
        ),
        CourseInfo(
            id: "urantia_gaia",
            title: "Urantia & Gaia",
            subtitle: "Two names, one living Earth",
            icon: "globe.europe.africa.fill",
            colorHex: "#27AE60",
            moduleCount: 1,
            estimatedHours: 1,
            category: .science,
            difficulty: .intermediate
        ),
        CourseInfo(
            id: "christ_consciousness",
            title: "The Return — Christ Consciousness",
            subtitle: "A name or a collective activation?",
            icon: "sun.max.trianglebadge.exclamationmark.fill",
            colorHex: "#FFD700",
            moduleCount: 1,
            estimatedHours: 1.5,
            category: .spirituality,
            difficulty: .intermediate
        ),
        CourseInfo(
            id: "lemuria_atlantis",
            title: "The Two Lost Worlds",
            subtitle: "Two civilizations destroyed by ego",
            icon: "water.waves",
            colorHex: "#1ABC9C",
            moduleCount: 1,
            estimatedHours: 2,
            category: .consciousness,
            difficulty: .advanced
        ),
        CourseInfo(
            id: "abracadabra",
            title: "ABRACADABRA",
            subtitle: "The word that creates reality",
            icon: "wand.and.stars",
            colorHex: "#9B59B6",
            moduleCount: 1,
            estimatedHours: 1,
            category: .consciousness,
            difficulty: .beginner
        ),
        CourseInfo(
            id: "tarot_arcana",
            title: "The Arcana Within",
            subtitle: "The soul's map they called the devil's cards",
            icon: "suit.spade.fill",
            colorHex: "#8E44AD",
            moduleCount: 1,
            estimatedHours: 2,
            category: .spirituality,
            difficulty: .intermediate
        ),
        CourseInfo(
            id: "one_forty_four_k",
            title: "The 144,000",
            subtitle: "Critical mass of awakened consciousness",
            icon: "star.leadinghalf.filled",
            colorHex: "#F39C12",
            moduleCount: 1,
            estimatedHours: 1,
            category: .consciousness,
            difficulty: .intermediate
        ),
        CourseInfo(
            id: "alchemy_great_work",
            title: "The Great Work — Alchemy",
            subtitle: "The science of consciousness transformation",
            icon: "flask.fill",
            colorHex: "#D4AF37",
            moduleCount: 1,
            estimatedHours: 2,
            category: .consciousness,
            difficulty: .advanced
        ),
        CourseInfo(
            id: "antarctica",
            title: "Antarctica — Beyond the Ice Wall",
            subtitle: "The final mystery",
            icon: "snowflake",
            colorHex: "#3498DB",
            moduleCount: 2,
            estimatedHours: 3,
            category: .consciousness,
            difficulty: .advanced
        ),
        
        // QUANTUM NOURISH
        CourseInfo(
            id: "quantum_nourish",
            title: "Quantum Nourish",
            subtitle: "Eat your way to enlightenment",
            icon: "leaf.circle.fill",
            colorHex: "#2ECC71",
            moduleCount: 8,
            estimatedHours: 6,
            category: .practical,
            difficulty: .beginner
        ),
        // ══════════════════════════════════════════════════
        // LIGHT & DARKNESS — KNOW BOTH SIDES
        // ══════════════════════════════════════════════════
        CourseInfo(
            id: "light_and_darkness",
            title: "Light & Darkness",
            subtitle: "Know both sides. Choose freely.",
            icon: "circle.lefthalf.filled",
            colorHex: "#B366FF",
            moduleCount: 7,
            estimatedHours: 15,
            category: .consciousness,
            difficulty: .intermediate
        ),
        // ══════════════════════════════════════════════════
        // FACTORY MINDS — EDUCATION SYSTEM DECODED
        // ══════════════════════════════════════════════════
        CourseInfo(
            id: "factory_minds",
            title: "Factory Minds",
            subtitle: "How school was built to obey, not think",
            icon: "building.2.fill",
            colorHex: "#33D9A6",
            moduleCount: 6,
            estimatedHours: 2.5,
            category: .consciousness,
            difficulty: .intermediate
        ),
        // ══════════════════════════════════════════════════
        // SURVEILLANCE STATE — WHEN SAFETY BECOMES A CAGE
        // ══════════════════════════════════════════════════
        CourseInfo(
            id: "surveillance_state",
            title: "Surveillance State",
            subtitle: "When safety becomes a cage",
            icon: "eye.fill",
            colorHex: "#F2573D",
            moduleCount: 5,
            estimatedHours: 1.5,
            category: .consciousness,
            difficulty: .intermediate
        ),
        // ══════════════════════════════════════════════════
        // WORD SPELLS DECODED — TRIGGER WORDS & LANGUAGE CONTROL
        // ══════════════════════════════════════════════════
        CourseInfo(
            id: "word_spells_decoded",
            title: "Word Spells Decoded",
            subtitle: "Capitalism, Socialism, Woke — strip the spell",
            icon: "textformat.characters",
            colorHex: "#F2C40F",
            moduleCount: 5,
            estimatedHours: 1.25,
            category: .consciousness,
            difficulty: .beginner
        ),
        // ══════════════════════════════════════════════════
        // DEMOCRACY DECODED — 3 COURSES
        // ══════════════════════════════════════════════════
        CourseInfo(
            id: "democracy_decoded_c1",
            title: "How Elections Actually Work",
            subtitle: "The system nobody fully explained to you",
            icon: "scroll.fill",
            colorHex: "#4A9EFF",
            moduleCount: 5,
            estimatedHours: 1.5,
            category: .consciousness,
            difficulty: .beginner
        ),
        CourseInfo(
            id: "democracy_decoded_c2",
            title: "Money in Politics",
            subtitle: "Super PACs, dark money, and who funds campaigns",
            icon: "dollarsign.circle.fill",
            colorHex: "#34C78A",
            moduleCount: 3,
            estimatedHours: 1.75,
            category: .consciousness,
            difficulty: .intermediate
        ),
        CourseInfo(
            id: "democracy_decoded_c3",
            title: "The Election Illusion",
            subtitle: "What's broken, what's better, how we get there",
            icon: "arrow.triangle.2.circlepath",
            colorHex: "#FF7B3A",
            moduleCount: 3,
            estimatedHours: 1.5,
            category: .consciousness,
            difficulty: .intermediate
        ),
        // ══════════════════════════════════════════════════
        // CHOSEN ONES
        // ══════════════════════════════════════════════════
        CourseInfo(
            id: "chosen_ones",
            title: "The Chosen Ones",
            subtitle: "Discover which archetype you were built to embody",
            icon: "sparkles",
            colorHex: "#FF6B35",
            moduleCount: 8,
            estimatedHours: 1.0,
            category: .consciousness,
            difficulty: .beginner
        ),
        // ══════════════════════════════════════════════════
        // THE MONAD
        // ══════════════════════════════════════════════════
        CourseInfo(
            id: "monad_vs_god",
            title: "The Monad",
            subtitle: "Beyond the God you were given",
            icon: "circle.hexagongrid.fill",
            colorHex: "#C9A84C",
            moduleCount: 5,
            estimatedHours: 0.75,
            category: .consciousness,
            difficulty: .intermediate
        ),
        CourseInfo(
            id: "money_is_energy",
            title: "Money Is Energy",
            subtitle: "The operating manual they've been hiding from you",
            icon: "dollarsign.circle.fill",
            colorHex: "#FFD700",
            moduleCount: 6,
            estimatedHours: 5,
            category: .financial,
            difficulty: .intermediate
        ),
        CourseInfo(
            id: "thoth_teachings",
            title: "Thoth's Hidden Teachings",
            subtitle: "Consciousness, manifestation & the hermetic path",
            icon: "eye.fill",
            colorHex: "#64B5F6",
            moduleCount: 8,
            estimatedHours: 7,
            category: .consciousness,
            difficulty: .advanced
        ),
        CourseInfo(
            id: "alchemy_unveiled",
            title: "Alchemy Unveiled",
            subtitle: "Exposing the lies & mastering true transformation",
            icon: "flame.fill",
            colorHex: "#DAA520",
            moduleCount: 9,
            estimatedHours: 8,
            category: .consciousness,
            difficulty: .advanced
        ),
        // ══════════════════════════════════════════════════
        // NEW COURSES — BUILD 39.7
        // ══════════════════════════════════════════════════
        CourseInfo(
            id: "money_is_energy",
            title: "Money Is Energy",
            subtitle: "The operating manual they've been hiding",
            icon: "dollarsign.circle.fill",
            colorHex: "#FFD700",
            moduleCount: 6,
            estimatedHours: 0.8,
            category: .financial,
            difficulty: .beginner
        ),
        CourseInfo(
            id: "thoths_hidden_teachings",
            title: "Thoth's Hidden Teachings",
            subtitle: "Consciousness, manifestation & the great paradox",
            icon: "eye.trianglebadge.exclamationmark",
            colorHex: "#7B68EE",
            moduleCount: 9,
            estimatedHours: 1.1,
            category: .consciousness,
            difficulty: .intermediate
        ),
        CourseInfo(
            id: "alchemy_unveiled_bite",
            title: "Alchemy Unveiled",
            subtitle: "The sacred science of transformation",
            icon: "flame.fill",
            colorHex: "#FF6B35",
            moduleCount: 8,
            estimatedHours: 1.0,
            category: .consciousness,
            difficulty: .intermediate
        ),
        // ══════════════════════════════════════════════════
        // NEW COURSES — BUILD 39.10 (Psyops)
        // ══════════════════════════════════════════════════
        CourseInfo(
            id: "psyops_bite",
            title: "Psyops: Bite Edition",
            subtitle: "3-5 min bites. Spot it. Shield up. Start here.",
            icon: "bolt.shield.fill",
            colorHex: "#E74C3C",
            moduleCount: 12,
            estimatedHours: 1,
            category: .systems,
            difficulty: .beginner
        ),
        CourseInfo(
            id: "psyops_master",
            title: "Combating Psychological Warfare",
            subtitle: "Detect, defend, and reclaim your mind. Full master class.",
            icon: "eye.fill",
            colorHex: "#E74C3C",
            moduleCount: 10,
            estimatedHours: 5,
            category: .systems,
            difficulty: .intermediate
        ),
        CourseInfo(
            id: "psyops_detector",
            title: "Psyops Detector",
            subtitle: "AI-powered. Unlocked after completing the master course.",
            icon: "eye.trianglebadge.exclamationmark",
            colorHex: "#8E44AD",
            moduleCount: 1,
            estimatedHours: 0,
            category: .systems,
            difficulty: .advanced
        )
    ]
    
    static var totalHours: Double {
        courses.reduce(0) { $0 + $1.estimatedHours }
    }
    
    static var totalModules: Int {
        courses.reduce(0) { $0 + $1.moduleCount }
    }
    
    static var courseCount: Int {
        courses.count
    }
}

// MARK: - Course Hub View

struct CourseHubView: View {
    @Environment(\.dismiss) var dismiss
    @State private var selectedCategory: CourseInfo.CourseCategory? = nil
    @State private var selectedCourse: CourseInfo?
    @State private var searchText = ""
    
    private var filteredCourses: [CourseInfo] {
        var courses = CourseCatalog.courses
        
        if let category = selectedCategory {
            courses = courses.filter { $0.category == category }
        }
        
        if !searchText.isEmpty {
            courses = courses.filter {
                $0.title.lowercased().contains(searchText.lowercased()) ||
                $0.subtitle.lowercased().contains(searchText.lowercased())
            }
        }
        
        return courses
    }
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            VStack(spacing: 0) {
                header
                
                ScrollView {
                    VStack(spacing: 24) {
                        heroSection
                        statsSection
                        categoryFilter
                        coursesList
                        Spacer(minLength: 40)
                    }
                    .padding(.horizontal, 20)
                }
            }
        }
        .sheet(item: $selectedCourse) { course in
            switch course.id {
            case "journeys_of_awakening":
                JourneysOfAwakeningCourseView()
                    .environmentObject(CourseProgressManager.shared)
            case "drone_self":
                DroneSelfCourseView()
            case "dragonball":
                DragonBallCourseView()
            case "arrow_of_time":
                ArrowOfTimeCourseView()
            case "solar_sovereignty":
                SolarSovereigntyCourseView()
            case "thoth_consciousness":
                ThothConsciousnessCourseView()
            case "emerald_tablets":
                EmeraldTabletsCourseView()
            case "ai_consciousness":
                AIConsciousnessCourseView()
            case "serpent_decoded":
                SerpentDecodedCourseView()
            case "living_name":
                LivingNameCourseView()
            case "word_spells":
                WordSpellsCourseView()
            case "psyop_detection":
                PsyopDetectionCourseView()
            case "council_of_nicaea":
                CouncilOfNicaeaCourseView()
            case "solar_theology":
                SolarTheologyCourseView()
            case "godmode_esoteric":
                GodModeCourseView()
            // ALEXANDRIA EXPANSION COURSES
            case "antichrist_decoded":
                if let c = AlexandriaCourseRegistry.course(for: "antichrist_decoded") { AlexandriaCourseView(course: c) }
            case "baphomet_mirror":
                if let c = AlexandriaCourseRegistry.course(for: "baphomet_mirror") { AlexandriaCourseView(course: c) }
            case "gospel_judas":
                if let c = AlexandriaCourseRegistry.course(for: "gospel_judas") { AlexandriaCourseView(course: c) }
            case "guilt_power":
                if let c = AlexandriaCourseRegistry.course(for: "guilt_power") { AlexandriaCourseView(course: c) }
            case "tonantzin":
                if let c = AlexandriaCourseRegistry.course(for: "tonantzin") { AlexandriaCourseView(course: c) }
            case "cross_solar":
                if let c = AlexandriaCourseRegistry.course(for: "cross_solar") { AlexandriaCourseView(course: c) }
            case "crucifixion_initiation":
                if let c = AlexandriaCourseRegistry.course(for: "crucifixion_initiation") { AlexandriaCourseView(course: c) }
            case "twelve_plus_one":
                if let c = AlexandriaCourseRegistry.course(for: "twelve_plus_one") { AlexandriaCourseView(course: c) }
            case "anunnaki":
                if let c = AlexandriaCourseRegistry.course(for: "anunnaki") { AlexandriaCourseView(course: c) }
            case "elohim":
                if let c = AlexandriaCourseRegistry.course(for: "elohim") { AlexandriaCourseView(course: c) }
            case "nephilim_watchers":
                if let c = AlexandriaCourseRegistry.course(for: "nephilim_watchers") { AlexandriaCourseView(course: c) }
            case "urantia_gaia":
                if let c = AlexandriaCourseRegistry.course(for: "urantia_gaia") { AlexandriaCourseView(course: c) }
            case "christ_consciousness":
                if let c = AlexandriaCourseRegistry.course(for: "christ_consciousness") { AlexandriaCourseView(course: c) }
            case "lemuria_atlantis":
                if let c = AlexandriaCourseRegistry.course(for: "lemuria_atlantis") { AlexandriaCourseView(course: c) }
            case "abracadabra":
                if let c = AlexandriaCourseRegistry.course(for: "abracadabra") { AlexandriaCourseView(course: c) }
            case "tarot_arcana":
                if let c = AlexandriaCourseRegistry.course(for: "tarot_arcana") { AlexandriaCourseView(course: c) }
            case "one_forty_four_k":
                if let c = AlexandriaCourseRegistry.course(for: "one_forty_four_k") { AlexandriaCourseView(course: c) }
            case "alchemy_great_work":
                if let c = AlexandriaCourseRegistry.course(for: "alchemy_great_work") { AlexandriaCourseView(course: c) }
            case "antarctica":
                if let c = AlexandriaCourseRegistry.course(for: "antarctica") { AlexandriaCourseView(course: c) }
            // ☉ VORTEX MATH — loads the full immersive HTML course
            case "vortex_369_math":
                VortexMathHTMLCourseView()
            // ☉ FREQUENCY MASTERCLASS — locked until Course I complete
            case "frequency_masterclass":
                FrequencyMasterclassView()
            case "undo_chains":
                UndoChainsView()
            // QUANTUM NOURISH
            case "quantum_nourish":
                QuantumNourishView()
            // LIGHT & DARKNESS
            case "light_and_darkness":
                LightAndDarknessCourseView()
                    .environmentObject(CourseProgressManager.shared)
            // FACTORY MINDS
            case "factory_minds":
                FactoryMindsView()
            // SURVEILLANCE STATE
            case "surveillance_state":
                SurveillanceStateCourseView()
            // WORD SPELLS DECODED
            case "word_spells_decoded":
                WordSpellsDecodedCourseView()
            // DEMOCRACY DECODED
            case "democracy_decoded_c1", "democracy_decoded_c2", "democracy_decoded_c3":
                DemocracyDecodedHubView()
            case "chosen_ones":
                ChosenOnesCourseView()
            case "monad_vs_god":
                MonadVsGodCourseView()
            case "money_is_energy":
                MoneyIsEnergyCourseView()
            case "thoth_teachings":
                ThothHiddenTeachingsCourseView()
            case "alchemy_unveiled":
                AlchemyCourseView()
            case "alchemy_unveiled_bite":
                AlchemyCourseView()
            case "belief_analyzer":
                BeliefAnalyzerView()
            case "thoths_hidden_teachings":
                ThothsHiddenTeachingsCourseView()
            case "psyops_bite":
                PsyopsBiteCourseView()
            case "psyops_master":
                PsyopsWarfareCourseView()
            case "psyops_detector":
                PsyopsDetectorView()
            case "real_trinity":
                if let c = AlexandriaCourseRegistry.course(for: "real_trinity") { AlexandriaCourseView(course: c) }
            default:
                CourseDetailPlaceholder(course: course)
            }
        }
    }
    
    // MARK: - Header
    
    private var header: some View {
        HStack {
            VStack(alignment: .leading, spacing: 2) {
                Text("Awakening Academy")
                    .font(.system(size: 20, weight: .bold, design: .rounded))
                    .foregroundColor(Palette.text.primary)
                Text("\(CourseCatalog.courses.count) Courses")
                    .font(.system(size: 13, weight: .medium))
                    .foregroundColor(Palette.primary.cyan)
            }
            Spacer()
            Button { dismiss() } label: {
                Image(systemName: "xmark.circle.fill")
                    .font(.system(size: 28))
                    .foregroundColor(Palette.text.secondary)
            }
        }
        .padding(.horizontal, 20)
        .padding(.top, 20)
        .padding(.bottom, 12)
    }
    
    // MARK: - Hero
    
    private var heroSection: some View {
        VStack(spacing: 16) {
            ZStack {
                Circle()
                    .fill(RadialGradient(
                        colors: [Palette.accent.gold.opacity(0.4), Color.clear],
                        center: .center, startRadius: 0, endRadius: 50
                    ))
                    .frame(width: 100, height: 100)
                
                Text("🐉")
                    .font(.system(size: 50))
            }
            
            Text("The Complete Curriculum")
                .font(.system(size: 22, weight: .bold, design: .rounded))
                .foregroundColor(Palette.text.primary)
            
            Text("From quantum physics to Dragon Ball\nFrom Buddha to birth charts")
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(Palette.text.secondary)
                .multilineTextAlignment(.center)
        }
    }
    
    // MARK: - Stats
    
    private var statsSection: some View {
        HStack(spacing: 12) {
            statCard(value: "\(CourseCatalog.courses.count)", label: "Courses", icon: "book.fill", color: Palette.primary.cyan)
            statCard(value: "\(CourseCatalog.totalModules)", label: "Modules", icon: "folder.fill", color: Palette.primary.violet)
            statCard(value: "\(Int(CourseCatalog.totalHours))h+", label: "Content", icon: "clock.fill", color: Palette.accent.gold)
        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.white.opacity(0.05))
        )
    }
    
    private func statCard(value: String, label: String, icon: String, color: Color) -> some View {
        VStack(spacing: 6) {
            Image(systemName: icon)
                .font(.system(size: 16))
                .foregroundColor(color)
            Text(value)
                .font(.system(size: 18, weight: .bold, design: .rounded))
                .foregroundColor(Palette.text.primary)
            Text(label)
                .font(.system(size: 10, weight: .medium))
                .foregroundColor(Palette.text.muted)
        }
        .frame(maxWidth: .infinity)
    }
    
    // MARK: - Category Filter
    
    private var categoryFilter: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                HubCategoryChip(title: "All", icon: "square.grid.2x2", isSelected: selectedCategory == nil) {
                    selectedCategory = nil
                }
                
                ForEach(CourseInfo.CourseCategory.allCases, id: \.rawValue) { category in
                    HubCategoryChip(
                        title: category.rawValue,
                        icon: category.icon,
                        isSelected: selectedCategory == category
                    ) {
                        selectedCategory = category
                    }
                }
            }
        }
    }
    
    // MARK: - Courses List
    
    private var coursesList: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("CURRICULUM")
                .font(.system(size: 12, weight: .bold, design: .rounded))
                .tracking(1)
                .foregroundColor(Palette.text.secondary)
            
            ForEach(filteredCourses) { course in
                CourseCard(course: course)
                    .onTapGesture {
                        HapticManager.shared.cardFlip()
                        selectedCourse = course
                    }
            }
            
            if filteredCourses.isEmpty {
                Text("No courses match your filter")
                    .font(.system(size: 14, weight: .medium))
                    .foregroundColor(Palette.text.muted)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.vertical, 40)
            }
        }
    }
}

// MARK: - Supporting Views

struct HubCategoryChip: View {
    let title: String
    let icon: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: 6) {
                Image(systemName: icon)
                    .font(.system(size: 12))
                Text(title)
                    .font(.system(size: 12, weight: .semibold, design: .rounded))
            }
            .foregroundColor(isSelected ? .black : Palette.text.secondary)
            .padding(.horizontal, 12)
            .padding(.vertical, 8)
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(isSelected ? Palette.primary.cyan : Color.white.opacity(0.1))
            )
        }
    }
}

struct CourseCard: View {
    let course: CourseInfo
    @State private var isPressed = false
    
    var body: some View {
        HStack(spacing: 14) {
            // Icon with subtle glow
            ZStack {
                // Glow effect
                Circle()
                    .fill(course.color.opacity(0.15))
                    .frame(width: 58, height: 58)
                    .blur(radius: 4)
                
                RoundedRectangle(cornerRadius: 14)
                    .fill(
                        LinearGradient(
                            colors: [course.color.opacity(0.3), course.color.opacity(0.15)],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(width: 52, height: 52)
                
                Image(systemName: course.icon)
                    .font(.system(size: 22, weight: .semibold))
                    .foregroundStyle(
                        LinearGradient(
                            colors: [course.color, course.color.opacity(0.8)],
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )
            }
            .accessibilityHidden(true)
            
            // Info
            VStack(alignment: .leading, spacing: 5) {
                HStack(spacing: 6) {
                    Text(course.category.rawValue.uppercased())
                        .font(.system(size: 10, weight: .bold, design: .rounded))
                        .foregroundColor(course.color)
                    
                    Text("•")
                        .foregroundColor(Palette.text.muted)
                    
                    Text(course.difficulty.rawValue)
                        .font(.system(size: 10, weight: .semibold))
                        .foregroundColor(course.difficulty.color)
                        .padding(.horizontal, 6)
                        .padding(.vertical, 2)
                        .background(
                            Capsule()
                                .fill(course.difficulty.color.opacity(0.15))
                        )
                }
                
                Text(course.title)
                    .font(.system(size: 16, weight: .bold, design: .rounded))
                    .foregroundColor(Palette.text.primary)
                
                Text(course.subtitle)
                    .font(.system(size: 12, weight: .medium))
                    .foregroundColor(Palette.text.secondary)
                    .lineLimit(2)
            }
            
            Spacer()
            
            // Meta with progress indicator style
            VStack(alignment: .trailing, spacing: 6) {
                HStack(spacing: 4) {
                    Image(systemName: "square.stack.3d.up")
                        .font(.system(size: 10))
                    Text("\(course.moduleCount)")
                        .font(.system(size: 12, weight: .bold, design: .rounded))
                }
                .foregroundColor(Palette.text.muted)
                
                HStack(spacing: 4) {
                    Image(systemName: "clock")
                        .font(.system(size: 10))
                    Text("\(String(format: "%.1f", course.estimatedHours))h")
                        .font(.system(size: 12, weight: .bold, design: .rounded))
                }
                .foregroundColor(Palette.text.muted)
                
                Image(systemName: "chevron.right.circle.fill")
                    .font(.system(size: 16))
                    .foregroundColor(course.color.opacity(0.6))
            }
            .accessibilityHidden(true)
        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 18)
                .fill(Color.white.opacity(0.04))
                .overlay(
                    RoundedRectangle(cornerRadius: 18)
                        .stroke(
                            LinearGradient(
                                colors: [course.color.opacity(0.3), course.color.opacity(0.1)],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            ),
                            lineWidth: 1
                        )
                )
        )
        .scaleEffect(isPressed ? 0.98 : 1.0)
        .animation(.spring(response: 0.3, dampingFraction: 0.7), value: isPressed)
        .accessibilityElement(children: .combine)
        .accessibilityLabel("\(course.title). \(course.category.rawValue) course. \(course.difficulty.rawValue) difficulty.")
        .accessibilityHint("\(course.moduleCount) modules, about \(String(format: "%.1f", course.estimatedHours)) hours. Double tap to start course.")
        .accessibilityAddTraits(.isButton)
    }
}

struct CourseDetailPlaceholder: View {
    let course: CourseInfo
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            LinearGradient(
                colors: [Color.black, course.color.opacity(0.2), Color.black],
                startPoint: .top, endPoint: .bottom
            )
            .ignoresSafeArea()
            
            VStack(spacing: 24) {
                // Header
                HStack {
                    Button { dismiss() } label: {
                        HStack(spacing: 6) {
                            Image(systemName: "chevron.left")
                            Text("Back")
                        }
                        .foregroundColor(course.color)
                    }
                    Spacer()
                }
                .padding(.horizontal, 20)
                .padding(.top, 20)
                
                Spacer()
                
                // Course Icon
                ZStack {
                    Circle()
                        .fill(RadialGradient(
                            colors: [course.color.opacity(0.5), course.color.opacity(0.1)],
                            center: .center, startRadius: 0, endRadius: 70
                        ))
                        .frame(width: 140, height: 140)
                    
                    Image(systemName: course.icon)
                        .font(.system(size: 60, weight: .semibold))
                        .foregroundColor(course.color)
                }
                
                Text(course.title)
                    .font(.system(size: 28, weight: .bold, design: .rounded))
                    .foregroundColor(Palette.text.primary)
                
                Text(course.subtitle)
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(course.color)
                
                HStack(spacing: 20) {
                    Label("\(course.moduleCount) modules", systemImage: "folder.fill")
                    Label("\(String(format: "%.1f", course.estimatedHours)) hours", systemImage: "clock.fill")
                }
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(Palette.text.secondary)
                
                Spacer()
                
                // Start Button
                Button {
                    // Navigate to specific course view
                    dismiss()
                } label: {
                    HStack {
                        Image(systemName: "play.fill")
                        Text("Start Course")
                            .font(.system(size: 16, weight: .bold, design: .rounded))
                    }
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 16)
                    .background(
                        RoundedRectangle(cornerRadius: 14)
                            .fill(course.color)
                    )
                }
                .padding(.horizontal, 40)
                .padding(.bottom, 40)
            }
        }
    }
}
