// RationalEnlightenmentView.swift
// "Enlightenment, Peer-Reviewed" - For atheists, skeptics, and science minds
// No gods, just neurons. Awaken without the afterlife baggage.

import SwiftUI

// MARK: - Main View
struct RationalEnlightenmentView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var selectedTab = 0
    @State private var rationalityQuotient: Int = 0
    @State private var showQuiz = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                // Clean, minimal gradient
                LinearGradient(
                    colors: [Color(hex: "0a0a12"), Color(hex: "101820"), Color(hex: "0a0a12")],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
                
                VStack(spacing: 0) {
                    // Tab Selector
                    Picker("Section", selection: $selectedTab) {
                        Text("Overview").tag(0)
                        Text("Free (10)").tag(1)
                        Text("Premium (10)").tag(2)
                        Text("Tools").tag(3)
                    }
                    .pickerStyle(.segmented)
                    .padding()
                    
                    TabView(selection: $selectedTab) {
                        overviewTab.tag(0)
                        freeExercisesTab.tag(1)
                        premiumExercisesTab.tag(2)
                        toolsTab.tag(3)
                    }
                    .tabViewStyle(.page(indexDisplayMode: .never))
                }
            }
            .navigationTitle("🧠 Rational Enlightenment")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") { dismiss() }
                        .foregroundStyle(Color(hex: "00D4FF"))
                }
            }
            .sheet(isPresented: $showQuiz) {
                RationalityQuotientQuizView(score: $rationalityQuotient)
            }
        }
    }
    
    // MARK: - Overview Tab
    private var overviewTab: some View {
        ScrollView {
            VStack(spacing: 24) {
                // Header
                VStack(spacing: 12) {
                    Text("🔬")
                        .font(.system(size: 60))
                    
                    Text("Rational Enlightenment")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                    
                    Text("Science-backed paths to peak cognition")
                        .font(.subheadline)
                        .foregroundStyle(.white.opacity(0.7))
                }
                .padding(.vertical, 20)
                
                // Tagline
                VStack(spacing: 8) {
                    Text("\"Institutions peddle myths; we deliver math.\"")
                        .font(.headline)
                        .italic()
                        .foregroundStyle(Color(hex: "00D4FF"))
                    Text("Choose your matrix: Red pill or regression analysis?")
                        .font(.caption)
                        .foregroundStyle(.white.opacity(0.6))
                }
                .padding()
                .background(Color.white.opacity(0.05))
                .cornerRadius(12)
                
                // Rationality Quotient
                Button(action: { showQuiz = true }) {
                    HStack {
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Your Rationality Quotient")
                                .font(.subheadline)
                                .foregroundStyle(.white)
                            Text(rationalityQuotient > 0 ? "Score: \(rationalityQuotient)/100" : "Take the quiz")
                                .font(.caption)
                                .foregroundStyle(.white.opacity(0.6))
                        }
                        Spacer()
                        Image(systemName: "brain.head.profile")
                            .font(.title2)
                            .foregroundStyle(Color(hex: "00D4FF"))
                    }
                    .padding()
                    .background(Color(hex: "00D4FF").opacity(0.1))
                    .cornerRadius(12)
                }
                
                // Core Principles
                VStack(alignment: .leading, spacing: 16) {
                    Text("🎯 CORE PRINCIPLES")
                        .font(.caption)
                        .foregroundStyle(.white.opacity(0.6))
                        .tracking(2)
                    
                    principleCard(icon: "🧬", title: "Evidence-Based", desc: "Every insight backed by cognitive science, neuropsych, and peer-reviewed research.")
                    principleCard(icon: "🔢", title: "Data-Driven", desc: "Transform intuition into measurable metrics. Track progress empirically.")
                    principleCard(icon: "🧪", title: "Testable Hypotheses", desc: "Frame beliefs as experiments. Gather evidence. Update models.")
                    principleCard(icon: "🚫", title: "Zero Woo-Woo", desc: "No chakras, no spirits, no faith leaps. Just neurons and neural networks.")
                }
                
                // What You'll Learn
                VStack(alignment: .leading, spacing: 12) {
                    Text("📚 WHAT YOU'LL MASTER")
                        .font(.caption)
                        .foregroundStyle(.white.opacity(0.6))
                        .tracking(2)
                    
                    learnItem("Identify and overcome 50+ cognitive biases")
                    learnItem("Map emotions to neural correlates")
                    learnItem("Apply Bayesian reasoning to daily decisions")
                    learnItem("Understand evolutionary psychology of behavior")
                    learnItem("Use probability theory to reduce anxiety")
                    learnItem("Build mental models from first principles")
                }
                .padding()
                .background(Color.white.opacity(0.05))
                .cornerRadius(12)
                
                Spacer(minLength: 50)
            }
            .padding(.horizontal, 20)
        }
    }
    
    // MARK: - Free Exercises Tab
    private var freeExercisesTab: some View {
        ScrollView {
            VStack(spacing: 16) {
                Text("🆓 FREE EXERCISES")
                    .font(.caption)
                    .foregroundStyle(Color(hex: "27AE60"))
                    .tracking(2)
                    .padding(.top, 20)
                
                Text("10 Core Catalysts - Evidence Entry Points for All")
                    .font(.subheadline)
                    .foregroundStyle(.white.opacity(0.7))
                
                ForEach(RationalExercise.freeExercises) { exercise in
                    NavigationLink(destination: RationalExerciseDetailView(exercise: exercise)) {
                        exerciseCard(exercise)
                    }
                    .buttonStyle(.plain)
                }
                
                Spacer(minLength: 50)
            }
            .padding(.horizontal, 20)
        }
    }
    
    // MARK: - Premium Exercises Tab
    private var premiumExercisesTab: some View {
        ScrollView {
            VStack(spacing: 16) {
                Text("⭐ PREMIUM EXERCISES")
                    .font(.caption)
                    .foregroundStyle(Color(hex: "FFD700"))
                    .tracking(2)
                    .padding(.top, 20)
                
                Text("10 Advanced Analyzers - AI-Augmented for Empirical Elites")
                    .font(.subheadline)
                    .foregroundStyle(.white.opacity(0.7))
                
                ForEach(RationalExercise.premiumExercises) { exercise in
                    NavigationLink(destination: RationalExerciseDetailView(exercise: exercise)) {
                        exerciseCard(exercise, isPremium: true)
                    }
                    .buttonStyle(.plain)
                }
                
                Spacer(minLength: 50)
            }
            .padding(.horizontal, 20)
        }
    }
    
    // MARK: - Tools Tab
    private var toolsTab: some View {
        ScrollView {
            VStack(spacing: 16) {
                Text("🛠️ RATIONAL TOOLS")
                    .font(.caption)
                    .foregroundStyle(Color(hex: "00D4FF"))
                    .tracking(2)
                    .padding(.top, 20)
                
                NavigationLink(destination: BiasCheckerView()) {
                    toolCard(icon: "⚠️", title: "Bias Checker", desc: "Real-time cognitive bias detection")
                }
                
                NavigationLink(destination: BayesCalculatorView()) {
                    toolCard(icon: "📊", title: "Bayes Calculator", desc: "Update beliefs with new evidence")
                }
                
                NavigationLink(destination: LogicalFallacyDatabaseView()) {
                    toolCard(icon: "🔍", title: "Fallacy Database", desc: "50+ logical fallacies explained")
                }
                
                NavigationLink(destination: NeuralCorrelatesMapView()) {
                    toolCard(icon: "🧠", title: "Neural Correlates Map", desc: "Brain regions and their functions")
                }
                
                NavigationLink(destination: EvoDriversView()) {
                    toolCard(icon: "🧬", title: "Evolutionary Drivers", desc: "Why we do what we do")
                }
                
                Spacer(minLength: 50)
            }
            .padding(.horizontal, 20)
        }
        .buttonStyle(.plain)
    }
    
    // MARK: - Helper Views
    private func principleCard(icon: String, title: String, desc: String) -> some View {
        HStack(alignment: .top, spacing: 16) {
            Text(icon)
                .font(.title2)
                .frame(width: 40)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                Text(desc)
                    .font(.caption)
                    .foregroundStyle(.white.opacity(0.7))
            }
        }
        .padding()
        .background(Color.white.opacity(0.05))
        .cornerRadius(12)
    }
    
    private func learnItem(_ text: String) -> some View {
        HStack(spacing: 8) {
            Image(systemName: "checkmark.circle.fill")
                .foregroundStyle(Color(hex: "27AE60"))
                .font(.caption)
            Text(text)
                .font(.caption)
                .foregroundStyle(.white.opacity(0.9))
        }
    }
    
    private func exerciseCard(_ exercise: RationalExercise, isPremium: Bool = false) -> some View {
        HStack(spacing: 16) {
            Text(exercise.icon)
                .font(.title2)
                .frame(width: 50, height: 50)
                .background(isPremium ? Color(hex: "FFD700").opacity(0.2) : Color(hex: "27AE60").opacity(0.2))
                .cornerRadius(12)
            
            VStack(alignment: .leading, spacing: 4) {
                HStack {
                    Text(exercise.title)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                    if isPremium {
                        Image(systemName: "star.fill")
                            .font(.caption2)
                            .foregroundStyle(Color(hex: "FFD700"))
                    }
                }
                Text(exercise.shortDesc)
                    .font(.caption)
                    .foregroundStyle(.white.opacity(0.6))
                    .lineLimit(2)
            }
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .foregroundStyle(.white.opacity(0.3))
        }
        .padding()
        .background(Color.white.opacity(0.05))
        .cornerRadius(12)
    }
    
    private func toolCard(icon: String, title: String, desc: String) -> some View {
        HStack(spacing: 16) {
            Text(icon)
                .font(.title2)
                .frame(width: 50, height: 50)
                .background(Color(hex: "00D4FF").opacity(0.2))
                .cornerRadius(12)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                Text(desc)
                    .font(.caption)
                    .foregroundStyle(.white.opacity(0.6))
            }
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .foregroundStyle(.white.opacity(0.3))
        }
        .padding()
        .background(Color.white.opacity(0.05))
        .cornerRadius(12)
    }
}

// MARK: - Exercise Model
struct RationalExercise: Identifiable {
    let id = UUID()
    let number: Int
    let icon: String
    let title: String
    let shortDesc: String
    let fullDescription: String
    let steps: [String]
    let scienceSource: String
    let isPremium: Bool
    
    static let freeExercises: [RationalExercise] = [
        RationalExercise(
            number: 1,
            icon: "🔍",
            title: "Bias Audit",
            shortDesc: "Identify cognitive fallacies in your decisions",
            fullDescription: "Log a recent decision and systematically identify potential cognitive biases that may have influenced it. This trains your meta-cognitive awareness.",
            steps: [
                "Recall a recent decision you made",
                "Write down your reasoning process",
                "Check against common biases: confirmation, anchoring, availability",
                "Ask: 'What data contradicts my conclusion?'",
                "Note which biases you identified",
                "Plan how to counter them next time"
            ],
            scienceSource: "Kahneman, D. (2011). Thinking, Fast and Slow. Farrar, Straus and Giroux.",
            isPremium: false
        ),
        RationalExercise(
            number: 2,
            icon: "🧠",
            title: "Neural Mirror",
            shortDesc: "Map emotions to brain regions",
            fullDescription: "Visualize brain regions via diagrams; note emotions and link to neural functions. Builds self-awareness through neuroscience, not spirits.",
            steps: [
                "Note your current emotional state",
                "Identify the intensity (1-10)",
                "Link to brain region: Amygdala (fear/anger), Prefrontal cortex (planning), Hippocampus (memory)",
                "Observe how naming the region changes your relationship to the emotion",
                "Practice 'This is my amygdala activating' rather than 'I am afraid'"
            ],
            scienceSource: "LeDoux, J. (1996). The Emotional Brain. Simon & Schuster.",
            isPremium: false
        ),
        RationalExercise(
            number: 3,
            icon: "📝",
            title: "Hypothesis Journal",
            shortDesc: "Frame beliefs as testable experiments",
            fullDescription: "Transform a personal belief into a testable hypothesis. Gather evidence for and against it daily. Trains scientific skepticism applied to your own mind.",
            steps: [
                "State a belief you hold (e.g., 'I'm bad at public speaking')",
                "Reframe as hypothesis: 'My public speaking causes negative audience reactions'",
                "Define measurable evidence that would support/refute it",
                "Gather data for 7 days",
                "Analyze: Does evidence support the belief?",
                "Update your belief based on data"
            ],
            scienceSource: "Popper, K. (1959). The Logic of Scientific Discovery. Routledge.",
            isPremium: false
        ),
        RationalExercise(
            number: 4,
            icon: "🦎",
            title: "Evo-Psych Probe",
            shortDesc: "Trace habits to evolutionary roots",
            fullDescription: "Recall a habit or impulse and trace it to potential evolutionary origins. Understanding why we have certain drives demystifies 'inner demons.'",
            steps: [
                "Identify a habit or craving (e.g., sugar, social media checking)",
                "Ask: 'What survival advantage might this have provided?'",
                "Sugar → quick energy in scarce environments",
                "Social checking → tribal status monitoring",
                "Recognize: The drive isn't 'bad,' just mismatched to modern context",
                "Design modern-appropriate alternatives"
            ],
            scienceSource: "Buss, D. (2019). Evolutionary Psychology: The New Science of the Mind. Routledge.",
            isPremium: false
        ),
        RationalExercise(
            number: 5,
            icon: "🎲",
            title: "Probability Play",
            shortDesc: "Reduce irrational fears with Bayes",
            fullDescription: "Estimate the odds of a worry actually occurring, then update with Bayesian reasoning. Empirically reduces anxiety by confronting actual probabilities.",
            steps: [
                "State your worry clearly",
                "Estimate base rate: How often does this happen generally?",
                "Identify your evidence: What makes you think it will happen to you?",
                "Apply Bayes: P(worry|evidence) = P(evidence|worry) × P(worry) / P(evidence)",
                "Compare intuitive fear level to calculated probability",
                "Notice the gap between feeling and reality"
            ],
            scienceSource: "McGrayne, S.B. (2011). The Theory That Would Not Die. Yale University Press.",
            isPremium: false
        ),
        RationalExercise(
            number: 6,
            icon: "🤫",
            title: "Silence Experiment",
            shortDesc: "Observe thoughts without meditation myths",
            fullDescription: "Timed silence where you observe and categorize thoughts as logical or illogical. Reveals the noise in your mental processes—no spiritual framing needed.",
            steps: [
                "Set timer for 10 minutes",
                "Sit quietly, eyes closed or soft-focused",
                "When a thought arises, label it: 'Logical' or 'Illogical'",
                "Logical: Based on evidence, solves a problem",
                "Illogical: Based on fear, fantasy, or irrelevant association",
                "Tally at end. Most minds run 80%+ illogical content",
                "No judgment—just data collection"
            ],
            scienceSource: "Killingsworth, M.A. & Gilbert, D.T. (2010). A Wandering Mind Is an Unhappy Mind. Science.",
            isPremium: false
        ),
        RationalExercise(
            number: 7,
            icon: "🔄",
            title: "Trait Flip",
            shortDesc: "Reframe flaws as adaptive features",
            fullDescription: "List a perceived flaw and reframe it as an adaptive trait. Use evolutionary lens for self-acceptance based on function, not judgment.",
            steps: [
                "Name a trait you consider a 'flaw'",
                "Ask: 'In what context would this be an advantage?'",
                "Stubbornness → Persistence in adversity",
                "Anxiety → Threat detection sensitivity",
                "Overthinking → Thorough analysis",
                "Recognize: Traits aren't good/bad, just contextual",
                "Design contexts where your 'flaw' becomes strength"
            ],
            scienceSource: "Nesse, R.M. (2019). Good Reasons for Bad Feelings. Dutton.",
            isPremium: false
        ),
        RationalExercise(
            number: 8,
            icon: "💓",
            title: "Body Metric Scan",
            shortDesc: "Correlate physical cues to mental states",
            fullDescription: "Track physical cues (pulse, tension, temperature) and correlate them to mental states. Somatic science without the mysticism.",
            steps: [
                "Check pulse rate (count for 15 sec × 4)",
                "Scan for muscle tension: jaw, shoulders, hands",
                "Note body temperature sensation",
                "Rate current mental state: anxious, calm, excited, depressed",
                "Log correlation: 'High pulse + tense shoulders = anxiety'",
                "Build personal database over time",
                "Use body signals as early warning system"
            ],
            scienceSource: "Damasio, A. (1994). Descartes' Error: Emotion, Reason, and the Human Brain. Putnam.",
            isPremium: false
        ),
        RationalExercise(
            number: 9,
            icon: "📊",
            title: "Gratitude Data",
            shortDesc: "Quantify impact of positivity on mood",
            fullDescription: "Log positive events and quantify their impact on your mood using a simple scale. Evidence-based approach to the 'gratitude' practice.",
            steps: [
                "Rate current mood (1-10)",
                "List 3 positive things from today",
                "For each, rate: How much did this improve my day? (1-5)",
                "Sum the impact scores",
                "Rate mood again after logging",
                "Track over 30 days",
                "Analyze: What types of positives have highest impact?"
            ],
            scienceSource: "Emmons, R.A. & McCullough, M.E. (2003). Counting Blessings Versus Burdens. Journal of Personality and Social Psychology.",
            isPremium: false
        ),
        RationalExercise(
            number: 10,
            icon: "❓",
            title: "Daily Doubt Dose",
            shortDesc: "Foster habitual questioning",
            fullDescription: "Each day, question one assumption you hold. Research a quick fact-check. Builds the habit of intellectual humility and continuous learning.",
            steps: [
                "Identify one thing you 'know' to be true",
                "Ask: 'How do I know this? What's my source?'",
                "Spend 5 minutes researching",
                "Find at least one counterargument or nuance",
                "Update your belief accordingly",
                "Log: Original belief → Updated belief",
                "Celebrate uncertainty as growth"
            ],
            scienceSource: "Mercier, H. & Sperber, D. (2017). The Enigma of Reason. Harvard University Press.",
            isPremium: false
        )
    ]
    
    static let premiumExercises: [RationalExercise] = [
        RationalExercise(
            number: 11,
            icon: "🤖",
            title: "AI Bias Simulator",
            shortDesc: "ML-powered cognitive trap detection",
            fullDescription: "Input a scenario and let AI models identify common cognitive traps, suggesting countermeasures based on psychological studies.",
            steps: [
                "Describe a decision scenario in detail",
                "AI analyzes for 50+ known biases",
                "Review flagged biases with confidence scores",
                "Read linked research for each bias",
                "Apply suggested countermeasures",
                "Re-evaluate decision with debiased thinking"
            ],
            scienceSource: "AI model trained on Cognitive Bias Codex (Benson, 2016) and behavioral economics literature.",
            isPremium: true
        ),
        RationalExercise(
            number: 12,
            icon: "🎭",
            title: "Neural Net Role-Play",
            shortDesc: "Debate between brain systems",
            fullDescription: "AI generates perspectives from different brain models—experience a 'debate' between your prefrontal cortex and limbic system.",
            steps: [
                "State a dilemma you're facing",
                "AI generates 'Limbic System' argument (emotional, survival-focused)",
                "AI generates 'Prefrontal Cortex' argument (rational, long-term)",
                "AI generates 'Default Mode Network' argument (self-referential, narrative)",
                "Synthesize insights from all three perspectives",
                "Make decision acknowledging all neural voices"
            ],
            scienceSource: "Based on MacLean's Triune Brain model and modern neuroscience updates.",
            isPremium: true
        ),
        RationalExercise(
            number: 13,
            icon: "💭",
            title: "Dream Data Decoder",
            shortDesc: "Sleep science dream analysis",
            fullDescription: "Log dreams and receive AI correlation to sleep science—REM patterns, memory consolidation—without any mystical interpretation.",
            steps: [
                "Log dream immediately upon waking",
                "Note: emotional tone, recurring elements, bizarreness level",
                "AI correlates to sleep stage science",
                "REM dreams: emotional processing, threat simulation",
                "NREM dreams: memory consolidation, skill learning",
                "Track patterns over time for insight into processing needs"
            ],
            scienceSource: "Walker, M. (2017). Why We Sleep. Scribner.",
            isPremium: true
        ),
        RationalExercise(
            number: 14,
            icon: "🌊",
            title: "Quantum Analogy Builder",
            shortDesc: "Probability waves for decisions",
            fullDescription: "AR overlays probability waves on your decisions. AI explains quantum metaphors for interconnectedness and uncertainty—no mysticism, just physics analogies.",
            steps: [
                "State a decision with multiple outcomes",
                "Visualize as probability wave (superposition)",
                "Understand: All outcomes exist until 'measured' (decided)",
                "Explore 'entanglement': How does this decision affect others?",
                "Collapse the wave: Make the decision",
                "Reflect on the 'many worlds' you didn't choose"
            ],
            scienceSource: "Analogies from quantum mechanics; not literal quantum effects on brain.",
            isPremium: true
        ),
        RationalExercise(
            number: 15,
            icon: "🏝️",
            title: "Solitude Lab",
            shortDesc: "Biofeedback-guided isolation insight",
            fullDescription: "Guided isolation with biofeedback monitoring. AI analyzes stress data patterns to identify when insights typically emerge.",
            steps: [
                "Enter solitude session (30-60 min)",
                "Wearable tracks HRV, skin conductance",
                "AI monitors for 'insight signatures' (sudden HRV shifts)",
                "When detected, AI prompts: 'What just occurred to you?'",
                "Log insights with physiological timestamps",
                "Analyze: What conditions produce your best insights?"
            ],
            scienceSource: "Kounios, J. & Beeman, M. (2015). The Eureka Factor. Random House.",
            isPremium: true
        ),
        RationalExercise(
            number: 16,
            icon: "👤",
            title: "Shadow Equation Dinner",
            shortDesc: "Model repressed traits mathematically",
            fullDescription: "Model your repressed traits as variables in an equation. AI solves for integration equilibria—Jung's shadow work, quantified.",
            steps: [
                "List traits you deny or judge in others",
                "These likely represent your 'shadow'",
                "Quantify: How strongly do you react? (1-10)",
                "AI models as repression energy equation",
                "Calculate integration path: gradual exposure plan",
                "Track reduction in reactivity over time"
            ],
            scienceSource: "Adapted from Jung's shadow concept with behavioral psychology metrics.",
            isPremium: true
        ),
        RationalExercise(
            number: 17,
            icon: "📈",
            title: "Trigger Timeline AI",
            shortDesc: "Regression analysis on emotions",
            fullDescription: "AI maps your emotional triggers to life data and uses regression analysis to predict future trigger events.",
            steps: [
                "Log emotional triggers for 30 days",
                "Include: context, people, time, preceding events",
                "AI runs multivariate regression",
                "Identifies strongest predictors of triggers",
                "Generates 'trigger forecast' for upcoming situations",
                "Prepare coping strategies for predicted triggers"
            ],
            scienceSource: "Statistical methods from behavioral psychology research.",
            isPremium: true
        ),
        RationalExercise(
            number: 18,
            icon: "🎨",
            title: "Creative Calc Outlet",
            shortDesc: "Math-inspired artistic expression",
            fullDescription: "AI proposes math-inspired creative expressions—fractal art for chaos theory, golden ratio compositions. Upload for algorithmic refinement.",
            steps: [
                "Choose a mathematical concept that resonates",
                "Fractals, Fibonacci, prime numbers, chaos theory",
                "AI generates creative prompts based on concept",
                "Create: visual art, music, writing, code",
                "Upload creation for AI analysis",
                "AI highlights how your creation embodies the math"
            ],
            scienceSource: "Intersection of mathematical aesthetics and creativity research.",
            isPremium: true
        ),
        RationalExercise(
            number: 19,
            icon: "👥",
            title: "Rational Circle Sync",
            shortDesc: "AI-moderated evidence-based discussion",
            fullDescription: "Virtual group discussions with AI moderation ensuring debates stay grounded in sources. No echo chambers, only evidence.",
            steps: [
                "Join topic-specific rational circle",
                "State position with supporting evidence",
                "AI fact-checks claims in real-time",
                "Unsupported claims flagged for revision",
                "Steel-man opposing views (AI ensures quality)",
                "Conclude with updated positions + uncertainty levels"
            ],
            scienceSource: "Based on rationalist community practices (LessWrong, etc.).",
            isPremium: true
        ),
        RationalExercise(
            number: 20,
            icon: "🌐",
            title: "Multiverse What-If",
            shortDesc: "Probabilistic outcome simulation",
            fullDescription: "AI simulates alternate outcomes via probabilistic branching. Enhances decision foresight by exploring the many worlds of your choices.",
            steps: [
                "Define a past decision point",
                "AI generates alternative decision branches",
                "Each branch: probability estimate + projected outcome",
                "Explore 3-5 alternate timelines",
                "Identify: Which timeline would you prefer?",
                "Apply learning to future decisions"
            ],
            scienceSource: "Decision tree analysis + scenario planning methodologies.",
            isPremium: true
        )
    ]
}

// MARK: - Exercise Detail View
struct RationalExerciseDetailView: View {
    let exercise: RationalExercise
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            LinearGradient(
                colors: [Color(hex: "0a0a12"), Color(hex: "101820")],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    // Header
                    HStack {
                        Text(exercise.icon)
                            .font(.system(size: 50))
                        VStack(alignment: .leading) {
                            if exercise.isPremium {
                                HStack {
                                    Text("PREMIUM")
                                        .font(.caption2)
                                        .fontWeight(.bold)
                                        .foregroundStyle(Color(hex: "FFD700"))
                                        .padding(.horizontal, 8)
                                        .padding(.vertical, 2)
                                        .background(Color(hex: "FFD700").opacity(0.2))
                                        .cornerRadius(4)
                                }
                            }
                            Text(exercise.title)
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundStyle(.white)
                        }
                    }
                    .padding(.top, 20)
                    
                    // Description
                    Text(exercise.fullDescription)
                        .font(.body)
                        .foregroundStyle(.white.opacity(0.9))
                        .lineSpacing(4)
                    
                    // Steps
                    VStack(alignment: .leading, spacing: 12) {
                        Text("📋 STEPS")
                            .font(.caption)
                            .foregroundStyle(.white.opacity(0.6))
                            .tracking(2)
                        
                        ForEach(Array(exercise.steps.enumerated()), id: \.offset) { index, step in
                            HStack(alignment: .top, spacing: 12) {
                                Text("\(index + 1)")
                                    .font(.caption)
                                    .fontWeight(.bold)
                                    .foregroundStyle(.black)
                                    .frame(width: 24, height: 24)
                                    .background(Color(hex: "00D4FF"))
                                    .cornerRadius(12)
                                
                                Text(step)
                                    .font(.subheadline)
                                    .foregroundStyle(.white.opacity(0.9))
                            }
                        }
                    }
                    .padding()
                    .background(Color.white.opacity(0.05))
                    .cornerRadius(12)
                    
                    // Science Source
                    VStack(alignment: .leading, spacing: 8) {
                        Text("📚 SOURCE")
                            .font(.caption)
                            .foregroundStyle(.white.opacity(0.6))
                            .tracking(2)
                        
                        Text(exercise.scienceSource)
                            .font(.caption)
                            .foregroundStyle(.white.opacity(0.7))
                            .italic()
                    }
                    .padding()
                    .background(Color(hex: "00D4FF").opacity(0.1))
                    .cornerRadius(12)
                    
                    // Start Button
                    Button(action: {}) {
                        Text("Begin Exercise")
                            .font(.headline)
                            .foregroundStyle(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color(hex: "00D4FF"))
                            .cornerRadius(12)
                    }
                    
                    Spacer(minLength: 50)
                }
                .padding(.horizontal, 20)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

// MARK: - Placeholder Tool Views
struct BiasCheckerView: View {
    var body: some View {
        ZStack {
            Color(hex: "0a0a12").ignoresSafeArea()
            Text("Bias Checker Tool - Coming Soon")
                .foregroundStyle(.white)
        }
        .navigationTitle("Bias Checker")
    }
}

struct BayesCalculatorView: View {
    var body: some View {
        ZStack {
            Color(hex: "0a0a12").ignoresSafeArea()
            Text("Bayes Calculator - Coming Soon")
                .foregroundStyle(.white)
        }
        .navigationTitle("Bayes Calculator")
    }
}

struct LogicalFallacyDatabaseView: View {
    var body: some View {
        ZStack {
            Color(hex: "0a0a12").ignoresSafeArea()
            Text("50+ Logical Fallacies - Coming Soon")
                .foregroundStyle(.white)
        }
        .navigationTitle("Fallacy Database")
    }
}

struct NeuralCorrelatesMapView: View {
    var body: some View {
        ZStack {
            Color(hex: "0a0a12").ignoresSafeArea()
            Text("Neural Correlates Map - Coming Soon")
                .foregroundStyle(.white)
        }
        .navigationTitle("Neural Map")
    }
}

struct EvoDriversView: View {
    var body: some View {
        ZStack {
            Color(hex: "0a0a12").ignoresSafeArea()
            Text("Evolutionary Drivers - Coming Soon")
                .foregroundStyle(.white)
        }
        .navigationTitle("Evo Drivers")
    }
}

struct RationalityQuotientQuizView: View {
    @Binding var score: Int
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(hex: "0a0a12").ignoresSafeArea()
                VStack {
                    Text("Rationality Quotient Quiz")
                        .font(.title2)
                        .foregroundStyle(.white)
                    Text("Coming Soon")
                        .foregroundStyle(.white.opacity(0.6))
                }
            }
            .navigationTitle("RQ Quiz")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") { dismiss() }
                }
            }
        }
    }
}

#Preview {
    RationalEnlightenmentView()
}
