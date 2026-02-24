// ParalysisBreaker.swift
// PARALYSIS BREAKER MODE — "The Emergency Start Button"
// ☀️ SunFlow: Reignited — Second Brain Module
//
// "ADHD paralysis isn't laziness. It's your prefrontal cortex
//  unable to sequence steps because dopamine is too low to
//  initiate the reward prediction cycle. This tool provides
//  EXTERNAL sequencing so your brain doesn't have to."
//
// Features:
// - One-tap emergency activation
// - Auto-generates micro-task ladders from ANY task
// - Anxiety pre-check with breathing redirect
// - Energy level detection (adjusts task size)
// - Step-by-step guided mode with timers
// - Completion celebration with XP
// - "Body doubling" countdown (you're not alone)
// - History of broken paralysis episodes

import SwiftUI

// MARK: - ═══════════════════════════════════════════════════
// PARALYSIS BREAKER VIEW
// ═══════════════════════════════════════════════════════════

struct ParalysisBreakerView: View {
    
    @Environment(\.dismiss) var dismiss
    @State private var phase: BreakerPhase = .emergency
    @State private var taskInput: String = ""
    @State private var energyLevel: Int = 3 // 1-5
    @State private var anxietyLevel: Int = 1 // 1-5
    @State private var generatedSteps: [MicroStep] = []
    @State private var currentStepIndex: Int = 0
    @State private var timerSeconds: Int = 0
    @State private var timerRunning: Bool = false
    @State private var timer: Timer? = nil
    @State private var completedToday: Int = 0
    @State private var showCelebration: Bool = false
    @State private var savedSessions: [ParalysisSession] = []
    
    private let accent = Color(red: 1.0, green: 0.4, blue: 0.2) // Emergency orange
    private let calm = Color(red: 0.3, green: 0.8, blue: 0.6)
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(red: 0.02, green: 0.02, blue: 0.05).ignoresSafeArea()
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 16) {
                        switch phase {
                        case .emergency: emergencyView
                        case .anxietyCheck: anxietyCheckView
                        case .energyCheck: energyCheckView
                        case .taskEntry: taskEntryView
                        case .microLadder: microLadderView
                        case .activeStep: activeStepView
                        case .celebration: celebrationView
                        case .history: historyView
                        }
                    }
                    .padding(20)
                }
                
                if showCelebration { celebrationOverlay }
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
                    Text("⚡ Paralysis Breaker").font(.system(size: 17, weight: .bold)).foregroundColor(.white)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button { withAnimation { phase = .history } } label: {
                        Image(systemName: "clock.arrow.circlepath").font(.system(size: 14)).foregroundColor(.white.opacity(0.3))
                    }
                }
            }
            .onAppear { loadSessions() }
        }
    }
    
    // MARK: - PHASE 1: EMERGENCY SCREEN
    
    private var emergencyView: some View {
        VStack(spacing: 20) {
            Spacer().frame(height: 40)
            
            Text("⚡").font(.system(size: 60)).shadow(color: accent.opacity(0.5), radius: 20)
            
            Text("STUCK?").font(.system(size: 32, weight: .black)).foregroundColor(.white)
            
            Text("That's not laziness. That's your prefrontal\ncortex struggling to sequence steps.\nLet's give it external scaffolding.")
                .font(.system(size: 12, weight: .medium)).foregroundColor(.white.opacity(0.4))
                .multilineTextAlignment(.center)
            
            Button {
                withAnimation(.spring(response: 0.4)) { phase = .anxietyCheck }
            } label: {
                Text("BREAK THE PARALYSIS").font(.system(size: 16, weight: .black)).tracking(1)
                    .foregroundColor(.black).padding(.vertical, 16).frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 12).fill(accent))
            }
            .padding(.top, 10)
            
            // Quick starts (no typing needed)
            VStack(alignment: .leading, spacing: 6) {
                Text("OR TAP A QUICK START:").font(.system(size: 9, weight: .black)).tracking(1).foregroundColor(.white.opacity(0.15))
                
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 6) {
                    ForEach(QuickStartTask.allCases, id: \.self) { task in
                        Button {
                            taskInput = task.rawValue
                            energyLevel = 3
                            anxietyLevel = 1
                            generateMicroSteps()
                            withAnimation { phase = .microLadder }
                        } label: {
                            HStack(spacing: 6) {
                                Text(task.emoji).font(.system(size: 14))
                                Text(task.rawValue).font(.system(size: 10, weight: .bold)).foregroundColor(.white.opacity(0.5))
                                Spacer()
                            }
                            .padding(10).background(RoundedRectangle(cornerRadius: 8).fill(Color.white.opacity(0.02)))
                        }
                    }
                }
            }
            .padding(.top, 10)
            
            // Stats
            if completedToday > 0 {
                HStack(spacing: 4) {
                    Text("🔥").font(.system(size: 10))
                    Text("\(completedToday) paralysis episodes broken today")
                        .font(.system(size: 10, weight: .bold)).foregroundColor(accent.opacity(0.5))
                }
            }
            
            // Neuroscience note
            VStack(alignment: .leading, spacing: 4) {
                Text("WHY THIS WORKS").font(.system(size: 8, weight: .black)).tracking(1).foregroundColor(.white.opacity(0.1))
                Text("ADHD paralysis = prefrontal cortex can't generate enough dopamine to initiate the reward prediction cycle. Big tasks produce NO dopamine signal because the reward is too far away. Micro-tasks create IMMEDIATE reward signals. Each tiny completion triggers a dopamine micro-hit that fuels the next step. The brain learns: 'starting feels good.' Over time, initiation becomes easier.")
                    .font(.system(size: 9, weight: .medium)).foregroundColor(.white.opacity(0.15)).lineSpacing(2)
            }
            .padding(10).background(RoundedRectangle(cornerRadius: 8).fill(Color.white.opacity(0.01)))
        }
    }
    
    // MARK: - PHASE 2: ANXIETY CHECK
    
    private var anxietyCheckView: some View {
        VStack(spacing: 20) {
            Text("🫁").font(.system(size: 40))
            Text("Quick Check").font(.system(size: 20, weight: .black)).foregroundColor(.white)
            Text("How anxious are you right now?").font(.system(size: 12, weight: .medium)).foregroundColor(.white.opacity(0.4))
            
            HStack(spacing: 10) {
                ForEach(1...5, id: \.self) { level in
                    Button {
                        anxietyLevel = level
                    } label: {
                        VStack(spacing: 4) {
                            Text(anxietyEmoji(level)).font(.system(size: 24))
                            Text("\(level)").font(.system(size: 10, weight: .bold))
                                .foregroundColor(anxietyLevel == level ? .white : .white.opacity(0.2))
                        }
                        .frame(width: 50, height: 60)
                        .background(RoundedRectangle(cornerRadius: 10)
                            .fill(anxietyLevel == level ? anxietyColor(level).opacity(0.2) : Color.white.opacity(0.02)))
                        .overlay(RoundedRectangle(cornerRadius: 10)
                            .stroke(anxietyLevel == level ? anxietyColor(level).opacity(0.4) : Color.clear, lineWidth: 1.5))
                    }
                }
            }
            
            if anxietyLevel >= 4 {
                VStack(spacing: 8) {
                    Text("Let's calm your nervous system first").font(.system(size: 12, weight: .bold)).foregroundColor(calm)
                    Text("High anxiety BLOCKS task initiation. 60 seconds of breathing will dramatically improve your ability to start.")
                        .font(.system(size: 10, weight: .medium)).foregroundColor(.white.opacity(0.3)).multilineTextAlignment(.center)
                    
                    Button {
                        // TODO: Navigate to breathing exercise then return
                        withAnimation { phase = .energyCheck }
                    } label: {
                        Text("🌬️ Breathe First (60s)").font(.system(size: 13, weight: .bold))
                            .foregroundColor(.black).padding(12).frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 10).fill(calm))
                    }
                }
                .padding(12).background(RoundedRectangle(cornerRadius: 10).fill(calm.opacity(0.05)))
            }
            
            Button {
                withAnimation { phase = .energyCheck }
            } label: {
                Text(anxietyLevel >= 4 ? "Skip Breathing →" : "Next →").font(.system(size: 14, weight: .bold))
                    .foregroundColor(anxietyLevel >= 4 ? .white.opacity(0.3) : accent).padding(12)
                    .frame(maxWidth: .infinity).background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.02)))
            }
        }
    }
    
    // MARK: - PHASE 3: ENERGY CHECK
    
    private var energyCheckView: some View {
        VStack(spacing: 20) {
            Text("🔋").font(.system(size: 40))
            Text("Energy Level").font(.system(size: 20, weight: .black)).foregroundColor(.white)
            Text("This determines how small we make your steps").font(.system(size: 12, weight: .medium)).foregroundColor(.white.opacity(0.4))
            
            HStack(spacing: 8) {
                ForEach(1...5, id: \.self) { level in
                    Button { energyLevel = level } label: {
                        VStack(spacing: 4) {
                            Text(energyEmoji(level)).font(.system(size: 22))
                            Text(energyLabel(level)).font(.system(size: 8, weight: .bold))
                                .foregroundColor(energyLevel == level ? .white : .white.opacity(0.2))
                        }
                        .frame(width: 56, height: 60)
                        .background(RoundedRectangle(cornerRadius: 10)
                            .fill(energyLevel == level ? accent.opacity(0.15) : Color.white.opacity(0.02)))
                        .overlay(RoundedRectangle(cornerRadius: 10)
                            .stroke(energyLevel == level ? accent.opacity(0.3) : Color.clear, lineWidth: 1.5))
                    }
                }
            }
            
            Text(energyDescription(energyLevel)).font(.system(size: 10, weight: .medium))
                .foregroundColor(.white.opacity(0.3)).multilineTextAlignment(.center)
            
            Button {
                withAnimation { phase = .taskEntry }
            } label: {
                Text("Next →").font(.system(size: 14, weight: .bold)).foregroundColor(accent)
                    .padding(12).frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.02)))
            }
        }
    }
    
    // MARK: - PHASE 4: TASK ENTRY
    
    private var taskEntryView: some View {
        VStack(spacing: 16) {
            Text("📝").font(.system(size: 40))
            Text("What Are You Stuck On?").font(.system(size: 20, weight: .black)).foregroundColor(.white)
            Text("Type the thing you can't start.\nWe'll break it into tiny pieces.")
                .font(.system(size: 12, weight: .medium)).foregroundColor(.white.opacity(0.4)).multilineTextAlignment(.center)
            
            TextField("e.g. Clean my apartment", text: $taskInput)
                .font(.system(size: 15, weight: .medium)).foregroundColor(.white)
                .padding(14).background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.04)))
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(accent.opacity(0.2), lineWidth: 1))
            
            Button {
                guard !taskInput.trimmingCharacters(in: .whitespaces).isEmpty else { return }
                generateMicroSteps()
                withAnimation(.spring(response: 0.4)) { phase = .microLadder }
            } label: {
                Text("⚡ BREAK IT DOWN").font(.system(size: 15, weight: .black)).tracking(1)
                    .foregroundColor(.black).padding(.vertical, 14).frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 12).fill(taskInput.isEmpty ? accent.opacity(0.3) : accent))
            }
            .disabled(taskInput.trimmingCharacters(in: .whitespaces).isEmpty)
        }
    }
    
    // MARK: - PHASE 5: MICRO LADDER
    
    private var microLadderView: some View {
        VStack(spacing: 14) {
            HStack {
                VStack(alignment: .leading, spacing: 2) {
                    Text("YOUR MICRO-LADDER").font(.system(size: 9, weight: .black)).tracking(2).foregroundColor(accent.opacity(0.5))
                    Text(taskInput).font(.system(size: 14, weight: .bold)).foregroundColor(.white)
                }
                Spacer()
                Text("\(generatedSteps.count) steps").font(.system(size: 10, weight: .bold)).foregroundColor(.white.opacity(0.2))
            }
            
            Text("Energy: \(energyEmoji(energyLevel)) → Steps are \(energyLevel <= 2 ? "TINY (1-2 min)" : energyLevel <= 3 ? "small (2-5 min)" : "manageable (5-10 min)")")
                .font(.system(size: 10, weight: .medium)).foregroundColor(.white.opacity(0.25))
            
            ForEach(Array(generatedSteps.enumerated()), id: \.offset) { index, step in
                HStack(spacing: 10) {
                    ZStack {
                        Circle().fill(step.completed ? calm.opacity(0.3) : Color.white.opacity(0.03))
                            .frame(width: 28, height: 28)
                        if step.completed {
                            Image(systemName: "checkmark").font(.system(size: 12, weight: .bold)).foregroundColor(calm)
                        } else {
                            Text("\(index + 1)").font(.system(size: 11, weight: .bold)).foregroundColor(.white.opacity(0.3))
                        }
                    }
                    
                    VStack(alignment: .leading, spacing: 2) {
                        Text(step.title).font(.system(size: 12, weight: .bold))
                            .foregroundColor(step.completed ? .white.opacity(0.2) : .white)
                            .strikethrough(step.completed)
                        Text("~\(step.estimatedMinutes) min").font(.system(size: 9, weight: .medium)).foregroundColor(.white.opacity(0.15))
                    }
                    Spacer()
                    
                    if step.completed {
                        Text("✓").foregroundColor(calm)
                    }
                }
                .padding(10).background(RoundedRectangle(cornerRadius: 8)
                    .fill(step.completed ? calm.opacity(0.02) : (index == currentStepIndex ? accent.opacity(0.04) : Color.white.opacity(0.01))))
            }
            
            Button {
                currentStepIndex = generatedSteps.firstIndex(where: { !$0.completed }) ?? 0
                timerSeconds = 0
                withAnimation(.spring(response: 0.4)) { phase = .activeStep }
            } label: {
                Text("⚡ START STEP \(currentStepIndex + 1)").font(.system(size: 15, weight: .black)).tracking(1)
                    .foregroundColor(.black).padding(.vertical, 14).frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 12).fill(accent))
            }
        }
    }
    
    // MARK: - PHASE 6: ACTIVE STEP
    
    private var activeStepView: some View {
        VStack(spacing: 20) {
            let step = generatedSteps[safe: currentStepIndex] ?? MicroStep(title: "Done!", estimatedMinutes: 0)
            
            Text("Step \(currentStepIndex + 1) of \(generatedSteps.count)")
                .font(.system(size: 10, weight: .bold)).foregroundColor(.white.opacity(0.2))
            
            Text(step.title).font(.system(size: 20, weight: .black)).foregroundColor(.white).multilineTextAlignment(.center)
            
            Text("~\(step.estimatedMinutes) min").font(.system(size: 12, weight: .medium)).foregroundColor(.white.opacity(0.3))
            
            // Timer
            ZStack {
                Circle().stroke(accent.opacity(0.1), lineWidth: 3).frame(width: 100, height: 100)
                Circle().trim(from: 0, to: min(1.0, CGFloat(timerSeconds) / CGFloat(max(1, step.estimatedMinutes * 60))))
                    .stroke(accent, lineWidth: 3).frame(width: 100, height: 100).rotationEffect(.degrees(-90))
                
                VStack(spacing: 2) {
                    Text(formatTime(timerSeconds)).font(.system(size: 22, weight: .black, design: .monospaced)).foregroundColor(.white)
                    Text(timerRunning ? "GOING ⚡" : "PAUSED").font(.system(size: 8, weight: .bold)).foregroundColor(accent.opacity(0.5))
                }
            }
            
            HStack(spacing: 12) {
                Button {
                    toggleTimer()
                } label: {
                    Text(timerRunning ? "⏸ Pause" : "▶️ Start Timer").font(.system(size: 13, weight: .bold))
                        .foregroundColor(.white).padding(12).frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.05)))
                }
                
                Button {
                    completeCurrentStep()
                } label: {
                    Text("✅ Done!").font(.system(size: 13, weight: .bold))
                        .foregroundColor(.black).padding(12).frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 10).fill(calm))
                }
            }
            
            // Encouragement
            Text(encouragement(currentStepIndex, total: generatedSteps.count))
                .font(.system(size: 11, weight: .medium)).foregroundColor(accent.opacity(0.4)).multilineTextAlignment(.center)
            
            Button {
                stopTimer()
                withAnimation { phase = .microLadder }
            } label: {
                Text("← Back to Ladder").font(.system(size: 11, weight: .bold)).foregroundColor(.white.opacity(0.2))
            }
        }
    }
    
    // MARK: - PHASE 7: CELEBRATION
    
    private var celebrationView: some View {
        VStack(spacing: 16) {
            Spacer().frame(height: 30)
            Text("🎉").font(.system(size: 60))
            Text("PARALYSIS\nBROKEN").font(.system(size: 28, weight: .black)).foregroundColor(accent).multilineTextAlignment(.center)
            Text("You did it. Every step completed.").font(.system(size: 14, weight: .medium)).foregroundColor(.white.opacity(0.5))
            
            VStack(spacing: 6) {
                HStack {
                    Text("Task:").font(.system(size: 11, weight: .bold)).foregroundColor(.white.opacity(0.3))
                    Text(taskInput).font(.system(size: 11, weight: .bold)).foregroundColor(.white)
                }
                HStack {
                    Text("Steps:").font(.system(size: 11, weight: .bold)).foregroundColor(.white.opacity(0.3))
                    Text("\(generatedSteps.count) completed").font(.system(size: 11, weight: .bold)).foregroundColor(calm)
                }
                HStack {
                    Text("XP Earned:").font(.system(size: 11, weight: .bold)).foregroundColor(.white.opacity(0.3))
                    Text("+\(generatedSteps.count * 10) XP").font(.system(size: 11, weight: .bold)).foregroundColor(accent)
                }
            }
            .padding(14).background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.02)))
            
            Text("Your brain just learned: starting is safe.\nEvery time you break paralysis, initiation\ngets microscopically easier. That's neuroplasticity.")
                .font(.system(size: 10, weight: .medium)).foregroundColor(.white.opacity(0.25)).multilineTextAlignment(.center)
            
            Button {
                resetForNewTask()
            } label: {
                Text("⚡ Break Another One").font(.system(size: 14, weight: .bold))
                    .foregroundColor(.black).padding(14).frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 12).fill(accent))
            }
            
            Button { dismiss() } label: {
                Text("I'm Good For Now").font(.system(size: 12, weight: .bold)).foregroundColor(.white.opacity(0.3))
            }
        }
    }
    
    // MARK: - PHASE 8: HISTORY
    
    private var historyView: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Text("PARALYSIS HISTORY").font(.system(size: 11, weight: .black)).tracking(1).foregroundColor(.white)
                Spacer()
                Button { withAnimation { phase = .emergency } } label: {
                    Text("← Back").font(.system(size: 11, weight: .bold)).foregroundColor(.white.opacity(0.3))
                }
            }
            
            if savedSessions.isEmpty {
                Text("No sessions yet. Break your first paralysis!").font(.system(size: 12, weight: .medium)).foregroundColor(.white.opacity(0.2))
            } else {
                Text("\(savedSessions.count) episodes broken 💪").font(.system(size: 12, weight: .bold)).foregroundColor(accent)
                
                ForEach(savedSessions.reversed()) { session in
                    HStack {
                        VStack(alignment: .leading, spacing: 2) {
                            Text(session.task).font(.system(size: 12, weight: .bold)).foregroundColor(.white)
                            Text("\(session.stepsCompleted) steps • \(session.date.formatted(.dateTime.month().day().hour().minute()))")
                                .font(.system(size: 9, weight: .medium)).foregroundColor(.white.opacity(0.2))
                        }
                        Spacer()
                        Text("✅").font(.system(size: 14))
                    }
                    .padding(10).background(RoundedRectangle(cornerRadius: 8).fill(Color.white.opacity(0.015)))
                }
            }
        }
    }
    
    // MARK: - Celebration Overlay
    
    private var celebrationOverlay: some View {
        ZStack {
            Color.black.opacity(0.6).ignoresSafeArea()
            VStack(spacing: 8) {
                Text("⚡").font(.system(size: 50))
                Text("+\(generatedSteps.count * 10) XP").font(.system(size: 20, weight: .black)).foregroundColor(accent)
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                withAnimation { showCelebration = false }
            }
        }
    }
    
    // MARK: - Task Breakdown Engine
    
    private func generateMicroSteps() {
        let task = taskInput.lowercased()
        generatedSteps = []
        currentStepIndex = 0
        
        // Scale step size based on energy level
        let stepMinutes: Int = {
            if energyLevel <= 1 { return 1 }
            if energyLevel <= 2 { return 2 }
            if energyLevel <= 3 { return 3 }
            if energyLevel <= 4 { return 5 }
            return 10
        }()
        
        // Category-based breakdown using NLP-style keyword matching
        if task.contains("clean") || task.contains("tidy") || task.contains("organize") {
            generatedSteps = [
                MicroStep(title: "Stand up. That's it. Just stand.", estimatedMinutes: 1),
                MicroStep(title: "Pick up ONE thing and put it where it belongs", estimatedMinutes: stepMinutes),
                MicroStep(title: "Clear ONE surface (desk, counter, table)", estimatedMinutes: stepMinutes),
                MicroStep(title: "Gather all trash into one bag", estimatedMinutes: stepMinutes),
                MicroStep(title: "Put all dishes in the sink", estimatedMinutes: stepMinutes),
                MicroStep(title: "Wipe down the surface you cleared", estimatedMinutes: stepMinutes),
                MicroStep(title: "Look around — pick the WORST remaining spot and hit it", estimatedMinutes: stepMinutes),
            ]
        } else if task.contains("email") || task.contains("respond") || task.contains("reply") || task.contains("message") {
            generatedSteps = [
                MicroStep(title: "Open your inbox. Don't read anything yet.", estimatedMinutes: 1),
                MicroStep(title: "Find THE email. Just look at the subject line.", estimatedMinutes: 1),
                MicroStep(title: "Open it. Read the first sentence only.", estimatedMinutes: 1),
                MicroStep(title: "Type exactly 1 sentence in reply. Any sentence.", estimatedMinutes: stepMinutes),
                MicroStep(title: "Finish the reply. It doesn't need to be perfect.", estimatedMinutes: stepMinutes),
                MicroStep(title: "Hit send. Celebrate.", estimatedMinutes: 1),
            ]
        } else if task.contains("work") || task.contains("project") || task.contains("code") || task.contains("write") || task.contains("report") {
            generatedSteps = [
                MicroStep(title: "Open the file / app / document. Just open it.", estimatedMinutes: 1),
                MicroStep(title: "Read the last thing you did. Get oriented.", estimatedMinutes: stepMinutes),
                MicroStep(title: "Write ONE sentence / line / bullet point. Anything.", estimatedMinutes: stepMinutes),
                MicroStep(title: "Expand that one thing. Add 2-3 more details.", estimatedMinutes: stepMinutes),
                MicroStep(title: "Do the next logical small piece.", estimatedMinutes: stepMinutes),
                MicroStep(title: "Save your progress. Take a 1-minute break.", estimatedMinutes: 1),
                MicroStep(title: "One more push — do the next piece.", estimatedMinutes: stepMinutes),
            ]
        } else if task.contains("exercise") || task.contains("gym") || task.contains("workout") || task.contains("run") {
            generatedSteps = [
                MicroStep(title: "Put on your shoes. That's it.", estimatedMinutes: 1),
                MicroStep(title: "Put on workout clothes (if you haven't)", estimatedMinutes: stepMinutes),
                MicroStep(title: "Walk to the door. Open it.", estimatedMinutes: 1),
                MicroStep(title: "Walk outside. Breathe fresh air for 30 seconds.", estimatedMinutes: 1),
                MicroStep(title: "Start moving — walk, stretch, anything gentle.", estimatedMinutes: stepMinutes),
                MicroStep(title: "Increase intensity slightly. Just a bit.", estimatedMinutes: stepMinutes),
                MicroStep(title: "You're doing it. Keep going for 5 more minutes.", estimatedMinutes: 5),
            ]
        } else if task.contains("eat") || task.contains("cook") || task.contains("meal") || task.contains("food") {
            generatedSteps = [
                MicroStep(title: "Walk to the kitchen. Stand there.", estimatedMinutes: 1),
                MicroStep(title: "Open the fridge. Look at what's there.", estimatedMinutes: 1),
                MicroStep(title: "Pick the EASIEST thing to eat/prepare", estimatedMinutes: 1),
                MicroStep(title: "Get it out. Put it on the counter.", estimatedMinutes: 1),
                MicroStep(title: "Prepare it. Simple is fine. Perfect is the enemy.", estimatedMinutes: stepMinutes),
                MicroStep(title: "Eat. You did it. Basic survival accomplished.", estimatedMinutes: stepMinutes),
            ]
        } else if task.contains("shower") || task.contains("hygiene") || task.contains("brush") {
            generatedSteps = [
                MicroStep(title: "Walk to the bathroom. Just walk there.", estimatedMinutes: 1),
                MicroStep(title: "Turn on the water. Let it warm up.", estimatedMinutes: 1),
                MicroStep(title: "Get in. Just stand under the water.", estimatedMinutes: 1),
                MicroStep(title: "Pick up soap. Use it on one body part.", estimatedMinutes: stepMinutes),
                MicroStep(title: "Finish washing. Rinse.", estimatedMinutes: stepMinutes),
                MicroStep(title: "Get out. Dry off. You're a champion.", estimatedMinutes: stepMinutes),
            ]
        } else if task.contains("call") || task.contains("phone") {
            generatedSteps = [
                MicroStep(title: "Pick up your phone. Unlock it.", estimatedMinutes: 1),
                MicroStep(title: "Find the contact. Just look at the name.", estimatedMinutes: 1),
                MicroStep(title: "Write down ONE thing you need to say", estimatedMinutes: stepMinutes),
                MicroStep(title: "Press the call button. Breathe.", estimatedMinutes: 1),
                MicroStep(title: "Say the thing. It's okay if it's imperfect.", estimatedMinutes: stepMinutes),
                MicroStep(title: "Hang up. You survived. It's done.", estimatedMinutes: 1),
            ]
        } else {
            // Generic breakdown for any task
            generatedSteps = [
                MicroStep(title: "Take one deep breath. Feel your feet on the ground.", estimatedMinutes: 1),
                MicroStep(title: "Identify the SMALLEST first physical action", estimatedMinutes: 1),
                MicroStep(title: "Do that one tiny action. Nothing else.", estimatedMinutes: stepMinutes),
                MicroStep(title: "What's the next tiny action? Do just that.", estimatedMinutes: stepMinutes),
                MicroStep(title: "Keep going. One micro-step at a time.", estimatedMinutes: stepMinutes),
                MicroStep(title: "You're already further than when you started. Keep moving.", estimatedMinutes: stepMinutes),
                MicroStep(title: "Final push. Finish or find a natural stopping point.", estimatedMinutes: stepMinutes),
            ]
        }
    }
    
    // MARK: - Timer
    
    private func toggleTimer() {
        if timerRunning {
            stopTimer()
        } else {
            timerRunning = true
            timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                timerSeconds += 1
            }
        }
    }
    
    private func stopTimer() {
        timerRunning = false
        timer?.invalidate()
        timer = nil
    }
    
    // MARK: - Step Completion
    
    private func completeCurrentStep() {
        stopTimer()
        
        if currentStepIndex < generatedSteps.count {
            generatedSteps[currentStepIndex].completed = true
        }
        
        if generatedSteps.allSatisfy({ $0.completed }) {
            completedToday += 1
            saveSession()
            showCelebration = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                withAnimation { phase = .celebration }
            }
        } else {
            currentStepIndex = generatedSteps.firstIndex(where: { !$0.completed }) ?? currentStepIndex + 1
            timerSeconds = 0
        }
    }
    
    // MARK: - Reset
    
    private func resetForNewTask() {
        taskInput = ""
        generatedSteps = []
        currentStepIndex = 0
        timerSeconds = 0
        energyLevel = 3
        anxietyLevel = 1
        phase = .emergency
    }
    
    // MARK: - Persistence
    
    private func saveSession() {
        let session = ParalysisSession(task: taskInput, stepsCompleted: generatedSteps.count, date: Date())
        savedSessions.append(session)
        if let data = try? JSONEncoder().encode(savedSessions) {
            UserDefaults.standard.set(data, forKey: "aperture_paralysis_sessions")
        }
    }
    
    private func loadSessions() {
        if let data = UserDefaults.standard.data(forKey: "aperture_paralysis_sessions"),
           let sessions = try? JSONDecoder().decode([ParalysisSession].self, from: data) {
            savedSessions = sessions
            // Count today's
            let today = Calendar.current.startOfDay(for: Date())
            completedToday = sessions.filter { Calendar.current.startOfDay(for: $0.date) == today }.count
        }
    }
    
    // MARK: - Helpers
    
    private func formatTime(_ seconds: Int) -> String {
        let m = seconds / 60; let s = seconds % 60
        return String(format: "%d:%02d", m, s)
    }
    
    private func anxietyEmoji(_ level: Int) -> String {
        switch level { case 1: return "😌"; case 2: return "😐"; case 3: return "😰"; case 4: return "😨"; default: return "🫠" }
    }
    private func anxietyColor(_ level: Int) -> Color {
        level <= 2 ? calm : level <= 3 ? .yellow : .red
    }
    private func energyEmoji(_ level: Int) -> String {
        switch level { case 1: return "🪫"; case 2: return "🔋"; case 3: return "⚡"; case 4: return "🔥"; default: return "⚡⚡" }
    }
    private func energyLabel(_ level: Int) -> String {
        switch level { case 1: return "Empty"; case 2: return "Low"; case 3: return "Medium"; case 4: return "Good"; default: return "High" }
    }
    private func energyDescription(_ level: Int) -> String {
        switch level {
        case 1: return "Steps will be TINY. 1 minute or less each.\nWe're talking 'pick up one sock' level."
        case 2: return "Steps will be small. 2 minutes max.\nJust enough to build momentum."
        case 3: return "Steps will be manageable. 3-5 minutes.\nEnough to make real progress."
        case 4: return "Steps will be solid. 5-10 minutes.\nYou've got capacity — let's use it."
        default: return "Steps will be full-sized. 10+ minutes.\nYou're running hot — let's GO."
        }
    }
    
    private func encouragement(_ step: Int, total: Int) -> String {
        let pct = Double(step) / Double(max(1, total - 1))
        if pct == 0 { return "First step is always the hardest.\nYou're already winning by being here." }
        if pct < 0.3 { return "You're MOVING. That's the whole game.\nMomentum is building." }
        if pct < 0.6 { return "Halfway there. Your brain is getting\nthe dopamine it needs. Keep going." }
        if pct < 0.9 { return "Almost done. You're proving to your brain\nthat starting is SAFE." }
        return "LAST STEP. You're about to break through.\nThis is what strength looks like."
    }
}

// MARK: - ═══════════════════════════════════════════════════
// MODELS
// ═══════════════════════════════════════════════════════════

enum BreakerPhase { case emergency, anxietyCheck, energyCheck, taskEntry, microLadder, activeStep, celebration, history }

struct MicroStep: Identifiable {
    let id = UUID()
    let title: String
    let estimatedMinutes: Int
    var completed: Bool = false
}

struct ParalysisSession: Identifiable, Codable {
    var id = UUID()
    let task: String
    let stepsCompleted: Int
    let date: Date
}

enum QuickStartTask: String, CaseIterable {
    case cleanRoom = "Clean my room"
    case doLaundry = "Do laundry"
    case respondEmail = "Respond to email"
    case startWork = "Start work task"
    case exercise = "Exercise"
    case shower = "Take a shower"
    case cookMeal = "Cook a meal"
    case phoneCall = "Make a phone call"
    
    var emoji: String {
        switch self {
        case .cleanRoom: return "🧹"; case .doLaundry: return "👕"
        case .respondEmail: return "📧"; case .startWork: return "💻"
        case .exercise: return "🏃"; case .shower: return "🚿"
        case .cookMeal: return "🍳"; case .phoneCall: return "📞"
        }
    }
}

// Safe array access provided by Core/Extensions/Array+Safe.swift
