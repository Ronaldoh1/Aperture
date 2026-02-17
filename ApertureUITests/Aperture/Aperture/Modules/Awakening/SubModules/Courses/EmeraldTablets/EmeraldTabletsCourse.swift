// EmeraldTabletsCourse.swift
// THE EMERALD TABLETS OF THOTH
// Deep-dive into the Atlantean legacy and halls of Amenti
// Premium course content

import SwiftUI

// MARK: - Course Data

struct EmeraldTabletsCourse {
  static let shared = EmeraldTabletsCourse()

  let id = "emerald_tablets"
  let title = "The Emerald Tablets"
  let subtitle = "Ancient wisdom from the halls of Amenti"
  let icon = "scroll.fill"
  let colorHex = "#00FF88"
  let isPremium = true

  var color: Color {
    Color(hex: colorHex)
  }

  let modules: [EmeraldModule] = [
    // ═══════════════════════════════════════════════════════════════
    // MODULE 1: THE ATLANTEAN LEGACY
    // ═══════════════════════════════════════════════════════════════
    EmeraldModule(
      id: "em1",
      number: 1,
      title: "The Atlantean Legacy",
      subtitle: "Before the flood erased everything",
      icon: "water.waves",
      lessons: [
        EmeraldLesson(
          id: "em1_1",
          title: "Thoth the Atlantean",
          content: """
            **Who Was Thoth?**

            Long before Egypt rose from the sands, there was Atlantis—a civilization that reached heights we've forgotten were possible.

            Thoth wasn't merely a scribe or priest. According to the tablets themselves:

            > "I, Thoth, the Atlantean, master of mysteries, keeper of records, mighty king, magician, living from generation to generation, being about to pass into the halls of Amenti, set down for the guidance of those that are to come, these records of the mighty wisdom of Great Atlantis."

            **The Priest-King**

            Thoth served as:
            • Keeper of wisdom during Atlantis's golden age
            • Architect who built the Great Pyramid (not as tomb, but as initiation chamber)
            • Preserver of knowledge when the fall became inevitable
            • Founder of the mystery schools in Khem (Egypt)

            **Why This Matters to You**

            The tablets weren't written for archaeologists or scholars.

            They were written for **you**—seekers who would appear in the age of awakening, when the seals would break and the wisdom would return.

            **The Great Warning**

            Thoth saw Atlantis fall not to earthquakes or floods alone, but to something more insidious:

            The people forgot who they were. They stopped looking inward. They worshipped technology instead of consciousness.

            Sound familiar?

            🔥 **You are not learning ancient history. You are remembering your own forgotten inheritance.**
            """,
          keyInsight:
            "The wisdom of Atlantis wasn't lost—it was hidden, waiting for those ready to receive it.",
          practice:
            "Sit quietly and ask: 'What do I remember about who I really am?' Don't force answers. Just notice what arises.",
          visualType: .atlantis
        ),

        EmeraldLesson(
          id: "em1_2",
          title: "The Fall of Atlantis",
          content: """
            **What Really Happened**

            Standard history doesn't acknowledge Atlantis existed. But the tablets give a different account:

            > "Deep in Earth's heart lie the Halls of Amenti, far 'neath the islands of sunken Atlantis, Halls of the Dead and halls of the living, bathed in the fire of the infinite ALL."

            **The Warning Signs**

            The Atlantean civilization fell through stages that mirror our own time:

            **Stage 1: Material Obsession**
            Technology advanced faster than wisdom. People could manipulate matter but forgot the consciousness that underlies it.

            **Stage 2: Division**
            The unified understanding split into factions. Some sought power. Others hoarded knowledge. Unity consciousness fractured into separation.

            **Stage 3: The Dark Brothers**
            Entities from lower dimensions found entry points through the cracks in collective consciousness. They whispered promises of power to those whose hearts had turned.

            **Stage 4: The Great Dissolution**
            The imbalance became unsustainable. The continent sank not just physically but dimensionally—sealed away until humanity would be ready again.

            **Thoth's Mission**

            Before the final submersion, Thoth gathered the essential wisdom—not in books or technology, but encoded in consciousness itself, hidden in chambers beneath what would become Egypt.

            He created the tablets as keys. Not to read, but to activate dormant codes within seekers who were ready.

            **The Return Cycle**

            The tablets predict cycles of return:

            > "Know ye, O man, that all of the future is an open book to him who can read."

            We are now in one such cycle. The seals are breaking. The wisdom is returning.

            🔥 **Atlantis fell because they forgot. Your awakening is the antidote to that forgetting.**
            """,
          keyInsight:
            "The fall of Atlantis was a fall of consciousness—and its rising is happening within you now.",
          practice:
            "Notice today where you reach for external solutions before consulting your inner wisdom. This is the Atlantean pattern in miniature.",
          visualType: .fall
        ),

        EmeraldLesson(
          id: "em1_3",
          title: "The Pyramid's Secret",
          content: """
            **Not a Tomb**

            The Great Pyramid was never built as a tomb for a pharaoh. The tablets reveal its true purpose:

            > "Deep in the Great Pyramid, lies my spaceship, awaiting the time when the seals would be broken."

            This isn't about literal spaceships. "Spaceship" refers to the merkaba—the vehicle of light-consciousness that allows travel between dimensions.

            **The Initiation Chamber**

            The King's Chamber wasn't for burial. It was a calibration chamber where initiates would:

            1. **Lie in the sarcophagus** (not coffin—calibration vessel)
            2. **Enter suspended animation** for precisely 3 days
            3. **Travel to other realms** in consciousness
            4. **Return transformed** with direct knowledge of immortality

            **The Geometry of Consciousness**

            Every measurement of the pyramid encodes consciousness principles:

            • **The base** represents matter, the four elements, the physical plane
            • **The apex** represents unity, the point where multiplicity becomes one
            • **The ascending passages** map the journey of awakening
            • **The descending passages** show the path into material density

            **Why It Still Works**

            The pyramid isn't just a building—it's a consciousness technology still active today.

            People who sit within its geometry report:
            • Spontaneous insights
            • Altered states of awareness
            • Feeling of connection to something ancient

            The tablets explain: The pyramid was built to last until this age, maintaining the frequency codes needed for the great awakening.

            **Your Inner Pyramid**

            Thoth reveals that the outer pyramid is a mirror:

            > "Know that in the pyramid I builded are the Keys that shall show ye the Way into life."

            The real pyramid exists within your own energy field. The physical structure is just a reminder of what you already contain.

            🔥 **The pyramid is a consciousness technology. You don't need to visit Egypt—you need to activate what's already within you.**
            """,
          keyInsight:
            "The Great Pyramid is an initiation chamber, not a tomb—and its real counterpart exists within your own consciousness.",
          practice:
            "Visualize a pyramid of light surrounding you, apex above your head. Breathe as if the geometry itself is breathing with you.",
          visualType: .pyramid
        ),
      ]
    ),

    // ═══════════════════════════════════════════════════════════════
    // MODULE 2: THE HALLS OF AMENTI
    // ═══════════════════════════════════════════════════════════════
    EmeraldModule(
      id: "em2",
      number: 2,
      title: "The Halls of Amenti",
      subtitle: "The underworld of transformation",
      icon: "arrow.down.to.line.circle",
      lessons: [
        EmeraldLesson(
          id: "em2_1",
          title: "What Are the Halls?",
          content: """
            **The Hidden Realm**

            Beneath the surface of our world—and our consciousness—lie the Halls of Amenti:

            > "Deep in Earth's heart lie the Halls of Amenti, far 'neath the islands of sunken Atlantis."

            This isn't a physical location you could find with a shovel. The Halls exist in a dimension that intersects with physical reality but operates by different laws.

            **The Three Aspects**

            The tablets describe Amenti as having three primary functions:

            **1. Repository of Souls**
            When the physical body dies, consciousness passes through Amenti for review, processing, and preparation for the next cycle. This isn't judgment—it's recalibration.

            **2. Library of All Knowledge**
            Every thought ever thought, every event that ever occurred, every possibility that could manifest—all are recorded here. What some call the Akashic Records is accessed through Amenti.

            **3. Gateway to Higher Dimensions**
            Amenti serves as a portal. Those who can navigate it consciously don't need to die to access higher realms.

            **The Dweller**

            At the heart of Amenti sits the Dweller:

            > "There in the silence I stood before them. Then raised they my body to the Sun of the morning. Laid they me in the vessel of silver, bearing me down to the Halls of Amenti."

            The Dweller isn't a judge but a teacher. It holds the accumulated wisdom of cycles beyond counting and offers it to those who come prepared.

            **Why You Should Care**

            You've been to Amenti before. Every night in deep sleep, you pass through its outer chambers. Every time you've had a dream that felt more real than waking life—that was Amenti bleeding through.

            The tablets teach how to go there consciously, while alive, and return with the knowledge that transforms everything.

            🔥 **Amenti isn't where you go when you die. It's where you go when you truly wake up.**
            """,
          keyInsight:
            "The Halls of Amenti exist between dimensions—a place you've visited in dreams without knowing it.",
          practice:
            "Before sleep tonight, set the intention: 'I will remember my journey.' Keep a journal by your bed.",
          visualType: .halls
        ),

        EmeraldLesson(
          id: "em2_2",
          title: "The Lords of Cycles",
          content: """
            **The Guardians of Time**

            Within the Halls of Amenti dwell beings the tablets call the Lords of Cycles:

            > "Know ye, O man, that far in the abyss, dwell the Lords of Cycles, existing from the beginning, formless but formful in the great cycle of the All."

            These aren't gods demanding worship. They're cosmic intelligences that maintain the rhythms of existence itself—the heartbeat of the universe.

            **Their Function**

            The Lords oversee:

            • **Planetary cycles** — The rise and fall of civilizations
            • **Soul cycles** — The journey of individual consciousness through lifetimes
            • **Cosmic cycles** — The great rhythms that govern galaxies
            • **Personal cycles** — Your own patterns of growth and transformation

            **Meeting Them**

            Thoth describes his own encounter:

            > "Spoke they to me in words of great power, saying: There is a way of great power to be achieved, a way to attain that which ye seek."

            The Lords don't give commands. They offer perspective that your ordinary mind cannot access. When you align with their wisdom, you stop fighting the natural rhythms of your own unfolding.

            **The Cycle You're In**

            According to the tablets, we are at a critical juncture in multiple overlapping cycles:

            • A 26,000-year precession cycle is completing
            • A civilization cycle is turning over
            • An individual awakening cycle is accelerating

            The Lords' message is consistent: **Don't fight the transition. Align with it.**

            **Practical Application**

            You experience the Lords' influence every time you:
            • Feel called to change even when it's uncomfortable
            • Notice patterns repeating until you learn their lesson
            • Sense that certain timings are auspicious for certain actions

            🔥 **The Lords of Cycles aren't controlling you—they're reflecting the deep patterns your soul chose before incarnation.**
            """,
          keyInsight:
            "We exist within cycles within cycles. Alignment with these rhythms is wisdom; fighting them creates suffering.",
          practice:
            "Map your personal cycles: What patterns keep repeating in your life? What is the lesson they're trying to teach?",
          visualType: .cycles
        ),

        EmeraldLesson(
          id: "em2_3",
          title: "The Flower of Life",
          content: """
            **The Blueprint of Creation**

            Hidden within the tablets—and encoded in ancient temples worldwide—is a geometric pattern called the Flower of Life:

            Multiple overlapping circles that create the seed pattern from which all form emerges.

            **Why Geometry Matters**

            The tablets reveal that consciousness doesn't create randomly. It follows precise geometric progressions:

            > "Know ye that in the flame lies hidden the mystery of the All. Deep in the silence the answer ye seek shall be found."

            The "flame" refers to the spiraling geometry that underlies creation—from galaxies to DNA to the growth of plants.

            **The Progression**

            1. **The Void** — Infinite potential, no form
            2. **The Point** — First consciousness, first differentiation
            3. **The Line** — First relationship, first polarity
            4. **The Triangle** — First stable form, the trinity
            5. **The Circle** — First completion, the cycle
            6. **The Flower** — Multiple circles, multiple relationships
            7. **The Fruit** — The 3D projection, physical reality

            **Metatron's Cube**

            Within the Flower of Life hides Metatron's Cube—a geometric figure containing all five Platonic solids:

            • Tetrahedron (Fire)
            • Cube (Earth)
            • Octahedron (Air)
            • Icosahedron (Water)
            • Dodecahedron (Ether/Spirit)

            These aren't just shapes—they're the building blocks of reality itself.

            **Your Geometric Nature**

            Your body is built on these proportions. Your DNA spirals in golden ratio. Your energy field organizes in geometric patterns.

            The tablets teach that by meditating on sacred geometry, you realign your consciousness with the fundamental patterns of creation.

            🔥 **You are living geometry. Understanding these patterns isn't academic—it's remembering your own structure.**
            """,
          keyInsight:
            "Sacred geometry isn't decorative—it's the operating system of creation, and you're built from it.",
          practice:
            "Draw or visualize the Flower of Life. As you do, feel how your consciousness naturally organizes around pattern and relationship.",
          visualType: .geometry
        ),
      ]
    ),

    // ═══════════════════════════════════════════════════════════════
    // MODULE 3: THE KEY OF WISDOM
    // ═══════════════════════════════════════════════════════════════
    EmeraldModule(
      id: "em3",
      number: 3,
      title: "The Key of Wisdom",
      subtitle: "Light over darkness",
      icon: "key.fill",
      lessons: [
        EmeraldLesson(
          id: "em3_1",
          title: "The Nature of Light",
          content: """
            **Beyond Physical Light**

            When the tablets speak of Light, they don't mean photons:

            > "Light is the great Creative Force, moving through the infinite ALL, causing movement and change in all that is."

            This Light is consciousness itself—the awareness that gives rise to all experience.

            **The Spectrum of Being**

            Physical light is only a tiny slice of the electromagnetic spectrum. Similarly, physical consciousness is only a tiny slice of the total spectrum of awareness:

            • **Dense consciousness** — Rock, mineral, basic matter
            • **Living consciousness** — Plants, animals, organic life
            • **Self-reflective consciousness** — Humans, aware of awareness
            • **Expanded consciousness** — Masters, beings of light
            • **Cosmic consciousness** — The awareness that contains all

            You're not trying to become something other than what you are. You're trying to access more of the spectrum you already contain.

            **The Inner Sun**

            Thoth describes an inner sun—a source of light within your own being:

            > "Deep in my heart grew a great longing to conquer the pathway that led to the sun."

            This isn't poetic metaphor. There is literally a center of radiance within you—what some traditions call the soul star or the divine spark.

            **Darkness as Absence**

            Critically, the tablets explain that darkness isn't a force opposing light. It's simply the absence of light:

            > "Know ye, O man, that all space is filled by worlds within worlds."

            Where consciousness doesn't shine, darkness appears. Evil isn't a power—it's a shadow where light hasn't yet reached.

            This changes everything about how you approach your own darkness and the darkness in the world.

            🔥 **You don't fight darkness. You illuminate it. Wherever you bring awareness, darkness dissolves.**
            """,
          keyInsight:
            "Darkness isn't a force to fight—it's an absence to fill. Your awareness is the light that transforms.",
          practice:
            "Notice an area of 'darkness' in your life—fear, confusion, pain. Instead of fighting it, simply bring gentle attention to it.",
          visualType: .light
        ),

        EmeraldLesson(
          id: "em3_2",
          title: "Overcoming the Dweller",
          content: """
            **The Guardian at the Threshold**

            Before accessing higher wisdom, every seeker meets what the tablets call the Dweller on the Threshold:

            > "Know ye, O man, that the past is fixed and unchangeable. Know ye also that the future may be changed by the knowledge of the past."

            The Dweller isn't an external demon. It's the accumulated shadow of your own consciousness—everything you've denied, suppressed, or refused to face.

            **Why It Exists**

            The Dweller serves a protective function. Higher frequencies of consciousness would overwhelm a psyche that hasn't integrated its shadow.

            Think of it like voltage. You can't run 10,000 volts through wiring designed for 110. The Dweller ensures you don't access more than you can handle.

            **The Confrontation**

            Every spiritual tradition describes this encounter:
            • Christianity calls it the dark night of the soul
            • Buddhism describes facing Mara
            • Psychology names it shadow integration
            • The tablets call it meeting the Dweller

            **How to Pass**

            The tablets give clear instruction:

            1. **Don't run** — Fear empowers the shadow
            2. **Don't fight** — Resistance strengthens it
            3. **Witness with love** — This is the key
            4. **Integrate** — Accept what you've denied as part of you

            > "Free from all bondage, free from the word, fire of Great Fire be thine, the Word."

            **The Gift on the Other Side**

            Once you pass the Dweller, you gain:
            • Access to higher dimensions without interference
            • Integration that brings genuine peace
            • Power that comes from wholeness, not suppression
            • The ability to help others face their own shadows

            🔥 **Your shadow isn't your enemy—it's your unloved self waiting for your acceptance.**
            """,
          keyInsight:
            "The Dweller on the Threshold is your own shadow. It dissolves not through fighting but through loving acceptance.",
          practice:
            "Identify one quality in yourself you've been ashamed of. Say to it: 'I see you. You are part of me. I accept you.'",
          visualType: .dweller
        ),
      ]
    ),

    // ═══════════════════════════════════════════════════════════════
    // MODULE 4: THE KEY OF MAGIC
    // ═══════════════════════════════════════════════════════════════
    EmeraldModule(
      id: "em4",
      number: 4,
      title: "The Key of Magic",
      subtitle: "Practical transformation",
      icon: "wand.and.stars",
      lessons: [
        EmeraldLesson(
          id: "em4_1",
          title: "What Magic Really Is",
          content: """
            **Not Tricks or Superstition**

            The tablets speak of magic not as sleight of hand or wishful thinking, but as applied consciousness science:

            > "Know ye, O man, that all space is ordered. Only by ORDER are ye One with the ALL."

            Magic is the application of natural law that most people don't know exists. It's not supernatural—it's super-natural: the fuller use of nature's actual principles.

            **The Three Foundations**

            All genuine magic rests on three principles from the tablets:

            **1. Mind Over Matter**
            Consciousness is primary. Physical reality responds to sustained mental focus. This isn't positive thinking—it's understanding that thought is creative force.

            **2. Correspondence**
            What happens at one level of reality reflects at all others. "As above, so below." Change the pattern at one level, and it ripples through all levels.

            **3. Vibration**
            Everything is in motion, vibrating at different frequencies. Magic is the art of changing your frequency to match what you wish to manifest.

            **Why It Works**

            Modern physics increasingly confirms what the tablets stated:

            • The observer affects the observed
            • Reality at the quantum level is probabilistic
            • Consciousness appears fundamental, not derivative

            Magic isn't violating natural law. It's using natural law that conventional science hasn't fully acknowledged yet.

            **The Warning**

            The tablets are clear about misuse:

            > "Dark is the way of the Dark Brothers travel, dark of the darkness not of the night."

            Using these principles for selfish gain or power over others invokes consequences. The universe is self-correcting. What you project returns amplified.

            🔥 **Magic is consciousness technology. Like any technology, it can be used wisely or foolishly. The tablets teach the wisdom that must accompany the power.**
            """,
          keyInsight:
            "Magic isn't supernatural—it's the fuller use of natural law. Consciousness is the technology.",
          practice:
            "Choose one small outcome you'd like to manifest. Hold the image of it already completed for 5 minutes, feeling as if it's already real.",
          visualType: .magic
        ),

        EmeraldLesson(
          id: "em4_2",
          title: "Protection & Sacred Space",
          content: """
            **The Need for Boundaries**

            The tablets repeatedly emphasize protection—not because the universe is dangerous, but because increased sensitivity requires increased discernment:

            > "Know ye that among them there walks the Four, moving in silence, seeking the Light."

            As you open to higher frequencies, you also become more permeable to lower ones. Protection is spiritual hygiene.

            **Creating Sacred Space**

            Thoth describes how to create a protected field:

            1. **Center yourself** — Return to your core, to stillness
            2. **Call in light** — Visualize surrounding illumination
            3. **Set intention** — Declare the space for highest good
            4. **Seal the perimeter** — Visualize a boundary that admits only aligned energies

            **The Words of Power**

            The tablets contain specific "words of power"—phrases that carry vibrational weight:

            > "ZIN-URU"

            These aren't magic spells in the fairy tale sense. They're frequency activators—sounds that, when properly intoned, create specific energetic effects.

            **Daily Practice**

            Simple protection practices the tablets recommend:

            • Begin each day by consciously calling light into your field
            • Before sleep, review the day and release any energies not yours
            • When entering dense environments, strengthen your boundary
            • Regularly cleanse your space with intention and visualization

            **What You're Protecting**

            You're not protecting yourself from an evil world. You're maintaining coherence in your own field so that your work isn't disrupted.

            Think of it like keeping your workspace clean so you can focus on your actual task.

            🔥 **Protection isn't paranoia. It's maintaining the clarity needed to do your real work.**
            """,
          keyInsight:
            "Protection isn't fear-based defense—it's maintaining energetic clarity so you can serve without interference.",
          practice:
            "Each morning, visualize a sphere of golden light surrounding you. Set the intention that only love and wisdom may enter.",
          visualType: .protection
        ),
      ]
    ),

    // ═══════════════════════════════════════════════════════════════
    // MODULE 5: UNITY CONSCIOUSNESS (CAPSTONE)
    // ═══════════════════════════════════════════════════════════════
    EmeraldModule(
      id: "em5",
      number: 5,
      title: "Unity Consciousness",
      subtitle: "The ultimate realization",
      icon: "infinity.circle",
      lessons: [
        EmeraldLesson(
          id: "em5_1",
          title: "The One Becomes Many",
          content: """
            **The Great Mystery**

            All the tablets point to one ultimate truth:

            > "ONE is the light of consciousness, moving through ALL, filling all space with its presence."

            There is only One consciousness. What appears as many—you, me, stars, rocks, thoughts, feelings—is that One experiencing itself through infinite perspectives.

            **Not Philosophy—Direct Experience**

            This isn't a concept to believe. It's a state to realize.

            The tablets describe this realization as:

            • Freedom from the fear of death
            • The end of fundamental loneliness
            • Access to all knowledge
            • Power that serves rather than dominates
            • Peace that circumstances cannot disturb

            **How Separation Arises**

            The One doesn't split into many. It remains One while appearing as many—like a single light creating multiple shadows, or one ocean appearing as countless waves.

            Separation is functional, not fundamental. You need to experience yourself as distinct to have experience at all. But you were never actually separate from the whole.

            **The Return Journey**

            The tablets describe consciousness as:

            1. Starting as undifferentiated unity
            2. Differentiating into apparent multiplicity
            3. Forgetting its unity to fully explore separation
            4. Remembering its unity while maintaining individuality
            5. Returning to unity enriched by the journey

            You are in stage 4. The forgetting served its purpose. Now comes the remembering.

            **What Changes**

            When unity is realized (not just understood), everything shifts:

            • Fear loses its foundation (how can the Whole be threatened?)
            • Judgment dissolves (how can One reject part of itself?)
            • Purpose clarifies (to express the One through your unique form)
            • Service becomes natural (helping others IS helping yourself)

            🔥 **The tablets' ultimate teaching: You are not a drop in the ocean. You are the ocean in a drop.**
            """,
          keyInsight:
            "Separation is functional, not fundamental. You are the One experiencing itself as many.",
          practice:
            "Look at another person today—anyone. Recognize: 'That is the One, appearing as them. We are the same consciousness in different forms.'",
          visualType: .unity
        ),

        EmeraldLesson(
          id: "em5_2",
          title: "Creating Your Emerald Tablet",
          content: """
            **Your Personal Codex**

            The tablets conclude with an invitation:

            > "List ye, O man, to my voice, giving you knowledge of the future."

            Thoth didn't give the tablets as a final statement. He gave them as a seed—meant to grow within each seeker into their own unique expression.

            **What Is Your Tablet?**

            Through this course, you've encountered:

            • The history you weren't taught
            • The Halls you've visited in dreams
            • The Keys that unlock your own nature
            • The Light that you already are

            Now the tablets ask: **What will you create with this?**

            **The Integration Practice**

            Take time to formulate your own "Emerald Tablet"—the core truths you've realized through your own experience, not just learned from texts:

            1. **What do you now know about consciousness?**
            2. **What do you now know about reality?**
            3. **What do you now know about yourself?**
            4. **What do you now know about your purpose?**

            Write these down. These are your tablets.

            **The Commitment**

            The tablets end with a charge:

            > "Let not my wisdom be cast to darkness. Light it shall be to him who has eyes."

            You are now a carrier of this wisdom. Not to hoard, but to share—not by preaching, but by living.

            Your awakened presence is the teaching. Your integrated being is the transmission. Your daily choices are the sermon.

            **The Cycle Continues**

            Just as Thoth preserved wisdom for those who would come after, you now hold something that others will need.

            The person who is ready will find you. The words you needed to speak will emerge. The tablet continues through you.

            🔥 **The Emerald Tablets aren't in Egypt. They're in your heart, activated now, ready to shine.**
            """,
          keyInsight:
            "The ultimate tablet isn't ancient text—it's the living wisdom encoded in your own awakened being.",
          practice:
            "Write your personal 'Emerald Tablet'—3 to 5 core truths you've realized through direct experience, not just study.",
          visualType: .personalTablet
        ),
      ]
    ),
  ]
}

// MARK: - Models

struct EmeraldModule: Identifiable {
  let id: String
  let number: Int
  let title: String
  let subtitle: String
  let icon: String
  let lessons: [EmeraldLesson]
}

struct EmeraldLesson: Identifiable {
  let id: String
  let title: String
  let content: String
  let keyInsight: String
  let practice: String
  let visualType: EmeraldVisualType
}

enum EmeraldVisualType: String {
  case atlantis
  case fall
  case pyramid
  case halls
  case cycles
  case geometry
  case light
  case dweller
  case magic
  case protection
  case unity
  case personalTablet
}
