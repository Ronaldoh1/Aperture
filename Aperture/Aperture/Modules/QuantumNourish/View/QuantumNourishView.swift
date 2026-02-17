// QuantumNourishView.swift
// QUANTUM NOURISH — The Ultimate Consciousness Diet Engine
// ☀️ SunFlow: Reignited

import SwiftUI

struct QuantumNourishView: View {
  @Environment(\.dismiss) var dismiss
  @StateObject private var db = VibeSpectrumDatabase.shared
  @State private var selectedSection: NourishSection? = nil
  @State private var searchText = ""
  @State private var searchResults: [QuantumFood] = []
  @State private var pulsePhase: CGFloat = 0
  @State private var showScanner = false
  @State private var showVibeTracker = false
  @State private var showMealPlan = false
  @State private var probeQuery = ""
  @State private var probeResult = ""

  enum NourishSection: String, Identifiable {
    case spectrum = "Vibe Spectrum"
    case scanner = "Ingredient Scanner"
    case tracker = "Vibe Tracker"
    case pillars = "Six Pillars"
    case pineal = "Pineal Protocol"
    case destroyers = "Consciousness Killers"
    case mealPlan = "Quantum Meal Plan"
    case badges = "Cosmic Badges"
    case challenges = "Frequency Challenges"
    case biometrics = "Quantum Biometrics"
    case fitness = "Quantum Fitness"
    case cleansing = "Quantum Cleansing"
    // P1 Features
    case scanHistory = "Scan History"
    case budgetMode = "Budget Mode"
    case shoppingList = "Shopping List"
    case marketFinder = "Market Finder"
    case supplementAlts = "Supplement Alternatives"
    case refeedingGuide = "Refeeding Guide"
    case audioBookmarks = "Audio Bookmarks"
    case contentPrefs = "Content Preferences"
    case babyNutrition = "Tiny Humans"

    var id: String {
      rawValue
    }
  }

  var body: some View {
    NavigationStack {
      ZStack {
        cosmicBackground

        ScrollView(showsIndicators: false) {
          VStack(spacing: 24) {
            heroSection
            searchBar

            if !searchText.isEmpty {
              searchResultsSection
            } else {
              quickActionsGrid
              vibeSpectrumPreview
              sixPillarsSection
              pinealProtocolTeaser
              dailyAffirmation
            }

            // Quick Vibe Probe
            VStack(spacing: 10) {
              HStack(spacing: 6) {
                Image(systemName: "questionmark.bubble.fill").foregroundColor(Color(hex: "#FF6B35"))
                Text("TEST THIS MEAL?").font(.system(size: 10, weight: .bold)).tracking(2)
                  .foregroundColor(Color(hex: "#FF6B35"))
              }
              Text("Before you eat, pause and check:")
                .font(.system(size: 12, weight: .medium)).foregroundColor(Palette.text.secondary)
              HStack {
                TextField("What are you about to eat?", text: $probeQuery)
                  .font(.system(size: 13)).foregroundColor(Palette.text.primary)
                  .padding(10).background(
                    RoundedRectangle(cornerRadius: 8).fill(Color.white.opacity(0.04)))
                Button {
                  probeResult = VibeCheckEngine.vibeCheck(for: probeQuery)
                  HapticManager.shared.medium()
                } label: {
                  Image(systemName: "arrow.right.circle.fill").font(.system(size: 26))
                    .foregroundColor(Color(hex: "#FF6B35"))
                }
              }
              if !probeResult.isEmpty {
                Text(probeResult).font(.system(size: 12, weight: .medium, design: .rounded))
                  .foregroundColor(Palette.text.secondary).lineSpacing(3).padding(10)
                  .background(
                    RoundedRectangle(cornerRadius: 8).fill(Color(hex: "#FF6B35").opacity(0.06)))
              }
            }
            .padding(14)
            .background(
              RoundedRectangle(cornerRadius: 14).fill(Color(hex: "#FF6B35").opacity(0.04))
                .overlay(
                  RoundedRectangle(cornerRadius: 14).stroke(
                    Color(hex: "#FF6B35").opacity(0.15), lineWidth: 1)))

            // Disclaimers
            DisclaimerStack(types: [.frequency, .nutritional, .medical])

            Spacer(minLength: 120)
          }
          .padding(.horizontal, 20)
          .padding(.top, 16)
        }
      }
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItem(placement: .navigationBarLeading) {
          Button {
            dismiss()
          } label: {
            HStack(spacing: 4) {
              Image(systemName: "chevron.left")
              Text("Back")
            }
            .foregroundColor(Color(hex: "#2ECC71"))
          }
        }
        ToolbarItem(placement: .principal) {
          Text("QUANTUM NOURISH")
            .font(.system(size: 14, weight: .bold, design: .rounded))
            .tracking(2)
            .foregroundColor(Color(hex: "#2ECC71"))
        }
      }
      .sheet(item: $selectedSection) { section in
        switch section {
        case .spectrum:
          VibeSpectrumView()
        case .scanner:
          QuantumScannerView()
        case .tracker:
          VibeTrackerView()
        case .pillars:
          SixPillarsView()
        case .pineal:
          PinealProtocolView()
        case .destroyers:
          ConsciousnessKillersView()
        case .mealPlan:
          QuantumMealPlanView()
        case .badges:
          CosmicBadgeGalleryView()
        case .challenges:
          FrequencyChallengesView()
        case .biometrics:
          QuantumBiometricsView()
        case .fitness:
          QuantumFitnessView()
        case .cleansing:
          QuantumCleansingView()
        // P1 Features
        case .scanHistory:
          ScanHistoryView()
        case .budgetMode:
          BudgetModeView()
        case .shoppingList:
          ShoppingListView()
        case .marketFinder:
          LocalMarketFinderView()
        case .supplementAlts:
          SupplementAlternativesView()
        case .refeedingGuide:
          RefeedingGuideView()
        case .audioBookmarks:
          AudioBookmarksView()
        case .contentPrefs:
          ContentCustomizationView()
        case .babyNutrition:
          BabyQuantumNutritionView()
        }
      }
      .onChange(of: searchText) { _, newValue in
        if newValue.count >= 2 {
          searchResults = db.search(newValue)
        } else {
          searchResults = []
        }
      }
      .onAppear {
        withAnimation(.easeInOut(duration: 3).repeatForever(autoreverses: true)) {
          pulsePhase = 1
        }
      }
    }
  }

  // MARK: - Background

  private var cosmicBackground: some View {
    ZStack {
      LinearGradient(
        colors: [Color.black, Color(hex: "#001a0d"), Color(hex: "#002211"), Color.black],
        startPoint: .top, endPoint: .bottom
      ).ignoresSafeArea()

      RadialGradient(
        colors: [Color(hex: "#2ECC71").opacity(0.1 + pulsePhase * 0.08), Color.clear],
        center: .center, startRadius: 0, endRadius: 350
      ).ignoresSafeArea()
    }
  }

  // MARK: - Hero

  private var heroSection: some View {
    VStack(spacing: 16) {
      ZStack {
        ForEach(0..<3, id: \.self) { i in
          Circle()
            .stroke(Color(hex: "#2ECC71").opacity(0.15 - Double(i) * 0.04), lineWidth: 1.5)
            .frame(width: 100 + CGFloat(i) * 25, height: 100 + CGFloat(i) * 25)
            .scaleEffect(1 + pulsePhase * 0.04)
        }

        Circle()
          .fill(
            RadialGradient(
              colors: [Color(hex: "#2ECC71").opacity(0.3), Color.clear],
              center: .center, startRadius: 0, endRadius: 50
            )
          )
          .frame(width: 100, height: 100)

        Image(systemName: "leaf.circle.fill")
          .font(.system(size: 48))
          .foregroundStyle(
            LinearGradient(
              colors: [Color(hex: "#2ECC71"), Color(hex: "#27AE60"), Color(hex: "#1ABC9C")],
              startPoint: .topLeading, endPoint: .bottomTrailing
            )
          )
          .shadow(color: Color(hex: "#2ECC71").opacity(0.5), radius: 10)
      }

      VStack(spacing: 6) {
        Text("QUANTUM NOURISH")
          .font(.system(size: 10, weight: .bold, design: .rounded))
          .tracking(4)
          .foregroundColor(Color(hex: "#2ECC71"))

        Text("Eat Your Way to Enlightenment")
          .font(.system(size: 22, weight: .bold, design: .rounded))
          .foregroundColor(Palette.text.primary)

        Text("Your plate is a portal. Choose your frequency.")
          .font(.system(size: 14, weight: .medium))
          .foregroundColor(Palette.text.secondary)
      }

      // Stats
      HStack(spacing: 12) {
        miniStat(
          value: "\(db.allFoods.count)+", label: "Foods Mapped", icon: "leaf.fill",
          color: Color(hex: "#2ECC71"))
        miniStat(
          value: "8", label: "Frequency Tiers", icon: "waveform", color: Color(hex: "#9B59B6"))
        miniStat(value: "6", label: "Quantum Pillars", icon: "atom", color: Color(hex: "#F1C40F"))
      }
    }
  }

  private func miniStat(value: String, label: String, icon: String, color: Color) -> some View {
    VStack(spacing: 4) {
      Image(systemName: icon).font(.system(size: 14)).foregroundColor(color)
      Text(value).font(.system(size: 16, weight: .bold, design: .rounded)).foregroundColor(
        Palette.text.primary)
      Text(label).font(.system(size: 9, weight: .medium)).foregroundColor(Palette.text.muted)
    }
    .frame(maxWidth: .infinity)
    .padding(.vertical, 10)
    .background(RoundedRectangle(cornerRadius: 12).fill(Color.white.opacity(0.04)))
  }

  // MARK: - Search

  private var searchBar: some View {
    HStack(spacing: 12) {
      Image(systemName: "magnifyingglass")
        .foregroundColor(Color(hex: "#2ECC71").opacity(0.7))

      TextField("Search any food, ingredient, or chemical...", text: $searchText)
        .font(.system(size: 15, weight: .medium, design: .rounded))
        .foregroundColor(Palette.text.primary)
        .autocorrectionDisabled()

      if !searchText.isEmpty {
        Button {
          searchText = ""
        } label: {
          Image(systemName: "xmark.circle.fill").foregroundColor(Palette.text.muted)
        }
      }
    }
    .padding(14)
    .background(
      RoundedRectangle(cornerRadius: 14)
        .fill(Color.white.opacity(0.06))
        .overlay(
          RoundedRectangle(cornerRadius: 14).stroke(
            Color(hex: "#2ECC71").opacity(0.2), lineWidth: 1))
    )
  }

  // MARK: - Search Results

  private var searchResultsSection: some View {
    VStack(alignment: .leading, spacing: 12) {
      Text("\(searchResults.count) results")
        .font(.system(size: 12, weight: .bold, design: .rounded))
        .foregroundColor(Palette.text.muted)

      ForEach(searchResults) { food in
        FoodResultCard(food: food)
      }

      if searchResults.isEmpty && searchText.count >= 2 {
        VStack(spacing: 8) {
          Image(systemName: "magnifyingglass").font(.system(size: 30)).foregroundColor(
            Palette.text.muted)
          Text("No match found for '\(searchText)'")
            .font(.system(size: 14, weight: .medium)).foregroundColor(Palette.text.muted)
          Text("Try scanning the ingredient label instead")
            .font(.system(size: 12)).foregroundColor(Palette.text.muted)
        }
        .frame(maxWidth: .infinity)
        .padding(30)
      }
    }
  }

  // MARK: - Quick Actions

  private var quickActionsGrid: some View {
    VStack(alignment: .leading, spacing: 12) {
      Text("QUANTUM TOOLS")
        .font(.system(size: 10, weight: .bold, design: .rounded))
        .tracking(2)
        .foregroundColor(Palette.text.muted)

      LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 12) {
        actionCard(
          title: "Vibe Spectrum", subtitle: "Full frequency map", icon: "waveform.path.ecg",
          color: Color(hex: "#9B59B6"), section: .spectrum)
        actionCard(
          title: "Scan Ingredients", subtitle: "Camera + OCR", icon: "barcode.viewfinder",
          color: Color(hex: "#E74C3C"), section: .scanner)
        actionCard(
          title: "Vibe Tracker", subtitle: "Log daily MHz", icon: "chart.line.uptrend.xyaxis",
          color: Color(hex: "#3498DB"), section: .tracker)
        actionCard(
          title: "Six Pillars", subtitle: "Quantum nutrition", icon: "atom",
          color: Color(hex: "#F1C40F"), section: .pillars)
        actionCard(
          title: "Pineal Protocol", subtitle: "Decalcify & activate", icon: "eye.fill",
          color: Color(hex: "#9B59B6"), section: .pineal)
        actionCard(
          title: "Kill List", subtitle: "Avoid these forever", icon: "xmark.octagon.fill",
          color: Color(hex: "#E74C3C"), section: .destroyers)
        actionCard(
          title: "Meal Plan", subtitle: "7-day protocol", icon: "calendar.badge.clock",
          color: Color(hex: "#2ECC71"), section: .mealPlan)
        actionCard(
          title: "Cosmic Badges", subtitle: "Earn achievements", icon: "star.circle.fill",
          color: Color(hex: "#FFD700"), section: .badges)
        actionCard(
          title: "Challenges", subtitle: "Level up frequency", icon: "flame.fill",
          color: Color(hex: "#FF6B35"), section: .challenges)
        actionCard(
          title: "Biometrics", subtitle: "Health data sync", icon: "heart.text.square.fill",
          color: Color(hex: "#FF6B6B"), section: .biometrics)
        actionCard(
          title: "Quantum Fitness", subtitle: "Athletic nutrition",
          icon: "figure.strengthtraining.traditional", color: Color(hex: "#FF6B35"),
          section: .fitness)
        actionCard(
          title: "Quantum Cleansing", subtitle: "Fast, detox, juice", icon: "drop.triangle.fill",
          color: Color(hex: "#1ABC9C"), section: .cleansing)
        // P1 Features
        actionCard(
          title: "Scan History", subtitle: "Past scans + favorites", icon: "clock.arrow.circlepath",
          color: Color(hex: "#E74C3C"), section: .scanHistory)
        actionCard(
          title: "Budget Mode", subtitle: "Eat clean on any $", icon: "dollarsign.circle.fill",
          color: Color(hex: "#2ECC71"), section: .budgetMode)
        actionCard(
          title: "Shopping List", subtitle: "Conscious grocery run", icon: "cart.fill",
          color: Color(hex: "#2ECC71"), section: .shoppingList)
        actionCard(
          title: "Market Finder", subtitle: "Clean food near you", icon: "map.fill",
          color: Color(hex: "#3498DB"), section: .marketFinder)
        actionCard(
          title: "Alternatives", subtitle: "Replace, don't remove", icon: "arrow.triangle.swap",
          color: Color(hex: "#27AE60"), section: .supplementAlts)
        actionCard(
          title: "Refeeding Guide", subtitle: "Break fasts safely",
          icon: "exclamationmark.triangle.fill", color: Color(hex: "#E74C3C"),
          section: .refeedingGuide)
        // Baby Nutrition
        actionCard(
          title: "Tiny Humans", subtitle: "Baby nutrition 0-24mo",
          icon: "figure.and.child.holdinghands", color: Color(hex: "#FFB6C1"),
          section: .babyNutrition)
      }
    }
  }

  private func actionCard(
    title: String, subtitle: String, icon: String, color: Color, section: NourishSection
  ) -> some View {
    Button {
      HapticManager.shared.light()
      selectedSection = section
    } label: {
      VStack(spacing: 10) {
        Image(systemName: icon)
          .font(.system(size: 28, weight: .medium))
          .foregroundColor(color)

        Text(title)
          .font(.system(size: 13, weight: .bold, design: .rounded))
          .foregroundColor(Palette.text.primary)

        Text(subtitle)
          .font(.system(size: 10, weight: .medium))
          .foregroundColor(Palette.text.muted)
      }
      .frame(maxWidth: .infinity)
      .padding(.vertical, 18)
      .background(
        RoundedRectangle(cornerRadius: 14)
          .fill(Color.white.opacity(0.04))
          .overlay(RoundedRectangle(cornerRadius: 14).stroke(color.opacity(0.15), lineWidth: 1))
      )
    }
    .buttonStyle(PlainButtonStyle())
  }

  // MARK: - Vibe Spectrum Preview

  private var vibeSpectrumPreview: some View {
    VStack(alignment: .leading, spacing: 14) {
      HStack {
        Image(systemName: "waveform.path.ecg")
          .foregroundColor(Color(hex: "#9B59B6"))
        Text("FREQUENCY SPECTRUM")
          .font(.system(size: 10, weight: .bold, design: .rounded))
          .tracking(1.5)
          .foregroundColor(Color(hex: "#9B59B6"))
        Spacer()
        Button {
          selectedSection = .spectrum
        } label: {
          Text("VIEW ALL →")
            .font(.system(size: 10, weight: .bold))
            .foregroundColor(Color(hex: "#9B59B6").opacity(0.7))
        }
      }

      // Gradient spectrum bar
      HStack(spacing: 2) {
        ForEach(FrequencyTier.allCases, id: \.self) { tier in
          VStack(spacing: 4) {
            RoundedRectangle(cornerRadius: 4)
              .fill(tier.color)
              .frame(height: 30)

            Text(tier.mhzRange)
              .font(.system(size: 7, weight: .bold, design: .monospaced))
              .foregroundColor(tier.color)
          }
          .frame(maxWidth: .infinity)
        }
      }

      HStack {
        Text("☠️ DEATH").font(.system(size: 9, weight: .bold)).foregroundColor(.red)
        Spacer()
        Text("⚡ TRANSCENDENCE").font(.system(size: 9, weight: .bold)).foregroundColor(
          Color(hex: "#9933FF"))
      }
    }
    .padding(16)
    .background(
      RoundedRectangle(cornerRadius: 16)
        .fill(Color.white.opacity(0.04))
        .overlay(
          RoundedRectangle(cornerRadius: 16).stroke(
            Color(hex: "#9B59B6").opacity(0.15), lineWidth: 1))
    )
  }

  // MARK: - Six Pillars Preview

  private var sixPillarsSection: some View {
    VStack(alignment: .leading, spacing: 14) {
      HStack {
        Image(systemName: "atom")
          .foregroundColor(Color(hex: "#F1C40F"))
        Text("THE SIX PILLARS OF QUANTUM NUTRITION")
          .font(.system(size: 10, weight: .bold, design: .rounded))
          .tracking(1)
          .foregroundColor(Color(hex: "#F1C40F"))
      }

      ScrollView(.horizontal, showsIndicators: false) {
        HStack(spacing: 12) {
          ForEach(QuantumPillar.allCases, id: \.self) { pillar in
            pillarCard(pillar)
          }
        }
      }
    }
  }

  private func pillarCard(_ pillar: QuantumPillar) -> some View {
    Button {
      HapticManager.shared.light()
      selectedSection = .pillars
    } label: {
      VStack(spacing: 8) {
        Image(systemName: pillar.icon)
          .font(.system(size: 24))
          .foregroundColor(pillar.color)

        Text(pillar.rawValue)
          .font(.system(size: 11, weight: .bold, design: .rounded))
          .foregroundColor(Palette.text.primary)
          .multilineTextAlignment(.center)
          .lineLimit(2)
      }
      .frame(width: 100, height: 90)
      .background(
        RoundedRectangle(cornerRadius: 12)
          .fill(pillar.color.opacity(0.08))
          .overlay(
            RoundedRectangle(cornerRadius: 12).stroke(pillar.color.opacity(0.2), lineWidth: 1))
      )
    }
    .buttonStyle(PlainButtonStyle())
  }

  // MARK: - Pineal Protocol Teaser

  private var pinealProtocolTeaser: some View {
    Button {
      HapticManager.shared.medium()
      selectedSection = .pineal
    } label: {
      HStack(spacing: 16) {
        ZStack {
          Circle()
            .fill(Color(hex: "#9B59B6").opacity(0.2))
            .frame(width: 56, height: 56)
          Image(systemName: "eye.fill")
            .font(.system(size: 24))
            .foregroundColor(Color(hex: "#9B59B6"))
        }

        VStack(alignment: .leading, spacing: 4) {
          Text("THE PINEAL PROTOCOL")
            .font(.system(size: 12, weight: .bold, design: .rounded))
            .foregroundColor(Color(hex: "#9B59B6"))
          Text("Foods that decalcify your third eye. Foods that calcify it. Know the difference.")
            .font(.system(size: 12, weight: .medium))
            .foregroundColor(Palette.text.secondary)
            .lineLimit(2)
        }

        Spacer()

        Image(systemName: "chevron.right")
          .foregroundColor(Color(hex: "#9B59B6").opacity(0.5))
      }
      .padding(16)
      .background(
        RoundedRectangle(cornerRadius: 14)
          .fill(Color(hex: "#9B59B6").opacity(0.06))
          .overlay(
            RoundedRectangle(cornerRadius: 14).stroke(
              Color(hex: "#9B59B6").opacity(0.15), lineWidth: 1))
      )
    }
    .buttonStyle(PlainButtonStyle())
  }

  // MARK: - Daily Affirmation

  private var dailyAffirmation: some View {
    VStack(spacing: 10) {
      Text("🐉")
        .font(.system(size: 24))
      Text(
        "\"Your body is a temple. But what frequency is that temple vibrating at? Every meal is a vote — for consciousness or for sleep. Choose wisely.\""
      )
      .font(.system(size: 13, weight: .medium, design: .rounded))
      .foregroundColor(Palette.text.secondary)
      .italic()
      .multilineTextAlignment(.center)
      .lineSpacing(4)
    }
    .padding(18)
    .background(
      RoundedRectangle(cornerRadius: 14)
        .fill(Palette.accent.gold.opacity(0.06))
        .overlay(
          RoundedRectangle(cornerRadius: 14).stroke(Palette.accent.gold.opacity(0.15), lineWidth: 1)
        )
    )
  }
}

// MARK: - Food Result Card

struct FoodResultCard: View {
  let food: QuantumFood
  @State private var expanded = false

  var body: some View {
    Button {
      withAnimation(.spring(response: 0.4)) { expanded.toggle() }
      HapticManager.shared.light()
    } label: {
      VStack(alignment: .leading, spacing: expanded ? 14 : 0) {
        // Header row
        HStack(spacing: 12) {
          Text(food.category.icon)
            .font(.system(size: 24))

          VStack(alignment: .leading, spacing: 2) {
            Text(food.name)
              .font(.system(size: 15, weight: .bold, design: .rounded))
              .foregroundColor(Palette.text.primary)

            HStack(spacing: 8) {
              Text(food.tier.rawValue.uppercased())
                .font(.system(size: 10, weight: .bold, design: .rounded))
                .foregroundColor(food.tier.color)

              Text("~\(food.mhzEstimate) MHz")
                .font(.system(size: 10, weight: .bold, design: .monospaced))
                .foregroundColor(food.tier.color.opacity(0.7))

              // Pineal badge
              HStack(spacing: 3) {
                Image(systemName: food.pinealImpact.icon)
                  .font(.system(size: 8))
                Text(food.pinealImpact.rawValue)
                  .font(.system(size: 8, weight: .bold))
              }
              .foregroundColor(food.pinealImpact.color)
              .padding(.horizontal, 6)
              .padding(.vertical, 2)
              .background(Capsule().fill(food.pinealImpact.color.opacity(0.15)))
            }
          }

          Spacer()

          // Frequency indicator bar
          RoundedRectangle(cornerRadius: 3)
            .fill(food.tier.color)
            .frame(width: 6, height: 36)
        }

        // Expanded content
        if expanded {
          VStack(alignment: .leading, spacing: 12) {
            // Quantum Note
            Text(food.quantumNote)
              .font(.system(size: 13, weight: .medium, design: .rounded))
              .foregroundColor(Palette.text.secondary)
              .lineSpacing(4)

            // Effects
            if !food.effects.isEmpty {
              VStack(alignment: .leading, spacing: 6) {
                Text("EFFECTS")
                  .font(.system(size: 9, weight: .bold)).tracking(1).foregroundColor(
                    food.tier.color)
                ForEach(food.effects, id: \.self) { effect in
                  HStack(spacing: 6) {
                    Circle().fill(food.tier.color).frame(width: 4, height: 4)
                    Text(effect).font(.system(size: 12, weight: .medium)).foregroundColor(
                      Palette.text.secondary)
                  }
                }
              }
            }

            // Avoid reasons
            if !food.avoidReasons.isEmpty {
              VStack(alignment: .leading, spacing: 6) {
                Text("FOUND IN").font(.system(size: 9, weight: .bold)).tracking(1).foregroundColor(
                  .red)
                ForEach(food.avoidReasons, id: \.self) { reason in
                  HStack(spacing: 6) {
                    Image(systemName: "exclamationmark.triangle.fill").font(.system(size: 8))
                      .foregroundColor(.red)
                    Text(reason).font(.system(size: 12, weight: .medium)).foregroundColor(
                      Palette.text.secondary)
                  }
                }
              }
            }

            // Alternatives
            if !food.alternatives.isEmpty {
              VStack(alignment: .leading, spacing: 6) {
                Text("SWAP FOR").font(.system(size: 9, weight: .bold)).tracking(1).foregroundColor(
                  .green)
                HStack(spacing: 6) {
                  ForEach(food.alternatives.prefix(4), id: \.self) { alt in
                    Text(alt)
                      .font(.system(size: 11, weight: .semibold))
                      .foregroundColor(.green)
                      .padding(.horizontal, 8).padding(.vertical, 4)
                      .background(Capsule().fill(Color.green.opacity(0.12)))
                  }
                }
              }
            }
          }
          .transition(.opacity.combined(with: .move(edge: .top)))
        }
      }
      .padding(14)
      .background(
        RoundedRectangle(cornerRadius: 14)
          .fill(food.tier.color.opacity(expanded ? 0.06 : 0.03))
          .overlay(
            RoundedRectangle(cornerRadius: 14).stroke(
              food.tier.color.opacity(expanded ? 0.2 : 0.1), lineWidth: 1))
      )
    }
    .buttonStyle(PlainButtonStyle())
  }
}
