// UserProfileEntity.swift
// Personal information to tailor the dragon companion
// All data stored locally on device - your data is YOURS

import SwiftUI

// MARK: - User Awakening Profile

struct UserAwakeningProfile: Codable, Identifiable {

    let id: UUID
    var displayName: String
    var birthDate: Date?
    var zodiacSign: ZodiacSign?
    var favoriteColors: [String]
    var awakeningMotivation: AwakeningMotivation
    var resonatesWith: [ResonanceType]
    var learningStyle: LearningStyle
    var lifeGoals: [LifeGoal]
    var personalMantra: String?
    var createdAt: Date
    var updatedAt: Date

    // Computed properties for dragon personalization
    var numerologyNumber: Int {
        guard let birthDate = birthDate else { return 9 }
        let components = Calendar.current.dateComponents([.day, .month, .year], from: birthDate)
        let sum = (components.day ?? 0) + (components.month ?? 0) + (components.year ?? 0)
        return TeslaNumerology.reduce(sum)
    }

    var dominantElement: DragonElement {
        // Based on zodiac + motivation + resonance
        if let zodiac = zodiacSign {
            return zodiac.element
        }
        return awakeningMotivation.suggestedElement
    }

    var suggestedDragonColors: [Color] {
        if !favoriteColors.isEmpty {
            return favoriteColors.prefix(3).map { Color(hex: $0) }
        }
        return [dominantElement.color, Palette.accent.gold]
    }

}

// MARK: - Zodiac Sign

enum ZodiacSign: String, Codable, CaseIterable {

    case aries = "Aries"
    case taurus = "Taurus"
    case gemini = "Gemini"
    case cancer = "Cancer"
    case leo = "Leo"
    case virgo = "Virgo"
    case libra = "Libra"
    case scorpio = "Scorpio"
    case sagittarius = "Sagittarius"
    case capricorn = "Capricorn"
    case aquarius = "Aquarius"
    case pisces = "Pisces"

    var symbol: String {
        switch self {
        case .aries: return "♈"
        case .taurus: return "♉"
        case .gemini: return "♊"
        case .cancer: return "♋"
        case .leo: return "♌"
        case .virgo: return "♍"
        case .libra: return "♎"
        case .scorpio: return "♏"
        case .sagittarius: return "♐"
        case .capricorn: return "♑"
        case .aquarius: return "♒"
        case .pisces: return "♓"
        }
    }

    var element: DragonElement {
        switch self {
        case .aries, .leo, .sagittarius: return .fire
        case .taurus, .virgo, .capricorn: return .earth
        case .gemini, .libra, .aquarius: return .air
        case .cancer, .scorpio, .pisces: return .water
        }
    }

    var dateRange: String {
        switch self {
        case .aries: return "Mar 21 - Apr 19"
        case .taurus: return "Apr 20 - May 20"
        case .gemini: return "May 21 - Jun 20"
        case .cancer: return "Jun 21 - Jul 22"
        case .leo: return "Jul 23 - Aug 22"
        case .virgo: return "Aug 23 - Sep 22"
        case .libra: return "Sep 23 - Oct 22"
        case .scorpio: return "Oct 23 - Nov 21"
        case .sagittarius: return "Nov 22 - Dec 21"
        case .capricorn: return "Dec 22 - Jan 19"
        case .aquarius: return "Jan 20 - Feb 18"
        case .pisces: return "Feb 19 - Mar 20"
        }
    }

    static func from(date: Date) -> ZodiacSign {
        let calendar = Calendar.current
        let month = calendar.component(.month, from: date)
        let day = calendar.component(.day, from: date)

        switch (month, day) {
        case (3, 21...31), (4, 1...19): return .aries
        case (4, 20...30), (5, 1...20): return .taurus
        case (5, 21...31), (6, 1...20): return .gemini
        case (6, 21...30), (7, 1...22): return .cancer
        case (7, 23...31), (8, 1...22): return .leo
        case (8, 23...31), (9, 1...22): return .virgo
        case (9, 23...30), (10, 1...22): return .libra
        case (10, 23...31), (11, 1...21): return .scorpio
        case (11, 22...30), (12, 1...21): return .sagittarius
        case (12, 22...31), (1, 1...19): return .capricorn
        case (1, 20...31), (2, 1...18): return .aquarius
        case (2, 19...29), (3, 1...20): return .pisces
        default: return .aries
        }
    }

}

// MARK: - Awakening Motivation

enum AwakeningMotivation: String, Codable, CaseIterable {

    case seekingTruth = "I want to know the truth"
    case breakingFree = "I want to break free from programming"
    case findingPurpose = "I want to find my purpose"
    case helpingOthers = "I want to help others awaken"
    case healingTrauma = "I want to heal and grow"
    case spiritualGrowth = "I want spiritual connection"
    case intellectualCuriosity = "I'm curious about hidden knowledge"
    case reclaimingPower = "I want to reclaim my power"

    var description: String {
        switch self {
        case .seekingTruth:
            return "You hunger for what's real. The lies don't satisfy anymore."
        case .breakingFree:
            return "You feel the chains and you're ready to break them."
        case .findingPurpose:
            return "You know there's more to life than what they told you."
        case .helpingOthers:
            return "You've seen glimpses and want to light the way for others."
        case .healingTrauma:
            return "You're ready to face the shadows and transform them."
        case .spiritualGrowth:
            return "You sense the divine and want to deepen that connection."
        case .intellectualCuriosity:
            return "Your mind refuses to accept incomplete answers."
        case .reclaimingPower:
            return "You're done giving your energy to systems that don't serve you."
        }
    }

    var suggestedElement: DragonElement {
        switch self {
        case .seekingTruth: return .light
        case .breakingFree: return .fire
        case .findingPurpose: return .cosmic
        case .helpingOthers: return .light
        case .healingTrauma: return .water
        case .spiritualGrowth: return .void
        case .intellectualCuriosity: return .air
        case .reclaimingPower: return .fire
        }
    }

    var icon: String {
        switch self {
        case .seekingTruth: return "eye.fill"
        case .breakingFree: return "link.badge.plus"
        case .findingPurpose: return "star.fill"
        case .helpingOthers: return "heart.fill"
        case .healingTrauma: return "leaf.fill"
        case .spiritualGrowth: return "sparkles"
        case .intellectualCuriosity: return "brain.head.profile"
        case .reclaimingPower: return "bolt.fill"
        }
    }

}

// MARK: - Resonance Type

enum ResonanceType: String, Codable, CaseIterable {

    case dragonBall = "Dragon Ball / Anime"
    case gnosticism = "Gnosticism / Hidden Christianity"
    case ancientWisdom = "Ancient Wisdom / Sacred Texts"
    case conspiracy = "Hidden Truth / What They Hide"
    case consciousness = "Consciousness / Quantum Reality"
    case systemsThinking = "Systems / Pattern Recognition"
    case spirituality = "Spirituality / Meditation"
    case activism = "Activism / Making Change"

    var icon: String {
        switch self {
        case .dragonBall: return "flame.fill"
        case .gnosticism: return "book.closed.fill"
        case .ancientWisdom: return "scroll.fill"
        case .conspiracy: return "eye.trianglebadge.exclamationmark.fill"
        case .consciousness: return "brain.head.profile"
        case .systemsThinking: return "gearshape.2.fill"
        case .spirituality: return "sparkles"
        case .activism: return "megaphone.fill"
        }
    }

    var color: Color {
        switch self {
        case .dragonBall: return Color(hex: "#FF6B35")
        case .gnosticism: return Palette.primary.violet
        case .ancientWisdom: return Palette.accent.gold
        case .conspiracy: return Palette.primary.red
        case .consciousness: return Palette.primary.cyan
        case .systemsThinking: return Color(hex: "#78909C")
        case .spirituality: return Color(hex: "#E040FB")
        case .activism: return Color(hex: "#4CAF50")
        }
    }

    var suggestedTraits: [String] {
        switch self {
        case .dragonBall: return ["saiyan_spirit", "cosmos_burn"]
        case .gnosticism: return ["gnostic_flame", "scripture_decoder"]
        case .ancientWisdom: return ["memory_keeper", "ancestor_connected"]
        case .conspiracy: return ["truth_seeker", "lie_detector"]
        case .consciousness: return ["third_eye_open", "quantum_aware"]
        case .systemsThinking: return ["matrix_vision", "unchained"]
        case .spirituality: return ["flow_master", "ultra_instinct"]
        case .activism: return ["light_bringer", "creator_of_good"]
        }
    }

}

// MARK: - Learning Style

enum LearningStyle: String, Codable, CaseIterable {

    case visual = "Visual - I learn by seeing"
    case reading = "Reading - I learn by reading deeply"
    case audio = "Audio - I learn by listening"
    case kinesthetic = "Hands-on - I learn by doing"
    case social = "Social - I learn through discussion"
    case solitary = "Solitary - I learn alone in reflection"

    var icon: String {
        switch self {
        case .visual: return "eye.fill"
        case .reading: return "book.fill"
        case .audio: return "headphones"
        case .kinesthetic: return "hand.raised.fill"
        case .social: return "person.2.fill"
        case .solitary: return "person.fill"
        }
    }

    var recommendedContentTypes: [String] {
        switch self {
        case .visual: return ["Documentaries", "Infographics", "Visual Courses"]
        case .reading: return ["Sacred Texts", "Deep Dives", "Written Courses"]
        case .audio: return ["Podcasts", "Audio Courses", "Discussions"]
        case .kinesthetic: return ["Exercises", "Meditations", "Practices"]
        case .social: return ["Community", "Discussion Groups", "Live Sessions"]
        case .solitary: return ["Self-paced Courses", "Journaling", "Meditation"]
        }
    }

}

// MARK: - Life Goals

enum LifeGoal: String, Codable, CaseIterable {

    case freedom = "True Freedom"
    case wisdom = "Deep Wisdom"
    case love = "Unconditional Love"
    case creation = "Create Something Meaningful"
    case healing = "Heal Myself and Others"
    case truth = "Know the Truth"
    case peace = "Inner Peace"
    case power = "Personal Power"
    case service = "Serve Humanity"
    case transcendence = "Transcend Limitations"

    var icon: String {
        switch self {
        case .freedom: return "bird.fill"
        case .wisdom: return "lightbulb.fill"
        case .love: return "heart.fill"
        case .creation: return "hammer.fill"
        case .healing: return "cross.fill"
        case .truth: return "eye.fill"
        case .peace: return "leaf.fill"
        case .power: return "bolt.fill"
        case .service: return "hand.raised.fill"
        case .transcendence: return "sparkles"
        }
    }

    var dragonTrait: String {
        switch self {
        case .freedom: return "unchained"
        case .wisdom: return "third_eye_open"
        case .love: return "creator_of_good"
        case .creation: return "creator_of_good"
        case .healing: return "flow_master"
        case .truth: return "truth_seeker"
        case .peace: return "flow_master"
        case .power: return "saiyan_spirit"
        case .service: return "light_bringer"
        case .transcendence: return "ultra_instinct"
        }
    }

}

// MARK: - Profile Manager

class UserProfileManager: ObservableObject {

    static let shared = UserProfileManager()

    @Published var profile: UserAwakeningProfile?

    private let storageKey = "user_awakening_profile"

    private init() {
        loadProfile()
    }

    func createProfile(
        displayName: String,
        birthDate: Date?,
        motivation: AwakeningMotivation,
        resonances: [ResonanceType],
        learningStyle: LearningStyle,
        goals: [LifeGoal],
        colors: [String]
    ) -> UserAwakeningProfile {

        var zodiac: ZodiacSign? = nil
        if let date = birthDate {
            zodiac = ZodiacSign.from(date: date)
        }

        let profile = UserAwakeningProfile(
            id: UUID(),
            displayName: displayName,
            birthDate: birthDate,
            zodiacSign: zodiac,
            favoriteColors: colors,
            awakeningMotivation: motivation,
            resonatesWith: resonances,
            learningStyle: learningStyle,
            lifeGoals: goals,
            personalMantra: nil,
            createdAt: Date(),
            updatedAt: Date()
        )

        self.profile = profile
        saveProfile()
        return profile

    }

    func updateMantra(_ mantra: String) {
        profile?.personalMantra = mantra
        profile?.updatedAt = Date()
        saveProfile()
    }

    func saveProfile() {
        guard let profile = profile else { return }
        if let encoded = try? JSONEncoder().encode(profile) {
            UserDefaults.standard.set(encoded, forKey: storageKey)
        }
    }

    func loadProfile() {
        if let data = UserDefaults.standard.data(forKey: storageKey),
           let decoded = try? JSONDecoder().decode(UserAwakeningProfile.self, from: data) {
            profile = decoded
        }
    }

    func deleteProfile() {
        profile = nil
        UserDefaults.standard.removeObject(forKey: storageKey)
    }

}
