// WordSpellsCourseView.swift
// THE WORD SPELLS - Mystic purple etymology decoder UI
// ☀️ SunFlow: Reignited

import SwiftUI

struct WordSpellsCourseView: View {
    @Environment(\.dismiss) var dismiss
    @State private var selectedModule: WordSpellModule?
    @State private var pulsePhase: CGFloat = 0
    @State private var glyphRotation: CGFloat = 0
    @State private var particleOffset: CGFloat = 0
    
    private let course = WordSpellsCourse.shared
    
    var body: some View {
        NavigationStack {
            ZStack {
                // Mystic purple background
                mysticBackground
                
                // Floating glyphs
                floatingGlyphs
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 28) {
                        
                        headerSection
                        
                        etymologyPreview
                        
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
                WordSpellModuleDetailView(module: module, color: course.color)
            }
            .onAppear {
                startAnimations()
            }
        }
    }
    
    // MARK: - Mystic Background
    
    private var mysticBackground: some View {
        ZStack {
            // Base gradient
            LinearGradient(
                colors: [
                    Color.black,
                    Color(hex: "1a0a2e"),
                    Color(hex: "2d1b4e"),
                    Color(hex: "1a0a2e"),
                    Color.black
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            // Pulsing glow
            RadialGradient(
                colors: [
                    course.color.opacity(0.2 + pulsePhase * 0.1),
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
    
    // MARK: - Floating Glyphs
    
    private var floatingGlyphs: some View {
        GeometryReader { geo in
            ForEach(0..<15, id: \.self) { i in
                Text(ancientGlyphs[i % ancientGlyphs.count])
                    .font(.system(size: CGFloat.random(in: 16...28)))
                    .foregroundColor(course.color.opacity(Double.random(in: 0.1...0.3)))
                    .position(
                        x: CGFloat.random(in: 0...geo.size.width),
                        y: (CGFloat(i) * 60 + particleOffset).truncatingRemainder(dividingBy: geo.size.height + 100)
                    )
                    .rotationEffect(.degrees(Double(i) * 24 + glyphRotation))
            }
        }
        .allowsHitTesting(false)
    }
    
    private let ancientGlyphs = ["𓇳", "𓂀", "א", "ש", "Ω", "☀", "𓆣", "ע", "𓊨", "☥", "𓏏", "ה", "י", "ו", "𓅃"]
    
    // MARK: - Header
    
    private var headerSection: some View {
        VStack(spacing: 20) {
            // Icon with mystical effect
            ZStack {
                // Outer rings
                ForEach(0..<3, id: \.self) { i in
                    Circle()
                        .stroke(
                            course.color.opacity(0.2 - Double(i) * 0.05),
                            lineWidth: 2
                        )
                        .frame(width: 110 + CGFloat(i) * 30, height: 110 + CGFloat(i) * 30)
                        .scaleEffect(1 + pulsePhase * 0.04)
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
                            endRadius: 55
                        )
                    )
                    .frame(width: 110, height: 110)
                    .scaleEffect(1 + pulsePhase * 0.08)
                
                // Book icon
                Image(systemName: "character.book.closed.fill")
                    .font(.system(size: 44, weight: .medium))
                    .foregroundStyle(
                        LinearGradient(
                            colors: [course.color, Color.white, course.color],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .shadow(color: course.color, radius: 10)
            }
            
            // Title
            VStack(spacing: 8) {
                Text("THE WORD SPELLS")
                    .font(.system(size: 12, weight: .bold, design: .rounded))
                    .tracking(4)
                    .foregroundColor(course.color)
                
                Text("Truth Hidden in")
                    .font(.system(size: 28, weight: .bold, design: .rounded))
                    .foregroundColor(Palette.text.primary)
                
                Text("The Words Themselves")
                    .font(.system(size: 20, weight: .medium, design: .rounded))
                    .foregroundColor(Palette.text.secondary)
            }
            
            // Course stats
            HStack(spacing: 16) {
                WordSpellStatPill(icon: "square.stack.3d.up", value: "6", label: "Modules", color: course.color)
                WordSpellStatPill(icon: "text.book.closed", value: "18", label: "Decodes", color: course.color)
                WordSpellStatPill(icon: "clock", value: "3h", label: "Duration", color: course.color)
            }
        }
    }
    
    // MARK: - Etymology Preview
    
    private var etymologyPreview: some View {
        VStack(spacing: 16) {
            Text("GNOSIS IN PLAIN SIGHT")
                .font(.system(size: 11, weight: .bold, design: .rounded))
                .tracking(2)
                .foregroundColor(Palette.text.muted)
            
            VStack(spacing: 12) {
                EtymologyRow(word: "IS•RA•EL", decode: "ISIS + RA + EL", meaning: "Feminine Divine + Sun + God", color: course.color)
                EtymologyRow(word: "ISRAELITE", decode: "IS REAL LIGHT", meaning: "One who embodies the light", color: course.color)
                EtymologyRow(word: "SOUL", decode: "SOL", meaning: "The sun within you", color: course.color)
                EtymologyRow(word: "HOLY", decode: "HELIOS", meaning: "Of the sun god", color: course.color)
                EtymologyRow(word: "AMEN", decode: "AMUN", meaning: "Egyptian hidden god", color: course.color)
            }
        }
        .padding(18)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(course.color.opacity(0.1))
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(course.color.opacity(0.3), lineWidth: 1)
                )
        )
    }
    
    // MARK: - Intro Section
    
    private var introSection: some View {
        VStack(alignment: .leading, spacing: 14) {
            HStack(spacing: 10) {
                Image(systemName: "wand.and.stars")
                    .foregroundColor(course.color)
                Text("ETYMOLOGY IS GNOSIS")
                    .font(.system(size: 11, weight: .bold, design: .rounded))
                    .tracking(2)
                    .foregroundColor(course.color)
            }
            
            Text("They couldn't destroy the truth. So they hid it in the words themselves—hoping you'd never look.")
                .font(.system(size: 16, weight: .medium, design: .rounded))
                .foregroundColor(Palette.text.primary)
                .lineSpacing(4)
            
            Text("Every prayer, every sermon, every 'holy' word carries the buried light of what they suppressed. The sun worship never ended. It just went underground—into language.")
                .font(.system(size: 15, weight: .regular, design: .rounded))
                .foregroundColor(Palette.text.secondary)
                .lineSpacing(4)
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
                Text("DECODE MODULES")
                    .font(.system(size: 11, weight: .bold, design: .rounded))
                    .tracking(2)
                    .foregroundColor(course.color)
            }
            
            ForEach(course.modules) { module in
                WordSpellModuleCard(module: module, color: course.color) {
                    HapticManager.shared.medium()
                    selectedModule = module
                }
            }
        }
    }
    
    // MARK: - Animations
    
    private func startAnimations() {
        withAnimation(.easeInOut(duration: 2.5).repeatForever(autoreverses: true)) {
            pulsePhase = 1
        }
        
        withAnimation(.linear(duration: 60).repeatForever(autoreverses: false)) {
            glyphRotation = 360
        }
        
        withAnimation(.linear(duration: 25).repeatForever(autoreverses: false)) {
            particleOffset = 800
        }
    }
}

// MARK: - Etymology Row

struct EtymologyRow: View {
    let word: String
    let decode: String
    let meaning: String
    let color: Color
    
    var body: some View {
        HStack(spacing: 12) {
            Text(word)
                .font(.system(size: 14, weight: .bold, design: .monospaced))
                .foregroundColor(color)
                .frame(width: 90, alignment: .leading)
            
            Image(systemName: "arrow.right")
                .font(.system(size: 10))
                .foregroundColor(Palette.text.muted)
            
            Text(decode)
                .font(.system(size: 13, weight: .semibold, design: .rounded))
                .foregroundColor(Palette.text.primary)
                .frame(width: 85, alignment: .leading)
            
            Text(meaning)
                .font(.system(size: 11, weight: .medium))
                .foregroundColor(Palette.text.secondary)
                .lineLimit(1)
        }
    }
}

// MARK: - Supporting Views

struct WordSpellStatPill: View {
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

struct WordSpellModuleCard: View {
    let module: WordSpellModule
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
                    
                    Text("\(module.lessons.count) decodes")
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

struct WordSpellModuleDetailView: View {
    let module: WordSpellModule
    let color: Color
    @Environment(\.dismiss) var dismiss
    @State private var selectedLesson: WordSpellLesson?
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(
                    colors: [Color.black, Color(hex: "1a0a2e"), Color.black],
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
                            Text("DECODES")
                                .font(.system(size: 11, weight: .bold, design: .rounded))
                                .tracking(2)
                                .foregroundColor(Palette.text.muted)
                                .padding(.horizontal, 20)
                            
                            ForEach(Array(module.lessons.enumerated()), id: \.element.id) { index, lesson in
                                WordSpellLessonRow(lesson: lesson, number: index + 1, color: color) {
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
                WordSpellLessonView(lesson: lesson, color: color)
            }
        }
    }
}

struct WordSpellLessonRow: View {
    let lesson: WordSpellLesson
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
                
                VStack(alignment: .leading, spacing: 2) {
                    Text(lesson.title)
                        .font(.system(size: 15, weight: .semibold, design: .rounded))
                        .foregroundColor(Palette.text.primary)
                    
                    Text(lesson.decode)
                        .font(.system(size: 12, weight: .medium, design: .monospaced))
                        .foregroundColor(color.opacity(0.8))
                }
                
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

struct WordSpellLessonView: View {
    let lesson: WordSpellLesson
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
                        
                        // Decode highlight
                        HStack {
                            Image(systemName: "arrow.right.circle.fill")
                                .foregroundColor(color)
                            Text(lesson.decode)
                                .font(.system(size: 18, weight: .bold, design: .monospaced))
                                .foregroundColor(color)
                        }
                        .padding(12)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(color.opacity(0.15))
                        )
                        
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
    WordSpellsCourseView()
}
