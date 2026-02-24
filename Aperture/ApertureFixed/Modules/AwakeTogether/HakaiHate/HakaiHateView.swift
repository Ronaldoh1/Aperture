// HakaiHateView.swift
// "Check Yourself Before You Wreck Yourself"
// AI-powered post analysis to eliminate hate/division before sharing
// Uses on-device AI for MVP (no internet required)

import SwiftUI
import NaturalLanguage
// import Speech // For voice input

// MARK: - Models

struct PostAnalysis: Identifiable {
    let id = UUID()
    let originalText: String
    let overallScore: Double // 0-100, higher = more positive
    let sentiment: SentimentLevel
    let triggers: [HateTrigger]
    let suggestions: [String]
    let rewrittenVersion: String?
    let analyzedAt: Date
    
    var isReadyToPost: Bool {
        overallScore >= 70 && triggers.isEmpty
    }
}

enum SentimentLevel: String {
    case toxic = "Toxic"
    case negative = "Negative"
    case neutral = "Neutral"
    case positive = "Positive"
    case uplifting = "Uplifting"
    
    var color: Color {
        switch self {
        case .toxic: return .red
        case .negative: return .orange
        case .neutral: return .gray
        case .positive: return .green
        case .uplifting: return .cyan
        }
    }
    
    var icon: String {
        switch self {
        case .toxic: return "exclamationmark.triangle.fill"
        case .negative: return "hand.thumbsdown.fill"
        case .neutral: return "minus.circle.fill"
        case .positive: return "hand.thumbsup.fill"
        case .uplifting: return "star.fill"
        }
    }
}

struct HateTrigger: Identifiable {
    let id = UUID()
    let phrase: String
    let category: HateTriggerCategory
    let severity: Int // 1-5
    let explanation: String
    let alternative: String
}

enum HateTriggerCategory: String, CaseIterable {
    case divisive = "Divisive Language"
    case dehumanizing = "Dehumanizing"
    case generalizing = "Overgeneralization"
    case inflammatory = "Inflammatory"
    case condescending = "Condescending"
    case fearmongering = "Fear-mongering"
    
    var icon: String {
        switch self {
        case .divisive: return "arrow.left.arrow.right"
        case .dehumanizing: return "person.slash"
        case .generalizing: return "rectangle.stack.person.crop"
        case .inflammatory: return "flame"
        case .condescending: return "arrow.down.to.line"
        case .fearmongering: return "exclamationmark.bubble"
        }
    }
    
    var color: Color {
        switch self {
        case .divisive: return .orange
        case .dehumanizing: return .red
        case .generalizing: return .yellow
        case .inflammatory: return .red
        case .condescending: return .purple
        case .fearmongering: return .indigo
        }
    }
}

// MARK: - Main View

struct HakaiHateView: View {
    @StateObject private var analyzer = PostAnalyzer()
    @State private var postText = ""
    @State private var analysis: PostAnalysis?
    @State private var isAnalyzing = false
    @State private var showingHistory = false
    @FocusState private var isTextFieldFocused: Bool
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                // Header
                headerSection
                
                // Input Area
                inputSection
                
                // Analysis Button
                analyzeButton
                
                // Results
                if let analysis = analysis {
                    resultsSection(analysis)
                }
                
                // Tips
                if analysis == nil {
                    tipsSection
                }
            }
            .padding()
        }
        .background(Color.black.ignoresSafeArea())
        .navigationTitle("Hakai Hate")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: { showingHistory = true }) {
                    Image(systemName: "clock.arrow.circlepath")
                }
            }
        }
        .sheet(isPresented: $showingHistory) {
            HateAnalysisHistoryView()
        }
    }
    
    // MARK: - Header
    
    private var headerSection: some View {
        VStack(spacing: 12) {
            ZStack {
                Circle()
                    .fill(
                        LinearGradient(
                            colors: [.red, .orange, .yellow],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(width: 80, height: 80)
                
                Image(systemName: "shield.checkered")
                    .font(.system(size: 32))
                    .foregroundColor(.white)
            }
            
            Text("HAKAI HATE")
                .font(.system(size: 24, weight: .black))
                .foregroundColor(.white)
            
            Text("Check yourself before you post")
                .font(.system(size: 14))
                .foregroundColor(.gray)
            
            Text("破壊 (Hakai) = Destroy the hate within")
                .font(.system(size: 11))
                .foregroundColor(.orange)
                .italic()
        }
    }
    
    // MARK: - Input Section
    
    private var inputSection: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Image(systemName: "pencil.and.outline")
                    .foregroundColor(.cyan)
                Text("Your Post")
                    .font(.system(size: 12, weight: .bold))
                    .foregroundColor(.cyan)
                
                Spacer()
                
                Text("\(postText.count) chars")
                    .font(.system(size: 10))
                    .foregroundColor(.gray)
            }
            
            TextEditor(text: $postText)
                .frame(minHeight: 120)
                .padding(12)
                .background(Color.white.opacity(0.05))
                .cornerRadius(12)
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.cyan.opacity(0.3), lineWidth: 1)
                )
                .focused($isTextFieldFocused)
            
            // Quick paste buttons
            HStack(spacing: 10) {
                Button(action: {
                    if let clipboard = UIPasteboard.general.string {
                        postText = clipboard
                    }
                }) {
                    HStack(spacing: 4) {
                        Image(systemName: "doc.on.clipboard")
                        Text("Paste")
                    }
                    .font(.system(size: 11))
                    .foregroundColor(.cyan)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 6)
                    .background(Color.cyan.opacity(0.2))
                    .cornerRadius(8)
                }
                
                Button(action: { postText = "" }) {
                    HStack(spacing: 4) {
                        Image(systemName: "xmark")
                        Text("Clear")
                    }
                    .font(.system(size: 11))
                    .foregroundColor(.gray)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 6)
                    .background(Color.white.opacity(0.1))
                    .cornerRadius(8)
                }
                
                Spacer()
            }
        }
    }
    
    // MARK: - Analyze Button
    
    private var analyzeButton: some View {
        Button(action: analyzePost) {
            HStack {
                if isAnalyzing {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .white))
                        .scaleEffect(0.8)
                } else {
                    Image(systemName: "wand.and.stars")
                }
                Text(isAnalyzing ? "Analyzing..." : "Check My Post")
                    .font(.system(size: 16, weight: .bold))
            }
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .padding()
            .background(
                LinearGradient(
                    colors: postText.isEmpty ? [.gray, .gray] : [.orange, .red],
                    startPoint: .leading,
                    endPoint: .trailing
                )
            )
            .cornerRadius(12)
        }
        .disabled(postText.isEmpty || isAnalyzing)
    }
    
    // MARK: - Results Section
    
    private func resultsSection(_ analysis: PostAnalysis) -> some View {
        VStack(spacing: 16) {
            // Overall Score
            scoreCard(analysis)
            
            // Triggers Found
            if !analysis.triggers.isEmpty {
                triggersCard(analysis.triggers)
            }
            
            // Suggestions
            if !analysis.suggestions.isEmpty {
                suggestionsCard(analysis.suggestions)
            }
            
            // Rewritten Version
            if let rewritten = analysis.rewrittenVersion {
                rewrittenCard(rewritten)
            }
            
            // Action Buttons
            actionButtons(analysis)
        }
    }
    
    private func scoreCard(_ analysis: PostAnalysis) -> some View {
        VStack(spacing: 16) {
            HStack {
                Image(systemName: analysis.sentiment.icon)
                    .foregroundColor(analysis.sentiment.color)
                Text("ANALYSIS RESULT")
                    .font(.system(size: 12, weight: .black))
                    .foregroundColor(analysis.sentiment.color)
                Spacer()
            }
            
            HStack(spacing: 20) {
                // Score Circle
                ZStack {
                    Circle()
                        .stroke(Color.white.opacity(0.1), lineWidth: 8)
                        .frame(width: 80, height: 80)
                    
                    Circle()
                        .trim(from: 0, to: analysis.overallScore / 100)
                        .stroke(analysis.sentiment.color, style: StrokeStyle(lineWidth: 8, lineCap: .round))
                        .frame(width: 80, height: 80)
                        .rotationEffect(.degrees(-90))
                    
                    VStack(spacing: 0) {
                        Text("\(Int(analysis.overallScore))")
                            .font(.system(size: 24, weight: .bold))
                            .foregroundColor(.white)
                        Text("/100")
                            .font(.system(size: 10))
                            .foregroundColor(.gray)
                    }
                }
                
                VStack(alignment: .leading, spacing: 6) {
                    Text(analysis.sentiment.rawValue)
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(analysis.sentiment.color)
                    
                    Text(analysis.isReadyToPost ? "Good to post! ✓" : "Consider revising")
                        .font(.system(size: 13))
                        .foregroundColor(analysis.isReadyToPost ? .green : .orange)
                    
                    Text("\(analysis.triggers.count) trigger(s) found")
                        .font(.system(size: 11))
                        .foregroundColor(.gray)
                }
                
                Spacer()
            }
        }
        .padding()
        .background(analysis.sentiment.color.opacity(0.1))
        .cornerRadius(16)
    }
    
    private func triggersCard(_ triggers: [HateTrigger]) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(systemName: "exclamationmark.triangle.fill")
                    .foregroundColor(.red)
                Text("TRIGGERS DETECTED")
                    .font(.system(size: 12, weight: .black))
                    .foregroundColor(.red)
                Spacer()
            }
            
            ForEach(triggers) { trigger in
                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        Image(systemName: trigger.category.icon)
                            .foregroundColor(trigger.category.color)
                        Text(trigger.category.rawValue)
                            .font(.system(size: 11, weight: .semibold))
                            .foregroundColor(trigger.category.color)
                        
                        Spacer()
                        
                        // Severity dots
                        HStack(spacing: 2) {
                            ForEach(0..<5, id: \.self) { i in
                                Circle()
                                    .fill(i < trigger.severity ? Color.red : Color.white.opacity(0.2))
                                    .frame(width: 6, height: 6)
                            }
                        }
                    }
                    
                    Text("\"....\(trigger.phrase)....\"")
                        .font(.system(size: 12, weight: .medium))
                        .foregroundColor(.white)
                        .padding(8)
                        .background(Color.red.opacity(0.2))
                        .cornerRadius(6)
                    
                    Text(trigger.explanation)
                        .font(.system(size: 11))
                        .foregroundColor(.gray)
                    
                    HStack {
                        Image(systemName: "arrow.right.circle")
                            .foregroundColor(.green)
                        Text("Try: \"\(trigger.alternative)\"")
                            .font(.system(size: 11))
                            .foregroundColor(.green)
                    }
                }
                .padding(10)
                .background(Color.white.opacity(0.03))
                .cornerRadius(8)
            }
        }
        .padding()
        .background(Color.red.opacity(0.1))
        .cornerRadius(16)
    }
    
    private func suggestionsCard(_ suggestions: [String]) -> some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Image(systemName: "lightbulb.fill")
                    .foregroundColor(.yellow)
                Text("SUGGESTIONS")
                    .font(.system(size: 12, weight: .black))
                    .foregroundColor(.yellow)
                Spacer()
            }
            
            ForEach(suggestions, id: \.self) { suggestion in
                HStack(alignment: .top, spacing: 8) {
                    Image(systemName: "checkmark.circle")
                        .foregroundColor(.yellow)
                        .font(.system(size: 12))
                    Text(suggestion)
                        .font(.system(size: 12))
                        .foregroundColor(.white.opacity(0.9))
                }
            }
        }
        .padding()
        .background(Color.yellow.opacity(0.1))
        .cornerRadius(16)
    }
    
    private func rewrittenCard(_ rewritten: String) -> some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Image(systemName: "sparkles")
                    .foregroundColor(.green)
                Text("SUGGESTED REWRITE")
                    .font(.system(size: 12, weight: .black))
                    .foregroundColor(.green)
                Spacer()
            }
            
            Text(rewritten)
                .font(.system(size: 13))
                .foregroundColor(.white)
                .padding(12)
                .background(Color.green.opacity(0.2))
                .cornerRadius(8)
            
            Button(action: {
                postText = rewritten
                analysis = nil
            }) {
                HStack {
                    Image(systemName: "arrow.uturn.up")
                    Text("Use This Version")
                        .font(.system(size: 12, weight: .semibold))
                }
                .foregroundColor(.green)
                .padding(.horizontal, 12)
                .padding(.vertical, 8)
                .background(Color.green.opacity(0.2))
                .cornerRadius(8)
            }
        }
        .padding()
        .background(Color.green.opacity(0.1))
        .cornerRadius(16)
    }
    
    private func actionButtons(_ analysis: PostAnalysis) -> some View {
        HStack(spacing: 12) {
            // Copy to Clipboard
            Button(action: {
                UIPasteboard.general.string = analysis.rewrittenVersion ?? postText
            }) {
                HStack {
                    Image(systemName: "doc.on.doc")
                    Text("Copy")
                }
                .font(.system(size: 13, weight: .semibold))
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.white.opacity(0.2))
                .cornerRadius(10)
            }
            
            // Re-analyze
            Button(action: analyzePost) {
                HStack {
                    Image(systemName: "arrow.clockwise")
                    Text("Re-Check")
                }
                .font(.system(size: 13, weight: .semibold))
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.cyan.opacity(0.3))
                .cornerRadius(10)
            }
        }
    }
    
    // MARK: - Tips Section
    
    private var tipsSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(systemName: "info.circle.fill")
                    .foregroundColor(.blue)
                Text("BEFORE YOU POST")
                    .font(.system(size: 12, weight: .black))
                    .foregroundColor(.blue)
                Spacer()
            }
            
            VStack(alignment: .leading, spacing: 8) {
                tipRow("🤔", "Ask: \"Would I say this to their face?\"")
                tipRow("⏸️", "Pause for 10 seconds before posting anger")
                tipRow("🎯", "Attack ideas, not people")
                tipRow("🤝", "Seek understanding, not victory")
                tipRow("🪞", "Check: Am I projecting my own stuff?")
            }
        }
        .padding()
        .background(Color.blue.opacity(0.1))
        .cornerRadius(16)
    }
    
    private func tipRow(_ emoji: String, _ text: String) -> some View {
        HStack(spacing: 10) {
            Text(emoji)
                .font(.system(size: 16))
            Text(text)
                .font(.system(size: 12))
                .foregroundColor(.white.opacity(0.8))
        }
    }
    
    // MARK: - Analysis Logic
    
    private func analyzePost() {
        isAnalyzing = true
        isTextFieldFocused = false
        
        Task {
            let result = await analyzer.analyze(postText)
            
            await MainActor.run {
                analysis = result
                isAnalyzing = false
            }
        }
    }
}

// MARK: - Post Analyzer (On-Device AI)

@MainActor
class PostAnalyzer: ObservableObject {
    
    // Use Apple's NLTagger for sentiment analysis
    private let sentimentTagger = NLTagger(tagSchemes: [.sentimentScore])
    
    // Trigger patterns
    private let triggerPatterns: [(pattern: String, category: HateTriggerCategory, severity: Int, explanation: String, alternative: String)] = [
        // Divisive
        ("all \\w+ are", .generalizing, 4, "Generalizing about entire groups creates division", "Some people who..."),
        ("\\b(libtard|trumptard|snowflake|nazi)\\b", .dehumanizing, 5, "Name-calling dehumanizes and shuts down dialogue", "Someone with different views"),
        ("you people", .divisive, 3, "Creates an us vs. them dynamic", "Some folks"),
        ("always|never", .generalizing, 2, "Absolute statements are rarely accurate", "Often/Sometimes"),
        
        // Inflammatory
        ("wake up sheeple", .condescending, 4, "Implies others are stupid for disagreeing", "Consider looking into..."),
        ("do your research", .condescending, 3, "Often dismissive rather than helpful", "Here's a source I found interesting..."),
        ("i can't believe anyone", .condescending, 2, "Dismisses others' lived experiences", "I'm curious why some people..."),
        
        // Fear-mongering
        ("they're coming for", .fearmongering, 4, "Creates fear without evidence", "There's concern about..."),
        ("the end of", .fearmongering, 3, "Catastrophizing reduces nuanced thinking", "Significant changes to..."),
        ("destroy(ing)?|ruin(ing)?", .inflammatory, 3, "Extreme language inflames rather than informs", "Negatively impact"),
    ]
    
    func analyze(_ text: String) async -> PostAnalysis {
        // Simulate processing time
        try? await Task.sleep(nanoseconds: 1_500_000_000)
        
        // Get sentiment score
        sentimentTagger.string = text
        let tagResult = sentimentTagger.tag(at: text.startIndex, unit: .paragraph, scheme: .sentimentScore)
        let sentimentTag = tagResult.0  // NLTag? is the first element, Range is second
        let score = Double(sentimentTag?.rawValue ?? "0") ?? 0
        
        // Convert -1 to 1 score to 0-100
        let normalizedScore = (score + 1) * 50
        
        // Find triggers
        var triggers: [HateTrigger] = []
        
        for pattern in triggerPatterns {
            if let regex = try? NSRegularExpression(pattern: pattern.pattern, options: .caseInsensitive) {
                let range = NSRange(text.startIndex..., in: text)
                let matches = regex.matches(in: text, options: [], range: range)
                
                for match in matches {
                    if let swiftRange = Range(match.range, in: text) {
                        triggers.append(HateTrigger(
                            phrase: String(text[swiftRange]),
                            category: pattern.category,
                            severity: pattern.severity,
                            explanation: pattern.explanation,
                            alternative: pattern.alternative
                        ))
                    }
                }
            }
        }
        
        // Determine sentiment level
        let adjustedScore = normalizedScore - Double(triggers.count * 10) // Penalize for triggers
        let sentiment: SentimentLevel
        switch adjustedScore {
        case ..<20: sentiment = .toxic
        case 20..<40: sentiment = .negative
        case 40..<60: sentiment = .neutral
        case 60..<80: sentiment = .positive
        default: sentiment = .uplifting
        }
        
        // Generate suggestions
        var suggestions: [String] = []
        if triggers.count > 0 {
            suggestions.append("Consider rephrasing highlighted sections")
        }
        if text.contains("!") && text.filter({ $0 == "!" }).count > 2 {
            suggestions.append("Multiple exclamation points can seem aggressive")
        }
        if text.uppercased() == text && text.count > 10 {
            suggestions.append("ALL CAPS reads as shouting - try lowercase")
        }
        if text.count > 280 {
            suggestions.append("Longer posts get less engagement - consider trimming")
        }
        
        // Generate rewrite if needed
        var rewritten: String? = nil
        if !triggers.isEmpty {
            rewritten = generateRewrite(text, triggers: triggers)
        }
        
        return PostAnalysis(
            originalText: text,
            overallScore: max(0, min(100, adjustedScore)),
            sentiment: sentiment,
            triggers: triggers,
            suggestions: suggestions,
            rewrittenVersion: rewritten,
            analyzedAt: Date()
        )
    }
    
    private func generateRewrite(_ text: String, triggers: [HateTrigger]) -> String {
        var rewritten = text
        for trigger in triggers {
            rewritten = rewritten.replacingOccurrences(
                of: trigger.phrase,
                with: trigger.alternative,
                options: .caseInsensitive
            )
        }
        return rewritten
    }
}

// MARK: - History View

struct HateAnalysisHistoryView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Coming in V2")
                    .foregroundColor(.gray)
                Text("History will be saved to cloud")
                    .font(.system(size: 12))
                    .foregroundColor(.gray)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.black.ignoresSafeArea())
            .navigationTitle("Analysis History")
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
        HakaiHateView()
    }
}
