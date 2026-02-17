// MindDefenseView.swift
// Alexandria - Mind Defense & Control Detection Toolkit
// "The first step to freedom is recognizing the cage"

import SwiftUI

// MARK: - Mind Defense Main View

struct MindDefenseView: View {
  @Environment(\.dismiss) private var dismiss
  @State private var selectedSection: MindDefenseSection = .overview

  enum MindDefenseSection: String, CaseIterable {
    case overview = "Overview"
    case controlToolkit = "Control Detection"
    case goldenPath = "Golden Path"
    case techniques = "Defense Techniques"
  }

  var body: some View {
    NavigationStack {
      ZStack {
        LinearGradient(
          colors: [Color(hex: "0a0a1a"), Color(hex: "1a0a2a")],
          startPoint: .top,
          endPoint: .bottom
        )
        .ignoresSafeArea()

        VStack(spacing: 0) {
          // Section Picker
          Picker("Section", selection: $selectedSection) {
            ForEach(MindDefenseSection.allCases, id: \.self) { section in
              Text(section.rawValue).tag(section)
            }
          }
          .pickerStyle(.segmented)
          .padding()

          // Content
          TabView(selection: $selectedSection) {
            overviewSection.tag(MindDefenseSection.overview)
            controlToolkitSection.tag(MindDefenseSection.controlToolkit)
            goldenPathSection.tag(MindDefenseSection.goldenPath)
            techniquesSection.tag(MindDefenseSection.techniques)
          }
          .tabViewStyle(.page(indexDisplayMode: .never))
        }
      }
      .navigationTitle("🛡️ Mind Defense")
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItem(placement: .navigationBarTrailing) {
          Button("Done") { dismiss() }
            .foregroundStyle(Color(hex: "E74C3C"))
        }
      }
    }
  }

  // MARK: - Overview Section

  private var overviewSection: some View {
    ScrollView {
      VStack(spacing: 24) {
        VStack(spacing: 12) {
          Text("🛡️")
            .font(.system(size: 60))
          Text("Mind Defense")
            .font(.title2)
            .fontWeight(.bold)
            .foregroundStyle(.white)
          Text("Protecting your consciousness from manipulation")
            .font(.subheadline)
            .foregroundStyle(.white.opacity(0.7))
        }
        .padding(.vertical, 20)

        // Core Concepts
        VStack(alignment: .leading, spacing: 16) {
          Text("🎯 WHY THIS MATTERS")
            .font(.caption)
            .foregroundStyle(.white.opacity(0.6))
            .tracking(2)

          conceptCard(
            icon: "📺", title: "Media Programming",
            desc:
              "Mainstream media uses specific techniques to shape perception and manufacture consent."
          )
          conceptCard(
            icon: "🏫", title: "Education Indoctrination",
            desc:
              "Schools teach what to think, not how to think. Critical thinking is systematically suppressed."
          )
          conceptCard(
            icon: "💊", title: "Pharmaceutical Control",
            desc: "Medicating natural human experiences into compliance and dependency.")
          conceptCard(
            icon: "💰", title: "Financial Manipulation",
            desc: "Debt slavery and artificial scarcity keep populations dependent and compliant.")
          conceptCard(
            icon: "📱", title: "Digital Surveillance",
            desc: "Technology designed to monitor, predict, and influence behavior at scale.")
        }

        Spacer(minLength: 50)
      }
      .padding(.horizontal, 20)
    }
  }

  // MARK: - Control Detection Toolkit

  private var controlToolkitSection: some View {
    ScrollView {
      VStack(spacing: 24) {
        VStack(spacing: 12) {
          Text("🔍")
            .font(.system(size: 50))
          Text("Control Detection Toolkit")
            .font(.title3)
            .fontWeight(.bold)
            .foregroundStyle(.white)
          Text("25 techniques to spot manipulation")
            .font(.subheadline)
            .foregroundStyle(.white.opacity(0.7))
        }
        .padding(.vertical, 20)

        // Techniques Grid
        VStack(alignment: .leading, spacing: 16) {
          controlTechniqueCard(
            num: 1, name: "Problem-Reaction-Solution",
            desc: "Create a problem, wait for public outcry, then offer pre-planned solution.",
            example: "9/11 → Fear → Patriot Act")
          controlTechniqueCard(
            num: 2, name: "Divide and Conquer",
            desc: "Keep populations fighting each other instead of the true controllers.",
            example: "Left vs Right, Black vs White")
          controlTechniqueCard(
            num: 3, name: "Bread and Circuses",
            desc: "Distract with entertainment while stripping rights.",
            example: "Sports, celebrity gossip, social media")
          controlTechniqueCard(
            num: 4, name: "The Big Lie",
            desc: "Tell a lie so massive people can't believe anyone would fabricate it.",
            example: "WMDs in Iraq")
          controlTechniqueCard(
            num: 5, name: "Repetition",
            desc: "Repeat something enough times and it becomes 'truth'.",
            example: "Talking points across all networks")
          controlTechniqueCard(
            num: 6, name: "Appeal to Authority",
            desc: "Use 'experts' to validate agenda without questioning credentials.",
            example: "'Scientists say...'")
          controlTechniqueCard(
            num: 7, name: "Fear Mongering",
            desc: "Keep population in constant fear to accept control.",
            example: "Terror alerts, virus updates")
          controlTechniqueCard(
            num: 8, name: "Gaslighting", desc: "Make people doubt their own perception of reality.",
            example: "'That never happened'")
          controlTechniqueCard(
            num: 9, name: "Manufactured Consensus", desc: "Create illusion that 'everyone' agrees.",
            example: "Polls, social media bots")
          controlTechniqueCard(
            num: 10, name: "Overton Window",
            desc: "Gradually shift what's considered 'acceptable' discourse.",
            example: "Normalizing surveillance")
        }

        Spacer(minLength: 50)
      }
      .padding(.horizontal, 20)
    }
  }

  // MARK: - Golden Path

  private var goldenPathSection: some View {
    ScrollView {
      VStack(spacing: 24) {
        VStack(spacing: 12) {
          Text("✨")
            .font(.system(size: 50))
          Text("The Golden Path")
            .font(.title3)
            .fontWeight(.bold)
            .foregroundStyle(.white)
          Text("A framework for navigating awakening")
            .font(.subheadline)
            .foregroundStyle(.white.opacity(0.7))
        }
        .padding(.vertical, 20)

        // Golden Path Steps
        VStack(alignment: .leading, spacing: 16) {
          Text("🌟 THE 7 STAGES")
            .font(.caption)
            .foregroundStyle(Color(hex: "FFD700"))
            .tracking(2)

          goldenPathStep(
            num: 1, title: "Awakening",
            desc: "Something feels 'off'. You start questioning the narrative.",
            color: Color(hex: "E74C3C"))
          goldenPathStep(
            num: 2, title: "Research", desc: "You dive deep. Every answer leads to more questions.",
            color: Color(hex: "E67E22"))
          goldenPathStep(
            num: 3, title: "Anger",
            desc: "You realize how much you've been lied to. Rage is natural.",
            color: Color(hex: "F1C40F"))
          goldenPathStep(
            num: 4, title: "Dark Night",
            desc: "The weight of truth feels unbearable. This is temporary.",
            color: Color(hex: "2ECC71"))
          goldenPathStep(
            num: 5, title: "Integration", desc: "You accept both light and dark. Balance returns.",
            color: Color(hex: "3498DB"))
          goldenPathStep(
            num: 6, title: "Empowerment",
            desc: "Knowledge becomes power. You take back your sovereignty.",
            color: Color(hex: "9B59B6"))
          goldenPathStep(
            num: 7, title: "Service", desc: "You help others awaken. The cycle continues.",
            color: Color(hex: "FFD700"))
        }

        // Warnings
        VStack(alignment: .leading, spacing: 12) {
          Text("⚠️ PITFALLS TO AVOID")
            .font(.caption)
            .foregroundStyle(.orange)
            .tracking(2)

          pitfallCard(text: "Don't become what you fight against")
          pitfallCard(text: "Avoid nihilism - finding meaning is possible")
          pitfallCard(text: "Don't isolate - find your tribe")
          pitfallCard(text: "Stay grounded - balance research with self-care")
          pitfallCard(text: "Question everything - including your sources")
        }
        .padding()
        .background(Color.orange.opacity(0.1))
        .cornerRadius(12)

        Spacer(minLength: 50)
      }
      .padding(.horizontal, 20)
    }
  }

  // MARK: - Techniques Section

  private var techniquesSection: some View {
    ScrollView {
      VStack(spacing: 24) {
        VStack(spacing: 12) {
          Text("⚔️")
            .font(.system(size: 50))
          Text("Defense Techniques")
            .font(.title3)
            .fontWeight(.bold)
            .foregroundStyle(.white)
          Text("Practical tools for mental sovereignty")
            .font(.subheadline)
            .foregroundStyle(.white.opacity(0.7))
        }
        .padding(.vertical, 20)

        VStack(alignment: .leading, spacing: 16) {
          techniqueCard(
            icon: "📵", title: "Digital Detox",
            desc: "Scheduled breaks from screens. Minimum 1 hour before bed, 1 day per week.")
          techniqueCard(
            icon: "📰", title: "News Fast",
            desc: "30-day break from mainstream news. Notice how your anxiety decreases.")
          techniqueCard(
            icon: "🧘", title: "Meditation",
            desc: "Daily practice to observe thoughts without attachment. Even 5 minutes helps.")
          techniqueCard(
            icon: "📓", title: "Source Verification",
            desc: "Always ask: Who benefits? Who funded this? What's the full context?")
          techniqueCard(
            icon: "🗣️", title: "Socratic Questioning",
            desc: "Ask questions instead of making statements. Let others reach conclusions.")
          techniqueCard(
            icon: "🌿", title: "Nature Immersion",
            desc: "Regular time in nature resets nervous system and clears programming.")
          techniqueCard(
            icon: "📚", title: "Primary Sources",
            desc: "Read original documents, not interpretations. Form your own conclusions.")
          techniqueCard(
            icon: "🤝", title: "Community",
            desc: "Connect with like-minded individuals. Shared awakening accelerates growth.")
        }

        Spacer(minLength: 50)
      }
      .padding(.horizontal, 20)
    }
  }

  // MARK: - Helper Views

  private func conceptCard(icon: String, title: String, desc: String) -> some View {
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

  private func controlTechniqueCard(num: Int, name: String, desc: String, example: String)
    -> some View
  {
    VStack(alignment: .leading, spacing: 8) {
      HStack {
        Text("\(num)")
          .font(.caption)
          .fontWeight(.bold)
          .foregroundStyle(.black)
          .frame(width: 24, height: 24)
          .background(Color(hex: "E74C3C"))
          .cornerRadius(12)

        Text(name)
          .font(.subheadline)
          .fontWeight(.semibold)
          .foregroundStyle(.white)
      }

      Text(desc)
        .font(.caption)
        .foregroundStyle(.white.opacity(0.8))

      Text("Example: \(example)")
        .font(.caption2)
        .foregroundStyle(Color(hex: "E74C3C").opacity(0.8))
    }
    .padding()
    .background(Color.white.opacity(0.05))
    .cornerRadius(12)
  }

  private func goldenPathStep(num: Int, title: String, desc: String, color: Color) -> some View {
    HStack(alignment: .top, spacing: 16) {
      ZStack {
        Circle()
          .fill(color)
          .frame(width: 30, height: 30)
        Text("\(num)")
          .font(.caption)
          .fontWeight(.bold)
          .foregroundStyle(.white)
      }

      VStack(alignment: .leading, spacing: 4) {
        Text(title)
          .font(.subheadline)
          .fontWeight(.semibold)
          .foregroundStyle(color)
        Text(desc)
          .font(.caption)
          .foregroundStyle(.white.opacity(0.7))
      }
    }
    .padding()
    .background(color.opacity(0.1))
    .cornerRadius(12)
  }

  private func pitfallCard(text: String) -> some View {
    HStack(spacing: 8) {
      Text("⚠️")
      Text(text)
        .font(.caption)
        .foregroundStyle(.white.opacity(0.9))
    }
  }

  private func techniqueCard(icon: String, title: String, desc: String) -> some View {
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

      Spacer()
    }
    .padding()
    .background(Color.white.opacity(0.05))
    .cornerRadius(12)
  }
}

#Preview {
  MindDefenseView()
}
