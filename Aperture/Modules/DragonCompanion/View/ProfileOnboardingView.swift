// ProfileOnboardingView.swift
// Gather information to personalize your dragon companion
// Your data stays on YOUR device - no one else sees it

import SwiftUI

struct ProfileOnboardingView: View {

    @Environment(\.dismiss) private var dismiss
    @StateObject private var viewModel = OnboardingViewModel()

    var body: some View {

        NavigationStack {

            ZStack {

                cosmicBackground

                TabView(selection: $viewModel.currentStep) {

                    welcomeStep
                        .tag(OnboardingStep.welcome)

                    nameStep
                        .tag(OnboardingStep.name)

                    birthDateStep
                        .tag(OnboardingStep.birthDate)

                    motivationStep
                        .tag(OnboardingStep.motivation)

                    resonanceStep
                        .tag(OnboardingStep.resonance)

                    learningStyleStep
                        .tag(OnboardingStep.learningStyle)

                    goalsStep
                        .tag(OnboardingStep.goals)

                    colorsStep
                        .tag(OnboardingStep.colors)

                    completeStep
                        .tag(OnboardingStep.complete)

                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                .animation(.easeInOut, value: viewModel.currentStep)

            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    if viewModel.currentStep != .welcome {
                        Button(action: viewModel.previousStep) {
                            Image(systemName: "chevron.left")
                                .foregroundColor(Palette.text.secondary)
                        }
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    progressIndicator
                }
            }

        }

    }

    // MARK: - Progress Indicator

    private var progressIndicator: some View {

        HStack(spacing: 4) {
            ForEach(OnboardingStep.allCases, id: \.self) { step in
                Circle()
                    .fill(step.rawValue <= viewModel.currentStep.rawValue ? Palette.accent.gold : Color.white.opacity(0.2))
                    .frame(width: 6, height: 6)
            }
        }

    }

    // MARK: - Welcome Step

    private var welcomeStep: some View {

        VStack(spacing: 30) {

            Spacer()

            Text("🐉")
                .font(.system(size: 80))

            Text("Your Dragon Awaits")
                .font(.system(size: 28, weight: .black, design: .rounded))
                .foregroundColor(.white)

            VStack(spacing: 16) {

                Text("Before your dragon egg arrives, we'd like to know a little about you.")
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(Palette.text.secondary)

                Text("This helps personalize your companion to match your unique journey.")
                    .font(.system(size: 14, weight: .medium))
                    .foregroundColor(Palette.text.muted)

            }
            .multilineTextAlignment(.center)
            .padding(.horizontal, 40)

            Spacer()

            privacyNote

            continueButton(text: "Begin", enabled: true) {
                viewModel.nextStep()
            }

            Spacer()

        }

    }

    private var privacyNote: some View {

        HStack(spacing: 8) {

            Image(systemName: "lock.shield.fill")
                .foregroundColor(Palette.accent.gold)

            Text("Your data stays on YOUR device. We don't collect or sell your information.")
                .font(.system(size: 11, weight: .medium))
                .foregroundColor(Palette.text.muted)

        }
        .padding(.horizontal, 30)

    }

    // MARK: - Name Step

    private var nameStep: some View {

        VStack(spacing: 30) {

            Spacer()

            stepHeader(
                emoji: "✨",
                title: "What should we call you?",
                subtitle: "This is how your dragon will know you"
            )

            TextField("Your name", text: $viewModel.displayName)
                .font(.system(size: 20, weight: .semibold))
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .padding()
                .background(Color.white.opacity(0.1))
                .cornerRadius(12)
                .padding(.horizontal, 50)

            Spacer()

            continueButton(text: "Continue", enabled: !viewModel.displayName.isEmpty) {
                viewModel.nextStep()
            }

            Spacer()

        }

    }

    // MARK: - Birth Date Step

    private var birthDateStep: some View {

        VStack(spacing: 30) {

            Spacer()

            stepHeader(
                emoji: "🌟",
                title: "When were you born?",
                subtitle: "This helps align your dragon with cosmic energies (optional)"
            )

            DatePicker(
                "",
                selection: Binding(
                    get: { viewModel.birthDate ?? Date() },
                    set: { viewModel.birthDate = $0 }
                ),
                displayedComponents: .date
            )
            .datePickerStyle(.wheel)
            .labelsHidden()
            .colorScheme(.dark)

            if let date = viewModel.birthDate {
                let zodiac = ZodiacSign.from(date: date)
                HStack(spacing: 8) {
                    Text(zodiac.symbol)
                        .font(.system(size: 24))
                    Text(zodiac.rawValue)
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(zodiac.element.color)
                }
            }

            Spacer()

            HStack(spacing: 16) {

                Button(action: {
                    viewModel.birthDate = nil
                    viewModel.nextStep()
                }) {
                    Text("Skip")
                        .font(.system(size: 14, weight: .medium))
                        .foregroundColor(Palette.text.muted)
                }

                continueButton(text: "Continue", enabled: true) {
                    viewModel.nextStep()
                }

            }

            Spacer()

        }

    }

    // MARK: - Motivation Step

    private var motivationStep: some View {

        VStack(spacing: 24) {

            stepHeader(
                emoji: "🔥",
                title: "What brought you here?",
                subtitle: "What's driving your awakening?"
            )

            ScrollView(showsIndicators: false) {

                VStack(spacing: 12) {

                    ForEach(AwakeningMotivation.allCases, id: \.self) { motivation in
                        motivationCard(motivation)
                    }

                }
                .padding(.horizontal, 20)

            }

            continueButton(text: "Continue", enabled: viewModel.motivation != nil) {
                viewModel.nextStep()
            }
            .padding(.bottom, 20)

        }
        .padding(.top, 20)

    }

    private func motivationCard(_ motivation: AwakeningMotivation) -> some View {

        let isSelected = viewModel.motivation == motivation

        return Button(action: { viewModel.motivation = motivation }) {

            HStack(spacing: 14) {

                Image(systemName: motivation.icon)
                    .font(.system(size: 20))
                    .foregroundColor(isSelected ? .white : motivation.suggestedElement.color)
                    .frame(width: 40)

                VStack(alignment: .leading, spacing: 4) {
                    Text(motivation.rawValue)
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(isSelected ? .white : Palette.text.primary)

                    Text(motivation.description)
                        .font(.system(size: 11, weight: .medium))
                        .foregroundColor(isSelected ? .white.opacity(0.8) : Palette.text.muted)
                        .lineLimit(2)
                }

                Spacer()

                if isSelected {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(.white)
                }

            }
            .padding(14)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(isSelected ? motivation.suggestedElement.color : Color.white.opacity(0.05))
            )

        }

    }

    // MARK: - Resonance Step

    private var resonanceStep: some View {

        VStack(spacing: 24) {

            stepHeader(
                emoji: "📡",
                title: "What resonates with you?",
                subtitle: "Select all that call to you"
            )

            ScrollView(showsIndicators: false) {

                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 12) {

                    ForEach(ResonanceType.allCases, id: \.self) { resonance in
                        resonanceCard(resonance)
                    }

                }
                .padding(.horizontal, 20)

            }

            continueButton(text: "Continue", enabled: !viewModel.resonances.isEmpty) {
                viewModel.nextStep()
            }
            .padding(.bottom, 20)

        }
        .padding(.top, 20)

    }

    private func resonanceCard(_ resonance: ResonanceType) -> some View {

        let isSelected = viewModel.resonances.contains(resonance)

        return Button(action: {
            if isSelected {
                viewModel.resonances.removeAll { $0 == resonance }
            } else {
                viewModel.resonances.append(resonance)
            }
        }) {

            VStack(spacing: 10) {

                Image(systemName: resonance.icon)
                    .font(.system(size: 24))
                    .foregroundColor(isSelected ? .white : resonance.color)

                Text(resonance.rawValue)
                    .font(.system(size: 11, weight: .semibold))
                    .foregroundColor(isSelected ? .white : Palette.text.secondary)
                    .multilineTextAlignment(.center)
                    .lineLimit(2)

            }
            .frame(maxWidth: .infinity)
            .frame(height: 90)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(isSelected ? resonance.color : Color.white.opacity(0.05))
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(isSelected ? resonance.color : Color.clear, lineWidth: 2)
                    )
            )

        }

    }

    // MARK: - Learning Style Step

    private var learningStyleStep: some View {

        VStack(spacing: 24) {

            stepHeader(
                emoji: "📚",
                title: "How do you learn best?",
                subtitle: "This helps us recommend the right content"
            )

            ScrollView(showsIndicators: false) {

                VStack(spacing: 12) {

                    ForEach(LearningStyle.allCases, id: \.self) { style in
                        learningStyleCard(style)
                    }

                }
                .padding(.horizontal, 20)

            }

            continueButton(text: "Continue", enabled: viewModel.learningStyle != nil) {
                viewModel.nextStep()
            }
            .padding(.bottom, 20)

        }
        .padding(.top, 20)

    }

    private func learningStyleCard(_ style: LearningStyle) -> some View {

        let isSelected = viewModel.learningStyle == style

        return Button(action: { viewModel.learningStyle = style }) {

            HStack(spacing: 14) {

                Image(systemName: style.icon)
                    .font(.system(size: 22))
                    .foregroundColor(isSelected ? .white : Palette.primary.cyan)
                    .frame(width: 40)

                Text(style.rawValue)
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(isSelected ? .white : Palette.text.primary)

                Spacer()

                if isSelected {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(.white)
                }

            }
            .padding(14)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(isSelected ? Palette.primary.cyan : Color.white.opacity(0.05))
            )

        }

    }

    // MARK: - Goals Step

    private var goalsStep: some View {

        VStack(spacing: 24) {

            stepHeader(
                emoji: "🎯",
                title: "What do you seek?",
                subtitle: "Choose up to 3 life goals"
            )

            ScrollView(showsIndicators: false) {

                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 12) {

                    ForEach(LifeGoal.allCases, id: \.self) { goal in
                        goalCard(goal)
                    }

                }
                .padding(.horizontal, 20)

            }

            continueButton(text: "Continue", enabled: !viewModel.goals.isEmpty) {
                viewModel.nextStep()
            }
            .padding(.bottom, 20)

        }
        .padding(.top, 20)

    }

    private func goalCard(_ goal: LifeGoal) -> some View {

        let isSelected = viewModel.goals.contains(goal)
        let canSelect = viewModel.goals.count < 3 || isSelected

        return Button(action: {
            if isSelected {
                viewModel.goals.removeAll { $0 == goal }
            } else if canSelect {
                viewModel.goals.append(goal)
            }
        }) {

            VStack(spacing: 8) {

                Image(systemName: goal.icon)
                    .font(.system(size: 22))
                    .foregroundColor(isSelected ? .white : Palette.accent.gold)

                Text(goal.rawValue)
                    .font(.system(size: 12, weight: .semibold))
                    .foregroundColor(isSelected ? .white : Palette.text.secondary)

            }
            .frame(maxWidth: .infinity)
            .frame(height: 80)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(isSelected ? Palette.accent.gold : Color.white.opacity(0.05))
            )
            .opacity(canSelect ? 1 : 0.5)

        }
        .disabled(!canSelect)

    }

    // MARK: - Colors Step

    private var colorsStep: some View {

        VStack(spacing: 24) {

            stepHeader(
                emoji: "🎨",
                title: "Choose your colors",
                subtitle: "These will influence your dragon's appearance"
            )

            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 4), spacing: 16) {

                ForEach(colorOptions, id: \.self) { hex in
                    colorCircle(hex: hex)
                }

            }
            .padding(.horizontal, 30)

            if !viewModel.selectedColors.isEmpty {
                HStack(spacing: 8) {
                    Text("Selected:")
                        .font(.system(size: 12, weight: .medium))
                        .foregroundColor(Palette.text.muted)

                    ForEach(viewModel.selectedColors, id: \.self) { hex in
                        Circle()
                            .fill(Color(hex: hex))
                            .frame(width: 24, height: 24)
                    }
                }
            }

            Spacer()

            continueButton(text: "Continue", enabled: !viewModel.selectedColors.isEmpty) {
                viewModel.nextStep()
            }
            .padding(.bottom, 20)

        }
        .padding(.top, 20)

    }

    private let colorOptions = [
        "#FF6B35", "#FF0000", "#FF7F00", "#FFFF00",
        "#00FF00", "#00BFFF", "#4B0082", "#9400D3",
        "#FFD700", "#E040FB", "#4FC3F7", "#8D6E63",
        "#FFFFFF", "#B0BEC5", "#37474F", "#000000"
    ]

    private func colorCircle(hex: String) -> some View {

        let isSelected = viewModel.selectedColors.contains(hex)
        let canSelect = viewModel.selectedColors.count < 3 || isSelected

        return Button(action: {
            if isSelected {
                viewModel.selectedColors.removeAll { $0 == hex }
            } else if canSelect {
                viewModel.selectedColors.append(hex)
            }
        }) {
            Circle()
                .fill(Color(hex: hex))
                .frame(width: 50, height: 50)
                .overlay(
                    Circle()
                        .stroke(isSelected ? Color.white : Color.clear, lineWidth: 3)
                )
                .overlay(
                    isSelected ? Image(systemName: "checkmark")
                        .foregroundColor(hex == "#FFFFFF" || hex == "#FFFF00" ? .black : .white)
                        .font(.system(size: 16, weight: .bold))
                    : nil
                )
        }
        .opacity(canSelect ? 1 : 0.5)
        .disabled(!canSelect)

    }

    // MARK: - Complete Step

    private var completeStep: some View {

        VStack(spacing: 30) {

            Spacer()

            ZStack {

                Circle()
                    .fill(
                        RadialGradient(
                            colors: viewModel.selectedColors.isEmpty
                                ? [Palette.accent.gold.opacity(0.4), Color.clear]
                                : viewModel.selectedColors.map { Color(hex: $0).opacity(0.4) } + [Color.clear],
                            center: .center,
                            startRadius: 40,
                            endRadius: 120
                        )
                    )
                    .frame(width: 240, height: 240)

                Text("🥚")
                    .font(.system(size: 100))

            }

            Text("Your egg is ready, \(viewModel.displayName)!")
                .font(.system(size: 24, weight: .black, design: .rounded))
                .foregroundColor(.white)

            if let zodiac = viewModel.birthDate.map({ ZodiacSign.from(date: $0) }) {
                Text("\(zodiac.symbol) \(zodiac.rawValue) • \(viewModel.motivation?.suggestedElement.rawValue ?? "Void") Element")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(viewModel.motivation?.suggestedElement.color ?? Palette.accent.gold)
            }

            Text("Complete courses to hatch your dragon and watch it evolve into a reflection of your awakening journey.")
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(Palette.text.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 40)

            Spacer()

            Button(action: completeOnboarding) {
                HStack(spacing: 10) {
                    Image(systemName: "sparkles")
                    Text("Receive Your Egg")
                }
                .font(.system(size: 16, weight: .bold, design: .rounded))
                .foregroundColor(.black)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 16)
                .background(
                    LinearGradient(
                        colors: [Palette.accent.gold, Palette.primary.orange],
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
                .cornerRadius(14)
                .padding(.horizontal, 30)
            }

            Spacer()

        }

    }

    // MARK: - Helpers

    private func stepHeader(emoji: String, title: String, subtitle: String) -> some View {

        VStack(spacing: 12) {

            Text(emoji)
                .font(.system(size: 50))

            Text(title)
                .font(.system(size: 22, weight: .bold, design: .rounded))
                .foregroundColor(.white)

            Text(subtitle)
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(Palette.text.secondary)
                .multilineTextAlignment(.center)

        }
        .padding(.horizontal, 30)

    }

    private func continueButton(text: String, enabled: Bool, action: @escaping () -> Void) -> some View {

        Button(action: action) {
            Text(text)
                .font(.system(size: 16, weight: .bold))
                .foregroundColor(enabled ? .black : .gray)
                .padding(.horizontal, 50)
                .padding(.vertical, 14)
                .background(enabled ? Palette.accent.gold : Color.white.opacity(0.1))
                .cornerRadius(12)
        }
        .disabled(!enabled)

    }

    private var cosmicBackground: some View {

        ZStack {

            Color.black.ignoresSafeArea()

            ForEach(0..<40, id: \.self) { i in
                Circle()
                    .fill(Color.white)
                    .frame(width: CGFloat(i % 3 + 1))
                    .position(
                        x: CGFloat((i * 41) % Int(UIScreen.main.bounds.width)),
                        y: CGFloat((i * 67) % Int(UIScreen.main.bounds.height))
                    )
                    .opacity(0.3)
            }

        }

    }

    // MARK: - Actions

    private func completeOnboarding() {

        // Create profile
        let profile = UserProfileManager.shared.createProfile(
            displayName: viewModel.displayName,
            birthDate: viewModel.birthDate,
            motivation: viewModel.motivation ?? .seekingTruth,
            resonances: viewModel.resonances,
            learningStyle: viewModel.learningStyle ?? .visual,
            goals: viewModel.goals,
            colors: viewModel.selectedColors
        )

        // Create dragon egg with personalized settings
        var dragon = DragonProgressionManager.shared.createEgg(name: "\(viewModel.displayName)'s Dragon")
        dragon.primaryElement = profile.dominantElement

        // Save updated dragon
        DragonProgressionManager.shared.companion = dragon
        DragonProgressionManager.shared.saveCompanion()
        
        // Haptic feedback for profile completion - awakening moment!
        HapticManager.shared.awakeningMoment()

        dismiss()

    }
}

// MARK: - Onboarding View Model

class OnboardingViewModel: ObservableObject {

    @Published var currentStep: OnboardingStep = .welcome
    @Published var displayName: String = ""
    @Published var birthDate: Date? = nil
    @Published var motivation: AwakeningMotivation? = nil
    @Published var resonances: [ResonanceType] = []
    @Published var learningStyle: LearningStyle? = nil
    @Published var goals: [LifeGoal] = []
    @Published var selectedColors: [String] = []

    func nextStep() {
        if let nextIndex = OnboardingStep.allCases.firstIndex(of: currentStep).map({ $0 + 1 }),
           nextIndex < OnboardingStep.allCases.count {
            currentStep = OnboardingStep.allCases[nextIndex]
            HapticManager.shared.selectionChanged()
        }
    }

    func previousStep() {
        if let prevIndex = OnboardingStep.allCases.firstIndex(of: currentStep).map({ $0 - 1 }),
           prevIndex >= 0 {
            currentStep = OnboardingStep.allCases[prevIndex]
            HapticManager.shared.soft()
        }
    }

}

enum OnboardingStep: Int, CaseIterable {

    case welcome = 0
    case name = 1
    case birthDate = 2
    case motivation = 3
    case resonance = 4
    case learningStyle = 5
    case goals = 6
    case colors = 7
    case complete = 8

}

// MARK: - Preview

#Preview {

    ProfileOnboardingView()

}
