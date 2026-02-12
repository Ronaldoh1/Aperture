// EtymologyCourseView.swift
// GodMode: The Word Is The Sword
// Interactive etymology learning with quizzes, practice, and sacred geometry rewards

import SwiftUI


// MARK: - Etymology Progress Manager

@MainActor
final class EtymologyProgressManager: ObservableObject {
    
    static let shared = EtymologyProgressManager()
    
    @Published var progress = EtymologyProgress()
    
    private let defaults = UserDefaults.standard
    private let progressKey = "etymology_course_progress"
    
    init() {
        loadProgress()
    }
    
    func completeLesson(_ lesson: EtymologyLesson) {
        progress.completeLesson(
            lesson.id,
            badge: lesson.rewardBadge,
            points: lesson.rewardPoints,
            geometry: lesson.sacredGeometry
        )
        
        // Award the SPECIFIC sacred geometry badge for this lesson
        // All users completing this lesson get the SAME geometry
        let _ = SacredBadgeManager.shared.awardBadge(
            forLesson: lesson.id,
            lessonTitle: lesson.title,
            courseId: "godmode_etymology"
        )
        
        // Track engagement
        CourseEngagementTracker.shared.updateProgress(
            courseId: "godmode_etymology",
            lessonIndex: getNextLessonIndex(),
            lessonId: lesson.id
        )
        
        saveProgress()
    }
    
    func completeQuiz(_ lessonId: String) {
        progress.completedQuizzes.insert(lessonId)
        saveProgress()
    }
    
    func isLessonCompleted(_ lessonId: String) -> Bool {
        progress.completedLessons.contains(lessonId)
    }
    
    func isQuizCompleted(_ lessonId: String) -> Bool {
        progress.completedQuizzes.contains(lessonId)
    }
    
    private func getNextLessonIndex() -> Int {
        progress.completedLessons.count
    }
    
    private func loadProgress() {
        guard let data = defaults.data(forKey: progressKey),
              let decoded = try? JSONDecoder().decode(EtymologyProgress.self, from: data) else {
            return
        }
        progress = decoded
    }
    
    private func saveProgress() {
        if let encoded = try? JSONEncoder().encode(progress) {
            defaults.set(encoded, forKey: progressKey)
        }
    }
    
    func resetProgress() {
        progress = EtymologyProgress()
        saveProgress()
    }
}


// MARK: - Main Course View

struct EtymologyCourseView: View {
    
    let course = EtymologyCourse.shared
    @StateObject private var progressManager = EtymologyProgressManager.shared
    @StateObject private var engagementTracker = CourseEngagementTracker.shared
    @State private var selectedLesson: EtymologyLesson?
    @State private var selectedModule: EtymologyModule?
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            ZStack {
                // Deep purple gradient
                LinearGradient(
                    colors: [
                        Color(hex: "#0A050F"),
                        Color(hex: "#1A1025"),
                        Color(hex: "#0A050F")
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
                    Text("WORD IS SWORD")
                        .font(.system(size: 12, weight: .black, design: .rounded))
                        .tracking(2)
                        .foregroundStyle(
                            LinearGradient(
                                colors: [Color(hex: "#9C27B0"), .white],
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                }
            }
            .sheet(item: $selectedLesson) { lesson in
                EtymologyLessonView(
                    lesson: lesson,
                    onComplete: {
                        progressManager.completeLesson(lesson)
                    }
                )
            }
            .onAppear {
                // Track course start
                let totalLessons = course.modules.flatMap { $0.lessons }.count
                engagementTracker.startCourse(
                    "godmode_etymology",
                    courseName: course.title,
                    totalLessons: totalLessons
                )
            }
        }
    }
    
    
    // MARK: - Hero
    
    private var courseHero: some View {
        VStack(spacing: 16) {
            
            // Word magic animation
            ZStack {
                // Glow
                Circle()
                    .fill(
                        RadialGradient(
                            colors: [
                                Color(hex: "#9C27B0").opacity(0.4),
                                Color(hex: "#7C4DFF").opacity(0.2),
                                Color.clear
                            ],
                            center: .center,
                            startRadius: 20,
                            endRadius: 80
                        )
                    )
                    .frame(width: 160, height: 160)
                
                Image(systemName: "text.book.closed.fill")
                    .font(.system(size: 50))
                    .foregroundStyle(
                        LinearGradient(
                            colors: [Color(hex: "#9C27B0"), Color(hex: "#E040FB")],
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )
            }
            
            VStack(spacing: 8) {
                Text(course.title)
                    .font(.title2.bold())
                    .foregroundColor(.white)
                
                Text(course.subtitle)
                    .font(.subheadline)
                    .foregroundColor(.white.opacity(0.7))
            }
            
            // Key message
            Text("\"In the beginning was the Word, and the Word was God.\"")
                .font(.caption.italic())
                .foregroundColor(Color(hex: "#9C27B0"))
                .multilineTextAlignment(.center)
        }
        .padding(.top, 20)
    }
    
    
    // MARK: - Progress Card
    
    private var progressCard: some View {
        let completedLessons = progressManager.progress.completedLessons.count
        let totalLessons = course.modules.flatMap { $0.lessons }.count
        let progressPercent = totalLessons > 0 ? Double(completedLessons) / Double(totalLessons) : 0
        
        return VStack(spacing: 16) {
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text("YOUR PROGRESS")
                        .font(.caption.bold())
                        .foregroundColor(.white.opacity(0.5))
                        .tracking(1)
                    
                    Text("\(completedLessons) / \(totalLessons) Lessons")
                        .font(.title3.bold())
                        .foregroundColor(.white)
                }
                
                Spacer()
                
                // Points
                VStack(alignment: .trailing, spacing: 4) {
                    Text("\(progressManager.progress.totalPoints)")
                        .font(.title2.bold())
                        .foregroundColor(Color(hex: "#9C27B0"))
                    
                    Text("POINTS")
                        .font(.caption2)
                        .foregroundColor(.white.opacity(0.5))
                }
            }
            
            // Progress bar
            GeometryReader { geo in
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 4)
                        .fill(Color.white.opacity(0.1))
                    
                    RoundedRectangle(cornerRadius: 4)
                        .fill(
                            LinearGradient(
                                colors: [Color(hex: "#9C27B0"), Color(hex: "#E040FB")],
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .frame(width: geo.size.width * progressPercent)
                }
            }
            .frame(height: 8)
            
            // Sacred geometries earned
            if !progressManager.progress.earnedGeometries.isEmpty {
                HStack {
                    Text("Sacred Geometries:")
                        .font(.caption)
                        .foregroundColor(.white.opacity(0.5))
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 8) {
                            ForEach(progressManager.progress.earnedGeometries, id: \.self) { shape in
                                Image(systemName: shape.icon)
                                    .font(.caption)
                                    .foregroundColor(Color(hex: "#FFD700"))
                            }
                        }
                    }
                }
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.white.opacity(0.05))
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color(hex: "#9C27B0").opacity(0.3), lineWidth: 1)
                )
        )
    }
    
    
    // MARK: - Module Card
    
    private func moduleCard(_ module: EtymologyModule, index: Int) -> some View {
        let isUnlocked = progressManager.progress.isModuleUnlocked(module.number)
        let moduleProgress = progressManager.progress.moduleProgress(module.id)
        let isComplete = moduleProgress >= 1.0
        
        return VStack(spacing: 0) {
            // Module header
            Button {
                if isUnlocked {
                    withAnimation(.spring(response: 0.3)) {
                        if selectedModule?.id == module.id {
                            selectedModule = nil
                        } else {
                            selectedModule = module
                        }
                    }
                }
            } label: {
                HStack(spacing: 16) {
                    // Module number
                    ZStack {
                        Circle()
                            .fill(isComplete ? Color(hex: "#9C27B0") : (isUnlocked ? Color.white.opacity(0.1) : Color.white.opacity(0.05)))
                            .frame(width: 44, height: 44)
                        
                        if isComplete {
                            Image(systemName: "checkmark")
                                .font(.headline.bold())
                                .foregroundColor(.white)
                        } else if isUnlocked {
                            Text("\(module.number)")
                                .font(.headline.bold())
                                .foregroundColor(.white)
                        } else {
                            Image(systemName: "lock.fill")
                                .font(.caption)
                                .foregroundColor(.white.opacity(0.3))
                        }
                    }
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text(module.title)
                            .font(.headline)
                            .foregroundColor(isUnlocked ? .white : .white.opacity(0.4))
                        
                        Text(module.subtitle)
                            .font(.caption)
                            .foregroundColor(.white.opacity(0.5))
                        
                        // Teaching style badge
                        HStack(spacing: 4) {
                            Image(systemName: module.icon)
                                .font(.caption2)
                            Text(module.teachingStyle.rawValue)
                                .font(.caption2)
                        }
                        .foregroundColor(Color(hex: "#9C27B0"))
                    }
                    
                    Spacer()
                    
                    // Duration and expand
                    VStack(alignment: .trailing, spacing: 4) {
                        Text(module.duration)
                            .font(.caption)
                            .foregroundColor(.white.opacity(0.5))
                        
                        if isUnlocked {
                            Image(systemName: selectedModule?.id == module.id ? "chevron.up" : "chevron.down")
                                .font(.caption)
                                .foregroundColor(.white.opacity(0.5))
                        }
                    }
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color.white.opacity(isUnlocked ? 0.05 : 0.02))
                )
            }
            .disabled(!isUnlocked)
            
            // Expanded lessons
            if selectedModule?.id == module.id && isUnlocked {
                VStack(spacing: 8) {
                    ForEach(module.lessons) { lesson in
                        lessonRow(lesson)
                    }
                }
                .padding(.top, 8)
                .transition(.opacity.combined(with: .move(edge: .top)))
            }
        }
    }
    
    
    // MARK: - Lesson Row
    
    private func lessonRow(_ lesson: EtymologyLesson) -> some View {
        let isCompleted = progressManager.isLessonCompleted(lesson.id)
        
        return Button {
            selectedLesson = lesson
        } label: {
            HStack(spacing: 12) {
                // Status
                ZStack {
                    Circle()
                        .fill(isCompleted ? Color(hex: "#9C27B0") : Color.white.opacity(0.1))
                        .frame(width: 32, height: 32)
                    
                    if isCompleted {
                        Image(systemName: "checkmark")
                            .font(.caption.bold())
                            .foregroundColor(.white)
                    } else {
                        Image(systemName: "play.fill")
                            .font(.caption2)
                            .foregroundColor(.white.opacity(0.6))
                    }
                }
                
                VStack(alignment: .leading, spacing: 2) {
                    Text(lesson.title)
                        .font(.subheadline)
                        .foregroundColor(.white)
                    
                    HStack(spacing: 8) {
                        Label(lesson.teachingMethod.rawValue, systemImage: "sparkles")
                            .font(.caption2)
                            .foregroundColor(.white.opacity(0.5))
                        
                        Text("+\(lesson.rewardPoints) pts")
                            .font(.caption2)
                            .foregroundColor(Color(hex: "#9C27B0"))
                    }
                }
                
                Spacer()
                
                // Sacred geometry preview
                Image(systemName: lesson.sacredGeometry.icon)
                    .font(.caption)
                    .foregroundColor(isCompleted ? Color(hex: "#FFD700") : .white.opacity(0.3))
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.white.opacity(0.03))
            )
        }
    }
}


// MARK: - Lesson Detail View

struct EtymologyLessonView: View {
    
    let lesson: EtymologyLesson
    let onComplete: () -> Void
    
    @StateObject private var progressManager = EtymologyProgressManager.shared
    @Environment(\.dismiss) private var dismiss
    
    @State private var currentTab = 0
    @State private var showQuiz = false
    @State private var quizAnswer: Int?
    @State private var showQuizResult = false
    @State private var showPractice = false
    @State private var lessonCompleted = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(hex: "#0a0a1a")
                    .ignoresSafeArea()
                
                TabView(selection: $currentTab) {
                    // Content tab
                    contentView.tag(0)
                    
                    // Quiz tab
                    quizView.tag(1)
                    
                    // Practice tab
                    practiceView.tag(2)
                    
                    // Complete tab
                    completeView.tag(3)
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
            }
            .navigationTitle(lesson.title)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button { dismiss() } label: {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundStyle(.white.opacity(0.6))
                    }
                }
            }
        }
    }
    
    
    // MARK: - Content View
    
    private var contentView: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                // Teaching method badge
                HStack {
                    Label(lesson.teachingMethod.rawValue, systemImage: "lightbulb.fill")
                        .font(.caption.bold())
                        .foregroundColor(Color(hex: "#9C27B0"))
                        .padding(.horizontal, 12)
                        .padding(.vertical, 6)
                        .background(Color(hex: "#9C27B0").opacity(0.2))
                        .cornerRadius(20)
                    
                    Spacer()
                }
                
                // Content
                Text(LocalizedStringKey(lesson.content))
                    .font(.body)
                    .foregroundColor(.white.opacity(0.9))
                    .lineSpacing(6)
                
                // Key insight
                VStack(alignment: .leading, spacing: 8) {
                    Text("🔑 KEY INSIGHT")
                        .font(.caption.bold())
                        .foregroundColor(Color(hex: "#FFD700"))
                        .tracking(1)
                    
                    Text(lesson.keyInsight)
                        .font(.subheadline)
                        .foregroundColor(.white.opacity(0.8))
                        .italic()
                }
                .padding()
                .background(Color(hex: "#FFD700").opacity(0.1))
                .cornerRadius(12)
                
                // Continue button
                Button {
                    withAnimation { currentTab = 1 }
                } label: {
                    HStack {
                        Text("Take the Quiz")
                        Image(systemName: "arrow.right")
                    }
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(
                        LinearGradient(
                            colors: [Color(hex: "#9C27B0"), Color(hex: "#E040FB")],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .cornerRadius(12)
                }
                
                Spacer(minLength: 50)
            }
            .padding()
        }
    }
    
    
    // MARK: - Quiz View
    
    private var quizView: some View {
        ScrollView {
            VStack(spacing: 24) {
                // Question
                VStack(spacing: 16) {
                    Image(systemName: "questionmark.circle.fill")
                        .font(.system(size: 40))
                        .foregroundColor(Color(hex: "#9C27B0"))
                    
                    Text(lesson.quiz.question)
                        .font(.title3.bold())
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                }
                .padding(.top, 20)
                
                // Options
                VStack(spacing: 12) {
                    ForEach(Array(lesson.quiz.options.enumerated()), id: \.offset) { index, option in
                        Button {
                            quizAnswer = index
                        } label: {
                            HStack {
                                Text(option)
                                    .font(.subheadline)
                                    .foregroundColor(.white)
                                    .multilineTextAlignment(.leading)
                                
                                Spacer()
                                
                                if quizAnswer == index {
                                    Image(systemName: showQuizResult ? (index == lesson.quiz.correctIndex ? "checkmark.circle.fill" : "xmark.circle.fill") : "circle.fill")
                                        .foregroundColor(showQuizResult ? (index == lesson.quiz.correctIndex ? .green : .red) : Color(hex: "#9C27B0"))
                                } else if showQuizResult && index == lesson.quiz.correctIndex {
                                    Image(systemName: "checkmark.circle.fill")
                                        .foregroundColor(.green)
                                } else {
                                    Image(systemName: "circle")
                                        .foregroundColor(.white.opacity(0.3))
                                }
                            }
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(quizAnswer == index ? Color(hex: "#9C27B0").opacity(0.2) : Color.white.opacity(0.05))
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 12)
                                            .stroke(quizAnswer == index ? Color(hex: "#9C27B0") : Color.clear, lineWidth: 1)
                                    )
                            )
                        }
                        .disabled(showQuizResult)
                    }
                }
                
                // Result
                if showQuizResult {
                    VStack(spacing: 12) {
                        Text(quizAnswer == lesson.quiz.correctIndex ? "✓ Correct!" : "✗ Not quite")
                            .font(.headline)
                            .foregroundColor(quizAnswer == lesson.quiz.correctIndex ? .green : .orange)
                        
                        Text(lesson.quiz.explanation)
                            .font(.subheadline)
                            .foregroundColor(.white.opacity(0.8))
                            .multilineTextAlignment(.center)
                    }
                    .padding()
                    .background(Color.white.opacity(0.05))
                    .cornerRadius(12)
                }
                
                // Submit / Continue
                if !showQuizResult {
                    Button {
                        withAnimation { showQuizResult = true }
                        progressManager.completeQuiz(lesson.id)
                    } label: {
                        Text("Submit Answer")
                            .fontWeight(.semibold)
                            .foregroundColor(quizAnswer != nil ? .black : .white.opacity(0.3))
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(quizAnswer != nil ? Color(hex: "#9C27B0") : Color.white.opacity(0.1))
                            .cornerRadius(12)
                    }
                    .disabled(quizAnswer == nil)
                } else {
                    Button {
                        withAnimation { currentTab = 2 }
                    } label: {
                        HStack {
                            Text("Practice Exercise")
                            Image(systemName: "arrow.right")
                        }
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color(hex: "#9C27B0"))
                        .cornerRadius(12)
                    }
                }
            }
            .padding()
        }
    }
    
    
    // MARK: - Practice View
    
    private var practiceView: some View {
        ScrollView {
            VStack(spacing: 24) {
                // Practice icon
                ZStack {
                    Circle()
                        .fill(Color(hex: "#9C27B0").opacity(0.2))
                        .frame(width: 100, height: 100)
                    
                    Image(systemName: "figure.mind.and.body")
                        .font(.system(size: 40))
                        .foregroundColor(Color(hex: "#9C27B0"))
                }
                
                VStack(spacing: 8) {
                    Text("PRACTICE EXERCISE")
                        .font(.caption.bold())
                        .foregroundColor(.white.opacity(0.5))
                        .tracking(1)
                    
                    Text(lesson.practiceExercise.title)
                        .font(.title3.bold())
                        .foregroundColor(.white)
                }
                
                // Instructions
                VStack(alignment: .leading, spacing: 12) {
                    Text("Instructions:")
                        .font(.subheadline.bold())
                        .foregroundColor(.white.opacity(0.7))
                    
                    Text(lesson.practiceExercise.instructions)
                        .font(.body)
                        .foregroundColor(.white.opacity(0.8))
                        .lineSpacing(4)
                }
                .padding()
                .background(Color.white.opacity(0.05))
                .cornerRadius(12)
                
                // Duration
                HStack {
                    Image(systemName: "clock.fill")
                        .foregroundColor(Color(hex: "#9C27B0"))
                    
                    Text("Duration: \(lesson.practiceExercise.duration)")
                        .font(.subheadline)
                        .foregroundColor(.white.opacity(0.7))
                }
                
                Spacer(minLength: 30)
                
                // Complete button
                Button {
                    withAnimation {
                        currentTab = 3
                        lessonCompleted = true
                        onComplete()
                    }
                } label: {
                    HStack {
                        Text("Complete Lesson")
                        Image(systemName: "checkmark.circle.fill")
                    }
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(
                        LinearGradient(
                            colors: [Color(hex: "#9C27B0"), Color(hex: "#E040FB")],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .cornerRadius(12)
                }
            }
            .padding()
        }
    }
    
    
    // MARK: - Complete View
    
    private var completeView: some View {
        VStack(spacing: 24) {
            Spacer()
            
            // Sacred geometry earned
            ZStack {
                Circle()
                    .fill(
                        RadialGradient(
                            colors: [
                                Color(hex: "#FFD700").opacity(0.4),
                                Color(hex: "#9C27B0").opacity(0.2),
                                Color.clear
                            ],
                            center: .center,
                            startRadius: 30,
                            endRadius: 100
                        )
                    )
                    .frame(width: 200, height: 200)
                
                SacredGeometryView(
                    shape: lesson.sacredGeometry,
                    lineColor: Color(hex: "#FFD700")
                )
                .frame(width: 80, height: 80)
            }
            
            VStack(spacing: 8) {
                Text("SACRED GEOMETRY UNLOCKED")
                    .font(.caption.bold())
                    .foregroundColor(Color(hex: "#FFD700"))
                    .tracking(1)
                
                Text(lesson.sacredGeometry.rawValue)
                    .font(.title2.bold())
                    .foregroundColor(.white)
            }
            
            // Gnostic meaning
            Text(lesson.sacredGeometry.gnosticMeaning)
                .font(.subheadline)
                .foregroundColor(.white.opacity(0.7))
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            
            // Badge and points
            HStack(spacing: 24) {
                VStack {
                    Text(lesson.rewardBadge)
                        .font(.caption.bold())
                        .foregroundColor(Color(hex: "#9C27B0"))
                    Text("Badge")
                        .font(.caption2)
                        .foregroundColor(.white.opacity(0.5))
                }
                
                VStack {
                    Text("+\(lesson.rewardPoints)")
                        .font(.title3.bold())
                        .foregroundColor(Color(hex: "#FFD700"))
                    Text("Points")
                        .font(.caption2)
                        .foregroundColor(.white.opacity(0.5))
                }
            }
            .padding()
            .background(Color.white.opacity(0.05))
            .cornerRadius(12)
            
            Spacer()
            
            Button {
                dismiss()
            } label: {
                Text("Continue")
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.white.opacity(0.1))
                    .cornerRadius(12)
            }
            .padding()
        }
    }
}


#Preview {
    EtymologyCourseView()
}
