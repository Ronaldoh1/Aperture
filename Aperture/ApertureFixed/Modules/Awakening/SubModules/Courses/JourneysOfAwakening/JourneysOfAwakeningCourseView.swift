// JourneysOfAwakeningCourseView.swift
// The comparative consciousness course view.
// Every tradition. Every path. Let the patterns speak for themselves.
// ☀️ SunFlow: Reignited

import SwiftUI

// MARK: - ═══════════════════════════════════════════════════
// COURSE VIEW — Module-based navigation
// ═══════════════════════════════════════════════════════════

struct JourneysOfAwakeningCourseView: View {
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var progressManager: CourseProgressManager
    @State private var selectedModule: AwakeningModule?
    @State private var showComparisonMatrix = false
    @State private var showPlanesLadder = false
    
    private let course = JourneysOfAwakeningCourse.self
    private let accentColor = Color(red: 1.0, green: 0.6, blue: 0.2)  // Warm sunrise orange
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(hex: "#0a0a0f").ignoresSafeArea()
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 18) {
                        // Header
                        courseHeader
                        
                        // Disclaimer
                        disclaimerCard
                        
                        // Modules
                        VStack(spacing: 10) {
                            ForEach(course.modules) { module in
                                moduleCard(module)
                            }
                        }
                        
                        // Comparison Matrix button
                        Button { showComparisonMatrix = true } label: {
                            HStack(spacing: 10) {
                                Image(systemName: "tablecells").font(.system(size: 16))
                                VStack(alignment: .leading, spacing: 2) {
                                    Text("Comparison Matrix").font(.system(size: 14, weight: .bold))
                                    Text("See all paths side by side").font(.system(size: 10, weight: .medium)).opacity(0.5)
                                }
                                Spacer()
                                Image(systemName: "chevron.right").font(.system(size: 12)).opacity(0.3)
                            }
                            .foregroundColor(accentColor)
                            .padding(14)
                            .background(RoundedRectangle(cornerRadius: 14).fill(accentColor.opacity(0.05)))
                            .overlay(RoundedRectangle(cornerRadius: 14).stroke(accentColor.opacity(0.15), lineWidth: 1))
                        }
                        
                        // Planes Ladder button
                        Button { showPlanesLadder = true } label: {
                            HStack(spacing: 10) {
                                Image(systemName: "building.2.fill").font(.system(size: 16))
                                VStack(alignment: .leading, spacing: 2) {
                                    Text("Planes Ladder").font(.system(size: 14, weight: .bold))
                                    Text("Interactive 8-layer reality map").font(.system(size: 10, weight: .medium)).opacity(0.5)
                                }
                                Spacer()
                                Image(systemName: "chevron.right").font(.system(size: 12)).opacity(0.3)
                            }
                            .foregroundColor(Color(red: 0.5, green: 0.8, blue: 1.0))
                            .padding(14)
                            .background(RoundedRectangle(cornerRadius: 14).fill(Color(red: 0.5, green: 0.8, blue: 1.0).opacity(0.05)))
                            .overlay(RoundedRectangle(cornerRadius: 14).stroke(Color(red: 0.5, green: 0.8, blue: 1.0).opacity(0.15), lineWidth: 1))
                        }
                        
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
                    Text("Journeys of Awakening").font(.system(size: 16, weight: .bold)).foregroundColor(.white)
                }
            }
            .toolbarBackground(Color(hex: "#0a0a0f"), for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .sheet(item: $selectedModule) { module in
                AwakeningModuleDetailView(module: module)
                    .environmentObject(progressManager)
            }
            .sheet(isPresented: $showComparisonMatrix) {
                ComparisonMatrixView()
            }
            .sheet(isPresented: $showPlanesLadder) {
                PlanesLadderView()
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
            
            HStack(spacing: 16) {
                Label("13 modules", systemImage: "folder.fill")
                Label(course.estimatedHours, systemImage: "clock.fill")
                Label("54 lessons", systemImage: "doc.text.fill")
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
    
    // MARK: - Module Card
    
    private func moduleCard(_ module: AwakeningModule) -> some View {
        let progress = progressManager.progress(for: JourneysOfAwakeningCourse.courseId)
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
                
                // Progress bar
                GeometryReader { geo in
                    ZStack(alignment: .leading) {
                        RoundedRectangle(cornerRadius: 2).fill(Color.white.opacity(0.04)).frame(height: 3)
                        RoundedRectangle(cornerRadius: 2).fill(accentColor).frame(width: geo.size.width * pct, height: 3)
                    }
                }
                .frame(height: 3)
                
                // Lesson chips
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

// MARK: - ═══════════════════════════════════════════════════
// MODULE DETAIL VIEW — Lessons list + lesson reader
// ═══════════════════════════════════════════════════════════

struct AwakeningModuleDetailView: View {
    
    let module: AwakeningModule
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var progressManager: CourseProgressManager
    @State private var selectedLesson: AwakeningLesson?
    
    private let accentColor = Color(red: 1.0, green: 0.6, blue: 0.2)
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(hex: "#0a0a0f").ignoresSafeArea()
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 12) {
                        // Module header
                        VStack(spacing: 8) {
                            Text(module.emoji).font(.system(size: 40))
                            Text("Module \(module.number)").font(.system(size: 10, weight: .black)).tracking(1).foregroundColor(accentColor.opacity(0.5))
                            Text(module.title).font(.system(size: 22, weight: .black)).foregroundColor(.white)
                            Text(module.subtitle).font(.system(size: 12, weight: .medium)).foregroundColor(.white.opacity(0.4))
                        }
                        .padding(.top, 10)
                        
                        // Lessons
                        ForEach(module.lessons) { lesson in
                            lessonRow(lesson)
                        }
                        
                        Spacer(minLength: 60)
                    }
                    .padding(.horizontal, 16)
                }
            }
            .navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button { dismiss() } label: {
                        HStack(spacing: 4) {
                            Image(systemName: "chevron.left").font(.system(size: 13, weight: .semibold))
                            Text("Back").font(.system(size: 14, weight: .medium))
                        }
                        .foregroundColor(accentColor)
                    }
                }
            }
            .toolbarBackground(Color(hex: "#0a0a0f"), for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .sheet(item: $selectedLesson) { lesson in
                AwakeningLessonReaderView(
                    lesson: lesson,
                    courseId: JourneysOfAwakeningCourse.courseId,
                    moduleIndex: module.number - 1,
                    lessonIndex: lesson.number - 1
                )
                .environmentObject(progressManager)
            }
        }
    }
    
    private func lessonRow(_ lesson: AwakeningLesson) -> some View {
        let progress = progressManager.progress(for: JourneysOfAwakeningCourse.courseId)
        let done = progress.completedLessonIds.contains(lesson.id)
        
        return Button { selectedLesson = lesson } label: {
            HStack(spacing: 12) {
                ZStack {
                    Circle().fill(done ? accentColor.opacity(0.15) : Color.white.opacity(0.03)).frame(width: 40, height: 40)
                    if done {
                        Image(systemName: "checkmark").font(.system(size: 14, weight: .bold)).foregroundColor(accentColor)
                    } else {
                        Text(lesson.emoji).font(.system(size: 18))
                    }
                }
                
                VStack(alignment: .leading, spacing: 3) {
                    Text("Lesson \(lesson.number)").font(.system(size: 9, weight: .black)).tracking(0.5).foregroundColor(accentColor.opacity(0.4))
                    Text(lesson.title).font(.system(size: 14, weight: .bold)).foregroundColor(done ? .white.opacity(0.5) : .white)
                    Text(lesson.subtitle).font(.system(size: 10, weight: .medium)).foregroundColor(.white.opacity(0.3)).lineLimit(1)
                }
                
                Spacer()
                Image(systemName: "chevron.right").font(.system(size: 11)).foregroundColor(.white.opacity(0.1))
            }
            .padding(12)
            .background(RoundedRectangle(cornerRadius: 12).fill(done ? accentColor.opacity(0.02) : Color.white.opacity(0.015)))
            .overlay(RoundedRectangle(cornerRadius: 12).stroke(done ? accentColor.opacity(0.08) : Color.white.opacity(0.03), lineWidth: 1))
        }
        .buttonStyle(.plain)
    }
}

// MARK: - ═══════════════════════════════════════════════════
// LESSON READER — Sectioned reading with reflection
// ═══════════════════════════════════════════════════════════

struct AwakeningLessonReaderView: View {
    
    let lesson: AwakeningLesson
    let courseId: String
    let moduleIndex: Int
    let lessonIndex: Int
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var progressManager: CourseProgressManager
    @State private var currentSection = 0
    @State private var showReflection = false
    @State private var reflectionText = ""
    @State private var isCompleted = false
    
    private let accentColor = Color(red: 1.0, green: 0.6, blue: 0.2)
    
    var body: some View {
        ZStack {
            Color(hex: "#0a0a0f").ignoresSafeArea()
            
            VStack(spacing: 0) {
                // Top bar
                HStack {
                    Button { dismiss() } label: {
                        Image(systemName: "chevron.down").font(.system(size: 14, weight: .semibold)).foregroundColor(.white.opacity(0.4))
                    }
                    Spacer()
                    Text(lesson.title).font(.system(size: 14, weight: .bold)).foregroundColor(.white).lineLimit(1)
                    Spacer()
                    Text("\(currentSection + 1)/\(totalPages)").font(.system(size: 11, weight: .bold)).foregroundColor(.white.opacity(0.2))
                }
                .padding(.horizontal, 16).padding(.vertical, 12)
                
                // Section dots
                HStack(spacing: 5) {
                    ForEach(0..<totalPages, id: \.self) { i in
                        Circle()
                            .fill(i <= currentSection ? accentColor : Color.white.opacity(0.1))
                            .frame(width: 6, height: 6)
                    }
                }
                
                // Content
                TabView(selection: $currentSection) {
                    // Content sections
                    ForEach(Array(lesson.sections.enumerated()), id: \.offset) { idx, section in
                        ScrollView(showsIndicators: false) {
                            VStack(alignment: .leading, spacing: 14) {
                                Text(section.heading)
                                    .font(.system(size: 20, weight: .black)).foregroundColor(accentColor)
                                
                                Text(section.body)
                                    .font(.system(size: 14, weight: .medium)).foregroundColor(.white.opacity(0.72))
                                    .lineSpacing(6)
                                
                                Spacer(minLength: 100)
                            }
                            .padding(.horizontal, 20).padding(.top, 20)
                        }
                        .tag(idx)
                    }
                    
                    // Reflection page (if available)
                    if let prompt = lesson.reflectionPrompt {
                        ScrollView(showsIndicators: false) {
                            VStack(alignment: .leading, spacing: 16) {
                                Text("💭 Reflection").font(.system(size: 20, weight: .black)).foregroundColor(accentColor)
                                
                                Text(prompt)
                                    .font(.system(size: 14, weight: .medium)).foregroundColor(.white.opacity(0.72))
                                    .lineSpacing(5).italic()
                                
                                TextEditor(text: $reflectionText)
                                    .font(.system(size: 13)).foregroundColor(.white)
                                    .frame(minHeight: 120)
                                    .scrollContentBackground(.hidden)
                                    .padding(10)
                                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.03)))
                                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(accentColor.opacity(0.1), lineWidth: 1))
                                
                                Text("Your reflections stay on your device. Private. Always.")
                                    .font(.system(size: 9, weight: .medium)).foregroundColor(.white.opacity(0.15))
                                
                                Spacer(minLength: 100)
                            }
                            .padding(.horizontal, 20).padding(.top, 20)
                        }
                        .tag(lesson.sections.count)
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                
                // Bottom navigation
                HStack {
                    if currentSection > 0 {
                        Button { withAnimation { currentSection -= 1 } } label: {
                            HStack(spacing: 4) {
                                Image(systemName: "chevron.left").font(.system(size: 12, weight: .bold))
                                Text("Back").font(.system(size: 13, weight: .bold))
                            }
                            .foregroundColor(.white.opacity(0.4))
                        }
                    }
                    Spacer()
                    
                    if currentSection < totalPages - 1 {
                        Button { withAnimation { currentSection += 1 } } label: {
                            HStack(spacing: 4) {
                                Text("Next").font(.system(size: 13, weight: .bold))
                                Image(systemName: "chevron.right").font(.system(size: 12, weight: .bold))
                            }
                            .foregroundColor(accentColor)
                        }
                    } else if !isCompleted {
                        Button { completeLesson() } label: {
                            Text("Complete ✓").font(.system(size: 14, weight: .bold)).foregroundColor(.black)
                                .padding(.horizontal, 24).padding(.vertical, 10)
                                .background(Capsule().fill(accentColor))
                        }
                    } else {
                        Text("✓ Completed").font(.system(size: 13, weight: .bold)).foregroundColor(.green)
                    }
                }
                .padding(.horizontal, 20).padding(.vertical, 14)
                .background(Color(hex: "#0a0a0f"))
            }
        }
        .onAppear {
            let progress = progressManager.progress(for: courseId)
            isCompleted = progress.completedLessonIds.contains(lesson.id)
        }
    }
    
    private var totalPages: Int {
        lesson.sections.count + (lesson.reflectionPrompt != nil ? 1 : 0)
    }
    
    private func completeLesson() {
        isCompleted = true
        progressManager.completeLesson(courseId: courseId, lessonId: lesson.id, moduleIndex: moduleIndex, lessonIndex: lessonIndex)
        HapticManager.shared.heavy()
    }
}

// MARK: - ═══════════════════════════════════════════════════
// COMPARISON MATRIX — All paths side by side
// "Different maps, same territory"
// ═══════════════════════════════════════════════════════════

struct ComparisonMatrixView: View {
    
    @Environment(\.dismiss) var dismiss
    private let accentColor = Color(red: 1.0, green: 0.6, blue: 0.2)
    
    struct PathComparison: Identifiable {
        let id = UUID()
        let path: String
        let emoji: String
        let egoView: String
        let darkNight: String
        let endGoal: String
        let corePractice: String
        let keyInsight: String
    }
    
    private let paths: [PathComparison] = [
        PathComparison(
            path: "Buddhist", emoji: "☸️",
            egoView: "Illusion (anatta — no-self)",
            darkNight: "Dukkha ñanas — disillusionment with conditioned reality",
            endGoal: "Nirvana — cessation of suffering",
            corePractice: "Meditation, mindfulness, ethical conduct",
            keyInsight: "Suffering has a cause; the cause can be ended"
        ),
        PathComparison(
            path: "Christian Mysticism", emoji: "✝️",
            egoView: "False self blocking union with God",
            darkNight: "Dark Night of Senses & Spirit (St. John of the Cross)",
            endGoal: "Union with God (theosis)",
            corePractice: "Contemplative prayer, surrender, lectio divina",
            keyInsight: "The kingdom of God is within you"
        ),
        PathComparison(
            path: "Sufism", emoji: "🌀",
            egoView: "Nafs (ego-self) — veil between lover and Beloved",
            darkNight: "Fana — annihilation of ego",
            endGoal: "Baqa — subsistence in God",
            corePractice: "Dhikr, sama, whirling, devotion",
            keyInsight: "You are the ocean in a drop"
        ),
        PathComparison(
            path: "Alchemy", emoji: "⚗️",
            egoView: "Lead — dense, unrefined consciousness",
            darkNight: "Nigredo — blackening, putrefaction",
            endGoal: "Rubedo — Philosopher's Stone / gold consciousness",
            corePractice: "Inner laboratory, shadow work",
            keyInsight: "Transformation requires destruction of the old"
        ),
        PathComparison(
            path: "Yogic", emoji: "🕉️",
            egoView: "Ahamkara (ego-maker) — misidentification with body/mind",
            darkNight: "Kundalini crises, granthi untying",
            endGoal: "Moksha — liberation; union of Atman & Brahman",
            corePractice: "Bhakti/Jnana/Karma/Raja yoga",
            keyInsight: "Four doors into one room — matched to temperament"
        ),
        PathComparison(
            path: "Jungian", emoji: "🧠",
            egoView: "Persona — mask worn for society",
            darkNight: "Shadow integration / individuation crisis",
            endGoal: "Individuation — psychological wholeness",
            corePractice: "Active imagination, dream analysis, therapy",
            keyInsight: "The unconscious contains both wound and cure"
        ),
        PathComparison(
            path: "Gnostic", emoji: "🔺",
            egoView: "Archonic programming — false identity from the Demiurge",
            darkNight: "Remembering you don't belong here",
            endGoal: "Gnosis — direct knowledge; escape the matrix",
            corePractice: "Self-knowledge, rejection of false authority",
            keyInsight: "The creator of this world is not the true God"
        ),
    ]
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(hex: "#0a0a0f").ignoresSafeArea()
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 16) {
                        Text("🗺️").font(.system(size: 36))
                        Text("Different Maps, Same Territory")
                            .font(.system(size: 18, weight: .black)).foregroundColor(.white)
                        Text("Every row is a different tradition.\nEvery column is the same question.\nNotice the patterns.")
                            .font(.system(size: 11, weight: .medium)).foregroundColor(.white.opacity(0.35))
                            .multilineTextAlignment(.center)
                        
                        ForEach(paths) { path in
                            pathCard(path)
                        }
                        
                        // The insight
                        VStack(spacing: 8) {
                            Rectangle().fill(accentColor.opacity(0.2)).frame(height: 1)
                            Text("Seven traditions. Seven languages. One process.")
                                .font(.system(size: 14, weight: .bold)).foregroundColor(accentColor)
                            Text("Ego dissolves. Darkness purifies. Light returns.\nNobody owns this pattern. Everybody describes it.")
                                .font(.system(size: 11, weight: .medium)).foregroundColor(.white.opacity(0.35))
                                .multilineTextAlignment(.center)
                        }
                        .padding(.top, 10)
                        
                        Spacer(minLength: 60)
                    }
                    .padding(.horizontal, 16).padding(.top, 10)
                }
            }
            .navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) { Text("Comparison Matrix").font(.system(size: 16, weight: .bold)).foregroundColor(.white) }
                ToolbarItem(placement: .navigationBarTrailing) { Button("Done") { dismiss() }.foregroundColor(accentColor) }
            }
            .toolbarBackground(Color(hex: "#0a0a0f"), for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
        }
    }
    
    private func pathCard(_ path: PathComparison) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(spacing: 8) {
                Text(path.emoji).font(.system(size: 20))
                Text(path.path).font(.system(size: 15, weight: .bold)).foregroundColor(.white)
            }
            
            matrixRow("View of Ego", path.egoView)
            matrixRow("Dark Night", path.darkNight)
            matrixRow("End Goal", path.endGoal)
            matrixRow("Core Practice", path.corePractice)
            
            HStack(alignment: .top, spacing: 6) {
                Text("💡").font(.system(size: 10))
                Text(path.keyInsight).font(.system(size: 11, weight: .bold)).foregroundColor(accentColor.opacity(0.8)).italic()
            }
        }
        .padding(12)
        .background(RoundedRectangle(cornerRadius: 12).fill(Color.white.opacity(0.02)))
        .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.white.opacity(0.04), lineWidth: 1))
    }
    
    private func matrixRow(_ label: String, _ value: String) -> some View {
        HStack(alignment: .top, spacing: 8) {
            Text(label).font(.system(size: 9, weight: .black)).tracking(0.3).foregroundColor(.white.opacity(0.2))
                .frame(width: 70, alignment: .trailing)
            Text(value).font(.system(size: 11, weight: .medium)).foregroundColor(.white.opacity(0.55)).lineSpacing(2)
        }
    }
}

// MARK: - ═══════════════════════════════════════════════════
// PLANES LADDER — Interactive 8-Layer Visual
// "Think of reality like a building with floors"
// ═══════════════════════════════════════════════════════════

struct PlanesLadderView: View {
    
    @Environment(\.dismiss) var dismiss
    @State private var expandedPlane: String?
    
    struct PlaneInfo: Identifiable {
        let id: String
        let floor: String
        let name: String
        let emoji: String
        let color: Color
        let plainEnglish: String
        let traditions: String
        let youveBeenHere: String
        let stageLink: String
    }
    
    private let planes: [PlaneInfo] = [
        PlaneInfo(id: "brahmaloka", floor: "7", name: "Brahmaloka", emoji: "🏔️",
                  color: Color(red: 1.0, green: 0.95, blue: 0.7),
                  plainEnglish: "Truth-Consciousness-Bliss. The absolute peak. Beyond karma, beyond duality.",
                  traditions: "Vedas • Upanishads • Hindu highest heaven",
                  youveBeenHere: "Peak mystical states. Psychedelic ego dissolution. \"Knowing everything\" for a moment.",
                  stageLink: "Unity Consciousness (Stage 7)"),
        PlaneInfo(id: "empyrean", floor: "6", name: "Empyrean", emoji: "☀️",
                  color: Color(red: 1.0, green: 0.85, blue: 0.4),
                  plainEnglish: "Pure light, pure love. All distinctions dissolve. Not a place — a state of being.",
                  traditions: "Dante • Neoplatonism • Sufi baqa • Advaita Vedanta",
                  youveBeenHere: "Non-dual awareness. Deep meditation where self/other boundary vanishes.",
                  stageLink: "Unity Consciousness (Stage 7)"),
        PlaneInfo(id: "causal", floor: "5", name: "Causal", emoji: "🔮",
                  color: Color(red: 0.7, green: 0.5, blue: 1.0),
                  plainEnglish: "The soul's hard drive. All karma stored. Past, present, future as one tapestry.",
                  traditions: "Karana sharira • Higher Self • Kabbalah neshamah • Seed consciousness",
                  youveBeenHere: "NDEs showing whole life at once. Prophetic dreams. Post-Dark Night deep peace.",
                  stageLink: "Integration → Unity (Stages 6-7)"),
        PlaneInfo(id: "mental", floor: "4", name: "Mental", emoji: "💭",
                  color: Color(red: 0.3, green: 0.7, blue: 1.0),
                  plainEnglish: "Where ideas are alive. Pure thought as living things. Archetypes and universal patterns.",
                  traditions: "Akashic Records • Plato's Forms • Vedanta manas • Kabbalah Briah",
                  youveBeenHere: "Creative downloads. Solutions appearing fully formed. Flow state beyond words.",
                  stageLink: "Seeker → Integration (Stages 4-6)"),
        PlaneInfo(id: "astral", floor: "3", name: "Astral", emoji: "🌊",
                  color: Color(red: 0.3, green: 0.8, blue: 0.7),
                  plainEnglish: "Dream layer. Emotions amplified. Thought creates instantly. Beautiful but deceptive.",
                  traditions: "Kama-loka • Dream realms • Sufi imaginal • Purgatory visions",
                  youveBeenHere: "Vivid dreams. Sleep paralysis. Psychedelic visuals. Meditation visions.",
                  stageLink: "Seeker / Dark Night (Stages 4-5)"),
        PlaneInfo(id: "etheric", floor: "2", name: "Etheric", emoji: "⚡",
                  color: Color(red: 0.2, green: 0.9, blue: 0.5),
                  plainEnglish: "The WiFi layer. Life-force energy. Can't see it, but it connects everything.",
                  traditions: "Prana • Qi/Chi • Biofield • Etheric body • Reiki",
                  youveBeenHere: "Tingling in meditation. Feeling someone's vibe. Kundalini surges. Sensing tension in a room.",
                  stageLink: "Awakening / Kundalini (Stage 3)"),
        PlaneInfo(id: "physical", floor: "1", name: "Physical", emoji: "🌍",
                  color: Color(red: 0.4, green: 0.6, blue: 0.4),
                  plainEnglish: "Ground floor. Matter, senses, time, space. Where you are right now. Where the work happens.",
                  traditions: "Maya • Malkuth • Samsara • Material world",
                  youveBeenHere: "Every moment of your waking life. The sacred ground floor.",
                  stageLink: "Sleepwalker → Cracks (Stages 1-2)"),
        PlaneInfo(id: "naraka", floor: "B", name: "Naraka", emoji: "🔥",
                  color: Color(red: 0.8, green: 0.2, blue: 0.1),
                  plainEnglish: "The basement. Purification, NOT punishment. Temporary. Karma burns clean here.",
                  traditions: "Hindu Naraka • Buddhist hells • Purgatory • Alchemical nigredo",
                  youveBeenHere: "Dark Night of the Soul. Existential despair. Shadow confrontation. Healing crisis.",
                  stageLink: "Dark Night (Stage 5)"),
    ]
    
    var body: some View {
        NavigationStack {
            ZStack {
                // Gradient from golden top to dark bottom
                LinearGradient(
                    colors: [
                        Color(red: 0.15, green: 0.12, blue: 0.05),
                        Color(hex: "#0a0a0f"),
                        Color(red: 0.1, green: 0.02, blue: 0.02)
                    ],
                    startPoint: .top, endPoint: .bottom
                ).ignoresSafeArea()
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 0) {
                        Text("🏗️").font(.system(size: 36)).padding(.top, 10)
                        Text("The Building").font(.system(size: 22, weight: .black)).foregroundColor(.white)
                        Text("Tap any floor to explore").font(.system(size: 11, weight: .medium)).foregroundColor(.white.opacity(0.3)).padding(.bottom, 16)
                        
                        // The ladder
                        VStack(spacing: 2) {
                            ForEach(planes) { plane in
                                planeRow(plane)
                            }
                        }
                        .padding(.horizontal, 12)
                        
                        // Footer
                        Text("Every tradition drew this building.\nDifferent architects. Same structure.")
                            .font(.system(size: 11, weight: .medium)).foregroundColor(.white.opacity(0.2))
                            .multilineTextAlignment(.center).padding(.top, 20)
                        
                        Spacer(minLength: 60)
                    }
                }
            }
            .navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) { Text("Planes Ladder").font(.system(size: 16, weight: .bold)).foregroundColor(.white) }
                ToolbarItem(placement: .navigationBarTrailing) { Button("Done") { dismiss() }.foregroundColor(.orange) }
            }
            .toolbarBackground(Color(hex: "#0a0a0f"), for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
        }
    }
    
    private func planeRow(_ plane: PlaneInfo) -> some View {
        let isExpanded = expandedPlane == plane.id
        
        return VStack(spacing: 0) {
            // Floor bar
            Button {
                withAnimation(.spring(response: 0.3)) {
                    expandedPlane = isExpanded ? nil : plane.id
                }
                HapticManager.shared.light()
            } label: {
                HStack(spacing: 10) {
                    // Floor number
                    Text(plane.floor)
                        .font(.system(size: 14, weight: .black, design: .rounded))
                        .foregroundColor(.black)
                        .frame(width: 28, height: 28)
                        .background(Circle().fill(plane.color))
                    
                    Text(plane.emoji).font(.system(size: 18))
                    
                    VStack(alignment: .leading, spacing: 1) {
                        Text(plane.name).font(.system(size: 14, weight: .bold)).foregroundColor(.white)
                        Text(plane.plainEnglish).font(.system(size: 9, weight: .medium)).foregroundColor(.white.opacity(0.35)).lineLimit(isExpanded ? nil : 1)
                    }
                    
                    Spacer()
                    Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                        .font(.system(size: 10)).foregroundColor(.white.opacity(0.15))
                }
                .padding(.horizontal, 12).padding(.vertical, 10)
                .background(RoundedRectangle(cornerRadius: 10).fill(plane.color.opacity(isExpanded ? 0.08 : 0.03)))
            }
            .buttonStyle(.plain)
            
            // Expanded detail
            if isExpanded {
                VStack(alignment: .leading, spacing: 8) {
                    detailRow("📚 Traditions", plane.traditions)
                    detailRow("💡 You've been here", plane.youveBeenHere)
                    detailRow("🔗 Stage link", plane.stageLink)
                }
                .padding(.horizontal, 16).padding(.vertical, 10).padding(.leading, 38)
                .background(plane.color.opacity(0.02))
                .transition(.opacity.combined(with: .move(edge: .top)))
            }
        }
    }
    
    private func detailRow(_ label: String, _ value: String) -> some View {
        VStack(alignment: .leading, spacing: 2) {
            Text(label).font(.system(size: 9, weight: .black)).foregroundColor(.white.opacity(0.2))
            Text(value).font(.system(size: 11, weight: .medium)).foregroundColor(.white.opacity(0.55)).lineSpacing(2)
        }
    }
}
