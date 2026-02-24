// GodModeToolsComplete.swift
// GodMode - Full implementations of all consciousness tools

import SwiftUI

// MARK: - SATS Chamber (State Akin to Sleep)
struct SATSChamberFullView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var selectedDuration = 7
    @State private var scene = ""
    @State private var feeling = ""
    @State private var isSessionActive = false
    @State private var breathCount = 0
    @State private var sessionPhase: SATSPhase = .preparation
    
    enum SATSPhase: String {
        case preparation = "Preparation"
        case relaxation = "Relaxation"
        case visualization = "Visualization"
        case feeling = "Feeling"
        case completion = "Completion"
    }
    
    let durations = [7, 14, 21, 30]
    
    var body: some View {
        NavigationStack {
            ZStack {
                // Deep blue night background
                LinearGradient(
                    colors: [Color(hex: "0a0a2e"), Color(hex: "1a1a4e"), Color(hex: "0a0a1a")],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
                
                // Stars
                GeometryReader { geo in
                    ForEach(0..<30, id: \.self) { i in
                        Circle()
                            .fill(Color.white.opacity(Double.random(in: 0.2...0.6)))
                            .frame(width: CGFloat.random(in: 1...2))
                            .position(
                                x: CGFloat.random(in: 0...geo.size.width),
                                y: CGFloat.random(in: 0...geo.size.height)
                            )
                    }
                }
                
                if isSessionActive {
                    activeSessionView
                } else {
                    setupView
                }
            }
            .navigationTitle("🌙 SATS Chamber")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") { dismiss() }
                        .foregroundStyle(Color(hex: "6B8DD6"))
                }
            }
        }
    }
    
    private var setupView: some View {
        ScrollView {
            VStack(spacing: 24) {
                // Header
                VStack(spacing: 12) {
                    Text("🌙")
                        .font(.system(size: 60))
                    
                    Text("State Akin to Sleep")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                    
                    Text("Neville Goddard's manifestation technique")
                        .font(.subheadline)
                        .foregroundStyle(.white.opacity(0.7))
                }
                .padding(.vertical, 20)
                
                // Instructions
                VStack(alignment: .leading, spacing: 12) {
                    Text("📖 THE TECHNIQUE")
                        .font(.caption)
                        .foregroundStyle(.white.opacity(0.6))
                        .tracking(2)
                    
                    instructionRow(num: 1, text: "Lie down in bed, ready to sleep")
                    instructionRow(num: 2, text: "Relax completely - body and mind")
                    instructionRow(num: 3, text: "Create a short scene implying wish fulfilled")
                    instructionRow(num: 4, text: "Loop the scene until you fall asleep")
                    instructionRow(num: 5, text: "Feel it real - the HAVING, not wanting")
                }
                .padding()
                .background(Color.white.opacity(0.05))
                .cornerRadius(12)
                
                // Scene Input
                VStack(alignment: .leading, spacing: 8) {
                    Text("🎬 YOUR SCENE")
                        .font(.caption)
                        .foregroundStyle(.white.opacity(0.6))
                    
                    TextField("Describe your short scene (5-10 seconds max)", text: $scene, axis: .vertical)
                        .textFieldStyle(.plain)
                        .padding()
                        .background(Color.white.opacity(0.1))
                        .cornerRadius(12)
                        .foregroundStyle(.white)
                        .lineLimit(3...5)
                }
                
                // Feeling Input
                VStack(alignment: .leading, spacing: 8) {
                    Text("💫 DOMINANT FEELING")
                        .font(.caption)
                        .foregroundStyle(.white.opacity(0.6))
                    
                    TextField("What emotion does the fulfilled wish evoke?", text: $feeling)
                        .textFieldStyle(.plain)
                        .padding()
                        .background(Color.white.opacity(0.1))
                        .cornerRadius(12)
                        .foregroundStyle(.white)
                }
                
                // Duration Picker
                VStack(alignment: .leading, spacing: 8) {
                    Text("📅 COMMITMENT")
                        .font(.caption)
                        .foregroundStyle(.white.opacity(0.6))
                    
                    Picker("Duration", selection: $selectedDuration) {
                        ForEach(durations, id: \.self) { days in
                            Text("\(days) nights").tag(days)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                // Start Button
                Button(action: { isSessionActive = true }) {
                    Text("Begin SATS Session")
                        .font(.headline)
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(
                            LinearGradient(
                                colors: [Color(hex: "4B6CB7"), Color(hex: "182848")],
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .cornerRadius(12)
                }
                .disabled(scene.isEmpty || feeling.isEmpty)
                .opacity((scene.isEmpty || feeling.isEmpty) ? 0.5 : 1)
                
                Spacer(minLength: 50)
            }
            .padding(.horizontal, 20)
            .padding(.top, 20)
        }
    }
    
    private var activeSessionView: some View {
        VStack(spacing: 40) {
            Spacer()
            
            // Phase indicator
            Text(sessionPhase.rawValue.uppercased())
                .font(.caption)
                .foregroundStyle(Color(hex: "6B8DD6"))
                .tracking(4)
            
            // Moon animation
            ZStack {
                Circle()
                    .fill(
                        RadialGradient(
                            colors: [Color(hex: "6B8DD6").opacity(0.3), Color.clear],
                            center: .center,
                            startRadius: 50,
                            endRadius: 150
                        )
                    )
                    .frame(width: 300, height: 300)
                
                Text("🌙")
                    .font(.system(size: 100))
            }
            
            // Instructions for current phase
            Text(phaseInstruction)
                .font(.title3)
                .foregroundStyle(.white)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 40)
            
            // Progress through phases
            HStack(spacing: 8) {
                ForEach(SATSPhase.allCases, id: \.rawValue) { phase in
                    Circle()
                        .fill(phase == sessionPhase ? Color(hex: "6B8DD6") : Color.white.opacity(0.3))
                        .frame(width: 8, height: 8)
                }
            }
            
            Spacer()
            
            // Exit button
            Button("End Session") {
                isSessionActive = false
            }
            .foregroundStyle(.white.opacity(0.6))
            .padding(.bottom, 40)
        }
    }
    
    private var phaseInstruction: String {
        switch sessionPhase {
        case .preparation: return "Get comfortable. Close your eyes. Release the day."
        case .relaxation: return "Breathe deeply. Feel your body becoming heavy."
        case .visualization: return "See your scene clearly. You are there."
        case .feeling: return "Feel the joy, relief, gratitude of having it NOW."
        case .completion: return "Let go. Drift to sleep knowing it is done."
        }
    }
    
    private func instructionRow(num: Int, text: String) -> some View {
        HStack(alignment: .top, spacing: 12) {
            Text("\(num)")
                .font(.caption)
                .fontWeight(.bold)
                .foregroundStyle(Color(hex: "6B8DD6"))
                .frame(width: 20)
            Text(text)
                .font(.subheadline)
                .foregroundStyle(.white.opacity(0.9))
        }
    }
}

extension SATSChamberFullView.SATSPhase: CaseIterable {
    static var allCases: [SATSChamberFullView.SATSPhase] = [.preparation, .relaxation, .visualization, .feeling, .completion]
}

// MARK: - Mental Diet View (Full Implementation)
struct MentalDietFullView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var negativeThought = ""
    @State private var flippedThought = ""
    @State private var thoughtLog: [ThoughtEntry] = []
    @State private var showFlipAnimation = false
    
    struct ThoughtEntry: Identifiable {
        let id = UUID()
        let negative: String
        let positive: String
        let timestamp: Date
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(
                    colors: [Color(hex: "0a0a1a"), Color(hex: "1a2a3a")],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
                
                ScrollView {
                    VStack(spacing: 24) {
                        // Header
                        VStack(spacing: 12) {
                            Text("🧠")
                                .font(.system(size: 60))
                            
                            Text("Mental Diet")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundStyle(.white)
                            
                            Text("Catch negative thoughts. Flip them immediately.")
                                .font(.subheadline)
                                .foregroundStyle(.white.opacity(0.7))
                        }
                        .padding(.vertical, 20)
                        
                        // Neville Quote
                        VStack(spacing: 8) {
                            Text("\"You must assume the feeling of the wish fulfilled until your assumption has all the sensory vividness of reality.\"")
                                .font(.caption)
                                .italic()
                                .foregroundStyle(.white.opacity(0.7))
                                .multilineTextAlignment(.center)
                            Text("— Neville Goddard")
                                .font(.caption2)
                                .foregroundStyle(Color(hex: "00BFFF"))
                        }
                        .padding()
                        .background(Color.white.opacity(0.05))
                        .cornerRadius(12)
                        
                        // Input Section
                        VStack(alignment: .leading, spacing: 16) {
                            Text("❌ NEGATIVE THOUGHT")
                                .font(.caption)
                                .foregroundStyle(.red.opacity(0.8))
                            
                            TextField("What limiting thought came up?", text: $negativeThought, axis: .vertical)
                                .textFieldStyle(.plain)
                                .padding()
                                .background(Color.red.opacity(0.1))
                                .cornerRadius(12)
                                .foregroundStyle(.white)
                            
                            Text("✅ FLIPPED THOUGHT")
                                .font(.caption)
                                .foregroundStyle(.green.opacity(0.8))
                            
                            TextField("What's the empowered version?", text: $flippedThought, axis: .vertical)
                                .textFieldStyle(.plain)
                                .padding()
                                .background(Color.green.opacity(0.1))
                                .cornerRadius(12)
                                .foregroundStyle(.white)
                            
                            Button(action: logThought) {
                                HStack {
                                    Image(systemName: "arrow.triangle.2.circlepath")
                                    Text("Flip & Log")
                                }
                                .font(.headline)
                                .foregroundStyle(.white)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color(hex: "27AE60"))
                                .cornerRadius(12)
                            }
                            .disabled(negativeThought.isEmpty || flippedThought.isEmpty)
                        }
                        .padding()
                        .background(Color.white.opacity(0.05))
                        .cornerRadius(16)
                        
                        // Today's Log
                        if !thoughtLog.isEmpty {
                            VStack(alignment: .leading, spacing: 12) {
                                Text("📝 TODAY'S FLIPS (\(thoughtLog.count))")
                                    .font(.caption)
                                    .foregroundStyle(.white.opacity(0.6))
                                    .tracking(2)
                                
                                ForEach(thoughtLog) { entry in
                                    VStack(alignment: .leading, spacing: 8) {
                                        HStack {
                                            Text("❌")
                                            Text(entry.negative)
                                                .font(.caption)
                                                .foregroundStyle(.white.opacity(0.6))
                                                .strikethrough()
                                        }
                                        HStack {
                                            Text("✅")
                                            Text(entry.positive)
                                                .font(.caption)
                                                .foregroundStyle(.green)
                                        }
                                    }
                                    .padding()
                                    .background(Color.white.opacity(0.05))
                                    .cornerRadius(8)
                                }
                            }
                        }
                        
                        Spacer(minLength: 50)
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 20)
                }
            }
            .navigationTitle("🧠 Mental Diet")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") { dismiss() }
                        .foregroundStyle(Color(hex: "00BFFF"))
                }
            }
        }
    }
    
    private func logThought() {
        let entry = ThoughtEntry(negative: negativeThought, positive: flippedThought, timestamp: Date())
        thoughtLog.insert(entry, at: 0)
        negativeThought = ""
        flippedThought = ""
    }
}

// MARK: - Synchronicity Tracker (Full Implementation)
struct SynchronicityTrackerFullView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var newSync = ""
    @State private var selectedCategory: SyncCategory = .numbers
    @State private var syncLog: [SyncEntry] = []
    
    enum SyncCategory: String, CaseIterable {
        case numbers = "🔢 Numbers"
        case animals = "🦋 Animals"
        case people = "👤 People"
        case songs = "🎵 Songs"
        case dreams = "💭 Dreams"
        case signs = "🪧 Signs"
        case other = "✨ Other"
    }
    
    struct SyncEntry: Identifiable {
        let id = UUID()
        let description: String
        let category: SyncCategory
        let timestamp: Date
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(
                    colors: [Color(hex: "0a0a1a"), Color(hex: "2a1a3a")],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
                
                ScrollView {
                    VStack(spacing: 24) {
                        // Header
                        VStack(spacing: 12) {
                            Text("✨")
                                .font(.system(size: 60))
                            
                            Text("Synchronicity Tracker")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundStyle(.white)
                            
                            Text("The universe is always communicating")
                                .font(.subheadline)
                                .foregroundStyle(.white.opacity(0.7))
                        }
                        .padding(.vertical, 20)
                        
                        // Category Picker
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 8) {
                                ForEach(SyncCategory.allCases, id: \.rawValue) { cat in
                                    Button(action: { selectedCategory = cat }) {
                                        Text(cat.rawValue)
                                            .font(.caption)
                                            .padding(.horizontal, 12)
                                            .padding(.vertical, 8)
                                            .background(selectedCategory == cat ? Color(hex: "9B59B6") : Color.white.opacity(0.1))
                                            .cornerRadius(20)
                                            .foregroundStyle(.white)
                                    }
                                }
                            }
                        }
                        
                        // Input
                        VStack(alignment: .leading, spacing: 8) {
                            TextField("What synchronicity did you notice?", text: $newSync, axis: .vertical)
                                .textFieldStyle(.plain)
                                .padding()
                                .background(Color.white.opacity(0.1))
                                .cornerRadius(12)
                                .foregroundStyle(.white)
                            
                            Button(action: logSync) {
                                HStack {
                                    Image(systemName: "plus.circle.fill")
                                    Text("Log Synchronicity")
                                }
                                .font(.headline)
                                .foregroundStyle(.white)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color(hex: "9B59B6"))
                                .cornerRadius(12)
                            }
                            .disabled(newSync.isEmpty)
                        }
                        
                        // Log
                        if !syncLog.isEmpty {
                            VStack(alignment: .leading, spacing: 12) {
                                Text("📜 RECENT SYNCHRONICITIES")
                                    .font(.caption)
                                    .foregroundStyle(.white.opacity(0.6))
                                    .tracking(2)
                                
                                ForEach(syncLog) { entry in
                                    HStack(alignment: .top, spacing: 12) {
                                        Text(entry.category.rawValue.prefix(2))
                                            .font(.title2)
                                        
                                        VStack(alignment: .leading, spacing: 4) {
                                            Text(entry.description)
                                                .font(.subheadline)
                                                .foregroundStyle(.white)
                                            
                                            Text(entry.timestamp, style: .relative)
                                                .font(.caption2)
                                                .foregroundStyle(.white.opacity(0.5))
                                        }
                                        
                                        Spacer()
                                    }
                                    .padding()
                                    .background(Color.white.opacity(0.05))
                                    .cornerRadius(12)
                                }
                            }
                        }
                        
                        Spacer(minLength: 50)
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 20)
                }
            }
            .navigationTitle("✨ Sync Tracker")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") { dismiss() }
                        .foregroundStyle(Color(hex: "9B59B6"))
                }
            }
        }
    }
    
    private func logSync() {
        let entry = SyncEntry(description: newSync, category: selectedCategory, timestamp: Date())
        syncLog.insert(entry, at: 0)
        newSync = ""
    }
}

// MARK: - Solar Sync (Full Implementation)
struct SolarSyncFullView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var selectedProtocol: SolarProtocol = .sungazing
    
    enum SolarProtocol: String, CaseIterable {
        case sungazing = "Sun Gazing"
        case morningLight = "Morning Light"
        case pinealActivation = "Pineal Activation"
        case circadianReset = "Circadian Reset"
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(
                    colors: [Color(hex: "1a1a0a"), Color(hex: "3a2a0a"), Color(hex: "0a0a0a")],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
                
                ScrollView {
                    VStack(spacing: 24) {
                        // Header
                        VStack(spacing: 12) {
                            Text("☀️")
                                .font(.system(size: 60))
                            
                            Text("Solar Sync")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundStyle(.white)
                            
                            Text("Align with natural light cycles")
                                .font(.subheadline)
                                .foregroundStyle(.white.opacity(0.7))
                        }
                        .padding(.vertical, 20)
                        
                        // Benefits
                        VStack(alignment: .leading, spacing: 12) {
                            Text("✨ BENEFITS")
                                .font(.caption)
                                .foregroundStyle(.white.opacity(0.6))
                                .tracking(2)
                            
                            benefitRow(icon: "🧠", text: "Decalcify pineal gland")
                            benefitRow(icon: "😴", text: "Regulate sleep-wake cycle")
                            benefitRow(icon: "⚡", text: "Boost energy naturally")
                            benefitRow(icon: "🧘", text: "Enhance meditation clarity")
                            benefitRow(icon: "🌅", text: "Connect with natural rhythms")
                        }
                        .padding()
                        .background(Color(hex: "FFD700").opacity(0.1))
                        .cornerRadius(12)
                        
                        // Protocols
                        VStack(alignment: .leading, spacing: 16) {
                            Text("🔆 PROTOCOLS")
                                .font(.caption)
                                .foregroundStyle(.white.opacity(0.6))
                                .tracking(2)
                            
                            ForEach(SolarProtocol.allCases, id: \.rawValue) { proto in
                                protocolCard(proto)
                            }
                        }
                        
                        // Safety Warning
                        VStack(spacing: 8) {
                            Text("⚠️ SAFETY")
                                .font(.caption)
                                .foregroundStyle(.orange)
                            Text("Only practice sun gazing during safe hours (first/last hour of daylight). Start with 10 seconds, increase gradually. Never look directly at bright sun.")
                                .font(.caption2)
                                .foregroundStyle(.white.opacity(0.6))
                                .multilineTextAlignment(.center)
                        }
                        .padding()
                        .background(Color.orange.opacity(0.1))
                        .cornerRadius(12)
                        
                        Spacer(minLength: 50)
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 20)
                }
            }
            .navigationTitle("☀️ Solar Sync")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") { dismiss() }
                        .foregroundStyle(Color(hex: "FFD700"))
                }
            }
        }
    }
    
    private func benefitRow(icon: String, text: String) -> some View {
        HStack(spacing: 12) {
            Text(icon)
            Text(text)
                .font(.subheadline)
                .foregroundStyle(.white.opacity(0.9))
        }
    }
    
    private func protocolCard(_ proto: SolarProtocol) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(proto.rawValue)
                .font(.headline)
                .foregroundStyle(.white)
            
            Text(protocolDescription(proto))
                .font(.caption)
                .foregroundStyle(.white.opacity(0.7))
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.white.opacity(0.05))
        .cornerRadius(12)
    }
    
    private func protocolDescription(_ proto: SolarProtocol) -> String {
        switch proto {
        case .sungazing: return "Gaze at sun during safe hours. Start 10 sec, add 10 sec daily. Max 44 minutes."
        case .morningLight: return "Get bright light exposure within 30 min of waking. No sunglasses."
        case .pinealActivation: return "Visualize sunlight entering third eye during sunrise/sunset meditation."
        case .circadianReset: return "Morning sun + evening darkness. Dim lights 2 hours before bed."
        }
    }
}

// MARK: - Bardo Navigator (Full Implementation)
struct BardoNavigatorFullView: View {
    @Environment(\.dismiss) private var dismiss
    
    let stages = [
        ("💫", "Chikhai Bardo", "The moment of death", "Clear Light of Reality appears. Recognize it as your own mind."),
        ("🌀", "Chonyid Bardo", "Reality hallucinations", "Peaceful and wrathful deities appear. They are projections of your mind."),
        ("🔄", "Sidpa Bardo", "Rebirth process", "Karmic visions lead to next incarnation. Maintain awareness to choose wisely.")
    ]
    
    let practices = [
        ("🧘", "Phowa", "Consciousness transfer practice"),
        ("💭", "Dream Yoga", "Maintain awareness in sleep"),
        ("🪷", "Deity Yoga", "Recognize appearances as mind"),
        ("📿", "Mantra", "Om Mani Padme Hum")
    ]
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(
                    colors: [Color(hex: "0a0a0a"), Color(hex: "1a0a1a"), Color(hex: "0a0a0a")],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
                
                ScrollView {
                    VStack(spacing: 24) {
                        // Header
                        VStack(spacing: 12) {
                            Text("💀")
                                .font(.system(size: 60))
                            
                            Text("Bardo Navigator")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundStyle(.white)
                            
                            Text("Tibetan Book of the Dead teachings")
                                .font(.subheadline)
                                .foregroundStyle(.white.opacity(0.7))
                        }
                        .padding(.vertical, 20)
                        
                        // Three Bardos
                        VStack(alignment: .leading, spacing: 16) {
                            Text("📜 THE THREE BARDOS")
                                .font(.caption)
                                .foregroundStyle(.white.opacity(0.6))
                                .tracking(2)
                            
                            ForEach(stages, id: \.1) { stage in
                                VStack(alignment: .leading, spacing: 8) {
                                    HStack {
                                        Text(stage.0)
                                            .font(.title2)
                                        Text(stage.1)
                                            .font(.headline)
                                            .foregroundStyle(.white)
                                    }
                                    Text(stage.2)
                                        .font(.caption)
                                        .foregroundStyle(Color(hex: "9B59B6"))
                                    Text(stage.3)
                                        .font(.caption)
                                        .foregroundStyle(.white.opacity(0.7))
                                }
                                .padding()
                                .background(Color.white.opacity(0.05))
                                .cornerRadius(12)
                            }
                        }
                        
                        // Practices
                        VStack(alignment: .leading, spacing: 16) {
                            Text("🧘 PREPARATION PRACTICES")
                                .font(.caption)
                                .foregroundStyle(.white.opacity(0.6))
                                .tracking(2)
                            
                            ForEach(practices, id: \.1) { practice in
                                HStack(spacing: 16) {
                                    Text(practice.0)
                                        .font(.title2)
                                    VStack(alignment: .leading) {
                                        Text(practice.1)
                                            .font(.subheadline)
                                            .foregroundStyle(.white)
                                        Text(practice.2)
                                            .font(.caption)
                                            .foregroundStyle(.white.opacity(0.6))
                                    }
                                    Spacer()
                                }
                                .padding()
                                .background(Color.white.opacity(0.05))
                                .cornerRadius(12)
                            }
                        }
                        
                        // Key Teaching
                        VStack(spacing: 8) {
                            Text("🔑 KEY TEACHING")
                                .font(.caption)
                                .foregroundStyle(Color(hex: "FFD700"))
                            Text("\"All appearances are projections of your own mind. Recognize this and you are free.\"")
                                .font(.caption)
                                .italic()
                                .foregroundStyle(.white.opacity(0.8))
                                .multilineTextAlignment(.center)
                        }
                        .padding()
                        .background(Color(hex: "FFD700").opacity(0.1))
                        .cornerRadius(12)
                        
                        Spacer(minLength: 50)
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 20)
                }
            }
            .navigationTitle("💀 Bardo Navigator")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") { dismiss() }
                        .foregroundStyle(Color(hex: "9B59B6"))
                }
            }
        }
    }
}

// MARK: - Vibration Shield (Full Implementation)
struct VibrationShieldFullView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var shieldActive = false
    @State private var selectedShield: ShieldType = .mirror
    
    enum ShieldType: String, CaseIterable {
        case mirror = "Mirror Shield"
        case golden = "Golden Egg"
        case violet = "Violet Flame"
        case grounding = "Earth Ground"
        case bubble = "Light Bubble"
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(
                    colors: [Color(hex: "0a0a1a"), Color(hex: "0a1a2a"), Color(hex: "0a0a1a")],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
                
                ScrollView {
                    VStack(spacing: 24) {
                        // Header
                        VStack(spacing: 12) {
                            ZStack {
                                if shieldActive {
                                    Circle()
                                        .stroke(shieldColor, lineWidth: 3)
                                        .frame(width: 100, height: 100)
                                        .opacity(0.5)
                                    Circle()
                                        .stroke(shieldColor, lineWidth: 2)
                                        .frame(width: 120, height: 120)
                                        .opacity(0.3)
                                }
                                Text("🛡️")
                                    .font(.system(size: 60))
                            }
                            
                            Text("Vibration Shield")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundStyle(.white)
                            
                            Text("Energetic protection techniques")
                                .font(.subheadline)
                                .foregroundStyle(.white.opacity(0.7))
                        }
                        .padding(.vertical, 20)
                        
                        // Shield Selection
                        VStack(alignment: .leading, spacing: 12) {
                            Text("🛡️ SELECT SHIELD TYPE")
                                .font(.caption)
                                .foregroundStyle(.white.opacity(0.6))
                                .tracking(2)
                            
                            ForEach(ShieldType.allCases, id: \.rawValue) { shield in
                                Button(action: { selectedShield = shield }) {
                                    HStack {
                                        Text(shieldIcon(shield))
                                            .font(.title2)
                                        VStack(alignment: .leading) {
                                            Text(shield.rawValue)
                                                .font(.subheadline)
                                                .foregroundStyle(.white)
                                            Text(shieldDescription(shield))
                                                .font(.caption)
                                                .foregroundStyle(.white.opacity(0.6))
                                        }
                                        Spacer()
                                        if selectedShield == shield {
                                            Image(systemName: "checkmark.circle.fill")
                                                .foregroundStyle(Color(hex: "00BFFF"))
                                        }
                                    }
                                    .padding()
                                    .background(selectedShield == shield ? Color(hex: "00BFFF").opacity(0.1) : Color.white.opacity(0.05))
                                    .cornerRadius(12)
                                }
                                .buttonStyle(.plain)
                            }
                        }
                        
                        // Activation
                        Button(action: { shieldActive.toggle() }) {
                            HStack {
                                Image(systemName: shieldActive ? "shield.checkered" : "shield")
                                Text(shieldActive ? "Shield Active" : "Activate Shield")
                            }
                            .font(.headline)
                            .foregroundStyle(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(shieldActive ? Color(hex: "27AE60") : Color(hex: "00BFFF"))
                            .cornerRadius(12)
                        }
                        
                        // Instructions
                        if shieldActive {
                            VStack(alignment: .leading, spacing: 8) {
                                Text("📖 VISUALIZATION")
                                    .font(.caption)
                                    .foregroundStyle(.white.opacity(0.6))
                                
                                Text(shieldVisualization(selectedShield))
                                    .font(.body)
                                    .foregroundStyle(.white.opacity(0.9))
                                    .lineSpacing(4)
                            }
                            .padding()
                            .background(shieldColor.opacity(0.1))
                            .cornerRadius(12)
                        }
                        
                        Spacer(minLength: 50)
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 20)
                }
            }
            .navigationTitle("🛡️ Vibe Shield")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") { dismiss() }
                        .foregroundStyle(Color(hex: "00BFFF"))
                }
            }
        }
    }
    
    private var shieldColor: Color {
        switch selectedShield {
        case .mirror: return .gray
        case .golden: return Color(hex: "FFD700")
        case .violet: return Color(hex: "9B59B6")
        case .grounding: return Color(hex: "8B4513")
        case .bubble: return Color(hex: "00BFFF")
        }
    }
    
    private func shieldIcon(_ shield: ShieldType) -> String {
        switch shield {
        case .mirror: return "🪞"
        case .golden: return "🥚"
        case .violet: return "🔥"
        case .grounding: return "🌍"
        case .bubble: return "🫧"
        }
    }
    
    private func shieldDescription(_ shield: ShieldType) -> String {
        switch shield {
        case .mirror: return "Reflects negative energy back to sender"
        case .golden: return "Surrounds you in protective golden light"
        case .violet: return "Transmutes negativity into positive energy"
        case .grounding: return "Connects you to Earth's stabilizing energy"
        case .bubble: return "Creates an impenetrable light barrier"
        }
    }
    
    private func shieldVisualization(_ shield: ShieldType) -> String {
        switch shield {
        case .mirror: return "Visualize a mirror surrounding your body. Any negative energy sent your way reflects back to its source, transformed."
        case .golden: return "See yourself inside a golden egg of light. This egg filters out all negative energy while allowing love and positivity through."
        case .violet: return "Invoke the violet flame of transmutation. See it burning around you, transforming all lower energies into light."
        case .grounding: return "Visualize roots extending from your feet deep into the Earth. Feel the stable, nurturing energy rising up through your body."
        case .bubble: return "Create a bubble of pure white light around you. This bubble is permeable only to high-vibration energy."
        }
    }
}

#Preview {
    SATSChamberFullView()
}
