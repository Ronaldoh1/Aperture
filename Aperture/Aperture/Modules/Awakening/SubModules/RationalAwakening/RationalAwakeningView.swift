// RationalAwakeningView.swift
// Rational Awakening - Evidence-Based Consciousness Expansion
// "No gods, just neurons—awaken without the afterlife baggage"

import SwiftUI

// MARK: - Main View
struct RationalAwakeningView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var selectedTab: RationalTab = .exercises
    @State private var completedExercises: Set<String> = []
    @State private var isPremium = false
    
    enum RationalTab: String, CaseIterable {
        case exercises = "Exercises"
        case concepts = "Concepts"
        case tools = "Tools"
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                // Scientific dark gradient
                LinearGradient(
                    colors: [Color(hex: "0a0a1a"), Color(hex: "0a1a2a"), Color(hex: "0a0a1a")],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
                
                VStack(spacing: 0) {
                    // Tab picker
                    Picker("Section", selection: $selectedTab) {
                        ForEach(RationalTab.allCases, id: \.self) { tab in
                            Text(tab.rawValue).tag(tab)
                        }
                    }
                    .pickerStyle(.segmented)
                    .padding()
                    
                    TabView(selection: $selectedTab) {
                        exercisesSection.tag(RationalTab.exercises)
                        conceptsSection.tag(RationalTab.concepts)
                        toolsSection.tag(RationalTab.tools)
                    }
                    .tabViewStyle(.page(indexDisplayMode: .never))
                }
            }
            .navigationTitle("🧠 Rational Awakening")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") { dismiss() }
                        .foregroundStyle(Color(hex: "00BFFF"))
                }
            }
        }
    }
    
    // MARK: - Exercises Section
    private var exercisesSection: some View {
        ScrollView {
            VStack(spacing: 24) {
                // Header
                VStack(spacing: 12) {
                    Text("🔬")
                        .font(.system(size: 50))
                    Text("Evidence-Based Exercises")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                    Text("20 exercises rooted in cognitive science")
                        .font(.subheadline)
                        .foregroundStyle(.white.opacity(0.7))
                }
                .padding(.vertical, 20)
                
                // Free Exercises
                VStack(alignment: .leading, spacing: 16) {
                    HStack {
                        Text("🆓 FREE EXERCISES")
                            .font(.caption)
                            .foregroundStyle(Color(hex: "27AE60"))
                            .tracking(2)
                        Spacer()
                        Text("10 Core Catalysts")
                            .font(.caption2)
                            .foregroundStyle(.white.opacity(0.5))
                    }
                    
                    ForEach(AwakeningExercise.freeExercises) { exercise in
                        AwakeningExerciseCard(exercise: exercise, isCompleted: completedExercises.contains(exercise.id))
                    }
                }
                
                // Premium Exercises
                VStack(alignment: .leading, spacing: 16) {
                    HStack {
                        Text("⭐ PREMIUM EXERCISES")
                            .font(.caption)
                            .foregroundStyle(Color(hex: "FFD700"))
                            .tracking(2)
                        Spacer()
                        Text("AI-Augmented")
                            .font(.caption2)
                            .foregroundStyle(.white.opacity(0.5))
                    }
                    
                    ForEach(AwakeningExercise.premiumExercises) { exercise in
                        AwakeningExerciseCard(exercise: exercise, isCompleted: completedExercises.contains(exercise.id), isPremium: true, isLocked: !isPremium)
                    }
                }
                
                Spacer(minLength: 50)
            }
            .padding(.horizontal, 20)
        }
    }
    
    // MARK: - Concepts Section
    private var conceptsSection: some View {
        ScrollView {
            VStack(spacing: 24) {
                VStack(spacing: 12) {
                    Text("📚")
                        .font(.system(size: 50))
                    Text("Core Concepts")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                    Text("The science behind rational awakening")
                        .font(.subheadline)
                        .foregroundStyle(.white.opacity(0.7))
                }
                .padding(.vertical, 20)
                
                ForEach(RationalConcept.allConcepts) { concept in
                    ConceptCard(concept: concept)
                }
                
                Spacer(minLength: 50)
            }
            .padding(.horizontal, 20)
        }
    }
    
    // MARK: - Tools Section
    private var toolsSection: some View {
        ScrollView {
            VStack(spacing: 24) {
                VStack(spacing: 12) {
                    Text("🛠️")
                        .font(.system(size: 50))
                    Text("Rationality Tools")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                    Text("Practical instruments for clear thinking")
                        .font(.subheadline)
                        .foregroundStyle(.white.opacity(0.7))
                }
                .padding(.vertical, 20)
                
                // Bias Checker
                NavigationLink(destination: AwakeningBiasCheckerView()) {
                    ToolCard(icon: "🎯", title: "Bias Checker", desc: "Identify cognitive biases in your thinking")
                }
                
                // Probability Calculator
                NavigationLink(destination: AwakeningBayesCalculatorView()) {
                    ToolCard(icon: "📊", title: "Bayes Calculator", desc: "Update beliefs with new evidence")
                }
                
                // Logical Fallacy Detector
                NavigationLink(destination: FallacyDetectorView()) {
                    ToolCard(icon: "⚠️", title: "Fallacy Detector", desc: "Spot logical errors in arguments")
                }
                
                // Evidence Journal
                NavigationLink(destination: EvidenceJournalView()) {
                    ToolCard(icon: "📓", title: "Evidence Journal", desc: "Track hypotheses and outcomes")
                }
                
                Spacer(minLength: 50)
            }
            .padding(.horizontal, 20)
        }
    }
}

// MARK: - Exercise Card
struct AwakeningExerciseCard: View {
    let exercise: AwakeningExercise
    var isCompleted: Bool = false
    var isPremium: Bool = false
    var isLocked: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Text(exercise.icon)
                    .font(.title2)
                
                VStack(alignment: .leading, spacing: 2) {
                    HStack {
                        Text(exercise.title)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundStyle(.white)
                        
                        if isCompleted {
                            Image(systemName: "checkmark.circle.fill")
                                .foregroundStyle(Color(hex: "27AE60"))
                                .font(.caption)
                        }
                        
                        if isLocked {
                            Image(systemName: "lock.fill")
                                .foregroundStyle(Color(hex: "FFD700"))
                                .font(.caption)
                        }
                    }
                    
                    Text(exercise.category)
                        .font(.caption2)
                        .foregroundStyle(isPremium ? Color(hex: "FFD700") : Color(hex: "00BFFF"))
                }
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .foregroundStyle(.white.opacity(0.3))
            }
            
            Text(exercise.description)
                .font(.caption)
                .foregroundStyle(.white.opacity(0.7))
                .lineLimit(2)
            
            // Source
            if let source = exercise.source {
                Text("Source: \(source)")
                    .font(.caption2)
                    .foregroundStyle(Color(hex: "00BFFF").opacity(0.7))
            }
        }
        .padding()
        .background(Color.white.opacity(isLocked ? 0.02 : 0.05))
        .cornerRadius(12)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(isPremium ? Color(hex: "FFD700").opacity(0.3) : Color.clear, lineWidth: 1)
        )
    }
}

// MARK: - Concept Card
struct ConceptCard: View {
    let concept: RationalConcept
    @State private var isExpanded = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Button(action: { withAnimation { isExpanded.toggle() } }) {
                HStack {
                    Text(concept.icon)
                        .font(.title2)
                    
                    Text(concept.title)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                    
                    Spacer()
                    
                    Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                        .foregroundStyle(.white.opacity(0.5))
                }
            }
            .buttonStyle(.plain)
            
            if isExpanded {
                Text(concept.explanation)
                    .font(.caption)
                    .foregroundStyle(.white.opacity(0.8))
                    .lineSpacing(4)
                
                if !concept.keyPoints.isEmpty {
                    VStack(alignment: .leading, spacing: 6) {
                        Text("Key Points:")
                            .font(.caption)
                            .fontWeight(.semibold)
                            .foregroundStyle(Color(hex: "00BFFF"))
                        
                        ForEach(concept.keyPoints, id: \.self) { point in
                            HStack(alignment: .top, spacing: 8) {
                                Text("•")
                                Text(point)
                            }
                            .font(.caption)
                            .foregroundStyle(.white.opacity(0.7))
                        }
                    }
                }
            }
        }
        .padding()
        .background(Color.white.opacity(0.05))
        .cornerRadius(12)
    }
}

// MARK: - Tool Card
struct ToolCard: View {
    let icon: String
    let title: String
    let desc: String
    
    var body: some View {
        HStack(spacing: 16) {
            Text(icon)
                .font(.title)
                .frame(width: 50)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                
                Text(desc)
                    .font(.caption)
                    .foregroundStyle(.white.opacity(0.7))
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

// MARK: - Data Models
struct AwakeningExercise: Identifiable {
    let id = UUID().uuidString
    let icon: String
    let title: String
    let category: String
    let description: String
    let instructions: [String]
    let source: String?
    
    static let freeExercises: [AwakeningExercise] = [
        AwakeningExercise(
            icon: "🎯",
            title: "Bias Audit",
            category: "Cognitive Science",
            description: "Log a decision, identify potential fallacies. Ask: 'What data contradicts this?'",
            instructions: ["Write down a recent decision", "Identify 3 possible biases", "Find counter-evidence"],
            source: "Kahneman, Thinking Fast and Slow"
        ),
        AwakeningExercise(
            icon: "🧠",
            title: "Neural Mirror",
            category: "Neuroscience",
            description: "Visualize brain regions, note emotions and link to functions (amygdala = fear).",
            instructions: ["Note your current emotion", "Identify the brain region", "Understand the evolutionary purpose"],
            source: "Damasio, Descartes' Error"
        ),
        AwakeningExercise(
            icon: "📝",
            title: "Hypothesis Journal",
            category: "Scientific Method",
            description: "Frame a personal belief as testable; gather daily evidence pro/con.",
            instructions: ["State a belief as hypothesis", "Define testable predictions", "Log evidence for 7 days"],
            source: "Popper, The Logic of Scientific Discovery"
        ),
        AwakeningExercise(
            icon: "🦴",
            title: "Evo-Psych Probe",
            category: "Evolutionary Psychology",
            description: "Recall a habit, trace to evolutionary roots (sugar craving = survival hack).",
            instructions: ["Identify a strong urge", "Research ancestral environment", "Understand adaptive value"],
            source: "Pinker, How the Mind Works"
        ),
        AwakeningExercise(
            icon: "📊",
            title: "Probability Play",
            category: "Bayesian Reasoning",
            description: "Estimate odds of a worry; adjust with Bayes' basics. Reduces irrational fears.",
            instructions: ["Write down a fear", "Estimate base rate", "Update with personal evidence"],
            source: "Pearl, The Book of Why"
        ),
        AwakeningExercise(
            icon: "🤫",
            title: "Silence Experiment",
            category: "Metacognition",
            description: "Timed quiet; observe thoughts, categorize as logical/illogical.",
            instructions: ["Set 10-minute timer", "Note each thought", "Label: logical, emotional, random"],
            source: "Harris, Waking Up"
        ),
        AwakeningExercise(
            icon: "🔄",
            title: "Trait Flip",
            category: "Reframing",
            description: "List a 'flaw,' reframe as adaptive (stubbornness = persistence).",
            instructions: ["Name a perceived flaw", "Find evolutionary advantage", "Identify contexts where it helps"],
            source: "Grant, Think Again"
        ),
        AwakeningExercise(
            icon: "💓",
            title: "Body Metric Scan",
            category: "Interoception",
            description: "Track physical cues (pulse, tension); correlate to mental states.",
            instructions: ["Measure heart rate", "Note body tension", "Log corresponding thoughts"],
            source: "Porges, The Polyvagal Theory"
        ),
        AwakeningExercise(
            icon: "📈",
            title: "Gratitude Data",
            category: "Positive Psychology",
            description: "Log positives, quantify impact on mood (simple scale).",
            instructions: ["List 3 positives", "Rate mood before/after", "Track patterns over time"],
            source: "Seligman, Flourish"
        ),
        AwakeningExercise(
            icon: "❓",
            title: "Daily Doubt Dose",
            category: "Critical Thinking",
            description: "Question one assumption; research quick fact-check. Fosters habitual rationality.",
            instructions: ["Pick one belief", "Find 3 sources", "Update confidence level"],
            source: "Sagan, The Demon-Haunted World"
        )
    ]
    
    static let premiumExercises: [AwakeningExercise] = [
        AwakeningExercise(
            icon: "🤖",
            title: "AI Bias Simulator",
            category: "Machine Learning",
            description: "Input scenario; ML models common cognitive traps, suggests countermeasures.",
            instructions: ["Describe your decision", "AI identifies bias patterns", "Review personalized strategies"],
            source: "Behavioral Economics Research"
        ),
        AwakeningExercise(
            icon: "🎭",
            title: "Neural Net Role-Play",
            category: "Neuroscience Simulation",
            description: "AI generates perspectives from brain models (Prefrontal vs Limbic debate).",
            instructions: ["Present a dilemma", "Hear from 'brain regions'", "Integrate perspectives"],
            source: "LeDoux, The Emotional Brain"
        ),
        AwakeningExercise(
            icon: "😴",
            title: "Dream Data Decoder",
            category: "Sleep Science",
            description: "Log dreams; AI correlates to sleep science (REM patterns), minus mysticism.",
            instructions: ["Record dream immediately", "AI analyzes patterns", "Connect to waking concerns"],
            source: "Walker, Why We Sleep"
        ),
        AwakeningExercise(
            icon: "⚛️",
            title: "Quantum Analogy Builder",
            category: "Physics Metaphors",
            description: "AR overlays probability waves on decisions; AI explains entanglement metaphors.",
            instructions: ["Visualize decision branches", "Understand superposition", "Collapse to choice"],
            source: "Feynman, QED Lectures"
        ),
        AwakeningExercise(
            icon: "🏝️",
            title: "Solitude Lab",
            category: "Biofeedback",
            description: "Biofeedback-guided isolation; AI analyzes stress data for insight patterns.",
            instructions: ["Connect wearable", "Enter guided solitude", "Review stress-insight correlation"],
            source: "Csikszentmihalyi, Flow"
        ),
        AwakeningExercise(
            icon: "👤",
            title: "Shadow Equation Dinner",
            category: "Depth Psychology",
            description: "Model repressed traits as variables; AI solves for integration equilibria.",
            instructions: ["Identify denied trait", "Map as equation", "Solve for balance"],
            source: "Jung via Cognitive Science"
        ),
        AwakeningExercise(
            icon: "📉",
            title: "Trigger Timeline AI",
            category: "Predictive Analytics",
            description: "Maps emotional triggers to life data; predicts future via regression analysis.",
            instructions: ["Log trigger events", "AI finds patterns", "Predict and prepare"],
            source: "Statistical Learning Theory"
        ),
        AwakeningExercise(
            icon: "🎨",
            title: "Creative Calc Outlet",
            category: "Mathematical Art",
            description: "AI proposes math-inspired expressions (fractal art for chaos theory).",
            instructions: ["Choose math concept", "Generate visual art", "Reflect on patterns"],
            source: "Mandelbrot, The Fractal Geometry of Nature"
        ),
        AwakeningExercise(
            icon: "👥",
            title: "Rational Circle Sync",
            category: "Collective Intelligence",
            description: "Virtual groups with AI moderation; debates grounded in sources, no echo.",
            instructions: ["Join topic circle", "Debate with citations", "AI ensures balance"],
            source: "Mercier & Sperber, The Enigma of Reason"
        ),
        AwakeningExercise(
            icon: "🌌",
            title: "Multiverse What-If",
            category: "Decision Science",
            description: "AI simulates alternate outcomes via probabilistic branching.",
            instructions: ["Input past decision", "See alternate branches", "Extract lessons"],
            source: "Everett, Many-Worlds Interpretation"
        )
    ]
}

struct RationalConcept: Identifiable {
    let id = UUID().uuidString
    let icon: String
    let title: String
    let explanation: String
    let keyPoints: [String]
    
    static let allConcepts: [RationalConcept] = [
        RationalConcept(
            icon: "🧮",
            title: "Bayesian Reasoning",
            explanation: "Bayesian reasoning is a method of statistical inference that updates the probability of a hypothesis as more evidence becomes available. Instead of binary true/false thinking, you hold beliefs with degrees of confidence and update them rationally when new data arrives.",
            keyPoints: [
                "Prior probability: Your belief before new evidence",
                "Likelihood: How probable is the evidence given the hypothesis",
                "Posterior: Updated belief after considering evidence",
                "Continuously update beliefs with each new piece of information"
            ]
        ),
        RationalConcept(
            icon: "🎭",
            title: "Cognitive Biases",
            explanation: "Cognitive biases are systematic patterns of deviation from rationality in judgment. They're not flaws but evolved mental shortcuts (heuristics) that were useful in ancestral environments but can mislead in modern contexts.",
            keyPoints: [
                "Confirmation bias: Seeking info that confirms existing beliefs",
                "Availability heuristic: Overweighting recent/vivid examples",
                "Anchoring: Over-relying on first piece of information",
                "Dunning-Kruger: Incompetent unaware of incompetence"
            ]
        ),
        RationalConcept(
            icon: "🧠",
            title: "Dual Process Theory",
            explanation: "The brain operates with two systems: System 1 (fast, automatic, emotional) and System 2 (slow, deliberate, logical). Most awakening is about strengthening System 2's oversight of System 1's impulses.",
            keyPoints: [
                "System 1: Intuitive, effortless, prone to bias",
                "System 2: Analytical, effortful, more accurate",
                "Cognitive load depletes System 2 resources",
                "Metacognition: Thinking about your thinking"
            ]
        ),
        RationalConcept(
            icon: "🔬",
            title: "Scientific Method",
            explanation: "The systematic pursuit of knowledge through observation, hypothesis formation, experimentation, and revision. Applied to personal growth, it means treating your beliefs as hypotheses to be tested, not truths to be defended.",
            keyPoints: [
                "Falsifiability: Good hypotheses can be proven wrong",
                "Replication: Results should be consistent",
                "Control variables: Isolate what you're testing",
                "Null hypothesis: Assume no effect until proven"
            ]
        ),
        RationalConcept(
            icon: "🧬",
            title: "Evolutionary Psychology",
            explanation: "Understanding human behavior through the lens of natural selection. Our brains evolved for survival in ancestral environments, not for happiness or truth-seeking in modern ones. This mismatch explains many of our irrational tendencies.",
            keyPoints: [
                "Environment of Evolutionary Adaptation (EEA)",
                "Mismatch theory: Old solutions, new problems",
                "Status-seeking as survival strategy",
                "Loss aversion: Losses hurt more than gains help"
            ]
        )
    ]
}

// MARK: - Tool Views (Stubs)
struct AwakeningBiasCheckerView: View {
    var body: some View {
        Text("Bias Checker Tool")
            .navigationTitle("Bias Checker")
    }
}

struct AwakeningBayesCalculatorView: View {
    var body: some View {
        Text("Bayes Calculator")
            .navigationTitle("Bayes Calculator")
    }
}

struct FallacyDetectorView: View {
    var body: some View {
        Text("Fallacy Detector")
            .navigationTitle("Fallacy Detector")
    }
}

struct EvidenceJournalView: View {
    var body: some View {
        Text("Evidence Journal")
            .navigationTitle("Evidence Journal")
    }
}

#Preview {
    RationalAwakeningView()
}
