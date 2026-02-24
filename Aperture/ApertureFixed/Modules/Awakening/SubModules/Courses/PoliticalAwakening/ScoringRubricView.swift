// ScoringRubricView.swift
// 100% Transparent Scoring Methodology
// No hidden algorithms. No bias. Just facts.

import SwiftUI

struct ScoringRubricView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 24) {
                    // Header
                    headerSection
                    
                    // Philosophy
                    philosophySection
                    
                    // Scoring Categories
                    ForEach(scoringCategories, id: \.title) { category in
                        categorySection(category)
                    }
                    
                    // Red Flag Criteria
                    redFlagCriteria
                    
                    // Data Sources
                    dataSourcesSection
                    
                    // Limitations
                    limitationsSection
                }
                .padding()
            }
            .background(Color.black.ignoresSafeArea())
            .navigationTitle("Scoring Rubric")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        dismiss()
                    }
                }
            }
        }
    }
    
    // MARK: - Header
    
    private var headerSection: some View {
        VStack(spacing: 16) {
            Image(systemName: "doc.text.magnifyingglass")
                .font(.system(size: 50))
                .foregroundColor(.blue)
            
            Text("Our Methodology")
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(.white)
            
            Text("We believe voters deserve complete transparency. Here's exactly how we calculate Integrity Scores.")
                .font(.system(size: 14))
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
        }
        .padding(.vertical)
    }
    
    // MARK: - Philosophy
    
    private var philosophySection: some View {
        VStack(alignment: .leading, spacing: 12) {
            sectionTitle("Our Philosophy", icon: "lightbulb.fill", color: .yellow)
            
            VStack(alignment: .leading, spacing: 12) {
                philosophyPoint("Follow the Money", "Campaign funding reveals true allegiances better than speeches.")
                philosophyPoint("Actions Over Words", "Voting records matter more than campaign promises.")
                philosophyPoint("Institutional Connections", "Think tank and NGO affiliations indicate ideological capture.")
                philosophyPoint("Transparency Matters", "Candidates who hide funding sources have something to hide.")
            }
        }
        .padding()
        .background(Color.yellow.opacity(0.05))
        .cornerRadius(16)
    }
    
    private func philosophyPoint(_ title: String, _ description: String) -> some View {
        HStack(alignment: .top, spacing: 12) {
            Image(systemName: "checkmark.circle.fill")
                .foregroundColor(.yellow)
                .font(.system(size: 16))
            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(.white)
                Text(description)
                    .font(.system(size: 12))
                    .foregroundColor(.gray)
            }
        }
    }
    
    // MARK: - Scoring Categories
    
    private func categorySection(_ category: ScoringCategory) -> some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                sectionTitle(category.title, icon: category.icon, color: category.color)
                Spacer()
                Text("\(category.maxPoints) pts")
                    .font(.system(size: 14, weight: .bold))
                    .foregroundColor(category.color)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 4)
                    .background(category.color.opacity(0.2))
                    .cornerRadius(8)
            }
            
            Text(category.description)
                .font(.system(size: 13))
                .foregroundColor(.gray)
            
            VStack(alignment: .leading, spacing: 8) {
                ForEach(category.criteria, id: \.points) { criterion in
                    criterionRow(criterion, color: category.color)
                }
            }
            
            if let dataSource = category.dataSource {
                HStack(spacing: 4) {
                    Image(systemName: "link")
                        .font(.system(size: 10))
                    Text("Data Source: \(dataSource)")
                        .font(.system(size: 11))
                }
                .foregroundColor(.blue)
            }
        }
        .padding()
        .background(Color.white.opacity(0.05))
        .cornerRadius(16)
    }
    
    private func criterionRow(_ criterion: ScoringCriterion, color: Color) -> some View {
        HStack(alignment: .top, spacing: 12) {
            Text("\(criterion.points)")
                .font(.system(size: 12, weight: .bold))
                .foregroundColor(.black)
                .frame(width: 28, height: 28)
                .background(color)
                .cornerRadius(6)
            
            VStack(alignment: .leading, spacing: 2) {
                Text(criterion.requirement)
                    .font(.system(size: 13, weight: .medium))
                    .foregroundColor(.white)
                if let example = criterion.example {
                    Text(example)
                        .font(.system(size: 11))
                        .foregroundColor(.gray)
                        .italic()
                }
            }
        }
    }
    
    // MARK: - Red Flag Criteria
    
    private var redFlagCriteria: some View {
        VStack(alignment: .leading, spacing: 16) {
            sectionTitle("Red Flag Triggers", icon: "exclamationmark.triangle.fill", color: .red)
            
            Text("These automatically flag a candidate for further scrutiny:")
                .font(.system(size: 13))
                .foregroundColor(.gray)
            
            VStack(alignment: .leading, spacing: 12) {
                redFlagItem("CRITICAL", "Any AIPAC funding over $50K", .purple)
                redFlagItem("CRITICAL", "Heritage Foundation leadership role", .purple)
                redFlagItem("HIGH", "Super PAC support over $500K", .red)
                redFlagItem("HIGH", "ALEC membership (current or former)", .red)
                redFlagItem("HIGH", "Revolving door (lobbyist → politician)", .red)
                redFlagItem("HIGH", "Koch network funding", .red)
                redFlagItem("MEDIUM", "More corporate than small donor funding", .orange)
                redFlagItem("MEDIUM", "Voted against party platform >40%", .orange)
                redFlagItem("LOW", "Incomplete financial disclosures", .yellow)
                redFlagItem("LOW", "Dark money PAC connections", .yellow)
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
    
    private func redFlagItem(_ severity: String, _ description: String, _ color: Color) -> some View {
        HStack(spacing: 12) {
            Text(severity)
                .font(.system(size: 9, weight: .bold))
                .foregroundColor(.white)
                .padding(.horizontal, 6)
                .padding(.vertical, 3)
                .background(color)
                .cornerRadius(4)
            
            Text(description)
                .font(.system(size: 13))
                .foregroundColor(.white)
        }
    }
    
    // MARK: - Data Sources
    
    private var dataSourcesSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            sectionTitle("Our Data Sources", icon: "server.rack", color: .green)
            
            Text("We only use publicly verifiable data:")
                .font(.system(size: 13))
                .foregroundColor(.gray)
            
            VStack(alignment: .leading, spacing: 12) {
                sourceItem("FEC.gov", "Official federal campaign finance records", "Primary")
                sourceItem("OpenSecrets.org", "Center for Responsive Politics analysis", "Primary")
                sourceItem("GovTrack.us", "Congressional voting records", "Primary")
                sourceItem("FollowTheMoney.org", "State-level campaign finance", "Primary")
                sourceItem("FactCheck.org", "Nonpartisan fact verification", "Secondary")
                sourceItem("ProPublica", "Investigative journalism", "Secondary")
                sourceItem("ALEC Exposed", "Corporate bill mill tracking", "Secondary")
                sourceItem("LittleSis.org", "Power network mapping", "Secondary")
            }
        }
        .padding()
        .background(Color.green.opacity(0.05))
        .cornerRadius(16)
    }
    
    private func sourceItem(_ name: String, _ description: String, _ type: String) -> some View {
        HStack(spacing: 12) {
            Image(systemName: type == "Primary" ? "checkmark.seal.fill" : "checkmark.circle")
                .foregroundColor(type == "Primary" ? .green : .blue)
                .font(.system(size: 14))
            
            VStack(alignment: .leading, spacing: 2) {
                HStack {
                    Text(name)
                        .font(.system(size: 13, weight: .semibold))
                        .foregroundColor(.white)
                    
                    Text(type)
                        .font(.system(size: 9, weight: .medium))
                        .foregroundColor(type == "Primary" ? .green : .blue)
                        .padding(.horizontal, 6)
                        .padding(.vertical, 2)
                        .background((type == "Primary" ? Color.green : Color.blue).opacity(0.2))
                        .cornerRadius(4)
                }
                Text(description)
                    .font(.system(size: 11))
                    .foregroundColor(.gray)
            }
        }
    }
    
    // MARK: - Limitations
    
    private var limitationsSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            sectionTitle("Limitations & Disclaimers", icon: "info.circle.fill", color: .orange)
            
            VStack(alignment: .leading, spacing: 12) {
                limitationItem("This is a tool for voter education, not endorsement")
                limitationItem("Scores are based on publicly available data only")
                limitationItem("Data may have delays from official filing periods")
                limitationItem("Local candidates may have less available data")
                limitationItem("We encourage users to verify through original sources")
                limitationItem("Methodology is open to feedback and improvement")
            }
            
            Text("We have no political affiliation. We follow the money regardless of party.")
                .font(.system(size: 12, weight: .medium))
                .foregroundColor(.orange)
                .padding()
                .background(Color.orange.opacity(0.1))
                .cornerRadius(10)
        }
        .padding()
        .background(Color.orange.opacity(0.05))
        .cornerRadius(16)
    }
    
    private func limitationItem(_ text: String) -> some View {
        HStack(alignment: .top, spacing: 10) {
            Image(systemName: "exclamationmark.circle")
                .foregroundColor(.orange)
                .font(.system(size: 12))
            Text(text)
                .font(.system(size: 12))
                .foregroundColor(.gray)
        }
    }
    
    // MARK: - Helpers
    
    private func sectionTitle(_ title: String, icon: String, color: Color) -> some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .foregroundColor(color)
            Text(title)
                .font(.system(size: 16, weight: .bold))
                .foregroundColor(.white)
        }
    }
    
    // MARK: - Scoring Categories Data
    
    private var scoringCategories: [ScoringCategory] {
        [
            ScoringCategory(
                title: "Small Donor Funding",
                icon: "person.3.fill",
                color: .blue,
                maxPoints: 20,
                description: "What percentage of contributions come from small donors (<$200)?",
                criteria: [
                    ScoringCriterion(points: 20, requirement: "70%+ from small donors", example: "Bernie Sanders 2020: 60%"),
                    ScoringCriterion(points: 15, requirement: "50-69% from small donors"),
                    ScoringCriterion(points: 10, requirement: "30-49% from small donors"),
                    ScoringCriterion(points: 5, requirement: "15-29% from small donors"),
                    ScoringCriterion(points: 0, requirement: "<15% from small donors", example: "Most incumbents")
                ],
                dataSource: "FEC.gov individual contributions"
            ),
            ScoringCategory(
                title: "Super PAC Independence",
                icon: "dollarsign.circle.fill",
                color: .green,
                maxPoints: 25,
                description: "Has the candidate rejected or been supported by Super PACs?",
                criteria: [
                    ScoringCriterion(points: 25, requirement: "Publicly rejected Super PAC support"),
                    ScoringCriterion(points: 20, requirement: "No significant Super PAC activity (<$50K)"),
                    ScoringCriterion(points: 10, requirement: "Limited Super PAC support ($50K-$500K)"),
                    ScoringCriterion(points: 5, requirement: "Moderate Super PAC support ($500K-$2M)"),
                    ScoringCriterion(points: 0, requirement: "Heavy Super PAC support (>$2M)")
                ],
                dataSource: "OpenSecrets.org outside spending"
            ),
            ScoringCategory(
                title: "Voting Record Alignment",
                icon: "checkmark.square.fill",
                color: .purple,
                maxPoints: 20,
                description: "Do their votes match their campaign promises?",
                criteria: [
                    ScoringCriterion(points: 20, requirement: "90%+ alignment with stated positions"),
                    ScoringCriterion(points: 15, requirement: "75-89% alignment"),
                    ScoringCriterion(points: 10, requirement: "60-74% alignment"),
                    ScoringCriterion(points: 5, requirement: "40-59% alignment"),
                    ScoringCriterion(points: 0, requirement: "<40% alignment", example: "Says one thing, votes another")
                ],
                dataSource: "GovTrack.us voting records"
            ),
            ScoringCategory(
                title: "Corporate Lobbying Resistance",
                icon: "building.2.fill",
                color: .orange,
                maxPoints: 15,
                description: "How much corporate/PAC money do they accept?",
                criteria: [
                    ScoringCriterion(points: 15, requirement: "No corporate PAC money"),
                    ScoringCriterion(points: 10, requirement: "Limited corporate PAC (<$100K)"),
                    ScoringCriterion(points: 5, requirement: "Moderate corporate PAC ($100K-$500K)"),
                    ScoringCriterion(points: 0, requirement: "Heavy corporate PAC (>$500K)")
                ],
                dataSource: "FEC.gov PAC contributions"
            ),
            ScoringCategory(
                title: "Think Tank & NGO Independence",
                icon: "link.circle.fill",
                color: .red,
                maxPoints: 10,
                description: "Connections to policy-shaping organizations",
                criteria: [
                    ScoringCriterion(points: 10, requirement: "No concerning affiliations"),
                    ScoringCriterion(points: 5, requirement: "Minor affiliations (attended events)"),
                    ScoringCriterion(points: 0, requirement: "Member of ALEC, Heritage, etc."),
                    ScoringCriterion(points: -5, requirement: "Leadership role in concerning orgs")
                ],
                dataSource: "Organization disclosures, ALEC Exposed"
            ),
            ScoringCategory(
                title: "Financial Transparency",
                icon: "eye.fill",
                color: .cyan,
                maxPoints: 10,
                description: "How transparent are their financial disclosures?",
                criteria: [
                    ScoringCriterion(points: 10, requirement: "Complete, timely disclosures"),
                    ScoringCriterion(points: 7, requirement: "Mostly complete disclosures"),
                    ScoringCriterion(points: 3, requirement: "Incomplete or late disclosures"),
                    ScoringCriterion(points: 0, requirement: "Significant gaps or missing reports")
                ],
                dataSource: "FEC.gov filing records"
            )
        ]
    }
}

// MARK: - Data Models

struct ScoringCategory {
    let title: String
    let icon: String
    let color: Color
    let maxPoints: Int
    let description: String
    let criteria: [ScoringCriterion]
    let dataSource: String?
}

struct ScoringCriterion {
    let points: Int
    let requirement: String
    let example: String?
    
    init(points: Int, requirement: String, example: String? = nil) {
        self.points = points
        self.requirement = requirement
        self.example = example
    }
}

// MARK: - Preview

#Preview {
    ScoringRubricView()
}
