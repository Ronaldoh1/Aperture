// MindSanctuaryView.swift
// MIND SANCTUARY — "Calm First. Then See Clearly."
// ☀️ SunFlow: Reignited × Second Brain
//
// "You can't exit the matrix while your nervous system
//  is in fight-or-flight. Calm down first.
//  Then the pattern recognition comes naturally."
//
// This module bridges neurodivergent support with awakening.
// ALL features are CLIENT-SIDE. No backend. No API. No server.
// Everything runs on-device using local storage and timers.
//
// The pipeline:
// Anxious/Overwhelmed → Use tools → Calm state achieved →
// Curiosity emerges → Explore awakening content →
// Pattern recognition develops → Sovereignty achieved
//
// Ron went from 9 meds to zero. Not by forcing it.
// By healing internally and remembering he comes from source.
// This module creates that pathway — without preaching.
// Just tools. Just help. Just love.

import SwiftUI

// MARK: - ═══════════════════════════════════════════════════
// MIND SANCTUARY VIEW
// ═══════════════════════════════════════════════════════════

struct MindSanctuaryView: View {
    
    @Environment(\.dismiss) var dismiss
    @State private var selectedSection: SanctuarySection = .breathe
    @State private var expandedCards: Set<String> = []
    
    // Breathing exercise state
    @State private var isBreathing = false
    @State private var breathPhase: BreathPhase = .inhale
    @State private var breathTimer: Timer?
    @State private var breathCount = 0
    @State private var breathCircleScale: CGFloat = 0.4
    
    // Grounding state
    @State private var groundingStep = 0
    @State private var groundingAnswers: [String] = []
    
    // Mood state
    @State private var currentMood: Int = 5 // 1-10
    @State private var moodNote: String = ""
    @State private var showMoodSaved = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(red: 0.02, green: 0.03, blue: 0.06).ignoresSafeArea()
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 20) {
                        headerView
                        sectionSelector
                        contentForSection
                        Spacer(minLength: 60)
                    }
                    .padding(20)
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
                    HStack(spacing: 6) {
                        Image(systemName: "leaf.fill").font(.system(size: 14)).foregroundColor(.green)
                        Text("Mind Sanctuary").font(.system(size: 17, weight: .bold)).foregroundColor(.white)
                    }
                }
            }
        }
        .onDisappear { breathTimer?.invalidate() }
    }
    
    // MARK: - Header
    
    private var headerView: some View {
        VStack(spacing: 8) {
            Text("🕊️").font(.system(size: 44))
            Text("MIND SANCTUARY").font(.system(size: 20, weight: .black)).tracking(1).foregroundColor(.white)
            Text("Calm first. Then see clearly.\nYour nervous system has to feel safe before your mind can be free.")
                .font(.system(size: 11, weight: .medium)).foregroundColor(.white.opacity(0.3))
                .multilineTextAlignment(.center)
        }
    }
    
    // MARK: - Section Selector
    
    private var sectionSelector: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 8) {
                ForEach(SanctuarySection.allCases, id: \.self) { section in
                    Button {
                        withAnimation(.easeInOut(duration: 0.2)) { selectedSection = section }
                    } label: {
                        VStack(spacing: 3) {
                            Text(section.emoji).font(.system(size: 16))
                            Text(section.label).font(.system(size: 7, weight: .bold)).tracking(0.5)
                                .foregroundColor(selectedSection == section ? .black : .white.opacity(0.5))
                        }
                        .padding(.horizontal, 10).padding(.vertical, 8)
                        .background(Capsule().fill(selectedSection == section ? Color.green.opacity(0.8) : Color.white.opacity(0.04)))
                    }
                }
            }
        }
    }
    
    // MARK: - Content Router
    
    @ViewBuilder
    private var contentForSection: some View {
        switch selectedSection {
        case .breathe: breatheSection
        case .ground: groundingSection
        case .dopamine: dopamineMenuSection
        case .mood: moodCheckSection
        case .tasks: microTaskSection
        case .sensory: sensoryToolkitSection
        case .sleep: sleepWindDownSection
        case .firstAid: anxietyFirstAidSection
        }
    }
    
    // MARK: - ═══════════════════════════════════════════════
    // 1. BREATHE — Interactive Breathing Exercise
    // ═══════════════════════════════════════════════════════
    
    private var breatheSection: some View {
        VStack(spacing: 16) {
            sectionHeader("BREATHE", subtitle: "Your breath is the only bridge between your conscious mind and your autonomic nervous system. Control the breath, calm the system.")
            
            // Breathing circle
            VStack(spacing: 20) {
                ZStack {
                    Circle()
                        .fill(breathPhaseColor.opacity(0.05))
                        .frame(width: 200, height: 200)
                    
                    Circle()
                        .fill(breathPhaseColor.opacity(0.15))
                        .frame(width: 200 * breathCircleScale, height: 200 * breathCircleScale)
                        .animation(.easeInOut(duration: breathPhaseDuration), value: breathCircleScale)
                    
                    VStack(spacing: 4) {
                        Text(breathPhase.instruction).font(.system(size: 16, weight: .bold)).foregroundColor(.white)
                        if isBreathing {
                            Text("\(breathPhase.seconds)s").font(.system(size: 24, weight: .black)).foregroundColor(breathPhaseColor)
                        }
                    }
                }
                
                if isBreathing {
                    Text("Cycle \(breathCount + 1) of 4").font(.system(size: 11, weight: .medium)).foregroundColor(.white.opacity(0.3))
                }
                
                // Technique selector buttons
                VStack(spacing: 8) {
                    breathButton("4-7-8 Calm", subtitle: "Deep relaxation", action: { startBreathing(inhale: 4, hold: 7, exhale: 8) })
                    breathButton("Box Breathing", subtitle: "Military-grade calm", action: { startBreathing(inhale: 4, hold: 4, exhale: 4) })
                    breathButton("Physiological Sigh", subtitle: "Fastest anxiety reset", action: { startBreathing(inhale: 2, hold: 0, exhale: 6) })
                    
                    if isBreathing {
                        Button {
                            stopBreathing()
                        } label: {
                            Text("STOP").font(.system(size: 11, weight: .bold))
                                .foregroundColor(.red.opacity(0.6)).padding(.top, 4)
                        }
                    }
                }
            }
            .padding(20)
            .background(RoundedRectangle(cornerRadius: 16).fill(Color.white.opacity(0.02)))
            
            // Why it works
            expandableCard(
                id: "breath_science",
                emoji: "🔬",
                title: "Why This Works — The Vagus Nerve",
                subtitle: "Not woo-woo. Neuroscience.",
                content: "Slow, deep breathing activates the vagus nerve — the longest cranial nerve in your body. It runs from your brainstem to your gut.\n\nWhen activated, the vagus nerve:\n• Lowers heart rate\n• Reduces cortisol production\n• Activates the parasympathetic nervous system ('rest and digest' mode)\n• Shifts blood flow BACK to the prefrontal cortex (logic comes back online)\n\nThe 4-7-8 technique is especially powerful because the LONG exhale (8 seconds) maximally stimulates the vagus nerve. The hold phase (7 seconds) allows CO2 to build up slightly, which paradoxically calms the system.\n\nThe physiological sigh (double inhale + long exhale) was discovered by Stanford neuroscientist Andrew Huberman to be the FASTEST way to reduce real-time anxiety — one cycle can shift your state.\n\nThis isn't meditation. This is a biological override. Your vagus nerve is the hardware reset button for your nervous system.",
                detail: nil,
                color: .green
            )
        }
    }
    
    // MARK: - ═══════════════════════════════════════════════
    // 2. GROUND — 5-4-3-2-1 Grounding Exercise
    // ═══════════════════════════════════════════════════════
    
    private var groundingSection: some View {
        VStack(spacing: 16) {
            sectionHeader("GROUND", subtitle: "When your mind is racing, bring it back to the body. This technique anchors you to the present moment using your five senses.")
            
            VStack(spacing: 16) {
                // Progress
                HStack(spacing: 4) {
                    ForEach(0..<5) { i in
                        RoundedRectangle(cornerRadius: 3)
                            .fill(i <= groundingStep ? groundingStepColor(i) : Color.white.opacity(0.05))
                            .frame(height: 4)
                    }
                }
                
                let steps = GroundingStep.allSteps
                if groundingStep < steps.count {
                    let step = steps[groundingStep]
                    
                    VStack(spacing: 12) {
                        Text(step.emoji).font(.system(size: 40))
                        Text(step.sense.uppercased()).font(.system(size: 10, weight: .black)).tracking(2).foregroundColor(step.color)
                        Text(step.instruction).font(.system(size: 14, weight: .bold)).foregroundColor(.white).multilineTextAlignment(.center)
                        Text(step.detail).font(.system(size: 11, weight: .medium)).foregroundColor(.white.opacity(0.4)).multilineTextAlignment(.center)
                        
                        Button {
                            withAnimation(.easeInOut(duration: 0.3)) {
                                if groundingStep < steps.count - 1 { groundingStep += 1 }
                                else { groundingStep = 0 }
                            }
                        } label: {
                            Text(groundingStep < steps.count - 1 ? "NEXT →" : "START OVER")
                                .font(.system(size: 11, weight: .black)).tracking(1)
                                .foregroundColor(.black)
                                .padding(.horizontal, 20).padding(.vertical, 10)
                                .background(Capsule().fill(step.color.opacity(0.7)))
                        }
                    }
                    .padding(24)
                }
            }
            .background(RoundedRectangle(cornerRadius: 16).fill(Color.white.opacity(0.02)))
            
            expandableCard(
                id: "grounding_science",
                emoji: "🧠",
                title: "Why Grounding Works",
                subtitle: "Forcing sensory input to override anxiety loops",
                content: "Anxiety lives in the future — it's your brain simulating threats that haven't happened. Grounding forces the brain to process PRESENT sensory data.\n\nWhen you actively engage your senses (seeing, touching, hearing, smelling, tasting), you redirect neural activity from the default mode network (the 'worry machine') to sensory processing areas.\n\nThis is why the technique uses COUNTING — '5 things you see, 4 things you touch.' Counting engages the prefrontal cortex (logic), while sensory engagement activates present-moment processing. Together, they pull resources AWAY from the anxiety loop.\n\nFor neurodivergent brains especially: the ADHD brain tends to get stuck in loops. Grounding provides a structured interrupt — a specific, sequential task that redirects attention without requiring willpower.",
                detail: nil,
                color: .teal
            )
        }
    }
    
    // MARK: - ═══════════════════════════════════════════════
    // 3. DOPAMINE MENU — Healthy Dopamine Sources
    // ═══════════════════════════════════════════════════════
    
    private var dopamineMenuSection: some View {
        VStack(spacing: 12) {
            sectionHeader("DOPAMINE MENU", subtitle: "Your ADHD brain is dopamine-hungry. Instead of reaching for your phone, doom-scrolling, or binge-eating — here's a menu of healthy dopamine sources. Pick one.")
            
            ForEach(DopamineItem.allItems) { item in
                dopamineCard(item)
            }
            
            insightCard(
                "WHY A 'MENU' MATTERS FOR ADHD",
                "The ADHD brain has lower baseline dopamine. This creates constant seeking behavior — scrolling, snacking, procrastinating with 'just one more' of anything stimulating.\n\nThe problem isn't lack of willpower. It's that your brain is HUNGRY for dopamine and will take it from the easiest source available (usually your phone).\n\nA dopamine menu pre-loads healthy options so you don't have to THINK of alternatives when the craving hits. Decision-making uses prefrontal cortex energy — which is already depleted in ADHD. Having options ready REMOVES the decision barrier.\n\nPick one. Do it for 5 minutes. The craving will pass. Your brain doesn't actually need 3 hours of scrolling. It needs a 5-minute dopamine bump from a real activity.",
                color: .yellow
            )
        }
    }
    
    // MARK: - ═══════════════════════════════════════════════
    // 4. MOOD CHECK — Quick Emotional Snapshot
    // ═══════════════════════════════════════════════════════
    
    private var moodCheckSection: some View {
        VStack(spacing: 16) {
            sectionHeader("MOOD CHECK", subtitle: "Name it to tame it. Research shows that labeling an emotion reduces its intensity by up to 50%. Just checking in is an act of sovereignty.")
            
            VStack(spacing: 20) {
                // Mood slider
                VStack(spacing: 8) {
                    Text(moodEmoji(currentMood)).font(.system(size: 44))
                    Text(moodLabel(currentMood)).font(.system(size: 14, weight: .bold)).foregroundColor(.white)
                    
                    Slider(value: Binding(
                        get: { Double(currentMood) },
                        set: { currentMood = Int($0) }
                    ), in: 1...10, step: 1)
                    .tint(moodColor(currentMood))
                    
                    HStack {
                        Text("Struggling").font(.system(size: 9, weight: .medium)).foregroundColor(.red.opacity(0.4))
                        Spacer()
                        Text("Thriving").font(.system(size: 9, weight: .medium)).foregroundColor(.green.opacity(0.4))
                    }
                }
                
                // Quick emotion tags
                VStack(alignment: .leading, spacing: 8) {
                    Text("WHAT'S PRESENT?").font(.system(size: 9, weight: .black)).tracking(1).foregroundColor(.white.opacity(0.2))
                    
                    let emotions = ["Anxious", "Overwhelmed", "Scattered", "Restless", "Calm", "Focused", "Creative", "Grateful", "Tired", "Numb", "Angry", "Hopeful"]
                    
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 70))], spacing: 6) {
                        ForEach(emotions, id: \.self) { emotion in
                            Button {
                                if moodNote.contains(emotion) {
                                    moodNote = moodNote.replacingOccurrences(of: emotion + " ", with: "")
                                } else {
                                    moodNote += emotion + " "
                                }
                            } label: {
                                Text(emotion).font(.system(size: 10, weight: .bold))
                                    .foregroundColor(moodNote.contains(emotion) ? .black : .white.opacity(0.4))
                                    .padding(.horizontal, 8).padding(.vertical, 5)
                                    .background(Capsule().fill(moodNote.contains(emotion) ? Color.green.opacity(0.6) : Color.white.opacity(0.03)))
                            }
                        }
                    }
                }
                
                // Gentle suggestion based on mood
                if currentMood <= 3 {
                    moodSuggestion("Your nervous system might need help right now.", suggestion: "Try the Breathe tab (4-7-8 technique) or Grounding exercise. Even 60 seconds can shift your state.", emoji: "🕊️", color: .red)
                } else if currentMood <= 5 {
                    moodSuggestion("You're managing, but there's room to feel better.", suggestion: "Check the Dopamine Menu for a quick healthy boost, or try a body scan in the Sensory Toolkit.", emoji: "🌱", color: .yellow)
                } else if currentMood <= 7 {
                    moodSuggestion("Good space. This is where curiosity lives.", suggestion: "You might have bandwidth to explore an Awakening module — your mind is calm enough to receive.", emoji: "🌤️", color: .green)
                } else {
                    moodSuggestion("You're in flow. This is sovereignty.", suggestion: "This is the state where pattern recognition is sharpest. If something calls to you in the app — follow it. Trust the signal.", emoji: "☀️", color: Color(red: 1.0, green: 0.85, blue: 0.3))
                }
                
                if showMoodSaved {
                    Text("Saved locally on your device ✓").font(.system(size: 10, weight: .medium)).foregroundColor(.green.opacity(0.5))
                }
            }
            .padding(16)
            .background(RoundedRectangle(cornerRadius: 16).fill(Color.white.opacity(0.02)))
        }
    }
    
    // MARK: - ═══════════════════════════════════════════════
    // 5. MICRO TASKS — Break It Down
    // ═══════════════════════════════════════════════════════
    
    private var microTaskSection: some View {
        VStack(spacing: 12) {
            sectionHeader("MICRO TASKS", subtitle: "The ADHD brain freezes when tasks feel too big. The secret: make the first step so small it's impossible to resist. This is how you trick executive dysfunction.")
            
            ForEach(MicroTaskTemplate.allTemplates) { template in
                expandableCard(
                    id: template.id,
                    emoji: template.emoji,
                    title: template.task,
                    subtitle: template.feeling,
                    content: "Your brain says: '\(template.brainSays)'\n\nThe micro-step approach:\n\(template.microSteps.enumerated().map { "Step \($0.offset + 1): \($0.element)" }.joined(separator: "\n"))\n\n\(template.whyItWorks)",
                    detail: nil,
                    color: template.color
                )
            }
            
            insightCard(
                "THE 2-MINUTE RULE",
                "If a task takes less than 2 minutes — do it NOW. Don't add it to a list. Don't plan it. Just do it.\n\nFor everything else: what's the SMALLEST possible first step? Not 'clean the house.' Just 'pick up one thing off the floor.'\n\nThe secret is momentum. The ADHD brain needs a dopamine hit to get started. Completing a tiny step provides that hit. Then the next step feels possible. Then the next.\n\nYou don't need motivation to start. You need to start to GET motivation. The micro-step IS the motivation generator.",
                color: .blue
            )
        }
    }
    
    // MARK: - ═══════════════════════════════════════════════
    // 6. SENSORY TOOLKIT — Calm the Body
    // ═══════════════════════════════════════════════════════
    
    private var sensoryToolkitSection: some View {
        VStack(spacing: 12) {
            sectionHeader("SENSORY TOOLKIT", subtitle: "Your body stores stress. These tools help release it without medication, without therapy — just you and your nervous system.")
            
            ForEach(SensoryTool.allTools) { tool in
                expandableCard(
                    id: tool.id,
                    emoji: tool.emoji,
                    title: tool.name,
                    subtitle: "\(tool.duration) • \(tool.difficulty)",
                    content: tool.instructions,
                    detail: tool.science,
                    color: tool.color
                )
            }
        }
    }
    
    // MARK: - ═══════════════════════════════════════════════
    // 7. SLEEP WIND-DOWN — Evening Protocol
    // ═══════════════════════════════════════════════════════
    
    private var sleepWindDownSection: some View {
        VStack(spacing: 12) {
            sectionHeader("SLEEP WIND-DOWN", subtitle: "The ADHD brain doesn't have an off switch. It needs a wind-down PROTOCOL — a sequence that signals to the nervous system: we're done for today. It's safe to rest.")
            
            ForEach(Array(WindDownStep.allSteps.enumerated()), id: \.element.id) { index, step in
                HStack(alignment: .top, spacing: 12) {
                    VStack(spacing: 4) {
                        Text("\(index + 1)").font(.system(size: 14, weight: .black)).foregroundColor(.indigo)
                        if index < WindDownStep.allSteps.count - 1 {
                            Rectangle().fill(Color.indigo.opacity(0.1)).frame(width: 2)
                        }
                    }
                    .frame(width: 24)
                    
                    VStack(alignment: .leading, spacing: 4) {
                        HStack(spacing: 6) {
                            Text(step.emoji).font(.system(size: 14))
                            Text(step.title).font(.system(size: 13, weight: .bold)).foregroundColor(.white)
                            Spacer()
                            Text(step.timing).font(.system(size: 9, weight: .medium)).foregroundColor(.indigo.opacity(0.5))
                        }
                        Text(step.description).font(.system(size: 11, weight: .medium)).foregroundColor(.white.opacity(0.4)).lineSpacing(2)
                    }
                    .padding(12)
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.02)))
                }
            }
            
            insightCard(
                "WHY ADHD BRAINS CAN'T 'JUST SLEEP'",
                "The ADHD brain has dysregulated norepinephrine — the alertness chemical. At night, when it should decrease, it often stays elevated. Add racing thoughts (default mode network on overdrive) and you get the classic ADHD insomnia.\n\nThe wind-down protocol works by systematically reducing stimulation across ALL channels: light (blue light filter), sound (environment), temperature (cool room), cognition (brain dump), and nervous system (breathing).\n\nIt's not about willpower. It's about giving your brain the RIGHT SIGNALS in the RIGHT SEQUENCE. Your hypothalamus controls sleep-wake cycles — but it needs environmental cues. The protocol provides those cues.",
                color: .indigo
            )
        }
    }
    
    // MARK: - ═══════════════════════════════════════════════
    // 8. ANXIETY FIRST AID — Emergency Tools
    // ═══════════════════════════════════════════════════════
    
    private var anxietyFirstAidSection: some View {
        VStack(spacing: 12) {
            sectionHeader("ANXIETY FIRST AID", subtitle: "When anxiety hits hard, you don't need a lecture. You need tools. Here's what to do RIGHT NOW, in order of speed.")
            
            // Step-by-step emergency protocol
            VStack(spacing: 0) {
                firstAidStep(1, "PHYSIOLOGICAL SIGH", "Double inhale through nose (short + long), then looooong exhale through mouth. One cycle. Takes 10 seconds. Fastest anxiety reset known to neuroscience.", "10 sec", .red)
                firstAidStep(2, "COLD WATER", "Run cold water over your wrists for 30 seconds. The cold activates the dive reflex — an ancient mammalian response that immediately lowers heart rate.", "30 sec", .blue)
                firstAidStep(3, "NAME THREE THINGS", "Out loud, name 3 things you can see right now. This forces your brain from internal loop to external processing. Say them OUT LOUD — speaking engages different neural circuits.", "20 sec", .green)
                firstAidStep(4, "ORIENT IN SPACE", "Look around the room slowly. Your eyes should track horizontally. Panoramic vision activates the parasympathetic system. Tunnel vision = anxiety. Wide gaze = calm.", "30 sec", .teal)
                firstAidStep(5, "GRAVITY CHECK", "Feel the weight of your body in the chair or on the floor. Press your feet into the ground. This proprioceptive input tells your cerebellum you're safe and grounded.", "15 sec", .purple)
            }
            
            insightCard(
                "YOU'RE NOT BROKEN",
                "Anxiety is not a character flaw. It's your amygdala doing its job — detecting threats. The problem is that modern life sends too many false threat signals (news, social media, financial stress, social comparison).\n\nYour nervous system is WORKING CORRECTLY in a world that's sending incorrect signals. You don't need to 'fix' yourself. You need tools to tell your ancient brain: 'I'm safe right now.'\n\nThese techniques are evidence-based nervous system resets. They don't require belief, medication, or therapy. Just biology. Your biology.\n\nAnd when the anxiety passes — even for a moment — that's when clarity comes. That's when you can start to see patterns. That's when awakening has room to enter.\n\nCalm first. Then see clearly. 🕊️",
                color: .green
            )
        }
    }
    
    // MARK: - ═══════════════════════════════════════════════
    // SHARED COMPONENTS
    // ═══════════════════════════════════════════════════════
    
    private func sectionHeader(_ title: String, subtitle: String) -> some View {
        VStack(spacing: 6) {
            Text(title).font(.system(size: 12, weight: .black)).tracking(2).foregroundColor(.white.opacity(0.4))
            Text(subtitle).font(.system(size: 11, weight: .medium)).foregroundColor(.white.opacity(0.3)).multilineTextAlignment(.center)
        }.padding(.bottom, 4)
    }
    
    private func expandableCard(id: String, emoji: String, title: String, subtitle: String, content: String, detail: String?, color: Color) -> some View {
        VStack(alignment: .leading, spacing: 0) {
            Button {
                withAnimation(.easeInOut(duration: 0.2)) {
                    if expandedCards.contains(id) { expandedCards.remove(id) } else { expandedCards.insert(id) }
                }
            } label: {
                HStack(spacing: 10) {
                    Text(emoji).font(.system(size: 20)).frame(width: 30)
                    VStack(alignment: .leading, spacing: 2) {
                        Text(title).font(.system(size: 13, weight: .bold)).foregroundColor(.white)
                        Text(subtitle).font(.system(size: 10, weight: .medium)).foregroundColor(.white.opacity(0.35))
                    }
                    Spacer()
                    Image(systemName: expandedCards.contains(id) ? "chevron.up" : "chevron.down").font(.system(size: 10)).foregroundColor(.white.opacity(0.2))
                }.padding(12)
            }
            if expandedCards.contains(id) {
                VStack(alignment: .leading, spacing: 10) {
                    Text(content).font(.system(size: 12, weight: .medium)).foregroundColor(.white.opacity(0.6)).lineSpacing(3)
                    if let detail = detail {
                        Text(detail).font(.system(size: 11, weight: .medium)).foregroundColor(color.opacity(0.5)).lineSpacing(3)
                            .padding(10).frame(maxWidth: .infinity, alignment: .leading)
                            .background(RoundedRectangle(cornerRadius: 8).fill(color.opacity(0.03)))
                    }
                }.padding(.horizontal, 12).padding(.bottom, 12)
            }
        }
        .background(RoundedRectangle(cornerRadius: 12).fill(Color.white.opacity(0.02))
            .overlay(RoundedRectangle(cornerRadius: 12).stroke(color.opacity(0.06), lineWidth: 1)))
    }
    
    private func insightCard(_ title: String, _ text: String, color: Color) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(spacing: 6) {
                Image(systemName: "leaf.fill").font(.system(size: 11)).foregroundColor(color)
                Text(title).font(.system(size: 11, weight: .bold)).foregroundColor(color)
            }
            Text(text).font(.system(size: 12, weight: .medium)).foregroundColor(.white.opacity(0.6)).lineSpacing(3)
        }.padding(14).background(RoundedRectangle(cornerRadius: 12).fill(color.opacity(0.03))
            .overlay(RoundedRectangle(cornerRadius: 12).stroke(color.opacity(0.1), lineWidth: 1)))
    }
    
    private func breathButton(_ title: String, subtitle: String, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            HStack {
                VStack(alignment: .leading, spacing: 2) {
                    Text(title).font(.system(size: 12, weight: .bold)).foregroundColor(.white)
                    Text(subtitle).font(.system(size: 9, weight: .medium)).foregroundColor(.white.opacity(0.3))
                }
                Spacer()
                Image(systemName: "play.circle.fill").font(.system(size: 18)).foregroundColor(.green.opacity(0.5))
            }
            .padding(10).background(RoundedRectangle(cornerRadius: 8).fill(Color.white.opacity(0.02)))
        }
    }
    
    private func dopamineCard(_ item: DopamineItem) -> some View {
        HStack(spacing: 12) {
            Text(item.emoji).font(.system(size: 24)).frame(width: 36)
            VStack(alignment: .leading, spacing: 2) {
                Text(item.activity).font(.system(size: 13, weight: .bold)).foregroundColor(.white)
                Text(item.duration).font(.system(size: 10, weight: .medium)).foregroundColor(.yellow.opacity(0.4))
                Text(item.why).font(.system(size: 10, weight: .medium)).foregroundColor(.white.opacity(0.3))
            }
            Spacer()
            VStack(spacing: 1) {
                ForEach(0..<item.dopamineLevel, id: \.self) { _ in
                    Circle().fill(Color.yellow.opacity(0.6)).frame(width: 4, height: 4)
                }
            }
        }
        .padding(12).background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.02))
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.yellow.opacity(0.04), lineWidth: 1)))
    }
    
    private func moodSuggestion(_ text: String, suggestion: String, emoji: String, color: Color) -> some View {
        VStack(alignment: .leading, spacing: 6) {
            HStack(spacing: 6) {
                Text(emoji).font(.system(size: 12))
                Text(text).font(.system(size: 11, weight: .bold)).foregroundColor(color)
            }
            Text(suggestion).font(.system(size: 11, weight: .medium)).foregroundColor(.white.opacity(0.4))
        }
        .padding(12).background(RoundedRectangle(cornerRadius: 10).fill(color.opacity(0.03)))
    }
    
    private func firstAidStep(_ number: Int, _ title: String, _ description: String, _ time: String, _ color: Color) -> some View {
        HStack(alignment: .top, spacing: 10) {
            Text("\(number)").font(.system(size: 16, weight: .black)).foregroundColor(color).frame(width: 24)
            VStack(alignment: .leading, spacing: 4) {
                HStack {
                    Text(title).font(.system(size: 12, weight: .bold)).foregroundColor(.white)
                    Spacer()
                    Text(time).font(.system(size: 9, weight: .bold)).foregroundColor(color.opacity(0.5))
                }
                Text(description).font(.system(size: 11, weight: .medium)).foregroundColor(.white.opacity(0.4)).lineSpacing(2)
            }
        }
        .padding(12).background(Color.white.opacity(number % 2 == 0 ? 0.01 : 0.0))
    }
    
    // MARK: - Breathing Logic
    
    private var breathPhaseColor: Color {
        switch breathPhase {
        case .inhale: return .cyan
        case .hold: return .yellow
        case .exhale: return .green
        }
    }
    
    private var breathPhaseDuration: Double {
        Double(breathPhase.seconds)
    }
    
    private func startBreathing(inhale: Int, hold: Int, exhale: Int) {
        breathTimer?.invalidate()
        isBreathing = true
        breathCount = 0
        breathPhase = .inhale
        breathCircleScale = 1.0
        
        var elapsed = 0
        let totalCycle = inhale + hold + exhale
        
        breathTimer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            let position = elapsed % totalCycle
            if position < inhale {
                breathPhase = .inhale
                breathCircleScale = 0.4 + 0.6 * CGFloat(position + 1) / CGFloat(inhale)
            } else if position < inhale + hold {
                breathPhase = .hold
                breathCircleScale = 1.0
            } else {
                breathPhase = .exhale
                let exhalePos = position - inhale - hold
                breathCircleScale = 1.0 - 0.6 * CGFloat(exhalePos + 1) / CGFloat(exhale)
            }
            elapsed += 1
            if elapsed % totalCycle == 0 {
                breathCount += 1
                if breathCount >= 4 { stopBreathing() }
            }
        }
    }
    
    private func stopBreathing() {
        breathTimer?.invalidate()
        isBreathing = false
        breathPhase = .inhale
        breathCircleScale = 0.4
        breathCount = 0
    }
    
    // MARK: - Grounding Helpers
    
    private func groundingStepColor(_ index: Int) -> Color {
        [Color.cyan, .green, .yellow, .orange, .pink][index]
    }
    
    // MARK: - Mood Helpers
    
    private func moodEmoji(_ value: Int) -> String {
        switch value {
        case 1...2: return "😰"
        case 3...4: return "😔"
        case 5...6: return "😐"
        case 7...8: return "🙂"
        case 9...10: return "😊"
        default: return "😐"
        }
    }
    
    private func moodLabel(_ value: Int) -> String {
        switch value {
        case 1...2: return "Really struggling"
        case 3...4: return "Having a hard time"
        case 5...6: return "Getting by"
        case 7...8: return "Doing good"
        case 9...10: return "Thriving"
        default: return "Checking in"
        }
    }
    
    private func moodColor(_ value: Int) -> Color {
        switch value {
        case 1...3: return .red
        case 4...5: return .yellow
        case 6...7: return .green
        case 8...10: return Color(red: 1.0, green: 0.85, blue: 0.3)
        default: return .white
        }
    }
}

// MARK: - ═══════════════════════════════════════════════════
// ENUMS & DATA MODELS
// ═══════════════════════════════════════════════════════════

enum SanctuarySection: String, CaseIterable {
    case breathe, ground, dopamine, mood, tasks, sensory, sleep, firstAid
    
    var emoji: String {
        switch self {
        case .breathe: return "🌬️"
        case .ground: return "🌍"
        case .dopamine: return "⚡"
        case .mood: return "💚"
        case .tasks: return "✂️"
        case .sensory: return "🧘"
        case .sleep: return "🌙"
        case .firstAid: return "🆘"
        }
    }
    
    var label: String {
        switch self {
        case .breathe: return "BREATHE"
        case .ground: return "GROUND"
        case .dopamine: return "DOPAMINE"
        case .mood: return "MOOD"
        case .tasks: return "MICRO TASKS"
        case .sensory: return "SENSORY"
        case .sleep: return "SLEEP"
        case .firstAid: return "FIRST AID"
        }
    }
}

enum BreathPhase {
    case inhale, hold, exhale
    var instruction: String {
        switch self {
        case .inhale: return "Breathe In"
        case .hold: return "Hold"
        case .exhale: return "Breathe Out"
        }
    }
    var seconds: Int {
        switch self {
        case .inhale: return 4
        case .hold: return 7
        case .exhale: return 8
        }
    }
}

// MARK: - Grounding Steps

struct GroundingStep: Identifiable {
    let id: String
    let sense: String
    let emoji: String
    let instruction: String
    let detail: String
    let color: Color
    
    static let allSteps: [GroundingStep] = [
        .init(id: "see", sense: "See", emoji: "👁️", instruction: "Name 5 things you can SEE right now.", detail: "Look around slowly. Notice colors, textures, light. Say them out loud if possible.", color: .cyan),
        .init(id: "touch", sense: "Touch", emoji: "✋", instruction: "Name 4 things you can TOUCH.", detail: "Feel the texture of your clothes. The surface under your hands. The temperature of the air.", color: .green),
        .init(id: "hear", sense: "Hear", emoji: "👂", instruction: "Name 3 things you can HEAR.", detail: "Close your eyes. What sounds are present? Distant traffic? Air conditioning? Your own breathing?", color: .yellow),
        .init(id: "smell", sense: "Smell", emoji: "👃", instruction: "Name 2 things you can SMELL.", detail: "Can you smell your clothes? Food nearby? The air? If nothing, cup your hands and breathe into them.", color: .orange),
        .init(id: "taste", sense: "Taste", emoji: "👅", instruction: "Name 1 thing you can TASTE.", detail: "Run your tongue over your teeth. Notice any residual taste. Even 'nothing' is a valid answer. You're present now.", color: .pink),
    ]
}

// MARK: - Dopamine Menu Items

struct DopamineItem: Identifiable {
    let id: String
    let emoji: String
    let activity: String
    let duration: String
    let why: String
    let dopamineLevel: Int // 1-5
    
    static let allItems: [DopamineItem] = [
        .init(id: "cold_water", emoji: "🧊", activity: "Cold water on face/wrists", duration: "30 seconds", why: "Activates dive reflex, releases norepinephrine, instant alertness", dopamineLevel: 3),
        .init(id: "music", emoji: "🎵", activity: "Put on a song you love", duration: "3-4 minutes", why: "Music directly stimulates dopamine release in the nucleus accumbens", dopamineLevel: 4),
        .init(id: "walk", emoji: "🚶", activity: "Walk outside for 5 minutes", duration: "5 minutes", why: "Sunlight + movement + novel visual input = triple dopamine", dopamineLevel: 4),
        .init(id: "stretch", emoji: "🧘", activity: "Full body stretch", duration: "2 minutes", why: "Releases tension, increases blood flow, activates reward circuits", dopamineLevel: 2),
        .init(id: "clean_one", emoji: "🧹", activity: "Clean ONE small area", duration: "5 minutes", why: "Completion of even tiny tasks gives dopamine hit + reduces visual stress", dopamineLevel: 3),
        .init(id: "cook", emoji: "🍳", activity: "Make yourself a snack", duration: "10 minutes", why: "Creative + sensory + completion reward. Triple dopamine stack.", dopamineLevel: 4),
        .init(id: "draw", emoji: "✏️", activity: "Doodle or draw for 5 minutes", duration: "5 minutes", why: "Creative expression without performance pressure. Pure flow state.", dopamineLevel: 3),
        .init(id: "call", emoji: "📞", activity: "Call someone you love", duration: "5 minutes", why: "Oxytocin + dopamine from real human connection. Not texting — VOICE.", dopamineLevel: 5),
        .init(id: "dance", emoji: "💃", activity: "Dance to one song", duration: "3 minutes", why: "Movement + music + play = massive dopamine release. Close the door if you need to.", dopamineLevel: 5),
        .init(id: "gratitude", emoji: "🙏", activity: "Name 3 things you're grateful for", duration: "1 minute", why: "Gratitude shifts prefrontal cortex activation from threat to reward mode", dopamineLevel: 2),
    ]
}

// MARK: - Micro Task Templates

struct MicroTaskTemplate: Identifiable {
    let id: String
    let emoji: String
    let task: String
    let feeling: String
    let brainSays: String
    let microSteps: [String]
    let whyItWorks: String
    let color: Color
    
    static let allTemplates: [MicroTaskTemplate] = [
        .init(id: "dishes", emoji: "🍽️", task: "Do the dishes", feeling: "Feeling overwhelmed by the pile",
              brainSays: "There's too many. I'll do it later. It's going to take forever.",
              microSteps: ["Walk to the sink.", "Pick up ONE dish.", "Wash that ONE dish.", "If you want to stop — stop. You did one. That counts.", "If momentum kicks in — ride it."],
              whyItWorks: "Starting is the hardest part. Once you're at the sink with water running, the basal ganglia often take over and automate the rest. The trick is making the first step absurdly small.", color: .blue),
        .init(id: "email", emoji: "📧", task: "Reply to that email", feeling: "Email anxiety / avoidance",
              brainSays: "I need to write the perfect response. I'll think about it more. Tomorrow.",
              microSteps: ["Open the email app.", "Open the specific email.", "Type just the greeting: 'Hi [name],'", "Write ONE sentence of response.", "Send it. Imperfect > unsent."],
              whyItWorks: "Email paralysis is perfectionism + ADHD executive dysfunction. The micro-step removes the pressure of 'the perfect email' and replaces it with 'just open it.' Momentum handles the rest.", color: .purple),
        .init(id: "exercise", emoji: "🏋️", task: "Exercise / move your body", feeling: "Zero motivation to work out",
              brainSays: "I don't have energy. I'll go tomorrow. It's not worth it if I can only do 10 minutes.",
              microSteps: ["Put on athletic shoes. That's it.", "Stand up.", "Do 5 jumping jacks.", "If you want to stop — stop. You moved. That counts.", "If not — do 5 more. Or walk around the block."],
              whyItWorks: "The shoe trick works because it's a commitment-free action that activates motor preparation circuits. Once shoes are on, the barrier to movement drops dramatically. 5 minutes of exercise > 0 minutes of planning to exercise.", color: .green),
        .init(id: "creative", emoji: "🎨", task: "Work on a creative project", feeling: "Blank page paralysis",
              brainSays: "I don't know where to start. It won't be good enough. I need to wait for inspiration.",
              microSteps: ["Open the file / get the materials out.", "Set a timer for 5 minutes.", "Do ANYTHING — even write 'I don't know what to write.'", "When the timer rings, decide: stop or continue.", "Inspiration comes FROM working, not before it."],
              whyItWorks: "Creativity doesn't require inspiration. It requires starting. The timer removes the pressure of 'how long' — it's just 5 minutes. And 90% of the time, once you start, you don't want to stop. The muse shows up AFTER you sit down.", color: .orange),
    ]
}

// MARK: - Sensory Tools

struct SensoryTool: Identifiable {
    let id: String
    let emoji: String
    let name: String
    let duration: String
    let difficulty: String
    let instructions: String
    let science: String?
    let color: Color
    
    static let allTools: [SensoryTool] = [
        .init(id: "body_scan", emoji: "🫀", name: "Quick Body Scan", duration: "3 min", difficulty: "Easy",
              instructions: "Close your eyes. Start at the top of your head. Slowly move your attention down through your body: forehead, jaw (unclench it), shoulders (drop them), chest, stomach, hips, thighs, calves, feet.\n\nAt each area, just NOTICE. Don't try to change anything. Just observe: is there tension? Warmth? Nothing? Whatever you find is fine.\n\nThe goal isn't relaxation — it's AWARENESS. Awareness of the body pulls attention out of anxious thought loops.",
              science: "Body scanning activates the insula — the brain region responsible for interoception (awareness of internal body states). Insula activation is inversely correlated with amygdala activation. More body awareness = less anxiety. It's a seesaw.", color: .teal),
        .init(id: "jaw_release", emoji: "😮", name: "Jaw & Tongue Release", duration: "30 sec", difficulty: "Easy",
              instructions: "Right now: let your jaw drop open slightly. Let your tongue fall away from the roof of your mouth. Let your lips part.\n\nHold this for 30 seconds.\n\nThe jaw holds more tension than almost any other part of the body. Most people clench their jaw without knowing it — especially ADHD brains under stress. Releasing the jaw sends a 'safe' signal to the vagus nerve.",
              science: "The trigeminal nerve (jaw) connects directly to the brainstem and vagus nerve. Jaw tension = sympathetic activation (fight-or-flight). Jaw release = parasympathetic activation (rest-and-digest). It's one of the fastest nervous system resets available.", color: .pink),
        .init(id: "bilateral", emoji: "👏", name: "Bilateral Tapping", duration: "2 min", difficulty: "Easy",
              instructions: "Cross your arms over your chest (butterfly hug position). Alternately tap your right hand on your left shoulder, then left hand on right shoulder. Slow, rhythmic. Left-right-left-right.\n\nDo this for 2 minutes while breathing slowly.\n\nThis technique comes from EMDR therapy and is used for anxiety, trauma responses, and emotional overwhelm.",
              science: "Bilateral stimulation activates both brain hemispheres alternately, which helps process stuck emotions and reduces amygdala activation. It's the same mechanism behind EMDR (Eye Movement Desensitization and Reprocessing) therapy — but you can do it yourself, anywhere.", color: .purple),
        .init(id: "humming", emoji: "🐝", name: "Humming / Bee Breath", duration: "2 min", difficulty: "Easy",
              instructions: "Close your eyes. Take a deep breath in. As you exhale, hum at a comfortable pitch. Feel the vibration in your chest and face.\n\nRepeat 5-6 times.\n\nThe vibration directly stimulates the vagus nerve through the larynx. The sustained exhalation calms the nervous system. The sound creates a focal point that interrupts thought loops.",
              science: "Humming increases nitric oxide production by 15x (Weitzberg & Lundberg, 2002). Nitric oxide is a vasodilator — it opens blood vessels, reduces blood pressure, and has anti-inflammatory effects. You're literally humming your way to better physiology.", color: .orange),
    ]
}

// MARK: - Sleep Wind-Down Steps

struct WindDownStep: Identifiable {
    let id: String
    let emoji: String
    let title: String
    let timing: String
    let description: String
    
    static let allSteps: [WindDownStep] = [
        .init(id: "screens", emoji: "📱", title: "Screens Off or Night Mode", timing: "60 min before bed", description: "Blue light suppresses melatonin production. Enable night mode (warm colors) or put screens away entirely. Your hypothalamus needs darkness signals to start the sleep cascade."),
        .init(id: "brain_dump", emoji: "📝", title: "Brain Dump", timing: "45 min before bed", description: "Write down EVERYTHING on your mind. Tasks, worries, ideas, random thoughts. Get them OUT of your head and onto paper. Your working memory is trying to hold everything — release it. The paper will remember for you."),
        .init(id: "temperature", emoji: "🌡️", title: "Cool the Room", timing: "30 min before bed", description: "Ideal sleep temperature: 65-68°F (18-20°C). Your body needs to DROP core temperature to initiate sleep. A cool room helps. A warm shower before bed also works — it brings blood to the surface, which then cools you down."),
        .init(id: "breathing", emoji: "🌬️", title: "4-7-8 Breathing", timing: "In bed", description: "Inhale 4 seconds. Hold 7. Exhale 8. Do 4 cycles. This activates your vagus nerve and shifts your nervous system from sympathetic (alert) to parasympathetic (rest). Your heart rate will slow within 2 cycles."),
        .init(id: "anchor", emoji: "⚓", title: "Anchor Thought", timing: "Eyes closed", description: "Pick ONE calm image: a beach, a forest, a quiet room. When thoughts intrude (and they will), gently return to the image. Don't fight the thoughts — just redirect. Every redirection strengthens your prefrontal cortex's ability to manage attention. This IS meditation, just lying down."),
    ]
}
