// ImpulseShieldView.swift
// IMPULSE SHIELD — "The 5-Second Firewall"
// ☀️ SunFlow: Reignited — Second Brain Module
//
// "ADHD impulse control isn't a moral failing.
//  It's a prefrontal cortex that can't generate
//  the braking signal fast enough. This tool provides
//  EXTERNAL brakes — a pause between impulse and action."
//
// Features:
// - 5-second forced pause screen
// - "Is this urgent?" decision framework
// - Energy cost calculator
// - 24-hour wait timer for purchases
// - Late-night impulse detection
// - Pattern tracking (when/why/what)
// - Post-rejection/low-mood flagging

import SwiftUI

struct ImpulseShieldView: View {
    
    @Environment(\.dismiss) var dismiss
    @State private var phase: ShieldPhase = .landing
    @State private var impulseText: String = ""
    @State private var impulseType: ImpulseType = .purchase
    @State private var urgencyAnswer: Bool? = nil
    @State private var energyCost: Int = 3
    @State private var waitTimerEnd: Date? = nil
    @State private var countdownSeconds: Int = 5
    @State private var countdownActive: Bool = false
    @State private var impulseLog: [ImpulseEntry] = []
    @State private var showLog: Bool = false
    @State private var moodAtImpulse: Int = 5
    
    private let accent = Color(red: 1.0, green: 0.3, blue: 0.3) // Warning red
    private let calm = Color(red: 0.3, green: 0.8, blue: 0.6)
    private let shield = Color(red: 0.4, green: 0.6, blue: 1.0)
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(red: 0.02, green: 0.02, blue: 0.05).ignoresSafeArea()
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 16) {
                        switch phase {
                        case .landing: landingView
                        case .countdown: countdownView
                        case .questions: questionView
                        case .energyCost: energyCostView
                        case .waitTimer: waitTimerView
                        case .approved: approvedView
                        case .blocked: blockedView
                        case .log: logView
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
                    Text("🛡️ Impulse Shield").font(.system(size: 17, weight: .bold)).foregroundColor(.white)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button { withAnimation { phase = .log } } label: {
                        Image(systemName: "list.bullet.rectangle").font(.system(size: 14)).foregroundColor(.white.opacity(0.3))
                    }
                }
            }
            .onAppear { loadLog() }
        }
    }
    
    // MARK: - Landing
    
    private var landingView: some View {
        VStack(spacing: 18) {
            Spacer().frame(height: 20)
            Text("🛡️").font(.system(size: 56)).shadow(color: shield.opacity(0.4), radius: 20)
            Text("IMPULSE SHIELD").font(.system(size: 24, weight: .black)).foregroundColor(.white)
            Text("Pause between impulse and action.\n5 seconds can save you hours of regret.")
                .font(.system(size: 12, weight: .medium)).foregroundColor(.white.opacity(0.35)).multilineTextAlignment(.center)
            
            // What's the impulse?
            VStack(alignment: .leading, spacing: 6) {
                Text("WHAT DO YOU WANT TO DO?").font(.system(size: 9, weight: .black)).tracking(1).foregroundColor(.white.opacity(0.15))
                
                TextField("e.g. Buy this thing, text my ex, quit my job...", text: $impulseText)
                    .font(.system(size: 13, weight: .medium)).foregroundColor(.white)
                    .padding(12).background(RoundedRectangle(cornerRadius: 8).fill(Color.white.opacity(0.03)))
                    .overlay(RoundedRectangle(cornerRadius: 8).stroke(accent.opacity(0.15), lineWidth: 1))
            }
            
            // Type selector
            VStack(alignment: .leading, spacing: 6) {
                Text("TYPE").font(.system(size: 9, weight: .black)).tracking(1).foregroundColor(.white.opacity(0.15))
                
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())], spacing: 6) {
                    ForEach(ImpulseType.allCases, id: \.self) { type in
                        Button { impulseType = type } label: {
                            VStack(spacing: 3) {
                                Text(type.emoji).font(.system(size: 16))
                                Text(type.label).font(.system(size: 8, weight: .bold))
                                    .foregroundColor(impulseType == type ? .white : .white.opacity(0.2))
                            }
                            .frame(maxWidth: .infinity).padding(.vertical, 8)
                            .background(RoundedRectangle(cornerRadius: 6)
                                .fill(impulseType == type ? shield.opacity(0.15) : Color.white.opacity(0.015)))
                        }
                    }
                }
            }
            
            // Current mood
            VStack(alignment: .leading, spacing: 6) {
                Text("CURRENT MOOD (1-10)").font(.system(size: 9, weight: .black)).tracking(1).foregroundColor(.white.opacity(0.15))
                HStack {
                    Text(moodEmoji(moodAtImpulse)).font(.system(size: 16))
                    Slider(value: Binding(get: { Double(moodAtImpulse) }, set: { moodAtImpulse = Int($0) }),
                           in: 1...10, step: 1).tint(shield)
                    Text("\(moodAtImpulse)").font(.system(size: 12, weight: .black)).foregroundColor(shield).frame(width: 20)
                }
            }
            
            // Activate shield
            Button {
                guard !impulseText.trimmingCharacters(in: .whitespaces).isEmpty else { return }
                startCountdown()
            } label: {
                Text("🛡️ ACTIVATE SHIELD").font(.system(size: 16, weight: .black)).tracking(1)
                    .foregroundColor(.black).padding(.vertical, 14).frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 12).fill(shield))
            }
            .disabled(impulseText.trimmingCharacters(in: .whitespaces).isEmpty)
            
            // Time-based warning
            let hour = Calendar.current.component(.hour, from: Date())
            if hour >= 22 || hour <= 5 {
                HStack(spacing: 6) {
                    Text("⚠️").font(.system(size: 12))
                    Text("LATE NIGHT IMPULSE DETECTED — Your decision-making is compromised after 10pm. Impulse purchases increase 67% at night.")
                        .font(.system(size: 9, weight: .medium)).foregroundColor(accent.opacity(0.5))
                }
                .padding(10).background(RoundedRectangle(cornerRadius: 8).fill(accent.opacity(0.04)))
            }
            
            // Stats
            if !impulseLog.isEmpty {
                let blocked = impulseLog.filter { $0.outcome == .blocked }.count
                let total = impulseLog.count
                HStack(spacing: 12) {
                    statBadge("\(total)", "Total", shield)
                    statBadge("\(blocked)", "Blocked", calm)
                    statBadge("\(Int(Double(blocked) / max(1, Double(total)) * 100))%", "Block Rate", accent)
                }
            }
            
            neuroscience
        }
    }
    
    // MARK: - Countdown (Forced 5-Second Pause)
    
    private var countdownView: some View {
        VStack(spacing: 24) {
            Spacer().frame(height: 40)
            
            Text("⏳").font(.system(size: 50))
            
            Text("PAUSE").font(.system(size: 28, weight: .black)).foregroundColor(accent)
            
            ZStack {
                Circle().stroke(accent.opacity(0.1), lineWidth: 8).frame(width: 120, height: 120)
                Circle().trim(from: 0, to: CGFloat(countdownSeconds) / 5.0)
                    .stroke(accent, style: StrokeStyle(lineWidth: 8, lineCap: .round))
                    .frame(width: 120, height: 120).rotationEffect(.degrees(-90))
                    .animation(.linear(duration: 1), value: countdownSeconds)
                
                Text("\(countdownSeconds)").font(.system(size: 44, weight: .black, design: .monospaced)).foregroundColor(.white)
            }
            
            Text("Take a breath.\nYour prefrontal cortex needs\n5 seconds to engage.")
                .font(.system(size: 12, weight: .medium)).foregroundColor(.white.opacity(0.3)).multilineTextAlignment(.center)
            
            Text("\"Between stimulus and response there is a space.\nIn that space is our freedom.\"")
                .font(.system(size: 10, weight: .medium, design: .serif)).foregroundColor(.white.opacity(0.15))
                .italic().multilineTextAlignment(.center).padding(.top, 8)
        }
    }
    
    // MARK: - Questions Phase
    
    private var questionView: some View {
        VStack(spacing: 16) {
            Text("🤔").font(.system(size: 40))
            Text("CHECK YOURSELF").font(.system(size: 18, weight: .black)).foregroundColor(.white)
            
            // Display what they want to do
            VStack(spacing: 3) {
                Text("YOU WANT TO:").font(.system(size: 9, weight: .black)).tracking(1).foregroundColor(.white.opacity(0.15))
                Text(impulseText).font(.system(size: 14, weight: .bold)).foregroundColor(shield)
            }
            .padding(10).background(RoundedRectangle(cornerRadius: 8).fill(shield.opacity(0.04)))
            
            // Question 1: Is this urgent?
            questionCard("Is this TRULY urgent?",
                         "Will something bad happen if you DON'T do this in the next 24 hours?",
                         yesAction: { urgencyAnswer = true },
                         noAction: { urgencyAnswer = false })
            
            if let urgent = urgencyAnswer {
                if urgent {
                    VStack(spacing: 6) {
                        Text("If it's truly urgent, go ahead — but check:").font(.system(size: 11, weight: .medium)).foregroundColor(.white.opacity(0.4))
                        questionCard("Have you eaten and slept?",
                                     "Hungry/tired brains make terrible decisions.",
                                     yesAction: { withAnimation { phase = .energyCost } },
                                     noAction: {
                                        logImpulse(outcome: .blocked, reason: "Hungry/tired — bad decision state")
                                        withAnimation { phase = .blocked }
                                     })
                    }
                } else {
                    // Not urgent — recommend wait
                    VStack(spacing: 8) {
                        Text("NOT urgent. Your future self will thank you.").font(.system(size: 12, weight: .bold)).foregroundColor(calm)
                        
                        HStack(spacing: 8) {
                            Button {
                                setWaitTimer()
                                logImpulse(outcome: .delayed, reason: "24-hour wait timer set")
                                withAnimation { phase = .waitTimer }
                            } label: {
                                VStack(spacing: 3) {
                                    Text("⏰").font(.system(size: 18))
                                    Text("Wait 24h").font(.system(size: 10, weight: .bold)).foregroundColor(calm)
                                }
                                .frame(maxWidth: .infinity).padding(12)
                                .background(RoundedRectangle(cornerRadius: 8).fill(calm.opacity(0.1)))
                            }
                            
                            Button {
                                logImpulse(outcome: .blocked, reason: "Chose to skip entirely")
                                withAnimation { phase = .blocked }
                            } label: {
                                VStack(spacing: 3) {
                                    Text("🚫").font(.system(size: 18))
                                    Text("Skip It").font(.system(size: 10, weight: .bold)).foregroundColor(.white.opacity(0.3))
                                }
                                .frame(maxWidth: .infinity).padding(12)
                                .background(RoundedRectangle(cornerRadius: 8).fill(Color.white.opacity(0.02)))
                            }
                            
                            Button {
                                withAnimation { phase = .energyCost }
                            } label: {
                                VStack(spacing: 3) {
                                    Text("➡️").font(.system(size: 18))
                                    Text("Proceed").font(.system(size: 10, weight: .bold)).foregroundColor(.white.opacity(0.3))
                                }
                                .frame(maxWidth: .infinity).padding(12)
                                .background(RoundedRectangle(cornerRadius: 8).fill(Color.white.opacity(0.02)))
                            }
                        }
                    }
                }
            }
        }
    }
    
    // MARK: - Energy Cost
    
    private var energyCostView: some View {
        VStack(spacing: 16) {
            Text("⚡").font(.system(size: 40))
            Text("ENERGY COST CHECK").font(.system(size: 18, weight: .black)).foregroundColor(.white)
            
            Text("How much energy will this take from your day?")
                .font(.system(size: 12, weight: .medium)).foregroundColor(.white.opacity(0.4))
            
            HStack(spacing: 6) {
                ForEach(1...5, id: \.self) { level in
                    Button { energyCost = level } label: {
                        VStack(spacing: 3) {
                            Text(costEmoji(level)).font(.system(size: 18))
                            Text(costLabel(level)).font(.system(size: 7, weight: .bold))
                                .foregroundColor(energyCost == level ? .white : .white.opacity(0.2))
                        }
                        .frame(maxWidth: .infinity).padding(.vertical, 8)
                        .background(RoundedRectangle(cornerRadius: 6)
                            .fill(energyCost == level ? costColor(level).opacity(0.15) : Color.white.opacity(0.015)))
                    }
                }
            }
            
            if energyCost >= 4 {
                HStack(spacing: 6) {
                    Text("⚠️").font(.system(size: 12))
                    Text("HIGH ENERGY COST. With ADHD, you have limited executive function fuel. Is this the best use of it today?")
                        .font(.system(size: 10, weight: .medium)).foregroundColor(accent.opacity(0.5))
                }
                .padding(10).background(RoundedRectangle(cornerRadius: 8).fill(accent.opacity(0.04)))
            }
            
            HStack(spacing: 8) {
                Button {
                    logImpulse(outcome: .approved, reason: "Passed all checks")
                    withAnimation { phase = .approved }
                } label: {
                    Text("✅ Do It").font(.system(size: 13, weight: .bold))
                        .foregroundColor(.black).padding(12).frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 8).fill(calm))
                }
                
                Button {
                    setWaitTimer()
                    logImpulse(outcome: .delayed, reason: "Wait 24h after energy check")
                    withAnimation { phase = .waitTimer }
                } label: {
                    Text("⏰ Wait 24h").font(.system(size: 13, weight: .bold))
                        .foregroundColor(shield).padding(12).frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 8).fill(shield.opacity(0.1)))
                }
            }
        }
    }
    
    // MARK: - Wait Timer
    
    private var waitTimerView: some View {
        VStack(spacing: 16) {
            Text("⏰").font(.system(size: 50))
            Text("24-HOUR WAIT ACTIVE").font(.system(size: 18, weight: .black)).foregroundColor(shield)
            
            if let end = waitTimerEnd {
                let remaining = end.timeIntervalSinceNow
                if remaining > 0 {
                    Text("Come back: \(end.formatted(.dateTime.weekday().hour().minute()))")
                        .font(.system(size: 13, weight: .bold)).foregroundColor(.white)
                    
                    Text("If you still want to do this in 24 hours,\nit's probably a real decision — not an impulse.")
                        .font(.system(size: 11, weight: .medium)).foregroundColor(.white.opacity(0.3)).multilineTextAlignment(.center)
                } else {
                    Text("Timer complete! If you still want this, go ahead.")
                        .font(.system(size: 13, weight: .bold)).foregroundColor(calm)
                }
            }
            
            Text("📊 Studies show: 72% of impulse purchases are regretted within 48 hours. For ADHD adults, that number rises to 85%.")
                .font(.system(size: 10, weight: .medium)).foregroundColor(.white.opacity(0.2)).multilineTextAlignment(.center)
            
            Button { resetShield() } label: {
                Text("Done").font(.system(size: 14, weight: .bold)).foregroundColor(.white.opacity(0.3))
                    .padding(12).frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.02)))
            }
        }
    }
    
    // MARK: - Approved
    
    private var approvedView: some View {
        VStack(spacing: 16) {
            Text("✅").font(.system(size: 50))
            Text("SHIELD PASSED").font(.system(size: 20, weight: .black)).foregroundColor(calm)
            Text("You paused, you checked, you decided.\nThat's not impulsive — that's intentional.")
                .font(.system(size: 12, weight: .medium)).foregroundColor(.white.opacity(0.4)).multilineTextAlignment(.center)
            
            Text("Go do: \(impulseText)").font(.system(size: 14, weight: .bold)).foregroundColor(.white)
                .padding(12).background(RoundedRectangle(cornerRadius: 8).fill(Color.white.opacity(0.02)))
            
            Button { resetShield() } label: {
                Text("Done").font(.system(size: 14, weight: .bold)).foregroundColor(.white.opacity(0.4))
                    .padding(12).frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.02)))
            }
        }
    }
    
    // MARK: - Blocked
    
    private var blockedView: some View {
        VStack(spacing: 16) {
            Text("🛡️").font(.system(size: 50))
            Text("IMPULSE BLOCKED").font(.system(size: 20, weight: .black)).foregroundColor(shield)
            Text("You just protected your future self.\nThat's real strength.")
                .font(.system(size: 12, weight: .medium)).foregroundColor(.white.opacity(0.4)).multilineTextAlignment(.center)
            
            Text("+25 XP").font(.system(size: 16, weight: .black)).foregroundColor(Color(red: 1.0, green: 0.85, blue: 0.3))
            
            // Pattern note
            if moodAtImpulse <= 4 {
                HStack(spacing: 6) {
                    Text("📊").font(.system(size: 12))
                    Text("PATTERN: Low mood (\(moodAtImpulse)/10) triggered this impulse. Next time you feel low, remember — impulse is the symptom, not the solution.")
                        .font(.system(size: 9, weight: .medium)).foregroundColor(.white.opacity(0.25))
                }
                .padding(10).background(RoundedRectangle(cornerRadius: 8).fill(Color.white.opacity(0.01)))
            }
            
            let hour = Calendar.current.component(.hour, from: Date())
            if hour >= 22 || hour <= 5 {
                HStack(spacing: 6) {
                    Text("📊").font(.system(size: 12))
                    Text("PATTERN: Late night impulse. This is very common with ADHD — low dopamine + fatigue = poor impulse control. Sleep is the real fix.")
                        .font(.system(size: 9, weight: .medium)).foregroundColor(.white.opacity(0.25))
                }
                .padding(10).background(RoundedRectangle(cornerRadius: 8).fill(Color.white.opacity(0.01)))
            }
            
            Button { resetShield() } label: {
                Text("💪 Back to Shield").font(.system(size: 14, weight: .bold)).foregroundColor(shield)
                    .padding(12).frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 10).fill(shield.opacity(0.05)))
            }
        }
    }
    
    // MARK: - Log View
    
    private var logView: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Text("IMPULSE LOG").font(.system(size: 11, weight: .black)).tracking(1).foregroundColor(.white)
                Spacer()
                Button { withAnimation { phase = .landing } } label: {
                    Text("← Back").font(.system(size: 11, weight: .bold)).foregroundColor(.white.opacity(0.3))
                }
            }
            
            if impulseLog.isEmpty {
                Text("No impulses logged yet").font(.system(size: 12, weight: .medium)).foregroundColor(.white.opacity(0.2))
            } else {
                let blocked = impulseLog.filter { $0.outcome == .blocked }.count
                let delayed = impulseLog.filter { $0.outcome == .delayed }.count
                
                HStack(spacing: 8) {
                    statBadge("\(impulseLog.count)", "Total", shield)
                    statBadge("\(blocked)", "Blocked", accent)
                    statBadge("\(delayed)", "Delayed", Color(red: 1.0, green: 0.85, blue: 0.3))
                }
                
                ForEach(impulseLog.suffix(20).reversed()) { entry in
                    HStack {
                        Text(entry.outcome.emoji).font(.system(size: 14))
                        VStack(alignment: .leading, spacing: 2) {
                            Text(entry.impulse).font(.system(size: 11, weight: .bold))
                                .foregroundColor(.white.opacity(entry.outcome == .blocked ? 0.3 : 0.6))
                            Text("\(entry.type.emoji) \(entry.reason) • Mood: \(entry.mood)/10")
                                .font(.system(size: 8, weight: .medium)).foregroundColor(.white.opacity(0.15))
                        }
                        Spacer()
                        Text(entry.date.formatted(.dateTime.month(.abbreviated).day()))
                            .font(.system(size: 8, weight: .bold)).foregroundColor(.white.opacity(0.1))
                    }
                    .padding(8).background(RoundedRectangle(cornerRadius: 6).fill(Color.white.opacity(0.012)))
                }
            }
        }
    }
    
    // MARK: - Components
    
    private func questionCard(_ question: String, _ detail: String, yesAction: @escaping () -> Void, noAction: @escaping () -> Void) -> some View {
        VStack(spacing: 8) {
            Text(question).font(.system(size: 14, weight: .bold)).foregroundColor(.white)
            Text(detail).font(.system(size: 10, weight: .medium)).foregroundColor(.white.opacity(0.3))
            
            HStack(spacing: 8) {
                Button { yesAction() } label: {
                    Text("Yes").font(.system(size: 13, weight: .bold)).foregroundColor(.white)
                        .padding(10).frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 8).fill(Color.white.opacity(0.04)))
                }
                Button { noAction() } label: {
                    Text("No").font(.system(size: 13, weight: .bold)).foregroundColor(.white)
                        .padding(10).frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 8).fill(Color.white.opacity(0.04)))
                }
            }
        }
        .padding(12).background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.015)))
    }
    
    private func statBadge(_ val: String, _ label: String, _ color: Color) -> some View {
        VStack(spacing: 2) {
            Text(val).font(.system(size: 14, weight: .black)).foregroundColor(color)
            Text(label).font(.system(size: 7, weight: .bold)).foregroundColor(.white.opacity(0.15))
        }
        .frame(maxWidth: .infinity).padding(8).background(RoundedRectangle(cornerRadius: 6).fill(Color.white.opacity(0.015)))
    }
    
    private var neuroscience: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("🧠 WHY THIS WORKS").font(.system(size: 8, weight: .black)).tracking(1).foregroundColor(.white.opacity(0.1))
            Text("The ADHD brain has 30% less dopamine transporter density in the striatum, causing the reward system to over-value immediate gratification. A forced 5-second pause activates the dorsolateral prefrontal cortex — the 'braking system' — giving it time to override the limbic impulse. Each successful pause strengthens this neural pathway through Hebbian learning.")
                .font(.system(size: 9, weight: .medium)).foregroundColor(.white.opacity(0.12)).lineSpacing(2)
        }
        .padding(8).background(RoundedRectangle(cornerRadius: 6).fill(Color.white.opacity(0.01)))
    }
    
    // MARK: - Logic
    
    private func startCountdown() {
        countdownSeconds = 5; countdownActive = true
        withAnimation { phase = .countdown }
        
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            if countdownSeconds > 1 {
                countdownSeconds -= 1
            } else {
                timer.invalidate(); countdownActive = false
                withAnimation(.spring(response: 0.4)) { phase = .questions }
            }
        }
    }
    
    private func setWaitTimer() {
        waitTimerEnd = Calendar.current.date(byAdding: .hour, value: 24, to: Date())
    }
    
    private func logImpulse(outcome: ImpulseOutcome, reason: String) {
        let entry = ImpulseEntry(impulse: impulseText, type: impulseType, mood: moodAtImpulse,
                                 outcome: outcome, reason: reason, date: Date())
        impulseLog.append(entry)
        if let data = try? JSONEncoder().encode(impulseLog) {
            UserDefaults.standard.set(data, forKey: "aperture_impulse_log")
        }
    }
    
    private func loadLog() {
        if let data = UserDefaults.standard.data(forKey: "aperture_impulse_log"),
           let decoded = try? JSONDecoder().decode([ImpulseEntry].self, from: data) {
            impulseLog = decoded
        }
    }
    
    private func resetShield() {
        impulseText = ""; urgencyAnswer = nil; energyCost = 3; moodAtImpulse = 5
        withAnimation { phase = .landing }
    }
    
    // MARK: - Helpers
    
    private func moodEmoji(_ m: Int) -> String {
        switch m { case 1...2: return "😰"; case 3...4: return "😔"; case 5...6: return "😐"; case 7...8: return "🙂"; default: return "😊" }
    }
    private func costEmoji(_ l: Int) -> String {
        switch l { case 1: return "🟢"; case 2: return "🟡"; case 3: return "🟠"; case 4: return "🔴"; default: return "💀" }
    }
    private func costLabel(_ l: Int) -> String {
        switch l { case 1: return "Tiny"; case 2: return "Low"; case 3: return "Medium"; case 4: return "High"; default: return "Huge" }
    }
    private func costColor(_ l: Int) -> Color {
        switch l { case 1: return .green; case 2: return .yellow; case 3: return .orange; case 4: return .red; default: return .red }
    }
}

// MARK: - Models

enum ShieldPhase { case landing, countdown, questions, energyCost, waitTimer, approved, blocked, log }

enum ImpulseType: String, CaseIterable, Codable {
    case purchase = "Purchase"
    case message = "Message/Text"
    case commitment = "Commitment"
    case food = "Food/Drink"
    case quitting = "Quitting"
    case confrontation = "Confrontation"
    
    var emoji: String {
        switch self {
        case .purchase: return "💳"; case .message: return "📱"
        case .commitment: return "🤝"; case .food: return "🍔"
        case .quitting: return "🚪"; case .confrontation: return "💢"
        }
    }
    var label: String { rawValue }
}

enum ImpulseOutcome: String, Codable {
    case blocked, delayed, approved
    var emoji: String {
        switch self { case .blocked: return "🛡️"; case .delayed: return "⏰"; case .approved: return "✅" }
    }
}

struct ImpulseEntry: Identifiable, Codable {
    var id = UUID()
    let impulse: String; let type: ImpulseType; let mood: Int
    let outcome: ImpulseOutcome; let reason: String; let date: Date
}
