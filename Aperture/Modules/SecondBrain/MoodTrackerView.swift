// MoodTrackerView.swift
// MOOD TRACKER — "Name It to Tame It. Track It to Transform It."
// ☀️ SunFlow: Reignited × Second Brain
//
// "Labeling an emotion reduces amygdala activity by ~50%.
//  Tracking emotions over time reveals PATTERNS.
//  Patterns reveal TRIGGERS.
//  Triggers reveal PROGRAMMING.
//  And that's when awakening begins."
//
// UserDefaults persistence. Local charts.
// Zero backend. Zero API. All on-device.

import SwiftUI

// MARK: - ═══════════════════════════════════════════════════
// MOOD TRACKER VIEW
// ═══════════════════════════════════════════════════════════

struct MoodTrackerView: View {
    
    @Environment(\.dismiss) var dismiss
    @StateObject private var store = MoodStore()
    @State private var selectedTab: MoodTab = .logMood
    @State private var showingLog = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(red: 0.02, green: 0.03, blue: 0.06).ignoresSafeArea()
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 16) {
                        headerView
                        tabSelector
                        
                        switch selectedTab {
                        case .logMood: logMoodSection
                        case .history: historySection
                        case .insights: insightsSection
                        }
                        
                        Spacer(minLength: 60)
                    }
                    .padding(20)
                }
            }
            .navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button { dismiss() } label: {
                        Image(systemName: "chevron.left").font(.system(size: 16, weight: .semibold)).foregroundColor(.white)
                    }
                }
                ToolbarItem(placement: .principal) {
                    HStack(spacing: 6) {
                        Image(systemName: "heart.text.square.fill").font(.system(size: 14)).foregroundColor(.pink)
                        Text("Mood Tracker").font(.system(size: 17, weight: .bold)).foregroundColor(.white)
                    }
                }
            }
        }
    }
    
    // MARK: - Header
    
    private var headerView: some View {
        VStack(spacing: 6) {
            Text(store.todayEntry != nil ? "✅" : "💚").font(.system(size: 36))
            Text("MOOD TRACKER").font(.system(size: 18, weight: .black)).tracking(1).foregroundColor(.white)
            
            if let streak = store.currentStreak, streak > 1 {
                Text("🔥 \(streak)-day streak").font(.system(size: 11, weight: .bold)).foregroundColor(.orange)
            }
            
            Text("Name it to tame it. Track it to transform it.")
                .font(.system(size: 10, weight: .medium)).foregroundColor(.white.opacity(0.25))
        }
    }
    
    // MARK: - Tab Selector
    
    private var tabSelector: some View {
        HStack(spacing: 0) {
            ForEach(MoodTab.allCases, id: \.self) { tab in
                Button {
                    withAnimation(.easeInOut(duration: 0.15)) { selectedTab = tab }
                } label: {
                    VStack(spacing: 3) {
                        Text(tab.emoji).font(.system(size: 14))
                        Text(tab.label).font(.system(size: 9, weight: .bold)).tracking(0.5)
                            .foregroundColor(selectedTab == tab ? .white : .white.opacity(0.3))
                    }
                    .frame(maxWidth: .infinity).padding(.vertical, 8)
                    .background(selectedTab == tab ? Color.pink.opacity(0.1) : Color.clear)
                }
            }
        }
        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.02)))
    }
    
    // MARK: - ═══════════════════════════════════
    // LOG MOOD TAB
    // ═══════════════════════════════════════════
    
    @State private var logLevel: Int = 5
    @State private var logEmotions: Set<String> = []
    @State private var logNote: String = ""
    @State private var logContext: String = ""
    @State private var showSaved = false
    
    private var logMoodSection: some View {
        VStack(spacing: 16) {
            // Already logged today?
            if let today = store.todayEntry {
                VStack(spacing: 8) {
                    Text("You already checked in today").font(.system(size: 12, weight: .bold)).foregroundColor(.green)
                    HStack(spacing: 4) {
                        Text(moodEmoji(today.level)).font(.system(size: 24))
                        Text(moodLabel(today.level)).font(.system(size: 14, weight: .bold)).foregroundColor(.white)
                    }
                    Text(today.emotions.joined(separator: " • ")).font(.system(size: 10)).foregroundColor(.white.opacity(0.3))
                    Button("Log another check-in") {
                        showSaved = false
                    }
                    .font(.system(size: 10, weight: .medium)).foregroundColor(.pink.opacity(0.5))
                }
                .padding(16).background(RoundedRectangle(cornerRadius: 12).fill(Color.green.opacity(0.03)))
            }
            
            // Mood level
            VStack(spacing: 10) {
                Text(moodEmoji(logLevel)).font(.system(size: 48))
                Text(moodLabel(logLevel)).font(.system(size: 16, weight: .bold)).foregroundColor(.white)
                
                Slider(value: Binding(
                    get: { Double(logLevel) },
                    set: { logLevel = Int($0) }
                ), in: 1...10, step: 1)
                .tint(moodColor(logLevel))
                
                HStack {
                    Text("Struggling").font(.system(size: 9, weight: .medium)).foregroundColor(.red.opacity(0.4))
                    Spacer()
                    Text("Thriving").font(.system(size: 9, weight: .medium)).foregroundColor(.green.opacity(0.4))
                }
            }
            .padding(16).background(RoundedRectangle(cornerRadius: 12).fill(Color.white.opacity(0.02)))
            
            // Emotion tags
            VStack(alignment: .leading, spacing: 8) {
                Text("WHAT'S PRESENT?").font(.system(size: 9, weight: .black)).tracking(1).foregroundColor(.white.opacity(0.2))
                
                let emotions = [
                    "Anxious", "Overwhelmed", "Scattered", "Restless", "Frustrated",
                    "Sad", "Lonely", "Numb", "Tired", "Angry",
                    "Calm", "Focused", "Creative", "Grateful", "Hopeful",
                    "Energized", "Peaceful", "Curious", "Loving", "Free"
                ]
                
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 70))], spacing: 6) {
                    ForEach(emotions, id: \.self) { emotion in
                        Button {
                            if logEmotions.contains(emotion) { logEmotions.remove(emotion) }
                            else { logEmotions.insert(emotion) }
                        } label: {
                            Text(emotion).font(.system(size: 10, weight: .bold))
                                .foregroundColor(logEmotions.contains(emotion) ? .black : .white.opacity(0.35))
                                .padding(.horizontal, 8).padding(.vertical, 5)
                                .background(Capsule().fill(logEmotions.contains(emotion) ? emotionColor(emotion).opacity(0.7) : Color.white.opacity(0.03)))
                        }
                    }
                }
            }
            
            // Context (what triggered this mood)
            VStack(alignment: .leading, spacing: 4) {
                Text("WHAT TRIGGERED THIS? (optional)").font(.system(size: 9, weight: .black)).tracking(1).foregroundColor(.white.opacity(0.2))
                
                let contexts = ["Work", "Relationship", "Family", "Health", "Money", "Social Media", "News", "Sleep", "Nothing specific"]
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))], spacing: 6) {
                    ForEach(contexts, id: \.self) { ctx in
                        Button {
                            logContext = logContext == ctx ? "" : ctx
                        } label: {
                            Text(ctx).font(.system(size: 9, weight: .bold))
                                .foregroundColor(logContext == ctx ? .black : .white.opacity(0.3))
                                .padding(.horizontal, 8).padding(.vertical, 5)
                                .background(Capsule().fill(logContext == ctx ? Color.pink.opacity(0.6) : Color.white.opacity(0.03)))
                        }
                    }
                }
            }
            
            // Note
            VStack(alignment: .leading, spacing: 4) {
                Text("ANYTHING ELSE? (optional)").font(.system(size: 9, weight: .black)).tracking(1).foregroundColor(.white.opacity(0.2))
                TextField("How you're really feeling...", text: $logNote)
                    .font(.system(size: 12, weight: .medium)).foregroundColor(.white)
                    .padding(10).background(RoundedRectangle(cornerRadius: 8).fill(Color.white.opacity(0.03)))
            }
            
            // Save
            Button {
                let entry = MoodEntry(
                    id: UUID().uuidString,
                    level: logLevel,
                    emotions: Array(logEmotions),
                    context: logContext.isEmpty ? nil : logContext,
                    note: logNote.isEmpty ? nil : logNote,
                    timestamp: Date()
                )
                store.add(entry)
                showSaved = true
                logEmotions = []; logNote = ""; logContext = ""
            } label: {
                Text("LOG MOOD").font(.system(size: 13, weight: .black)).tracking(1)
                    .foregroundColor(.black).frame(maxWidth: .infinity).padding(14)
                    .background(RoundedRectangle(cornerRadius: 12).fill(Color.pink))
            }
            
            if showSaved {
                HStack(spacing: 4) {
                    Image(systemName: "checkmark.circle.fill").foregroundColor(.green)
                    Text("Saved on device").foregroundColor(.green.opacity(0.6))
                }.font(.system(size: 11, weight: .medium))
            }
            
            // Suggestion based on mood
            moodSuggestionBanner(logLevel)
        }
    }
    
    // MARK: - ═══════════════════════════════════
    // HISTORY TAB
    // ═══════════════════════════════════════════
    
    private var historySection: some View {
        VStack(spacing: 12) {
            // Mini trend chart (last 14 days)
            if store.entries.count >= 2 {
                trendChart
            }
            
            // Entry list
            if store.entries.isEmpty {
                VStack(spacing: 8) {
                    Text("No entries yet").font(.system(size: 13, weight: .medium)).foregroundColor(.white.opacity(0.2))
                    Text("Log your first mood to start tracking").font(.system(size: 10)).foregroundColor(.white.opacity(0.12))
                }.padding(40)
            } else {
                ForEach(store.entries.prefix(30)) { entry in
                    historyCard(entry)
                }
            }
        }
    }
    
    private var trendChart: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("MOOD TREND (14 days)").font(.system(size: 9, weight: .black)).tracking(1).foregroundColor(.white.opacity(0.2))
            
            let recent = store.last14DaysAverage
            
            GeometryReader { geo in
                let width = geo.size.width
                let height: CGFloat = 100
                let stepX = width / max(CGFloat(recent.count - 1), 1)
                
                ZStack(alignment: .leading) {
                    // Grid lines
                    ForEach([2.5, 5.0, 7.5], id: \.self) { level in
                        let y = height - (CGFloat(level) / 10.0) * height
                        Path { path in
                            path.move(to: CGPoint(x: 0, y: y))
                            path.addLine(to: CGPoint(x: width, y: y))
                        }.stroke(Color.white.opacity(0.03), lineWidth: 1)
                    }
                    
                    // Line
                    if recent.count >= 2 {
                        Path { path in
                            for (i, value) in recent.enumerated() {
                                let x = CGFloat(i) * stepX
                                let y = height - (CGFloat(value) / 10.0) * height
                                if i == 0 { path.move(to: CGPoint(x: x, y: y)) }
                                else { path.addLine(to: CGPoint(x: x, y: y)) }
                            }
                        }.stroke(Color.pink, lineWidth: 2)
                        
                        // Dots
                        ForEach(Array(recent.enumerated()), id: \.offset) { i, value in
                            let x = CGFloat(i) * stepX
                            let y = height - (CGFloat(value) / 10.0) * height
                            Circle().fill(moodColor(Int(value))).frame(width: 6, height: 6)
                                .position(x: x, y: y)
                        }
                    }
                }
            }
            .frame(height: 100)
        }
        .padding(14).background(RoundedRectangle(cornerRadius: 12).fill(Color.white.opacity(0.02)))
    }
    
    private func historyCard(_ entry: MoodEntry) -> some View {
        HStack(spacing: 10) {
            Text(moodEmoji(entry.level)).font(.system(size: 20))
            
            VStack(alignment: .leading, spacing: 2) {
                HStack(spacing: 4) {
                    Text(moodLabel(entry.level)).font(.system(size: 12, weight: .bold)).foregroundColor(.white)
                    Text("(\(entry.level)/10)").font(.system(size: 10, weight: .medium)).foregroundColor(.white.opacity(0.2))
                }
                
                if !entry.emotions.isEmpty {
                    Text(entry.emotions.joined(separator: " • "))
                        .font(.system(size: 9, weight: .medium)).foregroundColor(.white.opacity(0.3)).lineLimit(1)
                }
                
                if let ctx = entry.context {
                    Text("Trigger: \(ctx)").font(.system(size: 9, weight: .medium)).foregroundColor(.pink.opacity(0.4))
                }
            }
            
            Spacer()
            
            VStack(alignment: .trailing, spacing: 2) {
                Text(entry.dayString).font(.system(size: 10, weight: .bold)).foregroundColor(.white.opacity(0.2))
                Text(entry.timeString).font(.system(size: 9, weight: .medium)).foregroundColor(.white.opacity(0.1))
            }
        }
        .padding(10).background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.015)))
    }
    
    // MARK: - ═══════════════════════════════════
    // INSIGHTS TAB — Pattern Detection
    // ═══════════════════════════════════════════
    
    private var insightsSection: some View {
        VStack(spacing: 12) {
            if store.entries.count < 3 {
                VStack(spacing: 8) {
                    Text("Need more data").font(.system(size: 13, weight: .medium)).foregroundColor(.white.opacity(0.2))
                    Text("Log at least 3 moods to unlock insights").font(.system(size: 10)).foregroundColor(.white.opacity(0.12))
                }.padding(40)
            } else {
                // Average mood
                insightRow("📊", "Average Mood", String(format: "%.1f", store.averageMood) + "/10", moodColor(Int(store.averageMood)))
                
                // Most common emotion
                if let topEmotion = store.topEmotion {
                    insightRow("💚", "Most Frequent Feeling", topEmotion, .green)
                }
                
                // Most common trigger
                if let topTrigger = store.topTrigger {
                    insightRow("🎯", "Top Trigger", topTrigger, .pink)
                }
                
                // Streak
                if let streak = store.currentStreak {
                    insightRow("🔥", "Current Streak", "\(streak) days", .orange)
                }
                
                // Best day pattern
                if let bestDay = store.bestDayOfWeek {
                    insightRow("🌟", "Your Best Day", bestDay, Color(red: 1.0, green: 0.85, blue: 0.3))
                }
                
                // Worst day pattern
                if let worstDay = store.worstDayOfWeek {
                    insightRow("⚡", "Hardest Day", worstDay, .red)
                }
                
                // Emotion frequency
                emotionFrequencyView
                
                // Awakening readiness
                awakenessIndicator
                
                // Pattern insight
                VStack(alignment: .leading, spacing: 6) {
                    HStack(spacing: 4) {
                        Text("☀️").font(.system(size: 10))
                        Text("SUNFLOW INSIGHT").font(.system(size: 10, weight: .black)).tracking(1).foregroundColor(Color(red: 1.0, green: 0.85, blue: 0.3))
                    }
                    Text("Tracking your mood reveals something powerful: most of your suffering has PATTERNS. Patterns mean triggers. Triggers mean programming. And programming can be recognized, understood, and released.\n\nEvery mood log is a data point. Enough data points reveal the code. And once you see the code, you can rewrite it.\n\nThis is what awakening looks like in practice — not one big moment, but daily awareness that accumulates until the patterns become visible.")
                        .font(.system(size: 11, weight: .medium)).foregroundColor(Color(red: 1.0, green: 0.85, blue: 0.3).opacity(0.5)).lineSpacing(3)
                }
                .padding(12).background(RoundedRectangle(cornerRadius: 12).fill(Color(red: 1.0, green: 0.85, blue: 0.3).opacity(0.02))
                    .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color(red: 1.0, green: 0.85, blue: 0.3).opacity(0.06), lineWidth: 1)))
            }
        }
    }
    
    private func insightRow(_ emoji: String, _ label: String, _ value: String, _ color: Color) -> some View {
        HStack(spacing: 10) {
            Text(emoji).font(.system(size: 16))
            Text(label).font(.system(size: 12, weight: .medium)).foregroundColor(.white.opacity(0.5))
            Spacer()
            Text(value).font(.system(size: 14, weight: .bold)).foregroundColor(color)
        }
        .padding(12).background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.02)))
    }
    
    private var emotionFrequencyView: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("EMOTION FREQUENCY").font(.system(size: 9, weight: .black)).tracking(1).foregroundColor(.white.opacity(0.2))
            
            let freq = store.emotionFrequency.prefix(8)
            ForEach(Array(freq.enumerated()), id: \.offset) { _, pair in
                HStack(spacing: 8) {
                    Text(pair.key).font(.system(size: 10, weight: .bold)).foregroundColor(.white.opacity(0.6)).frame(width: 80, alignment: .leading)
                    GeometryReader { geo in
                        let maxCount = Double(store.emotionFrequency.first?.value ?? 1)
                        let width = geo.size.width * CGFloat(Double(pair.value) / maxCount)
                        RoundedRectangle(cornerRadius: 3).fill(emotionColor(pair.key).opacity(0.5)).frame(width: max(width, 4), height: 12)
                    }.frame(height: 12)
                    Text("\(pair.value)").font(.system(size: 10, weight: .bold)).foregroundColor(.white.opacity(0.2))
                }
            }
        }
        .padding(12).background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.02)))
    }
    
    private var awakenessIndicator: some View {
        let avg = store.averageMood
        let readiness: String
        let indicatorColor: Color
        let message: String
        
        if avg >= 7 {
            readiness = "HIGH"
            indicatorColor = Color(red: 1.0, green: 0.85, blue: 0.3)
            message = "Your nervous system is consistently calm enough to receive deeper content. Awakening modules are available when you're curious."
        } else if avg >= 5 {
            readiness = "BUILDING"
            indicatorColor = .green
            message = "You're stabilizing. Keep using the daily tools. As your baseline rises, curiosity will naturally emerge."
        } else {
            readiness = "FOCUS ON FOUNDATION"
            indicatorColor = .pink
            message = "Right now, focus on calming tools (breathing, grounding, sensory). Your nervous system needs safety first. That's not failure — that's the correct order."
        }
        
        return VStack(alignment: .leading, spacing: 6) {
            Text("AWAKENING READINESS").font(.system(size: 9, weight: .black)).tracking(1).foregroundColor(.white.opacity(0.2))
            
            HStack(spacing: 8) {
                Text(readiness).font(.system(size: 12, weight: .black)).foregroundColor(indicatorColor)
                Spacer()
                Text(String(format: "%.1f", avg) + " avg").font(.system(size: 10, weight: .bold)).foregroundColor(.white.opacity(0.2))
            }
            
            Text(message).font(.system(size: 10, weight: .medium)).foregroundColor(indicatorColor.opacity(0.5))
        }
        .padding(12).background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.02)))
    }
    
    // MARK: - Mood Suggestion Banner
    
    private func moodSuggestionBanner(_ level: Int) -> some View {
        Group {
            if level <= 3 {
                suggestionBanner("🕊️", "Your nervous system needs support right now.", "Try the Breathing or Grounding tools in Mind Sanctuary. Even 60 seconds helps.", .red)
            } else if level <= 5 {
                suggestionBanner("🌱", "You're managing. A small boost could help.", "Check the Dopamine Menu or try the Sensory Toolkit for a quick reset.", .yellow)
            } else if level <= 7 {
                suggestionBanner("🌤️", "Good space. Curiosity lives here.", "You might have bandwidth to explore an Awakening module. Follow what interests you.", .green)
            } else {
                suggestionBanner("☀️", "You're in sovereignty.", "Pattern recognition is sharpest right now. If something calls to you — trust it.", Color(red: 1.0, green: 0.85, blue: 0.3))
            }
        }
    }
    
    private func suggestionBanner(_ emoji: String, _ title: String, _ message: String, _ color: Color) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack(spacing: 4) { Text(emoji).font(.system(size: 10)); Text(title).font(.system(size: 11, weight: .bold)).foregroundColor(color) }
            Text(message).font(.system(size: 10, weight: .medium)).foregroundColor(.white.opacity(0.35))
        }
        .padding(12).background(RoundedRectangle(cornerRadius: 10).fill(color.opacity(0.03)))
    }
    
    // MARK: - Helpers
    
    private func moodEmoji(_ level: Int) -> String {
        switch level { case 1...2: return "😰"; case 3...4: return "😔"; case 5...6: return "😐"
        case 7...8: return "🙂"; case 9...10: return "😊"; default: return "😐" }
    }
    
    private func moodLabel(_ level: Int) -> String {
        switch level { case 1...2: return "Really struggling"; case 3...4: return "Having a hard time"
        case 5...6: return "Getting by"; case 7...8: return "Doing good"; case 9...10: return "Thriving"; default: return "Checking in" }
    }
    
    private func moodColor(_ level: Int) -> Color {
        switch level { case 1...3: return .red; case 4...5: return .yellow; case 6...7: return .green
        case 8...10: return Color(red: 1.0, green: 0.85, blue: 0.3); default: return .white }
    }
    
    private func emotionColor(_ emotion: String) -> Color {
        let negatives = ["Anxious", "Overwhelmed", "Scattered", "Frustrated", "Sad", "Lonely", "Numb", "Tired", "Angry", "Restless"]
        return negatives.contains(emotion) ? .red : .green
    }
}

// MARK: - ═══════════════════════════════════════════════════
// MOOD STORE — UserDefaults Persistence + Analytics
// ═══════════════════════════════════════════════════════════

class MoodStore: ObservableObject {
    
    @Published var entries: [MoodEntry] = []
    private let storageKey = "aperture_mood_entries"
    
    init() { load() }
    
    func add(_ entry: MoodEntry) {
        entries.insert(entry, at: 0)
        save()
    }
    
    var todayEntry: MoodEntry? {
        entries.first { Calendar.current.isDateInToday($0.timestamp) }
    }
    
    var averageMood: Double {
        guard !entries.isEmpty else { return 5.0 }
        return Double(entries.map(\.level).reduce(0, +)) / Double(entries.count)
    }
    
    var currentStreak: Int? {
        var streak = 0
        var date = Date()
        let cal = Calendar.current
        for _ in 0..<365 {
            if entries.contains(where: { cal.isDate($0.timestamp, inSameDayAs: date) }) {
                streak += 1
                date = cal.date(byAdding: .day, value: -1, to: date)!
            } else { break }
        }
        return streak > 0 ? streak : nil
    }
    
    var topEmotion: String? {
        let all = entries.flatMap(\.emotions)
        let counted = Dictionary(all.map { ($0, 1) }, uniquingKeysWith: +)
        return counted.max(by: { $0.value < $1.value })?.key
    }
    
    var topTrigger: String? {
        let all = entries.compactMap(\.context)
        let counted = Dictionary(all.map { ($0, 1) }, uniquingKeysWith: +)
        return counted.max(by: { $0.value < $1.value })?.key
    }
    
    var emotionFrequency: [(key: String, value: Int)] {
        let all = entries.flatMap(\.emotions)
        let counted = Dictionary(all.map { ($0, 1) }, uniquingKeysWith: +)
        return counted.sorted { $0.value > $1.value }
    }
    
    var last14DaysAverage: [Double] {
        let cal = Calendar.current
        var result: [Double] = []
        for dayOffset in (0..<14).reversed() {
            guard let date = cal.date(byAdding: .day, value: -dayOffset, to: Date()) else { continue }
            let dayEntries = entries.filter { cal.isDate($0.timestamp, inSameDayAs: date) }
            if dayEntries.isEmpty { continue }
            let avg = Double(dayEntries.map(\.level).reduce(0, +)) / Double(dayEntries.count)
            result.append(avg)
        }
        return result
    }
    
    var bestDayOfWeek: String? { dayAnalysis(best: true) }
    var worstDayOfWeek: String? { dayAnalysis(best: false) }
    
    private func dayAnalysis(best: Bool) -> String? {
        let cal = Calendar.current
        var dayTotals: [Int: [Int]] = [:]
        for entry in entries {
            let weekday = cal.component(.weekday, from: entry.timestamp)
            dayTotals[weekday, default: []].append(entry.level)
        }
        let averages = dayTotals.mapValues { Double($0.reduce(0, +)) / Double($0.count) }
        guard let result = best ? averages.max(by: { $0.value < $1.value }) : averages.min(by: { $0.value < $1.value }) else { return nil }
        let days = ["", "Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
        return days[result.key]
    }
    
    private func save() {
        if let data = try? JSONEncoder().encode(entries) { UserDefaults.standard.set(data, forKey: storageKey) }
    }
    private func load() {
        if let data = UserDefaults.standard.data(forKey: storageKey),
           let saved = try? JSONDecoder().decode([MoodEntry].self, from: data) { entries = saved }
    }
}

// MARK: - Data Models

struct MoodEntry: Identifiable, Codable {
    let id: String
    let level: Int
    let emotions: [String]
    let context: String?
    let note: String?
    let timestamp: Date
    
    var dayString: String {
        let f = DateFormatter(); f.dateFormat = "MMM d"
        return f.string(from: timestamp)
    }
    var timeString: String {
        let f = DateFormatter(); f.dateFormat = "h:mm a"
        return f.string(from: timestamp)
    }
}

enum MoodTab: String, CaseIterable {
    case logMood, history, insights
    var emoji: String { switch self { case .logMood: return "💚"; case .history: return "📈"; case .insights: return "🔮" } }
    var label: String { switch self { case .logMood: return "LOG"; case .history: return "HISTORY"; case .insights: return "INSIGHTS" } }
}
