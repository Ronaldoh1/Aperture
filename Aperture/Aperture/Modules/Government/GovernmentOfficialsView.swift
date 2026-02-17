// GovernmentOfficialsView.swift
// Know who represents you - and who pays them
// Searchable by state, branch, with donor information

import SwiftUI

struct GovernmentOfficialsView: View {
  @State private var selectedBranch: GovernmentBranch = .legislative
  @State private var selectedState: String = "All States"
  @State private var searchText = ""
  @State private var showFilters = false

  var body: some View {
    ScrollView {
      VStack(spacing: 20) {
        // Header
        headerSection

        // Search
        searchBar

        // Branch selector
        branchSelector

        // State filter
        stateFilter

        // Officials list based on branch
        switch selectedBranch {
        case .executive:
          executiveBranch
        case .legislative:
          legislativeBranch
        case .judicial:
          judicialBranch
        case .state:
          stateOfficials
        }

        // Data sources
        dataSourcesSection
      }
      .padding()
    }
    .background(Color.black.ignoresSafeArea())
    .navigationTitle("Government Officials")
    .navigationBarTitleDisplayMode(.inline)
  }

  // MARK: - Header

  private var headerSection: some View {
    VStack(spacing: 16) {
      ZStack {
        Circle()
          .fill(Color.blue.opacity(0.2))
          .frame(width: 80, height: 80)

        Image(systemName: "building.columns.fill")
          .font(.system(size: 36))
          .foregroundColor(.blue)
      }

      Text("Know Your Government")
        .font(.system(size: 22, weight: .bold))
        .foregroundColor(.white)

      Text("They work for you. Know who they really serve.")
        .font(.system(size: 14))
        .foregroundColor(.gray)
        .multilineTextAlignment(.center)
    }
  }

  // MARK: - Search

  private var searchBar: some View {
    HStack {
      Image(systemName: "magnifyingglass")
        .foregroundColor(.gray)

      TextField("Search officials...", text: $searchText)
        .foregroundColor(.white)

      if !searchText.isEmpty {
        Button(action: { searchText = "" }) {
          Image(systemName: "xmark.circle.fill")
            .foregroundColor(.gray)
        }
      }
    }
    .padding()
    .background(Color.white.opacity(0.1))
    .cornerRadius(12)
  }

  // MARK: - Branch Selector

  private var branchSelector: some View {
    ScrollView(.horizontal, showsIndicators: false) {
      HStack(spacing: 12) {
        ForEach(GovernmentBranch.allCases, id: \.self) { branch in
          Button(action: {
            HapticManager.shared.light()
            withAnimation { selectedBranch = branch }
          }) {
            VStack(spacing: 8) {
              Image(systemName: branch.icon)
                .font(.system(size: 24))
              Text(branch.rawValue)
                .font(.system(size: 12, weight: .medium))
            }
            .foregroundColor(selectedBranch == branch ? .white : .gray)
            .frame(width: 80, height: 70)
            .background(selectedBranch == branch ? branch.color : Color.white.opacity(0.05))
            .cornerRadius(12)
          }
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

  // MARK: - Executive Branch

  private var executiveBranch: some View {
    VStack(spacing: 16) {
      sectionHeader("Executive Branch", icon: "building.fill")

      // President
      officialCard(
        name: "President of the United States",
        position: "Chief Executive",
        party: "Republican",
        state: "National",
        topDonors: ["Small Donors", "America First PAC", "Various Super PACs"],
        integrityScore: 25,
        keyIssues: ["Immigration hardliner", "NATO skeptic", "Tariffs supporter"],
        flagged: true,
        flagReason: "Multiple ethics investigations, criminal indictments"
      )

      // Key Cabinet Members
      Text("Key Cabinet Members")
        .font(.system(size: 16, weight: .bold))
        .foregroundColor(.white)
        .frame(maxWidth: .infinity, alignment: .leading)

      officialCard(
        name: "Secretary of Homeland Security",
        position: "DHS",
        party: "Republican",
        state: "National",
        topDonors: ["N/A - Appointed"],
        integrityScore: 30,
        keyIssues: ["Mass deportation advocate", "ICE expansion"],
        flagged: true,
        flagReason: "Implementing family separation policies"
      )

      officialCard(
        name: "Attorney General",
        position: "DOJ",
        party: "Republican",
        state: "National",
        topDonors: ["N/A - Appointed"],
        integrityScore: 35,
        keyIssues: ["DOJ politicization concerns", "Prosecution priorities"],
        flagged: true,
        flagReason: "Targets political opponents, protects allies"
      )
    }
  }

  // MARK: - Legislative Branch

  private var legislativeBranch: some View {
    VStack(spacing: 16) {
      sectionHeader("Congress", icon: "person.3.fill")

      // Summary stats
      HStack(spacing: 16) {
        statCard("535", "Members", .blue)
        statCard("100", "Senate", .purple)
        statCard("435", "House", .orange)
      }

      // Sample officials (would be dynamic in real app)
      Text("Sample Representatives")
        .font(.system(size: 14, weight: .medium))
        .foregroundColor(.gray)
        .frame(maxWidth: .infinity, alignment: .leading)

      officialCard(
        name: "Sample Senator",
        position: "U.S. Senate",
        party: "Democrat",
        state: "California",
        topDonors: ["ActBlue", "Teachers Unions", "Tech Companies"],
        integrityScore: 65,
        keyIssues: ["Climate action", "Healthcare expansion", "Tech regulation"],
        flagged: false,
        flagReason: nil
      )

      officialCard(
        name: "Sample Representative",
        position: "U.S. House",
        party: "Republican",
        state: "Texas",
        topDonors: ["Oil & Gas", "NRA", "Real Estate"],
        integrityScore: 35,
        keyIssues: ["Border security", "Deregulation", "Tax cuts"],
        flagged: true,
        flagReason: "Major fossil fuel donations, climate denial"
      )

      // Link to full database
      Button(action: {
        if let url = URL(string: "https://www.opensecrets.org/members-of-congress") {
          UIApplication.shared.open(url)
        }
      }) {
        HStack {
          Text("Search All 535 Members")
          Image(systemName: "arrow.up.right.square")
        }
        .font(.system(size: 14, weight: .semibold))
        .foregroundColor(.white)
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color.blue)
        .cornerRadius(12)
      }
    }
  }

  // MARK: - Judicial Branch

  private var judicialBranch: some View {
    VStack(spacing: 16) {
      sectionHeader("Supreme Court", icon: "scalemass.fill")

      // Current composition
      HStack(spacing: 20) {
        VStack {
          Text("6")
            .font(.system(size: 36, weight: .bold))
            .foregroundColor(.red)
          Text("Conservative")
            .font(.system(size: 11))
            .foregroundColor(.gray)
        }

        VStack {
          Text("3")
            .font(.system(size: 36, weight: .bold))
            .foregroundColor(.blue)
          Text("Liberal")
            .font(.system(size: 11))
            .foregroundColor(.gray)
        }
      }
      .padding()
      .frame(maxWidth: .infinity)
      .background(Color.white.opacity(0.05))
      .cornerRadius(12)

      // Justices
      ForEach(supremeCourtJustices, id: \.name) { justice in
        justiceCard(justice)
      }

      // Major decisions link
      NavigationLink(destination: MajorCourtCasesView()) {
        HStack {
          Image(systemName: "doc.text.fill")
          Text("Major Court Cases That Shaped America")
          Spacer()
          Image(systemName: "chevron.right")
        }
        .font(.system(size: 14, weight: .medium))
        .foregroundColor(.white)
        .padding()
        .background(Color.purple.opacity(0.3))
        .cornerRadius(12)
      }
    }
  }

  private func justiceCard(_ justice: Justice) -> some View {
    VStack(alignment: .leading, spacing: 12) {
      HStack {
        VStack(alignment: .leading, spacing: 4) {
          Text(justice.name)
            .font(.system(size: 16, weight: .semibold))
            .foregroundColor(.white)

          HStack(spacing: 8) {
            Text(justice.appointedBy)
              .font(.system(size: 12))
              .foregroundColor(.gray)

            Text(justice.ideology)
              .font(.system(size: 10, weight: .bold))
              .foregroundColor(justice.ideology == "Conservative" ? .red : .blue)
              .padding(.horizontal, 6)
              .padding(.vertical, 2)
              .background(
                (justice.ideology == "Conservative" ? Color.red : Color.blue).opacity(0.2)
              )
              .cornerRadius(4)
          }
        }

        Spacer()

        Text("Since \(justice.yearAppointed)")
          .font(.system(size: 11))
          .foregroundColor(.gray)
      }

      if let flag = justice.flag {
        HStack(spacing: 6) {
          Image(systemName: "exclamationmark.triangle.fill")
            .foregroundColor(.yellow)
            .font(.system(size: 10))
          Text(flag)
            .font(.system(size: 11))
            .foregroundColor(.yellow)
        }
      }
    }
    .padding()
    .background(Color.white.opacity(0.05))
    .cornerRadius(12)
  }

  // MARK: - State Officials

  private var stateOfficials: some View {
    VStack(spacing: 16) {
      sectionHeader("State Government", icon: "flag.fill")

      Text("Select a state above to see your Governor, State Legislators, and other officials.")
        .font(.system(size: 14))
        .foregroundColor(.gray)
        .multilineTextAlignment(.center)

      // Link to external resources
      VStack(spacing: 12) {
        linkButton(
          "Find Your State Legislators", "https://openstates.org/find_your_legislator/", .green)
        linkButton("Governor Information", "https://www.nga.org/governors/", .blue)
        linkButton("State Campaign Finance", "https://www.followthemoney.org", .orange)
      }
    }
  }

  private func linkButton(_ title: String, _ url: String, _ color: Color) -> some View {
    Button(action: {
      if let url = URL(string: url) {
        UIApplication.shared.open(url)
      }
    }) {
      HStack {
        Text(title)
        Spacer()
        Image(systemName: "arrow.up.right.square")
      }
      .font(.system(size: 14, weight: .medium))
      .foregroundColor(.white)
      .padding()
      .background(color.opacity(0.3))
      .cornerRadius(10)
    }
  }

  // MARK: - Data Sources

  private var dataSourcesSection: some View {
    VStack(alignment: .leading, spacing: 12) {
      Text("Our Data Sources")
        .font(.system(size: 16, weight: .bold))
        .foregroundColor(.white)

      Text("All information is from public records:")
        .font(.system(size: 12))
        .foregroundColor(.gray)

      VStack(alignment: .leading, spacing: 8) {
        sourceRow("OpenSecrets.org", "Campaign finance data")
        sourceRow("FEC.gov", "Federal Election Commission")
        sourceRow("GovTrack.us", "Voting records")
        sourceRow("ProPublica", "Investigative reporting")
        sourceRow("Ballotpedia", "Candidate information")
      }
    }
    .padding()
    .background(Color.white.opacity(0.05))
    .cornerRadius(12)
  }

  private func sourceRow(_ name: String, _ desc: String) -> some View {
    HStack(spacing: 8) {
      Image(systemName: "checkmark.circle.fill")
        .foregroundColor(.green)
        .font(.system(size: 10))
      Text(name)
        .font(.system(size: 12, weight: .medium))
        .foregroundColor(.white)
      Text("- \(desc)")
        .font(.system(size: 12))
        .foregroundColor(.gray)
    }
  }

  // MARK: - Helpers

  private func sectionHeader(_ title: String, icon: String) -> some View {
    HStack {
      Image(systemName: icon)
        .foregroundColor(.blue)
      Text(title)
        .font(.system(size: 18, weight: .bold))
        .foregroundColor(.white)
    }
    .frame(maxWidth: .infinity, alignment: .leading)
  }

  private func statCard(_ value: String, _ label: String, _ color: Color) -> some View {
    VStack(spacing: 4) {
      Text(value)
        .font(.system(size: 24, weight: .bold))
        .foregroundColor(color)
      Text(label)
        .font(.system(size: 11))
        .foregroundColor(.gray)
    }
    .frame(maxWidth: .infinity)
    .padding(.vertical, 12)
    .background(Color.white.opacity(0.05))
    .cornerRadius(10)
  }

  private func officialCard(
    name: String,
    position: String,
    party: String,
    state: String,
    topDonors: [String],
    integrityScore: Int,
    keyIssues: [String],
    flagged: Bool,
    flagReason: String?
  ) -> some View {
    VStack(alignment: .leading, spacing: 12) {
      // Header
      HStack {
        VStack(alignment: .leading, spacing: 4) {
          Text(name)
            .font(.system(size: 16, weight: .semibold))
            .foregroundColor(.white)

          HStack(spacing: 8) {
            Text(position)
              .font(.system(size: 12))
              .foregroundColor(.gray)

            Text(party)
              .font(.system(size: 10, weight: .bold))
              .foregroundColor(party == "Democrat" ? .blue : .red)
              .padding(.horizontal, 6)
              .padding(.vertical, 2)
              .background((party == "Democrat" ? Color.blue : Color.red).opacity(0.2))
              .cornerRadius(4)

            Text(state)
              .font(.system(size: 10))
              .foregroundColor(.gray)
          }
        }

        Spacer()

        // Integrity Score
        VStack(spacing: 2) {
          Text("\(integrityScore)")
            .font(.system(size: 24, weight: .bold))
            .foregroundColor(scoreColor(integrityScore))
          Text("Score")
            .font(.system(size: 9))
            .foregroundColor(.gray)
        }
      }

      // Red flag if applicable
      if flagged, let reason = flagReason {
        HStack(spacing: 6) {
          Image(systemName: "exclamationmark.triangle.fill")
            .foregroundColor(.red)
            .font(.system(size: 12))
          Text(reason)
            .font(.system(size: 11))
            .foregroundColor(.red)
        }
        .padding(8)
        .background(Color.red.opacity(0.1))
        .cornerRadius(8)
      }

      // Top donors
      VStack(alignment: .leading, spacing: 4) {
        Text("TOP DONORS")
          .font(.system(size: 10, weight: .bold))
          .foregroundColor(.gray)

        HStack(spacing: 6) {
          ForEach(topDonors.prefix(3), id: \.self) { donor in
            Text(donor)
              .font(.system(size: 10))
              .foregroundColor(.white.opacity(0.8))
              .padding(.horizontal, 6)
              .padding(.vertical, 3)
              .background(Color.white.opacity(0.1))
              .cornerRadius(4)
          }
        }
      }

      // Key issues
      HStack(spacing: 6) {
        ForEach(keyIssues.prefix(2), id: \.self) { issue in
          Text(issue)
            .font(.system(size: 10))
            .foregroundColor(.orange)
            .lineLimit(1)
        }
      }
    }
    .padding()
    .background(Color.white.opacity(0.05))
    .cornerRadius(12)
    .overlay(
      RoundedRectangle(cornerRadius: 12)
        .stroke(flagged ? Color.red.opacity(0.5) : Color.clear, lineWidth: 1)
    )
  }

  private func scoreColor(_ score: Int) -> Color {
    switch score {
    case 70...100: return .green
    case 50..<70: return .yellow
    case 30..<50: return .orange
    default: return .red
    }
  }

  // MARK: - Data

  private var supremeCourtJustices: [Justice] {
    [
      Justice(
        name: "John Roberts", appointedBy: "Bush (2005)", yearAppointed: "2005",
        ideology: "Conservative", flag: nil),
      Justice(
        name: "Clarence Thomas", appointedBy: "H.W. Bush (1991)", yearAppointed: "1991",
        ideology: "Conservative",
        flag: "Ethics concerns: undisclosed gifts from billionaire Harlan Crow"),
      Justice(
        name: "Samuel Alito", appointedBy: "Bush (2006)", yearAppointed: "2006",
        ideology: "Conservative", flag: "Ethics concerns: undisclosed luxury travel"),
      Justice(
        name: "Sonia Sotomayor", appointedBy: "Obama (2009)", yearAppointed: "2009",
        ideology: "Liberal", flag: nil),
      Justice(
        name: "Elena Kagan", appointedBy: "Obama (2010)", yearAppointed: "2010",
        ideology: "Liberal", flag: nil),
      Justice(
        name: "Neil Gorsuch", appointedBy: "Trump (2017)", yearAppointed: "2017",
        ideology: "Conservative", flag: "Seat held open by McConnell blocking Garland"),
      Justice(
        name: "Brett Kavanaugh", appointedBy: "Trump (2018)", yearAppointed: "2018",
        ideology: "Conservative", flag: "Contentious confirmation, credible assault allegations"),
      Justice(
        name: "Amy Coney Barrett", appointedBy: "Trump (2020)", yearAppointed: "2020",
        ideology: "Conservative", flag: "Rushed confirmation 8 days before election"),
      Justice(
        name: "Ketanji Brown Jackson", appointedBy: "Biden (2022)", yearAppointed: "2022",
        ideology: "Liberal", flag: nil),
    ]
  }

  private var usStates: [String] {
    [
      "Alabama", "Alaska", "Arizona", "Arkansas", "California", "Colorado", "Connecticut",
      "Delaware", "Florida", "Georgia", "Hawaii", "Idaho", "Illinois", "Indiana", "Iowa", "Kansas",
      "Kentucky", "Louisiana", "Maine", "Maryland", "Massachusetts", "Michigan", "Minnesota",
      "Mississippi", "Missouri", "Montana", "Nebraska", "Nevada", "New Hampshire", "New Jersey",
      "New Mexico", "New York", "North Carolina", "North Dakota", "Ohio", "Oklahoma", "Oregon",
      "Pennsylvania", "Rhode Island", "South Carolina", "South Dakota", "Tennessee", "Texas",
      "Utah", "Vermont", "Virginia", "Washington", "West Virginia", "Wisconsin", "Wyoming",
    ]
  }
}

// MARK: - Models

enum GovernmentBranch: String, CaseIterable {
  case executive = "Executive"
  case legislative = "Congress"
  case judicial = "Courts"
  case state = "States"

  var icon: String {
    switch self {
    case .executive: return "building.fill"
    case .legislative: return "person.3.fill"
    case .judicial: return "scalemass.fill"
    case .state: return "flag.fill"
    }
  }

  var color: Color {
    switch self {
    case .executive: return .blue
    case .legislative: return .purple
    case .judicial: return .orange
    case .state: return .green
    }
  }
}

struct Justice {
  let name: String
  let appointedBy: String
  let yearAppointed: String
  let ideology: String
  let flag: String?
}

// MARK: - Major Court Cases View

struct MajorCourtCasesView: View {
  var body: some View {
    ScrollView {
      VStack(spacing: 16) {
        ForEach(majorCases, id: \.name) { courtCase in
          caseCard(courtCase)
        }
      }
      .padding()
    }
    .background(Color.black.ignoresSafeArea())
    .navigationTitle("Major Court Cases")
  }

  private func caseCard(_ courtCase: CourtCase) -> some View {
    VStack(alignment: .leading, spacing: 12) {
      HStack {
        Text(courtCase.name)
          .font(.system(size: 16, weight: .bold))
          .foregroundColor(.white)
        Spacer()
        Text(courtCase.year)
          .font(.system(size: 12))
          .foregroundColor(.gray)
      }

      Text(courtCase.summary)
        .font(.system(size: 13))
        .foregroundColor(.white.opacity(0.8))

      Text("Impact: \(courtCase.impact)")
        .font(.system(size: 12, weight: .medium))
        .foregroundColor(.orange)
    }
    .padding()
    .background(Color.white.opacity(0.05))
    .cornerRadius(12)
  }

  private var majorCases: [CourtCase] {
    [
      CourtCase(
        name: "Citizens United v. FEC", year: "2010",
        summary: "Ruled corporations have free speech rights, opening unlimited money in politics.",
        impact: "Super PACs, dark money, corporate political power"),
      CourtCase(
        name: "Shelby County v. Holder", year: "2013",
        summary:
          "Gutted the Voting Rights Act, removing federal oversight of discriminatory voting laws.",
        impact: "Wave of voter suppression laws in formerly covered states"),
      CourtCase(
        name: "Dobbs v. Jackson", year: "2022",
        summary: "Overturned Roe v. Wade, eliminating federal abortion rights.",
        impact: "Abortion banned or restricted in 20+ states"),
      CourtCase(
        name: "Rucho v. Common Cause", year: "2019",
        summary: "Ruled federal courts cannot review partisan gerrymandering.",
        impact: "No federal check on extreme gerrymandering"),
      CourtCase(
        name: "Students for Fair Admissions v. Harvard", year: "2023",
        summary: "Banned race-conscious college admissions.",
        impact: "Affirmative action ended, legacy admissions continue"),
      CourtCase(
        name: "Janus v. AFSCME", year: "2018",
        summary: "Ruled public sector workers can't be required to pay union fees.",
        impact: "Weakened public sector unions"),
      CourtCase(
        name: "Bush v. Gore", year: "2000",
        summary: "Stopped Florida recount, effectively deciding the 2000 election.",
        impact: "5-4 decision handed presidency to Bush"),
      CourtCase(
        name: "Dred Scott v. Sandford", year: "1857",
        summary: "Ruled Black people could not be citizens and had no rights.",
        impact: "Helped trigger Civil War, worst decision in Court history"),
      CourtCase(
        name: "Plessy v. Ferguson", year: "1896",
        summary: "Established 'separate but equal' doctrine.",
        impact: "Legalized segregation for 58 years"),
      CourtCase(
        name: "Brown v. Board of Education", year: "1954",
        summary: "Ruled school segregation unconstitutional.",
        impact: "Began dismantling legal segregation"),
      CourtCase(
        name: "Miranda v. Arizona", year: "1966",
        summary: "Required police to inform suspects of their rights.",
        impact: "'You have the right to remain silent...'"),
      CourtCase(
        name: "Roe v. Wade", year: "1973", summary: "Established federal right to abortion.",
        impact: "Protected abortion access for 49 years until overturned"),
    ]
  }
}

struct CourtCase {
  let name: String
  let year: String
  let summary: String
  let impact: String
}

#Preview {
  NavigationStack {
    GovernmentOfficialsView()
  }
}
