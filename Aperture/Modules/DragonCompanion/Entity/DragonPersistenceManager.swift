// DragonPersistenceManager.swift
// Core Data + CloudKit for persistent storage across reinstalls
// Data syncs via iCloud - no account needed, uses their Apple ID

import CoreData
import CloudKit
import SwiftUI

// MARK: - Persistence Controller

class DragonPersistenceController {

    static let shared = DragonPersistenceController()

    let container: NSPersistentCloudKitContainer

    // Check if iCloud is available
    var isCloudAvailable: Bool {
        FileManager.default.ubiquityIdentityToken != nil
    }

    private init() {

        container = NSPersistentCloudKitContainer(name: "DragonCompanionModel")

        // Configure for CloudKit sync
        guard let description = container.persistentStoreDescriptions.first else {
            fatalError("No persistent store description found")
        }

        // Only enable CloudKit if iCloud is available
        if isCloudAvailable {
            // Enable CloudKit sync - uses user's Apple ID
            description.cloudKitContainerOptions = NSPersistentCloudKitContainerOptions(
                containerIdentifier: "iCloud.com.sunflow.aperture.dragon"
            )
            print("☁️ CloudKit enabled - data will sync across devices")
        } else {
            print("📱 CloudKit not available - using local storage only")
        }

        // Enable remote change notifications
        description.setOption(true as NSNumber, forKey: NSPersistentStoreRemoteChangeNotificationPostOptionKey)

        // Enable history tracking for CloudKit
        description.setOption(true as NSNumber, forKey: NSPersistentHistoryTrackingKey)

        container.loadPersistentStores { description, error in
            if let error = error {
                print("❌ Core Data failed to load: \(error.localizedDescription)")
            } else {
                print("✅ Core Data + CloudKit loaded successfully")
            }
        }

        // Automatically merge changes from CloudKit
        container.viewContext.automaticallyMergesChangesFromParent = true
        container.viewContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy

        // Listen for remote changes
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(handleRemoteChange),
            name: .NSPersistentStoreRemoteChange,
            object: container.persistentStoreCoordinator
        )

    }

    @objc private func handleRemoteChange(_ notification: Notification) {
        // CloudKit synced new data - notify UI
        DispatchQueue.main.async {
            NotificationCenter.default.post(name: .dragonDataSynced, object: nil)
        }
    }

    // MARK: - Save Context

    func save() {
        let context = container.viewContext
        if context.hasChanges {
            do {
                try context.save()
                print("✅ Dragon data saved")
            } catch {
                print("❌ Failed to save: \(error)")
            }
        }
    }

}

// MARK: - Notifications

extension Notification.Name {

    static let dragonDataSynced = Notification.Name("dragonDataSynced")
    static let courseCompleted = Notification.Name("courseCompleted")

}

// MARK: - Dragon Data Manager (Core Data Interface)

class DragonDataManager: ObservableObject {

    static let shared = DragonDataManager()

    private let context: NSManagedObjectContext

    @Published var companion: DragonCompanionData?
    @Published var profile: UserProfileData?
    @Published var completedCourses: Set<String> = []

    private init() {
        context = DragonPersistenceController.shared.container.viewContext
        loadData()

        // Listen for CloudKit sync
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(handleSync),
            name: .dragonDataSynced,
            object: nil
        )
    }

    @objc private func handleSync() {
        loadData()
    }

    // MARK: - Load Data

    func loadData() {
        loadCompanion()
        loadProfile()
        loadCompletedCourses()
    }

    private func loadCompanion() {
        let request = NSFetchRequest<NSManagedObject>(entityName: "DragonCompanionEntity")
        request.fetchLimit = 1

        do {
            if let entity = try context.fetch(request).first {
                companion = DragonCompanionData(from: entity)
            }
        } catch {
            print("❌ Failed to load companion: \(error)")
        }
    }

    private func loadProfile() {
        let request = NSFetchRequest<NSManagedObject>(entityName: "UserProfileEntity")
        request.fetchLimit = 1

        do {
            if let entity = try context.fetch(request).first {
                profile = UserProfileData(from: entity)
            }
        } catch {
            print("❌ Failed to load profile: \(error)")
        }
    }

    private func loadCompletedCourses() {
        let request = NSFetchRequest<NSManagedObject>(entityName: "CompletedCourseEntity")

        do {
            let entities = try context.fetch(request)
            completedCourses = Set(entities.compactMap { $0.value(forKey: "courseId") as? String })
        } catch {
            print("❌ Failed to load completed courses: \(error)")
        }
    }

    // MARK: - Save Companion

    func saveCompanion(_ data: DragonCompanionData) {

        let request = NSFetchRequest<NSManagedObject>(entityName: "DragonCompanionEntity")
        request.fetchLimit = 1

        do {
            let entity: NSManagedObject
            if let existing = try context.fetch(request).first {
                entity = existing
            } else {
                guard let entityDescription = NSEntityDescription.entity(forEntityName: "DragonCompanionEntity", in: context) else { return }
                entity = NSManagedObject(entity: entityDescription, insertInto: context)
                entity.setValue(data.id, forKey: "id")
                entity.setValue(Date(), forKey: "createdAt")
            }

            entity.setValue(data.name, forKey: "name")
            entity.setValue(data.stage.rawValue, forKey: "stage")
            entity.setValue(data.primaryElement.rawValue, forKey: "primaryElement")
            entity.setValue(data.secondaryElement?.rawValue, forKey: "secondaryElement")
            entity.setValue(Int64(data.totalXP), forKey: "totalXP")
            entity.setValue(data.currentMood.rawValue, forKey: "currentMood")
            entity.setValue(Date(), forKey: "updatedAt")

            // Save chakra progress as JSON
            if let chakraData = try? JSONEncoder().encode(data.chakraProgress) {
                entity.setValue(chakraData, forKey: "chakraProgressData")
            }

            // Save traits as JSON
            if let traitsData = try? JSONEncoder().encode(data.traits) {
                entity.setValue(traitsData, forKey: "traitsData")
            }

            DragonPersistenceController.shared.save()
            companion = data

        } catch {
            print("❌ Failed to save companion: \(error)")
        }

    }

    // MARK: - Save Profile

    func saveProfile(_ data: UserProfileData) {

        let request = NSFetchRequest<NSManagedObject>(entityName: "UserProfileEntity")
        request.fetchLimit = 1

        do {
            let entity: NSManagedObject
            if let existing = try context.fetch(request).first {
                entity = existing
            } else {
                guard let entityDescription = NSEntityDescription.entity(forEntityName: "UserProfileEntity", in: context) else { return }
                entity = NSManagedObject(entity: entityDescription, insertInto: context)
                entity.setValue(data.id, forKey: "id")
                entity.setValue(Date(), forKey: "createdAt")
            }

            entity.setValue(data.displayName, forKey: "displayName")
            entity.setValue(data.birthDate, forKey: "birthDate")
            entity.setValue(data.zodiacSign?.rawValue, forKey: "zodiacSignRaw")
            entity.setValue(data.awakeningMotivation.rawValue, forKey: "motivation")
            entity.setValue(data.learningStyle.rawValue, forKey: "learningStyle")
            entity.setValue(data.personalMantra, forKey: "personalMantra")
            entity.setValue(Date(), forKey: "updatedAt")

            // Save arrays as JSON
            if let colorsData = try? JSONEncoder().encode(data.favoriteColors) {
                entity.setValue(colorsData, forKey: "favoriteColorsData")
            }
            if let resonanceData = try? JSONEncoder().encode(data.resonatesWith.map { $0.rawValue }) {
                entity.setValue(resonanceData, forKey: "resonatesWithData")
            }
            if let goalsData = try? JSONEncoder().encode(data.lifeGoals.map { $0.rawValue }) {
                entity.setValue(goalsData, forKey: "lifeGoalsData")
            }

            DragonPersistenceController.shared.save()
            profile = data

        } catch {
            print("❌ Failed to save profile: \(error)")
        }

    }

    // MARK: - Course Completion

    func markCourseComplete(_ courseId: String, category: String, xpAwarded: Int) {

        // Check if already completed
        guard !completedCourses.contains(courseId) else { return }

        guard let entityDescription = NSEntityDescription.entity(forEntityName: "CompletedCourseEntity", in: context) else { return }
        let entity = NSManagedObject(entity: entityDescription, insertInto: context)
        entity.setValue(UUID(), forKey: "id")
        entity.setValue(courseId, forKey: "courseId")
        entity.setValue(category, forKey: "category")
        entity.setValue(Date(), forKey: "completedAt")
        entity.setValue(Int64(xpAwarded), forKey: "xpAwarded")

        DragonPersistenceController.shared.save()
        completedCourses.insert(courseId)

        // Update companion XP
        if var currentCompanion = companion {
            currentCompanion.totalXP += xpAwarded
            currentCompanion.stage = DragonStage.stageFor(xp: currentCompanion.totalXP)
            saveCompanion(currentCompanion)
        }

        // Notify
        NotificationCenter.default.post(
            name: .courseCompleted,
            object: nil,
            userInfo: ["courseId": courseId, "xp": xpAwarded]
        )

    }

    // MARK: - Reset (for testing)

    func resetAllData() {

        let entityNames = ["DragonCompanionEntity", "UserProfileEntity", "CompletedCourseEntity"]

        for entityName in entityNames {
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
            let deleteRequest = NSBatchDeleteRequest(fetchRequest: request)

            do {
                try context.execute(deleteRequest)
            } catch {
                print("❌ Failed to delete \(entityName): \(error)")
            }
        }

        DragonPersistenceController.shared.save()
        companion = nil
        profile = nil
        completedCourses = []
        print("✅ All dragon data reset")

    }

}

// MARK: - Data Transfer Objects

struct DragonCompanionData: Identifiable {

    let id: UUID
    var name: String
    var stage: DragonStage
    var primaryElement: DragonElement
    var secondaryElement: DragonElement?
    var chakraProgress: [ChakraLevelData]
    var traits: [DragonTraitData]
    var birthDate: Date
    var totalXP: Int
    var currentMood: DragonMood

    init(
        id: UUID = UUID(),
        name: String,
        stage: DragonStage = .egg,
        primaryElement: DragonElement = .void,
        secondaryElement: DragonElement? = nil,
        chakraProgress: [ChakraLevelData] = ChakraType.allCases.map { ChakraLevelData(chakra: $0) },
        traits: [DragonTraitData] = [],
        birthDate: Date = Date(),
        totalXP: Int = 0,
        currentMood: DragonMood = .sleeping
    ) {
        self.id = id
        self.name = name
        self.stage = stage
        self.primaryElement = primaryElement
        self.secondaryElement = secondaryElement
        self.chakraProgress = chakraProgress
        self.traits = traits
        self.birthDate = birthDate
        self.totalXP = totalXP
        self.currentMood = currentMood
    }

    init(from entity: NSManagedObject) {
        self.id = entity.value(forKey: "id") as? UUID ?? UUID()
        self.name = entity.value(forKey: "name") as? String ?? "Dragon"
        self.stage = DragonStage(rawValue: entity.value(forKey: "stage") as? String ?? "") ?? .egg
        self.primaryElement = DragonElement(rawValue: entity.value(forKey: "primaryElement") as? String ?? "") ?? .void
        self.secondaryElement = (entity.value(forKey: "secondaryElement") as? String).flatMap { DragonElement(rawValue: $0) }
        self.birthDate = entity.value(forKey: "createdAt") as? Date ?? Date()
        self.totalXP = Int(entity.value(forKey: "totalXP") as? Int64 ?? 0)
        self.currentMood = DragonMood(rawValue: entity.value(forKey: "currentMood") as? String ?? "") ?? .sleeping

        // Decode chakra progress
        if let data = entity.value(forKey: "chakraProgressData") as? Data,
           let decoded = try? JSONDecoder().decode([ChakraLevelData].self, from: data) {
            self.chakraProgress = decoded
        } else {
            self.chakraProgress = ChakraType.allCases.map { ChakraLevelData(chakra: $0) }
        }

        // Decode traits
        if let data = entity.value(forKey: "traitsData") as? Data,
           let decoded = try? JSONDecoder().decode([DragonTraitData].self, from: data) {
            self.traits = decoded
        } else {
            self.traits = []
        }
    }

}

struct ChakraLevelData: Codable, Identifiable {

    var id: String { chakra.rawValue }
    let chakra: ChakraType
    var progress: Double
    var isActivated: Bool

    init(chakra: ChakraType, progress: Double = 0, isActivated: Bool = false) {
        self.chakra = chakra
        self.progress = progress
        self.isActivated = isActivated
    }

}

struct DragonTraitData: Codable, Identifiable {

    let id: String
    let name: String
    let description: String
    let icon: String
    let rarity: TraitRarity
    let unlockedBy: String
    let unlockedAt: Date

}

struct UserProfileData: Identifiable {

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

    // Computed property for dragon element
    var dominantElement: DragonElement {
        if let zodiac = zodiacSign {
            return zodiac.element
        }
        return awakeningMotivation.suggestedElement
    }

    init(
        id: UUID = UUID(),
        displayName: String,
        birthDate: Date? = nil,
        zodiacSign: ZodiacSign? = nil,
        favoriteColors: [String] = [],
        awakeningMotivation: AwakeningMotivation = .seekingTruth,
        resonatesWith: [ResonanceType] = [],
        learningStyle: LearningStyle = .visual,
        lifeGoals: [LifeGoal] = [],
        personalMantra: String? = nil
    ) {
        self.id = id
        self.displayName = displayName
        self.birthDate = birthDate
        self.zodiacSign = zodiacSign ?? birthDate.map { ZodiacSign.from(date: $0) }
        self.favoriteColors = favoriteColors
        self.awakeningMotivation = awakeningMotivation
        self.resonatesWith = resonatesWith
        self.learningStyle = learningStyle
        self.lifeGoals = lifeGoals
        self.personalMantra = personalMantra
    }

    init(from entity: NSManagedObject) {
        self.id = entity.value(forKey: "id") as? UUID ?? UUID()
        self.displayName = entity.value(forKey: "displayName") as? String ?? "Seeker"
        self.birthDate = entity.value(forKey: "birthDate") as? Date
        self.zodiacSign = (entity.value(forKey: "zodiacSignRaw") as? String).flatMap { ZodiacSign(rawValue: $0) }
        self.awakeningMotivation = AwakeningMotivation(rawValue: entity.value(forKey: "motivation") as? String ?? "") ?? .seekingTruth
        self.learningStyle = LearningStyle(rawValue: entity.value(forKey: "learningStyle") as? String ?? "") ?? .visual
        self.personalMantra = entity.value(forKey: "personalMantra") as? String

        // Decode arrays
        if let data = entity.value(forKey: "favoriteColorsData") as? Data,
           let decoded = try? JSONDecoder().decode([String].self, from: data) {
            self.favoriteColors = decoded
        } else {
            self.favoriteColors = []
        }

        if let data = entity.value(forKey: "resonatesWithData") as? Data,
           let decoded = try? JSONDecoder().decode([String].self, from: data) {
            self.resonatesWith = decoded.compactMap { ResonanceType(rawValue: $0) }
        } else {
            self.resonatesWith = []
        }

        if let data = entity.value(forKey: "lifeGoalsData") as? Data,
           let decoded = try? JSONDecoder().decode([String].self, from: data) {
            self.lifeGoals = decoded.compactMap { LifeGoal(rawValue: $0) }
        } else {
            self.lifeGoals = []
        }
    }

    // MARK: - Conversion to UserAwakeningProfile

    func toAwakeningProfile() -> UserAwakeningProfile {
        UserAwakeningProfile(
            id: id,
            displayName: displayName,
            birthDate: birthDate,
            zodiacSign: zodiacSign,
            favoriteColors: favoriteColors,
            awakeningMotivation: awakeningMotivation,
            resonatesWith: resonatesWith,
            learningStyle: learningStyle,
            lifeGoals: lifeGoals,
            personalMantra: personalMantra,
            createdAt: Date(),
            updatedAt: Date()
        )
    }

}
