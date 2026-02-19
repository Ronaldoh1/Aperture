// AwakeningInteractor.swift

import Foundation

final class AwakeningInteractor: AwakeningInteractorType {
    
    weak var presenter: AwakeningInteractorOutputType?
    private let storage: AwakeningStorageType
    
    init(storage: AwakeningStorageType) {
        self.storage = storage
    }
    
    func loadProfile() {
        let profile = storage.loadProfile()
        let calculatedLevel = LevelProgressionEngine.calculateLevel(for: profile)
        
        if calculatedLevel.rawValue > profile.currentLevel.rawValue {
            var updatedProfile = profile
            updatedProfile.currentLevel = calculatedLevel
            storage.saveProfile(updatedProfile)
            presenter?.profileLoaded(updatedProfile)
            presenter?.levelUpDetected(calculatedLevel)
        } else {
            presenter?.profileLoaded(profile)
        }
    }
    
    func saveProfile(_ profile: AwakeningProfile) {
        storage.saveProfile(profile)
        presenter?.profileSaved()
    }
    
    func addCheckIn(_ checkIn: DailyCheckIn) {
        var profile = storage.loadProfile()
        let oldProfile = profile
        
        profile.checkIns.append(checkIn)
        profile.lastActiveDate = Date()
        storage.saveProfile(profile)
        
        if let newLevel = LevelProgressionEngine.checkForLevelUp(oldProfile: oldProfile, newProfile: profile) {
            profile.currentLevel = newLevel
            storage.saveProfile(profile)
            presenter?.levelUpDetected(newLevel)
        }
        presenter?.profileSaved()
    }
    
    func addDissonanceEntry(_ entry: CognitiveDissonanceEntry) {
        var profile = storage.loadProfile()
        let oldProfile = profile
        
        profile.dissonanceLog.append(entry)
        profile.lastActiveDate = Date()
        storage.saveProfile(profile)
        
        if let newLevel = LevelProgressionEngine.checkForLevelUp(oldProfile: oldProfile, newProfile: profile) {
            profile.currentLevel = newLevel
            storage.saveProfile(profile)
            presenter?.levelUpDetected(newLevel)
        }
        presenter?.profileSaved()
    }
    
    func updateAuditEntry(_ entry: RealityAuditEntry) {
        var profile = storage.loadProfile()
        let oldProfile = profile
        
        if let index = profile.auditEntries.firstIndex(where: { $0.id == entry.id }) {
            profile.auditEntries[index] = entry
        } else {
            profile.auditEntries.append(entry)
        }
        
        profile.lastActiveDate = Date()
        storage.saveProfile(profile)
        
        if let newLevel = LevelProgressionEngine.checkForLevelUp(oldProfile: oldProfile, newProfile: profile) {
            profile.currentLevel = newLevel
            storage.saveProfile(profile)
            presenter?.levelUpDetected(newLevel)
        }
        presenter?.profileSaved()
    }
    
    func updateQuestionEntry(_ entry: QuestionEntry) {
        var profile = storage.loadProfile()
        let oldProfile = profile
        
        if let index = profile.questionHistory.firstIndex(where: { $0.id == entry.id }) {
            profile.questionHistory[index] = entry
        } else {
            profile.questionHistory.append(entry)
        }
        
        profile.lastActiveDate = Date()
        storage.saveProfile(profile)
        
        if let newLevel = LevelProgressionEngine.checkForLevelUp(oldProfile: oldProfile, newProfile: profile) {
            profile.currentLevel = newLevel
            storage.saveProfile(profile)
            presenter?.levelUpDetected(newLevel)
        }
        presenter?.profileSaved()
    }
}
