// SerpentDecodedCourseView.swift
// THE SERPENT DECODED - Pulsing green cosmic UI
// ☀️ SunFlow: Reignited

import SwiftUI

struct SerpentDecodedCourseView: View {
    @Environment(\.dismiss) var dismiss
    @State private var selectedModule: SerpentModule?
    @State private var pulsePhase: CGFloat = 0
    @State private var serpentWave: CGFloat = 0
    @State private var particleOffset: CGFloat = 0
    
    private let course = SerpentDecodedCourse.shared
    
    var body: some View {
        NavigationStack {
            ZStack {
                // Cosmic green background
                cosmicBackground
                
                // Floating particles
                cosmicParticles
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 28) {
                        
                        headerSection
                        
                        introSection
                        
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
                SerpentModuleDetailView(module: module, color: course.color)
            }
            .onAppear {
                startAnimations()
            }
        }
    }
    
    // MARK: - Cosmic Background
    
    private var cosmicBackground: some View {
        ZStack {
            // Base gradient
            LinearGradient(
                colors: [
                    Color.black,
                    Color(hex: "001a0d"),
                    Color(hex: "002211"),
                    Color(hex: "001a0d"),
                    Color.black
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            // Pulsing glow from center
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
            
            // Serpentine energy wave
            SerpentWave(phase: serpentWave)
                .stroke(
                    LinearGradient(
                        colors: [
                            course.color.opacity(0.3),
                            course.color.opacity(0.1),
                            course.color.opacity(0.3)
                        ],
                        startPoint: .leading,
                        endPoint: .trailing
                    ),
                    lineWidth: 2
                )
                .blur(radius: 2)
                .ignoresSafeArea()
        }
    }
    
    // MARK: - Cosmic Particles
    
    private var cosmicParticles: some View {
        GeometryReader { geo in
            ForEach(0..<25, id: \.self) { i in
                Circle()
                    .fill(course.color.opacity(Double.random(in: 0.2...0.5)))
                    .frame(width: CGFloat.random(in: 2...5))
                    .position(
                        x: CGFloat.random(in: 0...geo.size.width),
                        y: (CGFloat(i) * 40 + particleOffset).truncatingRemainder(dividingBy: geo.size.height)
                    )
                    .blur(radius: CGFloat.random(in: 0.5...2))
            }
        }
        .allowsHitTesting(false)
    }
    
    // MARK: - Header
    
    private var headerSection: some View {
        VStack(spacing: 20) {
            // Serpent icon with pulsing glow
            ZStack {
                // Outer glow rings
                ForEach(0..<3, id: \.self) { i in
                    Circle()
                        .stroke(
                            course.color.opacity(0.2 - Double(i) * 0.05),
                            lineWidth: 2
                        )
                        .frame(width: 120 + CGFloat(i) * 30, height: 120 + CGFloat(i) * 30)
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
                            endRadius: 60
                        )
                    )
                    .frame(width: 120, height: 120)
                    .scaleEffect(1 + pulsePhase * 0.1)
                
                // Serpent icon
                Image(systemName: "waveform.path")
                    .font(.system(size: 50, weight: .medium))
                    .foregroundStyle(
                        LinearGradient(
                            colors: [course.color, Color.white, course.color],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .shadow(color: course.color, radius: 10)
            }
            .accessibilityHidden(true)
            
            // Title
            VStack(spacing: 8) {
                Text("THE SERPENT DECODED")
                    .font(.system(size: 12, weight: .bold, design: .rounded))
                    .tracking(4)
                    .foregroundColor(course.color)
                
                Text("The Forbidden Truth")
                    .font(.system(size: 28, weight: .bold, design: .rounded))
                    .foregroundColor(Palette.text.primary)
                
                Text("Hidden for 2,000 Years")
                    .font(.system(size: 18, weight: .medium, design: .rounded))
                    .foregroundColor(Palette.text.secondary)
            }
            
            // Course stats
            HStack(spacing: 16) {
                StatPill(icon: "square.stack.3d.up", value: "6", label: "Modules", color: course.color)
                StatPill(icon: "text.book.closed", value: "18", label: "Lessons", color: course.color)
                StatPill(icon: "clock", value: "4h", label: "Duration", color: course.color)
            }
        }
    }
    
    // MARK: - Intro Section
    
    private var introSection: some View {
        VStack(alignment: .leading, spacing: 14) {
            HStack(spacing: 10) {
                Image(systemName: "exclamationmark.triangle.fill")
                    .foregroundColor(.orange)
                Text("FORBIDDEN KNOWLEDGE")
                    .font(.system(size: 11, weight: .bold, design: .rounded))
                    .tracking(2)
                    .foregroundColor(.orange)
            }
            
            Text("What if the serpent in Genesis was never God's enemy? What if everything the church taught you about the fall was inverted?")
                .font(.system(size: 16, weight: .medium, design: .rounded))
                .foregroundColor(Palette.text.primary)
                .lineSpacing(4)
            
            Text("And what if Jesus himself pointed to the serpent as a symbol of salvation—and they've been hiding it from you for 2,000 years?")
                .font(.system(size: 15, weight: .regular, design: .rounded))
                .foregroundColor(Palette.text.secondary)
                .lineSpacing(4)
            
            // Key points
            VStack(alignment: .leading, spacing: 10) {
                KeyPoint(text: "The serpent was sacred in every ancient culture before Genesis", color: course.color)
                KeyPoint(text: "The Hebrew word 'Nachash' means 'to shine, to illuminate'", color: course.color)
                KeyPoint(text: "Jesus explicitly compared himself to the bronze serpent", color: course.color)
                KeyPoint(text: "Your body is the temple—the serpent rises within you", color: course.color)
            }
            .padding(.top, 8)
        }
        .padding(18)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.orange.opacity(0.08))
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.orange.opacity(0.25), lineWidth: 1)
                )
        )
    }
    
    // MARK: - Modules Section
    
    private var modulesSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Image(systemName: "list.bullet.rectangle.portrait.fill")
                    .foregroundColor(course.color)
                Text("COURSE MODULES")
                    .font(.system(size: 11, weight: .bold, design: .rounded))
                    .tracking(2)
                    .foregroundColor(course.color)
            }
            
            ForEach(course.modules) { module in
                SerpentModuleCard(module: module, color: course.color) {
                    HapticManager.shared.medium()
                    selectedModule = module
                }
            }
        }
    }
    
    // MARK: - Animations
    
    private func startAnimations() {
        // Pulse animation
        withAnimation(.easeInOut(duration: 2).repeatForever(autoreverses: true)) {
            pulsePhase = 1
        }
        
        // Serpent wave animation
        withAnimation(.linear(duration: 8).repeatForever(autoreverses: false)) {
            serpentWave = .pi * 2
        }
        
        // Particle float animation
        withAnimation(.linear(duration: 20).repeatForever(autoreverses: false)) {
            particleOffset = 800
        }
    }
}

// MARK: - Serpent Wave Shape

struct SerpentWave: Shape {
    var phase: CGFloat
    
    var animatableData: CGFloat {
        get { phase }
        set { phase = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let midY = rect.height * 0.5
        let amplitude: CGFloat = 50
        let wavelength: CGFloat = 200
        
        path.move(to: CGPoint(x: 0, y: midY))
        
        for x in stride(from: 0, through: rect.width, by: 1) {
            let relativeX = x / wavelength
            let y = midY + sin(relativeX * .pi * 2 + phase) * amplitude
            path.addLine(to: CGPoint(x: x, y: y))
        }
        
        return path
    }
}

// MARK: - Supporting Views

struct StatPill: View {
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
        .background(
            Capsule()
                .fill(color.opacity(0.15))
        )
    }
}

struct KeyPoint: View {
    let text: String
    let color: Color
    
    var body: some View {
        HStack(alignment: .top, spacing: 10) {
            Image(systemName: "checkmark.circle.fill")
                .font(.system(size: 14))
                .foregroundColor(color)
            
            Text(text)
                .font(.system(size: 14, weight: .medium, design: .rounded))
                .foregroundColor(Palette.text.secondary)
        }
    }
}

struct SerpentModuleCard: View {
    let module: SerpentModule
    let color: Color
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: 14) {
                // Module number
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
        .accessibilityElement(children: .combine)
        .accessibilityLabel("Module \(module.number): \(module.title). \(module.subtitle). \(module.lessons.count) lessons.")
        .accessibilityHint("Double tap to open module")
    }
}

// MARK: - Module Detail View

struct SerpentModuleDetailView: View {
    let module: SerpentModule
    let color: Color
    @Environment(\.dismiss) var dismiss
    @State private var selectedLesson: SerpentLesson?
    
    var body: some View {
        NavigationStack {
            ZStack {
                // Background
                LinearGradient(
                    colors: [Color.black, Color(hex: "001a0d"), Color.black],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 24) {
                        // Module header
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
                        
                        // Lessons
                        VStack(alignment: .leading, spacing: 12) {
                            Text("LESSONS")
                                .font(.system(size: 11, weight: .bold, design: .rounded))
                                .tracking(2)
                                .foregroundColor(Palette.text.muted)
                                .padding(.horizontal, 20)
                            
                            ForEach(Array(module.lessons.enumerated()), id: \.element.id) { index, lesson in
                                SerpentLessonRow(
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
                    Button("Done") { dismiss() }
                        .foregroundColor(color)
                }
            }
            .sheet(item: $selectedLesson) { lesson in
                SerpentLessonView(lesson: lesson, color: color)
            }
        }
    }
}

struct SerpentLessonRow: View {
    let lesson: SerpentLesson
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

struct SerpentLessonView: View {
    let lesson: SerpentLesson
    let color: Color
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.black.ignoresSafeArea()
                
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 24) {
                        
                        // Title
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
                        
                        // Practice
                        VStack(alignment: .leading, spacing: 10) {
                            HStack(spacing: 8) {
                                Image(systemName: "figure.mind.and.body")
                                    .foregroundColor(.orange)
                                Text("PRACTICE")
                                    .font(.system(size: 11, weight: .bold, design: .rounded))
                                    .tracking(1.5)
                                    .foregroundColor(.orange)
                            }
                            
                            Text(lesson.practice)
                                .font(.system(size: 15, weight: .medium, design: .rounded))
                                .foregroundColor(Palette.text.secondary)
                        }
                        .padding(16)
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color.orange.opacity(0.1))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(Color.orange.opacity(0.25), lineWidth: 1)
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

// MARK: - Identifiable

extension SerpentModule: Equatable {
    static func == (lhs: SerpentModule, rhs: SerpentModule) -> Bool { lhs.id == rhs.id }
}

extension SerpentLesson: Equatable {
    static func == (lhs: SerpentLesson, rhs: SerpentLesson) -> Bool { lhs.id == rhs.id }
}

#Preview {
    SerpentDecodedCourseView()
}
