// DormantDragonAwakeningView.swift
// The moment of awakening - when your dragon fully emerges
// This is earned through your own curiosity, will, and desire to be free

import SwiftUI

struct DormantDragonAwakeningView: View {

    let dragon: DragonCompanion
    let profile: UserAwakeningProfile

    @Environment(\.dismiss) private var dismiss
    @State private var phase: AwakeningPhase = .dormant
    @State private var glowIntensity: Double = 0
    @State private var textOpacity: Double = 0
    @State private var dragonScale: CGFloat = 0.5
    @State private var ringRotation: Double = 0

    var body: some View {

        ZStack {

            cosmicBackground

            VStack(spacing: 0) {

                Spacer()

                dragonAwakeningVisual

                Spacer()

                awakeneningMessages

                Spacer()

                if phase == .complete {
                    completeButton
                }

                Spacer()

            }

        }
        .onAppear {
            startAwakeningSequence()
        }

    }

    // MARK: - Dragon Visual

    private var dragonAwakeningVisual: some View {

        ZStack {

            // Chakra rings
            ForEach(0..<7, id: \.self) { i in
                Circle()
                    .stroke(
                        chakraColor(for: i).opacity(phase.rawValue >= 2 ? 0.8 : 0.1),
                        lineWidth: 3
                    )
                    .frame(width: CGFloat(100 + i * 30), height: CGFloat(100 + i * 30))
                    .rotationEffect(.degrees(ringRotation + Double(i * 15)))
            }

            // Central glow
            Circle()
                .fill(
                    RadialGradient(
                        colors: [
                            Color.white.opacity(glowIntensity),
                            dragon.primaryElement.color.opacity(glowIntensity * 0.6),
                            Color.clear
                        ],
                        center: .center,
                        startRadius: 20,
                        endRadius: 150
                    )
                )
                .frame(width: 300, height: 300)

            // Dragon imagery based on phase
            dragonImageForPhase
                .scaleEffect(dragonScale)

            // Tesla 3-6-9 overlay for ascended
            if phase == .awakened || phase == .complete {
                tesla369Overlay
            }

        }
        .frame(height: 400)

    }

    @ViewBuilder
    private var dragonImageForPhase: some View {

        switch phase {
        case .dormant:
            // Egg with faint glow
            Text("🥚")
                .font(.system(size: 80))
                .opacity(0.5)

        case .stirring:
            // Egg cracking
            ZStack {
                Text("🥚")
                    .font(.system(size: 80))
                Path { path in
                    path.move(to: CGPoint(x: 40, y: 10))
                    path.addLine(to: CGPoint(x: 50, y: 40))
                    path.addLine(to: CGPoint(x: 35, y: 60))
                }
                .stroke(dragon.primaryElement.color, lineWidth: 3)
                .frame(width: 80, height: 80)
            }

        case .hatching:
            // Light bursting from egg
            ZStack {
                ForEach(0..<8, id: \.self) { i in
                    Rectangle()
                        .fill(dragon.primaryElement.color)
                        .frame(width: 3, height: 50)
                        .offset(y: -50)
                        .rotationEffect(.degrees(Double(i) * 45))
                }
                Text("💥")
                    .font(.system(size: 60))
            }

        case .emerging:
            // Baby dragon emerging
            VStack(spacing: 0) {
                Image(systemName: "flame.fill")
                    .font(.system(size: 70))
                    .foregroundStyle(
                        LinearGradient(
                            colors: [dragon.primaryElement.color, dragon.secondaryElement?.color ?? .white],
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )
            }

        case .awakened:
            // Full majestic dragon
            ZStack {
                Image(systemName: "sparkles")
                    .font(.system(size: 100))
                    .foregroundStyle(
                        LinearGradient(
                            colors: rainbowColors,
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )
            }

        case .complete:
            // Ascended form
            ZStack {
                Image(systemName: "sun.max.fill")
                    .font(.system(size: 80))
                    .foregroundStyle(
                        LinearGradient(
                            colors: [.white, Palette.accent.gold],
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )

                Text(dragon.name)
                    .font(.system(size: 14, weight: .bold, design: .rounded))
                    .foregroundColor(Palette.accent.gold)
                    .offset(y: 70)
            }
        }

    }

    private var tesla369Overlay: some View {

        ZStack {

            Text("3")
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .foregroundColor(Palette.accent.gold.opacity(0.8))
                .offset(x: -80, y: 0)

            Text("9")
                .font(.system(size: 40, weight: .black, design: .rounded))
                .foregroundColor(Palette.accent.gold)
                .offset(y: -10)

            Text("6")
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .foregroundColor(Palette.accent.gold.opacity(0.8))
                .offset(x: 80, y: 0)

            Text("0")
                .font(.system(size: 24, weight: .medium, design: .rounded))
                .foregroundColor(.white.opacity(0.6))
                .offset(y: -120)

        }

    }

    // MARK: - Messages

    private var awakeneningMessages: some View {

        VStack(spacing: 16) {

            Text(messageForPhase)
                .font(.system(size: 18, weight: .semibold, design: .rounded))
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .opacity(textOpacity)

            if phase == .complete {
                VStack(spacing: 8) {

                    Text("You did this, \(profile.displayName).")
                        .font(.system(size: 14, weight: .medium))
                        .foregroundColor(Palette.text.secondary)

                    Text("No one pushed you. No one forced you.")
                        .font(.system(size: 14, weight: .medium))
                        .foregroundColor(Palette.text.secondary)

                    Text("Your curiosity, will, and desire brought you here.")
                        .font(.system(size: 14, weight: .medium))
                        .foregroundColor(Palette.accent.gold)

                }
                .multilineTextAlignment(.center)
                .opacity(textOpacity)
                .padding(.top, 10)
            }

        }
        .padding(.horizontal, 40)

    }

    private var messageForPhase: String {
        switch phase {
        case .dormant:
            return "Something stirs within..."
        case .stirring:
            return "The shell begins to crack..."
        case .hatching:
            return "Light breaks through!"
        case .emerging:
            return "Your dragon emerges!"
        case .awakened:
            return "AWAKENED"
        case .complete:
            return "You are now a Creator of Good"
        }
    }

    // MARK: - Complete Button

    private var completeButton: some View {

        Button(action: { dismiss() }) {
            HStack(spacing: 10) {
                Image(systemName: "sparkles")
                Text("Begin Creating Good")
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
        .opacity(textOpacity)

    }

    // MARK: - Background

    private var cosmicBackground: some View {

        ZStack {

            LinearGradient(
                colors: [
                    Color(hex: "#000000"),
                    Color(hex: "#0a0510"),
                    Color(hex: "#100818"),
                    Color(hex: "#0a0510"),
                    Color(hex: "#000000")
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()

            // Stars
            ForEach(0..<100, id: \.self) { i in
                Circle()
                    .fill(Color.white)
                    .frame(width: CGFloat(i % 3 + 1))
                    .position(
                        x: CGFloat((i * 37) % Int(UIScreen.main.bounds.width)),
                        y: CGFloat((i * 53) % Int(UIScreen.main.bounds.height))
                    )
                    .opacity(Double(i % 5 + 3) / 10)
            }

            // Nebula colors
            if phase.rawValue >= 3 {
                ForEach(0..<5, id: \.self) { i in
                    Circle()
                        .fill(rainbowColors[i % rainbowColors.count].opacity(0.1))
                        .frame(width: CGFloat(200 + i * 50))
                        .blur(radius: 50)
                        .offset(
                            x: CGFloat((i * 80) - 160),
                            y: CGFloat((i * 60) - 150)
                        )
                }
            }

        }

    }

    // MARK: - Animation Sequence

    private func startAwakeningSequence() {

        // Phase 1: Dormant → Stirring (2 seconds)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            withAnimation(.easeInOut(duration: 1)) {
                phase = .stirring
                glowIntensity = 0.2
                textOpacity = 1
            }
        }

        // Phase 2: Stirring → Hatching (4 seconds)
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            withAnimation(.easeInOut(duration: 1)) {
                phase = .hatching
                glowIntensity = 0.5
                dragonScale = 0.8
            }
        }

        // Phase 3: Hatching → Emerging (6 seconds)
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            withAnimation(.easeInOut(duration: 1)) {
                phase = .emerging
                glowIntensity = 0.7
                dragonScale = 1.0
            }
            withAnimation(.linear(duration: 10).repeatForever(autoreverses: false)) {
                ringRotation = 360
            }
        }

        // Phase 4: Emerging → Awakened (8 seconds)
        DispatchQueue.main.asyncAfter(deadline: .now() + 7) {
            withAnimation(.easeInOut(duration: 1.5)) {
                phase = .awakened
                glowIntensity = 1.0
                dragonScale = 1.2
            }
            // Haptic feedback
            let generator = UINotificationFeedbackGenerator()
            generator.notificationOccurred(.success)
        }

        // Phase 5: Awakened → Complete (10 seconds)
        DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
            withAnimation(.easeInOut(duration: 1)) {
                phase = .complete
                dragonScale = 1.0
            }
        }

    }

    // MARK: - Helpers

    private func chakraColor(for index: Int) -> Color {
        let colors: [Color] = [
            Color(hex: "#FF0000"),  // Root
            Color(hex: "#FF7F00"),  // Sacral
            Color(hex: "#FFFF00"),  // Solar Plexus
            Color(hex: "#00FF00"),  // Heart
            Color(hex: "#00BFFF"),  // Throat
            Color(hex: "#4B0082"),  // Third Eye
            Color(hex: "#9400D3")   // Crown
        ]
        return colors[index % colors.count]
    }

    private var rainbowColors: [Color] {
        [
            Color(hex: "#FF0000"),
            Color(hex: "#FF7F00"),
            Color(hex: "#FFFF00"),
            Color(hex: "#00FF00"),
            Color(hex: "#00BFFF"),
            Color(hex: "#4B0082"),
            Color(hex: "#9400D3")
        ]
    }

}

// MARK: - Awakening Phase

enum AwakeningPhase: Int {

    case dormant = 0
    case stirring = 1
    case hatching = 2
    case emerging = 3
    case awakened = 4
    case complete = 5

}

// MARK: - Journey Completion Checker

class JourneyCompletionChecker: ObservableObject {

    static let shared = JourneyCompletionChecker()

    @Published var completedCourses: Set<String> = []
    @Published var isJourneyComplete: Bool = false

    private let storageKey = "completed_courses"

    private let requiredCourses: Set<String> = [
        // Core Truth Courses
        "institutional_lies",
        "master_lies",
        "the_matrix",
        "control_systems",

        // History & Religion
        "hidden_history",
        "colonial_christianity",
        "religion_exposed",
        "bible_decoded",

        // Consciousness
        "consciousness",
        "sacred_geometry",

        // Personal Power
        "sunflow_state",
        "dragon_ball_awakening",

        // The final piece
        "pattern_recognition"
    ]

    private init() {
        loadCompletedCourses()
        checkCompletion()
    }

    func markCourseComplete(_ courseId: String) {
        completedCourses.insert(courseId)
        saveCompletedCourses()
        checkCompletion()
    }

    func checkCompletion() {
        isJourneyComplete = requiredCourses.isSubset(of: completedCourses)

        if isJourneyComplete {
            // Award the final trait
            if var dragon = DragonProgressionManager.shared.companion {
                let creatorTrait = DragonTrait(
                    id: "creator_of_good",
                    name: "Creator of Good",
                    description: "You completed the journey. Now use your knowledge to make the world better.",
                    icon: "heart.fill",
                    rarity: .mythic,
                    unlockedBy: "Complete All Core Courses"
                )
                if !dragon.traits.contains(where: { $0.id == "creator_of_good" }) {
                    dragon.traits.append(creatorTrait)
                    dragon.stage = .ascended
                    DragonProgressionManager.shared.companion = dragon
                    DragonProgressionManager.shared.saveCompanion()
                }
            }
        }
    }

    func saveCompletedCourses() {
        let array = Array(completedCourses)
        UserDefaults.standard.set(array, forKey: storageKey)
    }

    func loadCompletedCourses() {
        if let array = UserDefaults.standard.stringArray(forKey: storageKey) {
            completedCourses = Set(array)
        }
    }

    var progressPercentage: Double {
        Double(completedCourses.intersection(requiredCourses).count) / Double(requiredCourses.count)
    }

    var remainingCourses: [String] {
        Array(requiredCourses.subtracting(completedCourses))
    }

}

// MARK: - Preview

#Preview {

    let dragon = DragonCompanion(
        id: UUID(),
        name: "Aurion",
        stage: .ascended,
        primaryElement: .cosmic,
        secondaryElement: .light,
        chakraProgress: ChakraType.allCases.map { ChakraLevel(chakra: $0, progress: 1.0, isActivated: true) },
        traits: [],
        birthDate: Date(),
        totalXP: 100000,
        currentMood: .transcendent
    )

    let profile = UserAwakeningProfile(
        id: UUID(),
        displayName: "Seeker",
        birthDate: Date(),
        zodiacSign: .taurus,
        favoriteColors: ["#FFD700", "#7C5CFF"],
        awakeningMotivation: .seekingTruth,
        resonatesWith: [.dragonBall, .consciousness],
        learningStyle: .visual,
        lifeGoals: [.freedom, .truth, .creation],
        personalMantra: nil,
        createdAt: Date(),
        updatedAt: Date()
    )

    DormantDragonAwakeningView(dragon: dragon, profile: profile)

}
