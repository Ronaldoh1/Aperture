// TimelineNowIntroCard.swift
// Aperture — Dramatic intro card that appears when Timeline loads
// Reveals current moment, then dissolves and snaps timeline to NOW

import SwiftUI

struct TimelineNowIntroCard: View {

    let onDismiss: () -> Void

    @State private var appear = false
    @State private var glowPulse = false
    @State private var textReveal = false
    @State private var dismissing = false

    // Auto-dismiss after 2.8s
    private let autoDismissDelay: Double = 2.8

    var body: some View {
        ZStack {

            // Blurred cosmic backdrop
            Rectangle()
                .fill(Color.black.opacity(0.72))
                .ignoresSafeArea()
                .opacity(appear ? 1 : 0)

            VStack(spacing: 0) {
                Spacer()

                // ── Card ────────────────────────────────────────
                VStack(spacing: 20) {

                    // NOW badge
                    Text("NOW")
                        .font(.system(size: 11, weight: .black, design: .rounded))
                        .tracking(4)
                        .foregroundColor(.black)
                        .padding(.horizontal, 14)
                        .padding(.vertical, 5)
                        .background(
                            Capsule()
                                .fill(Palette.accent.gold)
                                .shadow(color: Palette.accent.gold.opacity(0.7), radius: glowPulse ? 12 : 6)
                        )
                        .opacity(textReveal ? 1 : 0)
                        .offset(y: textReveal ? 0 : 8)

                    // Glowing eye / clock icon
                    ZStack {
                        Circle()
                            .fill(RadialGradient(
                                colors: [Palette.primary.cyan.opacity(0.35), Color.clear],
                                center: .center,
                                startRadius: 10,
                                endRadius: 70
                            ))
                            .frame(width: 140, height: 140)
                            .scaleEffect(glowPulse ? 1.1 : 0.95)

                        Circle()
                            .stroke(Palette.primary.cyan.opacity(0.25), lineWidth: 1)
                            .frame(width: 90, height: 90)

                        Image(systemName: "clock.arrow.circlepath")
                            .font(.system(size: 44, weight: .semibold))
                            .foregroundStyle(LinearGradient(
                                colors: [Palette.accent.gold, Palette.primary.cyan],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            ))
                            .shadow(color: Palette.accent.gold.opacity(0.6), radius: 12)
                    }
                    .opacity(appear ? 1 : 0)
                    .scaleEffect(appear ? 1 : 0.6)

                    // Headline
                    VStack(spacing: 8) {
                        Text("You Are Here")
                            .font(.system(size: 28, weight: .black, design: .rounded))
                            .foregroundStyle(LinearGradient(
                                colors: [Color.white, Palette.accent.gold],
                                startPoint: .leading,
                                endPoint: .trailing
                            ))

                        Text("The Great Awakening")
                            .font(.system(size: 15, weight: .semibold, design: .rounded))
                            .foregroundColor(Palette.primary.cyan)
                            .tracking(0.5)
                    }
                    .opacity(textReveal ? 1 : 0)
                    .offset(y: textReveal ? 0 : 12)

                    // Subtext
                    Text("More humans questioning narratives than ever.\nThe veil is thinning.")
                        .font(.system(size: 14, weight: .medium, design: .rounded))
                        .foregroundColor(Palette.text.secondary)
                        .multilineTextAlignment(.center)
                        .lineSpacing(3)
                        .opacity(textReveal ? 1 : 0)
                        .offset(y: textReveal ? 0 : 8)

                    // Dissolve hint
                    HStack(spacing: 6) {
                        Image(systemName: "arrow.down")
                            .font(.system(size: 11, weight: .bold))
                        Text("Traveling to your moment...")
                            .font(.system(size: 12, weight: .medium, design: .rounded))
                    }
                    .foregroundColor(Palette.text.muted)
                    .opacity(textReveal ? 0.7 : 0)

                }
                .padding(32)
                .background(
                    RoundedRectangle(cornerRadius: 28, style: .continuous)
                        .fill(Color(hex: "#0d0d1a").opacity(0.95))
                        .overlay(
                            RoundedRectangle(cornerRadius: 28, style: .continuous)
                                .stroke(
                                    LinearGradient(
                                        colors: [Palette.accent.gold.opacity(0.5), Palette.primary.cyan.opacity(0.3)],
                                        startPoint: .topLeading,
                                        endPoint: .bottomTrailing
                                    ),
                                    lineWidth: 1
                                )
                        )
                        .shadow(color: Palette.primary.cyan.opacity(0.15), radius: 30)
                )
                .padding(.horizontal, 24)
                .scaleEffect(dismissing ? 0.88 : (appear ? 1 : 0.85))
                .opacity(dismissing ? 0 : (appear ? 1 : 0))

                Spacer()
            }
        }
        .opacity(dismissing ? 0 : 1)
        .onAppear { startSequence() }
        .onTapGesture { triggerDismiss() }
    }

    // MARK: - Animation Sequence

    private func startSequence() {
        // Card rises in
        withAnimation(.spring(response: 0.55, dampingFraction: 0.75)) {
            appear = true
        }
        // Text reveals
        withAnimation(.easeOut(duration: 0.5).delay(0.4)) {
            textReveal = true
        }
        // Glow pulse
        withAnimation(.easeInOut(duration: 1.4).repeatForever(autoreverses: true).delay(0.6)) {
            glowPulse = true
        }
        // Auto dismiss
        DispatchQueue.main.asyncAfter(deadline: .now() + autoDismissDelay) {
            triggerDismiss()
        }
    }

    private func triggerDismiss() {
        guard !dismissing else { return }
        withAnimation(.easeInOut(duration: 0.55)) {
            dismissing = true
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.55) {
            onDismiss()
        }
    }
}
