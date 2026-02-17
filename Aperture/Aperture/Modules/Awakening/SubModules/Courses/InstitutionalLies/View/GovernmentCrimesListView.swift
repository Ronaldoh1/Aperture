// GovernmentCrimesListView.swift

import SwiftUI

struct GovernmentCrimesListView: View {
  var body: some View {
    ZStack {
      CosmicBackground(starCount: 40)

      ScrollView(showsIndicators: false) {
        VStack(spacing: 16) {
          headerSection

          ForEach(GovernmentCrimesModule.all) { crime in
            NavigationLink(destination: GovernmentCrimeDetailView(crime: crime)) {
              crimeCard(crime)
            }
          }

          Spacer(minLength: 100)
        }
        .padding(.horizontal, 20)
        .padding(.top, 20)
      }
    }
    .navigationTitle("Government Crimes")
    .navigationBarTitleDisplayMode(.inline)
  }

  private var headerSection: some View {
    VStack(spacing: 8) {
      Text("DOCUMENTED ATROCITIES")
        .font(.system(size: 12, weight: .bold, design: .rounded))
        .foregroundColor(Palette.primary.red)
        .tracking(2)

      Text(
        "These are not conspiracy theories. Each case links to government records, congressional testimony, or declassified documents."
      )
      .font(.system(size: 14, weight: .medium))
      .foregroundColor(Palette.text.secondary)
      .multilineTextAlignment(.center)
      .lineSpacing(4)
    }
    .padding(.bottom, 8)
  }

  private func crimeCard(_ crime: GovernmentCrimesModule) -> some View {
    HStack(spacing: 16) {
      ZStack {
        Circle()
          .fill(Palette.primary.red.opacity(0.2))
          .frame(width: 50, height: 50)

        Image(systemName: crime.icon)
          .font(.system(size: 22))
          .foregroundColor(Palette.primary.red)
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
            .stroke(Palette.primary.red.opacity(0.2), lineWidth: 1)
        )
    )
  }
}
