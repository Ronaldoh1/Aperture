// ConsciousnessAwakeningCourse.swift
// The Ultimate Guide to Expanding Awareness
// 4 Levels: Basics → Intermediate → Advanced → Ascension
// "Augmenting Human Potential - Turn chaos into clarity"

import SwiftUI

// MARK: - Course Models

struct CourseAwakeningLevel: Identifiable {
    let id = UUID()
    let level: Int
    let title: String
    let subtitle: String
    let description: String
    let duration: String
    let color: Color
    let icon: String
    let modules: [AwakeTogetherModule]
    let unlockCriteria: String
    let isLocked: Bool
}

struct AwakeTogetherModule: Identifiable {
    let id = UUID()
    let title: String
    let description: String
    let content: [ModuleContent]
    let practices: [Practice]
    let quiz: Quiz?
    let duration: String
    let isCompleted: Bool
}

struct ModuleContent: Identifiable {
    let id = UUID()
    let type: CourseContentType
    let title: String
    let description: String
    let url: String?
    let source: String?
}

enum CourseContentType: String {
    case video = "Video"
    case reading = "Reading"
    case meditation = "Meditation"
    case exercise = "Exercise"
    case reflection = "Reflection"
    
    var icon: String {
        switch self {
        case .video: return "play.rectangle.fill"
        case .reading: return "book.fill"
        case .meditation: return "figure.mind.and.body"
        case .exercise: return "hand.raised.fill"
        case .reflection: return "bubble.left.and.bubble.right.fill"
        }
    }
}

struct Practice: Identifiable {
    let id = UUID()
    let title: String
    let duration: String
    let instructions: [String]
    let benefit: String
}

struct Quiz: Identifiable {
    let id = UUID()
    let title: String
    let questions: [QuizQuestion]
}

struct QuizQuestion: Identifiable {
    let id = UUID()
    let question: String
    let options: [String]
    let correctIndex: Int
    let explanation: String
}

// MARK: - Course Data

struct ConsciousnessCourseCurriculum {
    
    static let allLevels: [CourseAwakeningLevel] = [
        level1Basics,
        level2Intermediate,
        level3Advanced,
        level4Ascension
    ]
    
    // MARK: - Level 1: Basics
    
    static let level1Basics = CourseAwakeningLevel(
        level: 1,
        title: "AWAKENING THE SELF",
        subtitle: "What Is Consciousness?",
        description: "Start with raw experience vs. non-conscious processing. Understand the symptoms of awakening, the Dark Night of the Soul, and establish foundational mindfulness practices.",
        duration: "2-3 weeks",
        color: .green,
        icon: "leaf.fill",
        modules: [
            AwakeTogetherModule(
                title: "What Is Consciousness?",
                description: "Define consciousness as subjective experience (Nagel/Seth). Understand the difference between being conscious and autopilot.",
                content: [
                    ModuleContent(type: .video, title: "Your Brain Hallucinates Reality", description: "Anil Seth's groundbreaking TED Talk on how perception works", url: "https://ted.com/anil_seth", source: "TED - 17M views"),
                    ModuleContent(type: .video, title: "How Do You Explain Consciousness?", description: "David Chalmers on the 'hard problem'", url: "https://ted.com/david_chalmers", source: "TED - 8M views"),
                    ModuleContent(type: .reading, title: "The Map of Consciousness", description: "David Hawkins' scale from Shame (20) to Enlightenment (700)", url: nil, source: "Book: Power vs. Force"),
                    ModuleContent(type: .reflection, title: "Am I Conscious Right Now?", description: "Notice: What's it like to BE you at this moment?", url: nil, source: nil)
                ],
                practices: [
                    Practice(title: "5-Minute Breath Awareness", duration: "5 min daily", instructions: ["Sit comfortably", "Close your eyes", "Notice your breath without changing it", "When mind wanders, gently return to breath", "Notice: who is noticing?"], benefit: "Establishes observer awareness separate from thoughts"),
                    Practice(title: "Autopilot vs. Conscious Audit", duration: "Throughout day", instructions: ["Set 3 random alarms", "When alarm sounds, ask: 'Was I on autopilot or conscious?'", "Note what you were doing", "No judgment, just observation"], benefit: "Reveals how much time is spent unconscious")
                ],
                quiz: Quiz(title: "Consciousness Basics", questions: [
                    QuizQuestion(question: "According to Anil Seth, our perception of reality is:", options: ["A direct camera feed of the world", "A controlled hallucination created by the brain", "An illusion that doesn't exist", "Perfect and objective"], correctIndex: 1, explanation: "Seth argues our brains constantly predict reality, and we perceive our predictions, not raw reality."),
                    QuizQuestion(question: "The 'hard problem' of consciousness refers to:", options: ["Why consciousness evolved", "How neurons fire", "Why subjective experience exists at all", "Memory formation"], correctIndex: 2, explanation: "David Chalmers coined this term for the mystery of WHY there's something it's like to be conscious.")
                ]),
                duration: "4-5 hours",
                isCompleted: false
            ),
            
            AwakeTogetherModule(
                title: "Symptoms of Awakening",
                description: "Recognize the signs that consciousness is expanding: the Dark Night of the Soul, increased synchronicities, and the ray of hope.",
                content: [
                    ModuleContent(type: .reading, title: "The Dark Night of the Soul", description: "Understanding the challenging phase of awakening", url: nil, source: "LonerWolf Blog"),
                    ModuleContent(type: .video, title: "Aaron Doughty: Signs You're Awakening", description: "Practical guide to awakening symptoms", url: "https://youtube.com/aaron_doughty", source: "YouTube - 1.3M subs"),
                    ModuleContent(type: .reading, title: "10 Symptoms of Spiritual Awakening", description: "Recognizing the shifts in perception and values", url: nil, source: "Actualized.org"),
                    ModuleContent(type: .meditation, title: "Welcoming the Process", description: "A guided meditation for accepting the awakening journey", url: nil, source: nil)
                ],
                practices: [
                    Practice(title: "Symptom Journal", duration: "5 min daily", instructions: ["Note any unusual experiences", "Track synchronicities", "Record dream content", "Notice changes in relationships/interests"], benefit: "Creates map of your unique awakening pattern"),
                    Practice(title: "Dark Night Grounding", duration: "As needed", instructions: ["When overwhelmed, ground through body", "5-4-3-2-1 senses exercise", "Remind: 'This too shall pass'", "Connect with nature or trusted person"], benefit: "Navigates challenging awakening phases safely")
                ],
                quiz: nil,
                duration: "3-4 hours",
                isCompleted: false
            ),
            
            AwakeTogetherModule(
                title: "Establishing Mindfulness",
                description: "Build the foundation of present-moment awareness that all higher practices depend on.",
                content: [
                    ModuleContent(type: .video, title: "Eckhart Tolle: The Power of Now", description: "The seminal teaching on presence", url: "https://youtube.com/eckhart_tolle", source: "YouTube - 2.5M subs"),
                    ModuleContent(type: .video, title: "Thich Nhat Hanh: Mindful Breathing", description: "Simple yet profound practice", url: nil, source: "Plum Village"),
                    ModuleContent(type: .reading, title: "Understanding Our Mind", description: "Buddhist psychology made accessible", url: nil, source: "Book: Thich Nhat Hanh"),
                    ModuleContent(type: .exercise, title: "Mindful Eating Practice", description: "Transform a meal into meditation", url: nil, source: nil)
                ],
                practices: [
                    Practice(title: "10-Minute Sitting Practice", duration: "10 min daily", instructions: ["Choose consistent time", "Sit with straight spine", "Focus on breath or body sensations", "Label thoughts: 'thinking'", "Return to anchor repeatedly"], benefit: "Builds concentration and observer awareness"),
                    Practice(title: "Mindful Transitions", duration: "Throughout day", instructions: ["Between activities, pause 3 breaths", "Notice body, thoughts, emotions", "Set intention for next activity", "Proceed consciously"], benefit: "Bridges formal practice into daily life")
                ],
                quiz: nil,
                duration: "4-5 hours",
                isCompleted: false
            )
        ],
        unlockCriteria: "Available immediately",
        isLocked: false
    )
    
    // MARK: - Level 2: Intermediate
    
    static let level2Intermediate = CourseAwakeningLevel(
        level: 2,
        title: "EXPANDING PERCEPTION",
        subtitle: "Neuroscience Meets Spirituality",
        description: "Explore the 4 levels of consciousness (Victim to Creator), understand brainwave states, and begin expanding beyond ego through shadow work and journaling.",
        duration: "3-4 weeks",
        color: .blue,
        icon: "brain.head.profile",
        modules: [
            AwakeTogetherModule(
                title: "The Four Levels of Consciousness",
                description: "From Victim → Dependent → Independent → Creator. Understand where you are and how to evolve.",
                content: [
                    ModuleContent(type: .video, title: "Actualized.org: Levels of Consciousness", description: "Deep dive into consciousness evolution", url: "https://actualized.org", source: "YouTube - 1.6M subs"),
                    ModuleContent(type: .reading, title: "Spiral Dynamics Overview", description: "The stages of human development", url: nil, source: "Don Beck/Clare Graves"),
                    ModuleContent(type: .video, title: "Ken Wilber: Integral Theory", description: "Comprehensive map of consciousness", url: nil, source: "Integral Life"),
                    ModuleContent(type: .exercise, title: "Self-Assessment: Where Am I?", description: "Honest evaluation of current level", url: nil, source: nil)
                ],
                practices: [
                    Practice(title: "Victim to Creator Journal", duration: "10 min daily", instructions: ["Note any victim thoughts/language", "Reframe: 'What did I create here?'", "Find the gift in difficulties", "Practice radical responsibility"], benefit: "Shifts from external blame to internal power"),
                    Practice(title: "Watching Triggers", duration: "Throughout day", instructions: ["Notice when triggered", "Don't react, observe", "Ask: 'What wound is this touching?'", "Breathe through the charge"], benefit: "Identifies unconscious patterns for healing")
                ],
                quiz: Quiz(title: "Levels Assessment", questions: [
                    QuizQuestion(question: "The shift from Victim to Creator primarily involves:", options: ["Positive thinking", "Taking radical responsibility", "Ignoring problems", "Blaming others less"], correctIndex: 1, explanation: "Creator consciousness means seeing yourself as the author of your experience.")
                ]),
                duration: "5-6 hours",
                isCompleted: false
            ),
            
            AwakeTogetherModule(
                title: "Brainwave States & Meditation",
                description: "Understand alpha, theta, and gamma states. Learn to access expanded consciousness through meditation.",
                content: [
                    ModuleContent(type: .video, title: "Dr. Joe Dispenza: Changing Brainwaves", description: "The neuroscience of meditation", url: "https://youtube.com/drjoedispenza", source: "YouTube - 1M subs"),
                    ModuleContent(type: .reading, title: "The Science of Meditation", description: "What happens in the brain during meditation", url: nil, source: "Scientific American"),
                    ModuleContent(type: .meditation, title: "Alpha State Induction", description: "Guided practice to enter relaxed awareness", url: nil, source: nil),
                    ModuleContent(type: .meditation, title: "Theta Journey", description: "Deep meditation for expanded states", url: nil, source: nil)
                ],
                practices: [
                    Practice(title: "20-Minute Alpha Practice", duration: "20 min daily", instructions: ["Sit comfortably, eyes closed", "Focus on third eye area", "Imagine descending staircase", "Allow thoughts to float by", "Rest in spacious awareness"], benefit: "Accesses intuitive, creative consciousness"),
                    Practice(title: "Binaural Beats Session", duration: "30 min, 2x/week", instructions: ["Use headphones", "Choose alpha (8-12Hz) or theta (4-8Hz) track", "Lie down, relax completely", "Let sounds guide brainwaves", "Journal insights after"], benefit: "Trains brain to enter desired states")
                ],
                quiz: nil,
                duration: "5-6 hours",
                isCompleted: false
            ),
            
            AwakeTogetherModule(
                title: "Shadow Work Foundations",
                description: "Meet and integrate the parts of yourself you've hidden. The shadow holds the keys to wholeness.",
                content: [
                    ModuleContent(type: .video, title: "Teal Swan: Shadow Work", description: "Comprehensive guide to shadow integration", url: "https://youtube.com/teal_swan", source: "YouTube - 1.3M subs"),
                    ModuleContent(type: .reading, title: "Meeting the Shadow", description: "Carl Jung's concept made practical", url: nil, source: "Robert Bly"),
                    ModuleContent(type: .video, title: "What You Resist Persists", description: "Why shadow integration is essential", url: nil, source: "Actualized.org"),
                    ModuleContent(type: .exercise, title: "Shadow Inventory", description: "Identify your rejected parts", url: nil, source: nil)
                ],
                practices: [
                    Practice(title: "Mirror Work", duration: "5 min daily", instructions: ["Look in mirror, into your eyes", "Say: 'I see you. I accept you.'", "Notice what arises", "Breathe through discomfort", "End with self-compassion"], benefit: "Begins integration of rejected self-parts"),
                    Practice(title: "Trigger Mining", duration: "When triggered", instructions: ["Notice strong reaction to someone", "Ask: 'What do I dislike in them?'", "Find that trait in yourself", "Accept and integrate it", "Thank them as teacher"], benefit: "Transforms projections into self-knowledge")
                ],
                quiz: nil,
                duration: "5-6 hours",
                isCompleted: false
            )
        ],
        unlockCriteria: "Complete Level 1 with 70% quiz score",
        isLocked: true
    )
    
    // MARK: - Level 3: Advanced
    
    static let level3Advanced = CourseAwakeningLevel(
        level: 3,
        title: "HIGHER STATES & INTUITION",
        subtitle: "Timeline Intuition & Collective Fields",
        description: "Dive into clairvoyance, timeline intuition, and collective consciousness. Access the 9 intuitive levels and practice group meditation.",
        duration: "4-6 weeks",
        color: .purple,
        icon: "sparkles",
        modules: [
            AwakeTogetherModule(
                title: "Developing Intuition",
                description: "Access the 9 levels of intuitive knowing. Learn to trust your inner guidance system.",
                content: [
                    ModuleContent(type: .video, title: "Shunyamurti: Expanding Consciousness", description: "Advanced teachings on higher awareness", url: "https://youtube.com/shunyamurti", source: "Sat Yoga Institute"),
                    ModuleContent(type: .reading, title: "The 9 Intuitive Levels", description: "From gut feeling to unity awareness", url: nil, source: "Sylvia Salow"),
                    ModuleContent(type: .video, title: "How to Develop Psychic Abilities", description: "Practical intuition development", url: nil, source: "Actualized.org"),
                    ModuleContent(type: .exercise, title: "Intuition Calibration", description: "Learn to distinguish intuition from fear/desire", url: nil, source: nil)
                ],
                practices: [
                    Practice(title: "Morning Intuition Practice", duration: "10 min daily", instructions: ["Upon waking, don't move", "Ask: 'What does today hold?'", "Note first impressions", "Don't analyze, just receive", "Track accuracy over time"], benefit: "Strengthens intuitive reception"),
                    Practice(title: "Choice Point Intuition", duration: "At decisions", instructions: ["Pause before choosing", "Quiet the mind", "Feel each option in your body", "Notice expansion vs. contraction", "Trust the expansion"], benefit: "Applies intuition practically")
                ],
                quiz: nil,
                duration: "6-8 hours",
                isCompleted: false
            ),
            
            AwakeTogetherModule(
                title: "Timeline Intuition & Manifestation",
                description: "Learn to sense probable futures and consciously select desired timelines through focused intention.",
                content: [
                    ModuleContent(type: .reading, title: "Reality Transurfing", description: "Vadim Zeland's system for timeline navigation", url: nil, source: "Book: Reality Transurfing"),
                    ModuleContent(type: .video, title: "Neville Goddard: Feeling Is The Secret", description: "Classic manifestation teachings", url: nil, source: "YouTube Archives"),
                    ModuleContent(type: .meditation, title: "Timeline Visualization", description: "Guided practice for sensing futures", url: nil, source: nil),
                    ModuleContent(type: .exercise, title: "Future Memory Creation", description: "Programming desired outcomes", url: nil, source: nil)
                ],
                practices: [
                    Practice(title: "Timeline Meditation", duration: "15 min, 3x/week", instructions: ["Enter deep relaxation", "Visualize timeline as river", "See branching possibilities", "Feel which branch is highest", "Step into it emotionally"], benefit: "Develops timeline sensing ability"),
                    Practice(title: "Scene Imprint", duration: "Before sleep", instructions: ["Choose desired outcome", "Construct vivid scene implying fulfillment", "Loop scene 3x with feeling", "Fall asleep in satisfied state", "Release to subconscious"], benefit: "Programs subconscious for manifestation")
                ],
                quiz: nil,
                duration: "6-8 hours",
                isCompleted: false
            ),
            
            AwakeTogetherModule(
                title: "Collective Consciousness & Group Fields",
                description: "Understand how individual consciousness connects to collective fields. Experience group meditation amplification.",
                content: [
                    ModuleContent(type: .video, title: "Rupert Sheldrake: Morphic Fields", description: "Scientific approach to collective consciousness", url: nil, source: "TED/YouTube"),
                    ModuleContent(type: .reading, title: "The Global Consciousness Project", description: "Scientific research on collective awareness", url: "https://noosphere.princeton.edu", source: "Princeton"),
                    ModuleContent(type: .meditation, title: "Heart Coherence Group Practice", description: "HeartMath-inspired group meditation", url: nil, source: "HeartMath Institute"),
                    ModuleContent(type: .reflection, title: "Your Role in Collective Awakening", description: "How your evolution affects the whole", url: nil, source: nil)
                ],
                practices: [
                    Practice(title: "World Meditation", duration: "10 min daily", instructions: ["Visualize Earth from space", "Feel love for all beings", "Send healing light globally", "Connect to awakening community", "Know your light matters"], benefit: "Contributes to collective field elevation"),
                    Practice(title: "Group Meditation Session", duration: "Weekly if possible", instructions: ["Join online or in-person group", "Synchronize breath with others", "Feel the amplified field", "Notice enhanced depth", "Carry the vibration forward"], benefit: "Experiences power of collective practice")
                ],
                quiz: nil,
                duration: "6-8 hours",
                isCompleted: false
            )
        ],
        unlockCriteria: "Complete Level 2 with 80% quiz score",
        isLocked: true
    )
    
    // MARK: - Level 4: Ascension
    
    static let level4Ascension = CourseAwakeningLevel(
        level: 4,
        title: "UNITY & BEYOND",
        subtitle: "Transcend Duality, Embody Oneness",
        description: "Achieve 5D vibrations through service to others. Transcend duality, access absorption states (samadhi), and create your personal ascension plan.",
        duration: "Ongoing",
        color: .yellow,
        icon: "sun.max.fill",
        modules: [
            AwakeTogetherModule(
                title: "Non-Dual Awareness",
                description: "Experience the dissolution of subject-object duality. Recognize awareness as your true nature.",
                content: [
                    ModuleContent(type: .video, title: "Rupert Spira: The Nature of Awareness", description: "Direct pointing to non-dual truth", url: "https://youtube.com/rupert_spira", source: "YouTube - 500K subs"),
                    ModuleContent(type: .video, title: "Mooji: Who Am I?", description: "Self-inquiry for liberation", url: "https://youtube.com/mooji", source: "YouTube - 1M+ subs"),
                    ModuleContent(type: .reading, title: "I Am That", description: "Nisargadatta Maharaj's teachings", url: nil, source: "Book Classic"),
                    ModuleContent(type: .meditation, title: "Self-Inquiry Practice", description: "Ramana Maharshi's 'Who Am I?' method", url: nil, source: nil)
                ],
                practices: [
                    Practice(title: "Who Am I? Inquiry", duration: "20 min daily", instructions: ["Ask: 'Who am I?'", "Reject every answer that arises", "'I am not this body, not these thoughts'", "Rest in the questioner", "Abide as awareness itself"], benefit: "Direct path to non-dual recognition"),
                    Practice(title: "Awareness of Awareness", duration: "Throughout day", instructions: ["Notice you are aware", "Turn attention to awareness itself", "Rest as the knowing", "Let objects come and go", "Remain as the space"], benefit: "Stabilizes non-dual awareness")
                ],
                quiz: nil,
                duration: "8-10 hours",
                isCompleted: false
            ),
            
            AwakeTogetherModule(
                title: "Samadhi & Absorption States",
                description: "Access deep meditative absorption where individual consciousness merges with universal consciousness.",
                content: [
                    ModuleContent(type: .video, title: "Sadhguru: What Is Samadhi?", description: "Yogic perspective on absorption", url: "https://youtube.com/sadhguru", source: "YouTube - 13M subs"),
                    ModuleContent(type: .reading, title: "The Yoga Sutras of Patanjali", description: "Classic text on samadhi states", url: nil, source: "Ancient Text"),
                    ModuleContent(type: .meditation, title: "Jhana Practice Introduction", description: "Buddhist absorption meditation", url: nil, source: "Theravada Tradition"),
                    ModuleContent(type: .reading, title: "Transcendent States: A Scientific Study", description: "Research on samadhi and mystical experiences", url: nil, source: "Journal of Consciousness Studies")
                ],
                practices: [
                    Practice(title: "Extended Sitting", duration: "45-60 min", instructions: ["Commit to full duration", "Use concentration object (breath, mantra)", "When absorbed, release object", "Allow merging with awareness", "Don't grasp pleasant states"], benefit: "Cultivates access to jhana/samadhi"),
                    Practice(title: "Surrender Practice", duration: "30 min, weekly", instructions: ["Lie down completely relaxed", "Systematically release control", "Allow body to feel heavy", "Let go of personal will", "Merge with larger field"], benefit: "Practices ego dissolution safely")
                ],
                quiz: nil,
                duration: "10+ hours",
                isCompleted: false
            ),
            
            AwakeTogetherModule(
                title: "Service & Embodiment",
                description: "True ascension manifests as service to others. Integrate awakening into practical life and help the collective evolve.",
                content: [
                    ModuleContent(type: .video, title: "Ram Dass: The Path of Service", description: "Karma Yoga for the modern world", url: nil, source: "Be Here Now Network"),
                    ModuleContent(type: .reading, title: "Bodhisattva Ideal", description: "Awakening for the benefit of all beings", url: nil, source: "Mahayana Buddhism"),
                    ModuleContent(type: .exercise, title: "Finding Your Dharma", description: "Discover your unique service offering", url: nil, source: nil),
                    ModuleContent(type: .reflection, title: "Creating Your Ascension Plan", description: "Personal roadmap for ongoing evolution", url: nil, source: nil)
                ],
                practices: [
                    Practice(title: "Tonglen Practice", duration: "15 min daily", instructions: ["Breathe in suffering of others", "Transform it in your heart", "Breathe out love and healing", "Include all beings", "Include yourself"], benefit: "Cultivates compassion and service orientation"),
                    Practice(title: "Daily Dharma Integration", duration: "Continuous", instructions: ["Each action as offering", "See divine in everyone", "Serve without attachment", "Remember: you are them", "Let service be natural expression"], benefit: "Makes awakening lived reality")
                ],
                quiz: nil,
                duration: "Ongoing",
                isCompleted: false
            )
        ],
        unlockCriteria: "Complete Level 3 with demonstrated practice",
        isLocked: true
    )
}

// MARK: - Course Hub View

struct ConsciousnessAwakeningCourseView: View {
    @State private var selectedLevel: CourseAwakeningLevel?
    @State private var userProgress: [Int: Float] = [1: 0.3, 2: 0, 3: 0, 4: 0]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                // Header
                headerSection
                
                // Progress Overview
                progressSection
                
                // Levels
                levelsSection
                
                // Resources
                resourcesSection
            }
            .padding()
        }
        .background(Color.black.ignoresSafeArea())
        .navigationTitle("Consciousness Course")
        .navigationBarTitleDisplayMode(.inline)
        .sheet(item: $selectedLevel) { level in
            LevelDetailView(level: level, progress: userProgress[level.level] ?? 0)
        }
    }
    
    // MARK: - Header
    
    private var headerSection: some View {
        VStack(spacing: 12) {
            ZStack {
                Circle()
                    .fill(
                        LinearGradient(
                            colors: [.purple, .blue, .cyan, .green],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(width: 100, height: 100)
                
                Image(systemName: "brain.head.profile")
                    .font(.system(size: 40))
                    .foregroundColor(.white)
            }
            
            Text("CONSCIOUSNESS AWAKENING")
                .font(.system(size: 22, weight: .black))
                .foregroundColor(.white)
            
            Text("The Ultimate Guide to Expanding Awareness")
                .font(.system(size: 13))
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
            
            HStack(spacing: 16) {
                tagPill("4 Levels", .green)
                tagPill("Self-Paced", .blue)
                tagPill("8-12 Weeks", .purple)
            }
        }
    }
    
    private func tagPill(_ text: String, _ color: Color) -> some View {
        Text(text)
            .font(.system(size: 10, weight: .semibold))
            .foregroundColor(.white)
            .padding(.horizontal, 10)
            .padding(.vertical, 5)
            .background(color.opacity(0.3))
            .cornerRadius(12)
    }
    
    // MARK: - Progress Section
    
    private var progressSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("YOUR JOURNEY")
                .font(.system(size: 10, weight: .bold))
                .foregroundColor(.gray)
            
            HStack(spacing: 0) {
                ForEach(1...4, id: \.self) { level in
                    ZStack {
                        Circle()
                            .fill(level == 1 ? Color.green : Color.white.opacity(0.2))
                            .frame(width: 40, height: 40)
                        
                        Text("\(level)")
                            .font(.system(size: 16, weight: .bold))
                            .foregroundColor(level == 1 ? .white : .gray)
                    }
                    
                    if level < 4 {
                        Rectangle()
                            .fill(level == 1 ? Color.green.opacity(0.5) : Color.white.opacity(0.1))
                            .frame(height: 3)
                    }
                }
            }
            .padding(.horizontal)
        }
        .padding()
        .background(Color.white.opacity(0.05))
        .cornerRadius(16)
    }
    
    // MARK: - Levels Section
    
    private var levelsSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("COURSE LEVELS")
                .font(.system(size: 10, weight: .bold))
                .foregroundColor(.gray)
            
            ForEach(ConsciousnessCourseCurriculum.allLevels) { level in
                levelCard(level)
            }
        }
    }
    
    private func levelCard(_ level: CourseAwakeningLevel) -> some View {
        Button(action: { 
            if !level.isLocked || level.level == 1 {
                selectedLevel = level
            }
        }) {
            HStack(spacing: 14) {
                ZStack {
                    Circle()
                        .fill(level.isLocked && level.level != 1 ? Color.gray.opacity(0.3) : level.color.opacity(0.3))
                        .frame(width: 60, height: 60)
                    
                    if level.isLocked && level.level != 1 {
                        Image(systemName: "lock.fill")
                            .foregroundColor(.gray)
                    } else {
                        Image(systemName: level.icon)
                            .font(.system(size: 24))
                            .foregroundColor(level.color)
                    }
                }
                
                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        Text("LEVEL \(level.level)")
                            .font(.system(size: 10, weight: .bold))
                            .foregroundColor(level.color)
                        
                        Spacer()
                        
                        Text(level.duration)
                            .font(.system(size: 10))
                            .foregroundColor(.gray)
                    }
                    
                    Text(level.title)
                        .font(.system(size: 14, weight: .bold))
                        .foregroundColor(.white)
                    
                    Text(level.subtitle)
                        .font(.system(size: 11))
                        .foregroundColor(.gray)
                    
                    // Progress bar
                    GeometryReader { geo in
                        ZStack(alignment: .leading) {
                            Capsule()
                                .fill(Color.white.opacity(0.1))
                                .frame(height: 4)
                            
                            Capsule()
                                .fill(level.color)
                                .frame(width: geo.size.width * CGFloat(userProgress[level.level] ?? 0), height: 4)
                        }
                    }
                    .frame(height: 4)
                }
                
                Image(systemName: "chevron.right")
                    .foregroundColor(.gray)
            }
            .padding()
            .background(Color.white.opacity(0.05))
            .cornerRadius(16)
            .opacity(level.isLocked && level.level != 1 ? 0.5 : 1)
        }
    }
    
    // MARK: - Resources
    
    private var resourcesSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("FEATURED RESOURCES")
                .font(.system(size: 10, weight: .bold))
                .foregroundColor(.gray)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    resourceCard("Anil Seth", "TED Talk", "16M+ views", .red)
                    resourceCard("Eckhart Tolle", "YouTube", "2.5M subs", .red)
                    resourceCard("Map of Consciousness", "Book", "Bestseller", .orange)
                    resourceCard("Sadhguru", "YouTube", "13M subs", .blue)
                }
            }
        }
    }
    
    private func resourceCard(_ title: String, _ type: String, _ stats: String, _ color: Color) -> some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(type.uppercased())
                .font(.system(size: 9, weight: .bold))
                .foregroundColor(color)
            
            Text(title)
                .font(.system(size: 12, weight: .semibold))
                .foregroundColor(.white)
            
            Text(stats)
                .font(.system(size: 10))
                .foregroundColor(.gray)
        }
        .frame(width: 120)
        .padding()
        .background(color.opacity(0.15))
        .cornerRadius(12)
    }
}

// MARK: - Level Detail View

struct LevelDetailView: View {
    let level: CourseAwakeningLevel
    let progress: Float
    @Environment(\.dismiss) private var dismiss
    @State private var selectedModule: AwakeTogetherModule?
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    // Level Header
                    levelHeader
                    
                    // Modules List
                    modulesSection
                }
                .padding()
            }
            .background(Color.black.ignoresSafeArea())
            .navigationTitle("Level \(level.level)")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") { dismiss() }
                }
            }
            .sheet(item: $selectedModule) { module in
                CourseModuleDetailView(module: module, levelColor: level.color)
            }
        }
    }
    
    private var levelHeader: some View {
        VStack(spacing: 12) {
            ZStack {
                Circle()
                    .fill(level.color.opacity(0.3))
                    .frame(width: 80, height: 80)
                Image(systemName: level.icon)
                    .font(.system(size: 32))
                    .foregroundColor(level.color)
            }
            
            Text(level.title)
                .font(.system(size: 18, weight: .bold))
                .foregroundColor(.white)
            
            Text(level.description)
                .font(.system(size: 12))
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
        }
    }
    
    private var modulesSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("MODULES")
                .font(.system(size: 10, weight: .bold))
                .foregroundColor(.gray)
            
            ForEach(level.modules) { module in
                moduleCard(module)
            }
        }
    }
    
    private func moduleCard(_ module: AwakeTogetherModule) -> some View {
        Button(action: { selectedModule = module }) {
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Text(module.title)
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    Text(module.duration)
                        .font(.system(size: 10))
                        .foregroundColor(.gray)
                }
                
                Text(module.description)
                    .font(.system(size: 11))
                    .foregroundColor(.gray)
                    .lineLimit(2)
                
                HStack(spacing: 16) {
                    HStack(spacing: 4) {
                        Image(systemName: "play.rectangle.fill")
                        Text("\(module.content.filter { $0.type == .video }.count) Videos")
                    }
                    .font(.system(size: 9))
                    .foregroundColor(.cyan)
                    
                    HStack(spacing: 4) {
                        Image(systemName: "figure.mind.and.body")
                        Text("\(module.practices.count) Practices")
                    }
                    .font(.system(size: 9))
                    .foregroundColor(.green)
                    
                    if module.quiz != nil {
                        HStack(spacing: 4) {
                            Image(systemName: "checkmark.circle.fill")
                            Text("Quiz")
                        }
                        .font(.system(size: 9))
                        .foregroundColor(.orange)
                    }
                }
            }
            .padding()
            .background(Color.white.opacity(0.05))
            .cornerRadius(12)
        }
    }
}

// MARK: - Module Detail View

struct CourseModuleDetailView: View {
    let module: AwakeTogetherModule
    let levelColor: Color
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    // Module Header
                    VStack(alignment: .leading, spacing: 8) {
                        Text(module.title)
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(.white)
                        
                        Text(module.description)
                            .font(.system(size: 13))
                            .foregroundColor(.gray)
                    }
                    
                    // Content
                    VStack(alignment: .leading, spacing: 12) {
                        Text("CONTENT")
                            .font(.system(size: 10, weight: .bold))
                            .foregroundColor(levelColor)
                        
                        ForEach(module.content) { content in
                            contentRow(content)
                        }
                    }
                    
                    // Practices
                    VStack(alignment: .leading, spacing: 12) {
                        Text("PRACTICES")
                            .font(.system(size: 10, weight: .bold))
                            .foregroundColor(.green)
                        
                        ForEach(module.practices) { practice in
                            practiceCard(practice)
                        }
                    }
                    
                    // Quiz Preview
                    if let quiz = module.quiz {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("QUIZ")
                                .font(.system(size: 10, weight: .bold))
                                .foregroundColor(.orange)
                            
                            HStack {
                                Image(systemName: "checkmark.circle.fill")
                                    .foregroundColor(.orange)
                                Text("\(quiz.title) - \(quiz.questions.count) questions")
                                    .font(.system(size: 12))
                                    .foregroundColor(.white)
                                Spacer()
                                Text("Start Quiz")
                                    .font(.system(size: 11, weight: .semibold))
                                    .foregroundColor(.orange)
                            }
                            .padding()
                            .background(Color.orange.opacity(0.15))
                            .cornerRadius(10)
                        }
                    }
                }
                .padding()
            }
            .background(Color.black.ignoresSafeArea())
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") { dismiss() }
                }
            }
        }
    }
    
    private func contentRow(_ content: ModuleContent) -> some View {
        HStack(spacing: 10) {
            Image(systemName: content.type.icon)
                .foregroundColor(levelColor)
                .frame(width: 30)
            
            VStack(alignment: .leading, spacing: 2) {
                Text(content.title)
                    .font(.system(size: 12, weight: .semibold))
                    .foregroundColor(.white)
                Text(content.description)
                    .font(.system(size: 10))
                    .foregroundColor(.gray)
                if let source = content.source {
                    Text(source)
                        .font(.system(size: 9))
                        .foregroundColor(levelColor)
                }
            }
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
                .font(.system(size: 10))
        }
        .padding(10)
        .background(Color.white.opacity(0.05))
        .cornerRadius(8)
    }
    
    private func practiceCard(_ practice: Practice) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text(practice.title)
                    .font(.system(size: 13, weight: .semibold))
                    .foregroundColor(.white)
                Spacer()
                Text(practice.duration)
                    .font(.system(size: 10))
                    .foregroundColor(.green)
            }
            
            ForEach(practice.instructions, id: \.self) { instruction in
                HStack(alignment: .top, spacing: 6) {
                    Circle()
                        .fill(Color.green)
                        .frame(width: 4, height: 4)
                        .padding(.top, 5)
                    Text(instruction)
                        .font(.system(size: 11))
                        .foregroundColor(.gray)
                }
            }
            
            Text("Benefit: \(practice.benefit)")
                .font(.system(size: 10))
                .foregroundColor(.green)
                .italic()
        }
        .padding()
        .background(Color.green.opacity(0.1))
        .cornerRadius(10)
    }
}

#Preview {
    NavigationStack {
        ConsciousnessAwakeningCourseView()
    }
}
