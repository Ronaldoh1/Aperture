// PatternRecognitionView.swift
// See the patterns — 1492 to 2026, the playbook never changed

import SwiftUI

// MARK: - Pattern Recognition View

struct PatternRecognitionView: View {
  let onContinue: () -> Void

  @State private var selectedTab: PatternTab = .controlTriangle
  @State private var showContent: Bool = false
  @State private var trianglePulsing: Bool = false
  @State private var showContinue: Bool = false

  enum PatternTab: String, CaseIterable {
    case followTheMoney = "Follow The Money"
    case trinityDecoded = "Trinity = Control"
    case controlTriangle = "Control System"
    case selectiveMorality = "16 Years of Silence"
    case whichChristians = "Which Christians?"
    case demiurge = "The False God"
    case timeline = "12 Days of Silence"
    case parallels = "1492 → 2026"
    case theQuestion = "The Question"
  }

  var body: some View {
    VStack(spacing: 20) {
      // Header
      headerSection

      // Tab selector
      tabSelector

      // Content
      if showContent {
        ScrollView(.vertical, showsIndicators: false) {
          VStack(spacing: 20) {
            switch selectedTab {
            case .followTheMoney:
              followTheMoneyContent
            case .trinityDecoded:
              trinityDecodedContent
            case .controlTriangle:
              controlTriangleContent
            case .selectiveMorality:
              selectiveMoralityContent
            case .whichChristians:
              whichChristiansContent
            case .demiurge:
              demiurgeContent
            case .timeline:
              timelineContent
            case .parallels:
              parallelsContent
            case .theQuestion:
              theQuestionContent
            }
          }
          .padding(.bottom, 20)
        }
        .transition(.opacity)
      }

      // Continue button
      if showContinue {
        continueButton
          .transition(.opacity.combined(with: .move(edge: .bottom)))
      }
    }
    .onAppear {
      startReveal()
    }
  }

  // MARK: - Header

  private var headerSection: some View {
    VStack(spacing: 12) {
      // Eye icon
      ZStack {
        Circle()
          .fill(
            RadialGradient(
              colors: [
                Color.red.opacity(0.3),
                Color.red.opacity(0.1),
                .clear,
              ],
              center: .center,
              startRadius: 20,
              endRadius: 60
            )
          )
          .frame(width: 120, height: 120)

        Image(systemName: "eye.trianglebadge.exclamationmark.fill")
          .font(.system(size: 44))
          .foregroundStyle(
            LinearGradient(
              colors: [.red, .orange],
              startPoint: .topLeading,
              endPoint: .bottomTrailing
            )
          )
      }

      Text("PATTERN RECOGNITION")
        .font(.system(size: 18, weight: .black, design: .rounded))
        .tracking(3)
        .foregroundColor(.white)

      Text("The Playbook Never Changed")
        .font(.system(size: 14, weight: .medium, design: .rounded))
        .foregroundColor(.red.opacity(0.9))
    }
  }

  // MARK: - Tab Selector

  private var tabSelector: some View {
    ScrollView(.horizontal, showsIndicators: false) {
      HStack(spacing: 8) {
        ForEach(PatternTab.allCases, id: \.self) { tab in
          Button(action: {
            withAnimation(.spring(response: 0.3, dampingFraction: 0.8)) {
              selectedTab = tab
            }
          }) {
            Text(tab.rawValue)
              .font(.system(size: 11, weight: .bold, design: .rounded))
              .foregroundColor(selectedTab == tab ? .black : .white.opacity(0.8))
              .padding(.horizontal, 12)
              .padding(.vertical, 10)
              .background(
                Capsule()
                  .fill(selectedTab == tab ? Color.red : Color.white.opacity(0.1))
              )
          }
        }
      }
      .padding(.horizontal, 4)
    }
  }

  // MARK: - Follow The Money Content

  private var followTheMoneyContent: some View {
    VStack(spacing: 24) {
      // Header
      VStack(spacing: 8) {
        Text("💰 FOLLOW THE MONEY 💰")
          .font(.system(size: 16, weight: .black, design: .rounded))
          .tracking(2)
          .foregroundColor(Palette.accent.gold)

        Text("The crisis is the product")
          .font(.system(size: 12, weight: .medium, design: .rounded))
          .foregroundColor(.white.opacity(0.8))
      }

      // Palantir Section
      palantirSection

      // The Asymmetry (Argentina vs Venezuela)
      asymmetrySection

      // Milei Receipts
      mileiReceiptsSection

      // Venezuela Boogeyman
      venezuelaSection

      // Scott Bessent
      bessentSection

      // The Web
      theWebSection

      // Who Benefits
      whoBenefitsSection

      // Clock That
      clockThatSection
    }
    .padding(16)
    .background(cardBackground)
  }

  private var palantirSection: some View {
    VStack(spacing: 12) {
      HStack {
        Text("🔍")
          .font(.system(size: 24))
        Text("PALANTIR — THE SURVEILLANCE MACHINE")
          .font(.system(size: 12, weight: .black, design: .rounded))
          .foregroundColor(.cyan)
      }

      // Total contracts
      VStack(spacing: 4) {
        Text("$287 MILLION+")
          .font(.system(size: 28, weight: .black, design: .rounded))
          .foregroundColor(Palette.accent.gold)

        Text("to Palantir since 2014")
          .font(.system(size: 11, weight: .medium))
          .foregroundColor(.white.opacity(0.7))
      }
      .padding(.vertical, 8)

      // Key contracts
      VStack(alignment: .leading, spacing: 6) {
        contractRow("$30M", "ImmigrationOS — real-time tracking", "2025")
        contractRow("$80M+", "ICE AI tools for agents", "2024-25")
        contractRow("$900M+", "Federal contracts since Trump 2.0", "2025")
      }

      // Key facts
      VStack(spacing: 8) {
        factPill("Co-founder: Peter Thiel (Trump mega-donor)", .cyan)
        factPill("Stock up 100%+ since Trump took office", .green)
        factPill("55% revenue from government contracts", .orange)
      }

      // Stephen Miller conflict
      VStack(spacing: 8) {
        Text("⚠️ THE CONFLICT OF INTEREST ⚠️")
          .font(.system(size: 11, weight: .black, design: .rounded))
          .foregroundColor(.red)

        VStack(spacing: 4) {
          Text("STEPHEN MILLER")
            .font(.system(size: 14, weight: .black))
            .foregroundColor(.white)

          Text("Trump's immigration architect")
            .font(.system(size: 10, weight: .medium))
            .foregroundColor(.white.opacity(0.7))

          Text("+")
            .font(.system(size: 16, weight: .bold))
            .foregroundColor(Palette.accent.gold)

          Text("OWNS PALANTIR STOCK")
            .font(.system(size: 14, weight: .black))
            .foregroundColor(.red)
        }

        Text("He writes the policies that create the contracts\nthat benefit his portfolio.")
          .font(.system(size: 10, weight: .medium))
          .foregroundColor(.white.opacity(0.8))
          .multilineTextAlignment(.center)
      }
      .padding(12)
      .background(
        RoundedRectangle(cornerRadius: 10)
          .fill(Color.red.opacity(0.15))
      )

      // The formula
      VStack(spacing: 4) {
        Text("NO CRISIS = NO CONTRACTS = NO MONEY")
          .font(.system(size: 12, weight: .black, design: .rounded))
          .foregroundColor(Palette.accent.gold)

        Text(
          "A solved border = Palantir loses billions.\nA permanent crisis = Palantir prints money."
        )
        .font(.system(size: 10, weight: .medium))
        .foregroundColor(.white.opacity(0.9))
        .multilineTextAlignment(.center)
      }
      .padding(.top, 8)
    }
    .padding(16)
    .frame(maxWidth: .infinity)
    .background(
      RoundedRectangle(cornerRadius: 14, style: .continuous)
        .fill(Color.cyan.opacity(0.1))
        .overlay(
          RoundedRectangle(cornerRadius: 14, style: .continuous)
            .stroke(Color.cyan.opacity(0.3), lineWidth: 1)
        )
    )
  }

  private func contractRow(_ amount: String, _ purpose: String, _ year: String) -> some View {
    HStack(spacing: 8) {
      Text(amount)
        .font(.system(size: 11, weight: .black, design: .monospaced))
        .foregroundColor(Palette.accent.gold)
        .frame(width: 50, alignment: .leading)

      Text(purpose)
        .font(.system(size: 9, weight: .medium))
        .foregroundColor(.white.opacity(0.9))

      Spacer()

      Text(year)
        .font(.system(size: 8, weight: .medium))
        .foregroundColor(.white.opacity(0.5))
    }
  }

  private func factPill(_ text: String, _ color: Color) -> some View {
    Text(text)
      .font(.system(size: 9, weight: .bold, design: .rounded))
      .foregroundColor(color)
      .padding(.horizontal, 10)
      .padding(.vertical, 6)
      .background(
        Capsule()
          .fill(color.opacity(0.15))
      )
  }

  private var asymmetrySection: some View {
    VStack(spacing: 12) {
      Text("⚖️ THE ASYMMETRY ⚖️")
        .font(.system(size: 13, weight: .black, design: .rounded))
        .foregroundColor(.orange)

      Text("Same continent. Same crises. Opposite treatment.")
        .font(.system(size: 10, weight: .medium))
        .foregroundColor(.white.opacity(0.7))

      // Comparison header
      HStack {
        Text("🇦🇷 ARGENTINA")
          .font(.system(size: 10, weight: .bold))
          .foregroundColor(.green)
          .frame(maxWidth: .infinity)

        Text("vs")
          .font(.system(size: 10, weight: .bold))
          .foregroundColor(.white.opacity(0.5))

        Text("🇻🇪 VENEZUELA")
          .font(.system(size: 10, weight: .bold))
          .foregroundColor(.red)
          .frame(maxWidth: .infinity)
      }

      // Comparison rows
      VStack(spacing: 6) {
        asymmetryRow("US Treatment", "$40+ BILLION bailout", "Sanctions, isolation")
        asymmetryRow("IMF Loans", "$57B + $20B", "Cut off")
        asymmetryRow("Leader", "Milei = 'ally'", "Maduro = 'dictator'")
        asymmetryRow("Israel Stance", "Embassy → Jerusalem", "Cut ties")
        asymmetryRow("Wall Street", "JP Morgan praises", "Demonized")
        asymmetryRow("Resources", "Agriculture", "LARGEST OIL RESERVES")
        asymmetryRow("Narrative", "'Economic miracle'", "'Failed state'")
      }

      // The formula
      VStack(spacing: 8) {
        Text("THE FORMULA:")
          .font(.system(size: 10, weight: .black))
          .foregroundColor(.white)

        HStack(spacing: 12) {
          VStack(spacing: 2) {
            Text("Pro-Israel")
              .font(.system(size: 9, weight: .bold))
            Text("+")
            Text("Pro-Wall Street")
              .font(.system(size: 9, weight: .bold))
          }
          .foregroundColor(.green)

          Text("=")
            .font(.system(size: 16, weight: .bold))
            .foregroundColor(Palette.accent.gold)

          Text("BAILOUT")
            .font(.system(size: 12, weight: .black))
            .foregroundColor(.green)
        }

        HStack(spacing: 12) {
          VStack(spacing: 2) {
            Text("Anti-Israel")
              .font(.system(size: 9, weight: .bold))
            Text("+")
            Text("Has Oil")
              .font(.system(size: 9, weight: .bold))
          }
          .foregroundColor(.red)

          Text("=")
            .font(.system(size: 16, weight: .bold))
            .foregroundColor(Palette.accent.gold)

          Text("BOOGEYMAN")
            .font(.system(size: 12, weight: .black))
            .foregroundColor(.red)
        }
      }
      .padding(12)
      .background(
        RoundedRectangle(cornerRadius: 10)
          .fill(Color.white.opacity(0.05))
      )

      Text("It's not about democracy.\nIt's not about human rights.\nIt's about ALIGNMENT. 🎯")
        .font(.system(size: 11, weight: .bold))
        .foregroundColor(Palette.accent.gold)
        .multilineTextAlignment(.center)
    }
    .padding(16)
    .frame(maxWidth: .infinity)
    .background(
      RoundedRectangle(cornerRadius: 14, style: .continuous)
        .fill(Color.orange.opacity(0.1))
        .overlay(
          RoundedRectangle(cornerRadius: 14, style: .continuous)
            .stroke(Color.orange.opacity(0.3), lineWidth: 1)
        )
    )
  }

  private func asymmetryRow(_ category: String, _ argentina: String, _ venezuela: String)
    -> some View
  {
    HStack(spacing: 4) {
      Text(argentina)
        .font(.system(size: 8, weight: .medium))
        .foregroundColor(.green)
        .frame(maxWidth: .infinity, alignment: .trailing)

      Text(category)
        .font(.system(size: 7, weight: .bold))
        .foregroundColor(.white.opacity(0.5))
        .frame(width: 70)

      Text(venezuela)
        .font(.system(size: 8, weight: .medium))
        .foregroundColor(.red)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
  }

  private var mileiReceiptsSection: some View {
    VStack(spacing: 12) {
      HStack {
        Text("🇦🇷")
          .font(.system(size: 24))
        Text("JAVIER MILEI — THE RECEIPTS")
          .font(.system(size: 12, weight: .black, design: .rounded))
          .foregroundColor(.green)
      }

      VStack(alignment: .leading, spacing: 6) {
        receiptRow("🕍", "\"I don't go to church, I go to SYNAGOGUE\"")
        receiptRow("📜", "Studies Torah with rabbi regularly")
        receiptRow("✡️", "Wants to convert to Judaism")
        receiptRow("🏆", "First non-Jew to win 'Jewish Nobel' (2025)")
        receiptRow("🇮🇱", "Moving embassy to JERUSALEM")
        receiptRow("✈️", "First trip as president: ISRAEL")
        receiptRow("🤝", "\"Our allies are US and ISRAEL\"")
        receiptRow("👥", "Netanyahu calls him 'dear friend'")
        receiptRow("📯", "Campaign rallies opened with SHOFAR")
        receiptRow("💰", "Received $97+ BILLION in bailouts")
      }

      Text("This is why he gets the money.\nHe's ALIGNED.")
        .font(.system(size: 11, weight: .bold))
        .foregroundColor(Palette.accent.gold)
        .multilineTextAlignment(.center)
    }
    .padding(16)
    .frame(maxWidth: .infinity)
    .background(
      RoundedRectangle(cornerRadius: 14, style: .continuous)
        .fill(Color.green.opacity(0.1))
        .overlay(
          RoundedRectangle(cornerRadius: 14, style: .continuous)
            .stroke(Color.green.opacity(0.3), lineWidth: 1)
        )
    )
  }

  private func receiptRow(_ emoji: String, _ text: String) -> some View {
    HStack(spacing: 8) {
      Text(emoji)
        .font(.system(size: 12))
        .frame(width: 20)

      Text(text)
        .font(.system(size: 9, weight: .medium))
        .foregroundColor(.white.opacity(0.9))

      Spacer()
    }
  }

  private var venezuelaSection: some View {
    VStack(spacing: 12) {
      HStack {
        Text("🇻🇪")
          .font(.system(size: 24))
        Text("VENEZUELA — THE USEFUL CRISIS")
          .font(.system(size: 12, weight: .black, design: .rounded))
          .foregroundColor(.red)
      }

      VStack(spacing: 8) {
        Text("WHY NOT REMOVE MADURO?")
          .font(.system(size: 11, weight: .black))
          .foregroundColor(.white)

        Text(
          "They've sanctioned him. Isolated him.\nDemonized him. Tried coups.\n\nBut they WON'T actually remove him."
        )
        .font(.system(size: 10, weight: .medium))
        .foregroundColor(.white.opacity(0.8))
        .multilineTextAlignment(.center)

        Text("Because they NEED the villain.")
          .font(.system(size: 12, weight: .black))
          .foregroundColor(.red)
      }

      // The chain
      VStack(spacing: 4) {
        chainLink("No Maduro", "No boogeyman")
        chainLink("No boogeyman", "No 'invasion' narrative")
        chainLink("No narrative", "No emergency powers")
        chainLink("No emergency", "No Palantir contracts")
        chainLink("No contracts", "No surveillance state")
      }
      .padding(10)
      .background(
        RoundedRectangle(cornerRadius: 8)
          .fill(Color.red.opacity(0.1))
      )

      // Oil factor
      VStack(spacing: 4) {
        Text("🛢️ THE OIL FACTOR")
          .font(.system(size: 10, weight: .black))
          .foregroundColor(.orange)

        Text(
          "Venezuela has the LARGEST proven oil reserves\nin the world. Larger than Saudi Arabia."
        )
        .font(.system(size: 9, weight: .medium))
        .foregroundColor(.white.opacity(0.8))
        .multilineTextAlignment(.center)

        Text("Destabilized = Oil stays in ground.\nIt's not incompetence. It's STRATEGY.")
          .font(.system(size: 10, weight: .bold))
          .foregroundColor(.orange)
          .multilineTextAlignment(.center)
      }
    }
    .padding(16)
    .frame(maxWidth: .infinity)
    .background(
      RoundedRectangle(cornerRadius: 14, style: .continuous)
        .fill(Color.red.opacity(0.1))
        .overlay(
          RoundedRectangle(cornerRadius: 14, style: .continuous)
            .stroke(Color.red.opacity(0.3), lineWidth: 1)
        )
    )
  }

  private func chainLink(_ from: String, _ to: String) -> some View {
    HStack(spacing: 4) {
      Text(from)
        .font(.system(size: 8, weight: .medium))
        .foregroundColor(.white.opacity(0.7))

      Text("→")
        .font(.system(size: 10, weight: .bold))
        .foregroundColor(.red)

      Text(to)
        .font(.system(size: 8, weight: .medium))
        .foregroundColor(.white.opacity(0.7))
    }
  }

  private var bessentSection: some View {
    VStack(spacing: 12) {
      Text("🏦 SCOTT BESSENT — TREASURY")
        .font(.system(size: 12, weight: .black, design: .rounded))
        .foregroundColor(.purple)

      VStack(spacing: 6) {
        Text("Former: Soros Fund Management CIO")
          .font(.system(size: 10, weight: .medium))
          .foregroundColor(.white.opacity(0.8))

        Text("Former: Key Square Group (hedge fund)")
          .font(.system(size: 10, weight: .medium))
          .foregroundColor(.white.opacity(0.8))

        Text("Now: US Treasury Secretary")
          .font(.system(size: 11, weight: .bold))
          .foregroundColor(.white)

        Text("Approved $20 BILLION to Argentina")
          .font(.system(size: 12, weight: .black))
          .foregroundColor(Palette.accent.gold)
      }

      // The loop
      VStack(spacing: 2) {
        Text("WALL STREET → TREASURY → BAILOUT → WALL STREET")
          .font(.system(size: 9, weight: .bold, design: .monospaced))
          .foregroundColor(.purple)

        Text("It's a closed loop. They bail out their friends.\nWith YOUR money.")
          .font(.system(size: 9, weight: .medium))
          .foregroundColor(.white.opacity(0.8))
          .multilineTextAlignment(.center)
      }
    }
    .padding(16)
    .frame(maxWidth: .infinity)
    .background(
      RoundedRectangle(cornerRadius: 14, style: .continuous)
        .fill(Color.purple.opacity(0.1))
        .overlay(
          RoundedRectangle(cornerRadius: 14, style: .continuous)
            .stroke(Color.purple.opacity(0.3), lineWidth: 1)
        )
    )
  }

  private var theWebSection: some View {
    VStack(spacing: 12) {
      Text("🕸️ THE WEB — IT'S ALL CONNECTED")
        .font(.system(size: 13, weight: .black, design: .rounded))
        .foregroundColor(Palette.accent.gold)

      VStack(alignment: .leading, spacing: 4) {
        webConnection("Trump", "Palantir", "Thiel is mega-donor")
        webConnection("Stephen Miller", "Palantir", "Owns stock, writes policy")
        webConnection("Palantir", "ICE", "$287M+ contracts")
        webConnection("ICE", "Crisis narrative", "Justifies expansion")
        webConnection("Venezuela", "Crisis", "Permanent boogeyman")
        webConnection("Bessent", "Argentina", "$20B bailout")
        webConnection("Milei", "Israel", "'Dear friend' of Netanyahu")
        webConnection("Epstein files", "Distractions", "Need to change narrative")
      }

      Text("It's not chaos. It's STRATEGY.\nAnd now you see it.")
        .font(.system(size: 11, weight: .bold))
        .foregroundColor(Palette.accent.gold)
        .multilineTextAlignment(.center)
    }
    .padding(16)
    .frame(maxWidth: .infinity)
    .background(
      RoundedRectangle(cornerRadius: 14, style: .continuous)
        .fill(
          LinearGradient(
            colors: [Palette.accent.gold.opacity(0.15), Palette.accent.gold.opacity(0.05)],
            startPoint: .top,
            endPoint: .bottom
          )
        )
        .overlay(
          RoundedRectangle(cornerRadius: 14, style: .continuous)
            .stroke(Palette.accent.gold.opacity(0.4), lineWidth: 1)
        )
    )
  }

  private func webConnection(_ from: String, _ to: String, _ how: String) -> some View {
    HStack(spacing: 4) {
      Text(from)
        .font(.system(size: 8, weight: .bold))
        .foregroundColor(.white)

      Text("→")
        .font(.system(size: 8))
        .foregroundColor(Palette.accent.gold)

      Text(to)
        .font(.system(size: 8, weight: .bold))
        .foregroundColor(.white)

      Text("(\(how))")
        .font(.system(size: 7, weight: .medium))
        .foregroundColor(.white.opacity(0.5))

      Spacer()
    }
  }

  private var whoBenefitsSection: some View {
    VStack(spacing: 12) {
      Text("🎯 WHO BENEFITS?")
        .font(.system(size: 13, weight: .black, design: .rounded))
        .foregroundColor(.white)

      // Winners
      VStack(spacing: 6) {
        Text("WINNERS 📈")
          .font(.system(size: 10, weight: .black))
          .foregroundColor(.green)

        beneficiaryRow("📈", "Palantir", "$287M+ contracts")
        beneficiaryRow("💰", "Peter Thiel", "Palantir founder, Trump donor")
        beneficiaryRow("📝", "Stephen Miller", "Owns stock, writes policy")
        beneficiaryRow("🏦", "Wall Street", "Bailout interest payments")
        beneficiaryRow("🇮🇱", "Israel", "Embassy to Jerusalem")
      }

      // Losers
      VStack(spacing: 6) {
        Text("LOSERS 📉")
          .font(.system(size: 10, weight: .black))
          .foregroundColor(.red)

        beneficiaryRow("👨‍👩‍👧", "Immigrants", "Surveillance, separation")
        beneficiaryRow("🇻🇪", "Venezuelans", "Kept in crisis")
        beneficiaryRow("🇦🇷", "Argentines", "Austerity, unpayable debt")
        beneficiaryRow("🇺🇸", "US Taxpayers", "Funding it all")
        beneficiaryRow("🤐", "Truth-tellers", "Labeled 'radical'")
      }
    }
    .padding(16)
    .frame(maxWidth: .infinity)
    .background(
      RoundedRectangle(cornerRadius: 14, style: .continuous)
        .fill(Color.white.opacity(0.05))
    )
  }

  private func beneficiaryRow(_ emoji: String, _ who: String, _ how: String) -> some View {
    HStack(spacing: 6) {
      Text(emoji)
        .font(.system(size: 10))
        .frame(width: 18)

      Text(who)
        .font(.system(size: 9, weight: .bold))
        .foregroundColor(.white)
        .frame(width: 70, alignment: .leading)

      Text(how)
        .font(.system(size: 8, weight: .medium))
        .foregroundColor(.white.opacity(0.7))

      Spacer()
    }
  }

  private var clockThatSection: some View {
    VStack(spacing: 12) {
      Text("⏰ #ClockThat")
        .font(.system(size: 16, weight: .black, design: .rounded))
        .foregroundColor(Palette.accent.gold)

      VStack(alignment: .leading, spacing: 6) {
        clockPattern("Palantir needs crisis = Venezuela stays boogeyman")
        clockPattern("Stephen Miller owns Palantir = conflict of interest")
        clockPattern("Argentina bailed out = Milei is pro-Israel")
        clockPattern("Venezuela demonized = Maduro is anti-Israel")
        clockPattern("Cruelty is theater = fewer deportations than Obama")
        clockPattern("Project 2025 + Esther = consolidation while distracted")
        clockPattern("Epstein files = why they need distractions NOW")
      }

      VStack(spacing: 4) {
        Text("Once you see the pattern,")
          .font(.system(size: 12, weight: .medium))
          .foregroundColor(.white.opacity(0.9))

        Text("you can't unsee it.")
          .font(.system(size: 14, weight: .black))
          .foregroundColor(.white)

        Text("That's awakening. That's what they fear.")
          .font(.system(size: 12, weight: .bold))
          .foregroundColor(Palette.accent.gold)

        Text("👁️🔥")
          .font(.system(size: 28))
      }
      .padding(.top, 8)
    }
    .padding(16)
    .frame(maxWidth: .infinity)
    .background(
      RoundedRectangle(cornerRadius: 14, style: .continuous)
        .fill(
          LinearGradient(
            colors: [Palette.accent.gold.opacity(0.2), Color.orange.opacity(0.1)],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
          )
        )
        .overlay(
          RoundedRectangle(cornerRadius: 14, style: .continuous)
            .stroke(Palette.accent.gold.opacity(0.5), lineWidth: 2)
        )
    )
  }

  private func clockPattern(_ text: String) -> some View {
    HStack(spacing: 6) {
      Text("⏰")
        .font(.system(size: 10))

      Text(text)
        .font(.system(size: 9, weight: .medium, design: .rounded))
        .foregroundColor(.white.opacity(0.9))
    }
  }

  // MARK: - Trinity Decoded Content (The Ultimate Pattern)

  private var trinityDecodedContent: some View {
    VStack(spacing: 24) {
      // Header
      VStack(spacing: 8) {
        Text("🔺 THE TRINITY DECODED 🔺")
          .font(.system(size: 16, weight: .black, design: .rounded))
          .tracking(2)
          .foregroundColor(Palette.accent.gold)

        Text("They made you WORSHIP the control structure")
          .font(.system(size: 12, weight: .medium, design: .rounded))
          .foregroundColor(.white.opacity(0.8))
      }

      // Side by side triangles
      trinityComparisonVisual

      // The parallels explained
      trinityParallelsSection

      // Sign of the Cross decode
      signOfTheCrossSection

      // Why life is hard
      whyLifeIsHardSection

      // Council of Nicaea proof
      nicaeaProofSection

      // Breaking free
      breakingFreeSection
    }
    .padding(16)
    .background(cardBackground)
  }

  private var trinityComparisonVisual: some View {
    VStack(spacing: 16) {
      HStack(spacing: 20) {
        // Holy Trinity
        VStack(spacing: 8) {
          Text("\"HOLY\" TRINITY")
            .font(.system(size: 10, weight: .black, design: .rounded))
            .foregroundColor(.purple)

          ZStack {
            // Triangle
            Path { path in
              path.move(to: CGPoint(x: 60, y: 10))
              path.addLine(to: CGPoint(x: 10, y: 90))
              path.addLine(to: CGPoint(x: 110, y: 90))
              path.closeSubpath()
            }
            .stroke(Color.purple.opacity(0.5), lineWidth: 2)
            .frame(width: 120, height: 100)

            // Labels
            VStack {
              Text("FATHER")
                .font(.system(size: 7, weight: .bold))
                .foregroundColor(.purple)
              Spacer()
              HStack {
                Text("SON")
                  .font(.system(size: 7, weight: .bold))
                  .foregroundColor(.purple)
                Spacer()
                Text("SPIRIT")
                  .font(.system(size: 7, weight: .bold))
                  .foregroundColor(.purple)
              }
            }
            .frame(width: 90, height: 70)

            // Center
            Text("GOD")
              .font(.system(size: 8, weight: .black))
              .foregroundColor(.purple)
              .offset(y: 15)
          }
          .frame(width: 120, height: 100)
        }

        // Equals sign
        VStack {
          Text("=")
            .font(.system(size: 30, weight: .black))
            .foregroundColor(Palette.accent.gold)

          Text("SAME")
            .font(.system(size: 8, weight: .bold))
            .foregroundColor(Palette.accent.gold)
        }

        // Control Trinity
        VStack(spacing: 8) {
          Text("CONTROL TRINITY")
            .font(.system(size: 10, weight: .black, design: .rounded))
            .foregroundColor(.red)

          ZStack {
            // Triangle
            Path { path in
              path.move(to: CGPoint(x: 60, y: 10))
              path.addLine(to: CGPoint(x: 10, y: 90))
              path.addLine(to: CGPoint(x: 110, y: 90))
              path.closeSubpath()
            }
            .stroke(Color.red.opacity(0.5), lineWidth: 2)
            .frame(width: 120, height: 100)

            // Labels
            VStack {
              Text("RELIGION")
                .font(.system(size: 7, weight: .bold))
                .foregroundColor(.red)
              Spacer()
              HStack {
                Text("GOV'T")
                  .font(.system(size: 7, weight: .bold))
                  .foregroundColor(.red)
                Spacer()
                Text("BANK")
                  .font(.system(size: 7, weight: .bold))
                  .foregroundColor(.red)
              }
            }
            .frame(width: 90, height: 70)

            // Center
            Text("CONTROL")
              .font(.system(size: 7, weight: .black))
              .foregroundColor(.red)
              .offset(y: 15)
          }
          .frame(width: 120, height: 100)
        }
      }

      // Punchline
      VStack(spacing: 4) {
        Text("Three-in-One. \"Separate\" but SAME essence.")
          .font(.system(size: 11, weight: .medium, design: .rounded))
          .foregroundColor(.white.opacity(0.9))

        Text("IT'S THE SAME TRIANGLE.")
          .font(.system(size: 14, weight: .black, design: .rounded))
          .foregroundColor(Palette.accent.gold)

        Text("😂😂😂")
          .font(.system(size: 24))
      }
    }
    .padding(16)
    .background(
      RoundedRectangle(cornerRadius: 14, style: .continuous)
        .fill(Color.white.opacity(0.05))
        .overlay(
          RoundedRectangle(cornerRadius: 14, style: .continuous)
            .stroke(Palette.accent.gold.opacity(0.3), lineWidth: 2)
        )
    )
  }

  private var trinityParallelsSection: some View {
    VStack(spacing: 12) {
      Text("THE PARALLEL")
        .font(.system(size: 12, weight: .black, design: .rounded))
        .tracking(2)
        .foregroundColor(.white)

      ForEach(TrinityControlSystem.parallels) { parallel in
        trinityParallelRow(parallel)
      }
    }
  }

  private func trinityParallelRow(_ parallel: TrinityControlSystem.TrinityParallel) -> some View {
    VStack(spacing: 8) {
      HStack(spacing: 16) {
        // Holy side
        VStack(spacing: 4) {
          Image(systemName: parallel.holyIcon)
            .font(.system(size: 20))
            .foregroundColor(.purple)

          Text(parallel.holyTrinity)
            .font(.system(size: 10, weight: .black, design: .rounded))
            .foregroundColor(.purple)

          Text(parallel.holyRole)
            .font(.system(size: 8, weight: .medium))
            .foregroundColor(.white.opacity(0.6))
        }
        .frame(maxWidth: .infinity)

        Text("=")
          .font(.system(size: 18, weight: .bold))
          .foregroundColor(Palette.accent.gold)

        // Control side
        VStack(spacing: 4) {
          Image(systemName: parallel.controlIcon)
            .font(.system(size: 20))
            .foregroundColor(.red)

          Text(parallel.controlTrinity)
            .font(.system(size: 10, weight: .black, design: .rounded))
            .foregroundColor(.red)

          Text(parallel.controlRole)
            .font(.system(size: 8, weight: .medium))
            .foregroundColor(.white.opacity(0.6))
        }
        .frame(maxWidth: .infinity)
      }

      // Function
      Text(parallel.function)
        .font(.system(size: 9, weight: .medium, design: .rounded))
        .foregroundColor(.white.opacity(0.8))
        .multilineTextAlignment(.center)
        .padding(.horizontal, 8)
    }
    .padding(12)
    .background(
      RoundedRectangle(cornerRadius: 10, style: .continuous)
        .fill(Color.white.opacity(0.03))
    )
  }

  private var signOfTheCrossSection: some View {
    VStack(spacing: 12) {
      Text("✝️ THE SIGN OF THE CROSS ✝️")
        .font(.system(size: 12, weight: .black, design: .rounded))
        .tracking(1)
        .foregroundColor(.orange)

      Text("The Invocation")
        .font(.system(size: 10, weight: .medium))
        .foregroundColor(.white.opacity(0.6))

      VStack(spacing: 10) {
        crossStepRow(
          "👆", "\"In the name of the Father...\"", "Touch FOREHEAD", "OBEY MORALITY", "Mind Control"
        )
        crossStepRow("👇", "\"...and of the Son...\"", "Touch CHEST", "OBEY LAW", "Body Control")
        crossStepRow(
          "👈👉", "\"...and of the Holy Spirit.\"", "Touch SHOULDERS", "OBEY MONEY", "Labor Control")

        Divider().background(Color.white.opacity(0.2))

        HStack(spacing: 8) {
          Text("🇪🇬")
            .font(.system(size: 20))

          VStack(alignment: .leading, spacing: 2) {
            Text("\"Amen.\"")
              .font(.system(size: 12, weight: .bold, design: .rounded))
              .foregroundColor(.white)

            Text("= AMEN-RA (Egyptian Sun God)")
              .font(.system(size: 10, weight: .bold, design: .rounded))
              .foregroundColor(Palette.accent.gold)
          }
        }
      }

      Text(
        "Every time you cross yourself, you activate\nthe control program and seal it with Egypt. 😂"
      )
      .font(.system(size: 10, weight: .bold, design: .rounded))
      .foregroundColor(.orange)
      .multilineTextAlignment(.center)
    }
    .padding(16)
    .frame(maxWidth: .infinity)
    .background(
      RoundedRectangle(cornerRadius: 14, style: .continuous)
        .fill(Color.orange.opacity(0.1))
        .overlay(
          RoundedRectangle(cornerRadius: 14, style: .continuous)
            .stroke(Color.orange.opacity(0.3), lineWidth: 1)
        )
    )
  }

  private func crossStepRow(
    _ emoji: String, _ prayer: String, _ action: String, _ obey: String, _ control: String
  ) -> some View {
    HStack(spacing: 10) {
      Text(emoji)
        .font(.system(size: 16))
        .frame(width: 30)

      VStack(alignment: .leading, spacing: 2) {
        Text(prayer)
          .font(.system(size: 10, weight: .medium, design: .serif))
          .foregroundColor(.white)
          .italic()

        HStack(spacing: 4) {
          Text(action)
            .font(.system(size: 8, weight: .medium))
            .foregroundColor(.white.opacity(0.5))

          Text("→")
            .foregroundColor(.orange)

          Text(obey)
            .font(.system(size: 8, weight: .bold))
            .foregroundColor(.orange)

          Text("→")
            .foregroundColor(.red)

          Text(control)
            .font(.system(size: 8, weight: .bold))
            .foregroundColor(.red)
        }
      }

      Spacer()
    }
  }

  private var whyLifeIsHardSection: some View {
    VStack(spacing: 12) {
      Text("💔 THIS IS WHY LIFE IS SO HARD 💔")
        .font(.system(size: 13, weight: .black, design: .rounded))
        .tracking(1)
        .foregroundColor(.red)

      VStack(spacing: 8) {
        strikethroughRow("It's not bad luck")
        strikethroughRow("It's not \"God's plan\"")
        strikethroughRow("It's not because you didn't work hard enough")
      }

      Text("THE SYSTEM WAS DESIGNED THIS WAY.")
        .font(.system(size: 14, weight: .black, design: .rounded))
        .foregroundColor(Palette.accent.gold)
        .padding(.vertical, 8)

      VStack(alignment: .leading, spacing: 8) {
        systemRow("RELIGION", "Suffering is holy. Wait for heaven.", .purple)
        systemRow("GOVERNMENT", "Follow the rules. Don't resist.", .blue)
        systemRow("BANKING", "You owe. Keep working. Stay in debt.", .green)
      }

      VStack(spacing: 4) {
        Text("THREE-IN-ONE keeping you:")
          .font(.system(size: 11, weight: .medium, design: .rounded))
          .foregroundColor(.white.opacity(0.8))

        HStack(spacing: 16) {
          keepingYouPill("Morally Compliant", .purple)
          keepingYouPill("Legally Obedient", .blue)
          keepingYouPill("Financially Enslaved", .green)
        }
      }
      .padding(.top, 8)

      VStack(spacing: 4) {
        Text("And they made you WORSHIP it as God.")
          .font(.system(size: 12, weight: .bold, design: .rounded))
          .foregroundColor(.white)

        Text("The Trinity isn't holy.\nIt's the ORG CHART of human farming.")
          .font(.system(size: 13, weight: .black, design: .rounded))
          .foregroundColor(.red)
          .multilineTextAlignment(.center)
      }
      .padding(.top, 8)
    }
    .padding(16)
    .frame(maxWidth: .infinity)
    .background(
      RoundedRectangle(cornerRadius: 14, style: .continuous)
        .fill(Color.red.opacity(0.1))
        .overlay(
          RoundedRectangle(cornerRadius: 14, style: .continuous)
            .stroke(Color.red.opacity(0.3), lineWidth: 1)
        )
    )
  }

  private func strikethroughRow(_ text: String) -> some View {
    Text(text)
      .font(.system(size: 11, weight: .medium, design: .rounded))
      .foregroundColor(.white.opacity(0.6))
      .strikethrough(color: .red)
  }

  private func systemRow(_ system: String, _ message: String, _ color: Color) -> some View {
    HStack(spacing: 8) {
      Text(system)
        .font(.system(size: 10, weight: .black, design: .rounded))
        .foregroundColor(color)
        .frame(width: 80, alignment: .leading)

      Text("tells you:")
        .font(.system(size: 9, weight: .medium))
        .foregroundColor(.white.opacity(0.5))

      Text(message)
        .font(.system(size: 9, weight: .medium, design: .rounded))
        .foregroundColor(.white.opacity(0.8))
        .italic()
    }
  }

  private func keepingYouPill(_ text: String, _ color: Color) -> some View {
    Text(text)
      .font(.system(size: 7, weight: .bold, design: .rounded))
      .foregroundColor(color)
      .padding(.horizontal, 6)
      .padding(.vertical, 4)
      .background(
        Capsule()
          .fill(color.opacity(0.2))
      )
  }

  private var nicaeaProofSection: some View {
    VStack(spacing: 12) {
      Text("📜 THE PROOF 📜")
        .font(.system(size: 12, weight: .black, design: .rounded))
        .tracking(1)
        .foregroundColor(.cyan)

      VStack(spacing: 8) {
        Text("The Trinity doctrine was NOT in early Christianity.")
          .font(.system(size: 11, weight: .medium, design: .rounded))
          .foregroundColor(.white.opacity(0.9))

        VStack(spacing: 4) {
          Text("COUNCIL OF NICAEA")
            .font(.system(size: 14, weight: .black, design: .rounded))
            .foregroundColor(.cyan)

          Text("325 AD")
            .font(.system(size: 12, weight: .bold, design: .monospaced))
            .foregroundColor(Palette.accent.gold)
        }

        VStack(spacing: 4) {
          Text("Called by CONSTANTINE")
            .font(.system(size: 12, weight: .bold, design: .rounded))
            .foregroundColor(.white)

          Text("A ROMAN EMPEROR")
            .font(.system(size: 11, weight: .black, design: .rounded))
            .foregroundColor(.red)
        }

        Text("He MERGED church and state\nand encoded it as \"divine.\"")
          .font(.system(size: 11, weight: .medium, design: .rounded))
          .foregroundColor(.white.opacity(0.9))
          .multilineTextAlignment(.center)

        VStack(spacing: 4) {
          Text("\"Separation of church and state\"?")
            .font(.system(size: 11, weight: .medium, design: .rounded))
            .foregroundColor(.white.opacity(0.7))

          Text("😂😂😂")
            .font(.system(size: 20))

          Text("They were FUSED from day one.")
            .font(.system(size: 12, weight: .black, design: .rounded))
            .foregroundColor(Palette.accent.gold)
        }
      }
    }
    .padding(16)
    .frame(maxWidth: .infinity)
    .background(
      RoundedRectangle(cornerRadius: 14, style: .continuous)
        .fill(Color.cyan.opacity(0.08))
        .overlay(
          RoundedRectangle(cornerRadius: 14, style: .continuous)
            .stroke(Color.cyan.opacity(0.3), lineWidth: 1)
        )
    )
  }

  private var breakingFreeSection: some View {
    VStack(spacing: 12) {
      Text("🔓 BREAKING FREE 🔓")
        .font(.system(size: 14, weight: .black, design: .rounded))
        .tracking(1)
        .foregroundColor(Palette.accent.gold)

      VStack(alignment: .leading, spacing: 8) {
        breakFreeRow("1", "Recognize the TRIANGLE", "Religion, Government, Banking work as ONE")
        breakFreeRow(
          "2", "Stop worshipping the STRUCTURE", "The divine is WITHIN you, not institutions")
        breakFreeRow("3", "Question MORAL authority", "Who benefits from these \"sins\"?")
        breakFreeRow("4", "Question LEGAL authority", "Who wrote these laws and for whom?")
        breakFreeRow("5", "Question FINANCIAL authority", "Who created this money system?")
        breakFreeRow("6", "Realize YOU are SOVEREIGN", "No intermediaries needed to Source")
      }

      Divider().background(Color.white.opacity(0.2))

      VStack(spacing: 8) {
        HStack(spacing: 20) {
          VStack(spacing: 4) {
            Text("THEIR Trinity")
              .font(.system(size: 10, weight: .bold))
              .foregroundColor(.red)
            Text("Religion\nGovernment\nBanking")
              .font(.system(size: 9, weight: .medium))
              .foregroundColor(.white.opacity(0.6))
              .multilineTextAlignment(.center)
            Text("= CONTROL")
              .font(.system(size: 10, weight: .black))
              .foregroundColor(.red)
          }

          Text("→")
            .font(.system(size: 20, weight: .bold))
            .foregroundColor(Palette.accent.gold)

          VStack(spacing: 4) {
            Text("YOUR Trinity")
              .font(.system(size: 10, weight: .bold))
              .foregroundColor(Palette.accent.gold)
            Text("Mind\nBody\nSpirit")
              .font(.system(size: 9, weight: .medium))
              .foregroundColor(.white.opacity(0.9))
              .multilineTextAlignment(.center)
            Text("= SOVEREIGNTY")
              .font(.system(size: 10, weight: .black))
              .foregroundColor(Palette.accent.gold)
          }
        }

        Text("Take back YOUR trinity. 👁️🔥")
          .font(.system(size: 14, weight: .black, design: .rounded))
          .foregroundColor(.white)
      }
    }
    .padding(16)
    .frame(maxWidth: .infinity)
    .background(
      RoundedRectangle(cornerRadius: 14, style: .continuous)
        .fill(
          LinearGradient(
            colors: [Palette.accent.gold.opacity(0.15), Palette.accent.gold.opacity(0.05)],
            startPoint: .top,
            endPoint: .bottom
          )
        )
        .overlay(
          RoundedRectangle(cornerRadius: 14, style: .continuous)
            .stroke(Palette.accent.gold.opacity(0.4), lineWidth: 1)
        )
    )
  }

  private func breakFreeRow(_ number: String, _ title: String, _ detail: String) -> some View {
    HStack(alignment: .top, spacing: 10) {
      Text(number)
        .font(.system(size: 10, weight: .bold, design: .monospaced))
        .foregroundColor(.black)
        .frame(width: 18, height: 18)
        .background(Circle().fill(Palette.accent.gold))

      VStack(alignment: .leading, spacing: 2) {
        Text(title)
          .font(.system(size: 11, weight: .bold, design: .rounded))
          .foregroundColor(.white)

        Text(detail)
          .font(.system(size: 9, weight: .medium, design: .rounded))
          .foregroundColor(.white.opacity(0.7))
      }
    }
  }

  // MARK: - Control Triangle Content

  private var controlTriangleContent: some View {
    VStack(spacing: 24) {
      // The Triangle Visualization
      controlTriangleVisualization

      // Truth statement
      truthStatement

      // Each node explained
      nodeExplanations
    }
    .padding(16)
    .background(cardBackground)
  }

  private var controlTriangleVisualization: some View {
    VStack(spacing: 16) {
      Text("THE CONTROL TRIANGLE")
        .font(.system(size: 14, weight: .black, design: .rounded))
        .tracking(2)
        .foregroundColor(.white)

      // Triangle diagram
      ZStack {
        // Background glow
        Circle()
          .fill(
            RadialGradient(
              colors: [
                Color.red.opacity(trianglePulsing ? 0.2 : 0.1),
                .clear,
              ],
              center: .center,
              startRadius: 50,
              endRadius: 150
            )
          )
          .frame(width: 300, height: 300)

        // Triangle lines
        Path { path in
          // Religion (top) to Government (bottom left)
          path.move(to: CGPoint(x: 150, y: 30))
          path.addLine(to: CGPoint(x: 40, y: 200))
          // Government (bottom left) to Banking (bottom right)
          path.addLine(to: CGPoint(x: 260, y: 200))
          // Banking (bottom right) back to Religion (top)
          path.addLine(to: CGPoint(x: 150, y: 30))
        }
        .stroke(
          LinearGradient(
            colors: [.purple, .blue, .green, .purple],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
          ),
          lineWidth: 2
        )
        .frame(width: 300, height: 230)

        // Lines to center
        Path { path in
          let center = CGPoint(x: 150, y: 130)
          // From Religion
          path.move(to: CGPoint(x: 150, y: 30))
          path.addLine(to: center)
          // From Government
          path.move(to: CGPoint(x: 40, y: 200))
          path.addLine(to: center)
          // From Banking
          path.move(to: CGPoint(x: 260, y: 200))
          path.addLine(to: center)
        }
        .stroke(Color.red.opacity(0.5), style: StrokeStyle(lineWidth: 1, dash: [5, 3]))
        .frame(width: 300, height: 230)

        // RELIGION node (top)
        triangleNode(
          icon: "building.columns.fill",
          label: "RELIGION",
          sublabel: "Moral Authority",
          color: .purple
        )
        .offset(y: -85)

        // GOVERNMENT node (bottom left)
        triangleNode(
          icon: "building.2.crop.circle.fill",
          label: "GOVERNMENT",
          sublabel: "Legal Authority",
          color: .blue
        )
        .offset(x: -90, y: 70)

        // BANKING node (bottom right)
        triangleNode(
          icon: "dollarsign.circle.fill",
          label: "BANKING",
          sublabel: "Financial Authority",
          color: .green
        )
        .offset(x: 90, y: 70)

        // CONTROL center
        VStack(spacing: 4) {
          Text("CONTROL")
            .font(.system(size: 12, weight: .black, design: .rounded))
            .foregroundColor(.red)

          Image(systemName: "arrow.down")
            .font(.system(size: 14, weight: .bold))
            .foregroundColor(.red)

          ZStack {
            Circle()
              .fill(Color.red.opacity(0.2))
              .frame(width: 50, height: 50)

            Text("YOU")
              .font(.system(size: 11, weight: .black, design: .rounded))
              .foregroundColor(.white)

            Text("🧍")
              .font(.system(size: 20))
              .offset(y: 22)
          }
        }
        .offset(y: 15)
      }
      .frame(height: 280)
      .onAppear {
        withAnimation(.easeInOut(duration: 2.0).repeatForever(autoreverses: true)) {
          trianglePulsing = true
        }
      }
    }
  }

  private func triangleNode(icon: String, label: String, sublabel: String, color: Color)
    -> some View
  {
    VStack(spacing: 4) {
      ZStack {
        Circle()
          .fill(color.opacity(0.2))
          .frame(width: 44, height: 44)

        Circle()
          .stroke(color, lineWidth: 2)
          .frame(width: 44, height: 44)

        Image(systemName: icon)
          .font(.system(size: 18))
          .foregroundColor(color)
      }

      Text(label)
        .font(.system(size: 9, weight: .black, design: .rounded))
        .foregroundColor(color)

      Text(sublabel)
        .font(.system(size: 7, weight: .medium, design: .rounded))
        .foregroundColor(.white.opacity(0.6))
    }
  }

  private var truthStatement: some View {
    VStack(spacing: 12) {
      Text("\"Separation of Church and State\"")
        .font(.system(size: 14, weight: .bold, design: .rounded))
        .foregroundColor(.white)
        .strikethrough(color: .red)

      Text("= THE LIE")
        .font(.system(size: 16, weight: .black, design: .rounded))
        .foregroundColor(.red)

      VStack(alignment: .leading, spacing: 8) {
        truthPoint("Religion provides MORAL justification")
        truthPoint("Government provides ENFORCEMENT")
        truthPoint("Banking provides the CHAINS")
      }

      Text("They NEED each other. The target is always YOU.")
        .font(.system(size: 13, weight: .bold, design: .rounded))
        .foregroundColor(.white)
        .multilineTextAlignment(.center)
        .padding(.top, 8)
    }
    .padding(16)
    .background(
      RoundedRectangle(cornerRadius: 14, style: .continuous)
        .fill(Color.red.opacity(0.1))
        .overlay(
          RoundedRectangle(cornerRadius: 14, style: .continuous)
            .stroke(Color.red.opacity(0.3), lineWidth: 1)
        )
    )
  }

  private func truthPoint(_ text: String) -> some View {
    HStack(spacing: 8) {
      Image(systemName: "checkmark.circle.fill")
        .font(.system(size: 12))
        .foregroundColor(.red)

      Text(text)
        .font(.system(size: 12, weight: .medium, design: .rounded))
        .foregroundColor(.white.opacity(0.9))

      Spacer()
    }
  }

  private var nodeExplanations: some View {
    VStack(spacing: 12) {
      nodeDetail(node: ControlTriangle.religion)
      nodeDetail(node: ControlTriangle.government)
      nodeDetail(node: ControlTriangle.banking)
    }
  }

  private func nodeDetail(node: ControlTriangle.ControlNode) -> some View {
    VStack(alignment: .leading, spacing: 8) {
      HStack(spacing: 10) {
        Image(systemName: node.icon)
          .font(.system(size: 18))
          .foregroundColor(Color(hex: node.color))

        VStack(alignment: .leading, spacing: 2) {
          Text(node.name)
            .font(.system(size: 14, weight: .bold, design: .rounded))
            .foregroundColor(Color(hex: node.color))

          Text(node.role)
            .font(.system(size: 10, weight: .medium, design: .rounded))
            .foregroundColor(.white.opacity(0.6))
        }

        Spacer()
      }

      // Examples
      VStack(alignment: .leading, spacing: 4) {
        ForEach(node.examples, id: \.self) { example in
          HStack(spacing: 6) {
            Circle()
              .fill(Color(hex: node.color).opacity(0.5))
              .frame(width: 4, height: 4)

            Text(example)
              .font(.system(size: 11, weight: .medium, design: .rounded))
              .foregroundColor(.white.opacity(0.8))
          }
        }
      }
      .padding(.leading, 28)
    }
    .padding(12)
    .background(
      RoundedRectangle(cornerRadius: 10, style: .continuous)
        .fill(Color(hex: node.color).opacity(0.08))
    )
  }

  // MARK: - Timeline Content

  private var selectiveMoralityContent: some View {
    VStack(alignment: .leading, spacing: 20) {
      // Header
      HStack(spacing: 10) {
        Image(systemName: "speaker.slash.fill")
          .foregroundColor(.orange)

        Text("16 YEARS OF SILENCE")
          .font(.system(size: 13, weight: .black, design: .rounded))
          .tracking(2)
          .foregroundColor(.orange)
      }

      Text("Where was their \"moral clarity\" for 16+ years across 4 administrations?")
        .font(.system(size: 13, weight: .medium, design: .rounded))
        .foregroundColor(.white.opacity(0.8))

      // Administration timeline
      ForEach(SelectiveMoralityEvent.timeline) { event in
        administrationRow(event)
      }

      // The 12 Pattern
      theNumberTwelveSection

      // Conclusion
      selectiveMoralityConclusion
    }
    .padding(16)
    .background(cardBackground)
  }

  private func administrationRow(_ event: SelectiveMoralityEvent) -> some View {
    VStack(alignment: .leading, spacing: 10) {
      // Header
      HStack {
        Image(systemName: event.icon)
          .font(.system(size: 16))
          .foregroundColor(event.administration.contains("EPSTEIN") ? .red : .gray)

        VStack(alignment: .leading, spacing: 2) {
          Text(event.administration)
            .font(.system(size: 14, weight: .bold, design: .rounded))
            .foregroundColor(event.administration.contains("EPSTEIN") ? .red : .white)

          Text(event.years)
            .font(.system(size: 10, weight: .medium, design: .monospaced))
            .foregroundColor(
              event.administration.contains("EPSTEIN") ? .red.opacity(0.8) : .white.opacity(0.5))
        }

        Spacer()

        // Response
        Text(event.vaticanResponse)
          .font(.system(size: event.vaticanResponse.contains("SUDDENLY") ? 9 : 14))
          .foregroundColor(event.vaticanResponse.contains("SUDDENLY") ? .red : .gray)
      }

      // What happened
      VStack(alignment: .leading, spacing: 4) {
        ForEach(event.whatHappened, id: \.self) { item in
          HStack(alignment: .top, spacing: 6) {
            Circle()
              .fill(event.administration.contains("EPSTEIN") ? Color.red : Color.white.opacity(0.3))
              .frame(width: 4, height: 4)
              .offset(y: 5)

            Text(item)
              .font(.system(size: 11, weight: .medium, design: .rounded))
              .foregroundColor(
                event.administration.contains("EPSTEIN") ? .red.opacity(0.9) : .white.opacity(0.7))
          }
        }
      }
      .padding(.leading, 24)
    }
    .padding(12)
    .background(
      RoundedRectangle(cornerRadius: 10, style: .continuous)
        .fill(
          event.administration.contains("EPSTEIN")
            ? Color.red.opacity(0.15) : Color.white.opacity(0.03)
        )
        .overlay(
          RoundedRectangle(cornerRadius: 10, style: .continuous)
            .stroke(
              event.administration.contains("EPSTEIN") ? Color.red.opacity(0.4) : Color.clear,
              lineWidth: 1)
        )
    )
  }

  private var theNumberTwelveSection: some View {
    VStack(spacing: 16) {
      // Zodiac symbols
      Text("♈️♉️♊️♋️♌️♍️♎️♏️♐️♑️♒️♓️")
        .font(.system(size: 20))
        .tracking(4)

      Text("THE NUMBER 12")
        .font(.system(size: 16, weight: .black, design: .rounded))
        .tracking(3)
        .foregroundColor(Palette.accent.gold)

      Text("Their Operating System")
        .font(.system(size: 12, weight: .medium, design: .rounded))
        .foregroundColor(.white.opacity(0.7))

      // 12 instances
      VStack(spacing: 8) {
        twelveRow("🕐", "12 hours on the clock")
        twelveRow("📅", "12 months in the year")
        twelveRow("⭐", "12 zodiac signs")
        twelveRow("👥", "12 disciples of Jesus")
        twelveRow("🏛️", "12 tribes of Israel")
        twelveRow("⚖️", "12 jurors in a trial")
        twelveRow("🎄", "12 days of Christmas")
        twelveRow("🤫", "12 DAYS OF VATICAN SILENCE")
      }

      Text(
        "12 is the number of COMPLETION.\nIt's the ZODIAC WHEEL.\nThey operate by it.\nThey waited EXACTLY 12 days."
      )
      .font(.system(size: 12, weight: .medium, design: .rounded))
      .foregroundColor(.white.opacity(0.9))
      .multilineTextAlignment(.center)
      .lineSpacing(4)

      Text("Coincidence? There are no coincidences.")
        .font(.system(size: 13, weight: .bold, design: .rounded))
        .foregroundColor(Palette.accent.gold)
    }
    .padding(16)
    .frame(maxWidth: .infinity)
    .background(
      RoundedRectangle(cornerRadius: 14, style: .continuous)
        .fill(Palette.accent.gold.opacity(0.1))
        .overlay(
          RoundedRectangle(cornerRadius: 14, style: .continuous)
            .stroke(Palette.accent.gold.opacity(0.3), lineWidth: 1)
        )
    )
  }

  private func twelveRow(_ emoji: String, _ text: String) -> some View {
    HStack(spacing: 10) {
      Text(emoji)
        .font(.system(size: 16))
        .frame(width: 24)

      Text(text)
        .font(
          .system(size: 12, weight: text.contains("VATICAN") ? .bold : .medium, design: .rounded)
        )
        .foregroundColor(text.contains("VATICAN") ? .red : .white.opacity(0.85))

      Spacer()
    }
  }

  private var selectiveMoralityConclusion: some View {
    VStack(spacing: 12) {
      Text("🤔")
        .font(.system(size: 32))

      VStack(spacing: 6) {
        Text("16+ years of silence on immigration.")
          .font(.system(size: 13, weight: .medium, design: .rounded))
          .foregroundColor(.white.opacity(0.9))

        Text("4 administrations. Both parties.")
          .font(.system(size: 13, weight: .medium, design: .rounded))
          .foregroundColor(.white.opacity(0.9))

        Text("Children suffering the ENTIRE time.")
          .font(.system(size: 13, weight: .bold, design: .rounded))
          .foregroundColor(.orange)

        Text("60,000+ migrants missing.")
          .font(.system(size: 13, weight: .bold, design: .rounded))
          .foregroundColor(.red)
      }

      Divider()
        .background(Color.white.opacity(0.2))

      VStack(spacing: 4) {
        Text("But NOW they speak up?")
          .font(.system(size: 14, weight: .bold, design: .rounded))
          .foregroundColor(.white)

        Text("12 days after being named in Epstein files?")
          .font(.system(size: 14, weight: .bold, design: .rounded))
          .foregroundColor(.red)
      }

      VStack(spacing: 4) {
        Text("This isn't morality.")
          .font(.system(size: 14, weight: .medium, design: .rounded))
          .foregroundColor(.white.opacity(0.8))

        Text("This is DAMAGE CONTROL.")
          .font(.system(size: 16, weight: .black, design: .rounded))
          .foregroundColor(.red)
      }
      .padding(.top, 8)
    }
    .padding(16)
    .frame(maxWidth: .infinity)
    .background(
      RoundedRectangle(cornerRadius: 14, style: .continuous)
        .fill(Color.red.opacity(0.1))
        .overlay(
          RoundedRectangle(cornerRadius: 14, style: .continuous)
            .stroke(Color.red.opacity(0.3), lineWidth: 1)
        )
    )
  }

  // MARK: - Which Christians Matter Content

  private var whichChristiansContent: some View {
    VStack(alignment: .leading, spacing: 20) {
      // Header
      HStack(spacing: 10) {
        Image(systemName: "cross.fill")
          .foregroundColor(.purple)

        Text("WHICH CHRISTIANS MATTER?")
          .font(.system(size: 13, weight: .black, design: .rounded))
          .tracking(2)
          .foregroundColor(.purple)
      }

      Text("They claim to protect Christians. But only SOME Christians. Why?")
        .font(.system(size: 13, weight: .medium, design: .rounded))
        .foregroundColor(.white.opacity(0.8))

      // Cases
      ForEach(SelectiveChristianMorality.cases) { caseItem in
        christianMoralityRow(caseItem)
      }

      // Real Semites section
      realSemitesSection

      // Gaza churches
      gazaChurchesSection

      // Israel-Hamas connection
      israelHamasSection

      // Follow the resources
      followResourcesSection

      // Zionism vs Judaism
      zionismVsJudaismSection

      // Anti-Zionist Jews
      antiZionistJewsSection

      // The Silencing Mechanism
      silencingMechanismSection

      // Christian Zionism - The Smoking Gun
      christianZionismSection

      // The Second Coming Deception
      secondComingSection

      // Church and State Never Separate
      churchStateNeverSeparateSection
    }
    .padding(16)
    .background(cardBackground)
  }

  private func christianMoralityRow(_ item: SelectiveChristianMorality) -> some View {
    VStack(alignment: .leading, spacing: 10) {
      // Header
      HStack {
        Image(systemName: item.icon)
          .font(.system(size: 16))
          .foregroundColor(item.resources.contains("None") ? .red : .green)

        Text(item.location)
          .font(.system(size: 14, weight: .bold, design: .rounded))
          .foregroundColor(.white)

        Spacer()

        // Response indicator
        Text(item.vaticanUSResponse.prefix(2))
          .font(.system(size: 16))
      }

      // Situation
      Text(item.situation)
        .font(.system(size: 11, weight: .medium, design: .rounded))
        .foregroundColor(.white.opacity(0.8))

      // Christians affected
      HStack(alignment: .top, spacing: 6) {
        Image(systemName: "person.3.fill")
          .font(.system(size: 10))
          .foregroundColor(.purple.opacity(0.7))

        Text(item.christiansAffected)
          .font(.system(size: 10, weight: .medium, design: .rounded))
          .foregroundColor(.purple.opacity(0.9))
      }

      // Response
      HStack(alignment: .top, spacing: 6) {
        Image(systemName: "megaphone.fill")
          .font(.system(size: 10))
          .foregroundColor(
            item.resources.contains("None") ? .red.opacity(0.7) : .green.opacity(0.7))

        Text(item.vaticanUSResponse)
          .font(.system(size: 10, weight: .bold, design: .rounded))
          .foregroundColor(item.resources.contains("None") ? .red : .green)
      }

      // Resources
      HStack(alignment: .top, spacing: 6) {
        Image(systemName: "dollarsign.circle.fill")
          .font(.system(size: 10))
          .foregroundColor(item.resources.contains("None") ? .gray : Palette.accent.gold)

        Text("Resources: \(item.resources)")
          .font(.system(size: 10, weight: .bold, design: .rounded))
          .foregroundColor(item.resources.contains("None") ? .gray : Palette.accent.gold)
      }
    }
    .padding(12)
    .background(
      RoundedRectangle(cornerRadius: 10, style: .continuous)
        .fill(item.resources.contains("None") ? Color.red.opacity(0.08) : Color.green.opacity(0.08))
        .overlay(
          RoundedRectangle(cornerRadius: 10, style: .continuous)
            .stroke(
              item.resources.contains("None") ? Color.red.opacity(0.2) : Color.green.opacity(0.2),
              lineWidth: 1)
        )
    )
  }

  private var realSemitesSection: some View {
    VStack(spacing: 12) {
      Text("🕊️ THE REAL SEMITES 🕊️")
        .font(.system(size: 14, weight: .black, design: .rounded))
        .tracking(2)
        .foregroundColor(.cyan)

      VStack(alignment: .leading, spacing: 8) {
        Text("SEMITIC = From the land of Shem (Middle East)")
          .font(.system(size: 12, weight: .bold, design: .rounded))
          .foregroundColor(.white)

        VStack(alignment: .leading, spacing: 4) {
          semiteRow("Palestinians — FROM the land. Indigenous.")
          semiteRow("Arabs, Hebrews, Assyrians, Phoenicians")
        }

        Divider().background(Color.white.opacity(0.2))

        Text(
          "Many European Zionists are Ashkenazi —\ndescended from Khazar converts, from Eastern Europe.\nNot originally from the Levant."
        )
        .font(.system(size: 11, weight: .medium, design: .rounded))
        .foregroundColor(.white.opacity(0.8))
        .lineSpacing(4)

        Text(
          "\"Anti-Semitism\" has been weaponized\nto silence criticism of a POLITICAL STATE,\nnot a people."
        )
        .font(.system(size: 12, weight: .bold, design: .rounded))
        .foregroundColor(.cyan)
        .lineSpacing(4)
        .padding(.top, 4)
      }
    }
    .padding(16)
    .frame(maxWidth: .infinity)
    .background(
      RoundedRectangle(cornerRadius: 14, style: .continuous)
        .fill(Color.cyan.opacity(0.1))
        .overlay(
          RoundedRectangle(cornerRadius: 14, style: .continuous)
            .stroke(Color.cyan.opacity(0.3), lineWidth: 1)
        )
    )
  }

  private func semiteRow(_ text: String) -> some View {
    HStack(spacing: 8) {
      Circle()
        .fill(Color.cyan)
        .frame(width: 4, height: 4)

      Text(text)
        .font(.system(size: 11, weight: .medium, design: .rounded))
        .foregroundColor(.white.opacity(0.9))
    }
  }

  private var gazaChurchesSection: some View {
    VStack(spacing: 12) {
      HStack {
        Image(systemName: "cross.fill")
          .foregroundColor(.red)
        Text("CHURCHES BOMBED IN GAZA (2023)")
          .font(.system(size: 12, weight: .black, design: .rounded))
          .tracking(1)
          .foregroundColor(.red)
      }

      VStack(alignment: .leading, spacing: 10) {
        churchRow(
          name: "Greek Orthodox Church of Saint Porphyrius",
          detail: "5th century — one of oldest churches in the WORLD",
          damage: "Hit by Israeli airstrike. Christians killed inside."
        )

        churchRow(
          name: "Catholic Holy Family Church",
          detail: "Compound where nuns and elderly sheltered",
          damage: "Damaged by strikes."
        )

        churchRow(
          name: "YMCA & Christian facilities",
          detail: "Various Christian buildings",
          damage: "Destroyed or damaged."
        )
      }

      VStack(spacing: 6) {
        Text("CHRISTIANS killed by bombs")
          .font(.system(size: 12, weight: .bold, design: .rounded))
          .foregroundColor(.white)

        Text("paid for by a \"Christian nation\" (USA)")
          .font(.system(size: 12, weight: .bold, design: .rounded))
          .foregroundColor(.red)

        Text("$3.8 BILLION annually")
          .font(.system(size: 14, weight: .black, design: .rounded))
          .foregroundColor(Palette.accent.gold)
      }
      .padding(.top, 8)
    }
    .padding(16)
    .frame(maxWidth: .infinity)
    .background(
      RoundedRectangle(cornerRadius: 14, style: .continuous)
        .fill(Color.red.opacity(0.1))
        .overlay(
          RoundedRectangle(cornerRadius: 14, style: .continuous)
            .stroke(Color.red.opacity(0.3), lineWidth: 1)
        )
    )
  }

  private func churchRow(name: String, detail: String, damage: String) -> some View {
    VStack(alignment: .leading, spacing: 4) {
      Text("⛪ \(name)")
        .font(.system(size: 11, weight: .bold, design: .rounded))
        .foregroundColor(.white)

      Text(detail)
        .font(.system(size: 10, weight: .medium, design: .rounded))
        .foregroundColor(.white.opacity(0.6))

      Text(damage)
        .font(.system(size: 10, weight: .bold, design: .rounded))
        .foregroundColor(.red.opacity(0.9))
    }
  }

  private var israelHamasSection: some View {
    VStack(spacing: 12) {
      HStack {
        Image(systemName: "exclamationmark.triangle.fill")
          .foregroundColor(.orange)
        Text("DOCUMENTED: ISRAEL PROPPED UP HAMAS")
          .font(.system(size: 11, weight: .black, design: .rounded))
          .tracking(1)
          .foregroundColor(.orange)
      }

      VStack(alignment: .leading, spacing: 8) {
        Text(
          "Israeli officials admitted supporting Hamas to divide Palestinians and weaken the secular PLO."
        )
        .font(.system(size: 11, weight: .medium, design: .rounded))
        .foregroundColor(.white.opacity(0.9))

        VStack(alignment: .leading, spacing: 4) {
          Text("Netanyahu's strategy:")
            .font(.system(size: 10, weight: .bold, design: .rounded))
            .foregroundColor(.orange)

          Text(
            "\"Anyone who wants to thwart the establishment of a Palestinian state has to support bolstering Hamas.\""
          )
          .font(.system(size: 11, weight: .medium, design: .serif))
          .foregroundColor(.white)
          .italic()

          Text("— Reported in Times of Israel, Haaretz")
            .font(.system(size: 9, weight: .medium, design: .rounded))
            .foregroundColor(.white.opacity(0.5))
        }

        Text(
          "They created the enemy.\nThen used that enemy to justify bombing Christians.\nClassic divide and conquer."
        )
        .font(.system(size: 11, weight: .bold, design: .rounded))
        .foregroundColor(.orange)
        .lineSpacing(4)
        .padding(.top, 4)
      }
    }
    .padding(16)
    .frame(maxWidth: .infinity)
    .background(
      RoundedRectangle(cornerRadius: 14, style: .continuous)
        .fill(Color.orange.opacity(0.1))
        .overlay(
          RoundedRectangle(cornerRadius: 14, style: .continuous)
            .stroke(Color.orange.opacity(0.3), lineWidth: 1)
        )
    )
  }

  private var followResourcesSection: some View {
    VStack(spacing: 12) {
      Text("💎 FOLLOW THE RESOURCES 💎")
        .font(.system(size: 14, weight: .black, design: .rounded))
        .tracking(2)
        .foregroundColor(Palette.accent.gold)

      VStack(spacing: 8) {
        resourceRow("🇳🇬 Nigeria", "OUTCRY", "Coltan, Lithium, Oil", true)
        resourceRow("🇵🇸 Palestine", "SILENCE", "No resources, just people", false)
        resourceRow("🇮🇶 Iraq", "INVASION", "Oil — 2nd largest in OPEC", true)
        resourceRow("🇸🇾 Syria", "SILENCE", "Pipeline routes", true)
      }

      VStack(spacing: 4) {
        Text("\"Protecting Christians\" = COVER STORY")
          .font(.system(size: 12, weight: .medium, design: .rounded))
          .foregroundColor(.white.opacity(0.8))
          .strikethrough(color: .red.opacity(0.5))

        Text("Extracting resources = REAL AGENDA")
          .font(.system(size: 13, weight: .black, design: .rounded))
          .foregroundColor(Palette.accent.gold)
      }
      .padding(.top, 8)

      Text("✨ #truth ✨")
        .font(.system(size: 16))
        .padding(.top, 4)
    }
    .padding(16)
    .frame(maxWidth: .infinity)
    .background(
      RoundedRectangle(cornerRadius: 14, style: .continuous)
        .fill(
          LinearGradient(
            colors: [Palette.accent.gold.opacity(0.12), Palette.accent.gold.opacity(0.05)],
            startPoint: .top,
            endPoint: .bottom
          )
        )
        .overlay(
          RoundedRectangle(cornerRadius: 14, style: .continuous)
            .stroke(Palette.accent.gold.opacity(0.4), lineWidth: 1)
        )
    )
  }

  private var zionismVsJudaismSection: some View {
    VStack(spacing: 16) {
      Text("⚠️ ZIONISM ≠ JUDAISM ⚠️")
        .font(.system(size: 16, weight: .black, design: .rounded))
        .tracking(2)
        .foregroundColor(.white)

      Text("THEY ARE NOT THE SAME")
        .font(.system(size: 12, weight: .bold, design: .rounded))
        .foregroundColor(.red)

      // Definitions
      VStack(spacing: 10) {
        definitionRow("📖", "Judaism", "A RELIGION", "3,000+ years old")
        definitionRow("👥", "Jewish People", "An ETHNICITY/CULTURE", "Thousands of years")
        definitionRow("🏛️", "Zionism", "A POLITICAL MOVEMENT", "Founded 1897")
        definitionRow("🇮🇱", "Israel", "A NATION-STATE", "Founded 1948")
      }

      Divider().background(Color.white.opacity(0.2))

      // The conflation
      VStack(alignment: .leading, spacing: 8) {
        Text("THE DELIBERATE CONFLATION:")
          .font(.system(size: 12, weight: .black, design: .rounded))
          .foregroundColor(.red)

        Text(
          "They've made these four things SEEM like one.\nSo criticism of the POLITICAL MOVEMENT\ngets labeled \"anti-Semitic.\""
        )
        .font(.system(size: 11, weight: .medium, design: .rounded))
        .foregroundColor(.white.opacity(0.9))
        .lineSpacing(4)

        Text("This silences criticism of:")
          .font(.system(size: 11, weight: .bold, design: .rounded))
          .foregroundColor(.white.opacity(0.8))
          .padding(.top, 4)

        VStack(alignment: .leading, spacing: 4) {
          silencedRow("Israeli government policy")
          silencedRow("Zionist political ideology")
          silencedRow("US funding ($3.8B/year)")
          silencedRow("Palestinian treatment")
          silencedRow("Bombing churches")
        }
      }
    }
    .padding(16)
    .frame(maxWidth: .infinity)
    .background(
      RoundedRectangle(cornerRadius: 14, style: .continuous)
        .fill(Color.white.opacity(0.05))
        .overlay(
          RoundedRectangle(cornerRadius: 14, style: .continuous)
            .stroke(Color.white.opacity(0.2), lineWidth: 1)
        )
    )
  }

  private func definitionRow(_ emoji: String, _ term: String, _ definition: String, _ age: String)
    -> some View
  {
    HStack(spacing: 10) {
      Text(emoji)
        .font(.system(size: 18))
        .frame(width: 28)

      VStack(alignment: .leading, spacing: 2) {
        HStack(spacing: 8) {
          Text(term)
            .font(.system(size: 13, weight: .bold, design: .rounded))
            .foregroundColor(.white)

          Text("=")
            .foregroundColor(.white.opacity(0.5))

          Text(definition)
            .font(.system(size: 12, weight: .medium, design: .rounded))
            .foregroundColor(.cyan)
        }

        Text(age)
          .font(.system(size: 10, weight: .medium, design: .rounded))
          .foregroundColor(.white.opacity(0.5))
      }

      Spacer()
    }
  }

  private func silencedRow(_ text: String) -> some View {
    HStack(spacing: 6) {
      Image(systemName: "xmark.circle.fill")
        .font(.system(size: 10))
        .foregroundColor(.red.opacity(0.7))

      Text(text)
        .font(.system(size: 10, weight: .medium, design: .rounded))
        .foregroundColor(.white.opacity(0.7))
    }
  }

  private var antiZionistJewsSection: some View {
    VStack(spacing: 12) {
      Text("✡️ ANTI-ZIONIST JEWS EXIST ✡️")
        .font(.system(size: 14, weight: .black, design: .rounded))
        .tracking(1)
        .foregroundColor(.cyan)

      VStack(alignment: .leading, spacing: 6) {
        antiZionistRow("Neturei Karta", "Orthodox Jews who oppose Zionism on religious grounds")
        antiZionistRow("Jewish Voice for Peace", "Progressive Jews against occupation")
        antiZionistRow("IfNotNow", "Jews opposing Israeli policy")
        antiZionistRow("Many Hasidic communities", "Believe Zionism violates Torah")
      }

      Text(
        "They protest. They speak out.\nBut mainstream media won't show them.\nBecause it breaks the narrative."
      )
      .font(.system(size: 11, weight: .medium, design: .rounded))
      .foregroundColor(.white.opacity(0.8))
      .multilineTextAlignment(.center)
      .lineSpacing(4)
    }
    .padding(16)
    .frame(maxWidth: .infinity)
    .background(
      RoundedRectangle(cornerRadius: 14, style: .continuous)
        .fill(Color.cyan.opacity(0.08))
        .overlay(
          RoundedRectangle(cornerRadius: 14, style: .continuous)
            .stroke(Color.cyan.opacity(0.25), lineWidth: 1)
        )
    )
  }

  private func antiZionistRow(_ name: String, _ description: String) -> some View {
    HStack(alignment: .top, spacing: 8) {
      Image(systemName: "checkmark.circle.fill")
        .font(.system(size: 12))
        .foregroundColor(.cyan)

      VStack(alignment: .leading, spacing: 2) {
        Text(name)
          .font(.system(size: 12, weight: .bold, design: .rounded))
          .foregroundColor(.white)

        Text(description)
          .font(.system(size: 10, weight: .medium, design: .rounded))
          .foregroundColor(.white.opacity(0.7))
      }
    }
  }

  private var silencingMechanismSection: some View {
    VStack(spacing: 12) {
      HStack {
        Image(systemName: "speaker.slash.fill")
          .foregroundColor(.red)
        Text("THE SILENCING MECHANISM")
          .font(.system(size: 12, weight: .black, design: .rounded))
          .tracking(1)
          .foregroundColor(.red)
      }

      VStack(alignment: .leading, spacing: 6) {
        mechanismRow("1", "Conflate Zionism with Judaism")
        mechanismRow("2", "Label ALL criticism as \"anti-Semitism\"")
        mechanismRow("3", "Cancel careers")
        mechanismRow("4", "Deplatform voices")
        mechanismRow("5", "Pass laws criminalizing boycotts (35+ states)")
        mechanismRow("6", "Silence campus protests")
        mechanismRow("7", "Control the narrative")
      }

      Divider().background(Color.white.opacity(0.2))

      VStack(spacing: 6) {
        Text("You can criticize ANY other political movement.")
          .font(.system(size: 11, weight: .medium, design: .rounded))
          .foregroundColor(.white.opacity(0.8))

        Text("But criticize THIS one? \"Anti-Semite.\"")
          .font(.system(size: 12, weight: .bold, design: .rounded))
          .foregroundColor(.red)

        Text("It's not about protecting Jewish people.\nIt's about protecting a POLITICAL AGENDA.")
          .font(.system(size: 11, weight: .bold, design: .rounded))
          .foregroundColor(.white)
          .multilineTextAlignment(.center)
          .lineSpacing(4)
          .padding(.top, 4)
      }

      // Final question
      VStack(spacing: 4) {
        Text("🤔")
          .font(.system(size: 24))

        Text(
          "What are they so afraid of people seeing\nthat they need this much machinery to hide it?"
        )
        .font(.system(size: 12, weight: .bold, design: .rounded))
        .foregroundColor(Palette.accent.gold)
        .multilineTextAlignment(.center)
        .lineSpacing(4)
      }
      .padding(.top, 8)
    }
    .padding(16)
    .frame(maxWidth: .infinity)
    .background(
      RoundedRectangle(cornerRadius: 14, style: .continuous)
        .fill(Color.red.opacity(0.08))
        .overlay(
          RoundedRectangle(cornerRadius: 14, style: .continuous)
            .stroke(Color.red.opacity(0.25), lineWidth: 1)
        )
    )
  }

  private func mechanismRow(_ number: String, _ text: String) -> some View {
    HStack(spacing: 8) {
      Text(number)
        .font(.system(size: 10, weight: .bold, design: .monospaced))
        .foregroundColor(.red)
        .frame(width: 16, height: 16)
        .background(Circle().fill(Color.red.opacity(0.2)))

      Text(text)
        .font(.system(size: 11, weight: .medium, design: .rounded))
        .foregroundColor(.white.opacity(0.9))
    }
  }

  private var christianZionismSection: some View {
    VStack(spacing: 16) {
      Text("🔥 THE SMOKING GUN 🔥")
        .font(.system(size: 16, weight: .black, design: .rounded))
        .tracking(2)
        .foregroundColor(.orange)

      Text("CHRISTIAN ZIONISM")
        .font(.system(size: 14, weight: .black, design: .rounded))
        .foregroundColor(.white)

      // The equation
      VStack(spacing: 8) {
        HStack(spacing: 8) {
          equationBox("CHRISTIANITY", "A Faith", "✝️", .purple)
          Text("+")
            .font(.system(size: 20, weight: .black))
            .foregroundColor(.white)
          equationBox("ZIONISM", "Political Movement", "🏛️", .blue)
        }

        Text("=")
          .font(.system(size: 24, weight: .black))
          .foregroundColor(.orange)

        VStack(spacing: 4) {
          Text("CHRISTIAN ZIONISM")
            .font(.system(size: 16, weight: .black, design: .rounded))
            .foregroundColor(.orange)

          Text("RELIGION + POLITICS FUSED")
            .font(.system(size: 12, weight: .bold, design: .rounded))
            .foregroundColor(.white)
        }
        .padding(12)
        .background(
          RoundedRectangle(cornerRadius: 10)
            .fill(Color.orange.opacity(0.2))
            .overlay(
              RoundedRectangle(cornerRadius: 10)
                .stroke(Color.orange.opacity(0.5), lineWidth: 2)
            )
        )
      }

      // The punchline
      VStack(spacing: 8) {
        Text("If \"separation of church and state\" was real...")
          .font(.system(size: 12, weight: .medium, design: .rounded))
          .foregroundColor(.white.opacity(0.8))

        Text("HOW CAN THIS EXIST?")
          .font(.system(size: 16, weight: .black, design: .rounded))
          .foregroundColor(.red)

        Text("😂😂😂")
          .font(.system(size: 28))

        Text("They literally GAVE IT AWAY")
          .font(.system(size: 14, weight: .black, design: .rounded))
          .foregroundColor(Palette.accent.gold)
      }
      .padding(.top, 8)

      // What it does
      VStack(alignment: .leading, spacing: 8) {
        Text("CHRISTIAN ZIONISM DOES:")
          .font(.system(size: 11, weight: .black, design: .rounded))
          .foregroundColor(.orange)

        czEffectRow("Uses FAITH to justify POLITICAL action")
        czEffectRow("Influences US foreign policy")
        czEffectRow("Justifies $3.8 BILLION annually to Israel")
        czEffectRow("Justifies Middle East wars")
        czEffectRow("Millions of evangelical voters")
        czEffectRow("CUFI, John Hagee, megachurch pastors")
      }
    }
    .padding(16)
    .frame(maxWidth: .infinity)
    .background(
      RoundedRectangle(cornerRadius: 14, style: .continuous)
        .fill(Color.orange.opacity(0.1))
        .overlay(
          RoundedRectangle(cornerRadius: 14, style: .continuous)
            .stroke(Color.orange.opacity(0.4), lineWidth: 2)
        )
    )
  }

  private func equationBox(_ title: String, _ subtitle: String, _ emoji: String, _ color: Color)
    -> some View
  {
    VStack(spacing: 4) {
      Text(emoji)
        .font(.system(size: 20))

      Text(title)
        .font(.system(size: 10, weight: .black, design: .rounded))
        .foregroundColor(color)

      Text(subtitle)
        .font(.system(size: 8, weight: .medium, design: .rounded))
        .foregroundColor(.white.opacity(0.6))
    }
    .padding(8)
    .background(
      RoundedRectangle(cornerRadius: 8)
        .fill(color.opacity(0.15))
    )
  }

  private func czEffectRow(_ text: String) -> some View {
    HStack(spacing: 6) {
      Image(systemName: "checkmark.circle.fill")
        .font(.system(size: 10))
        .foregroundColor(.orange)

      Text(text)
        .font(.system(size: 10, weight: .medium, design: .rounded))
        .foregroundColor(.white.opacity(0.9))
    }
  }

  private var secondComingSection: some View {
    VStack(spacing: 16) {
      Text("⏳ THE \"SECOND COMING\" DECEPTION ⏳")
        .font(.system(size: 14, weight: .black, design: .rounded))
        .tracking(1)
        .foregroundColor(.purple)

      // The waiting game
      VStack(spacing: 12) {
        Text("EVERY RELIGION TEACHES YOU TO WAIT:")
          .font(.system(size: 11, weight: .black, design: .rounded))
          .foregroundColor(.purple)

        VStack(spacing: 6) {
          waitingRow("✝️", "Christianity", "Wait for Jesus to return")
          waitingRow("✡️", "Judaism", "Wait for the Messiah")
          waitingRow("☪️", "Islam", "Wait for the Mahdi")
          waitingRow("🕉️", "Hinduism", "Wait for Kalki")
        }

        Text("Same pattern. Same control.\nKeep them WAITING. Keep them PASSIVE.")
          .font(.system(size: 11, weight: .bold, design: .rounded))
          .foregroundColor(.white)
          .multilineTextAlignment(.center)
      }

      Divider().background(Color.white.opacity(0.2))

      // While you wait
      VStack(spacing: 8) {
        Text("WHILE YOU WAIT:")
          .font(.system(size: 11, weight: .black, design: .rounded))
          .foregroundColor(.red)

        VStack(alignment: .leading, spacing: 4) {
          waitEffectRow("You don't awaken YOUR power")
          waitEffectRow("You don't activate YOUR pineal")
          waitEffectRow("You give power to institutions")
          waitEffectRow("You follow external authority")
          waitEffectRow("You fund their agendas")
          waitEffectRow("You stay asleep")
        }

        Text("Convenient, isn't it? 🫠")
          .font(.system(size: 13, weight: .bold, design: .rounded))
          .foregroundColor(.red)
      }

      Divider().background(Color.white.opacity(0.2))

      // The real truth
      VStack(spacing: 12) {
        Text("💡 THE REAL TRUTH 💡")
          .font(.system(size: 12, weight: .black, design: .rounded))
          .foregroundColor(Palette.accent.gold)

        Text("\"The Kingdom of Heaven is WITHIN you.\"")
          .font(.system(size: 14, weight: .bold, design: .serif))
          .foregroundColor(.white)
          .italic()

        Text("— Luke 17:21")
          .font(.system(size: 10, weight: .medium))
          .foregroundColor(.white.opacity(0.5))

        VStack(spacing: 6) {
          Text("The \"Christ\" is not a person coming from the sky.")
            .font(.system(size: 11, weight: .medium, design: .rounded))
            .foregroundColor(.white.opacity(0.9))

          Text(
            "It's the CHRISTOS (anointing oil) that rises\nup your 33 vertebrae (Jesus died at 33)\nto anoint your PINEAL GLAND."
          )
          .font(.system(size: 11, weight: .bold, design: .rounded))
          .foregroundColor(Palette.accent.gold)
          .multilineTextAlignment(.center)
          .lineSpacing(4)

          Text(
            "The \"Second Coming\" is YOUR AWAKENING.\nIt happens WITHIN. Not in the clouds.\nNot someday. NOW."
          )
          .font(.system(size: 12, weight: .black, design: .rounded))
          .foregroundColor(.white)
          .multilineTextAlignment(.center)
          .lineSpacing(4)
        }
      }
    }
    .padding(16)
    .frame(maxWidth: .infinity)
    .background(
      RoundedRectangle(cornerRadius: 14, style: .continuous)
        .fill(
          LinearGradient(
            colors: [Color.purple.opacity(0.12), Color.purple.opacity(0.05)],
            startPoint: .top,
            endPoint: .bottom
          )
        )
        .overlay(
          RoundedRectangle(cornerRadius: 14, style: .continuous)
            .stroke(Color.purple.opacity(0.4), lineWidth: 1)
        )
    )
  }

  private func waitingRow(_ emoji: String, _ religion: String, _ waiting: String) -> some View {
    HStack(spacing: 8) {
      Text(emoji)
        .font(.system(size: 14))
        .frame(width: 20)

      Text(religion)
        .font(.system(size: 11, weight: .bold, design: .rounded))
        .foregroundColor(.white)
        .frame(width: 70, alignment: .leading)

      Text(waiting)
        .font(.system(size: 10, weight: .medium, design: .rounded))
        .foregroundColor(.white.opacity(0.7))

      Spacer()
    }
  }

  private func waitEffectRow(_ text: String) -> some View {
    HStack(spacing: 6) {
      Image(systemName: "xmark.circle.fill")
        .font(.system(size: 10))
        .foregroundColor(.red.opacity(0.7))

      Text(text)
        .font(.system(size: 10, weight: .medium, design: .rounded))
        .foregroundColor(.white.opacity(0.8))
    }
  }

  private var churchStateNeverSeparateSection: some View {
    VStack(spacing: 16) {
      Text("🏛️ CHURCH & STATE: NEVER SEPARATE 🏛️")
        .font(.system(size: 13, weight: .black, design: .rounded))
        .tracking(1)
        .foregroundColor(.cyan)

      Text("\"Separation of Church and State\"")
        .font(.system(size: 14, weight: .bold, design: .rounded))
        .foregroundColor(.white)
        .strikethrough(color: .red)

      Text("= THE COVER STORY")
        .font(.system(size: 14, weight: .black, design: .rounded))
        .foregroundColor(.red)

      // Proof
      VStack(alignment: .leading, spacing: 8) {
        Text("PROOF THEY WORK TOGETHER:")
          .font(.system(size: 11, weight: .black, design: .rounded))
          .foregroundColor(.cyan)

        proofRow("1", "Christian Zionism exists", "Religion + Politics FUSED")
        proofRow("2", "Politicians invoke God constantly", "\"God bless America\"")
        proofRow("3", "Tax exemptions for churches", "$80+ BILLION annually")
        proofRow("4", "Religious lobbying legal", "Billions influencing policy")
        proofRow("5", "\"In God We Trust\" on money", "Since 1956")
        proofRow("6", "Prayer breakfasts", "Every president attends")
        proofRow("7", "Religious arguments in law", "Abortion, marriage, etc.")
        proofRow("8", "Wars justified by religion", "\"God is on our side\"")
      }

      // Final truth
      VStack(spacing: 8) {
        Text("They work TOGETHER.")
          .font(.system(size: 14, weight: .bold, design: .rounded))
          .foregroundColor(.white)

        Text("Always have.")
          .font(.system(size: 14, weight: .bold, design: .rounded))
          .foregroundColor(.white)

        Text("😂🫠😂")
          .font(.system(size: 28))

        Text("They literally told you with CHRISTIAN ZIONISM")
          .font(.system(size: 12, weight: .black, design: .rounded))
          .foregroundColor(Palette.accent.gold)
          .multilineTextAlignment(.center)
      }
      .padding(.top, 8)
    }
    .padding(16)
    .frame(maxWidth: .infinity)
    .background(
      RoundedRectangle(cornerRadius: 14, style: .continuous)
        .fill(Color.cyan.opacity(0.08))
        .overlay(
          RoundedRectangle(cornerRadius: 14, style: .continuous)
            .stroke(Color.cyan.opacity(0.3), lineWidth: 1)
        )
    )
  }

  private func proofRow(_ number: String, _ fact: String, _ detail: String) -> some View {
    HStack(alignment: .top, spacing: 8) {
      Text(number)
        .font(.system(size: 9, weight: .bold, design: .monospaced))
        .foregroundColor(.cyan)
        .frame(width: 14, height: 14)
        .background(Circle().fill(Color.cyan.opacity(0.2)))

      VStack(alignment: .leading, spacing: 2) {
        Text(fact)
          .font(.system(size: 11, weight: .bold, design: .rounded))
          .foregroundColor(.white)

        Text(detail)
          .font(.system(size: 9, weight: .medium, design: .rounded))
          .foregroundColor(.cyan.opacity(0.9))
      }
    }
  }

  private func resourceRow(
    _ country: String, _ response: String, _ resources: String, _ hasResources: Bool
  ) -> some View {
    HStack {
      Text(country)
        .font(.system(size: 12, weight: .bold, design: .rounded))
        .foregroundColor(.white)
        .frame(width: 80, alignment: .leading)

      Text(response)
        .font(.system(size: 10, weight: .black, design: .rounded))
        .foregroundColor(hasResources ? .green : .red)
        .frame(width: 60)

      Text(resources)
        .font(.system(size: 10, weight: .medium, design: .rounded))
        .foregroundColor(hasResources ? Palette.accent.gold : .gray)

      Spacer()
    }
  }

  // MARK: - Demiurge Content (The False God)

  private var demiurgeContent: some View {
    VStack(alignment: .leading, spacing: 20) {
      // Header
      HStack(spacing: 10) {
        Image(systemName: "exclamationmark.octagon.fill")
          .foregroundColor(.red)

        Text("THE FALSE GOD")
          .font(.system(size: 13, weight: .black, design: .rounded))
          .tracking(2)
          .foregroundColor(.red)
      }

      Text("What if the \"God\" of the Old Testament isn't who they told you?")
        .font(.system(size: 13, weight: .medium, design: .rounded))
        .foregroundColor(.white.opacity(0.8))

      // Gnostic Warning
      gnosticWarningSection

      // First 4 Commandments
      firstFourCommandmentsSection

      // Garden of Eden Reread
      gardenOfEdenSection

      // Athena vs Demiurge
      athenaVsDemiurgeSection

      // Anime Truth
      animeTruthSection
    }
    .padding(16)
    .background(cardBackground)
  }

  private var gnosticWarningSection: some View {
    VStack(spacing: 12) {
      Text("📜 THE GNOSTICS KNEW 📜")
        .font(.system(size: 14, weight: .black, design: .rounded))
        .tracking(2)
        .foregroundColor(.purple)

      VStack(alignment: .leading, spacing: 8) {
        Text("The \"God\" of the Old Testament is NOT the true Source.")
          .font(.system(size: 12, weight: .bold, design: .rounded))
          .foregroundColor(.white)

        Text("They called this false creator god the DEMIURGE")
          .font(.system(size: 12, weight: .bold, design: .rounded))
          .foregroundColor(.purple)

        Text("(Also called Yaldabaoth, Saklas, Samael)")
          .font(.system(size: 10, weight: .medium, design: .rounded))
          .foregroundColor(.white.opacity(0.6))
      }

      // Traits
      VStack(alignment: .leading, spacing: 6) {
        Text("THE DEMIURGE:")
          .font(.system(size: 11, weight: .black, design: .rounded))
          .foregroundColor(.red)

        demiurgeTraitRow("Demands worship", "\"I am a jealous God\"")
        demiurgeTraitRow("Punishes disobedience", "Floods, plagues, death")
        demiurgeTraitRow("Keeps you ignorant", "\"Don't eat from tree of KNOWLEDGE\"")
        demiurgeTraitRow("Works through fear", "Eternal damnation threats")
        demiurgeTraitRow("Claims to be the only God", "\"No gods before ME\"")
      }

      Divider().background(Color.white.opacity(0.2))

      VStack(spacing: 4) {
        Text("The TRUE Source doesn't need worship.")
          .font(.system(size: 12, weight: .medium, design: .rounded))
          .foregroundColor(.white.opacity(0.9))

        Text("Infinite love doesn't demand obedience.")
          .font(.system(size: 12, weight: .medium, design: .rounded))
          .foregroundColor(.white.opacity(0.9))

        Text("The real Creator doesn't threaten eternal punishment.")
          .font(.system(size: 12, weight: .bold, design: .rounded))
          .foregroundColor(Palette.accent.gold)
      }
    }
    .padding(16)
    .frame(maxWidth: .infinity)
    .background(
      RoundedRectangle(cornerRadius: 14, style: .continuous)
        .fill(Color.purple.opacity(0.1))
        .overlay(
          RoundedRectangle(cornerRadius: 14, style: .continuous)
            .stroke(Color.purple.opacity(0.3), lineWidth: 1)
        )
    )
  }

  private func demiurgeTraitRow(_ trait: String, _ example: String) -> some View {
    HStack(alignment: .top, spacing: 8) {
      Image(systemName: "xmark.circle.fill")
        .font(.system(size: 10))
        .foregroundColor(.red)

      VStack(alignment: .leading, spacing: 2) {
        Text(trait)
          .font(.system(size: 11, weight: .bold, design: .rounded))
          .foregroundColor(.white)

        Text(example)
          .font(.system(size: 9, weight: .medium, design: .rounded))
          .foregroundColor(.red.opacity(0.8))
      }
    }
  }

  private var firstFourCommandmentsSection: some View {
    VStack(spacing: 12) {
      Text("⚠️ THE FIRST 4 COMMANDMENTS ⚠️")
        .font(.system(size: 14, weight: .black, design: .rounded))
        .tracking(1)
        .foregroundColor(.orange)

      Text("THE TELL")
        .font(.system(size: 12, weight: .bold, design: .rounded))
        .foregroundColor(.white.opacity(0.7))

      VStack(spacing: 8) {
        commandmentRow("1", "\"I am the Lord thy God\"", "Worship ME")
        commandmentRow("2", "\"No other gods before ME\"", "I'm JEALOUS")
        commandmentRow("3", "\"Don't take MY name in vain\"", "Respect ME")
        commandmentRow("4", "\"Keep MY sabbath\"", "Obey ME")
      }

      VStack(spacing: 8) {
        Text("The first FOUR commandments are about HIM.")
          .font(.system(size: 12, weight: .bold, design: .rounded))
          .foregroundColor(.white)

        Text("A self-centered, jealous, demanding entity.")
          .font(.system(size: 12, weight: .bold, design: .rounded))
          .foregroundColor(.orange)

        VStack(spacing: 4) {
          Text("Does that sound like infinite, unconditional love?")
            .font(.system(size: 11, weight: .medium, design: .rounded))
            .foregroundColor(.white.opacity(0.8))

          Text("Or does that sound like a narcissistic control freak?")
            .font(.system(size: 12, weight: .bold, design: .rounded))
            .foregroundColor(.red)
        }
        .padding(.top, 4)
      }

      Text("😂😂😂")
        .font(.system(size: 24))
    }
    .padding(16)
    .frame(maxWidth: .infinity)
    .background(
      RoundedRectangle(cornerRadius: 14, style: .continuous)
        .fill(Color.orange.opacity(0.1))
        .overlay(
          RoundedRectangle(cornerRadius: 14, style: .continuous)
            .stroke(Color.orange.opacity(0.4), lineWidth: 1)
        )
    )
  }

  private func commandmentRow(_ number: String, _ commandment: String, _ meaning: String)
    -> some View
  {
    HStack(spacing: 8) {
      Text(number)
        .font(.system(size: 12, weight: .black, design: .monospaced))
        .foregroundColor(.orange)
        .frame(width: 20)

      Text(commandment)
        .font(.system(size: 11, weight: .medium, design: .rounded))
        .foregroundColor(.white.opacity(0.9))

      Spacer()

      Text("→ \(meaning)")
        .font(.system(size: 10, weight: .bold, design: .rounded))
        .foregroundColor(.orange)
    }
  }

  private var gardenOfEdenSection: some View {
    VStack(spacing: 12) {
      Text("🍎 GARDEN OF EDEN — REREAD 🍎")
        .font(.system(size: 14, weight: .black, design: .rounded))
        .tracking(1)
        .foregroundColor(.green)

      VStack(alignment: .leading, spacing: 10) {
        edenRow("\"God\" said:", "Don't eat from the tree of KNOWLEDGE", .red)
        edenRow("Serpent said:", "Eat it. You'll be like gods, KNOWING", .green)
        edenRow("They ate:", "They gained KNOWLEDGE", .cyan)
        edenRow("\"God\" response:", "Punished them. Cast them out.", .red)
      }

      Divider().background(Color.white.opacity(0.2))

      VStack(spacing: 8) {
        Text("Wait...")
          .font(.system(size: 14, weight: .bold, design: .rounded))
          .foregroundColor(.white)

        VStack(spacing: 4) {
          Text("The \"good guy\" wanted them IGNORANT?")
            .font(.system(size: 12, weight: .medium, design: .rounded))
            .foregroundColor(.white.opacity(0.9))

          Text("The \"bad guy\" wanted them to have KNOWLEDGE?")
            .font(.system(size: 12, weight: .medium, design: .rounded))
            .foregroundColor(.white.opacity(0.9))
        }

        Text("🤔")
          .font(.system(size: 28))

        VStack(spacing: 4) {
          Text("What if the story is INVERTED?")
            .font(.system(size: 13, weight: .bold, design: .rounded))
            .foregroundColor(.green)

          Text("What if the Demiurge wanted obedient slaves?")
            .font(.system(size: 12, weight: .medium, design: .rounded))
            .foregroundColor(.white)

          Text("What if the serpent was the LIBERATOR?")
            .font(.system(size: 13, weight: .black, design: .rounded))
            .foregroundColor(Palette.accent.gold)
        }

        Text("The Gnostics believed exactly this.\nThat's why the Church DESTROYED them.")
          .font(.system(size: 11, weight: .bold, design: .rounded))
          .foregroundColor(.red)
          .multilineTextAlignment(.center)
          .padding(.top, 4)
      }
    }
    .padding(16)
    .frame(maxWidth: .infinity)
    .background(
      RoundedRectangle(cornerRadius: 14, style: .continuous)
        .fill(Color.green.opacity(0.08))
        .overlay(
          RoundedRectangle(cornerRadius: 14, style: .continuous)
            .stroke(Color.green.opacity(0.3), lineWidth: 1)
        )
    )
  }

  private func edenRow(_ speaker: String, _ quote: String, _ color: Color) -> some View {
    VStack(alignment: .leading, spacing: 2) {
      Text(speaker)
        .font(.system(size: 10, weight: .bold, design: .rounded))
        .foregroundColor(color)

      Text(quote)
        .font(.system(size: 11, weight: .medium, design: .rounded))
        .foregroundColor(.white.opacity(0.9))
    }
  }

  private var athenaVsDemiurgeSection: some View {
    VStack(spacing: 12) {
      Text("🕊️ ATHENA vs THE DEMIURGE 🕊️")
        .font(.system(size: 14, weight: .black, design: .rounded))
        .tracking(1)
        .foregroundColor(.cyan)

      HStack(spacing: 16) {
        // Athena
        VStack(spacing: 8) {
          Text("🕊️")
            .font(.system(size: 28))

          Text("ATHENA")
            .font(.system(size: 12, weight: .black, design: .rounded))
            .foregroundColor(.cyan)

          VStack(alignment: .leading, spacing: 4) {
            athenaTraitRow("Goddess of WISDOM")
            athenaTraitRow("Wanted peace")
            athenaTraitRow("Never demanded worship")
            athenaTraitRow("Helped heroes awaken")
          }
        }
        .frame(maxWidth: .infinity)

        Text("VS")
          .font(.system(size: 12, weight: .black))
          .foregroundColor(.white.opacity(0.5))

        // Demiurge
        VStack(spacing: 8) {
          Text("👁️")
            .font(.system(size: 28))

          Text("OT \"GOD\"")
            .font(.system(size: 12, weight: .black, design: .rounded))
            .foregroundColor(.red)

          VStack(alignment: .leading, spacing: 4) {
            demiurgeVsRow("Demanded worship")
            demiurgeVsRow("Punished with death")
            demiurgeVsRow("Jealous & wrathful")
            demiurgeVsRow("Kept humans ignorant")
          }
        }
        .frame(maxWidth: .infinity)
      }

      VStack(spacing: 4) {
        Text("One sounds like Source.")
          .font(.system(size: 12, weight: .medium, design: .rounded))
          .foregroundColor(.white.opacity(0.9))

        Text("One sounds like a tyrant.")
          .font(.system(size: 12, weight: .medium, design: .rounded))
          .foregroundColor(.white.opacity(0.9))

        Text("Which one does your church worship?")
          .font(.system(size: 13, weight: .black, design: .rounded))
          .foregroundColor(Palette.accent.gold)
      }
      .padding(.top, 8)
    }
    .padding(16)
    .frame(maxWidth: .infinity)
    .background(
      RoundedRectangle(cornerRadius: 14, style: .continuous)
        .fill(Color.cyan.opacity(0.08))
        .overlay(
          RoundedRectangle(cornerRadius: 14, style: .continuous)
            .stroke(Color.cyan.opacity(0.3), lineWidth: 1)
        )
    )
  }

  private func athenaTraitRow(_ text: String) -> some View {
    HStack(spacing: 4) {
      Image(systemName: "checkmark.circle.fill")
        .font(.system(size: 8))
        .foregroundColor(.cyan)

      Text(text)
        .font(.system(size: 9, weight: .medium, design: .rounded))
        .foregroundColor(.white.opacity(0.9))
    }
  }

  private func demiurgeVsRow(_ text: String) -> some View {
    HStack(spacing: 4) {
      Image(systemName: "xmark.circle.fill")
        .font(.system(size: 8))
        .foregroundColor(.red)

      Text(text)
        .font(.system(size: 9, weight: .medium, design: .rounded))
        .foregroundColor(.white.opacity(0.9))
    }
  }

  private var animeTruthSection: some View {
    VStack(spacing: 20) {
      Text("🌟 TRUTH HIDDEN IN ANIME 🌟")
        .font(.system(size: 14, weight: .black, design: .rounded))
        .tracking(1)
        .foregroundColor(Palette.accent.gold)

      // Saint Seiya Header
      VStack(spacing: 8) {
        HStack {
          Text("⚔️")
            .font(.system(size: 24))
          Text("CABALLEROS DEL ZODIACO")
            .font(.system(size: 12, weight: .black, design: .rounded))
            .foregroundColor(.white)
        }

        Text("(Saint Seiya)")
          .font(.system(size: 10, weight: .medium))
          .foregroundColor(.white.opacity(0.5))
      }

      // Cosmos Within Visual
      VStack(spacing: 8) {
        AldebaranCosmosView()
          .scaleEffect(0.8)
          .frame(height: 180)
      }

      // Gemini Duality Visual
      VStack(spacing: 8) {
        Text("THE CORRUPTION FROM WITHIN")
          .font(.system(size: 10, weight: .black, design: .rounded))
          .foregroundColor(.red)

        GeminiDualityView()
          .scaleEffect(0.9)
      }

      // Imposter Pope Visual
      VStack(spacing: 8) {
        Text("THE HIJACKED INSTITUTION")
          .font(.system(size: 10, weight: .black, design: .rounded))
          .foregroundColor(.orange)

        ImposterPopeView()
          .scaleEffect(0.85)
      }

      // Sagittarius Saves Athena
      VStack(spacing: 8) {
        Text("TRUTH-SEEKER SAVES DIVINE FEMININE")
          .font(.system(size: 10, weight: .black, design: .rounded))
          .foregroundColor(.cyan)

        SagittariusSavesAthenaView()
          .scaleEffect(0.85)
      }

      // The plot allegory text
      VStack(spacing: 8) {
        Text("IT'S LITERALLY WHAT HAPPENED TO THE CHURCH:")
          .font(.system(size: 10, weight: .black, design: .rounded))
          .foregroundColor(.red)

        VStack(alignment: .leading, spacing: 4) {
          meaningRow("Original teachings (Pope) were GOOD")
          meaningRow("They were MURDERED and REPLACED")
          meaningRow("Institution HIJACKED from within")
          meaningRow("People followed the FRAUD unknowingly")
          meaningRow("Truth-seekers called \"traitors\"")
          meaningRow("Sagittarius saved the divine feminine")
        }
      }
      .padding(12)
      .background(
        RoundedRectangle(cornerRadius: 10)
          .fill(Color.red.opacity(0.1))
      )

      Divider().background(Color.white.opacity(0.2))

      // Other anime
      VStack(spacing: 8) {
        Text("OTHER ANIME THAT TOLD YOU TRUTH:")
          .font(.system(size: 11, weight: .black, design: .rounded))
          .foregroundColor(Palette.accent.gold)

        VStack(alignment: .leading, spacing: 6) {
          otherAnimeRow(
            "🐉", "DRAGON BALL Z", "7 Dragon Balls = 7 chakras, Super Saiyan = Kundalini")
          otherAnimeRow(
            "🍥", "NARUTO", "Chakra system, Third Eye (Sharingan), Inner demon integration")
          otherAnimeRow("🎌", "EVANGELION", "Collective consciousness, Shadow government")
        }
      }

      // Why Latin America
      VStack(spacing: 8) {
        Text("🇸🇻")
          .font(.system(size: 28))

        Text("You watched this in El Salvador\nbefore the machine could reach you.")
          .font(.system(size: 11, weight: .medium, design: .rounded))
          .foregroundColor(.white.opacity(0.9))
          .multilineTextAlignment(.center)

        Text(
          "Saga killed the Pope and took over.\nThe knights followed an imposter.\nAiolos saved the truth and died for it.\nAldebaran said \"explode the cosmos WITHIN.\""
        )
        .font(.system(size: 11, weight: .bold, design: .rounded))
        .foregroundColor(Palette.accent.gold)
        .multilineTextAlignment(.center)
        .lineSpacing(4)

        Text("You were RIGHT. You were always right.\nYou just didn't have the vocabulary yet.")
          .font(.system(size: 12, weight: .black, design: .rounded))
          .foregroundColor(.white)
          .multilineTextAlignment(.center)

        Text("Now you do. 👁️🔥")
          .font(.system(size: 14, weight: .black, design: .rounded))
          .foregroundColor(Palette.accent.gold)
      }
    }
    .padding(16)
    .frame(maxWidth: .infinity)
    .background(
      RoundedRectangle(cornerRadius: 14, style: .continuous)
        .fill(
          LinearGradient(
            colors: [Palette.accent.gold.opacity(0.12), Palette.accent.gold.opacity(0.05)],
            startPoint: .top,
            endPoint: .bottom
          )
        )
        .overlay(
          RoundedRectangle(cornerRadius: 14, style: .continuous)
            .stroke(Palette.accent.gold.opacity(0.4), lineWidth: 1)
        )
    )
  }

  private func meaningRow(_ text: String) -> some View {
    HStack(spacing: 6) {
      Image(systemName: "checkmark.circle.fill")
        .font(.system(size: 8))
        .foregroundColor(.red)

      Text(text)
        .font(.system(size: 9, weight: .medium, design: .rounded))
        .foregroundColor(.white.opacity(0.9))
    }
  }

  private func otherAnimeRow(_ emoji: String, _ name: String, _ truth: String) -> some View {
    HStack(alignment: .top, spacing: 8) {
      Text(emoji)
        .font(.system(size: 14))

      VStack(alignment: .leading, spacing: 2) {
        Text(name)
          .font(.system(size: 10, weight: .bold, design: .rounded))
          .foregroundColor(.white)

        Text(truth)
          .font(.system(size: 9, weight: .medium, design: .rounded))
          .foregroundColor(.white.opacity(0.7))
      }
    }
  }

  // MARK: - 12 Days Timeline Content

  private var timelineContent: some View {
    VStack(alignment: .leading, spacing: 16) {
      // Header
      HStack(spacing: 10) {
        Image(systemName: "clock.badge.exclamationmark.fill")
          .foregroundColor(.orange)

        Text("THE 12 DAYS OF SILENCE")
          .font(.system(size: 13, weight: .black, design: .rounded))
          .tracking(2)
          .foregroundColor(.orange)
      }

      Text(
        "When the Epstein files dropped, the Vatican went SILENT. Then suddenly... they had something to say."
      )
      .font(.system(size: 13, weight: .medium, design: .rounded))
      .foregroundColor(.white.opacity(0.8))

      // Timeline events
      VStack(spacing: 0) {
        ForEach(
          Array(PatternRecognitionEvent.epsteinVaticanTimeline.enumerated()), id: \.element.id
        ) { index, event in
          timelineEvent(
            event, isLast: index == PatternRecognitionEvent.epsteinVaticanTimeline.count - 1)
        }
      }

      // Question callout
      questionCallout
    }
    .padding(16)
    .background(cardBackground)
  }

  private func timelineEvent(_ event: PatternRecognitionEvent, isLast: Bool) -> some View {
    HStack(alignment: .top, spacing: 12) {
      // Timeline line
      VStack(spacing: 0) {
        Circle()
          .fill(event.date == "Pattern" ? Color.red : Color.orange)
          .frame(width: 12, height: 12)

        if !isLast {
          Rectangle()
            .fill(Color.orange.opacity(0.3))
            .frame(width: 2)
            .frame(minHeight: 60)
        }
      }

      // Content
      VStack(alignment: .leading, spacing: 6) {
        HStack {
          Text(event.date)
            .font(.system(size: 12, weight: .bold, design: .monospaced))
            .foregroundColor(event.date == "Pattern" ? .red : .orange)

          Spacer()

          Image(systemName: event.icon)
            .font(.system(size: 14))
            .foregroundColor(.orange.opacity(0.7))
        }

        Text(event.event)
          .font(.system(size: 14, weight: .bold, design: .rounded))
          .foregroundColor(.white)

        Text(event.significance)
          .font(.system(size: 12, weight: .medium, design: .rounded))
          .foregroundColor(.white.opacity(0.7))
          .lineLimit(4)
          .fixedSize(horizontal: false, vertical: true)
      }
      .padding(.bottom, isLast ? 0 : 16)
    }
  }

  private var questionCallout: some View {
    VStack(spacing: 8) {
      Text("🤔")
        .font(.system(size: 28))

      Text("Why 12 days of silence on child trafficking... but instant response on politics?")
        .font(.system(size: 13, weight: .bold, design: .rounded))
        .foregroundColor(.orange)
        .multilineTextAlignment(.center)
    }
    .padding(16)
    .frame(maxWidth: .infinity)
    .background(
      RoundedRectangle(cornerRadius: 12, style: .continuous)
        .fill(Color.orange.opacity(0.15))
        .overlay(
          RoundedRectangle(cornerRadius: 12, style: .continuous)
            .stroke(Color.orange.opacity(0.3), lineWidth: 1)
        )
    )
  }

  // MARK: - Parallels Content

  private var parallelsContent: some View {
    VStack(alignment: .leading, spacing: 16) {
      // Header
      HStack(spacing: 10) {
        Image(systemName: "arrow.left.arrow.right")
          .foregroundColor(.cyan)

        Text("1492 → 2026")
          .font(.system(size: 13, weight: .black, design: .rounded))
          .tracking(2)
          .foregroundColor(.cyan)
      }

      Text("Same playbook. Different century. The tactics evolve but the goal remains: CONTROL.")
        .font(.system(size: 13, weight: .medium, design: .rounded))
        .foregroundColor(.white.opacity(0.8))

      // Columbus trafficking callout
      columbusTraffickingSection

      // The only difference
      theOnlyDifferenceSection

      // Parallels
      ForEach(HistoricalParallel.colonizationToNow) { parallel in
        parallelRow(parallel)
      }
    }
    .padding(16)
    .background(cardBackground)
  }

  private var columbusTraffickingSection: some View {
    VStack(spacing: 12) {
      HStack {
        Image(systemName: "exclamationmark.triangle.fill")
          .foregroundColor(.red)
        Text("DOCUMENTED HISTORY")
          .font(.system(size: 11, weight: .black, design: .rounded))
          .tracking(2)
          .foregroundColor(.red)
      }

      Text("COLUMBUS: THE FIRST ELITE TRAFFICKER")
        .font(.system(size: 14, weight: .black, design: .rounded))
        .foregroundColor(.white)

      VStack(alignment: .leading, spacing: 8) {
        Text("In Columbus's own letters, he wrote:")
          .font(.system(size: 12, weight: .medium, design: .rounded))
          .foregroundColor(.white.opacity(0.7))

        Text("\"Girls from 9-10 are in demand...\"")
          .font(.system(size: 13, weight: .bold, design: .serif))
          .foregroundColor(.red)
          .italic()
          .padding(.horizontal, 12)

        Text("Taíno girls. Trafficked. Documented.\nTheological scholars have confirmed this.")
          .font(.system(size: 12, weight: .medium, design: .rounded))
          .foregroundColor(.white.opacity(0.8))
          .multilineTextAlignment(.center)
      }

      // The parallel
      HStack(spacing: 12) {
        VStack(spacing: 4) {
          Text("1492")
            .font(.system(size: 11, weight: .bold, design: .monospaced))
            .foregroundColor(.gray)
          Text("Vatican blessed\nhis voyages")
            .font(.system(size: 10, weight: .medium))
            .foregroundColor(.white.opacity(0.6))
            .multilineTextAlignment(.center)
          Text("SILENCE")
            .font(.system(size: 12, weight: .black))
            .foregroundColor(.red)
        }

        Image(systemName: "equal")
          .font(.system(size: 20, weight: .bold))
          .foregroundColor(.red)

        VStack(spacing: 4) {
          Text("2026")
            .font(.system(size: 11, weight: .bold, design: .monospaced))
            .foregroundColor(.cyan)
          Text("Vatican Bank in\nEpstein files")
            .font(.system(size: 10, weight: .medium))
            .foregroundColor(.white.opacity(0.6))
            .multilineTextAlignment(.center)
          Text("12 DAYS SILENCE")
            .font(.system(size: 12, weight: .black))
            .foregroundColor(.red)
        }
      }
      .padding(.top, 8)

      Text("500+ years later. SAME PATTERN. SAME SILENCE.")
        .font(.system(size: 12, weight: .bold, design: .rounded))
        .foregroundColor(.orange)
        .padding(.top, 4)
    }
    .padding(16)
    .frame(maxWidth: .infinity)
    .background(
      RoundedRectangle(cornerRadius: 14, style: .continuous)
        .fill(Color.red.opacity(0.12))
        .overlay(
          RoundedRectangle(cornerRadius: 14, style: .continuous)
            .stroke(Color.red.opacity(0.4), lineWidth: 2)
        )
    )
  }

  private var theOnlyDifferenceSection: some View {
    VStack(spacing: 16) {
      Text("⚡ THE ONLY DIFFERENCE ⚡")
        .font(.system(size: 14, weight: .black, design: .rounded))
        .tracking(2)
        .foregroundColor(Palette.accent.gold)

      HStack(spacing: 16) {
        // 1492
        VStack(spacing: 8) {
          Text("1492")
            .font(.system(size: 16, weight: .black, design: .monospaced))
            .foregroundColor(.gray)

          Image(systemName: "sailboat.fill")
            .font(.system(size: 28))
            .foregroundColor(.gray)

          VStack(spacing: 4) {
            Text("Info by SHIP")
              .font(.system(size: 11, weight: .bold))
              .foregroundColor(.white)
            Text("Months to cross")
              .font(.system(size: 9, weight: .medium))
              .foregroundColor(.white.opacity(0.6))
            Text("Easy to hide")
              .font(.system(size: 9, weight: .medium))
              .foregroundColor(.white.opacity(0.6))
          }
        }
        .frame(maxWidth: .infinity)

        // VS
        VStack {
          Text("VS")
            .font(.system(size: 12, weight: .black))
            .foregroundColor(.white.opacity(0.5))
        }

        // 2026
        VStack(spacing: 8) {
          Text("2026")
            .font(.system(size: 16, weight: .black, design: .monospaced))
            .foregroundColor(Palette.accent.gold)

          Image(systemName: "bolt.fill")
            .font(.system(size: 28))
            .foregroundColor(Palette.accent.gold)

          VStack(spacing: 4) {
            Text("Info at LIGHT SPEED")
              .font(.system(size: 11, weight: .bold))
              .foregroundColor(.white)
            Text("Seconds to cross")
              .font(.system(size: 9, weight: .medium))
              .foregroundColor(.white.opacity(0.6))
            Text("IMPOSSIBLE to hide")
              .font(.system(size: 9, weight: .bold))
              .foregroundColor(Palette.accent.gold)
          }
        }
        .frame(maxWidth: .infinity)
      }

      VStack(spacing: 6) {
        Text("The crimes are the SAME.")
          .font(.system(size: 13, weight: .medium, design: .rounded))
          .foregroundColor(.white.opacity(0.8))

        Text("Child trafficking. Cover-ups. Silence.")
          .font(.system(size: 13, weight: .bold, design: .rounded))
          .foregroundColor(.red)

        Text("NOW WE CAN SEE IT IN REAL TIME.")
          .font(.system(size: 14, weight: .black, design: .rounded))
          .foregroundColor(Palette.accent.gold)
          .padding(.top, 4)

        Text("The internet broke their playbook.\nAwakening is inevitable.")
          .font(.system(size: 12, weight: .medium, design: .rounded))
          .foregroundColor(.white.opacity(0.9))
          .multilineTextAlignment(.center)
          .padding(.top, 4)
      }
    }
    .padding(16)
    .frame(maxWidth: .infinity)
    .background(
      RoundedRectangle(cornerRadius: 14, style: .continuous)
        .fill(
          LinearGradient(
            colors: [Palette.accent.gold.opacity(0.12), Palette.accent.gold.opacity(0.05)],
            startPoint: .top,
            endPoint: .bottom
          )
        )
        .overlay(
          RoundedRectangle(cornerRadius: 14, style: .continuous)
            .stroke(Palette.accent.gold.opacity(0.4), lineWidth: 1)
        )
    )
  }

  private func parallelRow(_ parallel: HistoricalParallel) -> some View {
    VStack(alignment: .leading, spacing: 10) {
      // Then
      HStack(alignment: .top, spacing: 8) {
        Text(parallel.thenYear)
          .font(.system(size: 11, weight: .bold, design: .monospaced))
          .foregroundColor(.gray)
          .frame(width: 40, alignment: .leading)

        Text(parallel.thenEvent)
          .font(.system(size: 12, weight: .medium, design: .rounded))
          .foregroundColor(.white.opacity(0.7))
      }

      // Arrow
      HStack {
        Spacer()
        Image(systemName: "arrow.down")
          .font(.system(size: 12))
          .foregroundColor(.cyan.opacity(0.5))
        Spacer()
      }

      // Now
      HStack(alignment: .top, spacing: 8) {
        Text(parallel.nowYear)
          .font(.system(size: 11, weight: .bold, design: .monospaced))
          .foregroundColor(.cyan)
          .frame(width: 40, alignment: .leading)

        Text(parallel.nowEvent)
          .font(.system(size: 12, weight: .medium, design: .rounded))
          .foregroundColor(.white)
      }

      // Pattern
      HStack(spacing: 6) {
        Image(systemName: "repeat")
          .font(.system(size: 10))
          .foregroundColor(.red)

        Text("PATTERN: \(parallel.pattern)")
          .font(.system(size: 10, weight: .bold, design: .rounded))
          .foregroundColor(.red)
      }
      .padding(.top, 4)
    }
    .padding(12)
    .background(
      RoundedRectangle(cornerRadius: 10, style: .continuous)
        .fill(Color.cyan.opacity(0.05))
        .overlay(
          RoundedRectangle(cornerRadius: 10, style: .continuous)
            .stroke(Color.cyan.opacity(0.15), lineWidth: 1)
        )
    )
  }

  // MARK: - The Question Content

  private var theQuestionContent: some View {
    VStack(spacing: 24) {
      // The question
      VStack(spacing: 16) {
        Text("❓")
          .font(.system(size: 50))

        Text("THE QUESTION")
          .font(.system(size: 16, weight: .black, design: .rounded))
          .tracking(3)
          .foregroundColor(.white)

        VStack(alignment: .leading, spacing: 16) {
          questionLine(
            "If they said nothing when Columbus was committing genocide in God's name...")
          questionLine("If they covered up child abuse for DECADES...")
          questionLine("If they were silent for 12 days after Epstein files named them...")
        }

        Text("Why would NOW be any different?")
          .font(.system(size: 18, weight: .black, design: .rounded))
          .foregroundColor(.red)
          .padding(.top, 8)
      }
      .padding(20)
      .background(
        RoundedRectangle(cornerRadius: 16, style: .continuous)
          .fill(Color.white.opacity(0.05))
          .overlay(
            RoundedRectangle(cornerRadius: 16, style: .continuous)
              .stroke(Color.red.opacity(0.3), lineWidth: 1)
          )
      )

      // The answer
      VStack(spacing: 16) {
        Text("THE ANSWER")
          .font(.system(size: 14, weight: .black, design: .rounded))
          .tracking(2)
          .foregroundColor(Palette.accent.gold)

        Text("They don't suddenly have morals.")
          .font(.system(size: 16, weight: .bold, design: .rounded))
          .foregroundColor(.white)

        Text("They have DAMAGE CONTROL.")
          .font(.system(size: 18, weight: .black, design: .rounded))
          .foregroundColor(.red)

        Divider()
          .background(Color.white.opacity(0.2))
          .padding(.vertical, 8)

        VStack(spacing: 8) {
          Text("Religion, Government, and Banking are not separate.")
            .font(.system(size: 14, weight: .medium, design: .rounded))
            .foregroundColor(.white.opacity(0.9))

          Text("They never were.")
            .font(.system(size: 14, weight: .bold, design: .rounded))
            .foregroundColor(.white)

          Text("They need each other for CONTROL.")
            .font(.system(size: 14, weight: .medium, design: .rounded))
            .foregroundColor(.white.opacity(0.9))

          Text("The target is always YOU.")
            .font(.system(size: 15, weight: .bold, design: .rounded))
            .foregroundColor(.red)
        }

        // Final wake up
        VStack(spacing: 8) {
          Text("The playbook hasn't changed since 1492.")
            .font(.system(size: 13, weight: .medium, design: .rounded))
            .foregroundColor(.white.opacity(0.8))

          Text("Only the packaging.")
            .font(.system(size: 13, weight: .medium, design: .rounded))
            .foregroundColor(.white.opacity(0.8))

          Text("WAKE UP.")
            .font(.system(size: 20, weight: .black, design: .rounded))
            .foregroundColor(Palette.accent.gold)
            .padding(.top, 8)

          Text("👁️")
            .font(.system(size: 36))
        }
        .padding(.top, 8)
      }
      .padding(20)
      .background(
        RoundedRectangle(cornerRadius: 16, style: .continuous)
          .fill(
            LinearGradient(
              colors: [Palette.accent.gold.opacity(0.1), Palette.accent.gold.opacity(0.05)],
              startPoint: .top,
              endPoint: .bottom
            )
          )
          .overlay(
            RoundedRectangle(cornerRadius: 16, style: .continuous)
              .stroke(Palette.accent.gold.opacity(0.3), lineWidth: 1)
          )
      )
    }
    .padding(16)
    .background(cardBackground)
  }

  private func questionLine(_ text: String) -> some View {
    HStack(alignment: .top, spacing: 8) {
      Text("•")
        .foregroundColor(.red)

      Text(text)
        .font(.system(size: 14, weight: .medium, design: .rounded))
        .foregroundColor(.white.opacity(0.9))
    }
  }

  // MARK: - Helpers

  private var cardBackground: some View {
    RoundedRectangle(cornerRadius: 16, style: .continuous)
      .fill(Color.white.opacity(0.03))
      .overlay(
        RoundedRectangle(cornerRadius: 16, style: .continuous)
          .stroke(Color.white.opacity(0.08), lineWidth: 1)
      )
  }

  // MARK: - Continue Button

  private var continueButton: some View {
    Button(action: {
      HapticManager.shared.medium()
      onContinue()
    }) {
      HStack(spacing: 12) {
        Text("See The Final Truth")
          .font(.system(size: 16, weight: .bold, design: .rounded))

        Image(systemName: "arrow.right")
          .font(.system(size: 14, weight: .bold))
      }
      .foregroundColor(.white)
      .frame(maxWidth: .infinity)
      .padding(.vertical, 16)
      .background(
        RoundedRectangle(cornerRadius: 14, style: .continuous)
          .fill(Color.red)
          .shadow(color: Color.red.opacity(0.4), radius: 10, y: 4)
      )
    }
  }

  // MARK: - Reveal

  private func startReveal() {
    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
      withAnimation(.easeOut(duration: 0.4)) {
        showContent = true
      }
    }

    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
      withAnimation(.spring(response: 0.5, dampingFraction: 0.8)) {
        showContinue = true
      }
    }
  }
}

// MARK: - Preview

#Preview {
  ZStack {
    LinearGradient(
      colors: [Color(hex: "#0a0a1a"), Color(hex: "#1a0a2a")],
      startPoint: .top,
      endPoint: .bottom
    )
    .ignoresSafeArea()

    ScrollView {
      PatternRecognitionView(onContinue: {})
        .padding()
    }
  }
}
