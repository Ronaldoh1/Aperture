// AccessibilityHelpers.swift
// Making Aperture accessible to ALL users
// VoiceOver, Dynamic Type, Reduce Motion, High Contrast

import SwiftUI

// MARK: - Accessibility View Modifiers

extension View {
    
    /// Add comprehensive accessibility to any view
    func accessibleElement(
        label: String,
        hint: String? = nil,
        traits: AccessibilityTraits = [],
        value: String? = nil
    ) -> some View {
        self
            .accessibilityLabel(label)
            .accessibilityHint(hint ?? "")
            .accessibilityAddTraits(traits)
            .accessibilityValue(value ?? "")
    }
    
    /// Make a button accessible
    func accessibleButton(_ label: String, hint: String? = nil) -> some View {
        self
            .accessibilityLabel(label)
            .accessibilityHint(hint ?? "Double tap to activate")
            .accessibilityAddTraits(.isButton)
    }
    
    /// Make a header accessible
    func accessibleHeader(_ label: String) -> some View {
        self
            .accessibilityLabel(label)
            .accessibilityAddTraits(.isHeader)
    }
    
    /// Mark as image with description
    func accessibleImage(_ description: String) -> some View {
        self
            .accessibilityLabel(description)
            .accessibilityAddTraits(.isImage)
    }
    
    /// Hide decorative elements from VoiceOver
    func accessibilityDecorative() -> some View {
        self.accessibilityHidden(true)
    }
    
    /// Group children for VoiceOver
    func accessibleGroup(label: String) -> some View {
        self
            .accessibilityElement(children: .combine)
            .accessibilityLabel(label)
    }
    
    /// Announce changes to VoiceOver users
    func announceOnChange<V: Equatable>(_ value: V, announcement: @escaping (V) -> String) -> some View {
        self.onChange(of: value) { _, newValue in
            UIAccessibility.post(
                notification: .announcement,
                argument: announcement(newValue)
            )
        }
    }
}

// MARK: - Accessible Components

/// Progress indicator with VoiceOver support
struct AccessibleProgressView: View {
    let progress: Double
    let total: Double
    let label: String
    
    var percentage: Int {
        Int((progress / total) * 100)
    }
    
    var body: some View {
        ProgressView(value: progress, total: total)
            .accessibilityLabel("\(label)")
            .accessibilityValue("\(percentage) percent complete")
    }
}

/// Star rating with accessibility
struct AccessibleRatingView: View {
    let rating: Int
    let maxRating: Int
    let label: String
    
    var body: some View {
        HStack(spacing: 4) {
            ForEach(1...maxRating, id: \.self) { star in
                Image(systemName: star <= rating ? "star.fill" : "star")
                    .foregroundColor(star <= rating ? .yellow : .gray)
            }
        }
        .accessibilityElement(children: .ignore)
        .accessibilityLabel("\(label)")
        .accessibilityValue("\(rating) out of \(maxRating) stars")
    }
}

/// Toggle with proper accessibility
struct AccessibleToggle: View {
    @Binding var isOn: Bool
    let label: String
    let hint: String?
    
    var body: some View {
        Toggle(label, isOn: $isOn)
            .accessibilityLabel(label)
            .accessibilityValue(isOn ? "On" : "Off")
            .accessibilityHint(hint ?? "Double tap to toggle")
    }
}

// MARK: - Motion Sensitivity

struct MotionSensitiveView<Content: View>: View {
    @Environment(\.accessibilityReduceMotion) var reduceMotion
    let fullMotion: Content
    let reducedMotion: Content
    
    init(@ViewBuilder fullMotion: () -> Content, @ViewBuilder reducedMotion: () -> Content) {
        self.fullMotion = fullMotion()
        self.reducedMotion = reducedMotion()
    }
    
    var body: some View {
        if reduceMotion {
            reducedMotion
        } else {
            fullMotion
        }
    }
}

extension View {
    /// Conditionally apply animation based on user's motion preferences
    func motionSensitiveAnimation<V: Equatable>(_ animation: Animation?, value: V) -> some View {
        modifier(MotionSensitiveAnimationModifier(animation: animation, value: value))
    }
}

struct MotionSensitiveAnimationModifier<V: Equatable>: ViewModifier {
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

struct ScaledFont: ViewModifier {
    @Environment(\.sizeCategory) var sizeCategory
    let baseSize: CGFloat
    let weight: Font.Weight
    let design: Font.Design
    
    func body(content: Content) -> some View {
        content.font(.system(size: scaledSize, weight: weight, design: design))
    }
    
    var scaledSize: CGFloat {
        UIFontMetrics.default.scaledValue(for: baseSize)
    }
}

extension View {
    func scaledFont(size: CGFloat, weight: Font.Weight = .regular, design: Font.Design = .default) -> some View {
        modifier(ScaledFont(baseSize: size, weight: weight, design: design))
    }
}

// MARK: - High Contrast Support

extension View {
    /// Adjust colors for high contrast mode
    @ViewBuilder
    func highContrastAware(normalColor: Color, highContrastColor: Color) -> some View {
        self.modifier(HighContrastColorModifier(normalColor: normalColor, highContrastColor: highContrastColor))
    }
}

struct HighContrastColorModifier: ViewModifier {
    @Environment(\.accessibilityDifferentiateWithoutColor) var differentiateWithoutColor
    @Environment(\.colorSchemeContrast) var contrast
    
    let normalColor: Color
    let highContrastColor: Color
    
    func body(content: Content) -> some View {
        content.foregroundColor(contrast == .increased ? highContrastColor : normalColor)
    }
}

// MARK: - VoiceOver Focus Management

struct AccessibilityFocusModifier: ViewModifier {
    @AccessibilityFocusState var isFocused: Bool
    let shouldFocus: Bool
    
    func body(content: Content) -> some View {
        content
            .accessibilityFocused($isFocused)
            .onAppear {
                if shouldFocus {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        isFocused = true
                    }
                }
            }
    }
}

extension View {
    func accessibilityAutoFocus(_ shouldFocus: Bool = true) -> some View {
        modifier(AccessibilityFocusModifier(shouldFocus: shouldFocus))
    }
}

// MARK: - Accessibility Announcements

struct AccessibilityAnnouncer {
    
    static func announce(_ message: String, delay: TimeInterval = 0.1) {
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            UIAccessibility.post(notification: .announcement, argument: message)
        }
    }
    
    static func announceScreenChange(_ message: String) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            UIAccessibility.post(notification: .screenChanged, argument: message)
        }
    }
    
    static func announceLayoutChange(_ element: Any? = nil) {
        UIAccessibility.post(notification: .layoutChanged, argument: element)
    }
}

// MARK: - Accessibility Settings Observer

class AccessibilitySettings: ObservableObject {
    static let shared = AccessibilitySettings()
    
    @Published var isVoiceOverRunning: Bool
    @Published var isSwitchControlRunning: Bool
    @Published var prefersBoldText: Bool
    @Published var prefersReducedMotion: Bool
    @Published var prefersReducedTransparency: Bool
    
    private init() {
        self.isVoiceOverRunning = UIAccessibility.isVoiceOverRunning
        self.isSwitchControlRunning = UIAccessibility.isSwitchControlRunning
        self.prefersBoldText = UIAccessibility.isBoldTextEnabled
        self.prefersReducedMotion = UIAccessibility.isReduceMotionEnabled
        self.prefersReducedTransparency = UIAccessibility.isReduceTransparencyEnabled
        
        setupObservers()
    }
    
    private func setupObservers() {
        NotificationCenter.default.addObserver(
            forName: UIAccessibility.voiceOverStatusDidChangeNotification,
            object: nil,
            queue: .main
        ) { [weak self] _ in
            self?.isVoiceOverRunning = UIAccessibility.isVoiceOverRunning
        }
        
        NotificationCenter.default.addObserver(
            forName: UIAccessibility.reduceMotionStatusDidChangeNotification,
            object: nil,
            queue: .main
        ) { [weak self] _ in
            self?.prefersReducedMotion = UIAccessibility.isReduceMotionEnabled
        }
    }
}

// MARK: - Rotor Actions (Advanced VoiceOver)

extension View {
    func accessibilityRotorActions(_ actions: [(String, () -> Void)]) -> some View {
        self.accessibilityCustomContent(actions.map { name, action in
            AccessibilityCustomContentKey(name) { action() }
        })
    }
    
    private func accessibilityCustomContent(_ keys: [AccessibilityCustomContentKey]) -> some View {
        self // Placeholder - would need proper implementation
    }
}

private struct AccessibilityCustomContentKey {
    let label: String
    let action: () -> Void
    
    init(_ label: String, action: @escaping () -> Void) {
        self.label = label
        self.action = action
    }
}

// MARK: - Usage Examples in Comments
/*
 
 // 1. Make a card accessible:
 CourseCard(course: course)
     .accessibleButton(
         "\(course.title). \(course.completedLessons) of \(course.totalLessons) lessons completed",
         hint: "Double tap to open course"
     )
 
 // 2. Announce navigation:
 .onAppear {
     AccessibilityAnnouncer.announceScreenChange("Course hub. \(courses.count) courses available")
 }
 
 // 3. Motion-sensitive animations:
 DragonView()
     .motionSensitiveAnimation(.spring(), value: isAnimating)
 
 // 4. Progress with accessibility:
 AccessibleProgressView(
     progress: 5,
     total: 10,
     label: "Course progress"
 )
 
 // 5. Decorative elements:
 CosmicBackground()
     .accessibilityDecorative()
 
 // 6. Dynamic type support:
 Text("Welcome")
     .scaledFont(size: 24, weight: .bold, design: .rounded)
 
 */
