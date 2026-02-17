// CosmosRealmCard.swift
// Realm card and entity row components for Cosmos

import SwiftUI

// MARK: - Realm Card

struct RealmCard: View {
  let realm: CosmicRealm
  let isExpanded: Bool
  let onTap: () -> Void
  let onEntityTap: (CosmicEntity) -> Void

  var body: some View {
    VStack(alignment: .leading, spacing: 0) {
      cardHeader

      if isExpanded {
        expandedContent
      }
    }
    .background(cardBackground)
    .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
    .overlay(cardBorder)
    .shadow(color: realm.color.opacity(isExpanded ? 0.3 : 0.15), radius: isExpanded ? 20 : 10)
    .padding(.vertical, 8)
    .onTapGesture {
      HapticManager.shared.cardFlip()
      onTap()
    }
  }

  // MARK: - Card Header

  private var cardHeader: some View {
    HStack(spacing: 14) {
      // Icon
      ZStack {
        Circle()
          .fill(
            RadialGradient(
              colors: [realm.color.opacity(0.4), realm.color.opacity(0.1)],
              center: .center,
              startRadius: 0,
              endRadius: 28
            )
          )
          .frame(width: 56, height: 56)

        Image(systemName: realm.icon)
          .font(.system(size: 24, weight: .semibold))
          .foregroundColor(realm.color)
      }

      // Title & Subtitle
      VStack(alignment: .leading, spacing: 4) {
        HStack(spacing: 8) {
          Text("LEVEL \(realm.order)")
            .font(.system(size: 10, weight: .bold, design: .monospaced))
            .foregroundColor(realm.color.opacity(0.8))

          if realm.order == 0 {
            Text("• YOU ARE HERE")
              .font(.system(size: 9, weight: .bold, design: .rounded))
              .foregroundColor(Palette.primary.cyan)
          }
        }

        Text(realm.name)
          .font(.system(size: 20, weight: .bold, design: .rounded))
          .foregroundColor(Palette.text.primary)

        Text(realm.subtitle)
          .font(.system(size: 13, weight: .medium, design: .rounded))
          .foregroundColor(Palette.text.secondary)
      }

      Spacer()

      // Chevron
      Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
        .font(.system(size: 14, weight: .semibold))
        .foregroundColor(realm.color)
    }
    .padding(18)
  }

  // MARK: - Expanded Content

  private var expandedContent: some View {
    VStack(alignment: .leading, spacing: 16) {
      Divider()
        .background(realm.color.opacity(0.3))

      // Greek name
      if let greek = realm.greekName {
        Text(greek)
          .font(.system(size: 13, weight: .medium, design: .rounded))
          .italic()
          .foregroundColor(realm.color.opacity(0.8))
      }

      // Description
      Text(realm.description)
        .font(.system(size: 14, weight: .regular, design: .rounded))
        .foregroundColor(Palette.text.secondary)
        .lineSpacing(5)

      // Significance
      significanceSection

      // Entities
      if !realm.entities.isEmpty {
        entitiesSection
      }

      // Dragon Comment
      dragonCommentSection
    }
    .padding(.horizontal, 18)
    .padding(.bottom, 18)
    .transition(.opacity.combined(with: .move(edge: .top)))
  }

  private var significanceSection: some View {
    VStack(alignment: .leading, spacing: 6) {
      Label("SIGNIFICANCE", systemImage: "sparkle")
        .font(.system(size: 11, weight: .bold, design: .rounded))
        .foregroundColor(Palette.accent.gold)

      Text(realm.significance)
        .font(.system(size: 13, weight: .medium, design: .rounded))
        .foregroundColor(Palette.text.primary.opacity(0.9))
        .lineSpacing(4)
    }
    .padding(12)
    .background(
      RoundedRectangle(cornerRadius: 10, style: .continuous)
        .fill(Palette.accent.gold.opacity(0.08))
    )
  }

  private var entitiesSection: some View {
    VStack(alignment: .leading, spacing: 10) {
      Text("BEINGS IN THIS REALM")
        .font(.system(size: 11, weight: .bold, design: .rounded))
        .foregroundColor(realm.color)
        .tracking(1)

      ForEach(realm.entities) { entity in
        EntityRow(entity: entity, realmColor: realm.color)
          .onTapGesture {
            onEntityTap(entity)
          }
      }
    }
  }

  private var dragonCommentSection: some View {
    HStack(alignment: .top, spacing: 10) {
      Text("🐉")
        .font(.system(size: 18))

      Text(realm.dragonComment)
        .font(.system(size: 13, weight: .medium, design: .rounded))
        .italic()
        .foregroundColor(Palette.accent.gold.opacity(0.9))
        .lineSpacing(4)
    }
    .padding(12)
    .background(
      RoundedRectangle(cornerRadius: 10, style: .continuous)
        .fill(Palette.accent.gold.opacity(0.05))
        .overlay(
          RoundedRectangle(cornerRadius: 10, style: .continuous)
            .stroke(Palette.accent.gold.opacity(0.2), lineWidth: 1)
        )
    )
  }

  // MARK: - Background & Border

  private var cardBackground: some View {
    RoundedRectangle(cornerRadius: 20, style: .continuous)
      .fill(
        LinearGradient(
          colors: [
            Color.white.opacity(0.08),
            Color.white.opacity(0.02),
          ],
          startPoint: .topLeading,
          endPoint: .bottomTrailing
        )
      )
  }

  private var cardBorder: some View {
    RoundedRectangle(cornerRadius: 20, style: .continuous)
      .stroke(
        LinearGradient(
          colors: [
            realm.color.opacity(isExpanded ? 0.5 : 0.25),
            realm.color.opacity(0.1),
          ],
          startPoint: .topLeading,
          endPoint: .bottomTrailing
        ),
        lineWidth: 1
      )
  }
}

// MARK: - Entity Row

struct EntityRow: View {
  let entity: CosmicEntity
  let realmColor: Color

  var body: some View {
    HStack(spacing: 12) {
      // Icon
      Image(systemName: entity.icon)
        .font(.system(size: 16, weight: .semibold))
        .foregroundColor(entity.color)
        .frame(width: 36, height: 36)
        .background(
          Circle()
            .fill(entity.color.opacity(0.15))
        )

      // Info
      VStack(alignment: .leading, spacing: 2) {
        Text(entity.name)
          .font(.system(size: 15, weight: .bold, design: .rounded))
          .foregroundColor(Palette.text.primary)

        Text(entity.titles.prefix(2).joined(separator: " • "))
          .font(.system(size: 11, weight: .medium, design: .rounded))
          .foregroundColor(Palette.text.muted)
          .lineLimit(1)
      }

      Spacer()

      // Tap indicator
      Image(systemName: "chevron.right")
        .font(.system(size: 12, weight: .semibold))
        .foregroundColor(Palette.text.muted)
    }
    .padding(10)
    .background(
      RoundedRectangle(cornerRadius: 10, style: .continuous)
        .fill(Color.white.opacity(0.03))
    )
  }
}

// MARK: - Preview

#Preview {
  ZStack {
    Color.black.ignoresSafeArea()

    ScrollView {
      VStack {
        RealmCard(
          realm: CosmicRealm.realmsTopToBottom[0],
          isExpanded: true,
          onTap: {},
          onEntityTap: { _ in }
        )
      }
      .padding()
    }
  }
}
