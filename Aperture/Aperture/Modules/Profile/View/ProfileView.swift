// ProfileView.swift

import SwiftUI

struct ProfileView: View {
  @StateObject private var presenterBox: ProfilePresenterBox
  @EnvironmentObject private var session: SessionStore

  private var presenter: ProfilePresenterType {
    presenterBox.presenter
  }

  init(presenter: ProfilePresenterType) {
    _presenterBox = StateObject(wrappedValue: ProfilePresenterBox(presenter: presenter))
  }

  var body: some View {
    NavigationStack {
      ZStack {
        CosmicBackground(starCount: 50)

        ScrollView {
          VStack(spacing: 24) {
            Spacer(minLength: 40)

            ProfileHeaderSection()

            contentSection

            signOutSection

            Spacer(minLength: 40)
          }
          .padding(.horizontal, 24)
        }
      }
      .navigationTitle("Profile")
      .navigationBarTitleDisplayMode(.inline)
    }
    .onAppear {
      presenter.viewDidLoad()
    }
  }

  private var contentSection: some View {
    VStack(spacing: 16) {
      ProfileCard(
        icon: "chart.xyaxis.line",
        title: "Progress",
        description: "Track your awakening journey"
      )

      ProfileCard(
        icon: "star.fill",
        title: "Achievements",
        description: "Milestones and breakthroughs"
      )

      ProfileCard(
        icon: "gear",
        title: "Settings",
        description: "Customize your experience"
      )
    }
  }

  private var signOutSection: some View {
    VStack(spacing: 12) {
      CosmicButton(
        title: "Sign Out",
        style: .secondary,
        systemImage: "arrow.right.square",
        isDisabled: false
      ) {
        presenter.didTapSignOut()
      }

      Text("Version 1.0.0")
        .font(.system(size: 12, weight: .medium, design: .rounded))
        .foregroundColor(Palette.text.muted)
        .padding(.top, 8)
    }
    .padding(.top, 24)
  }
}
