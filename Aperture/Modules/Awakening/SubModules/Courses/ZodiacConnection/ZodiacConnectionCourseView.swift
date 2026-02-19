// ZodiacConnectionCourseView.swift
// Aperture - SunFlow Consciousness Platform

import SwiftUI

// MARK: - Main Course View

struct ZodiacConnectionCourseView: View {
    
    @Environment(\.dismiss) private var dismiss
    @State private var selectedModule: ZodiacModule?
    @State private var showingLesson: ZodiacLesson?
    @State private var completedLessons: Set<String> = []
    @State private var expandedModules: Set<String> = []
    
    private let course = ZodiacConnectionCourse.shared
    
    var body: some View {
        NavigationStack {
            ZStack {
                // Background
                LinearGradient(
                    colors: [
                        Color(hex: "#0D0D1A"),
                        Color(hex: "#1A0A2E"),
                        Color(hex: "#0D0D1A")
                    ],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
                
                // Animated zodiac wheel background
                ZodiacWheelBackground()
                    .opacity(0.1)
                
                ScrollView {
                    VStack(spacing: 24) {
                        // Header
                        courseHeader
                        
                        // Progress Overview
                        progressCard
                        
                        // Modules List
                        modulesSection
                        
                        Spacer(minLength: 100)
                    }
                    .padding(.horizontal)
                }
            }
            .navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: { dismiss() }) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.white)
                    }
                }
            }
            .sheet(item: $showingLesson) { lesson in
                ZodiacLessonView(lesson: lesson, onComplete: {
                    completedLessons.insert(lesson.id)
                    saveLessonProgress(lesson.id)
                })
            }
            .onAppear {
                loadProgress()
            }
        }
    }
    
    // MARK: - Course Header
    
    private var courseHeader: some View {
        VStack(spacing: 16) {
            // Icon
            ZStack {
                Circle()
                    .fill(
                        RadialGradient(
                            colors: [
                                Color(hex: "#FFD700").opacity(0.3),
                                Color(hex: "#FFD700").opacity(0.0)
                            ],
                            center: .center,
                            startRadius: 20,
                            endRadius: 60
                        )
                    )
                    .frame(width: 120, height: 120)
                
                Image(systemName: "sparkles")
                    .font(.system(size: 44))
                    .foregroundStyle(
                        LinearGradient(
                            colors: [Color(hex: "#FFD700"), Color(hex: "#FFA500")],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
            }
            
            // Title
            Text(course.title)
                .font(.title.bold())
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
            
            Text(course.subtitle)
                .font(.headline)
                .foregroundColor(Color(hex: "#FFD700"))
            
            // Description
            Text(course.description)
                .font(.subheadline)
                .foregroundColor(.white.opacity(0.8))
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            
            // Meta info
            HStack(spacing: 20) {
                Label("\(course.estimatedHours) hours", systemImage: "clock")
                Label(course.difficulty, systemImage: "chart.bar")
                Label("12 modules", systemImage: "square.stack.3d.up")
            }
            .font(.caption)
            .foregroundColor(.white.opacity(0.6))
        }
        .padding(.top, 20)
    }
    
    // MARK: - Progress Card
    
    private var progressCard: some View {
        let totalLessons = course.modules.flatMap { $0.lessons }.count
        let completedCount = completedLessons.count
        let progress = totalLessons > 0 ? Double(completedCount) / Double(totalLessons) : 0
        
        return VStack(spacing: 12) {
            HStack {
                Text("Your Progress")
                    .font(.headline)
                    .foregroundColor(.white)
                
                Spacer()
                
                Text("\(completedCount)/\(totalLessons) lessons")
                    .font(.subheadline)
                    .foregroundColor(Color(hex: "#FFD700"))
            }
            
            GeometryReader { geo in
                ZStack(alignment: .leading) {
                    Capsule()
                        .fill(Color.white.opacity(0.1))
                    
                    Capsule()
                        .fill(
                            LinearGradient(
                                colors: [Color(hex: "#FFD700"), Color(hex: "#FFA500")],
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .frame(width: geo.size.width * progress)
                }
            }
            .frame(height: 8)
            
            if completedCount == totalLessons && totalLessons > 0 {
                HStack {
                    Image(systemName: "checkmark.seal.fill")
                        .foregroundColor(Color(hex: "#00FF88"))
                    Text("Course Complete!")
                        .foregroundColor(Color(hex: "#00FF88"))
                }
                .font(.subheadline.bold())
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.white.opacity(0.05))
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color(hex: "#FFD700").opacity(0.3), lineWidth: 1)
                )
        )
    }
    
    // MARK: - Modules Section
    
    private var modulesSection: some View {
        VStack(spacing: 16) {
            ForEach(course.modules) { module in
                ZodiacModuleCard(
                    module: module,
                    isExpanded: expandedModules.contains(module.id),
                    completedLessons: completedLessons,
                    onToggle: {
                        withAnimation(.spring(response: 0.3)) {
                            if expandedModules.contains(module.id) {
                                expandedModules.remove(module.id)
                            } else {
                                expandedModules.insert(module.id)
                            }
                        }
                    },
                    onSelectLesson: { lesson in
                        showingLesson = lesson
                    }
                )
            }
        }
    }
    
    // MARK: - Progress Persistence
    
    private func loadProgress() {
        if let saved = UserDefaults.standard.stringArray(forKey: "ZodiacCourse_Completed") {
            completedLessons = Set(saved)
        }
    }
    
    private func saveLessonProgress(_ lessonId: String) {
        UserDefaults.standard.set(Array(completedLessons), forKey: "ZodiacCourse_Completed")
    }
}

// MARK: - Module Card

struct ZodiacModuleCard: View {
    let module: ZodiacModule
    let isExpanded: Bool
    let completedLessons: Set<String>
    let onToggle: () -> Void
    let onSelectLesson: (ZodiacLesson) -> Void
    
    private var moduleProgress: Double {
        let completed = module.lessons.filter { completedLessons.contains($0.id) }.count
        return module.lessons.isEmpty ? 0 : Double(completed) / Double(module.lessons.count)
    }
    
    private var isModuleComplete: Bool {
        module.lessons.allSatisfy { completedLessons.contains($0.id) }
    }
    
    var body: some View {
        VStack(spacing: 0) {
            // Header
            Button(action: onToggle) {
                HStack(spacing: 12) {
                    // Module number badge
                    ZStack {
                        Circle()
                            .fill(
                                isModuleComplete
                                    ? Color(hex: "#00FF88")
                                    : Color(hex: "#FFD700")
                            )
                            .frame(width: 36, height: 36)
                        
                        if isModuleComplete {
                            Image(systemName: "checkmark")
                                .font(.headline.bold())
                                .foregroundColor(.black)
                        } else {
                            Text("\(module.number)")
                                .font(.headline.bold())
                                .foregroundColor(.black)
                        }
                    }
                    
                    VStack(alignment: .leading, spacing: 2) {
                        Text(module.title)
                            .font(.headline)
                            .foregroundColor(.white)
                        
                        Text(module.subtitle)
                            .font(.caption)
                            .foregroundColor(.white.opacity(0.6))
                    }
                    
                    Spacer()
                    
                    // Progress ring
                    ZStack {
                        Circle()
                            .stroke(Color.white.opacity(0.1), lineWidth: 3)
                        
                        Circle()
                            .trim(from: 0, to: moduleProgress)
                            .stroke(Color(hex: "#FFD700"), style: StrokeStyle(lineWidth: 3, lineCap: .round))
                            .rotationEffect(.degrees(-90))
                    }
                    .frame(width: 28, height: 28)
                    
                    Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                        .foregroundColor(.white.opacity(0.6))
                        .font(.caption)
                }
                .padding()
            }
            .buttonStyle(.plain)
            
            // Lessons (expanded)
            if isExpanded {
                VStack(spacing: 8) {
                    ForEach(module.lessons) { lesson in
                        ZodiacLessonRow(
                            lesson: lesson,
                            isCompleted: completedLessons.contains(lesson.id),
                            onTap: { onSelectLesson(lesson) }
                        )
                    }
                }
                .padding(.horizontal)
                .padding(.bottom, 16)
            }
        }
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.white.opacity(0.05))
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(
                            isModuleComplete
                                ? Color(hex: "#00FF88").opacity(0.3)
                                : Color.white.opacity(0.1),
                            lineWidth: 1
                        )
                )
        )
    }
}

// MARK: - Lesson Row

struct ZodiacLessonRow: View {
    let lesson: ZodiacLesson
    let isCompleted: Bool
    let onTap: () -> Void
    
    var body: some View {
        Button(action: onTap) {
            HStack(spacing: 12) {
                Image(systemName: isCompleted ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(isCompleted ? Color(hex: "#00FF88") : .white.opacity(0.4))
                
                Text(lesson.title)
                    .font(.subheadline)
                    .foregroundColor(isCompleted ? .white.opacity(0.6) : .white)
                    .strikethrough(isCompleted, color: .white.opacity(0.4))
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .font(.caption)
                    .foregroundColor(.white.opacity(0.4))
            }
            .padding(.vertical, 10)
            .padding(.horizontal, 12)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.white.opacity(isCompleted ? 0.02 : 0.05))
            )
        }
        .buttonStyle(.plain)
    }
}

// MARK: - Lesson View

struct ZodiacLessonView: View {
    @Environment(\.dismiss) private var dismiss
    let lesson: ZodiacLesson
    let onComplete: () -> Void
    
    @State private var showKeyPoints = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(hex: "#0D0D1A")
                    .ignoresSafeArea()
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 24) {
                        // Title
                        Text(lesson.title)
                            .font(.title2.bold())
                            .foregroundColor(.white)
                        
                        // Content
                        Text(lesson.content)
                            .font(.body)
                            .foregroundColor(.white.opacity(0.9))
                            .lineSpacing(6)
                        
                        // Key Points Toggle
                        Button(action: {
                            withAnimation(.spring(response: 0.3)) {
                                showKeyPoints.toggle()
                            }
                        }) {
                            HStack {
                                Image(systemName: "key.fill")
                                    .foregroundColor(Color(hex: "#FFD700"))
                                
                                Text("Key Points")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                
                                Spacer()
                                
                                Image(systemName: showKeyPoints ? "chevron.up" : "chevron.down")
                                    .foregroundColor(.white.opacity(0.6))
                            }
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(Color.white.opacity(0.05))
                            )
                        }
                        
                        if showKeyPoints {
                            VStack(alignment: .leading, spacing: 12) {
                                ForEach(lesson.keyPoints, id: \.self) { point in
                                    HStack(alignment: .top, spacing: 10) {
                                        Image(systemName: "star.fill")
                                            .font(.caption)
                                            .foregroundColor(Color(hex: "#FFD700"))
                                            .padding(.top, 4)
                                        
                                        Text(point)
                                            .font(.subheadline)
                                            .foregroundColor(.white.opacity(0.85))
                                    }
                                }
                            }
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(Color(hex: "#FFD700").opacity(0.1))
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 12)
                                            .stroke(Color(hex: "#FFD700").opacity(0.3), lineWidth: 1)
                                    )
                            )
                            .transition(.opacity.combined(with: .move(edge: .top)))
                        }
                        
                        // Complete Button
                        Button(action: {
                            onComplete()
                            dismiss()
                        }) {
                            HStack {
                                Image(systemName: "checkmark.circle.fill")
                                Text("Mark as Complete")
                            }
                            .font(.headline)
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(
                                LinearGradient(
                                    colors: [Color(hex: "#FFD700"), Color(hex: "#FFA500")],
                                    startPoint: .leading,
                                    endPoint: .trailing
                                )
                            )
                            .cornerRadius(14)
                        }
                        .padding(.top, 16)
                        
                        Spacer(minLength: 50)
                    }
                    .padding()
                }
            }
            .navigationTitle("Lesson")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") { dismiss() }
                        .foregroundColor(Color(hex: "#FFD700"))
                }
            }
        }
    }
}

// MARK: - Zodiac Wheel Background

struct ZodiacWheelBackground: View {
    @State private var rotation: Double = 0
    
    var body: some View {
        GeometryReader { geo in
            let size = min(geo.size.width, geo.size.height) * 1.5
            
            ZStack {
                // Outer wheel
                ForEach(0..<12, id: \.self) { i in
                    let angle = Double(i) * 30.0
                    
                    ZodiacSymbolView(index: i)
                        .font(.system(size: 24))
                        .foregroundColor(Color(hex: "#FFD700").opacity(0.4))
                        .rotationEffect(.degrees(-rotation - angle))
                        .offset(x: cos(angle * .pi / 180) * (size * 0.4),
                                y: sin(angle * .pi / 180) * (size * 0.4))
                }
                
                // Inner ring
                Circle()
                    .stroke(Color(hex: "#FFD700").opacity(0.2), lineWidth: 1)
                    .frame(width: size * 0.6, height: size * 0.6)
                
                // Outer ring
                Circle()
                    .stroke(Color(hex: "#FFD700").opacity(0.15), lineWidth: 1)
                    .frame(width: size * 0.85, height: size * 0.85)
            }
            .rotationEffect(.degrees(rotation))
            .position(x: geo.size.width / 2, y: geo.size.height * 0.3)
        }
        .onAppear {
            withAnimation(.linear(duration: 120).repeatForever(autoreverses: false)) {
                rotation = 360
            }
        }
    }
}

struct ZodiacSymbolView: View {
    let index: Int
    
    private let symbols = ["♈", "♉", "♊", "♋", "♌", "♍", "♎", "♏", "♐", "♑", "♒", "♓"]
    
    var body: some View {
        Text(symbols[index])
    }
}

// MARK: - Preview

#Preview {
    ZodiacConnectionCourseView()
}
