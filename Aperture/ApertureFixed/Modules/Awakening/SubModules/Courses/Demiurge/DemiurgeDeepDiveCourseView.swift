// DemiurgeDeepDiveCourseView.swift
// THE DEMONIC DEMIURGE — Course Viewer
// ☀️ SunFlow: Reignited
//
// Source: Gerard P. Luttikhuizen, "The Demonic Demiurge
// in Gnostic Mythology" — The Secret Book of John

import SwiftUI

struct DemiurgeDeepDiveCourseView: View {
    
    @Environment(\.dismiss) var dismiss
    @State private var currentLesson: Int = 0
    @State private var expandedSections: Set<String> = []
    @State private var showLessonPicker: Bool = false
    
    private let course = DemiurgeDeepDiveCourse.self
    private let accent = Color(red: 0.85, green: 0.2, blue: 0.15)  // Deep crimson
    private let gold = Color(red: 1.0, green: 0.85, blue: 0.3)
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(red: 0.02, green: 0.01, blue: 0.04).ignoresSafeArea()
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 14) {
                        headerView
                        lessonSelector
                        lessonContent
                        navigationButtons
                        sourceAttribution
                        Spacer(minLength: 40)
                    }
                    .padding(20)
                }
            }
            .navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button { dismiss() } label: {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(.white)
                    }
                }
                ToolbarItem(placement: .principal) {
                    HStack(spacing: 6) {
                        Text("🦁").font(.system(size: 14))
                        Text("The Demonic Demiurge")
                            .font(.system(size: 15, weight: .bold))
                            .foregroundColor(.white)
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Text("\(currentLesson + 1)/\(course.lessons.count)")
                        .font(.system(size: 10, weight: .bold))
                        .foregroundColor(.white.opacity(0.2))
                }
            }
        }
    }
    
    // MARK: - Header
    
    private var headerView: some View {
        VStack(spacing: 6) {
            ZStack {
                Circle().fill(accent.opacity(0.04)).frame(width: 80, height: 80).blur(radius: 20)
                Text("🦁").font(.system(size: 36))
            }
            
            Text("The Demonic Demiurge").font(.system(size: 20, weight: .black)).foregroundColor(.white)
            Text("The God Who Thinks He's God").font(.system(size: 12, weight: .medium)).foregroundColor(accent.opacity(0.5))
            
            HStack(spacing: 12) {
                statPill("12", "Lessons")
                statPill("📜", "Secret Book of John")
                statPill("🏛️", "Nag Hammadi")
            }
        }
    }
    
    private func statPill(_ val: String, _ label: String) -> some View {
        VStack(spacing: 1) {
            Text(val).font(.system(size: 10, weight: .black)).foregroundColor(.white.opacity(0.4))
            Text(label).font(.system(size: 6, weight: .bold)).foregroundColor(.white.opacity(0.12))
        }
    }
    
    // MARK: - Lesson Selector
    
    private var lessonSelector: some View {
        VStack(spacing: 4) {
            Button { withAnimation { showLessonPicker.toggle() } } label: {
                HStack {
                    Text(course.lessons[currentLesson].emoji).font(.system(size: 12))
                    Text("Lesson \(currentLesson + 1): \(course.lessons[currentLesson].title)")
                        .font(.system(size: 12, weight: .bold)).foregroundColor(.white)
                    Spacer()
                    Image(systemName: showLessonPicker ? "chevron.up" : "chevron.down")
                        .font(.system(size: 9)).foregroundColor(.white.opacity(0.15))
                }
                .padding(10).background(RoundedRectangle(cornerRadius: 8).fill(accent.opacity(0.03)))
            }
            
            if showLessonPicker {
                VStack(spacing: 2) {
                    ForEach(Array(course.lessons.enumerated()), id: \.offset) { index, lesson in
                        Button {
                            withAnimation {
                                currentLesson = index
                                showLessonPicker = false
                                expandedSections.removeAll()
                            }
                        } label: {
                            HStack(spacing: 6) {
                                Text(lesson.emoji).font(.system(size: 10))
                                Text("\(index + 1). \(lesson.title)")
                                    .font(.system(size: 10, weight: index == currentLesson ? .black : .medium))
                                    .foregroundColor(index == currentLesson ? accent : .white.opacity(0.3))
                                Spacer()
                                if index == currentLesson {
                                    Circle().fill(accent).frame(width: 5, height: 5)
                                }
                            }
                            .padding(.horizontal, 10).padding(.vertical, 6)
                        }
                    }
                }
                .padding(6).background(RoundedRectangle(cornerRadius: 8).fill(Color.white.opacity(0.01)))
            }
        }
    }
    
    // MARK: - Lesson Content
    
    private var lessonContent: some View {
        let lesson = course.lessons[currentLesson]
        
        return VStack(alignment: .leading, spacing: 8) {
            ForEach(Array(lesson.sections.enumerated()), id: \.offset) { index, section in
                sectionCard(section.heading, section.body, index)
            }
        }
    }
    
    private func sectionCard(_ heading: String, _ body: String, _ index: Int) -> some View {
        let key = "\(currentLesson)-\(index)"
        let isSunFlow = heading.contains("SunFlow")
        let sectionColor = isSunFlow ? gold : accent
        
        return VStack(alignment: .leading, spacing: 0) {
            Button {
                withAnimation(.easeInOut(duration: 0.15)) {
                    if expandedSections.contains(key) { expandedSections.remove(key) }
                    else { expandedSections.insert(key) }
                }
            } label: {
                HStack {
                    if isSunFlow {
                        Text("☀️").font(.system(size: 10))
                    }
                    Text(heading).font(.system(size: isSunFlow ? 11 : 13, weight: .bold))
                        .foregroundColor(isSunFlow ? gold : .white)
                    Spacer()
                    Image(systemName: expandedSections.contains(key) ? "chevron.up" : "chevron.down")
                        .font(.system(size: 8)).foregroundColor(.white.opacity(0.08))
                }
                .padding(11)
            }
            
            if expandedSections.contains(key) {
                Text(body)
                    .font(.system(size: isSunFlow ? 11 : 12, weight: .medium))
                    .foregroundColor(isSunFlow ? gold.opacity(0.5) : .white.opacity(0.55))
                    .lineSpacing(3)
                    .padding(.horizontal, 11).padding(.bottom, 12)
            }
        }
        .background(
            RoundedRectangle(cornerRadius: 8)
                .fill(sectionColor.opacity(isSunFlow ? 0.02 : 0.012))
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(sectionColor.opacity(isSunFlow ? 0.06 : 0.0), lineWidth: 1)
                )
        )
    }
    
    // MARK: - Navigation
    
    private var navigationButtons: some View {
        HStack {
            if currentLesson > 0 {
                Button {
                    withAnimation {
                        currentLesson -= 1
                        expandedSections.removeAll()
                    }
                } label: {
                    HStack(spacing: 4) {
                        Image(systemName: "chevron.left").font(.system(size: 8))
                        Text("Prev").font(.system(size: 11, weight: .bold))
                    }
                    .foregroundColor(.white.opacity(0.2))
                }
            }
            
            Spacer()
            
            if currentLesson < course.lessons.count - 1 {
                Button {
                    withAnimation {
                        currentLesson += 1
                        expandedSections.removeAll()
                    }
                } label: {
                    HStack(spacing: 4) {
                        Text("Next").font(.system(size: 11, weight: .bold))
                        Image(systemName: "chevron.right").font(.system(size: 8))
                    }
                    .foregroundColor(accent.opacity(0.5))
                }
            }
        }
    }
    
    // MARK: - Source Attribution
    
    private var sourceAttribution: some View {
        VStack(spacing: 4) {
            Text("SOURCE MATERIAL").font(.system(size: 7, weight: .black)).tracking(2).foregroundColor(.white.opacity(0.06))
            Text("Gerard P. Luttikhuizen, \"The Demonic Demiurge in Gnostic Mythology\"")
                .font(.system(size: 8, weight: .medium)).foregroundColor(.white.opacity(0.1))
            Text("The Fall of the Angels, Themes in Biblical Narrative Vol. VI (Brill, 2004)")
                .font(.system(size: 7, weight: .medium)).foregroundColor(.white.opacity(0.06))
            Text("Primary Source: The Secret Book of John (Apocryphon of John)")
                .font(.system(size: 7, weight: .medium)).foregroundColor(.white.opacity(0.06))
            Text("Nag Hammadi Library Codices II, III, IV • Berlin Codex (BG 8505,2)")
                .font(.system(size: 7, weight: .medium)).foregroundColor(.white.opacity(0.06))
        }
        .multilineTextAlignment(.center).padding(.top, 10)
    }
}
