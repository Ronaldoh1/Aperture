// ReligionDecodedInvitationCard.swift
// A pulsing invitation card to discover the truth behind religions

import SwiftUI

struct ReligionDecodedInvitationCard: View {
  let onTap: () -> Void

  @State private var isPulsing: Bool = false
  @State private var glowOpacity: Double = 0.3

  var body: some View {
    Button(action: {
      HapticManager.shared.medium()
      onTap()
    }) {
      ZStack {
        // Outer glow (pulsing)
        RoundedRectangle(cornerRadius: 20, style: .continuous)
          .fill(
            RadialGradient(
              colors: [
                Palette.accent.gold.opacity(glowOpacity),
                Palette.accent.gold.opacity(0),
              ],
              center: .center,
              startRadius: 0,
              endRadius: 200
            )
          )
          .blur(radius: 20)

        // Main card
        VStack(spacing: 16) {
          // Top section with symbols
          HStack(spacing: 0) {
            Spacer()

            // Three symbols
            ZStack {
              Text("✡️")
                .font(.system(size: 24))
                .offset(x: -30)
                .opacity(isPulsing ? 0.9 : 0.6)

              Text("✝️")
                .font(.system(size: 28))
                .offset(y: isPulsing ? -2 : 0)

              Text("☪️")
                .font(.system(size: 24))
                .offset(x: 30)
                .opacity(isPulsing ? 0.9 : 0.6)
            }

            Spacer()

            // Eye icon
            ZStack {
              Circle()
                .fill(Palette.accent.gold.opacity(0.2))
                .frame(width: 44, height: 44)

              Image(systemName: "eye.fill")
                .font(.system(size: 20))
                .foregroundColor(Palette.accent.gold)
                .scaleEffect(isPulsing ? 1.1 : 1.0)
            }
          }

          // Title and description
          VStack(spacing: 8) {
            Text("BEYOND THE VEIL")
              .font(.system(size: 13, weight: .bold))
              .tracking(3)
              .foregroundColor(Palette.accent.gold)

            Text("Discover what they hid from you")
              .font(.system(size: 16, weight: .semibold, design: .rounded))
              .foregroundColor(.white)

            Text("See the pattern behind all religions")
              .font(.system(size: 12, weight: .medium))
              .foregroundColor(.white.opacity(0.6))
          }

          // CTA
          HStack {
            Spacer()

            HStack(spacing: 8) {
              Text("Begin Journey")
                .font(.system(size: 13, weight: .bold))

              Image(systemName: "arrow.right")
                .font(.system(size: 12, weight: .bold))
            }
            .foregroundColor(.black)
            .padding(.horizontal, 16)
            .padding(.vertical, 10)
            .background(Palette.accent.gold)
            .clipShape(Capsule())

            Spacer()
          }
        }
        .padding(20)
        .background(
          RoundedRectangle(cornerRadius: 20, style: .continuous)
            .fill(
              LinearGradient(
                colors: [
                  Color.white.opacity(0.08),
                  Color.white.opacity(0.03),
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
              )
            )
            .overlay(
              RoundedRectangle(cornerRadius: 20, style: .continuous)
                .stroke(
                  LinearGradient(
                    colors: [
                      Palette.accent.gold.opacity(isPulsing ? 0.6 : 0.3),
                      Palette.accent.gold.opacity(isPulsing ? 0.3 : 0.1),
                    ],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                  ),
                  lineWidth: 1.5
                )
            )
        )
      }
    }
    .buttonStyle(PlainButtonStyle())
    .onAppear {
      startPulsingAnimation()
    }
  }

  private func startPulsingAnimation() {
    withAnimation(
      Animation
        .easeInOut(duration: 2.0)
        .repeatForever(autoreverses: true)
    ) {
      isPulsing = true
      glowOpacity = 0.5
    }
  }
}

// MARK: - Compact Version (for sidebar or smaller spaces)

struct ReligionDecodedCompactCard: View {
  let onTap: () -> Void

  @State private var isPulsing: Bool = false

  var body: some View {
    Button(action: {
      HapticManager.shared.light()
      onTap()
    }) {
      HStack(spacing: 12) {
        // Symbols stack
        ZStack {
          Circle()
            .fill(Palette.accent.gold.opacity(0.15))
            .frame(width: 44, height: 44)

          Image(systemName: "eye.trianglebadge.exclamationmark")
            .font(.system(size: 18))
            .foregroundColor(Palette.accent.gold)
            .scaleEffect(isPulsing ? 1.05 : 1.0)
        }

        VStack(alignment: .leading, spacing: 2) {
          Text("Beyond the Veil")
            .font(.system(size: 14, weight: .bold, design: .rounded))
            .foregroundColor(.white)

          Text("See what they hid")
            .font(.system(size: 11, weight: .medium))
            .foregroundColor(.white.opacity(0.5))
        }

        Spacer()

        Image(systemName: "chevron.right")
          .font(.system(size: 12, weight: .semibold))
          .foregroundColor(Palette.accent.gold)
      }
      .padding(14)
      .background(
        RoundedRectangle(cornerRadius: 14, style: .continuous)
          .fill(Color.white.opacity(0.05))
          .overlay(
            RoundedRectangle(cornerRadius: 14, style: .continuous)
              .stroke(Palette.accent.gold.opacity(isPulsing ? 0.4 : 0.2), lineWidth: 1)
          )
      )
    }
    .buttonStyle(PlainButtonStyle())
    .onAppear {
      withAnimation(
        Animation.easeInOut(duration: 1.5).repeatForever(autoreverses: true)
      ) {
        isPulsing = true
      }
    }
  }
}

// MARK: - Preview

#Preview("Invitation Card") {
  ZStack {
    Color(hex: "#0a0a1a").ignoresSafeArea()

    VStack(spacing: 20) {
      ReligionDecodedInvitationCard(onTap: {})
        .padding()

      ReligionDecodedCompactCard(onTap: {})
        .padding()
    }
  }
}
