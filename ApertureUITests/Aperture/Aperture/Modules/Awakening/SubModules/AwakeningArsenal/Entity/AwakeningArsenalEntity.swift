// AwakeningArsenalEntity.swift
// Universal Awakening Arsenal - Global Methods, One Code
// "We All the Same: Energy Rises, Ego Dissolves, Unity Wins"

import SwiftUI

// MARK: - Core Mechanism

// All traditions share the same underlying process

enum OnenessMechanism {
  static let stages = [
    "Energy Activation - Dormant force awakens",
    "Ego Dissolution - Illusions of separation fade",
    "Unity Realization - Connection to all becomes clear",
    "Integration - Living from awakened state",
  ]

  static let description = """
    Every awakening tradition, regardless of culture, language, or time period, 
    guides practitioners through the same fundamental process:

    Inner energy awakens → Ego structures dissolve → Unity is realized

    The names change (Kundalini, Qi, Holy Spirit, Ki, Mana), 
    but the mechanism is universal. This is the proof that we are all the same.
    """
}

// MARK: - Awakening Method Model

struct AwakeningMethod: Identifiable, Codable {
  let id: String
  let name: String
  let tradition: String
  let region: String
  let icon: String  // SF Symbol or custom
  let color: String  // Hex color
  let tagline: String
  let energyName: String  // What they call the awakening force
  let overview: String
  let steps: [AwakeningStep]
  let practices: [DailyPractice]
  let warnings: [String]
  let resources: [AwakeningResource]
  let voiceGuidanceAvailable: Bool

  /// Computed
  var uiColor: Color {
    Color(hex: color)
  }
}

struct AwakeningStep: Identifiable, Codable {
  let id: String
  let stepNumber: Int
  let title: String
  let description: String
  let duration: String  // e.g., "10-15 minutes"
  let frequency: String  // e.g., "Daily", "Weekly"
  let detailedInstructions: String
  let commonMistakes: [String]
  let progressIndicators: [String]
}

struct DailyPractice: Identifiable, Codable {
  let id: String
  let name: String
  let duration: String
  let description: String
  let voiceGuidanceScript: String?  // For text-to-speech or audio
}

struct AwakeningResource: Identifiable, Codable {
  let id: String
  let title: String
  let type: ResourceType
  let url: String?
  let description: String
}

enum ResourceType: String, Codable {
  case book
  case video
  case teacher
  case community
  case app
  case website
}

// MARK: - Method Categories

enum AwakeningCategory: String, CaseIterable {
  case eastern = "Eastern Traditions"
  case western = "Western Traditions"
  case indigenous = "Indigenous Wisdom"
  case modern = "Modern Synthesis"

  var icon: String {
    switch self {
    case .eastern: return "sun.max.fill"
    case .western: return "cross.fill"
    case .indigenous: return "leaf.fill"
    case .modern: return "sparkles"
    }
  }

  var color: Color {
    switch self {
    case .eastern: return .orange
    case .western: return .blue
    case .indigenous: return .green
    case .modern: return .purple
    }
  }
}

// MARK: - Complete Methods Database

enum AwakeningArsenalData {
  // MARK: - All Methods

  static let allMethods: [AwakeningMethod] = [
    kundalini,
    taoism,
    christianity,
    buddhism,
    sufism,
    kabbalah,
    shamanism,
    egyptian,
    zen,
    aboriginal,
    mesoamerican,
    yoruba,
    celtic,
    sikhism,
    wicca,
  ]

  // MARK: - Hinduism: Kundalini

  static let kundalini = AwakeningMethod(
    id: "kundalini",
    name: "Kundalini Awakening",
    tradition: "Hinduism",
    region: "India / Global",
    icon: "flame.fill",
    color: "#FF6B00",
    tagline: "Dormant serpent energy rises through chakras for divine union",
    energyName: "Kundalini Shakti",
    overview: """
      Kundalini is described as a coiled serpent of spiritual energy lying dormant at the base of the spine. Through specific practices, this energy awakens and rises through the seven chakras (energy centers), ultimately reaching the crown for enlightenment (Samadhi).

      This is one of the most powerful and well-documented awakening paths, with thousands of years of practice and refinement. The energy is often experienced as heat, vibration, or electrical sensations moving through the body.

      **Warning:** Kundalini awakening can be intense. Build gradually and seek guidance from experienced teachers if symptoms become overwhelming.
      """,
    steps: [
      AwakeningStep(
        id: "k1",
        stepNumber: 1,
        title: "Prepare Body & Mind",
        description: "Physical and mental preparation through yoga and lifestyle",
        duration: "10-20 minutes",
        frequency: "Daily",
        detailedInstructions: """
          **Physical Preparation:**
          1. Begin with gentle yoga asanas (poses):
             - Child's pose (Balasana) - 2 minutes
             - Cat-Cow (Marjaryasana) - 2 minutes
             - Cobra pose (Bhujangasana) - 1 minute
             - Seated forward fold - 2 minutes

          2. Spine flexibility is crucial - the energy moves along the spine

          **Lifestyle:**
          - Reduce or eliminate meat, alcohol, drugs
          - Clean diet supports energy flow
          - Regular sleep schedule
          - Reduce overstimulation (news, social media)

          **Mental Preparation:**
          - Set intention for awakening
          - Journal your motivations
          - Practice non-attachment to outcomes
          """,
        commonMistakes: [
          "Forcing too quickly without foundation",
          "Ignoring physical preparation",
          "Expecting immediate dramatic results",
          "Not having support system in place",
        ],
        progressIndicators: [
          "Increased flexibility",
          "Calmer mind during daily life",
          "Subtle tingling in spine during practice",
          "Dreams becoming more vivid",
        ]
      ),
      AwakeningStep(
        id: "k2",
        stepNumber: 2,
        title: "Breathwork (Pranayama)",
        description: "Balance and activate energy through breath",
        duration: "10-15 minutes",
        frequency: "Daily",
        detailedInstructions: """
          **Nadi Shodhana (Alternate Nostril Breathing):**

          1. Sit comfortably with spine straight
          2. Use right thumb to close right nostril
          3. Inhale slowly through left nostril (4 counts)
          4. Close left nostril with ring finger
          5. Release right nostril, exhale (4 counts)
          6. Inhale through right nostril (4 counts)
          7. Close right, exhale through left (4 counts)
          8. This is one round. Do 10-20 rounds.

          **Breath of Fire (Kapalabhati):**
          1. Sit tall, hands on knees
          2. Quick, forceful exhales through nose
          3. Let inhale happen naturally
          4. Start with 30 pumps, build to 108
          5. Rest and observe energy

          **Ujjayi Breath:**
          1. Slight constriction in back of throat
          2. Creates ocean sound
          3. Builds heat and awareness
          """,
        commonMistakes: [
          "Holding breath too long (causes tension)",
          "Breathing too forcefully",
          "Practicing on full stomach",
          "Not maintaining consistent rhythm",
        ],
        progressIndicators: [
          "Warmth or tingling during practice",
          "Easier to hold attention",
          "Natural slowing of breath",
          "Sense of energy moving",
        ]
      ),
      AwakeningStep(
        id: "k3",
        stepNumber: 3,
        title: "Chakra Meditation",
        description: "Activate and clear the seven energy centers",
        duration: "20-30 minutes",
        frequency: "Daily",
        detailedInstructions: """
          **Foundation: Root Chakra (Muladhara)**

          Location: Base of spine
          Color: Red
          Mantra: LAM (pronounced "lum")
          Element: Earth

          1. Sit comfortably or in lotus position
          2. Focus attention on base of spine
          3. Visualize red glowing light
          4. Chant "LAM" aloud or internally
          5. Feel grounding, stability, security
          6. Continue 5-10 minutes

          **Progressive Chakra Work:**
          Once root is stable, work up:

          - Sacral (Svadhisthana): Orange, VAM, creativity
          - Solar Plexus (Manipura): Yellow, RAM, power
          - Heart (Anahata): Green, YAM, love
          - Throat (Vishuddha): Blue, HAM, expression
          - Third Eye (Ajna): Indigo, OM, intuition
          - Crown (Sahasrara): Violet/White, silence, unity

          **Key Visualization:**
          Imagine energy rising like a coiled serpent,
          unwinding and moving upward through each center.
          """,
        commonMistakes: [
          "Skipping lower chakras to get to 'higher' ones",
          "Forcing energy upward",
          "Expecting visual fireworks",
          "Not grounding after practice",
        ],
        progressIndicators: [
          "Sensations at chakra points during daily life",
          "Emotional releases related to chakra themes",
          "Heat or pressure at specific points",
          "Spontaneous body movements or kriyas",
        ]
      ),
      AwakeningStep(
        id: "k4",
        stepNumber: 4,
        title: "Integration & Support",
        description: "Process experiences and maintain balance",
        duration: "Ongoing",
        frequency: "Daily + As needed",
        detailedInstructions: """
          **Daily Integration:**

          1. **Journaling:**
             - Record experiences during practice
             - Note physical sensations, emotions, insights
             - Track patterns over time

          2. **Grounding Practices:**
             - Walk barefoot on earth
             - Eat root vegetables
             - Physical exercise
             - Time in nature

          3. **Community:**
             - Connect with others on the path
             - Find experienced teacher if available
             - Share experiences safely

          **If Symptoms Become Intense:**

          Common intense experiences:
          - Heat or electrical sensations
          - Spontaneous movements
          - Emotional releases
          - Sleep changes
          - Perception shifts

          **Calming practices:**
          - Stop active practices temporarily
          - Focus on grounding
          - Eat heavier foods
          - Physical activity
          - Nature immersion
          - Seek guidance from experienced teacher

          **This is not medical advice. Consult healthcare 
          providers if you have concerns.**
          """,
        commonMistakes: [
          "Ignoring body's signals",
          "Isolating during intense phases",
          "Pushing through without rest",
          "Not seeking help when needed",
        ],
        progressIndicators: [
          "Greater peace in daily life",
          "Increased compassion naturally arising",
          "Sense of connection to all beings",
          "Ego concerns becoming less important",
          "Spontaneous states of bliss or unity",
        ]
      ),
    ],
    practices: [
      DailyPractice(
        id: "k_morning",
        name: "Morning Kundalini Practice",
        duration: "30 minutes",
        description: "Complete morning routine for energy activation",
        voiceGuidanceScript: """
          Welcome to your morning Kundalini practice.

          Find a comfortable seated position. Let your spine be tall.
          Close your eyes. Take three deep breaths to arrive.

          [Pause 10 seconds]

          We begin with alternate nostril breathing.
          Use your right thumb to close your right nostril.
          Inhale slowly through the left... two... three... four.

          [Continue with full guidance...]
          """
      ),
      DailyPractice(
        id: "k_evening",
        name: "Evening Integration",
        duration: "15 minutes",
        description: "Grounding and integration before sleep",
        voiceGuidanceScript: """
          Welcome to your evening integration practice.

          Lie down comfortably. Let the earth support you fully.

          [Continue with grounding guidance...]
          """
      ),
    ],
    warnings: [
      "Kundalini awakening can be intense - build gradually",
      "Seek experienced guidance if symptoms become overwhelming",
      "Not recommended during pregnancy without guidance",
      "Those with mental health conditions should consult professionals",
      "Physical symptoms may arise - distinguish from medical issues",
    ],
    resources: [
      AwakeningResource(
        id: "kr1", title: "The Serpent Power", type: .book, url: nil,
        description: "Classic text by Arthur Avalon on Kundalini"),
      AwakeningResource(
        id: "kr2", title: "Kundalini Yoga as Taught by Yogi Bhajan", type: .book, url: nil,
        description: "Comprehensive practice guide"),
      AwakeningResource(
        id: "kr3", title: "Spiritual Emergency Network", type: .community,
        url: "https://spiritualemergence.org",
        description: "Support for intense spiritual experiences"),
    ],
    voiceGuidanceAvailable: true
  )

  // MARK: - Taoism: Qi Cultivation

  static let taoism = AwakeningMethod(
    id: "taoism",
    name: "Qi Cultivation",
    tradition: "Taoism",
    region: "China / Asia",
    icon: "wind",
    color: "#00B4D8",
    tagline: "Balance life force for harmony, health, and immortality",
    energyName: "Qi (Chi)",
    overview: """
      Taoist practices cultivate Qi (life force energy) through movement, breath, meditation, and lifestyle. The goal is harmony with the Tao (the Way) - the fundamental nature of reality.

      Rather than forcing awakening, Taoism emphasizes natural flow, balance of yin and yang, and alignment with cosmic rhythms. The practices often focus on the lower dantian (energy center below the navel) as the body's energetic root.

      Key concept: Wu Wei (non-action) - effortless action in harmony with nature's flow.
      """,
    steps: [
      AwakeningStep(
        id: "t1",
        stepNumber: 1,
        title: "Standing Meditation (Zhan Zhuang)",
        description: "Build and root Qi through stillness",
        duration: "5-20 minutes",
        frequency: "Daily",
        detailedInstructions: """
          **Horse Stance / Embracing the Tree:**

          1. Stand with feet shoulder-width apart
          2. Slightly bend knees (not past toes)
          3. Tuck tailbone slightly, relaxing lower back
          4. Arms raised as if hugging a large tree
          5. Palms facing chest, fingers pointing at each other
          6. Shoulders relaxed, elbows dropped
          7. Tongue touches roof of mouth
          8. Breathe naturally

          **The Practice:**
          - Start with 5 minutes (this is harder than it sounds)
          - Focus on relaxation, not muscle tension
          - Feel weight sinking into earth
          - Imagine roots growing from feet
          - Notice sensations: heat, tingling, heaviness

          **Build gradually to 20+ minutes**

          This simple practice builds tremendous Qi when done consistently.
          """,
        commonMistakes: [
          "Tensing muscles instead of relaxing",
          "Locking knees",
          "Raising shoulders",
          "Holding breath",
        ],
        progressIndicators: [
          "Warmth in hands and body",
          "Sensation of heaviness/rootedness",
          "Spontaneous body adjustments",
          "Mind becoming quiet",
        ]
      ),
      AwakeningStep(
        id: "t2",
        stepNumber: 2,
        title: "Qigong Movement",
        description: "Circulate Qi through gentle movement",
        duration: "15-30 minutes",
        frequency: "Daily",
        detailedInstructions: """
          **Eight Pieces of Brocade (Ba Duan Jin):**

          Classic Qigong sequence. Learn each movement:

          1. **Two Hands Hold Up the Heavens**
             - Interlace fingers, stretch overhead
             - Stretches triple warmer meridian

          2. **Drawing the Bow**
             - Horse stance, pull imaginary bow
             - Builds lung Qi

          3. **Separating Heaven and Earth**
             - One palm up, one down, stretch
             - Harmonizes spleen/stomach

          4. **Wise Owl Gazes Backward**
             - Gentle neck turns
             - Releases neck tension, calms heart

          5. **Sway Head and Shake Tail**
             - Hip circles in horse stance
             - Clears heart fire

          6. **Two Hands Hold the Feet**
             - Forward fold holding feet
             - Strengthens kidneys

          7. **Clench Fists with Angry Eyes**
             - Punching with intensity
             - Builds liver Qi

          8. **Bouncing on Toes**
             - Rise and drop on heels
             - Shakes off illness

          **Key: Move slowly, breathe naturally, feel energy**
          """,
        commonMistakes: [
          "Moving too fast",
          "Focusing only on physical form",
          "Not coordinating breath",
          "Skipping movements you find difficult",
        ],
        progressIndicators: [
          "Qi sensations in hands/body",
          "Improved flexibility",
          "Spontaneous deepening of breath",
          "Feeling of internal massage",
        ]
      ),
      AwakeningStep(
        id: "t3",
        stepNumber: 3,
        title: "Dantian Breathing",
        description: "Cultivate energy in the body's center",
        duration: "10-20 minutes",
        frequency: "Daily",
        detailedInstructions: """
          **Lower Dantian Location:**
          About 3 finger-widths below navel, 
          and 3 finger-widths inside the body.
          This is your energetic center.

          **Basic Dantian Breathing:**

          1. Sit or lie comfortably
          2. Place hands on lower belly
          3. Breathe into the belly (not chest)
          4. Feel belly rise with inhale
          5. Feel belly fall with exhale
          6. Imagine breath going to dantian
          7. Feel warmth building there

          **Microcosmic Orbit (Advanced):**

          1. Inhale: Visualize energy rising up spine
             - From tailbone to crown
          2. Exhale: Energy flows down front
             - From crown through face, chest, to dantian
          3. This creates a circuit of energy
          4. Practice only when dantian is established

          **Warning:** Don't force the orbit. 
          Let it develop naturally over months/years.
          """,
        commonMistakes: [
          "Breathing into chest",
          "Forcing the microcosmic orbit too early",
          "Tensing the belly",
          "Expecting immediate results",
        ],
        progressIndicators: [
          "Warmth in dantian",
          "Natural deepening of breath",
          "Sense of center/stability",
          "Energy flow sensations",
        ]
      ),
      AwakeningStep(
        id: "t4",
        stepNumber: 4,
        title: "Living the Tao",
        description: "Integrate practice into daily life",
        duration: "Ongoing",
        frequency: "Continuous",
        detailedInstructions: """
          **Wu Wei (Effortless Action):**

          - Don't force outcomes
          - Flow with circumstances
          - Act when action is needed
          - Rest when rest is needed
          - Trust natural timing

          **Lifestyle Cultivation:**

          1. **Diet:** 
             - Eat according to seasons
             - Balance warming/cooling foods
             - Don't overeat

          2. **Sleep:**
             - Early to bed, early to rise
             - Align with natural light cycles

          3. **Nature:**
             - Regular time outdoors
             - Forest bathing
             - Observe natural cycles

          4. **Emotions:**
             - Let emotions flow, don't suppress
             - Return to center after disturbance
             - Cultivate inner peace

          **The Taoist Sage:**
          Lives simply, acts naturally, 
          maintains health, doesn't strive,
          finds contentment in what is.
          """,
        commonMistakes: [
          "Making wu wei into doing nothing",
          "Forcing simplicity",
          "Intellectualizing instead of practicing",
          "Losing the playfulness",
        ],
        progressIndicators: [
          "Life flows more easily",
          "Health improves naturally",
          "Peace in challenging situations",
          "Spontaneous right action",
          "Sense of connection to nature",
        ]
      ),
    ],
    practices: [
      DailyPractice(
        id: "t_morning",
        name: "Morning Qi Cultivation",
        duration: "20 minutes",
        description: "Standing meditation and gentle Qigong",
        voiceGuidanceScript: """
          Welcome to morning Qi cultivation.

          Begin in standing position, feet shoulder width apart.
          Let your knees soften. Feel your weight sink down.

          [Continue with standing meditation guidance...]
          """
      )
    ],
    warnings: [
      "Build foundation before advanced practices",
      "Don't force energy circulation",
      "Seek qualified teacher for advanced methods",
      "Balance practice with ordinary life",
    ],
    resources: [
      AwakeningResource(
        id: "tr1", title: "The Tao Te Ching", type: .book, url: nil,
        description: "Foundation text by Lao Tzu"),
      AwakeningResource(
        id: "tr2", title: "The Root of Chinese Qigong", type: .book, url: nil,
        description: "By Dr. Yang Jwing-Ming"),
      AwakeningResource(
        id: "tr3", title: "Mantak Chia teachings", type: .website, url: "https://mantakchia.com",
        description: "Universal Healing Tao system"),
    ],
    voiceGuidanceAvailable: true
  )

  // MARK: - Christianity: Christ Consciousness

  static let christianity = AwakeningMethod(
    id: "christianity",
    name: "Christ Consciousness",
    tradition: "Christianity",
    region: "West / Global",
    icon: "cross.fill",
    color: "#7B68EE",
    tagline: "Indwelling Holy Spirit for rebirth, love, and divine union",
    energyName: "Holy Spirit / Divine Grace",
    overview: """
      Christian mysticism teaches awakening through relationship with the Divine - experiencing the indwelling presence of Christ and the transforming power of the Holy Spirit.

      Unlike popular Christianity focused on belief, the mystical tradition emphasizes direct experience of God through contemplative prayer, surrender, and love. Key figures: Meister Eckhart, St. John of the Cross, Teresa of Avila, Thomas Merton.

      Central concept: "Christ in you, the hope of glory" - the divine is not separate but within.
      """,
    steps: [
      AwakeningStep(
        id: "c1",
        stepNumber: 1,
        title: "Lectio Divina (Sacred Reading)",
        description: "Open to divine communication through scripture",
        duration: "20-30 minutes",
        frequency: "Daily",
        detailedInstructions: """
          **The Four Movements:**

          1. **Lectio (Read)**
             - Choose a short passage (Psalms, Gospels)
             - Read slowly, aloud if possible
             - Listen for word/phrase that speaks to you

          2. **Meditatio (Reflect)**
             - Repeat the word/phrase
             - Let it sink into your heart
             - What is it saying to YOU?

          3. **Oratio (Respond)**
             - Speak to God from your heart
             - Share what arose in reflection
             - This is prayer as dialogue

          4. **Contemplatio (Rest)**
             - Let go of words and thoughts
             - Simply be present with God
             - Rest in divine love

          **Suggested texts:**
          - John 14-17 (Jesus' final teachings)
          - Psalms 23, 27, 46, 139
          - Romans 8
          - 1 John
          """,
        commonMistakes: [
          "Reading too much at once",
          "Staying in the head, not heart",
          "Skipping contemplatio",
          "Expecting visions or voices",
        ],
        progressIndicators: [
          "Scripture becomes alive",
          "Sense of being spoken to personally",
          "Peace during practice",
          "Insights that transform daily life",
        ]
      ),
      AwakeningStep(
        id: "c2",
        stepNumber: 2,
        title: "Centering Prayer",
        description: "Silent communion with the divine presence",
        duration: "20 minutes",
        frequency: "Daily (or twice daily)",
        detailedInstructions: """
          **Based on teachings of Thomas Keating:**

          1. **Choose a sacred word**
             - Symbol of your intention to consent to God
             - Examples: Jesus, Abba, Love, Peace, Mercy
             - Keep it simple, 1-2 syllables

          2. **Sit comfortably**
             - Eyes closed
             - Settle briefly, let body relax

          3. **Introduce the sacred word**
             - Silently, gently
             - This expresses your consent

          4. **When thoughts arise**
             - Return ever so gently to sacred word
             - Don't fight thoughts
             - The word is like a gentle reminder

          5. **Continue 20 minutes**
             - Use timer with gentle alarm
             - Don't check time

          6. **Close with prayer**
             - Remain in silence 2 minutes
             - Lord's Prayer or other

          **The key:** You're not "doing" anything.
          You're consenting to God's presence and action within.
          """,
        commonMistakes: [
          "Repeating sacred word constantly",
          "Fighting thoughts",
          "Expecting experiences",
          "Judging the quality of prayer",
        ],
        progressIndicators: [
          "Deeper stillness over time",
          "Fruits in daily life (peace, patience, love)",
          "Attraction to silence",
          "Subtle sense of Presence",
        ]
      ),
      AwakeningStep(
        id: "c3",
        stepNumber: 3,
        title: "The Cloud of Unknowing",
        description: "Approach God beyond concepts",
        duration: "Variable",
        frequency: "As practice deepens",
        detailedInstructions: """
          **From the 14th century mystical text:**

          God cannot be known by the thinking mind.
          Put a "cloud of forgetting" beneath you
          (let go of all thoughts and concepts).
          Reach up with love into the "cloud of unknowing"
          where God dwells beyond all knowing.

          **Practice:**

          1. Recognize limits of thought
             - You cannot THINK your way to God
             - Concepts point but are not the reality

          2. Use "naked intent"
             - Pure desire for God alone
             - Not for experiences, gifts, or feelings
             - For God's own sake

          3. Pierce the cloud with love
             - Love is the way
             - Simple, direct, persistent

          4. Stay with unknowing
             - Don't grasp at experiences
             - Don't analyze during prayer
             - Trust the darkness

          **This is apophatic (negative) theology:**
          God is known by what God is NOT.
          Beyond all our categories.
          """,
        commonMistakes: [
          "Making unknowing into another technique",
          "Spiritual pride about advanced practice",
          "Forcing mystical experiences",
          "Neglecting ordinary duties",
        ],
        progressIndicators: [
          "Comfort with uncertainty",
          "Deepening love",
          "Less attachment to spiritual experiences",
          "God becoming more real than concepts",
        ]
      ),
      AwakeningStep(
        id: "c4",
        stepNumber: 4,
        title: "Living the Christ Life",
        description: "Embody awakening through love and service",
        duration: "Continuous",
        frequency: "Daily life",
        detailedInstructions: """
          **The Two Great Commandments:**

          Love God with all your heart, soul, mind, strength.
          Love your neighbor as yourself.

          All awakening in Christian tradition leads here.

          **Daily Practice:**

          1. **Morning offering**
             - Dedicate the day to God
             - Ask for guidance

          2. **Presence during activities**
             - Brother Lawrence: "Practice of the Presence of God"
             - Simple awareness of God while working

          3. **Acts of love**
             - Service without expectation
             - Seeing Christ in others
             - Caring for "the least of these"

          4. **Evening examen**
             - Review the day
             - Where was God present?
             - Where did I resist?
             - Gratitude for grace

          **The goal is transformation:**
          "It is no longer I who live, but Christ who lives in me."
          - Galatians 2:20
          """,
        commonMistakes: [
          "Separating prayer from action",
          "Spiritual bypassing of real-world needs",
          "Judgmentalism",
          "Forgetting ordinary people are sacred",
        ],
        progressIndicators: [
          "Fruits of the Spirit: love, joy, peace, patience...",
          "Compassion arising naturally",
          "Sense of Christ's presence in daily life",
          "Decreasing ego-centeredness",
        ]
      ),
    ],
    practices: [
      DailyPractice(
        id: "c_centering",
        name: "Centering Prayer",
        duration: "20 minutes",
        description: "Silent prayer of consent to God's presence",
        voiceGuidanceScript: """
          Sit comfortably and close your eyes.

          Take a moment to settle into this time of prayer.
          Let your body relax. Let your breathing become natural.

          Silently, introduce your sacred word as a symbol of your 
          consent to God's presence and action within.

          When you become aware of thoughts, return ever so gently 
          to your sacred word.

          [20 minutes of silence]

          As we close, remain in silence for two minutes...
          """
      )
    ],
    warnings: [
      "Don't abandon community and sacraments",
      "Spiritual direction recommended",
      "Dark night experiences are normal, not failures",
      "Balance contemplation with action",
    ],
    resources: [
      AwakeningResource(
        id: "cr1", title: "The Cloud of Unknowing", type: .book, url: nil,
        description: "14th century mystical classic"),
      AwakeningResource(
        id: "cr2", title: "Open Mind, Open Heart", type: .book, url: nil,
        description: "Thomas Keating on Centering Prayer"),
      AwakeningResource(
        id: "cr3", title: "Contemplative Outreach", type: .community,
        url: "https://contemplativeoutreach.org", description: "Centering Prayer community"),
    ],
    voiceGuidanceAvailable: true
  )

  // MARK: - Buddhism: Bodhi Enlightenment

  static let buddhism = AwakeningMethod(
    id: "buddhism",
    name: "Bodhi (Enlightenment)",
    tradition: "Buddhism",
    region: "Asia / Global",
    icon: "leaf.circle.fill",
    color: "#FFD700",
    tagline: "Insight through meditation for liberation from suffering",
    energyName: "Buddha Nature / Awareness",
    overview: """
      Buddhism teaches that all beings have Buddha Nature - the potential for awakening. Through meditation, ethical conduct, and wisdom, we realize what was always already present.

      The Buddha (Siddhartha Gautama) awakened under the Bodhi tree 2,500 years ago and taught the path to liberation from suffering. Key insight: suffering arises from craving and ignorance of our true nature.

      Multiple schools exist (Theravada, Mahayana, Vajrayana), but all share core practices of mindfulness, compassion, and insight.
      """,
    steps: [
      AwakeningStep(
        id: "b1",
        stepNumber: 1,
        title: "Shamatha (Calm Abiding)",
        description: "Develop stable attention and mental calm",
        duration: "10-30 minutes",
        frequency: "Daily",
        detailedInstructions: """
          **Basic Breath Meditation:**

          1. **Posture:**
             - Sit on cushion or chair
             - Spine straight but not rigid
             - Hands on knees or in lap
             - Eyes slightly open, soft gaze down
             - Or closed if preferred

          2. **Object of attention:**
             - Natural breath at nostrils or belly
             - Don't control the breath
             - Simply know breathing in/out

          3. **When mind wanders:**
             - Notice thinking has occurred
             - Gently return to breath
             - No judgment, no frustration
             - This IS the practice

          4. **Quality of attention:**
             - Not too tight (tension)
             - Not too loose (drifting)
             - Like holding a small bird

          **Start with 10 minutes, build to 30+**

          The goal is stable, clear attention that can then 
          be applied to insight practice.
          """,
        commonMistakes: [
          "Fighting thoughts",
          "Trying to achieve blank mind",
          "Too much effort/too little effort",
          "Giving up when difficult",
        ],
        progressIndicators: [
          "Longer periods without distraction",
          "Quicker recognition of wandering",
          "Body becoming settled",
          "Sense of inner calm",
        ]
      ),
      AwakeningStep(
        id: "b2",
        stepNumber: 2,
        title: "Vipassana (Insight Meditation)",
        description: "See the nature of reality directly",
        duration: "20-45 minutes",
        frequency: "Daily",
        detailedInstructions: """
          **Foundation of Mindfulness (Satipatthana):**

          1. **Mindfulness of Body:**
             - Scan sensations throughout body
             - Note pleasant, unpleasant, neutral
             - Notice constant change

          2. **Mindfulness of Feelings:**
             - Observe feeling tones as they arise
             - Pleasant, unpleasant, neutral
             - See how quickly they change

          3. **Mindfulness of Mind:**
             - Observe mental states
             - Clarity, dullness, agitation, calm
             - Don't judge, just observe

          4. **Mindfulness of Phenomena:**
             - Observe thoughts and emotions
             - See them arise and pass
             - Notice their empty nature

          **The Three Characteristics:**

          Through practice, you directly see:
          - **Anicca:** Impermanence - everything changes
          - **Dukkha:** Unsatisfactoriness - clinging causes suffering
          - **Anatta:** Non-self - no fixed, separate self exists

          **These aren't concepts to believe but realities to see.**
          """,
        commonMistakes: [
          "Intellectualizing instead of observing",
          "Seeking special experiences",
          "Avoiding difficult sensations",
          "Not maintaining ethical foundation",
        ],
        progressIndicators: [
          "Direct seeing of impermanence",
          "Reduced reactivity to sensations",
          "Equanimity developing",
          "Glimpses of selflessness",
        ]
      ),
      AwakeningStep(
        id: "b3",
        stepNumber: 3,
        title: "Metta (Loving-Kindness)",
        description: "Cultivate boundless love for all beings",
        duration: "15-30 minutes",
        frequency: "Daily or several times weekly",
        detailedInstructions: """
          **Traditional Metta Practice:**

          Repeat phrases while connecting to the feeling:

          "May I be happy.
          May I be healthy.
          May I be safe.
          May I live with ease."

          **Expanding the Circle:**

          1. **Self:** Start with yourself
             - This is often hardest
             - You deserve kindness too

          2. **Benefactor:** Someone who helped you
             - Easy to feel love for

          3. **Dear friend:** Someone you love

          4. **Neutral person:** Stranger, no strong feeling

          5. **Difficult person:** Start with mildly difficult

          6. **All beings:** Everywhere, all directions
             - "May all beings be happy..."

          **The phrases are secondary.**
          What matters is cultivating the FEELING of love.
          Let the heart open gradually.
          """,
        commonMistakes: [
          "Just saying words without feeling",
          "Starting with enemies (too hard)",
          "Skipping self",
          "Forcing emotion",
        ],
        progressIndicators: [
          "Warmth arising naturally",
          "Easier to extend to difficult people",
          "Spontaneous kindness in daily life",
          "Reduced ill will",
        ]
      ),
      AwakeningStep(
        id: "b4",
        stepNumber: 4,
        title: "The Path of Liberation",
        description: "Integrate practice for complete awakening",
        duration: "Ongoing",
        frequency: "Life practice",
        detailedInstructions: """
          **The Noble Eightfold Path:**

          **Wisdom:**
          1. Right View - Understanding Four Noble Truths
          2. Right Intention - Renunciation, goodwill, harmlessness

          **Ethics:**
          3. Right Speech - Truthful, kind, helpful
          4. Right Action - Non-harming, non-stealing, sexual ethics
          5. Right Livelihood - Ethical work

          **Meditation:**
          6. Right Effort - Cultivate wholesome, abandon unwholesome
          7. Right Mindfulness - Present-moment awareness
          8. Right Concentration - Meditative absorption

          **All eight work together.**

          **Stages of Awakening:**

          Traditional Buddhism describes stages:
          - Stream-entry (first glimpse)
          - Once-returner
          - Non-returner
          - Arahant (full liberation)

          Or in Mahayana:
          - Bodhisattva path - awakening for benefit of all

          **Don't focus on stages.**
          Focus on practice. Awakening takes care of itself.
          """,
        commonMistakes: [
          "Obsessing over stages",
          "Neglecting ethics for meditation",
          "Spiritual materialism",
          "Isolating from sangha (community)",
        ],
        progressIndicators: [
          "Reduced suffering",
          "Natural ethical conduct",
          "Compassion for all beings",
          "Peace not dependent on conditions",
          "Wisdom in daily choices",
        ]
      ),
    ],
    practices: [
      DailyPractice(
        id: "b_sitting",
        name: "Daily Sitting Meditation",
        duration: "20-45 minutes",
        description: "Core practice of calm and insight",
        voiceGuidanceScript: """
          Find your seat. Let your body settle.

          Spine tall but at ease. Hands resting naturally.
          Eyes gently closed or soft gaze down.

          Bring attention to the breath. Breathing in, know you breathe in.
          Breathing out, know you breathe out.

          [Continue with guidance...]
          """
      )
    ],
    warnings: [
      "Intensive practice can bring up difficult material",
      "Find qualified teacher",
      "Progress through stages can include challenging 'dark nights'",
      "Maintain ethical foundation",
    ],
    resources: [
      AwakeningResource(
        id: "br1", title: "Mindfulness in Plain English", type: .book, url: nil,
        description: "Bhante Gunaratana - excellent intro"),
      AwakeningResource(
        id: "br2", title: "The Mind Illuminated", type: .book, url: nil,
        description: "Comprehensive meditation manual"),
      AwakeningResource(
        id: "br3", title: "Dharma Seed", type: .website, url: "https://dharmaseed.org",
        description: "Free meditation talks"),
    ],
    voiceGuidanceAvailable: true
  )

  // MARK: - Placeholder for additional methods

  // These would be fully detailed like the above

  static let sufism = AwakeningMethod(
    id: "sufism",
    name: "Fana (Annihilation in God)",
    tradition: "Sufism (Islamic Mysticism)",
    region: "Middle East / Global",
    icon: "heart.circle.fill",
    color: "#8B0000",
    tagline: "Love dissolves the ego for union with the Beloved",
    energyName: "Divine Love / Ishq",
    overview: "Sufi path of love, dhikr (remembrance), and annihilation of ego in God...",
    steps: [],  // Would be fully detailed
    practices: [],
    warnings: [],
    resources: [],
    voiceGuidanceAvailable: true
  )

  static let kabbalah = AwakeningMethod(
    id: "kabbalah",
    name: "Sephirot Ascent",
    tradition: "Kabbalah (Jewish Mysticism)",
    region: "Judaism / Europe",
    icon: "star.circle.fill",
    color: "#4169E1",
    tagline: "Climb the Tree of Life for cosmic insight",
    energyName: "Divine Light / Or Ein Sof",
    overview: "Kabbalistic path through the 10 sephirot...",
    steps: [],
    practices: [],
    warnings: [],
    resources: [],
    voiceGuidanceAvailable: true
  )

  static let shamanism = AwakeningMethod(
    id: "shamanism",
    name: "Spirit Journeys",
    tradition: "Shamanism",
    region: "Indigenous Worldwide",
    icon: "bird.fill",
    color: "#228B22",
    tagline: "Connect with spirits and ancestors for healing and oneness",
    energyName: "Spirit Power / Life Force",
    overview: "Universal shamanic practices found across all cultures...",
    steps: [],
    practices: [],
    warnings: [],
    resources: [],
    voiceGuidanceAvailable: true
  )

  static let egyptian = AwakeningMethod(
    id: "egyptian",
    name: "Ka/Ba Activation",
    tradition: "Ancient Egyptian",
    region: "Africa / Egypt",
    icon: "sun.max.circle.fill",
    color: "#DAA520",
    tagline: "Soul aspects unite for eternal flight",
    energyName: "Ka (Vital Essence) / Ba (Soul)",
    overview: "Ancient Egyptian mysteries of soul transformation...",
    steps: [],
    practices: [],
    warnings: [],
    resources: [],
    voiceGuidanceAvailable: true
  )

  static let zen = AwakeningMethod(
    id: "zen",
    name: "Satori (Sudden Insight)",
    tradition: "Zen Buddhism",
    region: "Japan / East Asia",
    icon: "circle.fill",
    color: "#1C1C1C",
    tagline: "Direct pointing to mind's true nature",
    energyName: "Buddha Mind / Original Face",
    overview: "Japanese Zen path of zazen and koan practice...",
    steps: [],
    practices: [],
    warnings: [],
    resources: [],
    voiceGuidanceAvailable: true
  )

  static let aboriginal = AwakeningMethod(
    id: "aboriginal",
    name: "Dreamtime Awakening",
    tradition: "Australian Aboriginal",
    region: "Australia / Oceania",
    icon: "moon.stars.circle.fill",
    color: "#8B4513",
    tagline: "Ancestral energies connect to the eternal now",
    energyName: "Dreamtime / The Dreaming",
    overview: "Aboriginal connection to ancestral creation energies...",
    steps: [],
    practices: [],
    warnings: [],
    resources: [],
    voiceGuidanceAvailable: true
  )

  static let mesoamerican = AwakeningMethod(
    id: "mesoamerican",
    name: "Cosmic Alignment",
    tradition: "Mesoamerican (Maya/Aztec)",
    region: "Central America",
    icon: "sun.and.horizon.fill",
    color: "#B8860B",
    tagline: "Sacred cycles awaken the inner sun",
    energyName: "Tonalli (Soul Heat)",
    overview: "Maya and Aztec practices of cosmic attunement...",
    steps: [],
    practices: [],
    warnings: [],
    resources: [],
    voiceGuidanceAvailable: true
  )

  static let yoruba = AwakeningMethod(
    id: "yoruba",
    name: "Orisha Invocation",
    tradition: "Yoruba / Ifa",
    region: "West Africa / Diaspora",
    icon: "hurricane.circle.fill",
    color: "#FF4500",
    tagline: "Divine energies awaken your destiny",
    energyName: "Ashe (Life Force)",
    overview: "Yoruba/Ifa tradition of connecting with orishas...",
    steps: [],
    practices: [],
    warnings: [],
    resources: [],
    voiceGuidanceAvailable: true
  )

  static let celtic = AwakeningMethod(
    id: "celtic",
    name: "Awen Inspiration",
    tradition: "Celtic Druidism",
    region: "British Isles / Europe",
    icon: "tree.circle.fill",
    color: "#006400",
    tagline: "Nature rites bridge the worlds",
    energyName: "Awen (Divine Inspiration)",
    overview: "Druidic connection to nature spirits and bardic inspiration...",
    steps: [],
    practices: [],
    warnings: [],
    resources: [],
    voiceGuidanceAvailable: true
  )

  static let sikhism = AwakeningMethod(
    id: "sikhism",
    name: "Naam Simran",
    tradition: "Sikhism",
    region: "India / Global",
    icon: "wand.and.stars.inverse",
    color: "#FF8C00",
    tagline: "Divine name awakens the inner light",
    energyName: "Naam (Divine Name) / Jyoti (Light)",
    overview: "Sikh practice of remembering the divine name...",
    steps: [],
    practices: [],
    warnings: [],
    resources: [],
    voiceGuidanceAvailable: true
  )

  static let wicca = AwakeningMethod(
    id: "wicca",
    name: "Elemental Awakening",
    tradition: "Paganism / Wicca",
    region: "Modern / Global",
    icon: "pentagon.fill",
    color: "#9932CC",
    tagline: "Nature worship awakens inner divinity",
    energyName: "Life Force / Divine Feminine & Masculine",
    overview: "Modern pagan practices of elemental and lunar attunement...",
    steps: [],
    practices: [],
    warnings: [],
    resources: [],
    voiceGuidanceAvailable: true
  )
}

// MARK: - Oneness Proof

enum OnenessProof {
  static let universalPatterns = [
    UniversalPattern(
      name: "Energy Activation",
      examples: [
        "Kundalini (Hinduism)",
        "Qi (Taoism)",
        "Holy Spirit (Christianity)",
        "Ki (Japan)",
        "Ashe (Yoruba)",
        "Mana (Polynesian)",
      ],
      description: "All traditions recognize a life force that can be cultivated and awakened"
    ),
    UniversalPattern(
      name: "Ego Dissolution",
      examples: [
        "Fana (Sufism)",
        "Anatta (Buddhism)",
        "Death of self (Christianity)",
        "Void (Taoism)",
        "Ego death (Modern)",
      ],
      description: "All paths involve transcending the limited sense of separate self"
    ),
    UniversalPattern(
      name: "Unity Consciousness",
      examples: [
        "Brahman (Hinduism)",
        "Tao (Taoism)",
        "Kingdom of Heaven (Christianity)",
        "Buddha Nature (Buddhism)",
        "Dreamtime (Aboriginal)",
      ],
      description: "All traditions point to an underlying oneness of existence"
    ),
    UniversalPattern(
      name: "Teacher Lineage",
      examples: [
        "Guru (Hinduism)",
        "Master (Taoism)",
        "Spiritual Director (Christianity)",
        "Lama (Buddhism)",
        "Sheikh (Sufism)",
      ],
      description: "All traditions honor transmission from awakened teachers"
    ),
    UniversalPattern(
      name: "Breath as Vehicle",
      examples: [
        "Pranayama (Hinduism)",
        "Qigong breathing (Taoism)",
        "Hesychasm (Orthodox)",
        "Anapanasati (Buddhism)",
        "Dhikr breath (Sufism)",
      ],
      description: "All traditions use conscious breathing as doorway to awakening"
    ),
  ]
}

struct UniversalPattern: Identifiable {
  let id = UUID()
  let name: String
  let examples: [String]
  let description: String
}
