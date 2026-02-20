// JourneysOfAwakeningCourse.swift
// "Journeys of Awakening — Stages of Consciousness Evolution & Global Paths to Enlightenment"
// Not preaching. Exploring. Every tradition. Every path. Let patterns speak for themselves.
// The Bible doesn't talk about chakras... but it talks about the kingdom within. 🤔
// ☀️ SunFlow: Reignited

import SwiftUI

// MARK: - ═══════════════════════════════════════════════════
// COURSE STRUCTURE
// ═══════════════════════════════════════════════════════════

struct JourneysOfAwakeningCourse {
    
    static let courseId = "journeys_of_awakening"
    static let title = "Journeys of Awakening"
    static let subtitle = "Stages of Consciousness Evolution & Global Paths to Enlightenment"
    static let emoji = "🌅"
    static let estimatedHours = "15-18 hours"
    
    static let courseDescription = "Human beings across time and cultures have described moments when ordinary life suddenly feels insufficient — when routines crack open and a deeper dimension of existence becomes visible.\n\nThis is not about choosing sides. We explore every tradition, every path, every map that humanity has drawn of the inner journey. You'll notice the patterns yourself.\n\nNo single tradition is presented as superior. All content draws from historical texts, practitioner accounts, scholarly analyses, and cross-cultural patterns. These are maps, not prescriptions."
    
    static let disclaimer = "These are descriptive, not prescriptive. Journeys are rarely linear; people cycle, skip, or revisit stages. \"Enlightenment\" itself is defined differently across traditions. Scientific research provides partial correlates but does not validate or invalidate any spiritual claim."
    
    // MARK: - All Modules
    
    static let modules: [AwakeningModule] = [
        module1_SevenStages,
        module2_EightPaths,
        module3_DarkNight,
        module4_KundaliniCrises,
        module5_Integration,
        module6_Planes,
        module7_Shadow,
        module7b_ShadowEngineers,
        module9_Neuroscience,
        module10_JungBrainScience,
        module11_QuantumCognition,
        module12_ERSS,
        module13_UniversalEnergies,
    ]
}

// MARK: - ═══════════════════════════════════════════════════
// DATA STRUCTURES
// ═══════════════════════════════════════════════════════════

struct AwakeningModule: Identifiable {
    let id: String
    let number: Int
    let title: String
    let subtitle: String
    let emoji: String
    let estimatedMinutes: Int
    let lessons: [AwakeningLesson]
}

struct AwakeningLesson: Identifiable {
    let id: String
    let number: Int
    let title: String
    let subtitle: String
    let emoji: String
    let sections: [AwakeningSection]
    let reflectionPrompt: String?
}

struct AwakeningSection: Identifiable {
    let id: String
    let heading: String
    let body: String
    
    init(heading: String, body: String) {
        self.id = UUID().uuidString
        self.heading = heading
        self.body = body
    }
}

// MARK: - ═══════════════════════════════════════════════════
// MODULE 1: THE SEVEN STAGES OF SPIRITUAL AWAKENING
// ═══════════════════════════════════════════════════════════

extension JourneysOfAwakeningCourse {
    
    static let module1_SevenStages = AwakeningModule(
        id: "joa_m1",
        number: 1,
        title: "The Seven Stages",
        subtitle: "A common arc reported across cultures",
        emoji: "🔄",
        estimatedMinutes: 60,
        lessons: [
            // Lesson 1: Stages 1-2
            AwakeningLesson(
                id: "joa_m1_l1",
                number: 1,
                title: "Sleepwalker & The Cracks",
                subtitle: "Autopilot and the first fractures",
                emoji: "😶‍🌫️",
                sections: [
                    AwakeningSection(heading: "Stage 1: The Sleepwalker", body: "Life operates on autopilot. Identity is external — job title, social media metrics, consumer roles. Thoughts and desires feel \"own\" but are largely conditioned by family, media, education, and fear of discomfort. Silence is avoided; distraction is constant.\n\nCorporate ladder climbing, endless scrolling, \"keeping up with the Joneses.\" A faint inner whisper — \"Is this all?\" — is quickly silenced by dopamine hits or social validation.\n\nProlonged stay increases risk of mid-life emptiness or unexamined regret. In psychology, this maps to the \"false self\" described in object-relations theory."),
                    AwakeningSection(heading: "Stage 2: The Cracks Appear", body: "The illusion begins to fracture. Former sources of meaning — career, relationships, religion — feel hollow or confining. Unexplained unease arises even during \"happy\" moments.\n\nOften mislabeled as depression or burnout. External life may still look perfect. Sometimes it's triggered by success itself — a promotion followed by sudden emptiness — rather than loss.\n\nThis stage forces confrontation with inauthenticity. Ignoring it can lead to numbing behaviors: overwork, substance use, compulsive consumption. The crack is not the problem. The crack is how the light gets in."),
                ],
                reflectionPrompt: "Where in my daily routine do I feel I am performing rather than living? What would I do differently if nobody was watching?"
            ),
            // Lesson 2: Stages 3-4
            AwakeningLesson(
                id: "joa_m1_l2",
                number: 2,
                title: "Awakening & The Seeker",
                subtitle: "The veil lifts. The hunger begins.",
                emoji: "👁️",
                sections: [
                    AwakeningSection(heading: "Stage 3: The Awakening", body: "A sudden or gradual \"veil-lifting\" moment — often catalyzed by crisis: loss, betrayal, illness, or even a beautiful synchronicity. Core beliefs collapse. The world appears both more beautiful and more illusory. Synchronicities, heightened sensitivity, and existential questions surge.\n\nInitial euphoria can flip to terror: \"What if I'm losing my mind?\" Ego backlash is common — the old identity fights for survival.\n\nModern triggers include psychedelic experiences, near-death events, or spontaneous kundalini activation. Many describe it as \"dying while alive.\" The shift is irreversible. You can't unsee what you've seen."),
                    AwakeningSection(heading: "Stage 4: The Seeker", body: "Intense hunger for knowledge. Books, teachers, retreats, practices, and labels (\"starseed,\" \"empath,\" \"lightworker\") are consumed voraciously.\n\nThe pitfall here is spiritual materialism — collecting experiences, accumulating spiritual credentials, or developing superiority feelings toward \"sleepwalkers.\" The ego doesn't die easily. It simply re-dresses in spiritual clothing.\n\n\"I'm more awakened than you\" is just the ego wearing a crystal necklace.\n\nHealthy seeking builds discernment — the ability to test ideas against experience rather than accepting them because they sound elevated. Unbalanced seeking becomes another addiction, no different from the consumption patterns you left behind."),
                ],
                reflectionPrompt: "Have I ever experienced a moment where my understanding of reality shifted dramatically? What triggered it? Did I seek information afterward — and did that seeking feel nourishing or compulsive?"
            ),
            // Lesson 3: Stage 5 (brief — full expansion in Module 3)
            AwakeningLesson(
                id: "joa_m1_l3",
                number: 3,
                title: "The Dark Night of the Soul",
                subtitle: "All tools fail. Everything dissolves.",
                emoji: "🌑",
                sections: [
                    AwakeningSection(heading: "Stage 5: The Dark Night", body: "All tools fail. Emptiness, existential despair, loss of meaning, feeling abandoned by the divine or universe. Old identities dissolve painfully.\n\nSt. John of the Cross named it. The Sufis call it fana. Alchemists called it nigredo. Buddhists describe the dukkha ñanas. Every major tradition has a name for this phase because every major tradition recognizes it happens.\n\nIt can last months to years. It may require professional support if it overlaps with clinical depression. It is not punishment — it is purification. The night that births the dawn.\n\nWe explore this stage in depth in Module 3. For now, know this: if you're in it, you're not broken. You're being rebuilt."),
                ],
                reflectionPrompt: "Have I ever felt a period of profound emptiness or loss of meaning that, looking back, seemed to serve a purpose? What emerged on the other side?"
            ),
            // Lesson 4: Stages 6-7
            AwakeningLesson(
                id: "joa_m1_l4",
                number: 4,
                title: "Integration & Unity",
                subtitle: "Embodied wisdom. The return to ordinary life.",
                emoji: "☀️",
                sections: [
                    AwakeningSection(heading: "Stage 6: Integration", body: "Wisdom is embodied rather than sought. Practices become natural ways of being — compassion in traffic, presence during chores, patience during conflict. Drama decreases. Trust in life's unfolding increases.\n\nImperfection persists. There is no \"perfect enlightened being\" archetype that holds up to reality. Healing is ongoing, not a finish line. You still get frustrated. You still have bad days. The difference is you don't build an identity around them anymore.\n\nIntegration means the insights from the dark night become how you actually live — not just what you post about."),
                    AwakeningSection(heading: "Stage 7: Unity Consciousness", body: "Persistent sense of interconnectedness. Self/other, human/nature, sacred/profane distinctions soften or dissolve. Action arises from compassion rather than obligation.\n\nThe twist: there's no sense of hierarchy. No \"I'm enlightened and you're not.\" Often returns to ordinary life to serve quietly. In Zen, this is the \"enlightened dishwasher\" — someone who washes dishes with the same presence they bring to meditation.\n\nThis is not a destination. It's a way of being that deepens over a lifetime. And it can appear completely ordinary externally. The most awake person you know might be the one who never talks about it."),
                ],
                reflectionPrompt: "What does \"ordinary life lived with presence\" look like in my context? Can I identify one small daily activity I could approach with full awareness this week?"
            ),
        ]
    )
}

// MARK: - ═══════════════════════════════════════════════════
// MODULE 2: EIGHT PATHS TO ENLIGHTENMENT
// ═══════════════════════════════════════════════════════════

extension JourneysOfAwakeningCourse {
    
    static let module2_EightPaths = AwakeningModule(
        id: "joa_m2",
        number: 2,
        title: "Eight Paths",
        subtitle: "Different maps, same territory",
        emoji: "🗺️",
        estimatedMinutes: 90,
        lessons: [
            AwakeningLesson(
                id: "joa_m2_l1",
                number: 1,
                title: "Buddhist Eightfold Path",
                subtitle: "Ending suffering through wisdom, ethics, and discipline",
                emoji: "☸️",
                sections: [
                    AwakeningSection(heading: "Origins", body: "Rooted in Siddhartha Gautama's teachings around the 5th century BCE. After years of extreme asceticism and palace luxury, he found the Middle Way — neither indulgence nor self-torture.\n\nThe core framework: Four Noble Truths. Life involves suffering (dukkha). Suffering has a cause (craving/attachment). There is cessation. The path to cessation is the Eightfold Path."),
                    AwakeningSection(heading: "The Eight Limbs", body: "Wisdom: Right View, Right Intention — seeing reality as it is, not as ego constructs it.\n\nEthics: Right Speech, Right Action, Right Livelihood — alignment between inner understanding and outer behavior.\n\nMental Discipline: Right Effort, Right Mindfulness, Right Concentration — training the mind through meditation.\n\nMindfulness helps notice the \"cracks\" (Stage 2). Concentration supports endurance through the dark night (Stage 5). The path doesn't promise bliss — it promises clarity."),
                    AwakeningSection(heading: "Connection to the Stages", body: "Buddhism describes specific insight stages (vipassana ñanas) that map remarkably well to our seven stages. The \"dukkha ñanas\" — knowledge of suffering, fear, misery, and disgust — parallel the Dark Night directly.\n\nNotice: a 2,500-year-old tradition from South Asia describes the same inner process that St. John of the Cross documented in 16th-century Spain. Different language. Same territory."),
                ],
                reflectionPrompt: "What is one area of \"craving\" in my life that creates more suffering than satisfaction? What would Right View look like applied to it?"
            ),
            AwakeningLesson(
                id: "joa_m2_l2",
                number: 2,
                title: "Christian Mysticism",
                subtitle: "Direct union with God — beyond dogma",
                emoji: "✝️",
                sections: [
                    AwakeningSection(heading: "The Hidden Tradition", body: "Most people think Christianity is about following rules and going to church on Sunday. But there's an entire interior tradition — the mystics — that's about direct experiential union with the divine. Not believing in God. Knowing God.\n\nThe Desert Fathers (3rd-4th century) fled cities for the Egyptian desert to practice silence, solitude, and contemplative prayer. They weren't escaping life — they were going deeper into it."),
                    AwakeningSection(heading: "Key Figures", body: "St. Teresa of Ávila described the soul as an \"Interior Castle\" with seven mansions — each representing a deeper level of prayer and union. The outer mansions: active prayer, moral effort. The inner mansions: mystical experiences, raptures, spiritual marriage with the divine.\n\nSt. John of the Cross gave us the Dark Night framework. Meister Eckhart spoke of the \"Godhead beyond God\" — a divine reality beyond any concept, image, or name.\n\nThese were not fringe heretics. Teresa and John are Doctors of the Church."),
                    AwakeningSection(heading: "The Kingdom Within", body: "\"The kingdom of God is within you\" — Luke 17:21.\n\nThis single verse, taken seriously, turns the entire religious framework inward. Not a place you go after death. Not a reward for good behavior. A state of consciousness accessible now, inside your own being.\n\nModern contemplatives like Thomas Keating developed Centering Prayer — a practice that looks remarkably like meditation. Sit in silence. Let thoughts pass. Rest in the presence beyond words.\n\nSame technique, different vocabulary. Same territory."),
                ],
                reflectionPrompt: "What does \"the kingdom within\" mean to you — regardless of your religious background? Have you ever experienced a moment of inner silence that felt sacred?"
            ),
            AwakeningLesson(
                id: "joa_m2_l3",
                number: 3,
                title: "The Sufi Path",
                subtitle: "Love, ego annihilation, and the Beloved",
                emoji: "🌀",
                sections: [
                    AwakeningSection(heading: "Mystical Islam", body: "Sufism (Tasawwuf) is the mystical dimension of Islam. While orthodox Islam emphasizes submission to God's law, Sufism emphasizes falling in love with God — the Beloved — until the lover dissolves entirely.\n\nThe path moves through stations (maqamat) and states (ahwal). The seeker (murid) progresses under a sheikh's guidance through repentance, patience, gratitude, poverty, trust, and ultimately fana — the annihilation of the ego-self."),
                    AwakeningSection(heading: "Fana and Baqa", body: "Fana means annihilation. The separate self dissolves into the divine. This is not death — it's the death of the illusion that you were ever separate.\n\nBaqa means subsistence — what remains after the ego dies. You continue to exist, but you exist in God rather than in your own small story.\n\nRumi wrote: \"You are not a drop in the ocean. You are the entire ocean in a drop.\"\n\nFana maps directly to Stage 5 (Dark Night). Baqa maps to Stage 7 (Unity Consciousness). The Sufis articulated this over 800 years ago."),
                    AwakeningSection(heading: "Practices", body: "Dhikr: Repetitive remembrance of God's names — a mantric practice that stills the mind and opens the heart.\n\nSama: Listening to sacred music and poetry — the Whirling Dervishes of the Mevlevi order use spinning as a moving meditation to dissolve the self.\n\nThe Sufi path is about the heart, not the intellect. It's about longing, devotion, and surrender — letting love burn away everything that isn't real."),
                ],
                reflectionPrompt: "When have I experienced longing for something I couldn't name? Could that longing itself be a form of connection rather than lack?"
            ),
            AwakeningLesson(
                id: "joa_m2_l4",
                number: 4,
                title: "The Alchemical Path",
                subtitle: "Turning lead into gold — inside you",
                emoji: "⚗️",
                sections: [
                    AwakeningSection(heading: "Beyond the Laboratory", body: "Western alchemy is often dismissed as primitive chemistry — fools trying to turn lead into gold. But the deeper tradition (Hermetic, medieval, Renaissance) used laboratory work as a metaphor for inner transformation.\n\nThe \"lead\" is the unrefined soul — dense, unconscious, reactive. The \"gold\" is the awakened consciousness — luminous, aware, integrated. The \"Philosopher's Stone\" is the catalytic agent of transformation — not a physical object but a state of being."),
                    AwakeningSection(heading: "The Three Stages", body: "Nigredo (Blackening): Death, putrefaction, dissolution. The old self must die. This is the Dark Night. The alchemist enters the furnace and everything false burns away. Depression, confusion, loss of identity.\n\nAlbedo (Whitening): Purification. What remains after the burning is washed clean. Clarity begins to emerge. Self-knowledge deepens.\n\nRubedo (Reddening): Rebirth. The purified consciousness integrates with embodied life. The \"red\" symbolizes life-force, passion, and presence returned — not as ego-driven desire but as authentic engagement with reality.\n\nCarl Jung re-interpreted the entire alchemical tradition as a map of individuation — the psychological process of integrating the unconscious to become a whole person. Same map. Psychological vocabulary."),
                ],
                reflectionPrompt: "What \"lead\" in my life — what dense, heavy, unconscious pattern — might be raw material for transformation rather than something to eliminate?"
            ),
            AwakeningLesson(
                id: "joa_m2_l5",
                number: 5,
                title: "Yogic Paths",
                subtitle: "Four yogas for four temperaments",
                emoji: "🕉️",
                sections: [
                    AwakeningSection(heading: "Not Just Poses", body: "In the West, yoga means stretching in tight pants. In the Hindu tradition, yoga means union — union of individual consciousness (Atman) with universal consciousness (Brahman). Asana (physical postures) is one of eight limbs, not the whole tree.\n\nThe Bhagavad Gita describes four complementary paths — each suited to a different human temperament. You don't have to choose one. Most people find a natural primary path with elements of the others."),
                    AwakeningSection(heading: "The Four Paths", body: "Bhakti Yoga (Devotion): The path of the heart. Chanting, prayer, surrender, love of the divine. For those who feel deeply. Connection through emotion.\n\nJnana Yoga (Knowledge): The path of the intellect. Self-inquiry — \"Who am I?\" Study of Vedanta. Discrimination between the real and the unreal. For those who think deeply.\n\nKarma Yoga (Action): The path of selfless service. Detached action — doing what needs to be done without attachment to results. For those who act naturally.\n\nRaja Yoga (Meditation): The path of the mind. Patanjali's eight limbs — ethical restraints, observances, posture, breath control, sense withdrawal, concentration, meditation, absorption (samadhi). For those drawn to inner discipline.\n\nThe flexibility is the genius. Different doors into the same room."),
                    AwakeningSection(heading: "The Chakra System", body: "The yogic tradition maps seven primary energy centers (chakras) along the spine — from root (survival, grounding) to crown (cosmic consciousness, unity).\n\nMuladhara (Root): Safety, survival, grounding.\nSvadhisthana (Sacral): Creativity, emotion, sexuality.\nManipura (Solar Plexus): Power, will, identity.\nAnahata (Heart): Love, compassion, connection.\nVishuddha (Throat): Expression, truth, communication.\nAjna (Third Eye): Intuition, insight, inner vision.\nSahasrara (Crown): Unity, transcendence, the divine.\n\nThe journey from root to crown mirrors the journey from sleepwalker to unity consciousness. The energy (kundalini) that rises through these centers is the same evolutionary force every tradition describes — just with different names.\n\nInteresting observation: \"The kingdom of God is within you.\" The chakra system maps the territory of that kingdom. Different tradition. Same interior geography."),
                ],
                reflectionPrompt: "Which of the four yogic paths resonates most with my natural temperament — devotion, knowledge, action, or meditation? Why?"
            ),
            AwakeningLesson(
                id: "joa_m2_l6",
                number: 6,
                title: "Ascetic, Philosophical & Modern Paths",
                subtitle: "Renunciation, reason, and new frontiers",
                emoji: "🔬",
                sections: [
                    AwakeningSection(heading: "The Ascetic Path", body: "Renunciation appears across every tradition — Hindu sadhus, Christian hermits, Buddhist forest monks, Jain monks who sweep the ground before walking to avoid crushing insects.\n\nPractices: fasting, silence, solitude, celibacy. The logic: remove all external stimulation and you're left with what's real.\n\nThe challenge: risk of body-denial, escapism, or spiritual bypass. Some critics note asceticism can become its own attachment — an attachment to non-attachment. The Middle Way (Buddhism) emerged partly as a correction to extreme asceticism."),
                    AwakeningSection(heading: "The Philosophical Path", body: "Socrates didn't meditate. He asked questions. \"Know thyself\" was inscribed at the Temple of Delphi. The examined life — not the devotional life or the meditative life — was his path to truth.\n\nThe Stoics trained equanimity through reason. Advaita Vedanta uses logical inquiry to dissolve the illusion of separation. Daoism offers wu wei — effortless action aligned with the natural flow.\n\nPierre Hadot argued that ancient philosophy was never just intellectual — it was a way of life, a set of spiritual exercises. The Philosopher's Stone again: different name, same transformation."),
                    AwakeningSection(heading: "Modern Consciousness Exploration", body: "Today's seekers have tools the ancients didn't:\n\nPsychology: Jung's shadow work, mindfulness-based stress reduction, Internal Family Systems therapy.\n\nNeuroscience: fMRI studies of meditation, default mode network dissolution during psychedelic experiences, neuroplasticity research.\n\nPsychedelics: Psilocybin trials at Johns Hopkins show measurable mystical experiences correlating with lasting positive personality changes. MDMA-assisted therapy for PTSD. Ketamine clinics.\n\nTechnology: Neurofeedback, binaural beats, VR meditation.\n\nThe strength: empirical data and accessibility. The caution: commercialization, unintegrated experiences, and the tendency to want a shortcut to what every tradition says requires patience."),
                ],
                reflectionPrompt: "Do I gravitate more toward direct experience (practice), intellectual understanding (study), or empirical evidence (science)? How might I balance the others?"
            ),
        ]
    )
}

// MARK: - ═══════════════════════════════════════════════════
// MODULE 3: THE DARK NIGHT — DEEP DIVE
// ═══════════════════════════════════════════════════════════

extension JourneysOfAwakeningCourse {
    
    static let module3_DarkNight = AwakeningModule(
        id: "joa_m3",
        number: 3,
        title: "The Dark Night — Deep Dive",
        subtitle: "The crucible that births authentic living",
        emoji: "🌑",
        estimatedMinutes: 50,
        lessons: [
            AwakeningLesson(
                id: "joa_m3_l1",
                number: 1,
                title: "St. John's Two Nights",
                subtitle: "The original framework — senses and spirit",
                emoji: "🕯️",
                sections: [
                    AwakeningSection(heading: "Origins", body: "The term \"Dark Night of the Soul\" originates with St. John of the Cross (1542–1591), a Spanish Carmelite friar. Written during nine months of imprisonment in 1577–78, his work frames the night as passive purification initiated by the divine — beyond the soul's own efforts.\n\nSt. John describes two distinct but overlapping nights marking transitions in the spiritual life: purgative to illuminative to unitive."),
                    AwakeningSection(heading: "Night of the Senses", body: "Purpose: Purges sensory attachments and \"spiritual gluttony\" — craving consolations, visions, or emotional highs from prayer and practices.\n\nThe three classic signs of entry:\n1. No consolation in God OR created things (spiritual dryness).\n2. Persistent anxiety about God despite the dryness (the soul still yearns).\n3. Inability to meditate or reflect as before (discursive prayer fails).\n\nPrayer feels empty. Former joys lose flavor. Yet the person remains faithful in practice.\n\nFruits: Fosters humility, self-knowledge (\"I can do nothing of myself\"), patience, and a subtler, faith-based communion. Can feel like \"burnout\" in religious life."),
                    AwakeningSection(heading: "Night of the Spirit", body: "Rarer. Deeper. More intense.\n\nPurifies the higher faculties — intellect, memory, will — and deepest ego structures for full union. Profound oppression, sense of divine abandonment, \"cruel spiritual death,\" intense longing mixed with pain.\n\nEverything dissolves — beliefs, identity, even the sense of God. The mind fights back with paranoia, rage, or existential terror.\n\nFruits: Complete detachment, heroic virtues, luminous union. \"My house being now at rest.\" May last years. Often recurs in subtler forms.\n\nBoth nights are passive — God acts. Active efforts help but cannot force them. St. John emphasizes: these are gifts of love, not wrath."),
                ],
                reflectionPrompt: "Can I distinguish between spiritual dryness (a stripping away that deepens) and mere boredom or laziness in my practices?"
            ),
            AwakeningLesson(
                id: "joa_m3_l2",
                number: 2,
                title: "Modern & Cross-Cultural Parallels",
                subtitle: "Same process, different names, across millennia",
                emoji: "🌍",
                sections: [
                    AwakeningSection(heading: "Contemporary 4-Stage Model", body: "Synthesized from transpersonal psychology and practitioner accounts:\n\n1. Ego Rupture / Awakened Discontent: Crisis triggers identity collapse. Life feels meaningless or fake.\n\n2. Descent / Loss of Direction: Hopelessness, profound loneliness even in company, emotional numbness, fatigue, disconnection from former passions. Physical symptoms possible.\n\n3. Rock Bottom / Facing the Shadow: Isolation, grief over lost self, confrontation with repressed wounds, shame, fears. The valley of the shadow — intense but often the turning point.\n\n4. Surrender / Rebirth: Gradual acceptance, softening, glimpses of meaning, renewed compassion. Life feels richer — not because circumstances changed but because perception did."),
                    AwakeningSection(heading: "Cross-Cultural Map", body: "Every major tradition describes this same arc:\n\nSufism: Fana (annihilation of ego) → Baqa (subsistence in God). Burning away of self; intense longing for the Beloved.\n\nAlchemy: Nigredo (blackening/death phase). Putrefaction of old self; lead → gold metaphor.\n\nHindu/Kundalini: Ego death, granthi (knot) untying crises. Energy blockages, identity dissolution.\n\nBuddhism: Dukkha ñanas — disillusionment with conditioned reality; fear, misery, disgust phases in insight practice.\n\nJungian Psychology: Shadow integration / individuation crisis. Confrontation with the unconscious.\n\nShared theme across ALL: Ego death as prerequisite for rebirth, union, or wholeness.\n\nWhen five traditions from different continents, different centuries, different languages all describe the same inner process — that's not coincidence. That's data."),
                ],
                reflectionPrompt: "Which tradition's description of the dark night resonates most with my own experience or understanding? What does that tell me about my orientation?"
            ),
            AwakeningLesson(
                id: "joa_m3_l3",
                number: 3,
                title: "Navigation & Safety",
                subtitle: "When it's purification — and when to get help",
                emoji: "🧭",
                sections: [
                    AwakeningSection(heading: "Dark Night vs. Clinical Depression", body: "The overlap is real. The distinction matters.\n\nDark Night often retains a subtle sense of purpose or yearning — \"this is part of something larger\" — while depression frequently includes pervasive hopelessness without that thread.\n\nFunctioning may dip but many continue basic responsibilities. The process feels purposeful even in pain.\n\nPost-night: increased empathy, wisdom, and life-affirmation. Depression without treatment often leaves residual emptiness.\n\nOverlap is possible. If functioning is severely impaired, suicidal thoughts are present, or symptoms persist without any sense of movement — seek professional support. This is not weakness. This is wisdom."),
                    AwakeningSection(heading: "Support Strategies", body: "Professional: Therapy with transpersonal or spiritually-sensitive practitioners. Rule out medical issues first.\n\nPractices: Gentle bodywork (walking, yoga, shaking), journaling, nature immersion, creative expression, breathwork, contemplative silence.\n\nCommunity: Trusted mentors, support groups, or retreats. Avoid high-pressure environments that demand performance.\n\nMindset: Acceptance over resistance. View as purification rather than punishment. Track small \"glimmers\" of light.\n\nPitfalls to avoid: Spiritual bypassing (using the label to avoid therapy), isolation, ego inflation (\"I'm special for suffering this\"), or forcing the process.\n\nThe Dark Night is not the end of the journey. It is the crucible that prepares the ground for genuine integration. Many who endure it report it as the most painful yet most valuable phase of their lives — a death that makes authentic living possible."),
                ],
                reflectionPrompt: "If I were in a dark night — or have been — what one small, grounded action supports my wellbeing right now? Not spiritual. Just human."
            ),
        ]
    )
}

// MARK: - ═══════════════════════════════════════════════════
// MODULE 4: KUNDALINI CRISES
// ═══════════════════════════════════════════════════════════

extension JourneysOfAwakeningCourse {
    
    static let module4_KundaliniCrises = AwakeningModule(
        id: "joa_m4",
        number: 4,
        title: "Kundalini Crises",
        subtitle: "When the serpent fire awakens unprepared",
        emoji: "🐍",
        estimatedMinutes: 45,
        lessons: [
            AwakeningLesson(
                id: "joa_m4_l1",
                number: 1,
                title: "Foundations & The Process",
                subtitle: "What kundalini is — and what happens when it moves",
                emoji: "⚡",
                sections: [
                    AwakeningSection(heading: "The Coiled Serpent", body: "Kundalini (Sanskrit: \"coiled one\") — a primordial, latent energy depicted as a serpent coiled three-and-a-half times at the base of the spine (muladhara chakra).\n\nRooted in Tantric and Hatha Yoga texts (9th–15th centuries CE), it is the evolutionary life-force that, when awakened, rises through the central channel (sushumna nadi), piercing seven chakras and culminating at the crown (sahasrara).\n\nThe goal: union of individual consciousness (Shakti) with universal consciousness (Shiva). Liberation. Moksha.\n\nNot every tradition takes kundalini literally. Some view it as subtle nervous-system refinement. Spontaneous awakenings occur outside formal practice."),
                    AwakeningSection(heading: "Typical vs. Crisis", body: "Traditional accounts describe progressive, controlled rise: energy moves upward, chakras open, perceptions clarify, bliss predominates.\n\nWhen unprepared — nervous system not purified, subtle channels blocked, rise too rapid — the process overwhelms. This is kundalini syndrome or, in transpersonal psychology, a spiritual emergency.\n\nGopi Krishna (1903–1984), a Kashmiri civil servant, practiced crown-chakra concentration for 17 years. In 1937, kundalini awakened forcefully through the wrong channel. For over a decade he endured searing head pressure, burning heat, insomnia, terror of insanity, alternating luminous light and darkness. His autobiography remains one of the most detailed firsthand records.\n\nHe later stabilized and viewed the force as humanity's evolutionary driver — but warned of dangers when unbalanced."),
                ],
                reflectionPrompt: "Have I ever experienced sudden, unexplained energy surges, heat, or tingling — during meditation, exercise, or crisis? How did I interpret it at the time?"
            ),
            AwakeningLesson(
                id: "joa_m4_l2",
                number: 2,
                title: "Symptoms & Phases",
                subtitle: "Recognizing the biopsychospiritual storm",
                emoji: "🌊",
                sections: [
                    AwakeningSection(heading: "Physical & Energetic", body: "Spontaneous kriyas — involuntary shaking, twitching, yoga-like postures, dance movements.\n\nHeat or cold surges, electrical/tingling currents up the spine, pressure in head/heart/base of spine.\n\nHeart palpitations, breathing changes, sexual arousal or dysfunction, appetite/sleep disturbances, extreme fatigue alternating with high energy, vibrations or buzzing.\n\nThese are not imagined. Research (Greyson, Woollacott, Sannella) documents measurable physiological shifts."),
                    AwakeningSection(heading: "Emotional, Cognitive & Spiritual", body: "Emotional: Intense anxiety, panic, depression, rage, grief, emotional volatility. Alternating bliss and despair.\n\nCognitive: Inner sounds (nada), visions, synchronicities, heightened intuition. Confusion, memory issues, intrusive thoughts. Temporary inability to function.\n\nSpiritual: Ego dissolution, depersonalization, fear of \"losing my mind,\" hypersensitivity to others' emotions, paranoia, identity shifts.\n\nPhases (composite from Grof/Greenwell models):\n1. Activation/Trigger — Sudden surge post-practice, trauma, or spontaneous.\n2. Overload/Purification — Symptoms peak; body-mind recalibrates; old patterns surface.\n3. Integration/Resolution — Energy stabilizes; insights consolidate; grounded embodiment emerges."),
                    AwakeningSection(heading: "Spiritual Emergency vs. Mental Illness", body: "Kundalini crisis often retains a sense of meaning — \"this is energy, this is process\" — while psychotic or manic episodes usually involve impaired reality testing.\n\nLong-term: kundalini crises can lead to increased wisdom and compassion. Psychotic episodes require ongoing clinical management.\n\nResponse to support: grounding and acceptance improve spiritual emergencies. Psychiatric conditions may need medication.\n\nCo-occurrence is possible. Always rule out medical and psychiatric conditions first. This is not either/or — it's about appropriate support for the specific person."),
                ],
                reflectionPrompt: "How does my cultural background shape how I would interpret intense energetic experiences — as spiritual, medical, or psychological? What assumptions am I carrying?"
            ),
            AwakeningLesson(
                id: "joa_m4_l3",
                number: 3,
                title: "Navigation & Grounding",
                subtitle: "Working with the fire — not against it",
                emoji: "🌿",
                sections: [
                    AwakeningSection(heading: "Triggers", body: "Intensive meditation, pranayama, or kundalini yoga. Breathwork (holotropic, Wim Hof). Psychedelics. Physical trauma or surgery. Childbirth. Near-death experiences. Extreme stress or grief. Or spontaneous — no apparent cause.\n\nPrevention is preparation: gradual practice, ethical lifestyle, qualified guidance. The traditions that developed these practices also developed safety protocols. The modern tendency to extract techniques without context is the risk."),
                    AwakeningSection(heading: "Support Strategies", body: "Grounding: Nature walks, gentle exercise, whole-food diet, magnesium/B-vitamins, rest, creative expression, bare feet on earth.\n\nPractices: Slow, gentle yoga (not advanced kriyas). Breath awareness without forcing energy. Bodywork. Journaling. Mindfulness that doesn't push.\n\nProfessional: Transpersonal or spiritually-informed therapists. Medical evaluation first. Avoid forcing or \"pushing\" energy upward.\n\nMindset: View as reorganization rather than enemy. Surrender vs. resistance often eases intensity. The serpent fire doesn't need to be fought — it needs to be channeled.\n\nMany who endure crises later report profound gratitude, heightened empathy, and lasting positive transformation. The fire that terrifies is the same fire that illuminates."),
                ],
                reflectionPrompt: "What grounding practices already exist in my life — even unconscious ones (cooking, walking, gardening)? Could I approach them with more intentionality?"
            ),
        ]
    )
}

// MARK: - ═══════════════════════════════════════════════════
// MODULE 5: INTEGRATION & PATTERNS
// ═══════════════════════════════════════════════════════════

extension JourneysOfAwakeningCourse {
    
    static let module5_Integration = AwakeningModule(
        id: "joa_m5",
        number: 5,
        title: "Seeing the Patterns",
        subtitle: "Shared themes, key differences, and your path",
        emoji: "🔗",
        estimatedMinutes: 30,
        lessons: [
            AwakeningLesson(
                id: "joa_m5_l1",
                number: 1,
                title: "What They All Share",
                subtitle: "The universal thread across every tradition",
                emoji: "🧬",
                sections: [
                    AwakeningSection(heading: "Shared Themes", body: "Ego dissolution: every tradition describes the death of the false self as prerequisite for authentic being. Whether it's fana, nigredo, dukkha ñanas, or the Dark Night — the small self must dissolve.\n\nMovement from separation to unity: sleepwalker → unity consciousness. Lead → gold. Samsara → nirvana. The particular and the universal are recognized as one.\n\nDirect experience over dogma: Buddhism says don't take my word for it — test it. Jesus says the kingdom is within you — experience it. Sufis say taste the wine — don't study the menu.\n\nCompassion as natural outcome: not forced, not performed, not virtue-signaling. When the illusion of separation dissolves, compassion arises naturally because harming another feels like harming yourself.\n\nService as expression: the fully integrated person doesn't retreat from the world. They return to it with something to give."),
                    AwakeningSection(heading: "Key Differences", body: "Theistic vs. Non-theistic: Sufism and Christian mysticism orient toward a personal God. Buddhism and Advaita Vedanta point toward impersonal awareness.\n\nEffort vs. Grace: Some paths emphasize discipline (Yoga, Buddhism). Others emphasize surrender (Bhakti, Sufism). Most traditions contain both.\n\nSolitary vs. Communal: Ascetics retreat. Karma yogis engage. Sanghas gather. Each model serves different temperaments.\n\nNone of these differences invalidate each other. They're different doors into the same room — suited to different people at different times."),
                ],
                reflectionPrompt: "When I look at the patterns across traditions, what surprises me? What expected differences turned out to be similarities?"
            ),
            AwakeningLesson(
                id: "joa_m5_l2",
                number: 2,
                title: "Cautions & Daily Life",
                subtitle: "Spiritual bypassing, cultural respect, and grounded practice",
                emoji: "⚠️",
                sections: [
                    AwakeningSection(heading: "What Can Go Wrong", body: "Spiritual bypassing: Using practices, labels, or elevated language to avoid doing the actual emotional work. \"I'm too evolved for anger\" is just repression wearing a crystal necklace.\n\nMental health overlap: When to seek therapy instead of another retreat. Prolonged inability to function, suicidal thoughts, or dissociation require professional support — not more sage.\n\nCultural appropriation: Extracting techniques from living traditions without understanding their context, honoring their origins, or acknowledging systemic power dynamics.\n\n\"False awakening\": Temporary insights that reinforce ego. \"I had a mystical experience therefore I am special.\" The experience is real. The specialness is ego."),
                    AwakeningSection(heading: "Blending in Daily Life", body: "Many today create hybrid paths — mindfulness + therapy + service. Yoga class + journaling + volunteering. This is natural. Most great teachers were syncretic.\n\nIntegration questions:\nHow does this affect my relationships? (If my practice makes me more isolated or judgmental, something's off.)\nHow does this affect my work? (Presence enhances performance. Escapism destroys it.)\nHow does this affect my ethics? (Awakening without integrity is just sophisticated selfishness.)\n\nThe ultimate test of any path: does it make you more human, more compassionate, more present to the people in your life? If not, it's spiritual entertainment, not transformation."),
                ],
                reflectionPrompt: "Which stage(s) feel most familiar right now? Which path(s) resonate — and why? What is one small, grounded practice I could experiment with this week, regardless of tradition?"
            ),
        ]
    )
}

// MARK: - ═══════════════════════════════════════════════════
// HASHABLE CONFORMANCES
// ═══════════════════════════════════════════════════════════

extension AwakeningModule: Hashable, Equatable {
    static func == (lhs: AwakeningModule, rhs: AwakeningModule) -> Bool { lhs.id == rhs.id }
    func hash(into hasher: inout Hasher) { hasher.combine(id) }
}

extension AwakeningLesson: Hashable, Equatable {
    static func == (lhs: AwakeningLesson, rhs: AwakeningLesson) -> Bool { lhs.id == rhs.id }
    func hash(into hasher: inout Hasher) { hasher.combine(id) }
}
