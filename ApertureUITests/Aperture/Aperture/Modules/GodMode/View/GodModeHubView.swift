// GodModeHubView.swift
// The central command center for reality manipulation
// Access: Monad Forge, SATS, 3-6-9, Revision, Solar Sync, and more

import SwiftUI

struct GodModeHubView: View {
  @Environment(\.dismiss) private var dismiss
  @ObservedObject var manager = GodModeManager.shared

  @State private var selectedTool: GodModeTool?
  @State private var showMonadForge = false
  @State private var showSATSSession = false
  @State private var showThreeSixNine = false
  @State private var showRevision = false
  @State private var showMentalDiet = false
  @State private var showSolarSync = false
  @State private var showBardoNavigator = false
  @State private var showVibrationShield = false
  @State private var showDailyCheckIn = false
  @State private var showSynchronicities = false
  @State private var showCurriculum = false
  @State private var showEtymologyCourse = false
  @State private var sparkPulse = false

  enum GodModeTool: String, CaseIterable {
    case monadForge = "Monad Forge"
    case sats = "SATS Chamber"
    case threeSixNine = "3-6-9 Encoder"
    case revision = "Revision Lab"
    case mentalDiet = "Mental Diet"
    case solarSync = "Solar Sync"
    case bardoNavigator = "Bardo Navigator"
    case vibrationShield = "Vibe Shield"
    case dailyCheckIn = "Monad Check-In"
    case synchronicities = "Sync Tracker"

    var icon: String {
      switch self {
      case .monadForge: return "flame.fill"
      case .sats: return "moon.zzz.fill"
      case .threeSixNine: return "rotate.3d"
      case .revision: return "arrow.counterclockwise.circle.fill"
      case .mentalDiet: return "brain.head.profile"
      case .solarSync: return "sun.max.fill"
      case .bardoNavigator: return "figure.walk.departure"
      case .vibrationShield: return "shield.checkered"
      case .dailyCheckIn: return "checkmark.seal.fill"
      case .synchronicities: return "point.3.connected.trianglepath.dotted"
      }
    }

    var description: String {
      switch self {
      case .monadForge: return "Create & track reality shifts"
      case .sats: return "State Akin to Sleep sessions"
      case .threeSixNine: return "Tesla encoding rituals"
      case .revision: return "Rewrite past events"
      case .mentalDiet: return "Catch & flip thoughts"
      case .solarSync: return "Pineal activation protocol"
      case .bardoNavigator: return "Death-rebirth practices"
      case .vibrationShield: return "Energy protection"
      case .dailyCheckIn: return "Daily vibration audit"
      case .synchronicities: return "Track reality feedback"
      }
    }

    var gradient: [Color] {
      switch self {
      case .monadForge:
        return [Color(red: 1, green: 0.5, blue: 0), Color(red: 1, green: 0.2, blue: 0)]
      case .sats:
        return [Color(red: 0.3, green: 0.3, blue: 0.8), Color(red: 0.1, green: 0.1, blue: 0.4)]
      case .threeSixNine:
        return [Color(red: 0.6, green: 0.3, blue: 1), Color(red: 0.4, green: 0.1, blue: 0.8)]
      case .revision:
        return [Color(red: 0, green: 0.8, blue: 0.6), Color(red: 0, green: 0.5, blue: 0.4)]
      case .mentalDiet:
        return [Color(red: 0.2, green: 0.7, blue: 1), Color(red: 0.1, green: 0.4, blue: 0.8)]
      case .solarSync:
        return [Color(red: 1, green: 0.84, blue: 0), Color(red: 1, green: 0.6, blue: 0)]
      case .bardoNavigator:
        return [Color(red: 0.3, green: 0.1, blue: 0.3), Color(red: 0.1, green: 0, blue: 0.2)]
      case .vibrationShield:
        return [Color(red: 0, green: 0.9, blue: 1), Color(red: 0.4, green: 0.6, blue: 1)]
      case .dailyCheckIn:
        return [Color(red: 0.2, green: 0.8, blue: 0.4), Color(red: 0.1, green: 0.5, blue: 0.3)]
      case .synchronicities:
        return [Color(red: 0.9, green: 0.4, blue: 0.8), Color(red: 0.6, green: 0.2, blue: 0.6)]
      }
    }
  }

  var body: some View {
    NavigationStack {
      ZStack {
        // Cosmic background
        godModeBackground

        ScrollView(showsIndicators: false) {
          VStack(spacing: 24) {
            // Header with spark
            headerSection

            // Courses Section (Esoteric + Etymology)
            coursesSection

            // Monad Status
            monadStatusCard

            // Primary Tools (2x2 grid for main features)
            primaryToolsSection

            // Secondary Tools
            secondaryToolsSection

            // Quick Affirmation
            quickAffirmationCard

            Spacer(minLength: 100)
          }
          .padding(.horizontal, 20)
          .padding(.top, 20)
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
          Text("G O D M O D E")
            .font(.system(size: 16, weight: .black, design: .rounded))
            .tracking(4)
            .foregroundStyle(
              LinearGradient(
                colors: [Color(red: 1, green: 0.84, blue: 0), .white],
                startPoint: .leading,
                endPoint: .trailing
              )
            )
        }
      }
      .sheet(isPresented: $showMonadForge) {
        MonadForgeView()
      }
      .sheet(isPresented: $showSATSSession) {
        SATSChamberView()
      }
      .sheet(isPresented: $showThreeSixNine) {
        ThreeSixNineEncoderView()
      }
      .sheet(isPresented: $showRevision) {
        RevisionLabView()
      }
      .sheet(isPresented: $showMentalDiet) {
        MentalDietView()
      }
      .sheet(isPresented: $showSolarSync) {
        SolarSyncView()
      }
      .sheet(isPresented: $showBardoNavigator) {
        BardoNavigatorView()
      }
      .sheet(isPresented: $showVibrationShield) {
        VibrationShieldView()
      }
      .sheet(isPresented: $showDailyCheckIn) {
        MonadCheckInView()
      }
      .sheet(isPresented: $showSynchronicities) {
        SynchronicityTrackerView()
      }
      .sheet(isPresented: $showCurriculum) {
        GodModeCourseView()
      }
      .sheet(isPresented: $showEtymologyCourse) {
        EtymologyCourseView()
      }
    }
  }

  // MARK: - Background

  private var godModeBackground: some View {
    ZStack {
      Color.black.ignoresSafeArea()

      // Animated particles
      SwiftUI.TimelineView(.animation) { timeline in
        Canvas { context, size in
          let time = timeline.date.timeIntervalSinceReferenceDate

          for i in 0..<60 {
            let seed = Double(i)
            let x = (sin(time * 0.3 + seed * 0.5) * 0.5 + 0.5) * size.width
            let y = (cos(time * 0.2 + seed * 0.7) * 0.5 + 0.5) * size.height
            let radius = (sin(time * 0.5 + seed) * 0.5 + 0.5) * 2 + 0.5
            let opacity = (sin(time + seed * 0.3) * 0.5 + 0.5) * 0.5

            let color =
              i % 3 == 0
              ? Color(red: 1, green: 0.84, blue: 0).opacity(opacity)
              : Color(red: 0.6, green: 0.3, blue: 1).opacity(opacity * 0.6)

            context.fill(
              Path(
                ellipseIn: CGRect(
                  x: x - radius, y: y - radius, width: radius * 2, height: radius * 2)),
              with: .color(color)
            )
          }
        }
      }

      // Vignette
      RadialGradient(
        colors: [Color.clear, Color.black.opacity(0.8)],
        center: .center,
        startRadius: 100,
        endRadius: 500
      )
      .ignoresSafeArea()
    }
  }

  // MARK: - Curriculum Card

  // MARK: - Courses Section

  private var coursesSection: some View {
    VStack(spacing: 16) {
      // Section header
      HStack {
        Text("SACRED CURRICULUM")
          .font(.system(size: 11, weight: .bold))
          .foregroundColor(Color(red: 1, green: 0.84, blue: 0))
          .tracking(1)

        Spacer()
      }

      // Esoteric Path Course
      Button {
        showCurriculum = true
      } label: {
        courseCard(
          title: "The Esoteric Path",
          subtitle: "7 Gates to Mastery",
          description: "From ignition to integration",
          icon: "book.closed.fill",
          gradientColors: [
            Color(red: 1, green: 0.84, blue: 0), Color(red: 1, green: 0.5, blue: 0),
          ],
          progress: getEsotericProgress()
        )
      }

      // Etymology Course
      Button {
        showEtymologyCourse = true
      } label: {
        courseCard(
          title: "The Word Is The Sword",
          subtitle: "Etymology & Word Power",
          description: "Unlock the occult power of language",
          icon: "text.book.closed.fill",
          gradientColors: [Color(hex: "#9C27B0"), Color(hex: "#E040FB")],
          progress: getEtymologyProgress()
        )
      }
    }
  }

  private func courseCard(
    title: String,
    subtitle: String,
    description: String,
    icon: String,
    gradientColors: [Color],
    progress: Double
  ) -> some View {
    HStack(spacing: 16) {
      // Icon
      ZStack {
        Circle()
          .fill(
            LinearGradient(
              colors: gradientColors,
              startPoint: .topLeading,
              endPoint: .bottomTrailing
            )
          )
          .frame(width: 50, height: 50)

        Image(systemName: icon)
          .font(.system(size: 22))
          .foregroundColor(.black)
      }

      VStack(alignment: .leading, spacing: 4) {
        Text(subtitle.uppercased())
          .font(.system(size: 10, weight: .bold))
          .foregroundColor(gradientColors[0])
          .tracking(0.5)

        Text(title)
          .font(.system(size: 16, weight: .bold))
          .foregroundColor(.white)

        Text(description)
          .font(.system(size: 11))
          .foregroundColor(.white.opacity(0.6))

        // Progress bar
        if progress > 0 {
          GeometryReader { geo in
            ZStack(alignment: .leading) {
              RoundedRectangle(cornerRadius: 2)
                .fill(Color.white.opacity(0.1))
                .frame(height: 4)

              RoundedRectangle(cornerRadius: 2)
                .fill(
                  LinearGradient(colors: gradientColors, startPoint: .leading, endPoint: .trailing)
                )
                .frame(width: geo.size.width * progress, height: 4)
            }
          }
          .frame(height: 4)
        }
      }

      Spacer()

      VStack(alignment: .trailing, spacing: 4) {
        if progress > 0 && progress < 1 {
          Text("\(Int(progress * 100))%")
            .font(.system(size: 12, weight: .bold))
            .foregroundColor(gradientColors[0])
        } else if progress >= 1 {
          Image(systemName: "checkmark.seal.fill")
            .foregroundColor(.green)
        }

        Image(systemName: "chevron.right")
          .font(.system(size: 14, weight: .semibold))
          .foregroundColor(gradientColors[0].opacity(0.6))
      }
    }
    .padding(16)
    .background(
      RoundedRectangle(cornerRadius: 16)
        .fill(
          LinearGradient(
            colors: [
              gradientColors[0].opacity(0.15),
              gradientColors[1].opacity(0.1),
            ],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
          )
        )
        .overlay(
          RoundedRectangle(cornerRadius: 16)
            .stroke(
              LinearGradient(
                colors: [
                  gradientColors[0].opacity(0.5),
                  gradientColors[1].opacity(0.3),
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
              ),
              lineWidth: 1
            )
        )
    )
  }

  private func getEsotericProgress() -> Double {
    let progress = GodModeProgressManager.shared.progress
    let total = GodModeCourse.shared.modules.flatMap { $0.lessons }.count
    guard total > 0 else { return 0 }
    return Double(progress.completedLessons.count) / Double(total)
  }

  private func getEtymologyProgress() -> Double {
    let progress = EtymologyProgressManager.shared.progress
    let total = EtymologyCourse.shared.modules.flatMap { $0.lessons }.count
    guard total > 0 else { return 0 }
    return Double(progress.completedLessons.count) / Double(total)
  }

  private var curriculumCard: some View {
    Button {
      showCurriculum = true
    } label: {
      HStack(spacing: 16) {
        // Icon
        ZStack {
          Circle()
            .fill(
              LinearGradient(
                colors: [Color(red: 1, green: 0.84, blue: 0), Color(red: 1, green: 0.5, blue: 0)],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
              )
            )
            .frame(width: 50, height: 50)

          Image(systemName: "book.closed.fill")
            .font(.system(size: 22))
            .foregroundColor(.black)
        }

        VStack(alignment: .leading, spacing: 4) {
          Text("THE ESOTERIC CURRICULUM")
            .font(.system(size: 11, weight: .bold))
            .foregroundColor(Color(red: 1, green: 0.84, blue: 0))
            .tracking(1)

          Text("7 Gates to Mastery")
            .font(.system(size: 17, weight: .bold))
            .foregroundColor(.white)

          Text("Progressive lessons from ignition to integration")
            .font(.system(size: 12))
            .foregroundColor(.white.opacity(0.6))
        }

        Spacer()

        Image(systemName: "chevron.right")
          .font(.system(size: 16, weight: .semibold))
          .foregroundColor(Color(red: 1, green: 0.84, blue: 0).opacity(0.6))
      }
      .padding(16)
      .background(
        RoundedRectangle(cornerRadius: 16)
          .fill(
            LinearGradient(
              colors: [
                Color(red: 1, green: 0.84, blue: 0).opacity(0.15),
                Color(red: 0.6, green: 0.3, blue: 1).opacity(0.1),
              ],
              startPoint: .topLeading,
              endPoint: .bottomTrailing
            )
          )
          .overlay(
            RoundedRectangle(cornerRadius: 16)
              .stroke(
                LinearGradient(
                  colors: [
                    Color(red: 1, green: 0.84, blue: 0).opacity(0.5),
                    Color(red: 0.6, green: 0.3, blue: 1).opacity(0.3),
                  ],
                  startPoint: .topLeading,
                  endPoint: .bottomTrailing
                ),
                lineWidth: 1
              )
          )
      )
    }
  }

  // MARK: - Header

  private var headerSection: some View {
    VStack(spacing: 12) {
      // Pulsing spark
      ZStack {
        Circle()
          .fill(
            RadialGradient(
              colors: [
                Color(red: 1, green: 0.84, blue: 0).opacity(sparkPulse ? 0.6 : 0.3),
                Color.clear,
              ],
              center: .center,
              startRadius: 20,
              endRadius: sparkPulse ? 80 : 60
            )
          )
          .frame(width: 160, height: 160)

        Image(systemName: "sparkle")
          .font(.system(size: 50, weight: .light))
          .foregroundStyle(
            LinearGradient(
              colors: [Color(red: 1, green: 0.84, blue: 0), .white],
              startPoint: .top,
              endPoint: .bottom
            )
          )
          .shadow(color: Color(red: 1, green: 0.84, blue: 0).opacity(0.8), radius: 15)
      }
      .onAppear {
        withAnimation(.easeInOut(duration: 2).repeatForever(autoreverses: true)) {
          sparkPulse = true
        }
      }

      Text("I AM THE MONAD")
        .font(.system(size: 12, weight: .bold, design: .rounded))
        .tracking(4)
        .foregroundColor(.white.opacity(0.7))
    }
  }

  // MARK: - Monad Status

  private var monadStatusCard: some View {
    VStack(spacing: 16) {
      HStack {
        VStack(alignment: .leading, spacing: 4) {
          Text("Level \(manager.monadLevel)")
            .font(.system(size: 24, weight: .black, design: .rounded))
            .foregroundStyle(
              LinearGradient(
                colors: [Color(red: 1, green: 0.84, blue: 0), .white],
                startPoint: .leading,
                endPoint: .trailing
              )
            )

          Text(manager.monadLevelName)
            .font(.system(size: 14, weight: .medium))
            .foregroundColor(Color(red: 0, green: 0.9, blue: 1))
        }

        Spacer()

        VStack(alignment: .trailing, spacing: 4) {
          Text("\(manager.realityShiftsCompleted)")
            .font(.system(size: 24, weight: .black, design: .rounded))
            .foregroundColor(.white)

          Text("Reality Shifts")
            .font(.system(size: 12, weight: .medium))
            .foregroundColor(.white.opacity(0.6))
        }
      }

      // Spark intensity bar
      VStack(alignment: .leading, spacing: 6) {
        HStack {
          Text("Spark Intensity")
            .font(.system(size: 11, weight: .medium))
            .foregroundColor(.white.opacity(0.6))

          Spacer()

          Text("\(Int(manager.sparkIntensity * 100))%")
            .font(.system(size: 11, weight: .bold, design: .monospaced))
            .foregroundColor(Color(red: 1, green: 0.84, blue: 0))
        }

        GeometryReader { geo in
          ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 4)
              .fill(Color.white.opacity(0.1))

            RoundedRectangle(cornerRadius: 4)
              .fill(
                LinearGradient(
                  colors: [
                    Color(red: 1, green: 0.84, blue: 0),
                    Color(red: 1, green: 0.5, blue: 0),
                  ],
                  startPoint: .leading,
                  endPoint: .trailing
                )
              )
              .frame(width: geo.size.width * manager.sparkIntensity)
          }
        }
        .frame(height: 8)
      }

      // Streak
      if manager.dailyStreakDays > 0 {
        HStack {
          Image(systemName: "flame.fill")
            .foregroundColor(Color(red: 1, green: 0.5, blue: 0))

          Text("\(manager.dailyStreakDays) day streak")
            .font(.system(size: 12, weight: .semibold))
            .foregroundColor(.white.opacity(0.8))

          Spacer()

          Text(
            "Next: \(manager.nextLevelThreshold - manager.realityShiftsCompleted) shifts to level up"
          )
          .font(.system(size: 10, weight: .medium))
          .foregroundColor(.white.opacity(0.5))
        }
      }
    }
    .padding(20)
    .background(
      RoundedRectangle(cornerRadius: 16)
        .fill(Color.white.opacity(0.05))
        .overlay(
          RoundedRectangle(cornerRadius: 16)
            .stroke(
              LinearGradient(
                colors: [
                  Color(red: 1, green: 0.84, blue: 0).opacity(0.5),
                  Color(red: 0.6, green: 0.3, blue: 1).opacity(0.3),
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
              ),
              lineWidth: 1
            )
        )
    )
  }

  // MARK: - Primary Tools

  private var primaryToolsSection: some View {
    VStack(alignment: .leading, spacing: 12) {
      Text("REALITY TOOLS")
        .font(.system(size: 11, weight: .bold, design: .rounded))
        .tracking(2)
        .foregroundColor(.white.opacity(0.5))

      LazyVGrid(
        columns: [
          GridItem(.flexible(), spacing: 12),
          GridItem(.flexible(), spacing: 12),
        ], spacing: 12
      ) {
        toolCard(.monadForge) { showMonadForge = true }
        toolCard(.sats) { showSATSSession = true }
        toolCard(.threeSixNine) { showThreeSixNine = true }
        toolCard(.revision) { showRevision = true }
      }
    }
  }

  // MARK: - Secondary Tools

  private var secondaryToolsSection: some View {
    VStack(alignment: .leading, spacing: 12) {
      Text("CONSCIOUSNESS TOOLS")
        .font(.system(size: 11, weight: .bold, design: .rounded))
        .tracking(2)
        .foregroundColor(.white.opacity(0.5))

      LazyVGrid(
        columns: [
          GridItem(.flexible(), spacing: 12),
          GridItem(.flexible(), spacing: 12),
        ], spacing: 12
      ) {
        toolCard(.solarSync) { showSolarSync = true }
        toolCard(.bardoNavigator) { showBardoNavigator = true }
        toolCard(.vibrationShield) { showVibrationShield = true }
        toolCard(.mentalDiet) { showMentalDiet = true }
        toolCard(.dailyCheckIn) { showDailyCheckIn = true }
        toolCard(.synchronicities) { showSynchronicities = true }
      }
    }
  }

  // MARK: - Tool Card

  private func toolCard(_ tool: GodModeTool, action: @escaping () -> Void) -> some View {
    Button(action: {
      HapticManager.shared.medium()
      action()
    }) {
      VStack(alignment: .leading, spacing: 12) {
        Image(systemName: tool.icon)
          .font(.system(size: 28))
          .foregroundStyle(
            LinearGradient(
              colors: tool.gradient,
              startPoint: .topLeading,
              endPoint: .bottomTrailing
            )
          )

        VStack(alignment: .leading, spacing: 4) {
          Text(tool.rawValue)
            .font(.system(size: 14, weight: .bold))
            .foregroundColor(.white)

          Text(tool.description)
            .font(.system(size: 10, weight: .medium))
            .foregroundColor(.white.opacity(0.6))
            .lineLimit(2)
        }
      }
      .frame(maxWidth: .infinity, alignment: .leading)
      .padding(16)
      .background(
        RoundedRectangle(cornerRadius: 12)
          .fill(Color.white.opacity(0.05))
          .overlay(
            RoundedRectangle(cornerRadius: 12)
              .stroke(
                LinearGradient(
                  colors: [tool.gradient[0].opacity(0.4), Color.clear],
                  startPoint: .topLeading,
                  endPoint: .bottomTrailing
                ),
                lineWidth: 1
              )
          )
      )
    }
    .buttonStyle(ScaleButtonStyle())
  }

  // MARK: - Quick Affirmation

  private var quickAffirmationCard: some View {
    let affirmation = MonadAffirmation.library.randomElement()!

    return VStack(spacing: 12) {
      Text("🔥 SPARK REMINDER")
        .font(.system(size: 10, weight: .bold, design: .rounded))
        .tracking(2)
        .foregroundColor(Color(red: 1, green: 0.84, blue: 0).opacity(0.8))

      Text(affirmation.text)
        .font(.system(size: 16, weight: .medium, design: .serif))
        .italic()
        .multilineTextAlignment(.center)
        .foregroundColor(.white.opacity(0.9))
        .padding(.horizontal, 8)
    }
    .padding(20)
    .frame(maxWidth: .infinity)
    .background(
      RoundedRectangle(cornerRadius: 16)
        .fill(
          LinearGradient(
            colors: [
              Color(red: 1, green: 0.84, blue: 0).opacity(0.1),
              Color(red: 0.6, green: 0.3, blue: 1).opacity(0.05),
            ],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
          )
        )
    )
  }
}

// MARK: - View Wrappers (Route to full implementations)

struct MonadForgeView: View {
  var body: some View {
    MonadForgeFullView()
  }
}

struct SATSChamberView: View {
  var body: some View {
    SATSChamberFullView()
  }
}

struct ThreeSixNineEncoderView: View {
  var body: some View {
    ThreeSixNineEncoderFullView()
  }
}

struct RevisionLabView: View {
  @Environment(\.dismiss) private var dismiss
  var body: some View {
    NavigationStack {
      ZStack {
        LinearGradient(
          colors: [Color(hex: "0a0a1a"), Color(hex: "0a1a2a")], startPoint: .top, endPoint: .bottom
        ).ignoresSafeArea()
        VStack(spacing: 20) {
          Text("🔄").font(.system(size: 60))
          Text("Revision Lab").font(.title2).fontWeight(.bold).foregroundStyle(.white)
          Text(
            "Rewrite past events in your imagination.\nRemember them differently until the memory feels natural."
          )
          .font(.body).foregroundStyle(.white.opacity(0.7)).multilineTextAlignment(.center)
          .padding()
        }
      }
      .navigationTitle("Revision Lab")
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItem(placement: .navigationBarTrailing) {
          Button("Done") { dismiss() }.foregroundStyle(Color(hex: "00BFFF"))
        }
      }
    }
  }
}

struct MentalDietView: View {
  var body: some View {
    MentalDietFullView()
  }
}

struct SolarSyncView: View {
  var body: some View {
    SolarSyncFullView()
  }
}

struct BardoNavigatorView: View {
  var body: some View {
    BardoNavigatorFullView()
  }
}

struct VibrationShieldView: View {
  var body: some View {
    VibrationShieldFullView()
  }
}

struct MonadCheckInView: View {
  @Environment(\.dismiss) private var dismiss
  var body: some View {
    NavigationStack {
      ZStack {
        LinearGradient(
          colors: [Color(hex: "0a0a1a"), Color(hex: "1a2a1a")], startPoint: .top, endPoint: .bottom
        ).ignoresSafeArea()
        VStack(spacing: 20) {
          Text("✅").font(.system(size: 60))
          Text("Daily Check-In").font(.title2).fontWeight(.bold).foregroundStyle(.white)
          Text("Rate your vibration today:\n1 (Low) → 10 (Peak)")
            .font(.body).foregroundStyle(.white.opacity(0.7)).multilineTextAlignment(.center)
        }
      }
      .navigationTitle("Monad Check-In")
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItem(placement: .navigationBarTrailing) {
          Button("Done") { dismiss() }.foregroundStyle(Color(hex: "27AE60"))
        }
      }
    }
  }
}

struct SynchronicityTrackerView: View {
  var body: some View {
    SynchronicityTrackerFullView()
  }
}

// MARK: - Preview

#Preview {
  GodModeHubView()
}
