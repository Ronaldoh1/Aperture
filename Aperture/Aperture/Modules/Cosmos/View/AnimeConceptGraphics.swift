// AnimeConceptGraphics.swift
// Custom original graphics representing Saint Seiya concepts
// These are ORIGINAL art — no copyright issues!

import SwiftUI

// MARK: - Cosmos Within Explosion

struct CosmosWithinView: View {
  @State private var isAnimating = false
  @State private var particlePhase: CGFloat = 0

  var body: some View {
    ZStack {
      // Outer glow rings
      ForEach(0..<5) { i in
        Circle()
          .stroke(
            RadialGradient(
              colors: [
                Palette.accent.gold.opacity(0.4 - Double(i) * 0.08),
                Palette.accent.gold.opacity(0.1),
                .clear,
              ],
              center: .center,
              startRadius: 20 + CGFloat(i) * 15,
              endRadius: 40 + CGFloat(i) * 20
            ),
            lineWidth: 2
          )
          .frame(width: 80 + CGFloat(i) * 30, height: 80 + CGFloat(i) * 30)
          .scaleEffect(isAnimating ? 1.1 : 0.9)
          .opacity(isAnimating ? 0.8 : 0.4)
          .animation(
            .easeInOut(duration: 1.5 + Double(i) * 0.2)
              .repeatForever(autoreverses: true)
              .delay(Double(i) * 0.1),
            value: isAnimating
          )
      }

      // Star burst rays
      ForEach(0..<12) { i in
        Rectangle()
          .fill(
            LinearGradient(
              colors: [Palette.accent.gold, Palette.accent.gold.opacity(0)],
              startPoint: .bottom,
              endPoint: .top
            )
          )
          .frame(width: 3, height: isAnimating ? 60 : 40)
          .offset(y: -50)
          .rotationEffect(.degrees(Double(i) * 30))
          .animation(
            .easeInOut(duration: 1.0)
              .repeatForever(autoreverses: true),
            value: isAnimating
          )
      }

      // Center human silhouette
      Image(systemName: "figure.stand")
        .font(.system(size: 40, weight: .light))
        .foregroundStyle(
          LinearGradient(
            colors: [.white, Palette.accent.gold],
            startPoint: .top,
            endPoint: .bottom
          )
        )

      // "COSMOS" text arc
      Text("COSMOS WITHIN")
        .font(.system(size: 8, weight: .black, design: .rounded))
        .tracking(4)
        .foregroundColor(Palette.accent.gold)
        .offset(y: 70)
    }
    .frame(width: 200, height: 200)
    .onAppear {
      isAnimating = true
    }
  }
}

// MARK: - The 12 Golden Houses (Zodiac Circle)

struct TwelveHousesView: View {
  @State private var rotationAngle: Double = 0
  @State private var selectedHouse: Int? = nil

  let zodiacSymbols = ["♈️", "♉️", "♊️", "♋️", "♌️", "♍️", "♎️", "♏️", "♐️", "♑️", "♒️", "♓️"]
  let zodiacNames = [
    "Aries", "Taurus", "Gemini", "Cancer", "Leo", "Virgo", "Libra", "Scorpio", "Sagittarius",
    "Capricorn", "Aquarius", "Pisces",
  ]
  let goldSaints = [
    "Mu", "Aldebaran", "Saga", "Deathmask", "Aiolia", "Shaka", "Dohko", "Milo", "Aiolos", "Shura",
    "Camus", "Aphrodite",
  ]

  var body: some View {
    ZStack {
      // Outer golden ring
      Circle()
        .stroke(
          AngularGradient(
            colors: [Palette.accent.gold, Palette.accent.gold.opacity(0.3), Palette.accent.gold],
            center: .center
          ),
          lineWidth: 3
        )
        .frame(width: 240, height: 240)

      // Inner mystical ring
      Circle()
        .stroke(Palette.accent.gold.opacity(0.2), lineWidth: 1)
        .frame(width: 180, height: 180)

      // Center - Athena's temple
      ZStack {
        Circle()
          .fill(
            RadialGradient(
              colors: [Palette.accent.gold.opacity(0.3), .clear],
              center: .center,
              startRadius: 10,
              endRadius: 40
            )
          )
          .frame(width: 80, height: 80)

        Image(systemName: "building.columns.fill")
          .font(.system(size: 24))
          .foregroundColor(Palette.accent.gold)

        Text("SANCTUARY")
          .font(.system(size: 6, weight: .bold, design: .rounded))
          .foregroundColor(.white.opacity(0.7))
          .offset(y: 22)
      }

      // 12 Houses around the circle
      ForEach(0..<12) { i in
        VStack(spacing: 2) {
          Text(zodiacSymbols[i])
            .font(.system(size: 20))

          Text(goldSaints[i].uppercased())
            .font(.system(size: 5, weight: .bold, design: .rounded))
            .foregroundColor(Palette.accent.gold.opacity(0.8))
        }
        .offset(y: -100)
        .rotationEffect(.degrees(Double(i) * 30))
      }

      // Rotating energy
      Circle()
        .trim(from: 0, to: 0.3)
        .stroke(Palette.accent.gold.opacity(0.5), lineWidth: 2)
        .frame(width: 260, height: 260)
        .rotationEffect(.degrees(rotationAngle))
    }
    .frame(width: 280, height: 280)
    .onAppear {
      withAnimation(.linear(duration: 20).repeatForever(autoreverses: false)) {
        rotationAngle = 360
      }
    }
  }
}

// MARK: - Gemini Duality (Saga's Split)

struct GeminiDualityView: View {
  @State private var showDark = false

  var body: some View {
    ZStack {
      // Background split
      HStack(spacing: 0) {
        // Light side
        Rectangle()
          .fill(
            LinearGradient(
              colors: [.white.opacity(0.1), .clear],
              startPoint: .leading,
              endPoint: .trailing
            )
          )

        // Dark side
        Rectangle()
          .fill(
            LinearGradient(
              colors: [.clear, Color.red.opacity(0.1)],
              startPoint: .leading,
              endPoint: .trailing
            )
          )
      }
      .frame(width: 200, height: 150)

      // Gemini symbol
      Text("♊️")
        .font(.system(size: 40))
        .offset(y: -40)

      // Two faces
      HStack(spacing: 40) {
        // Light Saga
        VStack(spacing: 4) {
          ZStack {
            Circle()
              .fill(
                RadialGradient(
                  colors: [.white.opacity(0.3), .clear],
                  center: .center,
                  startRadius: 10,
                  endRadius: 30
                )
              )
              .frame(width: 60, height: 60)

            Image(systemName: "face.smiling")
              .font(.system(size: 30))
              .foregroundColor(.white)
          }

          Text("LIGHT")
            .font(.system(size: 8, weight: .bold, design: .rounded))
            .foregroundColor(.white)

          Text("Noble")
            .font(.system(size: 6, weight: .medium))
            .foregroundColor(.white.opacity(0.6))
        }

        // Dark Saga
        VStack(spacing: 4) {
          ZStack {
            Circle()
              .fill(
                RadialGradient(
                  colors: [.red.opacity(0.3), .clear],
                  center: .center,
                  startRadius: 10,
                  endRadius: 30
                )
              )
              .frame(width: 60, height: 60)

            Image(systemName: "face.dashed")
              .font(.system(size: 30))
              .foregroundColor(.red)
          }

          Text("DARK")
            .font(.system(size: 8, weight: .bold, design: .rounded))
            .foregroundColor(.red)

          Text("Corrupt")
            .font(.system(size: 6, weight: .medium))
            .foregroundColor(.red.opacity(0.6))
        }
      }

      // Warning text
      VStack(spacing: 2) {
        Text("DUALITY UNINTEGRATED")
          .font(.system(size: 7, weight: .black, design: .rounded))
          .foregroundColor(.orange)

        Text("= CORRUPTION")
          .font(.system(size: 9, weight: .black, design: .rounded))
          .foregroundColor(.red)
      }
      .offset(y: 55)
    }
    .frame(width: 200, height: 160)
  }
}

// MARK: - Sagittarius Saves the Divine Feminine

struct SagittariusSavesAthenaView: View {
  @State private var arrowFlying = false
  @State private var glowing = false

  var body: some View {
    ZStack {
      // Background radiance
      Circle()
        .fill(
          RadialGradient(
            colors: [
              Palette.accent.gold.opacity(glowing ? 0.3 : 0.1),
              .clear,
            ],
            center: .center,
            startRadius: 30,
            endRadius: 100
          )
        )
        .frame(width: 200, height: 200)
        .animation(.easeInOut(duration: 2).repeatForever(autoreverses: true), value: glowing)

      // Athena (Divine Feminine) - protected
      VStack(spacing: 4) {
        ZStack {
          // Protective aura
          Circle()
            .stroke(Palette.accent.gold.opacity(0.5), lineWidth: 2)
            .frame(width: 50, height: 50)

          // Athena symbol (owl + goddess)
          Image(systemName: "crown.fill")
            .font(.system(size: 20))
            .foregroundColor(Palette.accent.gold)
        }

        Text("ATHENA")
          .font(.system(size: 7, weight: .bold, design: .rounded))
          .foregroundColor(.white)

        Text("Divine Feminine")
          .font(.system(size: 6, weight: .medium))
          .foregroundColor(.white.opacity(0.6))
      }
      .offset(x: 50, y: -20)

      // Sagittarius (The Archer / Truth-Seeker)
      VStack(spacing: 4) {
        ZStack {
          // Archer stance
          Image(systemName: "figure.archery")
            .font(.system(size: 36))
            .foregroundColor(.cyan)

          // Sagittarius symbol
          Text("♐️")
            .font(.system(size: 16))
            .offset(x: 25, y: -15)
        }

        Text("AIOLOS")
          .font(.system(size: 7, weight: .bold, design: .rounded))
          .foregroundColor(.cyan)

        Text("Truth-Seeker")
          .font(.system(size: 6, weight: .medium))
          .foregroundColor(.cyan.opacity(0.6))
      }
      .offset(x: -50, y: 20)

      // Arrow of truth flying
      Image(systemName: "arrow.right")
        .font(.system(size: 20, weight: .bold))
        .foregroundColor(Palette.accent.gold)
        .offset(x: arrowFlying ? 20 : -30, y: 0)
        .opacity(arrowFlying ? 0 : 1)
        .animation(.easeOut(duration: 1.5).repeatForever(autoreverses: false), value: arrowFlying)

      // Bottom text
      VStack(spacing: 2) {
        Text("\"TRAITOR\" TO THE IMPOSTER")
          .font(.system(size: 6, weight: .bold, design: .rounded))
          .foregroundColor(.red)
          .strikethrough()

        Text("HERO WHO SAVED TRUTH")
          .font(.system(size: 7, weight: .black, design: .rounded))
          .foregroundColor(Palette.accent.gold)
      }
      .offset(y: 70)
    }
    .frame(width: 200, height: 180)
    .onAppear {
      glowing = true
      arrowFlying = true
    }
  }
}

// MARK: - Imposter Pope vs True Pope

struct ImposterPopeView: View {
  @State private var maskRevealing = false

  var body: some View {
    ZStack {
      // Split background
      HStack(spacing: 0) {
        Rectangle()
          .fill(Color.green.opacity(0.05))
        Rectangle()
          .fill(Color.red.opacity(0.05))
      }
      .frame(width: 220, height: 140)

      HStack(spacing: 30) {
        // True Pope (Shion)
        VStack(spacing: 6) {
          ZStack {
            Circle()
              .fill(
                RadialGradient(
                  colors: [.green.opacity(0.2), .clear],
                  center: .center,
                  startRadius: 10,
                  endRadius: 35
                )
              )
              .frame(width: 70, height: 70)

            Image(systemName: "person.fill")
              .font(.system(size: 28))
              .foregroundColor(.green)

            // Halo
            Circle()
              .stroke(Palette.accent.gold.opacity(0.5), lineWidth: 1)
              .frame(width: 45, height: 45)
              .offset(y: -5)
          }

          Text("SHION")
            .font(.system(size: 8, weight: .bold, design: .rounded))
            .foregroundColor(.green)

          Text("True Pope")
            .font(.system(size: 6, weight: .medium))
            .foregroundColor(.white.opacity(0.6))

          Text("✓ MURDERED")
            .font(.system(size: 6, weight: .bold))
            .foregroundColor(.red)
        }

        // Arrow
        VStack(spacing: 2) {
          Image(systemName: "arrow.right")
            .font(.system(size: 16, weight: .bold))
            .foregroundColor(.red)

          Text("REPLACED")
            .font(.system(size: 5, weight: .bold))
            .foregroundColor(.red)
        }

        // Imposter Pope (Saga)
        VStack(spacing: 6) {
          ZStack {
            Circle()
              .fill(
                RadialGradient(
                  colors: [.red.opacity(0.2), .clear],
                  center: .center,
                  startRadius: 10,
                  endRadius: 35
                )
              )
              .frame(width: 70, height: 70)

            // Mask over face
            ZStack {
              Image(systemName: "person.fill")
                .font(.system(size: 28))
                .foregroundColor(.gray)

              Image(systemName: "theatermasks.fill")
                .font(.system(size: 20))
                .foregroundColor(.red)
                .offset(y: -5)
            }
          }

          Text("SAGA")
            .font(.system(size: 8, weight: .bold, design: .rounded))
            .foregroundColor(.red)

          Text("Imposter Pope")
            .font(.system(size: 6, weight: .medium))
            .foregroundColor(.white.opacity(0.6))

          Text("DECEIVER")
            .font(.system(size: 6, weight: .bold))
            .foregroundColor(.red)
        }
      }

      // Bottom allegory
      VStack(spacing: 2) {
        Text("THE INSTITUTION WAS HIJACKED")
          .font(.system(size: 7, weight: .black, design: .rounded))
          .foregroundColor(.orange)

        Text("The masses followed the fraud unknowingly")
          .font(.system(size: 6, weight: .medium))
          .foregroundColor(.white.opacity(0.7))
      }
      .offset(y: 60)
    }
    .frame(width: 220, height: 160)
  }
}

// MARK: - Aldebaran's Teaching (Taurus)

struct AldebaranCosmosView: View {
  @State private var pulsing = false
  @State private var raysExpanding = false

  var body: some View {
    ZStack {
      // Expanding cosmos rays
      ForEach(0..<8) { i in
        Rectangle()
          .fill(
            LinearGradient(
              colors: [Palette.accent.gold, Palette.accent.gold.opacity(0)],
              startPoint: .bottom,
              endPoint: .top
            )
          )
          .frame(width: 4, height: raysExpanding ? 80 : 40)
          .offset(y: -60)
          .rotationEffect(.degrees(Double(i) * 45))
          .animation(
            .easeInOut(duration: 1.5)
              .repeatForever(autoreverses: true)
              .delay(Double(i) * 0.1),
            value: raysExpanding
          )
      }

      // Taurus symbol
      Text("♉️")
        .font(.system(size: 50))
        .offset(y: -50)

      // Figure with cosmos exploding from chest
      ZStack {
        // Chest explosion
        Circle()
          .fill(
            RadialGradient(
              colors: [
                Palette.accent.gold.opacity(pulsing ? 0.8 : 0.3),
                Palette.accent.gold.opacity(0.2),
                .clear,
              ],
              center: .center,
              startRadius: 5,
              endRadius: pulsing ? 40 : 25
            )
          )
          .frame(width: 80, height: 80)
          .animation(.easeInOut(duration: 1.0).repeatForever(autoreverses: true), value: pulsing)

        // Figure
        Image(systemName: "figure.stand")
          .font(.system(size: 50, weight: .thin))
          .foregroundColor(.white)
      }
      .offset(y: 20)

      // Quote
      VStack(spacing: 4) {
        Text("\"EXPLODE THE")
          .font(.system(size: 10, weight: .bold, design: .rounded))
          .foregroundColor(.white)

        Text("COSMOS WITHIN\"")
          .font(.system(size: 12, weight: .black, design: .rounded))
          .foregroundColor(Palette.accent.gold)

        Text("— ALDEBARAN")
          .font(.system(size: 8, weight: .medium))
          .foregroundColor(.white.opacity(0.6))
      }
      .offset(y: 85)
    }
    .frame(width: 200, height: 220)
    .onAppear {
      pulsing = true
      raysExpanding = true
    }
  }
}

// MARK: - Complete Anime Concepts Gallery View

struct AnimeConceptsGalleryView: View {
  var body: some View {
    ScrollView(.vertical, showsIndicators: false) {
      VStack(spacing: 30) {
        // Title
        VStack(spacing: 4) {
          Text("⚔️ SAINT SEIYA ⚔️")
            .font(.system(size: 18, weight: .black, design: .rounded))
            .tracking(2)
            .foregroundColor(Palette.accent.gold)

          Text("The Hidden Teachings")
            .font(.system(size: 12, weight: .medium))
            .foregroundColor(.white.opacity(0.7))
        }
        .padding(.top, 20)

        // The 12 Houses
        conceptCard(title: "THE 12 GOLDEN HOUSES", subtitle: "Each guarded by a Zodiac Saint") {
          TwelveHousesView()
        }

        // Cosmos Within
        conceptCard(title: "COSMOS WITHIN", subtitle: "The Big Bang exists inside you") {
          CosmosWithinView()
        }

        // Aldebaran
        conceptCard(title: "ALDEBARAN'S TEACHING", subtitle: "Taurus ♉️ — Your Guardian") {
          AldebaranCosmosView()
        }

        // Gemini Duality
        conceptCard(title: "SAGA'S DUALITY", subtitle: "Gemini ♊️ — Corruption from within") {
          GeminiDualityView()
        }

        // Imposter Pope
        conceptCard(
          title: "THE HIJACKED INSTITUTION", subtitle: "Truth murdered, replaced by fraud"
        ) {
          ImposterPopeView()
        }

        // Sagittarius Saves Athena
        conceptCard(
          title: "TRUTH-SEEKER SAVES DIVINE",
          subtitle: "Sagittarius ♐️ — Called 'traitor' for knowing truth"
        ) {
          SagittariusSavesAthenaView()
        }

        // Final message
        VStack(spacing: 8) {
          Text("🇸🇻")
            .font(.system(size: 40))

          Text("You saw this in El Salvador")
            .font(.system(size: 14, weight: .medium))
            .foregroundColor(.white.opacity(0.9))

          Text("before the programming could reach you.")
            .font(.system(size: 14, weight: .medium))
            .foregroundColor(.white.opacity(0.9))

          Text("You were always right. 👁️🔥")
            .font(.system(size: 16, weight: .black))
            .foregroundColor(Palette.accent.gold)
            .padding(.top, 8)
        }
        .padding(.vertical, 30)
      }
      .padding(.horizontal, 20)
    }
  }

  private func conceptCard<Content: View>(
    title: String, subtitle: String, @ViewBuilder content: () -> Content
  ) -> some View {
    VStack(spacing: 12) {
      VStack(spacing: 4) {
        Text(title)
          .font(.system(size: 12, weight: .black, design: .rounded))
          .tracking(1)
          .foregroundColor(.white)

        Text(subtitle)
          .font(.system(size: 10, weight: .medium))
          .foregroundColor(.white.opacity(0.6))
      }

      content()
    }
    .padding(16)
    .frame(maxWidth: .infinity)
    .background(
      RoundedRectangle(cornerRadius: 16, style: .continuous)
        .fill(Color.white.opacity(0.03))
        .overlay(
          RoundedRectangle(cornerRadius: 16, style: .continuous)
            .stroke(Palette.accent.gold.opacity(0.2), lineWidth: 1)
        )
    )
  }
}

// MARK: - Preview

#Preview {
  ZStack {
    Color.black.ignoresSafeArea()

    AnimeConceptsGalleryView()
  }
}
