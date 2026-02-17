// GuestPreviewView.swift
// Sample content preview for guest users before authentication
// Shows taste of Cosmos, Alexandria, and Awakening paths

import SwiftUI

// MARK: - Guest Preview Main View

struct GuestPreviewView: View {
  @ObservedObject var guestManager = GuestModeManager.shared
  @State private var selectedTab: GuestTab = .welcome
  @State private var showSignUpPrompt = false

  let onSignUp: () -> Void
  let onContinueAsGuest: () -> Void

  enum GuestTab: String, CaseIterable {
    case welcome = "Welcome"
    case cosmos = "Cosmos"
    case alexandria = "Alexandria"
    case paths = "Paths"
  }

  var body: some View {
    ZStack {
      // Background
      Color(hex: "#0a0a1a").ignoresSafeArea()

      VStack(spacing: 0) {
        // Custom tab bar
        tabBar

        // Content
        TabView(selection: $selectedTab) {
          welcomeTab.tag(GuestTab.welcome)
          cosmosPreviewTab.tag(GuestTab.cosmos)
          alexandriaPreviewTab.tag(GuestTab.alexandria)
          pathsPreviewTab.tag(GuestTab.paths)
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
      }
    }
    .sheet(isPresented: $showSignUpPrompt) {
      SignUpPromptSheet(
        onSignUp: onSignUp,
        onContinue: { showSignUpPrompt = false }
      )
    }
  }

  // MARK: - Tab Bar

  private var tabBar: some View {
    HStack(spacing: 0) {
      ForEach(GuestTab.allCases, id: \.self) { tab in
        Button(action: {
          withAnimation(.spring(response: 0.3)) {
            selectedTab = tab
          }
          HapticManager.shared.selectionChanged()
        }) {
          VStack(spacing: 4) {
            Text(tab.rawValue)
              .font(.system(size: 14, weight: selectedTab == tab ? .bold : .medium))
              .foregroundColor(selectedTab == tab ? Palette.accent.gold : .white.opacity(0.5))

            if selectedTab == tab {
              Rectangle()
                .fill(Palette.accent.gold)
                .frame(height: 2)
            } else {
              Rectangle()
                .fill(Color.clear)
                .frame(height: 2)
            }
          }
          .frame(maxWidth: .infinity)
        }
      }
    }
    .padding(.horizontal)
    .padding(.top, 8)
  }

  // MARK: - Welcome Tab

  private var welcomeTab: some View {
    ScrollView(showsIndicators: false) {
      VStack(spacing: 30) {
        Spacer(minLength: 40)

        // Logo
        ZStack {
          Circle()
            .fill(
              RadialGradient(
                colors: [Palette.accent.gold.opacity(0.3), Color.clear],
                center: .center,
                startRadius: 40,
                endRadius: 100
              )
            )
            .frame(width: 160, height: 160)

          Image(systemName: "eye.fill")
            .font(.system(size: 60))
            .foregroundStyle(
              LinearGradient(
                colors: [Palette.accent.gold, Palette.primary.cyan],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
              )
            )
        }

        VStack(spacing: 12) {
          Text("APERTURE")
            .font(.system(size: 32, weight: .black, design: .rounded))
            .foregroundColor(.white)
            .tracking(4)

          Text("Open Your Eyes")
            .font(.system(size: 18, weight: .medium))
            .foregroundColor(Palette.accent.gold)
        }

        // Description
        Text(
          "Explore sample content from our library of suppressed texts, hidden history, and universal awakening paths."
        )
        .font(.system(size: 15))
        .foregroundColor(.white.opacity(0.7))
        .multilineTextAlignment(.center)
        .padding(.horizontal, 30)

        // Features
        VStack(spacing: 16) {
          featureRow(
            icon: "globe.americas.fill", title: "Cosmos",
            description: "Gnostic cosmology & hidden realms", color: .cyan)
          featureRow(
            icon: "books.vertical.fill", title: "Alexandria",
            description: "Suppressed texts & lost gospels", color: .green)
          featureRow(
            icon: "sun.max.fill", title: "Awakening",
            description: "25+ spiritual traditions unified", color: .orange)
        }
        .padding(.horizontal, 20)

        // Swipe hint
        HStack {
          Text("Swipe to explore samples")
          Image(systemName: "arrow.right")
        }
        .font(.system(size: 14))
        .foregroundColor(.white.opacity(0.4))

        Spacer(minLength: 40)

        // CTA buttons
        VStack(spacing: 12) {
          Button(action: onSignUp) {
            Text("Create Free Account")
              .font(.system(size: 17, weight: .bold))
              .foregroundColor(.black)
              .frame(maxWidth: .infinity)
              .padding(.vertical, 16)
              .background(Palette.accent.gold)
              .cornerRadius(12)
          }

          Button(action: onContinueAsGuest) {
            Text("Continue Exploring")
              .font(.system(size: 15, weight: .medium))
              .foregroundColor(Palette.primary.cyan)
          }
        }
        .padding(.horizontal, 30)
        .padding(.bottom, 30)
      }
    }
  }

  private func featureRow(icon: String, title: String, description: String, color: Color)
    -> some View
  {
    HStack(spacing: 16) {
      Image(systemName: icon)
        .font(.system(size: 24))
        .foregroundColor(color)
        .frame(width: 50, height: 50)
        .background(color.opacity(0.15))
        .clipShape(Circle())

      VStack(alignment: .leading, spacing: 2) {
        Text(title)
          .font(.system(size: 16, weight: .semibold))
          .foregroundColor(.white)
        Text(description)
          .font(.system(size: 13))
          .foregroundColor(.white.opacity(0.6))
      }

      Spacer()
    }
    .padding()
    .background(
      RoundedRectangle(cornerRadius: 12)
        .fill(Color.white.opacity(0.05))
    )
  }

  // MARK: - Cosmos Preview Tab

  private var cosmosPreviewTab: some View {
    ScrollView(showsIndicators: false) {
      VStack(spacing: 20) {
        // Header
        sectionHeader(
          icon: "globe.americas.fill",
          title: "COSMOS",
          subtitle: "Gnostic Cosmology",
          color: .cyan
        )

        Text(
          "Explore the hidden realms of existence as described in ancient Gnostic texts. The truth about reality is stranger than you've been told."
        )
        .font(.system(size: 14))
        .foregroundColor(.white.opacity(0.7))
        .multilineTextAlignment(.center)
        .padding(.horizontal, 20)

        // Sample cards
        ForEach(SampleContentProvider.cosmosSamples) { sample in
          CosmosSampleCard(sample: sample) {
            guestManager.markContentViewed(sample.id)
            if guestManager.shouldPromptSignUp {
              showSignUpPrompt = true
            }
          }
        }

        // Teaser
        lockedContentTeaser(count: 6, type: "cosmic realms")

        ctaButton
      }
      .padding()
    }
  }

  // MARK: - Alexandria Preview Tab

  private var alexandriaPreviewTab: some View {
    ScrollView(showsIndicators: false) {
      VStack(spacing: 20) {
        // Header
        sectionHeader(
          icon: "books.vertical.fill",
          title: "ALEXANDRIA",
          subtitle: "The Sacred Library",
          color: .green
        )

        Text(
          "Access texts that were hidden, burned, or declared heretical. The Nag Hammadi library, Dead Sea Scrolls, and more."
        )
        .font(.system(size: 14))
        .foregroundColor(.white.opacity(0.7))
        .multilineTextAlignment(.center)
        .padding(.horizontal, 20)

        // Sample cards
        ForEach(SampleContentProvider.alexandriaSamples) { sample in
          AlexandriaSampleCard(sample: sample) {
            guestManager.markContentViewed(sample.id)
            if guestManager.shouldPromptSignUp {
              showSignUpPrompt = true
            }
          }
        }

        // Teaser
        lockedContentTeaser(count: 20, type: "sacred texts")

        ctaButton
      }
      .padding()
    }
  }

  // MARK: - Paths Preview Tab

  private var pathsPreviewTab: some View {
    ScrollView(showsIndicators: false) {
      VStack(spacing: 20) {
        // Header
        sectionHeader(
          icon: "sun.max.fill",
          title: "AWAKENING PATHS",
          subtitle: "Universal Methods",
          color: .orange
        )

        // Oneness box
        VStack(spacing: 12) {
          Text("🌍 WE ARE ALL THE SAME")
            .font(.system(size: 14, weight: .bold))
            .foregroundColor(Palette.accent.gold)

          Text(SampleContentProvider.onenessProof)
            .font(.system(size: 13))
            .foregroundColor(.white.opacity(0.8))
            .multilineTextAlignment(.center)
        }
        .padding()
        .background(
          RoundedRectangle(cornerRadius: 16)
            .fill(Palette.accent.gold.opacity(0.1))
            .overlay(
              RoundedRectangle(cornerRadius: 16)
                .stroke(Palette.accent.gold.opacity(0.3), lineWidth: 1)
            )
        )

        // Sample paths
        ForEach(SampleContentProvider.awakeningPathSamples) { sample in
          AwakeningPathSampleCard(sample: sample) {
            guestManager.markContentViewed(sample.id)
            if guestManager.shouldPromptSignUp {
              showSignUpPrompt = true
            }
          }
        }

        // Teaser
        lockedContentTeaser(count: 25, type: "awakening traditions")

        ctaButton
      }
      .padding()
    }
  }

  // MARK: - Helpers

  private func sectionHeader(icon: String, title: String, subtitle: String, color: Color)
    -> some View
  {
    VStack(spacing: 8) {
      Image(systemName: icon)
        .font(.system(size: 40))
        .foregroundColor(color)

      Text(title)
        .font(.system(size: 24, weight: .black))
        .foregroundColor(.white)
        .tracking(3)

      Text(subtitle)
        .font(.system(size: 14))
        .foregroundColor(color)
    }
    .padding(.top, 20)
  }

  private func lockedContentTeaser(count: Int, type: String) -> some View {
    HStack(spacing: 12) {
      Image(systemName: "lock.fill")
        .foregroundColor(Palette.accent.gold)

      Text("\(count)+ more \(type) with free account")
        .font(.system(size: 14, weight: .medium))
        .foregroundColor(.white.opacity(0.7))
    }
    .padding()
    .frame(maxWidth: .infinity)
    .background(
      RoundedRectangle(cornerRadius: 12)
        .fill(Color.white.opacity(0.03))
        .overlay(
          RoundedRectangle(cornerRadius: 12)
            .stroke(style: StrokeStyle(lineWidth: 1, dash: [5]))
            .foregroundColor(.white.opacity(0.1))
        )
    )
  }

  private var ctaButton: some View {
    Button(action: onSignUp) {
      HStack {
        Text("Unlock Full Access")
          .font(.system(size: 16, weight: .bold))
        Image(systemName: "arrow.right")
      }
      .foregroundColor(.black)
      .frame(maxWidth: .infinity)
      .padding(.vertical, 14)
      .background(Palette.accent.gold)
      .cornerRadius(12)
    }
    .padding(.vertical, 20)
  }
}

// MARK: - Sample Cards

struct CosmosSampleCard: View {
  let sample: CosmosSample
  let onTap: () -> Void
  @State private var isExpanded = false

  var body: some View {
    VStack(alignment: .leading, spacing: 12) {
      // Header
      Button(action: {
        withAnimation(.spring(response: 0.3)) {
          isExpanded.toggle()
        }
        onTap()
      }) {
        HStack {
          VStack(alignment: .leading, spacing: 4) {
            Text(sample.title)
              .font(.system(size: 18, weight: .bold))
              .foregroundColor(.white)
            Text(sample.subtitle)
              .font(.system(size: 13))
              .foregroundColor(sample.uiColor)
          }

          Spacer()

          Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
            .foregroundColor(sample.uiColor)
        }
      }

      if isExpanded {
        Text(sample.description)
          .font(.system(size: 14))
          .foregroundColor(.white.opacity(0.8))

        // Key points
        VStack(alignment: .leading, spacing: 6) {
          Text("KEY POINTS")
            .font(.system(size: 11, weight: .bold))
            .foregroundColor(sample.uiColor)
            .tracking(1)

          ForEach(sample.keyPoints, id: \.self) { point in
            HStack(alignment: .top, spacing: 8) {
              Text("•")
                .foregroundColor(sample.uiColor)
              Text(point)
                .font(.system(size: 13))
                .foregroundColor(.white.opacity(0.7))
            }
          }
        }
      }
    }
    .padding()
    .background(
      RoundedRectangle(cornerRadius: 16)
        .fill(sample.uiColor.opacity(0.1))
        .overlay(
          RoundedRectangle(cornerRadius: 16)
            .stroke(sample.uiColor.opacity(0.3), lineWidth: 1)
        )
    )
  }
}

struct AlexandriaSampleCard: View {
  let sample: AlexandriaSample
  let onTap: () -> Void
  @State private var isExpanded = false

  var body: some View {
    VStack(alignment: .leading, spacing: 12) {
      headerButton

      if isExpanded {
        expandedContent
      }
    }
    .padding()
    .background(cardBackground)
  }

  private var headerButton: some View {
    Button(action: {
      withAnimation(.spring(response: 0.3)) {
        isExpanded.toggle()
      }
      onTap()
    }) {
      HStack {
        VStack(alignment: .leading, spacing: 4) {
          Text(sample.title)
            .font(.system(size: 18, weight: .bold))
            .foregroundColor(.white)

          HStack(spacing: 8) {
            Text(sample.category)
              .font(.system(size: 11, weight: .medium))
              .foregroundColor(sample.uiColor)

            Text("•")
              .foregroundColor(.gray)

            Text(sample.dateWritten)
              .font(.system(size: 11))
              .foregroundColor(.gray)
          }
        }

        Spacer()

        Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
          .foregroundColor(sample.uiColor)
      }
    }
  }

  private var expandedContent: some View {
    VStack(alignment: .leading, spacing: 12) {
      // Discovery info
      Text(sample.discoveryInfo)
        .font(.system(size: 12, weight: .medium))
        .foregroundColor(sample.uiColor.opacity(0.8))
        .italic()

      Text(sample.description)
        .font(.system(size: 14))
        .foregroundColor(.white.opacity(0.8))

      // Sample quotes
      quotesSection

      // Why hidden
      whyHiddenSection
    }
  }

  private var quotesSection: some View {
    VStack(alignment: .leading, spacing: 8) {
      Text("SAMPLE QUOTES")
        .font(.system(size: 11, weight: .bold))
        .foregroundColor(sample.uiColor)
        .tracking(1)

      ForEach(sample.sampleQuotes, id: \.self) { quote in
        Text("\"\(quote)\"")
          .font(.system(size: 13))
          .italic()
          .foregroundColor(.white.opacity(0.7))
          .padding(.leading, 8)
      }
    }
  }

  private var whyHiddenSection: some View {
    VStack(alignment: .leading, spacing: 6) {
      Text("WHY WAS THIS HIDDEN?")
        .font(.system(size: 11, weight: .bold))
        .foregroundColor(.red.opacity(0.8))
        .tracking(1)

      Text(sample.whyHidden)
        .font(.system(size: 13))
        .foregroundColor(.white.opacity(0.7))
    }
  }

  private var cardBackground: some View {
    RoundedRectangle(cornerRadius: 16)
      .fill(sample.uiColor.opacity(0.1))
      .overlay(
        RoundedRectangle(cornerRadius: 16)
          .stroke(sample.uiColor.opacity(0.3), lineWidth: 1)
      )
  }
}

struct AwakeningPathSampleCard: View {
  let sample: AwakeningPathSample
  let onTap: () -> Void
  @State private var isExpanded = false

  var body: some View {
    VStack(alignment: .leading, spacing: 12) {
      // Header
      Button(action: {
        withAnimation(.spring(response: 0.3)) {
          isExpanded.toggle()
        }
        onTap()
      }) {
        HStack(spacing: 12) {
          // Icon
          Image(systemName: sample.icon)
            .font(.system(size: 24))
            .foregroundColor(sample.uiColor)
            .frame(width: 50, height: 50)
            .background(sample.uiColor.opacity(0.15))
            .clipShape(Circle())

          VStack(alignment: .leading, spacing: 4) {
            Text(sample.name)
              .font(.system(size: 16, weight: .bold))
              .foregroundColor(.white)

            Text("\(sample.tradition) • \(sample.region)")
              .font(.system(size: 12))
              .foregroundColor(.gray)
          }

          Spacer()

          Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
            .foregroundColor(sample.uiColor)
        }
      }

      // Tagline always visible
      Text(sample.tagline)
        .font(.system(size: 13, weight: .medium))
        .foregroundColor(sample.uiColor)

      if isExpanded {
        // Energy name
        HStack {
          Text("Energy called:")
            .font(.system(size: 12))
            .foregroundColor(.gray)
          Text(sample.energyName)
            .font(.system(size: 12, weight: .bold))
            .foregroundColor(sample.uiColor)
        }

        Text(sample.overview)
          .font(.system(size: 14))
          .foregroundColor(.white.opacity(0.8))

        // Key practices
        VStack(alignment: .leading, spacing: 6) {
          Text("KEY PRACTICES")
            .font(.system(size: 11, weight: .bold))
            .foregroundColor(sample.uiColor)
            .tracking(1)

          ForEach(sample.keyPractices, id: \.self) { practice in
            HStack(alignment: .top, spacing: 8) {
              Text("•")
                .foregroundColor(sample.uiColor)
              Text(practice)
                .font(.system(size: 13))
                .foregroundColor(.white.opacity(0.7))
            }
          }
        }

        // Universal connection
        VStack(alignment: .leading, spacing: 6) {
          Text("🌍 UNIVERSAL CONNECTION")
            .font(.system(size: 11, weight: .bold))
            .foregroundColor(Palette.accent.gold)
            .tracking(1)

          Text(sample.universalConnection)
            .font(.system(size: 13))
            .foregroundColor(.white.opacity(0.8))
            .italic()
        }
      }
    }
    .padding()
    .background(
      RoundedRectangle(cornerRadius: 16)
        .fill(sample.uiColor.opacity(0.1))
        .overlay(
          RoundedRectangle(cornerRadius: 16)
            .stroke(sample.uiColor.opacity(0.3), lineWidth: 1)
        )
    )
  }
}

// MARK: - Sign Up Prompt Sheet

struct SignUpPromptSheet: View {
  let onSignUp: () -> Void
  let onContinue: () -> Void

  @Environment(\.dismiss) private var dismiss

  var body: some View {
    ZStack {
      Color(hex: "#0a0a1a").ignoresSafeArea()

      VStack(spacing: 24) {
        Spacer()

        // Dragon
        Text("🐉")
          .font(.system(size: 60))

        Text("You're Awakening...")
          .font(.system(size: 24, weight: .bold))
          .foregroundColor(.white)

        Text(
          "You've explored the samples. Create a free account to access the full library of 25+ awakening traditions, suppressed texts, and guided practices."
        )
        .font(.system(size: 15))
        .foregroundColor(.white.opacity(0.7))
        .multilineTextAlignment(.center)
        .padding(.horizontal, 30)

        // Benefits
        VStack(alignment: .leading, spacing: 12) {
          benefitRow(icon: "checkmark.circle.fill", text: "Full access to all awakening paths")
          benefitRow(icon: "checkmark.circle.fill", text: "Complete suppressed text library")
          benefitRow(icon: "checkmark.circle.fill", text: "Your personal Dragon companion")
          benefitRow(icon: "checkmark.circle.fill", text: "Progress tracking & achievements")
        }
        .padding()
        .background(
          RoundedRectangle(cornerRadius: 12)
            .fill(Color.white.opacity(0.05))
        )
        .padding(.horizontal, 30)

        Spacer()

        // Buttons
        VStack(spacing: 12) {
          Button(action: {
            dismiss()
            onSignUp()
          }) {
            Text("Create Free Account")
              .font(.system(size: 17, weight: .bold))
              .foregroundColor(.black)
              .frame(maxWidth: .infinity)
              .padding(.vertical, 16)
              .background(Palette.accent.gold)
              .cornerRadius(12)
          }

          Button(action: {
            dismiss()
            onContinue()
          }) {
            Text("Continue Browsing")
              .font(.system(size: 15))
              .foregroundColor(.white.opacity(0.6))
          }
        }
        .padding(.horizontal, 30)
        .padding(.bottom, 40)
      }
    }
    .presentationDetents([.medium, .large])
  }

  private func benefitRow(icon: String, text: String) -> some View {
    HStack(spacing: 12) {
      Image(systemName: icon)
        .foregroundColor(.green)
      Text(text)
        .font(.system(size: 14))
        .foregroundColor(.white)
    }
  }
}

// MARK: - Preview

#Preview {
  GuestPreviewView(
    onSignUp: { print("Sign up") },
    onContinueAsGuest: { print("Continue as guest") }
  )
}
