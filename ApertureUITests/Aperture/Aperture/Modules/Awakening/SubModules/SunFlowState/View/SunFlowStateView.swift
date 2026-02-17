// SunFlowStateView.swift
// Premium feature - Flow State mastery and circadian calibration

import SwiftUI

struct SunFlowStateView: View {
  @Environment(\.dismiss) private var dismiss
  @State private var selectedSection: FlowSection = .overview

  var body: some View {
    NavigationStack {
      ZStack {
        flowBackground

        ScrollView(showsIndicators: false) {
          VStack(spacing: 24) {
            premiumBadge

            headerSection

            sectionPicker

            contentForSection

            Spacer(minLength: 100)
          }
          .padding(.horizontal, 20)
          .padding(.top, 20)
        }
      }
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItem(placement: .navigationBarLeading) {
          Text("SUNFLOW STATE")
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

  // MARK: - Premium Badge

  private var premiumBadge: some View {
    HStack(spacing: 8) {
      Image(systemName: "crown.fill")
        .foregroundColor(Palette.accent.gold)
      Text("PREMIUM FEATURE")
        .font(.system(size: 10, weight: .bold, design: .rounded))
        .foregroundColor(Palette.accent.gold)
        .tracking(2)
    }
    .padding(.horizontal, 16)
    .padding(.vertical, 8)
    .background(
      Capsule()
        .fill(Palette.accent.gold.opacity(0.15))
        .overlay(
          Capsule()
            .stroke(Palette.accent.gold.opacity(0.3), lineWidth: 1)
        )
    )
  }

  // MARK: - Header

  private var headerSection: some View {
    VStack(spacing: 16) {
      ZStack {
        Circle()
          .fill(
            RadialGradient(
              colors: [Palette.accent.gold.opacity(0.4), Color.clear],
              center: .center,
              startRadius: 30,
              endRadius: 80
            )
          )
          .frame(width: 140, height: 140)

        Image(systemName: "sun.max.trianglebadge.exclamationmark.fill")
          .font(.system(size: 60))
          .foregroundStyle(
            LinearGradient(
              colors: [Palette.accent.gold, Palette.primary.orange],
              startPoint: .top,
              endPoint: .bottom
            )
          )
      }

      Text("SunFlow State")
        .font(.system(size: 28, weight: .black, design: .rounded))
        .foregroundColor(.white)

      Text("Enter flow on command. Calibrate your rhythm.")
        .font(.system(size: 14, weight: .medium))
        .foregroundColor(Palette.text.secondary)
        .multilineTextAlignment(.center)

      ultraInstinctQuote
    }
    .padding(.vertical, 20)
  }

  private var ultraInstinctQuote: some View {
    VStack(spacing: 8) {
      Text("\"The body moves on its own.\"")
        .font(.system(size: 16, weight: .semibold, design: .rounded))
        .foregroundColor(Palette.accent.gold)
        .italic()

      Text("— Whis, Dragon Ball Super")
        .font(.system(size: 12, weight: .medium))
        .foregroundColor(Palette.text.muted)
    }
    .padding(16)
    .background(
      RoundedRectangle(cornerRadius: 12)
        .fill(Palette.accent.gold.opacity(0.1))
    )
  }

  // MARK: - Section Picker

  private var sectionPicker: some View {
    ScrollView(.horizontal, showsIndicators: false) {
      HStack(spacing: 12) {
        ForEach(FlowSection.allCases, id: \.self) { section in
          sectionTab(section)
        }
      }
      .padding(.horizontal, 4)
    }
  }

  private func sectionTab(_ section: FlowSection) -> some View {
    let isSelected = selectedSection == section

    return Button(action: { withAnimation { selectedSection = section } }) {
      HStack(spacing: 6) {
        Image(systemName: section.icon)
          .font(.system(size: 12))
        Text(section.title)
          .font(.system(size: 12, weight: .semibold))
      }
      .padding(.horizontal, 14)
      .padding(.vertical, 10)
      .background(
        Capsule()
          .fill(isSelected ? section.color : Color.white.opacity(0.1))
      )
      .foregroundColor(isSelected ? .white : Palette.text.secondary)
    }
  }

  // MARK: - Content

  @ViewBuilder
  private var contentForSection: some View {
    switch selectedSection {
    case .overview:
      overviewSection
    case .flowStates:
      flowStatesSection
    case .triggers:
      triggersSection
    case .circadian:
      circadianSection
    case .protocols:
      protocolsSection
    case .blockers:
      blockersSection
    }
  }

  // MARK: - Overview Section

  private var overviewSection: some View {
    VStack(spacing: 20) {
      conceptCard(
        title: "What is Flow?",
        content:
          "Flow is the optimal state of consciousness where you feel your best and perform your best. Time dilates. The inner critic goes quiet. Action and awareness merge. You are completely absorbed.",
        icon: "water.waves",
        color: Palette.primary.cyan
      )

      conceptCard(
        title: "The SunFlow System",
        content:
          "This isn't just about feeling good. It's about building the capacity to enter flow on command - and stay there. We combine flow triggers, circadian optimization, and practical protocols.",
        icon: "sun.max.fill",
        color: Palette.accent.gold
      )

      conceptCard(
        title: "Ultra Instinct = Flow",
        content:
          "In Dragon Ball, Ultra Instinct is when the body reacts without conscious thought. That's flow. The goal is to make this your default operating system.",
        icon: "sparkles",
        color: Color.white
      )

      NavigationLink(destination: FlowStatesListView()) {
        startCard
      }
    }
  }

  private var startCard: some View {
    HStack(spacing: 16) {
      Image(systemName: "play.circle.fill")
        .font(.system(size: 40))
        .foregroundColor(Palette.accent.gold)

      VStack(alignment: .leading, spacing: 4) {
        Text("Begin Your Training")
          .font(.system(size: 16, weight: .bold, design: .rounded))
          .foregroundColor(.white)
        Text("Explore flow states, triggers, and protocols")
          .font(.system(size: 12, weight: .medium))
          .foregroundColor(Palette.text.secondary)
      }

      Spacer()

      Image(systemName: "chevron.right")
        .foregroundColor(Palette.text.muted)
    }
    .padding(20)
    .background(
      RoundedRectangle(cornerRadius: 16)
        .fill(Palette.accent.gold.opacity(0.15))
        .overlay(
          RoundedRectangle(cornerRadius: 16)
            .stroke(Palette.accent.gold.opacity(0.3), lineWidth: 1)
        )
    )
  }

  // MARK: - Flow States Section

  private var flowStatesSection: some View {
    VStack(spacing: 16) {
      sectionHeader(title: "THE 5 FLOW STATES", subtitle: "From micro-flow to Ultra Instinct")

      ForEach(FlowState.states) { state in
        NavigationLink(destination: FlowStateDetailView(state: state)) {
          flowStateCard(state)
        }
      }
    }
  }

  private func flowStateCard(_ state: FlowState) -> some View {
    HStack(spacing: 16) {
      ZStack {
        Circle()
          .fill(state.color.opacity(0.2))
          .frame(width: 50, height: 50)

        Image(systemName: state.icon)
          .font(.system(size: 22))
          .foregroundColor(state.color)
      }

      VStack(alignment: .leading, spacing: 4) {
        Text(state.name)
          .font(.system(size: 16, weight: .bold, design: .rounded))
          .foregroundColor(.white)

        Text(state.dbzEquivalent)
          .font(.system(size: 11, weight: .medium))
          .foregroundColor(state.color)
      }

      Spacer()

      Image(systemName: "chevron.right")
        .font(.system(size: 14))
        .foregroundColor(Palette.text.muted)
    }
    .padding(16)
    .background(
      RoundedRectangle(cornerRadius: 14)
        .fill(Color.white.opacity(0.05))
        .overlay(
          RoundedRectangle(cornerRadius: 14)
            .stroke(state.color.opacity(0.2), lineWidth: 1)
        )
    )
  }

  // MARK: - Triggers Section

  private var triggersSection: some View {
    VStack(spacing: 16) {
      sectionHeader(title: "FLOW TRIGGERS", subtitle: "17 science-backed ways to enter flow")

      ForEach(TriggerCategory.allCases, id: \.self) { category in
        NavigationLink(destination: TriggerCategoryView(category: category)) {
          triggerCategoryCard(category)
        }
      }
    }
  }

  private func triggerCategoryCard(_ category: TriggerCategory) -> some View {
    let triggers = FlowTrigger.byCategory(category)

    return HStack(spacing: 16) {
      ZStack {
        RoundedRectangle(cornerRadius: 12)
          .fill(category.color.opacity(0.2))
          .frame(width: 50, height: 50)

        Image(systemName: category.icon)
          .font(.system(size: 22))
          .foregroundColor(category.color)
      }

      VStack(alignment: .leading, spacing: 4) {
        Text(category.rawValue)
          .font(.system(size: 16, weight: .bold, design: .rounded))
          .foregroundColor(.white)

        Text("\(triggers.count) triggers")
          .font(.system(size: 12, weight: .medium))
          .foregroundColor(Palette.text.secondary)
      }

      Spacer()

      Image(systemName: "chevron.right")
        .font(.system(size: 14))
        .foregroundColor(Palette.text.muted)
    }
    .padding(16)
    .background(
      RoundedRectangle(cornerRadius: 14)
        .fill(Color.white.opacity(0.05))
        .overlay(
          RoundedRectangle(cornerRadius: 14)
            .stroke(category.color.opacity(0.2), lineWidth: 1)
        )
    )
  }

  // MARK: - Circadian Section

  private var circadianSection: some View {
    VStack(spacing: 16) {
      sectionHeader(
        title: "CIRCADIAN CALIBRATION", subtitle: "Work with your biology, not against it")

      NavigationLink(destination: CircadianPhasesView()) {
        circadianNavCard(
          title: "Daily Phases",
          subtitle: "6 phases of your circadian rhythm",
          icon: "clock.fill",
          color: Palette.accent.gold
        )
      }

      NavigationLink(destination: ChronotypeView()) {
        circadianNavCard(
          title: "Your Chronotype",
          subtitle: "Lion, Bear, Wolf, or Dolphin?",
          icon: "person.fill.questionmark",
          color: Palette.primary.cyan
        )
      }

      NavigationLink(destination: CircadianAnchorsView()) {
        circadianNavCard(
          title: "Circadian Anchors",
          subtitle: "6 anchors to reset your clock",
          icon: "anchor.fill",
          color: Palette.primary.violet
        )
      }

      NavigationLink(destination: SleepArchitectureView()) {
        circadianNavCard(
          title: "Sleep Architecture",
          subtitle: "Light, Deep, and REM sleep",
          icon: "moon.zzz.fill",
          color: Color(hex: "#5C6BC0")
        )
      }
    }
  }

  private func circadianNavCard(title: String, subtitle: String, icon: String, color: Color)
    -> some View
  {
    HStack(spacing: 16) {
      ZStack {
        Circle()
          .fill(color.opacity(0.2))
          .frame(width: 50, height: 50)

        Image(systemName: icon)
          .font(.system(size: 22))
          .foregroundColor(color)
      }

      VStack(alignment: .leading, spacing: 4) {
        Text(title)
          .font(.system(size: 16, weight: .bold, design: .rounded))
          .foregroundColor(.white)

        Text(subtitle)
          .font(.system(size: 12, weight: .medium))
          .foregroundColor(Palette.text.secondary)
      }

      Spacer()

      Image(systemName: "chevron.right")
        .font(.system(size: 14))
        .foregroundColor(Palette.text.muted)
    }
    .padding(16)
    .background(
      RoundedRectangle(cornerRadius: 14)
        .fill(Color.white.opacity(0.05))
        .overlay(
          RoundedRectangle(cornerRadius: 14)
            .stroke(color.opacity(0.2), lineWidth: 1)
        )
    )
  }

  // MARK: - Protocols Section

  private var protocolsSection: some View {
    VStack(spacing: 16) {
      sectionHeader(title: "FLOW PROTOCOLS", subtitle: "Step-by-step routines for entering flow")

      ForEach(FlowProtocol.protocols) { proto in
        NavigationLink(destination: FlowProtocolDetailView(proto: proto)) {
          protocolCard(proto)
        }
      }
    }
  }

  private func protocolCard(_ proto: FlowProtocol) -> some View {
    HStack(spacing: 16) {
      ZStack {
        RoundedRectangle(cornerRadius: 12)
          .fill(proto.color.opacity(0.2))
          .frame(width: 50, height: 50)

        Image(systemName: proto.icon)
          .font(.system(size: 22))
          .foregroundColor(proto.color)
      }

      VStack(alignment: .leading, spacing: 4) {
        Text(proto.name)
          .font(.system(size: 15, weight: .bold, design: .rounded))
          .foregroundColor(.white)
          .lineLimit(1)

        HStack(spacing: 8) {
          Image(systemName: "clock")
            .font(.system(size: 10))
          Text(proto.duration)
            .font(.system(size: 11, weight: .medium))
        }
        .foregroundColor(Palette.text.muted)
      }

      Spacer()

      Text("\(proto.steps.count) steps")
        .font(.system(size: 11, weight: .medium))
        .foregroundColor(proto.color)
        .padding(.horizontal, 8)
        .padding(.vertical, 4)
        .background(Capsule().fill(proto.color.opacity(0.2)))

      Image(systemName: "chevron.right")
        .font(.system(size: 14))
        .foregroundColor(Palette.text.muted)
    }
    .padding(16)
    .background(
      RoundedRectangle(cornerRadius: 14)
        .fill(Color.white.opacity(0.05))
        .overlay(
          RoundedRectangle(cornerRadius: 14)
            .stroke(proto.color.opacity(0.2), lineWidth: 1)
        )
    )
  }

  // MARK: - Blockers Section

  private var blockersSection: some View {
    VStack(spacing: 16) {
      sectionHeader(title: "FLOW BLOCKERS", subtitle: "8 things that destroy your flow")

      ForEach(FlowBlocker.all) { blocker in
        blockerCard(blocker)
      }
    }
  }

  private func blockerCard(_ blocker: FlowBlocker) -> some View {
    VStack(alignment: .leading, spacing: 12) {
      HStack(spacing: 12) {
        ZStack {
          Circle()
            .fill(Palette.primary.red.opacity(0.2))
            .frame(width: 40, height: 40)

          Image(systemName: blocker.icon)
            .font(.system(size: 18))
            .foregroundColor(Palette.primary.red)
        }

        Text(blocker.name)
          .font(.system(size: 16, weight: .bold, design: .rounded))
          .foregroundColor(.white)

        Spacer()
      }

      Text(blocker.description)
        .font(.system(size: 13, weight: .medium))
        .foregroundColor(Palette.text.secondary)
        .lineSpacing(4)

      HStack(alignment: .top, spacing: 8) {
        Image(systemName: "checkmark.shield.fill")
          .font(.system(size: 12))
          .foregroundColor(Palette.accent.gold)
          .padding(.top, 2)

        Text(blocker.solution)
          .font(.system(size: 12, weight: .medium))
          .foregroundColor(Palette.accent.gold)
          .lineSpacing(3)
      }
      .padding(12)
      .background(
        RoundedRectangle(cornerRadius: 8)
          .fill(Palette.accent.gold.opacity(0.1))
      )
    }
    .padding(16)
    .background(
      RoundedRectangle(cornerRadius: 14)
        .fill(Color.white.opacity(0.05))
        .overlay(
          RoundedRectangle(cornerRadius: 14)
            .stroke(Palette.primary.red.opacity(0.2), lineWidth: 1)
        )
    )
  }

  // MARK: - Helpers

  private func conceptCard(title: String, content: String, icon: String, color: Color) -> some View
  {
    VStack(alignment: .leading, spacing: 12) {
      HStack(spacing: 10) {
        Image(systemName: icon)
          .font(.system(size: 18))
          .foregroundColor(color)

        Text(title)
          .font(.system(size: 16, weight: .bold, design: .rounded))
          .foregroundColor(.white)
      }

      Text(content)
        .font(.system(size: 14, weight: .medium))
        .foregroundColor(Palette.text.secondary)
        .lineSpacing(4)
    }
    .padding(16)
    .background(
      RoundedRectangle(cornerRadius: 14)
        .fill(Color.white.opacity(0.05))
        .overlay(
          RoundedRectangle(cornerRadius: 14)
            .stroke(color.opacity(0.2), lineWidth: 1)
        )
    )
  }

  private func sectionHeader(title: String, subtitle: String) -> some View {
    VStack(alignment: .leading, spacing: 4) {
      Text(title)
        .font(.system(size: 12, weight: .bold, design: .rounded))
        .foregroundColor(Palette.accent.gold)
        .tracking(2)

      Text(subtitle)
        .font(.system(size: 14, weight: .medium))
        .foregroundColor(Palette.text.secondary)
    }
    .frame(maxWidth: .infinity, alignment: .leading)
  }

  // MARK: - Background

  private var flowBackground: some View {
    ZStack {
      LinearGradient(
        colors: [
          Color(hex: "#0a0a08"),
          Color(hex: "#12100a"),
          Color(hex: "#0a0a08"),
        ],
        startPoint: .top,
        endPoint: .bottom
      )
      .ignoresSafeArea()

      ForEach(0..<50, id: \.self) { i in
        Circle()
          .fill(i % 3 == 0 ? Palette.accent.gold.opacity(0.3) : Color.white)
          .frame(width: CGFloat(i % 3 + 1))
          .position(
            x: CGFloat((i * 31) % Int(UIScreen.main.bounds.width)),
            y: CGFloat((i * 43) % Int(UIScreen.main.bounds.height))
          )
          .opacity(0.3)
      }
    }
  }
}

// MARK: - Flow Section Enum

enum FlowSection: String, CaseIterable {
  case overview = "Overview"
  case flowStates = "States"
  case triggers = "Triggers"
  case circadian = "Circadian"
  case protocols = "Protocols"
  case blockers = "Blockers"

  var title: String {
    rawValue
  }

  var icon: String {
    switch self {
    case .overview: return "house.fill"
    case .flowStates: return "water.waves"
    case .triggers: return "bolt.fill"
    case .circadian: return "sun.max.fill"
    case .protocols: return "list.bullet.rectangle"
    case .blockers: return "xmark.octagon.fill"
    }
  }

  var color: Color {
    switch self {
    case .overview: return Palette.accent.gold
    case .flowStates: return Palette.primary.cyan
    case .triggers: return Palette.primary.violet
    case .circadian: return Palette.accent.gold
    case .protocols: return Color(hex: "#4CAF50")
    case .blockers: return Palette.primary.red
    }
  }
}
