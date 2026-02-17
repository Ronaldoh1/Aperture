// AlexandriaExpandedModules.swift
// Alexandria Library - Complete Knowledge Modules
// "What they don't teach in schools"

import SwiftUI

// MARK: - Real Physics View

struct RealPhysicsView: View {
  @Environment(\.dismiss) private var dismiss

  let topics: [(String, String, String)] = [
    (
      "⚡", "Electric Universe Theory",
      "Gravity is not the dominant force. Electromagnetic forces shape galaxies, stars, and planets."
    ),
    (
      "🌀", "Vortex Mathematics",
      "The universe operates through vortex dynamics. Marko Rodin's work reveals hidden patterns."
    ),
    (
      "💫", "Ether/Aether Physics",
      "Space is not empty. The ether was removed from physics for control, not science."
    ),
    (
      "🧲", "Suppressed Free Energy",
      "Tesla, Schauberger, and others discovered energy technologies that threatened oil interests."
    ),
    (
      "📐", "Sacred Geometry in Nature",
      "Fibonacci, phi, and platonic solids aren't coincidence. They're the architecture of reality."
    ),
    (
      "🌊", "Cymatics",
      "Sound creates form. Water, sand, and matter organize into geometric patterns through vibration."
    ),
    (
      "⏱️", "Time as Illusion",
      "Linear time is a construct. All moments exist simultaneously. Physics increasingly confirms this."
    ),
    (
      "🔭", "Plasma Cosmology",
      "Stars are not nuclear furnaces. They're electrical phenomena in a cosmic plasma network."
    ),
  ]

  var body: some View {
    NavigationStack {
      ZStack {
        LinearGradient(
          colors: [Color(hex: "0a0a1a"), Color(hex: "0a1a2a")],
          startPoint: .top,
          endPoint: .bottom
        )
        .ignoresSafeArea()

        ScrollView {
          VStack(spacing: 24) {
            // Header
            VStack(spacing: 12) {
              Text("⚛️")
                .font(.system(size: 60))
              Text("Real Physics")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundStyle(.white)
              Text("What mainstream science won't teach")
                .font(.subheadline)
                .foregroundStyle(.white.opacity(0.7))
            }
            .padding(.vertical, 20)

            // Topics
            VStack(alignment: .leading, spacing: 16) {
              ForEach(topics, id: \.1) { topic in
                physicsCard(icon: topic.0, title: topic.1, desc: topic.2)
              }
            }

            // Quote
            VStack(spacing: 8) {
              Text(
                "\"The day science begins to study non-physical phenomena, it will make more progress in one decade than in all the previous centuries.\""
              )
              .font(.caption)
              .italic()
              .foregroundStyle(.white.opacity(0.7))
              .multilineTextAlignment(.center)
              Text("— Nikola Tesla")
                .font(.caption2)
                .foregroundStyle(Color(hex: "00BFFF"))
            }
            .padding()
            .background(Color.white.opacity(0.05))
            .cornerRadius(12)

            Spacer(minLength: 50)
          }
          .padding(.horizontal, 20)
          .padding(.top, 20)
        }
      }
      .navigationTitle("⚛️ Real Physics")
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItem(placement: .navigationBarTrailing) {
          Button("Done") { dismiss() }
            .foregroundStyle(Color(hex: "00BFFF"))
        }
      }
    }
  }

  private func physicsCard(icon: String, title: String, desc: String) -> some View {
    HStack(alignment: .top, spacing: 16) {
      Text(icon)
        .font(.title2)
        .frame(width: 40)

      VStack(alignment: .leading, spacing: 4) {
        Text(title)
          .font(.subheadline)
          .fontWeight(.semibold)
          .foregroundStyle(.white)
        Text(desc)
          .font(.caption)
          .foregroundStyle(.white.opacity(0.7))
      }
    }
    .padding()
    .background(Color.white.opacity(0.05))
    .cornerRadius(12)
  }
}

// MARK: - Consciousness Codex View

struct ConsciousnessCodexView: View {
  @Environment(\.dismiss) private var dismiss

  let levels: [(Int, String, String, Color)] = [
    (20, "Shame", "Humiliation, elimination", Color.gray),
    (30, "Guilt", "Blame, destruction", Color.gray),
    (50, "Apathy", "Despair, abdication", Color.gray),
    (75, "Grief", "Regret, despondency", Color.gray),
    (100, "Fear", "Anxiety, withdrawal", Color.red),
    (125, "Desire", "Craving, enslavement", Color.orange),
    (150, "Anger", "Hate, aggression", Color.orange),
    (175, "Pride", "Scorn, inflation", Color.yellow),
    (200, "Courage", "Affirmation, empowerment", Color.green),
    (250, "Neutrality", "Trust, release", Color.green),
    (310, "Willingness", "Optimism, intention", Color.green),
    (350, "Acceptance", "Forgiveness, transcendence", Color.cyan),
    (400, "Reason", "Understanding, abstraction", Color.blue),
    (500, "Love", "Reverence, revelation", Color.blue),
    (540, "Joy", "Serenity, transfiguration", Color.purple),
    (600, "Peace", "Bliss, illumination", Color.purple),
    (700, "Enlightenment", "Ineffable, pure consciousness", Color(hex: "FFD700")),
  ]

  var body: some View {
    NavigationStack {
      ZStack {
        LinearGradient(
          colors: [Color(hex: "0a0a1a"), Color(hex: "1a1a3a")],
          startPoint: .top,
          endPoint: .bottom
        )
        .ignoresSafeArea()

        ScrollView {
          VStack(spacing: 24) {
            // Header
            VStack(spacing: 12) {
              Text("🧠")
                .font(.system(size: 60))
              Text("Consciousness Codex")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundStyle(.white)
              Text("David Hawkins' Map of Consciousness")
                .font(.subheadline)
                .foregroundStyle(.white.opacity(0.7))
            }
            .padding(.vertical, 20)

            // Explanation
            VStack(alignment: .leading, spacing: 8) {
              Text("📖 THE SCALE")
                .font(.caption)
                .foregroundStyle(.white.opacity(0.6))
              Text(
                "Dr. David Hawkins calibrated human consciousness on a logarithmic scale from 1-1000. Below 200 is destructive; above 200 is constructive. Each level has its own emotional signature and life view."
              )
              .font(.caption)
              .foregroundStyle(.white.opacity(0.8))
            }
            .padding()
            .background(Color.white.opacity(0.05))
            .cornerRadius(12)

            // Consciousness Levels
            VStack(alignment: .leading, spacing: 8) {
              ForEach(levels.reversed(), id: \.0) { level in
                HStack {
                  Text("\(level.0)")
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundStyle(level.3)
                    .frame(width: 40)

                  Text(level.1)
                    .font(.caption)
                    .foregroundStyle(.white)
                    .frame(width: 80, alignment: .leading)

                  Text(level.2)
                    .font(.caption2)
                    .foregroundStyle(.white.opacity(0.6))

                  Spacer()
                }
                .padding(.vertical, 6)
                .padding(.horizontal, 12)
                .background(level.3.opacity(0.1))
                .cornerRadius(8)
              }
            }

            // Critical Point
            VStack(spacing: 8) {
              Text("⚡ CRITICAL POINT: 200")
                .font(.caption)
                .foregroundStyle(Color(hex: "FFD700"))
              Text(
                "200 (Courage) is the dividing line between power and force. Above 200, you contribute to the world. Below 200, you drain it."
              )
              .font(.caption)
              .foregroundStyle(.white.opacity(0.8))
              .multilineTextAlignment(.center)
            }
            .padding()
            .background(Color(hex: "FFD700").opacity(0.1))
            .cornerRadius(12)

            Spacer(minLength: 50)
          }
          .padding(.horizontal, 20)
          .padding(.top, 20)
        }
      }
      .navigationTitle("🧠 Consciousness Codex")
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItem(placement: .navigationBarTrailing) {
          Button("Done") { dismiss() }
            .foregroundStyle(Color(hex: "9B59B6"))
        }
      }
    }
  }
}

// MARK: - Nutrition Awakening View

struct NutritionAwakeningView: View {
  @Environment(\.dismiss) private var dismiss

  let truths: [(String, String, String)] = [
    (
      "🌾", "Wheat/Gluten",
      "Modern wheat is hybridized beyond recognition. Gluten damages gut lining, causes brain fog."
    ),
    (
      "🥛", "Dairy Industry",
      "Humans don't need cow's milk. It's inflammatory, full of hormones and pus."
    ),
    (
      "🍬", "Sugar Addiction",
      "Sugar is 8x more addictive than cocaine. It's in everything by design."
    ),
    (
      "🧪", "Seed Oils",
      "Canola, soybean, corn oils are inflammatory. They didn't exist 100 years ago."
    ),
    (
      "💊", "Vitamin Deficiency",
      "Modern farming depletes soil. Most people are deficient in D3, magnesium, B12."
    ),
    ("🦠", "Gut-Brain Connection", "Your gut is your second brain. 90% of serotonin is made there."),
    ("🍖", "Protein Lies", "You don't need as much protein as they say. It's industry marketing."),
    (
      "💧", "Water Fluoridation",
      "Fluoride calcifies the pineal gland. It was Nazi-era population control tech."
    ),
  ]

  let pinealFoods = [
    "Raw cacao", "Chlorella", "Spirulina", "Apple cider vinegar", "Lemon water", "Oregano oil",
    "Iodine", "Turmeric",
  ]

  var body: some View {
    NavigationStack {
      ZStack {
        LinearGradient(
          colors: [Color(hex: "0a1a0a"), Color(hex: "1a2a1a")],
          startPoint: .top,
          endPoint: .bottom
        )
        .ignoresSafeArea()

        ScrollView {
          VStack(spacing: 24) {
            // Header
            VStack(spacing: 12) {
              Text("🥗")
                .font(.system(size: 60))
              Text("Nutrition Awakening")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundStyle(.white)
              Text("Food as medicine, food as poison")
                .font(.subheadline)
                .foregroundStyle(.white.opacity(0.7))
            }
            .padding(.vertical, 20)

            // Truths
            VStack(alignment: .leading, spacing: 16) {
              Text("🔍 INDUSTRY LIES")
                .font(.caption)
                .foregroundStyle(.white.opacity(0.6))
                .tracking(2)

              ForEach(truths, id: \.1) { truth in
                HStack(alignment: .top, spacing: 16) {
                  Text(truth.0)
                    .font(.title2)
                    .frame(width: 40)

                  VStack(alignment: .leading, spacing: 4) {
                    Text(truth.1)
                      .font(.subheadline)
                      .fontWeight(.semibold)
                      .foregroundStyle(.white)
                    Text(truth.2)
                      .font(.caption)
                      .foregroundStyle(.white.opacity(0.7))
                  }
                }
                .padding()
                .background(Color.white.opacity(0.05))
                .cornerRadius(12)
              }
            }

            // Pineal Foods
            VStack(alignment: .leading, spacing: 12) {
              Text("🧠 PINEAL DECALCIFICATION")
                .font(.caption)
                .foregroundStyle(Color(hex: "27AE60"))
                .tracking(2)

              FlowLayout(spacing: 8) {
                ForEach(pinealFoods, id: \.self) { food in
                  Text(food)
                    .font(.caption)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 6)
                    .background(Color(hex: "27AE60").opacity(0.2))
                    .cornerRadius(16)
                    .foregroundStyle(.white)
                }
              }
            }
            .padding()
            .background(Color(hex: "27AE60").opacity(0.1))
            .cornerRadius(12)

            Spacer(minLength: 50)
          }
          .padding(.horizontal, 20)
          .padding(.top, 20)
        }
      }
      .navigationTitle("🥗 Nutrition")
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItem(placement: .navigationBarTrailing) {
          Button("Done") { dismiss() }
            .foregroundStyle(Color(hex: "27AE60"))
        }
      }
    }
  }
}

/// Simple flow layout for tags
struct FlowLayout: Layout {
  var spacing: CGFloat = 8

  func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache _: inout ()) -> CGSize {
    let width = proposal.width ?? 0
    var height: CGFloat = 0
    var x: CGFloat = 0
    var y: CGFloat = 0
    var maxHeight: CGFloat = 0

    for subview in subviews {
      let size = subview.sizeThatFits(.unspecified)
      if x + size.width > width {
        x = 0
        y += maxHeight + spacing
        maxHeight = 0
      }
      maxHeight = max(maxHeight, size.height)
      x += size.width + spacing
    }
    height = y + maxHeight
    return CGSize(width: width, height: height)
  }

  func placeSubviews(
    in bounds: CGRect, proposal _: ProposedViewSize, subviews: Subviews, cache _: inout ()
  ) {
    var x = bounds.minX
    var y = bounds.minY
    var maxHeight: CGFloat = 0

    for subview in subviews {
      let size = subview.sizeThatFits(.unspecified)
      if x + size.width > bounds.maxX {
        x = bounds.minX
        y += maxHeight + spacing
        maxHeight = 0
      }
      subview.place(at: CGPoint(x: x, y: y), proposal: .unspecified)
      maxHeight = max(maxHeight, size.height)
      x += size.width + spacing
    }
  }
}

// MARK: - Division Deprogramming View

struct DivisionDeprogrammingView: View {
  @Environment(\.dismiss) private var dismiss

  let divisions: [(String, String, String)] = [
    (
      "🔴🔵", "Left vs Right",
      "Same puppet masters, different puppets. They agree on war, surveillance, corporate welfare."
    ),
    ("⚫⚪", "Black vs White", "Race is a social construct weaponized to prevent class solidarity."),
    ("♂️♀️", "Men vs Women", "Gender war distracts from power structures affecting both."),
    ("🌍🏭", "Climate vs Economy", "False dichotomy. Sustainable prosperity is possible."),
    ("💉💊", "Vax vs Antivax", "Both sides manipulated. The real issue is informed consent."),
    ("📿✝️", "Religion vs Science", "Ancient wisdom and modern discovery are complementary."),
    ("🇺🇸🌏", "Patriots vs Globalists", "Nationalism and interconnection aren't mutually exclusive."),
    ("👴👶", "Boomers vs Zoomers", "Generational blame prevents addressing systemic issues."),
  ]

  var body: some View {
    NavigationStack {
      ZStack {
        LinearGradient(
          colors: [Color(hex: "0a0a1a"), Color(hex: "1a1a2a")],
          startPoint: .top,
          endPoint: .bottom
        )
        .ignoresSafeArea()

        ScrollView {
          VStack(spacing: 24) {
            // Header
            VStack(spacing: 12) {
              Text("🤝")
                .font(.system(size: 60))
              Text("Division Deprogramming")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundStyle(.white)
              Text("Recognizing manufactured conflict")
                .font(.subheadline)
                .foregroundStyle(.white.opacity(0.7))
            }
            .padding(.vertical, 20)

            // Core Insight
            VStack(spacing: 8) {
              Text("🔑 THE KEY INSIGHT")
                .font(.caption)
                .foregroundStyle(Color(hex: "FFD700"))
              Text(
                "If they can keep you fighting your neighbor, you won't notice who's robbing the house."
              )
              .font(.body)
              .italic()
              .foregroundStyle(.white.opacity(0.9))
              .multilineTextAlignment(.center)
            }
            .padding()
            .background(Color(hex: "FFD700").opacity(0.1))
            .cornerRadius(12)

            // Divisions
            VStack(alignment: .leading, spacing: 16) {
              Text("⚔️ MANUFACTURED DIVISIONS")
                .font(.caption)
                .foregroundStyle(.white.opacity(0.6))
                .tracking(2)

              ForEach(divisions, id: \.1) { division in
                VStack(alignment: .leading, spacing: 8) {
                  HStack {
                    Text(division.0)
                    Text(division.1)
                      .font(.subheadline)
                      .fontWeight(.semibold)
                      .foregroundStyle(.white)
                  }
                  Text(division.2)
                    .font(.caption)
                    .foregroundStyle(.white.opacity(0.7))
                }
                .padding()
                .background(Color.white.opacity(0.05))
                .cornerRadius(12)
              }
            }

            // Solution
            VStack(alignment: .leading, spacing: 12) {
              Text("✨ THE ANTIDOTE")
                .font(.caption)
                .foregroundStyle(Color(hex: "27AE60"))
                .tracking(2)

              Text(
                "• Seek common ground before differences\n• Ask 'who benefits from this conflict?'\n• Remember: We're all consciousness having a human experience\n• The enemy is not your neighbor - it's the system of control"
              )
              .font(.caption)
              .foregroundStyle(.white.opacity(0.9))
              .lineSpacing(4)
            }
            .padding()
            .background(Color(hex: "27AE60").opacity(0.1))
            .cornerRadius(12)

            Spacer(minLength: 50)
          }
          .padding(.horizontal, 20)
          .padding(.top, 20)
        }
      }
      .navigationTitle("🤝 Division")
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItem(placement: .navigationBarTrailing) {
          Button("Done") { dismiss() }
            .foregroundStyle(Color(hex: "9B59B6"))
        }
      }
    }
  }
}

// MARK: - Awakening Foundations View (14 Universal Laws)

struct AwakeningFoundationsView: View {
  @Environment(\.dismiss) private var dismiss

  let laws: [(String, String, String)] = [
    (
      "1", "Divine Oneness", "Everything is connected. We are all expressions of one consciousness."
    ),
    ("2", "Vibration", "Everything vibrates. Match the frequency of your desire to attract it."),
    ("3", "Correspondence", "As above, so below. Inner world creates outer world."),
    ("4", "Attraction", "Like attracts like. Your thoughts become your reality."),
    ("5", "Inspired Action", "Ideas without action are dreams. Move toward your vision."),
    ("6", "Perpetual Energy", "Energy is never created or destroyed. It transforms."),
    ("7", "Cause and Effect", "Every action has a reaction. You reap what you sow."),
    ("8", "Compensation", "You receive what you give. Service returns multiplied."),
    ("9", "Relativity", "Nothing is good or bad until compared. Perspective is everything."),
    ("10", "Polarity", "Everything has an opposite. Transmute by focusing on the desired pole."),
    ("11", "Rhythm", "Everything flows in cycles. Ride the waves, don't fight them."),
    ("12", "Gender", "Masculine and feminine exist in all things. Balance both within."),
    ("13", "Mentalism", "All is mind. The universe is mental."),
    (
      "14", "Correspondence",
      "Patterns repeat across all scales. Understand one level, understand all."
    ),
  ]

  var body: some View {
    NavigationStack {
      ZStack {
        LinearGradient(
          colors: [Color(hex: "0a0a1a"), Color(hex: "1a0a2a")],
          startPoint: .top,
          endPoint: .bottom
        )
        .ignoresSafeArea()

        ScrollView {
          VStack(spacing: 24) {
            // Header
            VStack(spacing: 12) {
              Text("⚖️")
                .font(.system(size: 60))
              Text("14 Universal Laws")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundStyle(.white)
              Text("The operating system of reality")
                .font(.subheadline)
                .foregroundStyle(.white.opacity(0.7))
            }
            .padding(.vertical, 20)

            // Laws List
            VStack(alignment: .leading, spacing: 12) {
              ForEach(laws, id: \.0) { law in
                HStack(alignment: .top, spacing: 12) {
                  Text(law.0)
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundStyle(.black)
                    .frame(width: 24, height: 24)
                    .background(Color(hex: "FFD700"))
                    .cornerRadius(12)

                  VStack(alignment: .leading, spacing: 4) {
                    Text(law.1)
                      .font(.subheadline)
                      .fontWeight(.semibold)
                      .foregroundStyle(Color(hex: "FFD700"))
                    Text(law.2)
                      .font(.caption)
                      .foregroundStyle(.white.opacity(0.8))
                  }
                }
                .padding()
                .background(Color.white.opacity(0.05))
                .cornerRadius(12)
              }
            }

            Spacer(minLength: 50)
          }
          .padding(.horizontal, 20)
          .padding(.top, 20)
        }
      }
      .navigationTitle("⚖️ Universal Laws")
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItem(placement: .navigationBarTrailing) {
          Button("Done") { dismiss() }
            .foregroundStyle(Color(hex: "FFD700"))
        }
      }
    }
  }
}

#Preview {
  RealPhysicsView()
}
