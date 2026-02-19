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
    
    /// Call this whenever badge or streak data changes
    func updateWidgetData(
        badgeCount: Int,
        uniqueShapesCount: Int,
        currentStreak: Int,
        lessonsToday: Int,
        lastLessonDate: Date?
    ) {
        let data = WidgetSyncData(
            badgeCount: badgeCount,
            uniqueShapesCount: uniqueShapesCount,
            currentStreak: currentStreak,
            lessonsToday: lessonsToday,
            lastLessonDate: lastLessonDate
        )
        
        saveToAppGroup(data)
        refreshWidgets()
    }
    
    /// Quick update badges
    func updateBadges(count: Int, uniqueShapes: Int) {
        var current = loadFromAppGroup() ?? .default
        current.badgeCount = count
        current.uniqueShapesCount = uniqueShapes
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
                current.lessonsToday = 0
            }
        }
        
        current.lessonsToday += 1
        current.lastLessonDate = Date()
        saveToAppGroup(current)
        refreshWidgets()
    }
    
    // MARK: - App Group Persistence
    
    private func saveToAppGroup(_ data: WidgetSyncData) {
        guard let defaults = userDefaults else {
            print("⚠️ Widget: Could not access App Group")
            return
        }
        
        do {
            let encoded = try JSONEncoder().encode(data)
            defaults.set(encoded, forKey: widgetDataKey)
            print("✅ Widget data synced: \(data.badgeCount) badges, Streak \(data.currentStreak)")
        } catch {
            print("⚠️ Widget: Failed to encode data - \(error)")
        }
    }
    
    private func loadFromAppGroup() -> WidgetSyncData? {
        guard let defaults = userDefaults,
              let data = defaults.data(forKey: widgetDataKey) else {
            return nil
        }
        
        return try? JSONDecoder().decode(WidgetSyncData.self, from: data)
    }
    
    private func refreshWidgets() {
        WidgetCenter.shared.reloadAllTimelines()
    }
    
    /// Get current synced data (for widget to read)
    func getCurrentData() -> WidgetSyncData {
        return loadFromAppGroup() ?? .default
    }
}

// MARK: - Widget Sync Data Model

struct WidgetSyncData: Codable {
    var badgeCount: Int
    var uniqueShapesCount: Int
    var currentStreak: Int
    var lessonsToday: Int
    var lastLessonDate: Date?
    
    static let `default` = WidgetSyncData(
        badgeCount: 0,
        uniqueShapesCount: 0,
        currentStreak: 0,
        lessonsToday: 0,
        lastLessonDate: nil
    )
}

// MARK: - Integration Points

extension WidgetDataSync {
    
    /// Call from badge manager when badge is earned
    @MainActor
    func syncBadges() {
        let manager = SacredBadgeManager.shared
        updateBadges(count: manager.totalBadgeCount, uniqueShapes: manager.uniqueShapesEarned().count)
    }
    
    /// Call from lesson completion handler
    func syncLessonComplete() {
        lessonCompleted()
    }
    
    /// Call when calculating/loading streak
    func syncStreak(_ days: Int) {
        updateStreak(days)
    }
    
    /// Full sync - call on app launch or after major changes
    @MainActor
    func fullSync() {
        let badgeManager = SacredBadgeManager.shared
        let tracker = ProgressTracker.shared
        
        updateWidgetData(
            badgeCount: badgeManager.totalBadgeCount,
            uniqueShapesCount: badgeManager.uniqueShapesEarned().count,
            currentStreak: tracker.stats.currentStreak,
            lessonsToday: getCurrentData().lessonsToday,
            lastLessonDate: getCurrentData().lastLessonDate
        )
    }
}
