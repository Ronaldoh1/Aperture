// WeeklyPlanningView.swift
// Aperture
//
// Weekly Planning Ritual - Plan your week every Sunday (15-20 min)

import SwiftUI

struct WeeklyPlanningView: View {
  @StateObject private var orchestrator = FlowOrchestrator.shared
  @Environment(\.dismiss) private var dismiss

  @State private var currentStep = 0
  @State private var topPriorities: [String] = ["", "", ""]
  @State private var socialMediaBudget = 30
  @State private var emailWindows: Set<Int> = [9, 13, 17]
  @State private var focusBlocks: [FocusBlock] = []
  @State private var reflectionNotes = ""
  @State private var lastWeekWins = ""
  @State private var lastWeekChallenges = ""

  private let totalSteps = 4

  var body: some View {
    NavigationStack {
      ZStack {
        Color(hex: "#0a0a1a")
          .ignoresSafeArea()

        VStack(spacing: 0) {
          // Progress
          progressIndicator
            .padding()

          // Content
          TabView(selection: $currentStep) {
            step1Reflection.tag(0)
            step2Priorities.tag(1)
            step3TimeBlocks.tag(2)
            step4Boundaries.tag(3)
          }
          .tabViewStyle(.page(indexDisplayMode: .never))

          // Navigation
          navigationButtons
        }
      }
      .navigationTitle("Weekly Planning")
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItem(placement: .topBarLeading) {
          Button("Cancel") { dismiss() }
            .foregroundColor(.white.opacity(0.6))
        }
      }
      .onAppear {
        loadCurrentPlan()
      }
    }
  }

  // MARK: - Progress

  private var progressIndicator: some View {
    VStack(spacing: 8) {
      HStack(spacing: 8) {
        ForEach(0..<totalSteps, id: \.self) { step in
          RoundedRectangle(cornerRadius: 2)
            .fill(step <= currentStep ? Color(hex: "#7C4DFF") : Color.white.opacity(0.2))
            .frame(height: 4)
        }
      }

      Text(stepTitle)
        .font(.caption)
        .foregroundColor(.white.opacity(0.5))
    }
  }

  private var stepTitle: String {
    switch currentStep {
    case 0: return "Reflect on Last Week"
    case 1: return "Set Priorities"
    case 2: return "Schedule Focus Time"
    case 3: return "Set Boundaries"
    default: return ""
    }
  }

  // MARK: - Step 1: Reflection

  private var step1Reflection: some View {
    ScrollView {
      VStack(alignment: .leading, spacing: 24) {
        VStack(alignment: .leading, spacing: 8) {
          Image(systemName: "arrow.counterclockwise")
            .font(.title)
            .foregroundColor(Color(hex: "#7C4DFF"))

          Text("Reflect on Last Week")
            .font(.title2.bold())
            .foregroundColor(.white)

          Text("What worked? What didn't?")
            .font(.subheadline)
            .foregroundColor(.white.opacity(0.6))
        }

        VStack(alignment: .leading, spacing: 8) {
          Text("🏆 Wins")
            .font(.subheadline.bold())
            .foregroundColor(.green)

          TextEditor(text: $lastWeekWins)
            .frame(minHeight: 100)
            .scrollContentBackground(.hidden)
            .background(Color.white.opacity(0.1))
            .cornerRadius(12)
            .foregroundColor(.white)
        }

        VStack(alignment: .leading, spacing: 8) {
          Text("🚧 Challenges")
            .font(.subheadline.bold())
            .foregroundColor(.orange)

          TextEditor(text: $lastWeekChallenges)
            .frame(minHeight: 100)
            .scrollContentBackground(.hidden)
            .background(Color.white.opacity(0.1))
            .cornerRadius(12)
            .foregroundColor(.white)
        }

        // Quick prompts
        VStack(alignment: .leading, spacing: 8) {
          Text("💡 Prompts")
            .font(.caption.bold())
            .foregroundColor(.white.opacity(0.5))

          VStack(alignment: .leading, spacing: 4) {
            Text("• Did I protect my focus time?")
            Text("• What distracted me most?")
            Text("• What gave me energy?")
            Text("• What drained me?")
          }
          .font(.caption)
          .foregroundColor(.white.opacity(0.5))
        }
        .padding()
        .background(Color.white.opacity(0.05))
        .cornerRadius(12)
      }
      .padding()
    }
  }

  // MARK: - Step 2: Priorities

  private var step2Priorities: some View {
    ScrollView {
      VStack(alignment: .leading, spacing: 24) {
        VStack(alignment: .leading, spacing: 8) {
          Image(systemName: "target")
            .font(.title)
            .foregroundColor(Color(hex: "#7C4DFF"))

          Text("Top 3 Priorities")
            .font(.title2.bold())
            .foregroundColor(.white)

          Text("What MUST happen this week?")
            .font(.subheadline)
            .foregroundColor(.white.opacity(0.6))
        }

        ForEach(0..<3, id: \.self) { index in
          HStack(spacing: 12) {
            ZStack {
              Circle()
                .fill(priorityColor(index))
                .frame(width: 36, height: 36)

              Text("\(index + 1)")
                .font(.headline.bold())
                .foregroundColor(.white)
            }

            TextField("Priority \(index + 1)", text: $topPriorities[index])
              .padding()
              .background(Color.white.opacity(0.1))
              .cornerRadius(12)
              .foregroundColor(.white)
          }
        }

        // Carry over from profile
        if let profile = orchestrator.userProfile, !profile.topPriorities.isEmpty {
          VStack(alignment: .leading, spacing: 8) {
            Text("Your ongoing priorities:")
              .font(.caption.bold())
              .foregroundColor(.white.opacity(0.5))

            ForEach(profile.topPriorities, id: \.self) { priority in
              Button {
                // Add to this week
                if let emptyIndex = topPriorities.firstIndex(where: { $0.isEmpty }) {
                  topPriorities[emptyIndex] = priority
                }
              } label: {
                HStack {
                  Text(priority)
                    .font(.caption)
                    .foregroundColor(.white.opacity(0.7))

                  Spacer()

                  Image(systemName: "plus.circle")
                    .foregroundColor(Color(hex: "#7C4DFF"))
                }
              }
            }
          }
          .padding()
          .background(Color.white.opacity(0.05))
          .cornerRadius(12)
        }
      }
      .padding()
    }
  }

  private func priorityColor(_ index: Int) -> Color {
    switch index {
    case 0: return .red
    case 1: return .orange
    case 2: return .yellow
    default: return .gray
    }
  }

  // MARK: - Step 3: Time Blocks

  private var step3TimeBlocks: some View {
    ScrollView {
      VStack(alignment: .leading, spacing: 24) {
        VStack(alignment: .leading, spacing: 8) {
          Image(systemName: "calendar")
            .font(.title)
            .foregroundColor(Color(hex: "#7C4DFF"))

          Text("Schedule Focus Time")
            .font(.title2.bold())
            .foregroundColor(.white)

          Text("Block time for deep work")
            .font(.subheadline)
            .foregroundColor(.white.opacity(0.6))
        }

        // Suggested blocks based on circadian rhythm
        if let profile = orchestrator.userProfile {
          VStack(alignment: .leading, spacing: 12) {
            Text("SUGGESTED FOR \(profile.circadianType.rawValue.uppercased())")
              .font(.caption.bold())
              .foregroundColor(.white.opacity(0.5))
              .tracking(1)

            ForEach(suggestedBlocks(for: profile.circadianType)) { block in
              SuggestedBlockRow(block: block) {
                if !focusBlocks.contains(where: { $0.id == block.id }) {
                  focusBlocks.append(block)
                }
              }
            }
          }
        }

        // Current blocks
        if !focusBlocks.isEmpty {
          VStack(alignment: .leading, spacing: 12) {
            Text("YOUR FOCUS BLOCKS")
              .font(.caption.bold())
              .foregroundColor(.white.opacity(0.5))
              .tracking(1)

            ForEach(focusBlocks) { block in
              HStack {
                Circle()
                  .fill(block.type.color)
                  .frame(width: 10, height: 10)

                Text(block.title)
                  .font(.subheadline)
                  .foregroundColor(.white)

                Spacer()

                Text(block.timeRange)
                  .font(.caption)
                  .foregroundColor(.white.opacity(0.6))

                Button {
                  focusBlocks.removeAll { $0.id == block.id }
                } label: {
                  Image(systemName: "xmark.circle.fill")
                    .foregroundColor(.white.opacity(0.3))
                }
              }
              .padding()
              .background(Color.white.opacity(0.05))
              .cornerRadius(12)
            }
          }
        }

        // Tip
        HStack(spacing: 12) {
          Image(systemName: "lightbulb.fill")
            .foregroundColor(.yellow)

          Text("Protect these blocks like meetings. They're non-negotiable.")
            .font(.caption)
            .foregroundColor(.white.opacity(0.7))
        }
        .padding()
        .background(Color.yellow.opacity(0.1))
        .cornerRadius(12)
      }
      .padding()
    }
  }

  private func suggestedBlocks(for type: CircadianType) -> [FocusBlock] {
    let today = Date()

    switch type {
    case .earlyBird:
      return [
        FocusBlock(
          id: UUID(), title: "Deep Work AM", startHour: 6, endHour: 10, type: .deepWork, date: today
        ),
        FocusBlock(
          id: UUID(), title: "Admin & Email", startHour: 10, endHour: 11, type: .shallowWork,
          date: today),
        FocusBlock(
          id: UUID(), title: "Mindful Lunch", startHour: 12, endHour: 13, type: .break, date: today),
      ]
    case .nightOwl:
      return [
        FocusBlock(
          id: UUID(), title: "Warm Up", startHour: 10, endHour: 12, type: .shallowWork, date: today),
        FocusBlock(
          id: UUID(), title: "Deep Work PM", startHour: 14, endHour: 18, type: .deepWork,
          date: today),
        FocusBlock(
          id: UUID(), title: "Night Flow", startHour: 21, endHour: 24, type: .deepWork, date: today),
      ]
    case .balanced:
      return [
        FocusBlock(
          id: UUID(), title: "Morning Focus", startHour: 9, endHour: 12, type: .deepWork,
          date: today),
        FocusBlock(
          id: UUID(), title: "Lunch Break", startHour: 12, endHour: 13, type: .break, date: today),
        FocusBlock(
          id: UUID(), title: "Afternoon Focus", startHour: 14, endHour: 17, type: .deepWork,
          date: today),
      ]
    }
  }

  // MARK: - Step 4: Boundaries

  private var step4Boundaries: some View {
    ScrollView {
      VStack(alignment: .leading, spacing: 24) {
        VStack(alignment: .leading, spacing: 8) {
          Image(systemName: "shield.lefthalf.filled")
            .font(.title)
            .foregroundColor(Color(hex: "#7C4DFF"))

          Text("Set Boundaries")
            .font(.title2.bold())
            .foregroundColor(.white)

          Text("Protect your time and attention")
            .font(.subheadline)
            .foregroundColor(.white.opacity(0.6))
        }

        // Social Media Budget
        VStack(alignment: .leading, spacing: 12) {
          HStack {
            Image(systemName: "iphone")
              .foregroundColor(.pink)

            Text("Social Media Budget")
              .font(.headline)
              .foregroundColor(.white)

            Spacer()

            Text("\(socialMediaBudget) min/day")
              .font(.subheadline.bold())
              .foregroundColor(.pink)
          }

          Slider(
            value: Binding(
              get: { Double(socialMediaBudget) },
              set: { socialMediaBudget = Int($0) }
            ), in: 0...120, step: 5
          )
          .tint(.pink)

          HStack {
            Text("0 min")
            Spacer()
            Text("2 hrs")
          }
          .font(.caption)
          .foregroundColor(.white.opacity(0.5))
        }
        .padding()
        .background(Color.white.opacity(0.05))
        .cornerRadius(16)

        // Email Windows
        VStack(alignment: .leading, spacing: 12) {
          HStack {
            Image(systemName: "envelope.fill")
              .foregroundColor(.blue)

            Text("Email Windows")
              .font(.headline)
              .foregroundColor(.white)
          }

          Text("Only check email during these hours:")
            .font(.caption)
            .foregroundColor(.white.opacity(0.6))

          HStack(spacing: 8) {
            ForEach([9, 13, 17], id: \.self) { hour in
              EmailWindowButton(
                hour: hour,
                isSelected: emailWindows.contains(hour),
                action: {
                  if emailWindows.contains(hour) {
                    emailWindows.remove(hour)
                  } else {
                    emailWindows.insert(hour)
                  }
                }
              )
            }
          }
        }
        .padding()
        .background(Color.white.opacity(0.05))
        .cornerRadius(16)

        // Additional notes
        VStack(alignment: .leading, spacing: 8) {
          Text("Notes for the week")
            .font(.subheadline.bold())
            .foregroundColor(.white.opacity(0.7))

          TextEditor(text: $reflectionNotes)
            .frame(minHeight: 80)
            .scrollContentBackground(.hidden)
            .background(Color.white.opacity(0.1))
            .cornerRadius(12)
            .foregroundColor(.white)
        }

        // Summary
        VStack(alignment: .leading, spacing: 8) {
          Text("📋 WEEK SUMMARY")
            .font(.caption.bold())
            .foregroundColor(.white.opacity(0.5))
            .tracking(1)

          HStack {
            VStack(alignment: .leading, spacing: 4) {
              Text("Focus blocks: \(focusBlocks.count)")
              Text("Social: \(socialMediaBudget)m/day")
              Text("Email: \(emailWindows.count)x/day")
            }
            .font(.caption)
            .foregroundColor(.white.opacity(0.7))

            Spacer()

            VStack(alignment: .trailing, spacing: 4) {
              Text("Priorities: \(topPriorities.filter { !$0.isEmpty }.count)")
            }
            .font(.caption)
            .foregroundColor(.white.opacity(0.7))
          }
        }
        .padding()
        .background(Color(hex: "#7C4DFF").opacity(0.1))
        .cornerRadius(12)
      }
      .padding()
    }
  }

  // MARK: - Navigation

  private var navigationButtons: some View {
    HStack(spacing: 16) {
      if currentStep > 0 {
        Button {
          withAnimation {
            currentStep -= 1
          }
        } label: {
          Text("Back")
            .fontWeight(.medium)
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.white.opacity(0.1))
            .cornerRadius(12)
        }
      }

      Button {
        if currentStep < totalSteps - 1 {
          withAnimation {
            currentStep += 1
          }
        } else {
          savePlan()
        }
      } label: {
        Text(currentStep < totalSteps - 1 ? "Continue" : "Save Plan")
          .fontWeight(.semibold)
          .foregroundColor(.black)
          .frame(maxWidth: .infinity)
          .padding()
          .background(
            LinearGradient(
              colors: [Color(hex: "#7C4DFF"), Color(hex: "#E040FB")],
              startPoint: .leading,
              endPoint: .trailing
            )
          )
          .cornerRadius(12)
      }
    }
    .padding()
  }

  // MARK: - Actions

  private func loadCurrentPlan() {
    if let plan = orchestrator.weeklyPlan, plan.isCurrentWeek {
      topPriorities =
        plan.topThreePriorities
        + Array(repeating: "", count: max(0, 3 - plan.topThreePriorities.count))
      socialMediaBudget = plan.socialMediaBudget
      emailWindows = Set(plan.emailWindows)
      focusBlocks = plan.focusBlocks
      reflectionNotes = plan.reflectionNotes ?? ""
    }
  }

  private func savePlan() {
    let plan = WeeklyFlowPlan(
      id: UUID(),
      weekStarting: Calendar.current.date(
        from: Calendar.current.dateComponents([.yearForWeekOfYear, .weekOfYear], from: Date()))!,
      topThreePriorities: topPriorities.filter { !$0.isEmpty },
      focusBlocks: focusBlocks,
      socialMediaBudget: socialMediaBudget,
      emailWindows: Array(emailWindows).sorted(),
      reflectionNotes: reflectionNotes.isEmpty ? nil : reflectionNotes,
      createdAt: Date()
    )

    orchestrator.createWeeklyPlan(plan)
    dismiss()
  }
}

// MARK: - Supporting Views

struct SuggestedBlockRow: View {
  let block: FocusBlock
  let onAdd: () -> Void

  var body: some View {
    HStack {
      Circle()
        .fill(block.type.color)
        .frame(width: 10, height: 10)

      Text(block.title)
        .font(.subheadline)
        .foregroundColor(.white)

      Spacer()

      Text(block.timeRange)
        .font(.caption)
        .foregroundColor(.white.opacity(0.6))

      Button(action: onAdd) {
        Image(systemName: "plus.circle.fill")
          .foregroundColor(Color(hex: "#7C4DFF"))
      }
    }
    .padding()
    .background(Color.white.opacity(0.05))
    .cornerRadius(12)
  }
}

struct EmailWindowButton: View {
  let hour: Int
  let isSelected: Bool
  let action: () -> Void

  private var timeLabel: String {
    let h = hour % 12 == 0 ? 12 : hour % 12
    let ampm = hour < 12 ? "AM" : "PM"
    return "\(h) \(ampm)"
  }

  var body: some View {
    Button(action: action) {
      Text(timeLabel)
        .font(.subheadline.bold())
        .foregroundColor(isSelected ? .white : .white.opacity(0.5))
        .padding(.horizontal, 16)
        .padding(.vertical, 10)
        .background(isSelected ? Color.blue : Color.white.opacity(0.1))
        .cornerRadius(20)
    }
  }
}

#Preview {
  WeeklyPlanningView()
}
