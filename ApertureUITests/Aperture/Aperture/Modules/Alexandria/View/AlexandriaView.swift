// AlexandriaView.swift
// The Library of Alexandria - Reborn

import SwiftUI

struct AlexandriaView: View {
  @StateObject private var presenterBox: AlexandriaPresenterBox

  @State private var selectedCategory: LibraryCategory?
  @State private var selectedTradition: TextTradition?
  @State private var selectedText: SacredText?
  @State private var showForbiddenGospels = false
  @State private var searchText = ""
  @FocusState private var isSearchFocused: Bool

  private var presenter: AlexandriaPresenterType {
    presenterBox.presenter
  }

  init(presenter: AlexandriaPresenterType) {
    _presenterBox = StateObject(wrappedValue: AlexandriaPresenterBox(presenter: presenter))
  }

  // MARK: - Search Filtering

  private var filteredTraditions: [TextTradition] {
    guard !searchText.isEmpty else {
      return LibraryCategory.sacredTexts.traditions
    }

    let lowercased = searchText.lowercased()
    return LibraryCategory.sacredTexts.traditions.filter { tradition in
      tradition.name.lowercased().contains(lowercased)
        || tradition.description.lowercased().contains(lowercased)
        || tradition.period.lowercased().contains(lowercased)
        || tradition.texts.contains { text in
          text.name.lowercased().contains(lowercased)
            || text.summary.lowercased().contains(lowercased)
        }
    }
  }

  private var hasSearchResults: Bool {
    !searchText.isEmpty && filteredTraditions.isEmpty
  }

  var body: some View {
    NavigationStack {
      ZStack {
        cosmicBackground

        ScrollView {
          VStack(spacing: 24) {
            Spacer(minLength: 20)

            headerSection

            // Search Bar
            searchBarSection

            // Main Content - Sacred Texts First
            categorySection

            // Dragon context chip - removed, module deprecated
            // DragonContextChip(
            //     context: .alexandria(textId: nil),
            //     customText: "Ask the Dragon about sacred texts"
            // )
            // .padding(.top, 20)

            Spacer(minLength: 40)
          }
          .padding(.horizontal, 20)
        }
      }
      .navigationTitle("Alexandria")
      .navigationBarTitleDisplayMode(.inline)
      .sheet(item: $selectedTradition) { tradition in
        TraditionDetailView(tradition: tradition) { text in
          selectedTradition = nil
          DispatchQueue.main.asyncAfter(deadline: .now() + 0.35) {
            selectedText = text
          }
        } onDismiss: {
          selectedTradition = nil
        }
      }
      .sheet(item: $selectedText) { text in
        SacredTextDetailView(text: text) {
          selectedText = nil
        }
      }
    }
    .onAppear {
      presenter.viewDidLoad()
    }
  }

  // MARK: - Search Bar

  private var searchBarSection: some View {
    VStack(spacing: 12) {
      HStack(spacing: 12) {
        HStack(spacing: 10) {
          Image(systemName: "magnifyingglass")
            .font(.system(size: 16, weight: .medium))
            .foregroundColor(isSearchFocused ? Palette.accent.gold : Palette.text.muted)

          TextField("Search texts, traditions, wisdom...", text: $searchText)
            .font(.system(size: 15, weight: .medium, design: .rounded))
            .foregroundColor(Palette.text.primary)
            .focused($isSearchFocused)
            .autocorrectionDisabled()
            .submitLabel(.search)
            .accessibilityLabel("Search library")
            .accessibilityHint("Search through sacred texts and traditions")

          if !searchText.isEmpty {
            Button {
              searchText = ""
              HapticManager.shared.light()
            } label: {
              Image(systemName: "xmark.circle.fill")
                .font(.system(size: 18))
                .foregroundColor(Palette.text.muted)
            }
            .accessibilityLabel("Clear search")
          }
        }
        .padding(.horizontal, 14)
        .padding(.vertical, 12)
        .background(
          RoundedRectangle(cornerRadius: 12, style: .continuous)
            .fill(Color.white.opacity(0.05))
            .overlay(
              RoundedRectangle(cornerRadius: 12, style: .continuous)
                .stroke(
                  isSearchFocused
                    ? Palette.accent.gold.opacity(0.5) : Palette.text.muted.opacity(0.2),
                  lineWidth: 1
                )
            )
        )
      }

      // No results message
      if hasSearchResults {
        HStack(spacing: 8) {
          Image(systemName: "text.page.badge.magnifyingglass")
            .font(.system(size: 16))
            .foregroundColor(Palette.text.muted)

          Text("No texts found for \"\(searchText)\"")
            .font(.system(size: 14, weight: .medium, design: .rounded))
            .foregroundColor(Palette.text.muted)
        }
        .padding(.top, 8)
      }

      // Search suggestions when focused
      if isSearchFocused && searchText.isEmpty {
        VStack(alignment: .leading, spacing: 10) {
          Text("POPULAR SEARCHES")
            .font(.system(size: 10, weight: .bold, design: .rounded))
            .tracking(1.5)
            .foregroundColor(Palette.text.muted)

          ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 8) {
              ForEach(
                ["Gnostic", "Hermes", "Gospel", "Emerald", "Thoth", "Nag Hammadi"], id: \.self
              ) { suggestion in
                Button {
                  searchText = suggestion
                  HapticManager.shared.light()
                } label: {
                  Text(suggestion)
                    .font(.system(size: 13, weight: .medium, design: .rounded))
                    .foregroundColor(Palette.accent.gold)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 6)
                    .background(
                      Capsule()
                        .fill(Palette.accent.gold.opacity(0.15))
                    )
                }
                .accessibilityLabel("Search for \(suggestion)")
              }
            }
          }
        }
        .padding(.top, 4)
      }
    }
  }

  // MARK: - Header

  private var headerSection: some View {
    VStack(spacing: 16) {
      // Animated library icon
      ZStack {
        // Glow
        Circle()
          .fill(
            RadialGradient(
              colors: [Palette.accent.gold.opacity(0.3), Color.clear],
              center: .center,
              startRadius: 0,
              endRadius: 60
            )
          )
          .frame(width: 120, height: 120)

        Image(systemName: "books.vertical.fill")
          .font(.system(size: 56, weight: .bold))
          .foregroundStyle(
            LinearGradient(
              colors: [Palette.accent.gold, Palette.primary.orange],
              startPoint: .topLeading,
              endPoint: .bottomTrailing
            )
          )
          .shadow(color: Palette.accent.gold.opacity(0.5), radius: 10)
      }

      Text("The Library")
        .font(.system(size: 32, weight: .bold, design: .rounded))
        .foregroundStyle(
          LinearGradient(
            colors: [Palette.text.primary, Palette.accent.gold.opacity(0.8)],
            startPoint: .top,
            endPoint: .bottom
          )
        )

      Text("Ancient wisdom meets modern awakening")
        .font(.system(size: 15, weight: .medium, design: .rounded))
        .foregroundColor(Palette.text.secondary)

      // Dragon intro
      HStack(alignment: .top, spacing: 10) {
        Text("🐉")
          .font(.system(size: 18))

        Text(
          "\"They burned the Library of Alexandria. They buried the Nag Hammadi texts. They killed the Gnostics. The truth kept coming back. Now it's in your pocket.\""
        )
        .font(.system(size: 13, weight: .medium, design: .rounded))
        .italic()
        .foregroundColor(Palette.accent.gold.opacity(0.9))
        .lineSpacing(4)
      }
      .padding(14)
      .background(
        RoundedRectangle(cornerRadius: 12, style: .continuous)
          .fill(Palette.accent.gold.opacity(0.1))
          .overlay(
            RoundedRectangle(cornerRadius: 12, style: .continuous)
              .stroke(Palette.accent.gold.opacity(0.3), lineWidth: 1)
          )
      )
    }
  }

  // MARK: - Category Section

  private var categorySection: some View {
    VStack(spacing: 20) {
      // Sacred Texts - Primary
      sacredTextsSection

      // Forbidden Gospels - Featured
      forbiddenGospelsSection

      // Hidden Knowledge
      hiddenKnowledgeSection

      // Coming Soon sections
      comingSoonSection
    }
  }

  // MARK: - Sacred Texts Section

  private var sacredTextsSection: some View {
    VStack(alignment: .leading, spacing: 16) {
      // Section header
      HStack {
        Image(systemName: "book.closed.fill")
          .font(.system(size: 18, weight: .bold))
          .foregroundColor(Palette.accent.gold)

        Text("SACRED TEXTS")
          .font(.system(size: 13, weight: .bold, design: .rounded))
          .tracking(2)
          .foregroundColor(Palette.accent.gold)

        Spacer()

        Text("\(filteredTraditions.count) traditions")
          .font(.system(size: 11, weight: .medium, design: .rounded))
          .foregroundColor(Palette.text.muted)
      }

      Text("The recovered wisdom they tried to destroy")
        .font(.system(size: 14, weight: .medium, design: .rounded))
        .foregroundColor(Palette.text.secondary)

      // Tradition cards
      ForEach(filteredTraditions) { tradition in
        TraditionCard(tradition: tradition) {
          selectedTradition = tradition
        }
      }
    }
    .padding(16)
    .background(
      RoundedRectangle(cornerRadius: 16, style: .continuous)
        .fill(Color.white.opacity(0.03))
        .overlay(
          RoundedRectangle(cornerRadius: 16, style: .continuous)
            .stroke(Palette.accent.gold.opacity(0.2), lineWidth: 1)
        )
    )
  }

  // MARK: - Forbidden Gospels Section

  private var forbiddenGospelsSection: some View {
    VStack(alignment: .leading, spacing: 14) {
      // Section header
      HStack {
        Image(systemName: "lock.open.trianglebadge.exclamationmark")
          .font(.system(size: 18, weight: .bold))
          .foregroundColor(Color.red)

        Text("FORBIDDEN GOSPELS")
          .font(.system(size: 13, weight: .bold, design: .rounded))
          .tracking(2)
          .foregroundColor(Color.red)

        Spacer()

        Text("HIDDEN")
          .font(.system(size: 8, weight: .bold))
          .foregroundColor(.white)
          .padding(.horizontal, 6)
          .padding(.vertical, 2)
          .background(Color.red.opacity(0.8))
          .cornerRadius(4)
      }

      Text("The gospels they banned — not because they were fake, but because they were too free")
        .font(.system(size: 14, weight: .medium, design: .rounded))
        .foregroundColor(Palette.text.secondary)

      // Dragon quote
      HStack(alignment: .top, spacing: 10) {
        Text("🐉")
          .font(.system(size: 16))

        Text(
          "\"They hid this truth from everyone. Not all gospels were written to be read. Some were written — and that is why they were hidden.\""
        )
        .font(.system(size: 12, weight: .medium, design: .rounded))
        .italic()
        .foregroundColor(Color.red.opacity(0.8))
        .lineSpacing(3)
      }
      .padding(10)
      .background(
        RoundedRectangle(cornerRadius: 10, style: .continuous)
          .fill(Color.red.opacity(0.08))
      )

      // CTA Button
      Button(action: {
        HapticManager.shared.heavy()
        showForbiddenGospels = true
      }) {
        HStack(spacing: 12) {
          ZStack {
            Circle()
              .fill(
                LinearGradient(
                  colors: [Color.red, Color(red: 0.6, green: 0.1, blue: 0.1)],
                  startPoint: .topLeading,
                  endPoint: .bottomTrailing
                )
              )
              .frame(width: 44, height: 44)

            Image(systemName: "book.closed.fill")
              .font(.system(size: 20))
              .foregroundColor(.white)
          }

          VStack(alignment: .leading, spacing: 3) {
            Text("EXPLORE THE FORBIDDEN TEXTS")
              .font(.system(size: 13, weight: .bold, design: .rounded))
              .foregroundColor(.white)
            Text("Thomas • Mary Magdalene • Philip • Judas")
              .font(.system(size: 10, weight: .medium))
              .foregroundColor(Color.red.opacity(0.7))
          }

          Spacer()

          Image(systemName: "chevron.right")
            .font(.system(size: 14, weight: .semibold))
            .foregroundColor(Color.red.opacity(0.6))
        }
        .padding(14)
        .background(
          RoundedRectangle(cornerRadius: 12, style: .continuous)
            .fill(Color.red.opacity(0.12))
            .overlay(
              RoundedRectangle(cornerRadius: 12, style: .continuous)
                .stroke(Color.red.opacity(0.3), lineWidth: 1)
            )
        )
      }
      .buttonStyle(ScaleButtonStyle())
    }
    .padding(16)
    .background(
      RoundedRectangle(cornerRadius: 16, style: .continuous)
        .fill(Color.white.opacity(0.03))
        .overlay(
          RoundedRectangle(cornerRadius: 16, style: .continuous)
            .stroke(Color.red.opacity(0.2), lineWidth: 1)
        )
    )
    .sheet(isPresented: $showForbiddenGospels) {
      ForbiddenGospelsView()
    }
  }

  // MARK: - Hidden Knowledge Section

  private var hiddenKnowledgeSection: some View {
    VStack(alignment: .leading, spacing: 16) {
      // Section header
      HStack {
        Image(systemName: "eye.slash.fill")
          .font(.system(size: 18, weight: .bold))
          .foregroundColor(Palette.primary.cyan)

        Text("HIDDEN KNOWLEDGE")
          .font(.system(size: 13, weight: .bold, design: .rounded))
          .tracking(2)
          .foregroundColor(Palette.primary.cyan)

        Spacer()
      }

      Text("What they don't teach in school")
        .font(.system(size: 14, weight: .medium, design: .rounded))
        .foregroundColor(Palette.text.secondary)

      // Featured: Gnostic Library
      NavigationLink(destination: GnosticLibraryView()) {
        HStack(spacing: 14) {
          ZStack {
            Circle()
              .fill(
                LinearGradient(
                  colors: [.purple, .blue],
                  startPoint: .topLeading,
                  endPoint: .bottomTrailing
                )
              )
              .frame(width: 50, height: 50)

            Image(systemName: "books.vertical.fill")
              .font(.system(size: 22))
              .foregroundColor(.white)
          }

          VStack(alignment: .leading, spacing: 4) {
            HStack {
              Text("THE GNOSTIC LIBRARY")
                .font(.system(size: 14, weight: .bold, design: .rounded))
                .foregroundColor(.white)

              Text("NEW")
                .font(.system(size: 8, weight: .bold))
                .foregroundColor(.white)
                .padding(.horizontal, 6)
                .padding(.vertical, 2)
                .background(Color.purple)
                .cornerRadius(4)
            }

            Text("Complete texts, cosmology & sacred links")
              .font(.system(size: 11, weight: .medium, design: .rounded))
              .foregroundColor(Palette.text.secondary)

            Text("Apocryphon of John • Gospel of Thomas • Pistis Sophia & more")
              .font(.system(size: 9, weight: .medium))
              .foregroundColor(.purple.opacity(0.8))
          }

          Spacer()

          Image(systemName: "chevron.right")
            .font(.system(size: 14))
            .foregroundColor(.purple)
        }
        .padding(14)
        .background(
          RoundedRectangle(cornerRadius: 12, style: .continuous)
            .fill(Color.purple.opacity(0.15))
            .overlay(
              RoundedRectangle(cornerRadius: 12, style: .continuous)
                .stroke(Color.purple.opacity(0.3), lineWidth: 1)
            )
        )
      }

      // Featured: History Debugged
      NavigationLink(destination: HistoryDebuggedView()) {
        HStack(spacing: 14) {
          ZStack {
            Circle()
              .fill(
                LinearGradient(
                  colors: [.orange, .red],
                  startPoint: .topLeading,
                  endPoint: .bottomTrailing
                )
              )
              .frame(width: 50, height: 50)

            Image(systemName: "clock.arrow.circlepath")
              .font(.system(size: 22))
              .foregroundColor(.white)
          }

          VStack(alignment: .leading, spacing: 4) {
            HStack {
              Text("HISTORY DEBUGGED")
                .font(.system(size: 14, weight: .bold, design: .rounded))
                .foregroundColor(.white)

              Text("NEW")
                .font(.system(size: 8, weight: .bold))
                .foregroundColor(.white)
                .padding(.horizontal, 6)
                .padding(.vertical, 2)
                .background(Color.orange)
                .cornerRadius(4)
            }

            Text("The OS upgrade for your worldview")
              .font(.system(size: 11, weight: .medium, design: .rounded))
              .foregroundColor(Palette.text.secondary)

            Text("Columbus • Thanksgiving • Founding Fathers • Dark Ages & more")
              .font(.system(size: 9, weight: .medium))
              .foregroundColor(.orange.opacity(0.8))
          }

          Spacer()

          Image(systemName: "chevron.right")
            .font(.system(size: 14))
            .foregroundColor(.orange)
        }
        .padding(14)
        .background(
          RoundedRectangle(cornerRadius: 12, style: .continuous)
            .fill(Color.orange.opacity(0.15))
            .overlay(
              RoundedRectangle(cornerRadius: 12, style: .continuous)
                .stroke(Color.orange.opacity(0.3), lineWidth: 1)
            )
        )
      }

      // Tradition cards
      ForEach(LibraryCategory.hiddenKnowledge.traditions) { tradition in
        TraditionCard(tradition: tradition) {
          selectedTradition = tradition
        }
      }
    }
    .padding(16)
    .background(
      RoundedRectangle(cornerRadius: 16, style: .continuous)
        .fill(Color.white.opacity(0.03))
        .overlay(
          RoundedRectangle(cornerRadius: 16, style: .continuous)
            .stroke(Palette.primary.cyan.opacity(0.2), lineWidth: 1)
        )
    )
  }

  // MARK: - Coming Soon

  private var comingSoonSection: some View {
    VStack(spacing: 12) {
      comingSoonCard(
        icon: "brain.head.profile",
        title: "Consciousness Studies",
        description: "The science of awakening",
        gradient: [Palette.primary.violet, Palette.primary.blue]
      )

      comingSoonCard(
        icon: "eye.fill",
        title: "Pattern Recognition",
        description: "Learn to see through the programming",
        gradient: [Palette.primary.cyan, Palette.accent.cyan]
      )
    }
  }

  private func comingSoonCard(icon: String, title: String, description: String, gradient: [Color])
    -> some View
  {
    HStack(spacing: 14) {
      Image(systemName: icon)
        .font(.system(size: 22, weight: .semibold))
        .foregroundStyle(
          LinearGradient(colors: gradient, startPoint: .topLeading, endPoint: .bottomTrailing)
        )
        .frame(width: 44, height: 44)
        .background(
          Circle()
            .fill(gradient[0].opacity(0.15))
        )

      VStack(alignment: .leading, spacing: 4) {
        Text(title)
          .font(.system(size: 16, weight: .bold, design: .rounded))
          .foregroundColor(Palette.text.primary)

        Text(description)
          .font(.system(size: 13, weight: .medium, design: .rounded))
          .foregroundColor(Palette.text.secondary)
      }

      Spacer()

      Text("SOON")
        .font(.system(size: 10, weight: .bold, design: .rounded))
        .tracking(1)
        .foregroundColor(Palette.text.muted)
        .padding(.horizontal, 8)
        .padding(.vertical, 4)
        .background(
          Capsule()
            .fill(Color.white.opacity(0.1))
        )
    }
    .padding(16)
    .background(
      RoundedRectangle(cornerRadius: 14, style: .continuous)
        .fill(Color.white.opacity(0.03))
        .overlay(
          RoundedRectangle(cornerRadius: 14, style: .continuous)
            .stroke(gradient[0].opacity(0.15), lineWidth: 1)
        )
    )
    .opacity(0.6)
  }

  // MARK: - Background

  private var cosmicBackground: some View {
    ZStack {
      PaletteGradients.cosmicBackground
        .ignoresSafeArea()

      // Ancient library dust particles
      ForEach(0..<50, id: \.self) { _ in
        Circle()
          .fill(
            LinearGradient(
              colors: [
                Palette.accent.gold.opacity(Double.random(in: 0.2...0.5)),
                Palette.primary.orange.opacity(Double.random(in: 0.2...0.5)),
              ],
              startPoint: .topLeading,
              endPoint: .bottomTrailing
            )
          )
          .frame(width: CGFloat.random(in: 1...2), height: CGFloat.random(in: 1...2))
          .position(
            x: CGFloat.random(in: 0...UIScreen.main.bounds.width),
            y: CGFloat.random(in: 0...UIScreen.main.bounds.height)
          )
          .blur(radius: Double.random(in: 0.5...1))
      }
    }
  }
}

// MARK: - Tradition Card

struct TraditionCard: View {
  let tradition: TextTradition
  let onTap: () -> Void

  var body: some View {
    HStack(spacing: 14) {
      // Icon
      ZStack {
        Circle()
          .fill(tradition.color.opacity(0.2))
          .frame(width: 48, height: 48)

        Image(systemName: tradition.icon)
          .font(.system(size: 20, weight: .semibold))
          .foregroundColor(tradition.color)
      }

      // Info
      VStack(alignment: .leading, spacing: 4) {
        Text(tradition.name)
          .font(.system(size: 16, weight: .bold, design: .rounded))
          .foregroundColor(Palette.text.primary)
          .lineLimit(1)

        Text(tradition.subtitle)
          .font(.system(size: 12, weight: .medium, design: .rounded))
          .foregroundColor(tradition.color.opacity(0.9))
          .lineLimit(1)
      }

      Spacer()

      // Text count
      VStack(alignment: .trailing, spacing: 2) {
        Text("\(tradition.texts.count)")
          .font(.system(size: 16, weight: .bold, design: .rounded))
          .foregroundColor(tradition.color)

        Text("texts")
          .font(.system(size: 10, weight: .medium, design: .rounded))
          .foregroundColor(Palette.text.muted)
      }

      Image(systemName: "chevron.right")
        .font(.system(size: 12, weight: .semibold))
        .foregroundColor(Palette.text.muted)
    }
    .padding(14)
    .background(
      RoundedRectangle(cornerRadius: 12, style: .continuous)
        .fill(Color.white.opacity(0.05))
        .overlay(
          RoundedRectangle(cornerRadius: 12, style: .continuous)
            .stroke(tradition.color.opacity(0.2), lineWidth: 1)
        )
    )
    .onTapGesture {
      HapticManager.shared.cardFlip()
      onTap()
    }
  }
}

// MARK: - Tradition Detail View

struct TraditionDetailView: View {
  let tradition: TextTradition
  let onTextTap: (SacredText) -> Void
  let onDismiss: () -> Void

  var body: some View {
    ZStack {
      // Background
      LinearGradient(
        colors: [Color.black, Color(red: 0.05, green: 0.03, blue: 0.1), Color.black],
        startPoint: .top,
        endPoint: .bottom
      )
      .ignoresSafeArea()

      VStack(spacing: 0) {
        // Custom header bar
        HStack {
          Spacer()
          Button(action: onDismiss) {
            Image(systemName: "xmark.circle.fill")
              .font(.system(size: 28))
              .foregroundColor(Palette.text.secondary)
          }
        }
        .padding(.horizontal, 20)
        .padding(.top, 16)
        .padding(.bottom, 8)

        ScrollView {
          VStack(alignment: .leading, spacing: 24) {
            // Header
            traditionHeader

            // Description
            Text(tradition.description)
              .font(.system(size: 15, weight: .regular, design: .rounded))
              .foregroundColor(Palette.text.primary.opacity(0.9))
              .lineSpacing(6)

            // Period badge
            HStack {
              Image(systemName: "clock.fill")
                .font(.system(size: 12))
              Text(tradition.period)
                .font(.system(size: 12, weight: .medium, design: .rounded))
            }
            .foregroundColor(tradition.color)
            .padding(.horizontal, 12)
            .padding(.vertical, 6)
            .background(
              Capsule()
                .fill(tradition.color.opacity(0.15))
            )

            // Texts Section
            textsSection

            // Significance
            significanceSection

            // Dragon Comment
            dragonSection

            Spacer(minLength: 40)
          }
          .padding(.horizontal, 20)
        }
      }
    }
  }

  private var traditionHeader: some View {
    VStack(spacing: 12) {
      ZStack {
        Circle()
          .fill(
            RadialGradient(
              colors: [tradition.color.opacity(0.4), tradition.color.opacity(0.05)],
              center: .center,
              startRadius: 0,
              endRadius: 50
            )
          )
          .frame(width: 80, height: 80)

        Image(systemName: tradition.icon)
          .font(.system(size: 36, weight: .semibold))
          .foregroundColor(tradition.color)
      }
      .shadow(color: tradition.color.opacity(0.4), radius: 15)

      Text(tradition.name)
        .font(.system(size: 26, weight: .bold, design: .rounded))
        .foregroundColor(Palette.text.primary)
        .multilineTextAlignment(.center)

      Text(tradition.subtitle)
        .font(.system(size: 14, weight: .medium, design: .rounded))
        .foregroundColor(tradition.color)
    }
    .frame(maxWidth: .infinity)
  }

  private var textsSection: some View {
    VStack(alignment: .leading, spacing: 14) {
      HStack {
        Text("📚 TEXTS")
          .font(.system(size: 12, weight: .bold, design: .rounded))
          .tracking(2)
          .foregroundColor(Palette.accent.gold)

        Spacer()

        Text("\(tradition.texts.count) available")
          .font(.system(size: 11, weight: .medium, design: .rounded))
          .foregroundColor(Palette.text.muted)
      }

      ForEach(tradition.texts) { text in
        SacredTextCard(text: text) {
          onTextTap(text)
        }
      }
    }
  }

  private var significanceSection: some View {
    VStack(alignment: .leading, spacing: 10) {
      Text("✨ SIGNIFICANCE")
        .font(.system(size: 12, weight: .bold, design: .rounded))
        .tracking(2)
        .foregroundColor(Palette.primary.violet)

      Text(tradition.significance)
        .font(.system(size: 14, weight: .regular, design: .rounded))
        .foregroundColor(Palette.text.primary.opacity(0.9))
        .lineSpacing(5)
    }
    .padding(16)
    .background(
      RoundedRectangle(cornerRadius: 12, style: .continuous)
        .fill(Palette.primary.violet.opacity(0.1))
        .overlay(
          RoundedRectangle(cornerRadius: 12, style: .continuous)
            .stroke(Palette.primary.violet.opacity(0.25), lineWidth: 1)
        )
    )
  }

  private var dragonSection: some View {
    HStack(alignment: .top, spacing: 12) {
      Text("🐉")
        .font(.system(size: 22))

      Text(tradition.dragonComment)
        .font(.system(size: 14, weight: .medium, design: .rounded))
        .italic()
        .foregroundColor(Palette.accent.gold)
        .lineSpacing(5)
    }
    .padding(16)
    .background(
      RoundedRectangle(cornerRadius: 12, style: .continuous)
        .fill(Palette.accent.gold.opacity(0.1))
        .overlay(
          RoundedRectangle(cornerRadius: 12, style: .continuous)
            .stroke(Palette.accent.gold.opacity(0.3), lineWidth: 1)
        )
    )
  }
}

// MARK: - Sacred Text Card

struct SacredTextCard: View {
  let text: SacredText
  let onTap: () -> Void

  var body: some View {
    VStack(alignment: .leading, spacing: 12) {
      HStack(spacing: 12) {
        // Icon
        ZStack {
          Circle()
            .fill(text.color.opacity(0.2))
            .frame(width: 44, height: 44)

          Image(systemName: text.icon)
            .font(.system(size: 18, weight: .semibold))
            .foregroundColor(text.color)
        }

        VStack(alignment: .leading, spacing: 4) {
          Text(text.name)
            .font(.system(size: 16, weight: .bold, design: .rounded))
            .foregroundColor(Palette.text.primary)

          Text(text.period)
            .font(.system(size: 11, weight: .medium, design: .rounded))
            .foregroundColor(Palette.text.muted)
        }

        Spacer()

        // Importance badge
        Text(text.importance.rawValue)
          .font(.system(size: 9, weight: .bold, design: .rounded))
          .tracking(0.5)
          .foregroundColor(text.importance.color)
          .padding(.horizontal, 8)
          .padding(.vertical, 4)
          .background(
            Capsule()
              .fill(text.importance.color.opacity(0.15))
          )
      }

      // Summary preview
      Text(text.summary)
        .font(.system(size: 13, weight: .regular, design: .rounded))
        .foregroundColor(Palette.text.secondary)
        .lineSpacing(4)
        .lineLimit(3)

      // Tap to read
      HStack {
        Spacer()
        HStack(spacing: 4) {
          Text("Read Full Text")
            .font(.system(size: 12, weight: .bold, design: .rounded))
          Image(systemName: "arrow.right")
            .font(.system(size: 11, weight: .bold))
        }
        .foregroundColor(text.color)
      }
    }
    .padding(14)
    .background(
      RoundedRectangle(cornerRadius: 14, style: .continuous)
        .fill(Color.white.opacity(0.05))
        .overlay(
          RoundedRectangle(cornerRadius: 14, style: .continuous)
            .stroke(text.color.opacity(0.2), lineWidth: 1)
        )
    )
    .onTapGesture {
      HapticManager.shared.textOpened()
      onTap()
    }
  }
}

// MARK: - Sacred Text Detail View

struct SacredTextDetailView: View {
  let text: SacredText
  let onDismiss: () -> Void

  @State private var selectedTab = 0

  var body: some View {
    ZStack {
      Color.black.ignoresSafeArea()

      VStack(spacing: 0) {
        // Custom header bar
        HStack {
          Spacer()
          Button(action: onDismiss) {
            Image(systemName: "xmark.circle.fill")
              .font(.system(size: 28))
              .foregroundColor(Palette.text.secondary)
          }
        }
        .padding(.horizontal, 20)
        .padding(.top, 16)
        .padding(.bottom, 8)

        ScrollView {
          VStack(alignment: .leading, spacing: 24) {
            // Header
            textHeader

            // Tab selector
            tabSelector

            // Content based on tab
            switch selectedTab {
            case 0:
              summaryTab
            case 1:
              keyTeachingsTab
            case 2:
              whatTheyBuriedTab
            case 3:
              fullTextTab
            default:
              summaryTab
            }

            // Dragon comment (always visible)
            dragonComment

            Spacer(minLength: 40)
          }
          .padding(.horizontal, 20)
        }
      }
    }
  }

  // MARK: - Text Header

  private var textHeader: some View {
    VStack(spacing: 14) {
      ZStack {
        Circle()
          .fill(
            RadialGradient(
              colors: [text.color.opacity(0.4), text.color.opacity(0.05)],
              center: .center,
              startRadius: 0,
              endRadius: 50
            )
          )
          .frame(width: 80, height: 80)

        Image(systemName: text.icon)
          .font(.system(size: 36, weight: .semibold))
          .foregroundColor(text.color)
      }
      .shadow(color: text.color.opacity(0.4), radius: 15)

      Text(text.name)
        .font(.system(size: 26, weight: .bold, design: .rounded))
        .foregroundColor(Palette.text.primary)
        .multilineTextAlignment(.center)

      // Alternate names
      if !text.alternateNames.isEmpty {
        Text(text.alternateNames.joined(separator: " • "))
          .font(.system(size: 12, weight: .medium, design: .rounded))
          .foregroundColor(Palette.text.muted)
          .multilineTextAlignment(.center)
      }

      // Period and importance
      HStack(spacing: 12) {
        HStack(spacing: 4) {
          Image(systemName: "clock.fill")
            .font(.system(size: 11))
          Text(text.period)
            .font(.system(size: 12, weight: .medium, design: .rounded))
        }
        .foregroundColor(Palette.text.secondary)

        Text(text.importance.rawValue)
          .font(.system(size: 10, weight: .bold, design: .rounded))
          .tracking(0.5)
          .foregroundColor(text.importance.color)
          .padding(.horizontal, 10)
          .padding(.vertical, 5)
          .background(
            Capsule()
              .fill(text.importance.color.opacity(0.15))
          )
      }
    }
    .frame(maxWidth: .infinity)
  }

  // MARK: - Tab Selector

  private var tabSelector: some View {
    ScrollView(.horizontal, showsIndicators: false) {
      HStack(spacing: 8) {
        tabButton(title: "Summary", index: 0)
        tabButton(title: "Key Teachings", index: 1)
        tabButton(title: "What They Buried", index: 2)
        tabButton(title: "Full Text", index: 3)
      }
      .padding(.horizontal, 4)
    }
  }

  private func tabButton(title: String, index: Int) -> some View {
    Button {
      withAnimation(.easeInOut(duration: 0.2)) {
        selectedTab = index
      }
    } label: {
      Text(title)
        .font(.system(size: 13, weight: selectedTab == index ? .bold : .medium, design: .rounded))
        .foregroundColor(selectedTab == index ? .black : Palette.text.secondary)
        .padding(.horizontal, 14)
        .padding(.vertical, 8)
        .background(
          Capsule()
            .fill(selectedTab == index ? text.color : Color.white.opacity(0.1))
        )
    }
  }

  // MARK: - Summary Tab

  private var summaryTab: some View {
    VStack(alignment: .leading, spacing: 16) {
      sectionHeader(title: "SUMMARY", icon: "doc.text.fill", color: text.color)

      Text(text.summary)
        .font(.system(size: 15, weight: .regular, design: .rounded))
        .foregroundColor(Palette.text.primary.opacity(0.9))
        .lineSpacing(6)
    }
  }

  // MARK: - Key Teachings Tab

  private var keyTeachingsTab: some View {
    VStack(alignment: .leading, spacing: 16) {
      sectionHeader(title: "KEY TEACHINGS", icon: "lightbulb.fill", color: Palette.accent.gold)

      ForEach(Array(text.keyTeachings.enumerated()), id: \.offset) { index, teaching in
        HStack(alignment: .top, spacing: 12) {
          Text("\(index + 1)")
            .font(.system(size: 12, weight: .bold, design: .rounded))
            .foregroundColor(Palette.accent.gold)
            .frame(width: 24, height: 24)
            .background(
              Circle()
                .fill(Palette.accent.gold.opacity(0.2))
            )

          Text(teaching)
            .font(.system(size: 14, weight: .regular, design: .rounded))
            .foregroundColor(Palette.text.primary.opacity(0.9))
            .lineSpacing(4)
        }
      }
    }
  }

  // MARK: - What They Buried Tab

  private var whatTheyBuriedTab: some View {
    VStack(alignment: .leading, spacing: 16) {
      sectionHeader(title: "WHAT THEY BURIED", icon: "eye.slash.fill", color: Palette.primary.red)

      Text(text.whatTheyBuried)
        .font(.system(size: 15, weight: .regular, design: .rounded))
        .foregroundColor(Palette.text.primary.opacity(0.9))
        .lineSpacing(6)
        .padding(16)
        .background(
          RoundedRectangle(cornerRadius: 12, style: .continuous)
            .fill(Palette.primary.red.opacity(0.1))
            .overlay(
              RoundedRectangle(cornerRadius: 12, style: .continuous)
                .stroke(Palette.primary.red.opacity(0.25), lineWidth: 1)
            )
        )
    }
  }

  // MARK: - Full Text Tab

  private var fullTextTab: some View {
    VStack(alignment: .leading, spacing: 16) {
      sectionHeader(title: "TEXT PREVIEW", icon: "scroll.fill", color: Palette.primary.violet)

      Text(text.fullTextPreview)
        .font(.system(size: 14, weight: .regular, design: .serif))
        .foregroundColor(Palette.text.primary.opacity(0.85))
        .lineSpacing(8)
        .italic()
        .padding(16)
        .background(
          RoundedRectangle(cornerRadius: 12, style: .continuous)
            .fill(Color.white.opacity(0.03))
            .overlay(
              RoundedRectangle(cornerRadius: 12, style: .continuous)
                .stroke(Palette.primary.violet.opacity(0.2), lineWidth: 1)
            )
        )

      if text.fullTextAvailable {
        HStack {
          Spacer()

          Text("Full text available in future update")
            .font(.system(size: 12, weight: .medium, design: .rounded))
            .foregroundColor(Palette.text.muted)

          Spacer()
        }
      }
    }
  }

  // MARK: - Dragon Comment

  private var dragonComment: some View {
    HStack(alignment: .top, spacing: 12) {
      Text("🐉")
        .font(.system(size: 22))

      Text(text.dragonComment)
        .font(.system(size: 14, weight: .medium, design: .rounded))
        .italic()
        .foregroundColor(Palette.accent.gold)
        .lineSpacing(5)
    }
    .padding(16)
    .background(
      RoundedRectangle(cornerRadius: 12, style: .continuous)
        .fill(Palette.accent.gold.opacity(0.1))
        .overlay(
          RoundedRectangle(cornerRadius: 12, style: .continuous)
            .stroke(Palette.accent.gold.opacity(0.3), lineWidth: 1)
        )
    )
  }

  private func sectionHeader(title: String, icon: String, color: Color) -> some View {
    HStack(spacing: 8) {
      Image(systemName: icon)
        .font(.system(size: 14, weight: .bold))
        .foregroundColor(color)

      Text(title)
        .font(.system(size: 12, weight: .bold, design: .rounded))
        .tracking(2)
        .foregroundColor(color)
    }
  }
}
