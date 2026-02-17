// FollowTheMoneyEntity.swift
// The financial web connecting immigration theater, surveillance profits, and geopolitical alignment

import Foundation

// MARK: - Follow The Money (The Web)

enum FollowTheMoney {
  static let title = "FOLLOW THE MONEY"
  static let subtitle = "The crisis is the product"

  // MARK: - Palantir Profits

  enum PalantirProfits {
    static let title = "PALANTIR — THE SURVEILLANCE MACHINE"

    struct Contract: Identifiable {
      let id = UUID()
      let amount: String
      let purpose: String
      let year: String
    }

    static let totalSince2014 = "$287 MILLION+"

    static let contracts: [Contract] = [
      Contract(
        amount: "$30M", purpose: "ImmigrationOS — real-time immigrant tracking", year: "2025"),
      Contract(amount: "$80M+", purpose: "ICE AI tools for federal agents", year: "2024-25"),
      Contract(amount: "$41M", purpose: "Initial ICM contract (Obama era)", year: "2014"),
      Contract(amount: "$900M+", purpose: "Total federal contracts since Trump 2.0", year: "2025"),
    ]

    static let coFounder = "Peter Thiel — Trump mega-donor"
    static let stockIncrease = "100%+ since Trump took office"
    static let revenueFromGov = "55% of Palantir revenue = government contracts"

    static let whatTheyBuild = """
      IMMIGRATIONOS CAPABILITIES:

      • "Near real-time visibility" on immigrants
      • Tracks self-deportations
      • Access to passport records
      • Social Security files
      • IRS tax data
      • License plate readers
      • Cell phone location data
      • Facial recognition integration
      • Social media monitoring

      All feeding the deportation pipeline.
      All paid for by YOUR taxes.
      """

    static let theConflict = """
      STEPHEN MILLER — THE CONFLICT:

      Stephen Miller = Trump's immigration architect
      Stephen Miller = OWNS PALANTIR STOCK

      He writes the policies...
      That create the contracts...
      That benefit his portfolio.

      This is called a CONFLICT OF INTEREST.
      But when you're in power, it's called "policy."
      """

    static let noCrisisNoMoney = """
      THE FORMULA:

      NO CRISIS = NO CONTRACTS = NO MONEY

      They NEED:
      • The "invasion" narrative
      • The "border emergency"
      • The "criminal aliens" fear

      To justify BILLIONS in surveillance tech.

      A solved border = Palantir loses contracts.
      A permanent crisis = Palantir prints money.

      Which one do you think they want?
      """
  }

  // MARK: - The Asymmetry (Argentina vs Venezuela)

  enum TheAsymmetry {
    static let title = "THE ASYMMETRY"
    static let subtitle = "Same continent. Same crises. Opposite treatment."

    struct CountryComparison: Identifiable {
      let id = UUID()
      let category: String
      let argentina: String
      let venezuela: String
    }

    static let comparisons: [CountryComparison] = [
      CountryComparison(
        category: "US Treatment",
        argentina: "$40+ BILLION bailout",
        venezuela: "Sanctions, isolation"
      ),
      CountryComparison(
        category: "IMF Treatment",
        argentina: "$57B (2018) + $20B (2025)",
        venezuela: "Cut off"
      ),
      CountryComparison(
        category: "Leader Status",
        argentina: "Milei = 'ally'",
        venezuela: "Maduro = 'dictator'"
      ),
      CountryComparison(
        category: "Israel Stance",
        argentina: "Embassy → Jerusalem",
        venezuela: "Cut ties with Israel"
      ),
      CountryComparison(
        category: "Wall Street",
        argentina: "JP Morgan praises",
        venezuela: "Demonized"
      ),
      CountryComparison(
        category: "Natural Resources",
        argentina: "Agriculture",
        venezuela: "LARGEST OIL RESERVES"
      ),
      CountryComparison(
        category: "Narrative",
        argentina: "'Economic miracle'",
        venezuela: "'Failed socialist state'"
      ),
      CountryComparison(
        category: "Citizens Fleeing",
        argentina: "No coverage",
        venezuela: "'INVASION!'"
      ),
    ]

    static let theQuestion = """
      WHY THE DIFFERENCE?

      Both have economic crises.
      Both have poverty.
      Both have corruption.
      Both have citizens leaving.

      But one gets BAILED OUT.
      And one is the BOOGEYMAN.

      The difference?

      ALIGNMENT.
      """

    static let theFormula = """
      THE FORMULA:

      Pro-Israel + Pro-Wall Street = BAILOUT
      Anti-Israel + Has Oil = BOOGEYMAN

      It was never about democracy.
      It was never about human rights.
      It was never about economics.

      It's about ALIGNMENT. 🎯
      """
  }

  // MARK: - Javier Milei (Argentina)

  enum MileiProfile {
    static let title = "JAVIER MILEI — THE RECEIPTS"

    struct Receipt: Identifiable {
      let id = UUID()
      let claim: String
      let source: String
      let emoji: String
    }

    static let receipts: [Receipt] = [
      Receipt(
        claim: "\"I don't go to church, I go to SYNAGOGUE\"", source: "His interview", emoji: "🕍"),
      Receipt(claim: "Studies Torah with rabbi regularly", source: "His own words", emoji: "📜"),
      Receipt(claim: "Wants to convert to Judaism", source: "Multiple interviews", emoji: "✡️"),
      Receipt(
        claim: "First non-Jew to win 'Jewish Nobel' (Genesis Prize)", source: "2025 award",
        emoji: "🏆"),
      Receipt(
        claim: "Moving Argentina embassy to JERUSALEM", source: "Announced policy", emoji: "🇮🇱"),
      Receipt(claim: "First trip as president: ISRAEL", source: "Confirmed", emoji: "✈️"),
      Receipt(claim: "\"Our allies are US and ISRAEL\"", source: "His words", emoji: "🤝"),
      Receipt(claim: "Netanyahu calls him 'dear friend'", source: "Public statement", emoji: "👥"),
      Receipt(claim: "Campaign rallies opened with SHOFAR", source: "Video evidence", emoji: "📯"),
      Receipt(claim: "Defended Elon Musk's Nazi salute", source: "His tweet", emoji: "🐦"),
      Receipt(claim: "Received $40+ BILLION in bailouts", source: "IMF + US Treasury", emoji: "💰"),
    ]

    static let bailoutDetails = """
      THE BAILOUT STACK:

      2018: $57 BILLION (IMF — largest loan ever)
      2025: $20 BILLION (IMF)
      2025: $20 BILLION (US Treasury via Scott Bessent)

      Total: $97+ BILLION to Argentina

      23rd IMF bailout since 1956.

      Where does the money go?
      Capital flight. Rich Argentines convert pesos
      to dollars and stash in offshore accounts.

      The poor get poorer.
      The debt stays.
      Wall Street collects interest.
      """

    static let whyBailout = """
      WHY BAIL HIM OUT?

      ✓ Pro-Israel (embassy to Jerusalem)
      ✓ Pro-US alignment
      ✓ Anti-China rhetoric
      ✓ Anti-socialist
      ✓ Wall Street friendly policies
      ✓ Privatizing state assets
      ✓ "Libertarian" = corporate freedom

      He's ALIGNED.
      So he gets the money.
      """
  }

  // MARK: - Venezuela (The Boogeyman)

  enum VenezuelaBoogeyman {
    static let title = "VENEZUELA — THE USEFUL CRISIS"

    static let whyKeepMaduro = """
      WHY NOT REMOVE MADURO?

      They've sanctioned him.
      They've isolated him.
      They've demonized him.
      They've tried coups.

      But they WON'T actually remove him.

      WHY?

      Because they NEED the villain.

      • No Maduro = No boogeyman
      • No boogeyman = No "invasion" narrative
      • No narrative = No emergency powers
      • No emergency = No Palantir contracts
      • No contracts = No surveillance state

      A "solved" Venezuela is BAD for business.
      A permanent crisis is PROFITABLE.
      """

    static let theOilFactor = """
      THE OIL FACTOR:

      Venezuela has the LARGEST proven oil reserves
      in the world. Larger than Saudi Arabia.

      If Venezuela was stable and aligned:
      • Oil would flow to global markets
      • Prices would drop
      • Petrodollar competitors emerge

      Destabilized Venezuela:
      • Oil stays in ground
      • Prices stay high
      • US oil interests protected
      • Boogeyman narrative maintained

      It's not incompetence.
      It's STRATEGY.
      """

    static let theNarrative = """
      THE NARRATIVE MACHINE:

      "Venezuelan criminals flooding the border!"
      "MS-13 gang invasion!"
      "Maduro sending his worst!"

      Meanwhile:
      • Actual deportations LOWER than Obama
      • Border encounters DOWN 90%
      • Most asylum seekers are families

      But the FEAR is profitable.

      Fear = Emergency powers
      Fear = Surveillance contracts
      Fear = Project 2025 justification
      Fear = You don't ask questions
      """
  }

  // MARK: - Scott Bessent (Treasury)

  enum ScottBessent {
    static let title = "SCOTT BESSENT — TREASURY SECRETARY"

    static let background = """
      WHO IS SCOTT BESSENT?

      • Former Chief Investment Officer at Soros Fund Management
      • Founded Key Square Group (hedge fund)
      • Decades on Wall Street
      • Now: US Treasury Secretary

      He approved $20 BILLION to Argentina
      from the Exchange Stabilization Fund.

      Wall Street to Treasury to bailout.

      The revolving door never stops spinning.
      """

    static let theConnection = """
      THE CONNECTION:

      WALL STREET (Bessent's world)
            ↓
      TREASURY (Bessent's position)
            ↓
      ARGENTINA (Milei - aligned)
            ↓
      BAILOUT ($20B approved)
            ↓
      WALL STREET (collects interest)

      It's a closed loop.
      They bail out their friends.
      With YOUR money.
      """
  }

  // MARK: - The Web (Everything Connected)

  enum TheWeb {
    static let title = "THE WEB — IT'S ALL CONNECTED"

    struct Connection: Identifiable {
      let id = UUID()
      let from: String
      let to: String
      let how: String
    }

    static let connections: [Connection] = [
      Connection(from: "Trump", to: "Palantir", how: "Peter Thiel is mega-donor"),
      Connection(from: "Stephen Miller", to: "Palantir", how: "Owns stock, writes policy"),
      Connection(from: "Palantir", to: "ICE", how: "$287M+ in contracts"),
      Connection(from: "ICE", to: "Crisis narrative", how: "Justifies expansion"),
      Connection(from: "Crisis", to: "Palantir", how: "More contracts"),
      Connection(from: "Venezuela", to: "Crisis", how: "Permanent boogeyman"),
      Connection(from: "Bessent", to: "Wall Street", how: "Former hedge fund"),
      Connection(from: "Bessent", to: "Argentina", how: "$20B bailout"),
      Connection(from: "Argentina", to: "Israel", how: "Embassy to Jerusalem"),
      Connection(from: "Milei", to: "Israel", how: "'Dear friend' of Netanyahu"),
      Connection(from: "Israel", to: "US Policy", how: "Aligned interests"),
      Connection(from: "Epstein files", to: "Distractions", how: "Need to change narrative"),
      Connection(from: "Vatican", to: "Distraction", how: "Sudden 'moral outrage'"),
    ]

    static let summary = """
      THE PATTERN:

      1. CREATE or MAINTAIN crisis (Venezuela)
      2. PROFIT from crisis (Palantir)
      3. BAIL OUT the aligned (Argentina/Milei)
      4. DEMONIZE the unaligned (Maduro)
      5. EXPAND surveillance state (ImmigrationOS)
      6. DISTRACT from real issues (Epstein files)
      7. SILENCE critics (Project Esther)
      8. CONSOLIDATE power (Project 2025)

      It's not chaos.
      It's STRATEGY.

      And now you see it.
      """
  }

  // MARK: - The Distraction Stack

  enum DistractionStack {
    static let title = "THE DISTRACTION STACK"

    static let epsteinTiming = """
      JANUARY 30, 2026:
      Epstein files drop.

      Names surface:
      • Vatican Bank mentioned
      • Steve Bannon texting Epstein
      • Power players exposed

      WHAT FOLLOWED:

      • Venezuela "crisis" amplified
      • Immigration theater intensified
      • Vatican "moral outrage" (12 days later)
      • Argentina bailout headlines
      • Project 2025 quietly advancing

      ALL distracting from:
      WHO IS IN THE FILES.
      """

    static let theStack = """
      THE STACK:

      ┌─────────────────────────────┐
      │ SURFACE: Immigration crisis │
      ├─────────────────────────────┤
      │ LAYER 2: Venezuela threat   │
      ├─────────────────────────────┤
      │ LAYER 3: Vatican morality   │
      ├─────────────────────────────┤
      │ LAYER 4: Economic news      │
      ├─────────────────────────────┤
      │ HIDDEN: Epstein connections │
      │ HIDDEN: Project 2025        │
      │ HIDDEN: Project Esther      │
      │ HIDDEN: Consolidation       │
      └─────────────────────────────┘

      They stack distractions
      so you never dig deep enough.
      """
  }

  // MARK: - Who Benefits

  enum WhoBenefits {
    static let title = "WHO BENEFITS?"

    struct Beneficiary: Identifiable {
      let id = UUID()
      let who: String
      let how: String
      let emoji: String
    }

    static let winners: [Beneficiary] = [
      Beneficiary(who: "Palantir", how: "$287M+ contracts, stock up 100%", emoji: "📈"),
      Beneficiary(who: "Peter Thiel", how: "Palantir co-founder, Trump donor", emoji: "💰"),
      Beneficiary(who: "Stephen Miller", how: "Owns Palantir stock, writes policy", emoji: "📝"),
      Beneficiary(who: "Wall Street", how: "Argentina bailout = interest payments", emoji: "🏦"),
      Beneficiary(who: "Israel", how: "Argentina embassy to Jerusalem", emoji: "🇮🇱"),
      Beneficiary(who: "IMF", how: "Largest loans in history", emoji: "🌐"),
      Beneficiary(who: "Milei", how: "US backing keeps him in power", emoji: "🇦🇷"),
      Beneficiary(who: "Defense contractors", how: "Border militarization", emoji: "🎖️"),
      Beneficiary(who: "Private prisons", how: "Detention contracts", emoji: "🔒"),
    ]

    static let losers: [Beneficiary] = [
      Beneficiary(
        who: "Immigrants", how: "Surveillance, separation, deportation theater", emoji: "👨‍👩‍👧"),
      Beneficiary(who: "Venezuelan people", how: "Kept in crisis as boogeyman", emoji: "🇻🇪"),
      Beneficiary(who: "Argentine people", how: "Austerity, poverty, unpayable debt", emoji: "📉"),
      Beneficiary(
        who: "American taxpayers", how: "Funding Palantir + Argentina bailout", emoji: "🇺🇸"),
      Beneficiary(who: "Truth-tellers", how: "Labeled 'radical' or 'anti-Semitic'", emoji: "🤐"),
      Beneficiary(who: "Democracy", how: "Project 2025 consolidation", emoji: "🗳️"),
    ]
  }
}

// MARK: - The Clock (Pattern Recognition)

enum ClockThat {
  static let patterns = """
    #ClockThat — THE PATTERNS:

    ⏰ Palantir needs crisis = Venezuela stays boogeyman
    ⏰ Stephen Miller owns Palantir = conflict of interest
    ⏰ Argentina bailed out = Milei is pro-Israel
    ⏰ Venezuela demonized = Maduro is anti-Israel
    ⏰ Wall Street wins both ways
    ⏰ Cruelty is theater = fewer deportations than Obama
    ⏰ Project 2025 + Esther = consolidation while distracted
    ⏰ Epstein files = why they need distractions NOW

    Once you see the pattern,
    you can't unsee it.

    That's awakening.
    That's what they fear.

    👁️🔥
    """
}
