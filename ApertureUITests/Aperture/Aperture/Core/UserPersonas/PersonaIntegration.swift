// PersonaIntegration.swift
// Connects AwakeningPersonas to the existing onboarding system
// Links persona selection to content recommendations

import SwiftUI

// MARK: - Persona Storage Manager

class PersonaManager: ObservableObject {
    static let shared = PersonaManager()
    
    @Published var selectedPersona: AwakeningPersona? {
        didSet {
            if let persona = selectedPersona {
                savePersona(persona)
            }
        }
    }
    
    @Published var userName: String {
        didSet {
            UserDefaults.standard.set(userName, forKey: "aperture_user_name")
        }
    }
    
    @Published var hasSelectedPersona: Bool {
        didSet {
            UserDefaults.standard.set(hasSelectedPersona, forKey: "has_selected_persona")
        }
    }
    
    private let personaKey = "selected_persona_id"
    
    init() {
        self.userName = UserDefaults.standard.string(forKey: "aperture_user_name") ?? ""
        self.hasSelectedPersona = UserDefaults.standard.bool(forKey: "has_selected_persona")
        loadPersona()
    }
    
    private func loadPersona() {
        if let personaRaw = UserDefaults.standard.string(forKey: personaKey),
           let persona = AwakeningPersona(rawValue: personaRaw) {
            self.selectedPersona = persona
        }
    }
    
    private func savePersona(_ persona: AwakeningPersona) {
        UserDefaults.standard.set(persona.rawValue, forKey: personaKey)
        hasSelectedPersona = true
    }
    
    func reset() {
        selectedPersona = nil
        userName = ""
        hasSelectedPersona = false
        UserDefaults.standard.removeObject(forKey: personaKey)
        UserDefaults.standard.removeObject(forKey: "aperture_user_name")
        UserDefaults.standard.removeObject(forKey: "has_selected_persona")
    }
    
    // MARK: - Content Recommendations
    
    func getContentTone() -> ContentTone {
        selectedPersona?.contentTone ?? ContentTone(
            approach: .gentle,
            useScience: true,
            useSpiritual: false,
            challengeLevel: .gradual,
            emphasisOnEvidence: true
        )
    }
    
    func getRecommendedCourses() -> [String] {
        selectedPersona?.recommendedCourses ?? ["pattern_recognition", "awakening_arsenal"]
    }
    
    func getWelcomeMessage() -> String {
        if let persona = selectedPersona {
            let name = userName.isEmpty ? "seeker" : userName
            return "Welcome back, \(name). " + persona.welcomeMessage
        }
        return "Welcome to Aperture. Your awakening journey awaits."
    }
}

// MARK: - Persona Selection View (Standalone)

struct PersonaSelectionView: View {
    
    @ObservedObject var manager = PersonaManager.shared
    @State private var selectedPersona: AwakeningPersona?
    @Environment(\.dismiss) private var dismiss
    var onComplete: ((AwakeningPersona) -> Void)?
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(
                    colors: [Color(hex: "#050510"), Color(hex: "#0A0A1A")],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 20) {
                        headerSection
                        personaCardsSection
                        confirmButtonSection
                        Spacer(minLength: 100)
                    }
                    .padding(.horizontal, 20)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button { dismiss() } label: {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.white.opacity(0.6))
                    }
                }
            }
        }
    }
    
    private var headerSection: some View {
        VStack(spacing: 12) {
            Image(systemName: "person.fill.questionmark")
                .font(.system(size: 40))
                .foregroundColor(.purple)
            
            Text("Where Are You in Your Journey?")
                .font(.system(size: 22, weight: .bold))
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
            
            Text("This helps us personalize your experience.\nYou can change this anytime.")
                .font(.system(size: 14))
                .foregroundColor(.white.opacity(0.6))
                .multilineTextAlignment(.center)
        }
        .padding(.top, 20)
        .padding(.horizontal, 20)
    }
    
    private var personaCardsSection: some View {
        ForEach(AwakeningPersona.allCases) { persona in
            PersonaCardView(
                persona: persona,
                isSelected: selectedPersona == persona,
                onSelect: {
                    withAnimation(.spring(response: 0.3)) {
                        selectedPersona = persona
                    }
                    HapticManager.shared.light()
                }
            )
        }
    }
    
    @ViewBuilder
    private var confirmButtonSection: some View {
        if let persona = selectedPersona {
            ConfirmPersonaSection(
                persona: persona,
                onConfirm: {
                    manager.selectedPersona = persona
                    onComplete?(persona)
                    dismiss()
                }
            )
        }
    }
}

// MARK: - Persona Card View

private struct PersonaCardView: View {
    let persona: AwakeningPersona
    let isSelected: Bool
    let onSelect: () -> Void
    
    var body: some View {
        Button(action: onSelect) {
            VStack(alignment: .leading, spacing: 12) {
                mainContentRow
                if isSelected {
                    primaryNeedRow
                }
            }
            .padding(16)
            .background(cardBackground)
        }
    }
    
    private var mainContentRow: some View {
        HStack {
            iconView
            textContent
            Spacer()
            selectionIndicator
        }
    }
    
    private var iconView: some View {
        ZStack {
            Circle()
                .fill(persona.color.opacity(0.2))
                .frame(width: 50, height: 50)
            
            Image(systemName: persona.icon)
                .font(.system(size: 22))
                .foregroundColor(persona.color)
        }
    }
    
    private var textContent: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(persona.displayName)
                .font(.system(size: 17, weight: .bold))
                .foregroundColor(.white)
            
            Text(persona.primaryNeed)
                .font(.system(size: 13))
                .foregroundColor(.white.opacity(0.7))
                .lineLimit(2)
        }
    }
    
    private var selectionIndicator: some View {
        ZStack {
            Circle()
                .stroke(isSelected ? persona.color : Color.white.opacity(0.2), lineWidth: 2)
                .frame(width: 26, height: 26)
            
            if isSelected {
                Circle()
                    .fill(persona.color)
                    .frame(width: 16, height: 16)
            }
        }
    }
    
    private var primaryNeedRow: some View {
        HStack {
            Text("Focus:")
                .font(.system(size: 11, weight: .medium))
                .foregroundColor(.white.opacity(0.5))
            Text(persona.primaryNeed)
                .font(.system(size: 11, weight: .semibold))
                .foregroundColor(persona.color)
        }
        .padding(.top, 4)
    }
    
    private var cardBackground: some View {
        RoundedRectangle(cornerRadius: 16)
            .fill(isSelected ? persona.color.opacity(0.1) : Color.white.opacity(0.03))
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(
                        isSelected ? persona.color.opacity(0.5) : Color.white.opacity(0.05),
                        lineWidth: isSelected ? 2 : 1
                    )
            )
    }
}

// MARK: - Confirm Persona Section

private struct ConfirmPersonaSection: View {
    let persona: AwakeningPersona
    let onConfirm: () -> Void
    
    var body: some View {
        VStack(spacing: 16) {
            descriptionText
            recommendedCoursesSection
            confirmButton
        }
        .padding(.top, 10)
    }
    
    private var descriptionText: some View {
        Text(persona.description)
            .font(.system(size: 14))
            .foregroundColor(.white.opacity(0.8))
            .multilineTextAlignment(.center)
            .padding(.horizontal, 10)
    }
    
    private var recommendedCoursesSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Recommended Starting Courses:")
                .font(.system(size: 12, weight: .semibold))
                .foregroundColor(.white.opacity(0.5))
            
            PersonaFlowLayout(spacing: 8) {
                ForEach(persona.recommendedStartingCourses, id: \.self) { course in
                    Text(course)
                        .font(.system(size: 12, weight: .medium))
                        .foregroundColor(.white)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 6)
                        .background(
                            Capsule()
                                .fill(Color.white.opacity(0.1))
                        )
                }
            }
        }
    }
    
    private var confirmButton: some View {
        Button(action: onConfirm) {
            Text("This Is Me")
                .font(.system(size: 17, weight: .bold))
                .foregroundColor(.black)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 16)
                .background(
                    RoundedRectangle(cornerRadius: 14)
                        .fill(persona.color)
                )
        }
    }
}

// MARK: - Flow Layout for Tags

struct PersonaFlowLayout: Layout {
    var spacing: CGFloat = 8
    
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        let result = FlowResult(in: proposal.width ?? 0, subviews: subviews, spacing: spacing)
        return CGSize(width: proposal.width ?? 0, height: result.height)
    }
    
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        let result = FlowResult(in: bounds.width, subviews: subviews, spacing: spacing)
        for (index, subview) in subviews.enumerated() {
            subview.place(at: CGPoint(x: bounds.minX + result.positions[index].x,
                                      y: bounds.minY + result.positions[index].y),
                         proposal: .unspecified)
        }
    }
    
    struct FlowResult {
        var positions: [CGPoint] = []
        var height: CGFloat = 0
        
        init(in width: CGFloat, subviews: Subviews, spacing: CGFloat) {
            var x: CGFloat = 0
            var y: CGFloat = 0
            var rowHeight: CGFloat = 0
            
            for subview in subviews {
                let size = subview.sizeThatFits(.unspecified)
                
                if x + size.width > width && x > 0 {
                    x = 0
                    y += rowHeight + spacing
                    rowHeight = 0
                }
                
                positions.append(CGPoint(x: x, y: y))
                rowHeight = max(rowHeight, size.height)
                x += size.width + spacing
            }
            
            height = y + rowHeight
        }
    }
}

// MARK: - Settings Integration

struct PersonaSettingsRow: View {
    
    @ObservedObject var manager = PersonaManager.shared
    @State private var showPersonaSelection = false
    
    var body: some View {
        Button {
            showPersonaSelection = true
        } label: {
            HStack(spacing: 14) {
                iconView
                textContent
                Spacer()
                chevron
            }
            .padding(14)
            .background(
                RoundedRectangle(cornerRadius: 14)
                    .fill(Color.white.opacity(0.05))
            )
        }
        .sheet(isPresented: $showPersonaSelection) {
            PersonaSelectionView()
        }
    }
    
    private var iconView: some View {
        ZStack {
            Circle()
                .fill(currentColor.opacity(0.2))
                .frame(width: 44, height: 44)
            
            Image(systemName: manager.selectedPersona?.icon ?? "person.fill.questionmark")
                .font(.system(size: 18))
                .foregroundColor(currentColor)
        }
    }
    
    private var textContent: some View {
        VStack(alignment: .leading, spacing: 2) {
            Text("Your Persona")
                .font(.system(size: 15, weight: .semibold))
                .foregroundColor(.white)
            
            Text(manager.selectedPersona?.displayName ?? "Not selected")
                .font(.system(size: 13))
                .foregroundColor(.white.opacity(0.6))
        }
    }
    
    private var chevron: some View {
        Image(systemName: "chevron.right")
            .font(.system(size: 14))
            .foregroundColor(.white.opacity(0.4))
    }
    
    private var currentColor: Color {
        manager.selectedPersona?.color ?? .gray
    }
}

// MARK: - Dashboard Greeting

struct PersonalizedGreeting: View {
    
    @ObservedObject var manager = PersonaManager.shared
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(greeting)
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(.white)
            
            if let persona = manager.selectedPersona {
                Text(persona.primaryNeed)
                    .font(.system(size: 14))
                    .foregroundColor(persona.color)
            }
        }
    }
    
    private var greeting: String {
        let hour = Calendar.current.component(.hour, from: Date())
        let name = manager.userName.isEmpty ? "Seeker" : manager.userName
        
        switch hour {
        case 5..<12:
            return "Good morning, \(name)"
        case 12..<17:
            return "Good afternoon, \(name)"
        case 17..<21:
            return "Good evening, \(name)"
        default:
            return "Welcome back, \(name)"
        }
    }
}

#Preview {
    PersonaSelectionView()
}
