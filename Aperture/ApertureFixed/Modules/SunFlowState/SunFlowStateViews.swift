// SunFlowStateViews.swift
// All remaining Sun Flow State views: Compass, Guided Sessions,
// Weekly Blueprint, Execution Scorecard, Error Log, Swipe File.
// ☀️ SunFlow: Reignited

import SwiftUI

// MARK: - ═══════════════════════════════════════════════════
// NEXT-LEVEL COMPASS — Identity + Pillars
// ═══════════════════════════════════════════════════════════

struct NextLevelCompassView: View {
    
    @StateObject private var engine = SunFlowStateEngine.shared
    @Environment(\.dismiss) var dismiss
    @State private var visionText = ""
    @State private var newPillarTitle = ""
    @State private var newPillarEmoji = "⚡"
    
    private let emojiOptions = ["⚡", "🔥", "💰", "💪", "📚", "🎨", "❤️", "🧠", "🌍", "🚀", "🎯", "✨"]
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(hex: "#0a0a0f").ignoresSafeArea()
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 20) {
                        Text("🧭").font(.system(size: 44)).padding(.top, 10)
                        Text("Your Next-Level Compass").font(.system(size: 20, weight: .black)).foregroundColor(Color(red: 1.0, green: 0.85, blue: 0.3))
                        Text("Describe the version of you that exists 6-12 months from now.\nBrutally specific. Present tense.")
                            .font(.system(size: 11, weight: .medium)).foregroundColor(.white.opacity(0.35))
                            .multilineTextAlignment(.center)
                        
                        // Vision
                        VStack(alignment: .leading, spacing: 8) {
                            Text("MY NEXT-LEVEL SELF").font(.system(size: 9, weight: .black)).tracking(1).foregroundColor(.white.opacity(0.2))
                            TextEditor(text: $visionText)
                                .font(.system(size: 14)).foregroundColor(.white)
                                .scrollContentBackground(.hidden)
                                .frame(minHeight: 100)
                                .padding(10)
                                .background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.04)))
                        }
                        
                        // Pillars
                        VStack(alignment: .leading, spacing: 10) {
                            HStack {
                                Text("MY 3-5 PERMANENT PILLARS").font(.system(size: 9, weight: .black)).tracking(1).foregroundColor(.white.opacity(0.2))
                                Spacer()
                                Text("\(engine.compass.pillars.count)/5").font(.system(size: 10, weight: .bold)).foregroundColor(.white.opacity(0.2))
                            }
                            
                            ForEach(Array(engine.compass.pillars.enumerated()), id: \.element.id) { index, pillar in
                                HStack(spacing: 10) {
                                    Text("\(index + 1).").font(.system(size: 14, weight: .bold)).foregroundColor(Color(red: 1.0, green: 0.85, blue: 0.3)).frame(width: 20)
                                    Text(pillar.emoji).font(.system(size: 16))
                                    Text(pillar.title).font(.system(size: 14, weight: .medium)).foregroundColor(.white)
                                    Spacer()
                                    Button { engine.removePillar(at: index) } label: {
                                        Image(systemName: "xmark.circle.fill").font(.system(size: 14)).foregroundColor(.red.opacity(0.3))
                                    }
                                }
                                .padding(8).background(RoundedRectangle(cornerRadius: 8).fill(Color.white.opacity(0.02)))
                            }
                            
                            if engine.compass.pillars.count < 5 {
                                HStack(spacing: 8) {
                                    // Emoji picker
                                    ScrollView(.horizontal, showsIndicators: false) {
                                        HStack(spacing: 4) {
                                            ForEach(emojiOptions, id: \.self) { e in
                                                Button { newPillarEmoji = e } label: {
                                                    Text(e).font(.system(size: 16))
                                                        .padding(4)
                                                        .background(Circle().fill(newPillarEmoji == e ? Color.white.opacity(0.1) : Color.clear))
                                                }
                                            }
                                        }
                                    }
                                }
                                
                                HStack(spacing: 8) {
                                    TextField("", text: $newPillarTitle, prompt: Text("New Pillar...").foregroundColor(.white.opacity(0.15)))
                                        .font(.system(size: 13)).foregroundColor(.white)
                                        .padding(10).background(RoundedRectangle(cornerRadius: 8).fill(Color.white.opacity(0.04)))
                                    Button {
                                        guard !newPillarTitle.isEmpty else { return }
                                        engine.addPillar(FlowPillar(title: newPillarTitle, emoji: newPillarEmoji))
                                        newPillarTitle = ""
                                    } label: {
                                        Text("Add").font(.system(size: 12, weight: .bold)).foregroundColor(.black)
                                            .padding(.horizontal, 14).padding(.vertical, 8)
                                            .background(Capsule().fill(Color(red: 1.0, green: 0.85, blue: 0.3)))
                                    }
                                }
                            }
                        }
                        
                        // Bucket reference
                        VStack(alignment: .leading, spacing: 6) {
                            Text("BUCKET QUICK REFERENCE").font(.system(size: 9, weight: .black)).tracking(1).foregroundColor(.white.opacity(0.2))
                            ForEach(FlowBucket.allCases) { bucket in
                                HStack(spacing: 8) {
                                    Text(bucket.emoji).font(.system(size: 12))
                                    Text(bucket.shortLabel).font(.system(size: 11, weight: .bold)).foregroundColor(bucket.color).frame(width: 26, alignment: .leading)
                                    Text(bucket.description).font(.system(size: 10, weight: .medium)).foregroundColor(.white.opacity(0.35))
                                    Spacer()
                                }
                            }
                        }
                        .padding(12).background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.02)))
                        
                        // Save
                        Button {
                            engine.compass.nextLevelSelf = visionText
                            engine.compass.lastUpdated = Date()
                            engine.saveCompass()
                            dismiss()
                        } label: {
                            Text("Save Compass").font(.system(size: 15, weight: .bold)).foregroundColor(.black)
                                .frame(maxWidth: .infinity).padding(.vertical, 14)
                                .background(RoundedRectangle(cornerRadius: 14).fill(Color(red: 1.0, green: 0.85, blue: 0.3)))
                        }
                        
                        Spacer(minLength: 60)
                    }
                    .padding(.horizontal, 16)
                }
            }
            .navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) { Text("Next-Level Compass").font(.system(size: 16, weight: .bold)).foregroundColor(Color(red: 1.0, green: 0.85, blue: 0.3)) }
                ToolbarItem(placement: .navigationBarTrailing) { Button("Done") { dismiss() }.foregroundColor(Color(red: 1.0, green: 0.85, blue: 0.3)) }
            }
            .toolbarBackground(Color(hex: "#0a0a0f"), for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .onAppear { visionText = engine.compass.nextLevelSelf }
        }
    }
}

// MARK: - ═══════════════════════════════════════════════════
// GUIDED SESSION VIEW — Handles all 4 session types × 3 modes
// ═══════════════════════════════════════════════════════════

struct GuidedSessionView: View {
    
    let sessionType: GuidedSessionType
    @Environment(\.dismiss) var dismiss
    @State private var guidanceLevel: GuidanceLevel = .full
    @State private var sessionStarted = false
    @State private var currentStep = 0
    @State private var timeRemaining = 0
    @State private var timer: Timer?
    @State private var notes = ""
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(hex: "#0a0a0f").ignoresSafeArea()
                
                if !sessionStarted {
                    sessionSetup
                } else {
                    sessionActive
                }
            }
            .navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) { Text(sessionType.rawValue).font(.system(size: 15, weight: .bold)).foregroundColor(sessionType.color) }
                ToolbarItem(placement: .navigationBarTrailing) { Button("End") { timer?.invalidate(); dismiss() }.foregroundColor(.red.opacity(0.6)) }
            }
            .toolbarBackground(Color(hex: "#0a0a0f"), for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
        }
        .onDisappear { timer?.invalidate() }
    }
    
    private var sessionSetup: some View {
        VStack(spacing: 24) {
            Spacer()
            Text(sessionType.emoji).font(.system(size: 50))
            Text(sessionType.rawValue).font(.system(size: 22, weight: .black)).foregroundColor(.white)
            Text(sessionType.duration).font(.system(size: 14, weight: .bold)).foregroundColor(sessionType.color)
            
            // Guidance level
            VStack(spacing: 8) {
                Text("GUIDANCE LEVEL").font(.system(size: 9, weight: .black)).tracking(1).foregroundColor(.white.opacity(0.2))
                ForEach(GuidanceLevel.allCases, id: \.self) { level in
                    Button { guidanceLevel = level } label: {
                        HStack {
                            Text(level.rawValue).font(.system(size: 13, weight: guidanceLevel == level ? .bold : .medium))
                                .foregroundColor(guidanceLevel == level ? .black : .white.opacity(0.5))
                            Spacer()
                            Text(level.description).font(.system(size: 10, weight: .medium))
                                .foregroundColor(guidanceLevel == level ? .black.opacity(0.6) : .white.opacity(0.2))
                        }
                        .padding(12)
                        .background(RoundedRectangle(cornerRadius: 10).fill(guidanceLevel == level ? sessionType.color : Color.white.opacity(0.03)))
                    }
                }
            }
            .padding(.horizontal, 20)
            
            Button {
                startSession()
            } label: {
                Text("Begin Session").font(.system(size: 16, weight: .bold)).foregroundColor(.black)
                    .frame(maxWidth: .infinity).padding(.vertical, 14)
                    .background(RoundedRectangle(cornerRadius: 14).fill(sessionType.color))
            }
            .padding(.horizontal, 20)
            
            Spacer()
        }
    }
    
    private var sessionActive: some View {
        let steps = sessionSteps
        
        return VStack(spacing: 0) {
            // Step dots
            HStack(spacing: 5) {
                ForEach(0..<steps.count, id: \.self) { i in
                    Circle().fill(i <= currentStep ? sessionType.color : Color.white.opacity(0.1)).frame(width: 5, height: 5)
                }
            }
            .padding(.top, 10)
            
            // Timer
            Text(timerString)
                .font(.system(size: 14, weight: .bold, design: .rounded))
                .foregroundColor(.white.opacity(0.2))
                .monospacedDigit()
                .padding(.top, 6)
            
            if guidanceLevel != .selfDirected && currentStep < steps.count {
                // Guided content
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 14) {
                        Text(steps[currentStep].title)
                            .font(.system(size: 20, weight: .black)).foregroundColor(sessionType.color)
                        
                        if guidanceLevel == .full {
                            Text(steps[currentStep].prompt)
                                .font(.system(size: 13, weight: .medium)).foregroundColor(.white.opacity(0.6))
                                .lineSpacing(5)
                        }
                        
                        if steps[currentStep].hasNotes {
                            TextEditor(text: $notes)
                                .font(.system(size: 13)).foregroundColor(.white)
                                .scrollContentBackground(.hidden)
                                .frame(minHeight: 80)
                                .padding(8)
                                .background(RoundedRectangle(cornerRadius: 8).fill(Color.white.opacity(0.04)))
                        }
                    }
                    .padding(.horizontal, 20).padding(.top, 20)
                }
            } else {
                // Self-directed: just timer
                Spacer()
                Text("🧘").font(.system(size: 60))
                Text("Focus. Be present.").font(.system(size: 14, weight: .medium)).foregroundColor(.white.opacity(0.3))
                Spacer()
            }
            
            // Navigation
            HStack {
                if currentStep > 0 {
                    Button { withAnimation { currentStep -= 1 } } label: {
                        Text("← Back").font(.system(size: 13, weight: .bold)).foregroundColor(.white.opacity(0.4))
                    }
                }
                Spacer()
                if currentStep < steps.count - 1 {
                    Button { withAnimation { currentStep += 1; notes = "" } } label: {
                        Text("Next →").font(.system(size: 13, weight: .bold)).foregroundColor(sessionType.color)
                    }
                } else {
                    Button {
                        timer?.invalidate()
                        dismiss()
                    } label: {
                        Text("Complete ✓").font(.system(size: 14, weight: .bold)).foregroundColor(.black)
                            .padding(.horizontal, 24).padding(.vertical, 10)
                            .background(Capsule().fill(Color.green))
                    }
                }
            }
            .padding(.horizontal, 20).padding(.vertical, 14)
        }
    }
    
    // MARK: - Session Logic
    
    private func startSession() {
        sessionStarted = true
        let totalMinutes: Int
        switch sessionType {
        case .monthlyReflection: totalMinutes = 60
        case .weeklySprint: totalMinutes = 30
        case .dailyAlign: totalMinutes = 10
        case .stillnessTraining: totalMinutes = SunFlowStateEngine.shared.bootcamp.stillnessMinutesTarget
        }
        timeRemaining = totalMinutes * 60
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            if timeRemaining > 0 { timeRemaining -= 1 }
        }
    }
    
    private var timerString: String {
        let m = timeRemaining / 60
        let s = timeRemaining % 60
        return String(format: "%d:%02d", m, s)
    }
    
    private struct SessionStep {
        let title: String
        let prompt: String
        let hasNotes: Bool
    }
    
    private var sessionSteps: [SessionStep] {
        switch sessionType {
        case .monthlyReflection:
            return [
                SessionStep(title: "Stillness", prompt: "Close your eyes. 60 seconds of breath only. Force calm. No judgment.\n\nThis is not meditation theater. This is system reset.", hasNotes: false),
                SessionStep(title: "Identity + Compass", prompt: "What does the next-level version of you look like in 6-12 months?\n\nWhat problems excite you?\nWhat do you enjoy building?\nUpdate or confirm your 3-5 Pillars.", hasNotes: true),
                SessionStep(title: "Reality Audit", prompt: "What worked last month?\nWhat drained energy?\nWhere did P3 or P4 creep in?\nWhat patterns repeated?", hasNotes: true),
                SessionStep(title: "Strategic Goal Setting", prompt: "Choose 1-3 Monthly Targets. P0 or P1 only.\n\nEach must be: Specific. Trackable. Finishable in 30 days. Aligned with a Pillar.\n\nWrite Definition of Done + measurable metric.", hasNotes: true),
                SessionStep(title: "404 Purge & Close", prompt: "Release anything that does not propel.\n\n\"I release all P4. My awareness belongs only to what propels me.\"\n\nOne calm breath. Session complete.", hasNotes: false),
            ]
        case .weeklySprint:
            return [
                SessionStep(title: "Reflection", prompt: "What moved the needle last week?\nWhat stalled and why?\nWhat was your execution score?", hasNotes: true),
                SessionStep(title: "Planning", prompt: "Convert monthly targets into weekly blocks.\n\nFor every task define:\n• WHAT (exact outcome)\n• WHEN (calendar block)\n• WHERE\n• HOW (process + success criteria)\n• WHY (linked Pillar)", hasNotes: true),
                SessionStep(title: "Prioritize", prompt: "Score each task: Urgency × Impact × ROI × Alignment × (10 – Energy Cost).\n\nOnly ≥90% survive. Ties → choose the one that compounds.\n\nBusy work dies. Compound work lives.", hasNotes: false),
                SessionStep(title: "Lock the Blueprint", prompt: "Your week is set. Everything not on the calendar does not exist.\n\nYou wake up and COOK. 🍳", hasNotes: false),
            ]
        case .dailyAlign:
            return [
                SessionStep(title: "Morning Align", prompt: "Open your weekly blueprint.\nDynamic re-score today's tasks.\nPick highest-leverage item.\n\n2-minute flow trigger: deep breath + \"I choose this.\"", hasNotes: false),
                SessionStep(title: "Alignment Check", prompt: "For each item today:\nBucket: P__\nPillar: ____\n\nIf it doesn't propel a Pillar → #404Error it now.", hasNotes: true),
            ]
        case .stillnessTraining:
            return [
                SessionStep(title: "The Sit", prompt: "Timer running. No phone. No music. No journaling. Just sit.\n\nIf agitation spikes, that is withdrawal from constant input.\n\nThis single practice is the crack that opens the entire box.", hasNotes: false),
            ]
        }
    }
}

// MARK: - ═══════════════════════════════════════════════════
// WEEKLY BLUEPRINT VIEW
// ═══════════════════════════════════════════════════════════

struct WeeklyBlueprintView: View {
    
    @StateObject private var engine = SunFlowStateEngine.shared
    @Environment(\.dismiss) var dismiss
    @State private var newTaskTitle = ""
    @State private var newTaskBucket: FlowBucket = .p0
    @State private var selectedPillar: FlowPillar?
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(hex: "#0a0a0f").ignoresSafeArea()
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 16) {
                        // Progress
                        if let bp = engine.currentBlueprint {
                            HStack {
                                Text("Execution: \(Int(bp.completionPercent * 100))%").font(.system(size: 13, weight: .bold)).foregroundColor(.cyan)
                                Spacer()
                                Text("\(bp.tasks.filter(\.isCompleted).count)/\(bp.tasks.count) done").font(.system(size: 11, weight: .medium)).foregroundColor(.white.opacity(0.3))
                            }
                            GeometryReader { geo in
                                ZStack(alignment: .leading) {
                                    RoundedRectangle(cornerRadius: 3).fill(Color.white.opacity(0.05)).frame(height: 5)
                                    RoundedRectangle(cornerRadius: 3).fill(Color.cyan).frame(width: geo.size.width * bp.completionPercent, height: 5)
                                }
                            }
                            .frame(height: 5)
                        } else {
                            Button {
                                let _ = engine.createBlueprint()
                            } label: {
                                Text("Create This Week's Blueprint").font(.system(size: 14, weight: .bold)).foregroundColor(.black)
                                    .frame(maxWidth: .infinity).padding(.vertical, 12)
                                    .background(RoundedRectangle(cornerRadius: 12).fill(Color.cyan))
                            }
                        }
                        
                        // Add task
                        if engine.currentBlueprint != nil {
                            VStack(spacing: 8) {
                                TextField("", text: $newTaskTitle, prompt: Text("New task (be specific)...").foregroundColor(.white.opacity(0.15)))
                                    .font(.system(size: 13)).foregroundColor(.white)
                                    .padding(10).background(RoundedRectangle(cornerRadius: 8).fill(Color.white.opacity(0.04)))
                                
                                HStack(spacing: 4) {
                                    ForEach(FlowBucket.allCases.filter(\.isAllowedInCalendar)) { bucket in
                                        Button { newTaskBucket = bucket } label: {
                                            Text(bucket.shortLabel).font(.system(size: 10, weight: newTaskBucket == bucket ? .bold : .medium))
                                                .foregroundColor(newTaskBucket == bucket ? .black : bucket.color.opacity(0.7))
                                                .padding(.horizontal, 8).padding(.vertical, 5)
                                                .background(Capsule().fill(newTaskBucket == bucket ? bucket.color : bucket.color.opacity(0.08)))
                                        }
                                    }
                                    Spacer()
                                    Button {
                                        guard !newTaskTitle.isEmpty else { return }
                                        let task = FlowTask(title: newTaskTitle, bucket: newTaskBucket, linkedPillarId: selectedPillar?.id)
                                        engine.addTask(task)
                                        newTaskTitle = ""
                                    } label: {
                                        Text("Add").font(.system(size: 12, weight: .bold)).foregroundColor(.black)
                                            .padding(.horizontal, 14).padding(.vertical, 6)
                                            .background(Capsule().fill(Color(red: 1.0, green: 0.85, blue: 0.3)))
                                    }
                                }
                            }
                            .padding(10).background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.02)))
                        }
                        
                        // Prioritized tasks
                        if !engine.prioritizedTasks.isEmpty {
                            Text("PRIORITIZED QUEUE").font(.system(size: 9, weight: .black)).tracking(1).foregroundColor(.white.opacity(0.2)).frame(maxWidth: .infinity, alignment: .leading)
                            
                            ForEach(engine.prioritizedTasks) { task in
                                taskRow(task)
                            }
                        }
                        
                        // Completed
                        let completed = engine.currentBlueprint?.tasks.filter(\.isCompleted) ?? []
                        if !completed.isEmpty {
                            Text("COMPLETED").font(.system(size: 9, weight: .black)).tracking(1).foregroundColor(.green.opacity(0.3)).frame(maxWidth: .infinity, alignment: .leading)
                            ForEach(completed) { task in
                                taskRow(task)
                            }
                        }
                        
                        Spacer(minLength: 60)
                    }
                    .padding(.horizontal, 16).padding(.top, 16)
                }
            }
            .navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) { Text("Weekly Blueprint").font(.system(size: 16, weight: .bold)).foregroundColor(.cyan) }
                ToolbarItem(placement: .navigationBarTrailing) { Button("Done") { dismiss() }.foregroundColor(Color(red: 1.0, green: 0.85, blue: 0.3)) }
            }
            .toolbarBackground(Color(hex: "#0a0a0f"), for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
        }
    }
    
    private func taskRow(_ task: FlowTask) -> some View {
        HStack(spacing: 10) {
            Button { engine.completeTask(task.id) } label: {
                Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                    .font(.system(size: 18)).foregroundColor(task.isCompleted ? .green : task.bucket.color.opacity(0.3))
            }
            Text(task.bucket.emoji).font(.system(size: 12))
            Text(task.title).font(.system(size: 13, weight: .medium))
                .foregroundColor(task.isCompleted ? .white.opacity(0.25) : .white)
                .strikethrough(task.isCompleted)
            Spacer()
            
            if !task.isCompleted {
                // 404 button
                Button { engine.bucketTask(task.id, as: .p4) } label: {
                    Text("404").font(.system(size: 8, weight: .black)).foregroundColor(.red.opacity(0.5))
                        .padding(.horizontal, 6).padding(.vertical, 3)
                        .background(Capsule().fill(Color.red.opacity(0.06)))
                }
            }
        }
        .padding(10).background(RoundedRectangle(cornerRadius: 8).fill(task.bucket.color.opacity(0.02)))
    }
}

// MARK: - ═══════════════════════════════════════════════════
// EXECUTION SCORECARD VIEW
// ═══════════════════════════════════════════════════════════

struct ExecutionScorecardView: View {
    
    @StateObject private var engine = SunFlowStateEngine.shared
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(hex: "#0a0a0f").ignoresSafeArea()
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 20) {
                        // Current week score
                        let weekScore = engine.calculateWeeklyScore()
                        
                        VStack(spacing: 8) {
                            Text("📊").font(.system(size: 40))
                            Text("This Week's Execution").font(.system(size: 18, weight: .black)).foregroundColor(.white)
                            
                            Text("\(Int(weekScore.executionPercent * 100))%")
                                .font(.system(size: 48, weight: .black, design: .rounded))
                                .foregroundColor(weekScore.executionPercent >= 0.9 ? Color(red: 1.0, green: 0.85, blue: 0.3) : weekScore.executionPercent >= 0.7 ? .green : .red)
                            
                            let grade: SovereigntyGrade = weekScore.executionPercent >= 0.9 ? .sovereign : weekScore.executionPercent >= 0.7 ? .solid : .resetRequired
                            Text("\(grade.emoji) \(grade.rawValue)")
                                .font(.system(size: 14, weight: .bold)).foregroundColor(grade.color)
                            Text(grade.message)
                                .font(.system(size: 11, weight: .medium)).foregroundColor(.white.opacity(0.35))
                                .multilineTextAlignment(.center)
                        }
                        
                        // Stats
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 10) {
                            scoreStat("P0/P1 Done", "\(Int(weekScore.p0p1Completion * 100))%", color: .green)
                            scoreStat("404 Errors", "\(weekScore.errorCount)", color: .red)
                            scoreStat("Streak", "\(engine.errorStreak)d", color: Color(red: 1.0, green: 0.85, blue: 0.3))
                            scoreStat("Targets", "\(engine.monthlyTargets.filter(\.isCompleted).count)/\(engine.monthlyTargets.count)", color: .cyan)
                        }
                        
                        // Grade legend
                        VStack(alignment: .leading, spacing: 6) {
                            Text("GRADING").font(.system(size: 9, weight: .black)).tracking(1).foregroundColor(.white.opacity(0.2))
                            gradeRow("≥90%", "Sovereign — Ultra Instinct. Flow is default.", Color(red: 1.0, green: 0.85, blue: 0.3))
                            gradeRow("70-89%", "Solid — Protect buffers, keep stacking.", .green)
                            gradeRow("<70%", "Reset Required — 3-day Phase 0 immediately.", .red)
                        }
                        .padding(12).background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.02)))
                        
                        Spacer(minLength: 60)
                    }
                    .padding(.horizontal, 16).padding(.top, 16)
                }
            }
            .navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) { Text("Execution Scorecard").font(.system(size: 16, weight: .bold)).foregroundColor(.white) }
                ToolbarItem(placement: .navigationBarTrailing) { Button("Done") { dismiss() }.foregroundColor(Color(red: 1.0, green: 0.85, blue: 0.3)) }
            }
            .toolbarBackground(Color(hex: "#0a0a0f"), for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
        }
    }
    
    private func scoreStat(_ label: String, _ value: String, color: Color) -> some View {
        VStack(spacing: 4) {
            Text(value).font(.system(size: 20, weight: .black, design: .rounded)).foregroundColor(color)
            Text(label).font(.system(size: 9, weight: .bold)).foregroundColor(.white.opacity(0.25))
        }
        .frame(maxWidth: .infinity).padding(12)
        .background(RoundedRectangle(cornerRadius: 10).fill(color.opacity(0.04)))
    }
    
    private func gradeRow(_ threshold: String, _ desc: String, _ color: Color) -> some View {
        HStack(spacing: 8) {
            Text(threshold).font(.system(size: 11, weight: .bold)).foregroundColor(color).frame(width: 50, alignment: .leading)
            Text(desc).font(.system(size: 10, weight: .medium)).foregroundColor(.white.opacity(0.35))
        }
    }
}

// MARK: - ═══════════════════════════════════════════════════
// 404 ERROR LOG VIEW
// ═══════════════════════════════════════════════════════════

struct ErrorLogView: View {
    
    @StateObject private var engine = SunFlowStateEngine.shared
    @Environment(\.dismiss) var dismiss
    @State private var newItem = ""
    @State private var selectedCategory: ErrorCategory = .random
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(hex: "#0a0a0f").ignoresSafeArea()
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 16) {
                        // Streak
                        HStack {
                            Text("🚫 404 Streak: \(engine.errorStreak) days").font(.system(size: 13, weight: .bold)).foregroundColor(.red)
                            Spacer()
                            Text("\(engine.errorLog.count) total").font(.system(size: 11, weight: .medium)).foregroundColor(.white.opacity(0.2))
                        }
                        
                        // Quick add
                        VStack(spacing: 8) {
                            TextField("", text: $newItem, prompt: Text("What's getting #404'd?").foregroundColor(.white.opacity(0.15)))
                                .font(.system(size: 13)).foregroundColor(.white)
                                .padding(10).background(RoundedRectangle(cornerRadius: 8).fill(Color.white.opacity(0.04)))
                            
                            HStack(spacing: 4) {
                                ScrollView(.horizontal, showsIndicators: false) {
                                    HStack(spacing: 4) {
                                        ForEach(ErrorCategory.allCases, id: \.self) { cat in
                                            Button { selectedCategory = cat } label: {
                                                Text(cat.emoji).font(.system(size: 14))
                                                    .padding(5).background(Circle().fill(selectedCategory == cat ? Color.red.opacity(0.2) : Color.clear))
                                            }
                                        }
                                    }
                                }
                                Button {
                                    guard !newItem.isEmpty else { return }
                                    engine.log404Error(item: newItem, category: selectedCategory)
                                    newItem = ""
                                } label: {
                                    Text("#404").font(.system(size: 11, weight: .black)).foregroundColor(.white)
                                        .padding(.horizontal, 12).padding(.vertical, 6)
                                        .background(Capsule().fill(Color.red))
                                }
                            }
                        }
                        .padding(10).background(RoundedRectangle(cornerRadius: 10).fill(Color.red.opacity(0.03)))
                        
                        // Log entries
                        ForEach(engine.errorLog.prefix(50)) { entry in
                            HStack(spacing: 10) {
                                Text(entry.category.emoji).font(.system(size: 14))
                                VStack(alignment: .leading, spacing: 2) {
                                    Text(entry.item).font(.system(size: 12, weight: .medium)).foregroundColor(.white.opacity(0.5)).strikethrough()
                                    Text(entry.date, style: .relative).font(.system(size: 9, weight: .medium)).foregroundColor(.white.opacity(0.15))
                                }
                                Spacer()
                                Text("#404").font(.system(size: 8, weight: .black)).foregroundColor(.red.opacity(0.3))
                            }
                            .padding(8).background(RoundedRectangle(cornerRadius: 6).fill(Color.white.opacity(0.015)))
                        }
                        
                        Spacer(minLength: 60)
                    }
                    .padding(.horizontal, 16).padding(.top, 16)
                }
            }
            .navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) { Text("404 Error Log").font(.system(size: 16, weight: .bold)).foregroundColor(.red) }
                ToolbarItem(placement: .navigationBarTrailing) { Button("Done") { dismiss() }.foregroundColor(Color(red: 1.0, green: 0.85, blue: 0.3)) }
            }
            .toolbarBackground(Color(hex: "#0a0a0f"), for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
        }
    }
}

// MARK: - ═══════════════════════════════════════════════════
// SWIPE FILE VIEW — 25 ready scripts
// ═══════════════════════════════════════════════════════════

struct SwipeFileView: View {
    
    @Environment(\.dismiss) var dismiss
    @State private var selectedCategory: ErrorCategory?
    @State private var copiedId: UUID?
    
    private var filteredScripts: [SwipeScript] {
        if let cat = selectedCategory {
            return SwipeFileBank.scripts(for: cat)
        }
        return SwipeFileBank.scripts
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(hex: "#0a0a0f").ignoresSafeArea()
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 14) {
                        Text("Say these exactly. No explanation. No softening.")
                            .font(.system(size: 11, weight: .medium)).foregroundColor(.white.opacity(0.35)).padding(.top, 10)
                        categoryFilter
                        scriptList
                        Spacer(minLength: 60)
                    }
                    .padding(.horizontal, 16)
                }
            }
            .navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("No Scripts — Swipe File").font(.system(size: 15, weight: .bold)).foregroundColor(.white)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") { dismiss() }.foregroundColor(Color(red: 1.0, green: 0.85, blue: 0.3))
                }
            }
            .toolbarBackground(Color(hex: "#0a0a0f"), for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
        }
    }

    private let gold = Color(red: 1.0, green: 0.85, blue: 0.3)

    private var categoryFilter: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 6) {
                allCategoryButton
                ForEach(ErrorCategory.allCases, id: \.self) { cat in
                    categoryButton(cat)
                }
            }
        }
    }

    private var allCategoryButton: some View {
        let isSelected = selectedCategory == nil
        return Button { selectedCategory = nil } label: {
            Text("All")
                .font(.system(size: 10, weight: isSelected ? .bold : .medium))
                .foregroundColor(isSelected ? .black : .white.opacity(0.5))
                .padding(.horizontal, 10).padding(.vertical, 5)
                .background(Capsule().fill(isSelected ? gold : Color.white.opacity(0.05)))
        }
    }

    private func categoryButton(_ cat: ErrorCategory) -> some View {
        let isSelected = selectedCategory == cat
        return Button { selectedCategory = cat } label: {
            HStack(spacing: 3) {
                Text(cat.emoji).font(.system(size: 10))
                Text(cat.rawValue).font(.system(size: 9, weight: isSelected ? .bold : .medium))
            }
            .foregroundColor(isSelected ? .black : .white.opacity(0.5))
            .padding(.horizontal, 8).padding(.vertical, 5)
            .background(Capsule().fill(isSelected ? gold : Color.white.opacity(0.05)))
        }
    }

    private var scriptList: some View {
        ForEach(filteredScripts) { script in
            scriptCard(script)
        }
    }

    private func scriptCard(_ script: SwipeScript) -> some View {
        Button {
            UIPasteboard.general.string = script.script
            copiedId = script.id
            HapticManager.shared.light()
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) { copiedId = nil }
        } label: {
            HStack(spacing: 10) {
                Text(script.category.emoji).font(.system(size: 14))
                Text("\"\(script.script)\"")
                    .font(.system(size: 12, weight: .medium)).foregroundColor(.white.opacity(0.6))
                    .italic().multilineTextAlignment(.leading)
                Spacer()
                if copiedId == script.id {
                    Text("✓").font(.system(size: 12, weight: .bold)).foregroundColor(.green)
                } else {
                    Image(systemName: "doc.on.doc").font(.system(size: 10)).foregroundColor(.white.opacity(0.15))
                }
            }
            .padding(10).background(RoundedRectangle(cornerRadius: 8).fill(Color.white.opacity(0.02)))
        }
        .buttonStyle(.plain)
    }
}
