// CorporateCrimeDetailView.swift

import SwiftUI

struct CorporateCrimeDetailView: View {
  let crime: CorporateCrimesModule

  var body: some View {
    ZStack {
      CosmicBackground(starCount: 30)

      ScrollView(showsIndicators: false) {
        VStack(alignment: .leading, spacing: 24) {
          headerSection

          contentSection

          keyFactsSection

          sourcesSection

          Spacer(minLength: 100)
        }
        .padding(.horizontal, 20)
        .padding(.top, 20)
      }
    }
    .navigationTitle(crime.title)
    .navigationBarTitleDisplayMode(.inline)
  }

  private var headerSection: some View {
    VStack(spacing: 16) {
      ZStack {
        Circle()
          .fill(Palette.accent.gold.opacity(0.2))
          .frame(width: 80, height: 80)

        Image(systemName: crime.icon)
          .font(.system(size: 36))
          .foregroundColor(Palette.accent.gold)
      }

      Text(crime.title)
        .font(.system(size: 22, weight: .bold, design: .rounded))
        .foregroundColor(.white)
        .multilineTextAlignment(.center)

      Text(crime.subtitle)
        .font(.system(size: 14, weight: .medium))
        .foregroundColor(Palette.text.secondary)
    }
    .frame(maxWidth: .infinity)
    .padding(.bottom, 8)
  }

  private var contentSection: some View {
    VStack(alignment: .leading, spacing: 12) {
      Text(crime.content)
        .font(.system(size: 15, weight: .regular, design: .rounded))
        .foregroundColor(Palette.text.primary)
        .lineSpacing(6)
    }
    .padding(20)
    .background(
      RoundedRectangle(cornerRadius: 16)
        .fill(Color.white.opacity(0.03))
        .overlay(
          RoundedRectangle(cornerRadius: 16)
            .stroke(Color.white.opacity(0.08), lineWidth: 1)
        )
    )
  }

  private var keyFactsSection: some View {
    VStack(alignment: .leading, spacing: 12) {
      HStack(spacing: 8) {
        Image(systemName: "checkmark.seal.fill")
          .foregroundColor(Palette.accent.gold)
        Text("KEY FACTS")
          .font(.system(size: 12, weight: .bold, design: .rounded))
          .foregroundColor(Palette.accent.gold)
          .tracking(2)
      }

      VStack(alignment: .leading, spacing: 8) {
        ForEach(crime.keyFacts, id: \.self) { fact in
          HStack(alignment: .top, spacing: 12) {
            Image(systemName: "circle.fill")
              .font(.system(size: 6))
              .foregroundColor(Palette.accent.gold)
              .padding(.top, 6)

            Text(fact)
              .font(.system(size: 14, weight: .medium))
              .foregroundColor(Palette.text.primary)
          }
        }
      }
    }
    .padding(16)
    .background(
      RoundedRectangle(cornerRadius: 12)
        .fill(Palette.accent.gold.opacity(0.1))
        .overlay(
          RoundedRectangle(cornerRadius: 12)
            .stroke(Palette.accent.gold.opacity(0.2), lineWidth: 1)
        )
    )
  }

  private var sourcesSection: some View {
    VStack(alignment: .leading, spacing: 12) {
      HStack(spacing: 8) {
        Image(systemName: "doc.text.fill")
          .foregroundColor(Palette.primary.cyan)
        Text("PRIMARY SOURCES")
          .font(.system(size: 12, weight: .bold, design: .rounded))
          .foregroundColor(Palette.primary.cyan)
          .tracking(2)
      }

      VStack(alignment: .leading, spacing: 8) {
        ForEach(crime.sources, id: \.self) { source in
          HStack(alignment: .top, spacing: 12) {
            Image(systemName: "link")
              .font(.system(size: 12))
              .foregroundColor(Palette.primary.cyan)
              .padding(.top, 2)

            Text(source)
              .font(.system(size: 13, weight: .medium))
              .foregroundColor(Palette.text.secondary)
          }
        }
      }
    }
    .padding(16)
    .background(
      RoundedRectangle(cornerRadius: 12)
        .fill(Palette.primary.cyan.opacity(0.1))
        .overlay(
          RoundedRectangle(cornerRadius: 12)
            .stroke(Palette.primary.cyan.opacity(0.2), lineWidth: 1)
        )
    )
  }
}
