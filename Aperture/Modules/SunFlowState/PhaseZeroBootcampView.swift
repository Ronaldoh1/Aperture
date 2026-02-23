// PhaseZeroBootcampView.swift
// The 14-day Psychological Decompression Bootcamp.
// Stillness training, Control Purge, Fear Purge, 404 Digital Purge,
// Socialization Protocol, News Protocol, Saying No Framework.
// ☀️ SunFlow: Reignited

import SwiftUI

// MARK: - ═══════════════════════════════════════════════════
// PHASE ZERO BOOTCAMP — Strip the noise first
// ═══════════════════════════════════════════════════════════

struct PhaseZeroBootcampView: View {
    
    @StateObject private var engine = SunFlowStateEngine.shared
    @Environment(\.dismiss) var dismiss
    @State private var showStillness = false
    @State private var showControlPurge = false
    @State private var showFearPurge = false
    @State private var showDigitalPurge = false
    @State private var showSocialization = false
    @State private var showNewsProtocol = false
    @State private var showSayingNo = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(hex: "#0a0a0f").ignoresSafeArea()
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 20) {
                        headerSection
                        progressSection
                        
                        // Stillness Training
                        Text("DAILY STILLNESS").font(.system(size: 9, weight: .black)).tracking(1.5).foregroundColor(.white.opacity(0.2)).frame(maxWidth: .infinity, alignment: .leading)
                        
                        stillnessSection
                        
                        // Exercises
                        Text("EXERCISES").font(.system(size: 9, weight: .black)).tracking(1.5).foregroundColor(.white.opacity(0.2)).frame(maxWidth: .infinity, alignment: .leading)
                        
                        exerciseCard(.controlPurge, emoji: "✊", title: "Control Purge", subtitle: "Sort what you control vs release", done: engine.bootcamp.controlPurgeDone) { showControlPurge = true }
                        exerciseCard(.fearPurge, emoji: "🕊️", title: "Fear Purge", subtitle: "Concrete vs abstract — release what's imagined", done: engine.bootcamp.fearPurgeDone) { showFearPurge = true }
                        exerciseCard(.digitalPurge, emoji: "📵", title: "404 Digital Purge", subtitle: "Delete 50% of unused apps. Now.", done: engine.bootcamp.digitalPurgeDone) { showDigitalPurge = true }
                        exerciseCard(.socialization, emoji: "🤝", title: "Controlled Socialization", subtitle: "Gate your social energy for 30-60 days", done: engine.bootcamp.socializationProtocolRead) { showSocialization = true }
                        exerciseCard(.newsProtocol, emoji: "📰", title: "News Protocol", subtitle: "#404Error Headlines Mode", done: engine.bootcamp.newsProtocolRead) { showNewsProtocol = true }
                        exerciseCard(.sayingNo, emoji: "🚫", title: "Saying No Framework", subtitle: "4 gates + scripts. No over-justification.", done: engine.bootcamp.sayingNoFrameworkRead) { showSayingNo = true }
                        
                        // Digital Rules (always visible)
                        digitalRulesCard
                        
                        Spacer(minLength: 100)
                    }
                    .padding(.horizontal, 16).padding(.top, 16)
                }
            }
            .navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) { Text("Phase 0 Bootcamp").font(.system(size: 16, weight: .bold)).foregroundColor(.purple) }
                ToolbarItem(placement: .navigationBarTrailing) { Button("Done") { dismiss() }.foregroundColor(Color(red: 1.0, green: 0.85, blue: 0.3)) }
            }
            .toolbarBackground(Color(hex: "#0a0a0f"), for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .sheet(isPresented: $showStillness) { StillnessTimerView() }
            .sheet(isPresented: $showControlPurge) { ControlPurgeView() }
            .sheet(isPresented: $showFearPurge) { FearPurgeView() }
            .sheet(isPresented: $showDigitalPurge) { DigitalPurgeView() }
            .sheet(isPresented: $showSocialization) { ProtocolReadView(exercise: .socialization, title: "Controlled Socialization Protocol", sections: socializationSections) }
            .sheet(isPresented: $showNewsProtocol) { ProtocolReadView(exercise: .newsProtocol, title: "#404Error Headlines Mode", sections: newsProtocolSections) }
            .sheet(isPresented: $showSayingNo) { ProtocolReadView(exercise: .sayingNo, title: "Saying No Framework", sections: sayingNoSections) }
        }
    }
    
    // MARK: - Header
    
    private var headerSection: some View {
        VStack(spacing: 8) {
            Text("🧘").font(.system(size: 40))
            Text("Psychological Decompression")
                .font(.system(size: 18, weight: .black)).foregroundColor(.white)
            Text("Do this before any goals or planning.\nNoise must die first.")
                .font(.system(size: 12, weight: .medium)).foregroundColor(.white.opacity(0.4))
                .multilineTextAlignment(.center)
        }
    }
    
    // MARK: - Progress
    
    private var progressSection: some View {
        VStack(spacing: 8) {
            HStack {
                Text("Day \(engine.bootcamp.currentDay)/14").font(.system(size: 14, weight: .bold)).foregroundColor(.purple)
                Spacer()
                Text("\(Int(engine.bootcamp.progressPercent * 100))%").font(.system(size: 14, weight: .bold, design: .rounded)).foregroundColor(.white.opacity(0.3))
            }
            GeometryReader { geo in
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 4).fill(Color.white.opacity(0.05)).frame(height: 6)
                    RoundedRectangle(cornerRadius: 4).fill(Color.purple).frame(width: geo.size.width * engine.bootcamp.progressPercent, height: 6)
                }
            }
            .frame(height: 6)
            
            if engine.bootcamp.startDate == nil {
                Button {
                    engine.startBootcamp()
                } label: {
                    Text("Start Bootcamp Today").font(.system(size: 14, weight: .bold)).foregroundColor(.black)
                        .frame(maxWidth: .infinity).padding(.vertical, 12)
                        .background(RoundedRectangle(cornerRadius: 12).fill(Color.purple))
                }
            }
        }
        .padding(14).background(RoundedRectangle(cornerRadius: 14).fill(Color.purple.opacity(0.04)))
    }
    
    // MARK: - Stillness Section
    
    private var stillnessSection: some View {
        VStack(spacing: 10) {
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text("Target: \(engine.bootcamp.stillnessMinutesTarget) minutes")
                        .font(.system(size: 13, weight: .bold)).foregroundColor(.white)
                    Text("\(engine.bootcamp.stillnessCompletedDays.count)/14 sessions done")
                        .font(.system(size: 11, weight: .medium)).foregroundColor(.white.opacity(0.3))
                }
                Spacer()
                Button { showStillness = true } label: {
                    Text("Start").font(.system(size: 13, weight: .bold)).foregroundColor(.black)
                        .padding(.horizontal, 20).padding(.vertical, 8)
                        .background(Capsule().fill(Color.purple))
                }
            }
            
            // Day dots
            HStack(spacing: 4) {
                ForEach(1...14, id: \.self) { day in
                    StillnessDayDot(
                        day: day,
                        isDone: engine.bootcamp.stillnessCompletedDays.contains(day),
                        isCurrentDay: day == engine.bootcamp.currentDay
                    )
                }
            }
        }
        .padding(14).background(RoundedRectangle(cornerRadius: 14).fill(Color.purple.opacity(0.04)))
        .overlay(RoundedRectangle(cornerRadius: 14).stroke(Color.purple.opacity(0.12), lineWidth: 1))
    }
    
    // MARK: - Exercise Card
    
    private func exerciseCard(_ exercise: BootcampExercise, emoji: String, title: String, subtitle: String, done: Bool, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            HStack(spacing: 12) {
                ZStack {
                    Circle().fill(done ? Color.green.opacity(0.15) : Color.white.opacity(0.04)).frame(width: 40, height: 40)
                    if done {
                        Image(systemName: "checkmark").font(.system(size: 16, weight: .bold)).foregroundColor(.green)
                    } else {
                        Text(emoji).font(.system(size: 18))
                    }
                }
                VStack(alignment: .leading, spacing: 2) {
                    Text(title).font(.system(size: 14, weight: .bold)).foregroundColor(done ? .white.opacity(0.4) : .white)
                    Text(subtitle).font(.system(size: 10, weight: .medium)).foregroundColor(.white.opacity(0.25))
                }
                Spacer()
                Image(systemName: "chevron.right").font(.system(size: 11)).foregroundColor(.white.opacity(0.1))
            }
            .padding(12).background(RoundedRectangle(cornerRadius: 12).fill(Color.white.opacity(0.02)))
        }
        .buttonStyle(.plain)
    }
    
    // MARK: - Digital Rules
    
    private var digitalRulesCard: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("📵 DIGITAL OWNERSHIP RULES (PERMANENT)").font(.system(size: 9, weight: .black)).tracking(1).foregroundColor(.white.opacity(0.2))
            
            ruleRow("No phone first 60 minutes of day")
            ruleRow("No phone last 60 minutes of night")
            ruleRow("If you can't sit 20 min without touching it, the phone still owns you")
        }
        .padding(14).background(RoundedRectangle(cornerRadius: 12).fill(Color.red.opacity(0.03)))
        .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.red.opacity(0.08), lineWidth: 1))
    }
    
    private func ruleRow(_ text: String) -> some View {
        HStack(spacing: 8) {
            Circle().fill(Color.red.opacity(0.4)).frame(width: 5, height: 5)
            Text(text).font(.system(size: 11, weight: .medium)).foregroundColor(.white.opacity(0.45))
        }
    }
    
    // MARK: - Protocol Content
    
    private let socializationSections: [(String, String)] = [
        ("The Protocol", "Socialization is fuel or friction. For the first 30 to 60 days:\n\n• Schedule ALL social time deliberately\n• No spontaneous \"yes\"\n• No weekday late-night drift\n• No social media scroll masquerading as connection\n• Brunch twice per weekend max"),
        ("3-Filter Rule", "Every social interaction must pass:\n\n1. Does this recharge me?\n2. Does this strengthen meaningful bonds?\n3. Does this align with my goals or values?\n\nIf not — 404 Error. Not Found."),
        ("You're Not Antisocial", "You are temporarily reallocating energy. After stability returns, you loosen constraints. Controlled expansion, not isolation.\n\nThe goal is intentionality, not hermit mode."),
    ]
    
    private let newsProtocolSections: [(String, String)] = [
        ("Headlines Only Mode", "During reset phase:\n\n• Headlines from 1-2 neutral aggregators only\n• 5 minutes, once per day\n• No scrolling comment sections\n• No autoplay opinion segments\n• No algorithmic feed browsing\n• No reactive reposting"),
        ("3-Filter Discernment Test", "When you see a headline, ask:\n\n1. Is this actionable for me?\n2. Does this affect my immediate environment?\n3. Is this verified by multiple credible sources?\n\nIf the answer is No across the board:\n#404Error — Not Found. Not Relevant. Not My Energy."),
        ("Emotional Spike Rule", "If a headline triggers anger, fear, tribal pride, or the urge to argue — PAUSE.\n\nThat is your limbic system being pinged.\n\n10-minute rule: No reacting within 10 minutes of emotional activation. Clarity beats immediacy."),
        ("The 'You'll Know' Principle", "Truly system-level events — economic shifts, policy changes, natural disasters — will be reported repeatedly across multiple domains.\n\nImportant events persist. Noise evaporates.\n\nYou do not need to monitor every micro-controversy."),
    ]
    
    private let sayingNoSections: [(String, String)] = [
        ("The 4 Gates", "When asked for something, evaluate:\n\n1. Does this align with my goals?\n2. Is this high ROI?\n3. Is this urgent AND important?\n4. Would I regret saying yes?\n\nTwo \"No\" answers = decline. No internal court case."),
        ("Scripts (Memorize These)", "• \"I can't commit right now — focusing on my own priorities.\"\n\n• \"That doesn't align with my current goals.\"\n\n• \"Appreciate the ask, but I'm protecting my energy for what matters most.\"\n\nNo explanations. No over-justification. No apology tour."),
        ("Why This Matters", "Every unprotected \"Yes\" is a stolen hour from your P0 work.\n\nEvery protected \"No\" trains the world that your time has value.\n\nSocial pushback is expected. It confirms the boundary is working."),
    ]
}

// MARK: - ═══════════════════════════════════════════════════
// STILLNESS TIMER
// ═══════════════════════════════════════════════════════════

struct StillnessTimerView: View {
    
    @StateObject private var engine = SunFlowStateEngine.shared
    @Environment(\.dismiss) var dismiss
    @State private var timeRemaining: Int = 300
    @State private var isRunning = false
    @State private var isComplete = false
    @State private var timer: Timer?
    
    private var targetMinutes: Int { engine.bootcamp.stillnessMinutesTarget }
    
    var body: some View {
        ZStack {
            Color(hex: "#0a0a0f").ignoresSafeArea()
            
            VStack(spacing: 30) {
                Spacer()
                
                if isComplete {
                    completeView
                } else {
                    timerView
                }
                
                Spacer()
            }
        }
        .onAppear { timeRemaining = targetMinutes * 60 }
        .onDisappear { timer?.invalidate() }
    }
    
    private var timerView: some View {
        VStack(spacing: 24) {
            Text("🧘").font(.system(size: 50))
            
            Text("The \(targetMinutes)-Minute Sit")
                .font(.system(size: 22, weight: .black)).foregroundColor(.white)
            
            Text("No phone. No music. No journaling. Just sit.\nAgitation is withdrawal, not weakness.")
                .font(.system(size: 12, weight: .medium)).foregroundColor(.white.opacity(0.35))
                .multilineTextAlignment(.center).padding(.horizontal, 30)
            
            // Timer circle
            ZStack {
                Circle()
                    .stroke(Color.purple.opacity(0.1), lineWidth: 4)
                    .frame(width: 180, height: 180)
                
                let total = Double(targetMinutes * 60)
                let progress = 1.0 - (Double(timeRemaining) / total)
                Circle()
                    .trim(from: 0, to: progress)
                    .stroke(Color.purple, style: StrokeStyle(lineWidth: 4, lineCap: .round))
                    .frame(width: 180, height: 180)
                    .rotationEffect(.degrees(-90))
                
                VStack(spacing: 4) {
                    Text(timeString)
                        .font(.system(size: 44, weight: .thin, design: .rounded))
                        .foregroundColor(.white)
                        .monospacedDigit()
                    Text(isRunning ? "breathing..." : "ready")
                        .font(.system(size: 11, weight: .medium)).foregroundColor(.purple.opacity(0.5))
                }
            }
            
            Button {
                if isRunning {
                    pauseTimer()
                } else {
                    startTimer()
                }
            } label: {
                Text(isRunning ? "Pause" : "Begin")
                    .font(.system(size: 16, weight: .bold)).foregroundColor(.black)
                    .padding(.horizontal, 50).padding(.vertical, 14)
                    .background(Capsule().fill(Color.purple))
            }
        }
    }
    
    private var completeView: some View {
        VStack(spacing: 20) {
            Text("✓").font(.system(size: 60, weight: .thin)).foregroundColor(.purple)
            Text("Stillness Complete")
                .font(.system(size: 22, weight: .black)).foregroundColor(.white)
            Text("You just reclaimed \(targetMinutes) minutes of sovereign attention.\nThis is the foundation of autonomy.")
                .font(.system(size: 12, weight: .medium)).foregroundColor(.white.opacity(0.4))
                .multilineTextAlignment(.center).padding(.horizontal, 30)
            
            Button { dismiss() } label: {
                Text("Return").font(.system(size: 15, weight: .bold)).foregroundColor(.black)
                    .padding(.horizontal, 40).padding(.vertical, 12)
                    .background(Capsule().fill(Color.purple))
            }
        }
    }
    
    private var timeString: String {
        let mins = timeRemaining / 60
        let secs = timeRemaining % 60
        return String(format: "%d:%02d", mins, secs)
    }
    
    private func startTimer() {
        isRunning = true
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            if timeRemaining > 0 {
                timeRemaining -= 1
            } else {
                timer?.invalidate()
                isRunning = false
                isComplete = true
                Task { @MainActor in
                    engine.completeStillness(day: engine.bootcamp.currentDay)
                    HapticManager.shared.heavy()
                }
            }
        }
    }
    
    private func pauseTimer() {
        isRunning = false
        timer?.invalidate()
    }
}

// MARK: - ═══════════════════════════════════════════════════
// CONTROL PURGE VIEW — 3-column exercise
// ═══════════════════════════════════════════════════════════

struct ControlPurgeView: View {
    
    @StateObject private var engine = SunFlowStateEngine.shared
    @Environment(\.dismiss) var dismiss
    @State private var newItem = ""
    @State private var selectedColumn: ControlColumn = .control
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(hex: "#0a0a0f").ignoresSafeArea()
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 16) {
                        Text("Write three columns. Everything in \"Release\" gets mentally released with:\n\"I release this. It has no power over my next action.\"")
                            .font(.system(size: 11, weight: .medium)).foregroundColor(.white.opacity(0.35))
                            .multilineTextAlignment(.center).padding(.top, 10)
                        
                        // Add item
                        VStack(spacing: 10) {
                            TextField("", text: $newItem, prompt: Text("What's on your mind?").foregroundColor(.white.opacity(0.15)))
                                .font(.system(size: 14)).foregroundColor(.white)
                                .padding(12).background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.05)))
                            
                            HStack(spacing: 6) {
                                ForEach(ControlColumn.allCases, id: \.self) { col in
                                    Button { selectedColumn = col } label: {
                                        HStack(spacing: 4) {
                                            Text(col.emoji).font(.system(size: 10))
                                            Text(col.rawValue).font(.system(size: 9, weight: selectedColumn == col ? .bold : .medium))
                                        }
                                        .foregroundColor(selectedColumn == col ? .black : col.color.opacity(0.7))
                                        .padding(.horizontal, 8).padding(.vertical, 6)
                                        .background(Capsule().fill(selectedColumn == col ? col.color : col.color.opacity(0.08)))
                                    }
                                }
                                
                                Spacer()
                                
                                Button {
                                    guard !newItem.isEmpty else { return }
                                    engine.addControlItem(ControlPurgeItem(text: newItem, column: selectedColumn))
                                    newItem = ""
                                } label: {
                                    Text("Add").font(.system(size: 12, weight: .bold)).foregroundColor(.black)
                                        .padding(.horizontal, 16).padding(.vertical, 6)
                                        .background(Capsule().fill(Color(red: 1.0, green: 0.85, blue: 0.3)))
                                }
                            }
                        }
                        .padding(12).background(RoundedRectangle(cornerRadius: 12).fill(Color.white.opacity(0.02)))
                        
                        // Columns
                        ForEach(ControlColumn.allCases, id: \.self) { col in
                            let items = engine.controlPurgeItems.filter { $0.column == col }
                            if !items.isEmpty {
                                VStack(alignment: .leading, spacing: 6) {
                                    HStack(spacing: 6) {
                                        Text(col.emoji).font(.system(size: 12))
                                        Text(col.rawValue.uppercased()).font(.system(size: 9, weight: .black)).tracking(1).foregroundColor(col.color.opacity(0.6))
                                    }
                                    ForEach(items) { item in
                                        HStack(spacing: 8) {
                                            Text(item.text).font(.system(size: 12, weight: .medium)).foregroundColor(.white.opacity(0.6))
                                            Spacer()
                                            if col == .release {
                                                Text("released").font(.system(size: 8, weight: .bold)).foregroundColor(.red.opacity(0.4))
                                            }
                                        }
                                        .padding(8).background(RoundedRectangle(cornerRadius: 6).fill(col.color.opacity(0.03)))
                                    }
                                }
                            }
                        }
                        
                        // Complete button
                        if !engine.bootcamp.controlPurgeDone && !engine.controlPurgeItems.isEmpty {
                            Button {
                                engine.completeBootcampExercise(.controlPurge)
                                dismiss()
                            } label: {
                                Text("Complete Control Purge ✓").font(.system(size: 14, weight: .bold)).foregroundColor(.black)
                                    .frame(maxWidth: .infinity).padding(.vertical, 12)
                                    .background(RoundedRectangle(cornerRadius: 12).fill(Color.green))
                            }
                        }
                        
                        Spacer(minLength: 60)
                    }
                    .padding(.horizontal, 16)
                }
            }
            .navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) { Text("Control Purge").font(.system(size: 16, weight: .bold)).foregroundColor(.white) }
                ToolbarItem(placement: .navigationBarTrailing) { Button("Done") { dismiss() }.foregroundColor(Color(red: 1.0, green: 0.85, blue: 0.3)) }
            }
            .toolbarBackground(Color(hex: "#0a0a0f"), for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
        }
    }
}

// MARK: - ═══════════════════════════════════════════════════
// FEAR PURGE VIEW
// ═══════════════════════════════════════════════════════════

struct FearPurgeView: View {
    
    @StateObject private var engine = SunFlowStateEngine.shared
    @Environment(\.dismiss) var dismiss
    @State private var newFear = ""
    @State private var isAbstract = true
    @State private var action: FearAction = .release
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(hex: "#0a0a0f").ignoresSafeArea()
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 16) {
                        Text("List every recurring fear. Ask: \"Immediate/concrete or abstract/imagined?\"\nAbstract fears get zero daily bandwidth.")
                            .font(.system(size: 11, weight: .medium)).foregroundColor(.white.opacity(0.35))
                            .multilineTextAlignment(.center).padding(.top, 10)
                        
                        // Add
                        VStack(spacing: 10) {
                            TextField("", text: $newFear, prompt: Text("Name a fear...").foregroundColor(.white.opacity(0.15)))
                                .font(.system(size: 14)).foregroundColor(.white)
                                .padding(12).background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.05)))
                            
                            HStack {
                                Button { isAbstract = false } label: {
                                    Text("🎯 Concrete").font(.system(size: 10, weight: !isAbstract ? .bold : .medium))
                                        .foregroundColor(!isAbstract ? .black : .white.opacity(0.5))
                                        .padding(.horizontal, 10).padding(.vertical, 6)
                                        .background(Capsule().fill(!isAbstract ? Color(red: 1.0, green: 0.85, blue: 0.3) : Color.white.opacity(0.05)))
                                }
                                Button { isAbstract = true } label: {
                                    Text("💭 Abstract/Imagined").font(.system(size: 10, weight: isAbstract ? .bold : .medium))
                                        .foregroundColor(isAbstract ? .black : .white.opacity(0.5))
                                        .padding(.horizontal, 10).padding(.vertical, 6)
                                        .background(Capsule().fill(isAbstract ? .red : Color.white.opacity(0.05)))
                                }
                                Spacer()
                            }
                            
                            HStack {
                                ForEach(FearAction.allCases, id: \.self) { a in
                                    Button { action = a } label: {
                                        Text(a.rawValue).font(.system(size: 10, weight: action == a ? .bold : .medium))
                                            .foregroundColor(action == a ? .black : .white.opacity(0.5))
                                            .padding(.horizontal, 10).padding(.vertical, 6)
                                            .background(Capsule().fill(action == a ? (a == .release ? Color.red : Color.green) : Color.white.opacity(0.05)))
                                    }
                                }
                                Spacer()
                                Button {
                                    guard !newFear.isEmpty else { return }
                                    engine.addFearItem(FearPurgeItem(fear: newFear, isAbstract: isAbstract, action: action))
                                    newFear = ""
                                } label: {
                                    Text("Add").font(.system(size: 12, weight: .bold)).foregroundColor(.black)
                                        .padding(.horizontal, 16).padding(.vertical, 6)
                                        .background(Capsule().fill(Color(red: 1.0, green: 0.85, blue: 0.3)))
                                }
                            }
                        }
                        .padding(12).background(RoundedRectangle(cornerRadius: 12).fill(Color.white.opacity(0.02)))
                        
                        // Listed fears
                        ForEach(engine.fearPurgeItems) { item in
                            HStack(spacing: 10) {
                                Text(item.isAbstract ? "💭" : "🎯").font(.system(size: 14))
                                VStack(alignment: .leading, spacing: 2) {
                                    Text(item.fear).font(.system(size: 12, weight: .medium))
                                        .foregroundColor(item.action == .release ? .white.opacity(0.3) : .white.opacity(0.7))
                                        .strikethrough(item.action == .release)
                                    Text(item.action.rawValue).font(.system(size: 9, weight: .bold))
                                        .foregroundColor(item.action == .release ? .red.opacity(0.5) : .green.opacity(0.5))
                                }
                                Spacer()
                            }
                            .padding(8).background(RoundedRectangle(cornerRadius: 8).fill(Color.white.opacity(0.02)))
                        }
                        
                        if !engine.bootcamp.fearPurgeDone && !engine.fearPurgeItems.isEmpty {
                            Button {
                                engine.completeBootcampExercise(.fearPurge)
                                dismiss()
                            } label: {
                                Text("Complete Fear Purge ✓").font(.system(size: 14, weight: .bold)).foregroundColor(.black)
                                    .frame(maxWidth: .infinity).padding(.vertical, 12)
                                    .background(RoundedRectangle(cornerRadius: 12).fill(Color.green))
                            }
                        }
                        
                        Spacer(minLength: 60)
                    }
                    .padding(.horizontal, 16)
                }
            }
            .navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) { Text("Fear Purge").font(.system(size: 16, weight: .bold)).foregroundColor(.white) }
                ToolbarItem(placement: .navigationBarTrailing) { Button("Done") { dismiss() }.foregroundColor(Color(red: 1.0, green: 0.85, blue: 0.3)) }
            }
            .toolbarBackground(Color(hex: "#0a0a0f"), for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
        }
    }
}

// MARK: - ═══════════════════════════════════════════════════
// DIGITAL PURGE CHECKLIST
// ═══════════════════════════════════════════════════════════

struct DigitalPurgeView: View {
    
    @StateObject private var engine = SunFlowStateEngine.shared
    @Environment(\.dismiss) var dismiss
    @State private var checks: [Bool] = Array(repeating: false, count: 5)
    
    private let items = [
        "Delete/uninstall 50% of unused apps",
        "Unfollow every account that triggers comparison, anger, or mindless scrolling",
        "Notifications OFF except calendar + 1 VIP contact",
        "Social apps off home screen (or deleted during reset)",
        "Set one social media check window per day (5-10 min max)",
    ]
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(hex: "#0a0a0f").ignoresSafeArea()
                
                VStack(spacing: 20) {
                    Text("📵").font(.system(size: 44)).padding(.top, 20)
                    Text("404 Digital Purge").font(.system(size: 20, weight: .black)).foregroundColor(.white)
                    Text("Do these right now. Not tomorrow. Now.")
                        .font(.system(size: 12, weight: .medium)).foregroundColor(.red.opacity(0.6))
                    
                    VStack(spacing: 12) {
                        ForEach(0..<items.count, id: \.self) { i in
                            Button { checks[i].toggle() } label: {
                                HStack(spacing: 12) {
                                    Image(systemName: checks[i] ? "checkmark.circle.fill" : "circle")
                                        .font(.system(size: 20)).foregroundColor(checks[i] ? .green : .white.opacity(0.15))
                                    Text(items[i]).font(.system(size: 13, weight: .medium))
                                        .foregroundColor(checks[i] ? .white.opacity(0.35) : .white.opacity(0.7))
                                        .strikethrough(checks[i])
                                        .multilineTextAlignment(.leading)
                                    Spacer()
                                }
                                .padding(12).background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.02)))
                            }
                        }
                    }
                    .padding(.horizontal, 16)
                    
                    let allDone = checks.allSatisfy { $0 }
                    if allDone && !engine.bootcamp.digitalPurgeDone {
                        Button {
                            engine.completeBootcampExercise(.digitalPurge)
                            dismiss()
                        } label: {
                            Text("Purge Complete ✓").font(.system(size: 15, weight: .bold)).foregroundColor(.black)
                                .frame(maxWidth: .infinity).padding(.vertical, 14)
                                .background(RoundedRectangle(cornerRadius: 14).fill(Color.green))
                        }
                        .padding(.horizontal, 16)
                    }
                    
                    Spacer()
                }
            }
            .navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) { Text("Digital Purge").font(.system(size: 16, weight: .bold)).foregroundColor(.white) }
                ToolbarItem(placement: .navigationBarTrailing) { Button("Done") { dismiss() }.foregroundColor(Color(red: 1.0, green: 0.85, blue: 0.3)) }
            }
            .toolbarBackground(Color(hex: "#0a0a0f"), for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
        }
    }
}

// MARK: - ═══════════════════════════════════════════════════
// PROTOCOL READ VIEW — Reusable for Socialization, News, Saying No
// ═══════════════════════════════════════════════════════════

struct ProtocolReadView: View {
    
    let exercise: BootcampExercise
    let title: String
    let sections: [(String, String)]
    
    @StateObject private var engine = SunFlowStateEngine.shared
    @Environment(\.dismiss) var dismiss
    @State private var currentSection = 0
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(hex: "#0a0a0f").ignoresSafeArea()
                
                VStack(spacing: 0) {
                    // Dots
                    HStack(spacing: 6) {
                        ForEach(0..<sections.count, id: \.self) { i in
                            Circle().fill(i <= currentSection ? Color(red: 1.0, green: 0.85, blue: 0.3) : Color.white.opacity(0.1)).frame(width: 6, height: 6)
                        }
                    }
                    .padding(.top, 10)
                    
                    TabView(selection: $currentSection) {
                        ForEach(Array(sections.enumerated()), id: \.offset) { index, section in
                            ScrollView(showsIndicators: false) {
                                VStack(alignment: .leading, spacing: 14) {
                                    Text(section.0).font(.system(size: 20, weight: .black)).foregroundColor(Color(red: 1.0, green: 0.85, blue: 0.3))
                                    Text(section.1).font(.system(size: 13, weight: .medium)).foregroundColor(.white.opacity(0.65)).lineSpacing(5)
                                    Spacer(minLength: 100)
                                }
                                .padding(.horizontal, 20).padding(.top, 20)
                            }
                            .tag(index)
                        }
                    }
                    .tabViewStyle(.page(indexDisplayMode: .never))
                    
                    // Bottom
                    HStack {
                        if currentSection > 0 {
                            Button { withAnimation { currentSection -= 1 } } label: {
                                Text("← Back").font(.system(size: 13, weight: .bold)).foregroundColor(.white.opacity(0.4))
                            }
                        }
                        Spacer()
                        if currentSection < sections.count - 1 {
                            Button { withAnimation { currentSection += 1 } } label: {
                                Text("Next →").font(.system(size: 13, weight: .bold)).foregroundColor(Color(red: 1.0, green: 0.85, blue: 0.3))
                            }
                        } else {
                            Button {
                                engine.completeBootcampExercise(exercise)
                                dismiss()
                            } label: {
                                Text("Complete ✓").font(.system(size: 14, weight: .bold)).foregroundColor(.black)
                                    .padding(.horizontal, 24).padding(.vertical, 10)
                                    .background(Capsule().fill(Color.green))
                            }
                        }
                    }
                    .padding(.horizontal, 20).padding(.vertical, 14)
                }
            }
            .navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) { Text(title).font(.system(size: 15, weight: .bold)).foregroundColor(.white).lineLimit(1) }
                ToolbarItem(placement: .navigationBarTrailing) { Button("Done") { dismiss() }.foregroundColor(Color(red: 1.0, green: 0.85, blue: 0.3)) }
            }
            .toolbarBackground(Color(hex: "#0a0a0f"), for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
        }
    }
}

// MARK: - Helper: Stillness Day Dot
struct StillnessDayDot: View {
    let day: Int
    let isDone: Bool
    let isCurrentDay: Bool

    var body: some View {
        ZStack {
            Circle()
                .fill(isDone ? Color.purple : Color.white.opacity(0.06))
                .frame(width: 18, height: 18)
            if isDone {
                Text("✓")
                    .font(.system(size: 8, weight: .black))
                    .foregroundColor(.white)
            }
        }
        .overlay(
            Group {
                if !isDone && isCurrentDay {
                    Circle().stroke(Color.purple.opacity(0.5), lineWidth: 1.5)
                }
            }
        )
    }
}
