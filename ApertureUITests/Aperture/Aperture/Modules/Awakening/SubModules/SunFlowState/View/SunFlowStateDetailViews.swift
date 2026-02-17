// SunFlowStateDetailViews.swift
// Detail views for flow states, triggers, circadian phases, and protocols

import SwiftUI

// MARK: - Flow States List View

struct FlowStatesListView: View {
  var body: some View {
    ScrollView {
      VStack(spacing: 16) {
        headerSection

        ForEach(FlowState.states) { state in
          NavigationLink(destination: FlowStateDetailView(state: state)) {
            flowStateCard(state)
          }
        }

        Spacer(minLength: 40)
      }
      .padding(20)
    }
    .background(Color.black.ignoresSafeArea())
    .navigationTitle("Flow States")
    .navigationBarTitleDisplayMode(.inline)
  }

  private var headerSection: some View {
    VStack(spacing: 8) {
      Text("THE 5 LEVELS OF FLOW")
        .font(.system(size: 12, weight: .bold, design: .rounded))
        .foregroundColor(Palette.accent.gold)
        .tracking(2)

      Text("From micro-moments to Ultra Instinct")
        .font(.system(size: 14, weight: .medium))
        .foregroundColor(Palette.text.secondary)
    }
    .padding(.bottom, 10)
  }

  private func flowStateCard(_ state: FlowState) -> some View {
    HStack(spacing: 16) {
      ZStack {
        Circle()
          .fill(state.color.opacity(0.2))
          .frame(width: 56, height: 56)

        Image(systemName: state.icon)
          .font(.system(size: 24))
          .foregroundColor(state.color)
      }

      VStack(alignment: .leading, spacing: 6) {
        Text(state.name)
          .font(.system(size: 17, weight: .bold, design: .rounded))
          .foregroundColor(.white)

        Text(state.dbzEquivalent)
          .font(.system(size: 12, weight: .semibold))
          .foregroundColor(state.color)

        Text(state.brainwaveRange)
          .font(.system(size: 11, weight: .medium))
          .foregroundColor(Palette.text.muted)
      }

      Spacer()

      Image(systemName: "chevron.right")
        .foregroundColor(Palette.text.muted)
    }
    .padding(16)
    .background(
      RoundedRectangle(cornerRadius: 16)
        .fill(Color.white.opacity(0.05))
        .overlay(
          RoundedRectangle(cornerRadius: 16)
            .stroke(state.color.opacity(0.2), lineWidth: 1)
        )
    )
  }
}

// MARK: - Flow State Detail View

struct FlowStateDetailView: View {
  let state: FlowState

  var body: some View {
    ScrollView {
      VStack(spacing: 24) {
        headerSection

        descriptionSection

        characteristicsSection

        dbzSection

        Spacer(minLength: 40)
      }
      .padding(20)
    }
    .background(Color.black.ignoresSafeArea())
    .navigationTitle(state.name)
    .navigationBarTitleDisplayMode(.inline)
  }

  private var headerSection: some View {
    VStack(spacing: 16) {
      ZStack {
        Circle()
          .fill(
            RadialGradient(
              colors: [state.color.opacity(0.4), Color.clear],
              center: .center,
              startRadius: 30,
              endRadius: 80
            )
          )
          .frame(width: 160, height: 160)

        Image(systemName: state.icon)
          .font(.system(size: 60))
          .foregroundColor(state.color)
      }

      Text(state.brainwaveRange)
        .font(.system(size: 13, weight: .semibold, design: .monospaced))
        .foregroundColor(state.color)
        .padding(.horizontal, 14)
        .padding(.vertical, 6)
        .background(
          Capsule().fill(state.color.opacity(0.15))
        )
    }
  }

  private var descriptionSection: some View {
    VStack(alignment: .leading, spacing: 12) {
      Text("WHAT IT IS")
        .font(.system(size: 11, weight: .bold, design: .rounded))
        .foregroundColor(Palette.text.muted)
        .tracking(1)

      Text(state.description)
        .font(.system(size: 15, weight: .medium))
        .foregroundColor(Palette.text.primary)
        .lineSpacing(5)
    }
    .padding(16)
    .background(
      RoundedRectangle(cornerRadius: 14)
        .fill(Color.white.opacity(0.05))
    )
  }

  private var characteristicsSection: some View {
    VStack(alignment: .leading, spacing: 12) {
      Text("CHARACTERISTICS")
        .font(.system(size: 11, weight: .bold, design: .rounded))
        .foregroundColor(state.color)
        .tracking(1)

      ForEach(state.characteristics, id: \.self) { char in
        HStack(alignment: .top, spacing: 12) {
          Circle()
            .fill(state.color)
            .frame(width: 6, height: 6)
            .padding(.top, 6)

          Text(char)
            .font(.system(size: 14, weight: .medium))
            .foregroundColor(Palette.text.secondary)
        }
      }
    }
    .padding(16)
    .background(
      RoundedRectangle(cornerRadius: 14)
        .fill(state.color.opacity(0.1))
        .overlay(
          RoundedRectangle(cornerRadius: 14)
            .stroke(state.color.opacity(0.2), lineWidth: 1)
        )
    )
  }

  private var dbzSection: some View {
    VStack(spacing: 12) {
      Text("🐉 DRAGON BALL EQUIVALENT")
        .font(.system(size: 11, weight: .bold, design: .rounded))
        .foregroundColor(Palette.accent.gold)
        .tracking(1)

      Text(state.dbzEquivalent)
        .font(.system(size: 16, weight: .bold, design: .rounded))
        .foregroundColor(.white)
        .multilineTextAlignment(.center)
    }
    .frame(maxWidth: .infinity)
    .padding(20)
    .background(
      RoundedRectangle(cornerRadius: 14)
        .fill(Palette.accent.gold.opacity(0.1))
        .overlay(
          RoundedRectangle(cornerRadius: 14)
            .stroke(Palette.accent.gold.opacity(0.3), lineWidth: 1)
        )
    )
  }
}

// MARK: - Trigger Category View

struct TriggerCategoryView: View {
  let category: TriggerCategory

  private var triggers: [FlowTrigger] {
    FlowTrigger.byCategory(category)
  }

  var body: some View {
    ScrollView {
      VStack(spacing: 16) {
        headerSection

        ForEach(triggers) { trigger in
          triggerCard(trigger)
        }

        Spacer(minLength: 40)
      }
      .padding(20)
    }
    .background(Color.black.ignoresSafeArea())
    .navigationTitle(category.rawValue)
    .navigationBarTitleDisplayMode(.inline)
  }

  private var headerSection: some View {
    HStack(spacing: 14) {
      ZStack {
        Circle()
          .fill(category.color.opacity(0.2))
          .frame(width: 50, height: 50)

        Image(systemName: category.icon)
          .font(.system(size: 22))
          .foregroundColor(category.color)
      }

      VStack(alignment: .leading, spacing: 4) {
        Text("\(category.rawValue.uppercased()) TRIGGERS")
          .font(.system(size: 12, weight: .bold, design: .rounded))
          .foregroundColor(category.color)
          .tracking(1)

        Text("\(triggers.count) ways to enter flow")
          .font(.system(size: 14, weight: .medium))
          .foregroundColor(Palette.text.secondary)
      }

      Spacer()
    }
    .padding(.bottom, 10)
  }

  private func triggerCard(_ trigger: FlowTrigger) -> some View {
    VStack(alignment: .leading, spacing: 14) {
      HStack(spacing: 12) {
        Image(systemName: trigger.icon)
          .font(.system(size: 20))
          .foregroundColor(category.color)
          .frame(width: 36, height: 36)
          .background(Circle().fill(category.color.opacity(0.15)))

        VStack(alignment: .leading, spacing: 2) {
          Text(trigger.name)
            .font(.system(size: 16, weight: .bold, design: .rounded))
            .foregroundColor(.white)

          Text(trigger.timeToEffect)
            .font(.system(size: 11, weight: .medium))
            .foregroundColor(Palette.text.muted)
        }
      }

      Text(trigger.description)
        .font(.system(size: 14, weight: .medium))
        .foregroundColor(Palette.text.secondary)
        .lineSpacing(4)

      VStack(alignment: .leading, spacing: 10) {
        triggerSection(
          title: "HOW TO", content: trigger.howTo, icon: "hand.point.right.fill",
          color: Palette.accent.gold)

        triggerSection(
          title: "THE SCIENCE", content: trigger.scienceBehind, icon: "brain.head.profile",
          color: Palette.primary.cyan)
      }
    }
    .padding(16)
    .background(
      RoundedRectangle(cornerRadius: 16)
        .fill(Color.white.opacity(0.05))
        .overlay(
          RoundedRectangle(cornerRadius: 16)
            .stroke(category.color.opacity(0.15), lineWidth: 1)
        )
    )
  }

  private func triggerSection(title: String, content: String, icon: String, color: Color)
    -> some View
  {
    VStack(alignment: .leading, spacing: 6) {
      HStack(spacing: 6) {
        Image(systemName: icon)
          .font(.system(size: 10))
        Text(title)
          .font(.system(size: 10, weight: .bold))
          .tracking(1)
      }
      .foregroundColor(color)

      Text(content)
        .font(.system(size: 13, weight: .medium))
        .foregroundColor(Palette.text.primary)
        .lineSpacing(3)
    }
    .padding(12)
    .background(
      RoundedRectangle(cornerRadius: 10)
        .fill(color.opacity(0.08))
    )
  }
}

// MARK: - Circadian Phases View

struct CircadianPhasesView: View {
  var body: some View {
    ScrollView {
      VStack(spacing: 16) {
        Text("Your body follows a 24-hour rhythm. Work with it.")
          .font(.system(size: 14, weight: .medium))
          .foregroundColor(Palette.text.secondary)
          .multilineTextAlignment(.center)
          .padding(.bottom, 10)

        ForEach(CircadianPhase.phases) { phase in
          phaseCard(phase)
        }

        Spacer(minLength: 40)
      }
      .padding(20)
    }
    .background(Color.black.ignoresSafeArea())
    .navigationTitle("Daily Phases")
    .navigationBarTitleDisplayMode(.inline)
  }

  private func phaseCard(_ phase: CircadianPhase) -> some View {
    VStack(alignment: .leading, spacing: 14) {
      HStack(spacing: 12) {
        ZStack {
          Circle()
            .fill(phase.color.opacity(0.2))
            .frame(width: 44, height: 44)

          Image(systemName: phase.icon)
            .font(.system(size: 20))
            .foregroundColor(phase.color)
        }

        VStack(alignment: .leading, spacing: 2) {
          Text(phase.name)
            .font(.system(size: 16, weight: .bold, design: .rounded))
            .foregroundColor(.white)

          Text(phase.timeRange)
            .font(.system(size: 12, weight: .semibold, design: .monospaced))
            .foregroundColor(phase.color)
        }

        Spacer()
      }

      Text(phase.description)
        .font(.system(size: 14, weight: .medium))
        .foregroundColor(Palette.text.secondary)
        .lineSpacing(4)

      VStack(alignment: .leading, spacing: 8) {
        Text("✓ OPTIMAL ACTIVITIES")
          .font(.system(size: 10, weight: .bold))
          .foregroundColor(Palette.accent.gold)
          .tracking(1)

        ForEach(phase.optimalActivities.prefix(3), id: \.self) { activity in
          HStack(spacing: 8) {
            Circle().fill(Palette.accent.gold).frame(width: 4, height: 4)
            Text(activity)
              .font(.system(size: 12, weight: .medium))
              .foregroundColor(Palette.text.primary)
          }
        }
      }
      .padding(12)
      .background(RoundedRectangle(cornerRadius: 10).fill(Palette.accent.gold.opacity(0.1)))

      VStack(alignment: .leading, spacing: 8) {
        Text("✗ AVOID")
          .font(.system(size: 10, weight: .bold))
          .foregroundColor(Palette.primary.red)
          .tracking(1)

        ForEach(phase.avoidActivities.prefix(2), id: \.self) { activity in
          HStack(spacing: 8) {
            Circle().fill(Palette.primary.red).frame(width: 4, height: 4)
            Text(activity)
              .font(.system(size: 12, weight: .medium))
              .foregroundColor(Palette.text.secondary)
          }
        }
      }
      .padding(12)
      .background(RoundedRectangle(cornerRadius: 10).fill(Palette.primary.red.opacity(0.08)))
    }
    .padding(16)
    .background(
      RoundedRectangle(cornerRadius: 16)
        .fill(Color.white.opacity(0.05))
        .overlay(
          RoundedRectangle(cornerRadius: 16)
            .stroke(phase.color.opacity(0.2), lineWidth: 1)
        )
    )
  }
}

// MARK: - Chronotype View

struct ChronotypeView: View {
  var body: some View {
    ScrollView {
      VStack(spacing: 20) {
        Text("Which animal matches your energy pattern?")
          .font(.system(size: 14, weight: .medium))
          .foregroundColor(Palette.text.secondary)
          .multilineTextAlignment(.center)
          .padding(.bottom, 10)

        ForEach(Chronotype.types) { type in
          chronotypeCard(type)
        }

        Spacer(minLength: 40)
      }
      .padding(20)
    }
    .background(Color.black.ignoresSafeArea())
    .navigationTitle("Chronotypes")
    .navigationBarTitleDisplayMode(.inline)
  }

  private func chronotypeCard(_ type: Chronotype) -> some View {
    VStack(alignment: .leading, spacing: 16) {
      HStack(spacing: 14) {
        Text(type.animal)
          .font(.system(size: 40))

        VStack(alignment: .leading, spacing: 4) {
          Text(type.name)
            .font(.system(size: 20, weight: .bold, design: .rounded))
            .foregroundColor(.white)

          Text(type.population)
            .font(.system(size: 12, weight: .medium))
            .foregroundColor(type.color)
        }

        Spacer()
      }

      Text(type.description)
        .font(.system(size: 14, weight: .medium))
        .foregroundColor(Palette.text.secondary)
        .lineSpacing(4)

      HStack(spacing: 16) {
        VStack(alignment: .leading, spacing: 4) {
          Text("PEAK")
            .font(.system(size: 10, weight: .bold))
            .foregroundColor(Palette.accent.gold)
          Text(type.peakWindow)
            .font(.system(size: 11, weight: .semibold, design: .monospaced))
            .foregroundColor(Palette.text.primary)
        }
        .padding(10)
        .background(RoundedRectangle(cornerRadius: 8).fill(Palette.accent.gold.opacity(0.1)))

        VStack(alignment: .leading, spacing: 4) {
          Text("TROUGH")
            .font(.system(size: 10, weight: .bold))
            .foregroundColor(Palette.text.muted)
          Text(type.troughWindow)
            .font(.system(size: 11, weight: .semibold, design: .monospaced))
            .foregroundColor(Palette.text.secondary)
        }
        .padding(10)
        .background(RoundedRectangle(cornerRadius: 8).fill(Color.white.opacity(0.05)))
      }

      VStack(alignment: .leading, spacing: 8) {
        Text("RECOMMENDATIONS")
          .font(.system(size: 10, weight: .bold))
          .foregroundColor(type.color)
          .tracking(1)

        ForEach(type.recommendations.prefix(3), id: \.self) { rec in
          HStack(alignment: .top, spacing: 8) {
            Image(systemName: "checkmark.circle.fill")
              .font(.system(size: 10))
              .foregroundColor(type.color)
              .padding(.top, 2)
            Text(rec)
              .font(.system(size: 12, weight: .medium))
              .foregroundColor(Palette.text.primary)
          }
        }
      }
    }
    .padding(18)
    .background(
      RoundedRectangle(cornerRadius: 18)
        .fill(Color.white.opacity(0.05))
        .overlay(
          RoundedRectangle(cornerRadius: 18)
            .stroke(type.color.opacity(0.25), lineWidth: 1)
        )
    )
  }
}

// MARK: - Circadian Anchors View

struct CircadianAnchorsView: View {
  var body: some View {
    ScrollView {
      VStack(spacing: 16) {
        Text("6 anchors to calibrate your internal clock")
          .font(.system(size: 14, weight: .medium))
          .foregroundColor(Palette.text.secondary)
          .multilineTextAlignment(.center)
          .padding(.bottom, 10)

        ForEach(CircadianAnchor.anchors) { anchor in
          anchorCard(anchor)
        }

        Spacer(minLength: 40)
      }
      .padding(20)
    }
    .background(Color.black.ignoresSafeArea())
    .navigationTitle("Circadian Anchors")
    .navigationBarTitleDisplayMode(.inline)
  }

  private func anchorCard(_ anchor: CircadianAnchor) -> some View {
    VStack(alignment: .leading, spacing: 14) {
      HStack(spacing: 12) {
        ZStack {
          Circle()
            .fill(Palette.accent.gold.opacity(0.2))
            .frame(width: 40, height: 40)

          Text("\(anchor.priority)")
            .font(.system(size: 18, weight: .bold, design: .rounded))
            .foregroundColor(Palette.accent.gold)
        }

        VStack(alignment: .leading, spacing: 2) {
          Text(anchor.name)
            .font(.system(size: 16, weight: .bold, design: .rounded))
            .foregroundColor(.white)
        }

        Spacer()

        Image(systemName: anchor.icon)
          .font(.system(size: 20))
          .foregroundColor(Palette.accent.gold)
      }

      Text(anchor.description)
        .font(.system(size: 14, weight: .medium))
        .foregroundColor(Palette.text.secondary)
        .lineSpacing(4)

      VStack(alignment: .leading, spacing: 8) {
        Text("HOW TO")
          .font(.system(size: 10, weight: .bold))
          .foregroundColor(Palette.primary.cyan)
          .tracking(1)

        Text(anchor.howTo)
          .font(.system(size: 13, weight: .medium))
          .foregroundColor(Palette.text.primary)
          .lineSpacing(3)
      }
      .padding(12)
      .background(RoundedRectangle(cornerRadius: 10).fill(Palette.primary.cyan.opacity(0.1)))

      VStack(alignment: .leading, spacing: 8) {
        Text("THE SCIENCE")
          .font(.system(size: 10, weight: .bold))
          .foregroundColor(Palette.primary.violet)
          .tracking(1)

        Text(anchor.scienceBehind)
          .font(.system(size: 12, weight: .medium))
          .foregroundColor(Palette.text.secondary)
          .lineSpacing(3)
      }
      .padding(12)
      .background(RoundedRectangle(cornerRadius: 10).fill(Palette.primary.violet.opacity(0.08)))
    }
    .padding(16)
    .background(
      RoundedRectangle(cornerRadius: 16)
        .fill(Color.white.opacity(0.05))
    )
  }
}

// MARK: - Sleep Architecture View

struct SleepArchitectureView: View {
  var body: some View {
    ScrollView {
      VStack(spacing: 20) {
        Text("Understanding your sleep cycles")
          .font(.system(size: 14, weight: .medium))
          .foregroundColor(Palette.text.secondary)
          .padding(.bottom, 10)

        ForEach(SleepStage.stages) { stage in
          sleepStageCard(stage)
        }

        Spacer(minLength: 40)
      }
      .padding(20)
    }
    .background(Color.black.ignoresSafeArea())
    .navigationTitle("Sleep Architecture")
    .navigationBarTitleDisplayMode(.inline)
  }

  private func sleepStageCard(_ stage: SleepStage) -> some View {
    VStack(alignment: .leading, spacing: 14) {
      HStack(spacing: 12) {
        ZStack {
          Circle()
            .fill(stage.color.opacity(0.2))
            .frame(width: 44, height: 44)

          Image(systemName: stage.icon)
            .font(.system(size: 20))
            .foregroundColor(stage.color)
        }

        VStack(alignment: .leading, spacing: 2) {
          Text(stage.name)
            .font(.system(size: 16, weight: .bold, design: .rounded))
            .foregroundColor(.white)

          Text(stage.duration)
            .font(.system(size: 12, weight: .medium))
            .foregroundColor(stage.color)
        }

        Spacer()
      }

      Text(stage.brainwaves)
        .font(.system(size: 12, weight: .semibold, design: .monospaced))
        .foregroundColor(Palette.text.muted)

      Text(stage.function)
        .font(.system(size: 14, weight: .medium))
        .foregroundColor(Palette.text.secondary)
        .lineSpacing(4)

      VStack(alignment: .leading, spacing: 8) {
        Text("⚠️ DISRUPTED BY")
          .font(.system(size: 10, weight: .bold))
          .foregroundColor(Palette.primary.red)
          .tracking(1)

        ForEach(stage.disrupts, id: \.self) { item in
          HStack(spacing: 8) {
            Circle().fill(Palette.primary.red).frame(width: 4, height: 4)
            Text(item)
              .font(.system(size: 12, weight: .medium))
              .foregroundColor(Palette.text.secondary)
          }
        }
      }
      .padding(12)
      .background(RoundedRectangle(cornerRadius: 10).fill(Palette.primary.red.opacity(0.08)))
    }
    .padding(16)
    .background(
      RoundedRectangle(cornerRadius: 16)
        .fill(Color.white.opacity(0.05))
        .overlay(
          RoundedRectangle(cornerRadius: 16)
            .stroke(stage.color.opacity(0.2), lineWidth: 1)
        )
    )
  }
}

// MARK: - Flow Protocol Detail View

struct FlowProtocolDetailView: View {
  let proto: FlowProtocol

  @State private var currentStep: Int = 0

  var body: some View {
    ScrollView {
      VStack(spacing: 24) {
        headerSection

        protocolOverview

        stepsSection

        bestForSection

        requirementsSection

        Spacer(minLength: 40)
      }
      .padding(20)
    }
    .background(Color.black.ignoresSafeArea())
    .navigationTitle(proto.name)
    .navigationBarTitleDisplayMode(.inline)
  }

  private var headerSection: some View {
    VStack(spacing: 16) {
      ZStack {
        Circle()
          .fill(proto.color.opacity(0.2))
          .frame(width: 80, height: 80)

        Image(systemName: proto.icon)
          .font(.system(size: 36))
          .foregroundColor(proto.color)
      }

      HStack(spacing: 8) {
        Image(systemName: "clock")
        Text(proto.duration)
      }
      .font(.system(size: 14, weight: .semibold))
      .foregroundColor(proto.color)
      .padding(.horizontal, 14)
      .padding(.vertical, 6)
      .background(Capsule().fill(proto.color.opacity(0.15)))
    }
  }

  private var protocolOverview: some View {
    Text(proto.description)
      .font(.system(size: 15, weight: .medium))
      .foregroundColor(Palette.text.secondary)
      .lineSpacing(5)
      .multilineTextAlignment(.center)
      .padding(.horizontal, 10)
  }

  private var stepsSection: some View {
    VStack(alignment: .leading, spacing: 16) {
      Text("\(proto.steps.count) STEPS")
        .font(.system(size: 12, weight: .bold, design: .rounded))
        .foregroundColor(proto.color)
        .tracking(2)

      ForEach(proto.steps) { step in
        stepCard(step)
      }
    }
  }

  private func stepCard(_ step: ProtocolStep) -> some View {
    HStack(alignment: .top, spacing: 14) {
      ZStack {
        Circle()
          .fill(proto.color.opacity(0.2))
          .frame(width: 36, height: 36)

        Text("\(step.order)")
          .font(.system(size: 16, weight: .bold))
          .foregroundColor(proto.color)
      }

      VStack(alignment: .leading, spacing: 6) {
        HStack {
          Text(step.name)
            .font(.system(size: 15, weight: .bold, design: .rounded))
            .foregroundColor(.white)

          Spacer()

          Text(step.duration)
            .font(.system(size: 11, weight: .semibold, design: .monospaced))
            .foregroundColor(Palette.text.muted)
        }

        Text(step.instruction)
          .font(.system(size: 13, weight: .medium))
          .foregroundColor(Palette.text.secondary)
          .lineSpacing(3)
      }
    }
    .padding(14)
    .background(
      RoundedRectangle(cornerRadius: 14)
        .fill(Color.white.opacity(0.05))
    )
  }

  private var bestForSection: some View {
    VStack(alignment: .leading, spacing: 12) {
      Text("BEST FOR")
        .font(.system(size: 11, weight: .bold))
        .foregroundColor(Palette.accent.gold)
        .tracking(1)

      ForEach(proto.bestFor, id: \.self) { item in
        HStack(spacing: 10) {
          Image(systemName: "checkmark.circle.fill")
            .font(.system(size: 12))
            .foregroundColor(Palette.accent.gold)
          Text(item)
            .font(.system(size: 13, weight: .medium))
            .foregroundColor(Palette.text.primary)
        }
      }
    }
    .padding(16)
    .frame(maxWidth: .infinity, alignment: .leading)
    .background(
      RoundedRectangle(cornerRadius: 14)
        .fill(Palette.accent.gold.opacity(0.1))
    )
  }

  private var requirementsSection: some View {
    VStack(alignment: .leading, spacing: 12) {
      Text("REQUIREMENTS")
        .font(.system(size: 11, weight: .bold))
        .foregroundColor(Palette.primary.cyan)
        .tracking(1)

      ForEach(proto.requirements, id: \.self) { item in
        HStack(spacing: 10) {
          Image(systemName: "arrow.right.circle.fill")
            .font(.system(size: 12))
            .foregroundColor(Palette.primary.cyan)
          Text(item)
            .font(.system(size: 13, weight: .medium))
            .foregroundColor(Palette.text.secondary)
        }
      }
    }
    .padding(16)
    .frame(maxWidth: .infinity, alignment: .leading)
    .background(
      RoundedRectangle(cornerRadius: 14)
        .fill(Palette.primary.cyan.opacity(0.08))
    )
  }
}
