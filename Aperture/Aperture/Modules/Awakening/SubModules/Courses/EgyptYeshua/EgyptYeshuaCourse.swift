// EgyptYeshuaCourse.swift
// THE REAL STORY - Egypt, Mystery Schools, and Yeshua

import SwiftUI

struct EgyptYeshuaCourse {
    static let shared = EgyptYeshuaCourse()
    
    let id = "egypt_yeshua"
    let title = "Egypt & Yeshua"
    let subtitle = "The mystery school connection they hid"
    let icon = "pyramid.fill"
    let colorHex = "#FFD700"
    
    var color: Color { Color(hex: colorHex) }
    
    let modules: [EYModule] = [
        
        // ═══════════════════════════════════════════════════════════════
        // MODULE 1: EGYPTIAN MYSTERY SCHOOLS
        // ═══════════════════════════════════════════════════════════════
        
        EYModule(
            id: "ey_egypt",
            number: 1,
            title: "Egyptian Mystery Schools",
            subtitle: "Where the wisdom came from",
            lessons: [
                EYLesson(
                    id: "ey1_1",
                    title: "The Schools of Ancient Egypt",
                    content: """
**The World's First Universities**

Egypt operated mystery schools for thousands of years before Greece existed. These weren't just "temples" - they were universities of consciousness.

**What They Taught:**
• **Mathematics & Geometry** - Sacred proportions, the golden ratio
• **Astronomy** - Precise star mapping, precession of equinoxes
• **Architecture** - Structures we still can't replicate
• **Medicine** - Surgery, pharmacology, anatomy
• **Philosophy** - Metaphysics that predates Greece
• **Initiation** - Direct experience of higher states

**The Greek Connection:**
Every major Greek philosopher studied in Egypt:
- **Pythagoras** - 22 years in Egyptian temples
- **Plato** - 13 years in Egypt
- **Thales** - Learned geometry in Egypt
- **Herodotus** - Admitted Greeks learned from Egypt
- **Democritus** - Studied Egyptian mathematics

Plato wrote: "We are children compared to the Egyptians."

**What The Schools Preserved:**
The mystery schools maintained:
- The knowledge of Atlantis (their own claim)
- Star maps impossibly old
- Technology we don't understand
- Initiatory practices that transformed consciousness

🔥 **The Hidden History**: Greece didn't invent philosophy - they imported it from Africa. This was known until racism required denying African achievement.
""",
                    keyPoints: [
                        "Mystery schools predated Greek philosophy by millennia",
                        "Every major Greek thinker studied in Egypt",
                        "Plato admitted Egyptian superiority",
                        "Western civilization plagiarized Africa"
                    ]
                ),
                
                EYLesson(
                    id: "ey1_2",
                    title: "The Osiris Mystery",
                    content: """
**The Death and Resurrection Story Before Jesus**

Long before Christianity, Egypt taught the death-and-resurrection story through Osiris.

**The Osiris Myth:**
- Osiris, the divine king, is murdered by his brother Set
- His body is dismembered into 14 pieces
- His wife Isis gathers the pieces and reassembles him
- Through her magic, Osiris is resurrected
- He becomes Lord of the Afterlife
- Their son Horus avenges him and restores order

**Sound Familiar?**
- Death of the divine one ✓
- Reassembly/resurrection ✓
- Divine mother figure ✓
- Son who redeems ✓
- Eternal life for believers ✓

**The Initiation:**
In Egyptian mystery schools, initiates underwent a ritual "death and resurrection":
- Placed in a sarcophagus
- Induced into a death-like state for 3 days
- Underwent experiences in the "underworld"
- "Resurrected" with direct knowledge of the afterlife

**The Timeline:**
- Osiris worship: ~2500 BCE (or earlier)
- Jesus: ~30 CE
- 2,500+ years of the story BEFORE Christianity

🔥 **The Pattern**: The resurrection story wasn't invented by Christianity. It was the central mystery teaching of Egypt for millennia.
""",
                    keyPoints: [
                        "Osiris: murdered, dismembered, resurrected",
                        "Isis: divine mother who reassembles him",
                        "Initiates experienced symbolic death for 3 days",
                        "This predates Christianity by 2,500+ years"
                    ]
                ),
                
                EYLesson(
                    id: "ey1_3",
                    title: "The Kemetic Principles",
                    content: """
**The Seven Hermetic Principles**

The Kybalion preserves teachings attributed to Hermes Trismegistus (Thoth) - the Egyptian god of wisdom.

**The Seven Principles:**

1. **Mentalism**: "The All is Mind; The Universe is Mental."
- Consciousness is fundamental, not matter

2. **Correspondence**: "As above, so below; as below, so above."
- The microcosm reflects the macrocosm

3. **Vibration**: "Nothing rests; everything moves; everything vibrates."
- All is energy at different frequencies

4. **Polarity**: "Everything is dual; opposites are identical in nature, but different in degree."
- Hot and cold are the same thing at different levels

5. **Rhythm**: "Everything flows, out and in; everything has its tides."
- All things rise and fall in cycles

6. **Cause and Effect**: "Every Cause has its Effect; every Effect has its Cause."
- Nothing happens by chance

7. **Gender**: "Gender is in everything; everything has its Masculine and Feminine Principles."
- Creation requires both polarities

**These Aren't Philosophy - They're Operating Instructions:**
Each principle is a practical tool for understanding reality. Modern physics is slowly rediscovering them:
- Quantum mechanics confirms mentalism
- Holographic theory confirms correspondence
- String theory confirms vibration

🔥 **What Egypt Knew**: The universe is conscious, interconnected, and operates by knowable laws. This was taught in Africa millennia before Europe "discovered" it.
""",
                    keyPoints: [
                        "Seven principles that describe how reality works",
                        "Attributed to Thoth/Hermes Trismegistus",
                        "Modern physics is rediscovering these",
                        "Practical tools, not abstract philosophy"
                    ]
                )
            ]
        ),
        
        // ═══════════════════════════════════════════════════════════════
        // MODULE 2: THE REAL YESHUA
        // ═══════════════════════════════════════════════════════════════
        
        EYModule(
            id: "ey_yeshua",
            number: 2,
            title: "The Historical Yeshua",
            subtitle: "Before Rome rewrote him",
            lessons: [
                EYLesson(
                    id: "ey2_1",
                    title: "The Missing Years",
                    content: """
**Where Was Jesus Between Ages 12 and 30?**

The Gospels show Jesus at age 12 in the temple, then nothing until age 30 when he begins teaching. That's 18 years unaccounted for.

**The Official Story:**
He was a carpenter in Nazareth. But when he returns, people ask "Where did this man get this wisdom?" If he'd been there the whole time, they'd know.

**The Alternative Evidence:**

**India:**
- The Hemis Monastery in Ladakh has documents called the "Life of Issa"
- Records of a teacher named Issa (Jesus in Arabic) studying with Buddhists
- Nicolas Notovitch claimed to find these in 1887
- Multiple subsequent researchers confirmed similar documents

**Egypt:**
- Early Christian writers (Origen, Celsus) recorded that Jesus studied in Egypt
- The Gospel of Matthew says the family fled TO Egypt
- Egyptian influence is all over his teachings
- The "carpenter" mistranslation: "tekton" means builder/architect/craftsman

**The Essenes:**
- Jewish mystical community at Qumran
- Dead Sea Scrolls show practices similar to Jesus's teachings
- Ritual immersion (baptism), communal meals, apocalyptic teachings
- John the Baptist was likely an Essene

**What He Learned:**
- Egyptian: Mystery school initiation, death/resurrection symbolism
- Buddhist: Compassion, non-attachment, meditation
- Essene: Jewish mysticism, apocalyptic prophecy, ritual purity

🔥 **The Pattern**: A brilliant young man traveled the ancient world, studied with the best teachers, and synthesized their teachings. Rome later erased the connections to control the message.
""",
                    keyPoints: [
                        "18 years completely missing from the record",
                        "Evidence of travel to India and Egypt",
                        "Egyptian mystery school influence clear in teachings",
                        "Essene community connection well-documented"
                    ]
                ),
                
                EYLesson(
                    id: "ey2_2",
                    title: "Egyptian Influence in the Gospels",
                    content: """
**The Parallels They Don't Teach**

Jesus's story contains numerous elements from Egyptian religion:

**Horus and Jesus:**
- Both born to a virgin mother
- Birth announced by a star
- Visited by wise men/magi
- Threatened by a ruler who killed infants
- Baptized in a river at age 30
- 12 disciples/followers
- Walked on water, raised the dead
- Crucified (Horus symbolically), resurrected after 3 days
- Called "the Lamb," "the Light," "the Good Shepherd"

**The Lord's Prayer:**
"Give us this day our daily bread" parallels Egyptian prayers to Osiris for the "bread of eternity."

**"I Am" Statements:**
Jesus's "I am the way, the truth, and the life" echoes the Egyptian "I am" declarations in the Book of the Dead.

**Resurrection:**
The 3-day resurrection matches the Osiris initiatory ritual exactly.

**This Doesn't Mean Jesus Didn't Exist:**
It means the story was told using symbols the ancient world already understood. The mystery school tradition provided the language.

🔥 **What This Means**: Jesus was likely an initiate of the Egyptian mysteries who brought those teachings to Judaism. Rome later literalized the symbols and suppressed the sources.
""",
                    keyPoints: [
                        "Horus/Jesus parallels are extensive",
                        "Egyptian prayers echo in the Gospels",
                        "3-day resurrection matches mystery school ritual",
                        "Symbols were already understood in the ancient world"
                    ]
                ),
                
                EYLesson(
                    id: "ey2_3",
                    title: "Gnostic Christianity",
                    content: """
**The Christianity Rome Destroyed**

Before Rome standardized Christianity, many versions existed. The Gnostics preserved the mystical understanding.

**What Gnostics Believed:**
- **Gnosis** (direct knowledge) over faith/belief
- The material world was created by a flawed deity (Demiurge)
- The true God is beyond this creation
- A divine spark exists within each person
- Salvation = awakening to your true nature
- Jesus was a teacher of awakening, not a blood sacrifice

**The Gospel of Thomas:**
"The Kingdom of God is spread upon the earth, and men do not see it."
"If you bring forth what is within you, what you bring forth will save you."
"When you know yourselves, then you will be known."

This is Buddhism. This is Hinduism. This is what Jesus actually taught before Rome rewrote him.

**Why Rome Destroyed It:**
- No need for priests if you have direct access to the divine
- No hierarchy if everyone has the divine within
- No control if salvation is awakening, not obedience
- No guilt if the body isn't sinful

**The Nag Hammadi Find (1945):**
Buried around 367 CE to hide them from destruction, these texts show a completely different early Christianity - mystical, feminist, focused on direct experience.

🔥 **The Real Teaching**: Jesus taught gnosis - direct knowledge of the divine within. Rome turned it into obedience to hierarchy. The original teaching is available in the suppressed texts.
""",
                    keyPoints: [
                        "Gnostics taught direct experience over belief",
                        "Gospel of Thomas sounds like Buddhism",
                        "Rome destroyed Gnostic texts to maintain control",
                        "Nag Hammadi (1945) preserved the original teachings"
                    ]
                )
            ]
        ),
        
        // ═══════════════════════════════════════════════════════════════
        // MODULE 3: THE SYNTHESIS
        // ═══════════════════════════════════════════════════════════════
        
        EYModule(
            id: "ey_synthesis",
            number: 3,
            title: "The Hidden Tradition",
            subtitle: "What they didn't want you to know",
            lessons: [
                EYLesson(
                    id: "ey3_1",
                    title: "The Perennial Philosophy",
                    content: """
**One Teaching, Many Names**

When you study the world's wisdom traditions, a pattern emerges:

**The Core Teaching (across all traditions):**
1. There is a transcendent Reality/God/Source
2. This Reality exists within each person
3. Direct experience of this is possible
4. This experience is the highest goal of human life
5. The path involves inner purification and awakening
6. Love and compassion are natural results

**Who Taught This:**
- Egyptian: Thoth/Hermes, Mystery Schools
- Hindu: Upanishads, Vedanta, Yoga
- Buddhist: Buddha's awakening
- Jewish: Kabbalah, Merkabah mysticism
- Christian: Gnostics, Mystics (suppressed)
- Islamic: Sufism (marginalized)
- Greek: Plato, Plotinus
- Indigenous: Shamanic traditions worldwide

**Why It Keeps Getting Suppressed:**
This teaching is dangerous to hierarchies because:
- You don't need an intermediary
- Authority comes from within
- No one can sell you what you already have
- Awakened people don't obey blindly

**The Pattern:**
Every time this teaching emerges, power structures suppress it:
- Gnostics → declared heretics
- Mystics → often executed
- Sufis → marginalized in Islam
- Kabbalists → kept secret
- Indigenous → traditions destroyed

🔥 **The Truth**: The same teaching emerges everywhere because it's TRUE. The same teaching is suppressed everywhere because it threatens power.
""",
                    keyPoints: [
                        "Core teaching is identical across traditions",
                        "Direct experience of the divine is the goal",
                        "This teaching threatens hierarchies",
                        "Suppression pattern repeats across cultures"
                    ]
                ),
                
                EYLesson(
                    id: "ey3_2",
                    title: "Your Initiation",
                    content: """
**The Mystery School Tradition Is Available**

You don't need to travel to Egypt or join a secret society. The teachings are preserved and available.

**What the Ancients Knew:**
1. **You are not your body** - You are consciousness having a physical experience
2. **You are not your thoughts** - You are the awareness that observes thoughts
3. **Death is a transition** - Consciousness continues
4. **This world is a school** - Suffering has purpose
5. **Awakening is possible** - Liberation from identification with form

**The Practice:**
Mystery school initiation always involved:
- **Purification** - Of body, mind, emotions
- **Study** - Of sacred teachings
- **Meditation** - Direct experience of inner states
- **Service** - Applying wisdom to help others
- **Community** - Support from fellow seekers

**Modern Mystery Schools:**
The tradition continues in:
- Certain Buddhist lineages
- Authentic yoga traditions
- Esoteric Christianity
- Kabbalistic study
- Sufi orders
- Indigenous traditions

**The Inner Work:**
The ultimate initiation happens within:
- Facing your shadow (the "underworld" journey)
- Dying to the false self (symbolic death)
- Rebirth as awakened consciousness (resurrection)

🔥 **Your Path**: The mystery school is your own consciousness. The initiation is your own awakening. The teaching is available. The choice is yours.
""",
                    keyPoints: [
                        "You don't need permission or membership",
                        "The teachings are preserved and available",
                        "The real initiation is internal",
                        "Your consciousness is the mystery school"
                    ]
                )
            ]
        )
    ]
}

// MARK: - Supporting Types

struct EYModule: Identifiable {
    let id: String
    let number: Int
    let title: String
    let subtitle: String
    let lessons: [EYLesson]
}

struct EYLesson: Identifiable {
    let id: String
    let title: String
    let content: String
    let keyPoints: [String]
}
