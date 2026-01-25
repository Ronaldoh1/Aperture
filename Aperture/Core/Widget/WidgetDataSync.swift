// WidgetDataSync.swift
// Sync app data to Widget extension via App Group
// Call this whenever relevant data changes

import Foundation
import WidgetKit

// MARK: - Widget Data Sync

final class WidgetDataSync {
    
    static let shared = WidgetDataSync()
    
    private let appGroupId = "group.com.sunflow.aperture"
    private let widgetDataKey = "widgetData"
    
    private var userDefaults: UserDefaults? {
        UserDefaults(suiteName: appGroupId)
    }
    
    private init() {}
    
    // MARK: - Update Widget Data
    
    /// Call this whenever dragon or streak data changes
    func updateWidgetData(
        dragonName: String,
        dragonStage: Int,
        dragonXP: Int,
        currentStreak: Int,
        lessonsToday: Int,
        lastLessonDate: Date?
    ) {
        let data = WidgetSyncData(
            dragonName: dragonName,
            dragonStage: dragonStage,
            dragonXP: dragonXP,
            currentStreak: currentStreak,
            lessonsToday: lessonsToday,
            lastLessonDate: lastLessonDate
        )
        
        saveToAppGroup(data)
        refreshWidgets()
    }
    
    /// Quick update just dragon
    func updateDragon(name: String, stage: Int, xp: Int) {
        var current = loadFromAppGroup() ?? .default
        current.dragonName = name
        current.dragonStage = stage
        current.dragonXP = xp
        saveToAppGroup(current)
        refreshWidgets()
    }
    
    /// Quick update just streak
    func updateStreak(_ days: Int) {
        var current = loadFromAppGroup() ?? .default
        current.currentStreak = days
        saveToAppGroup(current)
        refreshWidgets()
    }
    
    /// Increment lessons completed today
    func lessonCompleted() {
        var current = loadFromAppGroup() ?? .default
        
        // Check if it's a new day
        if let lastDate = current.lastLessonDate {
            if !Calendar.current.isDateInToday(lastDate) {
                current.lessonsToday = 0 // Reset for new day
            }
        }
        
        current.lessonsToday += 1
        current.lastLessonDate = Date()
        
        saveToAppGroup(current)
        refreshWidgets()
    }
    
    /// Add XP to dragon
    func addXP(_ amount: Int) {
        var current = loadFromAppGroup() ?? .default
        current.dragonXP += amount
        saveToAppGroup(current)
        refreshWidgets()
    }
    
    // MARK: - Private Methods
    
    private func saveToAppGroup(_ data: WidgetSyncData) {
        guard let encoded = try? JSONEncoder().encode(data) else {
            print("⚠️ Failed to encode widget data")
            return
        }
        
        userDefaults?.set(encoded, forKey: widgetDataKey)
        userDefaults?.synchronize()
        
        print("✅ Widget data synced: \(data.dragonName), Stage \(data.dragonStage), Streak \(data.currentStreak)")
    }
    
    private func loadFromAppGroup() -> WidgetSyncData? {
        guard let data = userDefaults?.data(forKey: widgetDataKey),
              let decoded = try? JSONDecoder().decode(WidgetSyncData.self, from: data) else {
            return nil
        }
        return decoded
    }
    
    private func refreshWidgets() {
        WidgetCenter.shared.reloadAllTimelines()
        print("🔄 Widget timelines reloaded")
    }
    
    // MARK: - Read Current Data
    
    func getCurrentData() -> WidgetSyncData {
        return loadFromAppGroup() ?? .default
    }
}

// MARK: - Widget Sync Data Model

struct WidgetSyncData: Codable {
    var dragonName: String
    var dragonStage: Int
    var dragonXP: Int
    var currentStreak: Int
    var lessonsToday: Int
    var lastLessonDate: Date?
    
    static let `default` = WidgetSyncData(
        dragonName: "Spark",
        dragonStage: 1,
        dragonXP: 0,
        currentStreak: 0,
        lessonsToday: 0,
        lastLessonDate: nil
    )
}

// MARK: - Integration Points

extension WidgetDataSync {
    
    /// Call from dragon companion when dragon changes
    /// Usage: WidgetDataSync.shared.syncDragon(name: dragon.name, stage: dragon.stage, xp: dragon.xp)
    func syncDragon(name: String, stage: Int, xp: Int) {
        updateDragon(name: name, stage: stage, xp: xp)
    }
    
    /// Call from lesson completion handler
    func syncLessonComplete() {
        lessonCompleted()
    }
    
    /// Call when calculating/loading streak
    func syncStreak(from days: Int) {
        updateStreak(days)
    }
}

// MARK: - App Group Setup Instructions
/*
 
 To enable Widget data sharing:
 
 1. In Xcode, select your main app target
 2. Go to Signing & Capabilities
 3. Click "+ Capability"
 4. Add "App Groups"
 5. Create a group: "group.com.sunflow.aperture"
 
 6. Do the same for your Widget extension target
 7. Both must have the SAME app group identifier
 
 8. In your entitlements file, ensure:
 <key>com.apple.security.application-groups</key>
 <array>
     <string>group.com.sunflow.aperture</string>
 </array>
 
 */

// MARK: - Usage Examples
/*
 
 // 1. When dragon levels up:
 WidgetDataSync.shared.updateDragon(name: "Blaze", stage: 3, xp: 1500)
 
 // 2. When lesson is completed:
 WidgetDataSync.shared.lessonCompleted()
 WidgetDataSync.shared.addXP(50)
 
 // 3. When streak is calculated:
 WidgetDataSync.shared.updateStreak(7)
 
 // 4. Full sync after data load:
 WidgetDataSync.shared.updateWidgetData(
     dragonName: profile.dragonName,
     dragonStage: profile.dragonStage,
     dragonXP: profile.dragonXP,
     currentStreak: profile.streak,
     lessonsToday: profile.todayLessons,
     lastLessonDate: profile.lastActivity
 )
 
 // 5. Sync from Core Data entity:
 if let dragon = fetchDragon() {
     WidgetDataSync.shared.syncFromDragon(dragon)
 }
 
 */
