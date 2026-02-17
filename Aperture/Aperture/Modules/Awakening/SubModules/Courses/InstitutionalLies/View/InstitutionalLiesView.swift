// InstitutionalLiesView.swift
// Main view for documented institutional lies and awakening truths

import SwiftUI

struct InstitutionalLiesView: View {
  @Environment(\.dismiss) private var dismiss

  var body: some View {
    NavigationStack {
      ZStack {
        CosmicBackground(starCount: 60)

        ScrollView(showsIndicators: false) {
          VStack(spacing: 24) {
            headerSection

            warningBanner

            governmentSection

            corporateSection

            mechanismsSection

            awakeningSection

            Spacer(minLength: 100)
          }
          .padding(.horizontal, 20)
          .padding(.top, 20)
        }
      }
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItem(placement: .navigationBarLeading) {
          Text("DOCUMENTED TRUTH")
            .font(.system(size: 10, weight: .bold, design: .rounded))
            .foregroundColor(Palette.accent.gold)
            .tracking(2)
        }
        ToolbarItem(placement: .navigationBarTrailing) {
          Button(action: { dismiss() }) {
            Image(systemName: "xmark")
              .font(.system(size: 14, weight: .semibold))
              .foregroundColor(.white)
              .frame(width: 32, height: 32)
              .background(Color.white.opacity(0.1))
              .clipShape(Circle())
          }
        }
      }
    }
  }

  // MARK: - Header

  private var headerSection: some View {
    VStack(spacing: 12) {
      Image(systemName: "doc.text.magnifyingglass")
        .font(.system(size: 50))
        .foregroundStyle(
          LinearGradient(
            colors: [Palette.primary.red, Palette.accent.gold],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
          )
        )

      Text("INSTITUTIONAL LIES")
        .font(.system(size: 24, weight: .black, design: .rounded))
        .foregroundColor(.white)
        .tracking(2)

      Text("Primary sources. Documented crimes. No conspiracy theories.")
        .font(.system(size: 14, weight: .medium, design: .rounded))
        .foregroundColor(Palette.text.secondary)
        .multilineTextAlignment(.center)
    }
    .padding(.vertical, 20)
  }

  // MARK: - Warning Banner

  private var warningBanner: some View {
    VStack(alignment: .leading, spacing: 12) {
      HStack(spacing: 8) {
        Image(systemName: "checkmark.shield.fill")
          .foregroundColor(Palette.accent.gold)
        Text("VERIFICATION STANDARD")
          .font(.system(size: 11, weight: .bold, design: .rounded))
          .foregroundColor(Palette.accent.gold)
          .tracking(1)
      }

      Text(
        "Everything here links to primary sources: DOJ cases, FDA communications, Senate reports, peer-reviewed journals, or declassified government documents. These are not theories - they are documented institutional actions."
      )
      .font(.system(size: 13, weight: .medium, design: .rounded))
      .foregroundColor(Palette.text.secondary)
      .lineSpacing(4)
    }
    .padding(16)
    .background(
      RoundedRectangle(cornerRadius: 12)
        .fill(Palette.accent.gold.opacity(0.1))
        .overlay(
          RoundedRectangle(cornerRadius: 12)
            .stroke(Palette.accent.gold.opacity(0.3), lineWidth: 1)
        )
    )
  }

  // MARK: - Government Section

  private var governmentSection: some View {
    VStack(alignment: .leading, spacing: 12) {
      sectionHeader(
        title: "GOVERNMENT CRIMES",
        icon: "building.columns.fill",
        color: Palette.primary.red
      )

      NavigationLink(destination: GovernmentCrimesListView()) {
        sectionCard(
          title: "Documented Government Atrocities",
          subtitle: "Tuskegee • MKUltra • COINTELPRO • Operation Northwoods",
          icon: "exclamationmark.triangle.fill",
          color: Palette.primary.red,
          count: GovernmentCrimesModule.all.count
        )
      }
    }
  }

  // MARK: - Corporate Section

  private var corporateSection: some View {
    VStack(alignment: .leading, spacing: 12) {
      sectionHeader(
        title: "CORPORATE CRIMES",
        icon: "briefcase.fill",
        color: Palette.accent.gold
      )

      NavigationLink(destination: CorporateCrimesListView()) {
        sectionCard(
          title: "Corporate Crimes & Cover-Ups",
          subtitle: "Opioid Crisis • Vioxx • Tobacco • Insurance • 1971",
          icon: "dollarsign.circle.fill",
          color: Palette.accent.gold,
          count: CorporateCrimesModule.all.count
        )
      }
    }
  }

  // MARK: - Mechanisms Section

  private var mechanismsSection: some View {
    VStack(alignment: .leading, spacing: 12) {
      sectionHeader(
        title: "HOW THEY KEEP IT RUNNING",
        icon: "gearshape.2.fill",
        color: Palette.primary.cyan
      )

      NavigationLink(destination: ControlMechanismsListView()) {
        sectionCard(
          title: "The Control Mechanisms",
          subtitle: "Repetition • Capture • Fragmentation • Delay",
          icon: "lock.shield.fill",
          color: Palette.primary.cyan,
          count: ControlMechanism.all.count
        )
      }
    }
  }

  // MARK: - Awakening Section

  private var awakeningSection: some View {
    VStack(alignment: .leading, spacing: 12) {
      sectionHeader(
        title: "THE PERSONAL LIES",
        icon: "brain.head.profile",
        color: Palette.primary.violet
      )

      NavigationLink(destination: AwakeningLiesListView()) {
        sectionCard(
          title: "25 Lies People Wake Up From",
          subtitle: "Identity • Worth • Relationships • Reality • Spirituality",
          icon: "lightbulb.fill",
          color: Palette.primary.violet,
          count: AwakeningLie.all.count
        )
      }
    }
  }

  // MARK: - Helpers

  private func sectionHeader(title: String, icon: String, color: Color) -> some View {
    HStack(spacing: 8) {
      Image(systemName: icon)
        .font(.system(size: 12))
        .foregroundColor(color)
      Text(title)
        .font(.system(size: 12, weight: .bold, design: .rounded))
        .foregroundColor(color)
        .tracking(2)
    }
  }

  private func sectionCard(
    title: String,
    subtitle: String,
    icon: String,
    color: Color,
    count: Int
  ) -> some View {
    HStack(spacing: 16) {
      ZStack {
        RoundedRectangle(cornerRadius: 12)
          .fill(color.opacity(0.2))
          .frame(width: 56, height: 56)

        Image(systemName: icon)
          .font(.system(size: 24))
          .foregroundColor(color)
      }

      VStack(alignment: .leading, spacing: 4) {
        Text(title)
          .font(.system(size: 16, weight: .bold, design: .rounded))
          .foregroundColor(.white)

        Text(subtitle)
          .font(.system(size: 12, weight: .medium))
          .foregroundColor(Palette.text.secondary)
          .lineLimit(1)

        Text("\(count) documented cases")
          .font(.system(size: 11, weight: .medium))
          .foregroundColor(Palette.text.muted)
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
            .stroke(color.opacity(0.2), lineWidth: 1)
        )
    )
  }
}
