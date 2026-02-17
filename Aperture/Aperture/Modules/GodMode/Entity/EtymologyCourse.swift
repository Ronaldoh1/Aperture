// EtymologyCourse.swift
// GODMODE: THE WORD IS THE SWORD
// Understanding the occult power hidden in language
// When you control definitions, you control reality

import SwiftUI

// MARK: - Etymology Course

struct EtymologyCourse {
  static let shared = EtymologyCourse()

  let id = "godmode_etymology"
  let title = "The Word Is The Sword"
  let subtitle = "Unlock the occult power of language"
  let icon = "text.book.closed.fill"
  let colorHex = "#9C27B0"  // Deep purple for mystical knowledge

  var color: Color {
    Color(hex: colorHex)
  }

  let modules: [EtymologyModule] = [
    // ═══════════════════════════════════════════════════════════════════
    // MODULE 0: THE SPELL OF SPELLING
    // ═══════════════════════════════════════════════════════════════════
    EtymologyModule(
      id: "etym0",
      number: 0,
      title: "The Spell of Spelling",
      subtitle: "Why they call it SPELL-ing",
      icon: "wand.and.stars",
      duration: "25 min",
      unlockedByDefault: true,
      teachingStyle: .storytelling,
      lessons: [
        EtymologyLesson(
          id: "etym0_1",
          title: "Words Are Spells",
          teachingMethod: .revelation,
          content: """
            **You've Been Casting Spells Your Whole Life**

            Stop and think about this:

            Why do we call it **SPELL**-ing?
            Why do we put words into **SENT**-ences? (Sent-ence → to be sent away)
            Why is a book collection called a **LIE**-brary?
            Why do we use **CURSE**-ive writing?

            Coincidence? Or is language itself an occult technology hiding in plain sight?

            **The Ancient Truth**

            In every ancient tradition, **the Word was sacred power:**

            • **Hebrew**: דָּבָר (Dabar) = "Word" = also "Thing/Reality"
            • **Egyptian**: Hekau = "Words of Power" used in all creation myths
            • **Greek**: Λόγος (Logos) = Word = Reason = Divine Order = Reality itself
            • **Sanskrit**: मन्त्र (Mantra) = "Mind tool" - words that reshape consciousness

            "In the beginning was the **Word**, and the Word was with God, and the Word **was** God." — John 1:1

            The ancients weren't being poetic. They were being **literal**.

            Words don't describe reality. **Words create reality.**

            🔥 **You're not learning to spell. You're learning to cast.**

            ---

            **REFLECTION PROMPT:**
            Think of a time words physically changed how you felt. An insult that made your stomach drop. A compliment that made you glow. Words created a bodily response. That's not metaphor—that's magic.
            """,
          keyInsight:
            "Spelling is literally casting spells. Words create reality. The ancients knew this—we forgot.",
          practiceExercise: PracticeExercise(
            title: "Word Awareness Day",
            instructions:
              "For the next 24 hours, notice every word you speak and think. Are you casting curses or blessings on yourself?",
            duration: "24 hours"
          ),
          quiz: EtymologyQuiz(
            question: "Why did the ancients consider words sacred?",
            options: [
              "They were superstitious primitives",
              "They understood words CREATE reality, not just describe it",
              "They didn't have science yet",
              "It was just a metaphor",
            ],
            correctIndex: 1,
            explanation:
              "Ancient cultures across the world independently discovered that language shapes reality. This isn't primitive thinking—it's advanced consciousness technology we've forgotten."
          ),
          rewardBadge: "Spell Caster",
          rewardPoints: 100,
          sacredGeometry: .vesicaPiscis
        ),

        EtymologyLesson(
          id: "etym0_2",
          title: "The Legal Word Prison",
          teachingMethod: .deconstruction,
          content: """
            **They Changed The Words To Change Reality**

            When the Roman Empire "fell," it didn't disappear. It transformed into something more powerful: **The Legal System.**

            And the weapon of this new empire? **Words.**

            Let's decode some legal "English":

            **PERSON** (per-sona)
            • Latin: "mask worn by actors"
            • Legal meaning: A CORPORATION, not a human being
            • When you "act as a person," you're wearing a legal mask
            • Your birth certificate creates a PERSON (corporation) with your name in ALL CAPS

            **UNDERSTAND**
            • Legal meaning: To "stand under" authority
            • "Do you understand?" = "Do you agree to stand under our jurisdiction?"
            • The proper response: "I comprehend, but I do not stand under."

            **COURT**
            • From Latin "cohort" = armed group, enclosure
            • A court is a GAME being played (basketball court, tennis court)
            • The judge wears BLACK (Saturn worship, authority)
            • The BAR separates spectators from players

            **MORTGAGE**
            • French: mort (death) + gage (pledge)
            • Literally: "DEATH PLEDGE"
            • You pledge to pay until death

            **ATTORNEY**
            • One who TURNS (torney) you over
            • They "attorn" (transfer allegiance) to the court
            • They represent the PERSON (corporation), not you the living being

            🔥 **The Matrix is built with words. Decode the words, escape the Matrix.**

            ---

            **PATTERN RECOGNITION:**
            Notice how every legal document uses specific language that seems complex but is designed to bind you to meanings you never agreed to.
            """,
          keyInsight:
            "Legal language is a trap. They define words differently than common usage to capture your consent without your knowledge.",
          practiceExercise: PracticeExercise(
            title: "Legal Word Audit",
            instructions:
              "Find a contract or legal document you've signed. How many words have legal definitions that differ from common usage?",
            duration: "30 minutes"
          ),
          quiz: EtymologyQuiz(
            question: "What does 'mortgage' literally mean?",
            options: [
              "Home ownership",
              "Death pledge",
              "Property transfer",
              "Bank loan",
            ],
            correctIndex: 1,
            explanation:
              "Mort (death) + gage (pledge) = Death Pledge. The language of finance is designed to obscure its true nature."
          ),
          rewardBadge: "Matrix Decoder",
          rewardPoints: 150,
          sacredGeometry: .metatronsCube
        ),

        EtymologyLesson(
          id: "etym0_3",
          title: "Sound Creates Form",
          teachingMethod: .scientific,
          content: """
            **Cymatics: The Science of Word Power**

            This isn't mystical speculation. It's physics.

            **Cymatics** is the study of visible sound. When you play frequencies through a medium (water, sand, powder), geometric patterns emerge.

            • 432 Hz creates different patterns than 440 Hz
            • Spoken words create visible wave patterns
            • Ancient mantras create specific sacred geometries

            **Dr. Masaru Emoto's Water Experiments**

            Water exposed to different words crystallized differently:
            • "Love" and "Gratitude" → Beautiful hexagonal crystals
            • "Hate" and "Fear" → Distorted, chaotic structures
            • "Hitler" → Completely deformed crystals
            • Mozart → Perfect symmetry
            • Heavy metal → Chaos

            Your body is 70% water. Your words are literally restructuring your body's crystalline matrix every time you speak.

            **The Frequency of Words**

            Every word has a frequency signature:
            • **Love**: 528 Hz (DNA repair frequency)
            • **Fear**: Creates discordant frequencies
            • **Gratitude**: Harmonic with the Schumann Resonance

            This is why mantras work. This is why prayers work. This is why curses work.

            **Sound → Form → Reality**

            The universe is made of vibration. Words are structured vibrations. Speaking is sculpting reality with sound.

            🔥 **Your voice is a reality-shaping instrument. Use it consciously.**

            ---

            **EXPERIMENT:**
            Fill two glasses of water. Speak "love" to one and "hate" to another for a week. Water plants with each. Document the difference.
            """,
          keyInsight:
            "Cymatics proves words create physical patterns. Your 70% water body is being restructured by every word you speak.",
          practiceExercise: PracticeExercise(
            title: "Cymatic Meditation",
            instructions:
              "Chant 'OM' for 5 minutes while focusing on the vibration creating pattern in your body's water.",
            duration: "5 minutes"
          ),
          quiz: EtymologyQuiz(
            question: "What did Emoto's water experiments reveal?",
            options: [
              "Water has no memory",
              "Words physically restructure water's crystalline form",
              "Only written words affect water",
              "Sound has no effect on matter",
            ],
            correctIndex: 1,
            explanation:
              "Words spoken or written create measurable changes in water's structure. Your body is 70% water—your words are reshaping you constantly."
          ),
          rewardBadge: "Sound Alchemist",
          rewardPoints: 150,
          sacredGeometry: .flowerOfLife
        ),
      ]
    ),

    // ═══════════════════════════════════════════════════════════════════
    // MODULE 1: ROOT REVELATIONS
    // ═══════════════════════════════════════════════════════════════════
    EtymologyModule(
      id: "etym1",
      number: 1,
      title: "Root Revelations",
      subtitle: "Trace words to their source",
      icon: "leaf.fill",
      duration: "35 min",
      unlockedByDefault: false,
      teachingStyle: .investigative,
      lessons: [
        EtymologyLesson(
          id: "etym1_1",
          title: "God Names Hidden in Plain Sight",
          teachingMethod: .revelation,
          content: """
            **The Gods Never Left—They're In Your Vocabulary**

            Every day, without realizing it, you invoke ancient deities:

            **THE DAYS OF THE WEEK**

            | Day | Origin | Deity |
            |-----|--------|-------|
            | Sunday | Sun's Day | Sol / Ra / Helios |
            | Monday | Moon's Day | Luna / Selene |
            | Tuesday | Tiw's Day | Tyr (Norse war god) → Mars |
            | Wednesday | Woden's Day | Odin (Norse all-father) → Mercury |
            | Thursday | Thor's Day | Thor (thunder god) → Jupiter |
            | Friday | Freya's Day | Freya (love goddess) → Venus |
            | Saturday | Saturn's Day | Saturn (Chronos, time/death) |

            **THE MONTHS**

            | Month | Origin |
            |-------|--------|
            | January | Janus (two-faced god of beginnings) |
            | February | Februa (purification festival) |
            | March | Mars (god of war) |
            | April | Aphrodite / to open (aperire) |
            | May | Maia (goddess of growth) |
            | June | Juno (goddess of marriage) |
            | July | Julius Caesar (deified) |
            | August | Augustus Caesar (deified) |

            **YOUR WORDS ARE INVOCATIONS**

            Every time you say "Thursday," you invoke Thor.
            Every time you say "cereal," you invoke Ceres (goddess of grain).
            Every time you say "panic," you invoke Pan.
            Every time you say "hypnosis," you invoke Hypnos.
            Every time you say "volcano," you invoke Vulcan.
            Every time you say "ocean," you invoke Oceanus.

            The gods didn't die. They became your vocabulary.

            🔥 **Speaking is summoning. Choose your words as you would choose your gods.**
            """,
          keyInsight:
            "Ancient deities live in our daily vocabulary. Speaking is a continuous act of invocation.",
          practiceExercise: PracticeExercise(
            title: "Deity Word Hunt",
            instructions:
              "Find 10 common English words that contain hidden god names. Research their full mythological meaning.",
            duration: "45 minutes"
          ),
          quiz: EtymologyQuiz(
            question: "Which god do you invoke when you say 'Wednesday'?",
            options: [
              "Thor",
              "Odin (Woden)",
              "Freya",
              "Saturn",
            ],
            correctIndex: 1,
            explanation:
              "Wednesday = Woden's Day. Woden is the Old English name for Odin, the Norse all-father god of wisdom, death, and magic."
          ),
          rewardBadge: "God Namer",
          rewardPoints: 150,
          sacredGeometry: .sriYantra
        ),

        EtymologyLesson(
          id: "etym1_2",
          title: "Latin & Greek: The Hidden Controllers",
          teachingMethod: .deconstruction,
          content: """
            **Why Every Power System Uses Dead Languages**

            Medicine, Law, Science, Religion—what do they have in common?

            They all use **Latin and Greek** to obscure knowledge from the common people.

            **MEDICAL TERMINOLOGY**

            | Scary Term | Simple Meaning |
            |------------|----------------|
            | Hypertension | High blood pressure |
            | Rhinitis | Nose inflammation |
            | Dermatitis | Skin inflammation |
            | Cardiology | Heart study |
            | Oncology | Tumor study |
            | Idiopathic | "We don't know why" |

            Doctors don't use complex terms because they're more accurate. They use them to maintain **priestly authority** over your body.

            **LEGAL TERMINOLOGY**

            | Latin | They Don't Want You To Know |
            |-------|---------------------------|
            | Habeas corpus | "Produce the body" |
            | Pro bono | "For good" (free) |
            | Subpoena | "Under penalty" |
            | Quid pro quo | "Something for something" |
            | In loco parentis | "In place of parent" (they claim to own you) |

            **RELIGIOUS TERMINOLOGY**

            The Bible was kept in Latin for 1,000+ years specifically so common people couldn't read it.

            When Tyndale translated it to English, he was executed.

            Knowledge is power. Obscure language protects power.

            **THE KEY ROOTS**

            Learn these Latin/Greek roots and you can decode 60% of English:

            | Root | Meaning | Examples |
            |------|---------|----------|
            | -ology | Study of | Biology, psychology |
            | -phobia | Fear of | Hydrophobia, claustrophobia |
            | -phil | Love of | Philosophy, bibliophile |
            | -morph | Shape | Morphology, metamorphosis |
            | -gen | Create/birth | Genesis, generate |
            | -path | Feeling/disease | Sympathy, pathology |
            | -cide | Kill | Homicide, genocide |
            | -arch | Rule/first | Monarchy, patriarch |

            🔥 **Break the spell by learning the language of the spell-casters.**
            """,
          keyInsight:
            "Power systems use dead languages to obscure knowledge. Learning roots breaks their monopoly on understanding.",
          practiceExercise: PracticeExercise(
            title: "Root Decoder",
            instructions:
              "Take 5 medical or legal terms you don't understand and break them into Latin/Greek roots. Watch the mystery dissolve.",
            duration: "20 minutes"
          ),
          quiz: EtymologyQuiz(
            question: "Why do medicine, law, and religion use Latin/Greek?",
            options: [
              "These languages are more precise",
              "It's tradition that serves no purpose",
              "To obscure knowledge and maintain priestly authority",
              "English doesn't have enough words",
            ],
            correctIndex: 2,
            explanation:
              "Obscure language creates dependency on 'experts.' If you understood the words, you'd need their authority less."
          ),
          rewardBadge: "Root Master",
          rewardPoints: 175,
          sacredGeometry: .tetrahedron
        ),

        EtymologyLesson(
          id: "etym1_3",
          title: "Proto-Indo-European: The Mother Tongue",
          teachingMethod: .storytelling,
          content: """
            **4,000 Years Ago, One Language Ruled**

            Before Sanskrit. Before Greek. Before Latin.

            There was **Proto-Indo-European (PIE)**—the reconstructed ancestor of nearly half the world's languages.

            From Ireland to India, from Norway to Iran, 3.2 billion people speak languages descended from PIE.

            **THE PIE REVELATION**

            Linguists can reconstruct words that were spoken 6,000 years ago:

            | PIE Root | Meaning | Descendants |
            |----------|---------|-------------|
            | *deywos | Sky god | Zeus (Greek), Deus (Latin), Tyr (Norse), Deva (Sanskrit) |
            | *pəter | Father | Pater (Latin), Father (English), Pitar (Sanskrit), Vader (Dutch) |
            | *māter | Mother | Mater (Latin), Mother (English), Matar (Sanskrit) |
            | *h₂ster | Star | Star (English), Stella (Latin), Aster (Greek), Tara (Sanskrit) |
            | *gʷen | Woman | Queen (English), Gyne (Greek), Jani (Sanskrit) |
            | *h₁nómn̥ | Name | Name (English), Nomen (Latin), Onoma (Greek), Nama (Sanskrit) |

            **THE COSMIC CONNECTION**

            The PIE speakers saw the universe as:
            - **Dyeus Phter** = "Sky Father" → Zeus Pater → Jupiter
            - The sun was the "eye of the sky father"
            - Stars were "strewn ones" (scattered)
            - Humans were "earth-born" (*dhghem → human, humble, humus)

            **YOUR NAME ECHOES 6,000 YEARS**

            When you say "father," you're using the same sound that ancient Vedic priests, Greek philosophers, and Germanic shamans used.

            Language connects you to 6,000 years of consciousness.

            🔥 **Every word is an inheritance from ancestors who understood the power of sound.**
            """,
          keyInsight:
            "Half the world's languages share a common ancestor. Your words carry 6,000 years of encoded wisdom.",
          practiceExercise: PracticeExercise(
            title: "Ancestry of Words",
            instructions:
              "Pick 5 common words (mother, water, fire, star, heart) and trace them through PIE to their cognates in Sanskrit, Greek, and Latin.",
            duration: "40 minutes"
          ),
          quiz: EtymologyQuiz(
            question: "What do 'Zeus,' 'Deus,' 'Tyr,' and 'Deva' have in common?",
            options: [
              "Nothing, they're from different cultures",
              "They all mean 'god' independently",
              "They all descend from PIE *deywos (sky god)",
              "They're all sun gods",
            ],
            correctIndex: 2,
            explanation:
              "These deity names from Greek, Latin, Norse, and Sanskrit all trace back to the same Proto-Indo-European root *deywos, meaning 'sky god' or 'shining one.'"
          ),
          rewardBadge: "Ancestral Voice",
          rewardPoints: 200,
          sacredGeometry: .treeOfLife
        ),
      ]
    ),

    // ═══════════════════════════════════════════════════════════════════
    // MODULE 2: THE ALCHEMY OF SPEECH
    // ═══════════════════════════════════════════════════════════════════
    EtymologyModule(
      id: "etym2",
      number: 2,
      title: "The Alchemy of Speech",
      subtitle: "Transform reality through conscious language",
      icon: "flame.fill",
      duration: "40 min",
      unlockedByDefault: false,
      teachingStyle: .transformative,
      lessons: [
        EtymologyLesson(
          id: "etym2_1",
          title: "Negative Prefixes: Hidden Self-Curses",
          teachingMethod: .revelation,
          content: """
            **You're Cursing Yourself Without Knowing**

            The subconscious mind doesn't process negatives.

            When you say "I am NOT anxious," your brain hears: "I am anxious."
            When you say "Don't think of a pink elephant," what happens?

            **COMMON SELF-CURSES DISGUISED AS GOALS**

            | What You Say | What Your Brain Hears |
            |-------------|----------------------|
            | "I don't want to be poor" | Poor, poor, poor |
            | "I'm not stupid" | Stupid, stupid, stupid |
            | "I won't fail" | Fail, fail, fail |
            | "I'm not afraid" | Afraid, afraid, afraid |
            | "Don't forget" | Forget, forget, forget |

            **THE REFRAME**

            | Curse | Blessing |
            |-------|----------|
            | "I don't want to be poor" | "I am wealthy" |
            | "I'm not stupid" | "I am intelligent" |
            | "I won't fail" | "I succeed" |
            | "I'm not afraid" | "I am courageous" |
            | "Don't forget" | "Remember" |

            **THE PREFIX TRAP**

            These prefixes always point your consciousness at what you DON'T want:
            - Un- (unhappy → happy is the focus word)
            - In-/Im- (impossible → possible is absorbed)
            - Dis- (disease → ease becomes primary)
            - Non- (non-smoker → smoker is the identity)
            - Anti- (anti-war → war dominates the frame)

            **THE FIX**

            State what you ARE, not what you aren't.
            State what you WANT, not what you don't want.
            State what you DO, not what you don't do.

            "I am a non-smoker" → "I breathe freely"
            "I am anti-war" → "I am for peace"
            "I am debt-free" → "I am financially sovereign"

            🔥 **Speak only what you want to create. The universe is literal.**
            """,
          keyInsight:
            "The subconscious ignores negatives. Every 'not,' 'don't,' and 'won't' is secretly programming the opposite.",
          practiceExercise: PracticeExercise(
            title: "Speech Detox",
            instructions:
              "For one day, catch every negative statement you make and reframe it positively. Keep a tally of how many you catch.",
            duration: "1 day"
          ),
          quiz: EtymologyQuiz(
            question: "What does your brain hear when you say 'I won't fail'?",
            options: [
              "Success and victory",
              "Fail, fail, fail",
              "Nothing—it ignores the statement",
              "A neutral command",
            ],
            correctIndex: 1,
            explanation:
              "The subconscious doesn't process 'won't'—it only absorbs 'fail.' State what you will do, not what you won't."
          ),
          rewardBadge: "Curse Breaker",
          rewardPoints: 175,
          sacredGeometry: .icosahedron
        ),

        EtymologyLesson(
          id: "etym2_2",
          title: "I AM: The Most Powerful Spell",
          teachingMethod: .esoteric,
          content: """
            **The Two Words That Create Everything**

            "I AM" is the name of God.

            When Moses asked God's name at the burning bush, the response was:
            **אֶהְיֶה אֲשֶׁר אֶהְיֶה** (Ehyeh Asher Ehyeh)
            "I AM THAT I AM"

            This isn't religious poetry. It's consciousness technology.

            **THE I AM MECHANISM**

            Every time you say "I AM ___," you:
            1. Invoke the creative power of existence itself
            2. Instruct your subconscious to manifest that identity
            3. Broadcast that frequency into reality
            4. Begin conforming to that declaration

            **WHAT MOST PEOPLE DO**

            "I am tired"
            "I am broke"
            "I am stressed"
            "I am stuck"
            "I am not good enough"
            "I am always late"
            "I am bad with money"
            "I am unlucky"

            Every one of these is a binding spell. You're using the name of God to curse yourself.

            **NEVILLE GODDARD'S KEY**

            "The only God you will ever know is your own wonderful human imagination, and 'I AM' is the first principle."

            "I AM" doesn't mean "I currently experience."
            "I AM" means "I am eternally, in my true nature."

            **THE PRACTICE**

            Before you say "I AM," ask: "Do I want to create this?"

            Replace:
            "I am tired" → "I am renewing my energy"
            "I am broke" → "I am wealthy in all ways"
            "I am stressed" → "I am centered and calm"
            "I am stuck" → "I am moving forward"

            🔥 **I AM is the name of God. Use it only to create what you desire.**
            """,
          keyInsight:
            "'I AM' is the most powerful creative force in language. Guard what follows these two words—you're invoking the Divine.",
          practiceExercise: PracticeExercise(
            title: "I AM Audit",
            instructions:
              "Write down every 'I AM' statement you make for 3 days. Categorize them as blessing or curse. Rewrite the curses.",
            duration: "3 days"
          ),
          quiz: EtymologyQuiz(
            question: "According to Exodus 3:14, what is God's name?",
            options: [
              "Yahweh",
              "I AM THAT I AM",
              "The Lord",
              "El Shaddai",
            ],
            correctIndex: 1,
            explanation:
              "Ehyeh Asher Ehyeh = 'I AM THAT I AM.' This reveals that 'I AM' is the creative principle itself—and you use it every time you speak."
          ),
          rewardBadge: "I AM Master",
          rewardPoints: 250,
          sacredGeometry: .seedOfLife
        ),

        EtymologyLesson(
          id: "etym2_3",
          title: "Questions: The Direction of Consciousness",
          teachingMethod: .interactive,
          content: """
            **Questions Program Your Reality Search**

            Your mind is a search engine. Questions are search queries.

            Ask "Why am I so stupid?" and your mind will find evidence of stupidity.
            Ask "Why am I so blessed?" and your mind will find evidence of blessing.

            **THE QUESTION TRAP**

            Disempowering questions that program failure:
            - "Why does this always happen to me?"
            - "What's wrong with me?"
            - "Why can't I ever get ahead?"
            - "Why don't people like me?"
            - "When will things get better?"

            Your brain treats these as genuine queries and searches for answers.

            **POWER QUESTIONS**

            Empowering questions that program success:
            - "What can I learn from this?"
            - "How can I make this work?"
            - "What's the opportunity here?"
            - "What would my highest self do?"
            - "How does it feel to have achieved this?"

            **THE ETYMOLOGY OF 'QUESTION'**

            Question comes from Latin *quaerere* = "to seek"

            A question is literally a seeking.

            What you seek, you find.
            What you ask, you receive.
            The question determines the answer.

            **ADVANCED: PRESUPPOSITIONAL QUESTIONS**

            These questions contain their own answer:

            "Why am I so good at this?" (Presupposes: you are good)
            "How did I become so successful?" (Presupposes: you are successful)
            "When did everything start working out?" (Presupposes: things work out)

            Your brain will search for evidence to support the presupposition.

            🔥 **Master your questions, master your reality.**
            """,
          keyInsight:
            "Questions direct your brain's search function. Ask disempowering questions, find disempowering evidence. Change the question, change the evidence.",
          practiceExercise: PracticeExercise(
            title: "Question Flip",
            instructions:
              "Write 5 disempowering questions you regularly ask yourself. Rewrite each as a presuppositional power question.",
            duration: "15 minutes"
          ),
          quiz: EtymologyQuiz(
            question: "What's wrong with asking 'Why does this always happen to me?'",
            options: [
              "Nothing—it's a valid question",
              "It presupposes victimhood and your brain will search for evidence to confirm it",
              "The grammar is incorrect",
              "It's too emotional",
            ],
            correctIndex: 1,
            explanation:
              "Questions program your brain's search. This question presupposes that bad things 'always' happen to you—your brain will filter reality to confirm this."
          ),
          rewardBadge: "Question Alchemist",
          rewardPoints: 175,
          sacredGeometry: .merkabaField
        ),
      ]
    ),

    // ═══════════════════════════════════════════════════════════════════
    // MODULE 3: WORD WEAPONS & SHIELDS
    // ═══════════════════════════════════════════════════════════════════
    EtymologyModule(
      id: "etym3",
      number: 3,
      title: "Word Weapons & Shields",
      subtitle: "Defend and project with language",
      icon: "shield.lefthalf.filled",
      duration: "35 min",
      unlockedByDefault: false,
      teachingStyle: .practical,
      lessons: [
        EtymologyLesson(
          id: "etym3_1",
          title: "Programming Words They Use Against You",
          teachingMethod: .deconstruction,
          content: """
            **Language Is The First Weapon of Control**

            Every power system uses language to program compliance.

            **MEDIA PROGRAMMING WORDS**

            | Word | Surface Meaning | Hidden Program |
            |------|-----------------|----------------|
            | "Conspiracy theory" | Crazy idea | "Don't investigate this" |
            | "Debunked" | Disproven | "Stop thinking about this" |
            | "Trust the science" | Follow data | "Trust authority figures" |
            | "Misinformation" | False info | "Information we don't approve" |
            | "Extremist" | Radical | "Outside acceptable thought" |
            | "Divisive" | Causing conflict | "Don't discuss this" |

            **CORPORATE PROGRAMMING WORDS**

            | Word | Sounds Like | Actually Means |
            |------|-------------|----------------|
            | "Restructuring" | Improvement | Mass layoffs |
            | "Right-sizing" | Optimization | Firing people |
            | "Negative growth" | A type of growth | Decline/loss |
            | "Human resources" | People management | People as commodities |
            | "Synergy" | Cooperation | Vague justification |
            | "Going forward" | Future focused | "Forget the past" |

            **GOVERNMENT PROGRAMMING WORDS**

            | Phrase | Sounds Like | Actually Means |
            |--------|-------------|----------------|
            | "National security" | Protecting you | "We can't tell you" |
            | "Classified" | Important secrets | "You can't know" |
            | "Collateral damage" | Accident | Killing civilians |
            | "Enhanced interrogation" | Better questioning | Torture |
            | "Conflict" | Disagreement | War |
            | "Police action" | Law enforcement | War without declaration |

            **HOW TO SPOT PROGRAMMING WORDS**

            1. **Euphemisms**: Soft words for hard realities
            2. **Thought-terminators**: Words that end investigation
            3. **Presuppositions**: Assumptions hidden in phrasing
            4. **False dichotomies**: "You're either with us or against us"

            🔥 **Once you see the programming, you can't unsee it.**
            """,
          keyInsight:
            "Power systems use language to control thought. Learn to recognize programming words and they lose their power over you.",
          practiceExercise: PracticeExercise(
            title: "Media Decoder",
            instructions:
              "Watch/read 15 minutes of news. Identify every programming word. What are they trying to make you think/feel/do?",
            duration: "30 minutes"
          ),
          quiz: EtymologyQuiz(
            question: "What's the purpose of the phrase 'conspiracy theory'?",
            options: [
              "To accurately describe unproven theories",
              "To shut down investigation and label questioners as crazy",
              "To encourage critical thinking",
              "To categorize types of theories",
            ],
            correctIndex: 1,
            explanation:
              "The term was popularized by the CIA after the JFK assassination specifically to discredit those questioning the official narrative. It's a thought-terminating cliché."
          ),
          rewardBadge: "Media Immune",
          rewardPoints: 200,
          sacredGeometry: .octahedron
        ),

        EtymologyLesson(
          id: "etym3_2",
          title: "Your Vocabulary Is Your Reality",
          teachingMethod: .transformative,
          content: """
            **The Words You Know Define The Reality You Can Experience**

            An Inuit language has 50+ words for snow because snow is central to survival.

            Financial elites have vocabulary for instruments most people have never heard of.

            Consciousness researchers have terms for states most people never access.

            **YOUR VOCABULARY LIMITS**

            If you don't have a word for something, you can barely perceive it.
            If you can barely perceive it, you can't consciously work with it.

            **EXPANDING YOUR REALITY THROUGH WORDS**

            | Domain | New Words = New Reality |
            |--------|------------------------|
            | Emotions | Learning "saudade" (Portuguese longing) lets you recognize that feeling |
            | Money | Learning "arbitrage," "leverage," "cash flow" opens financial thinking |
            | Consciousness | Learning "kundalini," "samadhi," "jhana" opens spiritual states |
            | Relationships | Learning "attachment styles" reveals hidden dynamics |

            **WORD WEALTH EXERCISE**

            Take any domain where you want to grow:
            1. Find 20 specialized terms in that domain
            2. Learn their precise meanings
            3. Start using them in thought and speech
            4. Watch your perception expand

            **THE BILLIONAIRE'S VOCABULARY**

            Studies show vocabulary correlates with income. Not because smart people earn more—but because **more words = more tools for thinking = more possibilities perceived = more opportunities taken.**

            Warren Buffett can discuss financial instruments you've never heard of. That's not just knowledge—that's expanded reality.

            🔥 **Learn new words, unlock new worlds.**
            """,
          keyInsight:
            "Your vocabulary defines what you can perceive and work with. Expand your vocabulary, expand your reality.",
          practiceExercise: PracticeExercise(
            title: "Domain Expansion",
            instructions:
              "Choose a domain you want to master. Learn 10 new specialized terms this week. Use each in conversation.",
            duration: "1 week"
          ),
          quiz: EtymologyQuiz(
            question: "Why do Inuit languages have 50+ words for snow?",
            options: [
              "They're more primitive and need simple categories",
              "Detailed vocabulary lets them perceive and work with snow in ways impossible for others",
              "It's a myth—all languages have similar vocabulary sizes",
              "Cold climates require more words",
            ],
            correctIndex: 1,
            explanation:
              "Vocabulary isn't just description—it's perception technology. More words for something means finer distinctions, which means expanded ability to perceive and work with reality."
          ),
          rewardBadge: "Reality Expander",
          rewardPoints: 175,
          sacredGeometry: .dodecahedron
        ),
      ]
    ),

    // ═══════════════════════════════════════════════════════════════════
    // MODULE 4: THE MANTRA LABORATORY
    // ═══════════════════════════════════════════════════════════════════
    EtymologyModule(
      id: "etym4",
      number: 4,
      title: "The Mantra Laboratory",
      subtitle: "Engineering words for transformation",
      icon: "waveform",
      duration: "45 min",
      unlockedByDefault: false,
      teachingStyle: .experiential,
      lessons: [
        EtymologyLesson(
          id: "etym4_1",
          title: "The Science of Mantras",
          teachingMethod: .scientific,
          content: """
            **Mantras Aren't Primitive—They're Technology**

            A mantra (from Sanskrit: *man* = mind, *tra* = tool) is a **mind tool**.

            Modern neuroscience confirms what ancient practitioners knew:

            **THE NEUROSCIENCE**

            1. **Repetition rewires neural pathways**
               - Neurons that fire together wire together
               - 40 days of repetition creates new default patterns

            2. **Vibration affects brain waves**
               - Chanting induces alpha and theta states
               - Specific sounds activate specific brain regions

            3. **Focused attention reshapes structure**
               - Meditation physically changes brain matter
               - Mantras provide focus objects for this change

            **THE PHYSIOLOGY**

            1. **Vagus nerve stimulation**
               - Chanting activates the parasympathetic system
               - Reduces cortisol, increases GABA

            2. **Breath regulation**
               - Mantras pace breathing automatically
               - Optimal CO2/O2 balance

            3. **Vocal cord vibration**
               - Sends healing frequencies through the body
               - Creates internal massage of organs

            **TRADITIONAL MANTRAS DECODED**

            | Mantra | Meaning | Effect |
            |--------|---------|--------|
            | OM (AUM) | The sound of creation | Aligns with universal vibration |
            | SO HAM | "I am That" | Identity with infinite |
            | HAM SA | "I am the swan (soul)" | Soul awareness |
            | OM MANI PADME HUM | "Jewel in the lotus" | Compassion activation |
            | GAYATRI | "May we meditate on divine light" | Illumination |

            🔥 **Mantras are ancient brain-hacking technology. Now you know why they work.**
            """,
          keyInsight:
            "Mantras aren't superstition—they're neuroscience, physiology, and consciousness technology combined. Ancient practitioners were sophisticated engineers.",
          practiceExercise: PracticeExercise(
            title: "OM Experiment",
            instructions:
              "Chant OM for 5 minutes daily for 7 days. Document your mental state before and after each session.",
            duration: "7 days"
          ),
          quiz: EtymologyQuiz(
            question: "What does 'mantra' literally mean in Sanskrit?",
            options: [
              "Sacred prayer",
              "Mind tool",
              "Holy word",
              "Divine sound",
            ],
            correctIndex: 1,
            explanation:
              "Man (mind) + tra (tool) = mind tool. Mantras were always understood as technology, not just religious practice."
          ),
          rewardBadge: "Mantra Scientist",
          rewardPoints: 200,
          sacredGeometry: .torus
        ),

        EtymologyLesson(
          id: "etym4_2",
          title: "Creating Your Power Mantras",
          teachingMethod: .interactive,
          content: """
            **Engineer Your Own Reality-Shaping Words**

            You don't have to use ancient Sanskrit. You can create mantras in English that are optimized for YOUR transformation.

            **MANTRA ENGINEERING PRINCIPLES**

            1. **Present tense only**
               - "I am" not "I will be"
               - "I have" not "I will have"

            2. **Positive statements only**
               - "I am healthy" not "I am not sick"
               - "I am wealthy" not "I am not poor"

            3. **Emotionally charged**
               - Include words that create feeling
               - Belief is accelerated by emotion

            4. **Rhythmic and repeatable**
               - Easy to chant
               - Natural breath pattern

            5. **Personally meaningful**
               - References YOUR specific desires
               - Uses YOUR power words

            **FORMULA FOR POWER MANTRAS**

            "I AM + [QUALITY] + AND + [QUALITY]"
            "I + [ACTION] + WITH + [QUALITY]"
            "EVERY DAY + [AFFIRMATION]"

            **EXAMPLES**

            | Goal | Power Mantra |
            |------|--------------|
            | Wealth | "I am abundant and money flows to me easily" |
            | Health | "I am vibrant and my body heals itself perfectly" |
            | Confidence | "I am powerful and I speak my truth boldly" |
            | Love | "I am loved and I radiate love effortlessly" |
            | Success | "I am successful and opportunities find me" |

            **THE 40-DAY PROTOCOL**

            1. Choose or create ONE mantra
            2. Repeat it 108 times daily (one mala)
            3. Same time each day if possible
            4. Continue for 40 consecutive days
            5. If you miss a day, restart from day 1

            🔥 **Engineer your words. Engineer your reality.**
            """,
          keyInsight:
            "You can create mantras as powerful as ancient ones by following specific engineering principles. Your words, designed properly, reshape reality.",
          practiceExercise: PracticeExercise(
            title: "Personal Mantra Creation",
            instructions:
              "Create 3 power mantras for 3 areas of your life (wealth, health, relationships). Use the engineering principles. Choose one for your 40-day practice.",
            duration: "30 minutes"
          ),
          quiz: EtymologyQuiz(
            question: "Why must mantras be in present tense?",
            options: [
              "It's just grammatical tradition",
              "The subconscious only operates in the NOW—future tense creates eternal delay",
              "Past tense is more powerful",
              "Tense doesn't matter",
            ],
            correctIndex: 1,
            explanation:
              "'I will be rich' keeps wealth permanently in the future. 'I am rich' instructs the subconscious to manifest wealth NOW."
          ),
          rewardBadge: "Mantra Engineer",
          rewardPoints: 225,
          sacredGeometry: .hexagram
        ),
      ]
    ),

    // ═══════════════════════════════════════════════════════════════════
    // MODULE 5: INTEGRATION - LIVING THE WORD
    // ═══════════════════════════════════════════════════════════════════
    EtymologyModule(
      id: "etym5",
      number: 5,
      title: "Living The Word",
      subtitle: "Integration and mastery",
      icon: "crown.fill",
      duration: "30 min",
      unlockedByDefault: false,
      teachingStyle: .transformative,
      lessons: [
        EtymologyLesson(
          id: "etym5_1",
          title: "The Verbal Fast",
          teachingMethod: .experiential,
          content: """
            **Silence: The Ultimate Word Power**

            The greatest masters of language know when NOT to speak.

            **WHY SILENCE AMPLIFIES POWER**

            1. **Every word spends energy**
               - Talking disperses shakti (life force)
               - Silence accumulates power

            2. **Observation requires quiet**
               - You can't listen while speaking
               - Insight comes from reception

            3. **Words reveal, silence conceals**
               - Speaking shows your hand
               - Silence keeps your power hidden

            4. **The void is creative**
               - Creation comes from emptiness
               - New words need space to emerge

            **THE MOUNA PRACTICE (Sacred Silence)**

            Traditional yogis practiced MOUNA—complete verbal silence—to accumulate spiritual power.

            **MODERN VERBAL FAST PROTOCOL:**

            **Level 1: Conscious Pause**
            - Before speaking, pause 2 seconds
            - Ask: "Is this necessary? Is this helpful? Is this kind?"

            **Level 2: Half-Day Silence**
            - Choose a half-day weekly
            - No speaking unless absolutely necessary
            - No texting, no writing

            **Level 3: Full-Day Silence**
            - 24 hours without words
            - Internal dialogue awareness
            - Journal observations

            **Level 4: Extended Silence**
            - 3-7 day silent retreat
            - Complete external and internal quiet
            - Profound reset of word habits

            **WHAT YOU'LL DISCOVER**

            - How much you speak unconsciously
            - The energy you waste on trivial words
            - The power that builds in silence
            - New clarity about what deserves words

            🔥 **Master silence to master speech. The greatest speakers know when to say nothing.**
            """,
          keyInsight:
            "Silence accumulates the power that speech spends. The greatest wordsmiths are also masters of strategic silence.",
          practiceExercise: PracticeExercise(
            title: "24-Hour Verbal Fast",
            instructions:
              "Choose a day this week for complete verbal silence. No speaking, texting, or social media. Journal your experience.",
            duration: "24 hours"
          ),
          quiz: EtymologyQuiz(
            question: "Why do yogic traditions practice MOUNA (silence)?",
            options: [
              "They have nothing to say",
              "Silence accumulates shakti (life force) that speech disperses",
              "It's punishment for bad karma",
              "To avoid conflict",
            ],
            correctIndex: 1,
            explanation:
              "Every word spends energy. Silence accumulates power. This is why masters speak rarely—each word carries the weight of accumulated force."
          ),
          rewardBadge: "Silent Master",
          rewardPoints: 200,
          sacredGeometry: .shriYantra
        ),

        EtymologyLesson(
          id: "etym5_2",
          title: "Your Word Is Your Wand",
          teachingMethod: .transformative,
          content: """
            **Graduation: Becoming a Word Master**

            You've traveled through:
            - The spell of spelling
            - The legal word prison
            - Hidden god names
            - Latin/Greek power structures
            - Proto-Indo-European roots
            - Self-cursing patterns
            - I AM consciousness
            - Programming word defenses
            - Mantra engineering
            - Sacred silence

            **THE SYNTHESIS**

            You now understand:

            1. **Words are not just description—they are creation**
            2. **Every word carries frequency, history, and power**
            3. **Language is the primary tool of both liberation and enslavement**
            4. **Your vocabulary defines your perceptible reality**
            5. **Silence is the ground from which powerful words emerge**

            **YOUR NEW OPERATING SYSTEM**

            From this point forward:
            - Guard your "I AM" statements like gold
            - Speak only what you want to create
            - Question every word choice in your environment
            - Trace words to their roots when unclear
            - Use strategic silence to accumulate power
            - Engineer mantras for conscious transformation

            **THE MASTER'S VOW**

            "I recognize that my words are spells.
            I speak consciously, creating only what I desire.
            I decode the programming in language around me.
            I choose my words as carefully as I choose my actions.
            My tongue is my wand. My vocabulary is my grimoire.
            I am a master of the spoken and written word."

            🔥 **Welcome to Word Mastery. Now go create your reality.**

            ---

            *"In the beginning was the Word, and the Word was with God, and the Word was God... and the Word became flesh."* — John 1:1, 14

            The Word didn't just describe creation.
            The Word WAS creation.
            And so are yours.
            """,
          keyInsight:
            "You are now initiated into word mastery. Your tongue is your wand. Speak only what you wish to create.",
          practiceExercise: PracticeExercise(
            title: "Word Master Integration",
            instructions:
              "Review your learning from all modules. Create a personal 'Word Code'—your rules for conscious speech. Commit to living it.",
            duration: "1 hour"
          ),
          quiz: EtymologyQuiz(
            question: "What is the ultimate insight of this course?",
            options: [
              "Words are just labels for things",
              "Words create reality, not just describe it—your tongue is your wand",
              "Etymology is interesting but impractical",
              "Learning word origins makes you sound smarter",
            ],
            correctIndex: 1,
            explanation:
              "Words are creative forces. Every time you speak, you're casting spells, invoking ancient powers, and shaping reality. Master your words, master your reality."
          ),
          rewardBadge: "WORD MASTER",
          rewardPoints: 500,
          sacredGeometry: .cosmicEgg
        ),
      ]
    ),
  ]

  var totalPoints: Int {
    modules.flatMap { $0.lessons }.reduce(0) { $0 + $1.rewardPoints }
  }
}

// MARK: - Etymology Models

struct EtymologyModule: Identifiable {
  let id: String
  let number: Int
  let title: String
  let subtitle: String
  let icon: String
  let duration: String
  let unlockedByDefault: Bool
  let teachingStyle: TeachingStyle
  let lessons: [EtymologyLesson]

  var totalPoints: Int {
    lessons.reduce(0) { $0 + $1.rewardPoints }
  }
}

struct EtymologyLesson: Identifiable {
  let id: String
  let title: String
  let teachingMethod: TeachingMethod
  let content: String
  let keyInsight: String
  let practiceExercise: PracticeExercise
  let quiz: EtymologyQuiz
  let rewardBadge: String
  let rewardPoints: Int
  let sacredGeometry: SacredGeometryShape
}

struct PracticeExercise {
  let title: String
  let instructions: String
  let duration: String
}

struct EtymologyQuiz {
  let question: String
  let options: [String]
  let correctIndex: Int
  let explanation: String
}

// MARK: - Teaching Styles (for course variety)

enum TeachingStyle: String {
  case storytelling = "Storytelling"
  case investigative = "Investigative"
  case transformative = "Transformative"
  case practical = "Practical"
  case experiential = "Experiential"

  var description: String {
    switch self {
    case .storytelling: return "Learn through narrative"
    case .investigative: return "Discover through inquiry"
    case .transformative: return "Change through practice"
    case .practical: return "Apply in real situations"
    case .experiential: return "Know through experience"
    }
  }
}

enum TeachingMethod: String {
  case revelation = "Revelation"
  case deconstruction = "Deconstruction"
  case scientific = "Scientific"
  case esoteric = "Esoteric"
  case interactive = "Interactive"
  case storytelling = "Storytelling"
  case experiential = "Experiential"
  case transformative = "Transformative"
}

// MARK: - Etymology Progress

struct EtymologyProgress: Codable {
  var completedLessons: Set<String> = []
  var completedQuizzes: Set<String> = []
  var earnedBadges: Set<String> = []
  var earnedGeometries: [SacredGeometryShape] = []
  var totalPoints: Int = 0
  var currentModuleIndex: Int = 0
  var streakDays: Int = 0
  var lastPracticeDate: Date?
  var mantrasCreated: [String] = []
  var wordAuditsCompleted: Int = 0

  mutating func completeLesson(
    _ lessonId: String, badge: String, points: Int, geometry: SacredGeometryShape
  ) {
    if !completedLessons.contains(lessonId) {
      completedLessons.insert(lessonId)
      earnedBadges.insert(badge)
      earnedGeometries.append(geometry)
      totalPoints += points
    }
  }

  func isModuleUnlocked(_ moduleNumber: Int) -> Bool {
    if moduleNumber == 0 { return true }
    let course = EtymologyCourse.shared
    guard moduleNumber > 0, moduleNumber <= course.modules.count else { return false }
    let previousModule = course.modules[moduleNumber - 1]
    return previousModule.lessons.allSatisfy { completedLessons.contains($0.id) }
  }

  func moduleProgress(_ moduleId: String) -> Double {
    guard let module = EtymologyCourse.shared.modules.first(where: { $0.id == moduleId }) else {
      return 0
    }
    let completed = module.lessons.filter { completedLessons.contains($0.id) }.count
    return Double(completed) / Double(module.lessons.count)
  }
}
