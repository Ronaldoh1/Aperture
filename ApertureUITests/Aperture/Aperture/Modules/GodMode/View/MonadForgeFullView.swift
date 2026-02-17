// MonadForgeFullView.swift
// The Reality Shifting Engine - Create, Track, and Manifest
// Based on Neville Goddard's Law of Assumption + Tesla 3-6-9

import SwiftUI

struct MonadForgeFullView: View {
  @Environment(\.dismiss) private var dismiss
  @ObservedObject private var storage = GodModeStorage.shared
  @ObservedObject private var manager = GodModeManager.shared

  @State private var selectedTab: ForgeTab = .active
  @State private var showCreateSheet = false
  @State private var selectedShift: RealityShift?
  @State private var sparkAnimation = false

  enum ForgeTab: String, CaseIterable {
    case active = "Active"
    case realized = "Realized"
    case revised = "Revised"
  }

  var body: some View {
    NavigationStack {
      ZStack {
        forgeBackground

        VStack(spacing: 0) {
          // Stats header
          statsHeader

          // Tab selector
          tabSelector

          // Content
          if filteredShifts.isEmpty {
            emptyState
          } else {
            shiftsList
          }
        }
      }
      .navigationTitle("")
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItem(placement: .navigationBarLeading) {
          Button(action: { dismiss() }) {
            Image(systemName: "xmark.circle.fill")
              .font(.title2)
              .foregroundStyle(.white.opacity(0.7))
          }
        }

        ToolbarItem(placement: .principal) {
          HStack(spacing: 8) {
            Image(systemName: "flame.fill")
              .foregroundColor(Color(red: 1, green: 0.5, blue: 0))
            Text("MONAD FORGE")
              .font(.system(size: 16, weight: .black, design: .rounded))
              .tracking(2)
              .foregroundColor(.white)
          }
        }

        ToolbarItem(placement: .navigationBarTrailing) {
          Button(action: { showCreateSheet = true }) {
            Image(systemName: "plus.circle.fill")
              .font(.title2)
              .foregroundStyle(
                LinearGradient(
                  colors: [
                    Color(red: 1, green: 0.5, blue: 0), Color(red: 1, green: 0.84, blue: 0),
                  ],
                  startPoint: .top,
                  endPoint: .bottom
                )
              )
          }
        }
      }
      .sheet(isPresented: $showCreateSheet) {
        CreateRealityShiftView()
      }
      .sheet(item: $selectedShift) { shift in
        RealityShiftDetailView(shift: shift)
      }
    }
  }

  // MARK: - Background

  private var forgeBackground: some View {
    ZStack {
      Color.black.ignoresSafeArea()

      // Forge fire particles
      SwiftUI.TimelineView(.animation) { timeline in
        Canvas { context, size in
          let time = timeline.date.timeIntervalSinceReferenceDate

          for i in 0..<40 {
            let seed = Double(i)
            let baseY = size.height - 50
            let x = (sin(time * 0.5 + seed * 0.8) * 0.3 + 0.5) * size.width
            let yOffset =
              sin(time * 2 + seed) * 30
              + (time * 50 + seed * 20).truncatingRemainder(dividingBy: size.height)
            let y = baseY - yOffset.truncatingRemainder(dividingBy: size.height * 0.6)

            let radius = 2 + sin(time + seed) * 1.5
            let opacity = max(0, 1 - (baseY - y) / (size.height * 0.4)) * 0.6

            let color =
              i % 3 == 0
              ? Color(red: 1, green: 0.3, blue: 0).opacity(opacity)
              : Color(red: 1, green: 0.6, blue: 0).opacity(opacity * 0.8)

            context.fill(
              Path(
                ellipseIn: CGRect(
                  x: x - radius, y: y - radius, width: radius * 2, height: radius * 2)),
              with: .color(color)
            )
          }
        }
      }
      .opacity(0.4)
    }
  }

  // MARK: - Stats Header

  private var statsHeader: some View {
    HStack(spacing: 20) {
      statBadge(
        value: "\(storage.activeShiftsCount)",
        label: "Active",
        color: Color(red: 1, green: 0.5, blue: 0)
      )

      statBadge(
        value: "\(storage.realizedShiftsCount)",
        label: "Realized",
        color: Color(red: 0.2, green: 0.8, blue: 0.4)
      )

      statBadge(
        value: "\(storage.totalSATSSessions)",
        label: "SATS",
        color: Color(red: 0.3, green: 0.3, blue: 0.8)
      )

      statBadge(
        value: "\(manager.dailyStreakDays)",
        label: "Streak",
        color: Color(red: 1, green: 0.84, blue: 0)
      )
    }
    .padding(.vertical, 16)
    .padding(.horizontal, 20)
  }

  private func statBadge(value: String, label: String, color: Color) -> some View {
    VStack(spacing: 4) {
      Text(value)
        .font(.system(size: 24, weight: .black, design: .rounded))
        .foregroundColor(color)

      Text(label)
        .font(.system(size: 10, weight: .medium))
        .foregroundColor(.white.opacity(0.5))
    }
    .frame(maxWidth: .infinity)
  }

  // MARK: - Tab Selector

  private var tabSelector: some View {
    HStack(spacing: 0) {
      ForEach(ForgeTab.allCases, id: \.self) { tab in
        Button(action: {
          withAnimation(.spring(response: 0.3)) {
            selectedTab = tab
          }
          HapticManager.shared.selectionChanged()
        }) {
          VStack(spacing: 6) {
            Text(tab.rawValue)
              .font(.system(size: 14, weight: selectedTab == tab ? .bold : .medium))
              .foregroundColor(selectedTab == tab ? .white : .white.opacity(0.5))

            Rectangle()
              .fill(selectedTab == tab ? Color(red: 1, green: 0.5, blue: 0) : Color.clear)
              .frame(height: 2)
          }
        }
        .frame(maxWidth: .infinity)
      }
    }
    .padding(.horizontal, 20)
  }

  // MARK: - Filtered Shifts

  private var filteredShifts: [RealityShift] {
    switch selectedTab {
    case .active:
      return storage.realityShifts.filter { $0.status != .realized && $0.status != .revised }
    case .realized:
      return storage.realityShifts.filter { $0.status == .realized }
    case .revised:
      return storage.realityShifts.filter { $0.status == .revised }
    }
  }

  // MARK: - Empty State

  private var emptyState: some View {
    VStack(spacing: 20) {
      Spacer()

      ZStack {
        Circle()
          .fill(
            RadialGradient(
              colors: [
                Color(red: 1, green: 0.5, blue: 0).opacity(sparkAnimation ? 0.3 : 0.1), Color.clear,
              ],
              center: .center,
              startRadius: 20,
              endRadius: sparkAnimation ? 80 : 60
            )
          )
          .frame(width: 160, height: 160)

        Image(systemName: "flame.fill")
          .font(.system(size: 60))
          .foregroundStyle(
            LinearGradient(
              colors: [Color(red: 1, green: 0.5, blue: 0), Color(red: 1, green: 0.84, blue: 0)],
              startPoint: .bottom,
              endPoint: .top
            )
          )
      }
      .onAppear {
        withAnimation(.easeInOut(duration: 2).repeatForever(autoreverses: true)) {
          sparkAnimation = true
        }
      }

      VStack(spacing: 8) {
        Text(selectedTab == .active ? "NO ACTIVE SHIFTS" : "NONE YET")
          .font(.system(size: 16, weight: .bold, design: .rounded))
          .tracking(2)
          .foregroundColor(.white.opacity(0.7))

        Text(
          selectedTab == .active
            ? "The forge awaits your desire.\nWhat reality will you create?"
            : "Your manifestations will appear here."
        )
        .font(.system(size: 14, weight: .medium))
        .foregroundColor(.white.opacity(0.5))
        .multilineTextAlignment(.center)
      }

      if selectedTab == .active {
        Button(action: { showCreateSheet = true }) {
          HStack(spacing: 8) {
            Image(systemName: "plus")
            Text("CREATE SHIFT")
              .font(.system(size: 14, weight: .bold))
          }
          .foregroundColor(.black)
          .padding(.horizontal, 24)
          .padding(.vertical, 12)
          .background(
            Capsule()
              .fill(
                LinearGradient(
                  colors: [
                    Color(red: 1, green: 0.5, blue: 0), Color(red: 1, green: 0.84, blue: 0),
                  ],
                  startPoint: .leading,
                  endPoint: .trailing
                )
              )
          )
        }
      }

      Spacer()
    }
  }

  // MARK: - Shifts List

  private var shiftsList: some View {
    ScrollView(showsIndicators: false) {
      LazyVStack(spacing: 12) {
        ForEach(filteredShifts) { shift in
          RealityShiftCard(shift: shift) {
            selectedShift = shift
          }
        }
      }
      .padding(.horizontal, 20)
      .padding(.top, 16)
      .padding(.bottom, 100)
    }
  }
}

// MARK: - Reality Shift Card

struct RealityShiftCard: View {
  let shift: RealityShift
  let onTap: () -> Void

  var body: some View {
    Button(action: onTap) {
      VStack(alignment: .leading, spacing: 12) {
        // Header
        HStack {
          statusBadge
          Spacer()
          Text("\(shift.completedNights)/\(shift.targetNights) nights")
            .font(.system(size: 11, weight: .medium, design: .monospaced))
            .foregroundColor(.white.opacity(0.5))
        }

        // Desire
        Text(shift.desire)
          .font(.system(size: 16, weight: .semibold))
          .foregroundColor(.white)
          .lineLimit(2)

        // Scene preview
        Text("Scene: \(shift.scene)")
          .font(.system(size: 12, weight: .medium))
          .foregroundColor(.white.opacity(0.6))
          .lineLimit(1)

        // Progress bar
        GeometryReader { geo in
          ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 3)
              .fill(Color.white.opacity(0.1))

            RoundedRectangle(cornerRadius: 3)
              .fill(statusColor)
              .frame(width: geo.size.width * shift.progress)
          }
        }
        .frame(height: 6)

        // Footer
        HStack {
          // Synchronicities count
          if !shift.synchronicities.isEmpty {
            HStack(spacing: 4) {
              Image(systemName: "sparkles")
                .font(.system(size: 10))
              Text("\(shift.synchronicities.count) syncs")
                .font(.system(size: 10, weight: .medium))
            }
            .foregroundColor(Color(red: 0.9, green: 0.4, blue: 0.8))
          }

          Spacer()

          // Days ago
          Text(daysAgoText)
            .font(.system(size: 10, weight: .medium))
            .foregroundColor(.white.opacity(0.4))
        }
      }
      .padding(16)
      .background(
        RoundedRectangle(cornerRadius: 12)
          .fill(Color.white.opacity(0.05))
          .overlay(
            RoundedRectangle(cornerRadius: 12)
              .stroke(statusColor.opacity(0.3), lineWidth: 1)
          )
      )
    }
    .buttonStyle(ScaleButtonStyle())
  }

  private var statusBadge: some View {
    Text(shift.status.rawValue.uppercased())
      .font(.system(size: 10, weight: .bold, design: .rounded))
      .tracking(1)
      .foregroundColor(statusColor)
      .padding(.horizontal, 8)
      .padding(.vertical, 4)
      .background(
        Capsule().fill(statusColor.opacity(0.2))
      )
  }

  private var statusColor: Color {
    switch shift.status {
    case .planting: return Color(red: 1, green: 0.84, blue: 0)
    case .embodying: return Color(red: 0, green: 0.9, blue: 1)
    case .manifesting: return Color(red: 0.6, green: 0.3, blue: 1)
    case .realized: return Color(red: 0.2, green: 0.8, blue: 0.4)
    case .revised: return Color(red: 0.5, green: 0.5, blue: 0.5)
    }
  }

  private var daysAgoText: String {
    let days = Calendar.current.dateComponents([.day], from: shift.createdAt, to: Date()).day ?? 0
    if days == 0 { return "Today" }
    if days == 1 { return "Yesterday" }
    return "\(days) days ago"
  }
}

// MARK: - Create Reality Shift View

struct CreateRealityShiftView: View {
  @Environment(\.dismiss) private var dismiss
  @ObservedObject private var storage = GodModeStorage.shared

  @State private var desire: String = ""
  @State private var scene: String = ""
  @State private var feeling: String = ""
  @State private var targetNights: Int = 14
  @State private var currentStep: Int = 1

  var body: some View {
    NavigationStack {
      ZStack {
        Color.black.ignoresSafeArea()

        ScrollView(showsIndicators: false) {
          VStack(spacing: 24) {
            // Progress indicator
            progressIndicator

            // Step content
            switch currentStep {
            case 1: step1DesireInput
            case 2: step2SceneInput
            case 3: step3FeelingInput
            case 4: step4Review
            default: EmptyView()
            }
          }
          .padding(24)
        }
      }
      .navigationTitle("")
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItem(placement: .navigationBarLeading) {
          Button("Cancel") { dismiss() }
            .foregroundColor(.white.opacity(0.7))
        }

        ToolbarItem(placement: .principal) {
          Text("CREATE SHIFT")
            .font(.system(size: 14, weight: .bold, design: .rounded))
            .tracking(2)
            .foregroundColor(.white)
        }
      }
    }
  }

  // MARK: - Progress Indicator

  private var progressIndicator: some View {
    HStack(spacing: 8) {
      ForEach(1...4, id: \.self) { step in
        Circle()
          .fill(step <= currentStep ? Color(red: 1, green: 0.5, blue: 0) : Color.white.opacity(0.2))
          .frame(width: 10, height: 10)

        if step < 4 {
          Rectangle()
            .fill(
              step < currentStep ? Color(red: 1, green: 0.5, blue: 0) : Color.white.opacity(0.2)
            )
            .frame(height: 2)
        }
      }
    }
    .padding(.vertical, 12)
  }

  // MARK: - Step 1: Desire

  private var step1DesireInput: some View {
    VStack(alignment: .leading, spacing: 16) {
      Text("WHAT DO YOU DESIRE?")
        .font(.system(size: 12, weight: .bold, design: .rounded))
        .tracking(2)
        .foregroundColor(Color(red: 1, green: 0.5, blue: 0))

      Text("State your desire as if it's already done. \"I am...\" or \"I have...\"")
        .font(.system(size: 14, weight: .medium))
        .foregroundColor(.white.opacity(0.6))

      TextField("I am living in my dream home...", text: $desire, axis: .vertical)
        .font(.system(size: 18, weight: .medium))
        .foregroundColor(.white)
        .padding(16)
        .background(
          RoundedRectangle(cornerRadius: 12)
            .fill(Color.white.opacity(0.05))
            .overlay(
              RoundedRectangle(cornerRadius: 12)
                .stroke(Color(red: 1, green: 0.5, blue: 0).opacity(0.3), lineWidth: 1)
            )
        )
        .lineLimit(3...6)

      exampleBox(
        "Examples: \"I am wealthy and financially free.\" \"I am in a loving relationship with my soulmate.\" \"I am healthy and full of energy.\""
      )

      Spacer()

      nextButton(enabled: !desire.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
    }
  }

  // MARK: - Step 2: Scene

  private var step2SceneInput: some View {
    VStack(alignment: .leading, spacing: 16) {
      Text("CREATE YOUR SATS SCENE")
        .font(.system(size: 12, weight: .bold, design: .rounded))
        .tracking(2)
        .foregroundColor(Color(red: 0.3, green: 0.3, blue: 0.8))

      Text(
        "Describe a short scene (5-10 seconds) that IMPLIES the wish is already fulfilled. First person, present tense."
      )
      .font(.system(size: 14, weight: .medium))
      .foregroundColor(.white.opacity(0.6))

      TextField("I see my bank balance showing $1M...", text: $scene, axis: .vertical)
        .font(.system(size: 18, weight: .medium))
        .foregroundColor(.white)
        .padding(16)
        .background(
          RoundedRectangle(cornerRadius: 12)
            .fill(Color.white.opacity(0.05))
            .overlay(
              RoundedRectangle(cornerRadius: 12)
                .stroke(Color(red: 0.3, green: 0.3, blue: 0.8).opacity(0.3), lineWidth: 1)
            )
        )
        .lineLimit(3...6)

      exampleBox(
        "Key: The scene must IMPLY the end. Don't visualize getting the thing—visualize HAVING it. Example: For a relationship, imagine lying next to them hearing \"I love you.\" For wealth, imagine checking your balance with calm satisfaction."
      )

      Spacer()

      HStack(spacing: 16) {
        backButton
        nextButton(enabled: !scene.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
      }
    }
  }

  // MARK: - Step 3: Feeling

  private var step3FeelingInput: some View {
    VStack(alignment: .leading, spacing: 16) {
      Text("ANCHOR THE FEELING")
        .font(.system(size: 12, weight: .bold, design: .rounded))
        .tracking(2)
        .foregroundColor(Color(red: 0.2, green: 0.8, blue: 0.4))

      Text(
        "What emotion/feeling anchors this reality? This is your trigger phrase when doubt arises."
      )
      .font(.system(size: 14, weight: .medium))
      .foregroundColor(.white.opacity(0.6))

      TextField("Peaceful abundance, deep gratitude...", text: $feeling, axis: .vertical)
        .font(.system(size: 18, weight: .medium))
        .foregroundColor(.white)
        .padding(16)
        .background(
          RoundedRectangle(cornerRadius: 12)
            .fill(Color.white.opacity(0.05))
            .overlay(
              RoundedRectangle(cornerRadius: 12)
                .stroke(Color(red: 0.2, green: 0.8, blue: 0.4).opacity(0.3), lineWidth: 1)
            )
        )
        .lineLimit(2...4)

      VStack(alignment: .leading, spacing: 8) {
        Text("QUICK ANCHORS")
          .font(.system(size: 10, weight: .bold))
          .foregroundColor(.white.opacity(0.4))

        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 8) {
          ForEach(["Isn't it wonderful?", "Thank you!", "It is done.", "Of course."], id: \.self) {
            anchor in
            Button(action: { feeling = anchor }) {
              Text(anchor)
                .font(.system(size: 12, weight: .medium))
                .foregroundColor(feeling == anchor ? .black : .white.opacity(0.7))
                .padding(.horizontal, 12)
                .padding(.vertical, 8)
                .frame(maxWidth: .infinity)
                .background(
                  RoundedRectangle(cornerRadius: 8)
                    .fill(
                      feeling == anchor
                        ? Color(red: 0.2, green: 0.8, blue: 0.4) : Color.white.opacity(0.1))
                )
            }
          }
        }
      }

      // Target nights
      VStack(alignment: .leading, spacing: 8) {
        Text("TARGET NIGHTS: \(targetNights)")
          .font(.system(size: 10, weight: .bold))
          .foregroundColor(.white.opacity(0.4))

        Slider(
          value: Binding(
            get: { Double(targetNights) },
            set: { targetNights = Int($0) }
          ), in: 7...30, step: 1
        )
        .tint(Color(red: 0.2, green: 0.8, blue: 0.4))
      }
      .padding(.top, 8)

      Spacer()

      HStack(spacing: 16) {
        backButton
        nextButton(enabled: !feeling.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
      }
    }
  }

  // MARK: - Step 4: Review

  private var step4Review: some View {
    VStack(alignment: .leading, spacing: 20) {
      Text("SEAL YOUR SHIFT")
        .font(.system(size: 12, weight: .bold, design: .rounded))
        .tracking(2)
        .foregroundColor(Color(red: 1, green: 0.84, blue: 0))

      // Review card
      VStack(alignment: .leading, spacing: 16) {
        reviewItem("DESIRE", desire, Color(red: 1, green: 0.5, blue: 0))
        Divider().background(Color.white.opacity(0.1))
        reviewItem("SATS SCENE", scene, Color(red: 0.3, green: 0.3, blue: 0.8))
        Divider().background(Color.white.opacity(0.1))
        reviewItem("FEELING ANCHOR", feeling, Color(red: 0.2, green: 0.8, blue: 0.4))
        Divider().background(Color.white.opacity(0.1))
        reviewItem(
          "COMMITMENT", "\(targetNights) nights of SATS", Color(red: 1, green: 0.84, blue: 0))
      }
      .padding(20)
      .background(
        RoundedRectangle(cornerRadius: 16)
          .fill(Color.white.opacity(0.05))
      )

      // Neville quote
      VStack(spacing: 8) {
        Text(
          "\"Assume the feeling of the wish fulfilled and observe the route that your attention follows.\""
        )
        .font(.system(size: 14, weight: .medium, design: .serif))
        .italic()
        .foregroundColor(.white.opacity(0.7))
        .multilineTextAlignment(.center)

        Text("— Neville Goddard")
          .font(.system(size: 12, weight: .medium))
          .foregroundColor(Color(red: 1, green: 0.84, blue: 0).opacity(0.8))
      }
      .padding(.vertical, 12)

      Spacer()

      HStack(spacing: 16) {
        backButton

        Button(action: createShift) {
          HStack(spacing: 8) {
            Image(systemName: "flame.fill")
            Text("FORGE REALITY")
              .font(.system(size: 14, weight: .bold))
          }
          .foregroundColor(.black)
          .frame(maxWidth: .infinity)
          .padding(.vertical, 16)
          .background(
            Capsule()
              .fill(
                LinearGradient(
                  colors: [
                    Color(red: 1, green: 0.5, blue: 0), Color(red: 1, green: 0.84, blue: 0),
                  ],
                  startPoint: .leading,
                  endPoint: .trailing
                )
              )
          )
        }
      }
    }
  }

  private func reviewItem(_ label: String, _ value: String, _ color: Color) -> some View {
    VStack(alignment: .leading, spacing: 4) {
      Text(label)
        .font(.system(size: 10, weight: .bold, design: .rounded))
        .tracking(1)
        .foregroundColor(color)

      Text(value)
        .font(.system(size: 14, weight: .medium))
        .foregroundColor(.white)
    }
  }

  // MARK: - Helpers

  private func exampleBox(_ text: String) -> some View {
    HStack(alignment: .top, spacing: 8) {
      Image(systemName: "lightbulb.fill")
        .font(.system(size: 12))
        .foregroundColor(Color(red: 1, green: 0.84, blue: 0))

      Text(text)
        .font(.system(size: 12, weight: .medium))
        .foregroundColor(.white.opacity(0.5))
    }
    .padding(12)
    .background(
      RoundedRectangle(cornerRadius: 8)
        .fill(Color(red: 1, green: 0.84, blue: 0).opacity(0.1))
    )
  }

  private func nextButton(enabled: Bool) -> some View {
    Button(action: {
      withAnimation { currentStep += 1 }
      HapticManager.shared.medium()
    }) {
      Text(currentStep == 3 ? "REVIEW" : "NEXT")
        .font(.system(size: 14, weight: .bold))
        .foregroundColor(.black)
        .frame(maxWidth: .infinity)
        .padding(.vertical, 16)
        .background(
          Capsule()
            .fill(enabled ? Color(red: 1, green: 0.5, blue: 0) : Color.white.opacity(0.2))
        )
    }
    .disabled(!enabled)
  }

  private var backButton: some View {
    Button(action: {
      withAnimation { currentStep -= 1 }
    }) {
      Text("BACK")
        .font(.system(size: 14, weight: .bold))
        .foregroundColor(.white.opacity(0.7))
        .padding(.vertical, 16)
        .padding(.horizontal, 24)
        .background(
          Capsule()
            .stroke(Color.white.opacity(0.3), lineWidth: 1)
        )
    }
  }

  private func createShift() {
    let shift = RealityShift.create(desire: desire, scene: scene, feeling: feeling)
    var mutableShift = shift
    mutableShift.targetNights = targetNights
    storage.addRealityShift(mutableShift)

    HapticManager.shared.success()
    dismiss()
  }
}

// MARK: - Reality Shift Detail View

struct RealityShiftDetailView: View {
  let shift: RealityShift
  @Environment(\.dismiss) private var dismiss
  @ObservedObject private var storage = GodModeStorage.shared

  @State private var showSATSSession = false
  @State private var showAddSync = false

  var body: some View {
    NavigationStack {
      ZStack {
        Color.black.ignoresSafeArea()

        ScrollView(showsIndicators: false) {
          VStack(spacing: 24) {
            // Status & Progress
            progressSection

            // Quick Actions
            actionButtons

            // Details
            detailsSection

            // Synchronicities
            if !shift.synchronicities.isEmpty {
              synchronicitiesSection
            }

            Spacer(minLength: 100)
          }
          .padding(20)
        }
      }
      .navigationTitle("")
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItem(placement: .navigationBarLeading) {
          Button("Close") { dismiss() }
            .foregroundColor(.white.opacity(0.7))
        }

        ToolbarItem(placement: .principal) {
          Text("REALITY SHIFT")
            .font(.system(size: 14, weight: .bold, design: .rounded))
            .tracking(2)
            .foregroundColor(.white)
        }
      }
      .sheet(isPresented: $showSATSSession) {
        SATSSessionView(shiftId: shift.id, scene: shift.scene)
      }
    }
  }

  private var progressSection: some View {
    VStack(spacing: 16) {
      // Big progress circle
      ZStack {
        Circle()
          .stroke(Color.white.opacity(0.1), lineWidth: 8)
          .frame(width: 120, height: 120)

        Circle()
          .trim(from: 0, to: shift.progress)
          .stroke(
            LinearGradient(
              colors: [Color(red: 1, green: 0.5, blue: 0), Color(red: 1, green: 0.84, blue: 0)],
              startPoint: .topLeading,
              endPoint: .bottomTrailing
            ),
            style: StrokeStyle(lineWidth: 8, lineCap: .round)
          )
          .frame(width: 120, height: 120)
          .rotationEffect(.degrees(-90))

        VStack(spacing: 2) {
          Text("\(shift.completedNights)")
            .font(.system(size: 32, weight: .black, design: .rounded))
            .foregroundColor(.white)

          Text("of \(shift.targetNights)")
            .font(.system(size: 12, weight: .medium))
            .foregroundColor(.white.opacity(0.5))
        }
      }

      Text(shift.status.rawValue.uppercased())
        .font(.system(size: 12, weight: .bold, design: .rounded))
        .tracking(2)
        .foregroundColor(Color(red: 1, green: 0.5, blue: 0))
    }
  }

  private var actionButtons: some View {
    HStack(spacing: 12) {
      Button(action: { showSATSSession = true }) {
        VStack(spacing: 8) {
          Image(systemName: "moon.zzz.fill")
            .font(.system(size: 24))
          Text("SATS")
            .font(.system(size: 10, weight: .bold))
        }
        .foregroundColor(.white)
        .frame(maxWidth: .infinity)
        .padding(.vertical, 16)
        .background(
          RoundedRectangle(cornerRadius: 12)
            .fill(Color(red: 0.3, green: 0.3, blue: 0.8))
        )
      }

      Button(action: { showAddSync = true }) {
        VStack(spacing: 8) {
          Image(systemName: "sparkles")
            .font(.system(size: 24))
          Text("LOG SYNC")
            .font(.system(size: 10, weight: .bold))
        }
        .foregroundColor(.white)
        .frame(maxWidth: .infinity)
        .padding(.vertical, 16)
        .background(
          RoundedRectangle(cornerRadius: 12)
            .fill(Color(red: 0.9, green: 0.4, blue: 0.8))
        )
      }

      Button(action: markRealized) {
        VStack(spacing: 8) {
          Image(systemName: "checkmark.seal.fill")
            .font(.system(size: 24))
          Text("REALIZED")
            .font(.system(size: 10, weight: .bold))
        }
        .foregroundColor(.white)
        .frame(maxWidth: .infinity)
        .padding(.vertical, 16)
        .background(
          RoundedRectangle(cornerRadius: 12)
            .fill(Color(red: 0.2, green: 0.8, blue: 0.4))
        )
      }
    }
  }

  private var detailsSection: some View {
    VStack(alignment: .leading, spacing: 16) {
      detailItem("DESIRE", shift.desire, "flame.fill", Color(red: 1, green: 0.5, blue: 0))
      detailItem("SATS SCENE", shift.scene, "moon.zzz.fill", Color(red: 0.3, green: 0.3, blue: 0.8))
      detailItem(
        "FEELING ANCHOR", shift.feelingState, "heart.fill", Color(red: 0.2, green: 0.8, blue: 0.4))
    }
    .padding(20)
    .background(
      RoundedRectangle(cornerRadius: 16)
        .fill(Color.white.opacity(0.05))
    )
  }

  private func detailItem(_ label: String, _ value: String, _ icon: String, _ color: Color)
    -> some View
  {
    VStack(alignment: .leading, spacing: 8) {
      HStack(spacing: 6) {
        Image(systemName: icon)
          .font(.system(size: 12))
          .foregroundColor(color)

        Text(label)
          .font(.system(size: 10, weight: .bold, design: .rounded))
          .tracking(1)
          .foregroundColor(color)
      }

      Text(value)
        .font(.system(size: 14, weight: .medium))
        .foregroundColor(.white)
    }
  }

  private var synchronicitiesSection: some View {
    VStack(alignment: .leading, spacing: 12) {
      Text("SYNCHRONICITIES")
        .font(.system(size: 11, weight: .bold, design: .rounded))
        .tracking(2)
        .foregroundColor(Color(red: 0.9, green: 0.4, blue: 0.8))

      ForEach(shift.synchronicities) { sync in
        HStack(spacing: 12) {
          Image(systemName: sync.category.icon)
            .foregroundColor(Color(red: 0.9, green: 0.4, blue: 0.8))

          VStack(alignment: .leading, spacing: 2) {
            Text(sync.description)
              .font(.system(size: 13, weight: .medium))
              .foregroundColor(.white)

            Text(sync.category.rawValue)
              .font(.system(size: 10, weight: .medium))
              .foregroundColor(.white.opacity(0.5))
          }

          Spacer()
        }
        .padding(12)
        .background(
          RoundedRectangle(cornerRadius: 8)
            .fill(Color.white.opacity(0.03))
        )
      }
    }
  }

  private func markRealized() {
    var updated = shift
    updated.status = .realized
    storage.updateRealityShift(updated)
    HapticManager.shared.success()
    dismiss()
  }
}

// MARK: - SATS Session View (Placeholder)

struct SATSSessionView: View {
  let shiftId: UUID
  let scene: String
  @Environment(\.dismiss) private var dismiss

  var body: some View {
    NavigationStack {
      ZStack {
        Color.black.ignoresSafeArea()
        Text("SATS Session - Coming Soon")
          .foregroundColor(.white)
      }
      .navigationTitle("SATS Session")
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItem(placement: .navigationBarTrailing) {
          Button("Done") { dismiss() }
        }
      }
    }
  }
}
