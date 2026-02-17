// UniversalAwakeningArsenalView.swift
// The Knowledge Graph of Global Awakening Methods
// "Infinite Hacks, One Code – We All the Same"

import SwiftUI

// MARK: - Main Arsenal View

struct UniversalAwakeningArsenalView: View {
  @StateObject private var viewModel = AwakeningArsenalViewModel()
  @State private var selectedRegion: AwakeningRegion = .all
  @State private var showOneness = false

  var body: some View {
    ScrollView {
      VStack(spacing: 0) {
        // Hero Header
        heroSection

        // Core Mechanism
        coreMechanismSection

        // Region Filter
        regionFilter

        // Methods Grid
        methodsGrid

        // Shared Proof
        sharedProofSection

        // Start Anywhere
        startAnywhereSection
      }
    }
    .background(Color.black.ignoresSafeArea())
    .navigationTitle("Awakening Arsenal")
    .navigationBarTitleDisplayMode(.inline)
  }

  // MARK: - Hero Section

  private var heroSection: some View {
    VStack(spacing: 20) {
      // Animated Oneness Core
      ZStack {
        // Outer glow
        ForEach(0..<3, id: \.self) { i in
          Circle()
            .stroke(
              LinearGradient(
                colors: [.purple, .blue, .cyan, .green, .yellow, .orange, .red],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
              ),
              lineWidth: 2
            )
            .frame(width: CGFloat(100 + i * 30), height: CGFloat(100 + i * 30))
            .opacity(0.3 - Double(i) * 0.1)
        }

        // Core
        Circle()
          .fill(
            RadialGradient(
              colors: [.white, .yellow, .orange],
              center: .center,
              startRadius: 0,
              endRadius: 40
            )
          )
          .frame(width: 80, height: 80)

        Image(systemName: "sparkles")
          .font(.system(size: 30))
          .foregroundColor(.black)
      }
      .padding(.top, 20)

      Text("Universal Awakening Arsenal")
        .font(.system(size: 26, weight: .black))
        .foregroundColor(.white)

      Text("Infinite Hacks, One Code")
        .font(.system(size: 16, weight: .medium))
        .foregroundColor(.cyan)

      Text("Global Methods for Spiritual Awakening")
        .font(.system(size: 14))
        .foregroundColor(.gray)

      // Tagline
      HStack(spacing: 8) {
        Image(systemName: "equal.circle.fill")
          .foregroundColor(.green)
        Text("We All The Same")
          .font(.system(size: 13, weight: .bold))
          .foregroundColor(.green)
      }
      .padding(.horizontal, 16)
      .padding(.vertical, 8)
      .background(Color.green.opacity(0.2))
      .cornerRadius(20)

      // Stats
      HStack(spacing: 20) {
        statPill("15+", "Traditions")
        statPill("6", "Continents")
        statPill("1", "Truth")
      }
    }
    .padding()
  }

  private func statPill(_ value: String, _ label: String) -> some View {
    VStack(spacing: 2) {
      Text(value)
        .font(.system(size: 20, weight: .black))
        .foregroundColor(.white)
      Text(label)
        .font(.system(size: 10))
        .foregroundColor(.gray)
    }
    .frame(width: 80)
    .padding(.vertical, 10)
    .background(Color.white.opacity(0.1))
    .cornerRadius(12)
  }

  // MARK: - Core Mechanism

  private var coreMechanismSection: some View {
    VStack(alignment: .leading, spacing: 16) {
      HStack {
        Image(systemName: "cpu")
          .foregroundColor(.cyan)
        Text("THE CORE MECHANISM")
          .font(.system(size: 12, weight: .black))
          .foregroundColor(.cyan)
      }

      Text("Every tradition describes the same process:")
        .font(.system(size: 14))
        .foregroundColor(.white.opacity(0.8))

      VStack(spacing: 12) {
        mechanismStep(
          "1", "Energy Activation", "Dormant force awakens (Kundalini, Qi, Holy Spirit, Ki)", .red)
        mechanismStep(
          "2", "Ego Dissolution", "False self recognized and released (Fana, Bodhi, Kenosis)",
          .orange)
        mechanismStep(
          "3", "Unity Recognition",
          "Oneness with all realized (Christ Consciousness, Satori, Moksha)", .yellow)
        mechanismStep("4", "Integration", "Living from awakened state daily", .green)
      }

      Text("Different names, same truth. The paths are many, the destination is one.")
        .font(.system(size: 12, weight: .medium))
        .foregroundColor(.purple)
        .italic()
    }
    .padding()
    .background(
      LinearGradient(
        colors: [Color.purple.opacity(0.2), Color.blue.opacity(0.1)],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
      )
    )
    .cornerRadius(16)
    .padding()
  }

  private func mechanismStep(_ num: String, _ title: String, _ desc: String, _ color: Color)
    -> some View
  {
    HStack(spacing: 12) {
      ZStack {
        Circle()
          .fill(color.opacity(0.3))
          .frame(width: 32, height: 32)
        Text(num)
          .font(.system(size: 14, weight: .bold))
          .foregroundColor(color)
      }

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

  // MARK: - Region Filter

  private var regionFilter: some View {
    ScrollView(.horizontal, showsIndicators: false) {
      HStack(spacing: 8) {
        ForEach(AwakeningRegion.allCases, id: \.self) { region in
          Button(action: {
            withAnimation { selectedRegion = region }
          }) {
            HStack(spacing: 6) {
              Text(region.emoji)
                .font(.system(size: 14))
              Text(region.rawValue)
                .font(.system(size: 12, weight: .medium))
            }
            .foregroundColor(selectedRegion == region ? .black : .white)
            .padding(.horizontal, 14)
            .padding(.vertical, 8)
            .background(selectedRegion == region ? Color.white : Color.white.opacity(0.1))
            .cornerRadius(20)
          }
        }
      }
      .padding(.horizontal)
    }
    .padding(.vertical, 8)
  }

  // MARK: - Methods Grid

  private var methodsGrid: some View {
    LazyVGrid(
      columns: [
        GridItem(.flexible()),
        GridItem(.flexible()),
      ], spacing: 12
    ) {
      ForEach(filteredMethods) { method in
        NavigationLink(destination: UniversalAwakeningMethodDetailView(method: method)) {
          methodCard(method)
        }
      }
    }
    .padding()
  }

  private var filteredMethods: [UniversalAwakeningMethod] {
    if selectedRegion == .all {
      return viewModel.allMethods
    }
    return viewModel.allMethods.filter { $0.region == selectedRegion }
  }

  private func methodCard(_ method: UniversalAwakeningMethod) -> some View {
    VStack(alignment: .leading, spacing: 10) {
      // Icon and origin
      HStack {
        ZStack {
          Circle()
            .fill(method.color.opacity(0.2))
            .frame(width: 44, height: 44)
          Text(method.icon)
            .font(.system(size: 22))
        }

        Spacer()

        Text(method.region.emoji)
          .font(.system(size: 16))
      }

      // Name
      Text(method.name)
        .font(.system(size: 15, weight: .bold))
        .foregroundColor(.white)
        .lineLimit(1)

      // Tradition
      Text(method.tradition)
        .font(.system(size: 11))
        .foregroundColor(method.color)

      // Brief
      Text(method.briefDescription)
        .font(.system(size: 11))
        .foregroundColor(.gray)
        .lineLimit(2)

      // Difficulty
      HStack(spacing: 4) {
        ForEach(0..<5, id: \.self) { i in
          Circle()
            .fill(i < method.difficulty ? method.color : Color.gray.opacity(0.3))
            .frame(width: 6, height: 6)
        }
        Spacer()
        Image(systemName: "chevron.right")
          .font(.system(size: 10))
          .foregroundColor(.gray)
      }
    }
    .padding(14)
    .background(Color.white.opacity(0.05))
    .cornerRadius(16)
    .overlay(
      RoundedRectangle(cornerRadius: 16)
        .stroke(method.color.opacity(0.3), lineWidth: 1)
    )
  }

  // MARK: - Shared Proof

  private var sharedProofSection: some View {
    VStack(alignment: .leading, spacing: 16) {
      HStack {
        Image(systemName: "link.circle.fill")
          .foregroundColor(.green)
        Text("SHARED PROOF: WE ALL THE SAME")
          .font(.system(size: 12, weight: .black))
          .foregroundColor(.green)
      }

      VStack(spacing: 10) {
        proofRow("Energy rises from base to crown", "Kundalini, Qi, Ruach, Ki, Prana")
        proofRow("Ego dissolves into unity", "Fana, Anatta, Kenosis, Moksha")
        proofRow("Breath is the gateway", "Pranayama, Qigong, Hesychasm, Zazen")
        proofRow("Love is the highest truth", "Bhakti, Agape, Ishq, Metta")
        proofRow("Silence reveals the divine", "Meditation in ALL traditions")
      }

      Text(
        "Different words. Same experience. Same truth. We are all expressions of the same source."
      )
      .font(.system(size: 12))
      .foregroundColor(.white.opacity(0.8))
      .padding(.top, 8)
    }
    .padding()
    .background(Color.green.opacity(0.1))
    .cornerRadius(16)
    .padding()
  }

  private func proofRow(_ concept: String, _ traditions: String) -> some View {
    HStack(alignment: .top, spacing: 10) {
      Image(systemName: "checkmark.circle.fill")
        .foregroundColor(.green)
        .font(.system(size: 14))

      VStack(alignment: .leading, spacing: 2) {
        Text(concept)
          .font(.system(size: 13, weight: .semibold))
          .foregroundColor(.white)
        Text(traditions)
          .font(.system(size: 10))
          .foregroundColor(.gray)
      }
    }
  }

  // MARK: - Start Anywhere

  private var startAnywhereSection: some View {
    VStack(alignment: .leading, spacing: 16) {
      HStack {
        Image(systemName: "play.circle.fill")
          .foregroundColor(.orange)
        Text("START ANYWHERE")
          .font(.system(size: 12, weight: .black))
          .foregroundColor(.orange)
      }

      Text("Don't know where to begin? These practices appear in EVERY tradition:")
        .font(.system(size: 13))
        .foregroundColor(.white.opacity(0.8))

      VStack(spacing: 10) {
        startRow("Breathwork", "5 mins/day conscious breathing", "breath.fill")
        startRow("Stillness", "10 mins sitting in silence", "leaf.fill")
        startRow("Journaling", "Write what arises without judgment", "pencil")
        startRow("Non-attachment", "Notice but don't grasp thoughts", "wind")
        startRow("Compassion", "One act of kindness daily", "heart.fill")
      }

      Text(
        "Master these basics first. Then explore any tradition that calls to you. The path finds you when you're ready."
      )
      .font(.system(size: 12, weight: .medium))
      .foregroundColor(.orange)
    }
    .padding()
    .background(Color.orange.opacity(0.1))
    .cornerRadius(16)
    .padding()
  }

  private func startRow(_ title: String, _ desc: String, _ icon: String) -> some View {
    HStack(spacing: 12) {
      Image(systemName: icon)
        .foregroundColor(.orange)
        .font(.system(size: 16))
        .frame(width: 24)

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
    .padding(10)
    .background(Color.white.opacity(0.05))
    .cornerRadius(10)
  }
}

// MARK: - Region Enum

enum AwakeningRegion: String, CaseIterable {
  case all = "All"
  case asia = "Asia"
  case middleEast = "Middle East"
  case africa = "Africa"
  case europe = "Europe"
  case americas = "Americas"
  case oceania = "Oceania"

  var emoji: String {
    switch self {
    case .all: return "🌍"
    case .asia: return "🌏"
    case .middleEast: return "🕌"
    case .africa: return "🌍"
    case .europe: return "🏰"
    case .americas: return "🌎"
    case .oceania: return "🏝️"
    }
  }
}

// MARK: - Awakening Method Model

struct UniversalAwakeningMethod: Identifiable {
  let id = UUID()
  let name: String
  let tradition: String
  let region: AwakeningRegion
  let icon: String
  let color: Color
  let briefDescription: String
  let fullDescription: String
  let difficulty: Int  // 1-5
  let coreConcept: String
  let howToSteps: [UniversalAwakeningStep]
  let safetyNotes: [String]
  let resources: [String]
  let keyTerms: [String: String]
}

struct UniversalAwakeningStep: Identifiable {
  let id = UUID()
  let number: Int
  let title: String
  let description: String
  let duration: String
  let tips: [String]
}

// MARK: - ViewModel

class AwakeningArsenalViewModel: ObservableObject {
  @Published var allMethods: [UniversalAwakeningMethod] = []

  init() {
    loadMethods()
  }

  private func loadMethods() {
    allMethods = [
      // HINDUISM - Kundalini
      UniversalAwakeningMethod(
        name: "Kundalini Awakening",
        tradition: "Hinduism",
        region: .asia,
        icon: "🐍",
        color: .red,
        briefDescription: "Dormant serpent energy rises through chakras for divine union",
        fullDescription: """
          Kundalini is described as a dormant energy coiled at the base of the spine, visualized as a serpent. When awakened through practices like yoga, breathwork, and meditation, this energy rises through the chakra system, piercing each energy center until it reaches the crown, resulting in union with cosmic consciousness.

          This is one of the most powerful and potentially intense awakening paths. The word "Kundalini" comes from Sanskrit meaning "coiled one." Ancient yogis mapped this energy thousands of years ago, and the practice has been passed down through guru-disciple lineages.
          """,
        difficulty: 5,
        coreConcept:
          "Energy (Shakti) dormant at base rises through 7 chakras to unite with consciousness (Shiva) at crown",
        howToSteps: [
          UniversalAwakeningStep(
            number: 1, title: "Prepare Body & Mind",
            description:
              "Daily yoga asanas to open energy channels (nadis). Start with gentle poses like child's pose, cat-cow, and forward folds.",
            duration: "10-20 mins daily",
            tips: [
              "Practice on empty stomach", "Morning is ideal",
              "Consistency matters more than intensity",
            ]),
          UniversalAwakeningStep(
            number: 2, title: "Master Breathwork",
            description:
              "Learn Nadi Shodhana (alternate nostril breathing) to balance ida and pingala nadis. This prepares the central channel (sushumna) for energy rise.",
            duration: "5-10 mins daily",
            tips: [
              "Breathe smoothly, no strain", "Equal counts in/out",
              "Focus on the flow between nostrils",
            ]),
          UniversalAwakeningStep(
            number: 3, title: "Chakra Meditation",
            description:
              "Focus attention on each chakra starting from root (muladhara). Use seed mantras: LAM, VAM, RAM, YAM, HAM, OM, Silence.",
            duration: "15-30 mins",
            tips: ["Visualize the chakra color", "Feel, don't force", "Journal any sensations"]),
          UniversalAwakeningStep(
            number: 4, title: "Kundalini-Specific Practices",
            description:
              "Once basics are solid, explore Kundalini yoga kriyas (specific sequences), bandhas (energy locks), and advanced pranayama like Breath of Fire.",
            duration: "20-45 mins",
            tips: ["Learn from qualified teacher", "Never force the energy", "Rest when needed"]),
          UniversalAwakeningStep(
            number: 5, title: "Integration & Guidance",
            description:
              "As energy awakens, symptoms may arise (heat, visions, emotions). Journal everything. Seek a qualified guru or teacher. Ground through nature, diet, and rest.",
            duration: "Ongoing",
            tips: ["Symptoms are normal", "Don't chase experiences", "Surrender, don't control"]),
        ],
        safetyNotes: [
          "Kundalini can be intense - build gradually over months/years",
          "Spontaneous awakening can cause 'Kundalini syndrome' - seek support",
          "Physical symptoms (heat, shaking, pressure) are normal but should be monitored",
          "Mental/emotional purging is part of the process",
          "A qualified teacher is highly recommended",
        ],
        resources: [
          "Books: 'Kundalini Tantra' by Swami Satyananda",
          "Teachers: Look for lineage-based instruction",
          "Warning: Avoid forcing; this isn't a race",
        ],
        keyTerms: [
          "Shakti": "Divine feminine energy", "Shiva": "Pure consciousness",
          "Chakra": "Energy center", "Nadi": "Energy channel", "Sushumna": "Central channel",
          "Prana": "Life force",
        ]
      ),

      // TAOISM - Qi Cultivation
      UniversalAwakeningMethod(
        name: "Qi Cultivation",
        tradition: "Taoism",
        region: .asia,
        icon: "☯️",
        color: .green,
        briefDescription: "Balance life force for harmony, health, and immortality",
        fullDescription: """
          Taoism teaches that Qi (Chi) is the vital life force that flows through all living things. Through practices like Qigong, Tai Chi, and internal alchemy, practitioners cultivate, balance, and refine this energy to achieve health, longevity, spiritual clarity, and ultimately, union with the Tao (the Way).

          The Taoist path emphasizes harmony with nature, balance of yin and yang, and the refinement of jing (essence), qi (energy), and shen (spirit). Unlike more intense approaches, Taoism favors gentle, sustainable practice.
          """,
        difficulty: 3,
        coreConcept:
          "Cultivate and circulate Qi through body's energy system, refine essence into spirit, achieve unity with Tao",
        howToSteps: [
          UniversalAwakeningStep(
            number: 1, title: "Grounding & Stance",
            description:
              "Learn Zhan Zhuang (standing meditation). Stand with knees slightly bent, arms rounded as if holding a large ball. This builds Qi and root connection.",
            duration: "5-20 mins daily",
            tips: [
              "Relax completely while standing", "Breathe naturally into lower belly",
              "Feel connection to earth",
            ]),
          UniversalAwakeningStep(
            number: 2, title: "Basic Qigong Movements",
            description:
              "Learn simple Qigong forms like 'Eight Pieces of Brocade' or 'Five Animal Frolics'. Slow, flowing movements circulate Qi.",
            duration: "15-30 mins daily",
            tips: ["Move from center (dantian)", "Breath guides movement", "Quality over quantity"]),
          UniversalAwakeningStep(
            number: 3, title: "Dantian Breathing",
            description:
              "Focus breath and awareness on lower dantian (3 finger widths below navel). This is the body's energy reservoir. Breathe into it, store Qi there.",
            duration: "10-15 mins",
            tips: [
              "Place hand on dantian to feel", "Imagine warm golden ball growing",
              "This is your energy battery",
            ]),
          UniversalAwakeningStep(
            number: 4, title: "Microcosmic Orbit",
            description:
              "Circulate Qi up the back (Du channel) and down the front (Ren channel) in a continuous loop. This is foundational Taoist inner alchemy.",
            duration: "15-30 mins",
            tips: [
              "Start with just awareness, not force", "Use breath to guide, not push",
              "May take months to feel clearly",
            ]),
          UniversalAwakeningStep(
            number: 5, title: "Inner Alchemy (Neidan)",
            description:
              "Advanced practice: refine jing to qi, qi to shen, shen to emptiness. Merge with Tao. This requires dedicated study and ideally a teacher.",
            duration: "Lifelong",
            tips: [
              "Don't rush to advanced practices", "Master basics first",
              "Find authentic lineage teacher",
            ]),
        ],
        safetyNotes: [
          "Gentle path - rarely causes problems if practiced correctly",
          "Don't force Qi movement; let it flow naturally",
          "Maintain balanced lifestyle (diet, sleep, emotions)",
          "Avoid practice when sick, exhausted, or intoxicated",
          "Sexual energy practices require caution and proper instruction",
        ],
        resources: [
          "Books: 'The Tao of Health, Sex, and Longevity' by Daniel Reid",
          "'Awaken Healing Energy Through the Tao' by Mantak Chia",
          "Find local Qigong or Tai Chi classes",
        ],
        keyTerms: [
          "Qi": "Life force energy", "Dantian": "Energy center (lower belly)",
          "Yin/Yang": "Complementary opposites", "Tao": "The Way, ultimate reality",
          "Wu Wei": "Non-forcing action", "Neidan": "Internal alchemy",
        ]
      ),

      // CHRISTIANITY - Christ Consciousness
      UniversalAwakeningMethod(
        name: "Christ Consciousness",
        tradition: "Christianity (Mystical)",
        region: .europe,
        icon: "✝️",
        color: .purple,
        briefDescription: "Indwelling Holy Spirit awakens for rebirth and divine love",
        fullDescription: """
          Christian mysticism, found in traditions from Desert Fathers to Meister Eckhart to Centering Prayer, teaches that the Kingdom of Heaven is within. Christ Consciousness refers to awakening to the indwelling presence of God—the Holy Spirit that Jesus promised.

          This isn't about beliefs but direct experience of divine union. "Not I, but Christ lives in me" (Galatians 2:20) describes the ego dying so the divine can live through you. This is kenosis—self-emptying to be filled with God.
          """,
        difficulty: 3,
        coreConcept:
          "Empty self (kenosis) to be filled with Holy Spirit; die to ego, be reborn in Christ; experience divine union",
        howToSteps: [
          UniversalAwakeningStep(
            number: 1, title: "Sacred Reading (Lectio Divina)",
            description:
              "Read scripture slowly, not for information but for transformation. Let words penetrate. Traditional texts: Gospel of John, Psalms, Paul's letters on inner transformation.",
            duration: "15-20 mins daily",
            tips: [
              "Read very slowly", "Pause when something strikes you",
              "Let it work on you, not you on it",
            ]),
          UniversalAwakeningStep(
            number: 2, title: "Contemplative Prayer",
            description:
              "Move beyond words to silent communion. Methods: Centering Prayer (choose sacred word, return to it when distracted) or Jesus Prayer ('Lord Jesus Christ, have mercy on me').",
            duration: "20 mins, twice daily ideal",
            tips: [
              "Consent to God's presence", "Don't evaluate the prayer",
              "Thoughts are normal, gently return",
            ]),
          UniversalAwakeningStep(
            number: 3, title: "Kenosis (Self-Emptying)",
            description:
              "Practice surrender in daily life. Where are you holding on to control? Pride? Self-image? Offer these to God. 'Thy will, not mine.'",
            duration: "Ongoing",
            tips: [
              "Notice ego attachments", "Surrender doesn't mean passivity", "Trust the process",
            ]),
          UniversalAwakeningStep(
            number: 4, title: "Fasting & Simplicity",
            description:
              "Periodic fasting (from food, media, noise) creates space for God. Jesus fasted 40 days before his ministry began. Start small.",
            duration: "Weekly practice",
            tips: [
              "Start with skipping one meal", "Use hunger as reminder to pray",
              "Notice what you're actually hungry for",
            ]),
          UniversalAwakeningStep(
            number: 5, title: "Embodied Love (Agape)",
            description:
              "Faith without works is dead. Divine love must be lived. Serve others, forgive enemies, see Christ in everyone. This integrates the awakening.",
            duration: "Daily life",
            tips: [
              "Love is not a feeling, it's action", "Start with those closest to you",
              "Forgiveness is essential",
            ]),
        ],
        safetyNotes: [
          "Distinguish authentic mysticism from ego inflation",
          "Find a spiritual director or mentor",
          "Dark night of the soul is normal—don't panic",
          "Balance contemplation with action",
          "Beware of spiritual bypassing",
        ],
        resources: [
          "Books: 'The Cloud of Unknowing', 'Interior Castle' by Teresa of Ávila",
          "'New Seeds of Contemplation' by Thomas Merton",
          "Centering Prayer: contemplativeoutreach.org",
        ],
        keyTerms: [
          "Kenosis": "Self-emptying", "Theosis": "Union with God",
          "Agape": "Divine unconditional love", "Holy Spirit": "God's presence within",
          "Metanoia": "Transformation of mind", "Mystical Body": "Unity of all in Christ",
        ]
      ),

      // BUDDHISM - Bodhi/Enlightenment
      UniversalAwakeningMethod(
        name: "Bodhi (Enlightenment)",
        tradition: "Buddhism",
        region: .asia,
        icon: "🪷",
        color: .yellow,
        briefDescription: "Insight meditation ends suffering through seeing true nature of reality",
        fullDescription: """
          Buddha means 'awakened one.' Buddhism teaches that suffering (dukkha) arises from ignorance of our true nature and attachment to impermanent things. Through meditation, ethical living, and wisdom, we can awaken to reality as it is—empty of inherent self (anatta), impermanent (anicca), and unsatisfactory when grasped (dukkha).

          Enlightenment (Bodhi) is not gaining something new but removing the veils of illusion. It's realizing what was always true—no separate self, interconnection with all beings, and liberation from the cycle of suffering.
          """,
        difficulty: 4,
        coreConcept:
          "See through illusion of separate self; end suffering by ending craving and aversion; realize interconnection",
        howToSteps: [
          UniversalAwakeningStep(
            number: 1, title: "Establish Mindfulness",
            description:
              "Start with breath awareness. Sit comfortably, observe natural breath. When mind wanders (it will), gently return. This builds concentration (samadhi).",
            duration: "Start 5 mins, build to 20+",
            tips: [
              "Don't control breath", "Wandering mind isn't failure", "Consistency trumps duration",
            ]),
          UniversalAwakeningStep(
            number: 2, title: "Develop Insight (Vipassana)",
            description:
              "Once concentration is stable, investigate experience. Notice how sensations arise and pass. Observe thoughts without believing them. See the three marks: impermanence, non-self, unsatisfactoriness.",
            duration: "20-45 mins daily",
            tips: [
              "Don't seek special experiences", "Investigate ordinary moments",
              "Boredom and discomfort are teachers",
            ]),
          UniversalAwakeningStep(
            number: 3, title: "Loving-Kindness (Metta)",
            description:
              "Balance insight with heart. Send goodwill to self, loved ones, neutral people, difficult people, all beings. 'May you be happy, may you be free from suffering.'",
            duration: "10-20 mins",
            tips: [
              "Start with yourself", "It's intention, not feeling", "Include everyone eventually",
            ]),
          UniversalAwakeningStep(
            number: 4, title: "Ethical Foundation (Sila)",
            description:
              "Meditation without ethics is incomplete. Five precepts: don't kill, steal, lie, misuse sexuality, or intoxicate mind. These reduce karmic tangles.",
            duration: "24/7 practice",
            tips: [
              "Not commandments, training rules", "Notice cause and effect",
              "Kindness is always right",
            ]),
          UniversalAwakeningStep(
            number: 5, title: "Retreat & Deepening",
            description:
              "Extended practice (weekend, 10-day, longer retreats) allows deeper insight. Continuous mindfulness reveals subtler layers of self-construction.",
            duration: "Periodic retreats",
            tips: [
              "Start with weekend retreat", "10-day Vipassana retreats are free",
              "Integration after is crucial",
            ]),
        ],
        safetyNotes: [
          "Dark night/dukkha nanas can be challenging—know this is normal",
          "Don't mistake map for territory (stages are descriptive, not prescriptive)",
          "Balance practice with ordinary life",
          "Find a qualified teacher for guidance",
          "Avoid spiritual bypassing—face your psychology",
        ],
        resources: [
          "Books: 'Mindfulness in Plain English' by Bhante Gunaratana",
          "'Seeing That Frees' by Rob Burbea", "Free 10-day retreats: dhamma.org",
        ],
        keyTerms: [
          "Dukkha": "Suffering/unsatisfactoriness", "Anatta": "Non-self", "Anicca": "Impermanence",
          "Nibbana": "Liberation", "Metta": "Loving-kindness", "Sangha": "Community",
        ]
      ),

      // SUFISM - Fana
      UniversalAwakeningMethod(
        name: "Fana (Annihilation)",
        tradition: "Sufism (Islamic Mysticism)",
        region: .middleEast,
        icon: "🌹",
        color: .pink,
        briefDescription: "Divine love dissolves ego into union with the Beloved",
        fullDescription: """
          Sufism is the mystical heart of Islam. While exoteric Islam focuses on law and submission, Sufism seeks direct experience of Allah through love (ishq). Fana means 'annihilation'—the death of the ego-self so only the Divine remains.

          As Rumi wrote: 'Die before you die, and find that there is no death.' The Sufi path uses remembrance (dhikr), poetry, music, and devotion to dissolve the illusion of separation from the Beloved (God).
          """,
        difficulty: 4,
        coreConcept:
          "Through intense love and remembrance, ego dissolves (fana) and one subsists in God (baqa)",
        howToSteps: [
          UniversalAwakeningStep(
            number: 1, title: "Dhikr (Remembrance)",
            description:
              "Repeat divine names or phrases rhythmically. Most common: 'La ilaha illallah' (There is no god but God) or simply 'Allah.' Can be silent or vocal.",
            duration: "Start 10 mins, build to longer",
            tips: [
              "Coordinate with breath", "Let it become automatic", "Feel meaning, not just words",
            ]),
          UniversalAwakeningStep(
            number: 2, title: "Poetry & Heart Opening",
            description:
              "Read Sufi poets: Rumi, Hafiz, Rabia, Ibn Arabi. Let the poetry crack your heart open. The words carry transmission.",
            duration: "Daily reading",
            tips: ["Read aloud slowly", "Let emotion arise", "These are love letters to God"]),
          UniversalAwakeningStep(
            number: 3, title: "Music & Movement (Sama)",
            description:
              "Sufi music (qawwali) and whirling meditation (sema) induce ecstatic states. If possible, find authentic practitioners. Otherwise, explore devotional music.",
            duration: "As available",
            tips: [
              "Whirling requires proper instruction", "Let music transport you",
              "Ecstasy is gift, not goal",
            ]),
          UniversalAwakeningStep(
            number: 4, title: "Service & Surrender",
            description:
              "The ego dies through service (khidmat) and surrender (tawakkul). Serve your teacher, community, the poor. Trust Allah completely in all circumstances.",
            duration: "Daily life",
            tips: ["Service kills pride", "Surrender isn't passive", "Trust even when hard"]),
          UniversalAwakeningStep(
            number: 5, title: "Fana & Baqa",
            description:
              "As practice deepens, moments of ego-dissolution occur. These become more stable. Eventually, one subsists (baqa) in God while functioning normally. This requires a sheikh (teacher).",
            duration: "Grace-dependent",
            tips: ["Can't force fana", "Grace comes to the sincere", "Stay humble always"]),
        ],
        safetyNotes: [
          "Intense emotions are part of the path—don't suppress",
          "Find authentic lineage (tariqa) and teacher (sheikh)",
          "Balance ecstasy with sobriety",
          "Maintain Islamic foundations if practicing within tradition",
          "Cultural appropriation concerns—approach with respect",
        ],
        resources: [
          "Books: 'The Essential Rumi', 'Sufi Message of Hazrat Inayat Khan'",
          "Music: Nusrat Fateh Ali Khan qawwalis",
          "Orders: Mevlevi (Whirling Dervishes), Naqshbandi, Qadiri",
        ],
        keyTerms: [
          "Fana": "Annihilation of ego", "Baqa": "Subsistence in God", "Dhikr": "Remembrance",
          "Tariqa": "Sufi order/path", "Sheikh": "Spiritual teacher", "Ishq": "Divine love",
        ]
      ),

      // KABBALAH
      UniversalAwakeningMethod(
        name: "Sephirot Ascent",
        tradition: "Kabbalah (Jewish Mysticism)",
        region: .middleEast,
        icon: "✡️",
        color: .blue,
        briefDescription: "Climb Tree of Life through divine emanations to cosmic insight",
        fullDescription: """
          Kabbalah is Jewish mysticism, exploring the hidden dimensions of Torah and the structure of creation. Central is the Tree of Life (Etz Chaim)—ten Sephirot (divine emanations) through which the Infinite (Ein Sof) manifests reality.

          The mystic ascends the Tree, balancing and integrating each Sephira, ultimately achieving devekut (cleaving to God). This isn't abstract philosophy but transformative practice involving meditation, prayer, and ethical refinement.
          """,
        difficulty: 5,
        coreConcept:
          "Ascend through 10 Sephirot on Tree of Life, rectify soul, achieve unity (devekut) with Ein Sof",
        howToSteps: [
          UniversalAwakeningStep(
            number: 1, title: "Study the Map",
            description:
              "Learn the 10 Sephirot and their attributes: Keter (Crown), Chokhmah (Wisdom), Binah (Understanding), Chesed (Mercy), Gevurah (Severity), Tiferet (Beauty), Netzach (Victory), Hod (Splendor), Yesod (Foundation), Malkhut (Kingdom).",
            duration: "Foundational study",
            tips: [
              "Don't rush understanding", "Map relates to psychology too",
              "Find good teacher/resources",
            ]),
          UniversalAwakeningStep(
            number: 2, title: "Meditate on Sephirot",
            description:
              "Focus on one Sephira at a time. Contemplate its qualities in yourself and world. Where is your Chesed (mercy)? Your Gevurah (discipline)? Balance is key.",
            duration: "15-30 mins per Sephira",
            tips: ["Start with lower Sephirot", "Journal insights", "Notice imbalances in life"]),
          UniversalAwakeningStep(
            number: 3, title: "Tikkun (Rectification)",
            description:
              "Kabbalistic practice aims to repair (tikkun) self and world. Work on character flaws corresponding to Sephirot. Anger? Work on Gevurah. Scattered? Work on Yesod.",
            duration: "Daily ethical work",
            tips: [
              "Self-knowledge is essential", "Small improvements compound",
              "This repairs cosmic damage too",
            ]),
          UniversalAwakeningStep(
            number: 4, title: "Hitbonenut Meditation",
            description:
              "Contemplative meditation (particularly Chabad tradition) involves deeply contemplating divine concepts until they transform emotion and inspire the heart.",
            duration: "20-30 mins",
            tips: [
              "Think deeply, then feel", "Intellectual becomes experiential", "Use before prayer",
            ]),
          UniversalAwakeningStep(
            number: 5, title: "Devekut (Cleaving)",
            description:
              "Ultimate goal is constant awareness of divine presence. Every action becomes worship. 'In all your ways, know Him.' This integrates study and practice into lived unity.",
            duration: "Lifelong",
            tips: ["Not achieved, received", "Stay humble", "Continue learning always"]),
        ],
        safetyNotes: [
          "Traditional Kabbalah requires strong Jewish foundation",
          "Beware of watered-down 'pop Kabbalah'",
          "Study with authentic teacher when possible",
          "Balance study with practice",
          "Don't get lost in intellectual complexity",
        ],
        resources: [
          "Books: 'Inner Space' by Aryeh Kaplan", "'Tanya' by Rabbi Shneur Zalman",
          "chabad.org for Hasidic approach",
        ],
        keyTerms: [
          "Sephirot": "Divine emanations", "Ein Sof": "The Infinite", "Devekut": "Cleaving to God",
          "Tikkun": "Rectification/repair", "Torah": "Divine teaching",
          "Shekinah": "Divine presence",
        ]
      ),

      // SHAMANISM
      UniversalAwakeningMethod(
        name: "Spirit Journeys",
        tradition: "Shamanism (Indigenous Worldwide)",
        region: .americas,
        icon: "🦅",
        color: .brown,
        briefDescription: "Connect with spirits and ancestors for healing and cosmic wisdom",
        fullDescription: """
          Shamanism is humanity's oldest spiritual technology, found in indigenous cultures worldwide. The shaman journeys to non-ordinary reality—upper, middle, and lower worlds—to commune with spirits, retrieve power/soul parts, and bring healing wisdom back to ordinary life.

          This isn't belief but technology. Rhythmic drumming, dancing, plant medicines (in traditional contexts), and ritual alter consciousness to access dimensions usually hidden.
          """,
        difficulty: 4,
        coreConcept:
          "Enter altered states to journey to spirit realms, work with allies and ancestors, bring back healing",
        howToSteps: [
          UniversalAwakeningStep(
            number: 1, title: "Create Sacred Space",
            description:
              "Build a small altar with items from nature: stones, feathers, plants, water. This anchors spiritual work. Honor the four directions and elements.",
            duration: "Ongoing",
            tips: [
              "Personal meaning matters most", "Keep it alive, not static",
              "This becomes your ally",
            ]),
          UniversalAwakeningStep(
            number: 2, title: "Journey Drumming",
            description:
              "Use monotonous drumbeat (around 4-7 Hz) to enter trance state. Lie down, set intention (meet power animal, ask guidance), let drumming carry you.",
            duration: "15-30 mins",
            tips: ["Recordings available online", "Clear intention is key", "Trust what comes"]),
          UniversalAwakeningStep(
            number: 3, title: "Meet Power Animal",
            description:
              "Journey to lower world (imagine going down into earth) to meet your power animal guide. This ally represents your primal life force and offers guidance.",
            duration: "First journeys",
            tips: ["Accept what appears", "Build relationship over time", "They choose you"]),
          UniversalAwakeningStep(
            number: 4, title: "Work with Ancestors",
            description:
              "Journey to connect with helpful ancestors (not all ancestors are helpful—work with elevated ones). They carry wisdom and can assist healing.",
            duration: "As called",
            tips: [
              "Ask for beneficial ancestors", "Healing lineage heals you", "Listen more than ask",
            ]),
          UniversalAwakeningStep(
            number: 5, title: "Bring Back & Embody",
            description:
              "Shamanic work isn't complete until integrated. What wisdom did you receive? How do you live it? Close journeys with gratitude. Ground thoroughly.",
            duration: "After every journey",
            tips: ["Write immediately after", "Take action on guidance", "Stay grounded"]),
        ],
        safetyNotes: [
          "Learn from indigenous teachers when possible (with cultural sensitivity)",
          "Plant medicines are powerful—don't self-administer without proper context",
          "Ground thoroughly after journeys",
          "Not all spirits are helpful—discernment is essential",
          "Address cultural appropriation concerns—support indigenous communities",
        ],
        resources: [
          "Books: 'The Way of the Shaman' by Michael Harner", "'Soul Retrieval' by Sandra Ingerman",
          "Foundation for Shamanic Studies: shamanism.org",
        ],
        keyTerms: [
          "Journey": "Trance voyage to spirit realms", "Power Animal": "Spirit ally in animal form",
          "Soul Retrieval": "Reclaiming lost soul parts", "Lower/Upper World": "Spirit realms",
          "Ancestors": "Lineage spirits", "Ceremony": "Ritual sacred space",
        ]
      ),

      // ANCIENT EGYPT
      UniversalAwakeningMethod(
        name: "Ka/Ba Activation",
        tradition: "Ancient Egyptian",
        region: .africa,
        icon: "𓂀",
        color: Palette.accent.gold,
        briefDescription: "Unite soul aspects for eternal flight and divine becoming",
        fullDescription: """
          Ancient Egyptians had sophisticated understanding of the soul's multiple aspects: Ka (vital force/double), Ba (personality soul that travels), Akh (illuminated spirit), and others. Temple initiations activated and unified these for 'Osiris becoming'—dying to mortality, becoming eternal.

          The pyramids and temples were initiation chambers. The Book of the Dead guided souls through underworld trials. This tradition influenced Hermeticism, which influenced Western mysticism.
          """,
        difficulty: 4,
        coreConcept:
          "Activate and unite Ka (vital essence) and Ba (soul) to become Akh (illuminated spirit)",
        howToSteps: [
          UniversalAwakeningStep(
            number: 1, title: "Create Temple Space",
            description:
              "Set up sacred space with Egyptian symbols: ankh (life), djed pillar (stability), eye of Horus (protection/healing). Face east (rising sun).",
            duration: "Ongoing setup",
            tips: ["Symbols carry power", "Keep space clean/sacred", "Orient to natural cycles"]),
          UniversalAwakeningStep(
            number: 2, title: "Invoke Neteru (Gods)",
            description:
              "Chant names of gods with intention: Ra (sun/consciousness), Thoth (wisdom), Isis (magic), Osiris (resurrection), Horus (divine child). Feel their qualities.",
            duration: "10-15 mins",
            tips: [
              "Neteru are principles, not beings", "Vibrate names with power",
              "Choose patron deity",
            ]),
          UniversalAwakeningStep(
            number: 3, title: "Ka Cultivation",
            description:
              "Ka is your vital double. Strengthen it through: breath work, visualization of your etheric double, absorbing sunlight and life force from nature. Ka can travel while body sleeps.",
            duration: "Daily practice",
            tips: [
              "Ka feeding through life force", "Visualize Ka body clearly", "Build Ka relationship",
            ]),
          UniversalAwakeningStep(
            number: 4, title: "Ba Flight Practice",
            description:
              "Ba is your soul-bird that travels realms. In deep meditation, visualize Ba (human-headed bird) separating and flying. Journey to solar realms, underworld, star gates.",
            duration: "20-30 mins",
            tips: [
              "Similar to astral projection", "Ba has more consciousness than Ka",
              "Maintain connection to body",
            ]),
          UniversalAwakeningStep(
            number: 5, title: "Akh Unification",
            description:
              "When Ka and Ba unite, you become Akh—an illuminated, effective spirit. This is the goal of Egyptian spirituality: becoming Osiris/Ra, eternal and radiant.",
            duration: "Lifelong work",
            tips: [
              "Death is practice for this", "Live with eternity in view",
              "Righteousness (Ma'at) is essential",
            ]),
        ],
        safetyNotes: [
          "This is reconstructed tradition—approach with humility",
          "Energy work can be intense—ground thoroughly",
          "Study original sources when possible",
          "Respect this as living tradition for some",
          "Integrate with daily ethical living (Ma'at)",
        ],
        resources: [
          "Books: 'Egyptian Book of the Dead', 'Temple of the Cosmos' by Jeremy Naydler",
          "'The Hermetica' for Greek-Egyptian synthesis",
        ],
        keyTerms: [
          "Ka": "Vital double/life force", "Ba": "Soul-bird that travels",
          "Akh": "Illuminated spirit", "Neteru": "Divine principles/gods",
          "Ma'at": "Truth/cosmic order", "Duat": "Underworld/dreamtime",
        ]
      ),

      // JAPAN - Zen/Shinto
      UniversalAwakeningMethod(
        name: "Satori (Sudden Awakening)",
        tradition: "Zen Buddhism / Shinto",
        region: .asia,
        icon: "🎎",
        color: .gray,
        briefDescription: "Ki flow and sudden insight reveal original nature",
        fullDescription: """
          Japanese spirituality blends Zen Buddhism (sudden awakening through meditation) with Shinto (kami spirits, nature reverence). Satori is the Zen term for sudden enlightenment—breaking through conceptual mind to see original nature directly.

          Unlike gradual paths, Zen emphasizes that awakening is always available NOW. Koans (paradoxical riddles) and zazen (seated meditation) strip away mental constructs until truth reveals itself.
          """,
        difficulty: 4,
        coreConcept:
          "Through rigorous meditation and koan inquiry, break through conceptual mind for direct seeing (kensho/satori)",
        howToSteps: [
          UniversalAwakeningStep(
            number: 1, title: "Zazen Basics",
            description:
              "Sit facing wall, spine straight, eyes slightly open. Count breaths 1-10, repeat. When thoughts arise, let them go. This builds concentration and reveals mind's habits.",
            duration: "Start 10 mins, build to 30+",
            tips: ["Posture is important", "Don't fight thoughts", "Just sit, nothing to achieve"]),
          UniversalAwakeningStep(
            number: 2, title: "Shikantaza (Just Sitting)",
            description:
              "Beyond counting, simply be present. No object of meditation, no technique. Pure awareness without manipulation. This is highest Zen practice.",
            duration: "20-40 mins",
            tips: ["Hardest because simplest", "No goal, no progress", "This IS it"]),
          UniversalAwakeningStep(
            number: 3, title: "Koan Practice",
            description:
              "Work with paradoxical questions: 'What is the sound of one hand clapping?' 'What was your face before your parents were born?' Hold question below thought.",
            duration: "During zazen and daily life",
            tips: ["Don't solve intellectually", "Let it work on you", "Doubt is fuel"]),
          UniversalAwakeningStep(
            number: 4, title: "Ki Cultivation (Aikido/Reiki)",
            description:
              "Japanese arts cultivate ki (life energy). Aikido moves with attacker's ki. Reiki channels healing ki. These embody awakening in body.",
            duration: "Regular practice",
            tips: [
              "Energy follows intention", "Relax to conduct ki",
              "Physical practice grounds spiritual",
            ]),
          UniversalAwakeningStep(
            number: 5, title: "Nature Communion (Shinto)",
            description:
              "Visit shrines, honor kami (spirits) in nature. Trees, rivers, mountains have spirit. Bowing, offering, being present. This is pre-Buddhist Japanese spirituality.",
            duration: "Regular practice",
            tips: ["Nature is alive", "Simple offerings work", "Feel don't think"]),
        ],
        safetyNotes: [
          "Zen can be intense—dark nights happen",
          "Find qualified teacher (roshi) for koan work",
          "Balance sitting with movement practice",
          "Don't mistake intellectual understanding for awakening",
          "Respect Japanese cultural context",
        ],
        resources: [
          "Books: 'Zen Mind, Beginner's Mind' by Shunryu Suzuki",
          "'The Three Pillars of Zen' by Philip Kapleau", "Find local Zen center",
        ],
        keyTerms: [
          "Satori": "Awakening", "Kensho": "Seeing true nature", "Zazen": "Seated meditation",
          "Koan": "Paradoxical question", "Ki": "Life energy", "Kami": "Spirits/gods",
        ]
      ),

      // ABORIGINAL - Dreamtime
      UniversalAwakeningMethod(
        name: "Dreamtime Awakening",
        tradition: "Australian Aboriginal",
        region: .oceania,
        icon: "🌌",
        color: .indigo,
        briefDescription: "Connect to eternal Dreamtime through songlines and ceremony",
        fullDescription: """
          Aboriginal Australians have the world's oldest continuous spiritual tradition (60,000+ years). The Dreamtime (Tjukurpa) is not just the past but an eternal now—the creative epoch when ancestor spirits shaped the land, which remains accessible through ceremony, song, and sacred sites.

          Songlines are paths across the landscape that encode creation stories. By singing them, one literally walks in the footsteps of ancestors and accesses Dreamtime consciousness.
          """,
        difficulty: 4,
        coreConcept:
          "Access eternal Dreamtime through story, song, and ceremony; land and spirit are one; we are ancestors dreaming",
        howToSteps: [
          UniversalAwakeningStep(
            number: 1, title: "Land Connection",
            description:
              "Whatever land you're on, develop relationship with it. Sit with trees, rocks, water. Feel the land's presence. Aboriginal understanding: land is alive and conscious.",
            duration: "Daily practice",
            tips: ["Land has memory", "Listen more than talk", "Offer tobacco/water"]),
          UniversalAwakeningStep(
            number: 2, title: "Story Learning",
            description:
              "Learn the stories of where you live—both indigenous if appropriate, and your own ancestry. Stories encode spiritual truth. Share them, don't hoard them.",
            duration: "Ongoing",
            tips: [
              "Seek permission for indigenous stories", "Your lineage has stories too",
              "Stories are medicine",
            ]),
          UniversalAwakeningStep(
            number: 3, title: "Walking Meditation",
            description:
              "Walk country slowly, singing or silent. Feel your footsteps as connection. This is simplified songline practice—walking as prayer, land as teacher.",
            duration: "1-3 hours",
            tips: [
              "Walk without destination", "Notice what draws you", "Land speaks if you listen",
            ]),
          UniversalAwakeningStep(
            number: 4, title: "Dream Work",
            description:
              "Dreamtime is accessed through dreams. Before sleep, set intention to receive guidance. Upon waking, record immediately. Dreams are not fantasy but reality.",
            duration: "Nightly",
            tips: [
              "Dreams are teaching", "Recurring dreams are important", "Act on dream guidance",
            ]),
          UniversalAwakeningStep(
            number: 5, title: "Ceremony Participation",
            description:
              "If invited, participate in authentic ceremony. Otherwise, create simple ceremonies: fire circles, offerings, group singing, honoring cycles.",
            duration: "As available",
            tips: [
              "Never appropriate sacred ceremonies", "Create your own with integrity",
              "Community amplifies",
            ]),
        ],
        safetyNotes: [
          "Approach Aboriginal tradition with utmost respect",
          "Do NOT appropriate sacred ceremonies or restricted knowledge",
          "Support indigenous land rights and communities",
          "Your own ancestry has traditions—explore those too",
          "Land-based spirituality requires being on land",
        ],
        resources: [
          "Books: 'Voices of the First Day' by Robert Lawlor",
          "Support: Indigenous land protection organizations",
          "Learn about YOUR land's indigenous people",
        ],
        keyTerms: [
          "Dreamtime": "Eternal creative epoch", "Songlines": "Paths encoded in song",
          "Country": "Living land", "Tjukurpa": "Law/dreaming", "Ancestors": "Eternal beings",
          "Walkabout": "Spiritual journey",
        ]
      ),

      // MESOAMERICAN
      UniversalAwakeningMethod(
        name: "Cosmic Alignment",
        tradition: "Maya/Aztec",
        region: .americas,
        icon: "🌞",
        color: .orange,
        briefDescription: "Align with cosmic cycles to awaken inner sun",
        fullDescription: """
          Mesoamerican civilizations (Maya, Aztec, Toltec) developed sophisticated understanding of cosmic cycles and human consciousness. The calendar systems mapped not just time but states of consciousness. Humans contain an inner sun (tonalli) that can be awakened.

          The Toltec tradition of impeccable warriorship (made famous by Castaneda, though that's controversial) emphasizes stalking one's own mind, recapitulation of life energy, and dreaming practices.
          """,
        difficulty: 4,
        coreConcept:
          "Align with cosmic cycles, awaken inner sun (tonalli), become 'person of knowledge' through impeccability",
        howToSteps: [
          UniversalAwakeningStep(
            number: 1, title: "Calendar Awareness",
            description:
              "Learn basics of Tzolkin (260-day sacred calendar). Note your birth energy (nawal/day sign). Track current energies. Cosmos moves in cycles, not lines.",
            duration: "Ongoing study",
            tips: [
              "Many free resources online", "Your day sign is significant", "Track energy shifts",
            ]),
          UniversalAwakeningStep(
            number: 2, title: "Recapitulation",
            description:
              "Systematic review and release of life experiences. Start with recent events, work backward. Breathe in what was taken, breathe out what was left. Reclaim energy.",
            duration: "30-60 mins sessions",
            tips: ["Be thorough but gentle", "Emotions will arise", "Freedom is result"]),
          UniversalAwakeningStep(
            number: 3, title: "Sun Gazing & Fire Ceremony",
            description:
              "Safely absorb sun energy at safe times (sunrise/sunset). Fire ceremonies (temazcal/sweat lodge) purify and rebirth. Inner sun awakens through outer sun.",
            duration: "Sunrise/sunset practice",
            tips: [
              "NEVER gaze at bright sun", "Fire is transformation", "Sweat lodge requires guide",
            ]),
          UniversalAwakeningStep(
            number: 4, title: "Dreaming Practice",
            description:
              "Develop lucid dreaming ability. In dreams, you can access other realities, receive teachings, develop energy body. Set dream intentions.",
            duration: "Nightly",
            tips: [
              "Keep dream journal", "Reality checks while awake", "Dreams are as real as waking",
            ]),
          UniversalAwakeningStep(
            number: 5, title: "Impeccability",
            description:
              "Toltec warrior concept: waste no energy on self-importance, pity, or fear. Every action done with full awareness and efficiency. This conserves energy for awakening.",
            duration: "24/7",
            tips: [
              "Not perfection, efficiency", "Observe energy leaks", "Small impeccabilities add up",
            ]),
        ],
        safetyNotes: [
          "Plant medicine (peyote, mushrooms) are traditional but require proper setting",
          "Sweat lodge can be dangerous without experienced leader",
          "Castaneda's work is controversial—use discernment",
          "Support living indigenous communities",
          "Cultural context matters—don't cherry-pick",
        ],
        resources: [
          "Books: 'The Mayan Factor' by José Argüelles (calendrics)",
          "'The Four Agreements' by Don Miguel Ruiz (Toltec)", "Find authentic indigenous teachers",
        ],
        keyTerms: [
          "Tonalli": "Soul/life force/inner sun", "Nawal": "Day sign/spirit",
          "Temazcal": "Sweat lodge", "Nagual": "Unknown/dreaming reality",
          "Recapitulation": "Energy reclamation", "Impeccability": "Energetic efficiency",
        ]
      ),

      // AFRICAN YORUBA
      UniversalAwakeningMethod(
        name: "Orisha Invocation",
        tradition: "Yoruba / Ifa",
        region: .africa,
        icon: "🥁",
        color: .red,
        briefDescription: "Connect with Orishas to awaken destiny (ori) and life force (ashe)",
        fullDescription: """
          Yoruba tradition from West Africa (Nigeria, Benin) centers on Orishas—divine forces/ancestors who govern aspects of nature and human experience. Each person has an Ori (inner divine, destiny head) and can receive Ashe (divine power) through relationship with Orishas.

          This tradition spread through diaspora to become Santeria, Candomblé, Vodou—all sharing African roots. It's a living, practiced tradition with millions of adherents.
          """,
        difficulty: 4,
        coreConcept:
          "Align with your Ori (destiny), receive Ashe (power) through Orisha relationship, fulfill your life purpose",
        howToSteps: [
          UniversalAwakeningStep(
            number: 1, title: "Learn the Orishas",
            description:
              "Study major Orishas: Olodumare (Supreme), Elegua (crossroads), Obatala (creation), Yemoja (ocean/mother), Shango (lightning/justice), Oshun (rivers/love), Ogun (iron/war).",
            duration: "Foundation study",
            tips: [
              "Each Orisha has colors, foods, songs", "Notice which call you",
              "Start with Elegua (opener of ways)",
            ]),
          UniversalAwakeningStep(
            number: 2, title: "Create Shrine",
            description:
              "Set up simple shrine to honor Orishas. Water, candle, offerings appropriate to each Orisha. This is relationship, not worship as commonly understood.",
            duration: "Ongoing",
            tips: ["Keep it fresh and alive", "Offerings are conversation", "Follow protocol"]),
          UniversalAwakeningStep(
            number: 3, title: "Divination",
            description:
              "Ifa divination (cowrie shells, palm nuts) reveals Ori's path. If possible, get reading from babalawo (priest). Otherwise, learn basic systems or use intuitive methods.",
            duration: "As needed",
            tips: ["Divination is guidance", "Don't obsess over readings", "Act on what you learn"]),
          UniversalAwakeningStep(
            number: 4, title: "Drumming & Dance",
            description:
              "Orishas are called through specific rhythms and dances. Each has their own. Participate in or create drum circles. Body becomes vehicle for divine energy.",
            duration: "Regular practice",
            tips: ["Rhythm is language", "Dance embodies the Orisha", "Community amplifies"]),
          UniversalAwakeningStep(
            number: 5, title: "Initiation (Formal Path)",
            description:
              "Serious practitioners undergo formal initiation into a house/lineage. This involves divination, ceremonies, receiving Orishas, community belonging.",
            duration: "Lifelong commitment",
            tips: [
              "Not required for personal practice", "Find legitimate house if drawn",
              "Costs and commitments are real",
            ]),
        ],
        safetyNotes: [
          "Find authentic practitioners—many frauds exist",
          "Blood sacrifice is part of tradition—know what you're entering",
          "Diaspora traditions (Santeria, etc.) are valid but different",
          "Cultural context matters—approach with respect",
          "Community accountability is important",
        ],
        resources: [
          "Books: 'The Way of the Orisa' by Philip Neimark", "'Jambalaya' by Luisah Teish",
          "Find local Ile (house) if called",
        ],
        keyTerms: [
          "Orisha": "Divine force/deity", "Ori": "Inner head/destiny",
          "Ashe": "Divine power/energy", "Ifa": "Divination system", "Babalawo": "Priest",
          "Ile": "House/community",
        ]
      ),

      // CELTIC DRUIDISM
      UniversalAwakeningMethod(
        name: "Awen Inspiration",
        tradition: "Celtic Druidism",
        region: .europe,
        icon: "🌳",
        color: .green,
        briefDescription: "Nature rites and bardic arts bridge worlds for flowing inspiration",
        fullDescription: """
          Druidism was the spiritual tradition of Celtic peoples (Ireland, Scotland, Wales, Brittany, Gaul). Though suppressed by Rome and Christianity, it's being reconstructed from fragments. Central is Awen—'flowing spirit' or divine inspiration accessed through nature communion, poetry, and ritual.

          Druids were priests, poets, judges, and healers. They saw spirit in all nature—trees, rivers, stones, animals. The modern revival honors these principles while acknowledging we're rebuilding, not continuing unbroken lineage.
          """,
        difficulty: 3,
        coreConcept:
          "Through nature connection and bardic arts, receive Awen (divine inspiration) and bridge visible/invisible worlds",
        howToSteps: [
          UniversalAwakeningStep(
            number: 1, title: "Nature Immersion",
            description:
              "Druids trained in forests for years. Spend time daily with trees, especially oak, yew, rowan, hazel. Observe, listen, feel. Nature is the primary teacher.",
            duration: "Daily, extended when possible",
            tips: [
              "Have a 'sit spot' you return to", "Learn tree identification",
              "All weather, all seasons",
            ]),
          UniversalAwakeningStep(
            number: 2, title: "Honor the Cycles",
            description:
              "Celebrate 8 festivals: solstices, equinoxes, and cross-quarters (Imbolc, Beltane, Lughnasadh, Samhain). These attune you to earth's rhythms and ancestral memory.",
            duration: "8 times yearly",
            tips: ["Simple rituals are fine", "Mark transitions consciously", "Community enhances"]),
          UniversalAwakeningStep(
            number: 3, title: "Bardic Practice",
            description:
              "Develop creative expression: poetry, music, storytelling. Awen flows through creativity. Learn some Welsh/Irish if possible. Memorize and recite poetry aloud.",
            duration: "Regular practice",
            tips: ["Voice is power", "Memorization trains mind", "Create, don't just consume"]),
          UniversalAwakeningStep(
            number: 4, title: "Grove Work",
            description:
              "Create or join sacred grove (group or solo practice space). Cast circle, call quarters, invoke deities. Druids worked in threes (Bard, Ovate, Druid grades).",
            duration: "Regular gatherings",
            tips: ["Outdoor when possible", "Learn ritual structure", "Build community"]),
          UniversalAwakeningStep(
            number: 5, title: "Otherworld Journey",
            description:
              "Celtic cosmology includes three realms (Sky, Land, Sea) and Otherworld accessible through trance, wells, burial mounds, etc. Journey for wisdom and healing.",
            duration: "As called",
            tips: [
              "Similar to shamanic journey", "Celtic imagery differs", "Honor the beings there",
            ]),
        ],
        safetyNotes: [
          "Modern Druidry is reconstruction—be honest about this",
          "Avoid romanticizing or fantasizing Celtic past",
          "Balance historical research with living practice",
          "Nature practices require actual nature",
          "Some groups have problematic politics—choose wisely",
        ],
        resources: [
          "Books: 'The Druid Magic Handbook' by John Michael Greer",
          "'Druidry' by Philip Carr-Gomm", "OBOD (Order of Bards, Ovates and Druids): druidry.org",
        ],
        keyTerms: [
          "Awen": "Flowing spirit/inspiration", "Druid": "Priest/wisdom keeper",
          "Grove": "Sacred group/space", "Bard": "Poet grade", "Ovate": "Seer grade",
          "Otherworld": "Spirit realm",
        ]
      ),

      // SIKHISM
      UniversalAwakeningMethod(
        name: "Naam Simran",
        tradition: "Sikhism",
        region: .asia,
        icon: "☬",
        color: .orange,
        briefDescription: "Meditate on divine Name to awaken inner light and merge with Waheguru",
        fullDescription: """
          Sikhism, founded by Guru Nanak (1469), teaches that God (Waheguru) dwells within all. Through Naam Simran (remembrance of the Name), kirtan (devotional singing), and seva (selfless service), the ego dissolves and one experiences union with the divine.

          Unlike renunciate paths, Sikhs are householders who balance spiritual practice with work, family, and social justice. The Guru Granth Sahib (scripture) is considered the living Guru.
          """,
        difficulty: 3,
        coreConcept:
          "Through constant remembrance of Naam (divine vibration), ego dissolves, inner light awakens, union with Waheguru",
        howToSteps: [
          UniversalAwakeningStep(
            number: 1, title: "Naam Simran",
            description:
              "Meditate on 'Waheguru' (wonderful Lord). Can be chanted aloud, whispered, or mental. Focus between eyebrows (third eye). Let the Name fill your being.",
            duration: "Start 15 mins, build to longer",
            tips: ["Quality over quantity", "Name invokes presence", "Let it become automatic"]),
          UniversalAwakeningStep(
            number: 2, title: "Gurbani Study",
            description:
              "Read Guru Granth Sahib daily. Start with Japji Sahib (morning prayer). Even if not Sikh, the wisdom is universal. Let the poetry work on you.",
            duration: "Daily reading",
            tips: [
              "English translations available", "Read slowly, contemplate", "Music versions help",
            ]),
          UniversalAwakeningStep(
            number: 3, title: "Kirtan (Sacred Music)",
            description:
              "Sing or listen to Sikh sacred music. The Guru Granth Sahib was written as music. Kirtan opens the heart and stills the mind.",
            duration: "Regular practice",
            tips: ["YouTube has great kirtan", "Singing is prayer", "Community kirtan powerful"]),
          UniversalAwakeningStep(
            number: 4, title: "Seva (Selfless Service)",
            description:
              "Serve without expectation. Langar (free kitchen) is famous Sikh practice—feeding all regardless of background. Find ways to serve your community.",
            duration: "Regular practice",
            tips: ["Ego dies through service", "All service counts", "Serve with love"]),
          UniversalAwakeningStep(
            number: 5, title: "Amrit Vela",
            description:
              "Wake before dawn (ambrosial hours) for spiritual practice. The hours before sunrise are most conducive to meditation. This is when Sikhs do primary practice.",
            duration: "3-6 AM daily",
            tips: ["Early morning is powerful", "Build gradually", "Sleep early to wake early"]),
        ],
        safetyNotes: [
          "Sikhism welcomes all to practice, but don't claim to be Sikh without commitment",
          "The 5 Ks and turban are for initiated Sikhs",
          "Visit gurdwara (temple) to experience community",
          "Social justice is integral—not optional",
          "Respect the Guru Granth Sahib as living presence",
        ],
        resources: [
          "Guru Granth Sahib: searchgurbani.com, sikhitothemax.org",
          "Books: 'The Sikh Religion' by Max Arthur Macauliffe", "Visit local gurdwara",
        ],
        keyTerms: [
          "Waheguru": "God (wonderful Lord)", "Naam": "Divine Name/vibration",
          "Simran": "Remembrance", "Kirtan": "Sacred music", "Seva": "Selfless service",
          "Gurbani": "Guru's words",
        ]
      ),

      // PAGANISM/WICCA
      UniversalAwakeningMethod(
        name: "Elemental Rituals",
        tradition: "Paganism / Wicca",
        region: .europe,
        icon: "🌙",
        color: .purple,
        briefDescription: "Nature worship and magical practice awaken inner divinity",
        fullDescription: """
          Modern Paganism and Wicca revive pre-Christian European traditions (with some reconstruction and innovation). Central is honoring the divine in nature—God and Goddess, elements, seasons, and all life. 'As above, so below'—the macrocosm reflects in microcosm.

          Magic is the art of causing change in accordance with will, using natural energies. Rather than worship of external deities, many see God/Goddess as aspects of one's own divine nature to be awakened.
          """,
        difficulty: 2,
        coreConcept:
          "Through elemental work, seasonal celebration, and magical practice, awaken the God/Goddess within",
        howToSteps: [
          UniversalAwakeningStep(
            number: 1, title: "Elemental Attunement",
            description:
              "Connect with four elements: Earth (stability, body), Water (emotion, intuition), Fire (will, passion), Air (mind, communication). Spend time with each in nature.",
            duration: "Ongoing practice",
            tips: ["Each element has lessons", "Notice your imbalances", "Elements are in you too"]),
          UniversalAwakeningStep(
            number: 2, title: "Cast Circle",
            description:
              "Learn to create sacred space: ground/center, call quarters, invoke deity, raise cone of power, work magic, ground excess, thank quarters, open circle.",
            duration: "Regular practice",
            tips: ["Structure varies by tradition", "Simple is fine", "Feel the energy"]),
          UniversalAwakeningStep(
            number: 3, title: "Celebrate Sabbats",
            description:
              "Honor 8 seasonal festivals: Yule, Imbolc, Ostara, Beltane, Litha, Lughnasadh, Mabon, Samhain. These attune you to natural cycles and myth.",
            duration: "8 times yearly",
            tips: ["Local seasons matter", "Myth deepens meaning", "Community enhances"]),
          UniversalAwakeningStep(
            number: 4, title: "Moon Work",
            description:
              "Follow lunar cycle. New moon for beginnings, waxing for building, full for power, waning for releasing. Plan workings accordingly. Track your energy with the moon.",
            duration: "Monthly cycle",
            tips: ["Women especially attuned", "Keep moon journal", "Work with, not against cycle"]),
          UniversalAwakeningStep(
            number: 5, title: "Develop Magical Will",
            description:
              "Magic isn't supernatural—it's natural. Set clear intentions, raise energy, direct with will, release attachment to outcome. Start small, build confidence.",
            duration: "Ongoing",
            tips: [
              "Ethics matter (harm none)", "Don't bypass mundane action",
              "Results come when ego releases",
            ]),
        ],
        safetyNotes: [
          "Many traditions exist—explore before committing",
          "Beware of ego inflation ('I'm a powerful witch!')",
          "Some groups have problematic dynamics—trust intuition",
          "Balance magical thinking with practical action",
          "The ethics of magic are important to consider",
        ],
        resources: [
          "Books: 'Wicca' by Scott Cunningham", "'The Spiral Dance' by Starhawk",
          "Find local circles or practice solitary",
        ],
        keyTerms: [
          "Circle": "Sacred space/ritual container", "Sabbat": "Seasonal festival",
          "Esbat": "Moon ritual", "Element": "Earth/Water/Fire/Air",
          "God/Goddess": "Divine masculine/feminine", "Blessed Be": "Blessing/greeting",
        ]
      ),
    ]
  }
}

// MARK: - Universal Method Detail View

struct UniversalAwakeningMethodDetailView: View {
  let method: UniversalAwakeningMethod
  @State private var selectedTab = 0

  var body: some View {
    ScrollView {
      VStack(spacing: 0) {
        // Header
        headerSection

        // Tab Selector
        tabSelector

        // Content based on tab
        switch selectedTab {
        case 0:
          overviewSection
        case 1:
          stepsSection
        case 2:
          safetySection
        default:
          overviewSection
        }
      }
    }
    .background(Color.black.ignoresSafeArea())
    .navigationTitle(method.name)
    .navigationBarTitleDisplayMode(.inline)
  }

  // MARK: - Header

  private var headerSection: some View {
    VStack(spacing: 16) {
      // Icon
      ZStack {
        Circle()
          .fill(method.color.opacity(0.2))
          .frame(width: 80, height: 80)
        Text(method.icon)
          .font(.system(size: 40))
      }

      // Title & Tradition
      VStack(spacing: 4) {
        Text(method.name)
          .font(.system(size: 24, weight: .bold))
          .foregroundColor(.white)

        HStack(spacing: 8) {
          Text(method.tradition)
            .font(.system(size: 14, weight: .medium))
            .foregroundColor(method.color)

          Text("•")
            .foregroundColor(.gray)

          Text(method.region.rawValue)
            .font(.system(size: 14))
            .foregroundColor(.gray)
        }
      }

      // Difficulty
      HStack(spacing: 4) {
        Text("Intensity:")
          .font(.system(size: 12))
          .foregroundColor(.gray)
        ForEach(0..<5, id: \.self) { i in
          Image(systemName: i < method.difficulty ? "flame.fill" : "flame")
            .font(.system(size: 12))
            .foregroundColor(i < method.difficulty ? method.color : .gray.opacity(0.3))
        }
      }

      // Core Concept
      Text(method.coreConcept)
        .font(.system(size: 14, weight: .medium))
        .foregroundColor(.white.opacity(0.8))
        .multilineTextAlignment(.center)
        .padding(.horizontal, 20)
        .padding(.vertical, 12)
        .background(method.color.opacity(0.15))
        .cornerRadius(12)
        .padding(.horizontal)
    }
    .padding(.vertical, 24)
  }

  // MARK: - Tab Selector

  private var tabSelector: some View {
    HStack(spacing: 0) {
      tabButton("Overview", index: 0)
      tabButton("How To", index: 1)
      tabButton("Safety", index: 2)
    }
    .background(Color.white.opacity(0.05))
  }

  private func tabButton(_ title: String, index: Int) -> some View {
    Button(action: { selectedTab = index }) {
      VStack(spacing: 8) {
        Text(title)
          .font(.system(size: 14, weight: selectedTab == index ? .bold : .medium))
          .foregroundColor(selectedTab == index ? method.color : .gray)

        Rectangle()
          .fill(selectedTab == index ? method.color : Color.clear)
          .frame(height: 2)
      }
    }
    .frame(maxWidth: .infinity)
    .padding(.top, 12)
  }

  // MARK: - Overview Section

  private var overviewSection: some View {
    VStack(alignment: .leading, spacing: 20) {
      // Full Description
      Text(method.fullDescription)
        .font(.system(size: 15))
        .foregroundColor(.white.opacity(0.9))
        .lineSpacing(6)

      // Key Terms
      if !method.keyTerms.isEmpty {
        VStack(alignment: .leading, spacing: 12) {
          HStack {
            Image(systemName: "book.fill")
              .foregroundColor(method.color)
            Text("KEY TERMS")
              .font(.system(size: 12, weight: .black))
              .foregroundColor(method.color)
          }

          ForEach(Array(method.keyTerms.keys.sorted()), id: \.self) { key in
            HStack(alignment: .top, spacing: 8) {
              Text(key)
                .font(.system(size: 13, weight: .bold))
                .foregroundColor(.white)
              Text("—")
                .foregroundColor(.gray)
              Text(method.keyTerms[key] ?? "")
                .font(.system(size: 13))
                .foregroundColor(.gray)
            }
          }
        }
        .padding()
        .background(Color.white.opacity(0.05))
        .cornerRadius(12)
      }

      // Resources
      if !method.resources.isEmpty {
        VStack(alignment: .leading, spacing: 12) {
          HStack {
            Image(systemName: "link.circle.fill")
              .foregroundColor(.blue)
            Text("RESOURCES")
              .font(.system(size: 12, weight: .black))
              .foregroundColor(.blue)
          }

          ForEach(method.resources, id: \.self) { resource in
            HStack(alignment: .top, spacing: 8) {
              Image(systemName: "arrow.right.circle")
                .font(.system(size: 12))
                .foregroundColor(.blue)
              Text(resource)
                .font(.system(size: 13))
                .foregroundColor(.white.opacity(0.8))
            }
          }
        }
        .padding()
        .background(Color.white.opacity(0.05))
        .cornerRadius(12)
      }
    }
    .padding()
  }

  // MARK: - Steps Section

  private var stepsSection: some View {
    VStack(alignment: .leading, spacing: 16) {
      ForEach(method.howToSteps) { step in
        stepCard(step)
      }
    }
    .padding()
  }

  private func stepCard(_ step: UniversalAwakeningStep) -> some View {
    VStack(alignment: .leading, spacing: 12) {
      // Step number and title
      HStack(alignment: .top, spacing: 12) {
        ZStack {
          Circle()
            .fill(method.color)
            .frame(width: 32, height: 32)
          Text("\(step.number)")
            .font(.system(size: 14, weight: .bold))
            .foregroundColor(.white)
        }

        VStack(alignment: .leading, spacing: 4) {
          Text(step.title)
            .font(.system(size: 16, weight: .bold))
            .foregroundColor(.white)

          Text(step.duration)
            .font(.system(size: 12))
            .foregroundColor(method.color)
        }

        Spacer()
      }

      // Description
      Text(step.description)
        .font(.system(size: 14))
        .foregroundColor(.white.opacity(0.85))
        .lineSpacing(4)

      // Tips
      if !step.tips.isEmpty {
        VStack(alignment: .leading, spacing: 6) {
          Text("Tips:")
            .font(.system(size: 12, weight: .bold))
            .foregroundColor(.gray)

          ForEach(step.tips, id: \.self) { tip in
            HStack(alignment: .top, spacing: 6) {
              Image(systemName: "lightbulb.fill")
                .font(.system(size: 10))
                .foregroundColor(.yellow)
              Text(tip)
                .font(.system(size: 12))
                .foregroundColor(.white.opacity(0.7))
            }
          }
        }
        .padding(.top, 8)
      }
    }
    .padding()
    .background(Color.white.opacity(0.05))
    .cornerRadius(12)
    .overlay(
      RoundedRectangle(cornerRadius: 12)
        .stroke(method.color.opacity(0.3), lineWidth: 1)
    )
  }

  // MARK: - Safety Section

  private var safetySection: some View {
    VStack(alignment: .leading, spacing: 16) {
      // Warning Header
      HStack {
        Image(systemName: "exclamationmark.triangle.fill")
          .foregroundColor(.orange)
        Text("SAFETY NOTES")
          .font(.system(size: 14, weight: .black))
          .foregroundColor(.orange)
      }
      .padding(.bottom, 8)

      // Safety Notes
      ForEach(method.safetyNotes, id: \.self) { note in
        HStack(alignment: .top, spacing: 12) {
          Image(systemName: "checkmark.shield.fill")
            .foregroundColor(.orange)
            .font(.system(size: 14))

          Text(note)
            .font(.system(size: 14))
            .foregroundColor(.white.opacity(0.9))
            .lineSpacing(4)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.orange.opacity(0.1))
        .cornerRadius(10)
      }

      // General Warning
      VStack(alignment: .leading, spacing: 8) {
        Text("Remember")
          .font(.system(size: 14, weight: .bold))
          .foregroundColor(.white)

        Text(
          "Every awakening path has been walked by millions before you. Trust the process, but always listen to your body and mind. If something doesn't feel right, slow down or seek guidance."
        )
        .font(.system(size: 13))
        .foregroundColor(.gray)
        .lineSpacing(4)
      }
      .padding()
      .background(Color.white.opacity(0.05))
      .cornerRadius(12)
    }
    .padding()
  }
}

#Preview {
  NavigationStack {
    UniversalAwakeningArsenalView()
  }
}
