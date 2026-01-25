// DragonCompanionView.swift
// Your dragon companion - grows with your awakening journey
// Progress persists via iCloud - survives app reinstalls

import SwiftUI

struct DragonCompanionView: View {

    // Use Repository for Core Data + iCloud persistence
    @ObservedObject private var repository = DragonCompanionRepository.shared
    @ObservedObject private var journeyChecker = AwakeningJourneyChecker.shared
    @ObservedObject private var progressionManager = DragonProgressionManager.shared

    @State private var showingOnboarding = false
    @State private var showingAwakeningCelebration = false
    @State private var showingTraitDetail: DragonTrait?
    @State private var dragonScale: CGFloat = 1.0
    @State private var dragonRotation: Double = 0

    var body: some View {

        NavigationStack {

            ZStack {

                cosmicBackground

                if repository.currentProfile == nil {
                    // No profile yet - show welcome
                    welcomeView
                } else if let dragon = repository.currentDragon {
                    companionContent(dragon: dragon)
                } else {
                    // Has profile but no dragon - create one
                    eggCreationView
                }

            }
            .navigationTitle("Dragon Companion")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    CloudSyncBadge()
                }
            }
            .sheet(isPresented: $showingOnboarding) {
                ProfileOnboardingView()
            }
            .sheet(item: $showingTraitDetail) { trait in
                TraitDetailSheet(trait: trait)
            }
            .fullScreenCover(isPresented: $showingAwakeningCelebration) {
                if let dragon = repository.currentDragon,
                   let profile = repository.currentProfile {
                    DormantDragonAwakeningView(dragon: dragon, profile: profile)
                }
            }
            .onAppear {
                checkForAwakening()
            }

        }

    }

    // MARK: - Welcome View (No Profile Yet)

    private var welcomeView: some View {

        VStack(spacing: 30) {

            Spacer()

            Text("YOUR JOURNEY BEGINS")
                .font(.system(size: 12, weight: .bold, design: .rounded))
                .foregroundColor(Palette.accent.gold)
                .tracking(3)

            Text("Receive Your Dragon Egg")
                .font(.system(size: 28, weight: .black, design: .rounded))
                .foregroundColor(.white)

            VStack(spacing: 16) {

                Text("As you complete courses and awaken to truth, your dragon will hatch, grow, and evolve alongside you.")
                    .font(.system(size: 14, weight: .medium))
                    .foregroundColor(Palette.text.secondary)

                Text("No one will push you. No one will force you.")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(Palette.accent.gold)

                Text("Your accountability comes from curiosity, will, and the desire to become free.")
                    .font(.system(size: 14, weight: .medium))
                    .foregroundColor(Palette.text.secondary)

            }
            .multilineTextAlignment(.center)
            .padding(.horizontal, 40)

            // Egg visual
            eggVisual
                .padding(.vertical, 40)

            Button(action: { showingOnboarding = true }) {
                HStack(spacing: 10) {
                    Image(systemName: "sparkles")
                    Text("Begin Your Journey")
                }
                .font(.system(size: 16, weight: .bold, design: .rounded))
                .foregroundColor(.black)
                .padding(.horizontal, 30)
                .padding(.vertical, 16)
                .background(
                    LinearGradient(
                        colors: [Palette.accent.gold, Palette.primary.orange],
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
                .cornerRadius(14)
            }

            Spacer()

            VStack(spacing: 8) {

                Text("\"When the student is ready, the teacher appears.\"")
                    .font(.system(size: 12, weight: .medium, design: .rounded))
                    .foregroundColor(Palette.text.muted)
                    .italic()

                HStack(spacing: 8) {
                    Image(systemName: "lock.shield.fill")
                        .font(.system(size: 10))
                    Text("Your data stays on YOUR device")
                        .font(.system(size: 10, weight: .medium))
                }
                .foregroundColor(Palette.text.muted)

            }

            Spacer()

        }

    }

    // MARK: - Egg Creation (Has Profile, No Dragon)

    private var eggCreationView: some View {

        VStack(spacing: 30) {

            Spacer()

            if let profile = repository.currentProfile {

                Text("Welcome back, \(profile.displayName)")
                    .font(.system(size: 24, weight: .bold, design: .rounded))
                    .foregroundColor(.white)

                eggVisual

                Button(action: createDragonFromProfile) {
                    HStack(spacing: 10) {
                        Image(systemName: "sparkles")
                        Text("Receive Your Egg")
                    }
                    .font(.system(size: 16, weight: .bold, design: .rounded))
                    .foregroundColor(.black)
                    .padding(.horizontal, 30)
                    .padding(.vertical, 16)
                    .background(Palette.accent.gold)
                    .cornerRadius(14)
                }

            }

            Spacer()

        }

    }

    private func createDragonFromProfile() {
        guard let profile = repository.currentProfile else { return }

        _ = repository.createDragon(
            name: "\(profile.displayName)'s Dragon",
            element: profile.dominantElement
        )
    }

    private var eggVisual: some View {

        ZStack {

            // Glow
            Circle()
                .fill(
                    RadialGradient(
                        colors: [
                            Palette.accent.gold.opacity(0.4),
                            Palette.primary.violet.opacity(0.2),
                            Color.clear
                        ],
                        center: .center,
                        startRadius: 40,
                        endRadius: 120
                    )
                )
                .frame(width: 240, height: 240)

            // Egg shape
            Ellipse()
                .fill(
                    LinearGradient(
                        colors: [
                            Color(hex: "#2C2C34"),
                            Color(hex: "#1A1A20"),
                            Color(hex: "#0D0D10")
                        ],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .frame(width: 100, height: 130)
                .overlay(
                    Ellipse()
                        .stroke(
                            LinearGradient(
                                colors: [
                                    Palette.accent.gold.opacity(0.6),
                                    Palette.primary.violet.opacity(0.4),
                                    Palette.accent.gold.opacity(0.2)
                                ],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            ),
                            lineWidth: 2
                        )
                )
                .shadow(color: Palette.accent.gold.opacity(0.3), radius: 20, x: 0, y: 10)

            // Mysterious pulse
            Ellipse()
                .stroke(Palette.accent.gold.opacity(0.3), lineWidth: 1)
                .frame(width: 100, height: 130)
                .scaleEffect(dragonScale)
                .opacity(2 - dragonScale)

        }
        .onAppear {
            withAnimation(.easeInOut(duration: 2).repeatForever(autoreverses: true)) {
                dragonScale = 1.15
            }
        }

    }

    // MARK: - Companion Content

    private func companionContent(dragon: DragonCompanion) -> some View {

        ScrollView(showsIndicators: false) {

            VStack(spacing: 24) {

                // Dragon Visual
                dragonVisual(dragon: dragon)

                // Name & Stage
                nameAndStage(dragon: dragon)

                // XP Progress
                xpProgress(dragon: dragon)

                // Journey Progress (to awakening)
                journeyProgress(dragon: dragon)

                // Chakra Progress
                chakraProgress(dragon: dragon)

                // Element & Traits
                elementAndTraits(dragon: dragon)

                // Tesla Numerology
                if let message = TeslaNumerology.message(for: dragon.totalXP) {
                    teslaMessage(message)
                }

                Spacer(minLength: 100)

            }
            .padding(.horizontal, 20)
            .padding(.top, 20)

        }

    }

    // MARK: - Journey Progress

    private func journeyProgress(dragon: DragonCompanion) -> some View {

        VStack(alignment: .leading, spacing: 12) {

            HStack {
                Text("JOURNEY TO AWAKENING")
                    .font(.system(size: 11, weight: .bold))
                    .foregroundColor(Palette.accent.gold)
                    .tracking(1)

                Spacer()

                Text("\(Int(journeyChecker.progressPercentage * 100))%")
                    .font(.system(size: 12, weight: .bold, design: .monospaced))
                    .foregroundColor(Palette.accent.gold)
            }

            // Progress bar
            GeometryReader { geo in
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 6)
                        .fill(Color.white.opacity(0.1))
                        .frame(height: 10)

                    RoundedRectangle(cornerRadius: 6)
                        .fill(
                            LinearGradient(
                                colors: [Palette.accent.gold, Palette.primary.orange],
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .frame(width: geo.size.width * journeyChecker.progressPercentage, height: 10)
                }
            }
            .frame(height: 10)

            if journeyChecker.isJourneyComplete {
                HStack(spacing: 8) {
                    Image(systemName: "checkmark.seal.fill")
                        .foregroundColor(Palette.accent.gold)
                    Text("Journey Complete! Your dragon is AWAKENED.")
                        .font(.system(size: 12, weight: .semibold))
                        .foregroundColor(Palette.accent.gold)
                }
            } else {
                let remaining = journeyChecker.remainingCourses.count
                Text("\(remaining) core courses remaining to awaken your dragon")
                    .font(.system(size: 11, weight: .medium))
                    .foregroundColor(Palette.text.muted)
            }

        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 14)
                .fill(Palette.accent.gold.opacity(0.1))
                .overlay(
                    RoundedRectangle(cornerRadius: 14)
                        .stroke(Palette.accent.gold.opacity(0.2), lineWidth: 1)
                )
        )

    }

    // MARK: - Check For Awakening

    private func checkForAwakening() {
        // Check if journey just completed and we haven't shown celebration yet
        if journeyChecker.isJourneyComplete {
            if let dragon = progressionManager.companion,
               dragon.stage != .ascended {
                // Journey complete but dragon not ascended yet - show celebration!
                showingAwakeningCelebration = true
            }
        }
    }

    private func dragonVisual(dragon: DragonCompanion) -> some View {

        ZStack {

            // Chakra ring based on progress
            chakraRing(dragon: dragon)

            // Dragon based on stage
            dragonImage(for: dragon)
                .scaleEffect(dragonScale)
                .rotationEffect(.degrees(dragonRotation))

            // Mood indicator
            Text(dragon.currentMood.emoji)
                .font(.system(size: 30))
                .offset(x: 60, y: -60)

        }
        .frame(height: 280)
        .onAppear {
            withAnimation(.easeInOut(duration: 3).repeatForever(autoreverses: true)) {
                dragonScale = dragon.stage == .egg ? 1.05 : 1.02
            }
            if dragon.stage.rawValue >= DragonStage.adult.rawValue {
                withAnimation(.linear(duration: 20).repeatForever(autoreverses: false)) {
                    dragonRotation = 360
                }
            }
        }

    }

    @ViewBuilder
    private func dragonImage(for dragon: DragonCompanion) -> some View {

        switch dragon.stage {
        case .egg:
            eggView(element: dragon.primaryElement)
        case .hatching:
            hatchingEggView(element: dragon.primaryElement)
        case .hatchling:
            hatchlingView(element: dragon.primaryElement)
        case .young:
            youngDragonView(element: dragon.primaryElement)
        case .adolescent:
            adolescentDragonView(element: dragon.primaryElement)
        case .adult:
            adultDragonView(element: dragon.primaryElement, secondary: dragon.secondaryElement)
        case .elder:
            elderDragonView(element: dragon.primaryElement, secondary: dragon.secondaryElement)
        case .ascended:
            ascendedDragonView(chakras: dragon.chakraProgress)
        }

    }

    private func eggView(element: DragonElement) -> some View {

        ZStack {

            Ellipse()
                .fill(
                    LinearGradient(
                        colors: [
                            element.color.opacity(0.3),
                            Color(hex: "#1A1A20"),
                            element.color.opacity(0.1)
                        ],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .frame(width: 100, height: 130)
                .overlay(
                    Ellipse()
                        .stroke(element.color.opacity(0.5), lineWidth: 2)
                )

        }

    }

    private func hatchingEggView(element: DragonElement) -> some View {

        ZStack {

            eggView(element: element)

            // Crack lines
            Path { path in
                path.move(to: CGPoint(x: 50, y: 30))
                path.addLine(to: CGPoint(x: 55, y: 50))
                path.addLine(to: CGPoint(x: 45, y: 70))
                path.addLine(to: CGPoint(x: 55, y: 90))
            }
            .stroke(element.color, lineWidth: 2)
            .frame(width: 100, height: 130)

            // Glow from within
            Circle()
                .fill(element.color.opacity(0.5))
                .frame(width: 20, height: 20)
                .blur(radius: 10)
                .offset(y: 10)

        }

    }

    private func hatchlingView(element: DragonElement) -> some View {

        ZStack {

            // Simple baby dragon shape
            Circle()
                .fill(element.color.opacity(0.3))
                .frame(width: 80, height: 80)

            Image(systemName: "bird.fill")
                .font(.system(size: 50))
                .foregroundColor(element.color)

        }

    }

    private func youngDragonView(element: DragonElement) -> some View {

        ZStack {

            Circle()
                .fill(
                    RadialGradient(
                        colors: [element.color.opacity(0.4), Color.clear],
                        center: .center,
                        startRadius: 30,
                        endRadius: 80
                    )
                )
                .frame(width: 160, height: 160)

            Image(systemName: "flame.fill")
                .font(.system(size: 70))
                .foregroundStyle(
                    LinearGradient(
                        colors: [element.color, element.color.opacity(0.6)],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )

        }

    }

    private func adolescentDragonView(element: DragonElement) -> some View {

        ZStack {

            Circle()
                .fill(
                    RadialGradient(
                        colors: [element.color.opacity(0.5), Color.clear],
                        center: .center,
                        startRadius: 40,
                        endRadius: 100
                    )
                )
                .frame(width: 200, height: 200)

            Image(systemName: "wind")
                .font(.system(size: 80))
                .foregroundStyle(
                    LinearGradient(
                        colors: [element.color, .white],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )

        }

    }

    private func adultDragonView(element: DragonElement, secondary: DragonElement?) -> some View {

        ZStack {

            // Dual element glow
            Circle()
                .fill(
                    RadialGradient(
                        colors: [
                            element.color.opacity(0.5),
                            (secondary?.color ?? element.color).opacity(0.3),
                            Color.clear
                        ],
                        center: .center,
                        startRadius: 40,
                        endRadius: 120
                    )
                )
                .frame(width: 240, height: 240)

            Image(systemName: "bolt.fill")
                .font(.system(size: 100))
                .foregroundStyle(
                    LinearGradient(
                        colors: [element.color, secondary?.color ?? element.color],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )

        }

    }

    private func elderDragonView(element: DragonElement, secondary: DragonElement?) -> some View {

        ZStack {

            Circle()
                .fill(
                    RadialGradient(
                        colors: [
                            element.color.opacity(0.6),
                            (secondary?.color ?? element.color).opacity(0.4),
                            Palette.accent.gold.opacity(0.2),
                            Color.clear
                        ],
                        center: .center,
                        startRadius: 30,
                        endRadius: 130
                    )
                )
                .frame(width: 260, height: 260)

            Image(systemName: "sparkles")
                .font(.system(size: 100))
                .foregroundStyle(
                    LinearGradient(
                        colors: [.white, element.color, secondary?.color ?? element.color],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )

        }

    }

    private func ascendedDragonView(chakras: [ChakraLevel]) -> some View {

        ZStack {

            // Full rainbow chakra glow
            ForEach(Array(chakras.enumerated()), id: \.element.id) { index, chakra in
                Circle()
                    .stroke(chakra.chakra.color.opacity(chakra.isActivated ? 0.8 : 0.2), lineWidth: 3)
                    .frame(width: CGFloat(80 + index * 25), height: CGFloat(80 + index * 25))
            }

            Image(systemName: "sun.max.fill")
                .font(.system(size: 80))
                .foregroundStyle(
                    LinearGradient(
                        colors: [.white, Palette.accent.gold, .white],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )

            // Tesla 3-6-9
            VStack(spacing: 0) {
                Text("3")
                    .offset(x: -50)
                Text("9")
                Text("6")
                    .offset(x: 50)
            }
            .font(.system(size: 20, weight: .bold, design: .rounded))
            .foregroundColor(Palette.accent.gold.opacity(0.6))

        }

    }

    private func chakraRing(dragon: DragonCompanion) -> some View {

        ZStack {

            ForEach(dragon.chakraProgress) { chakra in
                Circle()
                    .trim(from: 0, to: chakra.progress)
                    .stroke(
                        chakra.chakra.color.opacity(chakra.isActivated ? 1.0 : 0.3),
                        style: StrokeStyle(lineWidth: 4, lineCap: .round)
                    )
                    .frame(width: CGFloat(200 + chakra.chakra.position * 15))
                    .rotationEffect(.degrees(-90))
            }

        }

    }

    // MARK: - Info Sections

    private func nameAndStage(dragon: DragonCompanion) -> some View {

        VStack(spacing: 8) {

            Text(dragon.name)
                .font(.system(size: 28, weight: .black, design: .rounded))
                .foregroundColor(.white)

            HStack(spacing: 8) {
                Image(systemName: dragon.stage.icon)
                Text(dragon.stage.rawValue)
            }
            .font(.system(size: 14, weight: .semibold))
            .foregroundColor(dragon.primaryElement.color)

            Text(dragon.stage.description)
                .font(.system(size: 12, weight: .medium))
                .foregroundColor(Palette.text.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 30)

            Text("Age: \(dragon.age) days")
                .font(.system(size: 11, weight: .medium))
                .foregroundColor(Palette.text.muted)

        }

    }

    private func xpProgress(dragon: DragonCompanion) -> some View {

        VStack(spacing: 12) {

            HStack {
                Text("LEVEL \(dragon.level)")
                    .font(.system(size: 12, weight: .bold, design: .rounded))
                    .foregroundColor(Palette.accent.gold)
                Spacer()
                Text("\(dragon.totalXP) XP")
                    .font(.system(size: 12, weight: .semibold, design: .monospaced))
                    .foregroundColor(Palette.text.secondary)
            }

            // Progress to next level
            GeometryReader { geo in
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 6)
                        .fill(Color.white.opacity(0.1))
                        .frame(height: 12)

                    RoundedRectangle(cornerRadius: 6)
                        .fill(
                            LinearGradient(
                                colors: [dragon.primaryElement.color, dragon.secondaryElement?.color ?? Palette.accent.gold],
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .frame(width: geo.size.width * (1 - CGFloat(dragon.xpToNextLevel) / 1000), height: 12)
                }
            }
            .frame(height: 12)

            // Progress to next stage
            if dragon.stage != .ascended {
                let nextStage = DragonStage.allCases[DragonStage.allCases.firstIndex(of: dragon.stage)! + 1]
                let stageProgress = Double(dragon.totalXP - dragon.stage.requiredXP) / Double(nextStage.requiredXP - dragon.stage.requiredXP)

                HStack {
                    Text("Next: \(nextStage.rawValue)")
                        .font(.system(size: 10, weight: .medium))
                        .foregroundColor(Palette.text.muted)
                    Spacer()
                    Text("\(Int(stageProgress * 100))%")
                        .font(.system(size: 10, weight: .semibold))
                        .foregroundColor(Palette.text.secondary)
                }
            }

        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 14)
                .fill(Color.white.opacity(0.05))
        )

    }

    private func chakraProgress(dragon: DragonCompanion) -> some View {

        VStack(alignment: .leading, spacing: 12) {

            Text("CHAKRA PROGRESS")
                .font(.system(size: 11, weight: .bold))
                .foregroundColor(Palette.accent.gold)
                .tracking(1)

            HStack(spacing: 8) {
                ForEach(dragon.chakraProgress) { chakra in
                    VStack(spacing: 4) {
                        ZStack {
                            Circle()
                                .fill(chakra.chakra.color.opacity(0.2))
                                .frame(width: 36, height: 36)

                            Circle()
                                .trim(from: 0, to: chakra.progress)
                                .stroke(chakra.chakra.color, style: StrokeStyle(lineWidth: 3, lineCap: .round))
                                .frame(width: 36, height: 36)
                                .rotationEffect(.degrees(-90))

                            if chakra.isActivated {
                                Image(systemName: "checkmark")
                                    .font(.system(size: 12, weight: .bold))
                                    .foregroundColor(chakra.chakra.color)
                            } else {
                                Text("\(chakra.chakra.teslaNumber)")
                                    .font(.system(size: 10, weight: .bold, design: .monospaced))
                                    .foregroundColor(chakra.chakra.color.opacity(0.6))
                            }
                        }

                        Text(String(chakra.chakra.rawValue.prefix(3)))
                            .font(.system(size: 8, weight: .medium))
                            .foregroundColor(Palette.text.muted)
                    }
                }
            }

        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 14)
                .fill(Color.white.opacity(0.05))
        )

    }

    private func elementAndTraits(dragon: DragonCompanion) -> some View {

        VStack(alignment: .leading, spacing: 16) {

            // Elements
            HStack(spacing: 16) {

                VStack(alignment: .leading, spacing: 4) {
                    Text("PRIMARY")
                        .font(.system(size: 9, weight: .bold))
                        .foregroundColor(Palette.text.muted)
                    HStack(spacing: 6) {
                        Image(systemName: dragon.primaryElement.icon)
                            .foregroundColor(dragon.primaryElement.color)
                        Text(dragon.primaryElement.rawValue)
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(.white)
                    }
                }

                if let secondary = dragon.secondaryElement {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("SECONDARY")
                            .font(.system(size: 9, weight: .bold))
                            .foregroundColor(Palette.text.muted)
                        HStack(spacing: 6) {
                            Image(systemName: secondary.icon)
                                .foregroundColor(secondary.color)
                            Text(secondary.rawValue)
                                .font(.system(size: 14, weight: .semibold))
                                .foregroundColor(.white)
                        }
                    }
                }

                Spacer()

            }

            // Traits
            if !dragon.traits.isEmpty {

                Text("TRAITS (\(dragon.traits.count))")
                    .font(.system(size: 11, weight: .bold))
                    .foregroundColor(Palette.accent.gold)
                    .tracking(1)

                FlowLayoutTraits(traits: dragon.traits) { trait in
                    showingTraitDetail = trait
                }

            }

        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 14)
                .fill(Color.white.opacity(0.05))
        )

    }

    private func teslaMessage(_ message: String) -> some View {

        HStack(spacing: 12) {

            Image(systemName: "bolt.circle.fill")
                .font(.system(size: 24))
                .foregroundColor(Palette.accent.gold)

            Text(message)
                .font(.system(size: 13, weight: .medium, design: .rounded))
                .foregroundColor(Palette.accent.gold)

        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 14)
                .fill(Palette.accent.gold.opacity(0.1))
                .overlay(
                    RoundedRectangle(cornerRadius: 14)
                        .stroke(Palette.accent.gold.opacity(0.3), lineWidth: 1)
                )
        )

    }

    // MARK: - Background

    private var cosmicBackground: some View {

        ZStack {

            LinearGradient(
                colors: [
                    Color(hex: "#0a0a08"),
                    Color(hex: "#12100a"),
                    Color(hex: "#0a0a08")
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()

            ForEach(0..<60, id: \.self) { i in
                Circle()
                    .fill(i % 3 == 0 ? Palette.accent.gold.opacity(0.4) : Color.white)
                    .frame(width: CGFloat(i % 4 + 1))
                    .position(
                        x: CGFloat((i * 37) % Int(UIScreen.main.bounds.width)),
                        y: CGFloat((i * 53) % Int(UIScreen.main.bounds.height))
                    )
                    .opacity(0.4)
            }

        }

    }

}

// MARK: - Flow Layout for Traits

struct FlowLayoutTraits: View {

    let traits: [DragonTrait]
    let onTap: (DragonTrait) -> Void

    var body: some View {

        LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))], spacing: 8) {
            ForEach(traits) { trait in
                Button(action: { onTap(trait) }) {
                    HStack(spacing: 6) {
                        Image(systemName: trait.icon)
                            .font(.system(size: 12))
                        Text(trait.name)
                            .font(.system(size: 11, weight: .semibold))
                            .lineLimit(1)
                    }
                    .foregroundColor(trait.rarity.color)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 6)
                    .background(
                        Capsule()
                            .fill(trait.rarity.color.opacity(0.15))
                    )
                }
            }
        }

    }

}

// MARK: - Egg Naming Sheet

struct EggNamingSheet: View {

    @Environment(\.dismiss) private var dismiss
    @State private var dragonName: String = ""

    var body: some View {

        NavigationStack {

            ZStack {

                Color.black.ignoresSafeArea()

                VStack(spacing: 30) {

                    Text("🥚")
                        .font(.system(size: 80))

                    Text("Name Your Dragon")
                        .font(.system(size: 24, weight: .bold, design: .rounded))
                        .foregroundColor(.white)

                    Text("Choose wisely. This companion will grow with you on your awakening journey.")
                        .font(.system(size: 14, weight: .medium))
                        .foregroundColor(Palette.text.secondary)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 40)

                    TextField("Dragon Name", text: $dragonName)
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.white.opacity(0.1))
                        .cornerRadius(12)
                        .padding(.horizontal, 40)

                    Button(action: createDragon) {
                        Text("Begin Journey")
                            .font(.system(size: 16, weight: .bold))
                            .foregroundColor(.black)
                            .padding(.horizontal, 40)
                            .padding(.vertical, 14)
                            .background(Palette.accent.gold)
                            .cornerRadius(12)
                    }
                    .disabled(dragonName.isEmpty)
                    .opacity(dragonName.isEmpty ? 0.5 : 1)

                }

            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Cancel") { dismiss() }
                        .foregroundColor(Palette.text.secondary)
                }
            }

        }

    }

    private func createDragon() {
        _ = DragonProgressionManager.shared.createEgg(name: dragonName)
        dismiss()
    }

}

// MARK: - Trait Detail Sheet

struct TraitDetailSheet: View {

    let trait: DragonTrait
    @Environment(\.dismiss) private var dismiss

    var body: some View {

        NavigationStack {

            ZStack {

                Color.black.ignoresSafeArea()

                VStack(spacing: 24) {

                    ZStack {
                        Circle()
                            .fill(trait.rarity.color.opacity(0.2))
                            .frame(width: 100, height: 100)

                        Image(systemName: trait.icon)
                            .font(.system(size: 50))
                            .foregroundColor(trait.rarity.color)
                    }

                    Text(trait.name)
                        .font(.system(size: 24, weight: .bold, design: .rounded))
                        .foregroundColor(.white)

                    Text(trait.rarity.rawValue.uppercased())
                        .font(.system(size: 12, weight: .bold))
                        .foregroundColor(trait.rarity.color)
                        .tracking(2)

                    Text(trait.description)
                        .font(.system(size: 16, weight: .medium))
                        .foregroundColor(Palette.text.secondary)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 30)

                    Spacer()

                    HStack(spacing: 8) {
                        Image(systemName: "lock.open.fill")
                            .font(.system(size: 12))
                        Text("Unlocked by: \(trait.unlockedBy)")
                            .font(.system(size: 13, weight: .medium))
                    }
                    .foregroundColor(Palette.text.muted)

                    Spacer()

                }
                .padding(.top, 40)

            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: { dismiss() }) {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(Palette.text.secondary)
                    }
                }
            }

        }

    }

}

// MARK: - Preview

#Preview {

    DragonCompanionView()

}
