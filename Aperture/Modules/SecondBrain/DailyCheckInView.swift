// DailyCheckInView.swift
// DAILY CHECK-IN RITUAL — AM Intention + PM Reflection
// ☀️ SunFlow: Reignited — Second Brain Module
//
// "Metacognition — thinking about your thinking —
//  is the #1 skill ADHD brains need to develop.
//  This ritual builds it in 2 minutes a day.
//  Morning: set your compass. Evening: learn from the day."

import SwiftUI

struct DailyCheckInView: View {
    
    @Environment(\.dismiss) var dismiss
    @State private var checkInType: CheckInType = .morning
    @State private var entries: [CheckInEntry] = []
    @State private var showHistory: Bool = false
    
    // Morning fields
    @State private var morningEnergy: Int = 3
    @State private var morningMood: Int = 5
    @State private var oneThingToday: String = ""
    @State private var morningIntention: String = ""
    @State private var sleepQuality: Int = 3
    
    // Evening fields
    @State private var eveningEnergy: Int = 3
    @State private var eveningMood: Int = 5
    @State private var whatWentWell: String = ""
    @State private var whatWasHard: String = ""
    @State private var tomorrowAdjustment: String = ""
    @State private var gratitude: String = ""
    
    @State private var saved: Bool = false
    
    private let accent = Color(red: 1.0, green: 0.85, blue: 0.3)
    private let morningColor = Color(red: 1.0, green: 0.7, blue: 0.3)
    private let eveningColor = Color(red: 0.5, green: 0.4, blue: 0.9)
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(red: 0.02, green: 0.02, blue: 0.05).ignoresSafeArea()
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 16) {
                        if showHistory {
                            historyView
                        } else if saved {
                            savedView
                        } else {
                            headerView
                            typeToggle
                            if checkInType == .morning { morningView } else { eveningView }
                        }
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
                    Text("📋 Daily Check-In").font(.system(size: 17, weight: .bold)).foregroundColor(.white)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button { withAnimation { showHistory.toggle() } } label: {
                        Image(systemName: "calendar").font(.system(size: 14)).foregroundColor(.white.opacity(0.3))
                    }
                }
            }
            .onAppear { loadEntries(); autoDetectTime() }
        }
    }
    
    // MARK: - Header
    
    private var headerView: some View {
        VStack(spacing: 6) {
            Text(checkInType == .morning ? "🌅" : "🌙").font(.system(size: 40))
                .shadow(color: (checkInType == .morning ? morningColor : eveningColor).opacity(0.4), radius: 15)
            Text(checkInType == .morning ? "MORNING CHECK-IN" : "EVENING REFLECTION")
                .font(.system(size: 18, weight: .black)).foregroundColor(.white)
            Text(checkInType == .morning ? "Set your compass for today" : "Learn from today, prepare for tomorrow")
                .font(.system(size: 11, weight: .medium)).foregroundColor(.white.opacity(0.35))
            
            // Streak
            let streak = consecutiveDays()
            if streak > 0 {
                HStack(spacing: 4) {
                    Text("🔥").font(.system(size: 10))
                    Text("\(streak) day streak").font(.system(size: 10, weight: .bold)).foregroundColor(accent)
                }
            }
        }
    }
    
    // MARK: - Type Toggle
    
    private var typeToggle: some View {
        HStack(spacing: 6) {
            ForEach([CheckInType.morning, .evening], id: \.self) { type in
                Button { withAnimation { checkInType = type } } label: {
                    HStack(spacing: 4) {
                        Text(type == .morning ? "🌅" : "🌙").font(.system(size: 12))
                        Text(type == .morning ? "Morning" : "Evening").font(.system(size: 12, weight: .bold))
                            .foregroundColor(checkInType == type ? .black : .white.opacity(0.3))
                    }
                    .frame(maxWidth: .infinity).padding(.vertical, 10)
                    .background(RoundedRectangle(cornerRadius: 8)
                        .fill(checkInType == type ? (type == .morning ? morningColor : eveningColor) : Color.white.opacity(0.02)))
                }
            }
        }
    }
    
    // MARK: - Morning Check-In
    
    private var morningView: some View {
        VStack(spacing: 14) {
            // Sleep quality
            sectionHeader("How did you sleep?")
            HStack(spacing: 8) {
                ForEach(1...5, id: \.self) { level in
                    Button { sleepQuality = level } label: {
                        Text(sleepEmoji(level)).font(.system(size: 22))
                            .frame(width: 44, height: 44)
                            .background(Circle().fill(sleepQuality == level ? morningColor.opacity(0.2) : Color.white.opacity(0.02)))
                    }
                }
            }
            
            // Energy level
            sectionHeader("Energy right now?")
            energyPicker(binding: $morningEnergy, color: morningColor)
            
            // Mood
            sectionHeader("Mood? (1-10)")
            moodSlider(binding: $morningMood, color: morningColor)
            
            // ONE thing
            sectionHeader("Your ONE thing today")
            Text("If you could only accomplish ONE thing, what would it be?")
                .font(.system(size: 9, weight: .medium)).foregroundColor(.white.opacity(0.2))
            TextField("The ONE thing that matters most today", text: $oneThingToday)
                .font(.system(size: 13, weight: .medium)).foregroundColor(.white)
                .padding(12).background(RoundedRectangle(cornerRadius: 8).fill(Color.white.opacity(0.03)))
                .overlay(RoundedRectangle(cornerRadius: 8).stroke(morningColor.opacity(0.15), lineWidth: 1))
            
            // Intention
            sectionHeader("Intention / Mindset")
            TextField("How do you want to FEEL today?", text: $morningIntention)
                .font(.system(size: 13, weight: .medium)).foregroundColor(.white)
                .padding(12).background(RoundedRectangle(cornerRadius: 8).fill(Color.white.opacity(0.03)))
            
            // Save
            Button { saveMorning() } label: {
                Text("☀️ SET MY COMPASS").font(.system(size: 14, weight: .black)).tracking(1)
                    .foregroundColor(.black).padding(.vertical, 14).frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 12).fill(morningColor))
            }
            
            neuroscience("Morning check-ins activate the prefrontal cortex BEFORE the day overwhelms it. Setting ONE focus item reduces decision fatigue. Naming your intended emotional state primes the reticular activating system to notice opportunities aligned with that state.")
        }
    }
    
    // MARK: - Evening Reflection
    
    private var eveningView: some View {
        VStack(spacing: 14) {
            // Energy
            sectionHeader("Energy level now?")
            energyPicker(binding: $eveningEnergy, color: eveningColor)
            
            // Mood
            sectionHeader("Mood? (1-10)")
            moodSlider(binding: $eveningMood, color: eveningColor)
            
            // What went well
            sectionHeader("What went WELL today?")
            TextField("Even something small counts", text: $whatWentWell)
                .font(.system(size: 13, weight: .medium)).foregroundColor(.white)
                .padding(12).background(RoundedRectangle(cornerRadius: 8).fill(Color.white.opacity(0.03)))
                .overlay(RoundedRectangle(cornerRadius: 8).stroke(eveningColor.opacity(0.15), lineWidth: 1))
            
            // What was hard
            sectionHeader("What was HARD?")
            TextField("No judgment — just observation", text: $whatWasHard)
                .font(.system(size: 13, weight: .medium)).foregroundColor(.white)
                .padding(12).background(RoundedRectangle(cornerRadius: 8).fill(Color.white.opacity(0.03)))
            
            // Tomorrow adjustment
            sectionHeader("What would you do differently?")
            TextField("One small adjustment for tomorrow", text: $tomorrowAdjustment)
                .font(.system(size: 13, weight: .medium)).foregroundColor(.white)
                .padding(12).background(RoundedRectangle(cornerRadius: 8).fill(Color.white.opacity(0.03)))
            
            // Gratitude
            sectionHeader("One thing you're grateful for")
            TextField("Anything. Big or small.", text: $gratitude)
                .font(.system(size: 13, weight: .medium)).foregroundColor(.white)
                .padding(12).background(RoundedRectangle(cornerRadius: 8).fill(Color.white.opacity(0.03)))
            
            // Save
            Button { saveEvening() } label: {
                Text("🌙 CLOSE THE DAY").font(.system(size: 14, weight: .black)).tracking(1)
                    .foregroundColor(.white).padding(.vertical, 14).frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 12).fill(eveningColor))
            }
            
            neuroscience("Evening reflection consolidates learning in the hippocampus. Naming what went well builds the 'success library' that counters ADHD shame spirals. The gratitude item activates the ventral tegmental area, releasing dopamine — literally rewiring your brain toward positivity over time.")
        }
    }
    
    // MARK: - Saved Confirmation
    
    private var savedView: some View {
        VStack(spacing: 16) {
            Text(checkInType == .morning ? "🌅" : "🌙").font(.system(size: 50))
            Text("Check-In Saved!").font(.system(size: 20, weight: .black)).foregroundColor(.white)
            
            if checkInType == .morning && !oneThingToday.isEmpty {
                VStack(spacing: 4) {
                    Text("YOUR ONE THING:").font(.system(size: 9, weight: .black)).tracking(1).foregroundColor(accent.opacity(0.4))
                    Text(oneThingToday).font(.system(size: 16, weight: .bold)).foregroundColor(morningColor)
                }
                .padding(14).background(RoundedRectangle(cornerRadius: 10).fill(morningColor.opacity(0.05)))
            }
            
            Text("+20 XP").font(.system(size: 14, weight: .black)).foregroundColor(accent)
            
            let streak = consecutiveDays()
            if streak > 1 {
                Text("🔥 \(streak) day streak!").font(.system(size: 12, weight: .bold)).foregroundColor(accent)
            }
            
            Button { dismiss() } label: {
                Text("Done").font(.system(size: 14, weight: .bold)).foregroundColor(.white.opacity(0.4))
                    .padding(12).frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.02)))
            }
        }
    }
    
    // MARK: - History View
    
    private var historyView: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Text("CHECK-IN HISTORY").font(.system(size: 11, weight: .black)).tracking(1).foregroundColor(.white)
                Spacer()
                Button { withAnimation { showHistory = false } } label: {
                    Text("← Back").font(.system(size: 11, weight: .bold)).foregroundColor(.white.opacity(0.3))
                }
            }
            
            let streak = consecutiveDays()
            HStack(spacing: 12) {
                statBadge("\(entries.count)", "Total", accent)
                statBadge("\(streak)", "Streak", morningColor)
                statBadge(averageMood(), "Avg Mood", eveningColor)
            }
            
            if entries.isEmpty {
                Text("No check-ins yet").font(.system(size: 12, weight: .medium)).foregroundColor(.white.opacity(0.2))
            } else {
                ForEach(entries.suffix(14).reversed()) { entry in
                    VStack(alignment: .leading, spacing: 4) {
                        HStack {
                            Text(entry.type == .morning ? "🌅" : "🌙").font(.system(size: 12))
                            Text(entry.date.formatted(.dateTime.weekday(.wide).month().day())).font(.system(size: 11, weight: .bold)).foregroundColor(.white)
                            Spacer()
                            Text("Mood: \(entry.mood)/10").font(.system(size: 9, weight: .bold)).foregroundColor(.white.opacity(0.3))
                        }
                        
                        if !entry.highlight.isEmpty {
                            Text(entry.highlight).font(.system(size: 10, weight: .medium)).foregroundColor(.white.opacity(0.25))
                        }
                    }
                    .padding(8).background(RoundedRectangle(cornerRadius: 6).fill(Color.white.opacity(0.015)))
                }
            }
        }
    }
    
    // MARK: - Components
    
    private func sectionHeader(_ text: String) -> some View {
        Text(text.uppercased()).font(.system(size: 9, weight: .black)).tracking(1)
            .foregroundColor(.white.opacity(0.2)).frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private func energyPicker(binding: Binding<Int>, color: Color) -> some View {
        HStack(spacing: 6) {
            ForEach(1...5, id: \.self) { level in
                Button { binding.wrappedValue = level } label: {
                    VStack(spacing: 2) {
                        Text(["🪫","🔋","⚡","🔥","⚡⚡"][level - 1]).font(.system(size: 16))
                        Text(["Empty","Low","Mid","Good","High"][level - 1]).font(.system(size: 7, weight: .bold))
                            .foregroundColor(binding.wrappedValue == level ? .white : .white.opacity(0.15))
                    }
                    .frame(maxWidth: .infinity).padding(.vertical, 6)
                    .background(RoundedRectangle(cornerRadius: 6)
                        .fill(binding.wrappedValue == level ? color.opacity(0.15) : Color.white.opacity(0.015)))
                }
            }
        }
    }
    
    private func moodSlider(binding: Binding<Int>, color: Color) -> some View {
        VStack(spacing: 4) {
            HStack {
                Text(moodEmoji(binding.wrappedValue)).font(.system(size: 20))
                Slider(value: Binding(
                    get: { Double(binding.wrappedValue) },
                    set: { binding.wrappedValue = Int($0) }
                ), in: 1...10, step: 1).tint(color)
                Text("\(binding.wrappedValue)").font(.system(size: 14, weight: .black)).foregroundColor(color).frame(width: 24)
            }
        }
    }
    
    private func neuroscience(_ text: String) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("🧠 WHY THIS WORKS").font(.system(size: 8, weight: .black)).tracking(1).foregroundColor(.white.opacity(0.1))
            Text(text).font(.system(size: 9, weight: .medium)).foregroundColor(.white.opacity(0.12)).lineSpacing(2)
        }
        .padding(8).background(RoundedRectangle(cornerRadius: 6).fill(Color.white.opacity(0.01)))
    }
    
    private func statBadge(_ val: String, _ label: String, _ color: Color) -> some View {
        VStack(spacing: 2) {
            Text(val).font(.system(size: 14, weight: .black)).foregroundColor(color)
            Text(label).font(.system(size: 7, weight: .bold)).foregroundColor(.white.opacity(0.15))
        }
        .frame(maxWidth: .infinity).padding(8).background(RoundedRectangle(cornerRadius: 6).fill(Color.white.opacity(0.015)))
    }
    
    private func sleepEmoji(_ level: Int) -> String {
        switch level { case 1: return "😵"; case 2: return "😴"; case 3: return "😐"; case 4: return "😊"; default: return "😴💤" }
    }
    
    private func moodEmoji(_ mood: Int) -> String {
        switch mood { case 1...2: return "😰"; case 3...4: return "😔"; case 5...6: return "😐"; case 7...8: return "🙂"; default: return "😊" }
    }
    
    // MARK: - Save Logic
    
    private func saveMorning() {
        let entry = CheckInEntry(type: .morning, mood: morningMood, energy: morningEnergy,
            highlight: oneThingToday, note: morningIntention, date: Date())
        entries.append(entry); persist()
        withAnimation { saved = true }
    }
    
    private func saveEvening() {
        let entry = CheckInEntry(type: .evening, mood: eveningMood, energy: eveningEnergy,
            highlight: whatWentWell, note: gratitude, date: Date())
        entries.append(entry); persist()
        withAnimation { saved = true }
    }
    
    private func persist() {
        if let data = try? JSONEncoder().encode(entries) {
            UserDefaults.standard.set(data, forKey: "aperture_check_ins")
        }
    }
    
    private func loadEntries() {
        if let data = UserDefaults.standard.data(forKey: "aperture_check_ins"),
           let decoded = try? JSONDecoder().decode([CheckInEntry].self, from: data) {
            entries = decoded
        }
    }
    
    private func autoDetectTime() {
        let hour = Calendar.current.component(.hour, from: Date())
        checkInType = hour < 14 ? .morning : .evening
    }
    
    private func consecutiveDays() -> Int {
        let calendar = Calendar.current
        var streak = 0; var day = calendar.startOfDay(for: Date())
        while entries.contains(where: { calendar.isDate($0.date, inSameDayAs: day) }) {
            streak += 1
            day = calendar.date(byAdding: .day, value: -1, to: day)!
        }
        return streak
    }
    
    private func averageMood() -> String {
        guard !entries.isEmpty else { return "—" }
        let avg = Double(entries.map(\.mood).reduce(0, +)) / Double(entries.count)
        return String(format: "%.1f", avg)
    }
}

// MARK: - Models

enum CheckInType: String, Codable { case morning, evening }

struct CheckInEntry: Identifiable, Codable {
    var id = UUID()
    let type: CheckInType
    let mood: Int
    let energy: Int
    let highlight: String
    let note: String
    let date: Date
}
