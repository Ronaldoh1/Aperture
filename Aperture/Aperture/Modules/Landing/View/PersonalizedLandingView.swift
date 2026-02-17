// PersonalizedLandingView.swift
// Personalized home screen based on user's journey selection
// Shows primary path, quick access, continue section, and sacred geometry progress

import SwiftUI

struct PersonalizedLandingView: View {
  @ObservedObject var journeyStore: UserJourneyStore
  @StateObject var badgeManager = SacredBadgeManager.shared
  @Binding var selectedTab: Int

  @State private var showCustomizeSheet = false
  @State private var showBadgeCollection = false
  @State private var showSearch = false
  @State private var showBookmarks = false
  @State private var showProgress = false
  @State private var showPathfinder = false

  var body: some View {
    ZStack {
      CosmicBackground()

      ScrollView(showsIndicators: false) {
        VStack(spacing: 28) {
          // Top bar with search and bookmarks
          topBar

          // Personalized greeting
          greetingSection

          // Continue where you left off
          if hasContinueContent {
            continueSection
          }

          // Primary path (based on journey)
          if let journey = journeyStore.journeyType {
            primaryPathSection(journey: journey)
          }

          // Quick Access (customizable)
          quickAccessSection

          // Explore grid (other modules)
          exploreSection

          // Sacred Geometry progress
          sacredGeometrySection

          Spacer(minLength: 100)
        }
        .padding(.horizontal, 20)
        .padding(.top, 10)
      }
    }
    .sheet(isPresented: $showCustomizeSheet) {
      QuickAccessCustomizeSheet(journeyStore: journeyStore)
    }
    .sheet(isPresented: $showBadgeCollection) {
      BadgeCollectionView()
    }
    .sheet(isPresented: $showSearch) {
      GlobalSearchView(selectedTab: $selectedTab)
    }
    .sheet(isPresented: $showBookmarks) {
      BookmarksView(selectedTab: $selectedTab)
    }
    .sheet(isPresented: $showProgress) {
      JourneyProgressView()
    }
    .fullScreenCover(isPresented: $showPathfinder) {
      GnosticPathfinderModal(journeyStore: journeyStore, selectedTab: $selectedTab)
    }
    .onAppear {
      if !GnosticPathfinderModal.hasBeenSeen {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
          showPathfinder = true
        }
      }
    }
  }

  // MARK: - Top Bar

  private var topBar: some View {
    HStack(spacing: 12) {
      // Search button
      Button(action: { showSearch = true }) {
        HStack(spacing: 8) {
          Image(systemName: "magnifyingglass")
            .font(.system(size: 14))
          Text("Search Aperture...")
            .font(.system(size: 14))
        }
        .foregroundColor(.white.opacity(0.5))
        .padding(.horizontal, 14)
        .padding(.vertical, 10)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
          RoundedRectangle(cornerRadius: 12)
            .fill(Color.white.opacity(0.06))
        )
      }
      .buttonStyle(PlainButtonStyle())

      // Bookmarks button
      Button(action: { showBookmarks = true }) {
        Image(systemName: "bookmark.fill")
          .font(.system(size: 16))
          .foregroundColor(Palette.accent.gold)
          .frame(width: 40, height: 40)
          .background(
            Circle()
              .fill(Color.white.opacity(0.06))
          )
      }
      .buttonStyle(PlainButtonStyle())

      // Progress button
      Button(action: { showProgress = true }) {
        Image(systemName: "chart.line.uptrend.xyaxis")
          .font(.system(size: 16))
          .foregroundColor(Palette.primary.cyan)
          .frame(width: 40, height: 40)
          .background(
            Circle()
              .fill(Color.white.opacity(0.06))
          )
      }
      .buttonStyle(PlainButtonStyle())
    }
  }

  // MARK: - Greeting Section

  private var greetingSection: some View {
    VStack(alignment: .leading, spacing: 8) {
      // Time-based greeting
      Text(greeting)
        .font(.system(size: 14))
        .foregroundColor(.white.opacity(0.6))

      HStack {
        // Aperture logo small
        Image(systemName: "eye.fill")
          .font(.system(size: 24))
          .foregroundStyle(
            LinearGradient(
              colors: [Palette.accent.gold, Palette.primary.cyan],
              startPoint: .topLeading,
              endPoint: .bottomTrailing
            )
          )

        Text("APERTURE")
          .font(.system(size: 24, weight: .black, design: .rounded))
          .foregroundColor(.white)
          .tracking(3)
      }

      if let journey = journeyStore.journeyType {
        Text("Your path: \(journey.title)")
          .font(.system(size: 13))
          .foregroundColor(journey.color)
      }
    }
    .frame(maxWidth: .infinity, alignment: .leading)
  }

  private var greeting: String {
    let hour = Calendar.current.component(.hour, from: Date())
    switch hour {
    case 5..<12: return "Good morning"
    case 12..<17: return "Good afternoon"
    case 17..<21: return "Good evening"
    default: return "Welcome back"
    }
  }

  // MARK: - Continue Section

  private var hasContinueContent: Bool {
    journeyStore.lastCourseId != nil || journeyStore.lastPracticeId != nil
  }

  private var continueSection: some View {
    VStack(alignment: .leading, spacing: 12) {
      HStack {
        Text("CONTINUE")
          .font(.system(size: 12, weight: .bold))
          .foregroundColor(Palette.text.muted)
          .tracking(2)
        Spacer()
      }

      // Course continue
      if journeyStore.lastCourseId != nil {
        ContinueCard(
          icon: "book.fill",
          title: "Resume Course",
          subtitle: "Continue where you left off",
          progress: 0.45,  // TODO: Get actual progress
          color: Palette.accent.gold
        ) {
          selectedTab = 3  // Awakening tab
        }
      }

      // Practice continue
      if journeyStore.lastPracticeId != nil {
        ContinueCard(
          icon: "figure.mind.and.body",
          title: "Resume Practice",
          subtitle: "Your last session",
          progress: nil,
          color: Palette.primary.cyan
        ) {
          selectedTab = 3
        }
      }
    }
  }

  // MARK: - Primary Path Section

  private func primaryPathSection(journey: UserJourneyType) -> some View {
    VStack(alignment: .leading, spacing: 12) {
      HStack {
        Text("YOUR PATH")
          .font(.system(size: 12, weight: .bold))
          .foregroundColor(Palette.text.muted)
          .tracking(2)
        Spacer()
      }

      // Large primary card
      Button(action: { navigateToPrimaryPath(journey) }) {
        HStack(spacing: 16) {
          // Icon
          ZStack {
            Circle()
              .fill(journey.color.opacity(0.2))
              .frame(width: 60, height: 60)

            Text(journey.icon)
              .font(.system(size: 30))
          }

          VStack(alignment: .leading, spacing: 4) {
            Text(journey.primaryModule)
              .font(.system(size: 20, weight: .bold))
              .foregroundColor(.white)

            Text(journey.recommendedContent)
              .font(.system(size: 13))
              .foregroundColor(.white.opacity(0.7))
              .lineLimit(2)
          }

          Spacer()

          Image(systemName: "arrow.right.circle.fill")
            .font(.system(size: 24))
            .foregroundColor(journey.color)
        }
        .padding()
        .background(
          RoundedRectangle(cornerRadius: 16)
            .fill(journey.color.opacity(0.1))
            .overlay(
              RoundedRectangle(cornerRadius: 16)
                .stroke(journey.color.opacity(0.3), lineWidth: 1)
            )
        )
      }
      .buttonStyle(PlainButtonStyle())
    }
  }

  private func navigateToPrimaryPath(_ journey: UserJourneyType) {
    switch journey {
    case .groundMe, .teachPractice:
      selectedTab = 3  // Awakening
    case .showPatterns:
      selectedTab = 1  // Timeline
    case .giveSources:
      selectedTab = 4  // More (Alexandria)
    }
  }

  // MARK: - Quick Access Section

  private var quickAccessSection: some View {
    VStack(alignment: .leading, spacing: 12) {
      HStack {
        Text("QUICK ACCESS")
          .font(.system(size: 12, weight: .bold))
          .foregroundColor(Palette.text.muted)
          .tracking(2)

        Spacer()

        Button(action: { showCustomizeSheet = true }) {
          HStack(spacing: 4) {
            Image(systemName: "slider.horizontal.3")
            Text("Edit")
          }
          .font(.system(size: 12, weight: .medium))
          .foregroundColor(Palette.primary.cyan)
        }
      }

      HStack(spacing: 12) {
        ForEach(journeyStore.quickAccessItems) { item in
          QuickAccessButton(item: item, selectedTab: $selectedTab)
        }

        // Add button
        Button(action: { showCustomizeSheet = true }) {
          VStack(spacing: 6) {
            Image(systemName: "plus.circle.fill")
              .font(.system(size: 24))
            Text("Add")
              .font(.system(size: 11))
          }
          .foregroundColor(.white.opacity(0.4))
          .frame(maxWidth: .infinity)
          .padding(.vertical, 16)
          .background(
            RoundedRectangle(cornerRadius: 12)
              .fill(Color.white.opacity(0.03))
              .overlay(
                RoundedRectangle(cornerRadius: 12)
                  .stroke(Color.white.opacity(0.1), style: StrokeStyle(lineWidth: 1, dash: [5]))
              )
          )
        }
        .buttonStyle(PlainButtonStyle())
      }
    }
  }

  // MARK: - Explore Section

  private var exploreSection: some View {
    VStack(alignment: .leading, spacing: 12) {
      HStack {
        Text("EXPLORE")
          .font(.system(size: 12, weight: .bold))
          .foregroundColor(Palette.text.muted)
          .tracking(2)
        Spacer()
      }

      LazyVGrid(
        columns: [
          GridItem(.flexible(), spacing: 12),
          GridItem(.flexible(), spacing: 12),
        ], spacing: 12
      ) {
        ExploreCard(
          icon: "clock.arrow.circlepath",
          title: "Timeline",
          subtitle: "Hidden History",
          color: Palette.primary.violet
        ) {
          selectedTab = 1
        }

        ExploreCard(
          icon: "globe.americas.fill",
          title: "Cosmos",
          subtitle: "Gnostic Realms",
          color: Palette.primary.cyan
        ) {
          selectedTab = 2
        }

        ExploreCard(
          icon: "sun.max.fill",
          title: "Awakening",
          subtitle: "13 Traditions",
          color: Palette.accent.gold
        ) {
          selectedTab = 3
        }

        // Alexandria - Animated CTA (pulses until tapped 5 times)
        AlexandriaCallToActionCard(selectedTab: $selectedTab, style: .explore)
      }
    }
  }

  // MARK: - Sacred Geometry Section

  private var sacredGeometrySection: some View {
    VStack(alignment: .leading, spacing: 12) {
      HStack {
        Text("✨ SACRED GEOMETRY PROGRESS")
          .font(.system(size: 12, weight: .bold))
          .foregroundColor(Palette.accent.gold)
          .tracking(2)
        Spacer()
      }

      Button(action: { showBadgeCollection = true }) {
        VStack(alignment: .leading, spacing: 12) {
          // Progress quote
          Text(dailyWisdom)
            .font(.system(size: 15, weight: .medium))
            .foregroundColor(.white)
            .multilineTextAlignment(.leading)

          HStack {
            // Badge count
            HStack(spacing: 4) {
              Text("\(badgeManager.totalBadgeCount) Badges")
                .font(.system(size: 11, weight: .medium))
              Text("•")
              Text(
                "\(badgeManager.uniqueShapesEarned().count)/\(SacredGeometryShape.allCases.count) Shapes"
              )
              .font(.system(size: 11))
            }
            .foregroundColor(.white.opacity(0.5))

            Spacer()

            Text("View Collection →")
              .font(.system(size: 12, weight: .medium))
              .foregroundColor(Palette.accent.gold)
          }
        }
        .padding()
        .background(
          RoundedRectangle(cornerRadius: 16)
            .fill(Color.white.opacity(0.05))
            .overlay(
              RoundedRectangle(cornerRadius: 16)
                .stroke(Palette.accent.gold.opacity(0.2), lineWidth: 1)
            )
        )
      }
      .buttonStyle(PlainButtonStyle())
    }
  }

  private var dailyWisdom: String {
    let wisdoms = [
      "The truth you seek is not hidden—it is ignored. Open your eyes.",
      "Every tradition points to the same summit. The paths differ; the destination is one.",
      "What they call heresy is often the truth they fear.",
      "Awakening is not escape from the world—it is seeing the world clearly.",
      "The serpent they demonized carries the medicine they fear you'll find.",
      "You were born awake. You were taught to sleep.",
    ]

    // Use day of year for consistent daily wisdom
    let dayOfYear = Calendar.current.ordinality(of: .day, in: .year, for: Date()) ?? 1
    return wisdoms[dayOfYear % wisdoms.count]
  }
}

// MARK: - Quick Access Button

struct QuickAccessButton: View {
  let item: QuickAccessItem
  @Binding var selectedTab: Int

  var body: some View {
    Button(action: handleTap) {
      VStack(spacing: 6) {
        Image(systemName: item.icon)
          .font(.system(size: 24))
        Text(item.title)
          .font(.system(size: 11, weight: .medium))
      }
      .foregroundColor(.white)
      .frame(maxWidth: .infinity)
      .padding(.vertical, 16)
      .background(
        RoundedRectangle(cornerRadius: 12)
          .fill(Color.white.opacity(0.05))
          .overlay(
            RoundedRectangle(cornerRadius: 12)
              .stroke(Color.white.opacity(0.1), lineWidth: 1)
          )
      )
    }
    .buttonStyle(PlainButtonStyle())
  }

  private func handleTap() {
    HapticManager.shared.light()

    switch item.destination {
    case .practice:
      selectedTab = 3
    case .currentCourse:
      selectedTab = 3
    case .badges:
      // Opens badge collection - handled by parent view
      break
    case .timeline:
      selectedTab = 1
    case .cosmos:
      selectedTab = 2
    case .alexandria:
      selectedTab = 4
    case .custom:
      break
    }
  }
}

// MARK: - Continue Card

struct ContinueCard: View {
  let icon: String
  let title: String
  let subtitle: String
  let progress: Double?
  let color: Color
  let action: () -> Void

  var body: some View {
    Button(action: action) {
      HStack(spacing: 12) {
        Image(systemName: icon)
          .font(.system(size: 20))
          .foregroundColor(color)
          .frame(width: 40, height: 40)
          .background(color.opacity(0.15))
          .clipShape(Circle())

        VStack(alignment: .leading, spacing: 4) {
          Text(title)
            .font(.system(size: 15, weight: .semibold))
            .foregroundColor(.white)

          Text(subtitle)
            .font(.system(size: 12))
            .foregroundColor(.white.opacity(0.6))
        }

        Spacer()

        if let progress = progress {
          // Progress indicator
          ZStack {
            Circle()
              .stroke(color.opacity(0.2), lineWidth: 3)
            Circle()
              .trim(from: 0, to: progress)
              .stroke(color, lineWidth: 3)
              .rotationEffect(.degrees(-90))
            Text("\(Int(progress * 100))%")
              .font(.system(size: 10, weight: .bold))
              .foregroundColor(color)
          }
          .frame(width: 40, height: 40)
        } else {
          Image(systemName: "play.fill")
            .foregroundColor(color)
        }
      }
      .padding()
      .background(
        RoundedRectangle(cornerRadius: 14)
          .fill(Color.white.opacity(0.05))
          .overlay(
            RoundedRectangle(cornerRadius: 14)
              .stroke(color.opacity(0.2), lineWidth: 1)
          )
      )
    }
    .buttonStyle(PlainButtonStyle())
  }
}

// MARK: - Explore Card

struct ExploreCard: View {
  let icon: String
  let title: String
  let subtitle: String
  let color: Color
  let action: () -> Void

  var body: some View {
    Button(action: action) {
      VStack(alignment: .leading, spacing: 8) {
        Image(systemName: icon)
          .font(.system(size: 24))
          .foregroundColor(color)

        Text(title)
          .font(.system(size: 15, weight: .semibold))
          .foregroundColor(.white)

        Text(subtitle)
          .font(.system(size: 11))
          .foregroundColor(.white.opacity(0.5))
      }
      .frame(maxWidth: .infinity, alignment: .leading)
      .padding()
      .background(
        RoundedRectangle(cornerRadius: 14)
          .fill(Color.white.opacity(0.05))
          .overlay(
            RoundedRectangle(cornerRadius: 14)
              .stroke(Color.white.opacity(0.1), lineWidth: 1)
          )
      )
    }
    .buttonStyle(PlainButtonStyle())
  }
}

// MARK: - Quick Access Customize Sheet

struct QuickAccessCustomizeSheet: View {
  @ObservedObject var journeyStore: UserJourneyStore
  @Environment(\.dismiss) private var dismiss

  let availableItems: [QuickAccessItem] = [
    QuickAccessItem(
      id: "practice", title: "Practice", icon: "figure.mind.and.body", destination: .practice),
    QuickAccessItem(id: "course", title: "Course", icon: "book.fill", destination: .currentCourse),
    QuickAccessItem(id: "badges", title: "Badges", icon: "seal.fill", destination: .badges),
    QuickAccessItem(
      id: "timeline", title: "Timeline", icon: "clock.arrow.circlepath", destination: .timeline),
    QuickAccessItem(
      id: "cosmos", title: "Cosmos", icon: "globe.americas.fill", destination: .cosmos),
    QuickAccessItem(
      id: "alexandria", title: "Library", icon: "books.vertical.fill", destination: .alexandria),
  ]

  @State private var selectedItems: [QuickAccessItem] = []

  var body: some View {
    NavigationStack {
      ZStack {
        Color(hex: "#0a0a1a").ignoresSafeArea()

        VStack(spacing: 20) {
          Text("Choose up to 3 quick access items")
            .font(.system(size: 14))
            .foregroundColor(.white.opacity(0.6))

          LazyVGrid(
            columns: [
              GridItem(.flexible()),
              GridItem(.flexible()),
              GridItem(.flexible()),
            ], spacing: 16
          ) {
            ForEach(availableItems) { item in
              customizeItemCell(item)
            }
          }
          .padding()

          Spacer()
        }
      }
      .navigationTitle("Customize Quick Access")
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItem(placement: .navigationBarLeading) {
          Button("Cancel") { dismiss() }
        }
        ToolbarItem(placement: .navigationBarTrailing) {
          Button("Save") {
            journeyStore.updateQuickAccess(selectedItems)
            dismiss()
          }
          .disabled(selectedItems.isEmpty)
        }
      }
      .onAppear {
        selectedItems = journeyStore.quickAccessItems
      }
    }
  }

  private func customizeItemCell(_ item: QuickAccessItem) -> some View {
    let isSelected = selectedItems.contains(item)

    return Button(action: {
      if isSelected {
        selectedItems.removeAll { $0.id == item.id }
      } else if selectedItems.count < 3 {
        selectedItems.append(item)
      }
      HapticManager.shared.selectionChanged()
    }) {
      VStack(spacing: 8) {
        ZStack {
          Circle()
            .fill(isSelected ? Palette.accent.gold.opacity(0.2) : Color.white.opacity(0.05))
            .frame(width: 60, height: 60)

          Image(systemName: item.icon)
            .font(.system(size: 24))
            .foregroundColor(isSelected ? Palette.accent.gold : .white.opacity(0.6))

          if isSelected {
            Circle()
              .stroke(Palette.accent.gold, lineWidth: 2)
              .frame(width: 60, height: 60)
          }
        }

        Text(item.title)
          .font(.system(size: 12, weight: .medium))
          .foregroundColor(isSelected ? .white : .white.opacity(0.6))
      }
    }
    .buttonStyle(PlainButtonStyle())
  }
}

// MARK: - Preview

#Preview {
  PersonalizedLandingView(
    journeyStore: UserJourneyStore.shared,
    selectedTab: .constant(0)
  )
}
