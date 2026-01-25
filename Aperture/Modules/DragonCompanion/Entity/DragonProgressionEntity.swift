// DragonProgressionEntity.swift
// The system that grows your dragon companion

import Foundation

// MARK: - Dragon Progression Manager

class DragonProgressionManager: ObservableObject {

    static let shared = DragonProgressionManager()

    @Published var companion: DragonCompanion?

    private let storageKey = "dragon_companion"

    private init() {
        loadCompanion()
    }

    // MARK: - Companion Lifecycle

    func createEgg(name: String) -> DragonCompanion {

        let initialChakras = ChakraType.allCases.map { chakra in
            ChakraLevel(chakra: chakra, progress: 0.0, isActivated: false)
        }

        let companion = DragonCompanion(
            id: UUID(),
            name: name,
            stage: .egg,
            primaryElement: .void,  // Unknown until path emerges
            secondaryElement: nil,
            chakraProgress: initialChakras,
            traits: [],
            birthDate: Date(),
            totalXP: 0,
            currentMood: .sleeping
        )

        self.companion = companion
        saveCompanion()
        return companion

    }

    // MARK: - XP System

    func awardXP(amount: Int, source: XPSource) {

        guard var dragon = companion else { return }

        dragon.totalXP += amount
        
        // Haptic for XP gain
        HapticManager.shared.xpGained()

        // Check for stage evolution
        let newStage = DragonStage.stageFor(xp: dragon.totalXP)
        if newStage != dragon.stage {
            dragon.stage = newStage
            // Trigger evolution animation/celebration
            NotificationCenter.default.post(
                name: .dragonEvolved,
                object: nil,
                userInfo: ["stage": newStage]
            )
            // Epic haptic for evolution!
            HapticManager.shared.dragonEvolved()
        }

        // Update mood based on activity
        dragon.currentMood = moodFor(source: source)

        companion = dragon
        saveCompanion()

    }

    private func moodFor(source: XPSource) -> DragonMood {
        switch source {
        case .courseCompletion: return .proud
        case .lessonCompletion: return .excited
        case .dailyLogin: return .curious
        case .streakBonus: return .fierce
        case .achievement: return .transcendent
        case .meditation: return .meditative
        case .sharing: return .playful
        }
    }

    // MARK: - Course Completion

    func completeCourse(_ courseId: String, category: CourseCategory) {

        guard var dragon = companion else { return }

        // Award XP based on course difficulty
        let xp = xpFor(category: category)
        awardXP(amount: xp, source: .courseCompletion)

        // Update chakra progress
        if let chakra = chakraFor(category: category) {
            if let index = dragon.chakraProgress.firstIndex(where: { $0.chakra == chakra }) {
                dragon.chakraProgress[index].progress = min(1.0, dragon.chakraProgress[index].progress + 0.2)
                if dragon.chakraProgress[index].progress >= 1.0 {
                    dragon.chakraProgress[index].isActivated = true
                }
            }
        }

        // Check for new traits
        if let newTrait = traitFor(courseId: courseId) {
            if !dragon.traits.contains(where: { $0.id == newTrait.id }) {
                dragon.traits.append(newTrait)
                NotificationCenter.default.post(
                    name: .dragonTraitUnlocked,
                    object: nil,
                    userInfo: ["trait": newTrait]
                )
            }
        }

        // Update element based on dominant path
        updateElement(for: &dragon, courseCategory: category)

        companion = dragon
        saveCompanion()

    }

    private func xpFor(category: CourseCategory) -> Int {
        switch category {
        case .documentaries: return 200
        case .institutionalLies: return 500
        case .religionExposed: return 400
        case .matrixExposed: return 400
        case .hiddenHistory: return 400
        case .liesExposed: return 350
        case .controlSystems: return 450
        case .consciousness: return 500
        case .animeWisdom: return 300
        case .spiritualTraditions: return 350
        case .sunflowState: return 1000  // Premium = more XP
        }
    }

    private func chakraFor(category: CourseCategory) -> ChakraType? {
        switch category {
        case .institutionalLies, .controlSystems: return .root
        case .matrixExposed, .sunflowState: return .solarPlexus
        case .animeWisdom, .consciousness: return .heart
        case .religionExposed, .liesExposed: return .throat
        case .hiddenHistory: return .thirdEye
        case .spiritualTraditions: return .crown
        default: return nil
        }
    }

    private func traitFor(courseId: String) -> DragonTrait? {
        DragonTrait.availableTraits.first { $0.unlockedBy == courseId }
    }

    private func updateElement(for dragon: inout DragonCompanion, courseCategory: CourseCategory) {

        // Determine element based on most completed categories
        // This is simplified - real implementation would track all completions

        switch courseCategory {
        case .institutionalLies, .liesExposed:
            if dragon.primaryElement == .void {
                dragon.primaryElement = .light
            } else if dragon.secondaryElement == nil {
                dragon.secondaryElement = .light
            }
        case .consciousness, .spiritualTraditions:
            if dragon.primaryElement == .void {
                dragon.primaryElement = .cosmic
            } else if dragon.secondaryElement == nil {
                dragon.secondaryElement = .cosmic
            }
        case .sunflowState:
            if dragon.primaryElement == .void {
                dragon.primaryElement = .fire
            } else if dragon.secondaryElement == nil {
                dragon.secondaryElement = .fire
            }
        case .matrixExposed, .controlSystems:
            if dragon.primaryElement == .void {
                dragon.primaryElement = .shadow
            } else if dragon.secondaryElement == nil {
                dragon.secondaryElement = .shadow
            }
        default:
            break
        }

    }

    // MARK: - Persistence

    func saveCompanion() {
        guard let companion = companion else { return }
        if let encoded = try? JSONEncoder().encode(companion) {
            UserDefaults.standard.set(encoded, forKey: storageKey)
        }
    }

    func loadCompanion() {
        if let data = UserDefaults.standard.data(forKey: storageKey),
           let decoded = try? JSONDecoder().decode(DragonCompanion.self, from: data) {
            companion = decoded
        }
    }

    func resetCompanion() {
        companion = nil
        UserDefaults.standard.removeObject(forKey: storageKey)
    }

}

// MARK: - XP Source

enum XPSource {

    case courseCompletion
    case lessonCompletion
    case dailyLogin
    case streakBonus
    case achievement
    case meditation
    case sharing

}

// MARK: - Course Category

enum CourseCategory: String, CaseIterable {

    case documentaries = "Documentaries"
    case institutionalLies = "Institutional Lies"
    case religionExposed = "Religion Exposed"
    case matrixExposed = "Matrix Exposed"
    case hiddenHistory = "Hidden History"
    case liesExposed = "Lies Exposed"
    case controlSystems = "Control Systems"
    case consciousness = "Consciousness"
    case animeWisdom = "Anime Wisdom"
    case spiritualTraditions = "Spiritual Traditions"
    case sunflowState = "SunFlow State"

}

// MARK: - Notifications

extension Notification.Name {

    static let dragonEvolved = Notification.Name("dragonEvolved")
    static let dragonTraitUnlocked = Notification.Name("dragonTraitUnlocked")
    static let dragonChakraActivated = Notification.Name("dragonChakraActivated")

}

// MARK: - Tesla Numerology

struct TeslaNumerology {

    // "If you only knew the magnificence of 3, 6, and 9,
    // then you would have the key to the universe." - Nikola Tesla

    static let creationNumbers = [1, 2, 4, 5, 7, 8]  // The physical
    static let divineNumbers = [3, 6, 9]              // The spiritual
    static let sourceNumber = 0                       // The infinite

    static func reduce(_ number: Int) -> Int {
        var n = number
        while n > 9 {
            n = String(n).compactMap { $0.wholeNumberValue }.reduce(0, +)
        }
        return n
    }

    static func isDivine(_ number: Int) -> Bool {
        let reduced = reduce(number)
        return divineNumbers.contains(reduced)
    }

    static func message(for xp: Int) -> String? {
        let reduced = reduce(xp)
        switch reduced {
        case 3: return "3 - The Triangle of Creation. You are building."
        case 6: return "6 - The Hexagon of Balance. Harmony approaches."
        case 9: return "9 - The Circle Complete. Transcendence awaits."
        case 0: return "0 - The Source. You have returned to origin."
        default: return nil
        }
    }

}
