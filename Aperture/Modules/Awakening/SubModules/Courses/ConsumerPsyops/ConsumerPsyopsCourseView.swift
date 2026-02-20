// ConsumerPsyopsCourseView.swift
// Shared view for both Consumer Psyops and Subscription Awakening courses.
// ☀️ SunFlow: Reignited

import SwiftUI

// MARK: - ═══════════════════════════════════════════════════
// CONSUMER PSYOPS COURSE VIEW
// ═══════════════════════════════════════════════════════════

struct ConsumerPsyopsCourseView: View {
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject private var progressManager: CourseProgressManager
    @State private var selectedLesson: ConsumerPsyopsLesson?
    @State private var completedLessons: Set<String> = []
    
    let isSubscriptionCourse: Bool
    
    init(isSubscriptionCourse: Bool = false) {
        self.isSubscriptionCourse = isSubscriptionCourse
    }
    
    private var course: (id: String, title: String, subtitle: String, emoji: String, lessons: [ConsumerPsyopsLesson]) {
        if isSubscriptionCourse {
            return (SubscriptionAwakeningCourse.courseId, SubscriptionAwakeningCourse.title, SubscriptionAwakeningCourse.subtitle, SubscriptionAwakeningCourse.emoji, SubscriptionAwakeningCourse.lessons)
        }
        return (ConsumerPsyopsCourse.courseId, ConsumerPsyopsCourse.title, ConsumerPsyopsCourse.subtitle, ConsumerPsyopsCourse.emoji, ConsumerPsyopsCourse.lessons)
    }
    
    var body: some View {
        ZStack {
            Color(hex: "#0a0a0f").ignoresSafeArea()
            
            ScrollView(showsIndicators: false) {
                VStack(spacing: 20) {
                    headerSection
                    progressSection
                    lessonsSection
                    Spacer(minLength: 100)
                }
                .padding(.horizontal, 16)
                .padding(.top, 16)
            }
        }
        .navigationTitle("")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button { dismiss() } label: {
                    Image(systemName: "chevron.left").font(.system(size: 16, weight: .semibold)).foregroundColor(.white)
                }
            }
            ToolbarItem(placement: .principal) {
                Text(course.title).font(.system(size: 15, weight: .bold)).foregroundColor(.white).lineLimit(1)
            }
        }
        .toolbarBackground(Color(hex: "#0a0a0f"), for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
        .navigationDestination(item: $selectedLesson) { lesson in
            ConsumerPsyopsLessonView(lesson: lesson, courseId: course.id) {
                completedLessons.insert(lesson.id)
                checkBuddyNamingTrigger(lesson)
            }
        }
        .onAppear { loadProgress() }
    }
    
    private var headerSection: some View {
        VStack(spacing: 10) {
            Text(course.emoji).font(.system(size: 44))
            Text(course.title)
                .font(.system(size: 22, weight: .black)).foregroundColor(.white)
                .multilineTextAlignment(.center)
            Text(course.subtitle)
                .font(.system(size: 13, weight: .medium)).foregroundColor(.white.opacity(0.4))
        }
        .padding(.vertical, 10)
    }
    
    private var progressSection: some View {
        let done = completedLessons.count
        let total = course.lessons.count
        let pct = total > 0 ? Double(done) / Double(total) : 0
        
        return VStack(spacing: 6) {
            HStack {
                Text("\(done)/\(total) lessons").font(.system(size: 11, weight: .bold)).foregroundColor(Color(red: 1.0, green: 0.85, blue: 0.3))
                Spacer()
                Text("\(Int(pct * 100))%").font(.system(size: 11, weight: .bold)).foregroundColor(.white.opacity(0.3))
            }
            GeometryReader { geo in
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 4).fill(Color.white.opacity(0.05)).frame(height: 5)
                    RoundedRectangle(cornerRadius: 4).fill(Color(red: 1.0, green: 0.85, blue: 0.3)).frame(width: geo.size.width * pct, height: 5)
                }
            }
            .frame(height: 5)
        }
        .padding(12).background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.03)))
    }
    
    private var lessonsSection: some View {
        VStack(spacing: 12) {
            ForEach(course.lessons) { lesson in
                Button { selectedLesson = lesson } label: {
                    lessonRow(lesson)
                }
                .buttonStyle(.plain)
            }
        }
    }
    
    private func lessonRow(_ lesson: ConsumerPsyopsLesson) -> some View {
        let done = completedLessons.contains(lesson.id)
        let accentColor = isSubscriptionCourse ? Color(hex: "#E74C3C") : Color(hex: "#F39C12")
        
        return HStack(spacing: 14) {
            ZStack {
                Circle().fill(done ? accentColor.opacity(0.2) : Color.white.opacity(0.05)).frame(width: 44, height: 44)
                if done {
                    Image(systemName: "checkmark").font(.system(size: 16, weight: .bold)).foregroundColor(accentColor)
                } else {
                    Text(lesson.emoji).font(.system(size: 20))
                }
            }
            
            VStack(alignment: .leading, spacing: 3) {
                Text("LESSON \(lesson.number)").font(.system(size: 8, weight: .black)).tracking(1).foregroundColor(.white.opacity(0.2))
                Text(lesson.title).font(.system(size: 14, weight: .bold)).foregroundColor(.white)
                Text(lesson.subtitle).font(.system(size: 11, weight: .medium)).foregroundColor(.white.opacity(0.35)).lineLimit(1)
            }
            
            Spacer()
            Image(systemName: "chevron.right").font(.system(size: 12, weight: .semibold)).foregroundColor(.white.opacity(0.15))
        }
        .padding(12)
        .background(RoundedRectangle(cornerRadius: 12).fill(done ? accentColor.opacity(0.04) : Color.white.opacity(0.02)))
        .overlay(RoundedRectangle(cornerRadius: 12).stroke(done ? accentColor.opacity(0.15) : Color.white.opacity(0.04), lineWidth: 1))
    }
    
    private func loadProgress() {
        let progress = progressManager.progress(for: course.id)
        completedLessons = progress.completedLessonIds
    }
    
    // Trigger buddy naming organically after lesson 3
    private func checkBuddyNamingTrigger(_ lesson: ConsumerPsyopsLesson) {
        if lesson.number == 3 && !AccountabilityBuddyManager.shared.hasBuddy {
            // Will be shown via notification or in-app prompt
            NotificationCenter.default.post(name: .buddyNamingUnlocked, object: nil)
        }
    }
}

extension ConsumerPsyopsLesson: Hashable {
    static func == (lhs: ConsumerPsyopsLesson, rhs: ConsumerPsyopsLesson) -> Bool { lhs.id == rhs.id }
    func hash(into hasher: inout Hasher) { hasher.combine(id) }
}

// MARK: - ═══════════════════════════════════════════════════
// LESSON DETAIL VIEW
// ═══════════════════════════════════════════════════════════

struct ConsumerPsyopsLessonView: View {
    
    let lesson: ConsumerPsyopsLesson
    let courseId: String
    let onComplete: () -> Void
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject private var progressManager: CourseProgressManager
    @State private var currentSection = 0
    @State private var isCompleted = false
    
    var body: some View {
        ZStack {
            Color(hex: "#0a0a0f").ignoresSafeArea()
            
            VStack(spacing: 0) {
                // Section navigation dots
                HStack(spacing: 6) {
                    ForEach(0..<lesson.sections.count, id: \.self) { i in
                        Circle()
                            .fill(i <= currentSection ? Color(red: 1.0, green: 0.85, blue: 0.3) : Color.white.opacity(0.15))
                            .frame(width: 6, height: 6)
                    }
                }
                .padding(.top, 10)
                
                // Content
                TabView(selection: $currentSection) {
                    ForEach(Array(lesson.sections.enumerated()), id: \.offset) { index, section in
                        ScrollView(showsIndicators: false) {
                            VStack(alignment: .leading, spacing: 16) {
                                Text(section.heading)
                                    .font(.system(size: 20, weight: .black))
                                    .foregroundColor(Color(red: 1.0, green: 0.85, blue: 0.3))
                                
                                Text(section.body)
                                    .font(.system(size: 14, weight: .medium))
                                    .foregroundColor(.white.opacity(0.75))
                                    .lineSpacing(5)
                                
                                Spacer(minLength: 100)
                            }
                            .padding(.horizontal, 20)
                            .padding(.top, 20)
                        }
                        .tag(index)
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                
                // Bottom navigation
                HStack {
                    if currentSection > 0 {
                        Button {
                            withAnimation { currentSection -= 1 }
                        } label: {
                            HStack(spacing: 4) {
                                Image(systemName: "chevron.left").font(.system(size: 12, weight: .bold))
                                Text("Back").font(.system(size: 13, weight: .bold))
                            }
                            .foregroundColor(.white.opacity(0.4))
                        }
                    }
                    
                    Spacer()
                    
                    if currentSection < lesson.sections.count - 1 {
                        Button {
                            withAnimation { currentSection += 1 }
                        } label: {
                            HStack(spacing: 4) {
                                Text("Next").font(.system(size: 13, weight: .bold))
                                Image(systemName: "chevron.right").font(.system(size: 12, weight: .bold))
                            }
                            .foregroundColor(Color(red: 1.0, green: 0.85, blue: 0.3))
                        }
                    } else if !isCompleted {
                        Button {
                            completeLesson()
                        } label: {
                            Text("Complete ✓").font(.system(size: 14, weight: .bold)).foregroundColor(.black)
                                .padding(.horizontal, 24).padding(.vertical, 10)
                                .background(Capsule().fill(Color(red: 1.0, green: 0.85, blue: 0.3)))
                        }
                    } else {
                        Text("✓ Completed").font(.system(size: 13, weight: .bold)).foregroundColor(.green)
                    }
                }
                .padding(.horizontal, 20).padding(.vertical, 14)
                .background(Color(hex: "#0a0a0f"))
            }
        }
        .navigationTitle("")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text(lesson.title).font(.system(size: 15, weight: .bold)).foregroundColor(.white).lineLimit(1)
            }
        }
        .toolbarBackground(Color(hex: "#0a0a0f"), for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
    }
    
    private func completeLesson() {
        isCompleted = true
        onComplete()
        progressManager.completeLesson(courseId: courseId, lessonId: lesson.id, moduleIndex: 0, lessonIndex: lesson.number - 1)
        HapticManager.shared.heavy()
    }
}

// MARK: - Notification name for buddy naming trigger
extension Notification.Name {
    static let buddyNamingUnlocked = Notification.Name("buddyNamingUnlocked")
}
