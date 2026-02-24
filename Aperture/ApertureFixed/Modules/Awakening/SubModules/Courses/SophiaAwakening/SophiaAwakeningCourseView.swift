// SophiaAwakeningCourseView.swift
// Aperture
//
// The Pistis Sophia Course - Interactive Learning Experience

import SwiftUI


// MARK: - Main Course View

struct SophiaAwakeningCourseView: View {
    
    @Environment(\.dismiss) private var dismiss
    @State private var selectedModule: SophiaModule?
    @State private var showingLesson: SophiaLesson?
    @State private var completedLessons: Set<String> = []
    @State private var currentPracticeDay: Int = 1
    @State private var showingPracticeTracker = false
    @State private var animateIntro = false
    
    private let course = SophiaAwakeningCourse.self
    
    var body: some View {
        NavigationStack {
            ZStack {
                // Cosmic background
                LinearGradient(
                    colors: [
                        Color(hex: "#1a0a2e"),
                        Color(hex: "#16213e"),
                        Color(hex: "#0f0f23")
                    ],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
                
                // Animated particles
                SophiaParticleView()
                    .opacity(0.3)
                
                ScrollView {
                    VStack(spacing: 24) {
                        
                        // Header
                        courseHeader
                        
                        // Dragon Introduction
                        dragonIntroCard
                        
                        // 30-Day Practice Tracker
                        practiceTrackerCard
                        
                        // Modules List
                        modulesSection
                        
                        // Recommended Texts
                        recommendedTextsCard
                        
                        Spacer(minLength: 100)
                    }
                    .padding()
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .font(.title2)
                            .foregroundStyle(.white.opacity(0.7))
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showingPracticeTracker = true
                    } label: {
                        Image(systemName: "calendar.badge.clock")
                            .font(.title3)
                            .foregroundStyle(Color(hex: "#E040FB"))
                    }
                }
            }
            .sheet(item: $selectedModule) { module in
                SophiaModuleDetailView(
                    module: module,
                    completedLessons: $completedLessons
                )
            }
            .sheet(isPresented: $showingPracticeTracker) {
                SophiaPracticeTrackerView(currentDay: $currentPracticeDay)
            }
        }
        .onAppear {
            withAnimation(.easeOut(duration: 1.0)) {
                animateIntro = true
            }
        }
    }
    
    
    // MARK: - Course Header
    
    private var courseHeader: some View {
        VStack(spacing: 16) {
            
            // Icon with glow
            ZStack {
                Circle()
                    .fill(
                        RadialGradient(
                            colors: [
                                Color(hex: "#E040FB").opacity(0.4),
                                Color.clear
                            ],
                            center: .center,
                            startRadius: 20,
                            endRadius: 80
                        )
                    )
                    .frame(width: 160, height: 160)
                    .blur(radius: 20)
                
                Image(systemName: "heart.circle.fill")
                    .font(.system(size: 80))
                    .foregroundStyle(
                        LinearGradient(
                            colors: [Color(hex: "#E040FB"), Color(hex: "#7C4DFF")],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .shadow(color: Color(hex: "#E040FB").opacity(0.5), radius: 20)
            }
            .scaleEffect(animateIntro ? 1.0 : 0.5)
            .opacity(animateIntro ? 1.0 : 0)
            
            // Title
            Text("PISTIS SOPHIA")
                .font(.system(size: 32, weight: .bold, design: .serif))
                .foregroundStyle(
                    LinearGradient(
                        colors: [.white, Color(hex: "#E040FB")],
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
            
            Text("The Divine Feminine Awakening")
                .font(.title3)
                .foregroundColor(.white.opacity(0.7))
            
            // Stats
            HStack(spacing: 24) {
                SophiaStatBadge(icon: "book.fill", value: "13", label: "Modules")
                SophiaStatBadge(icon: "doc.text.fill", value: "52", label: "Lessons")
                SophiaStatBadge(icon: "clock.fill", value: "8h", label: "Content")
            }
            .padding(.top, 8)
            
            // Progress
            let progress = Double(completedLessons.count) / 52.0
            VStack(spacing: 8) {
                ProgressView(value: progress)
                    .tint(Color(hex: "#E040FB"))
                
                Text("\(Int(progress * 100))% Complete")
                    .font(.caption)
                    .foregroundColor(.white.opacity(0.6))
            }
            .padding(.horizontal)
            .padding(.top, 8)
        }
        .padding(.top, 20)
    }
    
    
    // MARK: - Dragon Introduction
    
    private var dragonIntroCard: some View {
        VStack(alignment: .leading, spacing: 16) {
            
            HStack {
                Image(systemName: "flame.fill")
                    .foregroundColor(.orange)
                Text("Dragon's Introduction")
                    .font(.headline)
                    .foregroundColor(.white)
                Spacer()
            }
            
            Text(SophiaAwakeningCourse.dragonIntro)
                .font(.body)
                .foregroundColor(.white.opacity(0.9))
                .lineSpacing(6)
            
            // CTA
            Button {
                if let firstModule = SophiaAwakeningCourse.allModules.first {
                    selectedModule = firstModule
                }
            } label: {
                HStack {
                    Text("Begin the Journey")
                        .fontWeight(.semibold)
                    Image(systemName: "arrow.right")
                }
                .foregroundColor(.black)
                .padding()
                .frame(maxWidth: .infinity)
                .background(
                    LinearGradient(
                        colors: [Color(hex: "#E040FB"), Color(hex: "#7C4DFF")],
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
                .cornerRadius(12)
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.white.opacity(0.05))
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color(hex: "#E040FB").opacity(0.3), lineWidth: 1)
                )
        )
    }
    
    
    // MARK: - Practice Tracker Card
    
    private var practiceTrackerCard: some View {
        VStack(alignment: .leading, spacing: 16) {
            
            HStack {
                Image(systemName: "calendar.badge.clock")
                    .foregroundColor(Color(hex: "#4CAF50"))
                Text("30-Day Practice Protocol")
                    .font(.headline)
                    .foregroundColor(.white)
                Spacer()
                
                Text("Day \(currentPracticeDay)/30")
                    .font(.caption)
                    .foregroundColor(Color(hex: "#4CAF50"))
                    .padding(.horizontal, 12)
                    .padding(.vertical, 6)
                    .background(Color(hex: "#4CAF50").opacity(0.2))
                    .cornerRadius(20)
            }
            
            // Week Progress
            HStack(spacing: 4) {
                ForEach(1...30, id: \.self) { day in
                    Circle()
                        .fill(day <= currentPracticeDay ? Color(hex: "#4CAF50") : Color.white.opacity(0.2))
                        .frame(width: 8, height: 8)
                }
            }
            
            // Current Week Focus
            if let currentWeek = SophiaPracticeTrajectory.weeks.first(where: { 
                let weekStart = ($0.number - 1) * 7 + 1
                let weekEnd = $0.number * 7
                return currentPracticeDay >= weekStart && currentPracticeDay <= weekEnd
            }) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Week \(currentWeek.number): \(currentWeek.title)")
                        .font(.subheadline.bold())
                        .foregroundColor(Color(hex: "#4CAF50"))
                    
                    Text(currentWeek.focus)
                        .font(.caption)
                        .foregroundColor(.white.opacity(0.7))
                    
                    Text("\(currentWeek.duration) min daily")
                        .font(.caption2)
                        .foregroundColor(.white.opacity(0.5))
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color(hex: "#4CAF50").opacity(0.1))
                .cornerRadius(12)
            }
            
            Button {
                showingPracticeTracker = true
            } label: {
                HStack {
                    Image(systemName: "play.circle.fill")
                    Text("Start Today's Practice")
                }
                .font(.subheadline.bold())
                .foregroundColor(Color(hex: "#4CAF50"))
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.white.opacity(0.05))
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color(hex: "#4CAF50").opacity(0.3), lineWidth: 1)
                )
        )
    }
    
    
    // MARK: - Modules Section
    
    private var modulesSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            
            Text("COURSE MODULES")
                .font(.caption.bold())
                .foregroundColor(.white.opacity(0.5))
                .tracking(2)
            
            ForEach(SophiaAwakeningCourse.allModules) { module in
                SophiaModuleCard(
                    module: module,
                    completedCount: completedLessons.filter { id in
                        module.lessons.contains { $0.id == id }
                    }.count
                ) {
                    selectedModule = module
                }
            }
        }
    }
    
    
    // MARK: - Recommended Texts Card
    
    private var recommendedTextsCard: some View {
        VStack(alignment: .leading, spacing: 16) {
            
            HStack {
                Image(systemName: "books.vertical.fill")
                    .foregroundColor(Color(hex: "#795548"))
                Text("Essential Texts")
                    .font(.headline)
                    .foregroundColor(.white)
                Spacer()
            }
            
            VStack(spacing: 12) {
                TextLink(title: "Pistis Sophia", subtitle: "The complete Gnostic text")
                TextLink(title: "Apocryphon of John", subtitle: "Essential creation myth")
                TextLink(title: "Gospel of Thomas", subtitle: "114 sayings of Jesus")
                TextLink(title: "Gospel of Mary", subtitle: "Mary Magdalene's teaching")
                TextLink(title: "Gospel of Philip", subtitle: "Spiritual marriage concepts")
            }
            
            Text("Available free at gnosis.org and sacred-texts.com")
                .font(.caption)
                .foregroundColor(.white.opacity(0.5))
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.white.opacity(0.05))
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color(hex: "#795548").opacity(0.3), lineWidth: 1)
                )
        )
    }
}


// MARK: - Module Card

struct SophiaModuleCard: View {
    
    let module: SophiaModule
    let completedCount: Int
    let onTap: () -> Void
    
    var body: some View {
        Button(action: onTap) {
            HStack(spacing: 16) {
                
                // Module Number & Icon
                ZStack {
                    Circle()
                        .fill(module.color.opacity(0.2))
                        .frame(width: 56, height: 56)
                    
                    Image(systemName: module.icon)
                        .font(.title2)
                        .foregroundColor(module.color)
                }
                
                // Content
                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        Text("Module \(module.number)")
                            .font(.caption)
                            .foregroundColor(module.color)
                        
                        Spacer()
                        
                        Text("\(completedCount)/\(module.lessonCount)")
                            .font(.caption)
                            .foregroundColor(.white.opacity(0.5))
                    }
                    
                    Text(module.title)
                        .font(.headline)
                        .foregroundColor(.white)
                    
                    Text(module.subtitle)
                        .font(.caption)
                        .foregroundColor(.white.opacity(0.6))
                }
                
                Image(systemName: "chevron.right")
                    .foregroundColor(.white.opacity(0.3))
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color.white.opacity(0.05))
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(
                                completedCount == module.lessonCount 
                                    ? module.color.opacity(0.5) 
                                    : Color.clear,
                                lineWidth: 1
                            )
                    )
            )
        }
    }
}


// MARK: - Stat Badge

struct SophiaStatBadge: View {
    
    let icon: String
    let value: String
    let label: String
    
    var body: some View {
        VStack(spacing: 4) {
            HStack(spacing: 4) {
                Image(systemName: icon)
                    .font(.caption)
                Text(value)
                    .font(.headline.bold())
            }
            .foregroundColor(.white)
            
            Text(label)
                .font(.caption2)
                .foregroundColor(.white.opacity(0.5))
        }
    }
}


// MARK: - Text Link

struct TextLink: View {
    
    let title: String
    let subtitle: String
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(.subheadline.bold())
                    .foregroundColor(.white)
                Text(subtitle)
                    .font(.caption)
                    .foregroundColor(.white.opacity(0.5))
            }
            Spacer()
            Image(systemName: "arrow.up.right")
                .font(.caption)
                .foregroundColor(.white.opacity(0.3))
        }
        .padding(.vertical, 8)
    }
}


// MARK: - Module Detail View

struct SophiaModuleDetailView: View {
    
    let module: SophiaModule
    @Binding var completedLessons: Set<String>
    @Environment(\.dismiss) private var dismiss
    @State private var selectedLesson: SophiaLesson?
    
    var body: some View {
        NavigationStack {
            ZStack {
                // Background
                LinearGradient(
                    colors: [
                        Color(hex: "#1a0a2e"),
                        Color(hex: "#16213e"),
                        Color(hex: "#0f0f23")
                    ],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 24) {
                        
                        // Module Header
                        VStack(alignment: .leading, spacing: 12) {
                            
                            HStack {
                                Image(systemName: module.icon)
                                    .font(.title)
                                    .foregroundColor(module.color)
                                
                                Text("Module \(module.number)")
                                    .font(.caption.bold())
                                    .foregroundColor(module.color)
                            }
                            
                            Text(module.title)
                                .font(.largeTitle.bold())
                                .foregroundColor(.white)
                            
                            Text(module.subtitle)
                                .font(.title3)
                                .foregroundColor(.white.opacity(0.7))
                            
                            Text(module.description)
                                .font(.body)
                                .foregroundColor(.white.opacity(0.8))
                                .lineSpacing(4)
                                .padding(.top, 8)
                        }
                        .padding()
                        
                        // Lessons
                        VStack(alignment: .leading, spacing: 12) {
                            Text("LESSONS")
                                .font(.caption.bold())
                                .foregroundColor(.white.opacity(0.5))
                                .tracking(2)
                                .padding(.horizontal)
                            
                            ForEach(Array(module.lessons.enumerated()), id: \.element.id) { index, lesson in
                                LessonRow(
                                    lesson: lesson,
                                    number: index + 1,
                                    isCompleted: completedLessons.contains(lesson.id),
                                    moduleColor: module.color
                                ) {
                                    selectedLesson = lesson
                                }
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
                    .foregroundColor(module.color)
                }
            }
            .sheet(item: $selectedLesson) { lesson in
                SophiaLessonView(
                    lesson: lesson,
                    moduleColor: module.color,
                    isCompleted: completedLessons.contains(lesson.id)
                ) {
                    completedLessons.insert(lesson.id)
                }
            }
        }
    }
}


// MARK: - Lesson Row

struct LessonRow: View {
    
    let lesson: SophiaLesson
    let number: Int
    let isCompleted: Bool
    let moduleColor: Color
    let onTap: () -> Void
    
    var body: some View {
        Button(action: onTap) {
            HStack(spacing: 16) {
                
                // Number/Checkmark
                ZStack {
                    Circle()
                        .fill(isCompleted ? moduleColor : Color.white.opacity(0.1))
                        .frame(width: 40, height: 40)
                    
                    if isCompleted {
                        Image(systemName: "checkmark")
                            .font(.body.bold())
                            .foregroundColor(.white)
                    } else {
                        Text("\(number)")
                            .font(.body.bold())
                            .foregroundColor(.white.opacity(0.6))
                    }
                }
                
                // Content
                VStack(alignment: .leading, spacing: 4) {
                    Text(lesson.title)
                        .font(.headline)
                        .foregroundColor(.white)
                    
                    HStack(spacing: 12) {
                        if lesson.hasPractice {
                            Label(lesson.practice?.durationText ?? "", systemImage: "timer")
                                .font(.caption)
                                .foregroundColor(moduleColor)
                        }
                    }
                }
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .foregroundColor(.white.opacity(0.3))
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.white.opacity(0.05))
            )
            .padding(.horizontal)
        }
    }
}


// MARK: - Lesson View

struct SophiaLessonView: View {
    
    let lesson: SophiaLesson
    let moduleColor: Color
    let isCompleted: Bool
    let onComplete: () -> Void
    
    @Environment(\.dismiss) private var dismiss
    @State private var showingPractice = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                // Background
                Color(hex: "#0f0f23")
                    .ignoresSafeArea()
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 24) {
                        
                        // Title
                        Text(lesson.title)
                            .font(.title.bold())
                            .foregroundColor(.white)
                        
                        // Content
                        Text(lesson.content)
                            .font(.body)
                            .foregroundColor(.white.opacity(0.9))
                            .lineSpacing(8)
                        
                        // Key Insight
                        VStack(alignment: .leading, spacing: 12) {
                            HStack {
                                Image(systemName: "lightbulb.fill")
                                    .foregroundColor(.yellow)
                                Text("Key Insight")
                                    .font(.headline)
                                    .foregroundColor(.white)
                            }
                            
                            Text(lesson.keyInsight)
                                .font(.body)
                                .foregroundColor(.white.opacity(0.9))
                                .italic()
                        }
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color.yellow.opacity(0.1))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(Color.yellow.opacity(0.3), lineWidth: 1)
                                )
                        )
                        
                        // Dragon Comment
                        VStack(alignment: .leading, spacing: 12) {
                            HStack {
                                Image(systemName: "flame.fill")
                                    .foregroundColor(.orange)
                                Text("Dragon Says")
                                    .font(.headline)
                                    .foregroundColor(.white)
                            }
                            
                            Text(lesson.dragonComment)
                                .font(.body)
                                .foregroundColor(.white.opacity(0.9))
                        }
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color.orange.opacity(0.1))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(Color.orange.opacity(0.3), lineWidth: 1)
                                )
                        )
                        
                        // Practice
                        if let practice = lesson.practice {
                            VStack(alignment: .leading, spacing: 12) {
                                HStack {
                                    Image(systemName: "figure.mind.and.body")
                                        .foregroundColor(moduleColor)
                                    Text(practice.title)
                                        .font(.headline)
                                        .foregroundColor(.white)
                                    Spacer()
                                    Text(practice.durationText)
                                        .font(.caption)
                                        .foregroundColor(moduleColor)
                                        .padding(.horizontal, 12)
                                        .padding(.vertical, 6)
                                        .background(moduleColor.opacity(0.2))
                                        .cornerRadius(20)
                                }
                                
                                Text(practice.instructions)
                                    .font(.body)
                                    .foregroundColor(.white.opacity(0.9))
                                    .lineSpacing(6)
                                
                                if practice.duration > 0 {
                                    Button {
                                        showingPractice = true
                                    } label: {
                                        HStack {
                                            Image(systemName: "play.circle.fill")
                                            Text("Start \(practice.duration) min Practice")
                                        }
                                        .foregroundColor(.white)
                                        .padding()
                                        .frame(maxWidth: .infinity)
                                        .background(moduleColor)
                                        .cornerRadius(12)
                                    }
                                }
                            }
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(moduleColor.opacity(0.1))
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 12)
                                            .stroke(moduleColor.opacity(0.3), lineWidth: 1)
                                    )
                            )
                        }
                        
                        // Complete Button
                        if !isCompleted {
                            Button {
                                onComplete()
                                dismiss()
                            } label: {
                                HStack {
                                    Image(systemName: "checkmark.circle.fill")
                                    Text("Mark Complete")
                                }
                                .foregroundColor(.black)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(
                                    LinearGradient(
                                        colors: [Color(hex: "#4CAF50"), Color(hex: "#8BC34A")],
                                        startPoint: .leading,
                                        endPoint: .trailing
                                    )
                                )
                                .cornerRadius(12)
                            }
                        }
                        
                        Spacer(minLength: 100)
                    }
                    .padding()
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        dismiss()
                    }
                    .foregroundColor(moduleColor)
                }
            }
            .sheet(isPresented: $showingPractice) {
                if let practice = lesson.practice {
                    SophiaPracticeTimerView(practice: practice, color: moduleColor)
                }
            }
        }
    }
}


// MARK: - Practice Timer View

struct SophiaPracticeTimerView: View {
    
    let practice: SophiaPractice
    let color: Color
    
    @Environment(\.dismiss) private var dismiss
    @State private var timeRemaining: Int
    @State private var isRunning = false
    @State private var timer: Timer?
    
    init(practice: SophiaPractice, color: Color) {
        self.practice = practice
        self.color = color
        self._timeRemaining = State(initialValue: practice.duration * 60)
    }
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            VStack(spacing: 32) {
                
                Text(practice.title)
                    .font(.title2.bold())
                    .foregroundColor(.white)
                
                // Timer Circle
                ZStack {
                    Circle()
                        .stroke(color.opacity(0.2), lineWidth: 12)
                        .frame(width: 200, height: 200)
                    
                    Circle()
                        .trim(from: 0, to: CGFloat(timeRemaining) / CGFloat(practice.duration * 60))
                        .stroke(color, style: StrokeStyle(lineWidth: 12, lineCap: .round))
                        .frame(width: 200, height: 200)
                        .rotationEffect(.degrees(-90))
                        .animation(.linear(duration: 1), value: timeRemaining)
                    
                    VStack {
                        Text(timeString)
                            .font(.system(size: 48, weight: .thin, design: .monospaced))
                            .foregroundColor(.white)
                        
                        Text("remaining")
                            .font(.caption)
                            .foregroundColor(.white.opacity(0.5))
                    }
                }
                
                // Instructions
                Text(practice.instructions)
                    .font(.body)
                    .foregroundColor(.white.opacity(0.8))
                    .multilineTextAlignment(.center)
                    .lineSpacing(6)
                    .padding()
                
                // Controls
                HStack(spacing: 32) {
                    Button {
                        if isRunning {
                            pauseTimer()
                        } else {
                            startTimer()
                        }
                    } label: {
                        Image(systemName: isRunning ? "pause.fill" : "play.fill")
                            .font(.title)
                            .foregroundColor(.white)
                            .frame(width: 64, height: 64)
                            .background(color)
                            .clipShape(Circle())
                    }
                    
                    Button {
                        resetTimer()
                    } label: {
                        Image(systemName: "arrow.counterclockwise")
                            .font(.title2)
                            .foregroundColor(.white.opacity(0.6))
                    }
                }
                
                Button("Close") {
                    dismiss()
                }
                .foregroundColor(.white.opacity(0.5))
                .padding(.top, 32)
            }
            .padding()
        }
        .onDisappear {
            timer?.invalidate()
        }
    }
    
    private var timeString: String {
        let minutes = timeRemaining / 60
        let seconds = timeRemaining % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
    private func startTimer() {
        isRunning = true
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            if timeRemaining > 0 {
                timeRemaining -= 1
            } else {
                timer?.invalidate()
                isRunning = false
                // Could add completion haptic/sound here
            }
        }
    }
    
    private func pauseTimer() {
        isRunning = false
        timer?.invalidate()
    }
    
    private func resetTimer() {
        timer?.invalidate()
        isRunning = false
        timeRemaining = practice.duration * 60
    }
}


// MARK: - Practice Tracker View

struct SophiaPracticeTrackerView: View {
    
    @Binding var currentDay: Int
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(hex: "#0f0f23").ignoresSafeArea()
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 24) {
                        
                        // Header
                        VStack(alignment: .leading, spacing: 8) {
                            Text("30-Day Practice Protocol")
                                .font(.title.bold())
                                .foregroundColor(.white)
                            
                            Text("The foundation of Sophia awakening")
                                .foregroundColor(.white.opacity(0.6))
                        }
                        .padding()
                        
                        // Week Cards
                        ForEach(SophiaPracticeTrajectory.weeks) { week in
                            WeekCard(
                                week: week,
                                currentDay: currentDay,
                                onComplete: {
                                    if currentDay < 30 {
                                        currentDay += 1
                                    }
                                }
                            )
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
                    .foregroundColor(Color(hex: "#4CAF50"))
                }
            }
        }
    }
}


// MARK: - Week Card

struct WeekCard: View {
    
    let week: SophiaWeek
    let currentDay: Int
    let onComplete: () -> Void
    
    private var weekStart: Int { (week.number - 1) * 7 + 1 }
    private var weekEnd: Int { min(week.number * 7, 30) }
    private var isCurrentWeek: Bool { currentDay >= weekStart && currentDay <= weekEnd }
    private var isCompleted: Bool { currentDay > weekEnd }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            
            HStack {
                Text("Week \(week.number)")
                    .font(.headline)
                    .foregroundColor(isCurrentWeek ? Color(hex: "#4CAF50") : .white)
                
                Text("•")
                    .foregroundColor(.white.opacity(0.3))
                
                Text(week.title)
                    .foregroundColor(.white.opacity(0.7))
                
                Spacer()
                
                if isCompleted {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(Color(hex: "#4CAF50"))
                }
            }
            
            Text(week.focus)
                .font(.subheadline.bold())
                .foregroundColor(.white)
            
            Text("\(week.duration) minutes daily")
                .font(.caption)
                .foregroundColor(.white.opacity(0.5))
            
            Text(week.instructions)
                .font(.caption)
                .foregroundColor(.white.opacity(0.7))
                .lineSpacing(4)
            
            // Day Progress
            HStack(spacing: 6) {
                ForEach(weekStart...weekEnd, id: \.self) { day in
                    Circle()
                        .fill(day <= currentDay ? Color(hex: "#4CAF50") : Color.white.opacity(0.2))
                        .frame(width: 24, height: 24)
                        .overlay(
                            Text("\(day)")
                                .font(.system(size: 10, weight: .bold))
                                .foregroundColor(day <= currentDay ? .white : .white.opacity(0.4))
                        )
                }
            }
            
            if isCurrentWeek {
                Button(action: onComplete) {
                    HStack {
                        Image(systemName: "checkmark")
                        Text("Complete Day \(currentDay)")
                    }
                    .font(.subheadline.bold())
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color(hex: "#4CAF50"))
                    .cornerRadius(12)
                }
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(isCurrentWeek ? Color(hex: "#4CAF50").opacity(0.1) : Color.white.opacity(0.05))
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(isCurrentWeek ? Color(hex: "#4CAF50").opacity(0.3) : Color.clear, lineWidth: 1)
                )
        )
        .padding(.horizontal)
    }
}


// MARK: - Sophia Particle View

struct SophiaParticleView: View {
    
    @State private var particles: [SophiaParticle] = []
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ForEach(particles) { particle in
                    Circle()
                        .fill(particle.color)
                        .frame(width: particle.size, height: particle.size)
                        .position(particle.position)
                        .blur(radius: particle.size / 3)
                }
            }
            .onAppear {
                generateParticles(in: geometry.size)
            }
        }
    }
    
    private func generateParticles(in size: CGSize) {
        particles = (0..<30).map { _ in
            SophiaParticle(
                position: CGPoint(
                    x: CGFloat.random(in: 0...size.width),
                    y: CGFloat.random(in: 0...size.height)
                ),
                size: CGFloat.random(in: 2...8),
                color: [
                    Color(hex: "#E040FB").opacity(0.3),
                    Color(hex: "#7C4DFF").opacity(0.3),
                    Color.white.opacity(0.2)
                ].randomElement()!
            )
        }
    }
}


struct SophiaParticle: Identifiable {
    let id = UUID()
    let position: CGPoint
    let size: CGFloat
    let color: Color
}


// MARK: - Preview

#Preview {
    SophiaAwakeningCourseView()
}
