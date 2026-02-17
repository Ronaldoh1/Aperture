// MasterLiesCourseView.swift
// The Master Lies Course - Full Interactive View

import SwiftUI

struct MasterLiesCourseView: View {
  let course = MasterLiesCourse.shared
  @State private var completedLies: Set<String> = []
  @State private var expandedModules: Set<String> = []
  @State private var selectedLie: ExposedLie?
  @Environment(\.dismiss) private var dismiss

  /// Combine all modules from all parts
  var allModules: [LiesModule] {
    course.modules + MasterLiesCourse.additionalModules + MasterLiesCourse.moreModules
      + MasterLiesCourse.darkestSecrets
  }

  var totalLies: Int {
    allModules.reduce(0) { $0 + $1.lies.count }
  }

  var body: some View {
    ZStack {
      // Sacred geometry - Third Eye (seeing truth)
      SacredGeometryBackground(style: .metatronsCube, opacity: 0.1)

      // Warning overlay
      warningPattern

      ScrollView(showsIndicators: false) {
        VStack(spacing: 24) {
          // Header
          courseHeader

          // Awakening meter
          awakeningMeter

          // Categories
          categoriesSection

          // Modules
          modulesSection

          Spacer(minLength: 100)
        }
        .padding(.horizontal, 20)
        .padding(.top, 60)
      }

      // Custom nav bar
      VStack {
        customNavBar
        Spacer()
      }
    }
    .navigationBarHidden(true)
    .sheet(item: $selectedLie) { lie in
      LieDetailView(
        lie: lie,
        onComplete: {
          completedLies.insert(lie.id)
          HapticManager.shared.lessonCompleted()
        })
    }
    .onAppear {
      loadProgress()
    }
  }

  // MARK: - Warning Pattern Overlay

  private var warningPattern: some View {
    GeometryReader { geo in
      ForEach(0..<8, id: \.self) { i in
        Image(systemName: "exclamationmark.triangle.fill")
          .font(.system(size: 20))
          .foregroundColor(Color.red.opacity(0.05))
          .position(
            x: CGFloat((i * 97 + 30) % Int(geo.size.width)),
            y: CGFloat((i * 127 + 50) % Int(geo.size.height))
          )
      }
    }
  }

  // MARK: - Custom Nav Bar

  private var customNavBar: some View {
    HStack {
      Button(action: { dismiss() }) {
        Image(systemName: "chevron.left")
          .font(.system(size: 18, weight: .semibold))
          .foregroundColor(.white)
          .frame(width: 44, height: 44)
          .background(Color.white.opacity(0.1))
          .clipShape(Circle())
      }

      Spacer()

      // Lies exposed counter
      HStack(spacing: 4) {
        Image(systemName: "eye.fill")
          .font(.system(size: 12))
        Text("\(completedLies.count)/\(totalLies)")
      }
      .font(.system(size: 14, weight: .bold, design: .rounded))
      .foregroundColor(course.color)
      .padding(.horizontal, 12)
      .padding(.vertical, 6)
      .background(course.color.opacity(0.15))
      .clipShape(Capsule())
    }
    .padding(.horizontal, 20)
    .padding(.top, 10)
  }

  // MARK: - Header

  private var courseHeader: some View {
    VStack(spacing: 16) {
      // Warning icon
      ZStack {
        // Pulsing glow
        Circle()
          .fill(
            RadialGradient(
              colors: [course.color.opacity(0.4), Color.clear],
              center: .center,
              startRadius: 20,
              endRadius: 60
            )
          )
          .frame(width: 120, height: 120)

        Image(systemName: course.icon)
          .font(.system(size: 50, weight: .semibold))
          .foregroundColor(course.color)
      }

      VStack(spacing: 8) {
        Text(course.title.uppercased())
          .font(.system(size: 24, weight: .black, design: .rounded))
          .foregroundColor(.white)
          .tracking(2)

        Text(course.subtitle)
          .font(.system(size: 14, weight: .medium, design: .rounded))
          .foregroundColor(Palette.text.secondary)

        Text("⚠️ WARNING: This content will change how you see the world")
          .font(.system(size: 11, weight: .bold, design: .rounded))
          .foregroundColor(course.color)
          .padding(.top, 4)
      }
    }
  }

  // MARK: - Awakening Meter

  private var awakeningMeter: some View {
    VStack(spacing: 12) {
      HStack {
        Text("AWAKENING LEVEL")
          .font(.system(size: 12, weight: .bold, design: .rounded))
          .foregroundColor(Palette.text.muted)
          .tracking(2)
        Spacer()
        Text(awakeningLevel)
          .font(.system(size: 14, weight: .bold, design: .rounded))
          .foregroundColor(course.color)
      }

      // Progress bar
      GeometryReader { geo in
        ZStack(alignment: .leading) {
          RoundedRectangle(cornerRadius: 4)
            .fill(Color.white.opacity(0.1))
            .frame(height: 8)

          RoundedRectangle(cornerRadius: 4)
            .fill(
              LinearGradient(
                colors: [course.color, Color.orange, Color.yellow],
                startPoint: .leading,
                endPoint: .trailing
              )
            )
            .frame(width: geo.size.width * progressPercentage, height: 8)
        }
      }
      .frame(height: 8)

      // Stages
      HStack {
        StageLabel(name: "Asleep", isActive: progressPercentage < 0.25)
        Spacer()
        StageLabel(
          name: "Questioning", isActive: progressPercentage >= 0.25 && progressPercentage < 0.5)
        Spacer()
        StageLabel(
          name: "Awakening", isActive: progressPercentage >= 0.5 && progressPercentage < 0.75)
        Spacer()
        StageLabel(name: "Awake", isActive: progressPercentage >= 0.75)
      }
    }
    .padding(16)
    .background(
      RoundedRectangle(cornerRadius: 16)
        .fill(Color.white.opacity(0.05))
        .overlay(
          RoundedRectangle(cornerRadius: 16)
            .stroke(course.color.opacity(0.2), lineWidth: 1)
        )
    )
  }

  // MARK: - Categories Section

  private var categoriesSection: some View {
    VStack(alignment: .leading, spacing: 12) {
      Text("CATEGORIES")
        .font(.system(size: 12, weight: .bold, design: .rounded))
        .foregroundColor(Palette.text.muted)
        .tracking(2)

      ScrollView(.horizontal, showsIndicators: false) {
        HStack(spacing: 12) {
          LiesCategoryChip(name: "Education", icon: "graduationcap.fill", color: Color.blue)
          LiesCategoryChip(name: "Pharma", icon: "pills.fill", color: Color.green)
          LiesCategoryChip(name: "History", icon: "book.fill", color: Color.purple)
          LiesCategoryChip(name: "Finance", icon: "dollarsign.circle.fill", color: Color.yellow)
          LiesCategoryChip(name: "Media", icon: "tv.fill", color: Color.orange)
          LiesCategoryChip(name: "Government", icon: "building.columns.fill", color: Color.red)
          LiesCategoryChip(name: "Science", icon: "atom", color: Color.cyan)
        }
      }
    }
  }

  // MARK: - Modules Section

  private var modulesSection: some View {
    VStack(spacing: 16) {
      ForEach(allModules) { module in
        LiesModuleCard(
          module: module,
          isExpanded: expandedModules.contains(module.id),
          completedLies: completedLies,
          onToggle: {
            withAnimation(.spring()) {
              if expandedModules.contains(module.id) {
                expandedModules.remove(module.id)
              } else {
                expandedModules.insert(module.id)
              }
            }
          },
          onSelectLie: { lie in
            selectedLie = lie
          }
        )
      }
    }
  }

  // MARK: - Computed Properties

  private var progressPercentage: CGFloat {
    guard totalLies > 0 else { return 0 }
    return CGFloat(completedLies.count) / CGFloat(totalLies)
  }

  private var awakeningLevel: String {
    switch progressPercentage {
    case 0..<0.25: return "NPC Mode"
    case 0.25..<0.5: return "Questioning"
    case 0.5..<0.75: return "Eyes Opening"
    case 0.75..<1.0: return "Nearly Awake"
    default: return "FULLY AWAKE"
    }
  }

  // MARK: - Progress Persistence

  private func loadProgress() {
    if let data = UserDefaults.standard.data(forKey: "masterlies_progress"),
      let progress = try? JSONDecoder().decode(MasterLiesProgress.self, from: data)
    {
      completedLies = Set(progress.completedLies)
    }
  }
}

// MARK: - Supporting Views

struct StageLabel: View {
  let name: String
  let isActive: Bool

  var body: some View {
    Text(name)
      .font(.system(size: 9, weight: isActive ? .bold : .medium, design: .rounded))
      .foregroundColor(isActive ? .white : Palette.text.muted)
  }
}

struct LiesCategoryChip: View {
  let name: String
  let icon: String
  let color: Color

  var body: some View {
    HStack(spacing: 6) {
      Image(systemName: icon)
        .font(.system(size: 12))
      Text(name)
        .font(.system(size: 12, weight: .bold, design: .rounded))
    }
    .foregroundColor(color)
    .padding(.horizontal, 12)
    .padding(.vertical, 8)
    .background(color.opacity(0.15))
    .clipShape(Capsule())
  }
}

struct LiesModuleCard: View {
  let module: LiesModule
  let isExpanded: Bool
  let completedLies: Set<String>
  let onToggle: () -> Void
  let onSelectLie: (ExposedLie) -> Void

  var completedCount: Int {
    module.lies.filter { completedLies.contains($0.id) }.count
  }

  var body: some View {
    VStack(spacing: 0) {
      // Module header
      Button(action: onToggle) {
        HStack(spacing: 16) {
          // Icon
          Image(systemName: module.icon)
            .font(.system(size: 20, weight: .semibold))
            .foregroundColor(Color.red)
            .frame(width: 40, height: 40)
            .background(Color.red.opacity(0.15))
            .clipShape(Circle())

          VStack(alignment: .leading, spacing: 2) {
            Text(module.title)
              .font(.system(size: 16, weight: .bold, design: .rounded))
              .foregroundColor(.white)

            Text("\(completedCount)/\(module.lies.count) lies exposed")
              .font(.system(size: 12, weight: .medium, design: .rounded))
              .foregroundColor(Palette.text.secondary)
          }

          Spacer()

          Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
            .font(.system(size: 14, weight: .semibold))
            .foregroundColor(Palette.text.muted)
        }
        .padding(16)
      }

      // Lies (expanded)
      if isExpanded {
        VStack(spacing: 8) {
          ForEach(module.lies) { lie in
            LieRow(
              lie: lie,
              isCompleted: completedLies.contains(lie.id),
              onTap: { onSelectLie(lie) }
            )
          }
        }
        .padding(.horizontal, 16)
        .padding(.bottom, 16)
      }
    }
    .background(
      RoundedRectangle(cornerRadius: 16)
        .fill(Color.white.opacity(0.05))
        .overlay(
          RoundedRectangle(cornerRadius: 16)
            .stroke(Color.red.opacity(isExpanded ? 0.3 : 0.1), lineWidth: 1)
        )
    )
  }
}

struct LieRow: View {
  let lie: ExposedLie
  let isCompleted: Bool
  let onTap: () -> Void

  var body: some View {
    Button(action: {
      HapticManager.shared.light()
      onTap()
    }) {
      HStack(spacing: 12) {
        // Status
        ZStack {
          Circle()
            .stroke(isCompleted ? Color.green : Color.red.opacity(0.5), lineWidth: 2)
            .frame(width: 24, height: 24)

          if isCompleted {
            Image(systemName: "eye.fill")
              .font(.system(size: 10))
              .foregroundColor(.green)
          } else {
            Image(systemName: "eye.slash")
              .font(.system(size: 10))
              .foregroundColor(.red.opacity(0.5))
          }
        }

        VStack(alignment: .leading, spacing: 2) {
          Text(lie.lieTitle)
            .font(.system(size: 13, weight: .semibold, design: .rounded))
            .foregroundColor(isCompleted ? .green : .white)
            .lineLimit(1)

          Text(lie.truth)
            .font(.system(size: 11, weight: .medium, design: .rounded))
            .foregroundColor(Palette.text.muted)
            .lineLimit(1)
        }

        Spacer()

        Image(systemName: "chevron.right")
          .font(.system(size: 12, weight: .semibold))
          .foregroundColor(Palette.text.muted)
      }
      .padding(12)
      .background(
        RoundedRectangle(cornerRadius: 12)
          .fill(Color.white.opacity(0.03))
      )
    }
    .buttonStyle(ScaleButtonStyle())
  }
}

// MARK: - Lie Detail View

struct LieDetailView: View {
  let lie: ExposedLie
  let onComplete: () -> Void

  @Environment(\.dismiss) private var dismiss

  var body: some View {
    ZStack {
      // Background
      SacredGeometryBackground(style: .metatronsCube, opacity: 0.06)

      ScrollView(showsIndicators: false) {
        VStack(alignment: .leading, spacing: 24) {
          // The Lie
          VStack(alignment: .leading, spacing: 8) {
            Text("THE LIE")
              .font(.system(size: 12, weight: .bold, design: .rounded))
              .foregroundColor(.red)
              .tracking(2)

            Text(lie.lieTitle)
              .font(.system(size: 20, weight: .black, design: .rounded))
              .foregroundColor(.red)
          }
          .padding(16)
          .frame(maxWidth: .infinity, alignment: .leading)
          .background(
            RoundedRectangle(cornerRadius: 16)
              .fill(Color.red.opacity(0.1))
              .overlay(
                RoundedRectangle(cornerRadius: 16)
                  .stroke(Color.red.opacity(0.3), lineWidth: 1)
              )
          )

          // The Truth
          VStack(alignment: .leading, spacing: 8) {
            Text("THE TRUTH")
              .font(.system(size: 12, weight: .bold, design: .rounded))
              .foregroundColor(.green)
              .tracking(2)

            Text(lie.truth)
              .font(.system(size: 18, weight: .bold, design: .rounded))
              .foregroundColor(.green)
          }
          .padding(16)
          .frame(maxWidth: .infinity, alignment: .leading)
          .background(
            RoundedRectangle(cornerRadius: 16)
              .fill(Color.green.opacity(0.1))
              .overlay(
                RoundedRectangle(cornerRadius: 16)
                  .stroke(Color.green.opacity(0.3), lineWidth: 1)
              )
          )

          // Content
          Text(lie.content)
            .font(.system(size: 16, weight: .regular, design: .rounded))
            .foregroundColor(Palette.text.primary)
            .lineSpacing(6)

          // Evidence
          if !lie.evidence.isEmpty {
            VStack(alignment: .leading, spacing: 12) {
              Text("📚 EVIDENCE")
                .font(.system(size: 12, weight: .bold, design: .rounded))
                .foregroundColor(Palette.accent.gold)
                .tracking(2)

              ForEach(lie.evidence, id: \.self) { item in
                HStack(alignment: .top, spacing: 12) {
                  Image(systemName: "checkmark.seal.fill")
                    .font(.system(size: 12))
                    .foregroundColor(Palette.accent.gold)
                    .padding(.top, 2)

                  Text(item)
                    .font(.system(size: 14, weight: .medium, design: .rounded))
                    .foregroundColor(Palette.text.secondary)
                }
              }
            }
            .padding(16)
            .background(
              RoundedRectangle(cornerRadius: 16)
                .fill(Palette.accent.gold.opacity(0.1))
            )
          }

          // Who Benefits
          VStack(alignment: .leading, spacing: 8) {
            Text("🎯 WHO BENEFITS")
              .font(.system(size: 12, weight: .bold, design: .rounded))
              .foregroundColor(.cyan)
              .tracking(2)

            Text(lie.whobenefits)
              .font(.system(size: 14, weight: .medium, design: .rounded))
              .foregroundColor(Palette.text.secondary)
          }
          .padding(16)
          .background(
            RoundedRectangle(cornerRadius: 16)
              .fill(Color.cyan.opacity(0.1))
          )

          // Complete Button
          Button(action: {
            onComplete()
            dismiss()
          }) {
            HStack {
              Image(systemName: "eye.fill")
              Text("Eyes Opened")
            }
            .font(.system(size: 16, weight: .bold, design: .rounded))
            .foregroundColor(.black)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 16)
            .background(
              LinearGradient(
                colors: [Color.green, Color.cyan],
                startPoint: .leading,
                endPoint: .trailing
              )
            )
            .clipShape(RoundedRectangle(cornerRadius: 14))
          }

          Spacer(minLength: 50)
        }
        .padding(.horizontal, 20)
        .padding(.top, 60)
      }

      // Close button
      VStack {
        HStack {
          Spacer()
          Button(action: { dismiss() }) {
            Image(systemName: "xmark")
              .font(.system(size: 16, weight: .semibold))
              .foregroundColor(.white)
              .frame(width: 36, height: 36)
              .background(Color.white.opacity(0.1))
              .clipShape(Circle())
          }
        }
        .padding(.horizontal, 20)
        .padding(.top, 20)
        Spacer()
      }
    }
  }
}

// MARK: - Preview

#Preview {
  MasterLiesCourseView()
}
