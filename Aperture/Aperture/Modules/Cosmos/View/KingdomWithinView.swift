// KingdomWithinView.swift
// The Kingdom Within - Visual journey through the internal decode
// Lucifer, Satan, Devil, Hell, Christ — ALL within YOU

import SwiftUI

struct KingdomWithinView: View {
  @Environment(\.dismiss) private var dismiss

  @State private var currentSection = 0
  @State private var showContent = false
  @State private var revealedItems: Set<String> = []

  private let sections = [
    "The 33 Connection",
    "Lucifer Decoded",
    "Satan Decoded",
    "Devil Decoded",
    "Hell Decoded",
    "Christ Within",
    "The Projection",
    "The Kingdom",
  ]

  var body: some View {
    ZStack {
      // Background - deep purple to gold gradient
      LinearGradient(
        colors: [
          Color.black,
          Color.purple.opacity(0.3),
          Color.black,
        ],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
      )
      .ignoresSafeArea()

      VStack(spacing: 0) {
        // Header
        header

        // Progress
        progressBar

        // Content
        TabView(selection: $currentSection) {
          the33Connection.tag(0)
          luciferDecoded.tag(1)
          satanDecoded.tag(2)
          devilDecoded.tag(3)
          hellDecoded.tag(4)
          christWithin.tag(5)
          theProjection.tag(6)
          theKingdom.tag(7)
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .onChange(of: currentSection) { _, _ in
          HapticManager.shared.selectionChanged()
          revealedItems.removeAll()
          animateContent()
        }
      }
    }
    .onAppear {
      animateContent()
    }
  }

  // MARK: - Header

  private var header: some View {
    HStack {
      Button {
        dismiss()
      } label: {
        Image(systemName: "xmark")
          .font(.system(size: 16, weight: .medium))
          .foregroundColor(.white.opacity(0.7))
      }

      Spacer()

      Text("THE KINGDOM WITHIN")
        .font(.system(size: 14, weight: .black, design: .rounded))
        .foregroundColor(Palette.accent.gold)
        .tracking(2)

      Spacer()

      // Balance
      Color.clear.frame(width: 44)
    }
    .padding()
  }

  // MARK: - Progress

  private var progressBar: some View {
    HStack(spacing: 4) {
      ForEach(0..<sections.count, id: \.self) { index in
        Capsule()
          .fill(index <= currentSection ? Palette.accent.gold : Color.white.opacity(0.2))
          .frame(height: 3)
      }
    }
    .padding(.horizontal)
    .padding(.bottom, 8)
  }

  // MARK: - Section 0: The 33 Connection

  private var the33Connection: some View {
    ScrollView {
      VStack(spacing: 24) {
        sectionHeader(
          icon: "33.circle.fill",
          title: "THE 33 CONNECTION",
          subtitle: "The number they hid in plain sight"
        )

        // 33 Parallels
        ForEach(The33Connection.parallels) { parallel in
          parallelCard(parallel)
            .opacity(revealedItems.contains(parallel.id.uuidString) ? 1 : 0)
            .offset(y: revealedItems.contains(parallel.id.uuidString) ? 0 : 20)
        }

        // Revelation
        revelationCard(The33Connection.revelation, color: .purple)
          .opacity(revealedItems.contains("revelation") ? 1 : 0)

        navigationButtons
      }
      .padding()
      .padding(.bottom, 50)
    }
  }

  private func parallelCard(_ parallel: The33Connection.Parallel) -> some View {
    HStack(spacing: 16) {
      Text(parallel.number)
        .font(.system(size: 32, weight: .black, design: .rounded))
        .foregroundColor(Palette.accent.gold)
        .frame(width: 60)

      VStack(alignment: .leading, spacing: 4) {
        Text(parallel.element)
          .font(.system(size: 14, weight: .bold))
          .foregroundColor(.white)

        Text(parallel.meaning)
          .font(.system(size: 12, weight: .medium))
          .foregroundColor(.white.opacity(0.7))
      }

      Spacer()

      Image(systemName: parallel.icon)
        .font(.system(size: 20))
        .foregroundColor(.purple.opacity(0.7))
    }
    .padding(16)
    .background(
      RoundedRectangle(cornerRadius: 12)
        .fill(Color.purple.opacity(0.15))
        .overlay(
          RoundedRectangle(cornerRadius: 12)
            .stroke(Color.purple.opacity(0.3), lineWidth: 1)
        )
    )
  }

  // MARK: - Section 1: Lucifer Decoded

  private var luciferDecoded: some View {
    ScrollView {
      VStack(spacing: 24) {
        sectionHeader(
          icon: "sun.max.fill",
          title: "LUCIFER",
          subtitle: "The Light Bearer"
        )

        // Myth vs Truth
        mythVsTruthCard(
          myth: DemonizedDecoded.LuciferDecoded.externalMyth,
          truth: DemonizedDecoded.LuciferDecoded.internalTruth,
          color: Palette.accent.gold
        )

        // Etymology
        textCard(
          title: "ETYMOLOGY",
          content: DemonizedDecoded.LuciferDecoded.etymology,
          icon: "text.book.closed",
          color: Palette.accent.gold
        )

        // Gnostic View
        textCard(
          title: "THE GNOSTIC VIEW",
          content: DemonizedDecoded.LuciferDecoded.gnosticView,
          icon: "eye.trianglebadge.exclamationmark",
          color: .purple
        )

        // Within You
        textCard(
          title: "LUCIFER WITHIN",
          content: DemonizedDecoded.LuciferDecoded.withinYou,
          icon: "sparkles",
          color: Palette.accent.gold
        )

        navigationButtons
      }
      .padding()
      .padding(.bottom, 50)
    }
  }

  // MARK: - Section 2: Satan Decoded

  private var satanDecoded: some View {
    ScrollView {
      VStack(spacing: 24) {
        sectionHeader(
          icon: "person.fill.questionmark",
          title: "SATAN",
          subtitle: "The Adversary Within"
        )

        mythVsTruthCard(
          myth: DemonizedDecoded.SatanDecoded.externalMyth,
          truth: DemonizedDecoded.SatanDecoded.internalTruth,
          color: .red
        )

        textCard(
          title: "ETYMOLOGY",
          content: DemonizedDecoded.SatanDecoded.etymology,
          icon: "text.book.closed",
          color: .red
        )

        textCard(
          title: "THE SHADOW (JUNG)",
          content: DemonizedDecoded.SatanDecoded.jungianView,
          icon: "brain.head.profile",
          color: .purple
        )

        textCard(
          title: "SHADOW INTEGRATION",
          content: DemonizedDecoded.SatanDecoded.integration,
          icon: "arrow.triangle.merge",
          color: .cyan
        )

        navigationButtons
      }
      .padding()
      .padding(.bottom, 50)
    }
  }

  // MARK: - Section 3: Devil Decoded

  private var devilDecoded: some View {
    ScrollView {
      VStack(spacing: 24) {
        sectionHeader(
          icon: "arrow.left.arrow.right",
          title: "THE DEVIL",
          subtitle: "The Divider"
        )

        mythVsTruthCard(
          myth: DemonizedDecoded.DevilDecoded.externalMyth,
          truth: DemonizedDecoded.DevilDecoded.internalTruth,
          color: .orange
        )

        textCard(
          title: "ETYMOLOGY",
          content: DemonizedDecoded.DevilDecoded.etymology,
          icon: "text.book.closed",
          color: .orange
        )

        textCard(
          title: "THE EGO AS DEVIL",
          content: DemonizedDecoded.DevilDecoded.egoConnection,
          icon: "person.crop.circle.badge.exclamationmark",
          color: .purple
        )

        // The Irony - highlighted
        VStack(spacing: 12) {
          HStack {
            Image(systemName: "exclamationmark.triangle.fill")
              .foregroundColor(.yellow)
            Text("THE ULTIMATE IRONY")
              .font(.system(size: 14, weight: .black))
              .foregroundColor(.yellow)
            Spacer()
          }

          Text(DemonizedDecoded.DevilDecoded.theIrony)
            .font(.system(size: 12, weight: .medium, design: .monospaced))
            .foregroundColor(.white.opacity(0.9))
        }
        .padding(16)
        .background(
          RoundedRectangle(cornerRadius: 12)
            .fill(Color.yellow.opacity(0.1))
            .overlay(
              RoundedRectangle(cornerRadius: 12)
                .stroke(Color.yellow.opacity(0.5), lineWidth: 2)
            )
        )

        navigationButtons
      }
      .padding()
      .padding(.bottom, 50)
    }
  }

  // MARK: - Section 4: Hell Decoded

  private var hellDecoded: some View {
    ScrollView {
      VStack(spacing: 24) {
        sectionHeader(
          icon: "flame.fill",
          title: "HELL",
          subtitle: "The State You're In"
        )

        mythVsTruthCard(
          myth: DemonizedDecoded.HellDecoded.externalMyth,
          truth: DemonizedDecoded.HellDecoded.internalTruth,
          color: .red
        )

        textCard(
          title: "ACROSS TRADITIONS",
          content: DemonizedDecoded.HellDecoded.acrossTraditions,
          icon: "globe",
          color: .orange
        )

        textCard(
          title: "HELL IS NOW",
          content: DemonizedDecoded.HellDecoded.hellIsNow,
          icon: "clock.fill",
          color: .red
        )

        textCard(
          title: "THE ESCAPE",
          content: DemonizedDecoded.HellDecoded.escape,
          icon: "arrow.up.circle.fill",
          color: .green
        )

        navigationButtons
      }
      .padding()
      .padding(.bottom, 50)
    }
  }

  // MARK: - Section 5: Christ Within

  private var christWithin: some View {
    ScrollView {
      VStack(spacing: 24) {
        sectionHeader(
          icon: "sparkles",
          title: "CHRIST WITHIN",
          subtitle: "Your Awakened Consciousness"
        )

        mythVsTruthCard(
          myth: DemonizedDecoded.ChristWithinDecoded.externalMyth,
          truth: DemonizedDecoded.ChristWithinDecoded.internalTruth,
          color: Palette.accent.gold
        )

        textCard(
          title: "ETYMOLOGY",
          content: DemonizedDecoded.ChristWithinDecoded.etymology,
          icon: "text.book.closed",
          color: Palette.accent.gold
        )

        textCard(
          title: "WHAT JESUS ACTUALLY TAUGHT",
          content: DemonizedDecoded.ChristWithinDecoded.theTeaching,
          icon: "quote.bubble",
          color: .cyan
        )

        textCard(
          title: "KUNDALINI CONNECTION",
          content: DemonizedDecoded.ChristWithinDecoded.kundaliniConnection,
          icon: "bolt.fill",
          color: .purple
        )

        navigationButtons
      }
      .padding()
      .padding(.bottom, 50)
    }
  }

  // MARK: - Section 6: The Projection

  private var theProjection: some View {
    ScrollView {
      VStack(spacing: 24) {
        sectionHeader(
          icon: "theatermasks.fill",
          title: "THE PROJECTION",
          subtitle: "When the accuser IS the accused"
        )

        // Main content - highlighted
        VStack(spacing: 12) {
          Text(TheProjection.content)
            .font(.system(size: 13, weight: .medium, design: .monospaced))
            .foregroundColor(.white.opacity(0.95))
        }
        .padding(16)
        .background(
          RoundedRectangle(cornerRadius: 12)
            .fill(Color.red.opacity(0.1))
            .overlay(
              RoundedRectangle(cornerRadius: 12)
                .stroke(Color.red.opacity(0.4), lineWidth: 1)
            )
        )

        // The Question
        VStack(spacing: 12) {
          HStack {
            Image(systemName: "questionmark.circle.fill")
              .foregroundColor(.yellow)
            Text("THE QUESTION")
              .font(.system(size: 14, weight: .black))
              .foregroundColor(.yellow)
            Spacer()
          }

          Text(TheProjection.theQuestion)
            .font(.system(size: 13, weight: .bold, design: .monospaced))
            .foregroundColor(.white)
        }
        .padding(16)
        .background(
          RoundedRectangle(cornerRadius: 12)
            .fill(Color.yellow.opacity(0.1))
            .overlay(
              RoundedRectangle(cornerRadius: 12)
                .stroke(Color.yellow.opacity(0.5), lineWidth: 2)
            )
        )

        navigationButtons
      }
      .padding()
      .padding(.bottom, 50)
    }
  }

  // MARK: - Section 7: The Kingdom

  private var theKingdom: some View {
    ScrollView {
      VStack(spacing: 24) {
        // Crown icon
        Image(systemName: "crown.fill")
          .font(.system(size: 60))
          .foregroundColor(Palette.accent.gold)
          .symbolEffect(.pulse)

        Text("THE KINGDOM WITHIN")
          .font(.system(size: 28, weight: .black, design: .rounded))
          .foregroundColor(Palette.accent.gold)

        // Summary
        VStack(spacing: 12) {
          Text(TheKingdomWithin.summary)
            .font(.system(size: 12, weight: .medium, design: .monospaced))
            .foregroundColor(.white.opacity(0.95))
        }
        .padding(16)
        .background(
          RoundedRectangle(cornerRadius: 12)
            .fill(Palette.accent.gold.opacity(0.1))
            .overlay(
              RoundedRectangle(cornerRadius: 12)
                .stroke(Palette.accent.gold.opacity(0.5), lineWidth: 2)
            )
        )

        // Awakening Path
        textCard(
          title: "THE AWAKENING PATH",
          content: TheKingdomWithin.awakening,
          icon: "arrow.up.circle.fill",
          color: .purple
        )

        // Why Awakening is Hard
        textCard(
          title: "WHY IT'S HARD",
          content: AwakeningStruggles.content,
          icon: "flame.fill",
          color: .orange
        )

        // Completion
        VStack(spacing: 16) {
          Text("You were never separate from the Kingdom.")
            .font(.system(size: 16, weight: .bold))
            .foregroundColor(.white)
            .multilineTextAlignment(.center)

          Text("You were just taught to look outside.")
            .font(.system(size: 14, weight: .medium))
            .foregroundColor(.white.opacity(0.7))
            .multilineTextAlignment(.center)

          Text("Now you know where to look.")
            .font(.system(size: 18, weight: .black))
            .foregroundColor(Palette.accent.gold)

          Text("WITHIN. 👁️")
            .font(.system(size: 24, weight: .black))
            .foregroundColor(.purple)
        }
        .padding(.vertical, 24)

        // Close button
        Button {
          HapticManager.shared.success()
          dismiss()
        } label: {
          Text("I Found the Kingdom")
            .font(.system(size: 16, weight: .bold))
            .foregroundColor(.black)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 16)
            .background(
              RoundedRectangle(cornerRadius: 12)
                .fill(Palette.accent.gold)
            )
        }
      }
      .padding()
      .padding(.bottom, 50)
    }
  }

  // MARK: - Reusable Components

  private func sectionHeader(icon: String, title: String, subtitle: String) -> some View {
    VStack(spacing: 12) {
      Image(systemName: icon)
        .font(.system(size: 48))
        .foregroundColor(Palette.accent.gold)

      Text(title)
        .font(.system(size: 24, weight: .black, design: .rounded))
        .foregroundColor(.white)

      Text(subtitle)
        .font(.system(size: 14, weight: .medium))
        .foregroundColor(.white.opacity(0.6))
    }
    .padding(.bottom, 8)
  }

  private func mythVsTruthCard(myth: String, truth: String, color: Color) -> some View {
    VStack(spacing: 16) {
      // Myth
      HStack {
        Image(systemName: "xmark.circle.fill")
          .foregroundColor(.red)
        Text("WHAT THEY TOLD YOU")
          .font(.system(size: 10, weight: .bold))
          .foregroundColor(.red)
        Spacer()
      }

      Text(myth)
        .font(.system(size: 13, weight: .medium))
        .foregroundColor(.white.opacity(0.7))
        .frame(maxWidth: .infinity, alignment: .leading)
        .strikethrough(color: .red.opacity(0.5))

      Divider()
        .background(Color.white.opacity(0.2))

      // Truth
      HStack {
        Image(systemName: "checkmark.circle.fill")
          .foregroundColor(.green)
        Text("THE TRUTH")
          .font(.system(size: 10, weight: .bold))
          .foregroundColor(.green)
        Spacer()
      }

      Text(truth)
        .font(.system(size: 14, weight: .bold))
        .foregroundColor(color)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    .padding(16)
    .background(
      RoundedRectangle(cornerRadius: 12)
        .fill(color.opacity(0.1))
        .overlay(
          RoundedRectangle(cornerRadius: 12)
            .stroke(color.opacity(0.3), lineWidth: 1)
        )
    )
  }

  private func textCard(title: String, content: String, icon: String, color: Color) -> some View {
    VStack(alignment: .leading, spacing: 12) {
      HStack {
        Image(systemName: icon)
          .foregroundColor(color)
        Text(title)
          .font(.system(size: 12, weight: .black))
          .foregroundColor(color)
        Spacer()
      }

      Text(content)
        .font(.system(size: 11, weight: .medium, design: .monospaced))
        .foregroundColor(.white.opacity(0.9))
    }
    .padding(16)
    .background(
      RoundedRectangle(cornerRadius: 12)
        .fill(color.opacity(0.08))
        .overlay(
          RoundedRectangle(cornerRadius: 12)
            .stroke(color.opacity(0.2), lineWidth: 1)
        )
    )
  }

  private func revelationCard(_ content: String, color _: Color) -> some View {
    VStack(spacing: 12) {
      HStack {
        Image(systemName: "lightbulb.fill")
          .foregroundColor(.yellow)
        Text("THE REVELATION")
          .font(.system(size: 12, weight: .black))
          .foregroundColor(.yellow)
        Spacer()
      }

      Text(content)
        .font(.system(size: 12, weight: .medium, design: .monospaced))
        .foregroundColor(.white)
    }
    .padding(16)
    .background(
      RoundedRectangle(cornerRadius: 12)
        .fill(Color.yellow.opacity(0.1))
        .overlay(
          RoundedRectangle(cornerRadius: 12)
            .stroke(Color.yellow.opacity(0.4), lineWidth: 1)
        )
    )
  }

  private var navigationButtons: some View {
    HStack(spacing: 16) {
      if currentSection > 0 {
        Button {
          withAnimation {
            currentSection -= 1
          }
        } label: {
          HStack {
            Image(systemName: "chevron.left")
            Text("Back")
          }
          .font(.system(size: 14, weight: .medium))
          .foregroundColor(.white.opacity(0.7))
          .padding(.horizontal, 20)
          .padding(.vertical, 12)
          .background(
            Capsule()
              .fill(Color.white.opacity(0.1))
          )
        }
      }

      Spacer()

      if currentSection < sections.count - 1 {
        Button {
          withAnimation {
            currentSection += 1
          }
        } label: {
          HStack {
            Text("Continue")
            Image(systemName: "chevron.right")
          }
          .font(.system(size: 14, weight: .bold))
          .foregroundColor(.black)
          .padding(.horizontal, 20)
          .padding(.vertical, 12)
          .background(
            Capsule()
              .fill(Palette.accent.gold)
          )
        }
      }
    }
    .padding(.top, 16)
  }

  // MARK: - Animation

  private func animateContent() {
    // Animate items based on current section
    switch currentSection {
    case 0:
      for (index, parallel) in The33Connection.parallels.enumerated() {
        DispatchQueue.main.asyncAfter(deadline: .now() + Double(index) * 0.2) {
          withAnimation(.spring(response: 0.4, dampingFraction: 0.8)) {
            _ = revealedItems.insert(parallel.id.uuidString)
          }
        }
      }
      DispatchQueue.main.asyncAfter(
        deadline: .now() + Double(The33Connection.parallels.count) * 0.2 + 0.3
      ) {
        withAnimation {
          _ = revealedItems.insert("revelation")
        }
      }
    default:
      break
    }
  }
}

// MARK: - Preview

#Preview {
  KingdomWithinView()
}
