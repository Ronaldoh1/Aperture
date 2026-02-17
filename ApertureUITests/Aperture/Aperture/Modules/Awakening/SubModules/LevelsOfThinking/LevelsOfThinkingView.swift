// LevelsOfThinkingView.swift
// Bloom's Cognitive Pyramid - Why Society is Stuck at the Bottom
// Ascending through levels of consciousness and thought

import SwiftUI

// MARK: - Thinking Level Model

struct ThinkingLevel: Identifiable {
  let id = UUID()
  let number: Int
  let name: String
  let description: String
  let characteristics: [String]
  let examples: [String]
  let howToAscend: [String]
  let color: Color
  let icon: String
}

// MARK: - Main View

struct LevelsOfThinkingView: View {
  @Environment(\.dismiss) private var dismiss
  @State private var selectedTab = 0
  @State private var selectedLevel: ThinkingLevel?

  var body: some View {
    NavigationStack {
      ZStack {
        // Pyramid gradient
        LinearGradient(
          colors: [Color(hex: "0a0a1a"), Color(hex: "1a0a1a"), Color(hex: "0a0a1a")],
          startPoint: .top,
          endPoint: .bottom
        )
        .ignoresSafeArea()

        VStack(spacing: 0) {
          Picker("Section", selection: $selectedTab) {
            Text("Overview").tag(0)
            Text("Pyramid").tag(1)
            Text("Why Stuck").tag(2)
            Text("Ascend").tag(3)
          }
          .pickerStyle(.segmented)
          .padding()

          TabView(selection: $selectedTab) {
            overviewTab.tag(0)
            pyramidTab.tag(1)
            whyStuckTab.tag(2)
            ascendTab.tag(3)
          }
          .tabViewStyle(.page(indexDisplayMode: .never))
        }
      }
      .navigationTitle("🧠 Levels of Thinking")
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItem(placement: .navigationBarTrailing) {
          Button("Done") { dismiss() }
            .foregroundStyle(Color(hex: "9B59B6"))
        }
      }
      .sheet(item: $selectedLevel) { level in
        ThinkingLevelDetailView(level: level)
      }
    }
  }

  // MARK: - Overview Tab

  private var overviewTab: some View {
    ScrollView {
      VStack(spacing: 24) {
        // Header
        VStack(spacing: 12) {
          Text("🔺")
            .font(.system(size: 60))

          Text("The Cognitive Pyramid")
            .font(.title2)
            .fontWeight(.bold)
            .foregroundStyle(.white)

          Text("Why most people never learn to truly think")
            .font(.subheadline)
            .foregroundStyle(.white.opacity(0.7))
            .multilineTextAlignment(.center)
        }
        .padding(.vertical, 20)

        // The Crisis
        VStack(alignment: .leading, spacing: 16) {
          Text("⚠️ THE THINKING CRISIS")
            .font(.caption)
            .foregroundStyle(Color(hex: "E74C3C"))
            .tracking(2)

          Text(
            "Human civilization is built on pyramids—not just stone ones, but invisible hierarchies of thought, layers of meaning, and levels of thinking that range from basic impulses to true revelation."
          )
          .font(.body)
          .foregroundStyle(.white.opacity(0.9))

          Text(
            "Yet despite the astonishing tools available today, most people never climb past the first steps. Society operates at the LOWEST layers—remembering, or more accurately, simply regurgitating everything they've been told."
          )
          .font(.body)
          .foregroundStyle(.white.opacity(0.9))
        }
        .padding()
        .background(Color(hex: "E74C3C").opacity(0.1))
        .cornerRadius(12)

        // The Terrifying Part
        VStack(alignment: .leading, spacing: 12) {
          Text("😱 THE TERRIFYING PART")
            .font(.headline)
            .foregroundStyle(.white)

          Text(
            "Most people don't even realize there ARE higher levels of thinking that they can ascend to."
          )
          .font(.body)
          .fontWeight(.semibold)
          .foregroundStyle(Color(hex: "9B59B6"))

          Text(
            "They believe they're thinking simply because information is passing through their minds. It's like riding shotgun and convincing yourself you're the one steering."
          )
          .font(.caption)
          .foregroundStyle(.white.opacity(0.8))
        }
        .padding()
        .background(Color.white.opacity(0.05))
        .cornerRadius(12)

        // Bloom's Discovery
        VStack(alignment: .leading, spacing: 12) {
          Text("📚 BLOOM'S DISCOVERY (1956)")
            .font(.caption)
            .foregroundStyle(.white.opacity(0.6))
            .tracking(2)

          Text(
            "Educational psychologist Benjamin Bloom created a taxonomy of thinking—originally for teachers, but actually a blueprint for human cognition itself."
          )
          .font(.body)
          .foregroundStyle(.white.opacity(0.9))

          Text(
            "It reveals why some people develop clarity, perspective, and wisdom—while others remain stuck, repeating what they've been told without any deeper understanding."
          )
          .font(.caption)
          .foregroundStyle(.white.opacity(0.7))
        }
        .padding()
        .background(Color(hex: "3498DB").opacity(0.1))
        .cornerRadius(12)

        // Info-Wisdom Gap
        statCard(
          title: "THE PARADOX",
          stat: "∞",
          desc:
            "We have unprecedented access to information, yet understand LESS than ever. We confuse awareness with comprehension, memory with intelligence, noise with depth."
        )

        Spacer(minLength: 50)
      }
      .padding(.horizontal, 20)
    }
  }

  // MARK: - Pyramid Tab

  private var pyramidTab: some View {
    ScrollView {
      VStack(spacing: 24) {
        Text("🔺 THE 6 LEVELS (+1)")
          .font(.caption)
          .foregroundStyle(Color(hex: "9B59B6"))
          .tracking(2)
          .padding(.top, 20)

        // Visual Pyramid
        VStack(spacing: 8) {
          pyramidLevel(width: 60, color: Color(hex: "FFD700"), label: "7", name: "META")
          pyramidLevel(width: 100, color: Color(hex: "9B59B6"), label: "6", name: "CREATE")
          pyramidLevel(width: 140, color: Color(hex: "E74C3C"), label: "5", name: "EVALUATE")
          pyramidLevel(width: 180, color: Color(hex: "F39C12"), label: "4", name: "ANALYZE")
          pyramidLevel(width: 220, color: Color(hex: "3498DB"), label: "3", name: "APPLY")
          pyramidLevel(width: 260, color: Color(hex: "27AE60"), label: "2", name: "UNDERSTAND")
          pyramidLevel(width: 300, color: Color(hex: "95A5A6"), label: "1", name: "REMEMBER")
        }
        .padding(.vertical)

        // Level Cards
        ForEach(ThinkingLevel.allLevels) { level in
          levelCard(level: level)
            .onTapGesture {
              selectedLevel = level
            }
        }

        // Metacognition
        VStack(alignment: .leading, spacing: 16) {
          Text("👁️ LEVEL 7: METACOGNITION")
            .font(.headline)
            .foregroundStyle(Color(hex: "FFD700"))

          Text("The Shadow Level Above the Pyramid")
            .font(.caption)
            .foregroundStyle(.white.opacity(0.6))

          Text(
            "Metacognition is the ability to watch your own mind the way you watch a movie. You're observing the observer."
          )
          .font(.body)
          .foregroundStyle(.white.opacity(0.9))

          VStack(alignment: .leading, spacing: 8) {
            metaRealization("'I tend to react emotionally to this topic'")
            metaRealization("'I'm defending this because it protects my identity'")
            metaRealization("'I'm drawn to this conclusion because it feels comfortable'")
            metaRealization("'My desire to be right is preventing me from seeing truth'")
          }

          Text(
            "It's like unlocking the ability to DEBUG your own mind—identifying cognitive biases, emotional triggers, and blind spots in real-time."
          )
          .font(.caption)
          .foregroundStyle(Color(hex: "FFD700"))
        }
        .padding()
        .background(Color(hex: "FFD700").opacity(0.1))
        .cornerRadius(12)

        Spacer(minLength: 50)
      }
      .padding(.horizontal, 20)
    }
  }

  // MARK: - Why Stuck Tab

  private var whyStuckTab: some View {
    ScrollView {
      VStack(spacing: 24) {
        Text("🔒 WHY SOCIETY IS STUCK")
          .font(.caption)
          .foregroundStyle(Color(hex: "E74C3C"))
          .tracking(2)
          .padding(.top, 20)

        // Brain Evolution
        stuckReasonCard(
          icon: "🧠",
          title: "EVOLUTIONARY DESIGN",
          points: [
            "Brain wasn't built for philosophy or abstraction",
            "Built for survival: spotting threats, reacting quickly, conserving energy",
            "Thinking deeply burns REAL calories (brain = 2% body weight, 20% energy)",
            "Evolution optimized for cognitive miserliness—using as little mental energy as possible",
          ]
        )

        // Discomfort
        stuckReasonCard(
          icon: "😣",
          title: "THINKING FEELS BAD",
          points: [
            "Higher levels require restructuring beliefs—that's uncomfortable",
            "Most people mistake cognitive discomfort for 'I'm not smart enough'",
            "They stop at the first sign of friction, thinking it's a dead end",
            "Nobody taught them: difficulty IS the doorway to intelligence",
          ]
        )

        // Technology
        stuckReasonCard(
          icon: "📱",
          title: "TECHNOLOGY REWARDS LEVEL 1",
          points: [
            "Social media = instant reaction, instant outrage, instant validation",
            "Platforms PROFIT when you operate at the bottom",
            "Analysis slows you down. Evaluation breaks the emotional loop.",
            "Deep thought is bad for business",
          ]
        )

        // Identity
        stuckReasonCard(
          icon: "🏷️",
          title: "IDENTITY COLLAPSE",
          points: [
            "By adulthood, beliefs are no longer cognitive—they're TRIBAL",
            "Once an idea becomes part of identity, people stop thinking about it",
            "Everything becomes a loyalty test: 'My group believes this'",
            "No need to climb if the goal is BELONGING, not truth",
          ]
        )

        // Time
        stuckReasonCard(
          icon: "⏰",
          title: "NO TIME TO THINK",
          points: [
            "People wake up exhausted, work jobs that drain them",
            "Scroll feeds that overstimulate, attention always fragmented",
            "Thinking has become a luxury most can't afford",
            "Society stays at Level 1 because it's the only level that fits their schedule",
          ]
        )

        // Statistics
        VStack(alignment: .leading, spacing: 12) {
          Text("📊 THE DATA IS ALARMING")
            .font(.headline)
            .foregroundStyle(.white)

          alarmingStat("~50%", "of adolescents don't meet minimum reading comprehension standards")
          alarmingStat("3rd", "consecutive year of declining reading scores (2024)")
          alarmingStat("30%+", "of high school seniors lack basic reading skills")
          alarmingStat("1 in 3", "young people enjoy reading—lowest in 20 years")
        }
        .padding()
        .background(Color(hex: "E74C3C").opacity(0.1))
        .cornerRadius(12)

        Spacer(minLength: 50)
      }
      .padding(.horizontal, 20)
    }
  }

  // MARK: - Ascend Tab

  private var ascendTab: some View {
    ScrollView {
      VStack(spacing: 24) {
        Text("🔝 HOW TO ASCEND")
          .font(.caption)
          .foregroundStyle(Color(hex: "27AE60"))
          .tracking(2)
          .padding(.top, 20)

        // Key Truth
        VStack(alignment: .leading, spacing: 12) {
          Text("💡 THE KEY TRUTH")
            .font(.headline)
            .foregroundStyle(.white)

          Text(
            "The top is not a PLACE—it's a PRACTICE. Nobody reaches it and stays permanently. You rise, fall, and rise again."
          )
          .font(.body)
          .foregroundStyle(.white.opacity(0.9))

          Text(
            "Every moment you choose depth over speed, curiosity over certainty, reflection over reaction—you ASCEND."
          )
          .font(.caption)
          .fontWeight(.semibold)
          .foregroundStyle(Color(hex: "27AE60"))
        }
        .padding()
        .background(Color(hex: "27AE60").opacity(0.1))
        .cornerRadius(12)

        // Step 1
        ascendStep(
          num: 1,
          title: "SLOW DOWN THE MIND",
          desc: "The single most radical thing you can do in a world obsessed with velocity.",
          practices: [
            "Read something long enough for your mind to wander, then force it back",
            "Sit with an idea for more than 10 seconds",
            "Resist jumping between apps and tabs",
            "Delay reactions by even a single breath",
            "Thinking begins where impulsivity ends",
          ]
        )

        // Step 2
        ascendStep(
          num: 2,
          title: "BUILD MENTAL STAMINA",
          desc: "Higher-order thinking is a HABIT. It requires endurance, not brilliance.",
          practices: [
            "Choose books that challenge your worldview",
            "Study ideas you don't immediately understand",
            "Sit with complex problems instead of rushing for answers",
            "Resist the temptation of simpler narratives",
            "Most stop when they feel friction—climbers RISE because of it",
          ]
        )

        // Step 3
        ascendStep(
          num: 3,
          title: "HOLD MULTIPLE POSSIBILITIES",
          desc: "Low-level thinkers crave certainty. Higher cognition holds contradictions.",
          practices: [
            "Compare ideas without choosing sides prematurely",
            "Tolerate ambiguity without panic",
            "See complexity inside simplicity",
            "Hold patterns that intertwine, overlap, conflict",
            "Depth emerges from mental constellation, not straight lines",
          ]
        )

        // Step 4
        ascendStep(
          num: 4,
          title: "BUILD INTELLECTUAL HUMILITY",
          desc: "Humility is the gatekeeper to the highest levels.",
          practices: [
            "Assume your first reaction is incomplete",
            "Question where your beliefs came from",
            "Recognize certainty is often a feeling, not a fact",
            "Learn to say: 'I don't know, but I want to know'",
            "Like Socrates: 'The only thing I know is that I know nothing'",
          ]
        )

        // Step 5
        ascendStep(
          num: 5,
          title: "BEGIN JUDGING WHAT MATTERS",
          desc: "Evaluation requires commitment—taking responsibility for conclusions.",
          practices: [
            "Choose what to prioritize, reject, protect, release",
            "Form judgments based on values, logic, evidence, context",
            "This is where most turn back—because it requires commitment",
            "Step into adulthood of the mind",
            "The climber reaches the final ascent",
          ]
        )

        // Step 6
        ascendStep(
          num: 6,
          title: "CREATE SOMETHING NEW",
          desc:
            "Creation is not just artistic—it's cognitive. Transform thinking into something original.",
          practices: [
            "New interpretation, solution, model, synthesis",
            "A new question, a new way of seeing the world",
            "Proves you're no longer repeating minds that came before",
            "You've built your OWN mind",
            "The highest level is not about intelligence—it's about FREEDOM",
          ]
        )

        // Final Wisdom
        VStack(alignment: .leading, spacing: 12) {
          Text("✨ THE MIRACLE")
            .font(.headline)
            .foregroundStyle(.white)

          Text(
            "When one mind climbs, it changes more than just that mind. It changes everyone connected to it."
          )
          .font(.body)
          .foregroundStyle(.white.opacity(0.9))

          Text(
            "Your clarity becomes a light guiding others to the top. In a world trapped at the bottom, climbing is a REVOLUTIONARY ACT."
          )
          .font(.caption)
          .fontWeight(.semibold)
          .foregroundStyle(Color(hex: "FFD700"))
        }
        .padding()
        .background(Color(hex: "FFD700").opacity(0.1))
        .cornerRadius(12)

        Spacer(minLength: 50)
      }
      .padding(.horizontal, 20)
    }
  }

  // MARK: - Helper Views

  private func pyramidLevel(width: CGFloat, color: Color, label: String, name: String) -> some View
  {
    ZStack {
      Rectangle()
        .fill(color.opacity(0.3))
        .frame(width: width, height: 30)

      HStack {
        Text(label)
          .font(.caption)
          .fontWeight(.bold)
          .foregroundStyle(color)
        Text(name)
          .font(.caption2)
          .foregroundStyle(.white.opacity(0.8))
      }
    }
  }

  private func levelCard(level: ThinkingLevel) -> some View {
    HStack(spacing: 16) {
      Text(level.icon)
        .font(.title)
        .frame(width: 50)

      VStack(alignment: .leading, spacing: 4) {
        HStack {
          Text("Level \(level.number)")
            .font(.caption)
            .foregroundStyle(level.color)
          Text(level.name)
            .font(.subheadline)
            .fontWeight(.semibold)
            .foregroundStyle(.white)
        }
        Text(level.description)
          .font(.caption)
          .foregroundStyle(.white.opacity(0.7))
          .lineLimit(2)
      }

      Spacer()

      Image(systemName: "chevron.right")
        .foregroundStyle(.white.opacity(0.3))
    }
    .padding()
    .background(level.color.opacity(0.1))
    .cornerRadius(12)
  }

  private func metaRealization(_ text: String) -> some View {
    HStack(alignment: .top, spacing: 8) {
      Text("💭")
      Text(text)
        .font(.caption)
        .italic()
        .foregroundStyle(.white.opacity(0.8))
    }
  }

  private func statCard(title: String, stat: String, desc: String) -> some View {
    VStack(spacing: 12) {
      Text(title)
        .font(.caption)
        .foregroundStyle(.white.opacity(0.6))
      Text(stat)
        .font(.system(size: 48, weight: .bold))
        .foregroundStyle(Color(hex: "9B59B6"))
      Text(desc)
        .font(.caption)
        .foregroundStyle(.white.opacity(0.8))
        .multilineTextAlignment(.center)
    }
    .padding()
    .background(Color.white.opacity(0.05))
    .cornerRadius(12)
  }

  private func stuckReasonCard(icon: String, title: String, points: [String]) -> some View {
    VStack(alignment: .leading, spacing: 12) {
      HStack {
        Text(icon)
          .font(.title2)
        Text(title)
          .font(.subheadline)
          .fontWeight(.semibold)
          .foregroundStyle(.white)
      }

      ForEach(points, id: \.self) { point in
        HStack(alignment: .top, spacing: 8) {
          Text("•")
            .foregroundStyle(Color(hex: "E74C3C"))
          Text(point)
            .font(.caption)
            .foregroundStyle(.white.opacity(0.8))
        }
      }
    }
    .padding()
    .background(Color.white.opacity(0.05))
    .cornerRadius(12)
  }

  private func alarmingStat(_ stat: String, _ desc: String) -> some View {
    HStack(alignment: .top, spacing: 12) {
      Text(stat)
        .font(.headline)
        .foregroundStyle(Color(hex: "E74C3C"))
        .frame(width: 60, alignment: .leading)
      Text(desc)
        .font(.caption)
        .foregroundStyle(.white.opacity(0.8))
    }
  }

  private func ascendStep(num: Int, title: String, desc: String, practices: [String]) -> some View {
    VStack(alignment: .leading, spacing: 12) {
      HStack {
        Text("\(num)")
          .font(.title2)
          .fontWeight(.bold)
          .foregroundStyle(.black)
          .frame(width: 36, height: 36)
          .background(Color(hex: "27AE60"))
          .cornerRadius(18)

        Text(title)
          .font(.subheadline)
          .fontWeight(.bold)
          .foregroundStyle(.white)
      }

      Text(desc)
        .font(.caption)
        .foregroundStyle(.white.opacity(0.7))

      ForEach(practices, id: \.self) { practice in
        HStack(alignment: .top, spacing: 8) {
          Text("→")
            .foregroundStyle(Color(hex: "27AE60"))
          Text(practice)
            .font(.caption)
            .foregroundStyle(.white.opacity(0.9))
        }
      }
    }
    .padding()
    .background(Color.white.opacity(0.05))
    .cornerRadius(12)
  }
}

// MARK: - Thinking Levels Data

extension ThinkingLevel {
  static let allLevels: [ThinkingLevel] = [
    ThinkingLevel(
      number: 1,
      name: "REMEMBER",
      description:
        "Simply repeating information verbatim. The cognitive equivalent of fast food—pre-cooked, pre-chewed, pre-digested.",
      characteristics: [
        "Echoing words without weight",
        "Opinions without origin",
        "Beliefs without understanding",
        "Outsourced cognition to influencers, tribes, algorithms",
        "Secondhand experience, borrowed mind",
      ],
      examples: [
        "Repeating hot takes in slightly different words",
        "Political debates as shouting matches of talking points",
        "Misinformation spreading faster than truth",
        "Scroll for 10 minutes, see 50 people saying the same thing",
      ],
      howToAscend: [
        "Ask: 'Where did this idea come from?'",
        "Try explaining the concept in your own words",
        "Notice when you're just repeating what you heard",
      ],
      color: Color(hex: "95A5A6"),
      icon: "📝"
    ),

    ThinkingLevel(
      number: 2,
      name: "UNDERSTAND",
      description:
        "Explaining ideas in your own words. A fragile understanding that collapses when life gets complicated.",
      characteristics: [
        "Can define terms and concepts",
        "Can give basic examples",
        "Breaks down when nuance is introduced",
        "The illusion of comprehension",
        "Dangerous cognitive trap—thinking you understand when you don't",
      ],
      examples: [
        "Explaining inflation, crime rates, mental health",
        "Describing concepts without questioning them",
        "Online debaters whose arguments collapse with any nuance",
      ],
      howToAscend: [
        "Ask: 'What does this TRULY mean?'",
        "Ask: 'How do I KNOW this is true?'",
        "Ask: 'What else might explain this?'",
      ],
      color: Color(hex: "27AE60"),
      icon: "💡"
    ),

    ThinkingLevel(
      number: 3,
      name: "APPLY",
      description:
        "Using information to solve simple problems. Taking knowledge and putting it into action.",
      characteristics: [
        "Connecting knowledge to real situations",
        "Solving straightforward problems",
        "Following procedures and methods",
        "Practical application of concepts",
      ],
      examples: [
        "Using math formulas to solve equations",
        "Applying a recipe to cook a meal",
        "Using a framework to analyze a situation",
      ],
      howToAscend: [
        "Look for novel applications of familiar concepts",
        "Apply knowledge to unfamiliar situations",
        "Start asking 'What if?' questions",
      ],
      color: Color(hex: "3498DB"),
      icon: "🔧"
    ),

    ThinkingLevel(
      number: 4,
      name: "ANALYZE",
      description:
        "Compare, contrast, break things apart, see hidden structures. Thinking becomes STRUCTURAL.",
      characteristics: [
        "Taking ideas apart like an engineer studying blueprints",
        "Examining assumptions and patterns",
        "Identifying contradictions beneath the surface",
        "Requires intellectual PATIENCE",
        "Cannot be done while emotionally triggered",
      ],
      examples: [
        "Comparing two opposing viewpoints objectively",
        "Identifying the hidden assumptions in an argument",
        "Recognizing patterns across different domains",
      ],
      howToAscend: [
        "Ask: 'What's ACTUALLY going on here?'",
        "Slow down enough to examine",
        "Become the puppeteer, not the puppet of your thoughts",
      ],
      color: Color(hex: "F39C12"),
      icon: "🔍"
    ),

    ThinkingLevel(
      number: 5,
      name: "EVALUATE",
      description:
        "Form judgments, determine priorities, take stances. Evaluation means PRIORITIZATION.",
      characteristics: [
        "Given multiple truths, choosing which matters most",
        "Taking responsibility for conclusions",
        "Requires emotional regulation and tolerance for ambiguity",
        "The ability to admit ignorance and revise beliefs",
        "Thinking becomes an ETHICAL act",
      ],
      examples: [
        "Determining which perspective is strongest with evidence",
        "Deciding what values take precedence in a conflict",
        "Making difficult judgment calls with incomplete information",
      ],
      howToAscend: [
        "Commit to a stance while remaining open to revision",
        "Practice saying 'This matters more than that'",
        "Step into adulthood of the mind",
      ],
      color: Color(hex: "E74C3C"),
      icon: "⚖️"
    ),

    ThinkingLevel(
      number: 6,
      name: "CREATE",
      description:
        "Produce something that did not exist before—new solutions, models, explanations, perspectives.",
      characteristics: [
        "Total transformation of how mind interacts with reality",
        "No longer consumer of ideas—generator of them",
        "Not about intelligence—about FREEDOM",
        "Synthesizing everything learned into something new",
        "You are no longer controlled by inherited ideas",
      ],
      examples: [
        "Developing a new framework or model",
        "Finding an original solution to an old problem",
        "Creating a new perspective that reframes everything",
      ],
      howToAscend: [
        "This IS the summit",
        "Ask: 'What has never been thought before?'",
        "Build your OWN mind, not a borrowed one",
      ],
      color: Color(hex: "9B59B6"),
      icon: "✨"
    ),
  ]
}

// MARK: - Level Detail View

struct ThinkingLevelDetailView: View {
  let level: ThinkingLevel
  @Environment(\.dismiss) private var dismiss

  var body: some View {
    NavigationStack {
      ZStack {
        Color(hex: "0a0a1a").ignoresSafeArea()

        ScrollView {
          VStack(spacing: 24) {
            // Header
            VStack(spacing: 12) {
              Text(level.icon)
                .font(.system(size: 60))
              Text("Level \(level.number): \(level.name)")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundStyle(level.color)
              Text(level.description)
                .font(.body)
                .foregroundStyle(.white.opacity(0.8))
                .multilineTextAlignment(.center)
            }
            .padding(.vertical, 20)

            // Characteristics
            detailSection(
              title: "Characteristics", items: level.characteristics, color: level.color)

            // Examples
            detailSection(title: "Examples", items: level.examples, color: Color(hex: "3498DB"))

            // How to Ascend
            detailSection(
              title: "How to Ascend", items: level.howToAscend, color: Color(hex: "27AE60"))

            Spacer(minLength: 50)
          }
          .padding(.horizontal, 20)
        }
      }
      .navigationTitle("Level \(level.number)")
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItem(placement: .navigationBarTrailing) {
          Button("Done") { dismiss() }
            .foregroundStyle(level.color)
        }
      }
    }
  }

  private func detailSection(title: String, items: [String], color: Color) -> some View {
    VStack(alignment: .leading, spacing: 12) {
      Text(title.uppercased())
        .font(.caption)
        .foregroundStyle(color)
        .tracking(2)

      ForEach(items, id: \.self) { item in
        HStack(alignment: .top, spacing: 12) {
          Text("→")
            .foregroundStyle(color)
          Text(item)
            .font(.body)
            .foregroundStyle(.white.opacity(0.9))
        }
      }
    }
    .padding()
    .frame(maxWidth: .infinity, alignment: .leading)
    .background(color.opacity(0.1))
    .cornerRadius(12)
  }
}

#Preview {
  LevelsOfThinkingView()
}
