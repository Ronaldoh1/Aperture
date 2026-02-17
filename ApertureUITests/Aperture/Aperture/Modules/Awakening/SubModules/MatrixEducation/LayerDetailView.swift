// LayerDetailView.swift
// Deep dive into each Matrix layer

import SwiftUI

struct LayerDetailView: View {
  let layer: MatrixLayer
  @Binding var progress: MatrixEducationProgress
  @Environment(\.dismiss) var dismiss

  @State private var showIntegrationSheet = false

  var isCompleted: Bool {
    progress.layersCompleted.contains(layer.id)
  }

  var body: some View {
    ZStack {
      // Gradient background with layer color
      LinearGradient(
        colors: [Color.black, layer.color.opacity(0.15), Color.black],
        startPoint: .top,
        endPoint: .bottom
      )
      .ignoresSafeArea()

      VStack(spacing: 0) {
        // Header bar
        HStack {
          Button(action: { dismiss() }) {
            HStack(spacing: 6) {
              Image(systemName: "chevron.left").font(.system(size: 14, weight: .semibold))
              Text("Back").font(.system(size: 15, weight: .medium))
            }
            .foregroundColor(layer.color)
          }
          Spacer()
          Text("Layer \(layer.id)").font(.system(size: 14, weight: .bold, design: .rounded))
            .foregroundColor(Palette.text.muted)
          Spacer()
          if isCompleted {
            Image(systemName: "checkmark.circle.fill").font(.system(size: 24)).foregroundColor(
              Color.green)
          } else {
            Circle().fill(Color.clear).frame(width: 24, height: 24)
          }
        }
        .padding(.horizontal, 20).padding(.top, 16).padding(.bottom, 12)

        ScrollView {
          VStack(alignment: .leading, spacing: 28) {
            headerSection
            overviewSection
            mechanismsSection
            examplesSection
            recognitionSection
            questionsSection
            completeButton
            Spacer(minLength: 40)
          }
          .padding(.horizontal, 20)
        }
      }
    }
    .sheet(isPresented: $showIntegrationSheet) {
      LayerIntegrationSheet(layer: layer, isPresented: $showIntegrationSheet)
    }
  }

  // MARK: - Header

  private var headerSection: some View {
    VStack(spacing: 16) {
      ZStack {
        Circle()
          .fill(
            RadialGradient(
              colors: [layer.color.opacity(0.4), layer.color.opacity(0.05)], center: .center,
              startRadius: 0, endRadius: 45)
          )
          .frame(width: 90, height: 90)

        Image(systemName: layer.icon)
          .font(.system(size: 40, weight: .semibold))
          .foregroundColor(layer.color)
      }
      .shadow(color: layer.color.opacity(0.4), radius: 15)

      Text(layer.name)
        .font(.system(size: 24, weight: .bold, design: .rounded))
        .foregroundColor(Palette.text.primary)

      Text(layer.subtitle)
        .font(.system(size: 15, weight: .medium, design: .rounded))
        .foregroundColor(Palette.text.secondary)

      // Difficulty badge
      HStack(spacing: 6) {
        Circle().fill(layer.breakingDifficulty.color).frame(width: 8, height: 8)
        Text(layer.breakingDifficulty.rawValue)
          .font(.system(size: 12, weight: .semibold, design: .rounded))
      }
      .foregroundColor(layer.breakingDifficulty.color)
      .padding(.horizontal, 14).padding(.vertical, 7)
      .background(Capsule().fill(layer.breakingDifficulty.color.opacity(0.15)))
    }
    .frame(maxWidth: .infinity)
    .padding(.vertical, 8)
  }

  // MARK: - Overview

  private var overviewSection: some View {
    VStack(alignment: .leading, spacing: 12) {
      sectionHeader("OVERVIEW", icon: "doc.text.fill", color: layer.color)

      Text(layer.overview)
        .font(.system(size: 15, weight: .regular, design: .rounded))
        .foregroundColor(Palette.text.primary.opacity(0.9))
        .lineSpacing(6)
    }
    .padding(16)
    .background(sectionBackground)
  }

  // MARK: - Mechanisms

  private var mechanismsSection: some View {
    VStack(alignment: .leading, spacing: 16) {
      sectionHeader("HOW IT WORKS", icon: "gearshape.2.fill", color: Palette.primary.orange)

      ForEach(layer.mechanisms) { mechanism in
        VStack(alignment: .leading, spacing: 8) {
          Text(mechanism.name)
            .font(.system(size: 15, weight: .bold, design: .rounded))
            .foregroundColor(layer.color)

          Text(mechanism.description)
            .font(.system(size: 13, weight: .semibold, design: .rounded))
            .foregroundColor(Palette.text.primary)

          Text(mechanism.howItWorks)
            .font(.system(size: 13, weight: .regular, design: .rounded))
            .foregroundColor(Palette.text.secondary)
            .lineSpacing(4)
        }
        .padding(14)
        .background(
          RoundedRectangle(cornerRadius: 12, style: .continuous)
            .fill(layer.color.opacity(0.1))
        )
      }
    }
    .padding(16)
    .background(sectionBackground)
  }

  // MARK: - Real World Examples

  private var examplesSection: some View {
    VStack(alignment: .leading, spacing: 12) {
      sectionHeader("REAL WORLD EXAMPLES", icon: "globe", color: Palette.primary.cyan)

      ForEach(layer.realWorldExamples, id: \.self) { example in
        HStack(alignment: .top, spacing: 10) {
          Image(systemName: "arrow.right.circle.fill")
            .font(.system(size: 14))
            .foregroundColor(Palette.primary.cyan)
            .padding(.top, 2)

          Text(example)
            .font(.system(size: 14, weight: .medium, design: .rounded))
            .foregroundColor(Palette.text.primary)
            .lineSpacing(4)
        }
      }
    }
    .padding(16)
    .background(sectionBackground)
  }

  // MARK: - Recognition Signs

  private var recognitionSection: some View {
    VStack(alignment: .leading, spacing: 12) {
      sectionHeader("HOW TO RECOGNIZE IT", icon: "eye.fill", color: Palette.primary.violet)

      ForEach(layer.recognitionSigns, id: \.self) { sign in
        HStack(alignment: .top, spacing: 10) {
          Image(systemName: "exclamationmark.triangle.fill")
            .font(.system(size: 12))
            .foregroundColor(Palette.primary.violet)
            .padding(.top, 3)

          Text(sign)
            .font(.system(size: 14, weight: .medium, design: .rounded))
            .foregroundColor(Palette.text.primary)
        }
      }
    }
    .padding(16)
    .background(sectionBackground)
  }

  // MARK: - Questions

  private var questionsSection: some View {
    VStack(alignment: .leading, spacing: 12) {
      sectionHeader(
        "QUESTIONS TO ASK YOURSELF", icon: "questionmark.circle.fill", color: Palette.accent.gold)

      ForEach(layer.questionPrompts, id: \.self) { question in
        HStack(alignment: .top, spacing: 10) {
          Text("?")
            .font(.system(size: 16, weight: .bold, design: .rounded))
            .foregroundColor(Palette.accent.gold)
            .frame(width: 20)

          Text(question)
            .font(.system(size: 15, weight: .medium, design: .rounded))
            .foregroundColor(Palette.text.primary)
            .italic()
            .lineSpacing(4)
        }
        .padding(12)
        .background(
          RoundedRectangle(cornerRadius: 10, style: .continuous)
            .fill(Palette.accent.gold.opacity(0.1))
        )
      }
    }
    .padding(16)
    .background(sectionBackground)
  }

  // MARK: - Complete Button

  private var completeButton: some View {
    Button {
      markComplete()
    } label: {
      HStack(spacing: 10) {
        Image(systemName: isCompleted ? "checkmark.circle.fill" : "circle")
          .font(.system(size: 20))
        Text(isCompleted ? "Layer Completed ✓" : "Mark Layer as Understood")
          .font(.system(size: 16, weight: .bold, design: .rounded))
      }
      .foregroundColor(isCompleted ? Color.green : .black)
      .frame(maxWidth: .infinity)
      .padding(.vertical, 16)
      .background(
        RoundedRectangle(cornerRadius: 14, style: .continuous)
          .fill(isCompleted ? Color.green.opacity(0.2) : layer.color)
      )
      .overlay(
        RoundedRectangle(cornerRadius: 14, style: .continuous)
          .stroke(isCompleted ? Color.green : Color.clear, lineWidth: 2)
      )
    }
    .disabled(isCompleted)
  }

  // MARK: - Helpers

  private func sectionHeader(_ title: String, icon: String, color: Color) -> some View {
    HStack(spacing: 8) {
      Image(systemName: icon).font(.system(size: 14, weight: .semibold)).foregroundColor(color)
      Text(title).font(.system(size: 12, weight: .bold, design: .rounded)).tracking(1)
        .foregroundColor(color)
    }
  }

  private var sectionBackground: some View {
    RoundedRectangle(cornerRadius: 16, style: .continuous)
      .fill(Color.white.opacity(0.05))
      .overlay(
        RoundedRectangle(cornerRadius: 16, style: .continuous)
          .stroke(Color.white.opacity(0.1), lineWidth: 1)
      )
  }

  private func markComplete() {
    if !progress.layersCompleted.contains(layer.id) {
      progress.layersCompleted.append(layer.id)
      progress.lastAccessedLayer = layer.id
      saveProgress()
      showIntegrationSheet = true
    }
  }

  private func saveProgress() {
    if let data = try? JSONEncoder().encode(progress) {
      UserDefaults.standard.set(data, forKey: "matrix_education_progress")
    }
  }
}

// MARK: - Layer Integration Sheet

struct LayerIntegrationSheet: View {
  let layer: MatrixLayer
  @Binding var isPresented: Bool

  var body: some View {
    ZStack {
      Color.black.ignoresSafeArea()

      VStack(spacing: 0) {
        HStack {
          Spacer()
          Button(action: { isPresented = false }) {
            Image(systemName: "xmark.circle.fill").font(.system(size: 28)).foregroundColor(
              Palette.text.secondary)
          }
        }
        .padding(.horizontal, 20).padding(.top, 20)

        ScrollView {
          VStack(spacing: 24) {
            // Celebration
            VStack(spacing: 16) {
              Text("🎯").font(.system(size: 50))
              Text("Layer \(layer.id) Complete!")
                .font(.system(size: 24, weight: .bold, design: .rounded))
                .foregroundColor(Palette.text.primary)
              Text("You now understand: \(layer.name)")
                .font(.system(size: 15, weight: .medium, design: .rounded))
                .foregroundColor(layer.color)
            }
            .padding(.top, 20)

            // Integration options
            VStack(alignment: .leading, spacing: 16) {
              Text("APPLY WHAT YOU LEARNED")
                .font(.system(size: 12, weight: .bold, design: .rounded))
                .tracking(1)
                .foregroundColor(Palette.text.secondary)

              integrationOption(
                icon: "questionmark.circle.fill",
                title: "Add Questions to Question Bank",
                subtitle: "\(layer.questionPrompts.count) questions from this layer",
                color: Palette.accent.gold
              ) {
                addQuestionsToBank()
              }

              integrationOption(
                icon: "checklist",
                title: "Audit Related Beliefs",
                subtitle: "Domains: \(layer.relatedDomains.joined(separator: ", "))",
                color: Palette.primary.cyan
              ) {
                isPresented = false
                NotificationCenter.default.post(name: .navigateToRealityAudit, object: nil)
              }

              integrationOption(
                icon: "brain.head.profile",
                title: "Log a Cognitive Dissonance",
                subtitle: "Record when this layer's programming conflicted with reality",
                color: Palette.primary.violet
              ) {
                isPresented = false
                NotificationCenter.default.post(name: .navigateToDissonanceLog, object: nil)
              }
            }
            .padding(.horizontal, 20)

            Button("Continue Learning") {
              isPresented = false
            }
            .font(.system(size: 15, weight: .semibold, design: .rounded))
            .foregroundColor(Palette.text.muted)
            .padding(.top, 20)

            Spacer(minLength: 40)
          }
        }
      }
    }
  }

  private func integrationOption(
    icon: String, title: String, subtitle: String, color: Color, action: @escaping () -> Void
  ) -> some View {
    Button(action: action) {
      HStack(spacing: 14) {
        ZStack {
          Circle().fill(color.opacity(0.2)).frame(width: 44, height: 44)
          Image(systemName: icon).font(.system(size: 20)).foregroundColor(color)
        }

        VStack(alignment: .leading, spacing: 4) {
          Text(title)
            .font(.system(size: 15, weight: .bold, design: .rounded))
            .foregroundColor(Palette.text.primary)
          Text(subtitle)
            .font(.system(size: 12, weight: .medium, design: .rounded))
            .foregroundColor(Palette.text.secondary)
            .lineLimit(1)
        }

        Spacer()

        Image(systemName: "plus.circle.fill")
          .font(.system(size: 20))
          .foregroundColor(Color.green)
      }
      .padding(14)
      .background(
        RoundedRectangle(cornerRadius: 14, style: .continuous)
          .fill(Color.white.opacity(0.05))
          .overlay(
            RoundedRectangle(cornerRadius: 14, style: .continuous).stroke(
              color.opacity(0.3), lineWidth: 1))
      )
    }
    .buttonStyle(PlainButtonStyle())
  }

  private func addQuestionsToBank() {
    let storage = AwakeningStorage()
    var profile = storage.loadProfile()

    for questionText in layer.questionPrompts {
      let category = mapToQuestionCategory()
      let entry = QuestionEntry(
        question: questionText,
        category: category
      )
      profile.questionHistory.append(entry)
    }

    storage.saveProfile(profile)
    isPresented = false
  }

  private func mapToQuestionCategory() -> QuestionEntry.QuestionCategory {
    let domains = layer.relatedDomains
    if domains.contains("Authority") { return .authority }
    if domains.contains("Identity") { return .identity }
    if domains.contains("Spirituality") { return .reality }
    if domains.contains("Relationships") { return .relationships }
    if domains.contains("Career") || domains.contains("Money") { return .purpose }
    return .fundamentals
  }
}

// MARK: - Notification Names

extension Notification.Name {
  static let navigateToRealityAudit = Notification.Name("navigateToRealityAudit")
  static let navigateToDissonanceLog = Notification.Name("navigateToDissonanceLog")
}
