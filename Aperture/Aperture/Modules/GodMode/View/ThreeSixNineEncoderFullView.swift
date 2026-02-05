// ThreeSixNineEncoderFullView.swift
// The Tesla 3-6-9 Encoding Ritual
// Write intention 3x (plant), 6x (embody), 9x (complete)

import SwiftUI

struct ThreeSixNineEncoderFullView: View {
    
    @Environment(\.dismiss) private var dismiss
    @ObservedObject private var storage = GodModeStorage.shared
    
    @State private var intention: String = ""
    @State private var currentPhase: ThreeSixNineSession.EncodingPhase = .planting
    @State private var repetitionsCompleted: Int = 0
    @State private var currentInput: String = ""
    @State private var sessionStarted: Bool = false
    @State private var sessionComplete: Bool = false
    @State private var showingCompletion: Bool = false
    
    @State private var phaseAnimation: Bool = false
    @State private var numberGlow: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                // Background
                encoderBackground
                
                if !sessionStarted {
                    // Intention input
                    intentionInputView
                } else if sessionComplete {
                    // Completion celebration
                    completionView
                } else {
                    // Encoding ritual
                    encodingRitualView
                }
            }
            .navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: { dismiss() }) {
                        Image(systemName: "xmark.circle.fill")
                            .font(.title2)
                            .foregroundStyle(.white.opacity(0.7))
                    }
                }
                
                ToolbarItem(placement: .principal) {
                    Text("3 • 6 • 9")
                        .font(.system(size: 20, weight: .black, design: .rounded))
                        .tracking(4)
                        .foregroundStyle(
                            LinearGradient(
                                colors: [Color(red: 0.6, green: 0.3, blue: 1), .white],
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                }
            }
        }
    }
    
    // MARK: - Background
    
    private func particleColor(index: Int, opacity: Double) -> Color {
        if index % 9 == 0 {
            return Color(red: 1, green: 0.84, blue: 0).opacity(opacity) // 9 = Gold
        } else if index % 3 == 0 {
            return Color(red: 0, green: 0.9, blue: 1).opacity(opacity * 0.8) // 3/6 = Cyan
        } else {
            return Color(red: 0.6, green: 0.3, blue: 1).opacity(opacity * 0.5) // Others = Violet
        }
    }
    
    private var encoderBackground: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            // Animated vortex particles
            SwiftUI.TimelineView(.animation) { timeline in
                Canvas { context, size in
                    let time = timeline.date.timeIntervalSinceReferenceDate
                    let centerX = size.width / 2
                    let centerY = size.height / 2
                    
                    for i in 0..<36 {
                        let seed = Double(i)
                        let angle = (time * 0.5 + seed * 10) * .pi / 180
                        let radius = 50 + sin(time * 0.3 + seed * 0.2) * 150
                        
                        let x = centerX + cos(angle) * radius
                        let y = centerY + sin(angle) * radius
                        let dotRadius: Double = 2 + sin(time + seed) * 1
                        let opacity: Double = 0.3 + sin(time * 2 + seed * 0.5) * 0.2
                        
                        let color = particleColor(index: i, opacity: opacity)
                        
                        let rect = CGRect(x: x - dotRadius, y: y - dotRadius, width: dotRadius * 2, height: dotRadius * 2)
                        context.fill(Path(ellipseIn: rect), with: .color(color))
                    }
                }
            }
        }
    }
    
    // MARK: - Intention Input
    
    private var intentionInputView: some View {
        VStack(spacing: 32) {
            Spacer()
            
            // Title
            VStack(spacing: 12) {
                Text("TESLA ENCODING RITUAL")
                    .font(.system(size: 12, weight: .bold, design: .rounded))
                    .tracking(4)
                    .foregroundColor(Color(red: 0.6, green: 0.3, blue: 1).opacity(0.8))
                
                Text("\"If you only knew the magnificence of 3, 6, and 9...\"")
                    .font(.system(size: 14, weight: .medium, design: .serif))
                    .italic()
                    .foregroundColor(.white.opacity(0.7))
                    .multilineTextAlignment(.center)
            }
            
            // Numbers display
            HStack(spacing: 40) {
                numberCircle(3, color: Color(red: 1, green: 0.84, blue: 0), label: "Plant")
                numberCircle(6, color: Color(red: 0, green: 0.9, blue: 1), label: "Embody")
                numberCircle(9, color: Color(red: 0.6, green: 0.3, blue: 1), label: "Complete")
            }
            .onAppear {
                withAnimation(.easeInOut(duration: 2).repeatForever(autoreverses: true)) {
                    numberGlow = true
                }
            }
            
            // Intention input
            VStack(alignment: .leading, spacing: 12) {
                Text("YOUR INTENTION")
                    .font(.system(size: 11, weight: .bold, design: .rounded))
                    .tracking(2)
                    .foregroundColor(.white.opacity(0.5))
                
                TextField("I am...", text: $intention, axis: .vertical)
                    .font(.system(size: 18, weight: .medium))
                    .foregroundColor(.white)
                    .padding(16)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.white.opacity(0.05))
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color(red: 0.6, green: 0.3, blue: 1).opacity(0.3), lineWidth: 1)
                            )
                    )
                    .lineLimit(3...6)
                
                Text("Write as if it's already true. Example: \"I am abundant and wealth flows to me effortlessly.\"")
                    .font(.system(size: 11, weight: .medium))
                    .foregroundColor(.white.opacity(0.4))
            }
            .padding(.horizontal, 24)
            
            Spacer()
            
            // Begin button
            Button(action: {
                withAnimation(.spring()) {
                    sessionStarted = true
                }
                HapticManager.shared.heavy()
            }) {
                HStack(spacing: 12) {
                    Image(systemName: "sparkles")
                    Text("BEGIN ENCODING")
                        .font(.system(size: 16, weight: .bold))
                    Image(systemName: "sparkles")
                }
                .foregroundColor(.black)
                .padding(.horizontal, 32)
                .padding(.vertical, 16)
                .background(
                    Capsule()
                        .fill(
                            LinearGradient(
                                colors: [Color(red: 0.6, green: 0.3, blue: 1), Color(red: 0.9, green: 0.4, blue: 0.8)],
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                )
            }
            .disabled(intention.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
            .opacity(intention.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ? 0.5 : 1)
            
            Spacer()
        }
    }
    
    // MARK: - Number Circle
    
    private func numberCircle(_ number: Int, color: Color, label: String) -> some View {
        VStack(spacing: 8) {
            ZStack {
                Circle()
                    .fill(
                        RadialGradient(
                            colors: [color.opacity(numberGlow ? 0.4 : 0.2), Color.clear],
                            center: .center,
                            startRadius: 10,
                            endRadius: numberGlow ? 40 : 30
                        )
                    )
                    .frame(width: 80, height: 80)
                
                Text("\(number)")
                    .font(.system(size: 36, weight: .black, design: .rounded))
                    .foregroundColor(color)
            }
            
            Text(label)
                .font(.system(size: 10, weight: .medium))
                .foregroundColor(.white.opacity(0.6))
        }
    }
    
    // MARK: - Encoding Ritual View
    
    private var encodingRitualView: some View {
        VStack(spacing: 24) {
            // Phase indicator
            phaseIndicator
            
            // Progress
            progressSection
            
            // Intention display
            intentionDisplay
            
            // Input area
            inputArea
            
            Spacer()
        }
        .padding(.top, 20)
    }
    
    private var phaseIndicator: some View {
        VStack(spacing: 8) {
            Text(currentPhase.rawValue.uppercased())
                .font(.system(size: 14, weight: .black, design: .rounded))
                .tracking(4)
                .foregroundStyle(phaseColor)
            
            Text(currentPhase.instruction)
                .font(.system(size: 12, weight: .medium))
                .foregroundColor(.white.opacity(0.6))
                .multilineTextAlignment(.center)
                .padding(.horizontal, 24)
        }
    }
    
    private var phaseColor: Color {
        switch currentPhase {
        case .planting: return Color(red: 1, green: 0.84, blue: 0)
        case .embodying: return Color(red: 0, green: 0.9, blue: 1)
        case .completing: return Color(red: 0.6, green: 0.3, blue: 1)
        }
    }
    
    private var progressSection: some View {
        HStack(spacing: 20) {
            // Phase progress circles
            ForEach(ThreeSixNineSession.EncodingPhase.allCases, id: \.self) { phase in
                let isCurrentPhase = phase == currentPhase
                let isCompleted = phaseIsCompleted(phase)
                
                VStack(spacing: 6) {
                    ZStack {
                        Circle()
                            .stroke(phaseColorFor(phase).opacity(0.3), lineWidth: 3)
                            .frame(width: 50, height: 50)
                        
                        if isCompleted {
                            Circle()
                                .fill(phaseColorFor(phase))
                                .frame(width: 50, height: 50)
                            
                            Image(systemName: "checkmark")
                                .font(.system(size: 20, weight: .bold))
                                .foregroundColor(.black)
                        } else if isCurrentPhase {
                            Circle()
                                .trim(from: 0, to: phaseProgress)
                                .stroke(phaseColorFor(phase), lineWidth: 3)
                                .frame(width: 50, height: 50)
                                .rotationEffect(.degrees(-90))
                            
                            Text("\(repetitionsCompleted)")
                                .font(.system(size: 20, weight: .black, design: .rounded))
                                .foregroundColor(phaseColorFor(phase))
                        } else {
                            Text("\(phase.targetCount)")
                                .font(.system(size: 16, weight: .bold, design: .rounded))
                                .foregroundColor(.white.opacity(0.3))
                        }
                    }
                    
                    Text(phaseLabel(phase))
                        .font(.system(size: 9, weight: .medium))
                        .foregroundColor(isCurrentPhase ? .white : .white.opacity(0.4))
                }
            }
        }
        .padding(.vertical, 12)
    }
    
    private func phaseColorFor(_ phase: ThreeSixNineSession.EncodingPhase) -> Color {
        switch phase {
        case .planting: return Color(red: 1, green: 0.84, blue: 0)
        case .embodying: return Color(red: 0, green: 0.9, blue: 1)
        case .completing: return Color(red: 0.6, green: 0.3, blue: 1)
        }
    }
    
    private func phaseLabel(_ phase: ThreeSixNineSession.EncodingPhase) -> String {
        switch phase {
        case .planting: return "3×"
        case .embodying: return "6×"
        case .completing: return "9×"
        }
    }
    
    private func phaseIsCompleted(_ phase: ThreeSixNineSession.EncodingPhase) -> Bool {
        switch phase {
        case .planting: return currentPhase != .planting
        case .embodying: return currentPhase == .completing
        case .completing: return sessionComplete
        }
    }
    
    private var phaseProgress: Double {
        Double(repetitionsCompleted) / Double(currentPhase.targetCount)
    }
    
    private var intentionDisplay: some View {
        VStack(spacing: 8) {
            Text("WRITE THIS:")
                .font(.system(size: 10, weight: .bold, design: .rounded))
                .tracking(2)
                .foregroundColor(.white.opacity(0.4))
            
            Text(intention)
                .font(.system(size: 18, weight: .semibold, design: .serif))
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 24)
        }
        .padding(20)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.white.opacity(0.05))
        )
        .padding(.horizontal, 20)
    }
    
    private var inputArea: some View {
        VStack(spacing: 16) {
            TextField("Type it here...", text: $currentInput, axis: .vertical)
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.white)
                .padding(16)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.white.opacity(0.05))
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(phaseColor.opacity(0.5), lineWidth: 1)
                        )
                )
                .lineLimit(3...6)
                .padding(.horizontal, 20)
            
            Button(action: submitRepetition) {
                HStack(spacing: 8) {
                    Text("ENCODE")
                        .font(.system(size: 14, weight: .bold))
                    Text("(\(repetitionsCompleted + 1)/\(currentPhase.targetCount))")
                        .font(.system(size: 12, weight: .medium))
                }
                .foregroundColor(.black)
                .padding(.horizontal, 32)
                .padding(.vertical, 14)
                .background(
                    Capsule().fill(phaseColor)
                )
            }
            .disabled(currentInput.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
            .opacity(currentInput.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ? 0.5 : 1)
        }
    }
    
    private func submitRepetition() {
        HapticManager.shared.medium()
        
        repetitionsCompleted += 1
        currentInput = ""
        
        // Check if phase complete
        if repetitionsCompleted >= currentPhase.targetCount {
            advancePhase()
        }
    }
    
    private func advancePhase() {
        HapticManager.shared.success()
        
        switch currentPhase {
        case .planting:
            currentPhase = .embodying
            repetitionsCompleted = 0
        case .embodying:
            currentPhase = .completing
            repetitionsCompleted = 0
        case .completing:
            completeSession()
        }
    }
    
    private func completeSession() {
        sessionComplete = true
        HapticManager.shared.success()
        
        // Save session
        let session = ThreeSixNineSession(
            id: UUID(),
            intention: intention,
            phase: .completing,
            repetitionsCompleted: 9,
            timestamp: Date(),
            notes: ""
        )
        storage.addThreeSixNineSession(session)
    }
    
    // MARK: - Completion View
    
    private var completionView: some View {
        VStack(spacing: 32) {
            Spacer()
            
            // Celebration animation
            ZStack {
                ForEach(0..<9, id: \.self) { i in
                    Circle()
                        .stroke(
                            LinearGradient(
                                colors: [
                                    Color(red: 1, green: 0.84, blue: 0).opacity(0.6),
                                    Color(red: 0.6, green: 0.3, blue: 1).opacity(0.3)
                                ],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            ),
                            lineWidth: 2
                        )
                        .frame(width: CGFloat(60 + i * 30), height: CGFloat(60 + i * 30))
                        .opacity(phaseAnimation ? 1 : 0)
                        .scaleEffect(phaseAnimation ? 1 : 0.5)
                        .animation(
                            .spring(response: 0.6, dampingFraction: 0.7)
                                .delay(Double(i) * 0.1),
                            value: phaseAnimation
                        )
                }
                
                Image(systemName: "sparkle")
                    .font(.system(size: 60, weight: .light))
                    .foregroundStyle(
                        LinearGradient(
                            colors: [Color(red: 1, green: 0.84, blue: 0), .white],
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )
            }
            .onAppear {
                phaseAnimation = true
            }
            
            VStack(spacing: 12) {
                Text("ENCODING COMPLETE")
                    .font(.system(size: 20, weight: .black, design: .rounded))
                    .tracking(4)
                    .foregroundStyle(
                        LinearGradient(
                            colors: [Color(red: 1, green: 0.84, blue: 0), .white],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                
                Text("Your intention has been sealed in the vortex.\nThe universe is now rearranging.")
                    .font(.system(size: 14, weight: .medium))
                    .foregroundColor(.white.opacity(0.7))
                    .multilineTextAlignment(.center)
            }
            
            // Encoded intention
            VStack(spacing: 8) {
                Text("ENCODED:")
                    .font(.system(size: 10, weight: .bold, design: .rounded))
                    .tracking(2)
                    .foregroundColor(Color(red: 0.6, green: 0.3, blue: 1).opacity(0.8))
                
                Text(intention)
                    .font(.system(size: 16, weight: .semibold, design: .serif))
                    .italic()
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
            }
            .padding(20)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color(red: 0.6, green: 0.3, blue: 1).opacity(0.1))
            )
            .padding(.horizontal, 24)
            
            Spacer()
            
            Button(action: { dismiss() }) {
                Text("RETURN TO GODMODE")
                    .font(.system(size: 14, weight: .bold))
                    .foregroundColor(.black)
                    .padding(.horizontal, 32)
                    .padding(.vertical, 14)
                    .background(
                        Capsule()
                            .fill(Color(red: 1, green: 0.84, blue: 0))
                    )
            }
            
            Spacer()
        }
    }
}

// MARK: - Preview

#Preview {
    ThreeSixNineEncoderFullView()
}
