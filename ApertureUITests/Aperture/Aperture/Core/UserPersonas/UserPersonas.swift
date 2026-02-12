// UserPersonas.swift
// The souls we serve - identifying our users so content resonates
// We all have a spark within, but programming made us forget

import SwiftUI

// MARK: - Awakening Personas

/// The journey types we serve - everyone has a spark, different levels of programming
enum AwakeningPersona: String, CaseIterable, Identifiable {
    
    // The Deeply Asleep
    case deeplyProgrammed = "The Deeply Asleep"
    
    // The Institutional Skeptic
    case institutionalSkeptic = "The Institutional Skeptic"
    
    // The Meditation Seeker
    case meditationSeeker = "The Meditation Seeker"
    
    // The Eternal Questioner
    case eternalQuestioner = "The Eternal Questioner"
    
    // The Rabbit Hole Dweller
    case rabbitHoleDweller = "The Rabbit Hole Dweller"
    
    // The Scientific Materialist
    case scientificMaterialist = "The Scientific Materialist"
    
    // The Spiritually Wounded
    case spirituallyWounded = "The Spiritually Wounded"
    
    // The Newly Awakening
    case newlyAwakening = "The Newly Awakening"
    
    // The Chosen Ones / Survivors
    case chosenSurvivor = "The Chosen Survivor"
    
    // The Integration Seeker
    case integrationSeeker = "The Integration Seeker"
    
    var id: String { rawValue }
    
    var description: String {
        switch self {
        case .deeplyProgrammed:
            return "You might think this is all there is—work, consume, die. The programming runs deep, but the spark is still there, waiting."
        case .institutionalSkeptic:
            return "You saw through organized religion, but other institutions still have their hooks in you. School, government, media—different cages, same bars."
        case .meditationSeeker:
            return "You've tried meditation, breathwork, maybe even plant medicine. You feel glimpses but can't sustain the breakthrough. There's a missing piece."
        case .eternalQuestioner:
            return "You've always questioned everything. Teachers hated you. Bosses hate you. But your mind won't rest because something doesn't add up."
        case .rabbitHoleDweller:
            return "You went deep. Maybe too deep. Conspiracies within conspiracies. Now you need help separating signal from noise, grounding the knowledge."
        case .scientificMaterialist:
            return "You believe in evidence and reason. That's good. But mainstream science has its own dogmas. You're ready for the physics that broke physicists."
        case .spirituallyWounded:
            return "Religion hurt you. Spiritual communities hurt you. The cynicism is protective—but it's also blocking something real."
        case .newlyAwakening:
            return "Something cracked recently. A loss. A crisis. A glimpse you can't explain. You're disoriented but know the old story doesn't fit anymore."
        case .chosenSurvivor:
            return "Life broke you multiple times. Trauma that should have destroyed you. But you kept getting up. The difficulty was training. You're here for a reason."
        case .integrationSeeker:
            return "You've had the experiences—awakening, revelation, maybe even ego death. Now you need to integrate it into daily life. Make it practical. Sustainable."
        }
    }
    
    var icon: String {
        switch self {
        case .deeplyProgrammed: return "eye.slash"
        case .institutionalSkeptic: return "building.columns"
        case .meditationSeeker: return "figure.mind.and.body"
        case .eternalQuestioner: return "questionmark.circle"
        case .rabbitHoleDweller: return "arrow.down.to.line"
        case .scientificMaterialist: return "atom"
        case .spirituallyWounded: return "heart.slash"
        case .newlyAwakening: return "sunrise"
        case .chosenSurvivor: return "flame.fill"
        case .integrationSeeker: return "puzzlepiece.extension"
        }
    }
    
    var color: Color {
        switch self {
        case .deeplyProgrammed: return .gray
        case .institutionalSkeptic: return .blue
        case .meditationSeeker: return .purple
        case .eternalQuestioner: return .orange
        case .rabbitHoleDweller: return .red
        case .scientificMaterialist: return .cyan
        case .spirituallyWounded: return .pink
        case .newlyAwakening: return .yellow
        case .chosenSurvivor: return Color(hex: "#FFD700")
        case .integrationSeeker: return .green
        }
    }
    
    /// Content tone adaptation for this persona
    var contentTone: ContentTone {
        switch self {
        case .deeplyProgrammed:
            return ContentTone(
                approach: .gentle,
                useScience: true,
                useSpiritual: false,
                challengeLevel: .gradual,
                emphasisOnEvidence: true
            )
        case .institutionalSkeptic:
            return ContentTone(
                approach: .logical,
                useScience: true,
                useSpiritual: false,
                challengeLevel: .direct,
                emphasisOnEvidence: true
            )
        case .meditationSeeker:
            return ContentTone(
                approach: .experiential,
                useScience: true,
                useSpiritual: true,
                challengeLevel: .moderate,
                emphasisOnEvidence: false
            )
        case .eternalQuestioner:
            return ContentTone(
                approach: .socratic,
                useScience: true,
                useSpiritual: true,
                challengeLevel: .direct,
                emphasisOnEvidence: true
            )
        case .rabbitHoleDweller:
            return ContentTone(
                approach: .grounding,
                useScience: true,
                useSpiritual: true,
                challengeLevel: .challenging,
                emphasisOnEvidence: true
            )
        case .scientificMaterialist:
            return ContentTone(
                approach: .logical,
                useScience: true,
                useSpiritual: false,
                challengeLevel: .direct,
                emphasisOnEvidence: true
            )
        case .spirituallyWounded:
            return ContentTone(
                approach: .compassionate,
                useScience: true,
                useSpiritual: false,
                challengeLevel: .gradual,
                emphasisOnEvidence: false
            )
        case .newlyAwakening:
            return ContentTone(
                approach: .supportive,
                useScience: true,
                useSpiritual: true,
                challengeLevel: .gradual,
                emphasisOnEvidence: false
            )
        case .chosenSurvivor:
            return ContentTone(
                approach: .direct,
                useScience: true,
                useSpiritual: true,
                challengeLevel: .challenging,
                emphasisOnEvidence: false
            )
        case .integrationSeeker:
            return ContentTone(
                approach: .practical,
                useScience: true,
                useSpiritual: true,
                challengeLevel: .moderate,
                emphasisOnEvidence: false
            )
        }
    }
    
    /// What this persona needs most
    var primaryNeed: String {
        switch self {
        case .deeplyProgrammed: return "Permission to question"
        case .institutionalSkeptic: return "Seeing the full picture"
        case .meditationSeeker: return "Integration and consistency"
        case .eternalQuestioner: return "Synthesis and direction"
        case .rabbitHoleDweller: return "Grounding and discernment"
        case .scientificMaterialist: return "Evidence that expands worldview"
        case .spirituallyWounded: return "Safe re-entry to the sacred"
        case .newlyAwakening: return "Orientation and community"
        case .chosenSurvivor: return "Purpose activation"
        case .integrationSeeker: return "Practical application"
        }
    }
    
    /// Recommended starting courses
    var recommendedCourses: [String] {
        switch self {
        case .deeplyProgrammed:
            return ["pattern_recognition", "master_lies", "media_exposed"]
        case .institutionalSkeptic:
            return ["systems_of_control", "education_exposed", "left_right_programming"]
        case .meditationSeeker:
            return ["consciousness_phd", "awakening_arsenal", "buddha_meditation"]
        case .eternalQuestioner:
            return ["drone_self", "quantum_physics", "sacred_geometry"]
        case .rabbitHoleDweller:
            return ["pattern_recognition", "paradoxes", "rational_awakening"]
        case .scientificMaterialist:
            return ["quantum_physics", "arrow_of_time", "simulation_theory"]
        case .spirituallyWounded:
            return ["divine_feminine", "gnostic_texts", "bible_decoded"]
        case .newlyAwakening:
            return ["pattern_recognition", "awakening_arsenal", "solar_sovereignty"]
        case .chosenSurvivor:
            return ["godmode", "monad_forge", "chosen_one_oracle"]
        case .integrationSeeker:
            return ["awakening_arsenal", "solar_sovereignty", "sunflow_state"]
        }
    }
    
    /// Display name (cleaner than rawValue)
    var displayName: String {
        rawValue
    }
    
    /// Hex color string for this persona
    var colorHex: String {
        switch self {
        case .deeplyProgrammed: return "#8E8E93"
        case .institutionalSkeptic: return "#007AFF"
        case .meditationSeeker: return "#AF52DE"
        case .eternalQuestioner: return "#FF9500"
        case .rabbitHoleDweller: return "#FF3B30"
        case .scientificMaterialist: return "#32ADE6"
        case .spirituallyWounded: return "#FF2D55"
        case .newlyAwakening: return "#FFCC00"
        case .chosenSurvivor: return "#FFD700"
        case .integrationSeeker: return "#34C759"
        }
    }
    
    /// Recommended starting courses (human-readable names for UI)
    var recommendedStartingCourses: [String] {
        switch self {
        case .deeplyProgrammed:
            return ["Pattern Recognition", "The Master Lies", "Media Exposed"]
        case .institutionalSkeptic:
            return ["Systems of Control", "Education Exposed", "Left/Right Programming"]
        case .meditationSeeker:
            return ["PhD Consciousness", "The Awakening Arsenal", "Buddha's Meditation"]
        case .eternalQuestioner:
            return ["The Drone Self", "Quantum Physics", "Sacred Geometry"]
        case .rabbitHoleDweller:
            return ["Pattern Recognition", "The Paradoxes", "Rational Awakening"]
        case .scientificMaterialist:
            return ["Quantum Physics", "Arrow of Time", "Simulation Theory"]
        case .spirituallyWounded:
            return ["Divine Feminine", "Gnostic Texts", "Bible Decoded"]
        case .newlyAwakening:
            return ["Pattern Recognition", "The Awakening Arsenal", "Solar Sovereignty"]
        case .chosenSurvivor:
            return ["GodMode", "Monad Forge", "Chosen One Oracle"]
        case .integrationSeeker:
            return ["The Awakening Arsenal", "Solar Sovereignty", "SunFlow State"]
        }
    }
    
    /// Welcome message for this persona
    var welcomeMessage: String {
        PersonalizedWelcome.message(for: self)
    }
}

// MARK: - Content Tone Configuration

struct ContentTone {
    enum Approach: String {
        case gentle = "Gentle Introduction"
        case logical = "Logical Deconstruction"
        case experiential = "Experiential Guidance"
        case socratic = "Socratic Questioning"
        case grounding = "Grounding & Discernment"
        case compassionate = "Compassionate Presence"
        case supportive = "Supportive Guidance"
        case direct = "Direct Transmission"
        case practical = "Practical Application"
    }
    
    let approach: Approach
    let useScience: Bool
    let useSpiritual: Bool
    let challengeLevel: ChallengeLevel
    let emphasisOnEvidence: Bool
    
    enum ChallengeLevel {
        case gradual, moderate, direct, challenging
    }
}

// MARK: - Privacy Notice

struct PrivacyNotice {
    static let apertureCommitment = """
    🔒 **Your Privacy is Sacred**
    
    Aperture does NOT track:
    • Your location
    • Your personal data
    • Your course progress (stored locally only)
    • Your journal entries (never leave your device)
    • Your awakening journey
    
    We believe in sovereignty. Your consciousness expansion is YOUR business.
    
    ⚠️ **What We Can't Control**
    
    Apple collects certain device telemetry that is outside our control:
    • App Store analytics (if you didn't opt out)
    • Crash reports (can be disabled in Settings)
    • Device identifiers
    
    To maximize privacy:
    1. Go to Settings > Privacy > Analytics
    2. Turn off "Share iPhone Analytics"
    3. Turn off "Share iCloud Analytics"
    
    Your awakening is between you and the universe. We're just here to point.
    """
    
    static let shortVersion = "We don't track you. Your journey stays on your device."
}

// MARK: - Welcome Message Generator

struct PersonalizedWelcome {
    
    static func message(for persona: AwakeningPersona?) -> String {
        guard let persona = persona else {
            return "Welcome, seeker. You have a spark within—let's fan it into flame."
        }
        
        switch persona {
        case .deeplyProgrammed:
            return "Welcome. The fact that you're here means something is stirring. Trust that instinct."
        case .institutionalSkeptic:
            return "You've already seen through some of the lies. Let's show you the ones that are harder to spot."
        case .meditationSeeker:
            return "The glimpses you've had are real. Let's turn them into stable ground."
        case .eternalQuestioner:
            return "Your questions aren't a bug—they're a feature. Let's aim them at what matters."
        case .rabbitHoleDweller:
            return "You've been brave enough to look. Now let's find the signal in the noise."
        case .scientificMaterialist:
            return "Real science is weirder than you know. Let's explore what the textbooks left out."
        case .spirituallyWounded:
            return "The sacred that hurt you was counterfeit. The real thing doesn't need your obedience."
        case .newlyAwakening:
            return "The confusion is normal. The old map doesn't fit the new territory. We'll help you navigate."
        case .chosenSurvivor:
            return "You weren't broken for nothing. Everything you survived was preparation. Let's activate it."
        case .integrationSeeker:
            return "Knowledge without integration is just intellectual entertainment. Let's make it real."
        }
    }
}
