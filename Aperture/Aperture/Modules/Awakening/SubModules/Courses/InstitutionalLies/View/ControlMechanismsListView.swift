// ControlMechanismsListView.swift

import SwiftUI

struct ControlMechanismsListView: View {
  var body: some View {
    ZStack {
      CosmicBackground(starCount: 40)

      ScrollView(showsIndicators: false) {
        VStack(spacing: 16) {
          headerSection

          ForEach(ControlMechanism.all) { mechanism in
            mechanismCard(mechanism)
          }

          Spacer(minLength: 100)
        }
        .padding(.horizontal, 20)
        .padding(.top, 20)
      }
    }
    .navigationTitle("Control Mechanisms")
    .navigationBarTitleDisplayMode(.inline)
  }

  private var headerSection: some View {
    VStack(spacing: 8) {
      Text("THE CONTROL ROOM")
        .font(.system(size: 12, weight: .bold, design: .rounded))
        .foregroundColor(Palette.primary.cyan)
        .tracking(2)

      Text(
        "Not a shadow council - just incentives, cognitive biases, and institutions protecting themselves. Here's how they work."
      )
      .font(.system(size: 14, weight: .medium))
      .foregroundColor(Palette.text.secondary)
      .multilineTextAlignment(.center)
      .lineSpacing(4)
    }
    .padding(.bottom, 8)
  }

  private func mechanismCard(_ mechanism: ControlMechanism) -> some View {
    VStack(alignment: .leading, spacing: 16) {
      HStack(spacing: 12) {
        ZStack {
          Circle()
            .fill(Palette.primary.cyan.opacity(0.2))
            .frame(width: 44, height: 44)

          Image(systemName: mechanism.icon)
            .font(.system(size: 20))
            .foregroundColor(Palette.primary.cyan)
        }

        VStack(alignment: .leading, spacing: 2) {
          Text(mechanism.title)
            .font(.system(size: 16, weight: .bold, design: .rounded))
            .foregroundColor(.white)
        }

        Spacer()
      }

      Text(mechanism.description)
        .font(.system(size: 14, weight: .medium))
        .foregroundColor(Palette.text.secondary)
        .lineSpacing(4)

      VStack(alignment: .leading, spacing: 6) {
        Text("Examples:")
          .font(.system(size: 12, weight: .bold))
          .foregroundColor(Palette.text.muted)

        ForEach(mechanism.examples.prefix(3), id: \.self) { example in
          HStack(alignment: .top, spacing: 8) {
            Text("•")
              .foregroundColor(Palette.primary.cyan)
            Text(example)
              .font(.system(size: 13, weight: .medium))
              .foregroundColor(Palette.text.secondary)
          }
        }
      }

      HStack(spacing: 8) {
        Image(systemName: "shield.fill")
          .font(.system(size: 12))
          .foregroundColor(Palette.accent.gold)
        Text("Defense: ")
          .font(.system(size: 12, weight: .bold))
          .foregroundColor(Palette.accent.gold)
        Text(mechanism.defense)
          .font(.system(size: 12, weight: .medium))
          .foregroundColor(Palette.text.primary)
      }
      .padding(12)
      .background(
        RoundedRectangle(cornerRadius: 8)
          .fill(Palette.accent.gold.opacity(0.1))
      )
    }
    .padding(16)
    .background(
      RoundedRectangle(cornerRadius: 16)
        .fill(Color.white.opacity(0.05))
        .overlay(
          RoundedRectangle(cornerRadius: 16)
            .stroke(Palette.primary.cyan.opacity(0.2), lineWidth: 1)
        )
    )
  }
}
