// DragonBallCourse.swift
// AWAKENING THROUGH DRAGON BALL - The Hidden Teachings
// "What Toriyama was REALLY teaching us"

import SwiftUI

// MARK: - Dragon Ball Course

struct DragonBallCourse {
  static let shared = DragonBallCourse()

  let id = "dragonball_awakening"
  let title = "Dragon Ball: Hidden Teachings"
  let subtitle = "Consciousness lessons Toriyama embedded"
  let icon = "sparkles"
  let colorHex = "#FF6B00"
  let totalMinutes = 200

  var color: Color {
    Color(hex: colorHex)
  }

  let modules: [DBModule] = [
    // ═══════════════════════════════════════════════════════════════
    // MODULE 1: DRAGON BALL ORIGINAL
    // ═══════════════════════════════════════════════════════════════

    DBModule(
      id: "db_original",
      number: 1,
      title: "Dragon Ball: The Foundation",
      subtitle: "Kid Goku's innocent awakening",
      series: .dragonBall,
      lessons: [
        DBLesson(
          id: "db1_1",
          title: "The Pure Heart Requirement",
          content: """
            **Why Goku Could Ride the Nimbus**

            The Flying Nimbus (Kinto'un) can only carry those with a pure heart. Goku rides it effortlessly. Master Roshi can't. Most adults can't.

            **The Teaching:**
            Children are born awake. Pure consciousness experiencing itself without filters. As we "grow up," we accumulate programming—beliefs, fears, desires—that cloud our original nature.

            Goku represents the awakened state BEFORE conditioning: innocent, present, responsive to the moment. He doesn't overthink—he acts from spontaneous wisdom.

            **The Dragon Ball Quest as Spiritual Journey**
            The seven Dragon Balls scattered across the world represent aspects of consciousness that must be gathered and integrated:
            • Each ball is a chakra
            • Each location is a state of being
            • The dragon (Shenron) is kundalini awakened

            🔥 **Ultra Instinct Seed**: Goku's fighting style from the beginning is intuitive, not analytical. He doesn't plan—he responds. This is the seed of Ultra Instinct, planted in Episode 1.

            **Master Roshi's Training Philosophy**
            "Train hard, study well, and eat and sleep plenty." Roshi understands that physical mastery requires balance. But notice: he gives Goku a TURTLE SHELL to wear, not a training program. The weight forces the body to adapt naturally.

            This is wu wei—creating conditions for natural development rather than forcing growth.
            """,
          concept: "Pure Heart = Unconditioned Awareness",
          keyMoments: [
            "Goku riding Nimbus when others fall through",
            "Goku's tail as symbol of primal/root energy (kundalini)",
            "The moon triggering Oozaru transformation (unconscious shadow)",
          ]
        ),

        DBLesson(
          id: "db1_2",
          title: "The Oozaru: Shadow Integration",
          content: """
            **The Great Ape Transformation**

            When Goku looks at the full moon with his tail intact, he transforms into a giant ape—destructive, unconscious, dangerous. He has no memory of it.

            **The Teaching:**
            The Oozaru represents the SHADOW self—the parts of your psyche you're not aware of. Jung called it "the personal unconscious." These are:
            • Repressed emotions
            • Denied desires
            • Inherited trauma
            • Primal instincts

            Notice: Goku doesn't know he becomes the Oozaru. Most people don't know their shadow either.

            **Grandpa Gohan's Death**
            Goku unknowingly killed his grandfather in Oozaru form. This represents how our unconscious patterns destroy what we love—relationships, opportunities, peace—without us even realizing.

            **Tail Removal = Shadow Work**
            When Goku's tail is permanently removed, he loses the ability to transform uncontrollably. This represents integrating the shadow—becoming aware of unconscious patterns so they no longer control you.

            But something is lost too. The Oozaru had immense power. Shadow integration doesn't mean killing your primal energy—it means consciously accessing it.

            🔥 **The Path Forward**: In Dragon Ball GT (which we skip), Goku regains his tail and learns to control the transformation. But the SUPERIOR path, shown in DBS, is transcending the animal form entirely through Ultra Instinct—consciousness beyond form.
            """,
          concept: "Oozaru = Unconscious Shadow Self",
          keyMoments: [
            "Goku's first Oozaru transformation at Pilaf's castle",
            "Revelation that Goku killed Grandpa Gohan",
            "Tail removal by Kami/Popo",
          ]
        ),

        DBLesson(
          id: "db1_3",
          title: "The World Tournaments: Testing Ego",
          content: """
            **Why Tournaments Matter**

            The World Martial Arts Tournament is where Goku's development is tested publicly. Each tournament reveals his growth.

            **22nd Tournament: Ego Death (Losing to Roshi)**
            Goku loses to Jackie Chun (Master Roshi in disguise). Roshi explains: "If you won now, you'd think you had nothing left to learn."

            **The Teaching:**
            Premature victory creates stagnation. Roshi intentionally defeats Goku to preserve his student's beginner's mind. The ego that thinks "I've arrived" stops growing.

            **23rd Tournament: Confronting the Shadow (Piccolo)**
            Piccolo is the reincarnation of King Piccolo—pure evil, born from Kami's rejected darkness. Goku must defeat not just an external enemy but a symbol of integrated shadow.

            Notice: Goku doesn't KILL Piccolo. He defeats him and then gives him a Senzu bean to heal. This is NOT about destroying the shadow but integrating it. Piccolo later becomes an ally.

            **Mastering the Body**
            Throughout Dragon Ball, power increases through physical training—weighted shells, increased gravity, endurance. This is the first level: mastering the body (gross form).

            🔥 **Evolution Pattern**: Dragon Ball = mastering the physical. DBZ = mastering energy (Ki). DBS = mastering consciousness itself.
            """,
          concept: "Tournaments Test Ego Development",
          keyMoments: [
            "Losing to Jackie Chun teaches humility",
            "Defeating King Piccolo—first confrontation with evil",
            "Mercy to Piccolo Jr.—integration, not destruction",
          ]
        ),
      ]
    ),

    // ═══════════════════════════════════════════════════════════════
    // MODULE 2: DRAGON BALL Z - SAIYAN SAGA
    // ═══════════════════════════════════════════════════════════════

    DBModule(
      id: "dbz_saiyan",
      number: 2,
      title: "DBZ: Discovering Your True Nature",
      subtitle: "Saiyan Saga consciousness lessons",
      series: .dragonBallZ,
      lessons: [
        DBLesson(
          id: "dbz1_1",
          title: "Raditz Reveals: You Are Not Who You Think",
          content: """
            **The Arrival of Raditz**

            Goku has lived his entire life thinking he was an Earthling. Then Raditz lands and shatters this identity: "You're a Saiyan warrior named Kakarot, sent to destroy this planet."

            **The Teaching:**
            Everything you believe about yourself might be wrong. Your name, your story, your purpose—all of it was installed by others. Just as Goku was programmed to destroy Earth but hit his head and forgot, YOU were programmed by family, culture, education—and forgot your true nature.

            **The Wound That Saved Him**
            Goku hit his head as a baby and lost his Saiyan programming. What seems like damage was actually liberation. Sometimes life's wounds are what free us from conditioning.

            **Two Brothers, Two Paths**
            Raditz embraced his Saiyan identity—conquest, pride, destruction.
            Goku transcended it—protection, growth, love.

            Same DNA. Different consciousness.

            🔥 **Key Insight**: Your genetics, your culture, your upbringing do NOT determine who you become. Consciousness can override any programming.

            **Goku's Choice**
            Even knowing he's an alien warrior, Goku chooses Earth. He chooses love over species loyalty. This is what the awakening journey requires: choosing truth over tribal identity.
            """,
          concept: "Identity Is Programmable, Not Fixed",
          keyMoments: [
            "Raditz's revelation: 'You are Kakarot'",
            "Goku's sacrifice to kill Raditz",
            "Piccolo's beam kills both—death of old self",
          ]
        ),

        DBLesson(
          id: "dbz1_2",
          title: "Snake Way: The Journey Inward",
          content: """
            **The Path to King Kai**

            After dying, Goku must travel Snake Way—a million kilometers to reach King Kai for training. This is no accident. It's pure symbolism.

            **The Teaching:**
            Snake Way represents the spiritual path:
            • It's LONG (awakening takes time)
            • It's WINDING (not linear)
            • You can fall off into Hell (HFIL) at any point
            • There are temptations along the way (Princess Snake)
            • You must keep moving forward

            **Princess Snake: Pleasure Trap**
            Goku is seduced by Princess Snake's palace—comfort, beauty, rest. But staying there means never reaching King Kai. Many seekers get trapped in pleasant experiences, mistaking temporary bliss for liberation.

            **Falling Into HFIL**
            Goku falls off Snake Way and lands in Hell. But instead of despair, he finds a way to LAUNCH himself back up. When you fall on the path (and you will), you're not doomed—the fall can become fuel.

            **King Kai: The Eccentric Master**
            King Kai isn't impressive. He tells bad jokes. Lives on a tiny planet. Yet he possesses techniques that can kill gods. Appearances deceive. The greatest teachers often look ordinary.

            🔥 **The 10x Gravity Training**: King Kai's planet has 10x Earth gravity. Training in difficulty creates effortless strength. This is why awakening often involves suffering—it's not punishment, it's pressure that creates diamonds.
            """,
          concept: "The Path Is Long But Necessary",
          keyMoments: [
            "Million-kilometer Snake Way",
            "Resisting Princess Snake's temptation",
            "Training in 10x gravity",
          ]
        ),

        DBLesson(
          id: "dbz1_3",
          title: "Vegeta: The Ego's Peak",
          content: """
            **The Prince of All Saiyans**

            Vegeta arrives as everything Goku isn't: proud, cruel, obsessed with power and status. He is the EGO fully expressed—demanding respect, destroying what challenges him, believing himself superior by birthright.

            **The Teaching:**
            Vegeta represents what happens when identity fuses with achievement. His entire self-worth is "Prince of Saiyans" and "most powerful warrior." When Goku surpasses him, his identity SHATTERS.

            **The Scouter Limitation**
            Vegeta relies on his scouter to measure power levels. When Goku's power exceeds what the scouter can read, Vegeta is lost. He can only understand what he can measure.

            This is rationality without intuition. Science without consciousness. The scouter breaks because reality exceeds its categories.

            **"It's Over 9000!"**
            The famous line represents a paradigm break. The old measuring system cannot contain the new reality. Every genuine transformation exceeds previous frameworks.

            **Goku's Kaioken: Borrowing From the Future**
            Kaioken multiplies your power but damages your body. It's spending energy you don't have—borrowing from your future self. This represents the danger of forced awakening: you can access higher states but not sustain them.

            🔥 **Vegeta's First Loss**: For the first time, Vegeta confronts a reality his ego cannot accept. This is NOT his awakening—that comes much later. But it plants the seed. Ego death begins with ego defeat.
            """,
          concept: "Ego (Vegeta) vs Presence (Goku)",
          keyMoments: [
            "Scouters can't read Goku's true power",
            "Kaioken x3 exceeds measured limits",
            "Vegeta's disbelief at being surpassed",
          ]
        ),
      ]
    ),

    // ═══════════════════════════════════════════════════════════════
    // MODULE 3: DBZ - SUPER SAIYAN TRANSFORMATION
    // ═══════════════════════════════════════════════════════════════

    DBModule(
      id: "dbz_ssj",
      number: 3,
      title: "Super Saiyan: Emotional Breakthrough",
      subtitle: "Frieza Saga & the power of emotion",
      series: .dragonBallZ,
      lessons: [
        DBLesson(
          id: "dbz2_1",
          title: "Namek: The Heart of Awakening",
          content: """
            **Why Namek Matters**

            The journey to Namek isn't just about Dragon Balls—it's about WHY. Goku goes to resurrect his friends. The motivation is love.

            **The Teaching:**
            Every character has their own motivation for going to Namek:
            • Goku: Revive friends (love)
            • Vegeta: Immortality (ego/fear of death)
            • Frieza: Power over universe (domination)
            • Gohan/Krillin: Help Goku (loyalty)

            Notice who wins. Not the strongest, not the most ruthless—the one motivated by love.

            **100x Gravity Training**
            En route to Namek, Goku trains at 100x gravity—10 times harder than King Kai. He nearly kills himself. But each near-death experience (called "Zenkai") makes Saiyans stronger.

            **Zenkai: Growth Through Crisis**
            This is the Saiyan biological metaphor for spiritual growth:
            • Near-death experiences (ego death)
            • Cause massive power increases (consciousness expansion)
            • The closer to death, the greater the growth

            🔥 **Pattern**: Every major transformation in DBZ follows emotional/physical crisis. Not calm practice—CRISIS. This matches reports of sudden awakening in humans: often triggered by trauma, loss, or extreme circumstances.
            """,
          concept: "Motivation Determines Outcome",
          keyMoments: [
            "Goku training at 100x gravity",
            "Near-death = Zenkai boost",
            "Love as the core motivation",
          ]
        ),

        DBLesson(
          id: "dbz2_2",
          title: "Frieza: Confronting Ultimate Evil",
          content: """
            **The Tyrant Emperor**

            Frieza represents absolute evil: he destroyed Planet Vegeta, enslaved entire races, kills without remorse. He is power without conscience.

            **The Teaching:**
            Frieza is what power looks like without awakening. Intelligence without wisdom. Strength without compassion. He's terrifying precisely because he's so capable and so empty.

            **Frieza's Transformations**
            Frieza has FOUR forms, each more powerful:
            1. First form: Controlled, restrained evil
            2. Second form: Power emerging
            3. Third form: Grotesque unleashing
            4. Final form: Sleek, elegant destruction

            **The Inversion**
            Frieza's transformations are the OPPOSITE of Goku's. Goku transforms upward through emotional breakthrough. Frieza transforms through calculation and control. Frieza's final form is about restraining power, not expressing it.

            Evil requires masks. Truth requires none.

            **"You're Not Dealing With the Average Saiyan Warrior"**
            Vegeta believes he's become a Super Saiyan. He's wrong. His transformation is ego-driven, not consciousness-driven. Confidence is not awakening.

            🔥 **Key Insight**: You can grow tremendously powerful while remaining spiritually asleep. Frieza proves that power and wisdom are completely separate tracks. Never confuse capability with consciousness.
            """,
          concept: "Power Without Wisdom Is Tyranny",
          keyMoments: [
            "Frieza's four transformations",
            "Vegeta's false confidence before death",
            "Frieza casually killing thousands",
          ]
        ),

        DBLesson(
          id: "dbz2_3",
          title: "The First Super Saiyan: Pure Emotion",
          content: """
            **"I Am the Super Saiyan, Son Goku!"**

            This is the most iconic moment in anime history. And it's pure consciousness teaching.

            **The Trigger:**
            Frieza kills Krillin—Goku's best friend from childhood. Not in battle. Casually. While laughing.

            Something inside Goku SNAPS.

            **The Teaching:**
            Super Saiyan isn't achieved through training alone. It requires:
            • A pure heart
            • Intense emotional trigger
            • Complete loss of control, then control regained

            Goku transforms through GRIEF and RAGE—emotions we're taught to suppress. But channeled correctly, dark emotions become rocket fuel for transformation.

            **The Visual Symbolism**
            • Hair turns golden (crown chakra activation)
            • Eyes turn teal (third eye opening)
            • Aura blazes (kundalini fire rising)
            • He speaks differently (new consciousness)

            **Controlled Fury**
            Note: Goku doesn't lose control and mindlessly attack. He channels his rage into focused, purposeful action. This is not emotional suppression or explosion—it's emotional MASTERY.

            **What Vegeta Missed**
            Vegeta tried to force the transformation through anger alone. He couldn't achieve it until much later (hyperbolic time chamber) because his anger was EGO-based (hurt pride), not LOVE-based (protecting others).

            🔥 **The Pattern**: Emotional breakthrough → Consciousness transformation → Power increase. The sequence matters. You cannot think your way into awakening. You must FEEL your way through.
            """,
          concept: "Emotional Alchemy = Transformation",
          keyMoments: [
            "Krillin's death triggers transformation",
            "First Super Saiyan in 1000 years",
            "Goku's righteous fury vs. Vegeta's frustrated ego",
          ]
        ),
      ]
    ),

    // ═══════════════════════════════════════════════════════════════
    // MODULE 4: DBZ - CELL SAGA
    // ═══════════════════════════════════════════════════════════════

    DBModule(
      id: "dbz_cell",
      number: 4,
      title: "Cell Saga: The Next Generation",
      subtitle: "Gohan's awakening & letting go",
      series: .dragonBallZ,
      lessons: [
        DBLesson(
          id: "dbz3_1",
          title: "The Hyperbolic Time Chamber",
          content: """
            **A Year in a Day**

            The Hyperbolic Time Chamber allows one year of training in a single day outside. Goku takes Gohan there—not to train himself, but to awaken his SON.

            **The Teaching:**
            True masters understand that their job is to create NEW masters, not to remain supreme. Goku knows Gohan has greater potential than himself.

            **The Environment**
            Inside the chamber:
            • Endless white void
            • Extreme temperature fluctuations
            • 10x gravity
            • Total isolation except your training partner

            This is the INNER WORLD. No distractions. No excuses. Just you and your shadow.

            **Goku's Strategy: Not Fighting, Being**
            Goku doesn't push Gohan to fight harder. He teaches him to MAINTAIN Super Saiyan—to make the transformed state feel normal, not strained.

            This is key: Don't try to stay in peak states. Make elevated states your new baseline.

            **Ascended Super Saiyan (Grade 2, Grade 3)**
            Vegeta and Trunks find "upgrades" to Super Saiyan—more muscle, more power. But these forms are SLOWER. More power, less function.

            Goku and Gohan find a better way: Full Power Super Saiyan—maintaining the form effortlessly, with no energy drain.

            🔥 **Key Insight**: The goal isn't to access higher states temporarily. It's to stabilize them until they become your new normal. Integration over intensity.
            """,
          concept: "Stabilizing Higher States",
          keyMoments: [
            "Year of isolated training in a day",
            "Full Power Super Saiyan vs. Ascended forms",
            "Goku's trust in Gohan's potential",
          ]
        ),

        DBLesson(
          id: "dbz3_2",
          title: "Cell: The Perfect Shadow",
          content: """
            **The Bio-Android**

            Cell is created from the cells of every warrior—Goku, Vegeta, Piccolo, Frieza. He represents all their powers combined. He is the ULTIMATE SHADOW—every fighter's darkness made manifest.

            **The Teaching:**
            Cell is what happens when you try to acquire qualities externally rather than develop them internally. He absorbs beings to gain their power. He has no original nature—only stolen potential.

            This is spiritual materialism: collecting experiences, teachers, techniques—without doing the inner work of transformation.

            **Cell's Obsession with Perfection**
            Cell's goal is to absorb Androids 17 and 18 to achieve his "Perfect Form." His entire identity is built on reaching this state.

            Sound familiar? "Once I achieve X, THEN I'll be complete."

            **The Irony**
            Even in his Perfect Form, Cell isn't satisfied. He creates a tournament because he needs to PROVE his perfection. True completeness needs no validation.

            **Vegeta's Mistake**
            Vegeta LETS Cell become perfect because he wants a worthy opponent. His ego needs challenge to feel alive. This is the danger of attachment to struggle—you create enemies to maintain identity.

            🔥 **Key Insight**: Cell represents the spiritual seeker who is always adding, never transforming. Collecting techniques, beliefs, experiences—but never BEING the change.
            """,
          concept: "Absorption vs Transformation",
          keyMoments: [
            "Cell absorbing beings for power",
            "Vegeta's ego letting Cell transform",
            "Perfect Cell still seeking validation",
          ]
        ),

        DBLesson(
          id: "dbz3_3",
          title: "Gohan's Awakening: SSJ2",
          content: """
            **"Release It, Gohan"**

            This is arguably the deepest moment in all of DBZ. Goku has done something unprecedented: trusted his 11-year-old son to defeat the enemy HE cannot defeat.

            **The Teaching:**
            Gohan has suppressed his power his entire life. Chi-Chi (society/mother) wanted him to be a scholar, not a fighter. Goku (father/spirit) saw his true potential but let him choose.

            Gohan's power emerges when he's ANGRY—but he's been taught to suppress anger. His potential has been CAGED by conditioning.

            **Android 16's Sacrifice**
            Android 16—a mechanical being with a gentle soul—tells Gohan it's okay to fight, to feel rage, to protect what you love. Then Cell destroys him.

            16's head speaks final words: "It is not a sin to fight for the right cause. There are those who words alone will not reach."

            **The Dam Breaks**
            Gohan SNAPS. Not just angry—TRANSFORMED. SSJ2 is born from love (protecting friends), rage (witnessing evil), and release (finally letting go of suppression).

            The lightning, the sharper hair, the cold fury—this is what happens when HELD POTENTIAL finally unleashes.

            **Goku's Sacrifice**
            Cell triggers self-destruct. Goku teleports Cell away, dying in the process. Father passes torch to son. The old must die for the new to fully emerge.

            🔥 **Key Insight**: Your greatest power might be what you've suppressed your whole life. Awakening sometimes means releasing what you've been told is "wrong" about you.
            """,
          concept: "Suppressed Potential Released",
          keyMoments: [
            "16's speech about righteous fighting",
            "Gohan's SSJ2 transformation",
            "Father-Son Kamehameha (Goku's spirit assisting)",
          ]
        ),
      ]
    ),

    // ═══════════════════════════════════════════════════════════════
    // MODULE 5: DRAGON BALL SUPER - ULTRA INSTINCT
    // ═══════════════════════════════════════════════════════════════

    DBModule(
      id: "dbs_ultra",
      number: 5,
      title: "Dragon Ball Super: Ultra Instinct",
      subtitle: "Beyond thought, beyond form",
      series: .dragonBallSuper,
      lessons: [
        DBLesson(
          id: "dbs1_1",
          title: "Battle of Gods: Humility Returns",
          content: """
            **The Arrival of Beerus**

            After years of being the strongest, Goku meets Beerus—the God of Destruction. And is defeated with a single finger.

            **The Teaching:**
            No matter how far you've come, there's always further to go. Goku had become complacent in his power. Beerus shatters that comfort.

            This is the return of beginner's mind: humility in the face of what you don't know.

            **Super Saiyan God: Divine Ki**

            To challenge Beerus, Goku needs God Ki—energy fundamentally different from mortal Ki. The ritual requires five Saiyans pouring their energy into a sixth with a pure heart.

            **The Teaching:**
            Divine consciousness cannot be achieved alone. It requires community—others who support your elevation. Goku couldn't become Super Saiyan God by himself.

            **The Absorption**
            After the ritual, Goku's God power fades... but he's absorbed its essence. The temporary state becomes an integrated ability.

            This is how genuine insight works: you glimpse higher states, lose them, but something remains. Each glimpse leaves a residue until the state becomes stable.

            🔥 **Key Insight**: True power comes through surrender (ritual), community (other Saiyans), and integration (absorbing the state). Not through ego-driven pushing.
            """,
          concept: "Divine Power Through Community & Surrender",
          keyMoments: [
            "Beerus defeats Goku in seconds",
            "Super Saiyan God ritual requires five others",
            "Goku absorbs divine energy permanently",
          ]
        ),

        DBLesson(
          id: "dbs1_2",
          title: "Super Saiyan Blue: Controlled God Ki",
          content: """
            **The Next Evolution**

            Super Saiyan Blue (SSB) combines Super Saiyan with divine Ki. It's calmer than previous forms—no rage, no strain.

            **The Teaching:**
            SSB represents moving beyond emotion-fueled transformation. Previous levels required anger, loss, desperation. Blue requires CALM INTENSITY.

            This is the shift from reactive awakening to proactive awakening. Instead of crisis-triggered transformation, you deliberately access higher states.

            **The Flaw in Blue**
            Despite its power, SSB has limits. It can be stamina-drained. It can be overwhelmed. It's still GOKU transforming—still subject-object duality.

            **Goku Black: The Shadow Counterpart**
            Zamasu (a Supreme Kai) uses the Super Dragon Balls to steal Goku's body, becoming "Goku Black." He achieves SSB-level power but uses it for destruction.

            **The Teaching:**
            Divine power without wisdom becomes divine destruction. Zamasu believes mortals are evil and must be eliminated—he's using god-level consciousness for ego-level goals. This is spiritual narcissism: using awakening to justify your agenda.

            🔥 **Key Insight**: Super Saiyan Blue is not the ceiling. It's still a form, still an identity, still duality. The next step requires going beyond form entirely.
            """,
          concept: "Calm Intensity Over Reactive Emotion",
          keyMoments: [
            "First SSB appearance vs Golden Frieza",
            "Blue's stamina weakness",
            "Goku Black showing corrupted god power",
          ]
        ),

        DBLesson(
          id: "dbs1_3",
          title: "Ultra Instinct Sign: The Body Moves",
          content: """
            **Tournament of Power: Elimination Stakes**

            The Tournament of Power—eight universes fighting for survival. Lose, and your entire universe is erased. The stakes are existential.

            **The Teaching:**
            Sometimes the highest transformations only emerge when EVERYTHING is at stake. Ego considerations drop away when facing annihilation.

            **Goku's Spirit Bomb Failure**
            Goku creates the largest Spirit Bomb ever against Jiren. It fails. He falls INTO his own Spirit Bomb. Everyone thinks he's dead.

            Then—something unprecedented emerges.

            **Ultra Instinct Sign (-Sign-)**

            From the explosion, Goku rises in a form no one recognizes. Not more power—DIFFERENT power. His body moves without thought. He doesn't decide to dodge; he dodges. He doesn't plan attacks; they happen.

            **The Teaching:**
            Ultra Instinct is the body moving on its own—consciousness bypassing the thinking mind entirely. The Grand Priest explains: "He's attacking and defending without thinking. This is Ultra Instinct—a state even gods struggle to achieve."

            This is WU WEI made manifest. Action without actor. Movement without mover.

            **Why It's Silver, Not Golden**
            Previous transformations added color, intensity, fire. Ultra Instinct adds NOTHING. Silver is the color of pure reflection—no filter, no distortion. The mind becomes a mirror.

            🔥 **Key Insight**: Ultra Instinct isn't a power increase. It's a paradigm shift. Not becoming MORE—becoming EMPTY. The ego dissolves; pure response remains.
            """,
          concept: "Beyond Thought: Body as Consciousness",
          keyMoments: [
            "Falling into the Spirit Bomb",
            "First Ultra Instinct emergence",
            "Gods recognizing something beyond their power",
          ]
        ),

        DBLesson(
          id: "dbs1_4",
          title: "Mastered Ultra Instinct: The Complete Form",
          content: """
            **"This Is the Culmination of Everything"**

            Against Jiren, Goku achieves Mastered Ultra Instinct—complete integration of offensive and defensive instinct. His hair turns silver, his eyes are pure, his movement is absolute.

            **The Teaching:**
            Ultra Instinct Sign was defensive—the body dodging without thought. Mastered Ultra Instinct is COMPLETE—attacking without intention, defending without fear, existing without ego.

            **Whis's Teaching Finally Understood**
            Throughout Super, Whis told Goku: "You think too much when you fight. Let your body move on its own." Goku intellectually understood but couldn't embody it.

            Mastered Ultra Instinct is not understanding the teaching—it's BEING the teaching.

            **Why Goku Surpasses the Gods**
            Even Beerus hasn't mastered Ultra Instinct. The Gods of Destruction are powerful but still ruled by emotion. Goku—the mortal who started with a pure heart—achieves what gods could not.

            **The Teaching:**
            Spiritual purity outranks spiritual power. Goku's "purity" isn't moral perfection—it's freedom from agenda. He fights for the joy of challenge and the protection of others. No ego to defend, no self to preserve.

            **Loss and Return**
            After the tournament, Goku cannot access Ultra Instinct at will. The state came from extreme crisis. But the seed is planted. He knows it's possible. That changes everything.

            🔥 **The Ultimate Teaching**: Ultra Instinct is not a transformation Goku does. It's what remains when Goku gets out of the way. The form isn't added—the ego is subtracted. This is the deepest message of Dragon Ball: YOU ARE ALREADY THAT. Stop adding. Start releasing.
            """,
          concept: "Ego Subtraction, Not Power Addition",
          keyMoments: [
            "Silver hair, complete form",
            "Surpassing the Gods of Destruction",
            "Loss of the state after crisis passes",
          ]
        ),
      ]
    ),

    // ═══════════════════════════════════════════════════════════════
    // MODULE 6: INTEGRATED TEACHINGS
    // ═══════════════════════════════════════════════════════════════

    DBModule(
      id: "db_integrated",
      number: 6,
      title: "The Complete Dragon Ball Path",
      subtitle: "Synthesis of all teachings",
      series: .synthesis,
      lessons: [
        DBLesson(
          id: "db_final_1",
          title: "The Evolution Map",
          content: """
            **The Complete Progression**

            Let's map the entire Dragon Ball journey as a consciousness evolution:

            **DRAGON BALL (Body Mastery)**
            • Kid Goku: Pure heart, innocent presence
            • Oozaru: Unconscious shadow
            • World Tournaments: Testing ego
            • Level: Physical mastery, gut instinct

            **DBZ SAIYAN SAGA (Identity Crisis)**
            • Raditz revelation: You're not who you think
            • Snake Way: The spiritual journey
            • Vegeta: Peak ego as opponent
            • Level: Questioning identity, beginning energy work

            **DBZ FRIEZA SAGA (Emotional Breakthrough)**
            • Super Saiyan: Emotion-fueled transformation
            • Love as motivation (friends)
            • Rage as fuel (Krillin's death)
            • Level: Emotional alchemy, first major awakening

            **DBZ CELL SAGA (Generational Transfer)**
            • Hyperbolic Time Chamber: Intense inner work
            • Cell: Integrated shadow
            • Gohan's awakening: Suppressed potential released
            • Level: Passing the torch, stabilizing states

            **DBZ BUU SAGA (Fusion & Transcendence)**
            • Fusion: Two beings becoming one
            • Spirit Bomb: Power of collective consciousness
            • Goku's sacrifice for Earth
            • Level: Unity consciousness, selfless action

            **DBS (Divine & Beyond)**
            • SSG: Divine through community
            • SSB: Calm intensity, controlled god power
            • Ultra Instinct: Beyond ego entirely
            • Level: Non-dual awareness, action without actor

            🔥 **The Full Arc**: Body → Energy → Emotion → Identity → Unity → Emptiness. This is the complete map.
            """,
          concept: "Complete Consciousness Evolution Map",
          keyMoments: [
            "Each series = a level of development",
            "Physical → Energetic → Emotional → Spiritual → Non-dual",
            "Integration is the final stage",
          ]
        ),

        DBLesson(
          id: "db_final_2",
          title: "Why Dragon Ball Is Spiritual Teaching",
          content: """
            **Not Just Entertainment**

            Akira Toriyama may not have consciously designed a spiritual curriculum. But he created characters who evolve, transform, and transcend—and millions of children absorbed these patterns.

            **What Dragon Ball Taught Us:**
            • Training transforms you (practice matters)
            • Crisis catalyzes growth (welcome difficulty)
            • Pure heart accesses power (intention matters)
            • Shadow must be integrated, not destroyed (Piccolo becomes ally)
            • There's always another level (never stop growing)
            • Ego gets defeated (Vegeta's constant lesson)
            • Love defeats evil (Goku's consistent motivation)
            • The student surpasses the master (Gohan, Goku → Ultra Instinct)
            • Emptiness is fullness (Ultra Instinct)

            **The Global Impact**
            Dragon Ball Z arrived in America (and worldwide) in the 1990s. An entire generation grew up with these stories. The vocabulary of transformation—"going Super Saiyan," "powering up," "next level"—entered the culture.

            You didn't know it, but you were receiving spiritual initiation through Saturday morning cartoons.

            **Why This Matters Now**
            The awakening you're pursuing has already been modeled for you. The path was hidden in entertainment. Now you see the code.

            🔥 **The Deepest Teaching**: Goku never tries to be "spiritual." He just trains, protects his friends, enjoys fighting, and keeps growing. Awakening isn't about becoming someone else—it's about becoming MORE yourself. No pretense. No performance. Just authentic development.

            This is Ultra Instinct OS: Your natural state when you stop pretending.
            """,
          concept: "Entertainment as Initiation",
          keyMoments: [
            "Toriyama as unconscious guru",
            "Generational transmission through story",
            "You've already been prepared",
          ]
        ),
      ]
    ),
  ]
}

// MARK: - Supporting Types

enum DBSeries: String, Codable {
  case dragonBall = "Dragon Ball"
  case dragonBallZ = "Dragon Ball Z"
  case dragonBallSuper = "Dragon Ball Super"
  case synthesis = "Synthesis"

  var color: Color {
    switch self {
    case .dragonBall: return Color(hex: "#FF6B00")
    case .dragonBallZ: return Color(hex: "#FFD700")
    case .dragonBallSuper: return Color(hex: "#00BFFF")
    case .synthesis: return Color(hex: "#9C27B0")
    }
  }
}

struct DBModule: Identifiable {
  let id: String
  let number: Int
  let title: String
  let subtitle: String
  let series: DBSeries
  let lessons: [DBLesson]

  var totalDuration: Int {
    lessons.count * 10
  }  // ~10 min each
}

struct DBLesson: Identifiable {
  let id: String
  let title: String
  let content: String
  let concept: String
  let keyMoments: [String]
}

// MARK: - Progress

struct DragonBallProgress: Codable {
  var completedLessons: [String]
  var notes: [String: String]
  var lastAccessed: Date?

  static var `default`: DragonBallProgress {
    DragonBallProgress(completedLessons: [], notes: [:], lastAccessed: nil)
  }
}
