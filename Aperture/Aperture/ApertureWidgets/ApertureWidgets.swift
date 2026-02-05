// ApertureWidgets.swift
// iOS Widget extension for Aperture
// Widgets: Daily Dragon, Streak, Quick Practice

import WidgetKit
import SwiftUI

// MARK: - Shared Data

struct WidgetData {
    static let appGroupID = "group.com.sunflow.aperture"
    
    static var sharedDefaults: UserDefaults? {
        UserDefaults(suiteName: appGroupID)
    }
    
    // Keys
    static let streakKey = "widget.streak"
    static let dragonLevelKey = "widget.dragonLevel"
    static let dragonStageKey = "widget.dragonStage"
    static let dragonNameKey = "widget.dragonName"
    static let lastPracticeKey = "widget.lastPractice"
    static let wisdomKey = "widget.wisdom"
    static let journeyTypeKey = "widget.journeyType"
    
    // Getters
    static var currentStreak: Int {
        sharedDefaults?.integer(forKey: streakKey) ?? 0
    }
    
    static var dragonLevel: Int {
        sharedDefaults?.integer(forKey: dragonLevelKey) ?? 1
    }
    
    static var dragonStage: String {
        sharedDefaults?.string(forKey: dragonStageKey) ?? "Hatchling"
    }
    
    static var dragonName: String {
        sharedDefaults?.string(forKey: dragonNameKey) ?? "Dragon"
    }
    
    static var lastPractice: Date? {
        sharedDefaults?.object(forKey: lastPracticeKey) as? Date
    }
    
    static var dailyWisdom: String {
        sharedDefaults?.string(forKey: wisdomKey) ?? "Open your eyes. The truth awaits."
    }
    
    static var journeyType: String {
        sharedDefaults?.string(forKey: journeyTypeKey) ?? "Seeker"
    }
}

// MARK: - Widget Update Helper (Call from main app)

class WidgetUpdateHelper {
    static func updateWidgetData(
        streak: Int,
        dragonLevel: Int,
        dragonStage: String,
        dragonName: String,
        lastPractice: Date?,
        journeyType: String
    ) {
        let defaults = WidgetData.sharedDefaults
        defaults?.set(streak, forKey: WidgetData.streakKey)
        defaults?.set(dragonLevel, forKey: WidgetData.dragonLevelKey)
        defaults?.set(dragonStage, forKey: WidgetData.dragonStageKey)
        defaults?.set(dragonName, forKey: WidgetData.dragonNameKey)
        defaults?.set(lastPractice, forKey: WidgetData.lastPracticeKey)
        defaults?.set(journeyType, forKey: WidgetData.journeyTypeKey)
        
        // Update wisdom daily
        let wisdoms = [
            "The truth you seek is not hidden—it is ignored.",
            "Every tradition points to the same summit.",
            "What they call heresy is often the truth they fear.",
            "You were born awake. You were taught to sleep.",
            "The spark of the divine is in your chest.",
            "The kingdom is within.",
            "Patterns repeat across centuries. See them.",
            "Sophia waits within you."
        ]
        let dayOfYear = Calendar.current.ordinality(of: .day, in: .year, for: Date()) ?? 0
        defaults?.set(wisdoms[dayOfYear % wisdoms.count], forKey: WidgetData.wisdomKey)
        
        // Request widget refresh
        WidgetCenter.shared.reloadAllTimelines()
    }
}

// MARK: - Timeline Entry

struct ApertureEntry: TimelineEntry {
    let date: Date
    let streak: Int
    let dragonLevel: Int
    let dragonStage: String
    let dragonName: String
    let wisdom: String
    let journeyType: String
    let hasPracticedToday: Bool
}

// MARK: - Timeline Provider

struct ApertureTimelineProvider: TimelineProvider {
    
    func placeholder(in context: Context) -> ApertureEntry {
        ApertureEntry(
            date: Date(),
            streak: 7,
            dragonLevel: 5,
            dragonStage: "Drake",
            dragonName: "Dragon",
            wisdom: "Open your eyes. The truth awaits.",
            journeyType: "Seeker",
            hasPracticedToday: true
        )
    }
    
    func getSnapshot(in context: Context, completion: @escaping (ApertureEntry) -> Void) {
        let entry = createEntry()
        completion(entry)
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<ApertureEntry>) -> Void) {
        let entry = createEntry()
        
        // Refresh at midnight or in 1 hour
        let nextUpdate = Calendar.current.startOfDay(for: Date().addingTimeInterval(86400))
        let timeline = Timeline(entries: [entry], policy: .after(nextUpdate))
        
        completion(timeline)
    }
    
    private func createEntry() -> ApertureEntry {
        let hasPracticedToday: Bool
        if let lastPractice = WidgetData.lastPractice {
            hasPracticedToday = Calendar.current.isDateInToday(lastPractice)
        } else {
            hasPracticedToday = false
        }
        
        return ApertureEntry(
            date: Date(),
            streak: WidgetData.currentStreak,
            dragonLevel: WidgetData.dragonLevel,
            dragonStage: WidgetData.dragonStage,
            dragonName: WidgetData.dragonName,
            wisdom: WidgetData.dailyWisdom,
            journeyType: WidgetData.journeyType,
            hasPracticedToday: hasPracticedToday
        )
    }
}

// MARK: - Dragon Widget View

struct DragonWidgetView: View {
    var entry: ApertureEntry
    @Environment(\.widgetFamily) var family
    
    var body: some View {
        switch family {
        case .systemSmall:
            smallWidget
        case .systemMedium:
            mediumWidget
        case .systemLarge:
            largeWidget
        default:
            smallWidget
        }
    }
    
    // MARK: - Small Widget
    
    private var smallWidget: some View {
        ZStack {
            // Background
            LinearGradient(
                colors: [Color(hex: "#1a1a2e"), Color(hex: "#0f0f1a")],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            
            VStack(spacing: 8) {
                // Dragon emoji + level
                HStack(spacing: 4) {
                    Text("🐉")
                        .font(.system(size: 30))
                    
                    VStack(alignment: .leading, spacing: 0) {
                        Text("Lv.\(entry.dragonLevel)")
                            .font(.system(size: 12, weight: .bold))
                            .foregroundColor(Color(hex: "#FFD700"))
                        Text(entry.dragonStage)
                            .font(.system(size: 9))
                            .foregroundColor(.white.opacity(0.6))
                    }
                }
                
                // Streak
                HStack(spacing: 4) {
                    Image(systemName: "flame.fill")
                        .font(.system(size: 14))
                        .foregroundColor(.orange)
                    Text("\(entry.streak)")
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(.white)
                    Text("day streak")
                        .font(.system(size: 10))
                        .foregroundColor(.white.opacity(0.6))
                }
                
                // Practice status
                HStack(spacing: 4) {
                    Circle()
                        .fill(entry.hasPracticedToday ? Color.green : Color.orange)
                        .frame(width: 8, height: 8)
                    Text(entry.hasPracticedToday ? "Practiced" : "Practice now")
                        .font(.system(size: 10))
                        .foregroundColor(.white.opacity(0.7))
                }
            }
            .padding()
        }
    }
    
    // MARK: - Medium Widget
    
    private var mediumWidget: some View {
        ZStack {
            // Background
            LinearGradient(
                colors: [Color(hex: "#1a1a2e"), Color(hex: "#0f0f1a")],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            
            HStack(spacing: 16) {
                // Left: Dragon
                VStack(spacing: 8) {
                    Text("🐉")
                        .font(.system(size: 50))
                    
                    VStack(spacing: 2) {
                        Text("Lv.\(entry.dragonLevel)")
                            .font(.system(size: 14, weight: .bold))
                            .foregroundColor(Color(hex: "#FFD700"))
                        Text(entry.dragonStage)
                            .font(.system(size: 11))
                            .foregroundColor(.white.opacity(0.6))
                    }
                }
                .frame(width: 80)
                
                // Right: Stats + Wisdom
                VStack(alignment: .leading, spacing: 8) {
                    // Streak
                    HStack(spacing: 6) {
                        Image(systemName: "flame.fill")
                            .foregroundColor(.orange)
                        Text("\(entry.streak) day streak")
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(.white)
                        
                        Spacer()
                        
                        // Practice status
                        Circle()
                            .fill(entry.hasPracticedToday ? Color.green : Color.orange)
                            .frame(width: 10, height: 10)
                    }
                    
                    // Wisdom
                    Text("🐉 \(entry.wisdom)")
                        .font(.system(size: 12))
                        .foregroundColor(.white.opacity(0.8))
                        .lineLimit(2)
                    
                    // CTA
                    Text(entry.hasPracticedToday ? "Keep awakening →" : "Tap to practice →")
                        .font(.system(size: 11, weight: .medium))
                        .foregroundColor(Color(hex: "#FFD700"))
                }
            }
            .padding()
        }
    }
    
    // MARK: - Large Widget
    
    private var largeWidget: some View {
        ZStack {
            // Background
            LinearGradient(
                colors: [Color(hex: "#1a1a2e"), Color(hex: "#0f0f1a")],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            
            VStack(spacing: 16) {
                // Header
                HStack {
                    Image(systemName: "eye.fill")
                        .foregroundColor(Color(hex: "#FFD700"))
                    Text("APERTURE")
                        .font(.system(size: 14, weight: .black))
                        .tracking(3)
                        .foregroundColor(.white)
                    Spacer()
                }
                
                // Dragon section
                HStack(spacing: 20) {
                    // Dragon
                    VStack(spacing: 4) {
                        Text("🐉")
                            .font(.system(size: 60))
                        Text(entry.dragonName)
                            .font(.system(size: 14, weight: .bold))
                            .foregroundColor(.white)
                        Text("Lv.\(entry.dragonLevel) \(entry.dragonStage)")
                            .font(.system(size: 11))
                            .foregroundColor(Color(hex: "#FFD700"))
                    }
                    
                    // Stats
                    VStack(alignment: .leading, spacing: 12) {
                        statRow(icon: "flame.fill", color: .orange, label: "Streak", value: "\(entry.streak) days")
                        statRow(icon: "sun.max.fill", color: .yellow, label: "Path", value: entry.journeyType)
                        statRow(
                            icon: entry.hasPracticedToday ? "checkmark.circle.fill" : "circle",
                            color: entry.hasPracticedToday ? .green : .orange,
                            label: "Today",
                            value: entry.hasPracticedToday ? "Complete" : "Not yet"
                        )
                    }
                }
                
                Divider()
                    .background(Color.white.opacity(0.2))
                
                // Dragon wisdom
                VStack(alignment: .leading, spacing: 6) {
                    Text("🐉 DRAGON WISDOM")
                        .font(.system(size: 10, weight: .bold))
                        .foregroundColor(Color(hex: "#FFD700"))
                        .tracking(1)
                    
                    Text(entry.wisdom)
                        .font(.system(size: 14))
                        .foregroundColor(.white.opacity(0.9))
                        .lineLimit(3)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
                // CTA
                HStack {
                    Spacer()
                    Text("Open Aperture →")
                        .font(.system(size: 12, weight: .medium))
                        .foregroundColor(Color(hex: "#FFD700"))
                }
            }
            .padding()
        }
    }
    
    private func statRow(icon: String, color: Color, label: String, value: String) -> some View {
        HStack(spacing: 8) {
            Image(systemName: icon)
                .font(.system(size: 14))
                .foregroundColor(color)
                .frame(width: 20)
            
            VStack(alignment: .leading, spacing: 0) {
                Text(label)
                    .font(.system(size: 10))
                    .foregroundColor(.white.opacity(0.5))
                Text(value)
                    .font(.system(size: 13, weight: .semibold))
                    .foregroundColor(.white)
            }
        }
    }
}

// MARK: - Widget Configuration

struct DragonWidget: Widget {
    let kind: String = "DragonWidget"
    
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: ApertureTimelineProvider()) { entry in
            DragonWidgetView(entry: entry)
        }
        .configurationDisplayName("Dragon Companion")
        .description("Track your awakening journey with your Dragon.")
        .supportedFamilies([.systemSmall, .systemMedium, .systemLarge])
    }
}

// MARK: - Quick Practice Widget

struct QuickPracticeWidgetView: View {
    var entry: ApertureEntry
    
    var body: some View {
        ZStack {
            LinearGradient(
                colors: [Color(hex: "#2d1b4e"), Color(hex: "#1a1a2e")],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            
            VStack(spacing: 8) {
                Image(systemName: "figure.mind.and.body")
                    .font(.system(size: 28))
                    .foregroundColor(.purple)
                
                Text("PRACTICE")
                    .font(.system(size: 12, weight: .bold))
                    .tracking(2)
                    .foregroundColor(.white)
                
                if entry.hasPracticedToday {
                    HStack(spacing: 4) {
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundColor(.green)
                        Text("Done")
                            .font(.system(size: 11))
                            .foregroundColor(.green)
                    }
                } else {
                    Text("Tap to start")
                        .font(.system(size: 11))
                        .foregroundColor(.white.opacity(0.6))
                }
            }
            .padding()
        }
    }
}

struct QuickPracticeWidget: Widget {
    let kind: String = "QuickPracticeWidget"
    
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: ApertureTimelineProvider()) { entry in
            QuickPracticeWidgetView(entry: entry)
        }
        .configurationDisplayName("Quick Practice")
        .description("One tap to start your practice.")
        .supportedFamilies([.systemSmall])
    }
}

// MARK: - Widget Bundle
