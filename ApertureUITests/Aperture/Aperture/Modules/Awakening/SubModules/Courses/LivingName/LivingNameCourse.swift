// LivingNameCourse.swift
// THE LIVING NAME - What They Buried When They Changed His Name
// ☀️ SunFlow: Reignited

import SwiftUI

// MARK: - Course Data

struct LivingNameCourse {
  static let shared = LivingNameCourse()

  let id = "living_name"
  let title = "The Living Name"
  let subtitle = "What they buried when they changed his name"
  let icon = "textformat.abc"
  let colorHex = "#FFD700"  // Golden light

  var color: Color {
    Color(hex: colorHex)
  }

  let modules: [LivingNameModule] = [
    // ═══════════════════════════════════════════════════════════════
    // MODULE 1: THE NAME THEY CHANGED
    // ═══════════════════════════════════════════════════════════════
    LivingNameModule(
      id: "name1",
      number: 1,
      title: "The Name They Changed",
      subtitle: "A truth hidden in plain sight",
      icon: "character.book.closed.fill",
      lessons: [
        LivingNameLesson(
          id: "n1_1",
          title: "The Man You Know Was Never Called That",
          content: """
            **Let's begin with the truth they hid in plain sight.**

            The man you know as Jesus was never called that. Not by his mother. Not by his followers. Not by anyone who walked with him.

            His name was **Yeshua** (יֵשׁוּעַ).

            In the ancient world, a name was never a mere label. In Hebraic and Egyptian traditions, to know the name of a being was to have a connection to its essence—its power.

            **A name was a formula. A frequency.**

            And the name Yeshua—which means "salvation"—was an energy spoken from the soul. It was a living declaration.

            A name that couldn't be owned because it was too alive. Too activating.

            **A name that didn't point to a man to be worshipped—but to a state of being to be realized.**

            And when a name wakes up the soul and reminds it of its own power, institutions tremble.

            🔥 **This is the key. The powers that sought to build a religion around him knew that to control the message, they first had to control the man's identity. And that started with changing his name.**
            """,
          keyInsight:
            "Yeshua wasn't just a name—it was a frequency, a code pointing to a state of being to be realized, not a person to be worshipped.",
          practice:
            "Say 'Yeshua' out loud slowly. Notice how different it feels from 'Jesus.' Feel the breath required for each syllable."
        ),

        LivingNameLesson(
          id: "n1_2",
          title: "The Translation Trail",
          content: """
            **To understand the change, we must follow the trail.**

            The original Hebrew name **Yeshua** lost its breathy "sh" sound—a sound that doesn't exist in Greek.

            **The Journey:**

            **Yeshua** (Hebrew: יֵשׁוּעַ)
            ↓
            **Iēsous** (Greek: Ἰησοῦς)
            ↓
            **Iesus** (Latin)
            ↓
            **Jesus** (English, after the letter J was added to the alphabet in the 16th century)

            With each step, the essence was diluted.
            With each translation, the sacred vibration was stripped away.

            **What Was Lost:**

            The "sh" sound (ש - Shin) represents the eternal flame, the fire of the spirit. When Greek couldn't capture this sound, it wasn't just a phonetic loss. It was a spiritual one.

            The final "a" sound connected to the divine breath. Gone.

            The guttural depth of the Hebrew. Smoothed into Roman palatability.

            **They didn't just translate a name. They performed a linguistic exorcism.**

            🔥 **By the time "Jesus" emerged, the living vibration had been replaced with a label. A name you could own, control, and build an institution around.**
            """,
          keyInsight:
            "Each translation stripped away sacred sounds—the Shin (fire), the breath, the depth. By the time we got 'Jesus,' the vibration was gone.",
          practice:
            "Research the letter J. It didn't exist until the 1500s. What does this mean for how we've been pronouncing sacred names?"
        ),

        LivingNameLesson(
          id: "n1_3",
          title: "The Spiritual Inversion",
          content: """
            **They did more than change a name. They performed a spiritual inversion.**

            A mystic who taught of the kingdom **within** was turned into a king who ruled from a heaven **without**.

            A guide who showed the path to **becoming** was transformed into a god who was forever **separate** from you.

            **The Inversion:**

            | What Yeshua Taught | What the Institution Created |
            |-------------------|------------------------------|
            | The kingdom is within you | The kingdom is in heaven |
            | You can become like me | You can never be like him |
            | Direct knowing (gnosis) | Believe what we tell you (pistis) |
            | The Christ is a state | Christ is a person to worship |
            | You are gods (Psalm 82:6) | You are sinners |

            They turned an inner awakening into outer obedience.

            From the **Christ within** to a **Christ enthroned**—forever out of reach.

            **Why?**

            Because a teaching that says "the kingdom is within you" doesn't need:
            - Buildings
            - Priests
            - Intermediaries
            - Tithes
            - Hierarchies

            It only needs **you**.

            🔥 **The name change wasn't linguistic. It was strategic. They buried a key to your own divinity and gave you a label to worship instead.**
            """,
          keyInsight:
            "The inversion: from 'become like him' to 'worship him forever separate.' From inner awakening to outer obedience.",
          practice:
            "List three things you were taught to seek outside yourself that Yeshua said were within you."
        ),
      ]
    ),

    // ═══════════════════════════════════════════════════════════════
    // MODULE 2: THE COUNCIL OF POWER
    // ═══════════════════════════════════════════════════════════════
    LivingNameModule(
      id: "name2",
      number: 2,
      title: "The Council of Power",
      subtitle: "Nicaea and the birth of controlled religion",
      icon: "building.columns.fill",
      lessons: [
        LivingNameLesson(
          id: "n2_1",
          title: "Constantine's Problem",
          content: """
            **To understand the change, we must look not to a temple—but to the throne rooms of power.**

            We must look to the 4th century. To the Roman Emperor Constantine. And to the Council of Nicaea in 325 AD.

            **The Political Reality:**

            The Roman Empire was fracturing. Constantine needed a unifying force—a single creed to bind his subjects.

            The raw, mystical, and decentralized movement of the followers of Yeshua was too wild to be controlled. It had no central authority. No uniform doctrine. Different communities had different gospels, different practices, different understandings.

            **It had to be domesticated.**

            Constantine wasn't a theologian. He was a politician. He didn't care about the nuances of divinity. He cared about:
            - Unity
            - Control
            - Loyalty to Rome

            And the diverse, spirit-led, kingdom-within movement of the early followers? That was a threat.

            **The Solution:**

            Gather the bishops. Establish one creed. One canon. One acceptable version of the story.

            And create a Christ that served the empire—not one that made the empire unnecessary.

            🔥 **This is how Yeshua the awakener became Jesus the Romanized deity.**
            """,
          keyInsight:
            "Constantine needed religious unity for political control. A decentralized mystical movement had to become a centralized institution.",
          practice:
            "Research what Constantine's actual religious beliefs were. Notice: he wasn't baptized until his deathbed."
        ),

        LivingNameLesson(
          id: "n2_2",
          title: "What Was Decided at Nicaea",
          content: """
            **The Council of Nicaea (325 AD) didn't just settle theological debates. It created a religion.**

            **What Was Established:**

            1. **The Nicene Creed** — A statement of belief that all Christians must affirm
            2. **The Nature of Christ** — Declared "of one substance with the Father" (homoousios)
            3. **The Canon** — Which gospels were "in" and which were "out"
            4. **The Date of Easter** — Separating it from Jewish Passover
            5. **Church Structure** — Hierarchy, authority, uniformity

            **What Was Suppressed:**

            - The Gospel of Thomas
            - The Gospel of Mary
            - The Gospel of Philip
            - The Gospel of Truth
            - Dozens of other texts that taught the inner path

            These weren't just "lost." They were actively suppressed, burned, and their followers persecuted.

            **The Creed's Function:**

            The Nicene Creed established what you MUST believe:
            - Christ as eternal God
            - Born of a virgin
            - Crucified, died, rose
            - Will come again to judge

            Notice what's NOT in the creed: any of his actual teachings about the kingdom within, becoming like him, or direct knowing.

            The creed is about WHO he was—not WHAT he taught.

            🔥 **Nicaea created a religion about Jesus. It buried the religion OF Yeshua—the one he actually practiced and taught.**
            """,
          keyInsight:
            "The Nicene Creed established who Christ was—but conspicuously left out what he actually taught about the kingdom within.",
          practice:
            "Read the Nicene Creed. Notice: it's entirely about believing facts about Jesus, not practicing what he taught."
        ),

        LivingNameLesson(
          id: "n2_3",
          title: "The Gospels They Burned",
          content: """
            **In 1945, a discovery in the Egyptian desert revealed what they tried to erase.**

            Near Nag Hammadi, Egypt, a peasant named Muhammad Ali found a sealed jar containing 52 ancient texts—gospels, teachings, and wisdom writings that had been hidden for 1,600 years.

            **Why Were They Hidden?**

            Because in 367 AD, Bishop Athanasius of Alexandria sent a letter ordering all "non-canonical" books to be destroyed. Monks at a nearby monastery, rather than burn their sacred texts, sealed them in a jar and buried them in the desert.

            **What These Texts Reveal:**

            The Nag Hammadi library shows a Christianity radically different from what survived:

            **Gospel of Thomas** — 114 sayings of Jesus, focused entirely on inner awakening:
            > "The kingdom of the father is spread out upon the earth, and people do not see it."

            **Gospel of Philip** — Teaches that Christ is a state to be attained:
            > "You saw the Spirit, you became Spirit. You saw Christ, you became Christ."

            **Gospel of Truth** — Describes salvation as waking from forgetfulness:
            > "The gospel of truth is joy for those who have received grace... knowing themselves."

            **Thunder: Perfect Mind** — The divine feminine speaks in paradoxes that shatter dualistic thinking.

            🔥 **These weren't heretical additions. They were the original teachings—too powerful to let survive because they made the institution unnecessary.**
            """,
          keyInsight:
            "The Nag Hammadi texts reveal an original Christianity focused on becoming, not believing—on inner awakening, not outer worship.",
          practice:
            "Read Gospel of Thomas, Saying 3. Compare it to anything you were taught in Sunday school."
        ),
      ]
    ),

    // ═══════════════════════════════════════════════════════════════
    // MODULE 3: THE HEBREW CODE
    // ═══════════════════════════════════════════════════════════════
    LivingNameModule(
      id: "name3",
      number: 3,
      title: "The Hebrew Code",
      subtitle: "The letters that spell your awakening",
      icon: "textformat.abc.dottedunderline",
      lessons: [
        LivingNameLesson(
          id: "n3_1",
          title: "The Four Sacred Letters",
          content: """
            **The name Yeshua is a master key—composed of four sacred Hebrew letters.**

            Each letter in Hebrew isn't just a sound. It's a symbol, a meaning, a teaching.

            **י - YUD (Y)**
            The divine spark. The seed of potential. The finger of God.
            The smallest letter in the Hebrew alphabet, yet it begins the sacred name of God (YHVH).
            Yud represents the initial impulse of creation—the point from which everything emerges.

            **ש - SHIN (Sh)**
            The eternal flame. The fire of the spirit that transforms and purifies.
            Shin has three heads rising upward—representing the threefold flame of power, wisdom, and love.
            This is the letter of transformation, of spirit descending into matter.

            **ו - VAV (U/W)**
            The nail. The connection that binds the heavens to the earth, the divine to the human.
            Vav is the connector, the bridge. It represents the vertical axis linking above and below.
            In the body, it corresponds to the spine—the channel of ascent.

            **ע - AYIN (A)**
            The eye. Not the physical eye, but the eye of the soul. Perception beyond sight.
            Ayin is silent yet sees all. It represents spiritual vision, the third eye, inner knowing.

            **Together They Spell a Process:**

            The divine spark (Yud) → through the fire of spirit (Shin) → connects you (Vav) → to spiritual sight (Ayin).

            🔥 **The name Yeshua isn't just a name. It's an instruction manual for awakening.**
            """,
          keyInsight:
            "Yeshua's letters spell a process: Divine spark → Fire of transformation → Connection/spine → Spiritual sight.",
          practice:
            "Draw each Hebrew letter. Meditate on what it represents. Feel the journey encoded in the name."
        ),

        LivingNameLesson(
          id: "n3_2",
          title: "The Hidden Name of God",
          content: """
            **The name Yeshua contains a hidden echo of the unpronounceable name of God.**

            The sacred four letters: **YHVH** (יהוה) — Yud, Heh, Vav, Heh.

            This name was considered so holy that it was never spoken aloud. Scribes would wash their hands before writing it. It represented the ultimate reality—Being itself.

            **Yeshua and YHVH:**

            Look at the letters:
            - YHVH: י ה ו ה (Yud-Heh-Vav-Heh)
            - Yeshua: י ש ו ע (Yud-Shin-Vav-Ayin)

            Yeshua contains three of the four letters of the divine name, with **Shin** (fire) inserted in the middle.

            **The Interpretation:**

            The Kabbalists saw this as profound: Yeshua is YHVH with the fire of spirit embodied in human form.

            The unmanifest divine (YHVH) + the transforming fire (Shin) = the divine made manifest (Yeshua).

            **The Logos Made Flesh:**

            This is what John meant: "The Word became flesh."

            The name Yeshua was seen as a living manifestation of the Logos—the divine word that creates worlds.

            Not a man to worship. A **code** to activate.

            🔥 **If people discovered this, they'd realize they didn't need a priest. They only needed the living name—the breath of salvation already within them.**
            """,
          keyInsight:
            "Yeshua contains the sacred name YHVH with Shin (fire) inserted—the divine made manifest, the Logos encoded.",
          practice:
            "Write YHVH. Then write Yeshua. See how the fire (Shin) transforms the unmanifest into the manifest."
        ),

        LivingNameLesson(
          id: "n3_3",
          title: "Speaking the Living Name",
          content: """
            **The name Yeshua was never about worshipping him. It was always a set of instructions for becoming what he became.**

            **The Breath of the Name:**

            Say it slowly: **Ye-shu-a**

            - **Ye** — The breath begins, the divine spark ignites
            - **Shu** — The fire transforms, the spirit moves through
            - **A** — The opening, the eye perceives, completion

            Notice how the name requires breath. Unlike "Jesus" which can be said with the mouth closed, Yeshua demands the breath of life.

            **The Activation:**

            When you speak the name with intention, you're not calling to someone outside yourself. You're activating a code within.

            The Yud awakens the spark in your heart.
            The Shin ignites the fire in your spine.
            The Vav connects above and below.
            The Ayin opens the inner eye.

            **The Ancient Practice:**

            Early followers didn't just say the name. They breathed it. They vibrated it. They let it resonate through their bodies as a form of prayer and transformation.

            This wasn't worship. It was **technology**.

            **Your Practice:**

            Place your hand over your heart. Breathe deeply.

            Whisper: **Yeshua**

            Not to a man in the sky. To the divine light within you.

            Feel the recognition. Feel the remembrance.

            🔥 **That tingling, that deepening of the breath—that's not just pronunciation. It's remembrance and activation.**
            """,
          keyInsight:
            "Speaking 'Yeshua' with breath and intention isn't worship—it's activation. The name is technology for awakening.",
          practice:
            "In a quiet space, breathe the name Yeshua three times. Feel the vibration in your chest, your spine, your head."
        ),
      ]
    ),

    // ═══════════════════════════════════════════════════════════════
    // MODULE 4: PISTIS VS GNOSIS
    // ═══════════════════════════════════════════════════════════════
    LivingNameModule(
      id: "name4",
      number: 4,
      title: "Pistis vs Gnosis",
      subtitle: "Faith vs direct knowing",
      icon: "eye.trianglebadge.exclamationmark",
      lessons: [
        LivingNameLesson(
          id: "n4_1",
          title: "The Two Paths",
          content: """
            **Why go to such lengths to change a name and bury teachings?**

            Because the name was inextricably linked to the teaching. And the teaching was pure spiritual empowerment.

            **Two Greek Words:**

            **Pistis** (πίστις) — Faith, belief, trust in external authority
            **Gnosis** (γνῶσις) — Knowledge, direct experience, inner knowing

            The early church established a system based on **Pistis**:
            - Believe what we tell you
            - Accept the creed
            - Trust the institution
            - Salvation comes through faith in correct doctrine

            But Yeshua taught the path of **Gnosis**:
            - Know thyself
            - Experience directly
            - The kingdom is within
            - Salvation is transformation, not transaction

            **The Critical Difference:**

            **Pistis says:** "Believe what we tell you and you will be saved one day."

            **Gnosis says:** "Know thyself and you will realize you are saved right now."

            🔥 **They needed you to believe salvation was a transaction—an event that happened FOR you 2,000 years ago. Yeshua taught that salvation was a transformation—an inner alchemy that happens WITHIN you.**
            """,
          keyInsight:
            "Pistis: believe and be saved someday. Gnosis: know yourself and realize you are already saved now.",
          practice:
            "Ask yourself: Am I practicing faith in external authority, or cultivating direct inner knowing?"
        ),

        LivingNameLesson(
          id: "n4_2",
          title: "Why Gnosis Was Dangerous",
          content: """
            **If the kingdom is within you, you don't need Rome.**

            You don't need a Pope.
            You don't need a priest.
            You don't even need a savior.

            **You become the one you've been waiting for.**

            This is why Gnosis was declared heresy. Not because it was wrong—but because it was threatening.

            **The Gnostic Threat:**

            A gnostic Christian didn't need:
            - Church buildings (the body is the temple)
            - Ordained priests (you have direct access)
            - Official scripture (truth is revealed within)
            - Institutional sacraments (the inner anointing is real)

            **The Institutional Response:**

            By the 4th century, the Gnostic communities were:
            - Declared heretical
            - Their books burned
            - Their teachers killed
            - Their practices forbidden

            Bishop Irenaeus wrote entire volumes (Against Heresies) attacking them. Not with better arguments—with political power backed by the empire.

            **What They Actually Taught:**

            The Gnostics taught that:
            - The material world was created by a flawed or ignorant deity (the Demiurge)
            - The true God is beyond this world
            - Humans contain a divine spark trapped in matter
            - Yeshua came to awaken that spark
            - Salvation is remembering who you really are

            This wasn't foreign philosophy imposed on Christianity. This was one of the original streams—perhaps THE original stream.

            🔥 **They buried his instructions. But they were not lost. They were preserved—waiting for the ones ready to remember.**
            """,
          keyInsight:
            "Gnosis was declared heresy not because it was wrong, but because it made the institution unnecessary.",
          practice:
            "Consider: What would change in your spiritual life if you truly believed you had direct access to the divine?"
        ),

        LivingNameLesson(
          id: "n4_3",
          title: "The Words They Tried to Erase",
          content: """
            **The Gospel of Thomas contains 114 sayings of Yeshua. Let's enter a sacred space. These are the words they tried to erase.**

            **Saying 3:**
            > "The kingdom is inside of you, and it is outside of you. When you come to know yourselves, then you will become known, and you will realize that it is you who are the sons of the living father."

            Not "believe in me." **Know yourself.**

            **Saying 70:**
            > "If you bring forth what is within you, what you bring forth will save you. If you do not bring forth what is within you, what you do not bring forth will destroy you."

            Salvation is bringing forth what's already inside—not receiving something from outside.

            **Saying 77:**
            > "Split a piece of wood, and I am there. Lift up a stone, and you will find me there."

            The divine is not in a special building or a special book. It is infused in the very fabric of the physical world—waiting to be seen.

            **Saying 113:**
            > His disciples said to him, "When will the kingdom come?" He said, "It will not come by waiting for it. It will not be a matter of saying 'here it is' or 'there it is.' Rather, the kingdom of the father is spread out upon the earth, and people do not see it."

            **He wasn't a god you could never be. He was the blueprint of the Christ within—a mirror showing you your own divine potential.**

            🔥 **These sayings weren't heresy. They were the heart of his teaching. And they buried them because they make you free.**
            """,
          keyInsight:
            "'The kingdom is spread out upon the earth and people do not see it.' — Gospel of Thomas. It's already here. You just need eyes to see.",
          practice:
            "Read Gospel of Thomas in full. It's available free online. Notice how different it feels from the canonical gospels."
        ),
      ]
    ),

    // ═══════════════════════════════════════════════════════════════
    // MODULE 5: THE SACRED SCIENCE
    // ═══════════════════════════════════════════════════════════════
    LivingNameModule(
      id: "name5",
      number: 5,
      title: "The Sacred Science",
      subtitle: "The body as the laboratory of resurrection",
      icon: "figure.mind.and.body",
      lessons: [
        LivingNameLesson(
          id: "n5_1",
          title: "The Inner Anointing",
          content: """
            **Now we arrive at the final gate. The teaching that the physical body itself is the laboratory for spiritual resurrection.**

            Yeshua taught his inner circle that the kingdom was a mechanism. A divine seed.

            **The Word "Christ":**

            The Greek word **Christos** (Χριστός) means "anointed one."

            But what was the anointing? In the exoteric tradition, it was oil poured on a king's head.

            In the esoteric tradition—the mystery schools—it was something else entirely.

            **The Mystery Teaching:**

            The Greek mystery schools, which heavily influenced early Christianity, taught that "Christos" was not just a title—it was a **substance**. A sacred anointing oil that existed within the human body.

            This was not a metaphor. It was what they called mystery science.

            **The Claustrum:**

            In the brain, there is a thin membrane called the **claustrum** (Latin for "cloister" or "hidden place").

            The ancients taught that this is where a sacred fluid is secreted—a substance they called "the oil," "the chrism," or "the sacred secretion."

            This fluid descends the spinal cord once each lunar month.

            Most people waste it—through unconscious living, emotional reactivity, and sexual dissipation.

            But the initiate who understood could protect and refine it.

            🔥 **The Christ wasn't just a person. The Christ was a sacred substance—an inner anointing waiting to be activated.**
            """,
          keyInsight:
            "Christos means 'anointed'—and the mystery schools taught this anointing was an actual substance produced in the body.",
          practice:
            "Research the claustrum in neuroscience. Notice how little is known about its function."
        ),

        LivingNameLesson(
          id: "n5_2",
          title: "The 33 Vertebrae",
          content: """
            **If the sacred oil is protected—if one masters their passions and conserves their life force—something remarkable happens.**

            The oil doesn't dissipate. It descends to the base of the spine. And then, if the conditions are right, **it rises**.

            **The Ascent:**

            The sacred fluid rises back up the **33 vertebrae** of the spine.

            Why 33?
            - The age of Yeshua at his crucifixion and resurrection: 33
            - The number of degrees in certain mystery schools: 33
            - The number of vertebrae in the human spine: 33

            This is not coincidence. This is encoded teaching.

            **The Journey:**

            As the oil ascends, it is refined by the fires of the heart. The heart chakra, the seat of compassion, purifies what rises through it.

            Then it continues upward, through the throat (the word), through the third eye (the vision), until it finally reaches the crown.

            **The Anointing:**

            When this refined substance reaches the pineal gland—the "third eye" in the center of the head—it anoints the optic thalamus and illuminates the entire being.

            This is the true **second coming**: the rising of the Christ within.

            This was the true anointing—not oil on the forehead, but **a rising of light from root to crown**.

            🔥 **The church buried this sacred science because if you knew you had an inner messiah waiting to be raised, you would stop looking for one outside yourself.**
            """,
          keyInsight:
            "33 vertebrae, 33 years, 33 degrees—the resurrection is an inner ascent, the Christ rising within the human spine.",
          practice:
            "Sit upright. Breathe into the base of your spine. Visualize light rising through each vertebra. This is the path."
        ),

        LivingNameLesson(
          id: "n5_3",
          title: "The True Resurrection",
          content: """
            **"The tomb was empty because he fulfilled the code."**

            What if the resurrection wasn't just a historical event—but a template for what's possible within every human being?

            **The Esoteric Reading:**

            - The crucifixion = the crossing (crux) of the energies at the heart
            - The three days in the tomb = the time of inner transformation
            - The resurrection = the rising of the transformed consciousness
            - The ascension = the crown fully illuminated, unity with the divine

            **Paul Knew This:**

            Paul wrote in Galatians 2:20:
            > "I am crucified with Christ: nevertheless I live; yet not I, but **Christ liveth in me**."

            He didn't say "I believe in Christ." He said Christ **lives in him**.

            And in 1 Corinthians 3:16:
            > "Know ye not that ye are the temple of God, and that the Spirit of God dwelleth in you?"

            Not in a building. In YOU.

            **The Template:**

            Yeshua didn't come to be the only one. He came to be the first one—the template, the demonstration.

            He said it clearly in John 14:12:
            > "He that believeth on me, the works that I do shall he do also; and **greater works than these shall he do**."

            Greater works. Not just believe in his works—**do them**.

            🔥 **You are not waiting for a second coming. You ARE the second coming. The sacred isn't out there. It's in here. And it is risen.**
            """,
          keyInsight:
            "Yeshua was the template, not the exception. 'Greater works than these shall you do.' The resurrection is available to you.",
          practice:
            "Re-read John 14:12 until it sinks in. He said you would do GREATER works. What would you do if you believed this?"
        ),
      ]
    ),

    // ═══════════════════════════════════════════════════════════════
    // MODULE 6: THE ACTIVATION
    // ═══════════════════════════════════════════════════════════════
    LivingNameModule(
      id: "name6",
      number: 6,
      title: "The Activation",
      subtitle: "Remembering who you really are",
      icon: "sunrise.fill",
      lessons: [
        LivingNameLesson(
          id: "n6_1",
          title: "This Is Remembrance",
          content: """
            **You have seen:**
            - The name dismantled
            - The vibration erased
            - The teaching buried
            - The seed they tried to keep dormant

            **But now it's time to activate.**

            **The Truth:**

            If you were taught to worship Jesus but never to become like him...
            If you've said his name a thousand times and still felt like something was missing...
            This is the moment your soul has been waiting for.

            **What You Now Know:**

            1. The name Yeshua was a living vibration, not just a label
            2. It was changed through Greek and Latin to strip its power
            3. This was done deliberately at Nicaea to create a controllable religion
            4. The original teachings about the kingdom within were burned
            5. The name contains coded instructions for awakening
            6. The "Christ" is an inner anointing, not just a person
            7. Your body is the temple where this awakening occurs

            **This Isn't New Information:**

            This is remembrance. Something in you already knew this. You've been waiting for permission to remember.

            **This is that permission.**

            🔥 **The tomb was empty because he fulfilled the code. And now that code is reawakening in you.**
            """,
          keyInsight:
            "This isn't learning—it's remembrance. Your soul has been waiting for permission to know what it already knows.",
          practice:
            "Sit with the weight of what you've learned. Let it integrate. Don't rush to conclusions—let it settle."
        ),

        LivingNameLesson(
          id: "n6_2",
          title: "The Declaration",
          content: """
            **You are not fallen. You are descending and ascending.**

            You are not broken. You are being refined.

            You are not separate from God. You forgot—and now you are remembering.

            **Say This:**

            Not to an institution. To yourself. To the divine within.

            "**I am waking up.**

            The name Yeshua is a code I carry within me.

            The kingdom of heaven is not a place I go—it is a state I become.

            The Christ is not only a person I worship—it is a light rising in me.

            I am the temple. My spine is the tree. My heart is the altar. My crown is the throne.

            I do not wait for a second coming. I AM the second coming.

            The sacred isn't out there. It's in here.

            **And it is risen.**"

            🔥 **This is not just words. This is a vibrational declaration. When you speak it with intention, you activate what has been dormant.**
            """,
          keyInsight:
            "Declaration is activation. Speaking these truths with intention is not affirmation—it's awakening.",
          practice:
            "Speak the declaration aloud. Daily. Until it moves from words to knowing to being."
        ),

        LivingNameLesson(
          id: "n6_3",
          title: "Rise",
          content: """
            **The final practice.**

            Find a quiet space. Sit upright. Feet on the floor.

            **Breathe in** deep into your belly.
            **Breathe out** and release the day. Release all you think you know.

            Place your **right hand over your heart**.
            Place your **left hand over your belly**.

            **Whisper the living name.** Not to a man in the sky—to the divine light in you.

            Let the sound vibrate from your heart into your hands.

            Say it three times. With each whisper, feel the recognition grow.

            **"Yeshua."**
            Feel the Yud—the spark—ignite in your heart.

            **"Yeshua."**
            Feel the Vav—the connection—rising up your spine like a vine of light.

            **"Yeshua."**
            Feel the Ayin—the third eye—gently pulse in the center of your forehead.

            **Feel the recognition.**

            This is remembrance.

            The tomb was empty because he fulfilled the code. And now that code is reawakening in you.

            **Go.**

            Walk as the awakened one.
            Walk as the one who knows.
            Walk as the Christ rising—shining with the glory of the Father.

            The kingdom is within you.
            The power is within you.

            **Remember.**

            🔥 **Yeshua. It is done.**
            """,
          keyInsight:
            "The name is the practice. Breathe it. Feel it. Let it rise. You are not learning about awakening—you are awakening.",
          practice:
            "Make this a daily practice. Morning. Evening. Breathe the name. Feel the light. Remember."
        ),
      ]
    ),
  ]
}

// MARK: - Models

struct LivingNameModule: Identifiable {
  let id: String
  let number: Int
  let title: String
  let subtitle: String
  let icon: String
  let lessons: [LivingNameLesson]
}

struct LivingNameLesson: Identifiable {
  let id: String
  let title: String
  let content: String
  let keyInsight: String
  let practice: String
}

/// Equatable conformance for sheet presentation
extension LivingNameModule: Equatable {
  static func == (lhs: LivingNameModule, rhs: LivingNameModule) -> Bool {
    lhs.id == rhs.id
  }
}

extension LivingNameLesson: Equatable {
  static func == (lhs: LivingNameLesson, rhs: LivingNameLesson) -> Bool {
    lhs.id == rhs.id
  }
}
