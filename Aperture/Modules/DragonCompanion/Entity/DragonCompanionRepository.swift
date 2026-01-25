// DragonCompanionRepository.swift
// Central repository for dragon companion data and cloud sync status
// Wraps DragonPersistenceManager and DragonProgressionManager

import SwiftUI
import CoreData
import Combine

// MARK: - Cloud Status

enum CloudStatus {
    case available
    case notSignedIn
    case restricted
}

// MARK: - Dragon Companion Repository

class DragonCompanionRepository: ObservableObject {

    static let shared = DragonCompanionRepository()

    // MARK: - Published Properties

    @Published var cloudStatus: CloudStatus = .notSignedIn
    @Published var isSyncing: Bool = false
    @Published var lastSyncDate: Date?

    // Dragon data - wraps DragonProgressionManager
    @Published var currentDragon: DragonCompanion? {
        didSet {
            DragonProgressionManager.shared.companion = currentDragon
            if currentDragon != nil {
                DragonProgressionManager.shared.saveCompanion()
            }
        }
    }

    // Profile data - uses UserAwakeningProfile for views
    @Published var currentProfile: UserAwakeningProfile?

    private var cancellables = Set<AnyCancellable>()

    // MARK: - Init

    private init() {
        checkCloudStatus()
        setupObservers()
        loadData()
    }

    // MARK: - Load Data

    private func loadData() {
        // Load dragon from progression manager
        currentDragon = DragonProgressionManager.shared.companion

        // Load profile from data manager and convert to UserAwakeningProfile
        if let profileData = DragonDataManager.shared.profile {
            currentProfile = UserAwakeningProfile(
                id: profileData.id,
                displayName: profileData.displayName,
                birthDate: profileData.birthDate,
                zodiacSign: profileData.zodiacSign,
                favoriteColors: profileData.favoriteColors,
                awakeningMotivation: profileData.awakeningMotivation,
                resonatesWith: profileData.resonatesWith,
                learningStyle: profileData.learningStyle,
                lifeGoals: profileData.lifeGoals,
                personalMantra: profileData.personalMantra,
                createdAt: Date(),
                updatedAt: Date()
            )
        }
    }

    // MARK: - Dragon Creation

    func createDragon(name: String, element: DragonElement) -> DragonCompanion {
        let dragon = DragonProgressionManager.shared.createEgg(name: name)
        var updatedDragon = dragon
        updatedDragon.primaryElement = element
        DragonProgressionManager.shared.companion = updatedDragon
        DragonProgressionManager.shared.saveCompanion()
        currentDragon = updatedDragon
        return updatedDragon
    }

    // MARK: - Profile Creation

    func createProfile(_ profile: UserAwakeningProfile) {
        currentProfile = profile
        
        // Convert to UserProfileData for storage
        let profileData = UserProfileData(
            id: profile.id,
            displayName: profile.displayName,
            birthDate: profile.birthDate,
            zodiacSign: profile.zodiacSign,
            favoriteColors: profile.favoriteColors,
            awakeningMotivation: profile.awakeningMotivation,
            resonatesWith: profile.resonatesWith,
            learningStyle: profile.learningStyle,
            lifeGoals: profile.lifeGoals,
            personalMantra: profile.personalMantra
        )
        DragonDataManager.shared.profile = profileData
        DragonDataManager.shared.saveProfile(profileData)
    }

    // MARK: - Cloud Status Check

    func checkCloudStatus() {
        // First check if iCloud is even available on device
        guard FileManager.default.ubiquityIdentityToken != nil else {
            cloudStatus = .notSignedIn
            return
        }
        
        // For now, just assume available if ubiquity token exists
        // Full CloudKit integration requires entitlements to be configured
        cloudStatus = .available
    }

    // MARK: - Observers

    private func setupObservers() {
        // Listen for cloud account changes
        // Note: CKAccountChanged notification removed - requires CloudKit entitlements
        // When you add CloudKit entitlements, uncomment this:
        // NotificationCenter.default.publisher(for: .CKAccountChanged)
        //     .sink { [weak self] _ in
        //         self?.checkCloudStatus()
        //     }
        //     .store(in: &cancellables)

        // Listen for data sync
        NotificationCenter.default.publisher(for: Notification.Name("NSPersistentStoreRemoteChangeNotification"))
            .sink { [weak self] _ in
                DispatchQueue.main.async {
                    self?.lastSyncDate = Date()
                    self?.loadData()
                }
            }
            .store(in: &cancellables)

        // Listen for dragon evolution
        NotificationCenter.default.publisher(for: .dragonEvolved)
            .sink { [weak self] _ in
                self?.currentDragon = DragonProgressionManager.shared.companion
            }
            .store(in: &cancellables)
    }

    // MARK: - Sync

    func triggerSync() {
        guard cloudStatus == .available else { return }
        isSyncing = true

        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            self?.isSyncing = false
            self?.lastSyncDate = Date()
        }
    }

    // MARK: - Status Helpers

    var isCloudAvailable: Bool {
        cloudStatus == .available
    }

    var statusDescription: String {
        switch cloudStatus {
        case .available:
            return "Your data syncs across all your devices"
        case .notSignedIn:
            return "Sign into iCloud to backup your progress"
        case .restricted:
            return "iCloud is restricted on this device"
        }
    }

}

// MARK: - Awakening Journey Checker

class AwakeningJourneyChecker: ObservableObject {

    static let shared = AwakeningJourneyChecker()

    // Core courses required for dragon awakening
    private let requiredCourses = [
        "constitution101",
        "knowYourRights",
        "digitalSecurity",
        "sacredGeometry",
        "chakras",
        "meditation"
    ]

    @Published var completedCourses: Set<String> = []

    private init() {
        loadProgress()
    }

    var progressPercentage: CGFloat {
        guard !requiredCourses.isEmpty else { return 0 }
        let completed = requiredCourses.filter { completedCourses.contains($0) }.count
        return CGFloat(completed) / CGFloat(requiredCourses.count)
    }

    var isJourneyComplete: Bool {
        requiredCourses.allSatisfy { completedCourses.contains($0) }
    }

    var remainingCourses: [String] {
        requiredCourses.filter { !completedCourses.contains($0) }
    }

    func markCourseComplete(_ courseId: String) {
        completedCourses.insert(courseId)
        saveProgress()
    }

    private func loadProgress() {
        if let data = UserDefaults.standard.array(forKey: "awakening_journey_progress") as? [String] {
            completedCourses = Set(data)
        }
    }

    private func saveProgress() {
        UserDefaults.standard.set(Array(completedCourses), forKey: "awakening_journey_progress")
    }

}
