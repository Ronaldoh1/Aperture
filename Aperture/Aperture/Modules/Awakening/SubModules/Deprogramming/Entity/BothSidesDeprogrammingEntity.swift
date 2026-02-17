// BothSidesDeprogrammingEntity.swift
// The deprogramming module that works for BOTH Democrats AND Republicans
// Validates concerns first, then expands view, then invites UP together

import Foundation
import SwiftUI

// MARK: - Political Side

enum PoliticalSide: String, CaseIterable, Identifiable {
  case democrat = "Democrat"
  case republican = "Republican"

  var id: String {
    rawValue
  }

  var color: Color {
    switch self {
    case .democrat: return .blue
    case .republican: return .red
    }
  }

  var emoji: String {
    switch self {
    case .democrat: return "🔵"
    case .republican: return "🔴"
    }
  }

  var otherSide: PoliticalSide {
    switch self {
    case .democrat: return .republican
    case .republican: return .democrat
    }
  }
}

// MARK: - Receipt (Verifiable Fact)

struct PoliticalReceipt: Identifiable {
  let id = UUID()
  let claim: String
  let receipt: String
  let source: String
  let icon: String
}

// MARK: - Both Sides Data

enum BothSidesData {
  // MARK: - Tab 1: What Democrats Did (For Republicans to see)

  static let democratReceipts: [PoliticalReceipt] = [
    PoliticalReceipt(
      claim: "Obama built the cages",
      receipt: "The detention facilities with chain-link enclosures were built in 2014 under Obama",
      source: "AP Fact Check, 2018",
      icon: "building.2"
    ),
    PoliticalReceipt(
      claim: "Obama deported 3+ MILLION",
      receipt: "2.5 million formal removals + 3.1 million returns. Nicknamed 'Deporter-in-Chief'",
      source: "DHS Statistics",
      icon: "airplane.departure"
    ),
    PoliticalReceipt(
      claim: "Biden removed 4.6 MILLION",
      receipt:
        "Highest single-year removals in 2024. 60,000+ migrants went missing under his watch",
      source: "CBP/ICE Data 2024",
      icon: "person.fill.questionmark"
    ),
    PoliticalReceipt(
      claim: "Clinton deported 12+ MILLION",
      receipt: "Total removals and returns across 8 years",
      source: "INS Historical Data",
      icon: "chart.bar.fill"
    ),
    PoliticalReceipt(
      claim: "Democrats funded every war",
      receipt: "Iraq, Afghanistan, Libya, Syria, Yemen — bipartisan war funding",
      source: "Congressional Voting Records",
      icon: "flame"
    ),
    PoliticalReceipt(
      claim: "Obama bailed out Wall Street",
      receipt: "$700B TARP, banks got bonuses, homeowners got foreclosed",
      source: "Treasury Records",
      icon: "dollarsign.circle"
    ),
    PoliticalReceipt(
      claim: "Biden expanded surveillance",
      receipt: "Renewed FISA 702, expanded domestic surveillance capabilities",
      source: "ACLU Reports",
      icon: "eye"
    ),
  ]

  // MARK: - Tab 2: What Republicans Did (For Democrats to see)

  static let republicanReceipts: [PoliticalReceipt] = [
    PoliticalReceipt(
      claim: "Trump deported LESS than Obama",
      receipt: "2.1 million in 4 years vs Obama's 3+ million in 8 years. Louder, not more.",
      source: "DHS Statistics",
      icon: "speaker.wave.3"
    ),
    PoliticalReceipt(
      claim: "Trump 2.0 on pace for HALF Biden's numbers",
      receipt: "540K in first year vs Biden's 1.5M last year",
      source: "ICE 2025 Data",
      icon: "chart.line.downtrend.xyaxis"
    ),
    PoliticalReceipt(
      claim: "Bush started the wars",
      receipt: "Iraq and Afghanistan — Democrats voted YES",
      source: "Congressional Records",
      icon: "flame"
    ),
    PoliticalReceipt(
      claim: "Reagan funded death squads",
      receipt: "Iran-Contra, Central American civil wars, 75,000+ dead in El Salvador alone",
      source: "Declassified CIA",
      icon: "exclamationmark.triangle"
    ),
    PoliticalReceipt(
      claim: "Trump bailed out corporations",
      receipt: "$2.2 TRILLION CARES Act, PPP loans to billionaires, stock buybacks",
      source: "Treasury/SBA Records",
      icon: "dollarsign.circle"
    ),
    PoliticalReceipt(
      claim: "Republicans expanded surveillance too",
      receipt: "Patriot Act (Bush), renewed under every admin since",
      source: "Legislative History",
      icon: "eye"
    ),
    PoliticalReceipt(
      claim: "Project 2025 = consolidate power",
      receipt: "Replace civil servants with loyalists, expand executive control",
      source: "Heritage Foundation Document",
      icon: "building.columns"
    ),
  ]

  // MARK: - Tab 3: The Machine (What BOTH did)

  struct MachineReceipt: Identifiable {
    let id = UUID()
    let issue: String
    let democratAction: String
    let republicanAction: String
    let whoWins: String
    let icon: String
  }

  static let machineReceipts: [MachineReceipt] = [
    MachineReceipt(
      issue: "WARS",
      democratAction: "Funded Iraq, Afghanistan, Libya, Syria, Yemen",
      republicanAction: "Started Iraq, Afghanistan. Funded all others.",
      whoWins: "Defense contractors, not you",
      icon: "flame"
    ),
    MachineReceipt(
      issue: "WALL STREET",
      democratAction: "Obama bailed out banks, protected bonuses",
      republicanAction: "Trump bailed out corporations, PPP to billionaires",
      whoWins: "Wall Street, not you",
      icon: "building.2"
    ),
    MachineReceipt(
      issue: "SURVEILLANCE",
      democratAction: "Expanded FISA, NSA under Obama/Biden",
      republicanAction: "Patriot Act (Bush), continued under Trump",
      whoWins: "Intelligence agencies, not you",
      icon: "eye"
    ),
    MachineReceipt(
      issue: "IMMIGRATION",
      democratAction: "Obama: 3M+ deported, built cages",
      republicanAction: "Trump: 2.1M deported, louder theater",
      whoWins: "Palantir/private prisons, not you",
      icon: "person.fill.xmark"
    ),
    MachineReceipt(
      issue: "HEALTHCARE",
      democratAction: "ACA = mandatory insurance purchase",
      republicanAction: "No alternative, just complaints",
      whoWins: "Insurance companies, not you",
      icon: "cross.case"
    ),
    MachineReceipt(
      issue: "ISRAEL FUNDING",
      democratAction: "$3.8B+ annually, weapons sales",
      republicanAction: "$3.8B+ annually, weapons sales",
      whoWins: "Defense contractors, AIPAC",
      icon: "dollarsign.arrow.circlepath"
    ),
  ]

  // MARK: - Tab 4: Who Benefits

  struct Beneficiary: Identifiable {
    let id = UUID()
    let who: String
    let howTheyWin: String
    let bipartisan: Bool  // true = both parties serve them
    let icon: String
  }

  static let beneficiaries: [Beneficiary] = [
    Beneficiary(
      who: "Defense Contractors",
      howTheyWin: "Every president funds wars. Lockheed, Raytheon, Boeing always win.",
      bipartisan: true,
      icon: "airplane"
    ),
    Beneficiary(
      who: "Wall Street Banks",
      howTheyWin: "Bailouts under both parties. Too big to fail = too big to jail.",
      bipartisan: true,
      icon: "building.columns"
    ),
    Beneficiary(
      who: "Pharmaceutical Companies",
      howTheyWin: "No price negotiations under either party. Medicare can't bargain.",
      bipartisan: true,
      icon: "pills"
    ),
    Beneficiary(
      who: "Private Prison Industry",
      howTheyWin: "More inmates = more profit. Both parties maintain mass incarceration.",
      bipartisan: true,
      icon: "lock.fill"
    ),
    Beneficiary(
      who: "Surveillance Companies",
      howTheyWin: "Palantir gets contracts from Obama, Trump, Biden. $287M+ from ICE alone.",
      bipartisan: true,
      icon: "eye.trianglebadge.exclamationmark"
    ),
    Beneficiary(
      who: "Insurance Companies",
      howTheyWin: "ACA = mandatory customers. No public option. Both parties protect them.",
      bipartisan: true,
      icon: "doc.text"
    ),
    Beneficiary(
      who: "YOU",
      howTheyWin: "...",
      bipartisan: false,
      icon: "person.fill.questionmark"
    ),
  ]

  // MARK: - Tab 5: The Theater

  static let theaterExplained = """
    THE THEATER:

    🔴 Republican voters hate: Immigrants, "woke," socialism
    🔵 Democrat voters hate: Racism, "fascism," corporations

    WHAT BOTH PARTIES ACTUALLY DO:
    ✓ Fund the same wars
    ✓ Bail out the same banks
    ✓ Expand the same surveillance
    ✓ Protect the same corporations
    ✓ Maintain the same system

    THE TRICK:
    They give you DIFFERENT VILLAINS
    so you fight EACH OTHER
    instead of fighting THEM.

    🔴 "The illegals are the problem!"
    🔵 "The racists are the problem!"

    Meanwhile:
    💰 Wall Street profits
    🏭 Corporations don't pay taxes
    ⚔️ Wars continue
    👁️ Surveillance expands
    🏥 Healthcare stays broken

    You're not on a team.
    You're in a THEATER.
    """

  // MARK: - Tab 6: The Invitation (UP)

  static let invitation = """
    THE INVITATION:

    This isn't about convincing you to switch sides.

    It's about seeing that BOTH SIDES
    serve the SAME MACHINE.

    LEFT deported more.
    RIGHT deports louder.
    SAME families separated.

    LEFT bailed out banks.
    RIGHT bailed out corporations.
    SAME taxpayers paid.

    LEFT expanded surveillance.
    RIGHT expanded surveillance.
    SAME citizens watched.

    The fight isn't LEFT vs RIGHT.
    It never was.

    The fight is UP vs DOWN.
    The PEOPLE vs The MACHINE.

    And we can only fight it TOGETHER.

    🔴 + 🔵 = 💜

    Not enemies.
    Neighbors who were tricked into fighting.

    Pattern recognition isn't left or right.
    It's UP.

    Welcome to the elevation. 🔺
    """

  // MARK: - Common Ground

  struct CommonGround: Identifiable {
    let id = UUID()
    let issue: String
    let democratConcern: String
    let republicanConcern: String
    let actualTruth: String
    let icon: String
  }

  static let commonGround: [CommonGround] = [
    CommonGround(
      issue: "Government Corruption",
      democratConcern: "Republicans are corrupt",
      republicanConcern: "Democrats are corrupt",
      actualTruth: "BOTH are corrupt. Same donors, same lobbies, same revolving door.",
      icon: "building.columns"
    ),
    CommonGround(
      issue: "Media Lies",
      democratConcern: "Fox News lies",
      republicanConcern: "CNN/MSNBC lie",
      actualTruth:
        "ALL corporate media serves corporate interests. Different flavors, same owners.",
      icon: "tv"
    ),
    CommonGround(
      issue: "Elites vs People",
      democratConcern: "Billionaires have too much power",
      republicanConcern: "Elites look down on us",
      actualTruth: "Same elites. They fund BOTH parties. You're both right.",
      icon: "person.3"
    ),
    CommonGround(
      issue: "Rigged System",
      democratConcern: "System is rigged for the rich",
      republicanConcern: "System is rigged against working people",
      actualTruth: "SAME observation, different words. You agree more than you know.",
      icon: "scalemass"
    ),
    CommonGround(
      issue: "Children's Safety",
      democratConcern: "Kids in cages at border",
      republicanConcern: "Kids trafficked by elites",
      actualTruth: "BOTH are real. Same powerful people harm children across party lines.",
      icon: "heart"
    ),
  ]
}

// MARK: - Deprogramming Flow State

enum DeprogrammingPhase: Int, CaseIterable {
  case selectSide = 0  // Which side do you identify with?
  case validation = 1  // You're right about the other side...
  case expansion = 2  // But here's what YOUR side did...
  case machine = 3  // The machine behind both
  case whoBenefits = 4  // Follow the money
  case commonGround = 5  // What you actually agree on
  case invitation = 6  // The invitation UP

  var title: String {
    switch self {
    case .selectSide: return "Where Do You Start?"
    case .validation: return "You're Not Wrong..."
    case .expansion: return "But Consider This..."
    case .machine: return "The Machine"
    case .whoBenefits: return "Who Actually Benefits?"
    case .commonGround: return "What You Both See"
    case .invitation: return "The Invitation"
    }
  }
}
