// AwakeningView.swift

import SwiftUI

struct AwakeningView: View {
    
    @StateObject private var presenterBox: AwakeningPresenterBox
    @State private var showDailyCheckIn = false
    @State private var showDissonanceLog = false
    @State private var showRealityAudit = false
    @State private var showQuestionBank = false
    @State private var showMatrixEducation = false
    @State private var showEmotionalProcessing = false
    @State private var showConsciousnessCourse = false
    @State private var showCourseHub = false
    @State private var showAwakeningLanding = false
    @State private var showLevelUpAlert = false
    @State private var levelUpData: AwakeningLevel?
    @State private var matrixProgress: MatrixEducationProgress = .default
    @State private var courseProgress: CourseProgress = .default
    
    // Essentials / Philosophy intro
    @State private var showEssentials = false
    @State private var hasCheckedFirstVisit = false
    
    private var presenter: AwakeningPresenterType { presenterBox.presenter }
    
    init(presenter: AwakeningPresenterType) {
        _presenterBox = StateObject(wrappedValue: AwakeningPresenterBox(presenter: presenter))
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                cosmicBackground
                
                ScrollView {
                    VStack(spacing: 24) {
                        Spacer(minLength: 20)
                        levelCard
                        matrixEducationCard
                        courseHubCard
                        consciousnessCourseCard
                        dailyCheckInCard
                        featureCardsSection
                        dragonMessageCard
                        Spacer(minLength: 40)
                    }
                    .padding(.horizontal, 20)
                }
            }
            .navigationTitle("Awakening")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        HapticManager.shared.light()
                        showEssentials = true
                    } label: {
                        Image(systemName: "info.circle")
                            .foregroundColor(Palette.accent.gold)
                    }
                }
            }
            .sheet(isPresented: $showEssentials) {
                AwakeningEssentialsView()
            }
            .sheet(isPresented: $showDailyCheckIn) {
                DailyCheckInSheet { checkIn in
                    presenter.saveCheckIn(checkIn)
                    showDailyCheckIn = false
                } onDismiss: { showDailyCheckIn = false }
            }
            .sheet(isPresented: $showDissonanceLog) {
                CognitiveDissonanceSheet(entries: presenterBox.profile.dissonanceLog) { entry in
                    presenter.saveDissonanceEntry(entry)
                } onDismiss: { showDissonanceLog = false }
            }
            .sheet(isPresented: $showRealityAudit) {
                RealityAuditSheet(entries: presenterBox.profile.auditEntries) { entry in
                    presenter.saveAuditEntry(entry)
                } onDismiss: { showRealityAudit = false }
            }
            .sheet(isPresented: $showQuestionBank) {
                QuestionBankSheet(entries: presenterBox.profile.questionHistory) { entry in
                    presenter.saveQuestionEntry(entry)
                } onDismiss: { showQuestionBank = false }
            }
            .sheet(isPresented: $showMatrixEducation) {
                MatrixEducationView()
            }
            .sheet(isPresented: $showEmotionalProcessing) {
                EmotionalProcessingSheet { showEmotionalProcessing = false }
            }
            .sheet(isPresented: $showConsciousnessCourse) {
                ConsciousnessCourseView()
            }
            .sheet(isPresented: $showCourseHub) {
                CourseHubView()
            }
            .sheet(isPresented: $showAwakeningLanding) {
                AwakeningLandingView()
            }
            .alert("🎉 LEVEL UP!", isPresented: $showLevelUpAlert) {
                Button("Hell Yes!") { showLevelUpAlert = false }
            } message: {
                if let level = levelUpData {
                    Text("You've reached \(level.title)!\n\n\(level.dragonMessage)")
                }
            }
        }
        .onAppear { 
            presenter.viewDidLoad()
            
            // Show essentials on first visit
            if !hasCheckedFirstVisit {
                hasCheckedFirstVisit = true
                if !AwakeningFirstVisitManager.shared.hasSeenEssentials {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        showEssentials = true
                    }
                }
            }
        }
        .onChange(of: showEssentials) { _, isShowing in
            if !isShowing {
                // Mark as seen when dismissed
                AwakeningFirstVisitManager.shared.markAsSeen()
            }
        }
        .onChange(of: presenterBox.newLevelUp) { _, newLevel in
            if let level = newLevel {
                levelUpData = level
                showLevelUpAlert = true
                presenterBox.newLevelUp = nil
            }
        }
        .withModuleTutorial(.awakening)
    }
    
    private var levelCard: some View {
        let profile = presenterBox.profile
        let level = profile.currentLevel
        
        return VStack(spacing: 16) {
            ZStack {
                Circle()
                    .fill(RadialGradient(colors: [level.color.opacity(0.4), level.color.opacity(0.05)], center: .center, startRadius: 0, endRadius: 50))
                    .frame(width: 100, height: 100)
                Image(systemName: level.icon)
                    .font(.system(size: 44, weight: .bold))
                    .foregroundColor(level.color)
            }
            .shadow(color: level.color.opacity(0.5), radius: 15)
            
            Text(level.title)
                .font(.system(size: 24, weight: .bold, design: .rounded))
                .foregroundStyle(LinearGradient(colors: [level.color, level.color.opacity(0.7)], startPoint: .leading, endPoint: .trailing))
            
            Text(level.subtitle)
                .font(.system(size: 14, weight: .medium, design: .rounded))
                .foregroundColor(Palette.text.secondary)
                .multilineTextAlignment(.center)
            
            if level != .godMode {
                VStack(spacing: 8) {
                    GeometryReader { geo in
                        ZStack(alignment: .leading) {
                            RoundedRectangle(cornerRadius: 6).fill(Color.white.opacity(0.1)).frame(height: 10)
                            RoundedRectangle(cornerRadius: 6)
                                .fill(LinearGradient(colors: [level.color, level.color.opacity(0.6)], startPoint: .leading, endPoint: .trailing))
                                .frame(width: geo.size.width * profile.progressToNextLevel, height: 10)
                        }
                    }
                    .frame(height: 10)
                    
                    HStack {
                        Text("Score: \(profile.currentScore)")
                            .font(.system(size: 12, weight: .medium, design: .rounded))
                            .foregroundColor(Palette.text.muted)
                        Spacer()
                        if let next = level.nextLevel {
                            Text("Next: \(next.requiredScore)")
                                .font(.system(size: 12, weight: .medium, design: .rounded))
                                .foregroundColor(Palette.text.muted)
                        }
                    }
                }
                .padding(.horizontal, 20)
            } else {
                Text("☀️ FULLY AWAKENED ☀️")
                    .font(.system(size: 12, weight: .bold, design: .rounded))
                    .foregroundColor(Palette.accent.gold)
            }
        }
        .padding(24)
        .background(
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(Color.white.opacity(0.05))
                .overlay(RoundedRectangle(cornerRadius: 20, style: .continuous).stroke(level.color.opacity(0.3), lineWidth: 1))
        )
    }
    
    private var matrixEducationCard: some View {
        Button { showMatrixEducation = true } label: {
            VStack(alignment: .leading, spacing: 12) {
                HStack {
                    Text("🔴").font(.system(size: 22))
                    Text("THE MATRIX DECODED").font(.system(size: 13, weight: .bold, design: .rounded)).tracking(2).foregroundColor(Palette.primary.red)
                    Spacer()
                    Text("\(matrixProgress.layersCompleted.count)/10").font(.system(size: 14, weight: .bold, design: .rounded)).foregroundColor(matrixProgress.hasCompletedAllLayers ? Color.green : Palette.primary.red)
                }
                
                Text("Understand the 10 layers of programming")
                    .font(.system(size: 16, weight: .semibold, design: .rounded))
                    .foregroundColor(Palette.text.primary)
                
                // Mini progress bar
                GeometryReader { geo in
                    ZStack(alignment: .leading) {
                        RoundedRectangle(cornerRadius: 4).fill(Color.white.opacity(0.1)).frame(height: 6)
                        RoundedRectangle(cornerRadius: 4)
                            .fill(LinearGradient(colors: [Palette.primary.red, Palette.primary.orange, Palette.accent.gold], startPoint: .leading, endPoint: .trailing))
                            .frame(width: geo.size.width * matrixProgress.completionPercentage, height: 6)
                    }
                }
                .frame(height: 6)
                
                HStack {
                    Image(systemName: matrixProgress.hasCompletedAllLayers ? "checkmark.circle.fill" : "book.fill")
                        .foregroundColor(matrixProgress.hasCompletedAllLayers ? Color.green : Palette.primary.red)
                    Text(matrixProgress.hasCompletedAllLayers ? "All layers understood" : "Foundation required")
                        .font(.system(size: 12, weight: .medium, design: .rounded))
                        .foregroundColor(matrixProgress.hasCompletedAllLayers ? Color.green : Palette.text.muted)
                    Spacer()
                    Image(systemName: "chevron.right.circle.fill").font(.system(size: 16)).foregroundColor(Palette.primary.red.opacity(0.7))
                }
            }
            .padding(16)
            .background(
                RoundedRectangle(cornerRadius: 16, style: .continuous)
                    .fill(Palette.primary.red.opacity(0.1))
                    .overlay(RoundedRectangle(cornerRadius: 16, style: .continuous).stroke(Palette.primary.red.opacity(0.3), lineWidth: 1))
            )
        }
        .buttonStyle(PlainButtonStyle())
        .onAppear { loadMatrixProgress() }
    }
    
    private func loadMatrixProgress() {
        if let data = UserDefaults.standard.data(forKey: "matrix_education_progress"),
           let saved = try? JSONDecoder().decode(MatrixEducationProgress.self, from: data) {
            matrixProgress = saved
        }
    }
    
    private var consciousnessCourseCard: some View {
        let db = ConsciousnessCourseDatabase.shared
        let completedLessons = courseProgress.completedLessons.count
        let totalLessons = db.totalLessons
        let progressPercent = totalLessons > 0 ? Double(completedLessons) / Double(totalLessons) : 0
        
        return Button { showConsciousnessCourse = true } label: {
            VStack(alignment: .leading, spacing: 12) {
                HStack {
                    Image(systemName: "brain.head.profile")
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundStyle(LinearGradient(colors: [Palette.primary.cyan, Palette.primary.violet], startPoint: .topLeading, endPoint: .bottomTrailing))
                    Text("PHD CONSCIOUSNESS").font(.system(size: 13, weight: .bold, design: .rounded)).tracking(2).foregroundColor(Palette.primary.cyan)
                    Spacer()
                    Text("\(completedLessons)/\(totalLessons)").font(.system(size: 14, weight: .bold, design: .rounded)).foregroundColor(completedLessons == totalLessons ? Color.green : Palette.primary.cyan)
                }
                
                Text("The Science & Philosophy of Consciousness")
                    .font(.system(size: 16, weight: .semibold, design: .rounded))
                    .foregroundColor(Palette.text.primary)
                
                // Mini progress bar
                GeometryReader { geo in
                    ZStack(alignment: .leading) {
                        RoundedRectangle(cornerRadius: 4).fill(Color.white.opacity(0.1)).frame(height: 6)
                        RoundedRectangle(cornerRadius: 4)
                            .fill(LinearGradient(colors: [Palette.primary.cyan, Palette.primary.violet], startPoint: .leading, endPoint: .trailing))
                            .frame(width: geo.size.width * progressPercent, height: 6)
                    }
                }
                .frame(height: 6)
                
                HStack {
                    Image(systemName: "graduationcap.fill").foregroundColor(Palette.primary.cyan)
                    Text("\(db.modules.count) modules • \(db.totalMinutes / 60)+ hours")
                        .font(.system(size: 12, weight: .medium, design: .rounded))
                        .foregroundColor(Palette.text.muted)
                    Spacer()
                    Image(systemName: "chevron.right.circle.fill").font(.system(size: 16)).foregroundColor(Palette.primary.cyan.opacity(0.7))
                }
            }
            .padding(16)
            .background(
                RoundedRectangle(cornerRadius: 16, style: .continuous)
                    .fill(LinearGradient(colors: [Palette.primary.cyan.opacity(0.1), Palette.primary.violet.opacity(0.1)], startPoint: .topLeading, endPoint: .bottomTrailing))
                    .overlay(RoundedRectangle(cornerRadius: 16, style: .continuous).stroke(Palette.primary.cyan.opacity(0.3), lineWidth: 1))
            )
        }
        .buttonStyle(PlainButtonStyle())
        .onAppear { loadCourseProgress() }
    }
    
    private var courseHubCard: some View {
        Button {
            showAwakeningLanding = true
        } label: {
            HStack(spacing: 16) {
                ZStack {
                    RoundedRectangle(cornerRadius: 12)
                        .fill(LinearGradient(colors: [Palette.accent.gold.opacity(0.3), Palette.primary.violet.opacity(0.3)], startPoint: .topLeading, endPoint: .bottomTrailing))
                        .frame(width: 60, height: 60)
                    
                    Image(systemName: "sparkles")
                        .font(.system(size: 28, weight: .bold))
                        .foregroundColor(Palette.accent.gold)
                }
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("AWAKENING ACADEMY")
                        .font(.system(size: 10, weight: .bold, design: .rounded))
                        .foregroundColor(Palette.accent.gold)
                        .tracking(2)
                    
                    Text("Truth Courses & Documentaries")
                        .font(.system(size: 16, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                    
                    Text("13+ courses • 8 documentaries")
                        .font(.system(size: 12, weight: .medium))
                        .foregroundColor(Palette.text.secondary)
                }
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(Palette.text.muted)
            }
            .padding(16)
            .background(
                RoundedRectangle(cornerRadius: 16, style: .continuous)
                    .fill(Color.white.opacity(0.05))
                    .overlay(
                        RoundedRectangle(cornerRadius: 16, style: .continuous)
                            .stroke(Palette.accent.gold.opacity(0.3), lineWidth: 1)
                    )
            )
        }
        .buttonStyle(PlainButtonStyle())
    }
    
    private func loadCourseProgress() {
        if let data = UserDefaults.standard.data(forKey: "consciousness_course_progress"),
           let saved = try? JSONDecoder().decode(CourseProgress.self, from: data) {
            courseProgress = saved
        }
    }
    
    private var dailyCheckInCard: some View {
        Button { showDailyCheckIn = true } label: {
            VStack(alignment: .leading, spacing: 12) {
                HStack {
                    Image(systemName: "sun.max.fill").font(.system(size: 24, weight: .bold)).foregroundColor(Palette.accent.gold)
                    Text("TODAY'S CHECK-IN").font(.system(size: 13, weight: .bold, design: .rounded)).tracking(2).foregroundColor(Palette.accent.gold)
                    Spacer()
                    Image(systemName: "chevron.right.circle.fill").font(.system(size: 20)).foregroundColor(Palette.accent.gold.opacity(0.7))
                }
                Text("Where did I go unconscious today?").font(.system(size: 18, weight: .semibold, design: .rounded)).foregroundColor(Palette.text.primary)
                Text("Log a moment when you lost awareness and reacted automatically").font(.system(size: 13, weight: .medium, design: .rounded)).foregroundColor(Palette.text.secondary)
                
                let todayCheckIns = presenterBox.profile.checkIns.filter { Calendar.current.isDateInToday($0.date) }.count
                HStack {
                    Image(systemName: todayCheckIns > 0 ? "checkmark.circle.fill" : "circle").foregroundColor(todayCheckIns > 0 ? Color.green : Palette.text.muted)
                    Text(todayCheckIns > 0 ? "Logged today" : "Not logged yet").font(.system(size: 12, weight: .medium, design: .rounded)).foregroundColor(todayCheckIns > 0 ? Color.green : Palette.text.muted)
                    Spacer()
                    Text("\(presenterBox.profile.totalCheckIns) total").font(.system(size: 12, weight: .medium, design: .rounded)).foregroundColor(Palette.text.muted)
                }
            }
            .padding(20)
            .background(
                RoundedRectangle(cornerRadius: 16, style: .continuous)
                    .fill(Palette.accent.gold.opacity(0.1))
                    .overlay(RoundedRectangle(cornerRadius: 16, style: .continuous).stroke(Palette.accent.gold.opacity(0.3), lineWidth: 1))
            )
        }
        .buttonStyle(PlainButtonStyle())
    }
    
    private var featureCardsSection: some View {
        VStack(spacing: 14) {
            featureCard(icon: "brain.head.profile", title: "Cognitive Dissonance", subtitle: "Log when reality ≠ what you were taught", stat: "\(presenterBox.profile.totalDissonanceEntries) entries", color: Palette.primary.violet) { showDissonanceLog = true }
            featureCard(icon: "checklist", title: "Reality Audit", subtitle: "Inventory and examine your beliefs", stat: "\(presenterBox.profile.examinedBeliefs)/\(presenterBox.profile.totalBeliefs) examined", color: Palette.primary.cyan) { showRealityAudit = true }
            featureCard(icon: "questionmark.circle.fill", title: "Question Bank", subtitle: "Socratic questions to challenge assumptions", stat: "\(presenterBox.profile.answeredQuestions) answered", color: Palette.primary.orange) { showQuestionBank = true }
            featureCard(icon: "heart.circle.fill", title: "Emotional Processing", subtitle: "Guides for grief, anger, and betrayal", stat: "Dark Night Tools", color: Color.pink) { showEmotionalProcessing = true }
        }
    }
    
    private func featureCard(icon: String, title: String, subtitle: String, stat: String, color: Color, action: @escaping () -> Void) -> some View {
        Button(action: { 
            HapticManager.shared.cardFlip()
            action() 
        }) {
            HStack(spacing: 14) {
                ZStack {
                    Circle().fill(color.opacity(0.2)).frame(width: 48, height: 48)
                    Image(systemName: icon).font(.system(size: 22, weight: .semibold)).foregroundColor(color)
                }
                VStack(alignment: .leading, spacing: 4) {
                    Text(title).font(.system(size: 16, weight: .bold, design: .rounded)).foregroundColor(Palette.text.primary)
                    Text(subtitle).font(.system(size: 12, weight: .medium, design: .rounded)).foregroundColor(Palette.text.secondary).lineLimit(1)
                }
                Spacer()
                VStack(alignment: .trailing, spacing: 2) {
                    Text(stat).font(.system(size: 12, weight: .semibold, design: .rounded)).foregroundColor(color)
                    Image(systemName: "chevron.right").font(.system(size: 11, weight: .semibold)).foregroundColor(Palette.text.muted)
                }
            }
            .padding(16)
            .background(
                RoundedRectangle(cornerRadius: 14, style: .continuous)
                    .fill(Color.white.opacity(0.05))
                    .overlay(RoundedRectangle(cornerRadius: 14, style: .continuous).stroke(color.opacity(0.2), lineWidth: 1))
            )
        }
        .buttonStyle(PlainButtonStyle())
    }
    
    private var dragonMessageCard: some View {
        HStack(alignment: .top, spacing: 12) {
            Text("🐉").font(.system(size: 24))
            Text(presenterBox.profile.currentLevel.dragonMessage)
                .font(.system(size: 14, weight: .medium, design: .rounded))
                .italic()
                .foregroundColor(Palette.accent.gold)
                .lineSpacing(5)
        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 14, style: .continuous)
                .fill(Palette.accent.gold.opacity(0.1))
                .overlay(RoundedRectangle(cornerRadius: 14, style: .continuous).stroke(Palette.accent.gold.opacity(0.3), lineWidth: 1))
        )
    }
    
    private var cosmicBackground: some View {
        ZStack {
            PaletteGradients.cosmicBackground.ignoresSafeArea()
            ForEach(0..<40, id: \.self) { i in
                Circle()
                    .fill([Palette.accent.gold, Palette.primary.violet, Palette.primary.cyan].randomElement()!.opacity(Double.random(in: 0.2...0.5)))
                    .frame(width: CGFloat.random(in: 1...3), height: CGFloat.random(in: 1...3))
                    .position(x: CGFloat.random(in: 0...UIScreen.main.bounds.width), y: CGFloat.random(in: 0...UIScreen.main.bounds.height))
                    .blur(radius: Double.random(in: 0.5...1.5))
            }
        }
    }
}

final class AwakeningPresenterBox: ObservableObject {
    let presenter: AwakeningPresenterType
    @Published var profile: AwakeningProfile = .default
    @Published var newLevelUp: AwakeningLevel?
    @Published var errorMessage: String?
    
    init(presenter: AwakeningPresenterType) {
        self.presenter = presenter
        if let awakPresenter = presenter as? AwakeningPresenter {
            awakPresenter.viewBox = self
        }
    }
}

extension AwakeningPresenterBox: AwakeningViewType {
    func displayProfile(_ profile: AwakeningProfile) {
        DispatchQueue.main.async { self.profile = profile }
    }
    func displayError(_ message: String) {
        DispatchQueue.main.async { self.errorMessage = message }
    }
    func showLevelUp(to level: AwakeningLevel) {
        DispatchQueue.main.async { self.newLevelUp = level }
    }
}

struct AwakeningEntryView: View {
    let presenter: AwakeningPresenterType
    var body: some View { AwakeningView(presenter: presenter) }
}
