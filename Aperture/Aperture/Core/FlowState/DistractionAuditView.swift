// DistractionAuditView.swift
// Aperture
//
// Haikai Audit - Identify and remove distractions from your life

import SwiftUI


struct DistractionAuditView: View {
    
    @StateObject private var orchestrator = FlowOrchestrator.shared
    @Environment(\.dismiss) private var dismiss
    @State private var audit: DistractionAudit?
    @State private var isAnalyzing = true
    @State private var completedSuggestions: Set<UUID> = []
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(hex: "#0a0a1a")
                    .ignoresSafeArea()
                
                if isAnalyzing {
                    analyzingView
                } else if let audit = audit {
                    ScrollView(showsIndicators: false) {
                        VStack(spacing: 24) {
                            scoreCard(audit: audit)
                            timeSavedCard(audit: audit)
                            suggestionsSection(audit: audit)
                            challengesSection
                        }
                        .padding()
                    }
                }
            }
            .navigationTitle("Haikai Audit")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Done") { dismiss() }
                        .foregroundColor(.white)
                }
            }
            .onAppear {
                runAudit()
            }
        }
    }
    
    
    // MARK: - Analyzing View
    
    private var analyzingView: some View {
        VStack(spacing: 24) {
            ZStack {
                Circle()
                    .stroke(Color.white.opacity(0.1), lineWidth: 4)
                    .frame(width: 100, height: 100)
                
                Circle()
                    .trim(from: 0, to: 0.7)
                    .stroke(
                        LinearGradient(
                            colors: [Color(hex: "#7C4DFF"), Color(hex: "#E040FB")],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        ),
                        style: StrokeStyle(lineWidth: 4, lineCap: .round)
                    )
                    .frame(width: 100, height: 100)
                    .rotationEffect(.degrees(-90))
                    .animation(.linear(duration: 1).repeatForever(autoreverses: false), value: isAnalyzing)
                
                Image(systemName: "shield.lefthalf.filled")
                    .font(.title)
                    .foregroundColor(Color(hex: "#7C4DFF"))
            }
            
            Text("Analyzing your habits...")
                .font(.headline)
                .foregroundColor(.white)
            
            Text("Finding opportunities to reclaim your time")
                .font(.subheadline)
                .foregroundColor(.white.opacity(0.6))
        }
    }
    
    
    // MARK: - Score Card
    
    private func scoreCard(audit: DistractionAudit) -> some View {
        VStack(spacing: 16) {
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text("FLOW SCORE")
                        .font(.caption.bold())
                        .foregroundColor(.white.opacity(0.5))
                        .tracking(1)
                    
                    Text(scoreMessage(audit.flowScore))
                        .font(.headline)
                        .foregroundColor(.white)
                }
                
                Spacer()
                
                ZStack {
                    Circle()
                        .stroke(Color.white.opacity(0.1), lineWidth: 10)
                        .frame(width: 80, height: 80)
                    
                    Circle()
                        .trim(from: 0, to: CGFloat(audit.flowScore) / 100)
                        .stroke(
                            scoreColor(audit.flowScore),
                            style: StrokeStyle(lineWidth: 10, lineCap: .round)
                        )
                        .frame(width: 80, height: 80)
                        .rotationEffect(.degrees(-90))
                    
                    Text("\(audit.flowScore)")
                        .font(.title2.bold())
                        .foregroundColor(.white)
                }
            }
            
            // Score breakdown
            HStack(spacing: 16) {
                ScoreBreakdown(label: "Social", score: socialScore, color: .pink)
                ScoreBreakdown(label: "Email", score: emailScore, color: .blue)
                ScoreBreakdown(label: "Meetings", score: meetingScore, color: .purple)
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.white.opacity(0.05))
        )
    }
    
    private func scoreMessage(_ score: Int) -> String {
        switch score {
        case 80...100: return "Excellent! 🔥"
        case 60..<80: return "Good, room to improve"
        case 40..<60: return "Needs attention"
        default: return "Time for a reset"
        }
    }
    
    private func scoreColor(_ score: Int) -> Color {
        switch score {
        case 80...100: return .green
        case 60..<80: return Color(hex: "#7C4DFF")
        case 40..<60: return .orange
        default: return .red
        }
    }
    
    private var socialScore: Int {
        let minutes = orchestrator.userProfile?.currentSocialMediaMinutes ?? 60
        if minutes <= 15 { return 100 }
        if minutes <= 30 { return 80 }
        if minutes <= 60 { return 60 }
        return 40
    }
    
    private var emailScore: Int {
        let checks = orchestrator.userProfile?.emailChecksPerDay ?? 5
        if checks <= 3 { return 100 }
        if checks <= 5 { return 70 }
        return 40
    }
    
    private var meetingScore: Int {
        let hours = orchestrator.userProfile?.averageMeetingHoursPerDay ?? 3
        if hours <= 2 { return 100 }
        if hours <= 4 { return 70 }
        return 40
    }
    
    
    // MARK: - Time Saved Card
    
    private func timeSavedCard(audit: DistractionAudit) -> some View {
        VStack(spacing: 12) {
            HStack {
                Image(systemName: "clock.badge.checkmark.fill")
                    .font(.title2)
                    .foregroundColor(.green)
                
                VStack(alignment: .leading, spacing: 2) {
                    Text("POTENTIAL TIME SAVED")
                        .font(.caption.bold())
                        .foregroundColor(.white.opacity(0.5))
                        .tracking(1)
                    
                    Text(audit.formattedTimeSaved)
                        .font(.title.bold())
                        .foregroundColor(.white)
                    
                    Text("per day")
                        .font(.caption)
                        .foregroundColor(.white.opacity(0.5))
                }
                
                Spacer()
                
                VStack(alignment: .trailing) {
                    Text("\(Int(audit.totalPotentialTimeSaved * 7))m")
                        .font(.headline)
                        .foregroundColor(.green)
                    Text("per week")
                        .font(.caption)
                        .foregroundColor(.white.opacity(0.5))
                }
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.green.opacity(0.1))
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.green.opacity(0.3), lineWidth: 1)
                )
        )
    }
    
    
    // MARK: - Suggestions Section
    
    @ViewBuilder
    private func suggestionsSection(audit: DistractionAudit) -> some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("HAIKAI SUGGESTIONS")
                .font(.caption.bold())
                .foregroundColor(.white.opacity(0.5))
                .tracking(1)
            
            if audit.suggestions.isEmpty {
                VStack(spacing: 8) {
                    Image(systemName: "checkmark.seal.fill")
                        .font(.title)
                        .foregroundColor(.green)
                    
                    Text("You're already optimized!")
                        .font(.headline)
                        .foregroundColor(.white)
                }
                .frame(maxWidth: .infinity)
                .padding()
            } else {
                suggestionsList(from: audit)
            }
        }
    }
    
    @ViewBuilder
    private func suggestionsList(from audit: DistractionAudit) -> some View {
        let items: [DistractionSuggestion] = Array(audit.suggestions)
        VStack(spacing: 12) {
            suggestionCard(for: items, at: 0)
            suggestionCard(for: items, at: 1)
            suggestionCard(for: items, at: 2)
            suggestionCard(for: items, at: 3)
            suggestionCard(for: items, at: 4)
        }
    }
    
    @ViewBuilder
    private func suggestionCard(for items: [DistractionSuggestion], at index: Int) -> some View {
        if index < items.count {
            let suggestion: DistractionSuggestion = items[index]
            SuggestionCard(
                suggestion: suggestion,
                isCompleted: completedSuggestions.contains(suggestion.id),
                onComplete: {
                    withAnimation {
                        _ = completedSuggestions.insert(suggestion.id)
                    }
                }
            )
        }
    }
    
    
    // MARK: - Challenges Section
    
    private var challengesSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("CHALLENGES")
                .font(.caption.bold())
                .foregroundColor(.white.opacity(0.5))
                .tracking(1)
            
            let challenge = orchestrator.getSocialMediaChallenge(currentLevel: 0)
            
            VStack(alignment: .leading, spacing: 12) {
                HStack {
                    Image(systemName: "iphone")
                        .foregroundColor(.pink)
                    
                    Text("Social Media Detox")
                        .font(.headline)
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    Text("Level \(challenge.level)")
                        .font(.caption.bold())
                        .foregroundColor(.black)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(Color.pink)
                        .cornerRadius(8)
                }
                
                Text(challenge.description)
                    .font(.subheadline)
                    .foregroundColor(.white.opacity(0.7))
                
                HStack {
                    Text("\(challenge.durationDays) days")
                        .font(.caption)
                        .foregroundColor(.white.opacity(0.5))
                    
                    Spacer()
                    
                    Button("Start Challenge") {
                        // Start challenge
                    }
                    .font(.caption.bold())
                    .foregroundColor(.pink)
                }
            }
            .padding()
            .background(Color.white.opacity(0.05))
            .cornerRadius(16)
            
            // Email Challenge
            VStack(alignment: .leading, spacing: 12) {
                HStack {
                    Image(systemName: "envelope.fill")
                        .foregroundColor(.blue)
                    
                    Text("Email Batching")
                        .font(.headline)
                        .foregroundColor(.white)
                    
                    Spacer()
                }
                
                Text("Check email only 3x per day: 9 AM, 1 PM, 5 PM")
                    .font(.subheadline)
                    .foregroundColor(.white.opacity(0.7))
                
                Button("Accept Challenge") {
                    // Start challenge
                }
                .font(.caption.bold())
                .foregroundColor(.blue)
            }
            .padding()
            .background(Color.white.opacity(0.05))
            .cornerRadius(16)
        }
    }
    
    
    // MARK: - Actions
    
    private func runAudit() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation {
                audit = orchestrator.runDistractionAudit()
                isAnalyzing = false
            }
        }
    }
}


// MARK: - Supporting Views

struct ScoreBreakdown: View {
    let label: String
    let score: Int
    let color: Color
    
    var body: some View {
        VStack(spacing: 4) {
            ZStack {
                Circle()
                    .stroke(Color.white.opacity(0.1), lineWidth: 3)
                    .frame(width: 40, height: 40)
                
                Circle()
                    .trim(from: 0, to: CGFloat(score) / 100)
                    .stroke(color, style: StrokeStyle(lineWidth: 3, lineCap: .round))
                    .frame(width: 40, height: 40)
                    .rotationEffect(.degrees(-90))
                
                Text("\(score)")
                    .font(.caption.bold())
                    .foregroundColor(.white)
            }
            
            Text(label)
                .font(.caption2)
                .foregroundColor(.white.opacity(0.5))
        }
    }
}

struct SuggestionCard: View {
    let suggestion: DistractionSuggestion
    let isCompleted: Bool
    let onComplete: () -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(systemName: suggestion.category.icon)
                    .foregroundColor(suggestion.category.color)
                
                Text(suggestion.title)
                    .font(.headline)
                    .foregroundColor(.white)
                    .strikethrough(isCompleted)
                
                Spacer()
                
                if !isCompleted {
                    Button {
                        onComplete()
                    } label: {
                        Image(systemName: "checkmark.circle")
                            .foregroundColor(.white.opacity(0.5))
                    }
                } else {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(.green)
                }
            }
            
            Text(suggestion.description)
                .font(.subheadline)
                .foregroundColor(.white.opacity(0.7))
            
            HStack {
                Label("\(Int(suggestion.currentTime))m → \(Int(suggestion.suggestedTime))m", systemImage: "clock")
                    .font(.caption)
                    .foregroundColor(.white.opacity(0.5))
                
                Spacer()
                
                Text("Save \(Int(suggestion.timeSaved))m/day")
                    .font(.caption.bold())
                    .foregroundColor(.green)
            }
            
            // Challenge
            HStack {
                Image(systemName: "flame.fill")
                    .foregroundColor(.orange)
                    .font(.caption)
                
                Text(suggestion.challenge)
                    .font(.caption)
                    .foregroundColor(.orange)
            }
            .padding(8)
            .background(Color.orange.opacity(0.1))
            .cornerRadius(8)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.white.opacity(isCompleted ? 0.02 : 0.05))
        )
        .opacity(isCompleted ? 0.6 : 1)
    }
}


#Preview {
    DistractionAuditView()
}
