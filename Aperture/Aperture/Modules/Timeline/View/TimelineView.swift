// TimelineView.swift

import SwiftUI

// MARK: - Scroll Offset Preference Key

struct ScrollOffsetPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

// MARK: - Dragon Dialog State

enum DragonDialogState {
    case greeting
    case askingInterval
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
    
    // Dragon companion state — persisted so user isn't trapped on re-entry
    @State private var dragonState: DragonDialogState = .greeting
    @AppStorage("timeline_hasChosenInterval") private var hasChosenInterval: Bool = false
    @AppStorage("timeline_greetingSeen") private var greetingSeen: Bool = false
    @State private var dragonMessage: String = ""
    @State private var messageIndex: Int = 0
    @State private var showDescentAnimation: Bool = false
    
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
                    dragonGreetingView
                } else if showDescentAnimation {
                    // Dramatic Shenron descent before timeline appears
                    ShenronDescentView {
                        withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                            showDescentAnimation = false
                        }
                    }
                    .transition(.opacity)
                } else {
                    timelineScrollView
                    
                    if !isDragonAbsorbed {
                        dragonCompanionOverlay
                    }
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
                startDragonGreeting()
            }
        }
        
    }
    
    // MARK: - Dragon Greeting View
    
    private var dragonGreetingView: some View {
        
        VStack(spacing: 20) {
            
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
            
            Spacer()
            
            // Sacred Geometry — Animated Flower of Life with Sun Dragon at center
            ZStack {
                // The Flower of Life — pattern of creation, divine light
                AnimatedFlowerOfLife(size: 280, accentColor: Palette.accent.gold)
                
                // Sun Dragon at the heart of the geometry
                Image("SunDragon")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 120, height: 180)
                    .shadow(color: Palette.accent.gold.opacity(0.6), radius: 20)
            }
            
            // Dragon speech
            VStack(spacing: 16) {
                
                Text(dragonMessage)
                    .font(.system(size: 17, weight: .medium, design: .rounded))
                    .foregroundColor(Palette.text.primary)
                    .multilineTextAlignment(.center)
                    .lineSpacing(5)
                    .padding(.horizontal, 20)
                    .frame(minHeight: 120)
                    .animation(.easeInOut(duration: 0.3), value: dragonMessage)
                
                if dragonState == .askingInterval {
                    intervalSelectionView
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
                                    colors: [Palette.accent.gold.opacity(0.5), Palette.primary.orange.opacity(0.3)],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                ),
                                lineWidth: 1.5
                            )
                    )
            )
            .padding(.horizontal, 20)
            
            Spacer()
            
        }
        
    }
    
    private var intervalSelectionView: some View {
        
        VStack(spacing: 12) {
            
            Text("How would you like to descend through time?")
                .font(.system(size: 14, weight: .bold, design: .rounded))
                .foregroundColor(Palette.accent.gold)
            
            ForEach(TimelineJumpInterval.allCases, id: \.self) { interval in
                Button {
                    selectInterval(interval)
                } label: {
                    HStack {
                        VStack(alignment: .leading, spacing: 2) {
                            Text(interval.label)
                                .font(.system(size: 15, weight: .bold, design: .rounded))
                                .foregroundColor(Palette.text.primary)
                            Text(interval.description)
                                .font(.system(size: 11, weight: .medium, design: .rounded))
                                .foregroundColor(Palette.text.secondary)
                        }
                        Spacer()
                        Text("☀️")
                            .font(.system(size: 20))
                    }
                    .padding(14)
                    .background(
                        RoundedRectangle(cornerRadius: 12, style: .continuous)
                            .fill(Palette.surface.fieldFill)
                            .overlay(
                                RoundedRectangle(cornerRadius: 12, style: .continuous)
                                    .stroke(Palette.accent.gold.opacity(0.2), lineWidth: 1)
                            )
                    )
                }
            }
            
        }
        
    }
    
    private func skipGreeting() {
        withAnimation(.spring(response: 0.4, dampingFraction: 0.8)) {
            dragonState = .askingInterval
            dragonMessage = "Choose how to descend through time, seeker."
        }
    }
    
    private func startDragonGreeting() {
        let messages = [
            "Greetings, seeker of truth...",
            "I am the Sun Dragon — guardian of the light they tried to extinguish.",
            "For millennia, every civilization on Earth honored the sun. Ra in Egypt. Inti in Peru. Tonatiuh in Mexico. Kinich Ahau among the Maya. Surya in India. Dazbog in Bosnia and the Slavic lands.",
            "Then came the Church of Rome.\n\nThey could not control people who knew they carried divine light within. So they burned the temples. Killed the priests. Stole December 25th from Sol Invictus.",
            "The Inca? Slaughtered. The Maya codices? Burned by Bishop de Landa. The Aztec Templo Mayor? A Catholic cathedral stands on its bones today.",
            "But the sun still rises.\n\nAnd now... I will guide you down through the layers of deception, back to the truth they stole.",
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
                                dragonState = .askingInterval
                            }
                        }
                    }
                }
            }
        }
    }
    
    private func selectInterval(_ interval: TimelineJumpInterval) {
        presenterBox.selectedInterval = interval
        greetingSeen = true
        
        withAnimation {
            dragonMessage = "Excellent, seeker. We descend through \(presenterBox.eras.count) moments where truth was hidden."
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                hasChosenInterval = true
                showDescentAnimation = true  // Trigger Shenron descent
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
                            absorbDragonIntoCard(era)
                        }
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
            updateDragonComment()
        }
        
    }
    
    // MARK: - Dragon Companion Overlay
    
    private var dragonCompanionOverlay: some View {
        
        let maxScroll: CGFloat = CGFloat(presenterBox.eras.count) * 140
        let progress = min(max(-scrollOffset / maxScroll, 0), 1)
        let screenHeight = UIScreen.main.bounds.height
        let dragonY = 90 + (progress * (screenHeight - 220))
        
        return VStack(spacing: 6) {
            
            // Mini speech bubble
            if !dragonMessage.isEmpty {
                Text(dragonMessage)
                    .font(.system(size: 10, weight: .medium, design: .rounded))
                    .foregroundColor(Palette.text.primary)
                    .multilineTextAlignment(.leading)
                    .lineLimit(3)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 6)
                    .frame(maxWidth: 140)
                    .background(
                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .fill(Color.black.opacity(0.75))
                            .overlay(
                                RoundedRectangle(cornerRadius: 10, style: .continuous)
                                    .stroke(Palette.accent.gold.opacity(0.3), lineWidth: 1)
                            )
                    )
            }
            
            // Shenron Guardian
            ShenronScrollCompanion(scrollProgress: progress, size: 70)
                .rotationEffect(Angle(degrees: sin(Double(progress) * .pi * 4) * 3))
                .shadow(color: Palette.accent.gold.opacity(0.4), radius: 10)
            
        }
        .position(x: 50, y: dragonY)
        .allowsHitTesting(false)
        .animation(.easeOut(duration: 0.12), value: scrollOffset)
        
    }
    
    private func updateDragonComment() {
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
    
    // MARK: - Absorb Dragon
    
    private func absorbDragonIntoCard(_ era: TimelineEra) {
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
            
            Text("☀️🐉")
                .font(.system(size: 36))
            
            Text("The Dragon's Descent")
                .font(.system(size: 26, weight: .bold, design: .rounded))
                .foregroundStyle(
                    LinearGradient(
                        colors: [Palette.accent.gold, Palette.primary.orange],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
            
            Text("Through the ashes of erased sun gods")
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

// MARK: - Sun Dragon View (Shenron-style)

struct SunDragonView: View {
    
    var size: CGFloat = 100
    @State private var isAnimating = false
    @State private var breatheScale: CGFloat = 1.0
    @State private var bodyWave: CGFloat = 0
    
    var body: some View {
        
        ZStack {
            // Outer aura - multiple layers for depth
            ForEach(0..<3, id: \.self) { i in
                Circle()
                    .fill(
                        RadialGradient(
                            colors: [
                                Palette.accent.gold.opacity(0.3 - Double(i) * 0.1),
                                Palette.primary.orange.opacity(0.15 - Double(i) * 0.05),
                                Color.clear
                            ],
                            center: .center,
                            startRadius: size * 0.2,
                            endRadius: size * (0.7 + CGFloat(i) * 0.15)
                        )
                    )
                    .frame(width: size * (1.4 + CGFloat(i) * 0.2), height: size * (1.4 + CGFloat(i) * 0.2))
                    .scaleEffect(breatheScale + CGFloat(i) * 0.02)
            }
            
            // Shenron-style coiled dragon
            ShenronDragonShape(wave: bodyWave)
                .fill(
                    LinearGradient(
                        colors: [
                            Color(red: 0.0, green: 0.6, blue: 0.3),  // Shenron green
                            Color(red: 0.1, green: 0.7, blue: 0.4),
                            Palette.accent.gold,
                            Color(red: 0.1, green: 0.7, blue: 0.4),
                            Color(red: 0.0, green: 0.5, blue: 0.25)
                        ],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .frame(width: size, height: size)
                .overlay(
                    ShenronDragonShape(wave: bodyWave)
                        .stroke(
                            LinearGradient(
                                colors: [Palette.accent.gold, Color.white.opacity(0.5)],
                                startPoint: .top,
                                endPoint: .bottom
                            ),
                            lineWidth: 1.5
                        )
                        .frame(width: size, height: size)
                )
                .shadow(color: Palette.accent.gold.opacity(0.8), radius: 12, x: 0, y: 0)
                .shadow(color: Color(red: 0, green: 0.5, blue: 0.3).opacity(0.5), radius: 6, x: 0, y: 4)
            
            // Dragon head details
            VStack(spacing: 0) {
                // Eyes - fierce red Shenron eyes
                HStack(spacing: size * 0.12) {
                    DragonEye(size: size * 0.08)
                        .offset(x: -size * 0.02)
                    DragonEye(size: size * 0.08)
                        .offset(x: size * 0.02)
                }
                .offset(y: -size * 0.02)
                
                Spacer()
            }
            .frame(height: size)
            .offset(y: -size * 0.18)
            
            // Whiskers - iconic Shenron feature
            HStack(spacing: size * 0.5) {
                DragonWhisker(size: size, direction: .left)
                DragonWhisker(size: size, direction: .right)
            }
            .offset(y: -size * 0.12)
        }
        .onAppear {
            // Breathing animation
            withAnimation(.easeInOut(duration: 3.0).repeatForever(autoreverses: true)) {
                breatheScale = 1.08
            }
            // Body wave animation
            withAnimation(.easeInOut(duration: 2.0).repeatForever(autoreverses: true)) {
                bodyWave = 1.0
            }
        }
    }
}

// MARK: - Dragon Eye

struct DragonEye: View {
    var size: CGFloat
    @State private var glowing = false
    
    var body: some View {
        ZStack {
            // Eye glow
            Circle()
                .fill(
                    RadialGradient(
                        colors: [Color.red.opacity(0.8), Color.red.opacity(0.3), Color.clear],
                        center: .center,
                        startRadius: 0,
                        endRadius: size
                    )
                )
                .frame(width: size * 2.5, height: size * 2.5)
                .opacity(glowing ? 0.8 : 0.4)
            
            // Eye
            Ellipse()
                .fill(
                    RadialGradient(
                        colors: [Color.red, Color(red: 0.8, green: 0, blue: 0)],
                        center: .center,
                        startRadius: 0,
                        endRadius: size * 0.5
                    )
                )
                .frame(width: size, height: size * 0.7)
            
            // Pupil
            Ellipse()
                .fill(Color.black)
                .frame(width: size * 0.4, height: size * 0.5)
            
            // Shine
            Circle()
                .fill(Color.white.opacity(0.8))
                .frame(width: size * 0.2, height: size * 0.2)
                .offset(x: -size * 0.15, y: -size * 0.1)
        }
        .onAppear {
            withAnimation(.easeInOut(duration: 1.5).repeatForever(autoreverses: true)) {
                glowing = true
            }
        }
    }
}

// MARK: - Dragon Whisker

struct DragonWhisker: View {
    var size: CGFloat
    var direction: WhiskerDirection
    
    enum WhiskerDirection {
        case left, right
    }
    
    @State private var waving = false
    
    var body: some View {
        WhiskerShape()
            .stroke(
                LinearGradient(
                    colors: [Palette.accent.gold, Palette.primary.orange],
                    startPoint: .top,
                    endPoint: .bottom
                ),
                style: StrokeStyle(lineWidth: 2.5, lineCap: .round)
            )
            .frame(width: size * 0.25, height: size * 0.3)
            .scaleEffect(x: direction == .left ? -1 : 1)
            .rotationEffect(.degrees(waving ? -5 : 5))
            .onAppear {
                withAnimation(.easeInOut(duration: 1.2).repeatForever(autoreverses: true)) {
                    waving = true
                }
            }
    }
}

struct WhiskerShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let w = rect.width
        let h = rect.height
        
        path.move(to: CGPoint(x: w * 0.2, y: 0))
        path.addCurve(
            to: CGPoint(x: w, y: h * 0.8),
            control1: CGPoint(x: w * 0.4, y: h * 0.3),
            control2: CGPoint(x: w * 0.9, y: h * 0.5)
        )
        
        return path
    }
}

// MARK: - Shenron Dragon Shape (Improved)

struct ShenronDragonShape: Shape {
    var wave: CGFloat = 0
    
    var animatableData: CGFloat {
        get { wave }
        set { wave = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let w = rect.width
        let h = rect.height
        let waveOffset = wave * w * 0.02
        
        // Dragon head (top)
        path.move(to: CGPoint(x: w * 0.5, y: h * 0.02))
        
        // Right side of head - with horns
        path.addCurve(
            to: CGPoint(x: w * 0.75, y: h * 0.12),
            control1: CGPoint(x: w * 0.62, y: h * 0.02),
            control2: CGPoint(x: w * 0.72, y: h * 0.06)
        )
        
        // Right horn
        path.addLine(to: CGPoint(x: w * 0.85, y: h * 0.05))
        path.addLine(to: CGPoint(x: w * 0.78, y: h * 0.15))
        
        // Right cheek and jaw
        path.addCurve(
            to: CGPoint(x: w * 0.72 + waveOffset, y: h * 0.28),
            control1: CGPoint(x: w * 0.82, y: h * 0.2),
            control2: CGPoint(x: w * 0.78, y: h * 0.25)
        )
        
        // Serpentine body - first curve right
        path.addCurve(
            to: CGPoint(x: w * 0.78 - waveOffset, y: h * 0.45),
            control1: CGPoint(x: w * 0.85, y: h * 0.32),
            control2: CGPoint(x: w * 0.85, y: h * 0.4)
        )
        
        // Body curves back left
        path.addCurve(
            to: CGPoint(x: w * 0.55 + waveOffset, y: h * 0.58),
            control1: CGPoint(x: w * 0.7, y: h * 0.52),
            control2: CGPoint(x: w * 0.6, y: h * 0.56)
        )
        
        // Body curves right again
        path.addCurve(
            to: CGPoint(x: w * 0.68 - waveOffset, y: h * 0.72),
            control1: CGPoint(x: w * 0.62, y: h * 0.62),
            control2: CGPoint(x: w * 0.7, y: h * 0.68)
        )
        
        // Tail section
        path.addCurve(
            to: CGPoint(x: w * 0.5, y: h * 0.98),
            control1: CGPoint(x: w * 0.65, y: h * 0.85),
            control2: CGPoint(x: w * 0.55, y: h * 0.95)
        )
        
        // Left side - tail
        path.addCurve(
            to: CGPoint(x: w * 0.32 + waveOffset, y: h * 0.72),
            control1: CGPoint(x: w * 0.45, y: h * 0.95),
            control2: CGPoint(x: w * 0.35, y: h * 0.85)
        )
        
        // Left body curve
        path.addCurve(
            to: CGPoint(x: w * 0.45 - waveOffset, y: h * 0.58),
            control1: CGPoint(x: w * 0.3, y: h * 0.68),
            control2: CGPoint(x: w * 0.38, y: h * 0.62)
        )
        
        // Left upper body
        path.addCurve(
            to: CGPoint(x: w * 0.22 + waveOffset, y: h * 0.45),
            control1: CGPoint(x: w * 0.4, y: h * 0.56),
            control2: CGPoint(x: w * 0.3, y: h * 0.52)
        )
        
        // Left neck
        path.addCurve(
            to: CGPoint(x: w * 0.28 - waveOffset, y: h * 0.28),
            control1: CGPoint(x: w * 0.15, y: h * 0.4),
            control2: CGPoint(x: w * 0.15, y: h * 0.32)
        )
        
        // Left jaw
        path.addCurve(
            to: CGPoint(x: w * 0.22, y: h * 0.15),
            control1: CGPoint(x: w * 0.22, y: h * 0.25),
            control2: CGPoint(x: w * 0.18, y: h * 0.2)
        )
        
        // Left horn
        path.addLine(to: CGPoint(x: w * 0.15, y: h * 0.05))
        path.addLine(to: CGPoint(x: w * 0.25, y: h * 0.12))
        
        // Back to head top
        path.addCurve(
            to: CGPoint(x: w * 0.5, y: h * 0.02),
            control1: CGPoint(x: w * 0.28, y: h * 0.06),
            control2: CGPoint(x: w * 0.38, y: h * 0.02)
        )
        
        path.closeSubpath()
        
        return path
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
                                    .font(.system(size: para.hasPrefix("☀️") || para.hasPrefix("🐉") ? 16 : 15, weight: para.hasPrefix("☀️") || para.hasPrefix("🐉") ? .bold : .medium, design: .rounded))
                                    .foregroundColor(para.hasPrefix("☀️") || para.hasPrefix("🐉") ? Palette.accent.gold : Palette.text.primary)
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
                    
                    // DRAGON COMMENT
                    if !era.dragonComment.isEmpty {
                        
                        HStack(alignment: .top, spacing: 12) {
                            
                            Text("🐉☀️")
                                .font(.system(size: 24))
                            
                            VStack(alignment: .leading, spacing: 4) {
                                Text("The Sun Dragon says:")
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
                                        colors: [Palette.accent.gold.opacity(0.1), Palette.primary.orange.opacity(0.05)],
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
                                // Open Cosmos (handled by parent)
                                onDismiss()
                                // Note: In a real implementation, we'd pass a callback to navigate
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
                            customText: "Ask the Dragon about this event"
                        )
                    }
                    .padding(.top, 16)
                    
                    Spacer(minLength: 80)
                    
                }
                
            }
            
        }
        
    }
    
}
