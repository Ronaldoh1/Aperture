// GodModeCourseView.swift
// The Esoteric Curriculum Interface
// Progressive unlocking through 7 gates

import SwiftUI

// MARK: - Main Course View

struct GodModeCourseView: View {
    
    let course = GodModeCourse.shared
    @State private var progress = GodModeProgressManager.shared.progress
    @State private var selectedLesson: GodModeLesson?
    @State private var selectedModule: GodModeModule?
    @State private var showingLessonComplete = false
    @State private var justCompletedLesson: GodModeLesson?
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            ZStack {
                // Deep black-gold gradient
                LinearGradient(
                    colors: [
                        Color(hex: "#0A0805"),
                        Color(hex: "#1A1510"),
                        Color(hex: "#0A0805")
                    ],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 28) {
                        
                        // Hero
                        courseHero
                        
                        // Progress Overview
                        progressCard
                        
                        // Modules List
                        ForEach(Array(course.modules.enumerated()), id: \.element.id) { index, module in
                            moduleCard(module, index: index)
                        }
                        
                        Spacer(minLength: 100)
                    }
                    .padding(.horizontal, 20)
                }
            }
            .navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button { dismiss() } label: {
                        Image(systemName: "xmark.circle.fill")
                            .font(.title2)
                            .foregroundStyle(.white.opacity(0.6))
                    }
                }
                
                ToolbarItem(placement: .principal) {
                    Text("GODMODE")
                        .font(.system(size: 14, weight: .black, design: .rounded))
                        .tracking(3)
                        .foregroundStyle(
                            LinearGradient(
                                colors: [Color(hex: "#FFD700"), .white],
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                }
            }
            .sheet(item: $selectedLesson) { lesson in
                GodModeLessonDetailView(
                    lesson: lesson,
                    progress: $progress,
                    onComplete: { completedLesson in
                        justCompletedLesson = completedLesson
                        showingLessonComplete = true
                    }
                )
            }
            .sheet(isPresented: $showingLessonComplete) {
                if let lesson = justCompletedLesson {
                    LessonCompleteView(lesson: lesson)
                }
            }
        }
    }
    
    // MARK: - Hero
    
    private var courseHero: some View {
        VStack(spacing: 16) {
            
            // Animated spark
            GodModeSparkAnimation()
                .frame(height: 120)
            
            Text("The Esoteric Path")
                .font(.system(size: 26, weight: .bold, design: .rounded))
                .foregroundColor(.white)
            
            Text("7 Gates • Progressive Unlocking")
                .font(.system(size: 14))
                .foregroundColor(.white.opacity(0.6))
        }
        .padding(.top, 20)
    }
    
    // MARK: - Progress Card
    
    private var progressCard: some View {
        VStack(spacing: 16) {
            
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text("YOUR JOURNEY")
                        .font(.system(size: 10, weight: .bold))
                        .foregroundColor(Color(hex: "#FFD700"))
                        .tracking(1)
                    
                    Text("\(progress.completedLessons.count) of \(totalLessons) lessons")
                        .font(.system(size: 14, weight: .medium))
                        .foregroundColor(.white.opacity(0.8))
                }
                
                Spacer()
                
                // Points
                VStack(alignment: .trailing, spacing: 2) {
                    Text("\(progress.totalPoints)")
                        .font(.system(size: 24, weight: .black, design: .rounded))
                        .foregroundColor(Color(hex: "#FFD700"))
                    Text("POINTS")
                        .font(.system(size: 9, weight: .bold))
                        .foregroundColor(.white.opacity(0.5))
                        .tracking(1)
                }
            }
            
            // Progress bar
            GeometryReader { geo in
                ZStack(alignment: .leading) {
                    Capsule()
                        .fill(Color.white.opacity(0.1))
                        .frame(height: 8)
                    
                    Capsule()
                        .fill(
                            LinearGradient(
                                colors: [Color(hex: "#FFD700"), Color(hex: "#FF8C00")],
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .frame(width: geo.size.width * overallProgress, height: 8)
                }
            }
            .frame(height: 8)
            
            // Badges earned
            if !progress.earnedBadges.isEmpty {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 8) {
                        ForEach(Array(progress.earnedBadges).sorted(), id: \.self) { badge in
                            Text(badge)
                                .font(.system(size: 9, weight: .semibold))
                                .foregroundColor(Color(hex: "#FFD700"))
                                .padding(.horizontal, 8)
                                .padding(.vertical, 4)
                                .background(
                                    Capsule()
                                        .fill(Color(hex: "#FFD700").opacity(0.15))
                                )
                        }
                    }
                }
            }
        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.white.opacity(0.05))
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color(hex: "#FFD700").opacity(0.2), lineWidth: 1)
                )
        )
    }
    
    // MARK: - Module Card
    
    private func moduleCard(_ module: GodModeModule, index: Int) -> some View {
        let isUnlocked = progress.isModuleUnlocked(module.number)
        let moduleProgress = progress.moduleProgress(module.id)
        let isComplete = moduleProgress >= 1.0
        
        return VStack(alignment: .leading, spacing: 16) {
            
            // Header
            HStack {
                // Gate number
                ZStack {
                    Circle()
                        .fill(isUnlocked ? Color(hex: "#FFD700").opacity(0.2) : Color.white.opacity(0.05))
                        .frame(width: 50, height: 50)
                    
                    if isComplete {
                        Image(systemName: "checkmark")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(.green)
                    } else if isUnlocked {
                        Text("\(module.number)")
                            .font(.system(size: 20, weight: .black))
                            .foregroundColor(Color(hex: "#FFD700"))
                    } else {
                        Image(systemName: "lock.fill")
                            .font(.system(size: 18))
                            .foregroundColor(.white.opacity(0.3))
                    }
                }
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("GATE \(module.number)")
                        .font(.system(size: 10, weight: .bold))
                        .foregroundColor(isUnlocked ? Color(hex: "#FFD700") : .white.opacity(0.3))
                        .tracking(1)
                    
                    Text(module.title)
                        .font(.system(size: 17, weight: .bold))
                        .foregroundColor(isUnlocked ? .white : .white.opacity(0.4))
                    
                    Text(module.subtitle)
                        .font(.system(size: 12))
                        .foregroundColor(.white.opacity(0.5))
                }
                
                Spacer()
                
                // Module icon
                Image(systemName: module.icon)
                    .font(.system(size: 24))
                    .foregroundColor(isUnlocked ? Color(hex: "#FFD700").opacity(0.6) : .white.opacity(0.2))
            }
            
            // Progress bar for module
            if isUnlocked && !isComplete {
                GeometryReader { geo in
                    ZStack(alignment: .leading) {
                        Capsule()
                            .fill(Color.white.opacity(0.1))
                            .frame(height: 4)
                        
                        Capsule()
                            .fill(Color(hex: "#FFD700"))
                            .frame(width: geo.size.width * moduleProgress, height: 4)
                    }
                }
                .frame(height: 4)
            }
            
            // Lessons
            if isUnlocked {
                ForEach(module.lessons) { lesson in
                    lessonRow(lesson)
                }
            } else {
                // Locked message
                HStack {
                    Image(systemName: "info.circle")
                        .font(.system(size: 12))
                    Text("Complete Gate \(module.number - 1) to unlock")
                        .font(.system(size: 12))
                }
                .foregroundColor(.white.opacity(0.4))
                .padding(.leading, 4)
            }
        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(isUnlocked ? Color.white.opacity(0.03) : Color.black.opacity(0.3))
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(
                            isComplete ? Color.green.opacity(0.3) :
                            isUnlocked ? Color(hex: "#FFD700").opacity(0.15) :
                            Color.white.opacity(0.05),
                            lineWidth: 1
                        )
                )
        )
    }
    
    private func lessonRow(_ lesson: GodModeLesson) -> some View {
        let isComplete = progress.completedLessons.contains(lesson.id)
        
        return Button {
            selectedLesson = lesson
        } label: {
            HStack(spacing: 12) {
                // Completion indicator
                ZStack {
                    Circle()
                        .fill(isComplete ? Color.green.opacity(0.2) : Color.white.opacity(0.05))
                        .frame(width: 28, height: 28)
                    
                    if isComplete {
                        Image(systemName: "checkmark")
                            .font(.system(size: 12, weight: .bold))
                            .foregroundColor(.green)
                    } else {
                        Circle()
                            .fill(Color(hex: "#FFD700").opacity(0.5))
                            .frame(width: 8, height: 8)
                    }
                }
                
                VStack(alignment: .leading, spacing: 2) {
                    Text(lesson.title)
                        .font(.system(size: 14, weight: .medium))
                        .foregroundColor(isComplete ? .white.opacity(0.6) : .white)
                        .lineLimit(1)
                    
                    HStack(spacing: 8) {
                        Text("+\(lesson.rewardPoints) pts")
                            .font(.system(size: 10, weight: .semibold))
                            .foregroundColor(Color(hex: "#FFD700").opacity(0.7))
                        
                        if isComplete {
                            Text("✓ \(lesson.rewardBadge)")
                                .font(.system(size: 9))
                                .foregroundColor(.green.opacity(0.7))
                        }
                    }
                }
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .font(.system(size: 12, weight: .semibold))
                    .foregroundColor(.white.opacity(0.3))
            }
            .padding(.vertical, 10)
            .padding(.horizontal, 12)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.white.opacity(isComplete ? 0.02 : 0.05))
            )
        }
    }
    
    // MARK: - Helpers
    
    private var totalLessons: Int {
        course.modules.flatMap { $0.lessons }.count
    }
    
    private var overallProgress: Double {
        Double(progress.completedLessons.count) / Double(max(totalLessons, 1))
    }
}

// MARK: - Lesson Detail View

struct GodModeLessonDetailView: View {
    
    let lesson: GodModeLesson
    @Binding var progress: GodModeProgress
    var onComplete: (GodModeLesson) -> Void
    @Environment(\.dismiss) private var dismiss
    @State private var hasScrolledToBottom = false
    
    var isComplete: Bool {
        progress.completedLessons.contains(lesson.id)
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(hex: "#0A0805").ignoresSafeArea()
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 24) {
                        
                        // Title
                        Text(lesson.title)
                            .font(.system(size: 24, weight: .bold))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                            .padding(.top, 20)
                        
                        // Content
                        Text(LocalizedStringKey(lesson.content))
                            .font(.system(size: 15))
                            .foregroundColor(.white.opacity(0.9))
                            .lineSpacing(6)
                            .padding(.horizontal, 20)
                        
                        // Key Insight
                        keyInsightCard
                        
                        // Reward preview
                        if !isComplete {
                            rewardPreview
                        }
                        
                        // Complete button
                        if !isComplete {
                            completeButton
                        } else {
                            completedBadge
                        }
                        
                        Spacer(minLength: 100)
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Done") { dismiss() }
                        .foregroundColor(Color(hex: "#FFD700"))
                }
            }
        }
    }
    
    private var keyInsightCard: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(systemName: "lightbulb.fill")
                    .foregroundColor(Color(hex: "#FFD700"))
                Text("KEY INSIGHT")
                    .font(.system(size: 11, weight: .bold))
                    .foregroundColor(Color(hex: "#FFD700"))
                    .tracking(1)
            }
            
            Text(lesson.keyInsight)
                .font(.system(size: 15, weight: .medium))
                .foregroundColor(.white)
                .italic()
        }
        .padding(16)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color(hex: "#FFD700").opacity(0.1))
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color(hex: "#FFD700").opacity(0.3), lineWidth: 1)
                )
        )
        .padding(.horizontal, 20)
    }
    
    private var rewardPreview: some View {
        HStack(spacing: 20) {
            VStack(spacing: 4) {
                Image(systemName: "star.fill")
                    .font(.system(size: 20))
                    .foregroundColor(Color(hex: "#FFD700"))
                Text("+\(lesson.rewardPoints)")
                    .font(.system(size: 14, weight: .bold))
                    .foregroundColor(Color(hex: "#FFD700"))
                Text("Points")
                    .font(.system(size: 10))
                    .foregroundColor(.white.opacity(0.5))
            }
            
            Rectangle()
                .fill(Color.white.opacity(0.1))
                .frame(width: 1, height: 40)
            
            VStack(spacing: 4) {
                Image(systemName: "shield.fill")
                    .font(.system(size: 20))
                    .foregroundColor(Color(hex: "#FFD700"))
                Text(lesson.rewardBadge)
                    .font(.system(size: 12, weight: .bold))
                    .foregroundColor(.white)
                Text("Badge")
                    .font(.system(size: 10))
                    .foregroundColor(.white.opacity(0.5))
            }
        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.white.opacity(0.05))
        )
        .padding(.horizontal, 20)
    }
    
    private var completeButton: some View {
        Button {
            HapticManager.shared.heavy()
            progress.completeLesson(lesson.id, badge: lesson.rewardBadge, points: lesson.rewardPoints)
            GodModeProgressManager.shared.save(progress)
            onComplete(lesson)
            dismiss()
        } label: {
            HStack(spacing: 8) {
                Image(systemName: "checkmark.circle.fill")
                Text("Complete Lesson")
                    .font(.system(size: 16, weight: .bold))
            }
            .foregroundColor(.black)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 16)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(
                        LinearGradient(
                            colors: [Color(hex: "#FFD700"), Color(hex: "#FF8C00")],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
            )
        }
        .padding(.horizontal, 20)
    }
    
    private var completedBadge: some View {
        HStack(spacing: 8) {
            Image(systemName: "checkmark.seal.fill")
            Text("Lesson Complete")
                .font(.system(size: 14, weight: .semibold))
            Text("•")
            Text(lesson.rewardBadge)
                .font(.system(size: 12))
        }
        .foregroundColor(.green)
        .padding(.vertical, 12)
        .padding(.horizontal, 20)
        .background(
            Capsule()
                .fill(Color.green.opacity(0.15))
        )
    }
}

// MARK: - Lesson Complete Celebration

struct LessonCompleteView: View {
    
    let lesson: GodModeLesson
    @Environment(\.dismiss) private var dismiss
    @State private var showContent = false
    @State private var sparkles: [SparkleParticle] = []
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.95).ignoresSafeArea()
            
            // Sparkles
            ForEach(sparkles) { sparkle in
                Circle()
                    .fill(Color(hex: "#FFD700"))
                    .frame(width: sparkle.size, height: sparkle.size)
                    .offset(x: sparkle.x, y: sparkle.y)
                    .opacity(sparkle.opacity)
            }
            
            VStack(spacing: 24) {
                Spacer()
                
                if showContent {
                    // Badge
                    ZStack {
                        Circle()
                            .fill(
                                RadialGradient(
                                    colors: [Color(hex: "#FFD700").opacity(0.4), Color.clear],
                                    center: .center,
                                    startRadius: 20,
                                    endRadius: 80
                                )
                            )
                            .frame(width: 160, height: 160)
                        
                        Image(systemName: "shield.fill")
                            .font(.system(size: 60))
                            .foregroundColor(Color(hex: "#FFD700"))
                    }
                    .transition(.scale.combined(with: .opacity))
                    
                    Text("LESSON COMPLETE")
                        .font(.system(size: 12, weight: .bold))
                        .foregroundColor(Color(hex: "#FFD700"))
                        .tracking(2)
                    
                    Text(lesson.rewardBadge)
                        .font(.system(size: 24, weight: .bold))
                        .foregroundColor(.white)
                    
                    Text("+\(lesson.rewardPoints) points earned")
                        .font(.system(size: 14))
                        .foregroundColor(.white.opacity(0.6))
                }
                
                Spacer()
                
                Button {
                    dismiss()
                } label: {
                    Text("Continue")
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 16)
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color(hex: "#FFD700"))
                        )
                }
                .padding(.horizontal, 40)
                .padding(.bottom, 40)
            }
        }
        .onAppear {
            generateSparkles()
            withAnimation(.spring(response: 0.6, dampingFraction: 0.7)) {
                showContent = true
            }
            HapticManager.shared.success()
        }
    }
    
    private func generateSparkles() {
        for i in 0..<20 {
            let angle = Double.random(in: 0...(2 * .pi))
            let distance = CGFloat.random(in: 50...150)
            sparkles.append(SparkleParticle(
                id: i,
                x: cos(angle) * distance,
                y: sin(angle) * distance,
                size: CGFloat.random(in: 3...8),
                opacity: Double.random(in: 0.3...0.8)
            ))
        }
    }
}

struct SparkleParticle: Identifiable {
    let id: Int
    let x: CGFloat
    let y: CGFloat
    let size: CGFloat
    let opacity: Double
}

// MARK: - GodMode Spark Animation

struct GodModeSparkAnimation: View {
    @State private var innerPulse = false
    @State private var outerPulse = false
    @State private var rotation: Double = 0
    
    var body: some View {
        ZStack {
            // Outer glow
            Circle()
                .fill(
                    RadialGradient(
                        colors: [Color(hex: "#FFD700").opacity(outerPulse ? 0.3 : 0.1), Color.clear],
                        center: .center,
                        startRadius: 20,
                        endRadius: outerPulse ? 60 : 50
                    )
                )
                .frame(width: 120, height: 120)
            
            // Rotating rays
            ForEach(0..<8, id: \.self) { i in
                Rectangle()
                    .fill(Color(hex: "#FFD700").opacity(0.3))
                    .frame(width: 2, height: 30)
                    .offset(y: -35)
                    .rotationEffect(.degrees(Double(i) * 45 + rotation))
            }
            
            // Inner spark
            ZStack {
                Circle()
                    .fill(Color(hex: "#FFD700").opacity(innerPulse ? 0.8 : 0.5))
                    .frame(width: innerPulse ? 35 : 30, height: innerPulse ? 35 : 30)
                
                Image(systemName: "sparkle")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(.white)
            }
        }
        .onAppear {
            withAnimation(.easeInOut(duration: 1.5).repeatForever(autoreverses: true)) {
                innerPulse = true
                outerPulse = true
            }
            withAnimation(.linear(duration: 20).repeatForever(autoreverses: false)) {
                rotation = 360
            }
        }
    }
}

// MARK: - Progress Manager

class GodModeProgressManager {
    static let shared = GodModeProgressManager()
    
    private let key = "godmode_progress"
    
    var progress: GodModeProgress {
        load()
    }
    
    func load() -> GodModeProgress {
        guard let data = UserDefaults.standard.data(forKey: key),
              let progress = try? JSONDecoder().decode(GodModeProgress.self, from: data) else {
            return GodModeProgress()
        }
        return progress
    }
    
    func save(_ progress: GodModeProgress) {
        if let data = try? JSONEncoder().encode(progress) {
            UserDefaults.standard.set(data, forKey: key)
        }
    }
    
    func reset() {
        UserDefaults.standard.removeObject(forKey: key)
    }
}

#Preview {
    GodModeCourseView()
}
