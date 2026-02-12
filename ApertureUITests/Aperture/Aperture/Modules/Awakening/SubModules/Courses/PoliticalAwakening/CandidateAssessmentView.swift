// CandidateAssessmentView.swift
// Transparent scoring system for political candidates
// No spin. Just data. Expose the sellouts.

import SwiftUI

// MARK: - Candidate Assessment View

struct CandidateAssessmentView: View {
    
    @StateObject private var viewModel = CandidateAssessmentViewModel()
    @State private var showRubric = false
    @State private var showDataEntry = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                // Rubric Transparency Banner
                rubricBanner
                
                // Input Section
                if viewModel.candidate == nil {
                    inputPromptSection
                } else {
                    // Results
                    if let candidate = viewModel.candidate {
                        scoreCard(candidate)
                        detailedBreakdown(candidate)
                        redFlagsSection(candidate)
                        recommendedActions(candidate)
                    }
                }
            }
            .padding()
        }
        .background(Color.black.ignoresSafeArea())
        .navigationTitle("Candidate Assessment")
        .sheet(isPresented: $showRubric) {
            ScoringRubricView()
        }
        .sheet(isPresented: $showDataEntry) {
            CandidateDataEntryView(viewModel: viewModel)
        }
    }
    
    // MARK: - Rubric Banner
    
    private var rubricBanner: some View {
        Button(action: {
            HapticManager.shared.light()
            showRubric = true
        }) {
            HStack {
                Image(systemName: "doc.text.magnifyingglass")
                    .foregroundColor(.blue)
                VStack(alignment: .leading) {
                    Text("View Our Scoring Rubric")
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(.white)
                    Text("100% transparent methodology")
                        .font(.system(size: 12))
                        .foregroundColor(.gray)
                }
                Spacer()
                Image(systemName: "chevron.right")
                    .foregroundColor(.gray)
            }
            .padding()
            .background(Color.blue.opacity(0.1))
            .cornerRadius(12)
        }
    }
    
    // MARK: - Input Prompt
    
    private var inputPromptSection: some View {
        VStack(spacing: 20) {
            Image(systemName: "person.crop.circle.badge.questionmark")
                .font(.system(size: 60))
                .foregroundColor(.gray)
            
            Text("Enter Candidate Information")
                .font(.system(size: 20, weight: .bold))
                .foregroundColor(.white)
            
            Text("We'll calculate their Integrity Score based on publicly available data from FEC filings, voting records, and organizational affiliations.")
                .font(.system(size: 14))
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
            
            Button(action: {
                HapticManager.shared.medium()
                showDataEntry = true
            }) {
                HStack {
                    Image(systemName: "plus.circle.fill")
                    Text("Add Candidate")
                }
                .font(.system(size: 16, weight: .semibold))
                .foregroundColor(.white)
                .padding(.horizontal, 32)
                .padding(.vertical, 14)
                .background(Color.blue)
                .cornerRadius(12)
            }
            
            // Quick lookup options
            VStack(spacing: 12) {
                Text("Or search from:")
                    .font(.system(size: 12))
                    .foregroundColor(.gray)
                
                HStack(spacing: 12) {
                    dataSourceButton("FEC.gov", "dollarsign.circle")
                    dataSourceButton("OpenSecrets", "magnifyingglass")
                    dataSourceButton("GovTrack", "building.columns")
                }
            }
            .padding(.top)
        }
        .padding(.vertical, 40)
    }
    
    private func dataSourceButton(_ title: String, _ icon: String) -> some View {
        Button(action: {
            HapticManager.shared.light()
            // TODO: Open data source
        }) {
            VStack(spacing: 6) {
                Image(systemName: icon)
                    .font(.system(size: 20))
                Text(title)
                    .font(.system(size: 11, weight: .medium))
            }
            .foregroundColor(.white)
            .frame(width: 80, height: 70)
            .background(Color.white.opacity(0.1))
            .cornerRadius(12)
        }
    }
    
    // MARK: - Score Card
    
    private func scoreCard(_ candidate: CandidateData) -> some View {
        VStack(spacing: 16) {
            // Candidate Header
            HStack(spacing: 16) {
                ZStack {
                    Circle()
                        .fill(candidate.partyColor.opacity(0.2))
                        .frame(width: 70, height: 70)
                    Text(candidate.initials)
                        .font(.system(size: 24, weight: .bold))
                        .foregroundColor(candidate.partyColor)
                }
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(candidate.name)
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(.white)
                    Text(candidate.position)
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                    Text(candidate.party)
                        .font(.system(size: 12, weight: .medium))
                        .foregroundColor(candidate.partyColor)
                }
                
                Spacer()
            }
            
            Divider()
                .background(Color.white.opacity(0.2))
            
            // Main Score
            HStack {
                VStack(alignment: .leading, spacing: 8) {
                    Text("INTEGRITY SCORE")
                        .font(.system(size: 11, weight: .bold))
                        .foregroundColor(.gray)
                    
                    HStack(alignment: .bottom, spacing: 4) {
                        Text("\(candidate.integrityScore)")
                            .font(.system(size: 56, weight: .bold, design: .rounded))
                            .foregroundColor(candidate.scoreColor)
                        Text("/ 100")
                            .font(.system(size: 18))
                            .foregroundColor(.gray)
                            .padding(.bottom, 10)
                    }
                    
                    Text(candidate.scoreLabel)
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(candidate.scoreColor)
                }
                
                Spacer()
                
                // Score Ring
                ZStack {
                    Circle()
                        .stroke(Color.white.opacity(0.1), lineWidth: 10)
                        .frame(width: 100, height: 100)
                    
                    Circle()
                        .trim(from: 0, to: CGFloat(candidate.integrityScore) / 100)
                        .stroke(candidate.scoreColor, style: StrokeStyle(lineWidth: 10, lineCap: .round))
                        .frame(width: 100, height: 100)
                        .rotationEffect(.degrees(-90))
                    
                    Image(systemName: candidate.integrityScore >= 70 ? "checkmark.shield.fill" : "exclamationmark.shield.fill")
                        .font(.system(size: 32))
                        .foregroundColor(candidate.scoreColor)
                }
            }
        }
        .padding()
        .background(Color.white.opacity(0.05))
        .cornerRadius(20)
    }
    
    // MARK: - Detailed Breakdown
    
    private func detailedBreakdown(_ candidate: CandidateData) -> some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Score Breakdown")
                .font(.system(size: 18, weight: .bold))
                .foregroundColor(.white)
            
            ForEach(candidate.scoreBreakdown, id: \.category) { item in
                scoreRow(item)
            }
        }
        .padding()
        .background(Color.white.opacity(0.05))
        .cornerRadius(16)
    }
    
    private func scoreRow(_ item: ScoreBreakdownItem) -> some View {
        VStack(spacing: 8) {
            HStack {
                Image(systemName: item.icon)
                    .foregroundColor(item.color)
                    .frame(width: 24)
                
                Text(item.category)
                    .font(.system(size: 14, weight: .medium))
                    .foregroundColor(.white)
                
                Spacer()
                
                Text("\(item.score)/\(item.maxScore)")
                    .font(.system(size: 14, weight: .bold))
                    .foregroundColor(item.color)
            }
            
            // Progress bar
            GeometryReader { geo in
                ZStack(alignment: .leading) {
                    Rectangle()
                        .fill(Color.white.opacity(0.1))
                        .frame(height: 6)
                        .cornerRadius(3)
                    
                    Rectangle()
                        .fill(item.color)
                        .frame(width: geo.size.width * CGFloat(item.score) / CGFloat(item.maxScore), height: 6)
                        .cornerRadius(3)
                }
            }
            .frame(height: 6)
            
            if let detail = item.detail {
                Text(detail)
                    .font(.system(size: 11))
                    .foregroundColor(.gray)
            }
        }
        .padding(.vertical, 4)
    }
    
    // MARK: - Red Flags
    
    private func redFlagsSection(_ candidate: CandidateData) -> some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Image(systemName: "exclamationmark.triangle.fill")
                    .foregroundColor(.red)
                Text("Red Flags Detected")
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(.white)
                Spacer()
                Text("\(candidate.redFlags.count)")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.red)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 4)
                    .background(Color.red.opacity(0.2))
                    .cornerRadius(8)
            }
            
            ForEach(candidate.redFlags, id: \.title) { flag in
                redFlagRow(flag)
            }
        }
        .padding()
        .background(Color.red.opacity(0.05))
        .cornerRadius(16)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color.red.opacity(0.3), lineWidth: 1)
        )
    }
    
    private func redFlagRow(_ flag: RedFlag) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Image(systemName: "flag.fill")
                    .foregroundColor(.red)
                    .font(.system(size: 12))
                Text(flag.title)
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(.white)
                Spacer()
                Text(flag.severity.rawValue)
                    .font(.system(size: 10, weight: .bold))
                    .foregroundColor(.white)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(flag.severity.color)
                    .cornerRadius(4)
            }
            
            Text(flag.description)
                .font(.system(size: 12))
                .foregroundColor(.gray)
            
            if let source = flag.source {
                HStack(spacing: 4) {
                    Image(systemName: "link")
                        .font(.system(size: 10))
                    Text("Source: \(source)")
                        .font(.system(size: 10))
                }
                .foregroundColor(.blue)
            }
        }
        .padding()
        .background(Color.white.opacity(0.03))
        .cornerRadius(10)
    }
    
    // MARK: - Recommended Actions
    
    private func recommendedActions(_ candidate: CandidateData) -> some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("What You Can Do")
                .font(.system(size: 18, weight: .bold))
                .foregroundColor(.white)
            
            actionItem(
                icon: "magnifyingglass",
                title: "Research Further",
                subtitle: "Check OpenSecrets.org for full funding breakdown",
                color: .blue
            )
            
            actionItem(
                icon: "bubble.left.and.bubble.right",
                title: "Ask Hard Questions",
                subtitle: "At town halls, demand transparency on funding",
                color: .purple
            )
            
            actionItem(
                icon: "person.2.wave.2",
                title: "Spread Awareness",
                subtitle: "Share this assessment with other voters",
                color: .green
            )
            
            actionItem(
                icon: "checkmark.circle",
                title: "Vote in Primaries",
                subtitle: "Primaries are where real change happens",
                color: .orange
            )
        }
        .padding()
        .background(Color.white.opacity(0.05))
        .cornerRadius(16)
    }
    
    private func actionItem(icon: String, title: String, subtitle: String, color: Color) -> some View {
        HStack(spacing: 14) {
            Image(systemName: icon)
                .font(.system(size: 20))
                .foregroundColor(color)
                .frame(width: 32)
            
            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(.white)
                Text(subtitle)
                    .font(.system(size: 12))
                    .foregroundColor(.gray)
            }
            
            Spacer()
        }
        .padding()
        .background(Color.white.opacity(0.03))
        .cornerRadius(10)
    }
}

// MARK: - View Model

@MainActor
class CandidateAssessmentViewModel: ObservableObject {
    @Published var candidate: CandidateData?
    @Published var isLoading = false
    
    func loadCandidate(name: String, position: String, party: String) {
        // In production, this would fetch from FEC, OpenSecrets, etc.
        // For now, create sample data
        
        isLoading = true
        
        // Simulate API call
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.candidate = CandidateData.sample
            self.isLoading = false
        }
    }
}

// MARK: - Data Models

struct CandidateData {
    let name: String
    let position: String
    let party: String
    let integrityScore: Int
    let scoreBreakdown: [ScoreBreakdownItem]
    let redFlags: [RedFlag]
    
    var initials: String {
        name.components(separatedBy: " ")
            .compactMap { $0.first }
            .map(String.init)
            .joined()
    }
    
    var partyColor: Color {
        switch party.lowercased() {
        case "democrat", "democratic": return .blue
        case "republican": return .red
        case "independent": return .purple
        case "green": return .green
        case "libertarian": return .yellow
        default: return .gray
        }
    }
    
    var scoreColor: Color {
        switch integrityScore {
        case 80...100: return .green
        case 60..<80: return .yellow
        case 40..<60: return .orange
        default: return .red
        }
    }
    
    var scoreLabel: String {
        switch integrityScore {
        case 80...100: return "High Integrity"
        case 60..<80: return "Moderate Concerns"
        case 40..<60: return "Significant Concerns"
        default: return "Major Red Flags"
        }
    }
    
    static var sample: CandidateData {
        CandidateData(
            name: "Sample Candidate",
            position: "U.S. Representative",
            party: "Democrat",
            integrityScore: 45,
            scoreBreakdown: [
                ScoreBreakdownItem(
                    category: "Small Donor Funding",
                    score: 3,
                    maxScore: 20,
                    icon: "person.3.fill",
                    color: .red,
                    detail: "Only 15% from small donors (<$200)"
                ),
                ScoreBreakdownItem(
                    category: "Super PAC Independence",
                    score: 5,
                    maxScore: 25,
                    icon: "dollarsign.circle",
                    color: .red,
                    detail: "$2.3M in Super PAC support"
                ),
                ScoreBreakdownItem(
                    category: "Voting Record Alignment",
                    score: 12,
                    maxScore: 20,
                    icon: "checkmark.square",
                    color: .yellow,
                    detail: "60% alignment with stated positions"
                ),
                ScoreBreakdownItem(
                    category: "Corporate Lobbying",
                    score: 8,
                    maxScore: 15,
                    icon: "building.2",
                    color: .yellow,
                    detail: "Moderate corporate donor influence"
                ),
                ScoreBreakdownItem(
                    category: "NGO/Think Tank Ties",
                    score: 5,
                    maxScore: 10,
                    icon: "link",
                    color: .orange,
                    detail: "ALEC membership confirmed"
                ),
                ScoreBreakdownItem(
                    category: "Transparency",
                    score: 12,
                    maxScore: 10,
                    icon: "eye",
                    color: .green,
                    detail: "Financial disclosures complete"
                )
            ],
            redFlags: [
                RedFlag(
                    title: "Super PAC Funding Over $1M",
                    description: "Received $2.3M from America First PAC, primarily funded by fossil fuel interests.",
                    severity: .high,
                    source: "OpenSecrets.org"
                ),
                RedFlag(
                    title: "ALEC Member",
                    description: "Listed as member of American Legislative Exchange Council, which drafts corporate-friendly legislation.",
                    severity: .high,
                    source: "ALEC Exposed"
                ),
                RedFlag(
                    title: "Heritage Foundation Event Speaker",
                    description: "Keynote speaker at Heritage Foundation policy summit 2023.",
                    severity: .medium,
                    source: "Heritage.org"
                ),
                RedFlag(
                    title: "Revolving Door",
                    description: "Former pharmaceutical lobbyist before running for office.",
                    severity: .high,
                    source: "LobbyingDisclosure.gov"
                )
            ]
        )
    }
}

struct ScoreBreakdownItem {
    let category: String
    let score: Int
    let maxScore: Int
    let icon: String
    let color: Color
    let detail: String?
}

struct RedFlag {
    let title: String
    let description: String
    let severity: Severity
    let source: String?
    
    enum Severity: String {
        case low = "LOW"
        case medium = "MEDIUM"
        case high = "HIGH"
        case critical = "CRITICAL"
        
        var color: Color {
            switch self {
            case .low: return .yellow
            case .medium: return .orange
            case .high: return .red
            case .critical: return .purple
            }
        }
    }
}

// MARK: - Preview

#Preview {
    NavigationStack {
        CandidateAssessmentView()
    }
}
