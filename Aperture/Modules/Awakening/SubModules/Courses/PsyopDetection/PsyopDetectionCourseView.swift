// PsyopDetectionCourseView.swift
// HOW TO SPOT A PSYOP - Alert red pulsing UI
// ☀️ SunFlow: Reignited

import SwiftUI

struct PsyopDetectionCourseView: View {
    @Environment(\.dismiss) var dismiss
    @State private var selectedModule: PsyopModule?
    @State private var pulsePhase: CGFloat = 0
    @State private var scanLine: CGFloat = 0
    @State private var warningFlash: CGFloat = 0
    
    private let course = PsyopDetectionCourse.shared
    
    var body: some View {
        NavigationStack {
            ZStack {
                // Alert red background
                alertBackground
                
                // Scanning effect
                scanningOverlay
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 28) {
                        
                        headerSection
                        
                        frameworkPreview
                        
                        warningSection
                        
                        modulesSection
                        
                        Spacer(minLength: 120)
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
                }
            }
            .sheet(item: $selectedModule) { module in
                PsyopModuleDetailView(module: module, color: course.color)
            }
            .onAppear {
                startAnimations()
            }
        }
    }
    
    // MARK: - Alert Background
    
    private var alertBackground: some View {
        ZStack {
            // Base dark with red tint
            LinearGradient(
                colors: [
                    Color.black,
                    Color(hex: "1a0505"),
                    Color(hex: "2a0a0a"),
                    Color(hex: "1a0505"),
                    Color.black
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            // Pulsing red glow
            RadialGradient(
                colors: [
                    course.color.opacity(0.15 + pulsePhase * 0.1),
                    course.color.opacity(0.05),
                    Color.clear
                ],
                center: .center,
                startRadius: 0,
                endRadius: 400
            )
            .ignoresSafeArea()
        }
    }
    
    // MARK: - Scanning Overlay
    
    private var scanningOverlay: some View {
        GeometryReader { geo in
            Rectangle()
                .fill(
                    LinearGradient(
                        colors: [
                            Color.clear,
                            course.color.opacity(0.1),
                            course.color.opacity(0.2),
                            course.color.opacity(0.1),
                            Color.clear
                        ],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .frame(height: 100)
                .offset(y: scanLine * geo.size.height - 50)
        }
        .allowsHitTesting(false)
    }
    
    // MARK: - Header
    
    private var headerSection: some View {
        VStack(spacing: 20) {
            // Icon with alert effect
            ZStack {
                // Warning rings
                ForEach(0..<3, id: \.self) { i in
                    Circle()
                        .stroke(
                            course.color.opacity(0.3 - Double(i) * 0.08),
                            lineWidth: 2
                        )
                        .frame(width: 100 + CGFloat(i) * 30, height: 100 + CGFloat(i) * 30)
                        .scaleEffect(1 + pulsePhase * 0.05)
                }
                
                // Inner glow
                Circle()
                    .fill(
                        RadialGradient(
                            colors: [
                                course.color.opacity(0.4),
                                course.color.opacity(0.1),
                                Color.clear
                            ],
                            center: .center,
                            startRadius: 0,
                            endRadius: 50
                        )
                    )
                    .frame(width: 100, height: 100)
                    .scaleEffect(1 + pulsePhase * 0.1)
                
                // Brain icon
                Image(systemName: "brain.head.profile")
                    .font(.system(size: 44, weight: .medium))
                    .foregroundStyle(
                        LinearGradient(
                            colors: [course.color, .white, course.color],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .shadow(color: course.color, radius: 8)
            }
            
            // Title
            VStack(spacing: 8) {
                Text("BEHAVIORAL DEFENSE")
                    .font(.system(size: 11, weight: .bold, design: .rounded))
                    .tracking(3)
                    .foregroundColor(course.color)
                
                Text("How to Spot")
                    .font(.system(size: 28, weight: .bold, design: .rounded))
                    .foregroundColor(Palette.text.primary)
                
                Text("a Psyop")
                    .font(.system(size: 28, weight: .bold, design: .rounded))
                    .foregroundColor(course.color)
            }
            
            // Course stats
            HStack(spacing: 16) {
                PsyopStatPill(icon: "square.stack.3d.up", value: "6", label: "Modules", color: course.color)
                PsyopStatPill(icon: "text.book.closed", value: "18", label: "Lessons", color: course.color)
                PsyopStatPill(icon: "clock", value: "4h", label: "Duration", color: course.color)
            }
        }
    }
    
    // MARK: - Framework Preview
    
    private var frameworkPreview: some View {
        VStack(spacing: 16) {
            Text("THE DETECTION FRAMEWORKS")
                .font(.system(size: 11, weight: .bold, design: .rounded))
                .tracking(2)
                .foregroundColor(Palette.text.muted)
            
            HStack(spacing: 12) {
                FrameworkBadge(title: "F.A.T.E.", subtitle: "Focus • Authority\nTribe • Emotion", color: course.color)
                FrameworkBadge(title: "P.C.P.", subtitle: "Perception\nContext • Permission", color: course.color)
                FrameworkBadge(title: "P.D.S.", subtitle: "Pacify • Distract\nSedate", color: course.color)
            }
        }
        .padding(18)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(course.color.opacity(0.08))
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(course.color.opacity(0.25), lineWidth: 1)
                )
        )
    }
    
    // MARK: - Warning Section
    
    private var warningSection: some View {
        VStack(alignment: .leading, spacing: 14) {
            HStack(spacing: 10) {
                Image(systemName: "exclamationmark.triangle.fill")
                    .foregroundColor(course.color)
                Text("CRITICAL AWARENESS")
                    .font(.system(size: 11, weight: .bold, design: .rounded))
                    .tracking(2)
                    .foregroundColor(course.color)
            }
            
            Text("\"Those who believe they're immune to manipulation are the MOST suggestible. They're the easiest to manipulate.\"")
                .font(.system(size: 16, weight: .medium, design: .rounded))
                .foregroundColor(Palette.text.primary)
                .italic()
                .lineSpacing(4)
            
            Text("Technology has outpaced the human brain's ability to adapt. The same techniques that train dolphins control populations. This course teaches you to see the mechanisms.")
                .font(.system(size: 15, weight: .regular, design: .rounded))
                .foregroundColor(Palette.text.secondary)
                .lineSpacing(4)
            
            // Key points
            VStack(alignment: .leading, spacing: 10) {
                PsyopKeyPoint(text: "Your mammalian brain is the target, not your logic", color: course.color)
                PsyopKeyPoint(text: "Suggestibility is FLUID — it can be increased or decreased", color: course.color)
                PsyopKeyPoint(text: "The Left/Right division IS the psyop", color: course.color)
                PsyopKeyPoint(text: "Detection becomes automatic with practice", color: course.color)
            }
            .padding(.top, 8)
        }
        .padding(18)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.white.opacity(0.03))
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(course.color.opacity(0.2), lineWidth: 1)
                )
        )
    }
    
    // MARK: - Modules Section
    
    private var modulesSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Image(systemName: "list.bullet.rectangle.portrait.fill")
                    .foregroundColor(course.color)
                Text("DETECTION MODULES")
                    .font(.system(size: 11, weight: .bold, design: .rounded))
                    .tracking(2)
                    .foregroundColor(course.color)
            }
            
            ForEach(course.modules) { module in
                PsyopModuleCard(module: module, color: course.color) {
                    HapticManager.shared.medium()
                    selectedModule = module
                }
            }
        }
    }
    
    // MARK: - Animations
    
    private func startAnimations() {
        withAnimation(.easeInOut(duration: 1.5).repeatForever(autoreverses: true)) {
            pulsePhase = 1
        }
        
        withAnimation(.linear(duration: 4).repeatForever(autoreverses: false)) {
            scanLine = 1
        }
        
        withAnimation(.easeInOut(duration: 0.8).repeatForever(autoreverses: true)) {
            warningFlash = 1
        }
    }
}

// MARK: - Framework Badge

struct FrameworkBadge: View {
    let title: String
    let subtitle: String
    let color: Color
    
    var body: some View {
        VStack(spacing: 6) {
            Text(title)
                .font(.system(size: 16, weight: .bold, design: .monospaced))
                .foregroundColor(color)
            
            Text(subtitle)
                .font(.system(size: 9, weight: .medium))
                .foregroundColor(Palette.text.secondary)
                .multilineTextAlignment(.center)
                .lineSpacing(2)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 12)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(color.opacity(0.1))
        )
    }
}

// MARK: - Supporting Views

struct PsyopStatPill: View {
    let icon: String
    let value: String
    let label: String
    let color: Color
    
    var body: some View {
        VStack(spacing: 4) {
            HStack(spacing: 4) {
                Image(systemName: icon)
                    .font(.system(size: 11))
                Text(value)
                    .font(.system(size: 14, weight: .bold, design: .rounded))
            }
            .foregroundColor(color)
            
            Text(label)
                .font(.system(size: 10, weight: .medium))
                .foregroundColor(Palette.text.muted)
        }
        .padding(.horizontal, 14)
        .padding(.vertical, 8)
        .background(Capsule().fill(color.opacity(0.15)))
    }
}

struct PsyopKeyPoint: View {
    let text: String
    let color: Color
    
    var body: some View {
        HStack(alignment: .top, spacing: 10) {
            Image(systemName: "checkmark.shield.fill")
                .font(.system(size: 14))
                .foregroundColor(color)
            
            Text(text)
                .font(.system(size: 14, weight: .medium, design: .rounded))
                .foregroundColor(Palette.text.secondary)
        }
    }
}

struct PsyopModuleCard: View {
    let module: PsyopModule
    let color: Color
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: 14) {
                ZStack {
                    RoundedRectangle(cornerRadius: 12)
                        .fill(color.opacity(0.2))
                        .frame(width: 50, height: 50)
                    
                    Text("\(module.number)")
                        .font(.system(size: 22, weight: .bold, design: .monospaced))
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
                    .font(.system(size: 18))
                    .foregroundColor(color.opacity(0.7))
                
                Image(systemName: "chevron.right")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(Palette.text.muted)
            }
            .padding(16)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color.white.opacity(0.04))
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(color.opacity(0.2), lineWidth: 1)
                    )
            )
        }
        .buttonStyle(ScaleButtonStyle())
    }
}

// MARK: - Module Detail View

struct PsyopModuleDetailView: View {
    let module: PsyopModule
    let color: Color
    @Environment(\.dismiss) var dismiss
    @State private var selectedLesson: PsyopLesson?
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(
                    colors: [Color.black, Color(hex: "1a0505"), Color.black],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 24) {
                        VStack(spacing: 14) {
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
                        
                        VStack(alignment: .leading, spacing: 12) {
                            Text("LESSONS")
                                .font(.system(size: 11, weight: .bold, design: .rounded))
                                .tracking(2)
                                .foregroundColor(Palette.text.muted)
                                .padding(.horizontal, 20)
                            
                            ForEach(Array(module.lessons.enumerated()), id: \.element.id) { index, lesson in
                                PsyopLessonRow(lesson: lesson, number: index + 1, color: color) {
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
                    Button("Done") { dismiss() }
                        .foregroundColor(color)
                }
            }
            .sheet(item: $selectedLesson) { lesson in
                PsyopLessonView(lesson: lesson, color: color)
            }
        }
    }
}

struct PsyopLessonRow: View {
    let lesson: PsyopLesson
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
                    .font(.system(size: 14, weight: .bold, design: .monospaced))
                    .foregroundColor(color)
                    .frame(width: 28, height: 28)
                    .background(Circle().fill(color.opacity(0.15)))
                
                Text(lesson.title)
                    .font(.system(size: 15, weight: .semibold, design: .rounded))
                    .foregroundColor(Palette.text.primary)
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)
                
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
    }
}

// MARK: - Lesson View

struct PsyopLessonView: View {
    let lesson: PsyopLesson
    let color: Color
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.black.ignoresSafeArea()
                
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 24) {
                        
                        Text(lesson.title)
                            .font(.system(size: 26, weight: .bold, design: .rounded))
                            .foregroundColor(Palette.text.primary)
                        
                        Text(LocalizedStringKey(lesson.content))
                            .font(.system(size: 16, weight: .regular, design: .rounded))
                            .foregroundColor(Palette.text.secondary)
                            .lineSpacing(6)
                        
                        // Key Insight
                        VStack(alignment: .leading, spacing: 10) {
                            HStack(spacing: 8) {
                                Image(systemName: "lightbulb.fill")
                                    .foregroundColor(color)
                                Text("KEY INSIGHT")
                                    .font(.system(size: 11, weight: .bold, design: .rounded))
                                    .tracking(1.5)
                                    .foregroundColor(color)
                            }
                            
                            Text(lesson.keyInsight)
                                .font(.system(size: 15, weight: .medium, design: .rounded))
                                .foregroundColor(Palette.text.primary)
                                .italic()
                        }
                        .padding(16)
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .fill(color.opacity(0.12))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(color.opacity(0.3), lineWidth: 1)
                                )
                        )
                        
                        // Framework
                        VStack(alignment: .leading, spacing: 10) {
                            HStack(spacing: 8) {
                                Image(systemName: "cube.transparent")
                                    .foregroundColor(.cyan)
                                Text("FRAMEWORK")
                                    .font(.system(size: 11, weight: .bold, design: .rounded))
                                    .tracking(1.5)
                                    .foregroundColor(.cyan)
                            }
                            
                            Text(lesson.framework)
                                .font(.system(size: 14, weight: .medium, design: .monospaced))
                                .foregroundColor(Palette.text.secondary)
                        }
                        .padding(16)
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color.cyan.opacity(0.1))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(Color.cyan.opacity(0.25), lineWidth: 1)
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
                    Button("Done") { dismiss() }
                        .foregroundColor(color)
                }
            }
        }
    }
}

#Preview {
    PsyopDetectionCourseView()
}
