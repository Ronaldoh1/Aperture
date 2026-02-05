// AwakeningStorage.swift

import Foundation

protocol AwakeningStorageType {
    func loadProfile() -> AwakeningProfile
    func saveProfile(_ profile: AwakeningProfile)
    func deleteProfile()
}

final class AwakeningStorage: AwakeningStorageType {
    
    private let storageKey = "awakening_profile_v1"
    private let fileManager = FileManager.default
    
    private var storageURL: URL {
        let documentsDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0]
        return documentsDirectory.appendingPathComponent("awakening_profile.json")
    }
    
    func loadProfile() -> AwakeningProfile {
        guard fileManager.fileExists(atPath: storageURL.path) else {
            let defaultProfile = AwakeningProfile.default
            saveProfile(defaultProfile)
            return defaultProfile
        }
        
        do {
            let data = try Data(contentsOf: storageURL)
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            let profile = try decoder.decode(AwakeningProfile.self, from: data)
            return profile
        } catch {
            print("Failed to load awakening profile: \(error)")
            return AwakeningProfile.default
        }
    }
    
    func saveProfile(_ profile: AwakeningProfile) {
        do {
            let encoder = JSONEncoder()
            encoder.dateEncodingStrategy = .iso8601
            encoder.outputFormatting = .prettyPrinted
            let data = try encoder.encode(profile)
            try data.write(to: storageURL, options: [.atomic, .completeFileProtection])
        } catch {
            print("Failed to save awakening profile: \(error)")
        }
    }
    
    func deleteProfile() {
        do {
            if fileManager.fileExists(atPath: storageURL.path) {
                try fileManager.removeItem(at: storageURL)
            }
        } catch {
            print("Failed to delete awakening profile: \(error)")
        }
    }
}

// MARK: - Level Progression Engine

final class LevelProgressionEngine {
    
    static func calculateLevel(for profile: AwakeningProfile) -> AwakeningLevel {
        let score = profile.currentScore
        
        for level in AwakeningLevel.allCases.reversed() {
            if score >= level.requiredScore {
                return level
            }
        }
        return .npc
    }
    
    static func checkForLevelUp(oldProfile: AwakeningProfile, newProfile: AwakeningProfile) -> AwakeningLevel? {
        let oldLevel = calculateLevel(for: oldProfile)
        let newLevel = calculateLevel(for: newProfile)
        
        if newLevel.rawValue > oldLevel.rawValue {
            return newLevel
        }
        return nil
    }
}
