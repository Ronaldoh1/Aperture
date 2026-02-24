// EmeraldTabletsCourseView.swift
// Interactive course view for the Emerald Tablets
// Premium content with rich visualizations

import SwiftUI

struct EmeraldTabletsCourseView: View {
    @Environment(\.dismiss) var dismiss
    @State private var selectedModule: EmeraldModule?
    @State private var selectedLesson: EmeraldLesson?
    @State private var showPremiumGate = false
    
    private let course = EmeraldTabletsCourse.shared
    
    var body: some View {
        NavigationStack {
            ZStack {
                // Mystic background
                LinearGradient(
                    colors: [
                        Color.black,
                        course.color.opacity(0.15),
                        Color.black
                    ],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 24) {
                        
                        // Header
                        headerSection
                        
                        // Premium Badge
                        premiumBadge
                        
                        // Modules
                        modulesSection
                        
                        Spacer(minLength: 100)
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 20)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        HStack(spacing: 4) {
                            Image(systemName: "chevron.left")
                            Text("Back")
                        }
                        .foregroundColor(course.color)
                    }
                    .accessibilityLabel("Go back")
                }
            }
            .sheet(item: $selectedModule) { module in
                EmeraldModuleDetailView(module: module, color: course.color)
            }
        }
    }
    
    // MARK: - Header
    
    private var headerSection: some View {
        VStack(spacing: 16) {
            // Animated icon
            ZStack {
                Circle()
                    .fill(
                        RadialGradient(
                            colors: [course.color.opacity(0.4), course.color.opacity(0.1)],
                            center: .center,
                            startRadius: 0,
                            endRadius: 70
                        )
                    )
                    .frame(width: 140, height: 140)
                
                Image(systemName: course.icon)
                    .font(.system(size: 60, weight: .semibold))
                    .foregroundStyle(
                        LinearGradient(
                            colors: [course.color, course.color.opacity(0.7)],
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )
            }
            .accessibilityHidden(true)
            
            Text(course.title)
                .font(.system(size: 28, weight: .bold, design: .rounded))
                .foregroundColor(Palette.text.primary)
            
            Text(course.subtitle)
                .font(.system(size: 16, weight: .medium, design: .rounded))
                .foregroundColor(Palette.text.secondary)
                .multilineTextAlignment(.center)
            
            // Dragon quote
            HStack(alignment: .top, spacing: 10) {
                Text("🐉")
                    .font(.system(size: 16))
                
                Text("\"These tablets were hidden beneath the Sphinx for 12,000 years. Now they surface in the age of awakening—in your pocket, on your screen, in your consciousness.\"")
                    .font(.system(size: 13, weight: .medium, design: .rounded))
                    .italic()
                    .foregroundColor(course.color.opacity(0.9))
                    .lineSpacing(4)
            }
            .padding(14)
            .background(
                RoundedRectangle(cornerRadius: 12, style: .continuous)
                    .fill(course.color.opacity(0.1))
                    .overlay(
                        RoundedRectangle(cornerRadius: 12, style: .continuous)
                            .stroke(course.color.opacity(0.3), lineWidth: 1)
                    )
            )
        }
    }
    
    // MARK: - Premium Badge
    
    private var premiumBadge: some View {
        HStack(spacing: 8) {
            Image(systemName: "crown.fill")
                .font(.system(size: 14))
                .foregroundColor(Palette.accent.gold)
            
            Text("PREMIUM COURSE")
                .font(.system(size: 11, weight: .bold, design: .rounded))
                .tracking(1.5)
                .foregroundColor(Palette.accent.gold)
            
            Spacer()
            
            Text("5 Modules • 12 Lessons")
                .font(.system(size: 11, weight: .medium, design: .rounded))
                .foregroundColor(Palette.text.muted)
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 12)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Palette.accent.gold.opacity(0.1))
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Palette.accent.gold.opacity(0.3), lineWidth: 1)
                )
        )
        .accessibilityElement(children: .combine)
        .accessibilityLabel("Premium course with 5 modules and 12 lessons")
    }
    
    // MARK: - Modules Section
    
    private var modulesSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Text("COURSE MODULES")
                    .font(.system(size: 12, weight: .bold, design: .rounded))
                    .tracking(2)
                    .foregroundColor(Palette.text.muted)
                
                Spacer()
            }
            
            ForEach(course.modules) { module in
                EmeraldModuleCard(module: module, color: course.color) {
                    selectedModule = module
                }
            }
        }
    }
}

// MARK: - Module Card

struct EmeraldModuleCard: View {
    let module: EmeraldModule
    let color: Color
    let action: () -> Void
    
    var body: some View {
        Button(action: {
            HapticManager.shared.medium()
            action()
        }) {
            HStack(spacing: 14) {
                // Module number
                ZStack {
                    Circle()
                        .fill(color.opacity(0.2))
                        .frame(width: 50, height: 50)
                    
                    Text("\(module.number)")
                        .font(.system(size: 20, weight: .bold, design: .rounded))
                        .foregroundColor(color)
                }
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(module.title)
                        .font(.system(size: 16, weight: .bold, design: .rounded))
                        .foregroundColor(Palette.text.primary)
                    
                    Text(module.subtitle)
                        .font(.system(size: 13, weight: .medium))
                        .foregroundColor(Palette.text.secondary)
                    
                    Text("\(module.lessons.count) lessons")
                        .font(.system(size: 11, weight: .medium))
                        .foregroundColor(Palette.text.muted)
                }
                
                Spacer()
                
                Image(systemName: module.icon)
                    .font(.system(size: 20))
                    .foregroundColor(color.opacity(0.7))
                
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
        .buttonStyle(ScaleButtonStyle())
        .accessibilityElement(children: .combine)
        .accessibilityLabel("Module \(module.number): \(module.title). \(module.subtitle). \(module.lessons.count) lessons.")
        .accessibilityHint("Double tap to open module")
    }
}

// MARK: - Module Detail View

struct EmeraldModuleDetailView: View {
    let module: EmeraldModule
    let color: Color
    @Environment(\.dismiss) var dismiss
    @State private var selectedLesson: EmeraldLesson?
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.black.ignoresSafeArea()
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 20) {
                        
                        // Module header
                        VStack(spacing: 12) {
                            ZStack {
                                Circle()
                                    .fill(color.opacity(0.2))
                                    .frame(width: 80, height: 80)
                                
                                Image(systemName: module.icon)
                                    .font(.system(size: 36, weight: .semibold))
                                    .foregroundColor(color)
                            }
                            
                            Text("Module \(module.number)")
                                .font(.system(size: 12, weight: .bold, design: .rounded))
                                .foregroundColor(color)
                            
                            Text(module.title)
                                .font(.system(size: 24, weight: .bold, design: .rounded))
                                .foregroundColor(Palette.text.primary)
                            
                            Text(module.subtitle)
                                .font(.system(size: 15, weight: .medium))
                                .foregroundColor(Palette.text.secondary)
                        }
                        .padding(.top, 20)
                        
                        // Lessons
                        VStack(alignment: .leading, spacing: 12) {
                            Text("LESSONS")
                                .font(.system(size: 12, weight: .bold, design: .rounded))
                                .tracking(2)
                                .foregroundColor(Palette.text.muted)
                                .padding(.horizontal, 20)
                            
                            ForEach(Array(module.lessons.enumerated()), id: \.element.id) { index, lesson in
                                EmeraldLessonRow(
                                    lesson: lesson,
                                    number: index + 1,
                                    color: color
                                ) {
                                    selectedLesson = lesson
                                }
                                .padding(.horizontal, 20)
                            }
                        }
                        
                        Spacer(minLength: 100)
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        dismiss()
                    }
                    .foregroundColor(color)
                }
            }
            .sheet(item: $selectedLesson) { lesson in
                EmeraldLessonView(lesson: lesson, color: color)
            }
        }
    }
}

// MARK: - Lesson Row

struct EmeraldLessonRow: View {
    let lesson: EmeraldLesson
    let number: Int
    let color: Color
    let action: () -> Void
    
    var body: some View {
        Button(action: {
            HapticManager.shared.light()
            action()
        }) {
            HStack(spacing: 14) {
                Text("\(number)")
                    .font(.system(size: 14, weight: .bold, design: .rounded))
                    .foregroundColor(color)
                    .frame(width: 28, height: 28)
                    .background(
                        Circle()
                            .fill(color.opacity(0.15))
                    )
                
                Text(lesson.title)
                    .font(.system(size: 15, weight: .semibold, design: .rounded))
                    .foregroundColor(Palette.text.primary)
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .font(.system(size: 12, weight: .semibold))
                    .foregroundColor(Palette.text.muted)
            }
            .padding(14)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.white.opacity(0.03))
            )
        }
        .buttonStyle(PlainButtonStyle())
        .accessibilityLabel("Lesson \(number): \(lesson.title)")
        .accessibilityHint("Double tap to start lesson")
    }
}

// MARK: - Lesson View

struct EmeraldLessonView: View {
    let lesson: EmeraldLesson
    let color: Color
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.black.ignoresSafeArea()
                
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 24) {
                        
                        // Header
                        Text(lesson.title)
                            .font(.system(size: 26, weight: .bold, design: .rounded))
                            .foregroundColor(Palette.text.primary)
                        
                        // Content
                        Text(LocalizedStringKey(lesson.content))
                            .font(.system(size: 16, weight: .regular, design: .rounded))
                            .foregroundColor(Palette.text.secondary)
                            .lineSpacing(6)
                        
                        // Key Insight
                        VStack(alignment: .leading, spacing: 10) {
                            HStack(spacing: 8) {
                                Image(systemName: "lightbulb.fill")
                                    .foregroundColor(Palette.accent.gold)
                                Text("KEY INSIGHT")
                                    .font(.system(size: 11, weight: .bold, design: .rounded))
                                    .tracking(1.5)
                                    .foregroundColor(Palette.accent.gold)
                            }
                            
                            Text(lesson.keyInsight)
                                .font(.system(size: 15, weight: .medium, design: .rounded))
                                .foregroundColor(Palette.text.primary)
                                .italic()
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
                        
                        // Practice
                        VStack(alignment: .leading, spacing: 10) {
                            HStack(spacing: 8) {
                                Image(systemName: "figure.mind.and.body")
                                    .foregroundColor(color)
                                Text("PRACTICE")
                                    .font(.system(size: 11, weight: .bold, design: .rounded))
                                    .tracking(1.5)
                                    .foregroundColor(color)
                            }
                            
                            Text(lesson.practice)
                                .font(.system(size: 15, weight: .medium, design: .rounded))
                                .foregroundColor(Palette.text.secondary)
                        }
                        .padding(16)
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .fill(color.opacity(0.1))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(color.opacity(0.3), lineWidth: 1)
                                )
                        )
                        
                        Spacer(minLength: 100)
                    }
                    .padding(20)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        dismiss()
                    }
                    .foregroundColor(color)
                }
            }
        }
    }
}

// MARK: - Identifiable Conformance

extension EmeraldModule: Equatable {
    static func == (lhs: EmeraldModule, rhs: EmeraldModule) -> Bool {
        lhs.id == rhs.id
    }
}

extension EmeraldLesson: Equatable {
    static func == (lhs: EmeraldLesson, rhs: EmeraldLesson) -> Bool {
        lhs.id == rhs.id
    }
}

#Preview {
    EmeraldTabletsCourseView()
}
