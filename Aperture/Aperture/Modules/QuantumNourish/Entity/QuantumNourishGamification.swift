// QuantumNourishGamification.swift
// GAMIFICATION ENGINE — Ascend Through Achievement
// ☀️ SunFlow: Reignited

import SwiftUI

// MARK: - Cosmic Badges

enum CosmicBadge: String, CaseIterable, Identifiable, Codable {
  case firstScan = "First Scan"
  case labelDecoder = "Label Decoder"
  case killListMaster = "Kill List Master"
  case sevenDayStreak = "7-Day Streak"
  case twentyOneDayStreak = "21-Day Streak"
  case pinealProtector = "Pineal Protector"
  case vibeArchitect = "Vibe Architect"
  case rawWarrior = "Raw Warrior"
  case waterBearer = "Water Bearer"
  case mushroomShaman = "Mushroom Shaman"
  case greenJuiceAlchemist = "Green Alchemist"
  case frequencyMaster = "Frequency Master"
  case enlightenedEater = "Enlightened Eater"
  case cosmicChef = "Cosmic Chef"
  case sunflowElite = "SunFlow Elite"

  var id: String {
    rawValue
  }

  var icon: String {
    switch self {
    case .firstScan: return "barcode.viewfinder"
    case .labelDecoder: return "doc.text.magnifyingglass"
    case .killListMaster: return "xmark.octagon.fill"
    case .sevenDayStreak: return "flame.fill"
    case .twentyOneDayStreak: return "flame.circle.fill"
    case .pinealProtector: return "eye.fill"
    case .vibeArchitect: return "waveform.path.ecg"
    case .rawWarrior: return "leaf.fill"
    case .waterBearer: return "drop.fill"
    case .mushroomShaman: return "aqi.medium"
    case .greenJuiceAlchemist: return "cup.and.saucer.fill"
    case .frequencyMaster: return "antenna.radiowaves.left.and.right"
    case .enlightenedEater: return "sun.max.fill"
    case .cosmicChef: return "fork.knife.circle.fill"
    case .sunflowElite: return "sparkles"
    }
  }

  var color: Color {
    switch self {
    case .firstScan: return Color(hex: "#3498DB")
    case .labelDecoder: return Color(hex: "#E74C3C")
    case .killListMaster: return Color(hex: "#FF0000")
    case .sevenDayStreak: return Color(hex: "#FF6B35")
    case .twentyOneDayStreak: return Color(hex: "#FFD700")
    case .pinealProtector: return Color(hex: "#9B59B6")
    case .vibeArchitect: return Color(hex: "#1ABC9C")
    case .rawWarrior: return Color(hex: "#2ECC71")
    case .waterBearer: return Color(hex: "#00BFFF")
    case .mushroomShaman: return Color(hex: "#8B4513")
    case .greenJuiceAlchemist: return Color(hex: "#32CD32")
    case .frequencyMaster: return Color(hex: "#9933FF")
    case .enlightenedEater: return Color(hex: "#FFD700")
    case .cosmicChef: return Color(hex: "#FF69B4")
    case .sunflowElite: return Color(hex: "#FFD700")
    }
  }

  var requirement: String {
    switch self {
    case .firstScan: return "Scan your first food label"
    case .labelDecoder: return "Scan 10 different labels"
    case .killListMaster: return "Learn all items on the Kill List"
    case .sevenDayStreak: return "Log meals for 7 consecutive days"
    case .twentyOneDayStreak: return "Log meals for 21 days — new habit formed"
    case .pinealProtector: return "Avoid all pineal calcifiers for 7 days"
    case .vibeArchitect: return "Average 60+ MHz for a full week"
    case .rawWarrior: return "Log 3 consecutive days of 70%+ raw food"
    case .waterBearer: return "Log spring/filtered water for 7 days"
    case .mushroomShaman: return "Include medicinal mushrooms for 5 days"
    case .greenJuiceAlchemist: return "Log green juice 10 times"
    case .frequencyMaster: return "Average 72+ MHz for 14 consecutive days"
    case .enlightenedEater: return "Complete all Six Pillars education"
    case .cosmicChef: return "Complete the 7-Day Quantum Meal Plan"
    case .sunflowElite: return "Earn all other badges — you are the frequency"
    }
  }

  var tier: BadgeTier {
    switch self {
    case .firstScan, .labelDecoder, .waterBearer: return .bronze
    case .killListMaster, .sevenDayStreak, .rawWarrior, .greenJuiceAlchemist: return .silver
    case .twentyOneDayStreak, .pinealProtector, .vibeArchitect, .mushroomShaman, .cosmicChef:
      return .gold
    case .frequencyMaster, .enlightenedEater: return .diamond
    case .sunflowElite: return .cosmic
    }
  }
}

enum BadgeTier: String, CaseIterable, Codable {
  case bronze = "Bronze"
  case silver = "Silver"
  case gold = "Gold"
  case diamond = "Diamond"
  case cosmic = "Cosmic"

  var glowColor: Color {
    switch self {
    case .bronze: return Color(hex: "#CD7F32")
    case .silver: return Color(hex: "#C0C0C0")
    case .gold: return Color(hex: "#FFD700")
    case .diamond: return Color(hex: "#00BFFF")
    case .cosmic: return Color(hex: "#9933FF")
    }
  }
}

// MARK: - Frequency Challenges

struct FrequencyChallenge: Identifiable {
  let id: String
  let title: String
  let description: String
  let duration: Int  // days
  let targetMhz: Int
  let rules: [String]
  let reward: CosmicBadge?
  let icon: String
  let color: Color
}

class FrequencyChallengeEngine {
  static let challenges: [FrequencyChallenge] = [
    FrequencyChallenge(
      id: "alkaline_week",
      title: "Alkaline Week",
      description: "7 days of alkaline-dominant eating. Target: no acidic-tier foods.",
      duration: 7,
      targetMhz: 50,
      rules: [
        "No foods from Destructive or Acidic tiers", "Minimum 3 raw meals per week",
        "Spring water or filtered only", "Log every meal",
      ],
      reward: .vibeArchitect,
      icon: "leaf.circle.fill",
      color: Color(hex: "#2ECC71")
    ),
    FrequencyChallenge(
      id: "pineal_cleanse",
      title: "Pineal Cleanse Protocol",
      description: "14 days of targeted pineal decalcification through diet.",
      duration: 14,
      targetMhz: 60,
      rules: [
        "Zero fluoride exposure (water, toothpaste)", "Daily turmeric + black pepper",
        "Chlorella or spirulina daily", "No alcohol or processed foods",
        "Sun gaze at sunrise/sunset (safely)",
      ],
      reward: .pinealProtector,
      icon: "eye.fill",
      color: Color(hex: "#9B59B6")
    ),
    FrequencyChallenge(
      id: "raw_reset",
      title: "72-Hour Raw Reset",
      description: "3 days of 100% raw food to supercharge your biofield.",
      duration: 3,
      targetMhz: 75,
      rules: [
        "Nothing cooked above 118°F / 48°C", "Fresh juices within 15 min of pressing",
        "Living sprouts with every meal", "Hydrate with spring water only",
      ],
      reward: .rawWarrior,
      icon: "bolt.fill",
      color: Color(hex: "#FF6B35")
    ),
    FrequencyChallenge(
      id: "mushroom_protocol",
      title: "Mycelium Mind Protocol",
      description: "5 days of medicinal mushroom integration.",
      duration: 5,
      targetMhz: 55,
      rules: [
        "Lion's Mane daily (neurogenesis)", "Chaga tea in the morning", "Reishi before bed",
        "Turkey Tail with meals", "Journal cognitive changes",
      ],
      reward: .mushroomShaman,
      icon: "aqi.medium",
      color: Color(hex: "#8B4513")
    ),
    FrequencyChallenge(
      id: "cosmic_chef",
      title: "7-Day Quantum Meal Plan",
      description: "Follow the full consciousness elevation protocol.",
      duration: 7,
      targetMhz: 72,
      rules: [
        "Follow each day's specific protocol", "Log all meals in Vibe Tracker",
        "No cheating — consciousness doesn't negotiate", "Complete daily reflection",
      ],
      reward: .cosmicChef,
      icon: "fork.knife.circle.fill",
      color: Color(hex: "#FFD700")
    ),
  ]
}

// MARK: - Gamification State Manager

class QuantumNourishProgress: ObservableObject {
  static let shared = QuantumNourishProgress()

  @Published var earnedBadges: Set<String> = []
  @Published var currentStreak: Int = 0
  @Published var totalScans: Int = 0
  @Published var totalMealsLogged: Int = 0
  @Published var averageMhz: Int = 0
  @Published var activeChallenge: String? = nil
  @Published var challengeDay: Int = 0

  private let defaults = UserDefaults.standard
  private let badgesKey = "quantum_nourish_badges"
  private let streakKey = "quantum_nourish_streak"
  private let scansKey = "quantum_nourish_scans"
  private let mealsKey = "quantum_nourish_meals"

  init() {
    load()
  }

  func load() {
    earnedBadges = Set(defaults.stringArray(forKey: badgesKey) ?? [])
    currentStreak = defaults.integer(forKey: streakKey)
    totalScans = defaults.integer(forKey: scansKey)
    totalMealsLogged = defaults.integer(forKey: mealsKey)
  }

  func save() {
    defaults.set(Array(earnedBadges), forKey: badgesKey)
    defaults.set(currentStreak, forKey: streakKey)
    defaults.set(totalScans, forKey: scansKey)
    defaults.set(totalMealsLogged, forKey: mealsKey)
  }

  func recordScan() {
    totalScans += 1
    if totalScans == 1 { earnBadge(.firstScan) }
    if totalScans >= 10 { earnBadge(.labelDecoder) }
    save()
  }

  func recordMeal(mhz _: Int) {
    totalMealsLogged += 1
    currentStreak += 1  // Simplified — in production, check date continuity
    if currentStreak >= 7 { earnBadge(.sevenDayStreak) }
    if currentStreak >= 21 { earnBadge(.twentyOneDayStreak) }
    save()
  }

  func earnBadge(_ badge: CosmicBadge) {
    guard !earnedBadges.contains(badge.rawValue) else { return }
    earnedBadges.insert(badge.rawValue)
    save()
    HapticManager.shared.heavy()
  }

  func hasBadge(_ badge: CosmicBadge) -> Bool {
    earnedBadges.contains(badge.rawValue)
  }

  var completionPercentage: Double {
    Double(earnedBadges.count) / Double(CosmicBadge.allCases.count) * 100
  }

  var level: String {
    let count = earnedBadges.count
    if count >= 14 { return "☀️ SunFlow Elite" }
    if count >= 10 { return "🌟 Frequency Master" }
    if count >= 7 { return "⚡ Vibe Architect" }
    if count >= 4 { return "🌿 Conscious Eater" }
    if count >= 1 { return "🌱 Awakened Beginner" }
    return "😴 Still Sleeping"
  }
}

// MARK: - Badge Display View

struct CosmicBadgeGalleryView: View {
  @Environment(\.dismiss) var dismiss
  @StateObject private var progress = QuantumNourishProgress.shared
  @State private var pulsePhase: CGFloat = 0

  var body: some View {
    NavigationStack {
      ZStack {
        Color.black.ignoresSafeArea()

        ScrollView(showsIndicators: false) {
          VStack(spacing: 20) {
            // Level header
            VStack(spacing: 10) {
              Text("YOUR LEVEL")
                .font(.system(size: 10, weight: .bold)).tracking(3).foregroundColor(
                  Palette.text.muted)
              Text(progress.level)
                .font(.system(size: 24, weight: .bold, design: .rounded))
                .foregroundColor(Palette.accent.gold)
              Text("\(progress.earnedBadges.count) / \(CosmicBadge.allCases.count) badges earned")
                .font(.system(size: 13, weight: .medium)).foregroundColor(Palette.text.muted)

              // Progress bar
              GeometryReader { geo in
                ZStack(alignment: .leading) {
                  RoundedRectangle(cornerRadius: 6)
                    .fill(Color.white.opacity(0.1))
                    .frame(height: 8)
                  RoundedRectangle(cornerRadius: 6)
                    .fill(
                      LinearGradient(
                        colors: [.green, Color(hex: "#FFD700"), Color(hex: "#9933FF")],
                        startPoint: .leading, endPoint: .trailing)
                    )
                    .frame(width: geo.size.width * progress.completionPercentage / 100, height: 8)
                }
              }
              .frame(height: 8)
            }
            .padding(.top, 12)

            // Stats
            HStack(spacing: 12) {
              statBox(
                value: "\(progress.currentStreak)", label: "Day Streak", icon: "flame.fill",
                color: .orange)
              statBox(
                value: "\(progress.totalScans)", label: "Scans", icon: "barcode.viewfinder",
                color: Color(hex: "#E74C3C"))
              statBox(
                value: "\(progress.totalMealsLogged)", label: "Meals", icon: "fork.knife",
                color: Color(hex: "#2ECC71"))
            }

            // Badge grid by tier
            ForEach(BadgeTier.allCases, id: \.self) { tier in
              let tierBadges = CosmicBadge.allCases.filter { $0.tier == tier }

              VStack(alignment: .leading, spacing: 10) {
                Text("\(tier.rawValue.uppercased()) TIER")
                  .font(.system(size: 10, weight: .bold)).tracking(2)
                  .foregroundColor(tier.glowColor)

                LazyVGrid(
                  columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())],
                  spacing: 12
                ) {
                  ForEach(tierBadges) { badge in
                    badgeCell(badge)
                  }
                }
              }
            }

            Spacer(minLength: 100)
          }
          .padding(.horizontal, 20)
        }
      }
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItem(placement: .principal) {
          Text("COSMIC BADGES").font(.system(size: 12, weight: .bold, design: .rounded)).tracking(2)
            .foregroundColor(Palette.accent.gold)
        }
        ToolbarItem(placement: .navigationBarTrailing) {
          Button("Done") { dismiss() }.foregroundColor(Palette.accent.gold)
        }
      }
      .onAppear {
        withAnimation(.easeInOut(duration: 2).repeatForever(autoreverses: true)) { pulsePhase = 1 }
      }
    }
  }

  private func statBox(value: String, label: String, icon: String, color: Color) -> some View {
    VStack(spacing: 6) {
      Image(systemName: icon).font(.system(size: 16)).foregroundColor(color)
      Text(value).font(.system(size: 20, weight: .bold, design: .rounded)).foregroundColor(
        Palette.text.primary)
      Text(label).font(.system(size: 9, weight: .medium)).foregroundColor(Palette.text.muted)
    }
    .frame(maxWidth: .infinity)
    .padding(.vertical, 12)
    .background(RoundedRectangle(cornerRadius: 12).fill(Color.white.opacity(0.04)))
  }

  private func badgeCell(_ badge: CosmicBadge) -> some View {
    let earned = progress.hasBadge(badge)

    return VStack(spacing: 6) {
      ZStack {
        Circle()
          .fill(earned ? badge.color.opacity(0.2) : Color.white.opacity(0.04))
          .frame(width: 56, height: 56)

        if earned {
          Circle()
            .stroke(badge.color.opacity(0.5), lineWidth: 2)
            .frame(width: 56, height: 56)
            .scaleEffect(1 + pulsePhase * 0.05)
        }

        Image(systemName: badge.icon)
          .font(.system(size: 22))
          .foregroundColor(earned ? badge.color : Palette.text.muted.opacity(0.3))
      }

      Text(badge.rawValue)
        .font(.system(size: 9, weight: .bold, design: .rounded))
        .foregroundColor(earned ? badge.color : Palette.text.muted.opacity(0.3))
        .multilineTextAlignment(.center)
        .lineLimit(2)
    }
    .frame(maxWidth: .infinity)
  }
}

// MARK: - Challenge View

struct FrequencyChallengesView: View {
  @Environment(\.dismiss) var dismiss
  @StateObject private var progress = QuantumNourishProgress.shared

  var body: some View {
    NavigationStack {
      ZStack {
        Color.black.ignoresSafeArea()

        ScrollView(showsIndicators: false) {
          VStack(spacing: 16) {
            VStack(spacing: 8) {
              Text("FREQUENCY CHALLENGES")
                .font(.system(size: 10, weight: .bold)).tracking(4).foregroundColor(
                  Color(hex: "#FF6B35"))
              Text("Level Up Your Frequency")
                .font(.system(size: 22, weight: .bold, design: .rounded)).foregroundColor(
                  Palette.text.primary)
            }
            .padding(.top, 12)

            ForEach(FrequencyChallengeEngine.challenges) { challenge in
              challengeCard(challenge)
            }

            Spacer(minLength: 100)
          }
          .padding(.horizontal, 20)
        }
      }
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItem(placement: .navigationBarTrailing) {
          Button("Done") { dismiss() }.foregroundColor(Color(hex: "#FF6B35"))
        }
      }
    }
  }

  private func challengeCard(_ challenge: FrequencyChallenge) -> some View {
    VStack(alignment: .leading, spacing: 12) {
      HStack(spacing: 12) {
        ZStack {
          Circle().fill(challenge.color.opacity(0.2)).frame(width: 46, height: 46)
          Image(systemName: challenge.icon).font(.system(size: 20)).foregroundColor(challenge.color)
        }
        VStack(alignment: .leading, spacing: 4) {
          Text(challenge.title.uppercased()).font(
            .system(size: 12, weight: .bold, design: .rounded)
          ).foregroundColor(challenge.color)
          Text("\(challenge.duration) days • Target \(challenge.targetMhz)+ MHz").font(
            .system(size: 10, weight: .medium)
          ).foregroundColor(Palette.text.muted)
        }
        Spacer()
        if let reward = challenge.reward {
          VStack(spacing: 2) {
            Image(systemName: reward.icon).font(.system(size: 14)).foregroundColor(reward.color)
            Text("REWARD").font(.system(size: 7, weight: .bold)).foregroundColor(Palette.text.muted)
          }
        }
      }

      Text(challenge.description).font(.system(size: 13, weight: .medium)).foregroundColor(
        Palette.text.secondary)

      VStack(alignment: .leading, spacing: 6) {
        Text("RULES").font(.system(size: 9, weight: .bold)).tracking(1).foregroundColor(
          challenge.color)
        ForEach(challenge.rules, id: \.self) { rule in
          HStack(spacing: 6) {
            Image(systemName: "checkmark.circle").font(.system(size: 10)).foregroundColor(
              challenge.color.opacity(0.6))
            Text(rule).font(.system(size: 12, weight: .medium)).foregroundColor(
              Palette.text.secondary)
          }
        }
      }

      Button {
        progress.activeChallenge = challenge.id
        progress.challengeDay = 1
        HapticManager.shared.medium()
      } label: {
        Text(
          progress.activeChallenge == challenge.id
            ? "DAY \(progress.challengeDay) OF \(challenge.duration)" : "START CHALLENGE"
        )
        .font(.system(size: 12, weight: .bold, design: .rounded))
        .foregroundColor(.black)
        .frame(maxWidth: .infinity)
        .padding(10)
        .background(RoundedRectangle(cornerRadius: 8).fill(challenge.color))
      }
    }
    .padding(14)
    .background(
      RoundedRectangle(cornerRadius: 14)
        .fill(challenge.color.opacity(0.04))
        .overlay(
          RoundedRectangle(cornerRadius: 14).stroke(challenge.color.opacity(0.15), lineWidth: 1))
    )
  }
}
