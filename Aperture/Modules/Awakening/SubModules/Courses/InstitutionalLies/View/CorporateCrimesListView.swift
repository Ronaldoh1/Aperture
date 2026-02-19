// CorporateCrimesListView.swift

import SwiftUI

struct CorporateCrimesListView: View {

    var body: some View {

        ZStack {

            CosmicBackground(starCount: 40)

            ScrollView(showsIndicators: false) {

                VStack(spacing: 16) {

                    headerSection

                    ForEach(CorporateCrimesModule.all) { crime in
                        NavigationLink(destination: CorporateCrimeDetailView(crime: crime)) {
                            crimeCard(crime)
                        }
                    }

                    Spacer(minLength: 100)

                }
                .padding(.horizontal, 20)
                .padding(.top, 20)

            }

        }
        .navigationTitle("Corporate Crimes")
        .navigationBarTitleDisplayMode(.inline)

    }

    private var headerSection: some View {

        VStack(spacing: 8) {

            Text("FOLLOW THE MONEY")
                .font(.system(size: 12, weight: .bold, design: .rounded))
                .foregroundColor(Palette.accent.gold)
                .tracking(2)

            Text("DOJ settlements, FDA safety communications, congressional testimony. The paper trail is public.")
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(Palette.text.secondary)
                .multilineTextAlignment(.center)
                .lineSpacing(4)

        }
        .padding(.bottom, 8)

    }

    private func crimeCard(_ crime: CorporateCrimesModule) -> some View {

        HStack(spacing: 16) {

            ZStack {
                Circle()
                    .fill(Palette.accent.gold.opacity(0.2))
                    .frame(width: 50, height: 50)

                Image(systemName: crime.icon)
                    .font(.system(size: 22))
                    .foregroundColor(Palette.accent.gold)
            }

            VStack(alignment: .leading, spacing: 4) {

                Text(crime.title)
                    .font(.system(size: 16, weight: .bold, design: .rounded))
                    .foregroundColor(.white)

                Text(crime.subtitle)
                    .font(.system(size: 12, weight: .medium))
                    .foregroundColor(Palette.text.secondary)

            }

            Spacer()

            Image(systemName: "chevron.right")
                .font(.system(size: 14, weight: .semibold))
                .foregroundColor(Palette.text.muted)

        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.white.opacity(0.05))
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Palette.accent.gold.opacity(0.2), lineWidth: 1)
                )
        )

    }

}
