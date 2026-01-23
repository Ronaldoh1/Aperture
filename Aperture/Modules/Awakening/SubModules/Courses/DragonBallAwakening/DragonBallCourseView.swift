// DragonBallCourseView.swift
// Dragon Ball Awakening Course - Full Interactive View

import SwiftUI

struct DragonBallCourseView: View {
    
    let course = DragonBallCourse.shared
    @State private var selectedModule: DBModule?
    @State private var selectedLesson: DBLesson?
    @State private var completedLessons: Set<String> = []
    @State private var expandedModules: Set<String> = []
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        
        ZStack {
            
            // Sacred geometry background - 7 chakras for 7 Dragon Balls
            SacredGeometryBackground(style: .chakra(3), opacity: 0.12) // Solar plexus - power
            
            // Dragon Ball stars overlay
            dragonBallStars
            
            ScrollView(showsIndicators: false) {
                
                VStack(spacing: 24) {
                    
                    // Header
                    courseHeader
                    
                    // Progress
                    progressSection
                    
                    // Transformation Levels
                    transformationLevels
                    
                    // Modules
                    modulesSection
                    
                    Spacer(minLength: 100)
                    
                }
                .padding(.horizontal, 20)
                .padding(.top, 60)
                
            }
            
            // Custom nav bar
            VStack {
                customNavBar
                Spacer()
            }
            
        }
        .navigationBarHidden(true)
        .sheet(item: $selectedLesson) { lesson in
            DBLessonDetailView(lesson: lesson, onComplete: {
                completedLessons.insert(lesson.id)
            })
        }
        .onAppear {
            loadProgress()
        }
        
    }
    
    // MARK: - Dragon Ball Stars Overlay
    
    private var dragonBallStars: some View {
        GeometryReader { geo in
            ForEach(1...7, id: \.self) { star in
                ZStack {
                    // Glow
                    Circle()
                        .fill(
                            RadialGradient(
                                colors: [Color.orange.opacity(0.3), Color.clear],
                                center: .center,
                                startRadius: 5,
                                endRadius: 20
                            )
                        )
                        .frame(width: 40, height: 40)
                    
                    // Ball
                    Circle()
                        .fill(
                            LinearGradient(
                                colors: [Color.orange, Color.yellow],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .frame(width: 20, height: 20)
                    
                    // Stars
                    Text(String(repeating: "★", count: min(star, 4)))
                        .font(.system(size: star > 4 ? 4 : 5))
                        .foregroundColor(.red.opacity(0.8))
                }
                .position(
                    x: CGFloat(star * 47 + 20) .truncatingRemainder(dividingBy: geo.size.width - 40) + 20,
                    y: CGFloat(star * 73 + 50) .truncatingRemainder(dividingBy: geo.size.height * 0.3) + 50
                )
                .opacity(0.6)
            }
        }
    }
    
    // MARK: - Custom Nav Bar
    
    private var customNavBar: some View {
        HStack {
            Button(action: { dismiss() }) {
                Image(systemName: "chevron.left")
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundColor(.white)
                    .frame(width: 44, height: 44)
                    .background(Color.white.opacity(0.1))
                    .clipShape(Circle())
            }
            
            Spacer()
            
            // Power level badge
            HStack(spacing: 4) {
                Image(systemName: "bolt.fill")
                    .font(.system(size: 12))
                Text("\(completedLessons.count * 1000)")
            }
            .font(.system(size: 14, weight: .bold, design: .rounded))
            .foregroundColor(course.color)
            .padding(.horizontal, 12)
            .padding(.vertical, 6)
            .background(course.color.opacity(0.15))
            .clipShape(Capsule())
        }
        .padding(.horizontal, 20)
        .padding(.top, 10)
    }
    
    // MARK: - Header
    
    private var courseHeader: some View {
        
        VStack(spacing: 16) {
            
            // Dragon Ball icon
            ZStack {
                // Ki aura
                ForEach(0..<3) { i in
                    Circle()
                        .stroke(course.color.opacity(0.3 - Double(i) * 0.1), lineWidth: 2)
                        .frame(width: CGFloat(80 + i * 20), height: CGFloat(80 + i * 20))
                }
                
                // Main icon
                Image(systemName: course.icon)
                    .font(.system(size: 40, weight: .semibold))
                    .foregroundColor(course.color)
            }
            
            VStack(spacing: 8) {
                Text(course.title)
                    .font(.system(size: 24, weight: .black, design: .rounded))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                
                Text(course.subtitle)
                    .font(.system(size: 14, weight: .medium, design: .rounded))
                    .foregroundColor(Palette.text.secondary)
                    .multilineTextAlignment(.center)
                
                // Dragon wisdom
                Text("\"Push beyond your limits. That's what makes a Saiyan a Saiyan.\"")
                    .font(.system(size: 12, weight: .medium, design: .rounded))
                    .foregroundColor(course.color)
                    .italic()
                    .padding(.top, 4)
            }
            
        }
        
    }
    
    // MARK: - Progress Section
    
    private var progressSection: some View {
        
        VStack(spacing: 12) {
            
            HStack {
                Text("POWER LEVEL")
                    .font(.system(size: 12, weight: .bold, design: .rounded))
                    .foregroundColor(Palette.text.muted)
                    .tracking(2)
                Spacer()
                Text("\(Int(progressPercentage * 100))%")
                    .font(.system(size: 14, weight: .bold, design: .rounded))
                    .foregroundColor(course.color)
            }
            
            // Ki bar
            GeometryReader { geo in
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 4)
                        .fill(Color.white.opacity(0.1))
                        .frame(height: 8)
                    
                    RoundedRectangle(cornerRadius: 4)
                        .fill(
                            LinearGradient(
                                colors: [course.color, Color.yellow, Color.white],
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .frame(width: geo.size.width * progressPercentage, height: 8)
                }
            }
            .frame(height: 8)
            
            // Stats
            HStack {
                StatBadge(icon: "book.fill", value: "\(totalLessons)", label: "Lessons")
                Spacer()
                StatBadge(icon: "checkmark.circle.fill", value: "\(completedLessons.count)", label: "Complete")
                Spacer()
                StatBadge(icon: "clock.fill", value: "\(course.totalMinutes)m", label: "Total")
            }
            
        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.white.opacity(0.05))
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(course.color.opacity(0.2), lineWidth: 1)
                )
        )
        
    }
    
    // MARK: - Transformation Levels
    
    private var transformationLevels: some View {
        
        VStack(alignment: .leading, spacing: 12) {
            
            Text("TRANSFORMATION PATH")
                .font(.system(size: 12, weight: .bold, design: .rounded))
                .foregroundColor(Palette.text.muted)
                .tracking(2)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    TransformationBadge(
                        name: "Base",
                        color: .white,
                        isUnlocked: true,
                        isActive: progressPercentage < 0.2
                    )
                    TransformationBadge(
                        name: "Super Saiyan",
                        color: Color.yellow,
                        isUnlocked: progressPercentage >= 0.2,
                        isActive: progressPercentage >= 0.2 && progressPercentage < 0.5
                    )
                    TransformationBadge(
                        name: "SS2",
                        color: Color.yellow,
                        isUnlocked: progressPercentage >= 0.5,
                        isActive: progressPercentage >= 0.5 && progressPercentage < 0.7
                    )
                    TransformationBadge(
                        name: "SS God",
                        color: Color.red,
                        isUnlocked: progressPercentage >= 0.7,
                        isActive: progressPercentage >= 0.7 && progressPercentage < 0.9
                    )
                    TransformationBadge(
                        name: "Ultra Instinct",
                        color: Color(hex: "#C0C0C0"),
                        isUnlocked: progressPercentage >= 0.9,
                        isActive: progressPercentage >= 0.9
                    )
                }
            }
            
        }
        
    }
    
    // MARK: - Modules Section
    
    private var modulesSection: some View {
        
        VStack(spacing: 16) {
            
            ForEach(course.modules) { module in
                DBModuleCard(
                    module: module,
                    isExpanded: expandedModules.contains(module.id),
                    completedLessons: completedLessons,
                    onToggle: {
                        withAnimation(.spring()) {
                            if expandedModules.contains(module.id) {
                                expandedModules.remove(module.id)
                            } else {
                                expandedModules.insert(module.id)
                            }
                        }
                    },
                    onSelectLesson: { lesson in
                        selectedLesson = lesson
                    }
                )
            }
            
        }
        
    }
    
    // MARK: - Computed Properties
    
    private var totalLessons: Int {
        course.modules.reduce(0) { $0 + $1.lessons.count }
    }
    
    private var progressPercentage: CGFloat {
        guard totalLessons > 0 else { return 0 }
        return CGFloat(completedLessons.count) / CGFloat(totalLessons)
    }
    
    // MARK: - Progress Persistence
    
    private func loadProgress() {
        // Load from UserDefaults or your storage system
        if let data = UserDefaults.standard.data(forKey: "dragonball_progress"),
           let progress = try? JSONDecoder().decode(DragonBallProgress.self, from: data) {
            completedLessons = Set(progress.completedLessons)
        }
    }
    
    private func saveProgress() {
        let progress = DragonBallProgress(
            completedLessons: Array(completedLessons),
            notes: [:],
            lastAccessed: Date()
        )
        if let data = try? JSONEncoder().encode(progress) {
            UserDefaults.standard.set(data, forKey: "dragonball_progress")
        }
    }
    
}

// MARK: - Supporting Views

struct StatBadge: View {
    let icon: String
    let value: String
    let label: String
    
    var body: some View {
        VStack(spacing: 4) {
            HStack(spacing: 4) {
                Image(systemName: icon)
                    .font(.system(size: 10))
                Text(value)
                    .font(.system(size: 14, weight: .bold, design: .rounded))
            }
            .foregroundColor(.white)
            
            Text(label)
                .font(.system(size: 10, weight: .medium, design: .rounded))
                .foregroundColor(Palette.text.muted)
        }
    }
}

struct TransformationBadge: View {
    let name: String
    let color: Color
    let isUnlocked: Bool
    let isActive: Bool
    
    var body: some View {
        VStack(spacing: 6) {
            ZStack {
                // Aura glow if active
                if isActive {
                    Circle()
                        .fill(color.opacity(0.3))
                        .frame(width: 50, height: 50)
                        .blur(radius: 5)
                }
                
                Circle()
                    .fill(isUnlocked ? color.opacity(0.2) : Color.gray.opacity(0.1))
                    .frame(width: 40, height: 40)
                    .overlay(
                        Circle()
                            .stroke(isActive ? color : Color.clear, lineWidth: 2)
                    )
                
                if isUnlocked {
                    Image(systemName: "bolt.fill")
                        .font(.system(size: 16))
                        .foregroundColor(color)
                } else {
                    Image(systemName: "lock.fill")
                        .font(.system(size: 12))
                        .foregroundColor(.gray)
                }
            }
            
            Text(name)
                .font(.system(size: 9, weight: .bold, design: .rounded))
                .foregroundColor(isUnlocked ? .white : .gray)
        }
    }
}

struct DBModuleCard: View {
    
    let module: DBModule
    let isExpanded: Bool
    let completedLessons: Set<String>
    let onToggle: () -> Void
    let onSelectLesson: (DBLesson) -> Void
    
    var completedCount: Int {
        module.lessons.filter { completedLessons.contains($0.id) }.count
    }
    
    var body: some View {
        
        VStack(spacing: 0) {
            
            // Module header
            Button(action: onToggle) {
                HStack(spacing: 16) {
                    
                    // Series badge
                    Text(module.series.rawValue.prefix(3).uppercased())
                        .font(.system(size: 10, weight: .black, design: .rounded))
                        .foregroundColor(module.series.color)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(module.series.color.opacity(0.15))
                        .clipShape(RoundedRectangle(cornerRadius: 4))
                    
                    VStack(alignment: .leading, spacing: 2) {
                        Text(module.title)
                            .font(.system(size: 16, weight: .bold, design: .rounded))
                            .foregroundColor(.white)
                        
                        Text("\(completedCount)/\(module.lessons.count) lessons • \(module.totalDuration)min")
                            .font(.system(size: 12, weight: .medium, design: .rounded))
                            .foregroundColor(Palette.text.secondary)
                    }
                    
                    Spacer()
                    
                    Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(Palette.text.muted)
                    
                }
                .padding(16)
            }
            
            // Lessons (expanded)
            if isExpanded {
                VStack(spacing: 8) {
                    ForEach(module.lessons) { lesson in
                        DBLessonRow(
                            lesson: lesson,
                            seriesColor: module.series.color,
                            isCompleted: completedLessons.contains(lesson.id),
                            onTap: { onSelectLesson(lesson) }
                        )
                    }
                }
                .padding(.horizontal, 16)
                .padding(.bottom, 16)
            }
            
        }
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.white.opacity(0.05))
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(module.series.color.opacity(isExpanded ? 0.3 : 0.1), lineWidth: 1)
                )
        )
        
    }
    
}

struct DBLessonRow: View {
    
    let lesson: DBLesson
    let seriesColor: Color
    let isCompleted: Bool
    let onTap: () -> Void
    
    var body: some View {
        
        Button(action: onTap) {
            HStack(spacing: 12) {
                
                // Status
                ZStack {
                    Circle()
                        .stroke(isCompleted ? seriesColor : Color.white.opacity(0.3), lineWidth: 2)
                        .frame(width: 24, height: 24)
                    
                    if isCompleted {
                        Image(systemName: "checkmark")
                            .font(.system(size: 12, weight: .bold))
                            .foregroundColor(seriesColor)
                    }
                }
                
                VStack(alignment: .leading, spacing: 2) {
                    Text(lesson.title)
                        .font(.system(size: 14, weight: .semibold, design: .rounded))
                        .foregroundColor(isCompleted ? seriesColor : .white)
                        .lineLimit(1)
                    
                    Text(lesson.concept)
                        .font(.system(size: 11, weight: .medium, design: .rounded))
                        .foregroundColor(Palette.text.muted)
                        .lineLimit(1)
                }
                
                Spacer()
                
                Image(systemName: "play.circle.fill")
                    .font(.system(size: 24))
                    .foregroundColor(seriesColor.opacity(0.6))
                
            }
            .padding(12)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.white.opacity(0.03))
            )
        }
        .buttonStyle(ScaleButtonStyle())
        
    }
    
}

// MARK: - Lesson Detail View

struct DBLessonDetailView: View {
    
    let lesson: DBLesson
    let onComplete: () -> Void
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        
        ZStack {
            
            // Background
            SacredGeometryBackground(style: .chakra(3), opacity: 0.08)
            
            ScrollView(showsIndicators: false) {
                
                VStack(alignment: .leading, spacing: 24) {
                    
                    // Header
                    VStack(alignment: .leading, spacing: 8) {
                        
                        Text("LESSON")
                            .font(.system(size: 12, weight: .bold, design: .rounded))
                            .foregroundColor(Color.orange)
                            .tracking(2)
                        
                        Text(lesson.title)
                            .font(.system(size: 24, weight: .black, design: .rounded))
                            .foregroundColor(.white)
                        
                        // Core concept
                        HStack {
                            Image(systemName: "lightbulb.fill")
                            Text(lesson.concept)
                        }
                        .font(.system(size: 13, weight: .bold, design: .rounded))
                        .foregroundColor(Color.yellow)
                        .padding(.top, 4)
                        
                    }
                    
                    // Content
                    Text(lesson.content)
                        .font(.system(size: 16, weight: .regular, design: .rounded))
                        .foregroundColor(Palette.text.primary)
                        .lineSpacing(6)
                    
                    // Key Moments
                    if !lesson.keyMoments.isEmpty {
                        VStack(alignment: .leading, spacing: 12) {
                            
                            Text("🎬 KEY MOMENTS")
                                .font(.system(size: 12, weight: .bold, design: .rounded))
                                .foregroundColor(Color.orange)
                                .tracking(2)
                            
                            ForEach(lesson.keyMoments, id: \.self) { moment in
                                HStack(alignment: .top, spacing: 12) {
                                    Image(systemName: "star.fill")
                                        .font(.system(size: 8))
                                        .foregroundColor(Color.yellow)
                                        .padding(.top, 5)
                                    
                                    Text(moment)
                                        .font(.system(size: 14, weight: .medium, design: .rounded))
                                        .foregroundColor(Palette.text.secondary)
                                }
                            }
                            
                        }
                        .padding(16)
                        .background(
                            RoundedRectangle(cornerRadius: 16)
                                .fill(Color.orange.opacity(0.1))
                        )
                    }
                    
                    // Complete Button
                    Button(action: {
                        onComplete()
                        dismiss()
                    }) {
                        HStack {
                            Image(systemName: "bolt.fill")
                            Text("Power Up Complete")
                        }
                        .font(.system(size: 16, weight: .bold, design: .rounded))
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 16)
                        .background(
                            LinearGradient(
                                colors: [Color.orange, Color.yellow],
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .clipShape(RoundedRectangle(cornerRadius: 14))
                    }
                    
                    Spacer(minLength: 50)
                    
                }
                .padding(.horizontal, 20)
                .padding(.top, 60)
                
            }
            
            // Close button
            VStack {
                HStack {
                    Spacer()
                    Button(action: { dismiss() }) {
                        Image(systemName: "xmark")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(.white)
                            .frame(width: 36, height: 36)
                            .background(Color.white.opacity(0.1))
                            .clipShape(Circle())
                    }
                }
                .padding(.horizontal, 20)
                .padding(.top, 20)
                Spacer()
            }
            
        }
        
    }
    
}

// MARK: - Preview

#Preview {
    DragonBallCourseView()
}
