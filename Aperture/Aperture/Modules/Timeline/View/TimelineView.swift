// TimelineView.swift

import SwiftUI

// MARK: - Scroll Offset Preference Key

struct ScrollOffsetPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

// MARK: - Dialog State

enum DragonDialogState {
    case greeting
    case readyToBegin
    case descending
    case commenting
}

// MARK: - Timeline View

struct TimelineView: View {
    
    @StateObject private var presenterBox: TimelinePresenterBox
    @Namespace private var dragonNamespace
    
    @State private var scrollOffset: CGFloat = 0
    @State private var selectedEra: TimelineEra?
    @State private var isDragonAbsorbed: Bool = false
    @State private var showDetail: Bool = false
    @State private var cardPositions: [UUID: CGRect] = [:]
    @State private var tappedEraIndex: Int? = nil
    @State private var cardScreenPositions: [Int: CGFloat] = [:]  // index → global midY
    
    // Dialog state — persisted so user isn't trapped on re-entry
    @State private var dragonState: DragonDialogState = .greeting
    @AppStorage("timeline_hasChosenInterval") private var hasChosenInterval: Bool = false
    @AppStorage("timeline_greetingSeen") private var greetingSeen: Bool = false
    @State private var dragonMessage: String = ""
    @State private var messageIndex: Int = 0
    @State private var showDescentAnimation: Bool = false
    
    // 3-dot menu state
    @State private var showMenu: Bool = false
    
    private var presenter: TimelinePresenterType {
        presenterBox.presenter
    }
    
    init(presenter: TimelinePresenterType) {
        _presenterBox = StateObject(wrappedValue: TimelinePresenterBox(presenter: presenter))
    }
    
    var body: some View {
        
        NavigationStack {
            
            ZStack {
                
                cosmicBackground
                
                if !hasChosenInterval {
                    chronokeeperGreetingView
                } else if showDescentAnimation {
                    // Dramatic clock descent before timeline appears
                    ShenronDescentView {
                        withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                            showDescentAnimation = false
                        }
                    }
                    .transition(.opacity)
                } else {
                    timelineScrollView
                    
                    if !isDragonAbsorbed {
                        yearArrowOverlay
                    }
                }
                
                // 3-dot menu overlay (always accessible when timeline is showing)
                if hasChosenInterval && !showDescentAnimation {
                    timelineMenuOverlay
                }
                
            }
            .navigationTitle("Timeline")
            .navigationBarTitleDisplayMode(.inline)
            .sheet(isPresented: $showDetail) {
                if let era = selectedEra {
                    TimelineDetailView(era: era) {
                        withAnimation(.spring(response: 0.4, dampingFraction: 0.8)) {
                            showDetail = false
                            isDragonAbsorbed = false
                            selectedEra = nil
                        }
                    }
                }
            }
            
        }
        .onAppear {
            presenter.viewDidLoad()
            if greetingSeen && hasChosenInterval {
                // Returning user — go straight to timeline
                dragonState = .descending
                dragonMessage = ""
            } else if !greetingSeen {
                startChronokeeperGreeting()
            }
        }
        
    }
    
    // MARK: - 3-Dot Menu Overlay
    
    private var timelineMenuOverlay: some View {
        VStack {
            HStack {
                Spacer()
                
                ZStack(alignment: .topTrailing) {
                    // Menu button
                    Button {
                        withAnimation(.spring(response: 0.35, dampingFraction: 0.75)) {
                            showMenu.toggle()
                        }
                    } label: {
                        ZStack {
                            Circle()
                                .fill(Color.black.opacity(0.5))
                                .frame(width: 36, height: 36)
                                .overlay(
                                    Circle()
                                        .stroke(Palette.accent.gold.opacity(0.3), lineWidth: 1)
                                )
                            
                            Image(systemName: "ellipsis")
                                .font(.system(size: 14, weight: .bold))
                                .foregroundColor(Palette.accent.gold)
                                .rotationEffect(.degrees(showMenu ? 90 : 0))
                        }
                    }
                    
                    // Dropdown menu
                    if showMenu {
                        VStack(spacing: 0) {
                            menuItem(
                                icon: "arrow.counterclockwise",
                                label: "Restart Journey",
                                delay: 0.0
                            ) {
                                restartTimeline()
                            }
                            
                            Divider()
                                .background(Palette.accent.gold.opacity(0.2))
                            
                            menuItem(
                                icon: "arrow.up.to.line",
                                label: "Back to Top",
                                delay: 0.05
                            ) {
                                scrollToTop()
                            }
                        }
                        .background(
                            RoundedRectangle(cornerRadius: 14, style: .continuous)
                                .fill(
                                    LinearGradient(
                                        colors: [
                                            Color(hex: "#1a1408").opacity(0.95),
                                            Color.black.opacity(0.95)
                                        ],
                                        startPoint: .top,
                                        endPoint: .bottom
                                    )
                                )
                                .overlay(
                                    RoundedRectangle(cornerRadius: 14, style: .continuous)
                                        .stroke(
                                            LinearGradient(
                                                colors: [Palette.accent.gold.opacity(0.4), Palette.primary.cyan.opacity(0.2)],
                                                startPoint: .topLeading,
                                                endPoint: .bottomTrailing
                                            ),
                                            lineWidth: 1
                                        )
                                )
                                .shadow(color: Palette.accent.gold.opacity(0.15), radius: 20)
                        )
                        .frame(width: 200)
                        .offset(y: 44)
                        .transition(.asymmetric(
                            insertion: .scale(scale: 0.8, anchor: .topTrailing)
                                .combined(with: .opacity)
                                .combined(with: .offset(y: -10)),
                            removal: .scale(scale: 0.9, anchor: .topTrailing)
                                .combined(with: .opacity)
                        ))
                    }
                }
            }
            .padding(.horizontal, 16)
            .padding(.top, 8)
            
            Spacer()
        }
    }
    
    private func menuItem(icon: String, label: String, delay: Double, action: @escaping () -> Void) -> some View {
        Button {
            withAnimation(.spring(response: 0.35, dampingFraction: 0.75)) {
                showMenu = false
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                action()
            }
        } label: {
            HStack(spacing: 12) {
                Image(systemName: icon)
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(Palette.accent.gold)
                    .frame(width: 20)
                
                Text(label)
                    .font(.system(size: 14, weight: .medium, design: .rounded))
                    .foregroundColor(Palette.text.primary)
                
                Spacer()
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 13)
            .contentShape(Rectangle())
        }
    }
    
    private func restartTimeline() {
        withAnimation(.spring(response: 0.5, dampingFraction: 0.8)) {
            hasChosenInterval = false
            greetingSeen = false
            dragonState = .greeting
            dragonMessage = ""
            selectedEra = nil
            isDragonAbsorbed = false
            showDetail = false
            showDescentAnimation = false
            scrollOffset = 0
            messageIndex = 0
            tappedEraIndex = nil
            cardScreenPositions = [:]
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            startChronokeeperGreeting()
        }
    }
    
    private func scrollToTop() {
        // Post a notification or use scroll proxy — simplest approach
        withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
            scrollOffset = 0
        }
    }
    
    // MARK: - Chronokeeper Greeting View (was Dragon Greeting)
    
    private var chronokeeperGreetingView: some View {
        
        ScrollView(showsIndicators: false) {
            
            VStack(spacing: 16) {
                
                // Skip button - always accessible
                HStack {
                    Spacer()
                    Button {
                        skipGreeting()
                    } label: {
                        HStack(spacing: 4) {
                            Text("Skip")
                                .font(.system(size: 13, weight: .medium, design: .rounded))
                            Image(systemName: "forward.fill")
                                .font(.system(size: 10))
                        }
                        .foregroundColor(Palette.text.muted)
                        .padding(.horizontal, 14)
                        .padding(.vertical, 8)
                        .background(
                            Capsule()
                                .fill(Color.white.opacity(0.1))
                        )
                    }
                }
                .padding(.horizontal, 20)
                .padding(.top, 8)
                
                // Animated Clock with Flower of Life
                ZStack {
                    // The Flower of Life — pattern of creation, divine light
                    AnimatedFlowerOfLife(size: 240, accentColor: Palette.accent.gold)
                    
                    // Animated Clock at the heart of the geometry
                    ChronusGreetingClock(size: 120)
                }
                .padding(.top, 4)
                
                // Chronokeeper speech
                VStack(spacing: 16) {
                    
                    Text(dragonMessage)
                        .font(.system(size: 17, weight: .medium, design: .rounded))
                        .foregroundColor(Palette.text.primary)
                        .multilineTextAlignment(.center)
                        .lineSpacing(5)
                        .padding(.horizontal, 20)
                        .frame(minHeight: 100)
                        .animation(.easeInOut(duration: 0.3), value: dragonMessage)
                    
                    if dragonState == .readyToBegin {
                        beginJourneyButton
                    }
                    
                }
                .padding(24)
                .background(
                    RoundedRectangle(cornerRadius: 24, style: .continuous)
                        .fill(Color.black.opacity(0.6))
                        .overlay(
                            RoundedRectangle(cornerRadius: 24, style: .continuous)
                                .stroke(
                                    LinearGradient(
                                        colors: [Palette.accent.gold.opacity(0.5), Palette.primary.cyan.opacity(0.3)],
                                        startPoint: .topLeading,
                                        endPoint: .bottomTrailing
                                    ),
                                    lineWidth: 1.5
                                )
                        )
                )
                .padding(.horizontal, 20)
                
                // Fixed bottom spacing — no ambiguity, this is the end
                Spacer()
                    .frame(height: 30)
                
            }
            
        }
        .scrollDismissesKeyboard(.interactively)
        .scrollBounceBehavior(.basedOnSize)
        
    }
    
    private var beginJourneyButton: some View {
        
        Button {
            beginJourney()
        } label: {
            HStack(spacing: 10) {
                Image(systemName: "clock.arrow.circlepath")
                    .font(.system(size: 18))
                Text("Begin the Journey")
                    .font(.system(size: 16, weight: .bold, design: .rounded))
            }
            .foregroundColor(.black)
            .padding(.horizontal, 32)
            .padding(.vertical, 14)
            .background(
                Capsule()
                    .fill(
                        LinearGradient(
                            colors: [Palette.accent.gold, Palette.accent.gold.opacity(0.8)],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .shadow(color: Palette.accent.gold.opacity(0.4), radius: 12, y: 4)
            )
        }
        .transition(.scale.combined(with: .opacity))
        .padding(.top, 8)
        
    }
    
    private func skipGreeting() {
        greetingSeen = true
        withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
            hasChosenInterval = true
            showDescentAnimation = true
            dragonState = .descending
        }
    }
    
    private func startChronokeeperGreeting() {
        let messages = [
            "Greetings, seeker of truth...",
            "I am the Chronokeeper — guardian of the moments they tried to erase.",
            "For millennia, every civilization on Earth honored the sun. Ra in Egypt. Inti in Peru. Tonatiuh in Mexico. Kinich Ahau among the Maya. Surya in India. Dazbog in Bosnia and the Slavic lands.",
            "Then came the Church of Rome.\n\nThey could not control people who knew they carried divine light within. So they burned the temples. Killed the priests. Stole December 25th from Sol Invictus.",
            "The Inca? Slaughtered. The Maya codices? Burned by Bishop de Landa. The Aztec Templo Mayor? A Catholic cathedral stands on its bones today.",
            "But the sun still rises.\n\nAnd now... I will turn back the clock, unwinding the centuries of deception, back to the truth they stole.",
        ]
        
        dragonMessage = messages[0]
        
        for (index, message) in messages.enumerated() {
            if index == 0 { continue }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(index) * 4.0) {
                withAnimation {
                    dragonMessage = message
                    
                    if index == messages.count - 1 {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
                            withAnimation {
                                dragonState = .readyToBegin
                            }
                        }
                    }
                }
            }
        }
    }
    
    private func beginJourney() {
        greetingSeen = true
        
        withAnimation {
            dragonMessage = "The journey begins... \(presenterBox.eras.count) moments where truth was hidden."
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                hasChosenInterval = true
                showDescentAnimation = true
                dragonState = .descending
            }
        }
    }
    
    // MARK: - Timeline Scroll View
    
    private var timelineScrollView: some View {
        
        ScrollView {
            
            VStack(spacing: 0) {
                
                GeometryReader { geo in
                    Color.clear
                        .preference(
                            key: ScrollOffsetPreferenceKey.self,
                            value: geo.frame(in: .named("scroll")).minY
                        )
                }
                .frame(height: 0)
                
                headerSection
                    .padding(.top, 20)
                    .padding(.bottom, 32)
                
                LazyVStack(spacing: 0) {
                    ForEach(Array(presenterBox.eras.enumerated()), id: \.element.id) { index, era in
                        TimelineEraCard(
                            era: era,
                            isFirst: index == 0,
                            isLast: index == presenterBox.eras.count - 1,
                            isDragonAbsorbed: isDragonAbsorbed && selectedEra?.id == era.id,
                            namespace: dragonNamespace
                        ) { position in
                            cardPositions[era.id] = position
                        } onTap: {
                            tappedEraIndex = index
                            absorbClockIntoCard(era)
                        }
                        .background(
                            GeometryReader { geo in
                                Color.clear
                                    .onChange(of: scrollOffset) {
                                        cardScreenPositions[index] = geo.frame(in: .global).midY
                                    }
                                    .onAppear {
                                        cardScreenPositions[index] = geo.frame(in: .global).midY
                                    }
                            }
                        )
                    }
                }
                .padding(.horizontal, 24)
                
                // Gnostic Revelation Cards - The Truth at the Bottom
                GnosticRevelationView()
                    .padding(.top, 40)
                
                Spacer(minLength: 200)
                
            }
            
        }
        .coordinateSpace(name: "scroll")
        .onPreferenceChange(ScrollOffsetPreferenceKey.self) { value in
            scrollOffset = value
            updateTimeComment()
        }
        
    }
    
    // MARK: - Year Arrow Indicator
    
    @ViewBuilder
    private var yearArrowOverlay: some View {
        
        if !presenterBox.eras.isEmpty {
            yearArrowContent
        }
        
    }
    
    private var yearArrowContent: some View {
        
        let eras = presenterBox.eras
        let activeIndex = tappedEraIndex ?? 0
        let safeIndex = min(max(activeIndex, 0), eras.count - 1)
        
        // Get the card's current screen Y, fallback to a reasonable default
        let arrowY = cardScreenPositions[safeIndex] ?? 480
        
        let yearText: String
        if safeIndex == 0 && tappedEraIndex == nil {
            yearText = "Present"
        } else {
            yearText = eras[safeIndex].yearDisplay
        }
        
        return HStack(spacing: 4) {
            Text(yearText)
                .font(.system(size: 11, weight: .bold, design: .monospaced))
                .foregroundColor(Palette.accent.gold)
            
            Image(systemName: "arrowtriangle.right.fill")
                .font(.system(size: 8))
                .foregroundColor(Palette.accent.gold.opacity(0.8))
        }
        .padding(.horizontal, 8)
        .padding(.vertical, 4)
        .background(
            Capsule()
                .fill(Color.black.opacity(0.7))
                .overlay(
                    Capsule()
                        .stroke(Palette.accent.gold.opacity(0.3), lineWidth: 1)
                )
        )
        .position(x: 42, y: arrowY)
        .allowsHitTesting(false)
        .animation(.spring(response: 0.4, dampingFraction: 0.75), value: tappedEraIndex)
        .animation(.easeOut(duration: 0.1), value: scrollOffset)
        
    }
    
    private func updateTimeComment() {
        let maxScroll: CGFloat = CGFloat(presenterBox.eras.count) * 140
        let progress = min(max(-scrollOffset / maxScroll, 0), 1)
        
        let newIndex: Int
        if progress < 0.08 {
            newIndex = 0
            dragonMessage = "The present day..."
        } else if progress < 0.2 {
            newIndex = 1
            dragonMessage = "Modern control systems..."
        } else if progress < 0.35 {
            newIndex = 2
            dragonMessage = "20th century: the cage was built"
        } else if progress < 0.5 {
            newIndex = 3
            dragonMessage = "The conquest... millions died for gold and God"
        } else if progress < 0.65 {
            newIndex = 4
            dragonMessage = "The sun gods erased..."
        } else if progress < 0.8 {
            newIndex = 5
            dragonMessage = "Rome's great editing..."
        } else if progress < 0.92 {
            newIndex = 6
            dragonMessage = "We approach the source..."
        } else {
            newIndex = 7
            dragonMessage = "☀️ The truth awaits..."
        }
        
        if newIndex != messageIndex {
            messageIndex = newIndex
        }
    }
    
    // MARK: - Absorb Clock into Card
    
    private func absorbClockIntoCard(_ era: TimelineEra) {
        selectedEra = era
        
        withAnimation(.spring(response: 0.5, dampingFraction: 0.7)) {
            isDragonAbsorbed = true
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
            showDetail = true
            presenter.didSelectEra(era)
        }
    }
    
    // MARK: - Header
    
    private var headerSection: some View {
        
        VStack(spacing: 10) {
            
            Image(systemName: "clock.arrow.circlepath")
                .font(.system(size: 34, weight: .semibold))
                .foregroundStyle(
                    LinearGradient(
                        colors: [Palette.accent.gold, Palette.primary.cyan],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .shadow(color: Palette.accent.gold.opacity(0.5), radius: 8)
            
            Text("Travel in Time to Find the Truth")
                .font(.system(size: 24, weight: .bold, design: .rounded))
                .foregroundStyle(
                    LinearGradient(
                        colors: [Palette.accent.gold, Palette.primary.cyan],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .multilineTextAlignment(.center)
            
            Text("Unwind the centuries of deception")
                .font(.system(size: 14, weight: .medium, design: .rounded))
                .foregroundColor(Palette.text.secondary)
            
            HStack(spacing: 6) {
                Image(systemName: "clock.arrow.circlepath")
                    .font(.system(size: 11, weight: .semibold))
                Text("\(presenterBox.eras.count) hidden moments")
                    .font(.system(size: 11, weight: .semibold, design: .rounded))
            }
            .foregroundColor(Palette.accent.gold)
            .padding(.horizontal, 12)
            .padding(.vertical, 5)
            .background(Capsule().fill(Palette.accent.gold.opacity(0.15)))
            .padding(.top, 4)
            
        }
        .padding(.horizontal, 24)
        
    }
    
    // MARK: - Background
    
    private var cosmicBackground: some View {
        
        ZStack {
            
            // Warm, sun-god themed gradient
            LinearGradient(
                colors: [
                    Color(hex: "#0a0806"),
                    Color(hex: "#140a04"),
                    Color(hex: "#0a0806")
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            // Golden particles
            ForEach(0..<50, id: \.self) { _ in
                Circle()
                    .fill(
                        [Palette.accent.gold, Palette.primary.orange, Palette.primary.red].randomElement()!
                            .opacity(Double.random(in: 0.15...0.4))
                    )
                    .frame(width: CGFloat.random(in: 1...2.5))
                    .position(
                        x: CGFloat.random(in: 0...UIScreen.main.bounds.width),
                        y: CGFloat.random(in: 0...UIScreen.main.bounds.height * 3)
                    )
                    .blur(radius: Double.random(in: 0.3...1))
            }
            
        }
        
    }
    
}

// MARK: - Chronus Greeting Clock (Animated clock for the greeting screen)

struct ChronusGreetingClock: View {
    
    var size: CGFloat
    @State private var minuteAngle: Double = 0
    @State private var hourAngle: Double = 0
    @State private var glowPulse: CGFloat = 1.0
    
    var body: some View {
        ZStack {
            // Outer aura
            Circle()
                .fill(
                    RadialGradient(
                        colors: [
                            Palette.accent.gold.opacity(0.25),
                            Palette.primary.cyan.opacity(0.1),
                            Color.clear
                        ],
                        center: .center,
                        startRadius: size * 0.3,
                        endRadius: size * 0.8
                    )
                )
                .frame(width: size * 1.6, height: size * 1.6)
                .scaleEffect(glowPulse)
            
            ChronusClockFace(
                hourAngle: hourAngle,
                minuteAngle: minuteAngle,
                size: size,
                glowIntensity: 0.6
            )
            .shadow(color: Palette.accent.gold.opacity(0.6), radius: 20)
        }
        .onAppear {
            // Slow counter-clockwise rotation (hinting at time reversal)
            withAnimation(.linear(duration: 12).repeatForever(autoreverses: false)) {
                minuteAngle = -360
            }
            withAnimation(.linear(duration: 40).repeatForever(autoreverses: false)) {
                hourAngle = -360
            }
            withAnimation(.easeInOut(duration: 3.0).repeatForever(autoreverses: true)) {
                glowPulse = 1.08
            }
        }
    }
}

// MARK: - Timeline Era Card

struct TimelineEraCard: View {
    
    let era: TimelineEra
    let isFirst: Bool
    let isLast: Bool
    let isDragonAbsorbed: Bool
    let namespace: Namespace.ID
    let onPositionChange: (CGRect) -> Void
    let onTap: () -> Void
    
    @State private var isGlowing: Bool = false
    
    var body: some View {
        
        HStack(alignment: .top, spacing: 16) {
            
            // Timeline line + dot
            VStack(spacing: 0) {
                
                if !isFirst {
                    Rectangle()
                        .fill(
                            LinearGradient(
                                colors: [
                                    era.isRevealed ? Palette.accent.gold.opacity(0.6) : Palette.primary.red.opacity(0.5),
                                    era.gradient[0].opacity(0.8)
                                ],
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                        .frame(width: 2, height: 20)
                }
                
                // Era dot
                Circle()
                    .fill(
                        LinearGradient(
                            colors: era.gradient,
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(width: 14, height: 14)
                    .overlay(
                        Circle()
                            .stroke(Color.white.opacity(0.3), lineWidth: 1.5)
                    )
                    .shadow(color: era.gradient[0].opacity(0.5), radius: 5)
                
                if !isLast {
                    Rectangle()
                        .fill(
                            LinearGradient(
                                colors: [
                                    era.gradient[1].opacity(0.7),
                                    Palette.primary.violet.opacity(0.3)
                                ],
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                        .frame(width: 2)
                        .frame(maxHeight: .infinity)
                }
                
            }
            .frame(width: 18)
            
            // Card
            GeometryReader { geo in
                cardContent
                    .onAppear {
                        onPositionChange(geo.frame(in: .global))
                    }
            }
            .frame(height: cardHeight)
            
        }
        .padding(.bottom, 14)
        
    }
    
    private var cardHeight: CGFloat {
        if era.yearDisplay.contains("TRUTH") { return 280 }
        return era.description.count > 180 ? 170 : (era.description.count > 100 ? 150 : 130)
    }
    
    private var cardContent: some View {
        
        VStack(alignment: .leading, spacing: 6) {
            
            // Year badge
            Text(era.yearDisplay)
                .font(.system(size: 10, weight: .bold, design: .monospaced))
                .foregroundColor(era.gradient[0])
                .padding(.horizontal, 7)
                .padding(.vertical, 3)
                .background(
                    Capsule().fill(era.gradient[0].opacity(0.15))
                )
            
            HStack(spacing: 10) {
                
                ZStack {
                    Image(systemName: era.icon)
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundStyle(
                            LinearGradient(
                                colors: era.gradient,
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .frame(width: 36, height: 36)
                        .background(
                            Circle().fill(era.gradient[0].opacity(0.15))
                        )
                    
                    if isDragonAbsorbed {
                        Circle()
                            .fill(Palette.accent.gold.opacity(0.7))
                            .frame(width: 44, height: 44)
                            .blur(radius: 12)
                            .scaleEffect(isGlowing ? 1.4 : 1.0)
                            .opacity(isGlowing ? 0 : 0.7)
                            .onAppear {
                                withAnimation(.easeOut(duration: 0.4)) {
                                    isGlowing = true
                                }
                            }
                    }
                }
                
                VStack(alignment: .leading, spacing: 1) {
                    Text(era.title)
                        .font(.system(size: 14, weight: .bold, design: .rounded))
                        .foregroundColor(Palette.text.primary)
                        .lineLimit(1)
                    
                    Text(era.subtitle)
                        .font(.system(size: 11, weight: .medium, design: .rounded))
                        .foregroundColor(era.isRevealed ? Palette.accent.gold.opacity(0.9) : Palette.primary.red.opacity(0.8))
                        .lineLimit(1)
                }
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .font(.system(size: 10, weight: .semibold))
                    .foregroundColor(Palette.text.muted)
                
            }
            
            Text(era.description)
                .font(.system(size: 12, weight: .regular, design: .rounded))
                .foregroundColor(Palette.text.secondary)
                .lineSpacing(2)
                .lineLimit(era.yearDisplay.contains("TRUTH") ? 12 : 4)
            
        }
        .padding(14)
        .background(
            RoundedRectangle(cornerRadius: 14, style: .continuous)
                .fill(Palette.surface.fieldFill)
                .overlay(
                    RoundedRectangle(cornerRadius: 14, style: .continuous)
                        .stroke(
                            LinearGradient(
                                colors: isDragonAbsorbed
                                    ? [Palette.accent.gold.opacity(0.7), Palette.primary.orange.opacity(0.5)]
                                    : [era.gradient[0].opacity(0.25), era.gradient[1].opacity(0.1)],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            ),
                            lineWidth: isDragonAbsorbed ? 1.5 : 1
                        )
                )
                .shadow(
                    color: isDragonAbsorbed ? Palette.accent.gold.opacity(0.3) : Color.clear,
                    radius: isDragonAbsorbed ? 15 : 0
                )
        )
        .scaleEffect(isDragonAbsorbed ? 1.015 : 1.0)
        .animation(.spring(response: 0.3, dampingFraction: 0.7), value: isDragonAbsorbed)
        .onTapGesture {
            HapticManager.shared.timelineEventSelected()
            onTap()
        }
        
    }
    
}

// MARK: - Timeline Detail View

struct TimelineDetailView: View {
    
    let era: TimelineEra
    let onDismiss: () -> Void
    
    private var isRevelation: Bool {
        era.yearDisplay.contains("TRUTH")
    }
    
    var body: some View {
        
        ZStack {
            
            // Background
            LinearGradient(
                colors: isRevelation
                    ? [Color(hex: "#0a0a04"), Color(hex: "#141004"), Color(hex: "#0a0804")]
                    : [Color(hex: "#0a0a0c"), Color(hex: "#0c0810"), Color(hex: "#0a0a0c")],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            // Golden particles for revelation
            if isRevelation {
                ForEach(0..<80, id: \.self) { _ in
                    Circle()
                        .fill(Palette.accent.gold.opacity(Double.random(in: 0.3...0.6)))
                        .frame(width: CGFloat.random(in: 1...3))
                        .position(
                            x: CGFloat.random(in: 0...UIScreen.main.bounds.width),
                            y: CGFloat.random(in: 0...UIScreen.main.bounds.height)
                        )
                        .blur(radius: Double.random(in: 0...1))
                }
            }
            
            ScrollView {
                
                VStack(spacing: 20) {
                    
                    // Close button
                    HStack {
                        Spacer()
                        Button(action: onDismiss) {
                            Image(systemName: "xmark.circle.fill")
                                .font(.system(size: 26))
                                .foregroundColor(Palette.text.secondary)
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 12)
                    
                    // Icon
                    ZStack {
                        if isRevelation {
                            Circle()
                                .fill(
                                    RadialGradient(
                                        colors: [Palette.accent.gold.opacity(0.6), Color.clear],
                                        center: .center,
                                        startRadius: 30,
                                        endRadius: 70
                                    )
                                )
                                .frame(width: 140, height: 140)
                        }
                        
                        Circle()
                            .fill(
                                LinearGradient(
                                    colors: era.gradient,
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                            .frame(width: isRevelation ? 100 : 85, height: isRevelation ? 100 : 85)
                            .shadow(color: era.gradient[0].opacity(0.5), radius: 15)
                        
                        Image(systemName: era.icon)
                            .font(.system(size: isRevelation ? 44 : 36, weight: .semibold))
                            .foregroundColor(.white)
                    }
                    
                    // Year badge
                    Text(era.yearDisplay)
                        .font(.system(size: isRevelation ? 16 : 13, weight: .bold, design: .monospaced))
                        .foregroundColor(era.gradient[0])
                        .padding(.horizontal, 14)
                        .padding(.vertical, 6)
                        .background(Capsule().fill(era.gradient[0].opacity(0.15)))
                    
                    // Title
                    Text(era.title)
                        .font(.system(size: isRevelation ? 28 : 24, weight: .bold, design: .rounded))
                        .foregroundStyle(
                            LinearGradient(
                                colors: isRevelation
                                    ? [Palette.accent.gold, Palette.primary.orange]
                                    : [Palette.text.primary, era.gradient[0].opacity(0.7)],
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                        .multilineTextAlignment(.center)
                    
                    // Subtitle
                    Text(era.subtitle)
                        .font(.system(size: 16, weight: .semibold, design: .rounded))
                        .foregroundColor(era.isRevealed ? Palette.accent.gold : Palette.primary.red)
                    
                    // Description
                    if isRevelation {
                        VStack(alignment: .center, spacing: 14) {
                            ForEach(era.description.components(separatedBy: "\n\n"), id: \.self) { para in
                                Text(para)
                                    .font(.system(size: para.hasPrefix("☀️") ? 16 : 15, weight: para.hasPrefix("☀️") ? .bold : .medium, design: .rounded))
                                    .foregroundColor(para.hasPrefix("☀️") ? Palette.accent.gold : Palette.text.primary)
                                    .multilineTextAlignment(.center)
                                    .lineSpacing(4)
                            }
                        }
                        .padding(.horizontal, 20)
                    } else {
                        Text(era.description)
                            .font(.system(size: 15, weight: .regular, design: .rounded))
                            .foregroundColor(Palette.text.secondary)
                            .lineSpacing(5)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 28)
                    }
                    
                    // INSTITUTIONAL ROT SECTION
                    if !era.institutionalRot.isEmpty {
                        
                        VStack(alignment: .leading, spacing: 16) {
                            
                            HStack {
                                Image(systemName: "exclamationmark.triangle.fill")
                                    .foregroundColor(Palette.primary.red)
                                Text("INSTITUTIONAL ROT EXPOSED")
                                    .font(.system(size: 12, weight: .bold, design: .rounded))
                                    .foregroundColor(Palette.primary.red)
                                    .tracking(1)
                            }
                            .frame(maxWidth: .infinity, alignment: .center)
                            .padding(.top, 10)
                            
                            ForEach(era.institutionalRot) { control in
                                VStack(alignment: .leading, spacing: 8) {
                                    
                                    // Institution header
                                    Text(control.institution.rawValue)
                                        .font(.system(size: 13, weight: .bold, design: .rounded))
                                        .foregroundColor(control.institution.color)
                                    
                                    // Mechanism (how they controlled)
                                    HStack(alignment: .top, spacing: 8) {
                                        Text("⚙️")
                                            .font(.system(size: 11))
                                        Text(control.mechanism)
                                            .font(.system(size: 13, weight: .medium, design: .rounded))
                                            .foregroundColor(Palette.text.secondary)
                                            .fixedSize(horizontal: false, vertical: true)
                                    }
                                    
                                    // Hidden truth
                                    HStack(alignment: .top, spacing: 8) {
                                        Text("💡")
                                            .font(.system(size: 11))
                                        Text(control.truth)
                                            .font(.system(size: 13, weight: .semibold, design: .rounded))
                                            .foregroundColor(Palette.accent.gold)
                                            .fixedSize(horizontal: false, vertical: true)
                                    }
                                    
                                }
                                .padding(14)
                                .background(
                                    RoundedRectangle(cornerRadius: 12, style: .continuous)
                                        .fill(Color.black.opacity(0.3))
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 12, style: .continuous)
                                                .stroke(control.institution.color.opacity(0.3), lineWidth: 1)
                                        )
                                )
                            }
                            
                        }
                        .padding(.horizontal, 20)
                        .padding(.top, 16)
                        
                    }
                    
                    // CHRONOKEEPER COMMENT (was Dragon Comment)
                    if !era.dragonComment.isEmpty {
                        
                        HStack(alignment: .top, spacing: 12) {
                            
                            Image(systemName: "clock.arrow.circlepath")
                                .font(.system(size: 22))
                                .foregroundColor(Palette.accent.gold)
                            
                            VStack(alignment: .leading, spacing: 4) {
                                Text("The Chronokeeper reveals:")
                                    .font(.system(size: 11, weight: .bold, design: .rounded))
                                    .foregroundColor(Palette.accent.gold.opacity(0.7))
                                
                                Text(era.dragonComment)
                                    .font(.system(size: 14, weight: .medium, design: .rounded))
                                    .foregroundColor(Palette.text.primary)
                                    .italic()
                                    .lineSpacing(3)
                            }
                            
                        }
                        .padding(16)
                        .background(
                            RoundedRectangle(cornerRadius: 16, style: .continuous)
                                .fill(
                                    LinearGradient(
                                        colors: [Palette.accent.gold.opacity(0.1), Palette.primary.cyan.opacity(0.05)],
                                        startPoint: .topLeading,
                                        endPoint: .bottomTrailing
                                    )
                                )
                                .overlay(
                                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                                        .stroke(Palette.accent.gold.opacity(0.3), lineWidth: 1)
                                )
                        )
                        .padding(.horizontal, 20)
                        .padding(.top, 16)
                        
                    }
                    
                    // Category
                    Text(era.category.rawValue.uppercased())
                        .font(.system(size: 10, weight: .bold, design: .rounded))
                        .foregroundColor(Palette.text.muted)
                        .tracking(1.5)
                        .padding(.top, 8)
                    
                    // Indicator
                    HStack(spacing: 6) {
                        Circle()
                            .fill(era.isRevealed ? Palette.accent.gold : Palette.primary.red)
                            .frame(width: 8, height: 8)
                        Text(era.isRevealed ? "☀️ Light / Truth" : "🌑 Control / Erasure")
                            .font(.system(size: 12, weight: .medium, design: .rounded))
                            .foregroundColor(Palette.text.muted)
                    }
                    .padding(.top, 10)
                    
                    // MARK: - Cross-Module Links
                    
                    VStack(spacing: 12) {
                        Divider()
                            .background(Color.white.opacity(0.1))
                            .padding(.horizontal, 40)
                        
                        // Portal to Cosmos
                        HStack {
                            Button(action: {
                                onDismiss()
                            }) {
                                HStack(spacing: 8) {
                                    Image(systemName: "arrow.right.circle.fill")
                                        .font(.system(size: 14))
                                    Text("See the cosmic architecture behind this")
                                        .font(.system(size: 13, weight: .medium))
                                }
                                .foregroundColor(.cyan)
                            }
                            
                            Spacer()
                        }
                        .padding(.horizontal, 20)
                        
                        // Dragon context chip
                        DragonContextChip(
                            context: .timeline(eventId: era.id.uuidString),
                            customText: "Ask about this event"
                        )
                    }
                    .padding(.top, 16)
                    
                    Spacer(minLength: 80)
                    
                }
                
            }
            
        }
        
    }
    
}
