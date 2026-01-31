// Campaign2026TrackerView.swift
// Know who's running, where they stand, and who pays them
// 2026 Midterm Elections

import SwiftUI

struct Campaign2026TrackerView: View {
    
    @State private var selectedRace: RaceType = .senate
    @State private var selectedState: String = "All States"
    @State private var searchText = ""
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                // Header
                headerSection
                
                // What's at stake
                stakesSection
                
                // Race type selector
                raceSelector
                
                // State filter
                stateFilter
                
                // Key races
                keyRacesSection
                
                // How to research candidates
                researchSection
                
                // Resources
                resourcesSection
            }
            .padding()
        }
        .background(Color.black.ignoresSafeArea())
        .navigationTitle("2026 Elections")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    // MARK: - Header
    
    private var headerSection: some View {
        VStack(spacing: 16) {
            ZStack {
                Circle()
                    .fill(Color.purple.opacity(0.2))
                    .frame(width: 100, height: 100)
                
                Image(systemName: "checkmark.seal.fill")
                    .font(.system(size: 44))
                    .foregroundColor(.purple)
            }
            
            Text("2026 Campaign Tracker")
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(.white)
            
            Text("Know the candidates before they get your vote")
                .font(.system(size: 14))
                .foregroundColor(.gray)
            
            // Election date
            VStack(spacing: 4) {
                Text("ELECTION DAY")
                    .font(.system(size: 10, weight: .black))
                    .foregroundColor(.purple)
                Text("November 3, 2026")
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(.white)
            }
            .padding()
            .background(Color.purple.opacity(0.2))
            .cornerRadius(12)
        }
    }
    
    // MARK: - What's at Stake
    
    private var stakesSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("WHAT'S AT STAKE IN 2026")
                .font(.system(size: 12, weight: .black))
                .foregroundColor(.orange)
            
            VStack(spacing: 12) {
                stakeRow("All 435 House seats", "Entire House up for election")
                stakeRow("33-34 Senate seats", "Class 2 Senators + specials")
                stakeRow("36 Governorships", "Including TX, FL, GA, PA")
                stakeRow("State Legislatures", "Redistricting power for 2030s")
                stakeRow("Secretaries of State", "Who counts the votes")
            }
            
            Text("Midterms often have lower turnout but equal importance. Your vote matters MORE.")
                .font(.system(size: 12, weight: .medium))
                .foregroundColor(.green)
        }
        .padding()
        .background(Color.orange.opacity(0.1))
        .cornerRadius(16)
    }
    
    private func stakeRow(_ title: String, _ desc: String) -> some View {
        HStack {
            Image(systemName: "checkmark.circle.fill")
                .foregroundColor(.orange)
                .font(.system(size: 14))
            
            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(.white)
                Text(desc)
                    .font(.system(size: 11))
                    .foregroundColor(.gray)
            }
            
            Spacer()
        }
    }
    
    // MARK: - Race Selector
    
    private var raceSelector: some View {
        HStack(spacing: 12) {
            ForEach(RaceType.allCases, id: \.self) { race in
                Button(action: {
                    HapticManager.shared.light()
                    withAnimation { selectedRace = race }
                }) {
                    VStack(spacing: 6) {
                        Image(systemName: race.icon)
                            .font(.system(size: 20))
                        Text(race.rawValue)
                            .font(.system(size: 11, weight: .medium))
                    }
                    .foregroundColor(selectedRace == race ? .white : .gray)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 12)
                    .background(selectedRace == race ? Color.purple : Color.white.opacity(0.05))
                    .cornerRadius(12)
                }
            }
        }
    }
    
    // MARK: - State Filter
    
    private var stateFilter: some View {
        Menu {
            Button("All States") { selectedState = "All States" }
            Divider()
            ForEach(usStates, id: \.self) { state in
                Button(state) { selectedState = state }
            }
        } label: {
            HStack {
                Image(systemName: "map")
                Text(selectedState)
                Spacer()
                Image(systemName: "chevron.down")
            }
            .font(.system(size: 14, weight: .medium))
            .foregroundColor(.white)
            .padding()
            .background(Color.white.opacity(0.1))
            .cornerRadius(10)
        }
    }
    
    // MARK: - Key Races
    
    private var keyRacesSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Image(systemName: "flame.fill")
                    .foregroundColor(.orange)
                Text("Key Races to Watch")
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(.white)
            }
            
            Text("These races will likely determine control of Congress and key state governments:")
                .font(.system(size: 12))
                .foregroundColor(.gray)
            
            // Senate races
            if selectedRace == .senate || selectedRace == .all {
                sectionLabel("Senate Battlegrounds")
                
                ForEach(keySenateRaces, id: \.state) { race in
                    raceCard(race)
                }
            }
            
            // Governor races
            if selectedRace == .governor || selectedRace == .all {
                sectionLabel("Governor Races")
                
                ForEach(keyGovernorRaces, id: \.state) { race in
                    raceCard(race)
                }
            }
            
            // Note about data
            Text("Note: Candidate information updates as primaries conclude. Check resources below for current data.")
                .font(.system(size: 11))
                .foregroundColor(.gray)
                .italic()
        }
    }
    
    private func sectionLabel(_ text: String) -> some View {
        Text(text)
            .font(.system(size: 14, weight: .bold))
            .foregroundColor(.purple)
            .padding(.top, 8)
    }
    
    private func raceCard(_ race: KeyRace) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            // Header
            HStack {
                Text(race.state)
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.white)
                
                Spacer()
                
                Text(race.rating)
                    .font(.system(size: 11, weight: .bold))
                    .foregroundColor(ratingColor(race.rating))
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(ratingColor(race.rating).opacity(0.2))
                    .cornerRadius(4)
            }
            
            // Current holder
            HStack(spacing: 4) {
                Text("Current:")
                    .font(.system(size: 11))
                    .foregroundColor(.gray)
                Text(race.currentHolder)
                    .font(.system(size: 11, weight: .medium))
                    .foregroundColor(race.currentParty == "D" ? .blue : .red)
            }
            
            // Key issues
            Text("Key Issues: \(race.keyIssues)")
                .font(.system(size: 12))
                .foregroundColor(.white.opacity(0.8))
            
            // Why it matters
            HStack(spacing: 6) {
                Image(systemName: "exclamationmark.circle.fill")
                    .foregroundColor(.yellow)
                    .font(.system(size: 10))
                Text(race.whyItMatters)
                    .font(.system(size: 11))
                    .foregroundColor(.yellow)
            }
        }
        .padding()
        .background(Color.white.opacity(0.05))
        .cornerRadius(12)
    }
    
    private func ratingColor(_ rating: String) -> Color {
        switch rating {
        case "Toss-Up": return .purple
        case "Lean D", "Likely D": return .blue
        case "Lean R", "Likely R": return .red
        default: return .gray
        }
    }
    
    // MARK: - Research Section
    
    private var researchSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.cyan)
                Text("How to Research Candidates")
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(.white)
            }
            
            Text("Before voting, find out:")
                .font(.system(size: 14))
                .foregroundColor(.gray)
            
            VStack(spacing: 12) {
                researchRow("Who funds them?", "Check OpenSecrets.org for donors", "dollarsign.circle")
                researchRow("How do they vote?", "Check VoteSmart.org for voting records", "checkmark.square")
                researchRow("What do they actually say?", "Watch full interviews, not clips", "play.rectangle")
                researchRow("Who endorses them?", "Endorsements reveal true allegiances", "person.2")
                researchRow("What's their background?", "Ballotpedia for full biography", "doc.text")
            }
            
            // Questions to ask
            VStack(alignment: .leading, spacing: 8) {
                Text("QUESTIONS THAT REVEAL TRUTH:")
                    .font(.system(size: 10, weight: .black))
                    .foregroundColor(.orange)
                
                Text("• Will they accept election results if they lose?")
                Text("• Do they take corporate PAC money?")
                Text("• Where do they stand on voting rights?")
                Text("• Have they ever broken with their party?")
                Text("• Who are their biggest donors?")
            }
            .font(.system(size: 12))
            .foregroundColor(.white.opacity(0.8))
        }
        .padding()
        .background(Color.cyan.opacity(0.1))
        .cornerRadius(16)
    }
    
    private func researchRow(_ question: String, _ answer: String, _ icon: String) -> some View {
        HStack(alignment: .top, spacing: 12) {
            Image(systemName: icon)
                .foregroundColor(.cyan)
                .font(.system(size: 16))
                .frame(width: 24)
            
            VStack(alignment: .leading, spacing: 2) {
                Text(question)
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(.white)
                Text(answer)
                    .font(.system(size: 12))
                    .foregroundColor(.gray)
            }
            
            Spacer()
        }
    }
    
    // MARK: - Resources
    
    private var resourcesSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Image(systemName: "link")
                    .foregroundColor(.green)
                Text("Research Resources")
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(.white)
            }
            
            VStack(spacing: 12) {
                resourceLink("OpenSecrets.org", "Follow the money—campaign finance data", "https://opensecrets.org")
                resourceLink("VoteSmart.org", "Voting records and positions", "https://votesmart.org")
                resourceLink("Ballotpedia", "Encyclopedic candidate information", "https://ballotpedia.org")
                resourceLink("FEC.gov", "Official federal election filings", "https://fec.gov")
                resourceLink("Vote.org", "Register to vote, find your polling place", "https://vote.org")
                resourceLink("270toWin", "Electoral maps and projections", "https://270towin.com")
            }
        }
        .padding()
        .background(Color.green.opacity(0.1))
        .cornerRadius(16)
    }
    
    private func resourceLink(_ name: String, _ desc: String, _ url: String) -> some View {
        Button(action: {
            if let link = URL(string: url) {
                UIApplication.shared.open(link)
            }
        }) {
            HStack {
                VStack(alignment: .leading, spacing: 2) {
                    Text(name)
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(.white)
                    Text(desc)
                        .font(.system(size: 11))
                        .foregroundColor(.gray)
                }
                
                Spacer()
                
                Image(systemName: "arrow.up.right.square")
                    .foregroundColor(.green)
            }
            .padding()
            .background(Color.white.opacity(0.05))
            .cornerRadius(10)
        }
    }
    
    // MARK: - Data
    
    private var keySenateRaces: [KeyRace] {
        [
            KeyRace(
                state: "Georgia",
                raceType: .senate,
                currentHolder: "Jon Ossoff (D)",
                currentParty: "D",
                rating: "Toss-Up",
                keyIssues: "Voting rights, economy, healthcare",
                whyItMatters: "Battleground state that flipped in 2020. Could determine Senate control."
            ),
            KeyRace(
                state: "Michigan",
                raceType: .senate,
                currentHolder: "Gary Peters (D)",
                currentParty: "D",
                rating: "Lean D",
                keyIssues: "Auto industry, abortion rights, labor",
                whyItMatters: "Rust Belt swing state. Strong union presence."
            ),
            KeyRace(
                state: "Arizona",
                raceType: .senate,
                currentHolder: "Mark Kelly (D)",
                currentParty: "D",
                rating: "Toss-Up",
                keyIssues: "Immigration, water rights, economy",
                whyItMatters: "Recently flipped, large Latino population."
            ),
            KeyRace(
                state: "Nevada",
                raceType: .senate,
                currentHolder: "Jacky Rosen (D)",
                currentParty: "D",
                rating: "Toss-Up",
                keyIssues: "Tourism economy, housing costs, water",
                whyItMatters: "Narrow margins, diverse electorate."
            ),
            KeyRace(
                state: "North Carolina",
                raceType: .senate,
                currentHolder: "Thom Tillis (R)",
                currentParty: "R",
                rating: "Lean R",
                keyIssues: "Economy, abortion, voting access",
                whyItMatters: "Growing state, potential Democratic flip opportunity."
            ),
            KeyRace(
                state: "Wisconsin",
                raceType: .senate,
                currentHolder: "Tammy Baldwin (D)",
                currentParty: "D",
                rating: "Lean D",
                keyIssues: "Manufacturing, dairy, healthcare",
                whyItMatters: "Razor-thin margins in every election."
            )
        ]
    }
    
    private var keyGovernorRaces: [KeyRace] {
        [
            KeyRace(
                state: "Texas",
                raceType: .governor,
                currentHolder: "Greg Abbott (R)",
                currentParty: "R",
                rating: "Likely R",
                keyIssues: "Border, grid reliability, abortion ban",
                whyItMatters: "Largest red state. Growing Democratic population."
            ),
            KeyRace(
                state: "Florida",
                raceType: .governor,
                currentHolder: "Ron DeSantis (R)",
                currentParty: "R",
                rating: "Lean R",
                keyIssues: "Insurance crisis, abortion, education",
                whyItMatters: "Term-limited DeSantis. Open seat race."
            ),
            KeyRace(
                state: "Georgia",
                raceType: .governor,
                currentHolder: "Brian Kemp (R)",
                currentParty: "R",
                rating: "Toss-Up",
                keyIssues: "Voting access, economy, abortion",
                whyItMatters: "Term-limited Kemp. Stacey Abrams territory."
            ),
            KeyRace(
                state: "Pennsylvania",
                raceType: .governor,
                currentHolder: "Josh Shapiro (D)",
                currentParty: "D",
                rating: "Lean D",
                keyIssues: "Energy, abortion rights, democracy",
                whyItMatters: "Critical swing state. Shapiro is popular."
            ),
            KeyRace(
                state: "Arizona",
                raceType: .governor,
                currentHolder: "Katie Hobbs (D)",
                currentParty: "D",
                rating: "Toss-Up",
                keyIssues: "Water, border, abortion",
                whyItMatters: "Won narrowly in 2022. Republican targets."
            ),
            KeyRace(
                state: "Michigan",
                raceType: .governor,
                currentHolder: "Gretchen Whitmer (D)",
                currentParty: "D",
                rating: "Lean D",
                keyIssues: "Auto industry, abortion, infrastructure",
                whyItMatters: "Term-limited Whitmer. Open seat in swing state."
            )
        ]
    }
    
    private var usStates: [String] {
        ["Alabama", "Alaska", "Arizona", "Arkansas", "California", "Colorado", "Connecticut", "Delaware", "Florida", "Georgia", "Hawaii", "Idaho", "Illinois", "Indiana", "Iowa", "Kansas", "Kentucky", "Louisiana", "Maine", "Maryland", "Massachusetts", "Michigan", "Minnesota", "Mississippi", "Missouri", "Montana", "Nebraska", "Nevada", "New Hampshire", "New Jersey", "New Mexico", "New York", "North Carolina", "North Dakota", "Ohio", "Oklahoma", "Oregon", "Pennsylvania", "Rhode Island", "South Carolina", "South Dakota", "Tennessee", "Texas", "Utah", "Vermont", "Virginia", "Washington", "West Virginia", "Wisconsin", "Wyoming"]
    }
}

// MARK: - Models

enum RaceType: String, CaseIterable {
    case all = "All"
    case senate = "Senate"
    case house = "House"
    case governor = "Governor"
    
    var icon: String {
        switch self {
        case .all: return "square.grid.2x2"
        case .senate: return "building.columns"
        case .house: return "person.3"
        case .governor: return "star"
        }
    }
}

struct KeyRace {
    let state: String
    let raceType: RaceType
    let currentHolder: String
    let currentParty: String
    let rating: String
    let keyIssues: String
    let whyItMatters: String
}

#Preview {
    NavigationView {
        Campaign2026TrackerView()
    }
}
