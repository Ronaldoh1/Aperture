// WidgetHelper.swift
// Helper for syncing data to Widget extension
// NOTE: Widget Extension target should be created separately in Xcode

import Foundation
import WidgetKit

// MARK: - Widget Data Keys (shared with Widget Extension via App Group)

struct WidgetDataKeys {
    static let appGroupID = "group.com.sunflow.aperture"
    static let streakKey = "widget.streak"
    static let badgeCountKey = "widget.badgeCount"
    static let uniqueShapesKey = "widget.uniqueShapes"
    static let lastPracticeKey = "widget.lastPractice"
    static let wisdomKey = "widget.wisdom"
    static let journeyTypeKey = "widget.journeyType"
}

// MARK: - Widget Update Helper

/// Call this from the main app to update widget data
class WidgetUpdateHelper {
    
    static var sharedDefaults: UserDefaults? {
        UserDefaults(suiteName: WidgetDataKeys.appGroupID)
    }
    
    static func updateWidgetData(
        streak: Int,
        badgeCount: Int,
        uniqueShapes: Int,
        lastPractice: Date?,
        journeyType: String
    ) {
        let defaults = sharedDefaults
        defaults?.set(streak, forKey: WidgetDataKeys.streakKey)
        defaults?.set(badgeCount, forKey: WidgetDataKeys.badgeCountKey)
        defaults?.set(uniqueShapes, forKey: WidgetDataKeys.uniqueShapesKey)
        defaults?.set(lastPractice, forKey: WidgetDataKeys.lastPracticeKey)
        defaults?.set(journeyType, forKey: WidgetDataKeys.journeyTypeKey)
        
        // Update wisdom daily
        let wisdoms = [
            "The truth you seek is not hidden—it is ignored.",
            "Every tradition points to the same summit.",
            "What they call heresy is often the truth they fear.",
            "You were born awake. You were taught to sleep.",
            "The patterns repeat until you see them.",
            "Consciousness is not found. It is remembered."
        ]
        let dayOfYear = Calendar.current.ordinality(of: .day, in: .year, for: Date()) ?? 0
        defaults?.set(wisdoms[dayOfYear % wisdoms.count], forKey: WidgetDataKeys.wisdomKey)
        
        WidgetCenter.shared.reloadAllTimelines()
    }
    
    /// Quick sync from badge manager
    @MainActor
    static func syncBadges() {
        let manager = SacredBadgeManager.shared
        let tracker = ProgressTracker.shared
        
        updateWidgetData(
            streak: tracker.stats.currentStreak,
            badgeCount: manager.totalBadgeCount,
            uniqueShapes: manager.uniqueShapesEarned().count,
            lastPractice: Date(),
            journeyType: UserJourneyStore.shared.journeyType?.rawValue ?? "Seeker"
        )
    }
}
