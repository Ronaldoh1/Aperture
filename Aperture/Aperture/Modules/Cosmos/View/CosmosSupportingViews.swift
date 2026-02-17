// CosmosSupportingViews.swift
// Supporting view components for Cosmos module

import SwiftUI

// MARK: - Demonized Entity Card

struct DemonizedEntityCard: View {
  let entity: CosmicEntity
  let onTap: () -> Void

  var body: some View {
    HStack(spacing: 14) {
      // Icon
      ZStack {
        Circle()
          .fill(entity.color.opacity(0.2))
          .frame(width: 50, height: 50)

        Image(systemName: entity.icon)
          .font(.system(size: 22, weight: .semibold))
          .foregroundColor(entity.color)
      }

      // Info
      VStack(alignment: .leading, spacing: 4) {
        Text(entity.name)
          .font(.system(size: 17, weight: .bold, design: .rounded))
          .foregroundColor(Palette.text.primary)

        Text(entity.titles.prefix(2).joined(separator: " • "))
          .font(.system(size: 12, weight: .medium, design: .rounded))
          .foregroundColor(entity.color)
          .lineLimit(1)
      }

      Spacer()

      Image(systemName: "chevron.right")
        .font(.system(size: 14, weight: .semibold))
        .foregroundColor(Palette.text.muted)
    }
    .padding(16)
    .background(
      RoundedRectangle(cornerRadius: 14, style: .continuous)
        .fill(Color.white.opacity(0.05))
        .overlay(
          RoundedRectangle(cornerRadius: 14, style: .continuous)
            .stroke(entity.color.opacity(0.25), lineWidth: 1)
        )
    )
    .onTapGesture {
      HapticManager.shared.cardFlip()
      onTap()
    }
  }
}

// MARK: - Mini Map Dot

struct MiniMapDot: View {
  let realm: CosmicRealm
  let isActive: Bool
  let isCurrent: Bool

  var body: some View {
    ZStack {
      // Outer glow when active
      if isActive {
        Circle()
          .fill(realm.color.opacity(0.3))
          .frame(width: 16, height: 16)
      }

      // Main dot
      Circle()
        .fill(isActive ? realm.color : realm.color.opacity(0.4))
        .frame(width: isActive ? 10 : 6, height: isActive ? 10 : 6)

      // Current location indicator
      if isCurrent {
        Circle()
          .stroke(Palette.primary.cyan, lineWidth: 2)
          .frame(width: 14, height: 14)
      }
    }
    .animation(.easeInOut(duration: 0.2), value: isActive)
  }
}

// MARK: - Preview

#Preview {
  ZStack {
    Color.black.ignoresSafeArea()

    VStack(spacing: 20) {
      DemonizedEntityCard(
        entity: CosmicEntity(
          name: "Lucifer",
          titles: ["Light Bearer", "Morning Star"],
          description: "The light bearer",
          symbolism: "Inner light",
          color: .purple,
          icon: "star.fill",
          associatedWith: [],
          gnosticTeaching: "",
          funFact: nil
        ),
        onTap: {}
      )

      HStack(spacing: 20) {
        MiniMapDot(realm: CosmicRealm.realmsTopToBottom[0], isActive: true, isCurrent: false)
        MiniMapDot(realm: CosmicRealm.realmsTopToBottom[1], isActive: false, isCurrent: true)
        MiniMapDot(realm: CosmicRealm.realmsTopToBottom[2], isActive: false, isCurrent: false)
      }
    }
    .padding()
  }
}
