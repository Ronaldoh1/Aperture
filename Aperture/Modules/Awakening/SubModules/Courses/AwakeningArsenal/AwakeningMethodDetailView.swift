// AwakeningMethodDetailView.swift
// Comprehensive how-to guide for each awakening method
// Step-by-step practical instruction

import SwiftUI
import AVFoundation

struct AwakeningMethodDetailView: View {
    let method: AwakeningMethod
    @State private var selectedTab = 0
    @State private var expandedSteps: Set<Int> = []
    @State private var completedSteps: Set<Int> = []
    @StateObject private var voiceGuide = VoiceGuideManager()
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                // Hero Header
                heroHeader
                
                // Tab Selector
                tabSelector
                
                // Content based on tab
                switch selectedTab {
                case 0:
                    overviewSection
                case 1:
                    howToSection
                case 2:
                    safetySection
                case 3:
                    resourcesSection
                default:
                    overviewSection
                }
            }
        }
        .background(Color.black.ignoresSafeArea())
        .navigationBarTitleDisplayMode(.inline)
    }
    
    // MARK: - Hero Header
    
    private var heroHeader: some View {
        VStack(spacing: 16) {
            // Icon
            ZStack {
                Circle()
                    .fill(
                        RadialGradient(
                            colors: [method.uiColor, method.uiColor.opacity(0.3)],
                            center: .center,
                            startRadius: 0,
                            endRadius: 50
                        )
                    )
                    .frame(width: 100, height: 100)
                
                Text(method.icon)
                    .font(.system(size: 50))
            }
            
            // Title
            Text(method.name)
                .font(.system(size: 28, weight: .black))
                .foregroundColor(.white)
            
            // Tradition & Region
            HStack(spacing: 12) {
                Label(method.tradition, systemImage: "building.columns")
                    .font(.system(size: 12))
                    .foregroundColor(method.uiColor)
                
                Text("•")
                    .foregroundColor(.gray)
                
                Text(method.region)
                    .font(.system(size: 12))
                    .foregroundColor(.gray)
            }
            
            // Energy Name
            HStack(spacing: 4) {
                Text("Energy:")
                    .font(.system(size: 11))
                    .foregroundColor(.gray)
                
                Text(method.energyName)
                    .font(.system(size: 11, weight: .medium))
                    .foregroundColor(method.uiColor)
            }
            
            // Tagline
            Text(method.tagline)
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(.white.opacity(0.9))
                .multilineTextAlignment(.center)
                .padding(.horizontal)
                .padding(.top, 8)
        }
        .padding()
        .background(
            LinearGradient(
                colors: [method.uiColor.opacity(0.3), Color.clear],
                startPoint: .top,
                endPoint: .bottom
            )
        )
    }
    
    // MARK: - Tab Selector
    
    private var tabSelector: some View {
        HStack(spacing: 0) {
            tabButton("Overview", 0)
            tabButton("How-To", 1)
            tabButton("Safety", 2)
            tabButton("Resources", 3)
        }
        .padding(.horizontal)
        .padding(.vertical, 8)
    }
    
    private func tabButton(_ title: String, _ index: Int) -> some View {
        Button(action: {
            withAnimation { selectedTab = index }
        }) {
            Text(title)
                .font(.system(size: 13, weight: selectedTab == index ? .bold : .medium))
                .foregroundColor(selectedTab == index ? method.uiColor : .gray)
                .padding(.vertical, 10)
                .frame(maxWidth: .infinity)
                .background(
                    selectedTab == index ?
                    method.uiColor.opacity(0.2) : Color.clear
                )
                .cornerRadius(8)
        }
    }
    
    // MARK: - Overview Section
    
    private var overviewSection: some View {
        VStack(alignment: .leading, spacing: 20) {
            // Full Description
            sectionHeader("ABOUT THIS PATH", "book.fill")
            
            Text(method.overview)
                .font(.system(size: 14))
                .foregroundColor(.white.opacity(0.9))
                .lineSpacing(6)
            
            // Same Truth Banner
            sameTruthBanner
        }
        .padding()
    }
    
    private func sectionHeader(_ title: String, _ icon: String) -> some View {
        HStack(spacing: 8) {
            Image(systemName: icon)
                .foregroundColor(method.uiColor)
            Text(title)
                .font(.system(size: 12, weight: .black))
                .foregroundColor(method.uiColor)
        }
        .padding(.top, 8)
    }
    
    private var sameTruthBanner: some View {
        VStack(spacing: 10) {
            HStack {
                Image(systemName: "equal.circle.fill")
                    .foregroundColor(.green)
                Text("SAME TRUTH, DIFFERENT WORDS")
                    .font(.system(size: 12, weight: .black))
                    .foregroundColor(.green)
            }
            
            Text("This path describes the same awakening as all others. Energy rises, ego dissolves, unity is realized. The names change, the experience is one.")
                .font(.system(size: 12))
                .foregroundColor(.white.opacity(0.8))
                .multilineTextAlignment(.center)
        }
        .padding()
        .background(Color.green.opacity(0.1))
        .cornerRadius(12)
    }
    
    // MARK: - How-To Section
    
    private var howToSection: some View {
        VStack(alignment: .leading, spacing: 20) {
            // Voice Guide Banner
            voiceGuideBanner
            
            sectionHeader("STEP-BY-STEP GUIDE", "list.number")
            
            Text("Practical steps to begin this awakening path. Build gradually—this isn't a race.")
                .font(.system(size: 13))
                .foregroundColor(.gray)
            
            // Steps
            ForEach(method.steps) { step in
                stepCard(step)
            }
            
            // Integration Reminder
            integrationReminder
        }
        .padding()
    }
    
    private var voiceGuideBanner: some View {
        VStack(spacing: 12) {
            HStack {
                Image(systemName: "waveform.circle.fill")
                    .foregroundColor(.cyan)
                    .font(.system(size: 24))
                
                VStack(alignment: .leading, spacing: 2) {
                    Text("Voice Guidance Available")
                        .font(.system(size: 14, weight: .bold))
                        .foregroundColor(.white)
                    Text("Coming soon: Audio guides for each practice")
                        .font(.system(size: 11))
                        .foregroundColor(.gray)
                }
                
                Spacer()
                
                // Placeholder button
                Button(action: {
                    // Voice guide will be implemented
                }) {
                    Image(systemName: "play.circle.fill")
                        .font(.system(size: 32))
                        .foregroundColor(.cyan.opacity(0.5))
                }
                .disabled(true)
            }
        }
        .padding()
        .background(Color.cyan.opacity(0.1))
        .cornerRadius(12)
    }
    
    private func stepCard(_ step: AwakeningStep) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            stepCardHeader(step)
            
            if expandedSteps.contains(step.stepNumber) {
                stepCardExpandedContent(step)
            }
        }
        .padding()
        .background(Color.white.opacity(0.05))
        .cornerRadius(12)
    }
    
    private func stepCardHeader(_ step: AwakeningStep) -> some View {
        Button(action: {
            withAnimation {
                if expandedSteps.contains(step.stepNumber) {
                    expandedSteps.remove(step.stepNumber)
                } else {
                    expandedSteps.insert(step.stepNumber)
                }
            }
        }) {
            HStack(spacing: 12) {
                stepNumberCircle(step)
                stepTitleAndDuration(step)
                Spacer()
                Image(systemName: expandedSteps.contains(step.stepNumber) ? "chevron.up" : "chevron.down")
                    .foregroundColor(.gray)
                    .font(.system(size: 12))
            }
        }
    }
    
    private func stepNumberCircle(_ step: AwakeningStep) -> some View {
        ZStack {
            Circle()
                .fill(completedSteps.contains(step.stepNumber) ? Color.green : method.uiColor.opacity(0.3))
                .frame(width: 36, height: 36)
            
            if completedSteps.contains(step.stepNumber) {
                Image(systemName: "checkmark")
                    .font(.system(size: 14, weight: .bold))
                    .foregroundColor(.white)
            } else {
                Text("\(step.stepNumber)")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(method.uiColor)
            }
        }
    }
    
    private func stepTitleAndDuration(_ step: AwakeningStep) -> some View {
        VStack(alignment: .leading, spacing: 2) {
            Text(step.title)
                .font(.system(size: 15, weight: .semibold))
                .foregroundColor(.white)
            
            HStack(spacing: 8) {
                Image(systemName: "clock")
                    .font(.system(size: 10))
                Text(step.duration)
                    .font(.system(size: 11))
            }
            .foregroundColor(.gray)
        }
    }
    
    private func stepCardExpandedContent(_ step: AwakeningStep) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(step.description)
                .font(.system(size: 14))
                .foregroundColor(.white.opacity(0.9))
                .lineSpacing(4)
            
            commonMistakesSection(step)
            markCompleteButton(step)
        }
        .padding(.leading, 48)
    }
    
    private func commonMistakesSection(_ step: AwakeningStep) -> some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("Common Mistakes to Avoid:")
                .font(.system(size: 12, weight: .bold))
                .foregroundColor(method.uiColor)
            
            ForEach(step.commonMistakes, id: \.self) { mistake in
                HStack(alignment: .top, spacing: 8) {
                    Image(systemName: "exclamationmark.triangle.fill")
                        .foregroundColor(.yellow)
                        .font(.system(size: 10))
                    Text(mistake)
                        .font(.system(size: 12))
                        .foregroundColor(.white.opacity(0.8))
                }
            }
        }
        .padding(10)
        .background(Color.white.opacity(0.05))
        .cornerRadius(8)
    }
    
    private func markCompleteButton(_ step: AwakeningStep) -> some View {
        let isCompleted = completedSteps.contains(step.stepNumber)
        return Button(action: {
            withAnimation {
                if isCompleted {
                    completedSteps.remove(step.stepNumber)
                } else {
                    completedSteps.insert(step.stepNumber)
                }
            }
        }) {
            HStack {
                Image(systemName: isCompleted ? "checkmark.circle.fill" : "circle")
                Text(isCompleted ? "Completed" : "Mark as Started")
                    .font(.system(size: 13, weight: .medium))
            }
            .foregroundColor(isCompleted ? .green : method.uiColor)
            .padding(.vertical, 8)
            .frame(maxWidth: .infinity)
            .background(isCompleted ? Color.green.opacity(0.2) : method.uiColor.opacity(0.2))
            .cornerRadius(8)
        }
    }
    
    private var integrationReminder: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Image(systemName: "arrow.triangle.2.circlepath")
                    .foregroundColor(.orange)
                Text("INTEGRATION IS KEY")
                    .font(.system(size: 12, weight: .black))
                    .foregroundColor(.orange)
            }
            
            Text("Practice without integration is incomplete. Ask yourself daily: How am I living what I'm learning? Awakening isn't a weekend workshop—it's a life commitment.")
                .font(.system(size: 12))
                .foregroundColor(.white.opacity(0.8))
        }
        .padding()
        .background(Color.orange.opacity(0.1))
        .cornerRadius(12)
    }
    
    // MARK: - Safety Section
    
    private var safetySection: some View {
        VStack(alignment: .leading, spacing: 20) {
            sectionHeader("SAFETY NOTES", "exclamationmark.shield.fill")
            
            Text("All awakening paths carry some risk. Please approach with awareness.")
                .font(.system(size: 13))
                .foregroundColor(.gray)
            
            ForEach(method.warnings, id: \.self) { note in
                HStack(alignment: .top, spacing: 10) {
                    Image(systemName: "exclamationmark.triangle.fill")
                        .foregroundColor(.yellow)
                        .font(.system(size: 14))
                    
                    Text(note)
                        .font(.system(size: 14))
                        .foregroundColor(.white.opacity(0.9))
                }
                .padding()
                .background(Color.yellow.opacity(0.1))
                .cornerRadius(8)
            }
            
            // General safety
            generalSafetyCard
        }
        .padding()
    }
    
    private var generalSafetyCard: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(systemName: "heart.text.square.fill")
                    .foregroundColor(.red)
                Text("UNIVERSAL SAFETY PRINCIPLES")
                    .font(.system(size: 12, weight: .black))
                    .foregroundColor(.red)
            }
            
            VStack(alignment: .leading, spacing: 8) {
                safetyRow("Build gradually—never force")
                safetyRow("Maintain basic self-care (sleep, food, exercise)")
                safetyRow("Stay grounded in ordinary life")
                safetyRow("Seek guidance from qualified teachers")
                safetyRow("Don't isolate—maintain relationships")
                safetyRow("If symptoms become overwhelming, pause and get support")
                safetyRow("Mental health challenges need professional help, not just spiritual practice")
            }
        }
        .padding()
        .background(Color.red.opacity(0.1))
        .cornerRadius(12)
    }
    
    private func safetyRow(_ text: String) -> some View {
        HStack(alignment: .top, spacing: 8) {
            Image(systemName: "checkmark.shield")
                .foregroundColor(.red)
                .font(.system(size: 11))
            Text(text)
                .font(.system(size: 12))
                .foregroundColor(.white.opacity(0.8))
        }
    }
    
    // MARK: - Resources Section
    
    private var resourcesSection: some View {
        VStack(alignment: .leading, spacing: 20) {
            sectionHeader("RESOURCES", "books.vertical.fill")
            
            Text("Recommended materials for deeper study.")
                .font(.system(size: 13))
                .foregroundColor(.gray)
            
            ForEach(method.resources) { resource in
                HStack(alignment: .top, spacing: 10) {
                    Image(systemName: resourceIcon(for: resource.type))
                        .foregroundColor(method.uiColor)
                        .font(.system(size: 14))
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text(resource.title)
                            .font(.system(size: 14, weight: .medium))
                            .foregroundColor(.white.opacity(0.9))
                        
                        Text(resource.description)
                            .font(.system(size: 12))
                            .foregroundColor(.gray)
                    }
                }
                .padding()
                .background(Color.white.opacity(0.05))
                .cornerRadius(8)
            }
            
            // Find Teachers
            findTeachersCard
            
            // Cross-Reference
            crossReferenceCard
        }
        .padding()
    }
    
    private var findTeachersCard: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(systemName: "person.2.fill")
                    .foregroundColor(.blue)
                Text("FINDING TEACHERS")
                    .font(.system(size: 12, weight: .black))
                    .foregroundColor(.blue)
            }
            
            Text("Books and apps can only take you so far. At some point, most paths benefit from human guidance. Look for:")
                .font(.system(size: 12))
                .foregroundColor(.white.opacity(0.8))
            
            VStack(alignment: .leading, spacing: 6) {
                teacherRow("Lineage/training credentials")
                teacherRow("Students who seem healthy and grounded")
                teacherRow("Transparency about costs and expectations")
                teacherRow("No claims of exclusive truth")
                teacherRow("Respect for your autonomy")
            }
        }
        .padding()
        .background(Color.blue.opacity(0.1))
        .cornerRadius(12)
    }
    
    private func teacherRow(_ text: String) -> some View {
        HStack(spacing: 8) {
            Image(systemName: "checkmark.circle")
                .foregroundColor(.blue)
                .font(.system(size: 10))
            Text(text)
                .font(.system(size: 12))
                .foregroundColor(.white.opacity(0.8))
        }
    }
    
    private var crossReferenceCard: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(systemName: "arrow.triangle.branch")
                    .foregroundColor(.purple)
                Text("CROSS-REFERENCE")
                    .font(.system(size: 12, weight: .black))
                    .foregroundColor(.purple)
            }
            
            Text("This path connects to others in the Arsenal. Explore:")
                .font(.system(size: 12))
                .foregroundColor(.white.opacity(0.8))
            
            // Related methods (simplified)
            HStack(spacing: 8) {
                relatedTag("Breathwork")
                relatedTag("Meditation")
                relatedTag("Energy Work")
            }
            
            Text("The boundaries between traditions are more permeable than they appear. All roads lead home.")
                .font(.system(size: 11))
                .foregroundColor(.gray)
                .italic()
        }
        .padding()
        .background(Color.purple.opacity(0.1))
        .cornerRadius(12)
    }
    
    private func relatedTag(_ text: String) -> some View {
        Text(text)
            .font(.system(size: 11, weight: .medium))
            .foregroundColor(.purple)
            .padding(.horizontal, 10)
            .padding(.vertical, 4)
            .background(Color.purple.opacity(0.2))
            .cornerRadius(12)
    }
    
    private func resourceIcon(for type: ResourceType) -> String {
        switch type {
        case .book:
            return "book.fill"
        case .video:
            return "play.rectangle.fill"
        case .teacher:
            return "person.fill"
        case .community:
            return "person.3.fill"
        case .app:
            return "app.fill"
        case .website:
            return "globe"
        }
    }
}

// MARK: - Voice Guide Manager (Placeholder for future implementation)

class VoiceGuideManager: ObservableObject {
    @Published var isPlaying = false
    @Published var currentStep = 0
    
    private var synthesizer = AVSpeechSynthesizer()
    
    func playGuide(for method: AwakeningMethod) {
        // Future implementation for voice-guided meditation
        // Will use AVSpeechSynthesizer or pre-recorded audio
    }
    
    func stop() {
        synthesizer.stopSpeaking(at: .immediate)
        isPlaying = false
    }
}

// MARK: - Preview

#Preview {
    NavigationStack {
        AwakeningMethodDetailView(
            method: AwakeningMethod(
                id: "preview-kundalini",
                name: "Kundalini Awakening",
                tradition: "Hinduism",
                region: "South Asia",
                icon: "flame.fill",
                color: "#FF6B6B",
                tagline: "Awaken the serpent within",
                energyName: "Kundalini Shakti",
                overview: "Dormant serpent energy rises through chakras for divine union",
                steps: [
                    AwakeningStep(
                        id: "step-1",
                        stepNumber: 1,
                        title: "Breathwork",
                        description: "Begin with pranayama breathing",
                        duration: "10-15 minutes",
                        frequency: "Daily",
                        detailedInstructions: "Sit comfortably and breathe deeply",
                        commonMistakes: ["Forcing the breath", "Tension in shoulders"],
                        progressIndicators: ["Feeling of warmth", "Tingling sensation"]
                    )
                ],
                practices: [],
                warnings: ["Start slowly", "Listen to your body"],
                resources: [],
                voiceGuidanceAvailable: true
            )
        )
    }
}
