// LandingView.swift
// Contains secret GodMode access via header triple-tap

import SwiftUI

struct LandingView: View {
  @StateObject private var presenterBox: LandingPresenterBox
  @Binding var selectedTab: Int
  @ObservedObject private var godModeManager = GodModeManager.shared
  @State private var showGodModeHub = false
  @State private var portalPulse = false

  private var presenter: LandingPresenterType {
    presenterBox.presenter
  }

  init(presenter: LandingPresenterType, selectedTab: Binding<Int>) {
    _presenterBox = StateObject(wrappedValue: LandingPresenterBox(presenter: presenter))
    _selectedTab = selectedTab
  }

  var body: some View {
    ZStack {
      CosmicBackground()

      ScrollView(showsIndicators: false) {
        VStack(spacing: 32) {
          LandingHeaderSection()

          // GodMode Portal Button (appears after unlock)
          if godModeManager.isUnlocked {
            godModePortalButton
          }

          // Psyop Scanner - Killer Feature
          PsyopScannerCard()

          // Persona Discovery
          PersonaQuickCard()

          // Growth Features: Achievements & Sharing
          GrowthFeaturesSection()

          LandingNavigationSection(selectedTab: $selectedTab)

          LandingQuickActionsSection(selectedTab: $selectedTab)

          LandingDragonSection()

          Spacer(minLength: 100)
        }
        .padding(.horizontal, 20)
        .padding(.top, 20)
      }

      // GodMode Reveal Overlay
      if godModeManager.isRevealing {
        GodModeRevealView(manager: godModeManager)
          .transition(.opacity)
          .zIndex(100)
      }
    }
    .onAppear {
      presenter.viewDidLoad()
      if godModeManager.isUnlocked {
        startPortalAnimation()
      }
    }
    .onChange(of: godModeManager.isUnlocked) { _, unlocked in
      if unlocked {
        startPortalAnimation()
      }
    }
    .onChange(of: godModeManager.showGodModePortal) { _, show in
      if show {
        showGodModeHub = true
        godModeManager.showGodModePortal = false
      }
    }
    .fullScreenCover(isPresented: $showGodModeHub) {
      GodModeHubView()
    }
  }

  // MARK: - GodMode Portal Button

  private var godModePortalButton: some View {
    Button(action: {
      HapticManager.shared.heavy()
      showGodModeHub = true
    }) {
      HStack(spacing: 12) {
        // Animated spark
        ZStack {
          Circle()
            .fill(
              RadialGradient(
                colors: [
                  Color(red: 1, green: 0.84, blue: 0).opacity(portalPulse ? 0.6 : 0.3),
                  Color.clear,
                ],
                center: .center,
                startRadius: 5,
                endRadius: portalPulse ? 25 : 20
              )
            )
            .frame(width: 50, height: 50)

          Image(systemName: "sparkle")
            .font(.system(size: 20, weight: .medium))
            .foregroundStyle(
              LinearGradient(
                colors: [Color(red: 1, green: 0.84, blue: 0), .white],
                startPoint: .top,
                endPoint: .bottom
              )
            )
        }

        VStack(alignment: .leading, spacing: 2) {
          Text("GODMODE")
            .font(.system(size: 14, weight: .black, design: .rounded))
            .tracking(3)
            .foregroundStyle(
              LinearGradient(
                colors: [Color(red: 1, green: 0.84, blue: 0), .white],
                startPoint: .leading,
                endPoint: .trailing
              )
            )

          Text("Reality Operating System")
            .font(.system(size: 10, weight: .medium))
            .foregroundColor(.white.opacity(0.6))
        }

        Spacer()

        // Level badge
        VStack(spacing: 2) {
          Text("L\(godModeManager.monadLevel)")
            .font(.system(size: 16, weight: .black, design: .rounded))
            .foregroundColor(Color(red: 1, green: 0.84, blue: 0))

          Text(godModeManager.monadLevelName)
            .font(.system(size: 8, weight: .medium))
            .foregroundColor(.white.opacity(0.5))
            .lineLimit(1)
        }

        Image(systemName: "chevron.right")
          .font(.system(size: 14, weight: .semibold))
          .foregroundColor(Color(red: 1, green: 0.84, blue: 0).opacity(0.7))
      }
      .padding(16)
      .background(
        RoundedRectangle(cornerRadius: 16)
          .fill(Color.black.opacity(0.6))
          .overlay(
            RoundedRectangle(cornerRadius: 16)
              .stroke(
                LinearGradient(
                  colors: [
                    Color(red: 1, green: 0.84, blue: 0).opacity(0.6),
                    Color(red: 0.6, green: 0.3, blue: 1).opacity(0.3),
                    Color(red: 1, green: 0.84, blue: 0).opacity(0.4),
                  ],
                  startPoint: .topLeading,
                  endPoint: .bottomTrailing
                ),
                lineWidth: 1.5
              )
          )
      )
      .shadow(color: Color(red: 1, green: 0.84, blue: 0).opacity(0.3), radius: 10)
    }
    .buttonStyle(ScaleButtonStyle())
    .transition(
      .asymmetric(
        insertion: .scale.combined(with: .opacity),
        removal: .opacity
      ))
  }

  private func startPortalAnimation() {
    withAnimation(.easeInOut(duration: 2).repeatForever(autoreverses: true)) {
      portalPulse = true
    }
  }
}
