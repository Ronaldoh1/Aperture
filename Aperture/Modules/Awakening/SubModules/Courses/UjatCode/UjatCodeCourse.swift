// UjatCodeCourse.swift
// Aperture
//
// The Ujat Code: Ancient Egyptian Perception Training
// Practical course on developing enhanced awareness through neuroscience-backed techniques

import Foundation
import SwiftUI


// MARK: - Course Structure

struct UjatCodeCourse {
    
    static let courseInfo = CourseInfo(
        id: "ujat-code",
        title: "The Ujat Code",
        subtitle: "Ancient Egyptian Perception Training",
        icon: "eye.trianglebadge.exclamationmark.fill",
        colorHex: "#FFD700",
        moduleCount: 9,
        estimatedHours: 5,
        category: .practical,
        difficulty: .intermediate
    )
    
    
    // MARK: - Modules
    
    static let modules: [UjatModule] = [
        
        // ═══════════════════════════════════════════════════════════════
        // MODULE 1: THE PERCEPTION YOU'VE BEEN IGNORING
        // ═══════════════════════════════════════════════════════════════
        
        UjatModule(
            id: "ignored-perception",
            number: 1,
            title: "The Perception You've Been Ignoring",
            subtitle: "Your Untapped Biological Intelligence",
            icon: "eye.slash.fill",
            colorHex: "#FFD700",
            description: "That split second when you walk into a room and something feels off—before anyone says a word. That's not imagination. That's your nervous system processing data faster than your conscious mind.",
            lessons: [
                
                UjatLesson(
                    id: "uj-1-1",
                    title: "The Split Second",
                    content: """
                    You know that split second when you walk into a room and something feels OFF—before anyone says a word, before you see anything unusual?
                    
                    Your chest tightens slightly. Maybe the hair on your arms stands up.
                    
                    Most people dismiss this as imagination.
                    
                    THE TRUTH
                    
                    Or how about when you're drifting off to sleep and vivid images suddenly appear behind your closed lids—not dreams yet, but clear visual information you're not consciously creating?
                    
                    Again, we're taught to ignore it.
                    
                    Here's what's actually happening:
                    
                    Your nervous system is processing environmental data at speeds that make your conscious mind look sluggish.
                    
                    FASTER THAN THOUGHT
                    
                    That gut feeling before making a phone call? Your brain has already analyzed micro-patterns in voice, timing, and context that your rational mind hasn't caught up to yet.
                    
                    Children experience this constantly—until adults train them out of it.
                    
                    "Don't be silly. There's nothing there."
                    
                    But this perceptual capacity doesn't disappear. It just atrophies from neglect.
                    
                    What you're about to learn will help you recognize and strengthen this biological intelligence you've been inadvertently suppressing your entire life.
                    """,
                    practice: UjatPractice(
                        title: "The Recognition Exercise",
                        duration: 5,
                        instructions: """
                        For the next 5 minutes, recall times when you "just knew" something:
                        
                        • A phone call where you knew who it was before looking
                        • A room you walked into that felt wrong
                        • A person you instantly trusted (or distrusted)
                        • A decision that felt right despite logic saying otherwise
                        
                        Write these down.
                        
                        These weren't coincidences. They were your enhanced perception working.
                        
                        You're about to learn how to access it consciously.
                        """
                    ),
                    keyInsight: "Your nervous system processes environmental data at speeds that make conscious thought look sluggish. This capacity didn't disappear—it just atrophied from neglect.",
                    dragonComment: "You were born with these abilities. Society just trained you to ignore them."
                ),
                
                UjatLesson(
                    id: "uj-1-2",
                    title: "The Eye of Horus Decoded",
                    content: """
                    Picture yourself walking through the British Museum, staring at the Eye of Horus carved into ancient stone.
                    
                    The placard tells you it's a "protective symbol" or "represents divine power."
                    
                    But here's what they don't tell you—and what the ancient Egyptians knew you'd figure out if you were ready:
                    
                    That eye isn't mystical decoration.
                    
                    IT'S A TRAINING MANUAL.
                    
                    THE COMPONENTS
                    
                    Every component represents a specific aspect of sensory processing:
                    
                    • The eyebrow → Thought
                    • The pupil → Sight
                    • The curved line → Hearing
                    • The teardrop → Smell
                    • The triangle → Taste
                    • The vertical line → Touch
                    
                    THE MYTH IS NEUROLOGY
                    
                    The myth says the eye was damaged and then RESTORED.
                    
                    This isn't ancient fantasy. It's neurology disguised as mythology.
                    
                    Your perceptual abilities were damaged too—not by some cosmic battle, but by years of cultural conditioning that taught you to:
                    
                    • Ignore subtle signals
                    • Dismiss intuitive hits
                    • Trust only what fits into acceptable categories of knowledge
                    
                    The Egyptians encoded RESTORATION techniques because they knew most people would need to rebuild capacities that society had systematically suppressed.
                    """,
                    practice: nil,
                    keyInsight: "The Eye of Horus isn't mystical decoration—it's an anatomically precise training manual for developing enhanced sensory processing.",
                    dragonComment: "The ancients hid their greatest technology in plain sight. Anyone looking could see it. Few knew how to read it."
                ),
                
                UjatLesson(
                    id: "uj-1-3",
                    title: "Why This Was 'Forbidden'",
                    content: """
                    The Egyptians weren't hiding this knowledge because they were secretive mystics hoarding cosmic secrets.
                    
                    They encoded it because they understood something we've forgotten:
                    
                    Certain types of learning can't happen through passive absorption.
                    
                    THE SURGICAL PRINCIPLE
                    
                    You can't develop enhanced perception by reading about it any more than you can:
                    
                    • Learn to perform surgery from a textbook
                    • Master driving from a manual
                    • Become a chef from recipes alone
                    
                    PREPARATION REQUIRED
                    
                    The Egyptians discovered that enhanced perception without proper grounding creates more problems than it solves:
                    
                    • Someone who suddenly starts picking up on subtle social dynamics without understanding how to process that information becomes PARANOID
                    
                    • A person who develops sensitivity to environmental changes without context becomes ANXIOUS and overwhelmed
                    
                    We see identical principles in modern professional training:
                    
                    • Medical schools require supervised clinical rotations because diagnostic intuition develops through guided experience
                    
                    • Therapists spend years in supervised practice because psychological insight without proper boundaries can damage both practitioner and client
                    
                    QUALITY CONTROL
                    
                    The "forbidden" aspect wasn't dramatic gatekeeping. It was quality control.
                    
                    The Egyptians recognized that mass distribution of perceptual enhancement techniques without proper context could destabilize the social structures that kept their civilization functioning.
                    
                    Not because they wanted to control people, but because they understood that societies require a certain level of shared reality to operate effectively.
                    """,
                    practice: nil,
                    keyInsight: "The techniques were encoded not to exclude people, but because enhanced perception without preparation creates more problems than it solves.",
                    dragonComment: "The secret was never the information. It was knowing you had to earn it through practice."
                )
            ]
        ),
        
        // ═══════════════════════════════════════════════════════════════
        // MODULE 2: YOUR TWO-LAYER BRAIN
        // ═══════════════════════════════════════════════════════════════
        
        UjatModule(
            id: "two-layer-brain",
            number: 2,
            title: "Your Two-Layer Brain",
            subtitle: "Fast Intuitive vs. Slow Analytical",
            icon: "brain.head.profile",
            colorHex: "#FF9800",
            description: "Your brain operates two completely different information processing systems. One of them just assessed my credibility 200 milliseconds before your analytical mind could form a complete thought.",
            lessons: [
                
                UjatLesson(
                    id: "uj-2-1",
                    title: "The 200 Millisecond Assessment",
                    content: """
                    Your brain is operating two completely different information processing systems right now.
                    
                    And one of them just assessed my credibility before you consciously decided whether to keep reading.
                    
                    THE LIGHTNING JUDGMENT
                    
                    That lightning-fast judgment happened roughly 200 milliseconds BEFORE your analytical mind could even form a complete thought about what I just said.
                    
                    This isn't mystical speculation. It's measurable neuroscience.
                    
                    THE AMYGDALA
                    
                    Your amygdala—that ancient alarm system buried deep in your brain—processes threat assessment, social cues, and environmental changes FASTER than your prefrontal cortex can spell "rational analysis."
                    
                    While you're consciously reading these words, parsing grammar and meaning, an entirely separate system is scanning for:
                    
                    • Patterns
                    • Inconsistencies
                    • Subtle signals that might indicate danger, opportunity, or deception
                    
                    THE EGYPTIAN UNDERSTANDING
                    
                    The Egyptians understood something we're only now rediscovering through brain imaging technology:
                    
                    Human consciousness operates on two distinct layers, processing reality through fundamentally different mechanisms.
                    
                    What they called "living between two worlds," neuroscientists now recognize as DUAL PROCESS COGNITION—the interplay between fast intuitive processing and slow analytical thinking.
                    """,
                    practice: nil,
                    keyInsight: "Your fast processing system assesses situations 200 milliseconds before your conscious mind can form a complete thought—and it's often more accurate.",
                    dragonComment: "You've been taught to trust the slow mind and ignore the fast one. That's backwards."
                ),
                
                UjatLesson(
                    id: "uj-2-2",
                    title: "System 1 vs. System 2",
                    content: """
                    Let's map these two systems clearly:
                    
                    SYSTEM 2: YOUR CONSCIOUS MIND
                    
                    Your conscious mind excels at sequential tasks. It's the system that handles:
                    
                    • Language
                    • Mathematical calculations
                    • Logical problem-solving
                    • Step-by-step reasoning you learned in school
                    
                    This analytical processor is methodical, verbal, and energy-intensive.
                    
                    It's also PAINFULLY SLOW compared to your pattern recognition system.
                    
                    SYSTEM 1: YOUR PATTERN RECOGNITION
                    
                    Meanwhile, your unconscious processing network operates like a massive parallel computer.
                    
                    It simultaneously monitors HUNDREDS of variables your conscious mind couldn't track if it tried:
                    
                    • Recognizes faces in milliseconds
                    • Detects emotional undertones in voices
                    • Notices when something "feels off" about a situation
                    • Constantly scans your environment for changes that might require attention
                    
                    SOMATIC MARKERS
                    
                    Here's where it gets fascinating:
                    
                    Your autonomic nervous system is essentially running a continuous background scan of reality.
                    
                    It picks up information through micro-expressions, body language, environmental shifts, and pattern variations that NEVER reach conscious awareness.
                    
                    This information gets processed into what researchers call "somatic markers"—physical sensations that carry meaning.
                    
                    THE UNEASY FEELING
                    
                    Think about the last time you met someone and immediately felt uneasy—even though they seemed perfectly pleasant on the surface.
                    
                    Your pattern recognition system detected something:
                    
                    • Inconsistencies between their words and micro-expressions
                    • Subtle behavioral cues that didn't match their stated intentions
                    
                    You received this information not as thoughts, but as:
                    
                    • A gut feeling
                    • A sense of unease
                    • What some people describe as "bad vibes"
                    
                    This isn't supernatural intuition. It's your brain processing vast amounts of subtle data and delivering conclusions through physical sensations rather than verbal thoughts.
                    """,
                    practice: UjatPractice(
                        title: "Noticing System 1",
                        duration: 10,
                        instructions: """
                        For the next 10 minutes, pay attention to your body's immediate responses:
                        
                        As you scroll social media or read news:
                        • Notice the INSTANT body response before you think about it
                        • Expansion or contraction?
                        • Openness or closing?
                        • Trust or wariness?
                        
                        Don't analyze—just notice.
                        
                        Your System 1 is always providing information. You're just learning to read it.
                        """
                    ),
                    keyInsight: "The problem is that modern culture trains us to dismiss System 1 signals as unreliable, pushing us to over-rely on conscious analysis while ignoring our most sophisticated intelligence.",
                    dragonComment: "Your intuition isn't mystical. It's just faster than thought."
                ),
                
                UjatLesson(
                    id: "uj-2-3",
                    title: "Expert Intuition",
                    content: """
                    Emergency room doctors provide a perfect example of dual-layer processing in action.
                    
                    THE EXPERIENCED PHYSICIAN
                    
                    Experienced physicians often report KNOWING something is seriously wrong with a patient before any tests confirm their suspicion.
                    
                    They'll describe:
                    
                    • "A feeling that this patient is sicker than they look"
                    • "Sensing impending cardiac arrest in someone whose vital signs appear stable"
                    
                    Studies have shown these intuitive assessments are remarkably accurate.
                    
                    Not because doctors are psychic—but because their pattern recognition systems have learned to detect subtle combinations of symptoms, behaviors, and physiological markers that indicate danger.
                    
                    ACROSS FIELDS
                    
                    The same phenomenon appears across professional fields:
                    
                    • Seasoned FIREFIGHTERS can sense when a building is about to collapse based on barely perceptible changes in smoke patterns, sound, or structural vibrations
                    
                    • Experienced MOTHERS wake up seconds before their babies cry—their unconscious processing having detected subtle changes in breathing patterns or movement
                    
                    • Successful INVESTORS describe gut feelings about market movements that later prove accurate—their pattern recognition systems having processed countless subtle indicators that conscious analysis might miss
                    
                    EXPERT INTUITION RESEARCH
                    
                    Studies on expert intuition consistently show that professionals develop reliable "sixth sense" capabilities through experience.
                    
                    Not magical thinking—but sophisticated pattern recognition honed through thousands of hours of exposure to relevant data.
                    
                    Your brain's pattern recognition system LEARNS by absorbing massive amounts of information and detecting correlations that conscious analysis couldn't possibly track.
                    
                    A chess master doesn't consciously calculate every possible move. Their pattern recognition system INSTANTLY identifies promising positions based on having seen similar configurations thousands of times.
                    
                    The intuitive move often proves superior to lengthy conscious analysis.
                    """,
                    practice: nil,
                    keyInsight: "Expert intuition isn't magic—it's sophisticated pattern recognition developed through thousands of hours of exposure to relevant patterns.",
                    dragonComment: "Your intuition can be trained like any skill. The more patterns you expose it to, the smarter it gets."
                )
            ]
        ),
        
        // ═══════════════════════════════════════════════════════════════
        // MODULE 3: BODY INTELLIGENCE
        // ═══════════════════════════════════════════════════════════════
        
        UjatModule(
            id: "body-intelligence",
            number: 3,
            title: "Body Intelligence",
            subtitle: "Your Gut, Heart, and Skin Are Thinking",
            icon: "figure.mind.and.body",
            colorHex: "#4CAF50",
            description: "Your digestive system contains over 500 million neurons. Your heart has its own neural network. Your body has been trying to tell you something your entire life.",
            lessons: [
                
                UjatLesson(
                    id: "uj-3-1",
                    title: "Your Gut Brain",
                    content: """
                    Your body has been trying to tell you something your entire life—but somewhere along the way, you learned to stop listening.
                    
                    Let's start with your gut.
                    
                    Because when we say "trust your gut feeling," we're talking about LITERAL NEUROSCIENCE.
                    
                    THE ENTERIC NERVOUS SYSTEM
                    
                    Your digestive system contains over 500 MILLION neurons—more than your spinal cord.
                    
                    This enteric nervous system operates independently from your brain, processing information and making decisions without any input from your conscious mind.
                    
                    It's why you can feel nauseated when something's wrong—even when you can't articulate what that something is.
                    
                    THE VAGUS HIGHWAY
                    
                    The vagus nerve acts like a superhighway between your gut and your brain, carrying information in both directions.
                    
                    But here's the fascinating part:
                    
                    Roughly 80% of the signals travel from GUT TO BRAIN—not the other way around.
                    
                    Your gut is constantly feeding your brain data about:
                    
                    • Your environment
                    • Your relationships
                    • Your decisions
                    
                    That tug in your stomach when you're about to make the wrong choice? That's your enteric nervous system detecting patterns your conscious mind hasn't caught up to yet.
                    
                    MICRO-EXPRESSION PROCESSING
                    
                    Dr. Beatrice De Gilder's research at Tilburg University showed that people can accurately identify emotional states from body language in as little as 39 MILLISECONDS—faster than it takes to consciously recognize a face.
                    
                    Your gut processes these micro-expressions, posture changes, and vocal tonalities instantly—translating them into physical sensations that guide your behavior.
                    """,
                    practice: UjatPractice(
                        title: "Gut Check Practice",
                        duration: 0,
                        instructions: """
                        For the next 24 hours, consciously check in with your gut:
                        
                        Before conversations: What does your gut sense about this person right now?
                        
                        Before decisions: What does your stomach tell you about each option?
                        
                        After encounters: Did your gut feeling match what happened?
                        
                        Start building a relationship with this intelligence you've been ignoring.
                        """
                    ),
                    keyInsight: "Your gut contains 500 million neurons that process information independently—and 80% of vagus nerve signals travel from gut to brain, not the other way around.",
                    dragonComment: "Your gut has been giving you advice your whole life. Time to start listening."
                ),
                
                UjatLesson(
                    id: "uj-3-2",
                    title: "Your Heart Brain",
                    content: """
                    This connects directly to your mirror neuron system, discovered by Giacomo Rizzolatti's team in the 1990s.
                    
                    MIRROR NEURONS
                    
                    These specialized cells fire both when you perform an action AND when you observe someone else performing the same action.
                    
                    But they do more than just help you learn.
                    
                    They're constantly reading the emotional and intentional states of everyone around you.
                    
                    When someone is lying, angry, or planning something deceptive, their micro-movements and subtle expressions trigger your mirror neurons—which then activate your gut's warning system.
                    
                    THE HEART'S NEURAL NETWORK
                    
                    Your heart adds another layer to this detection network.
                    
                    The HeartMath Institute's research reveals that your heart contains approximately 40,000 NEURONS—its own neural network that can influence brain function and emotional processing.
                    
                    Your heart responds to emotional stimuli BEFORE your brain does—changing its rhythm patterns based on environmental cues you're not consciously aware of.
                    
                    MEASURABLE CHANGES
                    
                    When you walk into a room full of tension, your heart rate variability shifts within seconds.
                    
                    When you're near someone who's genuinely trustworthy versus someone who's manipulative, your heart's neural network detects the difference and adjusts accordingly.
                    
                    This is why you might feel your heart "open" around certain people and "close" around others. It's not metaphorical—it's measurable physiological change.
                    
                    COHERENT HEART = CLEAR THINKING
                    
                    Dr. Rollin McCraty's studies show that coherent heart rhythms—the kind produced during states of appreciation or compassion—actually synchronize brain waves and enhance cognitive function.
                    
                    When your heart-brain connection is optimized, you can literally think more clearly and perceive patterns more accurately.
                    """,
                    practice: UjatPractice(
                        title: "Heart Coherence",
                        duration: 5,
                        instructions: """
                        1. Place your hand on your heart
                        
                        2. Breathe slowly—5 seconds in, 5 seconds out
                        
                        3. Recall a feeling of genuine appreciation or love
                        
                        4. Hold this feeling while continuing to breathe
                        
                        5. After 5 minutes, notice how your thinking feels—clearer? More spacious?
                        
                        This is heart coherence. Practice it before important decisions.
                        """
                    ),
                    keyInsight: "Your heart has its own neural network that responds to emotional stimuli before your brain—and when it's coherent, it enhances your cognitive clarity.",
                    dragonComment: "The heart isn't just a pump. It's a perception organ."
                ),
                
                UjatLesson(
                    id: "uj-3-3",
                    title: "Skin, Insula, and Integration",
                    content: """
                    Your skin provides another information channel through its dense network of nerve endings.
                    
                    SKIN PERCEPTION
                    
                    Ever feel someone staring at you from across a room?
                    
                    Your skin can detect subtle changes in:
                    
                    • Electromagnetic fields
                    • Air pressure
                    • Temperature
                    
                    That accompany focused attention.
                    
                    The prickly sensation you get when entering certain spaces isn't imagination—it's your nervous system responding to environmental data your conscious mind can't process.
                    
                    THE INSULA: INTEGRATION CENTER
                    
                    The insula, a brain region tucked deep within the cerebral cortex, integrates all this bodily information into what neuroscientists call INTEROCEPTIVE AWARENESS—your ability to sense your internal state.
                    
                    People with stronger insular activity show:
                    
                    • Better emotional regulation
                    • More accurate social judgments
                    • Superior decision-making abilities
                    
                    They're literally MORE IN TOUCH with their body's wisdom.
                    
                    WHAT'S DISRUPTING THIS
                    
                    But here's the problem:
                    
                    Modern life systematically disrupts these natural communication pathways:
                    
                    • Chronic stress floods your system with cortisol, which impairs gut-brain communication
                    
                    • Constant stimulation from screens and noise overwhelms your nervous system's ability to detect subtle environmental cues
                    
                    • Processed foods disrupt your gut microbiome, which directly affects neurotransmitter production and emotional processing
                    
                    NEUROPLASTICITY OF AWARENESS
                    
                    When Dr. Sara Lazar at Massachusetts General Hospital studied meditation practitioners using MRI scans, she found increased gray matter density in the insula.
                    
                    After just 8 weeks of practice, participants reported dramatically improved ability to sense their body's signals and make decisions based on internal guidance rather than external pressure.
                    """,
                    practice: nil,
                    keyInsight: "The insula integrates information from gut, heart, and skin into unified body awareness. Strengthening it improves emotional regulation, social accuracy, and decision-making.",
                    dragonComment: "Your whole body is a perception organ. The brain is just where the signals get processed."
                )
            ]
        ),
        
        // ═══════════════════════════════════════════════════════════════
        // MODULE 4: THE FOCAL POINT
        // ═══════════════════════════════════════════════════════════════
        
        UjatModule(
            id: "focal-point",
            number: 4,
            title: "The Focal Point",
            subtitle: "Third Eye Neuroscience",
            icon: "eye.circle.fill",
            colorHex: "#9C27B0",
            description: "When ancient Egyptian priests placed attention behind the forehead during sacred rituals, they weren't working from superstition. They had discovered that focusing here produces consistent, measurable changes in perception.",
            lessons: [
                
                UjatLesson(
                    id: "uj-4-1",
                    title: "Why This Location?",
                    content: """
                    When ancient Egyptian priests placed their attention behind the forehead during sacred rituals, they weren't working from superstition.
                    
                    They had discovered through centuries of careful observation that focusing awareness in this specific location produced consistent, measurable changes in perception and consciousness.
                    
                    What they couldn't have known is that this traditional "third eye" location sits directly above some of the most sophisticated neural real estate in the human brain.
                    
                    THE PREFRONTAL CORTEX
                    
                    When you place your attention behind your forehead, you're directing focus toward the prefrontal cortex—the brain's executive command center.
                    
                    This isn't some mystical energy point. It's the biological headquarters for everything that makes enhanced perception possible:
                    
                    • Working memory
                    • Attention regulation systems
                    • Cognitive flexibility networks
                    
                    These are the exact neural functions you need to access those subtle layers of information we discussed earlier.
                    
                    THE BRIDGE
                    
                    Right beneath this area sits the anterior cingulate cortex, which acts like a BRIDGE between cognitive and emotional processing.
                    
                    When researchers scan the brains of experienced meditators who focus attention in this region, they find something remarkable:
                    
                    This bridge becomes incredibly well-developed.
                    
                    It's as if the brain builds stronger highways between rational analysis and intuitive sensing.
                    
                    PROXIMITY TO GLANDS
                    
                    Now you might wonder why this particular spot produces such specific effects.
                    
                    The answer lies in proximity.
                    
                    Nestled deep within this region are the pineal and pituitary glands—structures that regulate everything from sleep cycles to stress hormones.
                    
                    When you maintain gentle attention here, you're not directly affecting these glands, but you ARE activating the neural networks that communicate with them.
                    
                    It's like tuning into the brain's internal communication system.
                    """,
                    practice: nil,
                    keyInsight: "The 'third eye' location sits above the prefrontal cortex and near the bridge between cognitive and emotional processing—focusing here produces measurable neurological changes.",
                    dragonComment: "The Egyptians found the right location through observation. Neuroscience found it through brain scans. Same spot."
                ),
                
                UjatLesson(
                    id: "uj-4-2",
                    title: "Soft Focus vs. Hard Focus",
                    content: """
                    The key word here is GENTLE.
                    
                    There's a crucial difference between what neuroscientists call "soft focus" and "hard focus."
                    
                    And this distinction completely changes what happens in your brain.
                    
                    HARD FOCUS
                    
                    When you FORCE concentration—that grinding, effortful attention most of us learned in school—you activate what's called the CENTRAL EXECUTIVE NETWORK.
                    
                    This network is fantastic for:
                    • Solving math problems
                    • Analyzing data
                    
                    But it actually BLOCKS the kind of open awareness that allows subtle perception.
                    
                    SOFT FOCUS
                    
                    Soft focus works differently.
                    
                    Instead of forcing attention like a laser beam, you place it like a gentle hand resting on a surface.
                    
                    This activates the SALIENCE NETWORK—the brain system responsible for detecting what's important in your environment.
                    
                    Think of it as the difference between:
                    
                    • Staring intensely at a single tree
                    • Maintaining relaxed awareness of the entire forest
                    
                    The "forest" approach lets you notice movement, patterns, and changes that focused staring would miss entirely.
                    
                    THE DEFAULT MODE NETWORK
                    
                    This connects directly to something called the DEFAULT MODE NETWORK—which is active when your mind wanders and engages in self-referential thinking.
                    
                    You know that internal chatter that's constantly running? Planning, worrying, replaying conversations? That's your default mode network.
                    
                    When you practice the gentle attention placement we're discussing, you're not trying to shut this network down completely.
                    
                    Instead, you're learning to MODULATE its activity—reducing the mental noise while maintaining awareness.
                    """,
                    practice: UjatPractice(
                        title: "Finding Soft Focus",
                        duration: 5,
                        instructions: """
                        1. Close your eyes
                        
                        2. Imagine there's a small warm light about an inch behind your forehead
                        
                        3. Don't STRAIN to see it or force anything to happen
                        
                        4. Simply rest your attention there—as you might rest your hand on a table
                        
                        5. If you notice tension building around your eyes or forehead, you're trying too hard
                        
                        6. If your mind starts wandering to dinner plans, gently guide attention back
                        
                        The sweet spot feels like maintaining awareness of that space while remaining relaxed and open.
                        """
                    ),
                    keyInsight: "Hard focus activates analytical networks but blocks subtle perception. Soft focus activates the salience network—allowing you to detect what's important without forcing.",
                    dragonComment: "Don't squeeze your awareness into a point. Let it rest there like a cat watching a mouse hole—alert but relaxed."
                ),
                
                UjatLesson(
                    id: "uj-4-3",
                    title: "The Neuroplastic Effects",
                    content: """
                    The neuroscience research shows us why this works.
                    
                    STRUCTURAL CHANGES
                    
                    Brain imaging studies show that people who regularly practice this type of attention training develop:
                    
                    • Increased gray matter density in regions associated with learning, memory, and emotional regulation
                    
                    • Enhanced connectivity between different brain regions
                    
                    It's as if the brain develops better internal communication networks.
                    
                    COGNITIVE BENEFITS
                    
                    Studies on attention training demonstrate improvements in:
                    
                    • Cognitive flexibility—your ability to shift between different concepts or adapt to new situations
                    
                    • Stress resilience
                    
                    • Emotional regulation
                    
                    These aren't mystical benefits. They're measurable changes in brain function.
                    
                    SENSORY PROCESSING
                    
                    What's particularly interesting is how this practice affects SENSORY PROCESSING.
                    
                    The prefrontal cortex has extensive connections to sensory areas throughout the brain.
                    
                    When you strengthen attention regulation in this region, you essentially upgrade your brain's ability to process and integrate sensory information.
                    
                    This is why practitioners often report:
                    
                    • Enhanced intuition
                    • Better pattern recognition
                    • Increased sensitivity to environmental changes
                    
                    UPGRADING THE OS
                    
                    The ancient Egyptians called this "opening the inner eye."
                    
                    But modern neuroscience reveals it's more like upgrading your brain's operating system.
                    
                    You're not developing supernatural abilities. You're OPTIMIZING neural networks that were always there—waiting to be trained.
                    
                    The focal point isn't arbitrary mysticism. It's an anatomically precise method for accessing your brain's most sophisticated perceptual capabilities.
                    """,
                    practice: nil,
                    keyInsight: "Regular focal point practice creates measurable brain changes—increased gray matter, enhanced connectivity, and improved sensory processing. It's upgrading your neural operating system.",
                    dragonComment: "You're not becoming psychic. You're becoming more fully human."
                )
            ]
        ),
        
        // ═══════════════════════════════════════════════════════════════
        // MODULE 5: THE THREE PILLARS
        // ═══════════════════════════════════════════════════════════════
        
        UjatModule(
            id: "three-pillars",
            number: 5,
            title: "The Three Pillars",
            subtitle: "Breath, Attention, and Silence",
            icon: "triangle.fill",
            colorHex: "#00BCD4",
            description: "When you combine breath, attention, and silence in specific ways, you create nervous system coherence that fundamentally changes how your brain processes information.",
            lessons: [
                
                UjatLesson(
                    id: "uj-5-1",
                    title: "Breath as Foundation",
                    content: """
                    Here's where everything we've discussed about the vagus nerve, the enteric nervous system, and that neuroanatomical cluster around your prefrontal cortex comes together into something you can actually work with.
                    
                    The ancient Egyptians figured out something that modern neuroscience is just now catching up to:
                    
                    When you combine BREATH, ATTENTION, and SILENCE in specific ways, you create a state of nervous system coherence that fundamentally changes how your brain processes information.
                    
                    BREATH: THE FOUNDATION
                    
                    When you breathe properly—expanding your ribs sideways rather than lifting your chest—you're doing something very specific to your autonomic nervous system.
                    
                    That sideways expansion activates your diaphragm properly, which creates a mechanical massage of the vagus nerve.
                    
                    CONTROLLED EXHALATION
                    
                    Controlled exhalation—especially when it's longer than your inhalation—directly stimulates the parasympathetic branch of that vagus nerve.
                    
                    Research on heart rate variability shows us exactly what's happening:
                    
                    Your heart doesn't beat like a metronome. It speeds up slightly on the inhale and slows down on the exhale.
                    
                    When you breathe in a specific rhythm—around 5 to 6 breaths per minute—you create what researchers call COHERENT BREATHING PATTERNS.
                    
                    Your heart rate variability becomes smooth and wave-like instead of chaotic.
                    
                    And this coherence literally synchronizes your heart, brain, and emotional centers.
                    
                    WHY THIS MATTERS
                    
                    Most of the time, your nervous system is running some version of a stress response.
                    
                    Even when you're not consciously stressed, you're dealing with background activation—traffic, deadlines, social media, the constant low-level fight-or-flight that modern life demands.
                    
                    This breathing pattern shifts you out of sympathetic dominance into parasympathetic activation.
                    
                    You move from stress response into "rest and digest" mode.
                    
                    But more importantly for our purposes, you move into the optimal state for pattern recognition and subtle information processing.
                    """,
                    practice: UjatPractice(
                        title: "Coherent Breathing",
                        duration: 5,
                        instructions: """
                        1. Sit comfortably with spine straight
                        
                        2. Place hands on your ribs (sides of your body)
                        
                        3. Inhale for 5 seconds—feel your ribs expand SIDEWAYS (not chest lifting)
                        
                        4. Exhale for 5 seconds—feel ribs contract
                        
                        5. Continue for 5 minutes (about 30 breaths)
                        
                        This rhythm (5 seconds in, 5 seconds out) creates optimal heart-brain coherence.
                        
                        Practice daily until it becomes natural.
                        """
                    ),
                    keyInsight: "Breathing at 5-6 breaths per minute creates heart-brain coherence—shifting you from stress response into the optimal state for pattern recognition and subtle perception.",
                    dragonComment: "Your breath is the one autonomic function you can consciously control. It's your backdoor into the nervous system."
                ),
                
                UjatLesson(
                    id: "uj-5-2",
                    title: "Attention as Direction",
                    content: """
                    But breath alone isn't enough.
                    
                    That's where ATTENTION comes in as your directing force.
                    
                    WHAT SUSTAINED ATTENTION DOES
                    
                    Sustained attention does something remarkable to your brain that most people don't understand.
                    
                    When you focus on something consistently—whether it's that point behind your forehead or any other object of attention—you're literally:
                    
                    • Strengthening the neural networks associated with cognitive control
                    
                    • Simultaneously weakening what neuroscientists call the DEFAULT MODE NETWORK
                    
                    THE MENTAL CHATTER
                    
                    The default mode network is that internal chatter—the constant stream of thoughts about the past and future, the mental commentary that runs in the background of your awareness.
                    
                    Studies on attention training show that when you practice sustained focus, activity in this network DECREASES.
                    
                    The mental noise quiets down.
                    
                    RELAXED AWARENESS
                    
                    But here's the crucial distinction:
                    
                    We're not talking about effortful concentration where you're gritting your teeth and forcing your attention.
                    
                    That actually INCREASES stress and works against what we're trying to achieve.
                    
                    What you're developing is RELAXED AWARENESS.
                    
                    The kind of attention a cat has when it's watching a mouse hole:
                    
                    • Alert but not tense
                    • Focused but not forcing
                    
                    Sports psychologists call this "relaxed concentration"—and it's the hallmark of peak performance states.
                    
                    When athletes talk about being "in the zone," they're describing exactly this quality of attention.
                    
                    Completely present. Effortlessly focused. Aware without trying.
                    """,
                    practice: nil,
                    keyInsight: "Sustained but relaxed attention strengthens cognitive control while quieting mental chatter—creating the focused-but-open state athletes call 'the zone.'",
                    dragonComment: "Attention is like water. Force it and it splashes everywhere. Channel it gently and it becomes powerful."
                ),
                
                UjatLesson(
                    id: "uj-5-3",
                    title: "Silence as Space",
                    content: """
                    This brings us to SILENCE.
                    
                    NOT SOUND—REACTIVITY
                    
                    Silence isn't what most people think it is.
                    
                    We're not talking about the absence of sound. You can practice this technique in a noisy environment.
                    
                    We're talking about the absence of internal REACTIVITY and COMMENTARY.
                    
                    It's the space between your thoughts—that pause before you mentally label or judge what you're experiencing.
                    
                    OPEN MONITORING
                    
                    Research on "open monitoring" meditation—which is essentially what we're describing—shows that this kind of mental silence:
                    
                    • Enhances cognitive flexibility
                    • Increases creative insight
                    
                    When you're not immediately categorizing and analyzing every sensation or perception, your brain can process information in ways that normally get overridden by conscious thinking.
                    
                    It's like turning down the volume on your mental radio so you can hear the subtler frequencies that are always there but usually get drowned out.
                    
                    THE SYNERGY
                    
                    Here's why the combination of these three elements creates something more powerful than any single technique alone:
                    
                    They work SYNERGISTICALLY to create what neuroscientists call "relaxed alertness."
                    
                    • Your nervous system is calm but not sleepy
                    • Focused but not strained
                    • Open but not scattered
                    
                    This is the optimal state for pattern recognition—for noticing connections and information that your normal waking consciousness might miss.
                    
                    HOW IT WORKS TOGETHER
                    
                    Think about how this works in practice:
                    
                    1. The controlled breathing shifts your nervous system into coherence and activates that vagus nerve pathway
                    
                    2. The sustained but relaxed attention strengthens your ability to stay present while reducing mental chatter
                    
                    3. The silence creates space for subtler information processing to become conscious
                    
                    Together, they create a state where your brain can function more like that integrated network around your prefrontal cortex—processing multiple streams of information simultaneously rather than getting stuck in linear analytical thinking.
                    """,
                    practice: UjatPractice(
                        title: "Silence Between Thoughts",
                        duration: 5,
                        instructions: """
                        1. Close your eyes and notice your thoughts
                        
                        2. Instead of following thoughts, notice the GAPS between them
                        
                        3. Each time a thought ends, there's a brief silence before the next one
                        
                        4. Rest your attention in those gaps
                        
                        5. Don't try to create silence—just notice the silence that's already there
                        
                        With practice, the gaps expand. This is where subtle perception lives.
                        """
                    ),
                    keyInsight: "Silence isn't the absence of sound—it's the absence of internal commentary. When you stop labeling every experience, your brain can process subtler information.",
                    dragonComment: "The silence between thoughts is where everything interesting happens."
                )
            ]
        ),
        
        // ═══════════════════════════════════════════════════════════════
        // MODULE 6: THE 7-BREATH PROTOCOL
        // ═══════════════════════════════════════════════════════════════
        
        UjatModule(
            id: "seven-breath",
            number: 6,
            title: "The 7-Breath Protocol",
            subtitle: "The Complete Practice",
            icon: "7.circle.fill",
            colorHex: "#E91E63",
            description: "Seven conscious breaths hits what researchers call the 'neuroplasticity sweet spot.' It's long enough to trigger brain wave shifts, short enough that your prefrontal cortex doesn't fatigue.",
            lessons: [
                
                UjatLesson(
                    id: "uj-6-1",
                    title: "Why Seven Breaths?",
                    content: """
                    Now that we understand how breath, attention, and silence work together to create neural coherence, let's dive into the practical application that transforms this knowledge into direct experience.
                    
                    THE NEUROPLASTICITY SWEET SPOT
                    
                    The seven breath protocol isn't arbitrary.
                    
                    It's based on decades of research into optimal practice duration for neurological change.
                    
                    Studies from Harvard's Benson-Henry Institute show that seven conscious breaths hits what researchers call the "neuroplasticity sweet spot":
                    
                    • Long enough to trigger measurable shifts in brain wave patterns—specifically increasing alpha waves associated with relaxed awareness
                    
                    • Short enough that your prefrontal cortex doesn't fatigue and lose focus
                    
                    2-3 MINUTE WINDOW
                    
                    Most people can maintain genuine attention for about 2 to 3 minutes without mental strain.
                    
                    Seven conscious breaths typically falls right into this window.
                    
                    IMMEDIATE CHANGES
                    
                    Dr. Sara Lazar's neuroimaging research at Massachusetts General Hospital revealed something remarkable:
                    
                    Even brief meditation practices of two to three minutes create IMMEDIATE changes in the insula—the brain region responsible for interoceptive awareness, your ability to sense what's happening inside your body.
                    
                    This is crucial because the insula acts like a bridge between your conscious awareness and your autonomic nervous system.
                    """,
                    practice: nil,
                    keyInsight: "Seven breaths (2-3 minutes) is the sweet spot—long enough to shift brain waves, short enough to maintain quality attention.",
                    dragonComment: "You don't need an hour. You need seven quality breaths."
                ),
                
                UjatLesson(
                    id: "uj-6-2",
                    title: "Breath by Breath",
                    content: """
                    Let me walk you through each breath and what's actually happening in your nervous system:
                    
                    BREATH 1: ENTRANCE
                    
                    Your entrance into a different state.
                    
                    As you consciously slow your breathing, you're sending a direct signal to your vagus nerve.
                    
                    Within 30 seconds of controlled breathing, your heart rate variability begins to increase—which researchers recognize as a marker of nervous system flexibility and resilience.
                    
                    You're literally shifting from sympathetic dominance (constant low-level fight-or-flight) toward parasympathetic activation (where healing and perception enhancement become possible).
                    
                    What you might notice: A subtle sense of settling or dropping. Maybe a slight release of tension you didn't realize you were holding. This isn't imagination—it's your nervous system recognizing safety.
                    
                    BREATH 2: FOCAL POINT
                    
                    Introduces focused attention on your chosen focal point.
                    
                    When you direct attention to a specific location, you're strengthening attentional networks in your prefrontal cortex.
                    
                    Brain imaging studies show that even brief attention training increases gray matter density in areas associated with sustained focus and emotional regulation.
                    
                    By focusing on the area between your eyebrows, you're activating neural pathways connected to your default mode network—the brain's background processing system.
                    
                    Research from Stanford's neuroscience department suggests this region becomes more active during states of expanded awareness and creative insight.
                    
                    What you might experience: Increased clarity—like mental fog lifting. A sense of energy gathering in that area. Some people report a subtle pressure or warmth. This is increased blood flow and neural activation in the prefrontal regions.
                    
                    BREATH 3: BODY EXPANSION
                    
                    Expands your awareness to your whole body.
                    
                    This activates what Antonio Damasio calls "somatic markers"—your body's wisdom system.
                    
                    The insula begins mapping your internal landscape with greater precision.
                    
                    Studies from the University of California show that body awareness practices literally change the structure of the insula—making you more sensitive to subtle internal signals.
                    
                    What you might notice: Tingling, warmth, or a sense of aliveness throughout your body. That's not mystical energy—it's your nervous system coming online with greater sensitivity and integration.
                    """,
                    practice: nil,
                    keyInsight: "Each breath serves a specific neurological function—shifting nervous system state, activating attention networks, and expanding body awareness.",
                    dragonComment: "These aren't magic numbers. They're neuroscience."
                ),
                
                UjatLesson(
                    id: "uj-6-3",
                    title: "The Complete Protocol",
                    content: """
                    BREATHS 4-7: DEEPENING
                    
                    These breaths deepen the integrated state progressively.
                    
                    Each breath builds on the previous one, creating what researchers call STATE-DEPENDENT LEARNING.
                    
                    Your brain begins associating this particular breathing pattern with expanded awareness—making it easier to access these states over time.
                    
                    By breath four, your brain wave patterns typically show increased theta waves—associated with deep relaxation and enhanced creativity.
                    
                    By breath six or seven, many people experience what neuroscientist Dr. Andrew Newberg calls "deafferentation"—a temporary quieting of normal sensory input processing that allows for expanded perception.
                    
                    THE COMPLETE 7-BREATH PROTOCOL
                    
                    BREATH 1: Settle
                    - Slow inhale through nose (5 seconds)
                    - Slow exhale through nose (5 seconds)
                    - Notice your body releasing tension
                    
                    BREATH 2: Focus
                    - Same breath rhythm
                    - Place soft attention behind forehead
                    - Don't strain—just rest attention there
                    
                    BREATH 3: Expand
                    - Same breath rhythm
                    - Expand awareness to entire body
                    - Feel your whole form breathing
                    
                    BREATHS 4-7: Integrate
                    - Continue same rhythm
                    - Maintain soft focus AND body awareness simultaneously
                    - Allow mental chatter to fade into background
                    - Rest in the silence between thoughts
                    
                    WHAT TO EXPECT
                    
                    This isn't about forcing anything or trying to have special experiences.
                    
                    The protocol works through what neuroscientists call "bottom-up processing."
                    
                    Your nervous system NATURALLY shifts into coherence when given the right conditions.
                    
                    Some people feel dramatic effects immediately—waves of relaxation, visual phenomena, or profound stillness.
                    
                    Others notice subtle changes—slightly sharper thinking, reduced mental chatter, or improved emotional balance throughout the day.
                    
                    Both responses indicate the practice is working.
                    """,
                    practice: UjatPractice(
                        title: "The 7-Breath Protocol",
                        duration: 3,
                        instructions: """
                        BREATH 1: Settle
                        Inhale 5 seconds, exhale 5 seconds. Notice tension releasing.
                        
                        BREATH 2: Focus
                        Same rhythm. Place soft attention behind forehead.
                        
                        BREATH 3: Expand
                        Same rhythm. Expand awareness to whole body.
                        
                        BREATHS 4-7: Integrate
                        Continue rhythm. Hold focus AND body awareness.
                        Rest in silence between thoughts.
                        
                        Total time: About 70 seconds.
                        
                        Practice this 3x daily for one week.
                        """
                    ),
                    keyInsight: "The 7-breath protocol takes 70 seconds but creates measurable nervous system shifts. Consistency matters more than duration.",
                    dragonComment: "70 seconds to change your brain state. What's your excuse?"
                )
            ]
        ),
        
        // ═══════════════════════════════════════════════════════════════
        // MODULE 7: WORKING WITH RESISTANCE
        // ═══════════════════════════════════════════════════════════════
        
        UjatModule(
            id: "resistance",
            number: 7,
            title: "Working with Resistance",
            subtitle: "The Internal Opposition Committee",
            icon: "hand.raised.fill",
            colorHex: "#FF5722",
            description: "After the third or fourth breath, a voice in your head will say 'This is ridiculous.' Welcome to your internal opposition committee. Understanding how it operates is crucial.",
            lessons: [
                
                UjatLesson(
                    id: "uj-7-1",
                    title: "The Opposition Committee",
                    content: """
                    When you first started practicing the seven breath protocol, something interesting probably happened.
                    
                    Maybe after the third or fourth breath, a voice in your head said something like:
                    
                    "This is ridiculous."
                    
                    Or: "Nothing's happening."
                    
                    Maybe you felt a subtle shift in your awareness and immediately thought:
                    
                    "That's just my imagination."
                    
                    Welcome to what I call the INTERNAL OPPOSITION COMMITTEE.
                    
                    And understanding how this committee operates is absolutely crucial if you want to develop genuine inner sight.
                    
                    WHY YOUR BRAIN RESISTS
                    
                    Your brain didn't evolve to help you transcend ordinary consciousness.
                    
                    It evolved to keep you alive in dangerous environments where anything unfamiliar could kill you.
                    
                    This creates what neuroscientists call the NEGATIVITY BIAS:
                    
                    Your neural circuitry is literally wired to notice threats five times faster than opportunities.
                    
                    THE BOUNCER
                    
                    When you begin practices that shift your normal state of awareness, ancient alarm systems start firing.
                    
                    The rational mind acts like a bouncer at an exclusive club—checking every new experience against its database of "acceptable reality."
                    
                    If something doesn't match existing categories, it gets labeled as:
                    
                    • Imagination
                    • Coincidence
                    • Wishful thinking
                    
                    This isn't stupidity. It's actually sophisticated pattern recognition protecting you from delusion.
                    
                    BUT—here's the problem:
                    
                    Genuine inner development often begins with experiences so subtle they fall below the threshold of what the rational mind considers "real."
                    """,
                    practice: nil,
                    keyInsight: "Your brain is wired to resist unfamiliar states of consciousness—not because the experiences are fake, but because your survival systems flag anything unknown as potentially dangerous.",
                    dragonComment: "The voice saying 'this is stupid' isn't wisdom. It's the bouncer trying to keep the unfamiliar out."
                ),
                
                UjatLesson(
                    id: "uj-7-2",
                    title: "Types of Resistance",
                    content: """
                    Let's map the different forms of resistance you'll encounter:
                    
                    COGNITIVE DISSONANCE
                    
                    When new experiences contradict our existing beliefs about what's possible, it creates actual neurological stress.
                    
                    Your brain experiences this contradiction as a THREAT to its understanding of reality.
                    
                    The stronger your identity as a "logical, rational person," the more intense this dissonance becomes when you encounter experiences that don't fit neat materialist categories.
                    
                    FEAR
                    
                    Fear operates on an even deeper level.
                    
                    The amygdala—your brain's alarm system—doesn't distinguish between physical and psychological threats.
                    
                    When meditation or breathing practices begin shifting your normal state of consciousness, primitive threat detection systems can interpret these unfamiliar internal states as dangerous.
                    
                    You might experience this as:
                    • Sudden anxiety during practice
                    • An urge to open your eyes
                    • Thoughts like "What if I can't get back to normal?"
                    
                    This fear response made perfect sense when our ancestors lived in environments where losing situational awareness meant becoming something's lunch.
                    
                    But in a safe, controlled environment, this same mechanism becomes counterproductive.
                    
                    IMPATIENCE
                    
                    Modern conditioning creates another layer of interference: IMPATIENCE.
                    
                    We live in a culture that promises instant everything—instant communication, instant entertainment, instant results.
                    
                    But neuroplasticity research reveals that meaningful changes in brain structure and function occur over weeks and months, not minutes.
                    
                    SPIRITUAL EGO
                    
                    Perhaps the most subtle form of resistance comes from what I call "spiritual ego."
                    
                    The part of you that wants to feel special or superior because of your practices.
                    
                    This manifests as constantly evaluating your experiences:
                    
                    "Am I having a mystical experience yet?"
                    "Am I more enlightened than I was yesterday?"
                    
                    Paradoxically, this grasping for extraordinary states often PREVENTS the relaxation necessary for genuine development.
                    """,
                    practice: UjatPractice(
                        title: "Identifying Your Resistance",
                        duration: 5,
                        instructions: """
                        Think about the last time you tried a meditation or awareness practice.
                        
                        What stopped you?
                        
                        Was it:
                        • Skepticism? ("This is pseudoscience")
                        • Fear? ("What if something weird happens?")
                        • Impatience? ("Nothing's happening fast enough")
                        • Spiritual ego? ("I should be further along by now")
                        
                        Name your primary resistance pattern.
                        
                        Knowing your pattern is the first step to working with it.
                        """
                    ),
                    keyInsight: "Resistance takes four main forms: cognitive dissonance, fear, impatience, and spiritual ego. Knowing which one you're dealing with helps you respond appropriately.",
                    dragonComment: "Your resistance isn't your enemy. It's just an old security system that doesn't know the war is over."
                ),
                
                UjatLesson(
                    id: "uj-7-3",
                    title: "Working Through It",
                    content: """
                    So how do you work skillfully with these forms of resistance?
                    
                    CURIOUS SKEPTICISM
                    
                    Maintain what I call "curious skepticism."
                    
                    Question your experiences—but question your SKEPTICISM equally.
                    
                    When doubt arises, instead of automatically dismissing subtle experiences, ask better questions:
                    
                    • "What exactly am I experiencing?"
                    • "How can I investigate this more carefully?"
                    
                    This keeps you grounded while remaining open to discovery.
                    
                    DISTINGUISHING FEAR FROM CAUTION
                    
                    Distinguish between legitimate caution and fear-based avoidance by examining your motivations.
                    
                    • Legitimate caution asks practical questions about safety and effectiveness
                    
                    • Fear-based avoidance creates elaborate philosophical arguments for why you shouldn't even try
                    
                    If you find yourself constructing complex theories about why these practices are impossible or dangerous, examine whether FEAR might be driving the analysis.
                    
                    PROCESS OVER OUTCOME
                    
                    Develop patience by understanding that you're literally rewiring your nervous system.
                    
                    Set PROCESS goals rather than OUTCOME goals:
                    
                    Commit to practicing regularly rather than demanding specific experiences.
                    
                    Start with just 5 minutes daily rather than attempting hour-long sessions.
                    
                    Research on habit formation shows that consistency matters more than duration in the early stages.
                    
                    THE EXTINCTION BURST
                    
                    Remember that resistance often intensifies JUST BEFORE BREAKTHROUGH.
                    
                    Psychologists call this the "extinction burst"—when old patterns fight hardest just before they dissolve.
                    
                    If you notice increased skepticism or fear after several days of practice, it might indicate that something significant is shifting beneath conscious awareness.
                    
                    THE GOAL
                    
                    The goal isn't to eliminate your internal opposition committee.
                    
                    These voices serve important protective functions.
                    
                    The goal is to understand their motivations and learn when to listen versus when to proceed despite their concerns.
                    """,
                    practice: nil,
                    keyInsight: "The goal isn't to silence resistance, but to understand it—listening when it offers genuine caution, proceeding when it's just protecting you from the unfamiliar.",
                    dragonComment: "Resistance intensifies just before breakthrough. If it's getting louder, you're probably getting closer."
                )
            ]
        ),
        
        // ═══════════════════════════════════════════════════════════════
        // MODULE 8: THE 7-DAY INTEGRATION
        // ═══════════════════════════════════════════════════════════════
        
        UjatModule(
            id: "seven-day",
            number: 8,
            title: "The 7-Day Integration",
            subtitle: "Building the Neural Foundation",
            icon: "calendar",
            colorHex: "#795548",
            description: "Your brain needs approximately 66 days to automate a new behavior. But the critical window happens in the first 7 days—when your neural pathways are most plastic.",
            lessons: [
                
                UjatLesson(
                    id: "uj-8-1",
                    title: "The Critical Window",
                    content: """
                    Here's the reality about transforming any practice from a weekend experiment into a genuine life skill:
                    
                    Your brain needs approximately 66 days to automate a new behavior.
                    
                    But the CRITICAL WINDOW happens in the first 7 days.
                    
                    This is when your neural pathways are most plastic, most receptive to change, and most vulnerable to abandonment.
                    
                    WHAT HAPPENS IN WEEK ONE
                    
                    Every time you engage the seven breath protocol, you're literally rewiring your prefrontal cortex.
                    
                    Dr. Sara Lazar's Harvard research showed measurable increases in gray matter density after just 8 weeks of contemplative practice.
                    
                    But the foundation gets laid in WEEK ONE:
                    
                    • Your brain starts producing more GABA
                    • Your default mode network begins to quiet
                    • New synaptic connections form between areas that rarely communicate
                    
                    CONSISTENCY OVER INTENSITY
                    
                    But here's what most people miss:
                    
                    Consistency trumps intensity every single time.
                    
                    • 20 minutes of sporadic weekend practice won't create lasting change
                    • 7 minutes daily for seven days WILL rewire your nervous system permanently
                    """,
                    practice: nil,
                    keyInsight: "The first 7 days are the critical window when neural pathways are most plastic. Consistency during this period determines whether the practice becomes permanent.",
                    dragonComment: "Week one builds the foundation. Miss it, and you're building on sand."
                ),
                
                UjatLesson(
                    id: "uj-8-2",
                    title: "The Daily Structure",
                    content: """
                    Let me break down the optimal timing structure—because WHEN you practice matters as much as HOW you practice.
                    
                    MORNING SESSION
                    
                    Should happen within the first hour of waking, ideally BEFORE checking your phone or consuming any media.
                    
                    Why?
                    
                    Your cortisol levels peak naturally around 8 AM, creating a neurochemical environment primed for learning and adaptation.
                    
                    Your brain is in a heightened state of neuroplasticity—ready to encode new patterns.
                    
                    MIDDAY RESET
                    
                    The midday reset serves a different neurological function.
                    
                    Around 1 PM, your attention naturally fragments as adenosine builds up in your system.
                    
                    Instead of reaching for caffeine, this 3-minute breathing protocol acts like a CIRCUIT BREAKER for stress accumulation.
                    
                    You're literally interrupting the sympathetic nervous system's momentum before it cascades into afternoon anxiety or decision fatigue.
                    
                    EVENING PRACTICE
                    
                    Evening practice aligns with your brain's natural preparation for memory consolidation.
                    
                    The theta brain wave states you access through controlled breathing help transfer information from your hippocampus to long-term storage.
                    
                    You're not just relaxing—you're optimizing how your brain processes the day's experiences and integrates new learning.
                    
                    THE WEEKLY SCHEDULE
                    
                    DAY 1-3: Building the habit
                    - Morning: 7-breath protocol (3 min)
                    - Midday: 3 conscious breaths at transition points
                    - Evening: 7-breath protocol (3 min)
                    
                    DAY 4-5: Deepening
                    - Same structure, but notice subtle changes
                    - Track improvements in: sleep, clarity, emotional balance
                    
                    DAY 6-7: Integration
                    - Practice becomes more natural
                    - Start noticing effects throughout day
                    - Resistance typically decreases
                    """,
                    practice: UjatPractice(
                        title: "7-Day Commitment",
                        duration: 0,
                        instructions: """
                        Commit right now to the 7-day protocol:
                        
                        MORNING (within first hour of waking):
                        - 7-breath protocol
                        - Before phone/media
                        
                        MIDDAY (around 1 PM):
                        - 3 conscious breaths
                        - At transition points
                        
                        EVENING (before bed):
                        - 7-breath protocol
                        - Help process the day
                        
                        Set reminders in your phone.
                        Track completion daily.
                        
                        After 7 days, the neural foundation is built.
                        """
                    ),
                    keyInsight: "Morning practice leverages peak neuroplasticity, midday practice interrupts stress accumulation, and evening practice optimizes memory consolidation. Timing matters.",
                    dragonComment: "3 minutes, 3 times a day, 7 days. That's the formula. No excuses."
                ),
                
                UjatLesson(
                    id: "uj-8-3",
                    title: "Tracking Progress",
                    content: """
                    Now let's talk about tracking progress objectively.
                    
                    Because subjective impressions lie.
                    
                    Your mind will play tricks, create false narratives, or dismiss genuine changes as coincidence.
                    
                    OBJECTIVE MEASURES
                    
                    Instead, measure what matters:
                    
                    HEART RATE VARIABILITY
                    Using any decent fitness tracker. HRV reflects your autonomic nervous system's flexibility.
                    
                    Within 5 days of consistent practice, you should see measurable improvements.
                    
                    SLEEP EFFICIENCY
                    Through your phone's built-in health app. Notice:
                    • How quickly you fall asleep
                    • How often you wake during the night
                    • How refreshed you feel upon waking
                    
                    The breathing protocol directly impacts your vagus nerve, which governs your body's transition into restorative sleep states.
                    
                    DECISION-MAKING CLARITY
                    Keep a simple daily log. Rate your ability to make clear choices on a scale of 1-10.
                    
                    Notice patterns around when you feel most decisive versus when you experience analysis paralysis.
                    
                    EMOTIONAL REACTIVITY
                    • How quickly do you recover from frustration?
                    • How intense are your stress responses to minor inconveniences?
                    
                    The practice creates what researchers call "emotional granularity"—your ability to distinguish between subtle emotional states and respond appropriately rather than reactively.
                    
                    WHAT TO EXPECT
                    
                    Your experiences will fluctuate wildly during the first week:
                    
                    • Monday might feel profound
                    • Tuesday boring
                    • Wednesday frustrating
                    
                    This variability reflects individual differences in nervous system sensitivity and current stress levels—NOT the effectiveness of the practice.
                    
                    Consistency during this fluctuation period determines whether the practice becomes sustainable or gets abandoned.
                    """,
                    practice: nil,
                    keyInsight: "Track objective measures (HRV, sleep, decision clarity, emotional reactivity) rather than subjective impressions—your mind will try to dismiss real changes as coincidence.",
                    dragonComment: "Don't trust your feelings about whether it's working. Trust the data."
                )
            ]
        ),
        
        // ═══════════════════════════════════════════════════════════════
        // MODULE 9: LONG-TERM INTEGRATION
        // ═══════════════════════════════════════════════════════════════
        
        UjatModule(
            id: "long-term",
            number: 9,
            title: "Long-Term Integration",
            subtitle: "From Practice to Presence",
            icon: "infinity",
            colorHex: "#607D8B",
            description: "The real transformation begins when you stop thinking of enhanced perception as something you practice and start recognizing it as something you simply are.",
            lessons: [
                
                UjatLesson(
                    id: "uj-9-1",
                    title: "When Practice Becomes Natural",
                    content: """
                    The real transformation begins when you stop thinking of enhanced perception as something you PRACTICE and start recognizing it as something you simply ARE.
                    
                    BASELINE SHIFT
                    
                    After working with the Ujat Code for several weeks, most people notice they're not consciously activating anything anymore.
                    
                    The heightened awareness has become their baseline.
                    
                    A REAL EXAMPLE
                    
                    Sarah, a marketing director I worked with, described it perfectly:
                    
                    "I walked into a client meeting last month and immediately sensed the tension between two department heads. Not from what they said—they were perfectly professional—but from the quality of silence when they looked at each other, the micro-expressions, the way energy shifted in the room.
                    
                    Six months ago, I would have bulldozed ahead with my presentation. Instead, I acknowledged the elephant in the room, facilitated a brief discussion about their concerns, and ended up with a much stronger partnership because they felt heard."
                    
                    THE FULLER HUMAN
                    
                    This is what integration looks like in practice.
                    
                    Enhanced perception doesn't make you psychic. It makes you HUMAN in the fullest sense.
                    
                    You start picking up on the information that was always there, but that your overstimulated nervous system had learned to filter out.
                    
                    TRAIT CHANGES VS. STATE CHANGES
                    
                    The real power emerges with consistency.
                    
                    Daily practice creates what neuroscientists call TRAIT CHANGES versus just STATE CHANGES.
                    
                    Instead of only feeling different during the seven breaths, your baseline nervous system function begins to shift.
                    
                    Your default mode becomes more balanced, resilient, and perceptive.
                    """,
                    practice: nil,
                    keyInsight: "Integration means enhanced perception becomes your baseline—not something you do, but something you are.",
                    dragonComment: "The goal isn't to feel special during practice. It's to become more fully present in ordinary life."
                ),
                
                UjatLesson(
                    id: "uj-9-2",
                    title: "Practical Applications",
                    content: """
                    Research from Harvard's Center for Mindfulness shows that people with contemplative practices demonstrate:
                    
                    • Measurably improved emotional intelligence
                    • Better conflict resolution skills
                    • Enhanced leadership capabilities
                    
                    But the studies don't capture the subtler changes that matter most in daily life.
                    
                    RELATIONSHIPS
                    
                    Like how you'll notice your teenager's mood shift before they slam their bedroom door—giving you a chance to connect rather than react.
                    
                    Or how you'll sense when a colleague is struggling beneath their professional facade and offer support before they burn out.
                    
                    DECISION-MAKING
                    
                    The decision-making changes are particularly striking.
                    
                    When your nervous system isn't constantly in low-level fight-or-flight mode, you have access to more sophisticated cognitive resources.
                    
                    You start making choices from CLARITY rather than REACTIVITY:
                    
                    • That job offer that looks perfect on paper but feels wrong in your gut? You trust the feeling and discover later that the company culture was toxic.
                    
                    • The investment opportunity that triggers subtle anxiety despite the impressive projections? You pass and watch it collapse 6 months later.
                    
                    PROFESSIONAL APPLICATIONS
                    
                    The professional applications extend far beyond improved people skills:
                    
                    • ENTREPRENEURS describe having better instincts about market timing—sensing when consumer sentiment is shifting before the data reflects it
                    
                    • HEALTHCARE PROVIDERS report enhanced diagnostic intuition—picking up on subtle patterns that guide them toward the right questions
                    
                    • TEACHERS notice learning difficulties earlier—adapting their approach before students fall behind
                    
                    One surgeon I know credits his contemplative practice with dramatically improving his surgical outcomes.
                    
                    Not because meditation makes his hands steadier (though it might)—but because enhanced body awareness allows him to sense tissue quality, tension, and healing potential in ways that complement his technical training.
                    """,
                    practice: nil,
                    keyInsight: "Enhanced perception improves everything—relationships, decisions, professional performance—not through supernatural abilities but through optimized natural intelligence.",
                    dragonComment: "This isn't about becoming special. It's about becoming effective."
                ),
                
                UjatLesson(
                    id: "uj-9-3",
                    title: "The Doorway",
                    content: """
                    Remember this:
                    
                    Enhanced perception isn't a destination—it's a DOORWAY.
                    
                    Each level of awareness reveals new depths of learning and service.
                    
                    The practice doesn't create a sense of arrival, but an ongoing sense of possibility.
                    
                    GENUINE PROGRESS
                    
                    Genuine progress reveals itself through DECREASED REACTIVITY rather than increased bliss.
                    
                    You'll notice:
                    
                    • Space between stimulus and response
                    • Clarity during complex decisions
                    • Physical tension releasing without conscious effort
                    
                    These changes emerge gradually, then suddenly feel natural.
                    
                    ORGANIC EVOLUTION
                    
                    The practice evolves organically:
                    
                    • Initial concentration gives way to effortless awareness
                    • Benefits extend beyond formal sessions into spontaneous moments of clarity during conversations
                    • Creative insights emerge during mundane tasks
                    • Intuitive knowing surfaces during important decisions
                    
                    YOUR TRUE NATURE
                    
                    You're not developing these capacities to become special or enlightened.
                    
                    You're reclaiming natural human abilities that allow you to engage more effectively and compassionately with whatever life presents.
                    
                    The inner eye opens not to see other worlds—but to see THIS world more clearly.
                    
                    THE INVITATION
                    
                    Start tomorrow morning.
                    
                    Set your alarm 7 minutes earlier.
                    
                    Your future self will thank you for this decision.
                    
                    The 7-day protocol isn't preparation for the real practice.
                    
                    It IS the real practice—compressed into its most essential form.
                    """,
                    practice: UjatPractice(
                        title: "Your Commitment",
                        duration: 0,
                        instructions: """
                        Make your commitment now:
                        
                        "For the next 7 days, I will practice the 7-breath protocol:
                        
                        - Morning (within first hour of waking)
                        - Midday (at transition point)
                        - Evening (before bed)
                        
                        I will track my progress objectively.
                        I will persist through resistance.
                        I will trust the process."
                        
                        Set your alarms now.
                        Begin tomorrow.
                        
                        The inner eye is ready to open.
                        """
                    ),
                    keyInsight: "Enhanced perception isn't about seeing other worlds—it's about seeing this world clearly. The inner eye opens to reveal what was always there.",
                    dragonComment: "The practice never ends. It just becomes who you are."
                )
            ]
        )
    ]
    
    
    // MARK: - Dragon Introduction
    
    static let dragonIntro = """
    Seeker, the Eye of Horus isn't mystical decoration.
    
    It's a training manual.
    
    The Egyptians encoded techniques for developing enhanced perception—the same abilities you were born with but trained to ignore.
    
    That gut feeling before making a decision? That's your enteric nervous system—500 million neurons processing data your conscious mind can't access.
    
    That instant knowing about a person? That's your mirror neurons detecting micro-expressions in milliseconds.
    
    You already have these abilities. You just forgot how to use them.
    
    Let's remember together.
    """
}


// MARK: - Supporting Types

struct UjatModule: Identifiable {
    let id: String
    let number: Int
    let title: String
    let subtitle: String
    let icon: String
    let colorHex: String
    let description: String
    let lessons: [UjatLesson]
    
    var color: Color {
        Color(hex: colorHex)
    }
    
    var lessonCount: Int {
        lessons.count
    }
}


struct UjatLesson: Identifiable {
    let id: String
    let title: String
    let content: String
    let practice: UjatPractice?
    let keyInsight: String
    let dragonComment: String
    
    var hasPractice: Bool {
        practice != nil
    }
}


struct UjatPractice: Identifiable {
    let id = UUID()
    let title: String
    let duration: Int // 0 = ongoing
    let instructions: String
    
    var durationText: String {
        if duration == 0 {
            return "Ongoing"
        } else {
            return "\(duration) min"
        }
    }
}
