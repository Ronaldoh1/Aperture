// LightAndDarknessCourseView.swift
// Course View for Light & Darkness — Know Both Sides
// ☀️ SunFlow: Reignited

import SwiftUI

struct LightAndDarknessCourseView: View {
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var progressManager: CourseProgressManager
    @State private var selectedModule: AwakeningModule?
    
    private let course = LightAndDarknessCourse.self
    private let accentColor = Color(red: 0.7, green: 0.4, blue: 1.0)  // Deep purple
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(hex: "#0a0a0f").ignoresSafeArea()
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 18) {
                        courseHeader
                        disclaimerCard
                        
                        VStack(spacing: 10) {
                            ForEach(course.modules) { module in
                                moduleCard(module)
                            }
                        }
                        
                        // Discernment Protocol quick-access
                        discernmentProtocolCard
                        
                        Spacer(minLength: 80)
                    }
                    .padding(.horizontal, 16)
                }
            }
            .navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button { dismiss() } label: {
                        Image(systemName: "xmark.circle.fill").font(.system(size: 22)).foregroundColor(.white.opacity(0.3))
                    }
                }
                ToolbarItem(placement: .principal) {
                    Text("Light & Darkness").font(.system(size: 16, weight: .bold)).foregroundColor(.white)
                }
            }
            .toolbarBackground(Color(hex: "#0a0a0f"), for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .sheet(item: $selectedModule) { module in
                AwakeningModuleDetailView(module: module)
                    .environmentObject(progressManager)
            }
        }
    }
    
    // MARK: - Header
    
    private var courseHeader: some View {
        VStack(spacing: 12) {
            Text(course.emoji).font(.system(size: 50))
            Text(course.title).font(.system(size: 24, weight: .black)).foregroundColor(.white)
            Text(course.subtitle).font(.system(size: 13, weight: .medium)).foregroundColor(accentColor).multilineTextAlignment(.center)
            
            Text(course.courseDescription)
                .font(.system(size: 12, weight: .medium)).foregroundColor(.white.opacity(0.5))
                .lineSpacing(4).multilineTextAlignment(.center).padding(.horizontal, 8)
            
            let totalLessons = course.modules.reduce(0) { $0 + $1.lessons.count }
            HStack(spacing: 16) {
                Label("\(course.modules.count) modules", systemImage: "folder.fill")
                Label(course.estimatedHours, systemImage: "clock.fill")
                Label("\(totalLessons) lessons", systemImage: "doc.text.fill")
            }
            .font(.system(size: 10, weight: .bold)).foregroundColor(.white.opacity(0.25))
        }
        .padding(.top, 10)
    }
    
    // MARK: - Disclaimer
    
    private var disclaimerCard: some View {
        HStack(alignment: .top, spacing: 8) {
            Image(systemName: "info.circle.fill").font(.system(size: 12)).foregroundColor(accentColor.opacity(0.5))
            Text(course.disclaimer)
                .font(.system(size: 9, weight: .medium)).foregroundColor(.white.opacity(0.3)).lineSpacing(3)
        }
        .padding(10)
        .background(RoundedRectangle(cornerRadius: 10).fill(accentColor.opacity(0.02)))
    }
    
    // MARK: - Discernment Protocol Card
    
    private var discernmentProtocolCard: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(spacing: 8) {
                Image(systemName: "shield.checkered").font(.system(size: 16)).foregroundColor(accentColor)
                Text("Light/Dark Discernment Protocol").font(.system(size: 14, weight: .bold)).foregroundColor(accentColor)
            }
            Text("7-test framework for evaluating any teaching, teacher, or tradition. Found in Module 5, Lesson 3. Run it on everything — including this course.")
                .font(.system(size: 10, weight: .medium)).foregroundColor(.white.opacity(0.35)).lineSpacing(3)
            
            HStack(spacing: 12) {
                ForEach(["Unity", "Freedom", "Fruit", "Transparency", "Sacrifice", "Fear", "Ego"], id: \.self) { test in
                    Text(test).font(.system(size: 7, weight: .bold)).foregroundColor(accentColor.opacity(0.5))
                        .padding(.horizontal, 5).padding(.vertical, 2)
                        .background(Capsule().fill(accentColor.opacity(0.06)))
                }
            }
        }
        .padding(14)
        .background(RoundedRectangle(cornerRadius: 14).fill(accentColor.opacity(0.03)))
        .overlay(RoundedRectangle(cornerRadius: 14).stroke(accentColor.opacity(0.1), lineWidth: 1))
    }
    
    // MARK: - Module Card
    
    private func moduleCard(_ module: AwakeningModule) -> some View {
        let progress = progressManager.progress(for: LightAndDarknessCourse.courseId)
        let totalLessons = module.lessons.count
        let completedCount = module.lessons.filter { progress.completedLessonIds.contains($0.id) }.count
        let pct = totalLessons == 0 ? 0.0 : Double(completedCount) / Double(totalLessons)
        
        return Button { selectedModule = module } label: {
            VStack(alignment: .leading, spacing: 8) {
                HStack(spacing: 10) {
                    Text(module.emoji).font(.system(size: 24))
                    VStack(alignment: .leading, spacing: 2) {
                        Text("MODULE \(module.number)").font(.system(size: 8, weight: .black)).tracking(1).foregroundColor(accentColor.opacity(0.5))
                        Text(module.title).font(.system(size: 15, weight: .bold)).foregroundColor(.white)
                    }
                    Spacer()
                    VStack(alignment: .trailing, spacing: 2) {
                        Text("\(completedCount)/\(totalLessons)").font(.system(size: 12, weight: .bold, design: .rounded))
                            .foregroundColor(completedCount == totalLessons && totalLessons > 0 ? .green : .white.opacity(0.25))
                        Text("~\(module.estimatedMinutes) min").font(.system(size: 9, weight: .bold)).foregroundColor(.white.opacity(0.15))
                    }
                }
                
                Text(module.subtitle).font(.system(size: 11, weight: .medium)).foregroundColor(.white.opacity(0.4))
                
                GeometryReader { geo in
                    ZStack(alignment: .leading) {
                        RoundedRectangle(cornerRadius: 2).fill(Color.white.opacity(0.04)).frame(height: 3)
                        RoundedRectangle(cornerRadius: 2).fill(accentColor).frame(width: geo.size.width * pct, height: 3)
                    }
                }
                .frame(height: 3)
                
                HStack(spacing: 4) {
                    ForEach(module.lessons) { lesson in
                        let done = progress.completedLessonIds.contains(lesson.id)
                        Text(lesson.emoji).font(.system(size: 10))
                            .padding(3)
                            .background(Circle().fill(done ? accentColor.opacity(0.15) : Color.white.opacity(0.02)))
                    }
                    Spacer()
                }
            }
            .padding(14)
            .background(RoundedRectangle(cornerRadius: 14).fill(Color.white.opacity(0.02)))
            .overlay(RoundedRectangle(cornerRadius: 14).stroke(Color.white.opacity(0.04), lineWidth: 1))
        }
        .buttonStyle(.plain)
    }
}
