// PoliticalAwakeningView.swift
// Expose the political theater - evaluate candidates, understand the system
// Transparent rubrics, real data sources, no illusions

import SwiftUI

// MARK: - Political Awakening Hub

struct PoliticalAwakeningView: View {
    
    @State private var selectedSection: PoliticalSection = .overview
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                // Header
                headerSection
                
                // Section Picker
                sectionPicker
                
                // Content based on selection
                switch selectedSection {
                case .overview:
                    overviewSection
                case .assessCandidate:
                    NavigationLink(destination: CandidateAssessmentView()) {
                        featureCard(
                            icon: "person.crop.circle.badge.checkmark",
                            title: "Assess a Candidate",
                            subtitle: "Calculate their Integrity Score",
                            color: .orange
                        )
                    }
                case .compare:
                    NavigationLink(destination: CandidateComparisonView()) {
                        featureCard(
                            icon: "person.2.fill",
                            title: "Compare Candidates",
                            subtitle: "Side-by-side analysis",
                            color: .blue
                        )
                    }
                case .courses:
                    coursesSection
                }
                
                // Data Sources Transparency
                dataSourcesSection
            }
            .padding()
        }
        .background(Color.black.ignoresSafeArea())
        .navigationTitle("Political Awakening")
    }
    
    // MARK: - Header
    
    private var headerSection: some View {
        VStack(spacing: 16) {
            ZStack {
                Circle()
                    .fill(Color.red.opacity(0.2))
                    .frame(width: 100, height: 100)
                
                Image(systemName: "building.columns.fill")
                    .font(.system(size: 44))
                    .foregroundColor(.red)
            }
            
            Text("See Through the Theater")
                .font(.system(size: 24, weight: .bold, design: .rounded))
                .foregroundColor(.white)
            
            Text("Evaluate candidates with transparency.\nNo spin. No illusions. Just data.")
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
        }
        .padding(.vertical)
    }
    
    // MARK: - Section Picker
    
    private var sectionPicker: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 12) {
                ForEach(PoliticalSection.allCases, id: \.self) { section in
                    Button(action: {
                        HapticManager.shared.light()
                        withAnimation(.spring()) {
                            selectedSection = section
                        }
                    }) {
                        Text(section.title)
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(selectedSection == section ? .black : .white)
                            .padding(.horizontal, 16)
                            .padding(.vertical, 10)
                            .background(
                                Capsule()
                                    .fill(selectedSection == section ? Color.white : Color.white.opacity(0.1))
                            )
                    }
                }
            }
        }
    }
    
    // MARK: - Overview
    
    private var overviewSection: some View {
        VStack(spacing: 16) {
            // Quick Actions
            NavigationLink(destination: CandidateAssessmentView()) {
                featureCard(
                    icon: "person.crop.circle.badge.checkmark",
                    title: "Assess a Candidate",
                    subtitle: "Get their Integrity Score based on funding, voting record, and affiliations",
                    color: .orange
                )
            }
            
            NavigationLink(destination: CandidateComparisonView()) {
                featureCard(
                    icon: "person.2.fill",
                    title: "Compare Candidates",
                    subtitle: "Side-by-side comparison for primaries and elections",
                    color: .blue
                )
            }
            
            NavigationLink(destination: ElectionTrackerView()) {
                featureCard(
                    icon: "calendar.badge.clock",
                    title: "Election Tracker",
                    subtitle: "Upcoming primaries, registration deadlines, and voting info",
                    color: .green
                )
            }
            
            // Warning Card
            warningCard
        }
    }
    
    private var warningCard: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(systemName: "exclamationmark.triangle.fill")
                    .foregroundColor(.yellow)
                Text("Red Flags to Watch")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.white)
            }
            
            VStack(alignment: .leading, spacing: 8) {
                flagItem("Super PAC funding over $100K")
                flagItem("Heritage Foundation / ALEC connections")
                flagItem("AIPAC endorsement or funding")
                flagItem("Revolving door lobbyist history")
                flagItem("Votes against constituent interests")
                flagItem("Dark money contributions")
            }
        }
        .padding()
        .background(Color.red.opacity(0.1))
        .cornerRadius(16)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color.red.opacity(0.3), lineWidth: 1)
        )
    }
    
    private func flagItem(_ text: String) -> some View {
        HStack(spacing: 8) {
            Image(systemName: "flag.fill")
                .font(.system(size: 10))
                .foregroundColor(.red)
            Text(text)
                .font(.system(size: 13))
                .foregroundColor(.gray)
        }
    }
    
    // MARK: - Courses
    
    private var coursesSection: some View {
        VStack(spacing: 16) {
            courseCard(
                title: "How Elections Really Work",
                lessons: 8,
                icon: "checkmark.seal.fill",
                color: .purple,
                destination: AnyView(ElectionsExposedCourse())
            )
            
            courseCard(
                title: "Super PACs Exposed",
                lessons: 6,
                icon: "dollarsign.circle.fill",
                color: .green,
                destination: AnyView(SuperPACsCourse())
            )
            
            courseCard(
                title: "The Heritage Foundation",
                lessons: 7,
                icon: "building.2.fill",
                color: .orange,
                destination: AnyView(HeritageFoundationCourse())
            )
            
            courseCard(
                title: "AIPAC & Foreign Influence",
                lessons: 6,
                icon: "globe.americas.fill",
                color: .blue,
                destination: AnyView(AIPACCourse())
            )
            
            courseCard(
                title: "Gerrymandering Decoded",
                lessons: 5,
                icon: "map.fill",
                color: .red,
                destination: AnyView(GerrymanderingCourse())
            )
            
            courseCard(
                title: "Corporate Capture",
                lessons: 7,
                icon: "briefcase.fill",
                color: .yellow,
                destination: AnyView(CorporateCaptureCourse())
            )
        }
    }
    
    // MARK: - Data Sources
    
    private var dataSourcesSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Our Data Sources")
                .font(.system(size: 16, weight: .bold))
                .foregroundColor(.white)
            
            Text("We believe in transparency. Here's where we get our data:")
                .font(.system(size: 13))
                .foregroundColor(.gray)
            
            VStack(alignment: .leading, spacing: 8) {
                sourceRow("FEC.gov", "Federal Election Commission filings")
                sourceRow("OpenSecrets.org", "Money in politics tracking")
                sourceRow("FactCheck.org", "Nonpartisan fact verification")
                sourceRow("GovTrack.us", "Voting records & bill tracking")
                sourceRow("FollowTheMoney.org", "State-level campaign finance")
                sourceRow("ProPublica", "Nonprofit investigative journalism")
            }
        }
        .padding()
        .background(Color.white.opacity(0.05))
        .cornerRadius(16)
    }
    
    private func sourceRow(_ name: String, _ description: String) -> some View {
        HStack {
            Image(systemName: "checkmark.circle.fill")
                .foregroundColor(.green)
                .font(.system(size: 12))
            VStack(alignment: .leading) {
                Text(name)
                    .font(.system(size: 13, weight: .semibold))
                    .foregroundColor(.white)
                Text(description)
                    .font(.system(size: 11))
                    .foregroundColor(.gray)
            }
            Spacer()
        }
    }
    
    // MARK: - Helpers
    
    private func featureCard(icon: String, title: String, subtitle: String, color: Color) -> some View {
        HStack(spacing: 16) {
            ZStack {
                Circle()
                    .fill(color.opacity(0.2))
                    .frame(width: 56, height: 56)
                Image(systemName: icon)
                    .font(.system(size: 24))
                    .foregroundColor(color)
            }
            
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.system(size: 17, weight: .semibold))
                    .foregroundColor(.white)
                Text(subtitle)
                    .font(.system(size: 13))
                    .foregroundColor(.gray)
                    .lineLimit(2)
            }
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
        }
        .padding()
        .background(Color.white.opacity(0.05))
        .cornerRadius(16)
    }
    
    private func courseCard(title: String, lessons: Int, icon: String, color: Color, destination: AnyView) -> some View {
        NavigationLink(destination: destination) {
            HStack(spacing: 14) {
                ZStack {
                    RoundedRectangle(cornerRadius: 12)
                        .fill(color.opacity(0.2))
                        .frame(width: 50, height: 50)
                    Image(systemName: icon)
                        .font(.system(size: 22))
                        .foregroundColor(color)
                }
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(title)
                        .font(.system(size: 15, weight: .semibold))
                        .foregroundColor(.white)
                    Text("\(lessons) lessons")
                        .font(.system(size: 12))
                        .foregroundColor(.gray)
                }
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .foregroundColor(.gray)
            }
            .padding()
            .background(Color.white.opacity(0.05))
            .cornerRadius(14)
        }
    }
}

// MARK: - Section Enum

enum PoliticalSection: String, CaseIterable {
    case overview
    case assessCandidate
    case compare
    case courses
    
    var title: String {
        switch self {
        case .overview: return "Overview"
        case .assessCandidate: return "Assess"
        case .compare: return "Compare"
        case .courses: return "Courses"
        }
    }
}

// MARK: - Preview

#Preview {
    NavigationStack {
        PoliticalAwakeningView()
    }
}
