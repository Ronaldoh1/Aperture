// MindShieldView.swift
// Shielding Minds from the Mental Malware of Modernity
// Scan media diet, detect manipulation patterns, suggest detox

import SwiftUI

// MARK: - Models

struct MediaConsumption: Identifiable, Codable {
    let id: UUID
    let source: String
    let category: MediaCategory
    let hoursPerWeek: Double
    let manipulationScore: Int // 1-10
    let addedAt: Date
}

enum MediaCategory: String, Codable, CaseIterable {
    case socialMedia = "Social Media"
    case news = "News"
    case streaming = "Streaming"
    case podcasts = "Podcasts"
    case gaming = "Gaming"
    case reading = "Reading"
    case other = "Other"
    
    var icon: String {
        switch self {
        case .socialMedia: return "bubble.left.and.bubble.right"
        case .news: return "newspaper"
        case .streaming: return "play.tv"
        case .podcasts: return "headphones"
        case .gaming: return "gamecontroller"
        case .reading: return "book"
        case .other: return "ellipsis.circle"
        }
    }
    
    var color: Color {
        switch self {
        case .socialMedia: return .blue
        case .news: return .red
        case .streaming: return .purple
        case .podcasts: return .orange
        case .gaming: return .green
        case .reading: return .cyan
        case .other: return .gray
        }
    }
}

struct ManipulationPattern: Identifiable {
    let id = UUID()
    let name: String
    let description: String
    let examples: [String]
    let defense: String
    let icon: String
    let color: Color
}

// MARK: - Main View

struct MindShieldView: View {
    @StateObject private var mindShield = MindShieldManager()
    @State private var showingAddSource = false
    @State private var showingPatterns = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                // Header
                headerSection
                
                // Shield Status
                shieldStatusSection
                
                // Media Diet
                mediaDietSection
                
                // Quick Actions
                quickActionsSection
                
                // Daily Check
                dailyCheckSection
            }
            .padding()
        }
        .background(Color.black.ignoresSafeArea())
        .navigationTitle("MindShield")
        .navigationBarTitleDisplayMode(.inline)
        .sheet(isPresented: $showingAddSource) {
            AddMediaSourceView(mindShield: mindShield)
        }
        .sheet(isPresented: $showingPatterns) {
            ManipulationPatternsView()
        }
    }
    
    // MARK: - Header
    
    private var headerSection: some View {
        VStack(spacing: 12) {
            ZStack {
                Circle()
                    .fill(
                        LinearGradient(
                            colors: [.blue, .purple],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(width: 80, height: 80)
                
                Image(systemName: "shield.checkered")
                    .font(.system(size: 32))
                    .foregroundColor(.white)
            }
            
            Text("MINDSHIELD")
                .font(.system(size: 24, weight: .black))
                .foregroundColor(.white)
            
            Text("Protect your consciousness from manipulation")
                .font(.system(size: 14))
                .foregroundColor(.gray)
        }
    }
    
    // MARK: - Shield Status
    
    private var shieldStatusSection: some View {
        VStack(spacing: 16) {
            HStack {
                Image(systemName: "shield.fill")
                    .foregroundColor(mindShield.shieldStrength > 70 ? .green : mindShield.shieldStrength > 40 ? .yellow : .red)
                Text("SHIELD STRENGTH")
                    .font(.system(size: 12, weight: .black))
                    .foregroundColor(mindShield.shieldStrength > 70 ? .green : mindShield.shieldStrength > 40 ? .yellow : .red)
                Spacer()
            }
            
            // Shield Meter
            ZStack(alignment: .leading) {
                Capsule()
                    .fill(Color.white.opacity(0.1))
                    .frame(height: 20)
                
                Capsule()
                    .fill(
                        LinearGradient(
                            colors: mindShield.shieldStrength > 70 ? [.green, .cyan] : mindShield.shieldStrength > 40 ? [.yellow, .orange] : [.red, .orange],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .frame(width: CGFloat(mindShield.shieldStrength) / 100 * (UIScreen.main.bounds.width - 64), height: 20)
                
                Text("\(mindShield.shieldStrength)%")
                    .font(.system(size: 11, weight: .bold))
                    .foregroundColor(.white)
                    .padding(.leading, 8)
            }
            
            Text(mindShield.shieldMessage)
                .font(.system(size: 12))
                .foregroundColor(.gray)
        }
        .padding()
        .background(Color.white.opacity(0.05))
        .cornerRadius(16)
    }
    
    // MARK: - Media Diet
    
    private var mediaDietSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(systemName: "chart.pie.fill")
                    .foregroundColor(.cyan)
                Text("YOUR MEDIA DIET")
                    .font(.system(size: 12, weight: .black))
                    .foregroundColor(.cyan)
                
                Spacer()
                
                Button(action: { showingAddSource = true }) {
                    Image(systemName: "plus.circle.fill")
                        .foregroundColor(.cyan)
                }
            }
            
            if mindShield.mediaSources.isEmpty {
                emptyMediaCard
            } else {
                ForEach(mindShield.mediaSources) { source in
                    mediaSourceRow(source)
                }
                
                // Total Hours
                HStack {
                    Text("Total weekly screen time:")
                        .font(.system(size: 12))
                        .foregroundColor(.gray)
                    Spacer()
                    Text("\(String(format: "%.1f", mindShield.totalHours)) hours")
                        .font(.system(size: 12, weight: .bold))
                        .foregroundColor(mindShield.totalHours > 40 ? .red : mindShield.totalHours > 20 ? .yellow : .green)
                }
                .padding(.top, 8)
            }
        }
        .padding()
        .background(Color.cyan.opacity(0.1))
        .cornerRadius(16)
    }
    
    private var emptyMediaCard: some View {
        VStack(spacing: 10) {
            Image(systemName: "antenna.radiowaves.left.and.right")
                .font(.system(size: 30))
                .foregroundColor(.gray)
            Text("Track your media consumption")
                .font(.system(size: 13))
                .foregroundColor(.gray)
            Button(action: { showingAddSource = true }) {
                Text("Add Source")
                    .font(.system(size: 12, weight: .semibold))
                    .foregroundColor(.white)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
                    .background(Color.cyan)
                    .cornerRadius(8)
            }
        }
        .frame(maxWidth: .infinity)
        .padding()
    }
    
    private func mediaSourceRow(_ source: MediaConsumption) -> some View {
        HStack {
            Image(systemName: source.category.icon)
                .foregroundColor(source.category.color)
                .frame(width: 24)
            
            VStack(alignment: .leading, spacing: 2) {
                Text(source.source)
                    .font(.system(size: 13, weight: .medium))
                    .foregroundColor(.white)
                Text("\(String(format: "%.1f", source.hoursPerWeek)) hrs/week")
                    .font(.system(size: 10))
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            // Manipulation indicator
            HStack(spacing: 2) {
                ForEach(0..<5) { i in
                    Circle()
                        .fill(i < source.manipulationScore / 2 ? Color.red : Color.white.opacity(0.2))
                        .frame(width: 6, height: 6)
                }
            }
        }
        .padding(10)
        .background(Color.white.opacity(0.03))
        .cornerRadius(8)
    }
    
    // MARK: - Quick Actions
    
    private var quickActionsSection: some View {
        HStack(spacing: 12) {
            quickActionButton("Patterns", icon: "exclamationmark.triangle.fill", color: .orange) {
                showingPatterns = true
            }
            quickActionButton("Detox", icon: "leaf.fill", color: .green) {
                // Show detox plan
            }
            quickActionButton("Alternatives", icon: "arrow.triangle.2.circlepath", color: .purple) {
                // Show alternative content
            }
        }
    }
    
    private func quickActionButton(_ title: String, icon: String, color: Color, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            VStack(spacing: 8) {
                Image(systemName: icon)
                    .font(.system(size: 22))
                    .foregroundColor(color)
                Text(title)
                    .font(.system(size: 11, weight: .semibold))
                    .foregroundColor(.white)
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 16)
            .background(color.opacity(0.2))
            .cornerRadius(12)
        }
    }
    
    // MARK: - Daily Check
    
    private var dailyCheckSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(systemName: "checkmark.shield.fill")
                    .foregroundColor(.green)
                Text("DAILY REALITY CHECK")
                    .font(.system(size: 12, weight: .black))
                    .foregroundColor(.green)
                Spacer()
            }
            
            Text("Ask yourself before consuming:")
                .font(.system(size: 12))
                .foregroundColor(.gray)
            
            VStack(alignment: .leading, spacing: 8) {
                checkQuestion("🤔", "Is this serving my growth or numbing me?")
                checkQuestion("⚡", "Is this activating fear or expanding awareness?")
                checkQuestion("🎯", "Who benefits from me believing this?")
                checkQuestion("🔄", "Am I seeking truth or confirmation?")
                checkQuestion("⏰", "Is this the best use of my time right now?")
            }
        }
        .padding()
        .background(Color.green.opacity(0.1))
        .cornerRadius(16)
    }
    
    private func checkQuestion(_ emoji: String, _ question: String) -> some View {
        HStack(alignment: .top, spacing: 10) {
            Text(emoji)
                .font(.system(size: 16))
            Text(question)
                .font(.system(size: 12))
                .foregroundColor(.white.opacity(0.9))
        }
    }
}

// MARK: - Manager

@MainActor
class MindShieldManager: ObservableObject {
    @Published var mediaSources: [MediaConsumption] = []
    @Published var shieldStrength: Int = 50
    
    var totalHours: Double {
        mediaSources.reduce(0) { $0 + $1.hoursPerWeek }
    }
    
    var shieldMessage: String {
        if shieldStrength > 70 {
            return "Your media diet is balanced. Keep it up!"
        } else if shieldStrength > 40 {
            return "Some manipulation detected. Review your sources."
        } else {
            return "High manipulation exposure. Detox recommended."
        }
    }
    
    private let storageKey = "mind_shield_sources"
    
    init() {
        loadSources()
        calculateShieldStrength()
    }
    
    func addSource(_ source: MediaConsumption) {
        mediaSources.append(source)
        saveSources()
        calculateShieldStrength()
    }
    
    func removeSource(_ source: MediaConsumption) {
        mediaSources.removeAll { $0.id == source.id }
        saveSources()
        calculateShieldStrength()
    }
    
    private func calculateShieldStrength() {
        guard !mediaSources.isEmpty else {
            shieldStrength = 50
            return
        }
        
        let avgManipulation = Double(mediaSources.reduce(0) { $0 + $1.manipulationScore }) / Double(mediaSources.count)
        let hoursScore = max(0, 100 - Int(totalHours * 2)) // Penalize high hours
        let manipulationScore = max(0, 100 - Int(avgManipulation * 10))
        
        shieldStrength = (hoursScore + manipulationScore) / 2
    }
    
    private func loadSources() {
        if let data = UserDefaults.standard.data(forKey: storageKey),
           let sources = try? JSONDecoder().decode([MediaConsumption].self, from: data) {
            mediaSources = sources
        }
    }
    
    private func saveSources() {
        if let data = try? JSONEncoder().encode(mediaSources) {
            UserDefaults.standard.set(data, forKey: storageKey)
        }
    }
}

// MARK: - Add Media Source View

struct AddMediaSourceView: View {
    @ObservedObject var mindShield: MindShieldManager
    @Environment(\.dismiss) private var dismiss
    
    @State private var sourceName = ""
    @State private var selectedCategory: MediaCategory = .socialMedia
    @State private var hoursPerWeek: Double = 5
    @State private var manipulationScore: Int = 5
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    // Source Name
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Source Name")
                            .font(.system(size: 12, weight: .bold))
                            .foregroundColor(.gray)
                        TextField("e.g., Instagram, CNN, Netflix", text: $sourceName)
                            .padding()
                            .background(Color.white.opacity(0.1))
                            .cornerRadius(10)
                    }
                    
                    // Category
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Category")
                            .font(.system(size: 12, weight: .bold))
                            .foregroundColor(.gray)
                        
                        LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))], spacing: 8) {
                            ForEach(MediaCategory.allCases, id: \.self) { category in
                                Button(action: { selectedCategory = category }) {
                                    HStack(spacing: 6) {
                                        Image(systemName: category.icon)
                                        Text(category.rawValue)
                                            .font(.system(size: 11))
                                    }
                                    .foregroundColor(selectedCategory == category ? .white : .gray)
                                    .padding(.horizontal, 12)
                                    .padding(.vertical, 8)
                                    .background(selectedCategory == category ? category.color : Color.white.opacity(0.1))
                                    .cornerRadius(8)
                                }
                            }
                        }
                    }
                    
                    // Hours per week
                    VStack(alignment: .leading, spacing: 8) {
                        HStack {
                            Text("Hours per Week")
                                .font(.system(size: 12, weight: .bold))
                                .foregroundColor(.gray)
                            Spacer()
                            Text("\(String(format: "%.1f", hoursPerWeek)) hrs")
                                .font(.system(size: 12, weight: .bold))
                                .foregroundColor(.white)
                        }
                        Slider(value: $hoursPerWeek, in: 0...40, step: 0.5)
                            .tint(.cyan)
                    }
                    
                    // Manipulation Score
                    VStack(alignment: .leading, spacing: 8) {
                        HStack {
                            Text("Manipulation Level")
                                .font(.system(size: 12, weight: .bold))
                                .foregroundColor(.gray)
                            Spacer()
                            Text("\(manipulationScore)/10")
                                .font(.system(size: 12, weight: .bold))
                                .foregroundColor(manipulationScore > 7 ? .red : manipulationScore > 4 ? .orange : .green)
                        }
                        Slider(value: Binding(
                            get: { Double(manipulationScore) },
                            set: { manipulationScore = Int($0) }
                        ), in: 1...10, step: 1)
                            .tint(.red)
                        
                        Text("How much does this source use fear, outrage, or division?")
                            .font(.system(size: 10))
                            .foregroundColor(.gray)
                    }
                }
                .padding()
            }
            .background(Color.black.ignoresSafeArea())
            .navigationTitle("Add Source")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") { dismiss() }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Add") {
                        let source = MediaConsumption(
                            id: UUID(),
                            source: sourceName,
                            category: selectedCategory,
                            hoursPerWeek: hoursPerWeek,
                            manipulationScore: manipulationScore,
                            addedAt: Date()
                        )
                        mindShield.addSource(source)
                        dismiss()
                    }
                    .disabled(sourceName.isEmpty)
                }
            }
        }
    }
}

// MARK: - Manipulation Patterns View

struct ManipulationPatternsView: View {
    @Environment(\.dismiss) private var dismiss
    
    let patterns: [ManipulationPattern] = [
        ManipulationPattern(
            name: "Fear-Mongering",
            description: "Using fear to bypass rational thinking and drive engagement",
            examples: ["Breaking: Crisis looming!", "You won't believe what's coming"],
            defense: "Pause. Ask: What do they want me to feel? Is this helping or hurting?",
            icon: "exclamationmark.triangle.fill",
            color: .red
        ),
        ManipulationPattern(
            name: "Outrage Bait",
            description: "Content designed to make you angry for engagement",
            examples: ["They said WHAT?!", "This will make you furious"],
            defense: "Notice the anger rising. That's the manipulation working. Don't share.",
            icon: "flame.fill",
            color: .orange
        ),
        ManipulationPattern(
            name: "Us vs Them",
            description: "Creating division to build tribal loyalty",
            examples: ["The left/right is destroying...", "Those people are..."],
            defense: "Remember: Most people want the same things. Focus on shared values.",
            icon: "arrow.left.and.right",
            color: .purple
        ),
        ManipulationPattern(
            name: "False Urgency",
            description: "Creating artificial time pressure to prevent thinking",
            examples: ["Act now!", "Limited time!", "Before it's too late!"],
            defense: "Real emergencies rarely come through your feed. Sleep on it.",
            icon: "clock.badge.exclamationmark.fill",
            color: .yellow
        ),
        ManipulationPattern(
            name: "Appeal to Authority",
            description: "Using credentials to shut down questioning",
            examples: ["Experts say...", "Studies show...", "Scientists agree..."],
            defense: "Who funded the study? What do dissenting experts say?",
            icon: "person.badge.shield.checkmark.fill",
            color: .blue
        ),
        ManipulationPattern(
            name: "Emotional Manipulation",
            description: "Bypassing logic by triggering strong emotions",
            examples: ["Think of the children!", "How can you not care?"],
            defense: "Strong emotions = your critical thinking is being bypassed.",
            icon: "heart.slash.fill",
            color: .pink
        )
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 16) {
                    Text("Learn to recognize manipulation tactics")
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                    
                    ForEach(patterns) { pattern in
                        patternCard(pattern)
                    }
                }
                .padding()
            }
            .background(Color.black.ignoresSafeArea())
            .navigationTitle("Manipulation Patterns")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") { dismiss() }
                }
            }
        }
    }
    
    private func patternCard(_ pattern: ManipulationPattern) -> some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Image(systemName: pattern.icon)
                    .foregroundColor(pattern.color)
                Text(pattern.name)
                    .font(.system(size: 15, weight: .bold))
                    .foregroundColor(.white)
            }
            
            Text(pattern.description)
                .font(.system(size: 12))
                .foregroundColor(.gray)
            
            VStack(alignment: .leading, spacing: 4) {
                Text("Examples:")
                    .font(.system(size: 10, weight: .bold))
                    .foregroundColor(.orange)
                ForEach(pattern.examples, id: \.self) { example in
                    Text("• \"\(example)\"")
                        .font(.system(size: 11))
                        .foregroundColor(.white.opacity(0.8))
                        .italic()
                }
            }
            
            HStack(alignment: .top, spacing: 6) {
                Image(systemName: "shield.checkered")
                    .foregroundColor(.green)
                    .font(.system(size: 10))
                Text(pattern.defense)
                    .font(.system(size: 11))
                    .foregroundColor(.green)
            }
            .padding(8)
            .background(Color.green.opacity(0.1))
            .cornerRadius(6)
        }
        .padding()
        .background(pattern.color.opacity(0.1))
        .cornerRadius(12)
    }
}

// MARK: - Reality Anchor View

struct RealityAnchorView: View {
    @State private var isBreathing = false
    @State private var breathPhase = "Inhale"
    @State private var breathCount = 0
    @State private var showingGrounding = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                // Header
                headerSection
                
                // Quick Grounding
                quickGroundingSection
                
                // Breathing Exercise
                breathingSection
                
                // Reality Check Widget
                realityCheckWidget
                
                // Narrative Mapping
                narrativeMappingSection
            }
            .padding()
        }
        .background(Color.black.ignoresSafeArea())
        .navigationTitle("Reality Anchor")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private var headerSection: some View {
        VStack(spacing: 12) {
            ZStack {
                Circle()
                    .fill(
                        LinearGradient(
                            colors: [.green, .cyan],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(width: 80, height: 80)
                
                Image(systemName: "anchor.circle.fill")
                    .font(.system(size: 38))
                    .foregroundColor(.white)
            }
            
            Text("REALITY ANCHOR")
                .font(.system(size: 24, weight: .black))
                .foregroundColor(.white)
            
            Text("Ground yourself when the world feels unreal")
                .font(.system(size: 14))
                .foregroundColor(.gray)
        }
    }
    
    private var quickGroundingSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(systemName: "hand.raised.fingers.spread.fill")
                    .foregroundColor(.green)
                Text("5-4-3-2-1 GROUNDING")
                    .font(.system(size: 12, weight: .black))
                    .foregroundColor(.green)
            }
            
            VStack(alignment: .leading, spacing: 8) {
                groundingRow("5️⃣", "See 5 things around you")
                groundingRow("4️⃣", "Touch 4 different textures")
                groundingRow("3️⃣", "Hear 3 distinct sounds")
                groundingRow("2️⃣", "Smell 2 things")
                groundingRow("1️⃣", "Taste 1 thing (or your own mouth)")
            }
        }
        .padding()
        .background(Color.green.opacity(0.1))
        .cornerRadius(16)
    }
    
    private func groundingRow(_ emoji: String, _ instruction: String) -> some View {
        HStack(spacing: 10) {
            Text(emoji)
            Text(instruction)
                .font(.system(size: 13))
                .foregroundColor(.white)
        }
    }
    
    private var breathingSection: some View {
        VStack(spacing: 16) {
            HStack {
                Image(systemName: "wind")
                    .foregroundColor(.cyan)
                Text("BOX BREATHING")
                    .font(.system(size: 12, weight: .black))
                    .foregroundColor(.cyan)
                Spacer()
            }
            
            // Breathing Animation
            ZStack {
                Circle()
                    .stroke(Color.white.opacity(0.1), lineWidth: 4)
                    .frame(width: 150, height: 150)
                
                Circle()
                    .fill(Color.cyan.opacity(0.3))
                    .frame(width: isBreathing ? 140 : 80, height: isBreathing ? 140 : 80)
                    .animation(.easeInOut(duration: 4).repeatForever(autoreverses: true), value: isBreathing)
                
                VStack {
                    Text(breathPhase)
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(.white)
                    Text("\(breathCount) breaths")
                        .font(.system(size: 12))
                        .foregroundColor(.gray)
                }
            }
            
            Button(action: { isBreathing.toggle() }) {
                HStack {
                    Image(systemName: isBreathing ? "stop.fill" : "play.fill")
                    Text(isBreathing ? "Stop" : "Start Breathing")
                }
                .font(.system(size: 14, weight: .semibold))
                .foregroundColor(.white)
                .padding()
                .background(Color.cyan)
                .cornerRadius(12)
            }
        }
        .padding()
        .background(Color.cyan.opacity(0.1))
        .cornerRadius(16)
    }
    
    private var realityCheckWidget: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(systemName: "questionmark.circle.fill")
                    .foregroundColor(.yellow)
                Text("QUICK REALITY CHECK")
                    .font(.system(size: 12, weight: .black))
                    .foregroundColor(.yellow)
            }
            
            Text("Is this narrative serving you?")
                .font(.system(size: 18, weight: .bold))
                .foregroundColor(.white)
            
            Text("When you feel reactive, pause and ask:")
                .font(.system(size: 12))
                .foregroundColor(.gray)
            
            VStack(alignment: .leading, spacing: 6) {
                Text("• What emotion is this triggering?")
                Text("• Who benefits from me feeling this way?")
                Text("• Is this information or manipulation?")
                Text("• Would I feel the same after a good sleep?")
            }
            .font(.system(size: 12))
            .foregroundColor(.white.opacity(0.8))
        }
        .padding()
        .background(Color.yellow.opacity(0.1))
        .cornerRadius(16)
    }
    
    private var narrativeMappingSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(systemName: "map.fill")
                    .foregroundColor(.purple)
                Text("NARRATIVE MAPPING")
                    .font(.system(size: 12, weight: .black))
                    .foregroundColor(.purple)
            }
            
            Text("Visualize how societal stories shape your beliefs")
                .font(.system(size: 12))
                .foregroundColor(.gray)
            
            VStack(spacing: 8) {
                narrativeRow("Work hard = success", "Ignores systemic barriers & luck")
                narrativeRow("Buy more = be happier", "Corporations benefit, not you")
                narrativeRow("Left vs Right matters", "Both serve the same interests")
                narrativeRow("You are what you own", "Identity ≠ possessions")
            }
            
            Text("Coming Soon: Interactive narrative mapping tool")
                .font(.system(size: 11))
                .foregroundColor(.purple)
                .italic()
        }
        .padding()
        .background(Color.purple.opacity(0.1))
        .cornerRadius(16)
    }
    
    private func narrativeRow(_ narrative: String, _ truth: String) -> some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 2) {
                Text(narrative)
                    .font(.system(size: 12, weight: .medium))
                    .foregroundColor(.white)
                    .strikethrough()
                Text(truth)
                    .font(.system(size: 10))
                    .foregroundColor(.green)
            }
            Spacer()
        }
        .padding(8)
        .background(Color.white.opacity(0.03))
        .cornerRadius(6)
    }
}

#Preview("MindShield") {
    NavigationView {
        MindShieldView()
    }
}

#Preview("Reality Anchor") {
    NavigationView {
        RealityAnchorView()
    }
}
