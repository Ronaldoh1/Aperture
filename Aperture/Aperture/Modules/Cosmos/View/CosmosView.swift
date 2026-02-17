// CosmosView.swift

import SwiftUI

// MARK: - Cosmos View

struct CosmosView: View {
  @StateObject private var presenterBox: CosmosPresenterBox

  // Scroll & Navigation State
  @State private var scrollOffset: CGFloat = 0
  @State private var currentRealmIndex: Int = 0
  @State private var selectedRealm: CosmicRealm?
  @State private var selectedEntity: CosmicEntity?
  @State private var standaloneEntityRealm: CosmicRealm? = nil  // For entities not in a realm
  @State private var showAlternativeTraditions: Bool = false  // For the Canonical vs. Alternative Traditions list
  @State private var showReligionDecoded: Bool = false  // Beyond the Veil feature

  // NEW: Segmented control state
  @State private var selectedSection: CosmosSection = .spheres
  @State private var expandedSections: Set<String> = []
  @State private var scrollProxy: ScrollViewProxy?

  private let realms = CosmicRealm.realmsTopToBottom  // Pleroma at top, Earth at bottom

  private var presenter: CosmosPresenterType {
    presenterBox.presenter
  }

  init(presenter: CosmosPresenterType) {
    _presenterBox = StateObject(wrappedValue: CosmosPresenterBox(presenter: presenter))
  }

  var body: some View {
    NavigationStack {
      ZStack {
        cosmicBackground

        VStack(spacing: 0) {
          // NEW: Segmented control at top
          CosmosSegmentedControl(selectedSection: $selectedSection)
            .padding(.top, 8)
            .padding(.bottom, 12)

          HStack(spacing: 0) {
            // Main Scroll Content
            realmScrollView

            // Tappable Mini Map
            TappableMiniMap(
              realms: realms,
              currentRealmIndex: currentRealmIndex,
              onRealmTap: { _, realmId in
                scrollToSection(realmId: realmId)
              }
            )
            .frame(width: 60)
          }
        }
      }
      .navigationTitle("Cosmos")
      .navigationBarTitleDisplayMode(.inline)
      .sheet(item: $selectedEntity) { entity in
        EntityDetailView(entity: entity, realm: selectedRealm) {
          selectedEntity = nil
        }
      }
      .sheet(isPresented: $showAlternativeTraditions) {
        AlternativeTraditionsListView {
          showAlternativeTraditions = false
        }
      }
      .fullScreenCover(isPresented: $showReligionDecoded) {
        ReligionDecodedView()
      }
    }
    .onAppear {
      presenter.viewDidLoad()
    }
    .withModuleTutorial(.cosmos)
  }

  // MARK: - Realm Scroll View

  private var realmScrollView: some View {
    ScrollViewReader { proxy in
      ScrollView(.vertical, showsIndicators: false) {
        VStack(spacing: 0) {
          // Scroll-to-top anchor
          Color.clear
            .frame(height: 0)
            .id("cosmosTop")

          // Header (adapts to selected section)
          cosmosHeader
            .padding(.top, 20)
            .padding(.bottom, 32)

          // BEYOND THE VEIL - Featured Discovery
          ReligionDecodedInvitationCard {
            showReligionDecoded = true
          }
          .padding(.bottom, 24)

          // SPHERES SECTION (filtered by segmented control)
          spheresSection

          // THE DEMONIZED ONES
          demonizedSection

          // THE LIES THEY TOLD
          liesSection

          // ANGELS - The Truth
          angelsSection

          // Dragon context chip removed - module deprecated

          Spacer(minLength: 100)
        }
        .padding(.horizontal, 16)
        .id(selectedSection)  // Force full re-layout when tab changes
      }
      .coordinateSpace(name: "cosmosScroll")
      .onAppear {
        scrollProxy = proxy
      }
      .onChange(of: selectedSection) { _, _ in
        // Reset scroll to top and collapse any expanded realm on tab switch
        selectedRealm = nil
        withAnimation(.easeOut(duration: 0.15)) {
          proxy.scrollTo("cosmosTop", anchor: .top)
        }
      }
    }
  }

  // MARK: - Extracted Sections (for type-check optimization)

  @ViewBuilder
  private var spheresSection: some View {
    if selectedSection == .spheres || selectedSection == .entities {
      realmsListSection

      // Footer - You Are Here
      youAreHereFooter
        .padding(.top, 40)
    }
  }

  @ViewBuilder
  private var realmsListSection: some View {
    let realmsList: [CosmicRealm] = Array(realms)
    VStack(spacing: 0) {
      realmCard(for: realmsList, at: 0)
      realmCard(for: realmsList, at: 1)
      realmCard(for: realmsList, at: 2)
      realmCard(for: realmsList, at: 3)
      realmCard(for: realmsList, at: 4)
      realmCard(for: realmsList, at: 5)
      realmCard(for: realmsList, at: 6)
      realmCard(for: realmsList, at: 7)
      realmCard(for: realmsList, at: 8)
      realmCard(for: realmsList, at: 9)
    }
  }

  @ViewBuilder
  private func realmCard(for realmsList: [CosmicRealm], at index: Int) -> some View {
    if index < realmsList.count {
      let realm: CosmicRealm = realmsList[index]
      RealmCard(
        realm: realm,
        isExpanded: selectedRealm?.id == realm.id,
        onTap: {
          withAnimation(.spring(response: 0.4, dampingFraction: 0.8)) {
            if selectedRealm?.id == realm.id {
              selectedRealm = nil
            } else {
              selectedRealm = realm
            }
          }
        },
        onEntityTap: { entity in
          selectedEntity = entity
          selectedRealm = realm
        }
      )
      .id(realm.id)
    }
  }

  @ViewBuilder
  private var demonizedSection: some View {
    if selectedSection == .entities || selectedSection == .liesAndTruths {
      demonizedOnesSection
        .padding(.top, 40)
        .id("demonized")
    }
  }

  @ViewBuilder
  private var liesSection: some View {
    if selectedSection == .liesAndTruths {
      liesTheyToldSection
        .padding(.top, 40)
        .id("lies")
    }
  }

  @ViewBuilder
  private var angelsSection: some View {
    if selectedSection == .entities || selectedSection == .liesAndTruths {
      angelsTruthSection
        .padding(.top, 40)
        .id("angels")
    }
  }

  // MARK: - Scroll To Section Helper

  private func scrollToSection(realmId: String) {
    guard let proxy = scrollProxy else { return }

    withAnimation(.spring(response: 0.4, dampingFraction: 0.8)) {
      proxy.scrollTo(realmId, anchor: .top)
    }
  }

  // MARK: - Cosmos Header

  private var cosmosHeader: some View {
    VStack(spacing: 16) {
      Text(cosmosHeaderLabel)
        .font(.system(size: 11, weight: .bold, design: .rounded))
        .tracking(4)
        .foregroundColor(cosmosHeaderAccent.opacity(0.7))

      Text(cosmosHeaderTitle)
        .font(.system(size: 32, weight: .bold, design: .rounded))
        .foregroundStyle(
          LinearGradient(
            colors: [Palette.text.primary, cosmosHeaderGradientEnd],
            startPoint: .top,
            endPoint: .bottom
          )
        )

      Text(cosmosHeaderSubtitle)
        .font(.system(size: 14, weight: .medium, design: .rounded))
        .foregroundColor(Palette.text.secondary)
        .multilineTextAlignment(.center)
        .lineSpacing(4)

      // Scroll indicator
      VStack(spacing: 6) {
        Image(systemName: "chevron.down")
        Image(systemName: "chevron.down")
          .opacity(0.5)
      }
      .font(.system(size: 12, weight: .light))
      .foregroundColor(cosmosHeaderAccent.opacity(0.6))
      .padding(.top, 8)
    }
  }

  // MARK: - Dynamic Header Properties

  private var cosmosHeaderLabel: String {
    switch selectedSection {
    case .spheres: return "GNOSTIC COSMOLOGY"
    case .liesAndTruths: return "CANONICAL VS. GNOSTIC"
    case .entities: return "COSMIC BEINGS"
    }
  }

  private var cosmosHeaderTitle: String {
    switch selectedSection {
    case .spheres: return "The Realms"
    case .liesAndTruths: return "Lies & Truths"
    case .entities: return "The Entities"
    }
  }

  private var cosmosHeaderSubtitle: String {
    switch selectedSection {
    case .spheres: return "Scroll through the dimensions.\nFrom Divine Fullness to Material Prison."
    case .liesAndTruths: return "What they said vs. what's real.\nFlip every label they gave you."
    case .entities: return "The beings across all realms.\nFrom Archons to Angels."
    }
  }

  private var cosmosHeaderAccent: Color {
    switch selectedSection {
    case .spheres: return Palette.accent.gold
    case .liesAndTruths: return Palette.primary.red
    case .entities: return Palette.primary.cyan
    }
  }

  private var cosmosHeaderGradientEnd: Color {
    switch selectedSection {
    case .spheres: return Palette.primary.violet
    case .liesAndTruths: return Palette.primary.red
    case .entities: return Palette.primary.cyan
    }
  }

  // MARK: - You Are Here Footer

  private var youAreHereFooter: some View {
    VStack(spacing: 20) {
      HStack(spacing: 12) {
        Circle()
          .fill(Palette.primary.cyan)
          .frame(width: 12, height: 12)
          .shadow(color: Palette.primary.cyan, radius: 6)

        Text("YOU ARE HERE")
          .font(.system(size: 13, weight: .bold, design: .rounded))
          .tracking(2)
          .foregroundColor(Palette.primary.cyan)

        Circle()
          .fill(Palette.primary.cyan)
          .frame(width: 12, height: 12)
          .shadow(color: Palette.primary.cyan, radius: 6)
      }

      Text("A divine spark temporarily\nexperiencing limitation")
        .font(.system(size: 14, weight: .medium, design: .rounded))
        .foregroundColor(Palette.text.secondary)
        .multilineTextAlignment(.center)

      // Dragon wisdom
      HStack(alignment: .top, spacing: 10) {
        Text("🐉☀️")
          .font(.system(size: 20))

        Text(
          "\"You didn't fall INTO this world. You came from ABOVE it. The journey isn't up - it's remembering.\""
        )
        .font(.system(size: 13, weight: .medium, design: .rounded))
        .italic()
        .foregroundColor(Palette.accent.gold)
        .lineSpacing(4)
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
    .padding(.horizontal, 20)
  }

  // MARK: - Mini Map

  private var miniMapView: some View {
    VStack(spacing: 0) {
      Spacer()

      VStack(spacing: 8) {
        Text("MAP")
          .font(.system(size: 9, weight: .bold, design: .rounded))
          .tracking(2)
          .foregroundColor(Palette.text.muted)

        // Realm dots
        VStack(spacing: 6) {
          ForEach(Array(realms.enumerated()), id: \.element.id) { index, realm in
            MiniMapDot(
              realm: realm,
              isActive: index == currentRealmIndex,
              isCurrent: realm.order == 0  // Earth is where user is
            )
          }
        }

        // Current realm label
        Text(realms[safe: currentRealmIndex]?.name ?? "")
          .font(.system(size: 8, weight: .bold, design: .rounded))
          .foregroundColor(realms[safe: currentRealmIndex]?.color ?? Palette.text.secondary)
          .lineLimit(1)
          .frame(width: 50)
      }
      .padding(.vertical, 16)
      .padding(.horizontal, 8)
      .background(
        RoundedRectangle(cornerRadius: 12, style: .continuous)
          .fill(Color.black.opacity(0.5))
          .overlay(
            RoundedRectangle(cornerRadius: 12, style: .continuous)
              .stroke(Palette.text.muted.opacity(0.3), lineWidth: 1)
          )
      )

      Spacer()
    }
    .padding(.trailing, 8)
  }

  // MARK: - Background

  private var cosmicBackground: some View {
    ZStack {
      // Base gradient
      LinearGradient(
        colors: [
          Color.black,
          Color(red: 0.05, green: 0.02, blue: 0.1),
          Color(red: 0.08, green: 0.05, blue: 0.15),
          Color.black,
        ],
        startPoint: .top,
        endPoint: .bottom
      )
      .ignoresSafeArea()

      // Stars
      ForEach(0..<100, id: \.self) { _ in
        Circle()
          .fill(Color.white.opacity(Double.random(in: 0.2...0.7)))
          .frame(width: CGFloat.random(in: 1...2.5))
          .position(
            x: CGFloat.random(in: 0...UIScreen.main.bounds.width),
            y: CGFloat.random(in: 0...UIScreen.main.bounds.height * 2)
          )
      }

      // Central glow
      RadialGradient(
        colors: [
          Palette.primary.violet.opacity(0.15),
          Color.clear,
        ],
        center: .center,
        startRadius: 0,
        endRadius: 300
      )
    }
  }

  // MARK: - The Demonized Ones Section

  private var demonizedOnesSection: some View {
    VStack(alignment: .leading, spacing: 16) {
      // Section Header
      VStack(spacing: 8) {
        Text("🔥 THE DEMONIZED ONES")
          .font(.system(size: 12, weight: .bold, design: .rounded))
          .tracking(3)
          .foregroundColor(Palette.primary.red)

        Text("Those They Lied About")
          .font(.system(size: 24, weight: .bold, design: .rounded))
          .foregroundColor(Palette.text.primary)

        Text("The light-bringers they made into monsters")
          .font(.system(size: 14, weight: .medium, design: .rounded))
          .foregroundColor(Palette.text.secondary)
      }
      .frame(maxWidth: .infinity)
      .padding(.bottom, 8)

      // Entity Cards
      ForEach(CosmicEntity.demonizedOnes) { entity in
        DemonizedEntityCard(entity: entity) {
          selectedEntity = entity
          standaloneEntityRealm = nil
        }
      }

      // CANONICAL VS. ALTERNATIVE TRADITIONS - Special navigation card
      AlternativeTraditionsCard {
        showAlternativeTraditions = true
      }

      // Dragon Comment
      HStack(alignment: .top, spacing: 10) {
        Text("🐉")
          .font(.system(size: 18))

        Text(
          "\"They took the light-bringers and called them demons. The teachers became tempters. The awakeners became the enemy. Flip EVERY label they gave you.\""
        )
        .font(.system(size: 13, weight: .medium, design: .rounded))
        .italic()
        .foregroundColor(Palette.accent.gold.opacity(0.9))
        .lineSpacing(4)
      }
      .padding(14)
      .background(
        RoundedRectangle(cornerRadius: 12, style: .continuous)
          .fill(Palette.accent.gold.opacity(0.08))
          .overlay(
            RoundedRectangle(cornerRadius: 12, style: .continuous)
              .stroke(Palette.accent.gold.opacity(0.25), lineWidth: 1)
          )
      )
    }
  }

  // MARK: - The Lies They Told Section

  private var liesTheyToldSection: some View {
    VStack(alignment: .leading, spacing: 16) {
      // Section Header
      VStack(spacing: 8) {
        Text("💀 THE LIES THEY TOLD")
          .font(.system(size: 12, weight: .bold, design: .rounded))
          .tracking(3)
          .foregroundColor(Palette.primary.red)

        Text("Hell, The Antichrist & Fear")
          .font(.system(size: 24, weight: .bold, design: .rounded))
          .foregroundColor(Palette.text.primary)

        Text("Control through manufactured terror")
          .font(.system(size: 14, weight: .medium, design: .rounded))
          .foregroundColor(Palette.text.secondary)
      }
      .frame(maxWidth: .infinity)
      .padding(.bottom, 8)

      // Hell Truth Card
      DemonizedEntityCard(entity: CosmicEntity.hellTruth) {
        selectedEntity = CosmicEntity.hellTruth
        standaloneEntityRealm = nil
      }

      // Antichrist Truth Card
      DemonizedEntityCard(entity: CosmicEntity.antichristTruth) {
        selectedEntity = CosmicEntity.antichristTruth
        standaloneEntityRealm = nil
      }

      // Dragon Comment
      HStack(alignment: .top, spacing: 10) {
        Text("🐉")
          .font(.system(size: 18))

        Text(
          "\"Hell isn't a place you go when you die. It's a state you're in when you don't know who you are. You might already be there. Gnosis is the way out. The fire isn't punishment - it's the burning of ignorance.\""
        )
        .font(.system(size: 13, weight: .medium, design: .rounded))
        .italic()
        .foregroundColor(Palette.accent.gold.opacity(0.9))
        .lineSpacing(4)
      }
      .padding(14)
      .background(
        RoundedRectangle(cornerRadius: 12, style: .continuous)
          .fill(Palette.accent.gold.opacity(0.08))
          .overlay(
            RoundedRectangle(cornerRadius: 12, style: .continuous)
              .stroke(Palette.accent.gold.opacity(0.25), lineWidth: 1)
          )
      )
    }
  }

  // MARK: - Angels Truth Section

  private var angelsTruthSection: some View {
    VStack(alignment: .leading, spacing: 16) {
      // Section Header
      VStack(spacing: 8) {
        Text("👼 ANGELS - THE TRUTH")
          .font(.system(size: 12, weight: .bold, design: .rounded))
          .tracking(3)
          .foregroundColor(Color.white)

        Text("Not What You Think")
          .font(.system(size: 24, weight: .bold, design: .rounded))
          .foregroundColor(Palette.text.primary)

        Text("Terrifying cosmic functions, not cute babies")
          .font(.system(size: 14, weight: .medium, design: .rounded))
          .foregroundColor(Palette.text.secondary)
      }
      .frame(maxWidth: .infinity)
      .padding(.bottom, 8)

      // Angel Cards
      ForEach(CosmicEntity.angelsTruth) { entity in
        DemonizedEntityCard(entity: entity) {
          selectedEntity = entity
          standaloneEntityRealm = nil
        }
      }

      // Dragon Comment
      HStack(alignment: .top, spacing: 10) {
        Text("🐉")
          .font(.system(size: 18))

        Text(
          "\"Biblical angels: wheels covered in eyes, six-winged beings on fire, four-faced creatures. 'Be not afraid' because people were TERRIFIED. Then someone drew a cute baby with wings and called it a day. 👼\""
        )
        .font(.system(size: 13, weight: .medium, design: .rounded))
        .italic()
        .foregroundColor(Palette.accent.gold.opacity(0.9))
        .lineSpacing(4)
      }
      .padding(14)
      .background(
        RoundedRectangle(cornerRadius: 12, style: .continuous)
          .fill(Palette.accent.gold.opacity(0.08))
          .overlay(
            RoundedRectangle(cornerRadius: 12, style: .continuous)
              .stroke(Palette.accent.gold.opacity(0.25), lineWidth: 1)
          )
      )
    }
  }
}
