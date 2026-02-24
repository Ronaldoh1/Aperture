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

            LanguageCardButton()

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

// MARK: - Language Card (for Profile/Settings)

struct LanguageCardButton: View {
    @State private var showPicker = false
    @ObservedObject private var manager = LocalizationManager.shared

    var body: some View {
        Button { showPicker = true } label: {
            HStack(spacing: 14) {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.purple.opacity(0.12))
                        .frame(width: 44, height: 44)
                    Text("🌐").font(.system(size: 20))
                }
                VStack(alignment: .leading, spacing: 3) {
                    Text("Language / Idioma")
                        .font(.system(size: 15, weight: .semibold))
                        .foregroundColor(.white)
                    Text(manager.currentLanguage.displayName)
                        .font(.system(size: 11))
                        .foregroundColor(.white.opacity(0.4))
                }
                Spacer()
                Text(manager.currentLanguage.flag)
                    .font(.system(size: 22))
                Image(systemName: "chevron.right")
                    .font(.system(size: 11))
                    .foregroundColor(.white.opacity(0.2))
            }
            .padding(14)
            .background(
                RoundedRectangle(cornerRadius: 14)
                    .fill(Color.white.opacity(0.01))
                    .overlay(RoundedRectangle(cornerRadius: 14)
                        .stroke(Color.white.opacity(0.05), lineWidth: 1))
            )
        }
        .sheet(isPresented: $showPicker) {
            LanguagePickerView()
        }
    }
}
