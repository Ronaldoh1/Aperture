// HyperfocusTimerView.swift
// HYPERFOCUS TIMER — Sprint 2
// ☀️ SunFlow: Reignited
//
// Not a rigid Pomodoro. ADHD-specific:
// - Flexible intervals (15/25/45/custom)
// - "Ride the Wave" mode when hyperfocus is productive
// - Break nudges: eat, drink, move, bathroom
// - Energy tracking per session
// - XP rewards for completing sessions WITH breaks
//
// "Your hyperfocus is a superpower.
//  But a superpower without boundaries is a disaster."

import SwiftUI
import UserNotifications

// MARK: - Timer State

enum TimerPhase: String, Codable {
    case idle, focus, breakTime, rideTheWave
}

struct FocusSession: Identifiable, Codable {
    let id: UUID
    let startTime: Date
    var endTime: Date?
    var focusMinutes: Int
    var breaksTaken: Int
    var energyBefore: Int
    var energyAfter: Int?
    var task: String
    var completed: Bool
}

// MARK: - Main View

struct HyperfocusTimerView: View {
    
    @Environment(\.dismiss) var dismiss
    @State private var phase: TimerPhase = .idle
    @State private var selectedDuration: Int = 25 // minutes
    @State private var remainingSeconds: Int = 0
    @State private var totalFocusSeconds: Int = 0
    @State private var breaksTaken: Int = 0
    @State private var timer: Timer?
    @State private var taskName: String = ""
    @State private var energyBefore: Int = 5
    @State private var energyAfter: Int = 5
    @State private var showCompletion: Bool = false
    @State private var sessions: [FocusSession] = []
    @State private var showBreakNudge: Bool = false
    @State private var breakNudgeType: BreakNudgeType = .water
    
    private let accent = Color(red: 0.3, green: 0.8, blue: 1.0)
    private let durations = [15, 25, 45, 60, 90]
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(red: 0.02, green: 0.02, blue: 0.06).ignoresSafeArea()
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 20) {
                        timerDisplay
                        
                        if phase == .idle { setupView }
                        if phase == .focus || phase == .rideTheWave { activeView }
                        if phase == .breakTime { breakView }
                        if !sessions.isEmpty { statsView }
                        
                        Spacer(minLength: 40)
                    }
                    .padding(20)
                }
                
                // Break nudge overlay
                if showBreakNudge { breakNudgeOverlay }
                
                // Completion overlay
                if showCompletion { completionOverlay }
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
                        Text("⏱️").font(.system(size: 14))
                        Text("Hyperfocus Timer").font(.system(size: 17, weight: .bold)).foregroundColor(.white)
                    }
                }
            }
            .onAppear { loadSessions() }
            .onDisappear { timer?.invalidate() }
        }
    }
    
    // MARK: - Timer Display
    
    private var timerDisplay: some View {
        ZStack {
            // Background ring
            Circle().stroke(Color.white.opacity(0.03), lineWidth: 8)
                .frame(width: 200, height: 200)
            
            // Progress ring
            if phase != .idle {
                let totalSeconds = phase == .breakTime ? 300 : selectedDuration * 60
                let progress = 1.0 - (Double(remainingSeconds) / Double(max(totalSeconds, 1)))
                
                Circle()
                    .trim(from: 0, to: progress)
                    .stroke(
                        phase == .breakTime ? Color.green : (phase == .rideTheWave ? Color.orange : accent),
                        style: StrokeStyle(lineWidth: 8, lineCap: .round)
                    )
                    .frame(width: 200, height: 200)
                    .rotationEffect(.degrees(-90))
                    .animation(.linear(duration: 1), value: remainingSeconds)
            }
            
            VStack(spacing: 4) {
                if phase == .idle {
                    Text("READY").font(.system(size: 12, weight: .black)).tracking(2).foregroundColor(.white.opacity(0.2))
                    Text("\(selectedDuration)").font(.system(size: 48, weight: .ultraLight)).foregroundColor(.white)
                    Text("MINUTES").font(.system(size: 10, weight: .bold)).tracking(1).foregroundColor(.white.opacity(0.2))
                } else {
                    Text(phase == .breakTime ? "BREAK" : (phase == .rideTheWave ? "🌊 RIDING" : "FOCUS"))
                        .font(.system(size: 10, weight: .black)).tracking(2)
                        .foregroundColor(phase == .breakTime ? .green : (phase == .rideTheWave ? .orange : accent))
                    
                    Text(timeString(remainingSeconds))
                        .font(.system(size: 42, weight: .ultraLight, design: .monospaced)).foregroundColor(.white)
                    
                    Text("breaks: \(breaksTaken)")
                        .font(.system(size: 9, weight: .bold)).foregroundColor(.white.opacity(0.15))
                }
            }
        }
    }
    
    // MARK: - Setup View (idle)
    
    private var setupView: some View {
        VStack(spacing: 16) {
            // Task name
            HStack {
                Image(systemName: "pencil").foregroundColor(.white.opacity(0.2))
                TextField("What are you focusing on?", text: $taskName)
                    .font(.system(size: 14, weight: .medium)).foregroundColor(.white)
            }
            .padding(12).background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.03)))
            
            // Duration picker
            VStack(alignment: .leading, spacing: 6) {
                Text("DURATION").font(.system(size: 9, weight: .black)).tracking(1).foregroundColor(.white.opacity(0.15))
                HStack(spacing: 8) {
                    ForEach(durations, id: \.self) { d in
                        Button {
                            withAnimation { selectedDuration = d }
                        } label: {
                            Text("\(d)m").font(.system(size: 12, weight: .bold))
                                .foregroundColor(selectedDuration == d ? .black : .white.opacity(0.3))
                                .padding(.horizontal, 12).padding(.vertical, 6)
                                .background(Capsule().fill(selectedDuration == d ? accent : Color.white.opacity(0.03)))
                        }
                    }
                }
            }
            
            // Energy before
            VStack(alignment: .leading, spacing: 4) {
                Text("ENERGY LEVEL").font(.system(size: 9, weight: .black)).tracking(1).foregroundColor(.white.opacity(0.15))
                HStack(spacing: 4) {
                    ForEach(1...10, id: \.self) { level in
                        Button {
                            energyBefore = level
                        } label: {
                            Circle()
                                .fill(level <= energyBefore ? accent.opacity(0.6) : Color.white.opacity(0.03))
                                .frame(width: 24, height: 24)
                                .overlay(Text("\(level)").font(.system(size: 8, weight: .bold)).foregroundColor(level <= energyBefore ? .black : .white.opacity(0.15)))
                        }
                    }
                }
            }
            
            // Start button
            Button { startFocus() } label: {
                HStack(spacing: 8) {
                    Image(systemName: "bolt.fill").font(.system(size: 14))
                    Text("START FOCUS").font(.system(size: 14, weight: .black)).tracking(1)
                }
                .foregroundColor(.black)
                .frame(maxWidth: .infinity).padding(.vertical, 14)
                .background(RoundedRectangle(cornerRadius: 12).fill(accent))
            }
            
            // Neuroscience note
            Text("💡 ADHD brains have lower baseline dopamine in the prefrontal cortex. Structured focus sessions with predictable breaks provide the dopamine scaffolding your executive function needs.")
                .font(.system(size: 9, weight: .medium)).foregroundColor(.white.opacity(0.12)).lineSpacing(2)
                .padding(10).background(RoundedRectangle(cornerRadius: 8).fill(Color.white.opacity(0.01)))
        }
    }
    
    // MARK: - Active View (focus/ride)
    
    private var activeView: some View {
        VStack(spacing: 12) {
            if !taskName.isEmpty {
                Text(taskName).font(.system(size: 14, weight: .bold)).foregroundColor(.white.opacity(0.4))
            }
            
            HStack(spacing: 12) {
                // Pause / Take Break
                Button { startBreak() } label: {
                    HStack(spacing: 6) {
                        Image(systemName: "cup.and.saucer.fill").font(.system(size: 12))
                        Text("Take Break").font(.system(size: 12, weight: .bold))
                    }
                    .foregroundColor(.green)
                    .padding(.horizontal, 16).padding(.vertical, 10)
                    .background(Capsule().fill(Color.green.opacity(0.1)))
                }
                
                // Stop
                Button { finishSession() } label: {
                    HStack(spacing: 6) {
                        Image(systemName: "stop.fill").font(.system(size: 12))
                        Text("Done").font(.system(size: 12, weight: .bold))
                    }
                    .foregroundColor(.red.opacity(0.6))
                    .padding(.horizontal, 16).padding(.vertical, 10)
                    .background(Capsule().fill(Color.red.opacity(0.05)))
                }
            }
            
            if phase == .focus && remainingSeconds <= 0 {
                // Timer ended — offer Ride the Wave
                Button { rideTheWave() } label: {
                    HStack(spacing: 6) {
                        Text("🌊").font(.system(size: 14))
                        Text("RIDE THE WAVE").font(.system(size: 13, weight: .black)).tracking(1)
                    }
                    .foregroundColor(.orange)
                    .frame(maxWidth: .infinity).padding(.vertical, 12)
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.orange.opacity(0.08)))
                }
                
                Text("Hyperfocus is flowing? Keep going.\nBut you MUST take a break within 15 min.")
                    .font(.system(size: 9, weight: .medium)).foregroundColor(.orange.opacity(0.4))
                    .multilineTextAlignment(.center)
            }
        }
    }
    
    // MARK: - Break View
    
    private var breakView: some View {
        VStack(spacing: 12) {
            Text("🌿 BREAK TIME").font(.system(size: 14, weight: .black)).tracking(1).foregroundColor(.green)
            
            VStack(alignment: .leading, spacing: 8) {
                breakCheckItem("💧", "Drink water")
                breakCheckItem("🚶", "Stand up & stretch")
                breakCheckItem("🍎", "Eat something if hungry")
                breakCheckItem("🚽", "Use the bathroom")
                breakCheckItem("👀", "Look at something 20ft away for 20sec")
            }
            
            Button { resumeFocus() } label: {
                HStack(spacing: 6) {
                    Image(systemName: "bolt.fill").font(.system(size: 12))
                    Text("RESUME FOCUS").font(.system(size: 13, weight: .black)).tracking(1)
                }
                .foregroundColor(.black).frame(maxWidth: .infinity).padding(.vertical, 12)
                .background(RoundedRectangle(cornerRadius: 10).fill(accent))
            }
        }
    }
    
    private func breakCheckItem(_ emoji: String, _ text: String) -> some View {
        HStack(spacing: 8) {
            Text(emoji).font(.system(size: 14))
            Text(text).font(.system(size: 12, weight: .medium)).foregroundColor(.white.opacity(0.4))
        }
        .padding(8).frame(maxWidth: .infinity, alignment: .leading)
        .background(RoundedRectangle(cornerRadius: 8).fill(Color.green.opacity(0.02)))
    }
    
    // MARK: - Break Nudge Overlay
    
    private var breakNudgeOverlay: some View {
        ZStack {
            Color.black.opacity(0.7).ignoresSafeArea()
            
            VStack(spacing: 12) {
                Text(breakNudgeType.emoji).font(.system(size: 40))
                Text(breakNudgeType.title).font(.system(size: 16, weight: .black)).foregroundColor(.white)
                Text(breakNudgeType.message).font(.system(size: 12, weight: .medium)).foregroundColor(.white.opacity(0.5))
                    .multilineTextAlignment(.center).padding(.horizontal, 20)
                
                HStack(spacing: 12) {
                    Button {
                        withAnimation { showBreakNudge = false }
                        startBreak()
                    } label: {
                        Text("Take Break").font(.system(size: 13, weight: .bold)).foregroundColor(.green)
                            .padding(.horizontal, 20).padding(.vertical, 10)
                            .background(Capsule().fill(Color.green.opacity(0.1)))
                    }
                    
                    Button {
                        withAnimation { showBreakNudge = false }
                    } label: {
                        Text("5 more min").font(.system(size: 13, weight: .bold)).foregroundColor(.white.opacity(0.3))
                            .padding(.horizontal, 20).padding(.vertical, 10)
                            .background(Capsule().fill(Color.white.opacity(0.03)))
                    }
                }
            }
            .padding(24).background(RoundedRectangle(cornerRadius: 16).fill(Color(red: 0.08, green: 0.08, blue: 0.12)))
        }
    }
    
    // MARK: - Completion Overlay
    
    private var completionOverlay: some View {
        ZStack {
            Color.black.opacity(0.8).ignoresSafeArea()
            
            VStack(spacing: 16) {
                Text("✨").font(.system(size: 48))
                Text("SESSION COMPLETE").font(.system(size: 18, weight: .black)).tracking(1).foregroundColor(accent)
                
                HStack(spacing: 20) {
                    statPill("⏱️", "\(totalFocusSeconds / 60)m", "Focus")
                    statPill("☕", "\(breaksTaken)", "Breaks")
                    statPill("⚡", "\(calculateXP()) XP", "Earned")
                }
                
                // Energy after
                VStack(spacing: 4) {
                    Text("Energy now?").font(.system(size: 11, weight: .bold)).foregroundColor(.white.opacity(0.3))
                    HStack(spacing: 4) {
                        ForEach(1...10, id: \.self) { level in
                            Button { energyAfter = level } label: {
                                Circle().fill(level <= energyAfter ? accent.opacity(0.6) : Color.white.opacity(0.03))
                                    .frame(width: 22, height: 22)
                                    .overlay(Text("\(level)").font(.system(size: 8, weight: .bold)).foregroundColor(level <= energyAfter ? .black : .white.opacity(0.15)))
                            }
                        }
                    }
                }
                
                Button {
                    saveSession()
                    withAnimation { showCompletion = false; phase = .idle }
                } label: {
                    Text("DONE").font(.system(size: 14, weight: .black)).tracking(1).foregroundColor(.black)
                        .frame(maxWidth: .infinity).padding(.vertical, 12)
                        .background(RoundedRectangle(cornerRadius: 10).fill(accent))
                }
            }
            .padding(24).background(RoundedRectangle(cornerRadius: 16).fill(Color(red: 0.06, green: 0.06, blue: 0.1)))
            .padding(20)
        }
    }
    
    private func statPill(_ emoji: String, _ value: String, _ label: String) -> some View {
        VStack(spacing: 2) {
            Text(emoji).font(.system(size: 14))
            Text(value).font(.system(size: 14, weight: .black)).foregroundColor(accent)
            Text(label).font(.system(size: 8, weight: .bold)).foregroundColor(.white.opacity(0.2))
        }
    }
    
    // MARK: - Stats View
    
    private var statsView: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("RECENT SESSIONS").font(.system(size: 9, weight: .black)).tracking(1).foregroundColor(.white.opacity(0.1))
            
            ForEach(sessions.prefix(5)) { session in
                HStack {
                    Text(session.task.isEmpty ? "Untitled" : session.task)
                        .font(.system(size: 11, weight: .bold)).foregroundColor(.white.opacity(0.3))
                    Spacer()
                    Text("\(session.focusMinutes)m").font(.system(size: 11, weight: .medium)).foregroundColor(accent.opacity(0.5))
                    Text("⚡\(session.energyBefore)→\(session.energyAfter ?? session.energyBefore)")
                        .font(.system(size: 9, weight: .bold)).foregroundColor(.white.opacity(0.15))
                }
                .padding(8).background(RoundedRectangle(cornerRadius: 6).fill(Color.white.opacity(0.01)))
            }
        }
    }
    
    // MARK: - Timer Logic
    
    private func startFocus() {
        phase = .focus
        remainingSeconds = selectedDuration * 60
        totalFocusSeconds = 0
        breaksTaken = 0
        startTimer()
    }
    
    private func startTimer() {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            if remainingSeconds > 0 {
                remainingSeconds -= 1
                if phase == .focus || phase == .rideTheWave { totalFocusSeconds += 1 }
                
                // Break nudge at halfway point
                if phase == .focus && remainingSeconds == (selectedDuration * 30) && breaksTaken == 0 {
                    breakNudgeType = .water
                    withAnimation { showBreakNudge = true }
                }
                
                // Ride the wave forced break at 15 min
                if phase == .rideTheWave && remainingSeconds <= 0 {
                    breakNudgeType = .forced
                    withAnimation { showBreakNudge = true }
                }
            } else if phase == .focus {
                // Timer ended naturally — haptic + sound
                let generator = UINotificationFeedbackGenerator()
                generator.notificationOccurred(.success)
            } else if phase == .breakTime {
                resumeFocus()
            }
        }
    }
    
    private func startBreak() {
        timer?.invalidate()
        phase = .breakTime
        breaksTaken += 1
        remainingSeconds = 300 // 5 min break
        startTimer()
    }
    
    private func resumeFocus() {
        phase = .focus
        remainingSeconds = selectedDuration * 60 // fresh focus block
        startTimer()
    }
    
    private func rideTheWave() {
        phase = .rideTheWave
        remainingSeconds = 900 // 15 min max ride
        startTimer()
    }
    
    private func finishSession() {
        timer?.invalidate()
        withAnimation { showCompletion = true }
    }
    
    private func calculateXP() -> Int {
        let focusXP = (totalFocusSeconds / 60) * 2
        let breakBonus = breaksTaken * 10 // reward breaks!
        return focusXP + breakBonus
    }
    
    private func saveSession() {
        let session = FocusSession(
            id: UUID(), startTime: Date().addingTimeInterval(-Double(totalFocusSeconds)),
            endTime: Date(), focusMinutes: totalFocusSeconds / 60,
            breaksTaken: breaksTaken, energyBefore: energyBefore,
            energyAfter: energyAfter, task: taskName, completed: true
        )
        sessions.insert(session, at: 0)
        if let data = try? JSONEncoder().encode(sessions) {
            UserDefaults.standard.set(data, forKey: "aperture_focus_sessions")
        }
        totalFocusSeconds = 0; taskName = ""
    }
    
    private func loadSessions() {
        if let data = UserDefaults.standard.data(forKey: "aperture_focus_sessions"),
           let saved = try? JSONDecoder().decode([FocusSession].self, from: data) {
            sessions = saved
        }
    }
    
    private func timeString(_ seconds: Int) -> String {
        let m = seconds / 60; let s = seconds % 60
        return String(format: "%02d:%02d", m, s)
    }
}

// MARK: - Break Nudge Types

enum BreakNudgeType {
    case water, move, eat, forced
    
    var emoji: String {
        switch self { case .water: return "💧"; case .move: return "🚶"; case .eat: return "🍎"; case .forced: return "⚠️" }
    }
    var title: String {
        switch self { case .water: return "Hydration Check"; case .move: return "Movement Break"; case .eat: return "Fuel Check"; case .forced: return "Break Required" }
    }
    var message: String {
        switch self {
        case .water: return "You've been focusing for a while.\nYour brain is 75% water — keep it topped up."
        case .move: return "Your body needs movement.\nEven 30 seconds of stretching helps."
        case .eat: return "When's the last time you ate?\nLow blood sugar = worse executive function."
        case .forced: return "15 minutes of Ride the Wave is up.\nYour brain NEEDS a break now.\nThis isn't optional."
        }
    }
}
