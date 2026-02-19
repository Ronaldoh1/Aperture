// AlexandriaCourseView.swift
// Shared immersive view for all Alexandria expansion courses
// ☀️ SunFlow: Reignited

import SwiftUI

// MARK: - Main Course View

struct AlexandriaCourseView: View {
    let course: AlexandriaCourse
    @Environment(\.dismiss) var dismiss
    @State private var selectedModule: ACModule?
    @State private var pulsePhase: CGFloat = 0
    @State private var particleOffset: CGFloat = 0
    @State private var wavePhase: CGFloat = 0
    
    var body: some View {
        NavigationStack {
            ZStack {
                cosmicBackground
                cosmicParticles
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 28) {
                        headerSection
                        introSection
                        
                        if !course.sources.isEmpty {
                            sourcesTeaser
                        }
                        
                        modulesSection
                        
                        dragonCommentSection
                        
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
                ACModuleDetailView(module: module, course: course)
            }
            .onAppear { startAnimations() }
        }
    }
    
    // MARK: - Cosmic Background
    
    private var cosmicBackground: some View {
        ZStack {
            LinearGradient(
                colors: backgroundGradient,
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
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
            
            // Energy wave
            AlexandriaWave(phase: wavePhase)
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
    
    private var backgroundGradient: [Color] {
        [
            Color.black,
            Color(hex: course.colorHex).opacity(0.08),
            Color(hex: course.colorHex).opacity(0.12),
            Color(hex: course.colorHex).opacity(0.08),
            Color.black
        ]
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
            ZStack {
                ForEach(0..<3, id: \.self) { i in
                    Circle()
                        .stroke(course.color.opacity(0.2 - Double(i) * 0.05), lineWidth: 2)
                        .frame(width: 120 + CGFloat(i) * 30, height: 120 + CGFloat(i) * 30)
                        .scaleEffect(1 + pulsePhase * 0.05)
                }
                
                Circle()
                    .fill(RadialGradient(
                        colors: [course.color.opacity(0.4), course.color.opacity(0.1), Color.clear],
                        center: .center, startRadius: 0, endRadius: 60
                    ))
                    .frame(width: 120, height: 120)
                    .scaleEffect(1 + pulsePhase * 0.1)
                
                Image(systemName: course.icon)
                    .font(.system(size: 50, weight: .medium))
                    .foregroundStyle(LinearGradient(
                        colors: [course.color, Color.white, course.color],
                        startPoint: .topLeading, endPoint: .bottomTrailing
                    ))
                    .shadow(color: course.color, radius: 10)
            }
            .accessibilityHidden(true)
            
            VStack(spacing: 8) {
                Text(course.title.uppercased())
                    .font(.system(size: 12, weight: .bold, design: .rounded))
                    .tracking(4)
                    .foregroundColor(course.color)
                
                Text(course.subtitle)
                    .font(.system(size: 22, weight: .bold, design: .rounded))
                    .foregroundColor(Palette.text.primary)
                    .multilineTextAlignment(.center)
            }
            
            HStack(spacing: 16) {
                StatPill(icon: "square.stack.3d.up", value: "\(course.moduleCount)", label: "Modules", color: course.color)
                StatPill(icon: "text.book.closed", value: "\(course.lessonCount)", label: "Lessons", color: course.color)
                StatPill(icon: "clock", value: "\(Int(course.estimatedHours))h", label: "Duration", color: course.color)
            }
            
            // Premium / Tier badges
            if course.isUltraPremium {
                premiumBadge(text: "🔒 ULTRA PREMIUM — Complete ALL modules to unlock", color: Palette.accent.gold)
            } else if course.isPremium {
                premiumBadge(text: "☀️ PREMIUM FEATURE", color: Palette.primary.orange)
            } else if course.tier > 1 {
                premiumBadge(text: "TIER \(course.tier) — THE \(tierName(course.tier))", color: course.color)
            }
        }
    }
    
    private func premiumBadge(text: String, color: Color) -> some View {
        Text(text)
            .font(.system(size: 11, weight: .bold, design: .rounded))
            .tracking(1)
            .foregroundColor(color)
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(color.opacity(0.15))
                    .overlay(RoundedRectangle(cornerRadius: 20).stroke(color.opacity(0.3), lineWidth: 1))
            )
    }
    
    private func tierName(_ tier: Int) -> String {
        switch tier {
        case 1: return "AWAKENING"
        case 2: return "FOUNDATIONS"
        case 3: return "LINEAGES"
        case 4: return "HIDDEN ORDERS"
        case 5: return "SYNTHESIS"
        default: return "BEYOND"
        }
    }
    
    // MARK: - Intro Section
    
    private var introSection: some View {
        VStack(alignment: .leading, spacing: 14) {
            HStack(spacing: 10) {
                Image(systemName: "exclamationmark.triangle.fill")
                    .foregroundColor(course.color)
                    .font(.system(size: 20))
                Text("BEFORE YOU BEGIN")
                    .font(.system(size: 11, weight: .bold, design: .rounded))
                    .tracking(2)
                    .foregroundColor(course.color)
            }
            
            if let firstLesson = course.modules.first?.lessons.first {
                // Show first ~200 chars as teaser
                let teaser = String(firstLesson.content.prefix(250))
                Text(LocalizedStringKey(teaser + "..."))
                    .font(.system(size: 15, weight: .regular, design: .rounded))
                    .foregroundColor(Palette.text.secondary)
                    .lineSpacing(5)
            }
        }
        .padding(18)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(course.color.opacity(0.08))
                .overlay(RoundedRectangle(cornerRadius: 16).stroke(course.color.opacity(0.2), lineWidth: 1))
        )
    }
    
    // MARK: - Sources Teaser
    
    private var sourcesTeaser: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack(spacing: 8) {
                Image(systemName: "books.vertical.fill")
                    .foregroundColor(Palette.primary.cyan)
                Text("CITED SOURCES")
                    .font(.system(size: 10, weight: .bold, design: .rounded))
                    .tracking(1.5)
                    .foregroundColor(Palette.primary.cyan)
            }
            
            ForEach(course.sources.prefix(3), id: \.self) { source in
                HStack(spacing: 8) {
                    Circle().fill(Palette.primary.cyan.opacity(0.5)).frame(width: 4, height: 4)
                    Text(source)
                        .font(.system(size: 12, weight: .medium, design: .rounded))
                        .foregroundColor(Palette.text.muted)
                        .lineLimit(1)
                }
            }
            
            if course.sources.count > 3 {
                Text("+ \(course.sources.count - 3) more sources")
                    .font(.system(size: 11, weight: .medium))
                    .foregroundColor(Palette.primary.cyan.opacity(0.7))
            }
        }
        .padding(14)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.white.opacity(0.03))
        )
    }
    
    // MARK: - Modules Section
    
    private var modulesSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("MODULES")
                .font(.system(size: 11, weight: .bold, design: .rounded))
                .tracking(2)
                .foregroundColor(Palette.text.muted)
            
            ForEach(course.modules) { module in
                moduleCard(module)
            }
        }
    }
    
    private func moduleCard(_ module: ACModule) -> some View {
        Button {
            HapticManager.shared.light()
            selectedModule = module
        } label: {
            HStack(spacing: 16) {
                ZStack {
                    RoundedRectangle(cornerRadius: 14)
                        .fill(course.color.opacity(0.15))
                        .frame(width: 56, height: 56)
                    
                    VStack(spacing: 2) {
                        Image(systemName: module.icon)
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundColor(course.color)
                        Text("\(module.number)")
                            .font(.system(size: 10, weight: .bold, design: .monospaced))
                            .foregroundColor(course.color.opacity(0.7))
                    }
                }
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(module.title)
                        .font(.system(size: 16, weight: .bold, design: .rounded))
                        .foregroundColor(Palette.text.primary)
                        .lineLimit(2)
                        .multilineTextAlignment(.leading)
                    
                    Text(module.subtitle)
                        .font(.system(size: 13, weight: .medium))
                        .foregroundColor(Palette.text.secondary)
                        .lineLimit(2)
                        .multilineTextAlignment(.leading)
                    
                    Text("\(module.lessons.count) lessons")
                        .font(.system(size: 11, weight: .semibold, design: .rounded))
                        .foregroundColor(course.color.opacity(0.8))
                }
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(course.color.opacity(0.5))
            }
            .padding(16)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color.white.opacity(0.04))
                    .overlay(RoundedRectangle(cornerRadius: 16).stroke(course.color.opacity(0.12), lineWidth: 1))
            )
        }
        .buttonStyle(PlainButtonStyle())
    }
    
    // MARK: - Dragon Comment
    
    private var dragonCommentSection: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack(spacing: 8) {
                Text("🐉")
                    .font(.system(size: 20))
                Text("DRAGON SAYS")
                    .font(.system(size: 10, weight: .bold, design: .rounded))
                    .tracking(1.5)
                    .foregroundColor(Palette.accent.gold)
            }
            
            Text(course.dragonComment)
                .font(.system(size: 14, weight: .medium, design: .rounded))
                .foregroundColor(Palette.text.secondary)
                .italic()
                .lineSpacing(4)
        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 14)
                .fill(Palette.accent.gold.opacity(0.08))
                .overlay(RoundedRectangle(cornerRadius: 14).stroke(Palette.accent.gold.opacity(0.2), lineWidth: 1))
        )
    }
    
    // MARK: - Animations
    
    private func startAnimations() {
        withAnimation(.easeInOut(duration: 3).repeatForever(autoreverses: true)) {
            pulsePhase = 1
        }
        withAnimation(.linear(duration: 8).repeatForever(autoreverses: false)) {
            wavePhase = .pi * 2
        }
        withAnimation(.linear(duration: 20).repeatForever(autoreverses: false)) {
            particleOffset = 1000
        }
    }
}

// NOTE: AlexandriaWave is a phase-animatable variant (Core EnergyWave has no phase param)
private struct AlexandriaWave: Shape {
    var phase: CGFloat
    var animatableData: CGFloat {
        get { phase }
        set { phase = newValue }
    }
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let midY = rect.midY
        let amplitude: CGFloat = 30
        path.move(to: CGPoint(x: 0, y: midY))
        for x in stride(from: 0, to: rect.width, by: 2) {
            let relativeX = x / rect.width
            let y = midY + sin(relativeX * .pi * 4 + phase) * amplitude
            path.addLine(to: CGPoint(x: x, y: y))
        }
        return path
    }
}

// MARK: - Module Detail View

struct ACModuleDetailView: View {
    let module: ACModule
    let course: AlexandriaCourse
    @Environment(\.dismiss) var dismiss
    @State private var selectedLesson: ACLesson?
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.black.ignoresSafeArea()
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 20) {
                        // Module Header
                        VStack(spacing: 12) {
                            ZStack {
                                Circle()
                                    .fill(course.color.opacity(0.2))
                                    .frame(width: 80, height: 80)
                                Image(systemName: module.icon)
                                    .font(.system(size: 36, weight: .semibold))
                                    .foregroundColor(course.color)
                            }
                            
                            Text("Module \(module.number)")
                                .font(.system(size: 12, weight: .bold, design: .rounded))
                                .foregroundColor(course.color)
                            
                            Text(module.title)
                                .font(.system(size: 24, weight: .bold, design: .rounded))
                                .foregroundColor(Palette.text.primary)
                                .multilineTextAlignment(.center)
                            
                            Text(module.subtitle)
                                .font(.system(size: 15, weight: .medium))
                                .foregroundColor(Palette.text.secondary)
                                .multilineTextAlignment(.center)
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
                                ACLessonRow(lesson: lesson, number: index + 1, color: course.color) {
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
                        .foregroundColor(course.color)
                }
            }
            .sheet(item: $selectedLesson) { lesson in
                ACLessonView(lesson: lesson, color: course.color)
            }
        }
    }
}

// MARK: - Lesson Row

struct ACLessonRow: View {
    let lesson: ACLesson
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

struct ACLessonView: View {
    let lesson: ACLesson
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
                        
                        // Interactive element if present
                        if let interactive = lesson.interactiveElement {
                            interactiveView(interactive)
                        }
                        
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
                                .overlay(RoundedRectangle(cornerRadius: 12).stroke(color.opacity(0.3), lineWidth: 1))
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
                                .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.orange.opacity(0.25), lineWidth: 1))
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
    
    // MARK: - Interactive Elements
    
    @ViewBuilder
    private func interactiveView(_ element: InteractiveElement) -> some View {
        switch element {
        case .inversionTable(let rows):
            inversionTableView(rows)
        case .symbolDecoder(let elements):
            symbolDecoderView(elements)
        case .timeline(let events):
            timelineView(events)
        case .comparison(let left, let right, let rows):
            comparisonView(left: left, right: right, rows: rows)
        case .reflectionPrompt(let prompts):
            reflectionView(prompts)
        case .bilingualText(let spanish, let english):
            bilingualView(spanish: spanish, english: english)
        case .quiz:
            EmptyView() // Quiz handled separately
        }
    }
    
    private func inversionTableView(_ rows: [(told: String, truth: String)]) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(spacing: 8) {
                Image(systemName: "arrow.triangle.swap")
                    .foregroundColor(.red)
                Text("THE INVERSION")
                    .font(.system(size: 11, weight: .bold, design: .rounded))
                    .tracking(1.5)
                    .foregroundColor(.red)
            }
            
            VStack(spacing: 1) {
                HStack {
                    Text("WHAT THEY TOLD YOU")
                        .font(.system(size: 10, weight: .bold, design: .rounded))
                        .tracking(1)
                        .foregroundColor(.red.opacity(0.8))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text("WHAT IT ACTUALLY MEANS")
                        .font(.system(size: 10, weight: .bold, design: .rounded))
                        .tracking(1)
                        .foregroundColor(.green.opacity(0.8))
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(10)
                .background(Color.white.opacity(0.05))
                
                ForEach(Array(rows.enumerated()), id: \.offset) { _, row in
                    HStack(alignment: .top) {
                        Text(row.told)
                            .font(.system(size: 13, weight: .medium, design: .rounded))
                            .foregroundColor(Palette.text.secondary)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Text(row.truth)
                            .font(.system(size: 13, weight: .medium, design: .rounded))
                            .foregroundColor(Palette.text.primary)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .padding(10)
                    .background(Color.white.opacity(0.02))
                }
            }
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.red.opacity(0.2), lineWidth: 1))
        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 14)
                .fill(Color.red.opacity(0.06))
        )
    }
    
    private func symbolDecoderView(_ elements: [(symbol: String, fear: String, truth: String)]) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(spacing: 8) {
                Image(systemName: "eye.trianglebadge.exclamationmark")
                    .foregroundColor(color)
                Text("SYMBOL DECODER")
                    .font(.system(size: 11, weight: .bold, design: .rounded))
                    .tracking(1.5)
                    .foregroundColor(color)
            }
            
            Text("Tap each symbol to see the truth behind the fear")
                .font(.system(size: 12, weight: .medium))
                .foregroundColor(Palette.text.muted)
            
            ForEach(Array(elements.enumerated()), id: \.offset) { _, element in
                SymbolDecoderCard(symbol: element.symbol, fear: element.fear, truth: element.truth, color: color)
            }
        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 14)
                .fill(color.opacity(0.06))
        )
    }
    
    private func timelineView(_ events: [(year: String, event: String, significance: String)]) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(spacing: 8) {
                Image(systemName: "clock.arrow.circlepath")
                    .foregroundColor(Palette.primary.cyan)
                Text("TIMELINE")
                    .font(.system(size: 11, weight: .bold, design: .rounded))
                    .tracking(1.5)
                    .foregroundColor(Palette.primary.cyan)
            }
            
            ForEach(Array(events.enumerated()), id: \.offset) { index, event in
                HStack(alignment: .top, spacing: 14) {
                    VStack(spacing: 4) {
                        Circle()
                            .fill(Palette.primary.cyan)
                            .frame(width: 10, height: 10)
                        if index < events.count - 1 {
                            Rectangle()
                                .fill(Palette.primary.cyan.opacity(0.3))
                                .frame(width: 2, height: 40)
                        }
                    }
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text(event.year)
                            .font(.system(size: 12, weight: .bold, design: .monospaced))
                            .foregroundColor(Palette.primary.cyan)
                        Text(event.event)
                            .font(.system(size: 14, weight: .semibold, design: .rounded))
                            .foregroundColor(Palette.text.primary)
                        Text(event.significance)
                            .font(.system(size: 12, weight: .medium))
                            .foregroundColor(Palette.text.secondary)
                    }
                }
            }
        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 14)
                .fill(Palette.primary.cyan.opacity(0.06))
        )
    }
    
    private func comparisonView(left: String, right: String, rows: [(leftVal: String, rightVal: String)]) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Text(left)
                    .font(.system(size: 11, weight: .bold, design: .rounded))
                    .foregroundColor(.red.opacity(0.8))
                    .frame(maxWidth: .infinity)
                Text("VS")
                    .font(.system(size: 10, weight: .bold))
                    .foregroundColor(Palette.text.muted)
                Text(right)
                    .font(.system(size: 11, weight: .bold, design: .rounded))
                    .foregroundColor(.green.opacity(0.8))
                    .frame(maxWidth: .infinity)
            }
            .padding(10)
            .background(Color.white.opacity(0.05))
            .clipShape(RoundedRectangle(cornerRadius: 8))
            
            ForEach(Array(rows.enumerated()), id: \.offset) { _, row in
                HStack {
                    Text(row.leftVal)
                        .font(.system(size: 12, weight: .medium))
                        .foregroundColor(Palette.text.secondary)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text(row.rightVal)
                        .font(.system(size: 12, weight: .medium))
                        .foregroundColor(Palette.text.primary)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(.horizontal, 10)
            }
        }
        .padding(14)
        .background(RoundedRectangle(cornerRadius: 12).fill(Color.white.opacity(0.03)))
    }
    
    private func reflectionView(_ prompts: [String]) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(spacing: 8) {
                Image(systemName: "bubble.left.and.bubble.right")
                    .foregroundColor(Palette.primary.violet)
                Text("REFLECT")
                    .font(.system(size: 11, weight: .bold, design: .rounded))
                    .tracking(1.5)
                    .foregroundColor(Palette.primary.violet)
            }
            
            ForEach(prompts, id: \.self) { prompt in
                Text("→ " + prompt)
                    .font(.system(size: 14, weight: .medium, design: .rounded))
                    .foregroundColor(Palette.text.secondary)
                    .italic()
            }
        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 14)
                .fill(Palette.primary.violet.opacity(0.08))
                .overlay(RoundedRectangle(cornerRadius: 14).stroke(Palette.primary.violet.opacity(0.2), lineWidth: 1))
        )
    }
    
    private func bilingualView(spanish: String, english: String) -> some View {
        VStack(alignment: .leading, spacing: 14) {
            HStack(spacing: 8) {
                Text("🇪🇸")
                Text("ESPAÑOL")
                    .font(.system(size: 10, weight: .bold, design: .rounded))
                    .tracking(1.5)
                    .foregroundColor(Palette.accent.gold)
            }
            Text(spanish)
                .font(.system(size: 15, weight: .medium, design: .rounded))
                .foregroundColor(Palette.text.primary)
                .italic()
            
            Divider().background(Palette.text.muted)
            
            HStack(spacing: 8) {
                Text("🇺🇸")
                Text("ENGLISH")
                    .font(.system(size: 10, weight: .bold, design: .rounded))
                    .tracking(1.5)
                    .foregroundColor(Palette.primary.cyan)
            }
            Text(english)
                .font(.system(size: 15, weight: .medium, design: .rounded))
                .foregroundColor(Palette.text.secondary)
        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 14)
                .fill(Color.white.opacity(0.04))
                .overlay(RoundedRectangle(cornerRadius: 14).stroke(Palette.accent.gold.opacity(0.2), lineWidth: 1))
        )
    }
}

// MARK: - Symbol Decoder Card

struct SymbolDecoderCard: View {
    let symbol: String
    let fear: String
    let truth: String
    let color: Color
    @State private var isRevealed = false
    
    var body: some View {
        Button {
            withAnimation(.spring(response: 0.5)) {
                isRevealed.toggle()
            }
            HapticManager.shared.medium()
        } label: {
            VStack(alignment: .leading, spacing: 8) {
                Text(symbol)
                    .font(.system(size: 14, weight: .bold, design: .rounded))
                    .foregroundColor(color)
                
                if isRevealed {
                    HStack(alignment: .top, spacing: 12) {
                        VStack(alignment: .leading, spacing: 4) {
                            Text("FEAR:")
                                .font(.system(size: 9, weight: .bold))
                                .foregroundColor(.red.opacity(0.7))
                            Text(fear)
                                .font(.system(size: 12, weight: .medium))
                                .foregroundColor(Palette.text.muted)
                                .strikethrough(true, color: .red.opacity(0.5))
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text("TRUTH:")
                                .font(.system(size: 9, weight: .bold))
                                .foregroundColor(color)
                            Text(truth)
                                .font(.system(size: 12, weight: .semibold))
                                .foregroundColor(Palette.text.primary)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .transition(.asymmetric(
                        insertion: .opacity.combined(with: .move(edge: .top)),
                        removal: .opacity
                    ))
                } else {
                    Text("Tap to decode →")
                        .font(.system(size: 12, weight: .medium))
                        .foregroundColor(Palette.text.muted)
                }
            }
            .padding(12)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(isRevealed ? color.opacity(0.08) : Color.white.opacity(0.03))
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(color.opacity(isRevealed ? 0.3 : 0.1), lineWidth: 1))
            )
        }
        .buttonStyle(PlainButtonStyle())
    }
}
