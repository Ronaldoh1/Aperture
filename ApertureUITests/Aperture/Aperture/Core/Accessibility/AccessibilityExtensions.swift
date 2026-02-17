// AccessibilityExtensions.swift
// App-wide accessibility patterns for VoiceOver, Dynamic Type, and Reduce Motion
// Making Aperture accessible to ALL seekers

import SwiftUI

// MARK: - Card Accessibility

extension View {
  /// Make any tappable card fully accessible
  func accessibleCard(
    title: String,
    description: String? = nil,
    hint: String = "Double tap to open"
  ) -> some View {
    accessibilityElement(children: .combine)
      .accessibilityLabel(description != nil ? "\(title). \(description!)" : title)
      .accessibilityHint(hint)
      .accessibilityAddTraits(.isButton)
  }

  /// Make navigation cards accessible
  func accessibleNavCard(
    title: String,
    subtitle: String? = nil,
    destination: String
  ) -> some View {
    accessibilityElement(children: .combine)
      .accessibilityLabel(subtitle != nil ? "\(title). \(subtitle!)" : title)
      .accessibilityHint("Double tap to navigate to \(destination)")
      .accessibilityAddTraits(.isButton)
  }

  /// Make course cards accessible with progress
  func accessibleCourseCard(
    title: String,
    category: String,
    difficulty: String,
    modules: Int,
    hours: Double,
    progress: Double? = nil
  ) -> some View {
    var label = "\(title). \(category) course. \(difficulty) difficulty."
    if let progress = progress {
      label += " \(Int(progress * 100)) percent complete."
    }

    var hint = "\(modules) modules, about \(String(format: "%.1f", hours)) hours."
    hint += " Double tap to start course."

    return accessibilityElement(children: .combine)
      .accessibilityLabel(label)
      .accessibilityHint(hint)
      .accessibilityAddTraits(.isButton)
  }
}

// MARK: - Interactive Element Accessibility

extension View {
  /// Standard accessible button
  func accessibleTapTarget(
    _ label: String,
    hint: String? = nil
  ) -> some View {
    accessibilityLabel(label)
      .accessibilityHint(hint ?? "Double tap to activate")
      .accessibilityAddTraits(.isButton)
  }

  /// Accessible toggle switch
  func accessibleToggle(
    _ label: String,
    isOn: Bool,
    hint: String? = nil
  ) -> some View {
    accessibilityLabel(label)
      .accessibilityValue(isOn ? "On" : "Off")
      .accessibilityHint(hint ?? "Double tap to toggle")
      .accessibilityAddTraits(.isButton)
  }

  /// Accessible slider
  func accessibleSlider(
    _ label: String,
    value: Double,
    range: ClosedRange<Double>,
    unit: String = ""
  ) -> some View {
    let percentage = (value - range.lowerBound) / (range.upperBound - range.lowerBound) * 100
    return accessibilityLabel(label)
      .accessibilityValue("\(Int(value))\(unit), \(Int(percentage)) percent")
      .accessibilityHint("Swipe up or down to adjust")
      .accessibilityAdjustableAction { _ in
        // This is a placeholder - actual adjustment would need @Binding
      }
  }
}

// MARK: - Content Accessibility

extension View {
  /// Make section headers accessible
  func accessibleSectionHeader(_ title: String) -> some View {
    accessibilityLabel(title)
      .accessibilityAddTraits(.isHeader)
  }

  // Note: accessibilityDecorative() and accessibleImage() are defined in AccessibilityHelpers.swift

  /// Loading state announcement
  func accessibleLoading(_ isLoading: Bool, message: String = "Loading") -> some View {
    onChange(of: isLoading) { _, loading in
      if loading {
        AccessibilityAnnouncer.announce(message)
      }
    }
  }
}

// MARK: - Screen Reader Announcements

extension View {
  /// Announce when view appears
  func announceOnAppear(_ message: String) -> some View {
    onAppear {
      AccessibilityAnnouncer.announceScreenChange(message)
    }
  }

  /// Announce value changes
  func announceChanges<V: Equatable>(
    of value: V,
    message: @escaping (V) -> String
  ) -> some View {
    onChange(of: value) { _, newValue in
      AccessibilityAnnouncer.announce(message(newValue))
    }
  }
}

// MARK: - Progress Accessibility

extension View {
  /// Make progress indicators accessible
  func accessibleProgress(
    label: String,
    current: Double,
    total: Double
  ) -> some View {
    let percentage = Int((current / total) * 100)
    return accessibilityLabel(label)
      .accessibilityValue("\(percentage) percent complete")
  }

  /// Make streak counters accessible
  func accessibleStreak(
    practice: String,
    count: Int,
    isActive: Bool
  ) -> some View {
    let status = isActive ? "Active streak" : "No current streak"
    return accessibilityLabel("\(practice) streak")
      .accessibilityValue("\(count) days. \(status)")
  }
}

// MARK: - List Accessibility

extension View {
  /// Make list items accessible with position
  func accessibleListItem(
    _ label: String,
    position: Int,
    total: Int
  ) -> some View {
    accessibilityLabel("\(label), item \(position) of \(total)")
      .accessibilityHint("Double tap to select")
  }
}

// MARK: - Educational Content Accessibility

extension View {
  /// Make lesson content accessible
  func accessibleLesson(
    title: String,
    moduleNumber: Int,
    lessonNumber: Int,
    isComplete: Bool
  ) -> some View {
    let status = isComplete ? "Completed" : "Not completed"
    return accessibilityElement(children: .combine)
      .accessibilityLabel("Module \(moduleNumber), Lesson \(lessonNumber): \(title). \(status)")
      .accessibilityHint("Double tap to read lesson")
  }

  /// Make insight/key takeaway accessible
  func accessibleInsight(_ text: String) -> some View {
    accessibilityLabel("Key insight: \(text)")
      .accessibilityAddTraits(.isStaticText)
  }
}

// MARK: - Form Accessibility

extension View {
  /// Make text field accessible
  func accessibleTextField(
    label: String,
    placeholder: String,
    hasError: Bool = false,
    errorMessage: String? = nil
  ) -> some View {
    var fullLabel = label
    if hasError, let error = errorMessage {
      fullLabel += ". Error: \(error)"
    }

    return accessibilityLabel(fullLabel)
      .accessibilityHint("Double tap to edit. \(placeholder)")
  }
}

// MARK: - Animation Accessibility

extension View {
  /// Apply animation only if reduce motion is not enabled
  func motionSafeAnimation<V: Equatable>(
    _ animation: Animation? = .default,
    value: V
  ) -> some View {
    modifier(MotionSafeAnimationModifier(animation: animation, value: value))
  }
}

private struct MotionSafeAnimationModifier<V: Equatable>: ViewModifier {
  @Environment(\.accessibilityReduceMotion) var reduceMotion
  let animation: Animation?
  let value: V

  func body(content: Content) -> some View {
    if reduceMotion {
      content
    } else {
      content.animation(animation, value: value)
    }
  }
}

// MARK: - Dynamic Type Support

extension Font {
  /// Scalable font that respects Dynamic Type
  static func scaledSystem(
    size: CGFloat,
    weight: Font.Weight = .regular,
    design: Font.Design = .default
  ) -> Font {
    let scaledSize = UIFontMetrics.default.scaledValue(for: size)
    return .system(size: scaledSize, weight: weight, design: design)
  }
}

// MARK: - Aperture-Specific Accessibility

extension View {
  /// Make badge bubble accessible
  func accessibleBadgeBubble(
    isVisible _: Bool,
    badgeCount: Int
  ) -> some View {
    let label = "Sacred Geometry badges"
    let value = "\(badgeCount) badges earned"

    return accessibilityLabel(label)
      .accessibilityValue(value)
      .accessibilityHint("Tap to view your badge collection")
  }

  /// Make timeline era accessible
  func accessibleTimelineEra(
    title: String,
    year: String,
    isRevealed: Bool
  ) -> some View {
    let status = isRevealed ? "Revealed" : "Hidden"
    return accessibilityLabel("\(title), \(year). \(status)")
      .accessibilityHint("Double tap to explore this era of hidden history")
  }

  /// Make cosmos entity accessible
  func accessibleCosmosEntity(
    name: String,
    type: String,
    description: String
  ) -> some View {
    accessibilityLabel("\(name), \(type)")
      .accessibilityValue(description)
      .accessibilityHint("Double tap to learn more")
  }
}

// MARK: - Comprehensive View Wrapper

/// Wraps any view with standard accessibility features
struct AccessibleView<Content: View>: View {
  let content: Content
  let label: String
  let hint: String?
  let traits: AccessibilityTraits

  init(
    label: String,
    hint: String? = nil,
    traits: AccessibilityTraits = [],
    @ViewBuilder content: () -> Content
  ) {
    self.content = content()
    self.label = label
    self.hint = hint
    self.traits = traits
  }

  var body: some View {
    content
      .accessibilityElement(children: .combine)
      .accessibilityLabel(label)
      .accessibilityHint(hint ?? "")
      .accessibilityAddTraits(traits)
  }
}

// MARK: - Quick Accessibility Check

#if DEBUG
  extension View {
    /// Debug overlay showing accessibility info
    func showAccessibilityInfo() -> some View {
      overlay(alignment: .topTrailing) {
        Image(systemName: "accessibility")
          .font(.system(size: 12))
          .foregroundColor(.blue)
          .padding(4)
          .background(Color.white.opacity(0.8))
          .cornerRadius(4)
      }
    }
  }
#endif
