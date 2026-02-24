// ConsciousnessAssessment.swift
// Aperture
//
// Meet People Where They Are - Assessment & Course Recommendation System
// Identifies consciousness state and recommends optimal learning path

import Foundation
import SwiftUI


// MARK: - Consciousness Archetypes

/// The different states of consciousness people arrive in
enum ConsciousnessArchetype: String, CaseIterable, Identifiable {
    
    case sleepingProgrammed = "sleeping_programmed"
    case tribalPartisan = "tribal_partisan"
    case overwhelmedEmpath = "overwhelmed_empath"
    case skepticalSeeker = "skeptical_seeker"
    case disillusionedAwakening = "disillusioned_awakening"
    case activeQuestioner = "active_questioner"
    case spiritualBypasser = "spiritual_bypasser"
    case traumaCarrier = "trauma_carrier"
    case systemsThinking = "systems_thinking"
    case advancedSeeker = "advanced_seeker"
    
    var id: String { rawValue }
    
    
    // MARK: - Display Properties
    
    var title: String {
        switch self {
        case .sleepingProgrammed: return "The Sleeper"
        case .tribalPartisan: return "The Tribal"
        case .overwhelmedEmpath: return "The Empath"
        case .skepticalSeeker: return "The Skeptic"
        case .disillusionedAwakening: return "The Disillusioned"
        case .activeQuestioner: return "The Questioner"
        case .spiritualBypasser: return "The Bypasser"
        case .traumaCarrier: return "The Wounded"
        case .systemsThinking: return "The Analyst"
        case .advancedSeeker: return "The Awakening"
        }
    }
    
    var subtitle: String {
        switch self {
        case .sleepingProgrammed: return "Comfortable but sensing something's off"
        case .tribalPartisan: return "Identified with a team or ideology"
        case .overwhelmedEmpath: return "Feeling everyone's pain"
        case .skepticalSeeker: return "Curious but needs proof"
        case .disillusionedAwakening: return "Nothing makes sense anymore"
        case .activeQuestioner: return "Actively investigating reality"
        case .spiritualBypasser: return "Using spirituality to avoid pain"
        case .traumaCarrier: return "Carrying unprocessed experiences"
        case .systemsThinking: return "Sees patterns and connections"
        case .advancedSeeker: return "Ready for deeper teachings"
        }
    }
    
    var icon: String {
        switch self {
        case .sleepingProgrammed: return "moon.zzz.fill"
        case .tribalPartisan: return "flag.fill"
        case .overwhelmedEmpath: return "heart.fill"
        case .skepticalSeeker: return "magnifyingglass"
        case .disillusionedAwakening: return "cloud.fog.fill"
        case .activeQuestioner: return "questionmark.circle.fill"
        case .spiritualBypasser: return "sparkles"
        case .traumaCarrier: return "bandage.fill"
        case .systemsThinking: return "cpu.fill"
        case .advancedSeeker: return "eye.fill"
        }
    }
    
    var colorHex: String {
        switch self {
        case .sleepingProgrammed: return "#9E9E9E"
        case .tribalPartisan: return "#F44336"
        case .overwhelmedEmpath: return "#E91E63"
        case .skepticalSeeker: return "#2196F3"
        case .disillusionedAwakening: return "#607D8B"
        case .activeQuestioner: return "#FF9800"
        case .spiritualBypasser: return "#9C27B0"
        case .traumaCarrier: return "#795548"
        case .systemsThinking: return "#00BCD4"
        case .advancedSeeker: return "#4CAF50"
        }
    }
    
    var color: Color {
        Color(hex: colorHex)
    }
    
    
    // MARK: - Detailed Description
    
    var description: String {
        switch self {
        case .sleepingProgrammed:
            return """
            You're going through life on autopilot—work, consume, repeat. Things seem fine on the surface, but there's a nagging feeling that something isn't quite right.
            
            You might dismiss "conspiracy theories" or "spiritual stuff" as nonsense, but you clicked on this app for a reason.
            
            That curiosity is your first crack in the matrix.
            """
            
        case .tribalPartisan:
            return """
            You've found your team—political, religious, or ideological. You know who the good guys and bad guys are. The world makes sense through this lens.
            
            But lately, you might be noticing that your "side" does some of the same things you criticize the other side for.
            
            That cognitive dissonance? It's the beginning of seeing beyond the game.
            """
            
        case .overwhelmedEmpath:
            return """
            You feel everything—the world's pain, other people's emotions, the suffering in the news. It's exhausting.
            
            You might think you're "too sensitive" for this world, or that something is wrong with you.
            
            Nothing is wrong with you. You're picking up on real information. You just need to learn how to process it without drowning.
            """
            
        case .skepticalSeeker:
            return """
            You're curious about deeper truths, but you need evidence. Woo-woo spiritual talk makes you roll your eyes, but pure materialism doesn't feel complete either.
            
            You want to understand reality, not just believe in comforting stories.
            
            Good. That critical thinking will serve you well—as long as it doesn't become a prison.
            """
            
        case .disillusionedAwakening:
            return """
            Nothing makes sense anymore. The institutions you trusted seem corrupt. The narratives you believed seem hollow. You might feel lost, angry, or depressed.
            
            This is actually a crucial stage. The old operating system is crashing so a new one can install.
            
            The disillusionment isn't the end—it's the beginning.
            """
            
        case .activeQuestioner:
            return """
            You're actively investigating reality. You've gone down rabbit holes, questioned official narratives, and realized that much of what you were taught was incomplete or false.
            
            The danger now is getting lost in endless research without integration, or becoming paranoid rather than empowered.
            
            Knowledge without wisdom is incomplete.
            """
            
        case .spiritualBypasser:
            return """
            You've found spiritual teachings that feel true—love and light, manifestation, positive thinking. But sometimes you use these concepts to avoid looking at shadow, pain, or systemic problems.
            
            "Everything happens for a reason" can become an excuse not to examine what's actually happening.
            
            True spirituality includes the darkness, not just the light.
            """
            
        case .traumaCarrier:
            return """
            You're carrying unprocessed experiences—personal, ancestral, or collective. This pain colors how you see everything.
            
            You might be drawn to understanding why the world is so broken because you've experienced that brokenness directly.
            
            Your wounds can become your wisdom—but first they need to be honored.
            """
            
        case .systemsThinking:
            return """
            You see patterns and connections that others miss. You understand that individual events are symptoms of larger systems.
            
            You might be an engineer, analyst, or just someone who naturally thinks in frameworks.
            
            This analytical capacity is exactly what's needed—to decode how control systems actually work.
            """
            
        case .advancedSeeker:
            return """
            You've done the work. You've questioned reality, processed shadow, seen through many illusions. You're ready for deeper teachings.
            
            You understand that awakening isn't an endpoint but a continuous process.
            
            Now the real work begins—not just waking up yourself, but helping others wake up.
            """
        }
    }
    
    
    // MARK: - Course Recommendations
    
    var recommendedCoursePath: [String] {
        switch self {
        case .sleepingProgrammed:
            return [
                "consciousness-101",        // Start with basics
                "attention-economy",        // Show how they're being manipulated
                "psyop-detection",          // Wake them up to manipulation
                "ujat-code"                 // Practical perception training
            ]
            
        case .tribalPartisan:
            return [
                "psyop-detection",          // See how both sides are played
                "divide-and-conquer",       // Understand the game
                "media-literacy",           // Decode manipulation
                "consciousness-101"         // Expand beyond tribal identity
            ]
            
        case .overwhelmedEmpath:
            return [
                "ujat-code",                // Perception training & boundaries
                "nervous-system-101",       // Regulate the system
                "empath-protection",        // Specific empath skills
                "sophia-awakening"          // Divine feminine path
            ]
            
        case .skepticalSeeker:
            return [
                "eleventh-dimension",       // Physics-based consciousness
                "ujat-code",                // Neuroscience-backed perception
                "consciousness-101",        // Foundational understanding
                "psyop-detection"           // Evidence-based analysis
            ]
            
        case .disillusionedAwakening:
            return [
                "dark-night-navigation",    // Process the disillusionment
                "consciousness-101",        // New framework
                "psyop-detection",          // Understand what happened
                "demiurge-decoded"          // Why the world seems broken
            ]
            
        case .activeQuestioner:
            return [
                "psyop-detection",          // Systematic analysis
                "demiurge-decoded",         // Deep framework
                "eleventh-dimension",       // Consciousness expansion
                "sophia-awakening"          // Integration path
            ]
            
        case .spiritualBypasser:
            return [
                "shadow-integration",       // Face the darkness
                "demiurge-decoded",         // Spiritual AND systemic
                "psyop-detection",          // Ground the spiritual
                "sophia-awakening"          // Balanced divine feminine
            ]
            
        case .traumaCarrier:
            return [
                "nervous-system-101",       // Safety first
                "ujat-code",                // Body awareness
                "shadow-integration",       // Process the wounds
                "sophia-awakening"          // Healing path
            ]
            
        case .systemsThinking:
            return [
                "psyop-detection",          // Systems analysis
                "demiurge-decoded",         // Ultimate system
                "eleventh-dimension",       // Consciousness as system
                "sophia-awakening"          // Integration
            ]
            
        case .advancedSeeker:
            return [
                "sophia-awakening",         // Deep Gnostic path
                "demiurge-decoded",         // Advanced framework
                "eleventh-dimension",       // Multi-dimensional
                "standing-ones"             // Service path
            ]
        }
    }
    
    var primaryCourseId: String {
        recommendedCoursePath.first ?? "consciousness-101"
    }
    
    
    // MARK: - Dragon Message
    
    var dragonMessage: String {
        switch self {
        case .sleepingProgrammed:
            return """
            Seeker, the fact that you're here means something in you already knows.
            
            That nagging feeling? It's not anxiety. It's your soul remembering.
            
            Let's start by showing you what's been hidden in plain sight. Not to scare you—but to free you.
            """
            
        case .tribalPartisan:
            return """
            Seeker, I understand the comfort of knowing which team you're on.
            
            But what if I told you that both teams are playing the same game—and neither team knows who's dealing the cards?
            
            The real division isn't left vs right. It's awake vs asleep. Let me show you.
            """
            
        case .overwhelmedEmpath:
            return """
            Sensitive one, you're not broken. You're DESIGNED to feel this much.
            
            But you're picking up signals without knowing how to process them. It's like having a radio that receives every station at once.
            
            Let me teach you to tune—so you can receive without drowning.
            """
            
        case .skepticalSeeker:
            return """
            Seeker, I respect your demand for evidence. The world is full of charlatans.
            
            But I'm not going to ask you to believe anything. I'm going to show you experiments you can run yourself.
            
            Your skepticism is welcome here. Let's test reality together.
            """
            
        case .disillusionedAwakening:
            return """
            Seeker, I know it feels like everything is falling apart.
            
            It is. And that's exactly what needs to happen.
            
            The old world has to die for the new one to be born. You're not lost—you're in between. Let me help you navigate.
            """
            
        case .activeQuestioner:
            return """
            Seeker, you've gone deep. You've seen things that can't be unseen.
            
            But knowledge without integration is just mental noise. And endless research can become its own trap.
            
            Let me help you turn what you know into what you embody.
            """
            
        case .spiritualBypasser:
            return """
            Seeker, love and light are real. But so is the shadow.
            
            True awakening doesn't transcend the darkness—it integrates it. The lotus grows in mud, not in the sky.
            
            Let me show you a spirituality that includes everything.
            """
            
        case .traumaCarrier:
            return """
            Wounded healer, your pain is not a weakness. It's the source of your future power.
            
            But first, it needs to be witnessed, honored, and integrated—not bypassed or pushed down.
            
            Let me walk with you through the fire. On the other side, you'll find yourself.
            """
            
        case .systemsThinking:
            return """
            Analyst, you see patterns others miss. That's exactly what's needed.
            
            The control systems aren't mystical—they're engineered. And they can be reverse-engineered by someone who thinks like you.
            
            Let me give you the blueprints.
            """
            
        case .advancedSeeker:
            return """
            Seeker, you've done the work. You've questioned, processed, and integrated.
            
            Now comes the deeper path—the ancient teachings that were hidden until humanity was ready.
            
            You're ready. Let's go further.
            """
        }
    }
}


// MARK: - Assessment Questions

struct AssessmentQuestion: Identifiable {
    let id: Int
    let question: String
    let options: [AssessmentOption]
}

struct AssessmentOption: Identifiable {
    let id = UUID()
    let text: String
    let archetypeWeights: [ConsciousnessArchetype: Int]
}


// MARK: - Assessment Engine

class ConsciousnessAssessment: ObservableObject {
    
    @Published var currentQuestionIndex = 0
    @Published var answers: [Int: AssessmentOption] = [:]
    @Published var isComplete = false
    @Published var result: ConsciousnessArchetype?
    @Published var secondaryArchetype: ConsciousnessArchetype?
    
    let questions: [AssessmentQuestion] = ConsciousnessAssessment.buildQuestions()
    
    var progress: Double {
        Double(currentQuestionIndex) / Double(questions.count)
    }
    
    var currentQuestion: AssessmentQuestion? {
        guard currentQuestionIndex < questions.count else { return nil }
        return questions[currentQuestionIndex]
    }
    
    
    // MARK: - Answer Processing
    
    func selectAnswer(_ option: AssessmentOption) {
        answers[currentQuestionIndex] = option
        
        if currentQuestionIndex < questions.count - 1 {
            currentQuestionIndex += 1
        } else {
            calculateResult()
        }
    }
    
    func goBack() {
        if currentQuestionIndex > 0 {
            currentQuestionIndex -= 1
        }
    }
    
    func reset() {
        currentQuestionIndex = 0
        answers = [:]
        isComplete = false
        result = nil
        secondaryArchetype = nil
    }
    
    
    // MARK: - Result Calculation
    
    private func calculateResult() {
        var scores: [ConsciousnessArchetype: Int] = [:]
        
        // Initialize all archetypes with 0
        for archetype in ConsciousnessArchetype.allCases {
            scores[archetype] = 0
        }
        
        // Sum up weights from all answers
        for (_, option) in answers {
            for (archetype, weight) in option.archetypeWeights {
                scores[archetype, default: 0] += weight
            }
        }
        
        // Sort by score
        let sorted = scores.sorted { $0.value > $1.value }
        
        // Set primary and secondary results
        if let primary = sorted.first {
            result = primary.key
        }
        
        if sorted.count > 1 {
            secondaryArchetype = sorted[1].key
        }
        
        isComplete = true
    }
    
    
    // MARK: - Question Builder
    
    static func buildQuestions() -> [AssessmentQuestion] {
        return [
            
            // QUESTION 1: Current State
            AssessmentQuestion(
                id: 1,
                question: "How would you describe your current relationship with reality?",
                options: [
                    AssessmentOption(
                        text: "Things are fine. I just sense there might be more to life.",
                        archetypeWeights: [.sleepingProgrammed: 3, .skepticalSeeker: 1]
                    ),
                    AssessmentOption(
                        text: "I know which side is right and which is wrong.",
                        archetypeWeights: [.tribalPartisan: 3, .sleepingProgrammed: 1]
                    ),
                    AssessmentOption(
                        text: "I feel overwhelmed by the world's pain.",
                        archetypeWeights: [.overwhelmedEmpath: 3, .traumaCarrier: 1]
                    ),
                    AssessmentOption(
                        text: "Nothing makes sense anymore. I feel lost.",
                        archetypeWeights: [.disillusionedAwakening: 3, .traumaCarrier: 1]
                    ),
                    AssessmentOption(
                        text: "I'm actively investigating what's really going on.",
                        archetypeWeights: [.activeQuestioner: 3, .systemsThinking: 1]
                    )
                ]
            ),
            
            // QUESTION 2: Information Sources
            AssessmentQuestion(
                id: 2,
                question: "When you encounter information that contradicts your beliefs, you typically:",
                options: [
                    AssessmentOption(
                        text: "Dismiss it if it sounds too 'out there'",
                        archetypeWeights: [.sleepingProgrammed: 2, .tribalPartisan: 2]
                    ),
                    AssessmentOption(
                        text: "Check if it aligns with what my trusted sources say",
                        archetypeWeights: [.tribalPartisan: 3, .sleepingProgrammed: 1]
                    ),
                    AssessmentOption(
                        text: "Feel anxious and need to research more",
                        archetypeWeights: [.activeQuestioner: 2, .overwhelmedEmpath: 2]
                    ),
                    AssessmentOption(
                        text: "Investigate it regardless of the source",
                        archetypeWeights: [.skepticalSeeker: 2, .activeQuestioner: 2]
                    ),
                    AssessmentOption(
                        text: "Look for the pattern or system behind it",
                        archetypeWeights: [.systemsThinking: 3, .advancedSeeker: 1]
                    )
                ]
            ),
            
            // QUESTION 3: Emotional Experience
            AssessmentQuestion(
                id: 3,
                question: "How do you experience other people's emotions?",
                options: [
                    AssessmentOption(
                        text: "I don't really notice them unless they're obvious",
                        archetypeWeights: [.sleepingProgrammed: 3, .systemsThinking: 1]
                    ),
                    AssessmentOption(
                        text: "I feel them intensely, sometimes it's too much",
                        archetypeWeights: [.overwhelmedEmpath: 3, .traumaCarrier: 1]
                    ),
                    AssessmentOption(
                        text: "I notice them but try to stay objective",
                        archetypeWeights: [.skepticalSeeker: 2, .systemsThinking: 2]
                    ),
                    AssessmentOption(
                        text: "I can sense them and usually process them well",
                        archetypeWeights: [.advancedSeeker: 2, .spiritualBypasser: 2]
                    ),
                    AssessmentOption(
                        text: "I'm so flooded with my own emotions I can barely tell",
                        archetypeWeights: [.traumaCarrier: 3, .disillusionedAwakening: 1]
                    )
                ]
            ),
            
            // QUESTION 4: Spiritual Beliefs
            AssessmentQuestion(
                id: 4,
                question: "What's your relationship with spirituality or metaphysics?",
                options: [
                    AssessmentOption(
                        text: "I follow a traditional religion/belief system",
                        archetypeWeights: [.sleepingProgrammed: 2, .tribalPartisan: 2]
                    ),
                    AssessmentOption(
                        text: "I believe in love, light, and positive thinking",
                        archetypeWeights: [.spiritualBypasser: 3, .overwhelmedEmpath: 1]
                    ),
                    AssessmentOption(
                        text: "I need evidence before I believe anything",
                        archetypeWeights: [.skepticalSeeker: 3, .systemsThinking: 1]
                    ),
                    AssessmentOption(
                        text: "I've explored many paths and integrate what works",
                        archetypeWeights: [.advancedSeeker: 3, .activeQuestioner: 1]
                    ),
                    AssessmentOption(
                        text: "I'm not sure what to believe anymore",
                        archetypeWeights: [.disillusionedAwakening: 3, .traumaCarrier: 1]
                    )
                ]
            ),
            
            // QUESTION 5: World View
            AssessmentQuestion(
                id: 5,
                question: "When you look at world events and systems, you see:",
                options: [
                    AssessmentOption(
                        text: "Basically what the news tells me, with some skepticism",
                        archetypeWeights: [.sleepingProgrammed: 3, .tribalPartisan: 1]
                    ),
                    AssessmentOption(
                        text: "A battle between good and evil (and I know which side is which)",
                        archetypeWeights: [.tribalPartisan: 3, .spiritualBypasser: 1]
                    ),
                    AssessmentOption(
                        text: "Suffering that I wish I could help but feel powerless against",
                        archetypeWeights: [.overwhelmedEmpath: 3, .traumaCarrier: 1]
                    ),
                    AssessmentOption(
                        text: "Interconnected systems designed to control populations",
                        archetypeWeights: [.systemsThinking: 2, .activeQuestioner: 2]
                    ),
                    AssessmentOption(
                        text: "A spiritual battle playing out in material form",
                        archetypeWeights: [.advancedSeeker: 2, .spiritualBypasser: 2]
                    )
                ]
            ),
            
            // QUESTION 6: Past Experience
            AssessmentQuestion(
                id: 6,
                question: "Which statement best describes your past?",
                options: [
                    AssessmentOption(
                        text: "Pretty normal, no major complaints",
                        archetypeWeights: [.sleepingProgrammed: 3, .skepticalSeeker: 1]
                    ),
                    AssessmentOption(
                        text: "I've experienced significant trauma or hardship",
                        archetypeWeights: [.traumaCarrier: 3, .overwhelmedEmpath: 1]
                    ),
                    AssessmentOption(
                        text: "I've had experiences that shattered my worldview",
                        archetypeWeights: [.disillusionedAwakening: 3, .activeQuestioner: 1]
                    ),
                    AssessmentOption(
                        text: "I've always been the one who sees what others miss",
                        archetypeWeights: [.systemsThinking: 2, .overwhelmedEmpath: 2]
                    ),
                    AssessmentOption(
                        text: "I've had mystical or unexplainable experiences",
                        archetypeWeights: [.advancedSeeker: 2, .spiritualBypasser: 2]
                    )
                ]
            ),
            
            // QUESTION 7: Current Need
            AssessmentQuestion(
                id: 7,
                question: "What do you most need right now?",
                options: [
                    AssessmentOption(
                        text: "To understand what's really going on in the world",
                        archetypeWeights: [.activeQuestioner: 2, .sleepingProgrammed: 2]
                    ),
                    AssessmentOption(
                        text: "To feel less overwhelmed by everything",
                        archetypeWeights: [.overwhelmedEmpath: 3, .traumaCarrier: 1]
                    ),
                    AssessmentOption(
                        text: "To make sense of my confusing experiences",
                        archetypeWeights: [.disillusionedAwakening: 2, .traumaCarrier: 2]
                    ),
                    AssessmentOption(
                        text: "Evidence-based tools for personal development",
                        archetypeWeights: [.skepticalSeeker: 3, .systemsThinking: 1]
                    ),
                    AssessmentOption(
                        text: "Deeper spiritual teachings beyond surface-level content",
                        archetypeWeights: [.advancedSeeker: 3, .spiritualBypasser: 1]
                    )
                ]
            ),
            
            // QUESTION 8: Response to Manipulation
            AssessmentQuestion(
                id: 8,
                question: "When you learn that you've been manipulated or lied to, you:",
                options: [
                    AssessmentOption(
                        text: "Feel uncomfortable and prefer not to think about it",
                        archetypeWeights: [.sleepingProgrammed: 3, .spiritualBypasser: 1]
                    ),
                    AssessmentOption(
                        text: "Get angry at the other side for spreading lies",
                        archetypeWeights: [.tribalPartisan: 3, .traumaCarrier: 1]
                    ),
                    AssessmentOption(
                        text: "Feel betrayed and need time to process",
                        archetypeWeights: [.disillusionedAwakening: 2, .traumaCarrier: 2]
                    ),
                    AssessmentOption(
                        text: "Want to understand the mechanism of the manipulation",
                        archetypeWeights: [.systemsThinking: 2, .activeQuestioner: 2]
                    ),
                    AssessmentOption(
                        text: "See it as part of my awakening journey",
                        archetypeWeights: [.advancedSeeker: 2, .spiritualBypasser: 2]
                    )
                ]
            ),
            
            // QUESTION 9: Body Awareness
            AssessmentQuestion(
                id: 9,
                question: "How connected do you feel to your body's signals and intuitions?",
                options: [
                    AssessmentOption(
                        text: "I mostly live in my head, body is just transportation",
                        archetypeWeights: [.sleepingProgrammed: 2, .systemsThinking: 2]
                    ),
                    AssessmentOption(
                        text: "My body is constantly sending overwhelming signals",
                        archetypeWeights: [.overwhelmedEmpath: 3, .traumaCarrier: 1]
                    ),
                    AssessmentOption(
                        text: "I notice gut feelings but often override them with logic",
                        archetypeWeights: [.skepticalSeeker: 3, .sleepingProgrammed: 1]
                    ),
                    AssessmentOption(
                        text: "I'm learning to trust my body's wisdom",
                        archetypeWeights: [.activeQuestioner: 2, .advancedSeeker: 2]
                    ),
                    AssessmentOption(
                        text: "My body and intuition guide most of my decisions",
                        archetypeWeights: [.advancedSeeker: 3, .overwhelmedEmpath: 1]
                    )
                ]
            ),
            
            // QUESTION 10: Future Vision
            AssessmentQuestion(
                id: 10,
                question: "What's your vision for your own awakening/growth?",
                options: [
                    AssessmentOption(
                        text: "I just want to be happy and successful",
                        archetypeWeights: [.sleepingProgrammed: 3, .spiritualBypasser: 1]
                    ),
                    AssessmentOption(
                        text: "I want to defeat the forces of evil/ignorance",
                        archetypeWeights: [.tribalPartisan: 3, .activeQuestioner: 1]
                    ),
                    AssessmentOption(
                        text: "I want to heal and help others heal",
                        archetypeWeights: [.overwhelmedEmpath: 2, .traumaCarrier: 2]
                    ),
                    AssessmentOption(
                        text: "I want to understand reality as deeply as possible",
                        archetypeWeights: [.skepticalSeeker: 2, .systemsThinking: 2]
                    ),
                    AssessmentOption(
                        text: "I want to fully awaken and help others do the same",
                        archetypeWeights: [.advancedSeeker: 3, .activeQuestioner: 1]
                    )
                ]
            )
        ]
    }
}


// MARK: - Assessment Course Recommendation

struct AssessmentCourseRecommendation: Identifiable {
    let id = UUID()
    let courseId: String
    let title: String
    let subtitle: String
    let reason: String
    let priority: Int // 1 = start here, 2 = next, 3 = eventually
    let icon: String
    let colorHex: String
    
    var color: Color {
        Color(hex: colorHex)
    }
}

extension ConsciousnessArchetype {
    
    var courseRecommendations: [AssessmentCourseRecommendation] {
        switch self {
        case .sleepingProgrammed:
            return [
                AssessmentCourseRecommendation(
                    courseId: "consciousness-101",
                    title: "Consciousness 101",
                    subtitle: "What You Were Never Taught",
                    reason: "Start with the foundations. This will gently introduce concepts that expand your understanding of what's possible.",
                    priority: 1,
                    icon: "brain.head.profile",
                    colorHex: "#4CAF50"
                ),
                AssessmentCourseRecommendation(
                    courseId: "attention-economy",
                    title: "The Attention Economy",
                    subtitle: "How Your Mind Is Being Harvested",
                    reason: "See how your attention is being captured and monetized. This is the first step to reclaiming your consciousness.",
                    priority: 2,
                    icon: "eye.trianglebadge.exclamationmark",
                    colorHex: "#FF9800"
                ),
                AssessmentCourseRecommendation(
                    courseId: "psyop-detection",
                    title: "Psyop Detection",
                    subtitle: "See the Manipulation in Real-Time",
                    reason: "Once you see the patterns of manipulation, you can never unsee them. This changes everything.",
                    priority: 3,
                    icon: "exclamationmark.triangle.fill",
                    colorHex: "#F44336"
                )
            ]
            
        case .tribalPartisan:
            return [
                AssessmentCourseRecommendation(
                    courseId: "psyop-detection",
                    title: "Psyop Detection",
                    subtitle: "How Both Sides Are Played",
                    reason: "See how divide-and-conquer works on BOTH sides. This isn't about your team being wrong—it's about seeing the game itself.",
                    priority: 1,
                    icon: "exclamationmark.triangle.fill",
                    colorHex: "#F44336"
                ),
                AssessmentCourseRecommendation(
                    courseId: "divide-and-conquer",
                    title: "Divide & Conquer",
                    subtitle: "The Oldest Control Mechanism",
                    reason: "Understand why they NEED you fighting each other. When you see this, tribal identity loses its grip.",
                    priority: 2,
                    icon: "person.2.slash.fill",
                    colorHex: "#9C27B0"
                ),
                AssessmentCourseRecommendation(
                    courseId: "consciousness-101",
                    title: "Consciousness 101",
                    subtitle: "Beyond Left vs Right",
                    reason: "Expand your identity beyond political tribes. There's a bigger you waiting to emerge.",
                    priority: 3,
                    icon: "brain.head.profile",
                    colorHex: "#4CAF50"
                )
            ]
            
        case .overwhelmedEmpath:
            return [
                AssessmentCourseRecommendation(
                    courseId: "ujat-code",
                    title: "The Ujat Code",
                    subtitle: "Ancient Perception Training",
                    reason: "Learn to process the signals you're receiving without drowning. This will change your life.",
                    priority: 1,
                    icon: "eye.circle.fill",
                    colorHex: "#FFD700"
                ),
                AssessmentCourseRecommendation(
                    courseId: "nervous-system-101",
                    title: "Nervous System Mastery",
                    subtitle: "Regulate Your Sensitivity",
                    reason: "Your nervous system is stuck in overdrive. Learn to shift into states where sensitivity becomes strength.",
                    priority: 2,
                    icon: "waveform.path.ecg",
                    colorHex: "#00BCD4"
                ),
                AssessmentCourseRecommendation(
                    courseId: "sophia-awakening",
                    title: "Pistis Sophia",
                    subtitle: "The Divine Feminine Path",
                    reason: "Your empathic nature is connected to Sophia's consciousness. This path honors your sensitivity as sacred.",
                    priority: 3,
                    icon: "heart.circle.fill",
                    colorHex: "#E040FB"
                )
            ]
            
        case .skepticalSeeker:
            return [
                AssessmentCourseRecommendation(
                    courseId: "eleventh-dimension",
                    title: "The 11th Dimension",
                    subtitle: "Physics-Based Consciousness",
                    reason: "Explore consciousness through the lens of M-theory and neuroscience. Evidence-based expansion.",
                    priority: 1,
                    icon: "cube.transparent.fill",
                    colorHex: "#7C4DFF"
                ),
                AssessmentCourseRecommendation(
                    courseId: "ujat-code",
                    title: "The Ujat Code",
                    subtitle: "Neuroscience-Backed Perception",
                    reason: "Learn perception enhancement through verifiable neuroscience. Test it yourself.",
                    priority: 2,
                    icon: "eye.circle.fill",
                    colorHex: "#FFD700"
                ),
                AssessmentCourseRecommendation(
                    courseId: "psyop-detection",
                    title: "Psyop Detection",
                    subtitle: "Evidence-Based Analysis",
                    reason: "Apply your critical thinking to decode manipulation patterns. This satisfies the skeptic while opening new doors.",
                    priority: 3,
                    icon: "exclamationmark.triangle.fill",
                    colorHex: "#F44336"
                )
            ]
            
        case .disillusionedAwakening:
            return [
                AssessmentCourseRecommendation(
                    courseId: "dark-night-navigation",
                    title: "Dark Night Navigation",
                    subtitle: "Guide Through Disillusionment",
                    reason: "You're in the dark night of the soul. This is normal. Let me help you navigate without losing yourself.",
                    priority: 1,
                    icon: "moon.stars.fill",
                    colorHex: "#3F51B5"
                ),
                AssessmentCourseRecommendation(
                    courseId: "consciousness-101",
                    title: "Consciousness 101",
                    subtitle: "A New Framework",
                    reason: "The old operating system is crashing. Here's the new one. It actually makes sense.",
                    priority: 2,
                    icon: "brain.head.profile",
                    colorHex: "#4CAF50"
                ),
                AssessmentCourseRecommendation(
                    courseId: "demiurge-decoded",
                    title: "Demiurge Decoded",
                    subtitle: "Why the World Seems Broken",
                    reason: "Understanding WHY things are the way they are brings peace, even when the truth is dark.",
                    priority: 3,
                    icon: "eye.trianglebadge.exclamationmark",
                    colorHex: "#FF5722"
                )
            ]
            
        case .activeQuestioner:
            return [
                AssessmentCourseRecommendation(
                    courseId: "psyop-detection",
                    title: "Psyop Detection",
                    subtitle: "Systematic Analysis Framework",
                    reason: "Turn your research into a systematic framework. Knowledge becomes wisdom when it's organized.",
                    priority: 1,
                    icon: "exclamationmark.triangle.fill",
                    colorHex: "#F44336"
                ),
                AssessmentCourseRecommendation(
                    courseId: "demiurge-decoded",
                    title: "Demiurge Decoded",
                    subtitle: "The Deep Framework",
                    reason: "You've seen the rabbit holes. Now see the architecture they're all part of.",
                    priority: 2,
                    icon: "eye.trianglebadge.exclamationmark",
                    colorHex: "#FF5722"
                ),
                AssessmentCourseRecommendation(
                    courseId: "sophia-awakening",
                    title: "Pistis Sophia",
                    subtitle: "Integration Path",
                    reason: "Knowledge without integration is just noise. This path turns understanding into embodiment.",
                    priority: 3,
                    icon: "heart.circle.fill",
                    colorHex: "#E040FB"
                )
            ]
            
        case .spiritualBypasser:
            return [
                AssessmentCourseRecommendation(
                    courseId: "shadow-integration",
                    title: "Shadow Integration",
                    subtitle: "Embracing the Darkness",
                    reason: "True light isn't the absence of darkness—it's the integration of it. Time to face what you've been avoiding.",
                    priority: 1,
                    icon: "circle.lefthalf.filled",
                    colorHex: "#424242"
                ),
                AssessmentCourseRecommendation(
                    courseId: "demiurge-decoded",
                    title: "Demiurge Decoded",
                    subtitle: "Spiritual AND Systemic",
                    reason: "See how spiritual truth connects to material reality. No more bypassing the world's problems.",
                    priority: 2,
                    icon: "eye.trianglebadge.exclamationmark",
                    colorHex: "#FF5722"
                ),
                AssessmentCourseRecommendation(
                    courseId: "psyop-detection",
                    title: "Psyop Detection",
                    subtitle: "Grounded Spirituality",
                    reason: "Spirituality without discernment is dangerous. Learn to stay awake in BOTH worlds.",
                    priority: 3,
                    icon: "exclamationmark.triangle.fill",
                    colorHex: "#F44336"
                )
            ]
            
        case .traumaCarrier:
            return [
                AssessmentCourseRecommendation(
                    courseId: "nervous-system-101",
                    title: "Nervous System Mastery",
                    subtitle: "Safety First",
                    reason: "Before we go deeper, your nervous system needs to know it's safe. This is the foundation for everything else.",
                    priority: 1,
                    icon: "waveform.path.ecg",
                    colorHex: "#00BCD4"
                ),
                AssessmentCourseRecommendation(
                    courseId: "ujat-code",
                    title: "The Ujat Code",
                    subtitle: "Body Awareness Training",
                    reason: "Reconnect with your body in a safe, gradual way. Your body holds wisdom, not just wounds.",
                    priority: 2,
                    icon: "eye.circle.fill",
                    colorHex: "#FFD700"
                ),
                AssessmentCourseRecommendation(
                    courseId: "sophia-awakening",
                    title: "Pistis Sophia",
                    subtitle: "The Healing Path",
                    reason: "Sophia's story IS a trauma story—and a healing story. Your wounds become your wisdom here.",
                    priority: 3,
                    icon: "heart.circle.fill",
                    colorHex: "#E040FB"
                )
            ]
            
        case .systemsThinking:
            return [
                AssessmentCourseRecommendation(
                    courseId: "psyop-detection",
                    title: "Psyop Detection",
                    subtitle: "Systems Analysis Framework",
                    reason: "Your pattern-recognition abilities are perfect for decoding control systems. Here's the framework.",
                    priority: 1,
                    icon: "exclamationmark.triangle.fill",
                    colorHex: "#F44336"
                ),
                AssessmentCourseRecommendation(
                    courseId: "demiurge-decoded",
                    title: "Demiurge Decoded",
                    subtitle: "The Ultimate System",
                    reason: "See the meta-system that all other control systems serve. This is engineering at the cosmic level.",
                    priority: 2,
                    icon: "eye.trianglebadge.exclamationmark",
                    colorHex: "#FF5722"
                ),
                AssessmentCourseRecommendation(
                    courseId: "eleventh-dimension",
                    title: "The 11th Dimension",
                    subtitle: "Consciousness as System",
                    reason: "Understand consciousness itself as an information system operating across dimensions.",
                    priority: 3,
                    icon: "cube.transparent.fill",
                    colorHex: "#7C4DFF"
                )
            ]
            
        case .advancedSeeker:
            return [
                AssessmentCourseRecommendation(
                    courseId: "sophia-awakening",
                    title: "Pistis Sophia",
                    subtitle: "Deep Gnostic Path",
                    reason: "You're ready for the hidden teachings. This is the path for those who've done the preliminary work.",
                    priority: 1,
                    icon: "heart.circle.fill",
                    colorHex: "#E040FB"
                ),
                AssessmentCourseRecommendation(
                    courseId: "demiurge-decoded",
                    title: "Demiurge Decoded",
                    subtitle: "Advanced Framework",
                    reason: "The complete picture of how and why this reality operates the way it does.",
                    priority: 2,
                    icon: "eye.trianglebadge.exclamationmark",
                    colorHex: "#FF5722"
                ),
                AssessmentCourseRecommendation(
                    courseId: "eleventh-dimension",
                    title: "The 11th Dimension",
                    subtitle: "Multi-Dimensional Being",
                    reason: "Explore the physics of your multi-dimensional existence. Science meets mysticism.",
                    priority: 3,
                    icon: "cube.transparent.fill",
                    colorHex: "#7C4DFF"
                )
            ]
        }
    }
}


// MARK: - Archetype Compatibility

extension ConsciousnessArchetype {
    
    /// Other archetypes this one might resonate with
    var relatedArchetypes: [ConsciousnessArchetype] {
        switch self {
        case .sleepingProgrammed:
            return [.skepticalSeeker]
        case .tribalPartisan:
            return [.sleepingProgrammed]
        case .overwhelmedEmpath:
            return [.traumaCarrier, .spiritualBypasser]
        case .skepticalSeeker:
            return [.systemsThinking, .activeQuestioner]
        case .disillusionedAwakening:
            return [.traumaCarrier, .activeQuestioner]
        case .activeQuestioner:
            return [.systemsThinking, .skepticalSeeker]
        case .spiritualBypasser:
            return [.overwhelmedEmpath, .advancedSeeker]
        case .traumaCarrier:
            return [.overwhelmedEmpath, .disillusionedAwakening]
        case .systemsThinking:
            return [.skepticalSeeker, .activeQuestioner]
        case .advancedSeeker:
            return [.activeQuestioner, .systemsThinking]
        }
    }
}
