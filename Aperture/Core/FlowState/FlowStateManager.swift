// FlowStateManager.swift
// FlowState - AI-guided focus sessions for deep work and awakening practice
// Premium feature for entering and maintaining flow states

import SwiftUI
import Combine
import AVFoundation

// MARK: - Flow State Phase

enum FlowPhase: String, CaseIterable {
    case preparing = "Preparing"
    case entering = "Entering Flow"
    case deepWork = "Deep Flow"
    case rest = "Integration"
    case complete = "Complete"
    
    var icon: String {
        switch self {
        case .preparing: return "brain.head.profile"
        case .entering: return "waveform.path"
        case .deepWork: return "flame.fill"
        case .rest: return "leaf.fill"
        case .complete: return "checkmark.seal.fill"
        }
    }
    
    var color: Color {
        switch self {
        case .preparing: return .cyan
        case .entering: return .purple
        case .deepWork: return .orange
        case .rest: return .green
        case .complete: return Palette.accent.gold
        }
    }
    
    var description: String {
        switch self {
        case .preparing: return "Clear your space and mind"
        case .entering: return "Building focus momentum"
        case .deepWork: return "You're in the zone"
        case .rest: return "Let insights settle"
        case .complete: return "Session complete"
        }
    }
}

// MARK: - Flow Session

struct FlowSession: Identifiable, Codable {
    let id: String
    let startTime: Date
    var endTime: Date?
    var intention: String
    var totalMinutes: Int
    var deepFlowMinutes: Int
    var distractionCount: Int
    var notes: String?
    var mood: FlowMood?
    
    var durationMinutes: Int {
        let end = endTime ?? Date()
        return Int(end.timeIntervalSince(startTime) / 60)
    }
}

enum FlowMood: String, Codable, CaseIterable {
    case transcendent = "🌟 Transcendent"
    case focused = "🎯 Focused"
    case calm = "🧘 Calm"
    case struggling = "😤 Struggling"
    case distracted = "🤔 Distracted"
}

// MARK: - Flow State Manager

@MainActor
class FlowStateManager: ObservableObject {
    
    static let shared = FlowStateManager()
    
    // MARK: - Published State
    
    @Published var isActive: Bool = false
    @Published var currentPhase: FlowPhase = .preparing
    @Published var currentSession: FlowSession?
    @Published var elapsedSeconds: Int = 0
    @Published var phaseSeconds: Int = 0
    @Published var intention: String = ""
    @Published var distractionCount: Int = 0
    
    // Settings
    @Published var prepareDuration: Int = 3 // minutes
    @Published var enteringDuration: Int = 5 // minutes
    @Published var deepWorkDuration: Int = 45 // minutes
    @Published var restDuration: Int = 5 // minutes
    @Published var enableSounds: Bool = true
    @Published var enableHaptics: Bool = true
    
    // Stats
    @Published private(set) var totalFlowMinutes: Int = 0
    @Published private(set) var sessionsCompleted: Int = 0
    @Published private(set) var longestSession: Int = 0
    @Published private(set) var averageDeepFlow: Int = 0
    
    // History
    @Published private(set) var sessionHistory: [FlowSession] = []
    
    // MARK: - Private
    
    private var timer: Timer?
    private var audioPlayer: AVAudioPlayer?
    
    private let statsKey = "aperture.flowstate.stats.v1"
    private let historyKey = "aperture.flowstate.history.v1"
    
    private init() {
        load()
    }
    
    // MARK: - Session Control
    
    func startSession(intention: String) {
        self.intention = intention
        self.isActive = true
        self.currentPhase = .preparing
        self.elapsedSeconds = 0
        self.phaseSeconds = 0
        self.distractionCount = 0
        
        currentSession = FlowSession(
            id: UUID().uuidString,
            startTime: Date(),
            intention: intention,
            totalMinutes: 0,
            deepFlowMinutes: 0,
            distractionCount: 0
        )
        
        startTimer()
        
        if enableHaptics {
            HapticManager.shared.medium()
        }
        
        // Play start sound
        playSound(.sessionStart)
    }
    
    func pauseSession() {
        timer?.invalidate()
        timer = nil
    }
    
    func resumeSession() {
        startTimer()
    }
    
    func endSession(notes: String? = nil, mood: FlowMood? = nil) {
        timer?.invalidate()
        timer = nil
        
        if var session = currentSession {
            session.endTime = Date()
            session.totalMinutes = elapsedSeconds / 60
            session.deepFlowMinutes = calculateDeepFlowMinutes()
            session.distractionCount = distractionCount
            session.notes = notes
            session.mood = mood
            
            sessionHistory.insert(session, at: 0)
            updateStats(with: session)
        }
        
        currentPhase = .complete
        playSound(.sessionComplete)
        
        if enableHaptics {
            HapticManager.shared.success()
        }
        
        // Reset after delay
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [weak self] in
            self?.resetSession()
        }
    }
    
    func recordDistraction() {
        distractionCount += 1
        
        if enableHaptics {
            HapticManager.shared.warning()
        }
    }
    
    private func resetSession() {
        isActive = false
        currentSession = nil
        elapsedSeconds = 0
        phaseSeconds = 0
        intention = ""
        distractionCount = 0
        currentPhase = .preparing
    }
    
    // MARK: - Timer
    
    private func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
            Task { @MainActor in
                self?.tick()
            }
        }
    }
    
    private func tick() {
        elapsedSeconds += 1
        phaseSeconds += 1
        
        // Check phase transitions
        checkPhaseTransition()
        
        // Auto-complete if total duration reached
        let totalDuration = (prepareDuration + enteringDuration + deepWorkDuration + restDuration) * 60
        if elapsedSeconds >= totalDuration {
            endSession()
        }
    }
    
    private func checkPhaseTransition() {
        let prepareEnd = prepareDuration * 60
        let enteringEnd = prepareEnd + (enteringDuration * 60)
        let deepWorkEnd = enteringEnd + (deepWorkDuration * 60)
        
        let newPhase: FlowPhase
        
        if elapsedSeconds < prepareEnd {
            newPhase = .preparing
        } else if elapsedSeconds < enteringEnd {
            newPhase = .entering
        } else if elapsedSeconds < deepWorkEnd {
            newPhase = .deepWork
        } else {
            newPhase = .rest
        }
        
        if newPhase != currentPhase {
            currentPhase = newPhase
            phaseSeconds = 0
            playSound(.phaseTransition)
            
            if enableHaptics {
                HapticManager.shared.medium()
            }
        }
    }
    
    private func calculateDeepFlowMinutes() -> Int {
        let prepareEnd = prepareDuration * 60
        let enteringEnd = prepareEnd + (enteringDuration * 60)
        let deepWorkEnd = enteringEnd + (deepWorkDuration * 60)
        
        if elapsedSeconds <= enteringEnd {
            return 0
        } else if elapsedSeconds <= deepWorkEnd {
            return (elapsedSeconds - enteringEnd) / 60
        } else {
            return deepWorkDuration
        }
    }
    
    // MARK: - Sound
    
    enum FlowSound {
        case sessionStart
        case phaseTransition
        case sessionComplete
    }
    
    private func playSound(_ sound: FlowSound) {
        guard enableSounds else { return }
        
        // In real app, load actual sound files
        // For now, just use system sounds
        switch sound {
        case .sessionStart:
            AudioServicesPlaySystemSound(1103)
        case .phaseTransition:
            AudioServicesPlaySystemSound(1104)
        case .sessionComplete:
            AudioServicesPlaySystemSound(1025)
        }
    }
    
    // MARK: - Stats
    
    private func updateStats(with session: FlowSession) {
        totalFlowMinutes += session.totalMinutes
        sessionsCompleted += 1
        longestSession = max(longestSession, session.totalMinutes)
        
        let totalDeepFlow = sessionHistory.reduce(0) { $0 + $1.deepFlowMinutes }
        averageDeepFlow = sessionsCompleted > 0 ? totalDeepFlow / sessionsCompleted : 0
        
        save()
    }
    
    // MARK: - Persistence
    
    private func load() {
        if let data = UserDefaults.standard.data(forKey: statsKey),
           let stats = try? JSONDecoder().decode(FlowStats.self, from: data) {
            totalFlowMinutes = stats.totalFlowMinutes
            sessionsCompleted = stats.sessionsCompleted
            longestSession = stats.longestSession
            averageDeepFlow = stats.averageDeepFlow
        }
        
        if let data = UserDefaults.standard.data(forKey: historyKey),
           let history = try? JSONDecoder().decode([FlowSession].self, from: data) {
            sessionHistory = history
        }
    }
    
    private func save() {
        let stats = FlowStats(
            totalFlowMinutes: totalFlowMinutes,
            sessionsCompleted: sessionsCompleted,
            longestSession: longestSession,
            averageDeepFlow: averageDeepFlow
        )
        
        if let data = try? JSONEncoder().encode(stats) {
            UserDefaults.standard.set(data, forKey: statsKey)
        }
        
        if let data = try? JSONEncoder().encode(sessionHistory) {
            UserDefaults.standard.set(data, forKey: historyKey)
        }
    }
}

struct FlowStats: Codable {
    let totalFlowMinutes: Int
    let sessionsCompleted: Int
    let longestSession: Int
    let averageDeepFlow: Int
}

// MARK: - FlowState View

struct FlowStateView: View {
    
    @StateObject private var manager = FlowStateManager.shared
    @State private var showSettings = false
    @State private var showHistory = false
    @State private var intentionInput = ""
    @State private var endSessionNotes = ""
    @State private var selectedMood: FlowMood?
    @State private var showEndSession = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                // Animated background based on phase
                flowBackground
                
                VStack(spacing: 0) {
                    if manager.isActive {
                        activeSessionView
                    } else {
                        startSessionView
                    }
                }
            }
            .navigationTitle("FlowState")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: { showHistory = true }) {
                        Image(systemName: "clock.arrow.circlepath")
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: { showSettings = true }) {
                        Image(systemName: "gearshape")
                    }
                }
            }
            .sheet(isPresented: $showSettings) {
                FlowSettingsSheet(manager: manager)
            }
            .sheet(isPresented: $showHistory) {
                FlowHistorySheet(sessions: manager.sessionHistory)
            }
            .sheet(isPresented: $showEndSession) {
                EndSessionSheet(
                    notes: $endSessionNotes,
                    mood: $selectedMood,
                    onComplete: {
                        manager.endSession(notes: endSessionNotes.isEmpty ? nil : endSessionNotes, mood: selectedMood)
                        showEndSession = false
                    }
                )
            }
        }
    }
    
    // MARK: - Background
    
    private var flowBackground: some View {
        ZStack {
            Color(hex: "#0a0a1a").ignoresSafeArea()
            
            // Phase-specific glow
            Circle()
                .fill(
                    RadialGradient(
                        colors: [manager.currentPhase.color.opacity(0.3), Color.clear],
                        center: .center,
                        startRadius: 50,
                        endRadius: 300
                    )
                )
                .scaleEffect(manager.isActive ? 1.5 : 1.0)
                .animation(.easeInOut(duration: 2).repeatForever(autoreverses: true), value: manager.isActive)
        }
    }
    
    // MARK: - Start Session View
    
    private var startSessionView: some View {
        ScrollView {
            VStack(spacing: 30) {
                Spacer(minLength: 40)
                
                // Icon
                ZStack {
                    Circle()
                        .fill(Palette.accent.gold.opacity(0.2))
                        .frame(width: 100, height: 100)
                    
                    Image(systemName: "brain.head.profile")
                        .font(.system(size: 40))
                        .foregroundColor(Palette.accent.gold)
                }
                
                VStack(spacing: 8) {
                    Text("Enter Flow State")
                        .font(.system(size: 28, weight: .bold))
                        .foregroundColor(.white)
                    
                    Text("AI-guided focus for deep work and awakening")
                        .font(.system(size: 14))
                        .foregroundColor(.white.opacity(0.6))
                }
                
                // Stats
                if manager.sessionsCompleted > 0 {
                    statsBar
                }
                
                // Intention input
                VStack(alignment: .leading, spacing: 8) {
                    Text("SET YOUR INTENTION")
                        .font(.system(size: 12, weight: .bold))
                        .foregroundColor(Palette.accent.gold)
                        .tracking(2)
                    
                    TextField("What will you focus on?", text: $intentionInput)
                        .textFieldStyle(PlainTextFieldStyle())
                        .font(.system(size: 16))
                        .foregroundColor(.white)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color.white.opacity(0.08))
                        )
                }
                .padding(.horizontal, 30)
                
                // Duration preview
                durationPreview
                
                Spacer(minLength: 40)
                
                // Start button
                Button(action: {
                    manager.startSession(intention: intentionInput.isEmpty ? "Deep focus" : intentionInput)
                }) {
                    HStack {
                        Image(systemName: "play.fill")
                        Text("Begin Session")
                            .font(.system(size: 18, weight: .bold))
                    }
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 18)
                    .background(Palette.accent.gold)
                    .cornerRadius(16)
                }
                .padding(.horizontal, 30)
                .padding(.bottom, 30)
            }
        }
    }
    
    private var statsBar: some View {
        HStack(spacing: 20) {
            statItem(value: "\(manager.sessionsCompleted)", label: "Sessions")
            statItem(value: "\(manager.totalFlowMinutes)m", label: "Total Flow")
            statItem(value: "\(manager.averageDeepFlow)m", label: "Avg Deep")
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.white.opacity(0.05))
        )
        .padding(.horizontal, 30)
    }
    
    private func statItem(value: String, label: String) -> some View {
        VStack(spacing: 4) {
            Text(value)
                .font(.system(size: 18, weight: .bold))
                .foregroundColor(.white)
            Text(label)
                .font(.system(size: 11))
                .foregroundColor(.gray)
        }
    }
    
    private var durationPreview: some View {
        VStack(spacing: 8) {
            Text("SESSION PHASES")
                .font(.system(size: 12, weight: .bold))
                .foregroundColor(.gray)
                .tracking(2)
            
            HStack(spacing: 0) {
                phasePreview(.preparing, duration: manager.prepareDuration)
                phasePreview(.entering, duration: manager.enteringDuration)
                phasePreview(.deepWork, duration: manager.deepWorkDuration)
                phasePreview(.rest, duration: manager.restDuration)
            }
            .frame(height: 40)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            
            Text("Total: \(manager.prepareDuration + manager.enteringDuration + manager.deepWorkDuration + manager.restDuration) minutes")
                .font(.system(size: 12))
                .foregroundColor(.gray)
        }
        .padding(.horizontal, 30)
    }
    
    private func phasePreview(_ phase: FlowPhase, duration: Int) -> some View {
        let totalDuration = manager.prepareDuration + manager.enteringDuration + manager.deepWorkDuration + manager.restDuration
        let width = CGFloat(duration) / CGFloat(totalDuration)
        
        return GeometryReader { geo in
            Rectangle()
                .fill(phase.color.opacity(0.6))
                .frame(width: geo.size.width)
                .overlay(
                    Text("\(duration)m")
                        .font(.system(size: 10, weight: .medium))
                        .foregroundColor(.white)
                )
        }
        .frame(maxWidth: .infinity)
    }
    
    // MARK: - Active Session View
    
    private var activeSessionView: some View {
        VStack(spacing: 30) {
            Spacer()
            
            // Phase indicator
            VStack(spacing: 12) {
                Image(systemName: manager.currentPhase.icon)
                    .font(.system(size: 50))
                    .foregroundColor(manager.currentPhase.color)
                
                Text(manager.currentPhase.rawValue)
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(.white)
                
                Text(manager.currentPhase.description)
                    .font(.system(size: 14))
                    .foregroundColor(.white.opacity(0.6))
            }
            
            // Timer
            VStack(spacing: 8) {
                Text(formatTime(manager.elapsedSeconds))
                    .font(.system(size: 60, weight: .thin, design: .monospaced))
                    .foregroundColor(.white)
                
                // Phase progress
                phaseProgressBar
            }
            
            // Intention
            if !manager.intention.isEmpty {
                Text("\"\(manager.intention)\"")
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(Palette.accent.gold)
                    .italic()
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 40)
            }
            
            // Distraction counter
            if manager.distractionCount > 0 {
                HStack {
                    Text("Distractions: \(manager.distractionCount)")
                        .font(.system(size: 14))
                        .foregroundColor(.orange)
                }
            }
            
            Spacer()
            
            // Controls
            HStack(spacing: 20) {
                Button(action: { manager.recordDistraction() }) {
                    VStack(spacing: 4) {
                        Image(systemName: "exclamationmark.triangle")
                            .font(.system(size: 20))
                        Text("Distraction")
                            .font(.system(size: 11))
                    }
                    .foregroundColor(.orange)
                    .frame(width: 80, height: 60)
                    .background(Color.orange.opacity(0.15))
                    .cornerRadius(12)
                }
                
                Button(action: { showEndSession = true }) {
                    VStack(spacing: 4) {
                        Image(systemName: "stop.fill")
                            .font(.system(size: 20))
                        Text("End")
                            .font(.system(size: 11))
                    }
                    .foregroundColor(.red)
                    .frame(width: 80, height: 60)
                    .background(Color.red.opacity(0.15))
                    .cornerRadius(12)
                }
            }
            .padding(.bottom, 40)
        }
    }
    
    private var phaseProgressBar: some View {
        let phaseDuration: Int
        switch manager.currentPhase {
        case .preparing: phaseDuration = manager.prepareDuration * 60
        case .entering: phaseDuration = manager.enteringDuration * 60
        case .deepWork: phaseDuration = manager.deepWorkDuration * 60
        case .rest: phaseDuration = manager.restDuration * 60
        case .complete: phaseDuration = 1
        }
        
        let progress = min(Double(manager.phaseSeconds) / Double(phaseDuration), 1.0)
        
        return GeometryReader { geo in
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 4)
                    .fill(Color.white.opacity(0.1))
                
                RoundedRectangle(cornerRadius: 4)
                    .fill(manager.currentPhase.color)
                    .frame(width: geo.size.width * progress)
            }
        }
        .frame(height: 6)
        .padding(.horizontal, 60)
    }
    
    private func formatTime(_ seconds: Int) -> String {
        let mins = seconds / 60
        let secs = seconds % 60
        return String(format: "%02d:%02d", mins, secs)
    }
}

// MARK: - Supporting Sheets

struct FlowSettingsSheet: View {
    @ObservedObject var manager: FlowStateManager
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Phase Durations (minutes)")) {
                    Stepper("Prepare: \(manager.prepareDuration)m", value: $manager.prepareDuration, in: 1...10)
                    Stepper("Entering: \(manager.enteringDuration)m", value: $manager.enteringDuration, in: 3...15)
                    Stepper("Deep Work: \(manager.deepWorkDuration)m", value: $manager.deepWorkDuration, in: 15...90)
                    Stepper("Rest: \(manager.restDuration)m", value: $manager.restDuration, in: 3...15)
                }
                
                Section(header: Text("Feedback")) {
                    Toggle("Sounds", isOn: $manager.enableSounds)
                    Toggle("Haptics", isOn: $manager.enableHaptics)
                }
            }
            .navigationTitle("FlowState Settings")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") { dismiss() }
                }
            }
        }
    }
}

struct FlowHistorySheet: View {
    let sessions: [FlowSession]
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            List(sessions) { session in
                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        Text(session.intention)
                            .font(.headline)
                        Spacer()
                        Text("\(session.totalMinutes)m")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    
                    HStack {
                        Text("Deep: \(session.deepFlowMinutes)m")
                        Text("•")
                        Text("Distractions: \(session.distractionCount)")
                        if let mood = session.mood {
                            Text("•")
                            Text(mood.rawValue)
                        }
                    }
                    .font(.caption)
                    .foregroundColor(.secondary)
                    
                    Text(session.startTime.formatted(date: .abbreviated, time: .shortened))
                        .font(.caption2)
                        .foregroundColor(.secondary)
                }
                .padding(.vertical, 4)
            }
            .navigationTitle("Session History")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") { dismiss() }
                }
            }
        }
    }
}

struct EndSessionSheet: View {
    @Binding var notes: String
    @Binding var mood: FlowMood?
    let onComplete: () -> Void
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("How was your session?")) {
                    ForEach(FlowMood.allCases, id: \.self) { m in
                        Button(action: { mood = m }) {
                            HStack {
                                Text(m.rawValue)
                                Spacer()
                                if mood == m {
                                    Image(systemName: "checkmark")
                                        .foregroundColor(.green)
                                }
                            }
                        }
                        .foregroundColor(.primary)
                    }
                }
                
                Section(header: Text("Notes (optional)")) {
                    TextEditor(text: $notes)
                        .frame(minHeight: 100)
                }
            }
            .navigationTitle("End Session")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") { dismiss() }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Complete") { onComplete() }
                        .fontWeight(.bold)
                }
            }
        }
    }
}

// MARK: - Preview

#Preview {
    FlowStateView()
}
