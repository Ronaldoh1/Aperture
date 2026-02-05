// TruthVerificationToolkit.swift
// Tools to Discern Illusions from Reality
// Fact-check modern myths against Gnostic principles
// AI debating counterpoints - MVP: Local, V2: Cloud AI

import SwiftUI
import NaturalLanguage

// MARK: - Models

struct NarrativeAnalysis: Identifiable, Codable {
    let id: UUID
    let headline: String
    let timestamp: Date
    let overallScore: Int // 0-100, 100 = pure truth
    let propagandaTechniques: [DetectedTechnique]
    let gnosticAnalysis: GnosticLens
    let manipulationLevel: ManipulationLevel
    let demiurgeScore: Int // 0-100, how much it perpetuates control
    let awakeningSuggestion: String
    let counterpoints: [String]
    let whoBenefits: [String]
}

struct DetectedTechnique: Identifiable, Codable {
    let id = UUID()
    let name: String
    let description: String
    let severity: Int // 1-5
    let example: String
    let defense: String
}

struct GnosticLens: Codable {
    let demiurgeAlignment: Int // 0-100, how much it serves the Demiurge/control matrix
    let soulResonance: Int // 0-100, how much it resonates with awakened consciousness
    let archonTactics: [String] // Which Archon tactics are being used
    let pleromaTruth: String // What's the hidden truth beyond the illusion
    let pneumaticResponse: String // How an awakened person should respond
}

enum ManipulationLevel: String, CaseIterable, Codable {
    case none = "Clean"
    case light = "Light Spin"
    case moderate = "Propaganda-Lite"
    case heavy = "Heavy Manipulation"
    case extreme = "Full Matrix"
    
    var color: Color {
        switch self {
        case .none: return .green
        case .light: return .yellow
        case .moderate: return .orange
        case .heavy: return .red
        case .extreme: return .purple
        }
    }
    
    var icon: String {
        switch self {
        case .none: return "checkmark.shield.fill"
        case .light: return "exclamationmark.triangle"
        case .moderate: return "eye.trianglebadge.exclamationmark"
        case .heavy: return "xmark.octagon"
        case .extreme: return "theatermasks.fill"
        }
    }
}

// MARK: - Propaganda Technique Library

struct PropagandaTechnique: Identifiable {
    let id = UUID()
    let name: String
    let description: String
    let examples: [String]
    let keywords: [String]
    let defense: String
    let gnosticLink: String // How it relates to Gnostic control systems
}

// MARK: - Propaganda Database

struct PropagandaDatabase {
    
    static let allTechniques: [PropagandaTechnique] = [
        PropagandaTechnique(
            name: "Fear-Mongering",
            description: "Using fear to bypass rational thinking and trigger emotional responses",
            examples: [
                "Breaking: Crisis looming!",
                "If we don't act now, disaster will strike",
                "They're coming for your..."
            ],
            keywords: ["crisis", "emergency", "disaster", "threat", "danger", "warning", "urgent", "breaking", "panic", "fear"],
            defense: "Pause. Ask: What do they want me to feel? Fear rarely leads to good decisions.",
            gnosticLink: "The Archons feed on fear energy. Fear keeps you in the material illusion, disconnected from your divine spark."
        ),
        
        PropagandaTechnique(
            name: "Us vs. Them",
            description: "Creating division to build tribal loyalty and prevent unity",
            examples: [
                "The left/right is destroying...",
                "Those people are ruining everything",
                "Real Americans/Patriots believe..."
            ],
            keywords: ["they", "them", "those people", "liberals", "conservatives", "enemies", "traitors", "real", "true", "us"],
            defense: "Ask: Who benefits from this division? Most people want the same things.",
            gnosticLink: "The Demiurge's primary tool is separation. Division prevents collective awakening and maintains the prison of duality."
        ),
        
        PropagandaTechnique(
            name: "Appeal to Authority",
            description: "Using credentials to shut down questioning, regardless of actual expertise",
            examples: [
                "Experts say...",
                "Scientists agree...",
                "Studies show...",
                "Officials confirm..."
            ],
            keywords: ["experts", "scientists", "officials", "authorities", "studies show", "research proves", "consensus"],
            defense: "Ask: Who funded the study? What do dissenting experts say? Appeal to authority ≠ truth.",
            gnosticLink: "The Archons create false hierarchies. True gnosis comes from direct experience, not external authority."
        ),
        
        PropagandaTechnique(
            name: "Bandwagon / Social Proof",
            description: "Implying everyone is doing/believing something to pressure conformity",
            examples: [
                "Everyone knows that...",
                "Most people agree...",
                "Join the movement",
                "Don't be left behind"
            ],
            keywords: ["everyone", "most people", "trending", "viral", "popular", "majority", "consensus", "join"],
            defense: "Remember: Truth isn't determined by popularity. Mass delusion is historical fact.",
            gnosticLink: "The sleeping masses (hylics) follow the crowd. Pneumatics (awakened souls) follow inner knowing."
        ),
        
        PropagandaTechnique(
            name: "Emotional Manipulation",
            description: "Bypassing logic by triggering strong emotions",
            examples: [
                "Think of the children!",
                "How can you not care?",
                "Only monsters would...",
                "If you had a heart, you'd..."
            ],
            keywords: ["children", "innocent", "victims", "monsters", "heartless", "cruel", "care", "compassion"],
            defense: "Strong emotions = critical thinking bypassed. Pause before reacting.",
            gnosticLink: "Emotions are the Archons' playground. They manipulate your astral body through triggered feelings."
        ),
        
        PropagandaTechnique(
            name: "False Urgency",
            description: "Creating artificial time pressure to prevent thinking",
            examples: [
                "Act now or it's too late!",
                "Limited time only",
                "Before it's banned",
                "Last chance!"
            ],
            keywords: ["now", "urgent", "immediately", "limited", "last chance", "before it's too late", "act fast"],
            defense: "Real emergencies rarely come through your feed. Sleep on important decisions.",
            gnosticLink: "Time pressure traps you in the material realm. Eternity is your true home; nothing is truly urgent."
        ),
        
        PropagandaTechnique(
            name: "Card Stacking",
            description: "Presenting only selective information while hiding contrary evidence",
            examples: [
                "Studies prove X... (while ignoring contradicting studies)",
                "The facts are clear... (while omitting relevant facts)",
                "History shows... (cherry-picked history)"
            ],
            keywords: ["facts", "proves", "clearly", "obviously", "undeniable", "without doubt"],
            defense: "Ask: What are they NOT telling me? Seek contradicting viewpoints.",
            gnosticLink: "The Demiurge presents a partial reality as the whole truth. True gnosis sees beyond the veil."
        ),
        
        PropagandaTechnique(
            name: "Name-Calling / Labeling",
            description: "Using negative labels to trigger automatic rejection",
            examples: [
                "Conspiracy theorist",
                "Radical extremist",
                "Dangerous misinformation",
                "Anti-science"
            ],
            keywords: ["conspiracy", "extremist", "radical", "dangerous", "misinformation", "denier", "anti-"],
            defense: "Labels are designed to prevent thinking. Judge ideas on merit, not labels.",
            gnosticLink: "Labels are spells that bind perception. The Archons use language to limit consciousness."
        ),
        
        PropagandaTechnique(
            name: "Gaslighting",
            description: "Making you doubt your own perception and memory",
            examples: [
                "That never happened",
                "You're imagining things",
                "Everyone remembers it differently",
                "That's been debunked"
            ],
            keywords: ["debunked", "imagining", "never happened", "misremember", "false memory", "you're wrong"],
            defense: "Trust your direct experience. Document what you observe. Connect with others who remember.",
            gnosticLink: "The Demiurge's greatest trick is making you forget your divine origin. Trust your inner knowing."
        ),
        
        PropagandaTechnique(
            name: "Repetition",
            description: "Repeating claims until they feel true, regardless of accuracy",
            examples: [
                "As we've been saying...",
                "It's been established that...",
                "Everyone knows by now..."
            ],
            keywords: ["again", "repeatedly", "established", "well-known", "obvious", "as we've said"],
            defense: "Repetition doesn't create truth. The illusory truth effect is a documented psychological phenomenon.",
            gnosticLink: "The Matrix repeats its programming endlessly. Break the loop through direct awareness."
        ),
        
        PropagandaTechnique(
            name: "Straw Man",
            description: "Misrepresenting an opponent's view to make it easier to attack",
            examples: [
                "They want to...",
                "Their position is basically...",
                "So you're saying..."
            ],
            keywords: ["they want", "they believe", "their position", "so you're saying", "in other words"],
            defense: "Ask: Is this an accurate representation of what they actually said?",
            gnosticLink: "The Archons distort truth into caricatures. Seek the original source, not the interpretation."
        ),
        
        PropagandaTechnique(
            name: "Appeal to Tradition",
            description: "Claiming something is right because it's always been done that way",
            examples: [
                "This is how we've always done it",
                "Traditional values demand...",
                "Throughout history..."
            ],
            keywords: ["tradition", "always", "heritage", "values", "customs", "ancestors", "historical"],
            defense: "Longevity doesn't equal truth. Many long-standing beliefs have been wrong.",
            gnosticLink: "The Demiurge perpetuates cycles. True gnosis breaks free from inherited conditioning."
        )
    ]
}

// MARK: - Analysis Service

class TruthAnalysisService: ObservableObject {
    static let shared = TruthAnalysisService()
    
    @Published var isAnalyzing = false
    @Published var lastAnalysis: NarrativeAnalysis?
    @Published var analysisHistory: [NarrativeAnalysis] = []
    
    private let tagger = NLTagger(tagSchemes: [.sentimentScore, .lexicalClass])
    
    init() {
        loadHistory()
    }
    
    // MARK: - Analyze Headline/Narrative
    
    func analyzeHeadline(_ headline: String) async -> NarrativeAnalysis {
        await MainActor.run { isAnalyzing = true }
        
        // Simulate processing time
        try? await Task.sleep(nanoseconds: 1_500_000_000)
        
        // Detect propaganda techniques
        let techniques = detectPropagandaTechniques(in: headline)
        
        // Calculate manipulation level
        let manipLevel = calculateManipulationLevel(techniques: techniques)
        
        // Generate Gnostic analysis
        let gnostic = generateGnosticAnalysis(headline: headline, techniques: techniques)
        
        // Calculate scores
        let overallScore = calculateTruthScore(techniques: techniques, gnostic: gnostic)
        let demiurgeScore = calculateDemiurgeScore(techniques: techniques, gnostic: gnostic)
        
        // Generate counterpoints
        let counterpoints = generateCounterpoints(headline: headline)
        
        // Identify beneficiaries
        let whoBenefits = identifyBeneficiaries(headline: headline, techniques: techniques)
        
        // Generate awakening suggestion
        let suggestion = generateAwakeningSuggestion(manipLevel: manipLevel, gnostic: gnostic)
        
        let analysis = NarrativeAnalysis(
            id: UUID(),
            headline: headline,
            timestamp: Date(),
            overallScore: overallScore,
            propagandaTechniques: techniques,
            gnosticAnalysis: gnostic,
            manipulationLevel: manipLevel,
            demiurgeScore: demiurgeScore,
            awakeningSuggestion: suggestion,
            counterpoints: counterpoints,
            whoBenefits: whoBenefits
        )
        
        await MainActor.run {
            isAnalyzing = false
            lastAnalysis = analysis
            analysisHistory.insert(analysis, at: 0)
            if analysisHistory.count > 50 { analysisHistory.removeLast() }
            saveHistory()
        }
        
        return analysis
    }
    
    // MARK: - Detection Logic
    
    private func detectPropagandaTechniques(in text: String) -> [DetectedTechnique] {
        var detected: [DetectedTechnique] = []
        let lowercased = text.lowercased()
        
        for technique in PropagandaDatabase.allTechniques {
            var matchCount = 0
            var matchedKeyword = ""
            
            for keyword in technique.keywords {
                if lowercased.contains(keyword.lowercased()) {
                    matchCount += 1
                    if matchedKeyword.isEmpty { matchedKeyword = keyword }
                }
            }
            
            if matchCount > 0 {
                let severity = min(5, matchCount + 1)
                detected.append(DetectedTechnique(
                    name: technique.name,
                    description: technique.description,
                    severity: severity,
                    example: "Detected: '\(matchedKeyword)'",
                    defense: technique.defense
                ))
            }
        }
        
        // Add sentiment analysis
        tagger.string = text
        let sentiment = tagger.tag(at: text.startIndex, unit: .paragraph, scheme: .sentimentScore).0?.rawValue ?? "0"
        let sentimentValue = Double(sentiment) ?? 0
        
        if sentimentValue < -0.5 {
            detected.append(DetectedTechnique(
                name: "Negative Emotional Loading",
                description: "The language is heavily loaded with negative emotion",
                severity: 4,
                example: "Sentiment score: \(String(format: "%.2f", sentimentValue))",
                defense: "High negative emotion = manipulation vector. Engage rational mind."
            ))
        }
        
        return detected
    }
    
    private func calculateManipulationLevel(techniques: [DetectedTechnique]) -> ManipulationLevel {
        let totalSeverity = techniques.reduce(0) { $0 + $1.severity }
        
        switch totalSeverity {
        case 0: return .none
        case 1...3: return .light
        case 4...7: return .moderate
        case 8...12: return .heavy
        default: return .extreme
        }
    }
    
    private func generateGnosticAnalysis(headline: String, techniques: [DetectedTechnique]) -> GnosticLens {
        let techCount = techniques.count
        let totalSeverity = techniques.reduce(0) { $0 + $1.severity }
        
        // Calculate alignment scores
        let demiurgeAlignment = min(100, totalSeverity * 8 + techCount * 5)
        let soulResonance = max(0, 100 - demiurgeAlignment)
        
        // Identify Archon tactics
        var archonTactics: [String] = []
        for tech in techniques {
            switch tech.name {
            case "Fear-Mongering":
                archonTactics.append("Archon of Fear feeding on anxiety energy")
            case "Us vs. Them":
                archonTactics.append("Archon of Division preventing unity consciousness")
            case "Appeal to Authority":
                archonTactics.append("Archon of False Hierarchy usurping inner knowing")
            case "Gaslighting":
                archonTactics.append("Archon of Forgetting obscuring divine memory")
            case "Emotional Manipulation":
                archonTactics.append("Archon of Passion controlling the astral body")
            default:
                break
            }
        }
        
        if archonTactics.isEmpty {
            archonTactics.append("Minimal Archonic influence detected")
        }
        
        // Generate Pleroma truth
        let pleromaTruth: String
        if demiurgeAlignment > 70 {
            pleromaTruth = "This narrative strongly serves the illusion-maintenance system. The truth it obscures: You are a divine spark experiencing temporary limitation. Don't let manufactured reality distort your eternal nature."
        } else if demiurgeAlignment > 40 {
            pleromaTruth = "Partial truth mixed with distortion. Discern what resonates with your inner knowing from what triggers your programming. The Pleroma (fullness) contains all perspectives in unity."
        } else {
            pleromaTruth = "This content has relatively low Archonic manipulation. Still apply discernment - even truth can be weaponized. Ask: Does this expand or contract my consciousness?"
        }
        
        // Generate pneumatic response
        let pneumaticResponse: String
        if demiurgeAlignment > 60 {
            pneumaticResponse = "Center in your divine spark before engaging. This content is designed to pull you into the material illusion. Observe without attachment. Ask: 'Who benefits if I react?' Respond from awareness, not programming."
        } else {
            pneumaticResponse = "Engage with discernment. Hold space for multiple perspectives. Remember: the map is not the territory. Your inner gnosis is the ultimate truth-detector."
        }
        
        return GnosticLens(
            demiurgeAlignment: demiurgeAlignment,
            soulResonance: soulResonance,
            archonTactics: archonTactics,
            pleromaTruth: pleromaTruth,
            pneumaticResponse: pneumaticResponse
        )
    }
    
    private func calculateTruthScore(techniques: [DetectedTechnique], gnostic: GnosticLens) -> Int {
        // Start at 100, reduce based on manipulation
        var score = 100
        
        for tech in techniques {
            score -= tech.severity * 5
        }
        
        // Factor in gnostic analysis
        score = (score + gnostic.soulResonance) / 2
        
        return max(0, min(100, score))
    }
    
    private func calculateDemiurgeScore(techniques: [DetectedTechnique], gnostic: GnosticLens) -> Int {
        return gnostic.demiurgeAlignment
    }
    
    private func generateCounterpoints(headline: String) -> [String] {
        // Generate Socratic questions as counterpoints
        return [
            "What is the opposite perspective, and what evidence supports it?",
            "Who is NOT being represented in this narrative?",
            "What historical examples contradict this framing?",
            "If this were false, what would that look like?",
            "What information would change your view on this?"
        ]
    }
    
    private func identifyBeneficiaries(headline: String, techniques: [DetectedTechnique]) -> [String] {
        var beneficiaries: [String] = []
        
        if techniques.contains(where: { $0.name == "Fear-Mongering" }) {
            beneficiaries.append("Those who profit from fear (security industry, pharma, media)")
        }
        if techniques.contains(where: { $0.name == "Us vs. Them" }) {
            beneficiaries.append("Those who benefit from divided populations (political parties, oligarchs)")
        }
        if techniques.contains(where: { $0.name == "Appeal to Authority" }) {
            beneficiaries.append("Established institutions seeking to maintain power")
        }
        if techniques.contains(where: { $0.name == "False Urgency" }) {
            beneficiaries.append("Those pushing a specific agenda on a timeline")
        }
        
        if beneficiaries.isEmpty {
            beneficiaries.append("Analysis required: Consider who gains if you believe this")
        }
        
        return beneficiaries
    }
    
    private func generateAwakeningSuggestion(manipLevel: ManipulationLevel, gnostic: GnosticLens) -> String {
        switch manipLevel {
        case .none:
            return "This content appears relatively clean. Still apply your inner discernment. Truth isn't about the source - it's about resonance with your highest knowing."
        case .light:
            return "Minor spin detected. Take a breath before sharing. Ask: 'Does this expand consciousness or create reaction?' The awakened response is always from center."
        case .moderate:
            return "Significant manipulation patterns present. Before engaging: Ground yourself, remember your divine nature, and observe the emotional hooks. Don't feed the narrative machine."
        case .heavy:
            return "Heavy manipulation detected. This content is engineered to trigger you. Practice radical non-reactivity. Your attention is energy - don't give it to the Demiurge's agenda."
        case .extreme:
            return "Full matrix programming detected. This is designed to keep you asleep. Step back completely. Meditate, connect with nature, or talk to someone grounded before engaging."
        }
    }
    
    // MARK: - Persistence
    
    private func saveHistory() {
        if let data = try? JSONEncoder().encode(analysisHistory) {
            UserDefaults.standard.set(data, forKey: "truth_analysis_history")
        }
    }
    
    private func loadHistory() {
        if let data = UserDefaults.standard.data(forKey: "truth_analysis_history"),
           let history = try? JSONDecoder().decode([NarrativeAnalysis].self, from: data) {
            analysisHistory = history
        }
    }
}

// MARK: - Main View

struct TruthVerificationToolkitView: View {
    @StateObject private var service = TruthAnalysisService.shared
    @State private var inputText = ""
    @State private var showingTechniquesLibrary = false
    @State private var showingHistory = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                // Header
                headerSection
                
                // Input Section
                inputSection
                
                // Analysis Button
                analyzeButton
                
                // Results
                if let analysis = service.lastAnalysis {
                    resultsSection(analysis)
                }
                
                // Quick Tools
                quickToolsSection
            }
            .padding()
        }
        .background(Color.black.ignoresSafeArea())
        .navigationTitle("Truth Toolkit")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Menu {
                    Button(action: { showingTechniquesLibrary = true }) {
                        Label("Propaganda Library", systemImage: "book.fill")
                    }
                    Button(action: { showingHistory = true }) {
                        Label("Analysis History", systemImage: "clock.fill")
                    }
                } label: {
                    Image(systemName: "ellipsis.circle")
                }
            }
        }
        .sheet(isPresented: $showingTechniquesLibrary) {
            PropagandaLibraryView()
        }
        .sheet(isPresented: $showingHistory) {
            AnalysisHistoryView(history: service.analysisHistory)
        }
    }
    
    // MARK: - Header
    
    private var headerSection: some View {
        VStack(spacing: 12) {
            ZStack {
                Circle()
                    .fill(
                        LinearGradient(
                            colors: [.purple, .red, .orange],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(width: 80, height: 80)
                
                Image(systemName: "eye.trianglebadge.exclamationmark")
                    .font(.system(size: 32))
                    .foregroundColor(.white)
            }
            
            Text("TRUTH VERIFICATION TOOLKIT")
                .font(.system(size: 20, weight: .black))
                .foregroundColor(.white)
            
            Text("Discern Illusions from Reality")
                .font(.system(size: 13))
                .foregroundColor(.gray)
            
            Text("Gnostic-Powered Narrative Analysis")
                .font(.system(size: 11))
                .foregroundColor(.purple)
                .italic()
        }
    }
    
    // MARK: - Input Section
    
    private var inputSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("ENTER HEADLINE OR NARRATIVE")
                .font(.system(size: 10, weight: .bold))
                .foregroundColor(.gray)
            
            TextEditor(text: $inputText)
                .frame(minHeight: 100)
                .padding(10)
                .background(Color.white.opacity(0.1))
                .cornerRadius(12)
                .foregroundColor(.white)
            
            Text("Paste a news headline, social media post, or any narrative to analyze")
                .font(.system(size: 10))
                .foregroundColor(.gray)
        }
    }
    
    // MARK: - Analyze Button
    
    private var analyzeButton: some View {
        Button(action: {
            guard !inputText.isEmpty else { return }
            Task {
                await service.analyzeHeadline(inputText)
            }
        }) {
            HStack {
                if service.isAnalyzing {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .white))
                        .scaleEffect(0.8)
                } else {
                    Image(systemName: "sparkle.magnifyingglass")
                }
                Text(service.isAnalyzing ? "Analyzing..." : "Analyze Narrative")
                    .font(.system(size: 16, weight: .bold))
            }
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .padding()
            .background(
                LinearGradient(
                    colors: inputText.isEmpty ? [.gray, .gray] : [.purple, .red],
                    startPoint: .leading,
                    endPoint: .trailing
                )
            )
            .cornerRadius(12)
        }
        .disabled(inputText.isEmpty || service.isAnalyzing)
    }
    
    // MARK: - Results Section
    
    private func resultsSection(_ analysis: NarrativeAnalysis) -> some View {
        VStack(spacing: 16) {
            // Overall Score
            overallScoreCard(analysis)
            
            // Manipulation Level
            manipulationCard(analysis)
            
            // Propaganda Techniques
            if !analysis.propagandaTechniques.isEmpty {
                techniquesCard(analysis)
            }
            
            // Gnostic Analysis
            gnosticCard(analysis)
            
            // Who Benefits
            beneficiariesCard(analysis)
            
            // Counterpoints
            counterpointsCard(analysis)
            
            // Awakening Suggestion
            suggestionCard(analysis)
        }
    }
    
    private func overallScoreCard(_ analysis: NarrativeAnalysis) -> some View {
        VStack(spacing: 12) {
            HStack {
                Image(systemName: "gauge.with.dots.needle.bottom.50percent")
                    .foregroundColor(.cyan)
                Text("TRUTH SCORE")
                    .font(.system(size: 12, weight: .black))
                    .foregroundColor(.cyan)
                Spacer()
            }
            
            HStack(spacing: 20) {
                // Truth Score
                VStack {
                    ZStack {
                        Circle()
                            .stroke(Color.white.opacity(0.2), lineWidth: 8)
                            .frame(width: 80, height: 80)
                        
                        Circle()
                            .trim(from: 0, to: CGFloat(analysis.overallScore) / 100)
                            .stroke(
                                analysis.overallScore > 60 ? Color.green :
                                analysis.overallScore > 30 ? Color.yellow : Color.red,
                                style: StrokeStyle(lineWidth: 8, lineCap: .round)
                            )
                            .frame(width: 80, height: 80)
                            .rotationEffect(.degrees(-90))
                        
                        Text("\(analysis.overallScore)")
                            .font(.system(size: 24, weight: .bold))
                            .foregroundColor(.white)
                    }
                    Text("Truth")
                        .font(.system(size: 10))
                        .foregroundColor(.gray)
                }
                
                // Demiurge Score
                VStack {
                    ZStack {
                        Circle()
                            .stroke(Color.white.opacity(0.2), lineWidth: 8)
                            .frame(width: 80, height: 80)
                        
                        Circle()
                            .trim(from: 0, to: CGFloat(analysis.demiurgeScore) / 100)
                            .stroke(
                                Color.purple,
                                style: StrokeStyle(lineWidth: 8, lineCap: .round)
                            )
                            .frame(width: 80, height: 80)
                            .rotationEffect(.degrees(-90))
                        
                        Text("\(analysis.demiurgeScore)")
                            .font(.system(size: 24, weight: .bold))
                            .foregroundColor(.white)
                    }
                    Text("Matrix")
                        .font(.system(size: 10))
                        .foregroundColor(.gray)
                }
            }
        }
        .padding()
        .background(Color.white.opacity(0.05))
        .cornerRadius(16)
    }
    
    private func manipulationCard(_ analysis: NarrativeAnalysis) -> some View {
        HStack {
            Image(systemName: analysis.manipulationLevel.icon)
                .font(.system(size: 24))
                .foregroundColor(analysis.manipulationLevel.color)
            
            VStack(alignment: .leading, spacing: 4) {
                Text("MANIPULATION LEVEL")
                    .font(.system(size: 10, weight: .bold))
                    .foregroundColor(.gray)
                Text(analysis.manipulationLevel.rawValue)
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(analysis.manipulationLevel.color)
            }
            
            Spacer()
        }
        .padding()
        .background(analysis.manipulationLevel.color.opacity(0.15))
        .cornerRadius(12)
    }
    
    private func techniquesCard(_ analysis: NarrativeAnalysis) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(systemName: "exclamationmark.triangle.fill")
                    .foregroundColor(.orange)
                Text("PROPAGANDA TECHNIQUES DETECTED")
                    .font(.system(size: 10, weight: .bold))
                    .foregroundColor(.orange)
            }
            
            ForEach(analysis.propagandaTechniques) { tech in
                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        Text(tech.name)
                            .font(.system(size: 13, weight: .semibold))
                            .foregroundColor(.white)
                        
                        Spacer()
                        
                        HStack(spacing: 2) {
                            ForEach(0..<5) { i in
                                Circle()
                                    .fill(i < tech.severity ? Color.red : Color.white.opacity(0.2))
                                    .frame(width: 6, height: 6)
                            }
                        }
                    }
                    
                    Text(tech.example)
                        .font(.system(size: 11))
                        .foregroundColor(.yellow)
                    
                    Text("Defense: \(tech.defense)")
                        .font(.system(size: 10))
                        .foregroundColor(.gray)
                        .italic()
                }
                .padding(10)
                .background(Color.red.opacity(0.1))
                .cornerRadius(8)
            }
        }
        .padding()
        .background(Color.white.opacity(0.05))
        .cornerRadius(16)
    }
    
    private func gnosticCard(_ analysis: NarrativeAnalysis) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(systemName: "eye.fill")
                    .foregroundColor(.purple)
                Text("GNOSTIC ANALYSIS")
                    .font(.system(size: 10, weight: .bold))
                    .foregroundColor(.purple)
            }
            
            // Archon Tactics
            VStack(alignment: .leading, spacing: 6) {
                Text("Archon Tactics Identified:")
                    .font(.system(size: 11, weight: .semibold))
                    .foregroundColor(.white)
                
                ForEach(analysis.gnosticAnalysis.archonTactics, id: \.self) { tactic in
                    HStack(alignment: .top, spacing: 6) {
                        Image(systemName: "theatermasks.fill")
                            .font(.system(size: 10))
                            .foregroundColor(.purple)
                        Text(tactic)
                            .font(.system(size: 11))
                            .foregroundColor(.gray)
                    }
                }
            }
            
            Divider().background(Color.white.opacity(0.2))
            
            // Pleroma Truth
            VStack(alignment: .leading, spacing: 4) {
                Text("Hidden Truth (Pleroma Perspective):")
                    .font(.system(size: 11, weight: .semibold))
                    .foregroundColor(.white)
                Text(analysis.gnosticAnalysis.pleromaTruth)
                    .font(.system(size: 11))
                    .foregroundColor(.cyan)
            }
            
            Divider().background(Color.white.opacity(0.2))
            
            // Pneumatic Response
            VStack(alignment: .leading, spacing: 4) {
                Text("Awakened Response:")
                    .font(.system(size: 11, weight: .semibold))
                    .foregroundColor(.white)
                Text(analysis.gnosticAnalysis.pneumaticResponse)
                    .font(.system(size: 11))
                    .foregroundColor(.green)
            }
        }
        .padding()
        .background(Color.purple.opacity(0.15))
        .cornerRadius(16)
    }
    
    private func beneficiariesCard(_ analysis: NarrativeAnalysis) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Image(systemName: "dollarsign.circle.fill")
                    .foregroundColor(.yellow)
                Text("WHO BENEFITS?")
                    .font(.system(size: 10, weight: .bold))
                    .foregroundColor(.yellow)
            }
            
            ForEach(analysis.whoBenefits, id: \.self) { beneficiary in
                HStack(alignment: .top, spacing: 8) {
                    Image(systemName: "arrow.right.circle")
                        .font(.system(size: 10))
                        .foregroundColor(.yellow)
                    Text(beneficiary)
                        .font(.system(size: 11))
                        .foregroundColor(.white)
                }
            }
        }
        .padding()
        .background(Color.yellow.opacity(0.1))
        .cornerRadius(12)
    }
    
    private func counterpointsCard(_ analysis: NarrativeAnalysis) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Image(systemName: "questionmark.circle.fill")
                    .foregroundColor(.cyan)
                Text("SOCRATIC COUNTERPOINTS")
                    .font(.system(size: 10, weight: .bold))
                    .foregroundColor(.cyan)
            }
            
            ForEach(analysis.counterpoints, id: \.self) { point in
                HStack(alignment: .top, spacing: 8) {
                    Image(systemName: "lightbulb.fill")
                        .font(.system(size: 10))
                        .foregroundColor(.cyan)
                    Text(point)
                        .font(.system(size: 11))
                        .foregroundColor(.white)
                }
            }
        }
        .padding()
        .background(Color.cyan.opacity(0.1))
        .cornerRadius(12)
    }
    
    private func suggestionCard(_ analysis: NarrativeAnalysis) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Image(systemName: "sparkles")
                    .foregroundColor(.green)
                Text("AWAKENING SUGGESTION")
                    .font(.system(size: 10, weight: .bold))
                    .foregroundColor(.green)
            }
            
            Text(analysis.awakeningSuggestion)
                .font(.system(size: 12))
                .foregroundColor(.white)
        }
        .padding()
        .background(Color.green.opacity(0.1))
        .cornerRadius(12)
    }
    
    // MARK: - Quick Tools
    
    private var quickToolsSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("QUICK DISCERNMENT TOOLS")
                .font(.system(size: 10, weight: .bold))
                .foregroundColor(.gray)
            
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 10) {
                quickToolButton("Propaganda Library", "book.fill", .orange) {
                    showingTechniquesLibrary = true
                }
                quickToolButton("Analysis History", "clock.fill", .blue) {
                    showingHistory = true
                }
            }
        }
    }
    
    private func quickToolButton(_ title: String, _ icon: String, _ color: Color, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            HStack {
                Image(systemName: icon)
                    .foregroundColor(color)
                Text(title)
                    .font(.system(size: 12, weight: .semibold))
                    .foregroundColor(.white)
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(color.opacity(0.15))
            .cornerRadius(10)
        }
    }
}

// MARK: - Propaganda Library View

struct PropagandaLibraryView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var selectedTechnique: PropagandaTechnique?
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 12) {
                    ForEach(PropagandaDatabase.allTechniques) { technique in
                        techniqueCard(technique)
                    }
                }
                .padding()
            }
            .background(Color.black.ignoresSafeArea())
            .navigationTitle("Propaganda Techniques")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") { dismiss() }
                }
            }
        }
    }
    
    private func techniqueCard(_ technique: PropagandaTechnique) -> some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(technique.name)
                .font(.system(size: 16, weight: .bold))
                .foregroundColor(.orange)
            
            Text(technique.description)
                .font(.system(size: 12))
                .foregroundColor(.white)
            
            Text("Examples:")
                .font(.system(size: 10, weight: .bold))
                .foregroundColor(.gray)
            
            ForEach(technique.examples, id: \.self) { example in
                Text("• \"\(example)\"")
                    .font(.system(size: 11))
                    .foregroundColor(.yellow)
                    .italic()
            }
            
            Text("Defense: \(technique.defense)")
                .font(.system(size: 11))
                .foregroundColor(.green)
            
            Text("Gnostic Link: \(technique.gnosticLink)")
                .font(.system(size: 10))
                .foregroundColor(.purple)
                .italic()
        }
        .padding()
        .background(Color.white.opacity(0.05))
        .cornerRadius(12)
    }
}

// MARK: - Analysis History View

struct AnalysisHistoryView: View {
    @Environment(\.dismiss) private var dismiss
    let history: [NarrativeAnalysis]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(history) { analysis in
                    VStack(alignment: .leading, spacing: 6) {
                        Text(analysis.headline)
                            .font(.system(size: 13, weight: .semibold))
                            .foregroundColor(.white)
                            .lineLimit(2)
                        
                        HStack {
                            Text("Truth: \(analysis.overallScore)%")
                                .font(.system(size: 10))
                                .foregroundColor(analysis.overallScore > 50 ? .green : .red)
                            
                            Text("•")
                                .foregroundColor(.gray)
                            
                            Text(analysis.manipulationLevel.rawValue)
                                .font(.system(size: 10))
                                .foregroundColor(analysis.manipulationLevel.color)
                            
                            Spacer()
                            
                            Text(analysis.timestamp, style: .relative)
                                .font(.system(size: 9))
                                .foregroundColor(.gray)
                        }
                    }
                    .listRowBackground(Color.white.opacity(0.05))
                }
            }
            .listStyle(.plain)
            .background(Color.black.ignoresSafeArea())
            .navigationTitle("History")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") { dismiss() }
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        TruthVerificationToolkitView()
    }
}
