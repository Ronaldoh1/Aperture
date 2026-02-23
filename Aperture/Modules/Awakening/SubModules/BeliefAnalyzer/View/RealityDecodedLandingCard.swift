// RealityDecodedLandingCard.swift
// SunFlow: Reignited — Aperture
// Locked landing card for Belief Analyzer — unlocks after Timeline + Cosmos completion

import SwiftUI

// MARK: - Unlock Requirements

private struct UnlockRequirements {
    static let timelineEventsRequired = 5
    static let cosmosExploredRequired = 3

    static func progress(stats: ProgressStats) -> (timeline: Double, cosmos: Double, overall: Double) {
        let tl = min(Double(stats.timelineEventsViewed) / Double(timelineEventsRequired), 1.0)
        let co = min(Double(stats.cosmosExplored) / Double(cosmosExploredRequired), 1.0)
        return (tl, co, (tl + co) / 2.0)
    }

    static func isUnlocked(stats: ProgressStats) -> Bool {
        stats.timelineEventsViewed >= timelineEventsRequired &&
        stats.cosmosExplored >= cosmosExploredRequired
    }
}

// MARK: - Reality Decoded Landing Card

struct RealityDecodedLandingCard: View {

    @Binding var selectedTab: Int
    @StateObject private var tracker = ProgressTracker.shared
    @State private var showAnalyzer = false
    @State private var pulseScale: CGFloat = 1.0
    @State private var glowOpacity: Double = 0.3
    @State private var lockShake: CGFloat = 0
    @State private var unlockBurst = false
    @State private var tappedLocked = false
    @State private var orbitalAngle: Double = 0

    private var isUnlocked: Bool {
        UnlockRequirements.isUnlocked(stats: tracker.stats)
    }

    private var progress: (timeline: Double, cosmos: Double, overall: Double) {
        UnlockRequirements.progress(stats: tracker.stats)
    }

    var body: some View {
        Button {
            handleTap()
        } label: {
            cardBody
        }
        .buttonStyle(.plain)
        .sheet(isPresented: $showAnalyzer) {
            NavigationStack {
                BeliefAnalyzerView()
            }
        }
    }

    // MARK: - Card Body

    private var cardBody: some View {
        ZStack {
            // Background
            RoundedRectangle(cornerRadius: 18)
                .fill(
                    LinearGradient(
                        colors: isUnlocked
                            ? [Color(hex: "#1A0A00"), Color(hex: "#2D1500")]
                            : [Color(hex: "#0D0D14"), Color(hex: "#111118")],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )

            // Border
            RoundedRectangle(cornerRadius: 18)
                .stroke(
                    isUnlocked
                        ? LinearGradient(colors: [Color(hex: "#FF6B35").opacity(0.6), Color(hex: "#FFD700").opacity(0.4)],
                                         startPoint: .topLeading, endPoint: .bottomTrailing)
                        : LinearGradient(colors: [Color.white.opacity(0.08), Color.white.opacity(0.04)],
                                         startPoint: .topLeading, endPoint: .bottomTrailing),
                    lineWidth: 1.5
                )

            // Glow when unlocked
            if isUnlocked {
                RoundedRectangle(cornerRadius: 18)
                    .fill(Color(hex: "#FF6B35").opacity(glowOpacity * 0.15))
                    .blur(radius: 12)
                    .onAppear { startGlowAnimation() }
            }

            // Content
            HStack(spacing: 14) {
                iconSection
                textSection
                Spacer()
                trailingSection
            }
            .padding(16)
        }
        .offset(x: lockShake)
        .scaleEffect(unlockBurst ? 1.04 : 1.0)
    }

    // MARK: - Icon

    private var iconSection: some View {
        ZStack {
            // Orbital rings (locked only)
            if !isUnlocked {
                ForEach(0..<2, id: \.self) { i in
                    Circle()
                        .stroke(Color.white.opacity(0.04 + Double(i) * 0.02), lineWidth: 1)
                        .frame(width: CGFloat(48 + i * 14), height: CGFloat(48 + i * 14))
                }

                // Orbital dot
                Circle()
                    .fill(Color(hex: "#9B59B6").opacity(0.8))
                    .frame(width: 5, height: 5)
                    .offset(x: 30 * cos(orbitalAngle * .pi / 180),
                            y: 30 * sin(orbitalAngle * .pi / 180))
                    .onAppear { startOrbitalAnimation() }
            }

            // Main icon circle
            Circle()
                .fill(
                    isUnlocked
                        ? LinearGradient(colors: [Color(hex: "#FF6B35"), Color(hex: "#CC4A1A")],
                                         startPoint: .topLeading, endPoint: .bottomTrailing)
                        : LinearGradient(colors: [Color.white.opacity(0.06), Color.white.opacity(0.03)],
                                         startPoint: .topLeading, endPoint: .bottomTrailing)
                )
                .frame(width: 44, height: 44)
                .scaleEffect(isUnlocked ? pulseScale : 1.0)
                .onAppear { if isUnlocked { startPulseAnimation() } }

            // Icon
            if isUnlocked {
                Image(systemName: "eye.trianglebadge.exclamationmark")
                    .font(.system(size: 18, weight: .bold))
                    .foregroundStyle(
                        LinearGradient(colors: [.white, Color(hex: "#FFD700")],
                                       startPoint: .top, endPoint: .bottom)
                    )
            } else {
                lockIcon
            }
        }
        .frame(width: 50, height: 50)
    }

    private var lockIcon: some View {
        Image(systemName: progress.overall >= 0.5 ? "lock.open.fill" : "lock.fill")
            .font(.system(size: 18, weight: .semibold))
            .foregroundColor(.white.opacity(0.25))
            .symbolEffect(.bounce, value: tappedLocked)
    }

    // MARK: - Text

    private var textSection: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack(spacing: 6) {
                Text("Reality Decoded")
                    .font(.system(size: 14, weight: .black, design: .rounded))
                    .foregroundColor(isUnlocked ? .white : .white.opacity(0.5))

                if isUnlocked {
                    Text("NEW")
                        .font(.system(size: 8, weight: .black))
                        .foregroundColor(Color(hex: "#FF6B35"))
                        .padding(.horizontal, 5)
                        .padding(.vertical, 2)
                        .background(Capsule().fill(Color(hex: "#FF6B35").opacity(0.2)))
                }
            }

            Text(isUnlocked ? "Belief Analyzer" : "Unlock to analyze any belief")
                .font(.system(size: 11))
                .foregroundColor(isUnlocked ? Color(hex: "#FF6B35").opacity(0.8) : .white.opacity(0.25))

            if !isUnlocked {
                unlockProgressBar
            }
        }
    }

    private var unlockProgressBar: some View {
        VStack(alignment: .leading, spacing: 5) {
            // Timeline progress
            unlockRequirementRow(
                icon: "clock.arrow.circlepath",
                label: "Timeline",
                current: tracker.stats.timelineEventsViewed,
                required: UnlockRequirements.timelineEventsRequired,
                color: Color(hex: "#9B59B6"),
                tabIndex: 1
            )
            // Cosmos progress
            unlockRequirementRow(
                icon: "globe.americas.fill",
                label: "Cosmos",
                current: tracker.stats.cosmosExplored,
                required: UnlockRequirements.cosmosExploredRequired,
                color: Color(hex: "#3498DB"),
                tabIndex: 2
            )
        }
        .padding(.top, 4)
    }

    private func unlockRequirementRow(icon: String, label: String, current: Int, required: Int, color: Color, tabIndex: Int) -> some View {
        let done = current >= required
        return HStack(spacing: 6) {
            Image(systemName: done ? "checkmark.circle.fill" : icon)
                .font(.system(size: 10))
                .foregroundColor(done ? Color(hex: "#27AE60") : color.opacity(0.6))

            Text(label)
                .font(.system(size: 10, weight: .medium))
                .foregroundColor(.white.opacity(0.4))

            GeometryReader { geo in
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 2)
                        .fill(Color.white.opacity(0.06))
                        .frame(height: 3)
                    RoundedRectangle(cornerRadius: 2)
                        .fill(done ? Color(hex: "#27AE60") : color)
                        .frame(width: geo.size.width * min(Double(current) / Double(required), 1.0), height: 3)
                }
            }
            .frame(height: 3)

            Text("\(current)/\(required)")
                .font(.system(size: 9, weight: .semibold))
                .foregroundColor(done ? Color(hex: "#27AE60") : .white.opacity(0.3))
        }
    }

    // MARK: - Trailing

    private var trailingSection: some View {
        Group {
            if isUnlocked {
                VStack(spacing: 2) {
                    Image(systemName: "arrow.right.circle.fill")
                        .font(.system(size: 22))
                        .foregroundStyle(
                            LinearGradient(colors: [Color(hex: "#FF6B35"), Color(hex: "#FFD700")],
                                           startPoint: .top, endPoint: .bottom)
                        )
                    Text("25 lenses")
                        .font(.system(size: 9))
                        .foregroundColor(.white.opacity(0.3))
                }
            } else {
                Text("🔒")
                    .font(.system(size: 20))
                    .opacity(0.4)
            }
        }
    }

    // MARK: - Actions

    private func handleTap() {
        if isUnlocked {
            showAnalyzer = true
        } else {
            // Shake + bounce lock + navigate to the first incomplete tab
            tappedLocked.toggle()
            withAnimation(.interpolatingSpring(stiffness: 600, damping: 10)) {
                lockShake = -8
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                withAnimation(.interpolatingSpring(stiffness: 600, damping: 10)) {
                    lockShake = 8
                }
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                withAnimation(.interpolatingSpring(stiffness: 600, damping: 10)) {
                    lockShake = 0
                }
            }
            // Navigate to first incomplete module
            if tracker.stats.timelineEventsViewed < UnlockRequirements.timelineEventsRequired {
                withAnimation { selectedTab = 1 } // Timeline
            } else if tracker.stats.cosmosExplored < UnlockRequirements.cosmosExploredRequired {
                withAnimation { selectedTab = 2 } // Cosmos
            }
        }
    }

    // MARK: - Animations

    private func startPulseAnimation() {
        withAnimation(.easeInOut(duration: 2).repeatForever(autoreverses: true)) {
            pulseScale = 1.08
        }
    }

    private func startGlowAnimation() {
        withAnimation(.easeInOut(duration: 1.5).repeatForever(autoreverses: true)) {
            glowOpacity = 0.7
        }
    }

    private func startOrbitalAnimation() {
        withAnimation(.linear(duration: 6).repeatForever(autoreverses: false)) {
            orbitalAngle = 360
        }
    }
}

// MARK: - Unlock Celebration (shown once when user reaches requirements)

struct RealityDecodedUnlockView: View {
    let onDismiss: () -> Void
    @State private var appeared = false
    @State private var ringScale: CGFloat = 0.5
    @State private var ringOpacity: Double = 1.0

    var body: some View {
        ZStack {
            Color.black.opacity(0.85).ignoresSafeArea()
                .onTapGesture { onDismiss() }

            VStack(spacing: 24) {
                ZStack {
                    ForEach(0..<3, id: \.self) { i in
                        Circle()
                            .stroke(Color(hex: "#FF6B35").opacity(ringOpacity * (1.0 - Double(i) * 0.25)), lineWidth: 2)
                            .frame(width: CGFloat(80 + i * 40), height: CGFloat(80 + i * 40))
                            .scaleEffect(ringScale + CGFloat(i) * 0.2)
                    }

                    Circle()
                        .fill(
                            LinearGradient(colors: [Color(hex: "#FF6B35"), Color(hex: "#FFD700")],
                                           startPoint: .topLeading, endPoint: .bottomTrailing)
                        )
                        .frame(width: 80, height: 80)
                        .scaleEffect(appeared ? 1 : 0.3)

                    Image(systemName: "lock.open.fill")
                        .font(.system(size: 32, weight: .bold))
                        .foregroundColor(.white)
                        .scaleEffect(appeared ? 1 : 0.3)
                }
                .onAppear {
                    withAnimation(.spring(response: 0.5, dampingFraction: 0.6)) {
                        appeared = true
                        ringScale = 1.5
                    }
                    withAnimation(.easeOut(duration: 1.5).delay(0.3)) {
                        ringOpacity = 0
                    }
                }

                VStack(spacing: 10) {
                    Text("🔥 REALITY DECODED")
                        .font(.system(size: 20, weight: .black, design: .rounded))
                        .tracking(2)
                        .foregroundStyle(
                            LinearGradient(colors: [Color(hex: "#FF6B35"), Color(hex: "#FFD700")],
                                           startPoint: .leading, endPoint: .trailing)
                        )

                    Text("You've walked the Timeline\nand explored the Cosmos.")
                        .font(.system(size: 15))
                        .foregroundColor(.white.opacity(0.7))
                        .multilineTextAlignment(.center)

                    Text("Now decode any belief through 25 analytical lenses.")
                        .font(.system(size: 13))
                        .foregroundColor(.white.opacity(0.5))
                        .multilineTextAlignment(.center)
                }

                Button(action: onDismiss) {
                    Text("Activate the Analyzer →")
                        .font(.system(size: 15, weight: .bold))
                        .foregroundColor(.black)
                        .padding(.horizontal, 28)
                        .padding(.vertical, 14)
                        .background(
                            LinearGradient(colors: [Color(hex: "#FF6B35"), Color(hex: "#FFD700")],
                                           startPoint: .leading, endPoint: .trailing)
                                .clipShape(Capsule())
                        )
                }
            }
            .padding(32)
            .background(
                RoundedRectangle(cornerRadius: 28)
                    .fill(Color(hex: "#0D0A1A"))
                    .overlay(RoundedRectangle(cornerRadius: 28).stroke(Color(hex: "#FF6B35").opacity(0.3), lineWidth: 1))
            )
            .padding(.horizontal, 24)
            .scaleEffect(appeared ? 1 : 0.8)
            .opacity(appeared ? 1 : 0)
        }
    }
}
