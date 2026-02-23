// AccountabilityViews.swift
// All accountability UI: End of Day Report, Morning Routine Builder,
// Micro Check-ins, Buddy Naming Ceremony, Sleep/Wake Settings, Goal Setting.
// ☀️ SunFlow: Reignited

import SwiftUI

// MARK: - ═══════════════════════════════════════════════════
// ACCOUNTABILITY HUB — Main entry point
// ═══════════════════════════════════════════════════════════

struct AccountabilityHubView: View {
    
    @StateObject private var manager = AccountabilityBuddyManager.shared
    @Environment(\.dismiss) var dismiss
    @State private var showDailyReport = false
    @State private var showMorningRoutine = false
    @State private var showMicroCheckIn = false
    @State private var showBuddyNaming = false
    @State private var showSleepSettings = false
    @State private var showGoalSetting = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(hex: "#0a0a0f").ignoresSafeArea()
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 20) {
                        headerSection
                        
                        if !manager.hasBuddy {
                            nameBuddyPrompt
                        }
                        
                        // Quick actions grid
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 14) {
                            accountabilityCard(
                                emoji: "🌅", title: "Morning Routine",
                                subtitle: manager.morningRoutine.isEmpty ? "Build yours" : "\(Int(manager.routineCompletionPercent * 100))% done",
                                color: Color(hex: "#F39C12")
                            ) { showMorningRoutine = true }
                            
                            accountabilityCard(
                                emoji: "📊", title: "Daily Report",
                                subtitle: manager.todayReport != nil ? "Completed" : "End of day",
                                color: .cyan
                            ) { showDailyReport = true }
                            
                            accountabilityCard(
                                emoji: "⚡", title: "Quick Check-In",
                                subtitle: "\(manager.microCheckInsDone) today",
                                color: Color(hex: "#2ECC71")
                            ) { showMicroCheckIn = true }
                            
                            accountabilityCard(
                                emoji: "😴", title: "Sleep / Wake",
                                subtitle: manager.sleepAccountabilityEnabled ? "Active" : "Set up",
                                color: Color(hex: "#9B59B6")
                            ) { showSleepSettings = true }
                            
                            accountabilityCard(
                                emoji: "🎯", title: "Goals",
                                subtitle: "\(manager.shortTermGoals.count + manager.longTermGoals.count) set",
                                color: Color(hex: "#E74C3C")
                            ) { showGoalSetting = true }
                            
                            if manager.hasBuddy {
                                accountabilityCard(
                                    emoji: "✏️", title: "Rename Buddy",
                                    subtitle: manager.buddyName ?? "",
                                    color: Color(red: 1.0, green: 0.85, blue: 0.3)
                                ) { showBuddyNaming = true }
                            }
                        }
                        
                        // Today's streak
                        streakCard
                        
                        Spacer(minLength: 100)
                    }
                    .padding(.horizontal, 16)
                    .padding(.top, 16)
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
                    Text(manager.hasBuddy ? "\(manager.buddyName!) Dashboard" : "Accountability").font(.system(size: 17, weight: .bold)).foregroundColor(.white)
                }
            }
            .toolbarBackground(Color(hex: "#0a0a0f"), for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .sheet(isPresented: $showDailyReport) { EndOfDayReportView() }
            .sheet(isPresented: $showMorningRoutine) { MorningRoutineView() }
            .sheet(isPresented: $showMicroCheckIn) { MicroCheckInView() }
            .sheet(isPresented: $showBuddyNaming) { BuddyNamingView() }
            .sheet(isPresented: $showSleepSettings) { SleepWakeSettingsView() }
            .sheet(isPresented: $showGoalSetting) { GoalSettingView() }
        }
    }
    
    private var headerSection: some View {
        VStack(spacing: 8) {
            Text(manager.hasBuddy ? "☀️ \(manager.buddyName!) is with you" : "☀️ Your Accountability System")
                .font(.system(size: 22, weight: .black)).foregroundColor(.white)
            Text("Show up honestly. Growth requires truth.")
                .font(.system(size: 12, weight: .medium)).foregroundColor(.white.opacity(0.4))
        }
    }
    
    private var nameBuddyPrompt: some View {
        Button { showBuddyNaming = true } label: {
            HStack(spacing: 12) {
                Text("☀️").font(.system(size: 28))
                VStack(alignment: .leading, spacing: 3) {
                    Text("Name Your Companion").font(.system(size: 14, weight: .bold)).foregroundColor(.white)
                    Text("Give your accountability buddy a name. Make it personal.")
                        .font(.system(size: 11, weight: .medium)).foregroundColor(.white.opacity(0.4))
                }
                Spacer()
                Image(systemName: "chevron.right").font(.system(size: 12)).foregroundColor(.white.opacity(0.2))
            }
            .padding(14)
            .background(RoundedRectangle(cornerRadius: 14).fill(Color(red: 1.0, green: 0.85, blue: 0.3).opacity(0.08)))
            .overlay(RoundedRectangle(cornerRadius: 14).stroke(Color(red: 1.0, green: 0.85, blue: 0.3).opacity(0.3), lineWidth: 1))
        }
    }
    
    private var streakCard: some View {
        let streak = SunCompanionManager.shared.currentStreak
        return HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text("CURRENT STREAK").font(.system(size: 9, weight: .black)).tracking(1).foregroundColor(.white.opacity(0.2))
                HStack(spacing: 6) {
                    Text("🔥").font(.system(size: 20))
                    Text("\(streak) day\(streak == 1 ? "" : "s")").font(.system(size: 18, weight: .black, design: .rounded)).foregroundColor(Color(red: 1.0, green: 0.85, blue: 0.3))
                }
            }
            Spacer()
            Text("Check-ins: \(manager.microCheckInsDone)").font(.system(size: 11, weight: .bold)).foregroundColor(.white.opacity(0.3))
        }
        .padding(14)
        .background(RoundedRectangle(cornerRadius: 12).fill(Color.white.opacity(0.03)))
    }
    
    private func accountabilityCard(emoji: String, title: String, subtitle: String, color: Color, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            VStack(alignment: .leading, spacing: 8) {
                Text(emoji).font(.system(size: 26))
                Text(title).font(.system(size: 13, weight: .bold)).foregroundColor(.white)
                Text(subtitle).font(.system(size: 10, weight: .medium)).foregroundColor(color.opacity(0.7))
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(14)
            .background(RoundedRectangle(cornerRadius: 14).fill(color.opacity(0.06)))
            .overlay(RoundedRectangle(cornerRadius: 14).stroke(color.opacity(0.15), lineWidth: 1))
        }
        .buttonStyle(.plain)
    }
}

// MARK: - ═══════════════════════════════════════════════════
// BUDDY NAMING CEREMONY
// ═══════════════════════════════════════════════════════════

struct BuddyNamingView: View {
    
    @StateObject private var manager = AccountabilityBuddyManager.shared
    @Environment(\.dismiss) var dismiss
    @State private var name = ""
    @State private var phase = 0
    @FocusState private var focused: Bool
    
    var body: some View {
        ZStack {
            Color(hex: "#0a0a0f").ignoresSafeArea()
            
            VStack(spacing: 30) {
                Spacer()
                
                // Sun animation
                Circle()
                    .fill(RadialGradient(colors: [Color(red: 1.0, green: 0.95, blue: 0.6), Color(red: 1.0, green: 0.85, blue: 0.3), Color(red: 0.85, green: 0.55, blue: 0.05)], center: .center, startRadius: 5, endRadius: 50))
                    .frame(width: 100, height: 100)
                    .shadow(color: Color(red: 1.0, green: 0.85, blue: 0.3).opacity(0.5), radius: 30)
                
                if phase == 0 {
                    VStack(spacing: 12) {
                        Text("Every journey needs a companion")
                            .font(.system(size: 18, weight: .bold)).foregroundColor(.white)
                        Text("This presence has been walking with you — through every lesson, every late night, every moment of doubt. It's time to give it a name.")
                            .font(.system(size: 13, weight: .medium)).foregroundColor(.white.opacity(0.5))
                            .multilineTextAlignment(.center).padding(.horizontal, 30)
                    }
                    
                    Button {
                        withAnimation(.easeInOut(duration: 0.5)) { phase = 1 }
                    } label: {
                        Text("I'm ready").font(.system(size: 15, weight: .bold)).foregroundColor(.black)
                            .padding(.horizontal, 40).padding(.vertical, 12)
                            .background(Capsule().fill(Color(red: 1.0, green: 0.85, blue: 0.3)))
                    }
                }
                
                if phase == 1 {
                    VStack(spacing: 16) {
                        Text("What will you call your companion?")
                            .font(.system(size: 18, weight: .bold)).foregroundColor(.white)
                        
                        TextField("", text: $name, prompt: Text("Enter a name...").foregroundColor(.white.opacity(0.2)))
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(Color(red: 1.0, green: 0.85, blue: 0.3))
                            .multilineTextAlignment(.center)
                            .padding(14)
                            .background(RoundedRectangle(cornerRadius: 12).fill(Color.white.opacity(0.05)))
                            .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color(red: 1.0, green: 0.85, blue: 0.3).opacity(0.3), lineWidth: 1))
                            .padding(.horizontal, 40)
                            .focused($focused)
                            .onAppear { focused = true }
                        
                        if !name.trimmingCharacters(in: .whitespaces).isEmpty {
                            Button {
                                manager.nameBuddy(name)
                                HapticManager.shared.heavy()
                                withAnimation(.easeInOut(duration: 0.5)) { phase = 2 }
                            } label: {
                                Text("This is the name").font(.system(size: 15, weight: .bold)).foregroundColor(.black)
                                    .padding(.horizontal, 40).padding(.vertical, 12)
                                    .background(Capsule().fill(Color(red: 1.0, green: 0.85, blue: 0.3)))
                            }
                        }
                    }
                }
                
                if phase == 2 {
                    VStack(spacing: 12) {
                        Text("\(name) is locked in.").font(.system(size: 22, weight: .black)).foregroundColor(Color(red: 1.0, green: 0.85, blue: 0.3))
                        Text("\(name) will check on you. Track your growth.\nHold you accountable. Not with judgment — with awareness.")
                            .font(.system(size: 13, weight: .medium)).foregroundColor(.white.opacity(0.5))
                            .multilineTextAlignment(.center).padding(.horizontal, 30)
                        
                        Button { dismiss() } label: {
                            Text("Let's go").font(.system(size: 15, weight: .bold)).foregroundColor(.black)
                                .padding(.horizontal, 40).padding(.vertical, 12)
                                .background(Capsule().fill(Color(red: 1.0, green: 0.85, blue: 0.3)))
                        }
                        .padding(.top, 10)
                    }
                }
                
                Spacer()
            }
        }
    }
}

// MARK: - ═══════════════════════════════════════════════════
// END OF DAY REPORT
// ═══════════════════════════════════════════════════════════

struct EndOfDayReportView: View {
    
    @StateObject private var manager = AccountabilityBuddyManager.shared
    @Environment(\.dismiss) var dismiss
    
    @State private var screenTime: Double = 3
    @State private var socialMedia: Double = 45
    @State private var mood: Int = 5
    @State private var gratitude = ""
    @State private var lessonsCompleted: Int = 0
    @State private var didMeditate = false
    @State private var bedtime: BedtimeHonesty = .didntTrack
    @State private var topWin = ""
    @State private var report: DailyReport?
    @State private var showResult = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(hex: "#0a0a0f").ignoresSafeArea()
                
                if showResult, let r = report {
                    reportResultView(r)
                } else {
                    reportFormView
                }
            }
            .navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text(manager.hasBuddy ? "\(manager.buddyName!)'s Daily Report" : "Daily Report").font(.system(size: 16, weight: .bold)).foregroundColor(.white)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") { dismiss() }.foregroundColor(Color(red: 1.0, green: 0.85, blue: 0.3))
                }
            }
            .toolbarBackground(Color(hex: "#0a0a0f"), for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
        }
    }
    
    private var reportFormView: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 20) {
                Text("Let's be honest about today.").font(.system(size: 13, weight: .medium)).foregroundColor(.white.opacity(0.4)).padding(.top, 10)
                
                // Mood
                reportSection("Mood Rating", emoji: "😊") {
                    HStack(spacing: 4) {
                        ForEach(1...10, id: \.self) { n in
                            Button { mood = n } label: {
                                Text("\(n)").font(.system(size: 13, weight: mood == n ? .black : .medium))
                                    .foregroundColor(mood == n ? .black : .white.opacity(0.5))
                                    .frame(width: 28, height: 28)
                                    .background(Circle().fill(mood == n ? Color(red: 1.0, green: 0.85, blue: 0.3) : Color.white.opacity(0.05)))
                            }
                        }
                    }
                }
                
                // Screen time
                reportSection("Screen Time (hours)", emoji: "📱") {
                    VStack(spacing: 4) {
                        Slider(value: $screenTime, in: 0...16, step: 0.5).tint(.cyan)
                        Text("\(String(format: "%.1f", screenTime)) hrs").font(.system(size: 12, weight: .bold)).foregroundColor(.cyan)
                    }
                }
                
                // Social media
                reportSection("Social Media (minutes)", emoji: "📲") {
                    VStack(spacing: 4) {
                        Slider(value: $socialMedia, in: 0...300, step: 15).tint(socialMedia > 120 ? .red : .green)
                        Text("\(Int(socialMedia)) min").font(.system(size: 12, weight: .bold)).foregroundColor(socialMedia > 120 ? .red : .green)
                    }
                }
                
                // Meditation
                reportSection("Did you meditate?", emoji: "🧘") {
                    Toggle("", isOn: $didMeditate).tint(Color(red: 1.0, green: 0.85, blue: 0.3)).labelsHidden()
                }
                
                // Bedtime
                reportSection("Bedtime Honesty", emoji: "😴") {
                    ForEach(BedtimeHonesty.allCases, id: \.self) { option in
                        Button {
                            bedtime = option
                        } label: {
                            Text(option.rawValue)
                                .font(.system(size: 11, weight: bedtime == option ? .bold : .medium))
                                .foregroundColor(bedtime == option ? .black : .white.opacity(0.5))
                                .padding(.horizontal, 10).padding(.vertical, 6)
                                .background(Capsule().fill(bedtime == option ? Color(red: 1.0, green: 0.85, blue: 0.3) : Color.white.opacity(0.05)))
                        }
                    }
                }
                
                // Gratitude
                reportSection("One gratitude", emoji: "🙏") {
                    TextField("", text: $gratitude, prompt: Text("What are you grateful for?").foregroundColor(.white.opacity(0.15)))
                        .font(.system(size: 13)).foregroundColor(.white)
                }
                
                // Top win
                reportSection("Today's top win", emoji: "🏆") {
                    TextField("", text: $topWin, prompt: Text("Even small wins count...").foregroundColor(.white.opacity(0.15)))
                        .font(.system(size: 13)).foregroundColor(.white)
                }
                
                // Submit
                Button {
                    report = manager.generateDailyReport(
                        screenTimeHours: screenTime, socialMediaMinutes: Int(socialMedia),
                        moodRating: mood, gratitude: gratitude, lessonsCompleted: lessonsCompleted,
                        didMeditate: didMeditate, bedtimeHonesty: bedtime, topWin: topWin
                    )
                    withAnimation(.spring(response: 0.5, dampingFraction: 0.8)) { showResult = true }
                } label: {
                    Text("Generate Report").font(.system(size: 15, weight: .bold)).foregroundColor(.black)
                        .frame(maxWidth: .infinity).padding(.vertical, 14)
                        .background(RoundedRectangle(cornerRadius: 14).fill(Color(red: 1.0, green: 0.85, blue: 0.3)))
                }
                .padding(.top, 10)
                
                Spacer(minLength: 60)
            }
            .padding(.horizontal, 16)
        }
    }
    
    private func reportResultView(_ r: DailyReport) -> some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 24) {
                Spacer(minLength: 20)
                
                Text(r.cosmicGrade).font(.system(size: 36))
                Text("Day Score: \(r.overallScore)/100")
                    .font(.system(size: 28, weight: .black, design: .rounded))
                    .foregroundColor(Color(red: 1.0, green: 0.85, blue: 0.3))
                
                Text(scoreMessage(r.overallScore))
                    .font(.system(size: 13, weight: .medium)).foregroundColor(.white.opacity(0.5))
                    .multilineTextAlignment(.center).padding(.horizontal, 30)
                
                // Stats grid
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 12) {
                    statBubble("Mood", "\(r.moodRating)/10", color: .cyan)
                    statBubble("Screen", "\(String(format: "%.1f", r.screenTimeHours))h", color: r.screenTimeHours > 6 ? .red : .green)
                    statBubble("Social", "\(r.socialMediaMinutes)m", color: r.socialMediaMinutes > 60 ? .red : .green)
                    statBubble("Routine", "\(Int(r.routineCompletion * 100))%", color: Color(hex: "#F39C12"))
                    statBubble("Meditated", r.didMeditate ? "✓" : "✗", color: r.didMeditate ? .green : .red)
                    statBubble("Bedtime", String(r.bedtimeHonesty.rawValue.prefix(12)), color: .purple)
                }
                
                if !r.gratitude.isEmpty {
                    VStack(spacing: 6) {
                        Text("GRATEFUL FOR").font(.system(size: 9, weight: .black)).tracking(1).foregroundColor(.white.opacity(0.2))
                        Text("\"\(r.gratitude)\"").font(.system(size: 14, weight: .medium)).foregroundColor(.white.opacity(0.6)).italic()
                    }
                    .padding(14).background(RoundedRectangle(cornerRadius: 12).fill(Color.white.opacity(0.03)))
                }
                
                if !r.topWin.isEmpty {
                    VStack(spacing: 6) {
                        Text("🏆 TOP WIN").font(.system(size: 9, weight: .black)).tracking(1).foregroundColor(.white.opacity(0.2))
                        Text(r.topWin).font(.system(size: 14, weight: .bold)).foregroundColor(Color(red: 1.0, green: 0.85, blue: 0.3))
                    }
                    .padding(14).background(RoundedRectangle(cornerRadius: 12).fill(Color.white.opacity(0.03)))
                }
                
                Spacer(minLength: 80)
            }
            .padding(.horizontal, 16)
        }
    }
    
    private func reportSection(_ title: String, emoji: String, @ViewBuilder content: () -> some View) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(spacing: 6) {
                Text(emoji).font(.system(size: 14))
                Text(title).font(.system(size: 12, weight: .bold)).foregroundColor(.white.opacity(0.6))
            }
            content()
        }
        .padding(12)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(RoundedRectangle(cornerRadius: 12).fill(Color.white.opacity(0.03)))
    }
    
    private func statBubble(_ label: String, _ value: String, color: Color) -> some View {
        VStack(spacing: 4) {
            Text(value).font(.system(size: 16, weight: .black, design: .rounded)).foregroundColor(color)
            Text(label).font(.system(size: 9, weight: .bold)).foregroundColor(.white.opacity(0.3))
        }
        .frame(maxWidth: .infinity).padding(10)
        .background(RoundedRectangle(cornerRadius: 10).fill(color.opacity(0.06)))
    }
    
    private func scoreMessage(_ score: Int) -> String {
        switch score {
        case 80...100: return "You're operating at Ultra Instinct level. The matrix barely touched you today."
        case 60..<80: return "Strong day. You're building patterns that compound. Keep stacking."
        case 40..<60: return "Mixed signals. Some wins, some slips. The awareness of the slips IS the growth."
        case 20..<40: return "Tough day. But you showed up to report honestly. That alone puts you ahead of 90%."
        default: return "Tomorrow is a clean slate. The fact that you're even tracking puts you in rare company."
        }
    }
}

// MARK: - ═══════════════════════════════════════════════════
// MICRO CHECK-IN (15 seconds)
// ═══════════════════════════════════════════════════════════

struct MicroCheckInView: View {
    
    @StateObject private var manager = AccountabilityBuddyManager.shared
    @Environment(\.dismiss) var dismiss
    @State private var question = MicroCheckInBank.randomQuestion()
    @State private var selectedAnswer: MicroAnswer?
    @State private var showFeedback = false
    
    var body: some View {
        ZStack {
            Color(hex: "#0a0a0f").ignoresSafeArea()
            
            VStack(spacing: 24) {
                Spacer()
                
                Text(question.emoji).font(.system(size: 50))
                
                Text(question.question)
                    .font(.system(size: 18, weight: .bold)).foregroundColor(.white)
                    .multilineTextAlignment(.center).padding(.horizontal, 20)
                
                if showFeedback, let answer = selectedAnswer {
                    Text(answer.feedback)
                        .font(.system(size: 13, weight: .medium))
                        .foregroundColor(answer.isHealthy ? .green : Color(hex: "#F39C12"))
                        .multilineTextAlignment(.center).padding(.horizontal, 30)
                        .transition(.opacity)
                    
                    HStack(spacing: 12) {
                        Button {
                            question = MicroCheckInBank.randomQuestion()
                            selectedAnswer = nil
                            showFeedback = false
                        } label: {
                            Text("Another").font(.system(size: 13, weight: .bold)).foregroundColor(.white.opacity(0.6))
                                .padding(.horizontal, 24).padding(.vertical, 10)
                                .background(Capsule().fill(Color.white.opacity(0.08)))
                        }
                        
                        Button { dismiss() } label: {
                            Text("Done").font(.system(size: 13, weight: .bold)).foregroundColor(.black)
                                .padding(.horizontal, 24).padding(.vertical, 10)
                                .background(Capsule().fill(Color(red: 1.0, green: 0.85, blue: 0.3)))
                        }
                    }
                } else {
                    VStack(spacing: 10) {
                        ForEach(Array(question.answers.enumerated()), id: \.offset) { _, answer in
                            Button {
                                selectedAnswer = answer
                                manager.recordMicroCheckIn()
                                withAnimation(.spring(response: 0.4, dampingFraction: 0.8)) { showFeedback = true }
                            } label: {
                                Text(answer.text)
                                    .font(.system(size: 14, weight: .medium)).foregroundColor(.white)
                                    .frame(maxWidth: .infinity).padding(.vertical, 14)
                                    .background(RoundedRectangle(cornerRadius: 12).fill(Color.white.opacity(0.06)))
                                    .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.white.opacity(0.1), lineWidth: 1))
                            }
                        }
                    }
                    .padding(.horizontal, 20)
                }
                
                Spacer()
            }
        }
    }
}

// MARK: - ═══════════════════════════════════════════════════
// MORNING ROUTINE BUILDER
// ═══════════════════════════════════════════════════════════

struct MorningRoutineView: View {
    
    @StateObject private var manager = AccountabilityBuddyManager.shared
    @Environment(\.dismiss) var dismiss
    @State private var showAddStep = false
    @State private var newTitle = ""
    @State private var newEmoji = "🧘"
    @State private var newDuration = 5
    
    private let templates: [(String, String, Int)] = [
        ("🧘", "Meditation", 5), ("💧", "Drink Water", 1), ("📖", "Read", 15),
        ("🏃", "Exercise", 20), ("📝", "Journal", 10), ("🌞", "Sunlight", 5),
        ("🧊", "Cold Shower", 3), ("🍳", "Healthy Breakfast", 15), ("🫁", "Breathwork", 5),
        ("🙏", "Gratitude", 3), ("📵", "No Phone 30min", 30), ("🎯", "Set Intentions", 5),
    ]
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(hex: "#0a0a0f").ignoresSafeArea()
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 16) {
                        // Progress
                        if !manager.morningRoutine.isEmpty {
                            progressBar
                        }
                        
                        // Current routine
                        if manager.morningRoutine.isEmpty {
                            emptyState
                        } else {
                            ForEach(manager.morningRoutine) { step in
                                routineStepRow(step)
                            }
                        }
                        
                        // Templates
                        Text("QUICK ADD").font(.system(size: 9, weight: .black)).tracking(1).foregroundColor(.white.opacity(0.2)).padding(.top, 10)
                        
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())], spacing: 10) {
                            ForEach(templates, id: \.1) { emoji, title, duration in
                                Button {
                                    manager.addRoutineStep(RoutineStep(title: title, emoji: emoji, durationMinutes: duration))
                                } label: {
                                    VStack(spacing: 4) {
                                        Text(emoji).font(.system(size: 22))
                                        Text(title).font(.system(size: 9, weight: .bold)).foregroundColor(.white.opacity(0.6))
                                        Text("\(duration)m").font(.system(size: 8, weight: .medium)).foregroundColor(.white.opacity(0.2))
                                    }
                                    .frame(maxWidth: .infinity).padding(10)
                                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.03)))
                                }
                            }
                        }
                        
                        Spacer(minLength: 60)
                    }
                    .padding(.horizontal, 16).padding(.top, 16)
                }
            }
            .navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Morning Routine").font(.system(size: 16, weight: .bold)).foregroundColor(.white)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") { dismiss() }.foregroundColor(Color(red: 1.0, green: 0.85, blue: 0.3))
                }
            }
            .toolbarBackground(Color(hex: "#0a0a0f"), for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
        }
    }
    
    private var progressBar: some View {
        VStack(spacing: 6) {
            HStack {
                Text("\(Int(manager.routineCompletionPercent * 100))% complete").font(.system(size: 11, weight: .bold)).foregroundColor(Color(red: 1.0, green: 0.85, blue: 0.3))
                Spacer()
                let total = manager.morningRoutine.reduce(0) { $0 + $1.durationMinutes }
                Text("~\(total) min total").font(.system(size: 10, weight: .medium)).foregroundColor(.white.opacity(0.3))
            }
            GeometryReader { geo in
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 4).fill(Color.white.opacity(0.05)).frame(height: 6)
                    RoundedRectangle(cornerRadius: 4).fill(Color(red: 1.0, green: 0.85, blue: 0.3)).frame(width: geo.size.width * manager.routineCompletionPercent, height: 6)
                }
            }
            .frame(height: 6)
        }
        .padding(12).background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.02)))
    }
    
    private var emptyState: some View {
        VStack(spacing: 8) {
            Text("🌅").font(.system(size: 40))
            Text("Build Your Morning").font(.system(size: 16, weight: .bold)).foregroundColor(.white)
            Text("Start with just 5 minutes. Add more as it becomes habit.")
                .font(.system(size: 12, weight: .medium)).foregroundColor(.white.opacity(0.4))
                .multilineTextAlignment(.center)
        }
        .padding(20)
    }
    
    private func routineStepRow(_ step: RoutineStep) -> some View {
        HStack(spacing: 12) {
            Button { manager.completeRoutineStep(step.id) } label: {
                Image(systemName: step.isCompletedToday ? "checkmark.circle.fill" : "circle")
                    .font(.system(size: 22)).foregroundColor(step.isCompletedToday ? .green : .white.opacity(0.2))
            }
            Text(step.emoji).font(.system(size: 20))
            VStack(alignment: .leading, spacing: 2) {
                Text(step.title).font(.system(size: 14, weight: .bold))
                    .foregroundColor(step.isCompletedToday ? .white.opacity(0.3) : .white)
                    .strikethrough(step.isCompletedToday)
                Text("\(step.durationMinutes) min").font(.system(size: 10, weight: .medium)).foregroundColor(.white.opacity(0.3))
            }
            Spacer()
        }
        .padding(12).background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.03)))
    }
}

// MARK: - ═══════════════════════════════════════════════════
// SLEEP / WAKE SETTINGS
// ═══════════════════════════════════════════════════════════

struct SleepWakeSettingsView: View {
    
    @StateObject private var manager = AccountabilityBuddyManager.shared
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(hex: "#0a0a0f").ignoresSafeArea()
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 20) {
                        Text("Sleep is the #1 tool the system attacks. Blue light, doom scrolling, algorithmic feeds — all designed to steal your rest.")
                            .font(.system(size: 12, weight: .medium)).foregroundColor(.white.opacity(0.4)).padding(.top, 10)
                        
                        // Bedtime
                        VStack(alignment: .leading, spacing: 12) {
                            HStack {
                                Text("😴 BEDTIME TARGET").font(.system(size: 10, weight: .black)).tracking(1).foregroundColor(.white.opacity(0.3))
                                Spacer()
                                Toggle("", isOn: $manager.sleepAccountabilityEnabled).tint(Color(hex: "#9B59B6")).labelsHidden()
                            }
                            
                            if manager.sleepAccountabilityEnabled {
                                DatePicker("Target", selection: $manager.bedtimeTarget, displayedComponents: .hourAndMinute)
                                    .datePickerStyle(.wheel).labelsHidden()
                                    .colorScheme(.dark).frame(height: 100)
                                
                                Text("You'll get a reminder 30 minutes before.").font(.system(size: 10, weight: .medium)).foregroundColor(.white.opacity(0.3))
                            }
                        }
                        .padding(14).background(RoundedRectangle(cornerRadius: 14).fill(Color.white.opacity(0.03)))
                        
                        // Wake
                        VStack(alignment: .leading, spacing: 12) {
                            HStack {
                                Text("🌅 WAKE TARGET").font(.system(size: 10, weight: .black)).tracking(1).foregroundColor(.white.opacity(0.3))
                                Spacer()
                                Toggle("", isOn: $manager.wakeAccountabilityEnabled).tint(Color(hex: "#F39C12")).labelsHidden()
                            }
                            
                            if manager.wakeAccountabilityEnabled {
                                DatePicker("Target", selection: $manager.wakeTarget, displayedComponents: .hourAndMinute)
                                    .datePickerStyle(.wheel).labelsHidden()
                                    .colorScheme(.dark).frame(height: 100)
                                
                                Text("Morning routine reminder at this time.").font(.system(size: 10, weight: .medium)).foregroundColor(.white.opacity(0.3))
                            }
                        }
                        .padding(14).background(RoundedRectangle(cornerRadius: 14).fill(Color.white.opacity(0.03)))
                        
                        Button {
                            manager.saveSleepSettings()
                            manager.scheduleSleepReminder()
                            manager.scheduleWakeReminder()
                            dismiss()
                        } label: {
                            Text("Save & Activate").font(.system(size: 15, weight: .bold)).foregroundColor(.black)
                                .frame(maxWidth: .infinity).padding(.vertical, 14)
                                .background(RoundedRectangle(cornerRadius: 14).fill(Color(red: 1.0, green: 0.85, blue: 0.3)))
                        }
                        
                        Spacer(minLength: 60)
                    }
                    .padding(.horizontal, 16)
                }
            }
            .navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) { Text("Sleep & Wake").font(.system(size: 16, weight: .bold)).foregroundColor(.white) }
                ToolbarItem(placement: .navigationBarTrailing) { Button("Done") { dismiss() }.foregroundColor(Color(red: 1.0, green: 0.85, blue: 0.3)) }
            }
            .toolbarBackground(Color(hex: "#0a0a0f"), for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
        }
    }
}

// MARK: - ═══════════════════════════════════════════════════
// GOAL SETTING
// ═══════════════════════════════════════════════════════════

struct GoalSettingView: View {
    
    @StateObject private var manager = AccountabilityBuddyManager.shared
    @Environment(\.dismiss) var dismiss
    @State private var newGoal = ""
    @State private var selectedCategory: GoalCategory = .learning
    @State private var isLongTerm = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(hex: "#0a0a0f").ignoresSafeArea()
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 20) {
                        Text("As you unlearn, you reclaim time. What will you fill it with?")
                            .font(.system(size: 12, weight: .medium)).foregroundColor(.white.opacity(0.4)).padding(.top, 10)
                        
                        // Add goal
                        VStack(spacing: 12) {
                            TextField("", text: $newGoal, prompt: Text("Your goal...").foregroundColor(.white.opacity(0.15)))
                                .font(.system(size: 14)).foregroundColor(.white)
                                .padding(12).background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.05)))
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 6) {
                                    ForEach(GoalCategory.allCases, id: \.self) { cat in
                                        Button { selectedCategory = cat } label: {
                                            Text(cat.rawValue).font(.system(size: 10, weight: selectedCategory == cat ? .bold : .medium))
                                                .foregroundColor(selectedCategory == cat ? .black : .white.opacity(0.5))
                                                .padding(.horizontal, 10).padding(.vertical, 6)
                                                .background(Capsule().fill(selectedCategory == cat ? Color(red: 1.0, green: 0.85, blue: 0.3) : Color.white.opacity(0.05)))
                                        }
                                    }
                                }
                            }
                            
                            HStack {
                                Toggle("Long-term", isOn: $isLongTerm).font(.system(size: 12, weight: .medium)).foregroundColor(.white.opacity(0.5)).tint(Color(red: 1.0, green: 0.85, blue: 0.3))
                                Spacer()
                                Button {
                                    guard !newGoal.isEmpty else { return }
                                    manager.addGoal(PersonalGoal(title: newGoal, category: selectedCategory, isLongTerm: isLongTerm))
                                    newGoal = ""
                                } label: {
                                    Text("Add").font(.system(size: 13, weight: .bold)).foregroundColor(.black)
                                        .padding(.horizontal, 20).padding(.vertical, 8)
                                        .background(Capsule().fill(Color(red: 1.0, green: 0.85, blue: 0.3)))
                                }
                            }
                        }
                        .padding(14).background(RoundedRectangle(cornerRadius: 14).fill(Color.white.opacity(0.03)))
                        
                        // Short term
                        if !manager.shortTermGoals.isEmpty {
                            goalSection("SHORT TERM", goals: manager.shortTermGoals)
                        }
                        
                        // Long term
                        if !manager.longTermGoals.isEmpty {
                            goalSection("LONG TERM", goals: manager.longTermGoals)
                        }
                        
                        Spacer(minLength: 60)
                    }
                    .padding(.horizontal, 16)
                }
            }
            .navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) { Text("Goals").font(.system(size: 16, weight: .bold)).foregroundColor(.white) }
                ToolbarItem(placement: .navigationBarTrailing) { Button("Done") { dismiss() }.foregroundColor(Color(red: 1.0, green: 0.85, blue: 0.3)) }
            }
            .toolbarBackground(Color(hex: "#0a0a0f"), for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
        }
    }
    
    private func goalSection(_ title: String, goals: [PersonalGoal]) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title).font(.system(size: 9, weight: .black)).tracking(1).foregroundColor(.white.opacity(0.2))
            ForEach(goals) { goal in
                HStack(spacing: 10) {
                    Text(goal.category.rawValue.prefix(2).description).font(.system(size: 16))
                    Text(goal.title).font(.system(size: 13, weight: .medium)).foregroundColor(.white)
                    Spacer()
                }
                .padding(10).background(RoundedRectangle(cornerRadius: 8).fill(Color.white.opacity(0.02)))
            }
        }
    }
}
