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
    @State private var standaloneEntityRealm: CosmicRealm? = nil // For entities not in a realm
    @State private var showBiblicalLies: Bool = false // For the Lies of the Bible list
    
    private let realms = CosmicRealm.realmsTopToBottom // Pleroma at top, Earth at bottom
    
    private var presenter: CosmosPresenterType {
        presenterBox.presenter
    }
    
    init(presenter: CosmosPresenterType) {
        _presenterBox = StateObject(wrappedValue: CosmosPresenterBox(presenter: presenter))
    }
    
    var body: some View {
        
        NavigationView {
            
            ZStack {
                
                cosmicBackground
                
                HStack(spacing: 0) {
                    
                    // Main Scroll Content
                    realmScrollView
                    
                    // Mini Map
                    miniMapView
                        .frame(width: 60)
                    
                }
                
            }
            .navigationTitle("Cosmos")
            .navigationBarTitleDisplayMode(.inline)
            .sheet(item: $selectedEntity) { entity in
                EntityDetailView(entity: entity, realm: selectedRealm) {
                    selectedEntity = nil
                }
            }
            .sheet(isPresented: $showBiblicalLies) {
                BiblicalLiesListView {
                    showBiblicalLies = false
                }
            }
            
        }
        .onAppear {
            presenter.viewDidLoad()
        }
        
    }
    
    // MARK: - Realm Scroll View
    
    private var realmScrollView: some View {
        
        ScrollViewReader { proxy in
            
            ScrollView(.vertical, showsIndicators: false) {
                
                LazyVStack(spacing: 0) {
                    
                    // Header
                    cosmosHeader
                        .padding(.top, 20)
                        .padding(.bottom, 32)
                    
                    // Realms
                    ForEach(Array(realms.enumerated()), id: \.element.id) { index, realm in
                        
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
                        .background(
                            GeometryReader { geo -> Color in
                                DispatchQueue.main.async {
                                    let frame = geo.frame(in: .named("cosmosScroll"))
                                    let screenMid = UIScreen.main.bounds.height / 2
                                    
                                    if frame.minY < screenMid && frame.maxY > screenMid {
                                        if currentRealmIndex != index {
                                            currentRealmIndex = index
                                        }
                                    }
                                }
                                return Color.clear
                            }
                        )
                        
                    }
                    
                    // Footer - You Are Here
                    youAreHereFooter
                        .padding(.top, 40)
                    
                    // ═══════════════════════════════════════════════════════════
                    // THE DEMONIZED ONES - Those They Lied About
                    // ═══════════════════════════════════════════════════════════
                    
                    demonizedOnesSection
                        .padding(.top, 40)
                    
                    // ═══════════════════════════════════════════════════════════
                    // THE LIES THEY TOLD - Hell, Antichrist, etc.
                    // ═══════════════════════════════════════════════════════════
                    
                    liesTheyToldSection
                        .padding(.top, 40)
                    
                    // ═══════════════════════════════════════════════════════════
                    // ANGELS - The Truth
                    // ═══════════════════════════════════════════════════════════
                    
                    angelsTruthSection
                        .padding(.top, 40)
                    
                    Spacer(minLength: 100)
                    
                }
                .padding(.horizontal, 16)
                
            }
            .coordinateSpace(name: "cosmosScroll")
            
        }
        
    }
    
    // MARK: - Cosmos Header
    
    private var cosmosHeader: some View {
        
        VStack(spacing: 16) {
            
            Text("GNOSTIC COSMOLOGY")
                .font(.system(size: 11, weight: .bold, design: .rounded))
                .tracking(4)
                .foregroundColor(Palette.accent.gold.opacity(0.7))
            
            Text("The Realms")
                .font(.system(size: 32, weight: .bold, design: .rounded))
                .foregroundStyle(
                    LinearGradient(
                        colors: [Palette.text.primary, Palette.primary.violet],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
            
            Text("Scroll through the dimensions.\nFrom Divine Fullness to Material Prison.")
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
            .foregroundColor(Palette.accent.gold.opacity(0.6))
            .padding(.top, 8)
            
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
                
                Text("\"You didn't fall INTO this world. You came from ABOVE it. The journey isn't up - it's remembering.\"")
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
                            isCurrent: realm.order == 0 // Earth is where user is
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
                    Color.black
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            // Stars
            ForEach(0..<100, id: \.self) { i in
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
                    Color.clear
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
            
            // THE LIES OF THE BIBLE - Special navigation card
            BiblicalLiesNavigationCard {
                showBiblicalLies = true
            }
            
            // Dragon Comment
            HStack(alignment: .top, spacing: 10) {
                
                Text("🐉")
                    .font(.system(size: 18))
                
                Text("\"They took the light-bringers and called them demons. The teachers became tempters. The awakeners became the enemy. Flip EVERY label they gave you.\"")
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
                
                Text("\"Hell isn't a place you go when you die. It's a state you're in when you don't know who you are. You might already be there. Gnosis is the way out. The fire isn't punishment - it's the burning of ignorance.\"")
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
                
                Text("\"Biblical angels: wheels covered in eyes, six-winged beings on fire, four-faced creatures. 'Be not afraid' because people were TERRIFIED. Then someone drew a cute baby with wings and called it a day. 👼\"")
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

// MARK: - Demonized Entity Card

struct DemonizedEntityCard: View {
    
    let entity: CosmicEntity
    let onTap: () -> Void
    
    var body: some View {
        
        HStack(spacing: 14) {
            
            // Icon
            ZStack {
                
                Circle()
                    .fill(entity.color.opacity(0.2))
                    .frame(width: 50, height: 50)
                
                Image(systemName: entity.icon)
                    .font(.system(size: 22, weight: .semibold))
                    .foregroundColor(entity.color)
                
            }
            
            // Info
            VStack(alignment: .leading, spacing: 4) {
                
                Text(entity.name)
                    .font(.system(size: 17, weight: .bold, design: .rounded))
                    .foregroundColor(Palette.text.primary)
                
                Text(entity.titles.prefix(2).joined(separator: " • "))
                    .font(.system(size: 12, weight: .medium, design: .rounded))
                    .foregroundColor(entity.color)
                    .lineLimit(1)
                
            }
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .font(.system(size: 14, weight: .semibold))
                .foregroundColor(Palette.text.muted)
            
        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 14, style: .continuous)
                .fill(Color.white.opacity(0.05))
                .overlay(
                    RoundedRectangle(cornerRadius: 14, style: .continuous)
                        .stroke(entity.color.opacity(0.25), lineWidth: 1)
                )
        )
        .onTapGesture(perform: onTap)
        
    }
    
}

// MARK: - Mini Map Dot

struct MiniMapDot: View {
    
    let realm: CosmicRealm
    let isActive: Bool
    let isCurrent: Bool
    
    var body: some View {
        
        ZStack {
            
            // Outer glow when active
            if isActive {
                Circle()
                    .fill(realm.color.opacity(0.3))
                    .frame(width: 16, height: 16)
            }
            
            // Main dot
            Circle()
                .fill(isActive ? realm.color : realm.color.opacity(0.4))
                .frame(width: isActive ? 10 : 6, height: isActive ? 10 : 6)
            
            // Current location indicator
            if isCurrent {
                Circle()
                    .stroke(Palette.primary.cyan, lineWidth: 2)
                    .frame(width: 14, height: 14)
            }
            
        }
        .animation(.easeInOut(duration: 0.2), value: isActive)
        
    }
    
}

// MARK: - Realm Card

struct RealmCard: View {
    
    let realm: CosmicRealm
    let isExpanded: Bool
    let onTap: () -> Void
    let onEntityTap: (CosmicEntity) -> Void
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 0) {
            
            // Header (always visible)
            cardHeader
            
            // Expanded Content
            if isExpanded {
                expandedContent
            }
            
        }
        .background(cardBackground)
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .overlay(cardBorder)
        .shadow(color: realm.color.opacity(isExpanded ? 0.3 : 0.15), radius: isExpanded ? 20 : 10)
        .padding(.vertical, 8)
        .onTapGesture(perform: onTap)
        
    }
    
    // MARK: - Card Header
    
    private var cardHeader: some View {
        
        HStack(spacing: 14) {
            
            // Icon
            ZStack {
                
                Circle()
                    .fill(
                        RadialGradient(
                            colors: [realm.color.opacity(0.4), realm.color.opacity(0.1)],
                            center: .center,
                            startRadius: 0,
                            endRadius: 28
                        )
                    )
                    .frame(width: 56, height: 56)
                
                Image(systemName: realm.icon)
                    .font(.system(size: 24, weight: .semibold))
                    .foregroundColor(realm.color)
                
            }
            
            // Title & Subtitle
            VStack(alignment: .leading, spacing: 4) {
                
                HStack(spacing: 8) {
                    
                    Text("LEVEL \(realm.order)")
                        .font(.system(size: 10, weight: .bold, design: .monospaced))
                        .foregroundColor(realm.color.opacity(0.8))
                    
                    if realm.order == 0 {
                        Text("• YOU ARE HERE")
                            .font(.system(size: 9, weight: .bold, design: .rounded))
                            .foregroundColor(Palette.primary.cyan)
                    }
                    
                }
                
                Text(realm.name)
                    .font(.system(size: 20, weight: .bold, design: .rounded))
                    .foregroundColor(Palette.text.primary)
                
                Text(realm.subtitle)
                    .font(.system(size: 13, weight: .medium, design: .rounded))
                    .foregroundColor(Palette.text.secondary)
                
            }
            
            Spacer()
            
            // Chevron
            Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                .font(.system(size: 14, weight: .semibold))
                .foregroundColor(realm.color)
            
        }
        .padding(18)
        
    }
    
    // MARK: - Expanded Content
    
    private var expandedContent: some View {
        
        VStack(alignment: .leading, spacing: 16) {
            
            Divider()
                .background(realm.color.opacity(0.3))
            
            // Greek name
            if let greek = realm.greekName {
                Text(greek)
                    .font(.system(size: 13, weight: .medium, design: .rounded))
                    .italic()
                    .foregroundColor(realm.color.opacity(0.8))
            }
            
            // Description
            Text(realm.description)
                .font(.system(size: 14, weight: .regular, design: .rounded))
                .foregroundColor(Palette.text.secondary)
                .lineSpacing(5)
            
            // Significance
            VStack(alignment: .leading, spacing: 6) {
                
                Label("SIGNIFICANCE", systemImage: "sparkle")
                    .font(.system(size: 11, weight: .bold, design: .rounded))
                    .foregroundColor(Palette.accent.gold)
                
                Text(realm.significance)
                    .font(.system(size: 13, weight: .medium, design: .rounded))
                    .foregroundColor(Palette.text.primary.opacity(0.9))
                    .lineSpacing(4)
                
            }
            .padding(12)
            .background(
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .fill(Palette.accent.gold.opacity(0.08))
            )
            
            // Entities
            if !realm.entities.isEmpty {
                
                VStack(alignment: .leading, spacing: 10) {
                    
                    Text("BEINGS IN THIS REALM")
                        .font(.system(size: 11, weight: .bold, design: .rounded))
                        .foregroundColor(realm.color)
                        .tracking(1)
                    
                    ForEach(realm.entities) { entity in
                        
                        EntityRow(entity: entity, realmColor: realm.color)
                            .onTapGesture {
                                onEntityTap(entity)
                            }
                        
                    }
                    
                }
                
            }
            
            // Dragon Comment
            HStack(alignment: .top, spacing: 10) {
                
                Text("🐉")
                    .font(.system(size: 18))
                
                Text(realm.dragonComment)
                    .font(.system(size: 13, weight: .medium, design: .rounded))
                    .italic()
                    .foregroundColor(Palette.accent.gold.opacity(0.9))
                    .lineSpacing(4)
                
            }
            .padding(12)
            .background(
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .fill(Palette.accent.gold.opacity(0.05))
                    .overlay(
                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .stroke(Palette.accent.gold.opacity(0.2), lineWidth: 1)
                    )
            )
            
        }
        .padding(.horizontal, 18)
        .padding(.bottom, 18)
        .transition(.opacity.combined(with: .move(edge: .top)))
        
    }
    
    // MARK: - Background & Border
    
    private var cardBackground: some View {
        
        RoundedRectangle(cornerRadius: 20, style: .continuous)
            .fill(
                LinearGradient(
                    colors: [
                        Color.white.opacity(0.08),
                        Color.white.opacity(0.02)
                    ],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            )
        
    }
    
    private var cardBorder: some View {
        
        RoundedRectangle(cornerRadius: 20, style: .continuous)
            .stroke(
                LinearGradient(
                    colors: [
                        realm.color.opacity(isExpanded ? 0.5 : 0.25),
                        realm.color.opacity(0.1)
                    ],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                ),
                lineWidth: 1
            )
        
    }
    
}

// MARK: - Entity Row

struct EntityRow: View {
    
    let entity: CosmicEntity
    let realmColor: Color
    
    var body: some View {
        
        HStack(spacing: 12) {
            
            // Icon
            Image(systemName: entity.icon)
                .font(.system(size: 16, weight: .semibold))
                .foregroundColor(entity.color)
                .frame(width: 36, height: 36)
                .background(
                    Circle()
                        .fill(entity.color.opacity(0.15))
                )
            
            // Info
            VStack(alignment: .leading, spacing: 2) {
                
                Text(entity.name)
                    .font(.system(size: 15, weight: .bold, design: .rounded))
                    .foregroundColor(Palette.text.primary)
                
                Text(entity.titles.prefix(2).joined(separator: " • "))
                    .font(.system(size: 11, weight: .medium, design: .rounded))
                    .foregroundColor(Palette.text.muted)
                    .lineLimit(1)
                
            }
            
            Spacer()
            
            // Tap indicator
            Image(systemName: "chevron.right")
                .font(.system(size: 12, weight: .semibold))
                .foregroundColor(Palette.text.muted)
            
        }
        .padding(10)
        .background(
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .fill(Color.white.opacity(0.03))
        )
        
    }
    
}

// MARK: - Entity Detail View

struct EntityDetailView: View {
    
    let entity: CosmicEntity
    let realm: CosmicRealm?
    let onDismiss: () -> Void
    
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
                        entityHeader
                        
                        // Description
                        if !entity.description.isEmpty {
                            detailSection(title: "Description", content: entity.description)
                        }
                        
                        // Symbolism
                        if !entity.symbolism.isEmpty {
                            detailSection(title: "Symbolism", content: entity.symbolism, color: Palette.primary.violet)
                        }
                        
                        // Associated With
                        if !entity.associatedWith.isEmpty {
                            associatedWithSection
                        }
                        
                        // Gnostic Teaching
                        if !entity.gnosticTeaching.isEmpty {
                            detailSection(title: "Gnostic Teaching", content: entity.gnosticTeaching, color: Palette.accent.gold, icon: "book.fill")
                        }
                        
                        // Fun Fact
                        if let funFact = entity.funFact, !funFact.isEmpty {
                            funFactSection(funFact: funFact)
                        }
                        
                        Spacer(minLength: 40)
                        
                    }
                    .padding(.horizontal, 20)
                    
                }
                
            }
            
        }
        
    }
    
    // MARK: - Entity Header
    
    private var entityHeader: some View {
        
        VStack(spacing: 16) {
            
            ZStack {
                
                Circle()
                    .fill(
                        RadialGradient(
                            colors: [entity.color.opacity(0.4), entity.color.opacity(0.05)],
                            center: .center,
                            startRadius: 0,
                            endRadius: 60
                        )
                    )
                    .frame(width: 100, height: 100)
                
                Image(systemName: entity.icon)
                    .font(.system(size: 44, weight: .semibold))
                    .foregroundColor(entity.color)
                
            }
            .shadow(color: entity.color.opacity(0.4), radius: 20)
            
            Text(entity.name)
                .font(.system(size: 28, weight: .bold, design: .rounded))
                .foregroundColor(Palette.text.primary)
                .multilineTextAlignment(.center)
            
            // Titles
            if !entity.titles.isEmpty {
                Text(entity.titles.joined(separator: " • "))
                    .font(.system(size: 12, weight: .medium, design: .rounded))
                    .foregroundColor(entity.color)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 20)
            }
            
            // Realm badge (if provided)
            if let realm = realm {
                Text("Found in: \(realm.name)")
                    .font(.system(size: 11, weight: .bold, design: .rounded))
                    .foregroundColor(realm.color)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 6)
                    .background(
                        Capsule()
                            .fill(realm.color.opacity(0.15))
                    )
            }
            
        }
        .frame(maxWidth: .infinity)
        .padding(.top, 20)
        
    }
    
    // MARK: - Associated With Section
    
    private var associatedWithSection: some View {
        
        VStack(alignment: .leading, spacing: 8) {
            
            sectionHeader(title: "Associated With", icon: "link", color: Palette.primary.cyan)
            
            FlowLayout(spacing: 8) {
                ForEach(entity.associatedWith, id: \.self) { item in
                    Text(item)
                        .font(.system(size: 12, weight: .medium, design: .rounded))
                        .foregroundColor(Palette.primary.cyan)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 6)
                        .background(
                            Capsule()
                                .fill(Palette.primary.cyan.opacity(0.15))
                        )
                }
            }
            
        }
        
    }
    
    // MARK: - Fun Fact Section
    
    private func funFactSection(funFact: String) -> some View {
        
        VStack(alignment: .leading, spacing: 8) {
            
            sectionHeader(title: "Did You Know?", icon: "sparkles", color: Palette.primary.orange)
            
            Text(funFact)
                .font(.system(size: 14, weight: .medium, design: .rounded))
                .foregroundColor(Palette.text.primary)
                .lineSpacing(5)
                .padding(14)
                .background(
                    RoundedRectangle(cornerRadius: 12, style: .continuous)
                        .fill(Palette.primary.orange.opacity(0.1))
                )
            
        }
        
    }
    
    private func sectionHeader(title: String, icon: String, color: Color) -> some View {
        
        Label(title.uppercased(), systemImage: icon)
            .font(.system(size: 12, weight: .bold, design: .rounded))
            .foregroundColor(color)
            .tracking(1)
        
    }
    
    private func detailSection(title: String, content: String, color: Color = Palette.text.secondary, icon: String = "circle.fill") -> some View {
        
        VStack(alignment: .leading, spacing: 8) {
            
            sectionHeader(title: title, icon: icon, color: color)
            
            Text(content)
                .font(.system(size: 14, weight: .regular, design: .rounded))
                .foregroundColor(Palette.text.primary.opacity(0.9))
                .lineSpacing(5)
            
        }
        
    }
    
}

// MARK: - Flow Layout for Tags

struct FlowLayout: Layout {
    
    var spacing: CGFloat = 8
    
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        
        let result = FlowResult(in: proposal.width ?? 0, subviews: subviews, spacing: spacing)
        return result.size
        
    }
    
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        
        let result = FlowResult(in: bounds.width, subviews: subviews, spacing: spacing)
        
        for (index, subview) in subviews.enumerated() {
            subview.place(at: CGPoint(x: bounds.minX + result.positions[index].x, y: bounds.minY + result.positions[index].y), proposal: .unspecified)
        }
        
    }
    
    struct FlowResult {
        
        var size: CGSize = .zero
        var positions: [CGPoint] = []
        
        init(in maxWidth: CGFloat, subviews: Subviews, spacing: CGFloat) {
            
            var currentX: CGFloat = 0
            var currentY: CGFloat = 0
            var lineHeight: CGFloat = 0
            
            for subview in subviews {
                let size = subview.sizeThatFits(.unspecified)
                
                if currentX + size.width > maxWidth && currentX > 0 {
                    currentX = 0
                    currentY += lineHeight + spacing
                    lineHeight = 0
                }
                
                positions.append(CGPoint(x: currentX, y: currentY))
                lineHeight = max(lineHeight, size.height)
                currentX += size.width + spacing
            }
            
            self.size = CGSize(width: maxWidth, height: currentY + lineHeight)
            
        }
        
    }
    
}

// MARK: - Safe Array Access

extension Array {
    subscript(safe index: Index) -> Element? {
        indices.contains(index) ? self[index] : nil
    }
}

// MARK: - Biblical Lies Navigation Card

struct BiblicalLiesNavigationCard: View {
    
    let onTap: () -> Void
    
    @State private var isAnimating = false
    
    var body: some View {
        
        VStack(spacing: 0) {
            
            // Separator line
            Rectangle()
                .fill(
                    LinearGradient(
                        colors: [Color.clear, Palette.accent.gold.opacity(0.5), Color.clear],
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
                .frame(height: 1)
                .padding(.vertical, 20)
            
            // Main Card
            VStack(spacing: 16) {
                
                // Sun Icon with Emanating Rays
                ZStack {
                    
                    // Outer glow pulse
                    Circle()
                        .fill(
                            RadialGradient(
                                colors: [
                                    Palette.accent.gold.opacity(0.4),
                                    Palette.primary.orange.opacity(0.2),
                                    Color.clear
                                ],
                                center: .center,
                                startRadius: 0,
                                endRadius: isAnimating ? 80 : 60
                            )
                        )
                        .frame(width: 160, height: 160)
                        .scaleEffect(isAnimating ? 1.2 : 1.0)
                        .opacity(isAnimating ? 0.6 : 0.8)
                    
                    // Rotating rays
                    ForEach(0..<12, id: \.self) { i in
                        Rectangle()
                            .fill(
                                LinearGradient(
                                    colors: [Palette.accent.gold, Palette.accent.gold.opacity(0)],
                                    startPoint: .bottom,
                                    endPoint: .top
                                )
                            )
                            .frame(width: 3, height: 40)
                            .offset(y: -50)
                            .rotationEffect(.degrees(Double(i) * 30 + (isAnimating ? 15 : 0)))
                    }
                    
                    // Middle glow
                    Circle()
                        .fill(
                            RadialGradient(
                                colors: [
                                    Palette.accent.gold.opacity(0.8),
                                    Palette.primary.orange.opacity(0.4),
                                    Color.clear
                                ],
                                center: .center,
                                startRadius: 0,
                                endRadius: 50
                            )
                        )
                        .frame(width: 100, height: 100)
                    
                    // Sun circle
                    Circle()
                        .fill(
                            RadialGradient(
                                colors: [
                                    Color.white,
                                    Palette.accent.gold,
                                    Palette.primary.orange
                                ],
                                center: .center,
                                startRadius: 0,
                                endRadius: 35
                            )
                        )
                        .frame(width: 70, height: 70)
                        .shadow(color: Palette.accent.gold, radius: 20)
                        .shadow(color: Palette.primary.orange, radius: 40)
                    
                    // Book icon in center
                    Image(systemName: "book.closed.fill")
                        .font(.system(size: 28, weight: .bold))
                        .foregroundColor(Color(red: 0.3, green: 0.15, blue: 0.0))
                    
                }
                .frame(height: 160)
                
                // Title
                Text("THE LIES OF THE BIBLE")
                    .font(.system(size: 14, weight: .black, design: .rounded))
                    .tracking(3)
                    .foregroundStyle(
                        LinearGradient(
                            colors: [Palette.accent.gold, Palette.primary.orange, Palette.accent.gold],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                
                // Subtitle
                Text("What They Said vs The Gnostic Truth")
                    .font(.system(size: 16, weight: .bold, design: .rounded))
                    .foregroundColor(Palette.text.primary)
                
                // Description
                Text("15 doctrines exposed. Tap to see what\nthey don't want you to know.")
                    .font(.system(size: 13, weight: .medium, design: .rounded))
                    .foregroundColor(Palette.text.secondary)
                    .multilineTextAlignment(.center)
                    .lineSpacing(4)
                
                // CTA Button
                HStack(spacing: 8) {
                    
                    Text("EXPOSE THE LIES")
                        .font(.system(size: 13, weight: .black, design: .rounded))
                        .tracking(2)
                    
                    Image(systemName: "chevron.right")
                        .font(.system(size: 12, weight: .bold))
                    
                }
                .foregroundColor(.black)
                .padding(.horizontal, 24)
                .padding(.vertical, 12)
                .background(
                    Capsule()
                        .fill(
                            LinearGradient(
                                colors: [Palette.accent.gold, Palette.primary.orange],
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .shadow(color: Palette.accent.gold.opacity(0.5), radius: 10)
                )
                .padding(.top, 8)
                
            }
            .padding(.vertical, 24)
            .padding(.horizontal, 20)
            .frame(maxWidth: .infinity)
            .background(
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .fill(
                        LinearGradient(
                            colors: [
                                Color.white.opacity(0.1),
                                Color.white.opacity(0.02),
                                Palette.accent.gold.opacity(0.05)
                            ],
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 20, style: .continuous)
                            .stroke(
                                LinearGradient(
                                    colors: [
                                        Palette.accent.gold.opacity(0.6),
                                        Palette.primary.orange.opacity(0.3),
                                        Palette.accent.gold.opacity(0.6)
                                    ],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                ),
                                lineWidth: 2
                            )
                    )
            )
            .shadow(color: Palette.accent.gold.opacity(0.3), radius: 20)
            
        }
        .onTapGesture(perform: onTap)
        .onAppear {
            withAnimation(
                .easeInOut(duration: 2.0)
                .repeatForever(autoreverses: true)
            ) {
                isAnimating = true
            }
        }
        
    }
    
}

// MARK: - Biblical Lies List View

struct BiblicalLiesListView: View {
    
    let onDismiss: () -> Void
    
    @State private var selectedLie: BiblicalLie?
    
    var body: some View {
        
        ZStack {
            
            // Background
            LinearGradient(
                colors: [
                    Color.black,
                    Color(red: 0.1, green: 0.02, blue: 0.02),
                    Color.black
                ],
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
                    
                    VStack(spacing: 20) {
                        
                        // Header
                        VStack(spacing: 12) {
                            
                            Text("📖🔥")
                                .font(.system(size: 50))
                            
                            Text("THE LIES OF THE BIBLE")
                                .font(.system(size: 13, weight: .bold, design: .rounded))
                                .tracking(3)
                                .foregroundColor(Palette.primary.red)
                            
                            Text("What They Said")
                                .font(.system(size: 28, weight: .bold, design: .rounded))
                                .foregroundColor(Palette.text.primary)
                            
                            Text("vs")
                                .font(.system(size: 16, weight: .medium, design: .rounded))
                                .foregroundColor(Palette.text.muted)
                            
                            Text("The Gnostic Truth")
                                .font(.system(size: 28, weight: .bold, design: .rounded))
                                .foregroundStyle(
                                    LinearGradient(
                                        colors: [Palette.accent.gold, Palette.primary.orange],
                                        startPoint: .leading,
                                        endPoint: .trailing
                                    )
                                )
                            
                            Text("Tap each lie to see what they don't want you to know")
                                .font(.system(size: 14, weight: .medium, design: .rounded))
                                .foregroundColor(Palette.text.secondary)
                                .padding(.top, 8)
                            
                        }
                        .padding(.top, 20)
                        .padding(.bottom, 10)
                        
                        // Lies List
                        ForEach(BiblicalLie.allLies) { lie in
                            
                            BiblicalLieCard(lie: lie) {
                                selectedLie = lie
                            }
                            
                        }
                        
                        // Footer Dragon
                        HStack(alignment: .top, spacing: 10) {
                            
                            Text("🐉")
                                .font(.system(size: 20))
                            
                            Text("\"They wrote the book. They edited the book. They translated the book. They taught you to never question the book. Maybe start there.\"")
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
                        .padding(.top, 20)
                        
                        Spacer(minLength: 40)
                        
                    }
                    .padding(.horizontal, 20)
                    
                }
                
            }
            
        }
        .sheet(item: $selectedLie) { lie in
            BiblicalLieDetailView(lie: lie) {
                selectedLie = nil
            }
        }
        
    }
    
}

// MARK: - Biblical Lie Card

struct BiblicalLieCard: View {
    
    let lie: BiblicalLie
    let onTap: () -> Void
    
    var body: some View {
        
        HStack(spacing: 14) {
            
            // Icon
            ZStack {
                
                Circle()
                    .fill(lie.color.opacity(0.2))
                    .frame(width: 44, height: 44)
                
                Image(systemName: lie.icon)
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundColor(lie.color)
                
            }
            
            // Title
            Text(lie.title)
                .font(.system(size: 16, weight: .bold, design: .rounded))
                .foregroundColor(Palette.text.primary)
            
            Spacer()
            
            // "Exposed" indicator
            Text("TAP TO EXPOSE")
                .font(.system(size: 9, weight: .bold, design: .rounded))
                .tracking(1)
                .foregroundColor(Palette.primary.red.opacity(0.8))
            
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
                        .stroke(lie.color.opacity(0.2), lineWidth: 1)
                )
        )
        .onTapGesture(perform: onTap)
        
    }
    
}

// MARK: - Biblical Lie Detail View

struct BiblicalLieDetailView: View {
    
    let lie: BiblicalLie
    let onDismiss: () -> Void
    
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
                        VStack(spacing: 16) {
                            
                            ZStack {
                                
                                Circle()
                                    .fill(
                                        RadialGradient(
                                            colors: [lie.color.opacity(0.4), lie.color.opacity(0.05)],
                                            center: .center,
                                            startRadius: 0,
                                            endRadius: 50
                                        )
                                    )
                                    .frame(width: 80, height: 80)
                                
                                Image(systemName: lie.icon)
                                    .font(.system(size: 36, weight: .semibold))
                                    .foregroundColor(lie.color)
                                
                            }
                            .shadow(color: lie.color.opacity(0.4), radius: 15)
                            
                            Text(lie.title)
                                .font(.system(size: 26, weight: .bold, design: .rounded))
                                .foregroundColor(Palette.text.primary)
                                .multilineTextAlignment(.center)
                            
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.top, 10)
                        
                        // Bible Verse (if available)
                        if let verse = lie.bibleVerse {
                            
                            HStack(spacing: 10) {
                                
                                Image(systemName: "book.fill")
                                    .font(.system(size: 14))
                                    .foregroundColor(Palette.text.muted)
                                
                                Text(verse)
                                    .font(.system(size: 13, weight: .medium, design: .rounded))
                                    .italic()
                                    .foregroundColor(Palette.text.secondary)
                                
                            }
                            .padding(12)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(
                                RoundedRectangle(cornerRadius: 10, style: .continuous)
                                    .fill(Color.white.opacity(0.05))
                            )
                            
                        }
                        
                        // What They Said
                        VStack(alignment: .leading, spacing: 10) {
                            
                            HStack {
                                
                                Image(systemName: "xmark.circle.fill")
                                    .foregroundColor(Palette.primary.red)
                                
                                Text("WHAT THEY SAID")
                                    .font(.system(size: 12, weight: .bold, design: .rounded))
                                    .tracking(2)
                                    .foregroundColor(Palette.primary.red)
                                
                            }
                            
                            Text(lie.whatTheySaid)
                                .font(.system(size: 15, weight: .regular, design: .rounded))
                                .foregroundColor(Palette.text.primary.opacity(0.9))
                                .lineSpacing(6)
                            
                        }
                        .padding(16)
                        .background(
                            RoundedRectangle(cornerRadius: 14, style: .continuous)
                                .fill(Palette.primary.red.opacity(0.1))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 14, style: .continuous)
                                        .stroke(Palette.primary.red.opacity(0.3), lineWidth: 1)
                                )
                        )
                        
                        // Arrow
                        HStack {
                            Spacer()
                            Image(systemName: "arrow.down")
                                .font(.system(size: 24, weight: .bold))
                                .foregroundColor(Palette.accent.gold)
                            Spacer()
                        }
                        
                        // The Gnostic Truth
                        VStack(alignment: .leading, spacing: 10) {
                            
                            HStack {
                                
                                Image(systemName: "checkmark.circle.fill")
                                    .foregroundColor(Palette.accent.gold)
                                
                                Text("THE GNOSTIC TRUTH")
                                    .font(.system(size: 12, weight: .bold, design: .rounded))
                                    .tracking(2)
                                    .foregroundColor(Palette.accent.gold)
                                
                            }
                            
                            Text(lie.theGnosticTruth)
                                .font(.system(size: 15, weight: .regular, design: .rounded))
                                .foregroundColor(Palette.text.primary)
                                .lineSpacing(6)
                            
                        }
                        .padding(16)
                        .background(
                            RoundedRectangle(cornerRadius: 14, style: .continuous)
                                .fill(Palette.accent.gold.opacity(0.1))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 14, style: .continuous)
                                        .stroke(Palette.accent.gold.opacity(0.3), lineWidth: 1)
                                )
                        )
                        
                        // Dragon Comment
                        HStack(alignment: .top, spacing: 12) {
                            
                            Text("🐉")
                                .font(.system(size: 24))
                            
                            Text(lie.dragonComment)
                                .font(.system(size: 14, weight: .medium, design: .rounded))
                                .italic()
                                .foregroundColor(Palette.accent.gold)
                                .lineSpacing(5)
                            
                        }
                        .padding(16)
                        .background(
                            RoundedRectangle(cornerRadius: 14, style: .continuous)
                                .fill(Color.white.opacity(0.03))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 14, style: .continuous)
                                        .stroke(Palette.accent.gold.opacity(0.2), lineWidth: 1)
                                )
                        )
                        
                        Spacer(minLength: 40)
                        
                    }
                    .padding(.horizontal, 20)
                    
                }
                
            }
            
        }
    }
}
