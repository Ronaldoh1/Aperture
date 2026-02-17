// GnosticPathfinderModal.swift
// THE PATHFINDER — Your Curated Journey to Gnosis
// ☀️ SunFlow: Reignited
//
// First-launch modal that appears on the landing page.
// Users select their belief background → receive a curated path.
// Can skip, but we always recommend the Timeline.
// Includes the Guadalupe Reveal for Mexican/Latino users.

import SwiftUI

// MARK: - ═══════════════════════════════════════════════════

// BELIEF SYSTEM DATA
// ═══════════════════════════════════════════════════════════

enum BeliefBackground: String, CaseIterable, Identifiable {
  case christian = "Christian"
  case catholic = "Catholic"
  case muslim = "Muslim"
  case jewish = "Jewish"
  case hindu = "Hindu"
  case buddhist = "Buddhist"
  case agnostic = "Agnostic"
  case atheist = "Atheist"
  case spiritual = "Spiritual, No Religion"
  case indigenous = "Indigenous / Earth-Based"
  case mexican = "Mexican / Guadalupano"
  case none = "Rather Not Say"

  var id: String {
    rawValue
  }

  var icon: String {
    switch self {
    case .christian: return "cross.fill"
    case .catholic: return "cross.fill"
    case .muslim: return "moon.stars.fill"
    case .jewish: return "star.fill"
    case .hindu: return "flame.fill"
    case .buddhist: return "circle.fill"
    case .agnostic: return "questionmark.circle.fill"
    case .atheist: return "atom"
    case .spiritual: return "sparkles"
    case .indigenous: return "leaf.fill"
    case .mexican: return "sun.max.fill"
    case .none: return "person.fill"
    }
  }

  var flag: String? {
    switch self {
    case .mexican: return "🇲🇽"
    default: return nil
    }
  }

  var color: Color {
    switch self {
    case .christian: return Color(red: 0.6, green: 0.5, blue: 0.9)
    case .catholic: return Color(red: 0.8, green: 0.6, blue: 0.2)
    case .muslim: return Color(red: 0.2, green: 0.7, blue: 0.5)
    case .jewish: return Color(red: 0.3, green: 0.5, blue: 0.9)
    case .hindu: return Color(red: 1.0, green: 0.5, blue: 0.2)
    case .buddhist: return Color(red: 0.9, green: 0.7, blue: 0.1)
    case .agnostic: return .cyan
    case .atheist: return Color(red: 0.5, green: 0.7, blue: 0.8)
    case .spiritual: return Color(red: 0.7, green: 0.4, blue: 1.0)
    case .indigenous: return Color(red: 0.4, green: 0.7, blue: 0.3)
    case .mexican: return Color(red: 0.0, green: 0.6, blue: 0.3)
    case .none: return .gray
    }
  }

  var pathIntro: String {
    switch self {
    case .christian:
      return
        "You already know the story of Yeshua. But there are gospels they didn't put in the Bible — and they change everything. Your path starts with what was hidden from you."
    case .catholic:
      return
        "You were raised in the tradition of Rome. The rituals are beautiful — but they're older than Rome itself. Your path reveals what the Church built upon and what it buried."
    case .muslim:
      return
        "Islam carries deep mystical wisdom through Sufism — the heart of the tradition that institutions sometimes suppress. Your path connects the dots between Fana and Christ Consciousness."
    case .jewish:
      return
        "Kabbalah is already in your tradition — the mystical current that runs beneath the surface. Your path explores the Sefirot, Ein Sof, and how Gnostic teachings echo Jewish mysticism."
    case .hindu:
      return
        "You're already closer than most. Kundalini, Atman, Brahman — these are the mechanisms other traditions rediscovered. Your path shows how every awakening tradition maps back to Vedic truth."
    case .buddhist:
      return
        "Satori, Kensho, Sunyata — you know the territory. Your path explores how Buddhist insight connects to Gnostic direct knowing and the Christ consciousness that transcends religion."
    case .agnostic:
      return
        "You haven't committed to a story yet — that's actually an advantage. No programming to undo. Your path is pure pattern recognition: what every tradition agrees on, stripped of dogma."
    case .atheist:
      return
        "You value evidence and reason. Good — you'll need both. Your path is the scientific case: documented history, primary sources, and the measurable patterns that institutions don't want examined."
    case .spiritual:
      return
        "You feel something but haven't found it in any building. Your path connects the threads you've already been pulling — Kundalini, meditation, energy work — to their original source."
    case .indigenous:
      return
        "Your ancestors knew the truth before anyone wrote it down. Your path honors that knowing and shows how every 'mystery school' was attempting to rediscover what your people never forgot."
    case .mexican:
      return
        "Guadalupano/a — before we begin, there's something you need to see about La Virgen. Something beautiful and something stolen. Tap the image when you're ready."
    case .none:
      return
        "No assumptions. No labels. Just truth. Your path starts with the Timeline — the patterns that emerge when you see history without the filter."
    }
  }

  var recommendedPath: [PathRecommendation] {
    switch self {
    case .christian, .catholic:
      return [
        PathRecommendation(
          module: "Timeline", reason: "See what happened to the original teachings",
          icon: "clock.arrow.circlepath", priority: 1),
        PathRecommendation(
          module: "Alexandria", reason: "Read the gospels they removed",
          icon: "books.vertical.fill", priority: 2),
        PathRecommendation(
          module: "Tonantzin Course", reason: "How they replaced your local gods",
          icon: "figure.stand.dress", priority: 3),
        PathRecommendation(
          module: "Gnostic Library", reason: "The Nag Hammadi texts — Yeshua's hidden words",
          icon: "book.closed.fill", priority: 4),
      ]
    case .muslim:
      return [
        PathRecommendation(
          module: "Timeline", reason: "Trace the Abrahamic line to its source",
          icon: "clock.arrow.circlepath", priority: 1),
        PathRecommendation(
          module: "Awakening Paths", reason: "Fana, Sufism, and the mystic heart of Islam",
          icon: "arrow.triangle.branch", priority: 2),
        PathRecommendation(
          module: "Alexandria", reason: "Where Judaism, Christianity, and Islam converge",
          icon: "books.vertical.fill", priority: 3),
      ]
    case .jewish:
      return [
        PathRecommendation(
          module: "Timeline", reason: "From Sumer to the Sefirot — the hidden thread",
          icon: "clock.arrow.circlepath", priority: 1),
        PathRecommendation(
          module: "Gnostic Library", reason: "Gnostic Judaism and the Demiurge concept",
          icon: "book.closed.fill", priority: 2),
        PathRecommendation(
          module: "Alexandria", reason: "Kabbalah, Ein Sof, and the tree of life",
          icon: "books.vertical.fill", priority: 3),
      ]
    case .hindu:
      return [
        PathRecommendation(
          module: "Timeline", reason: "How Vedic truth survived while others burned",
          icon: "clock.arrow.circlepath", priority: 1),
        PathRecommendation(
          module: "Awakening Paths", reason: "Kundalini mechanics mapped across traditions",
          icon: "arrow.triangle.branch", priority: 2),
        PathRecommendation(
          module: "Cosmos", reason: "Sacred geometry encoded in temple architecture",
          icon: "globe.americas.fill", priority: 3),
      ]
    case .buddhist:
      return [
        PathRecommendation(
          module: "Timeline", reason: "Buddhism's suppression and survival patterns",
          icon: "clock.arrow.circlepath", priority: 1),
        PathRecommendation(
          module: "Awakening Paths", reason: "Satori ↔ Gnosis ↔ Moksha — the same thing",
          icon: "arrow.triangle.branch", priority: 2),
        PathRecommendation(
          module: "Unlearn", reason: "Emptiness as the ultimate deprogramming",
          icon: "brain.head.profile", priority: 3),
      ]
    case .agnostic, .atheist:
      return [
        PathRecommendation(
          module: "Timeline", reason: "The documented pattern of knowledge suppression",
          icon: "clock.arrow.circlepath", priority: 1),
        PathRecommendation(
          module: "Signal vs Noise", reason: "How media manipulates perception right now",
          icon: "antenna.radiowaves.left.and.right", priority: 2),
        PathRecommendation(
          module: "Myths vs Reality", reason: "10 things they taught wrong — with sources",
          icon: "book.closed.fill", priority: 3),
        PathRecommendation(
          module: "Alexandria", reason: "Primary texts — judge for yourself",
          icon: "books.vertical.fill", priority: 4),
      ]
    case .spiritual:
      return [
        PathRecommendation(
          module: "Timeline", reason: "Where your feelings connect to documented history",
          icon: "clock.arrow.circlepath", priority: 1),
        PathRecommendation(
          module: "Awakening Paths", reason: "Name what you're experiencing across traditions",
          icon: "arrow.triangle.branch", priority: 2),
        PathRecommendation(
          module: "Cosmos", reason: "Sacred geometry — the math behind the feeling",
          icon: "globe.americas.fill", priority: 3),
        PathRecommendation(
          module: "We Are One", reason: "The consciousness framework that unifies everything",
          icon: "sun.max.fill", priority: 4),
      ]
    case .indigenous:
      return [
        PathRecommendation(
          module: "Timeline", reason: "How they systematically erased your ancestors' truth",
          icon: "clock.arrow.circlepath", priority: 1),
        PathRecommendation(
          module: "Sun God Erasure", reason: "Inti, Tonatiuh, Kinich Ahau — all targeted",
          icon: "sun.max.fill", priority: 2),
        PathRecommendation(
          module: "Tonantzin Course", reason: "The original mother they tried to replace",
          icon: "figure.stand.dress", priority: 3),
      ]
    case .mexican:
      return [
        PathRecommendation(
          module: "Guadalupe Reveal", reason: "See what's behind the image", icon: "sun.max.fill",
          priority: 0),
        PathRecommendation(
          module: "Tonantzin Course", reason: "The full story of the mother they erased",
          icon: "figure.stand.dress", priority: 1),
        PathRecommendation(
          module: "Timeline", reason: "From Tenochtitlan to now — what was taken",
          icon: "clock.arrow.circlepath", priority: 2),
        PathRecommendation(
          module: "Alexandria", reason: "The codices they didn't burn", icon: "books.vertical.fill",
          priority: 3),
      ]
    case .none:
      return [
        PathRecommendation(
          module: "Timeline", reason: "Start here — let the patterns speak for themselves",
          icon: "clock.arrow.circlepath", priority: 1),
        PathRecommendation(
          module: "Signal vs Noise", reason: "Learn to filter truth from manipulation",
          icon: "antenna.radiowaves.left.and.right", priority: 2),
        PathRecommendation(
          module: "Alexandria", reason: "Explore at your own pace", icon: "books.vertical.fill",
          priority: 3),
      ]
    }
  }
}

struct PathRecommendation: Identifiable {
  let id = UUID()
  let module: String
  let reason: String
  let icon: String
  let priority: Int
}

// MARK: - ═══════════════════════════════════════════════════

// PATHFINDER MODAL
// ═══════════════════════════════════════════════════════════

struct GnosticPathfinderModal: View {
  @Environment(\.dismiss) var dismiss
  @ObservedObject var journeyStore: UserJourneyStore
  @Binding var selectedTab: Int

  @State private var step: PathfinderStep = .welcome
  @State private var selectedBelief: BeliefBackground? = nil
  @State private var showGuadalupeReveal = false
  @State private var appearAnimation = false
  @State private var pulsePhase: CGFloat = 0

  enum PathfinderStep {
    case welcome
    case selectBelief
    case showPath
  }

  var body: some View {
    ZStack {
      // Cosmic background
      Color(red: 0.02, green: 0.02, blue: 0.06)
        .ignoresSafeArea()

      // Subtle radial glow
      RadialGradient(
        colors: [Color(red: 0.15, green: 0.1, blue: 0.3).opacity(0.4), .clear],
        center: .center, startRadius: 0, endRadius: 300
      ).ignoresSafeArea()

      // Floating particles
      particleField

      // Content
      switch step {
      case .welcome: welcomeStep
      case .selectBelief: beliefSelectionStep
      case .showPath: pathResultStep
      }
    }
    .onAppear {
      withAnimation(.easeOut(duration: 1.2)) { appearAnimation = true }
      withAnimation(.easeInOut(duration: 4).repeatForever(autoreverses: true)) {
        pulsePhase = .pi * 2
      }
    }
    .fullScreenCover(isPresented: $showGuadalupeReveal) {
      GuadalupeRevealView()
    }
  }

  // MARK: - Step 1: Welcome

  private var welcomeStep: some View {
    VStack(spacing: 28) {
      Spacer()

      // Pulsing sun
      ZStack {
        Circle().fill(Color(red: 1.0, green: 0.85, blue: 0.3).opacity(0.06))
          .frame(width: 140, height: 140)
          .scaleEffect(1.0 + sin(pulsePhase) * 0.15)
        Circle().fill(Color(red: 1.0, green: 0.85, blue: 0.3).opacity(0.1))
          .frame(width: 100, height: 100)
          .scaleEffect(1.0 + sin(pulsePhase * 1.3) * 0.1)
        Image(systemName: "sun.max.fill")
          .font(.system(size: 44))
          .foregroundColor(Color(red: 1.0, green: 0.85, blue: 0.3))
      }
      .opacity(appearAnimation ? 1 : 0)
      .scaleEffect(appearAnimation ? 1 : 0.5)

      VStack(spacing: 12) {
        Text("Welcome, Seeker")
          .font(.system(size: 28, weight: .bold, design: .rounded))
          .foregroundColor(.white)
          .opacity(appearAnimation ? 1 : 0)

        Text("Every path to truth starts with a question.\nLet us find the right door for you.")
          .font(.system(size: 14, weight: .medium))
          .foregroundColor(.white.opacity(0.5))
          .multilineTextAlignment(.center)
          .lineSpacing(4)
          .opacity(appearAnimation ? 1 : 0)
      }

      VStack(spacing: 12) {
        Button {
          withAnimation(.spring(response: 0.5)) { step = .selectBelief }
        } label: {
          HStack(spacing: 8) {
            Image(systemName: "sparkles")
            Text("Find My Path")
              .font(.system(size: 16, weight: .bold))
          }
          .foregroundColor(.black)
          .frame(maxWidth: .infinity)
          .padding(.vertical, 14)
          .background(Capsule().fill(Color(red: 1.0, green: 0.85, blue: 0.3)))
        }

        Button {
          // Skip — always recommend Timeline
          journeyStore.completeOnboardingWithDefaults()
          markPathfinderSeen()
          dismiss()
        } label: {
          Text("Skip — I'll explore on my own")
            .font(.system(size: 13, weight: .medium))
            .foregroundColor(.white.opacity(0.4))
        }
      }
      .padding(.horizontal, 40)
      .opacity(appearAnimation ? 1 : 0)

      // Always visible recommendation
      HStack(spacing: 8) {
        Image(systemName: "clock.arrow.circlepath")
          .foregroundColor(.cyan)
        Text("We always recommend starting with the ")
          .foregroundColor(.white.opacity(0.3))
          + Text("Timeline")
          .foregroundColor(.cyan)
          .fontWeight(.bold)
      }
      .font(.system(size: 11, weight: .medium))
      .opacity(appearAnimation ? 1 : 0)

      Spacer()
    }
  }

  // MARK: - Step 2: Belief Selection

  private var beliefSelectionStep: some View {
    VStack(spacing: 16) {
      // Header
      VStack(spacing: 8) {
        Text("Where are you coming from?")
          .font(.system(size: 22, weight: .bold))
          .foregroundColor(.white)
        Text("No judgment. No data collected.\nThis just helps us recommend your starting point.")
          .font(.system(size: 12, weight: .medium))
          .foregroundColor(.white.opacity(0.4))
          .multilineTextAlignment(.center)
          .lineSpacing(3)
      }
      .padding(.top, 40)

      // Belief grid
      ScrollView(showsIndicators: false) {
        LazyVGrid(
          columns: [GridItem(.flexible(), spacing: 10), GridItem(.flexible(), spacing: 10)],
          spacing: 10
        ) {
          ForEach(BeliefBackground.allCases) { belief in
            Button {
              withAnimation(.spring(response: 0.4)) {
                selectedBelief = belief
                step = .showPath
              }
            } label: {
              HStack(spacing: 10) {
                if let flag = belief.flag {
                  Text(flag).font(.system(size: 20))
                } else {
                  Image(systemName: belief.icon)
                    .font(.system(size: 16))
                    .foregroundColor(belief.color)
                }

                Text(belief.rawValue)
                  .font(.system(size: 12, weight: .semibold))
                  .foregroundColor(.white)
                  .lineLimit(1)

                Spacer()
              }
              .padding(12)
              .background(
                RoundedRectangle(cornerRadius: 12)
                  .fill(belief.color.opacity(0.08))
                  .overlay(
                    RoundedRectangle(cornerRadius: 12).stroke(
                      belief.color.opacity(0.15), lineWidth: 1))
              )
            }
          }
        }
        .padding(.horizontal, 20)

        Spacer(minLength: 40)
      }

      // Back
      Button {
        withAnimation { step = .welcome }
      } label: {
        Text("← Back").font(.system(size: 13)).foregroundColor(.white.opacity(0.3))
      }
      .padding(.bottom, 20)
    }
  }

  // MARK: - Step 3: Path Result

  private var pathResultStep: some View {
    ScrollView(showsIndicators: false) {
      VStack(spacing: 24) {
        if let belief = selectedBelief {
          // Header
          VStack(spacing: 10) {
            if let flag = belief.flag {
              Text(flag).font(.system(size: 40))
            } else {
              Image(systemName: belief.icon)
                .font(.system(size: 32))
                .foregroundColor(belief.color)
            }

            Text("Your Path to Gnosis")
              .font(.system(size: 22, weight: .bold))
              .foregroundColor(.white)

            Text(belief.rawValue)
              .font(.system(size: 13, weight: .bold))
              .foregroundColor(belief.color)
          }
          .padding(.top, 40)

          // Personal message
          Text(belief.pathIntro)
            .font(.system(size: 14, weight: .medium))
            .foregroundColor(.white.opacity(0.7))
            .multilineTextAlignment(.center)
            .lineSpacing(5)
            .padding(.horizontal, 20)

          // Guadalupe Reveal (Mexican only)
          if belief == .mexican {
            guadalupeTeaser
          }

          // Recommended path
          VStack(alignment: .leading, spacing: 12) {
            Text("YOUR RECOMMENDED PATH")
              .font(.system(size: 10, weight: .bold))
              .tracking(2)
              .foregroundColor(.white.opacity(0.3))

            ForEach(
              Array(belief.recommendedPath.sorted(by: { $0.priority < $1.priority }).enumerated()),
              id: \.element.id
            ) { index, rec in
              pathStepCard(index: index, recommendation: rec, belief: belief)
            }
          }
          .padding(.horizontal, 20)

          // Timeline always recommended
          if !belief.recommendedPath.contains(where: { $0.module == "Timeline" }) {
            timelineAlwaysCard
          }

          // Start button
          VStack(spacing: 12) {
            Button {
              journeyStore.completeOnboarding(journeyType: mapToJourney(belief))
              markPathfinderSeen()
              dismiss()
            } label: {
              HStack(spacing: 8) {
                Image(systemName: "sparkles")
                Text("Begin My Journey")
                  .font(.system(size: 16, weight: .bold))
              }
              .foregroundColor(.black)
              .frame(maxWidth: .infinity)
              .padding(.vertical, 14)
              .background(Capsule().fill(Color(red: 1.0, green: 0.85, blue: 0.3)))
            }

            Button {
              withAnimation { step = .selectBelief }
            } label: {
              Text("← Choose different background")
                .font(.system(size: 12, weight: .medium))
                .foregroundColor(.white.opacity(0.3))
            }
          }
          .padding(.horizontal, 40)
          .padding(.top, 8)
        }

        Spacer(minLength: 60)
      }
    }
  }

  // MARK: - Path Step Card

  private func pathStepCard(
    index: Int, recommendation: PathRecommendation, belief: BeliefBackground
  ) -> some View {
    HStack(spacing: 14) {
      // Step number
      ZStack {
        Circle().fill(belief.color.opacity(0.2)).frame(width: 32, height: 32)
        Text("\(index + 1)").font(.system(size: 14, weight: .bold)).foregroundColor(belief.color)
      }

      VStack(alignment: .leading, spacing: 3) {
        HStack(spacing: 6) {
          Image(systemName: recommendation.icon).font(.system(size: 12)).foregroundColor(
            belief.color)
          Text(recommendation.module).font(.system(size: 14, weight: .bold)).foregroundColor(.white)
        }
        Text(recommendation.reason)
          .font(.system(size: 11, weight: .medium))
          .foregroundColor(.white.opacity(0.5))
          .lineSpacing(2)
      }
      Spacer()
    }
    .padding(12)
    .background(
      RoundedRectangle(cornerRadius: 12).fill(Color.white.opacity(0.03))
        .overlay(RoundedRectangle(cornerRadius: 12).stroke(belief.color.opacity(0.1), lineWidth: 1))
    )
  }

  // MARK: - Timeline Always Card

  private var timelineAlwaysCard: some View {
    HStack(spacing: 14) {
      Image(systemName: "clock.arrow.circlepath").font(.system(size: 20)).foregroundColor(.cyan)
      VStack(alignment: .leading, spacing: 3) {
        Text("Always explore the Timeline").font(.system(size: 13, weight: .bold)).foregroundColor(
          .white)
        Text("Every path leads through history. The patterns are undeniable.")
          .font(.system(size: 11, weight: .medium)).foregroundColor(.cyan.opacity(0.6))
      }
      Spacer()
    }
    .padding(14)
    .background(
      RoundedRectangle(cornerRadius: 14).fill(Color.cyan.opacity(0.06))
        .overlay(RoundedRectangle(cornerRadius: 14).stroke(Color.cyan.opacity(0.15), lineWidth: 1))
    )
    .padding(.horizontal, 20)
  }

  // MARK: - Guadalupe Teaser

  private var guadalupeTeaser: some View {
    Button {
      showGuadalupeReveal = true
    } label: {
      VStack(spacing: 12) {
        // Mexican flag glow effect
        ZStack {
          RoundedRectangle(cornerRadius: 20)
            .fill(
              LinearGradient(
                colors: [
                  Color(red: 0.0, green: 0.4, blue: 0.2).opacity(0.3),
                  Color.white.opacity(0.05),
                  Color(red: 0.8, green: 0.1, blue: 0.1).opacity(0.3),
                ],
                startPoint: .leading, endPoint: .trailing
              )
            )
            .frame(height: 140)
            .overlay(
              RoundedRectangle(cornerRadius: 20)
                .stroke(Color(red: 1.0, green: 0.85, blue: 0.3).opacity(0.3), lineWidth: 1)
            )

          VStack(spacing: 8) {
            Text("🇲🇽").font(.system(size: 36))
            Text("La Virgen te espera")
              .font(.system(size: 16, weight: .bold, design: .rounded))
              .foregroundColor(Color(red: 1.0, green: 0.85, blue: 0.3))
            Text("Tap to see what they didn't tell you")
              .font(.system(size: 11, weight: .medium))
              .foregroundColor(.white.opacity(0.4))
          }
        }
      }
    }
    .padding(.horizontal, 20)
  }

  // MARK: - Particle Field

  private var particleField: some View {
    GeometryReader { geo in
      ForEach(0..<20, id: \.self) { _ in
        Circle()
          .fill(Color.white.opacity(Double.random(in: 0.03...0.08)))
          .frame(width: CGFloat.random(in: 1...3))
          .position(
            x: CGFloat.random(in: 0...geo.size.width),
            y: CGFloat.random(in: 0...geo.size.height)
          )
      }
    }
    .allowsHitTesting(false)
  }

  // MARK: - Helpers

  private func mapToJourney(_ belief: BeliefBackground) -> UserJourneyType {
    switch belief {
    case .christian, .catholic, .muslim, .jewish: return .giveSources
    case .hindu, .buddhist, .spiritual, .indigenous: return .teachPractice
    case .agnostic, .atheist: return .showPatterns
    case .mexican: return .showPatterns
    case .none: return .showPatterns
    }
  }

  private func markPathfinderSeen() {
    UserDefaults.standard.set(true, forKey: "aperture.pathfinder.seen")
  }

  static var hasBeenSeen: Bool {
    UserDefaults.standard.bool(forKey: "aperture.pathfinder.seen")
  }
}

// MARK: - ═══════════════════════════════════════════════════

// GUADALUPE REVEAL VIEW — The Dissolve
// ═══════════════════════════════════════════════════════════

struct GuadalupeRevealView: View {
  @Environment(\.dismiss) var dismiss
  @State private var phase: GuadalupePhase = .showing
  @State private var dissolveProgress: CGFloat = 0
  @State private var glowIntensity: CGFloat = 0
  @State private var textOpacity: CGFloat = 0
  @State private var showTonantzin = false
  @State private var particleExplosion = false
  @State private var revealTextIndex = 0

  enum GuadalupePhase {
    case showing
    case glowing
    case dissolving
    case revealed
    case teaching
  }

  private let revealTexts = [
    "Before Guadalupe...",
    "Before the basilica...",
    "Before the roses and the tilma...",
    "There was Tonantzin.",
    "The Mother they tried to erase.",
    "Same hill. Same devotion.",
    "Different name.",
  ]

  var body: some View {
    ZStack {
      Color.black.ignoresSafeArea()

      // Star field
      starField

      VStack(spacing: 0) {
        Spacer()

        // The Virgen / Tonantzin
        ZStack {
          // Glow behind
          if phase != .showing {
            Circle()
              .fill(
                RadialGradient(
                  colors: [
                    Color(red: 1.0, green: 0.85, blue: 0.3).opacity(glowIntensity * 0.4),
                    Color(red: 1.0, green: 0.6, blue: 0.1).opacity(glowIntensity * 0.2),
                    .clear,
                  ],
                  center: .center, startRadius: 0, endRadius: 180
                )
              )
              .frame(width: 360, height: 360)
          }

          // Particle explosion on dissolve
          if particleExplosion {
            ForEach(0..<30, id: \.self) { _ in
              Circle()
                .fill(Color(red: 1.0, green: 0.85, blue: 0.3).opacity(0.6))
                .frame(width: CGFloat.random(in: 2...6))
                .offset(
                  x: CGFloat.random(in: -150...150) * dissolveProgress,
                  y: CGFloat.random(in: -200...200) * dissolveProgress
                )
                .opacity(Double(1.0 - dissolveProgress))
            }
          }

          // Virgin SVG representation (stylized)
          if phase != .revealed && phase != .teaching {
            virginSVG
              .opacity(Double(1.0 - dissolveProgress))
              .scaleEffect(1.0 + dissolveProgress * 0.3)
              .blur(radius: dissolveProgress * 10)
          }

          // Tonantzin sun (appears after dissolve)
          if showTonantzin {
            tonantzinSun
              .transition(.scale.combined(with: .opacity))
          }
        }
        .frame(height: 320)

        Spacer().frame(height: 30)

        // Text area
        textSection

        Spacer()

        // Action area
        actionArea

        Spacer().frame(height: 40)
      }
    }
    .onAppear {
      startSequence()
    }
  }

  // MARK: - Virgin SVG (Stylized)

  private var virginSVG: some View {
    ZStack {
      // Mandorla (almond-shaped glow)
      Ellipse()
        .fill(
          RadialGradient(
            colors: [
              Color(red: 1.0, green: 0.85, blue: 0.3).opacity(0.15),
              Color(red: 0.0, green: 0.4, blue: 0.2).opacity(0.1),
              .clear,
            ],
            center: .center, startRadius: 20, endRadius: 120
          )
        )
        .frame(width: 180, height: 260)

      // Starry mantle
      VStack(spacing: 0) {
        // Crown / stars
        HStack(spacing: 3) {
          ForEach(0..<12, id: \.self) { _ in
            Image(systemName: "star.fill")
              .font(.system(size: 4))
              .foregroundColor(Color(red: 1.0, green: 0.85, blue: 0.3).opacity(0.6))
          }
        }
        .padding(.bottom, 4)

        // Head/face area
        Circle()
          .fill(Color(red: 0.6, green: 0.45, blue: 0.3))
          .frame(width: 32, height: 32)
          .overlay(
            Circle().stroke(Color(red: 1.0, green: 0.85, blue: 0.3).opacity(0.4), lineWidth: 1)
          )

        // Mantle (blue-green)
        RoundedRectangle(cornerRadius: 30)
          .fill(
            LinearGradient(
              colors: [
                Color(red: 0.0, green: 0.3, blue: 0.4),
                Color(red: 0.0, green: 0.2, blue: 0.3),
              ],
              startPoint: .top, endPoint: .bottom
            )
          )
          .frame(width: 100, height: 140)
          .overlay(
            // Stars on mantle
            ZStack {
              ForEach(0..<8, id: \.self) { _ in
                Image(systemName: "star.fill")
                  .font(.system(size: 3))
                  .foregroundColor(Color(red: 1.0, green: 0.85, blue: 0.3).opacity(0.5))
                  .offset(
                    x: CGFloat.random(in: -30...30),
                    y: CGFloat.random(in: -50...50)
                  )
              }
            }
          )

        // Crescent moon
        Image(systemName: "moon.fill")
          .font(.system(size: 20))
          .foregroundColor(.white.opacity(0.2))
          .rotationEffect(.degrees(180))
          .padding(.top, -8)

        // Angel wings
        HStack(spacing: 20) {
          Image(systemName: "wing").font(.system(size: 14))
            .foregroundColor(Color(red: 1.0, green: 0.85, blue: 0.3).opacity(0.3))
            .rotationEffect(.degrees(-15))
          Image(systemName: "wing").font(.system(size: 14))
            .foregroundColor(Color(red: 1.0, green: 0.85, blue: 0.3).opacity(0.3))
            .rotationEffect(.degrees(15))
            .scaleEffect(x: -1, y: 1)
        }
      }

      // Solar rays
      ForEach(0..<24, id: \.self) { i in
        Rectangle()
          .fill(Color(red: 1.0, green: 0.85, blue: 0.3).opacity(0.08 + glowIntensity * 0.1))
          .frame(width: 1.5, height: 130)
          .offset(y: -60)
          .rotationEffect(.degrees(Double(i) * 15))
      }
    }
  }

  // MARK: - Tonantzin Sun

  private var tonantzinSun: some View {
    ZStack {
      // Rotating sun rays
      ForEach(0..<16, id: \.self) { i in
        Rectangle()
          .fill(
            LinearGradient(
              colors: [Color(red: 1.0, green: 0.85, blue: 0.3), .clear],
              startPoint: .bottom, endPoint: .top
            )
          )
          .frame(width: 3, height: 100)
          .offset(y: -80)
          .rotationEffect(.degrees(Double(i) * 22.5))
      }

      // Center sun
      Circle()
        .fill(
          RadialGradient(
            colors: [
              Color(red: 1.0, green: 0.85, blue: 0.3),
              Color(red: 1.0, green: 0.6, blue: 0.1),
              Color(red: 0.8, green: 0.3, blue: 0.0),
            ],
            center: .center, startRadius: 10, endRadius: 50
          )
        )
        .frame(width: 80, height: 80)

      // Nahui Ollin (four movement symbol)
      VStack(spacing: 4) {
        HStack(spacing: 4) {
          petalShape.rotationEffect(.degrees(0))
          petalShape.rotationEffect(.degrees(90))
        }
        HStack(spacing: 4) {
          petalShape.rotationEffect(.degrees(270))
          petalShape.rotationEffect(.degrees(180))
        }
      }
      .frame(width: 40, height: 40)
    }
    .scaleEffect(showTonantzin ? 1.0 : 0.3)
  }

  private var petalShape: some View {
    Ellipse()
      .fill(Color(red: 0.8, green: 0.2, blue: 0.1).opacity(0.8))
      .frame(width: 12, height: 16)
  }

  // MARK: - Text Section

  private var textSection: some View {
    VStack(spacing: 16) {
      switch phase {
      case .showing:
        VStack(spacing: 8) {
          Text("La Virgen de Guadalupe")
            .font(.system(size: 20, weight: .bold, design: .rounded))
            .foregroundColor(.white)
          Text("Patrona de México. Mother of millions.\nTap her image when you're ready.")
            .font(.system(size: 13, weight: .medium))
            .foregroundColor(.white.opacity(0.5))
            .multilineTextAlignment(.center).lineSpacing(3)
        }
      case .glowing, .dissolving:
        if revealTextIndex < revealTexts.count {
          Text(revealTexts[revealTextIndex])
            .font(.system(size: 18, weight: .bold, design: .rounded))
            .foregroundColor(Color(red: 1.0, green: 0.85, blue: 0.3))
            .transition(.opacity)
            .id("reveal-\(revealTextIndex)")
        }
      case .revealed:
        VStack(spacing: 8) {
          Text("TONANTZIN")
            .font(.system(size: 28, weight: .bold, design: .rounded))
            .tracking(6)
            .foregroundColor(Color(red: 1.0, green: 0.85, blue: 0.3))
          Text("The Mother who was always there.")
            .font(.system(size: 14, weight: .medium))
            .foregroundColor(.white.opacity(0.6))
        }
      case .teaching:
        VStack(spacing: 12) {
          Text("She's not gone.")
            .font(.system(size: 22, weight: .bold, design: .rounded))
            .foregroundColor(.white)
          Text(
            "She was never Guadalupe.\nShe was always Tonantzin.\nThe hill of Tepeyac was HER sacred site\nfor thousands of years before the cross arrived.\n\nThey didn't bring the Mother.\nThey renamed the one who was already there."
          )
          .font(.system(size: 13, weight: .medium, design: .rounded))
          .foregroundColor(.white.opacity(0.6))
          .multilineTextAlignment(.center).lineSpacing(4)

          Text("🌺 Time to learn what really happened.")
            .font(.system(size: 14, weight: .bold))
            .foregroundColor(Color(red: 1.0, green: 0.85, blue: 0.3))
            .padding(.top, 4)
        }
      }
    }
    .padding(.horizontal, 30)
    .animation(.easeInOut(duration: 0.5), value: phase)
  }

  // MARK: - Action Area

  private var actionArea: some View {
    VStack(spacing: 12) {
      switch phase {
      case .showing:
        Button {
          startDissolve()
        } label: {
          Text("Touch the image")
            .font(.system(size: 14, weight: .bold))
            .foregroundColor(Color(red: 1.0, green: 0.85, blue: 0.3))
            .padding(.horizontal, 24).padding(.vertical, 10)
            .background(
              Capsule().fill(Color(red: 1.0, green: 0.85, blue: 0.3).opacity(0.15))
                .overlay(
                  Capsule().stroke(
                    Color(red: 1.0, green: 0.85, blue: 0.3).opacity(0.3), lineWidth: 1)))
        }
      case .glowing, .dissolving:
        EmptyView()
      case .revealed:
        Button {
          withAnimation(.easeInOut(duration: 0.6)) { phase = .teaching }
        } label: {
          Text("What happened?")
            .font(.system(size: 15, weight: .bold))
            .foregroundColor(.black)
            .frame(maxWidth: .infinity).padding(.vertical, 12)
            .background(Capsule().fill(Color(red: 1.0, green: 0.85, blue: 0.3)))
        }
        .padding(.horizontal, 40)
      case .teaching:
        Button {
          dismiss()
        } label: {
          HStack(spacing: 6) {
            Image(systemName: "book.fill")
            Text("Take Me to the Full Story")
              .font(.system(size: 15, weight: .bold))
          }
          .foregroundColor(.black)
          .frame(maxWidth: .infinity).padding(.vertical, 12)
          .background(Capsule().fill(Color(red: 1.0, green: 0.85, blue: 0.3)))
        }
        .padding(.horizontal, 40)

        Button {
          dismiss()
        } label: {
          Text("Close").font(.system(size: 13)).foregroundColor(.white.opacity(0.3))
        }
      }
    }
  }

  // MARK: - Star Field

  private var starField: some View {
    GeometryReader { geo in
      ForEach(0..<40, id: \.self) { _ in
        Circle()
          .fill(Color.white.opacity(Double.random(in: 0.05...0.15)))
          .frame(width: CGFloat.random(in: 1...2.5))
          .position(
            x: CGFloat.random(in: 0...geo.size.width), y: CGFloat.random(in: 0...geo.size.height))
      }
    }.allowsHitTesting(false)
  }

  // MARK: - Animation Sequence

  private func startSequence() {
    // Let them see the Virgen first
  }

  private func startDissolve() {
    // Phase 1: Glow
    phase = .glowing
    withAnimation(.easeInOut(duration: 2)) { glowIntensity = 1.0 }

    // Phase 2: Text reveals
    for i in 0..<revealTexts.count {
      DispatchQueue.main.asyncAfter(deadline: .now() + Double(i) * 1.2 + 1.0) {
        withAnimation(.easeInOut(duration: 0.5)) { revealTextIndex = i }
      }
    }

    // Phase 3: Dissolve
    DispatchQueue.main.asyncAfter(deadline: .now() + Double(revealTexts.count) * 1.2 + 1.5) {
      phase = .dissolving
      particleExplosion = true
      withAnimation(.easeInOut(duration: 2.5)) { dissolveProgress = 1.0 }
    }

    // Phase 4: Reveal Tonantzin
    DispatchQueue.main.asyncAfter(deadline: .now() + Double(revealTexts.count) * 1.2 + 4.5) {
      withAnimation(.spring(response: 0.8, dampingFraction: 0.6)) {
        showTonantzin = true
        phase = .revealed
      }
    }
  }
}
