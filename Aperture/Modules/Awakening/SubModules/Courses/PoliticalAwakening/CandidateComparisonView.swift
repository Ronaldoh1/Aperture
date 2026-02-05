// CandidateDataEntryView.swift
// Manual entry or import from data sources

import SwiftUI

struct CandidateDataEntryView: View {
    
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel: CandidateAssessmentViewModel
    
    @State private var name = ""
    @State private var position = ""
    @State private var party = "Democrat"
    @State private var state = ""
    @State private var fecId = ""
    @State private var isSearching = false
    
    let parties = ["Democrat", "Republican", "Independent", "Green", "Libertarian", "Other"]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 24) {
                    // Quick Import
                    quickImportSection
                    
                    Divider()
                        .background(Color.white.opacity(0.2))
                    
                    // Manual Entry
                    manualEntrySection
                    
                    // Recommended Sources
                    recommendedSourcesSection
                }
                .padding()
            }
            .background(Color.black.ignoresSafeArea())
            .navigationTitle("Add Candidate")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Assess") {
                        HapticManager.shared.medium()
                        viewModel.loadCandidate(name: name, position: position, party: party)
                        dismiss()
                    }
                    .disabled(name.isEmpty || position.isEmpty)
                }
            }
        }
    }
    
    // MARK: - Quick Import
    
    private var quickImportSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Quick Import")
                .font(.system(size: 18, weight: .bold))
                .foregroundColor(.white)
            
            Text("Search by FEC ID or import from OpenSecrets")
                .font(.system(size: 13))
                .foregroundColor(.gray)
            
            HStack {
                TextField("FEC Candidate ID (e.g., H0NY14138)", text: $fecId)
                    .textFieldStyle(.plain)
                    .padding()
                    .background(Color.white.opacity(0.1))
                    .cornerRadius(10)
                    .foregroundColor(.white)
                
                Button(action: {
                    HapticManager.shared.medium()
                    // TODO: Fetch from FEC API
                    isSearching = true
                }) {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
            }
            
            // Quick search links
            HStack(spacing: 12) {
                quickLinkButton("Find FEC ID", "FEC.gov", Color.blue)
                quickLinkButton("OpenSecrets", "Search", Color.green)
            }
        }
    }
    
    private func quickLinkButton(_ title: String, _ subtitle: String, _ color: Color) -> some View {
        Button(action: {
            HapticManager.shared.light()
            // TODO: Open relevant website
        }) {
            VStack(spacing: 4) {
                Text(title)
                    .font(.system(size: 12, weight: .semibold))
                Text(subtitle)
                    .font(.system(size: 10))
                    .opacity(0.7)
            }
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 12)
            .background(color.opacity(0.3))
            .cornerRadius(10)
        }
    }
    
    // MARK: - Manual Entry
    
    private var manualEntrySection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Manual Entry")
                .font(.system(size: 18, weight: .bold))
                .foregroundColor(.white)
            
            // Name
            VStack(alignment: .leading, spacing: 6) {
                Text("Candidate Name")
                    .font(.system(size: 13, weight: .medium))
                    .foregroundColor(.gray)
                TextField("Full Name", text: $name)
                    .textFieldStyle(.plain)
                    .padding()
                    .background(Color.white.opacity(0.1))
                    .cornerRadius(10)
                    .foregroundColor(.white)
            }
            
            // Position
            VStack(alignment: .leading, spacing: 6) {
                Text("Position Seeking")
                    .font(.system(size: 13, weight: .medium))
                    .foregroundColor(.gray)
                TextField("e.g., U.S. Representative, Senator, President", text: $position)
                    .textFieldStyle(.plain)
                    .padding()
                    .background(Color.white.opacity(0.1))
                    .cornerRadius(10)
                    .foregroundColor(.white)
            }
            
            // Party
            VStack(alignment: .leading, spacing: 6) {
                Text("Party")
                    .font(.system(size: 13, weight: .medium))
                    .foregroundColor(.gray)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 10) {
                        ForEach(parties, id: \.self) { p in
                            Button(action: {
                                HapticManager.shared.light()
                                party = p
                            }) {
                                Text(p)
                                    .font(.system(size: 13, weight: .medium))
                                    .foregroundColor(party == p ? .black : .white)
                                    .padding(.horizontal, 14)
                                    .padding(.vertical, 8)
                                    .background(party == p ? partyColor(p) : Color.white.opacity(0.1))
                                    .cornerRadius(8)
                            }
                        }
                    }
                }
            }
            
            // State
            VStack(alignment: .leading, spacing: 6) {
                Text("State/District (Optional)")
                    .font(.system(size: 13, weight: .medium))
                    .foregroundColor(.gray)
                TextField("e.g., NY-14, California", text: $state)
                    .textFieldStyle(.plain)
                    .padding()
                    .background(Color.white.opacity(0.1))
                    .cornerRadius(10)
                    .foregroundColor(.white)
            }
        }
    }
    
    private func partyColor(_ party: String) -> Color {
        switch party {
        case "Democrat": return .blue
        case "Republican": return .red
        case "Independent": return .purple
        case "Green": return .green
        case "Libertarian": return .yellow
        default: return .gray
        }
    }
    
    // MARK: - Recommended Sources
    
    private var recommendedSourcesSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Where to Find Candidate Info")
                .font(.system(size: 18, weight: .bold))
                .foregroundColor(.white)
            
            VStack(spacing: 12) {
                sourceCard(
                    name: "FEC.gov",
                    description: "Official campaign finance filings",
                    url: "https://www.fec.gov/data/candidates",
                    icon: "building.columns.fill",
                    color: .blue
                )
                
                sourceCard(
                    name: "OpenSecrets.org",
                    description: "Follow the money - donations, lobbying",
                    url: "https://www.opensecrets.org/elections",
                    icon: "dollarsign.circle.fill",
                    color: .green
                )
                
                sourceCard(
                    name: "VoteSmart.org",
                    description: "Voting records, positions, ratings",
                    url: "https://justfacts.votesmart.org",
                    icon: "checkmark.seal.fill",
                    color: .purple
                )
                
                sourceCard(
                    name: "Ballotpedia",
                    description: "Comprehensive candidate profiles",
                    url: "https://ballotpedia.org",
                    icon: "doc.text.fill",
                    color: .orange
                )
            }
        }
    }
    
    private func sourceCard(name: String, description: String, url: String, icon: String, color: Color) -> some View {
        Button(action: {
            HapticManager.shared.light()
            if let url = URL(string: url) {
                UIApplication.shared.open(url)
            }
        }) {
            HStack(spacing: 12) {
                Image(systemName: icon)
                    .font(.system(size: 20))
                    .foregroundColor(color)
                    .frame(width: 32)
                
                VStack(alignment: .leading, spacing: 2) {
                    Text(name)
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(.white)
                    Text(description)
                        .font(.system(size: 11))
                        .foregroundColor(.gray)
                }
                
                Spacer()
                
                Image(systemName: "arrow.up.right.square")
                    .foregroundColor(.gray)
            }
            .padding()
            .background(Color.white.opacity(0.05))
            .cornerRadius(12)
        }
    }
}

// MARK: - Candidate Comparison View

struct CandidateComparisonView: View {
    
    @State private var candidates: [CandidateData] = []
    @State private var showAddCandidate = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                // Header
                headerSection
                
                if candidates.isEmpty {
                    emptyState
                } else {
                    // Comparison Table
                    comparisonSection
                }
                
                // Add Candidate Button
                addCandidateButton
            }
            .padding()
        }
        .background(Color.black.ignoresSafeArea())
        .navigationTitle("Compare Candidates")
    }
    
    private var headerSection: some View {
        VStack(spacing: 12) {
            Image(systemName: "person.2.fill")
                .font(.system(size: 40))
                .foregroundColor(.blue)
            
            Text("Side-by-Side Comparison")
                .font(.system(size: 20, weight: .bold))
                .foregroundColor(.white)
            
            Text("Compare candidates in your primary or general election")
                .font(.system(size: 14))
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
        }
    }
    
    private var emptyState: some View {
        VStack(spacing: 16) {
            Image(systemName: "person.crop.circle.badge.plus")
                .font(.system(size: 50))
                .foregroundColor(.gray)
            
            Text("Add candidates to compare")
                .font(.system(size: 16))
                .foregroundColor(.gray)
            
            Text("We'll show you a side-by-side breakdown of their funding, voting records, and red flags.")
                .font(.system(size: 13))
                .foregroundColor(.gray.opacity(0.7))
                .multilineTextAlignment(.center)
        }
        .padding(.vertical, 40)
    }
    
    private var comparisonSection: some View {
        VStack(spacing: 16) {
            // Sample comparison with two candidates
            HStack(spacing: 16) {
                candidateColumn(CandidateData.sample)
                
                Divider()
                    .background(Color.white.opacity(0.2))
                
                candidateColumn(CandidateData.sample)
            }
        }
    }
    
    private func candidateColumn(_ candidate: CandidateData) -> some View {
        VStack(spacing: 16) {
            // Header
            VStack(spacing: 8) {
                ZStack {
                    Circle()
                        .fill(candidate.partyColor.opacity(0.2))
                        .frame(width: 60, height: 60)
                    Text(candidate.initials)
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(candidate.partyColor)
                }
                
                Text(candidate.name)
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                
                Text(candidate.party)
                    .font(.system(size: 11))
                    .foregroundColor(candidate.partyColor)
            }
            
            // Score
            VStack(spacing: 4) {
                Text("\(candidate.integrityScore)")
                    .font(.system(size: 32, weight: .bold))
                    .foregroundColor(candidate.scoreColor)
                Text("Integrity Score")
                    .font(.system(size: 10))
                    .foregroundColor(.gray)
            }
            
            // Red flags count
            HStack {
                Image(systemName: "flag.fill")
                    .foregroundColor(.red)
                    .font(.system(size: 12))
                Text("\(candidate.redFlags.count) Red Flags")
                    .font(.system(size: 12))
                    .foregroundColor(.red)
            }
            .padding(.horizontal, 12)
            .padding(.vertical, 6)
            .background(Color.red.opacity(0.1))
            .cornerRadius(8)
        }
        .frame(maxWidth: .infinity)
    }
    
    private var addCandidateButton: some View {
        Button(action: {
            HapticManager.shared.medium()
            showAddCandidate = true
        }) {
            HStack {
                Image(systemName: "plus.circle.fill")
                Text("Add Candidate")
            }
            .font(.system(size: 16, weight: .semibold))
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 14)
            .background(Color.blue)
            .cornerRadius(12)
        }
    }
}

// MARK: - Election Tracker View

struct ElectionTrackerView: View {
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                // Header
                VStack(spacing: 12) {
                    Image(systemName: "calendar.badge.clock")
                        .font(.system(size: 50))
                        .foregroundColor(.green)
                    
                    Text("Election Tracker")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundColor(.white)
                    
                    Text("Never miss a primary or registration deadline")
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                }
                
                // Upcoming Elections
                upcomingSection
                
                // Registration Info
                registrationSection
                
                // Resources
                resourcesSection
            }
            .padding()
        }
        .background(Color.black.ignoresSafeArea())
        .navigationTitle("Elections")
    }
    
    private var upcomingSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Upcoming Elections")
                .font(.system(size: 18, weight: .bold))
                .foregroundColor(.white)
            
            electionCard(
                type: "Presidential Primary",
                date: "March 5, 2024",
                location: "Super Tuesday States",
                daysUntil: 45
            )
            
            electionCard(
                type: "Primary Election",
                date: "June 4, 2024",
                location: "Your District",
                daysUntil: 120
            )
            
            electionCard(
                type: "General Election",
                date: "November 5, 2024",
                location: "Nationwide",
                daysUntil: 285
            )
        }
    }
    
    private func electionCard(type: String, date: String, location: String, daysUntil: Int) -> some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(type)
                    .font(.system(size: 15, weight: .semibold))
                    .foregroundColor(.white)
                Text(date)
                    .font(.system(size: 13))
                    .foregroundColor(.gray)
                Text(location)
                    .font(.system(size: 12))
                    .foregroundColor(.blue)
            }
            
            Spacer()
            
            VStack {
                Text("\(daysUntil)")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(.orange)
                Text("days")
                    .font(.system(size: 11))
                    .foregroundColor(.gray)
            }
        }
        .padding()
        .background(Color.white.opacity(0.05))
        .cornerRadius(12)
    }
    
    private var registrationSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Voter Registration")
                .font(.system(size: 18, weight: .bold))
                .foregroundColor(.white)
            
            VStack(alignment: .leading, spacing: 12) {
                infoRow("Check your registration", "vote.gov", .blue)
                infoRow("Register to vote", "your state's website", .green)
                infoRow("Absentee ballot info", "available in most states", .purple)
            }
        }
        .padding()
        .background(Color.white.opacity(0.05))
        .cornerRadius(16)
    }
    
    private func infoRow(_ title: String, _ detail: String, _ color: Color) -> some View {
        HStack {
            Image(systemName: "checkmark.circle.fill")
                .foregroundColor(color)
            VStack(alignment: .leading) {
                Text(title)
                    .font(.system(size: 14, weight: .medium))
                    .foregroundColor(.white)
                Text(detail)
                    .font(.system(size: 12))
                    .foregroundColor(.gray)
            }
            Spacer()
        }
    }
    
    private var resourcesSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Resources")
                .font(.system(size: 18, weight: .bold))
                .foregroundColor(.white)
            
            Text("Primaries are where real change happens. General elections often give us two pre-selected candidates. Vote in your primary!")
                .font(.system(size: 13))
                .foregroundColor(.orange)
                .padding()
                .background(Color.orange.opacity(0.1))
                .cornerRadius(10)
        }
    }
}

// MARK: - Previews

#Preview("Data Entry") {
    CandidateDataEntryView(viewModel: CandidateAssessmentViewModel())
}

#Preview("Comparison") {
    NavigationStack {
        CandidateComparisonView()
    }
}

#Preview("Election Tracker") {
    NavigationStack {
        ElectionTrackerView()
    }
}
