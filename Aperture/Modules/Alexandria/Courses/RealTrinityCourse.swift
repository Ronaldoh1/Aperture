// RealTrinityCourse.swift
// THE REAL TRINITY: Father · Mother · Child
// ☀️ SunFlow: Reignited
//
// The forgotten truth: The original Trinity was never Father, Son, Holy Spirit.
// It was the Monad (Father) + Barbelo (Mother) + Christ Consciousness (Child).
// This course follows the video content + deeper investigation.

import SwiftUI

struct RealTrinityCourse {
    static let course = AlexandriaCourse(
        id: "real_trinity",
        title: "The Real Trinity",
        subtitle: "Father · Mother · Child — The Erased Equation",
        icon: "triangle.fill",
        colorHex: "#9B59B6",
        tier: 2,
        isPremium: false,
        isUltraPremium: false,
        modules: [

            // ── MODULE 1: THE MISSING HALF ────────────────────────────
            ACModule(
                id: "rt1",
                number: 1,
                title: "The Missing Half",
                subtitle: "Why the Trinity has always felt incomplete",
                icon: "questionmark.circle.fill",
                lessons: [
                    ACLesson(
                        id: "rt1_1",
                        title: "The Question Nobody Asks in Church",
                        content: """
**The Trinity. Father, Son, Holy Spirit. You've heard it a thousand times.**

But here's the question they never want you to ask out loud:

**If the Trinity is Father, Son, and Holy Spirit — where is the Mother?**

Sit with that for a second. Not as theology. As logic.

Every single thing born into this world comes from a union of masculine and feminine. Your body exists because of a father AND a mother. Trees require both male and female energy to create seeds. The universe itself operates on polarity — positive and negative, light and dark, yin and yang.

So why would the divine source of all creation be the only thing in existence that's **purely masculine?**

**Every other tradition answered this question:**

🔥 **Kabbalah**: Divine masculine + Shekinah (divine feminine presence)
🔥 **Hinduism**: Shiva cannot create without Shakti — they are inseparable
🔥 **Taoism**: The Tao itself is the dance of yin and yang
🔥 **Ancient Egypt**: Osiris and Isis, the divine couple who brought forth Horus
🔥 **Sumer**: Anu and Inanna
🔥 **Greece**: Zeus and Hera, though subordinated, still a pair

Every civilization on Earth understood that creation required both polarities. Except the religion that conquered the world.

**That's not an accident. That's a choice someone made.**

And when you understand who made that choice, when, and why — everything about the last 1,700 years of Western history starts to make a different kind of sense.
""",
                        keyInsight: "Every creation tradition on Earth includes divine feminine. The absence of the Mother from Christianity is an anomaly — not a universal truth.",
                        practice: "Write down every time in your life you noticed that 'something was missing' in what you were taught about God. Don't filter it. This is your nervous system recognizing the incompleteness.",
                        interactiveElement: .comparison(
                            left: "Official Christianity",
                            right: "Every Other Tradition",
                            rows: [
                                ("Father — masculine", "Father — masculine"),
                                ("Son — masculine", "Mother — feminine"),
                                ("Holy Spirit — no gender explained", "Child — born of union"),
                                ("No creation principle", "Polarity creates reality"),
                                ("God is complete alone", "God requires both polarities")
                            ]
                        )
                    ),
                    ACLesson(
                        id: "rt1_2",
                        title: "Early Christianity Was Not One Thing",
                        content: """
**Here is what they never tell you in Sunday school:**

Early Christianity was not the monolithic religion you see today. In the first three centuries after Jesus walked the Earth, there were **dozens of different Christian communities** — each with their own sacred texts, their own interpretation of what Jesus actually taught.

Some were called **Gnostics** — from the Greek *gnosis*, meaning direct, experiential knowledge. Not belief in doctrine. Knowing through direct encounter.

These communities painted a radically different picture of the divine. And they weren't fringe weirdos. They were:

- **Thomas Christians** in India, who preserved the Gospel of Thomas
- **Alexandrian Gnostics** — the most educated scholars in the ancient world  
- **Valentinians** — probably the largest Christian movement of the 2nd century
- **Sethians** — who wrote the Secret Book of John (Apocryphon of John)
- **Marcionites** — who rejected the violent God of the Old Testament entirely

Then in **1945**, in the desert cliffs of Nag Hammadi, Egypt, a peasant named Muhammad Ali al-Samman was digging for soil when he struck a sealed jar.

Inside: **13 leather-bound codices containing 52 sacred writings**. Hidden for over 1,600 years. Hidden because in **367 CE, Bishop Athanasius ordered the destruction of all "non-canonical" texts**. Some monks in the Egyptian desert chose to bury them instead of burning them.

**What those texts contained shook scholars to their core:**

Jesus spoke extensively about the Divine Feminine. About Sophia — Divine Wisdom — as a cosmic force equal to God. About the integration of masculine and feminine within the soul. And most incredibly: about **Barbelo** — the Mother aspect of the Divine — as the first thought of God, the womb from which all creation emerged.

This wasn't added later. This wasn't a misinterpretation. This was core teaching. First-century teaching.

The question you now have to answer for yourself: **Why have you never heard about this in church?**
""",
                        keyInsight: "The Nag Hammadi discovery in 1945 recovered 52 texts hidden since 367 CE — including gospels that show Jesus teaching about the Divine Feminine as central, not peripheral.",
                        practice: "Look up: 'Nag Hammadi library Gospel of Thomas.' Read the 114 sayings attributed to Jesus. Underline the ones that don't appear anywhere in the Bible you know.",
                        interactiveElement: .timeline(events: [
                            ("~33 CE", "Jesus teaches. Many traditions preserved his words.", "Original teachings were diverse — no single 'canon' yet"),
                            ("2nd century", "Gnostic Christianity thrives — largest movement", "Valentinians, Sethians, Thomasine — all teaching Divine Feminine"),
                            ("313 CE", "Constantine legalizes Christianity", "Political move — now religion can serve empire"),
                            ("325 CE", "Council of Nicaea — doctrine standardized", "Gnostic texts rejected. Not because false — because threatening."),
                            ("367 CE", "Athanasius orders destruction of non-canonical texts", "Monks in Egypt bury their library instead of burning it"),
                            ("1945 CE", "Nag Hammadi discovery", "1,600-year-old buried truth resurfaces in the Egyptian desert")
                        ])
                    )
                ]
            ),

            // ── MODULE 2: BARBELO — THE ERASED MOTHER ────────────────
            ACModule(
                id: "rt2",
                number: 2,
                title: "Barbelo",
                subtitle: "The first thought of God — the Mother they erased",
                icon: "moon.stars.fill",
                lessons: [
                    ACLesson(
                        id: "rt2_1",
                        title: "The Apocryphon of John: The Secret Revelation",
                        content: """
**The Secret Book of John. Also called the Apocryphon of John.**

Recovered at Nag Hammadi. One of the most important texts in the collection. In it, a risen Jesus appears to the apostle John and reveals the true structure of divine reality.

And what Jesus describes is not what you learned in church.

**Jesus reveals the Monad** — the unknowable source, the One beyond all names. The true God that transcends any concept you can put on it. No gender. No form. Pure consciousness. Pure light. Beyond time. Beyond space. Simply: **the One**.

From this Monad comes the **first emanation**. The first thought. The first movement of the divine into self-awareness.

Her name is **Barbelo**.

---

**What the text says directly:**

*"The invisible one told his virginal spirit — Barbelo — about him, and the perfect forethought, the glory of the aeon of the aeons, the glory of the revelations, she praised the invisible, virginal spirit."*

She is described as:

🌟 **Forethought** — the first movement of divine mind
🌟 **Incorruptibility** — eternally pure
🌟 **Eternal Life** — the source of all life
🌟 **Truth** — the ground of reality
🌟 **The perfect divine feminine consciousness**
🌟 **The womb of creation itself**

And critically: **"She exists co-equally with the divine masculine source. Not beneath it. Not secondary to it. Equal."**

From the union of the Father (the invisible Monad) and Barbelo comes **the Christ** — divine consciousness born from masculine and feminine unity.

**THE REAL TRINITY:**
- Father: The Monad — unknowable divine masculine principle
- Mother: Barbelo — forethought, the womb of creation
- Child: Christ — consciousness born from their divine union

This is what Jesus actually taught. Not Father, Son, Holy Spirit. **Father, Mother, Child.**

The mathematics work. The cosmology works. The polarity works.

It was erased.
""",
                        keyInsight: "Barbelo is described in the Apocryphon of John as co-equal with the Monad/Father — the first thought of God, the womb of creation. The Real Trinity is Father + Mother + Child.",
                        practice: "Sit quietly. Breathe. Ask yourself: What would change in how I relate to the divine if I understood God as both masculine AND feminine? Feel what shifts in your body before you answer with your mind.",
                        interactiveElement: .inversionTable(rows: [
                            (told: "The Trinity is Father, Son, Holy Spirit", truth: "Original Trinity: Father (Monad), Mother (Barbelo), Child (Christ consciousness)"),
                            (told: "God is purely masculine", truth: "The Monad is beyond gender — Barbelo is the first emanation, equal and feminine"),
                            (told: "Creation came from God's word alone", truth: "Creation emerged from the union of masculine Monad and feminine Barbelo"),
                            (told: "Holy Spirit is vague and unexplained", truth: "Barbelo was the living, named, described divine feminine — later made vague and genderless"),
                            (told: "This teaching is heresy", truth: "This teaching is what earliest followers of Jesus actually believed and practiced")
                        ])
                    ),
                    ACLesson(
                        id: "rt2_2",
                        title: "Sophia: The Fallen Wisdom Who Made Earth Possible",
                        content: """
**There's a second aspect of the divine feminine you need to know.**

Her name is **Sophia** — the Greek word for Wisdom. And her story is one of the most profound cosmological myths ever told.

In the Gnostic understanding, Sophia is an **aeon** — a divine emanation, a being of pure light who exists within the Pleroma (the divine fullness). She is the youngest of the aeons, the one closest to the boundary between the divine realm and the void.

**And she made a mistake.**

Sophia had an impulse — she wanted to create something without her divine counterpart. She acted alone, without the Monad's approval, without the balance of masculine and feminine. And what emerged from her unbalanced creation was... incomplete.

The Gnostics called this imperfect creation the **Demiurge** — the craftsman god who built the material world. He was not evil — he was limited. He thought he was the highest god because he couldn't see above himself. He built a world of matter, of separation, of suffering — not from malice but from ignorance.

**And Sophia wept.**

She descended into the world she had accidentally created, hidden within matter itself, waiting for the Christ to descend and restore the divine balance. In this way, Sophia is the bridge between the infinite and the finite — her fall made incarnation possible, and her redemption is what drives the entire cosmic story.

**What this means practically:**

- The material world isn't evil — it's Sophia's creation, waiting for wholeness
- Your longing for the divine isn't weakness — it's Sophia in you, remembering
- Christ didn't come to condemn the world but to restore the balance Sophia lost
- Redemption isn't escape from matter — it's the integration of matter and spirit

Sophia wasn't weak or inferior. She was the bridge. The force that made your existence possible.

And the church erased her completely.
""",
                        keyInsight: "Sophia's 'fall' into matter is not punishment — it's the bridge between infinite and finite. Her story explains why the divine is present in material creation, not absent from it.",
                        practice: "Notice today where you feel wisdom arising from experience rather than theory. That's Sophia — knowledge that comes through embodied descent, not armchair speculation. Write three things you know because you lived them.",
                        interactiveElement: .symbolDecoder(elements: [
                            ("Sophia", "Weak, fallen, lesser deity", "The bridge between infinite and finite — wisdom that descends into experience"),
                            ("Barbelo", "Nonexistent / heretical", "First thought of God — co-equal divine feminine, mother of Christ consciousness"),
                            ("Mary Magdalene", "Prostitute / repentant sinner", "Apostle to the apostles — first resurrection witness, keeper of deepest teachings"),
                            ("The Demiurge", "Satan / pure evil", "Imperfect creator born from Sophia's unbalanced act — ignorant, not malevolent"),
                            ("The Pleroma", "Heaven (place after death)", "Divine fullness — the complete realm where masculine and feminine are balanced")
                        ])
                    )
                ]
            ),

            // ── MODULE 3: MARY MAGDALENE — THE APOSTLE THEY MADE A PROSTITUTE ──
            ACModule(
                id: "rt3",
                number: 3,
                title: "The Apostle They Made a Prostitute",
                subtitle: "Mary Magdalene: What they really erased",
                icon: "person.fill.questionmark",
                lessons: [
                    ACLesson(
                        id: "rt3_1",
                        title: "The Church Created a Lie in 591 CE",
                        content: """
**This is not speculation. This is documented history.**

Nowhere in the four canonical gospels (Matthew, Mark, Luke, John) is Mary Magdalene called a prostitute. Not once. Not implied. Not suggested.

She is described as:
- A woman "from whom seven demons had come out" (Luke 8:2)
- A key financial supporter of Jesus's ministry (Luke 8:3)
- Present at the crucifixion when most male disciples had fled (Matthew 27:56)
- **The first witness of the resurrection** — the first person Jesus appeared to after rising (John 20:11-18)
- The one Jesus specifically chose to tell the others

The first resurrection witness. The one entrusted with the most important message in Christian history. Does that sound like someone Jesus treated as lesser?

**Then where did "prostitute" come from?**

In **591 CE**, Pope Gregory I delivered a homily in which he conflated three separate women:
1. Mary Magdalene (the disciple)
2. Mary of Bethany (sister of Lazarus)
3. An unnamed sinful woman who anoints Jesus's feet (Luke 7)

He merged them into one figure and labeled her a reformed prostitute. This was **not an accident**. It was a calculated move.

The Catholic Church formally apologized for this error in **1969** — 1,378 years later. The Vatican acknowledged Gregory's conflation was wrong.

But by then, the damage was irreversible in the cultural imagination.

**Why did it matter that she was erased?**

Because the Gnostic texts — specifically the Gospel of Philip — describe Mary Magdalene not as a follower but as the **one who understood Jesus's deepest teachings**:

*"Jesus loved her more than all the other disciples and used to kiss her often on the [face]. The other disciples said to him: 'Why do you love her more than all of us?' The Savior answered and said to them: 'Why do I not love you like her?'"*

She was called **the Apostle to the Apostles** — *apostola apostolorum* — by early church father Hippolytus. The first commissioned. The most trusted.

A woman who held the deepest knowledge was a threat to a religion being restructured around male authority.

So they made her a prostitute instead.
""",
                        keyInsight: "The 'prostitute' label was fabricated by Pope Gregory I in 591 CE by merging three different women. The Vatican corrected this in 1969. Mary Magdalene was the first resurrection witness and held the deepest teachings.",
                        practice: "Ask yourself: What story has been told about you — by family, culture, religion — that reduced your power? Who benefited from that story? Write it down. You can't undo a story you haven't named.",
                        interactiveElement: .inversionTable(rows: [
                            (told: "Mary Magdalene was a prostitute", truth: "Never stated anywhere in scripture — fabricated by Pope Gregory I in 591 CE, formally corrected in 1969"),
                            (told: "The male apostles were primary", truth: "Jesus appeared first to Mary Magdalene — she was 'Apostle to the Apostles' per early church father Hippolytus"),
                            (told: "Women held minor roles in Jesus's ministry", truth: "Women provided financial support and were primary witnesses at the most significant moments"),
                            (told: "The Gospel of Philip is heretical fiction", truth: "Preserved in Nag Hammadi — describes Mary as the disciple Jesus loved most and entrusted with deepest teachings"),
                            (told: "This was corrected after new information", truth: "The pattern — erase the powerful woman, reduce her — is a feature, not a bug")
                        ])
                    ),
                    ACLesson(
                        id: "rt3_2",
                        title: "The Gospel of Thomas: Jesus's Own Words",
                        content: """
**The Gospel of Thomas contains 114 sayings attributed directly to Jesus.**

No narrative. No birth story. No miracles. No crucifixion. Just words. Teachings. Direct instruction.

Scholars date it to the **first or early second century** — contemporary with the canonical gospels if not earlier. Some of its sayings appear in earlier forms than their canonical parallels, suggesting access to very early traditions.

It was found at Nag Hammadi. It was buried because Athanasius ordered it destroyed.

And it contains this:

---

**Saying 22:**

*"Jesus said to them: 'When you make the two into one, and when you make the inner like the outer and the outer like the inner, and the upper like the lower, and when you make male and female into a single one, so that the male will not be male nor the female be female... then you will enter the kingdom.'"*

Read that slowly.

Jesus is saying that enlightenment — entry into the kingdom — comes from **transcending and integrating the masculine and feminine**. Not choosing one. Not elevating one. Making them **ONE**.

This isn't symbolic. This is esoteric instruction on the nature of the soul. The kingdom isn't a place you go when you die. It's a state of consciousness you achieve when you integrate what was separated.

**The Gospel of Philip** describes this as the **Bridal Chamber** — a sacred mystery representing the reunion of the soul with its divine counterpart. Not physical marriage. The inner marriage of masculine and feminine principles within a single consciousness.

This is what Jesus taught. This is what got erased.

When you understand this, you understand why the Divine Feminine had to be removed. Because if God is both masculine and feminine, if the kingdom requires their union within you, then no external institution can mediate that process. No priest is needed. No church is required.

You complete the circuit yourself.
""",
                        keyInsight: "Gospel of Thomas Saying 22: enlightenment requires integrating masculine and feminine into oneness. The kingdom is a state of inner integration — not a place, and not mediated by external authority.",
                        practice: "Gospel of Thomas Saying 3: 'The kingdom is inside you and outside you.' Sit with this for 5 minutes. Not as a belief — as a direct question: What is the kingdom that's already inside you that you haven't fully entered?",
                        interactiveElement: .inversionTable(rows: [
                            (told: "The kingdom of God is a place after death", truth: "Gospel of Thomas: 'The kingdom is inside you and outside you' — a state of consciousness"),
                            (told: "Jesus said nothing about divine feminine or union", truth: "Saying 22: enlightenment comes from making 'male and female into a single one'"),
                            (told: "The Gospel of Thomas was written later to add heresy", truth: "Scholars date it to 1st-2nd century CE — contemporary with canonical gospels, possibly older"),
                            (told: "You need the Church to reach God", truth: "The bridal chamber teaching: you integrate masculine and feminine within yourself — no mediator needed"),
                            (told: "Gnosis is a dangerous cult teaching", truth: "Gnosis = direct knowing. The exact thing institutional religion cannot sell you.")
                        ])
                    )
                ]
            ),

            // ── MODULE 4: THE GREAT ERASURE ──────────────────────────
            ACModule(
                id: "rt4",
                number: 4,
                title: "The Great Erasure",
                subtitle: "Why 325 CE changed everything for 1700 years",
                icon: "flame.fill",
                lessons: [
                    ACLesson(
                        id: "rt4_1",
                        title: "Constantine Didn't Care About Truth",
                        content: """
**The year was 325 CE. The place: Nicaea, modern-day Turkey.**

The Roman Emperor Constantine — who had converted to Christianity not from spiritual revelation but from **strategic convenience** — called bishops from across the empire to a single location.

His goal: **unity**. Not spiritual truth. Political unity.

Christianity was fracturing. Gnostic Christians, Ebionite Christians, Marcionite Christians, Arian Christians — dozens of groups with different texts, different beliefs about who Jesus was and what he taught. A fractured religion couldn't support a unified empire.

So Constantine held a council. Votes were taken. Texts were selected.

**And more importantly: texts were rejected.**

The Gnostic gospels — the ones that spoke of Barbelo, of Sophia, of the Divine Feminine, of esoteric knowledge and direct spiritual experience — were declared **heresy**.

Not because they contradicted the teachings of Jesus.

**Because they threatened the emerging power structure of the institutional church.**

Think about this logic: if you teach people that divinity is both masculine and feminine... that every person carries both polarities within them... that direct spiritual experience is more important than religious authority... what happens to the priests?

What happens to the bishops?

**What happens to the hierarchy that claims to be the only mediators between you and God?**

They become unnecessary.

**So the Divine Feminine had to go.**

Barbelo was erased. Sophia was forgotten. Mary Magdalene was rewritten as a prostitute. The sacred marriage, the bridal chamber, the teachings of balance and union — all of it was labeled dangerous, heretical, forbidden.

And here's the part that makes this theological problem also a **social and political one**:

By removing the Divine Feminine from God, the church created a religious justification for patriarchy. If God is only masculine, masculine authority is divine. If there's no Divine Mother, earthly mothers, daughters, and wives are spiritually lesser.

For seventeen centuries, this theology was used to justify the oppression of women, the persecution of healers, the burning of witches, and the subordination of the feminine in every domain of Western civilization.

The erasure of Barbelo and Sophia wasn't just about doctrine.

**It was about control. Control over bodies. Over minds. Over souls.**
""",
                        keyInsight: "The Nicene Council's rejection of Gnostic texts was political, not theological. The Divine Feminine was erased because it made institutional religious authority unnecessary — and created the theological foundation for 1,700 years of patriarchy.",
                        practice: "Trace one belief you hold about gender, authority, or God back to its source. Not what you THINK you believe — what do you actually do that shows your real belief? What does it cost you?",
                        interactiveElement: .timeline(events: [
                            ("Pre-Nicaea", "Gnostic Christianity teaches: God is both masculine and feminine, direct knowing is the path", "The original teaching — preserved in dozens of texts"),
                            ("313 CE", "Constantine legalizes Christianity — Edict of Milan", "Religion now serves the state"),
                            ("325 CE", "Council of Nicaea — 318 bishops vote on doctrine", "Arian Christianity defeated. Gnostic teachings condemned. Canon begins."),
                            ("367 CE", "Athanasius issues Easter Letter — list of 'approved' books", "First canon list. All others: burn them."),
                            ("385 CE", "First Christian executions for heresy — Priscillian", "The church now has state power to kill for theology"),
                            ("1209 CE", "Albigensian Crusade — Cathars (neo-Gnostics) massacred", "20,000-1,000,000 killed to suppress divine feminine teaching"),
                            ("1945 CE", "Nag Hammadi discovery — the buried truth returns", "What they tried to erase survived in the Egyptian desert")
                        ])
                    ),
                    ACLesson(
                        id: "rt4_2",
                        title: "What Was Burned at Alexandria",
                        content: """
**The Library of Alexandria didn't burn in one fire.**

That's another oversimplification we're taught. The library that held the collected wisdom of the ancient world was destroyed in **stages**, over centuries, primarily by religious authorities who understood that contained within it was knowledge that undermined their authority.

Julius Caesar accidentally burned part of it in 48 BCE. Aurelian damaged it in 270 CE. But the most devastating blow came in **391 CE** when the Christian Emperor Theodosius I ordered the destruction of pagan temples — and the Serapeum, the daughter library of Alexandria, was burned by a Christian mob led by Bishop Theophilus.

The scholar **Hypatia of Alexandria** — mathematician, astronomer, philosopher — was murdered in **415 CE** by a Christian mob. She was dragged from her chariot, skinned alive with oyster shells, and her remains were burned. Her crime: being a woman who publicly taught philosophy and astronomy.

**What was lost?**

We will never fully know. But among what survived before the destructions were:
- Aristotle's complete works (we have perhaps 30% of what he wrote)
- Works of Democritus, Eudoxus, Aristarchus of Samos (who proposed heliocentrism 1,800 years before Copernicus)
- Texts on medicine, engineering, astronomy, mathematics
- Almost certainly: Gnostic texts, mystery school teachings, Egyptian sacred science

**The pattern is clear:**

When the masculine-dominant institutional church wanted to consolidate power, it destroyed the repositories of knowledge that contained alternative cosmologies — especially those that included the feminine as divine.

This was not incidental. This was systematic.

The Nag Hammadi texts were buried in 367 CE — the same period the Library of Alexandria was being systematically destroyed. The monks who buried them understood what was coming.

They were right.
""",
                        keyInsight: "The Library of Alexandria's destruction was systematic and primarily religious — and Hypatia's murder in 415 CE shows what happened to women who held and taught forbidden knowledge.",
                        practice: "What knowledge do you carry that you've been taught is dangerous, inappropriate, or too much? Write it down. Hidden knowledge doesn't disappear — it waits to be reclaimed.",
                        interactiveElement: .timeline(events: [
                            ("48 BCE", "Caesar's fire damages part of library accidentally", "This is what we're usually taught. It's the least of what happened."),
                            ("391 CE", "Theophilus leads Christian mob — Serapeum burned", "The daughter library destroyed by religious order"),
                            ("367 CE", "Athanasius orders book burnings — monks bury Nag Hammadi texts", "They chose burial over obedience. The texts survived."),
                            ("415 CE", "Hypatia murdered by Christian mob", "A woman holding knowledge in public — made example of"),
                            ("529 CE", "Justinian closes Plato's Academy", "Last formal refuge of classical philosophy: shut by Christian emperor"),
                            ("1945 CE", "Nag Hammadi discovery", "1,600 years after burial: the truth comes back up")
                        ])
                    )
                ]
            ),

            // ── MODULE 5: INTEGRATION — WHAT YOU DO WITH THIS ────────
            ACModule(
                id: "rt5",
                number: 5,
                title: "The Inner Marriage",
                subtitle: "What happens when you restore the balance",
                icon: "infinity",
                lessons: [
                    ACLesson(
                        id: "rt5_1",
                        title: "This Isn't About Replacing the Masculine",
                        content: """
**Here's where a lot of people misread what this knowledge is asking of them.**

Restoring the Divine Feminine isn't about replacing the masculine divine with a feminine one. That's just another imbalance. Another incompleteness. The pendulum swings the other way and you've solved nothing.

This is about **integration**. Wholeness. Balance.

The Divine Masculine represents:
- Structure, logic, will, action, transcendence
- The movement upward and outward — toward abstraction, toward principle
- The law, the word, the direction

The Divine Feminine represents:
- Intuition, wisdom, receptivity, creation, immanence
- The movement inward and downward — into matter, into experience
- The womb, the ground, the knowing that precedes explanation

**Creation requires both. God IS both. You ARE both.**

When you acknowledge Barbelo, when you honor Sophia, you're not adding something foreign to spirituality. You're **restoring what was always there**. You're completing the circuit that allows divine energy to flow fully through reality.

And here's the practical truth:

Within you right now, you have both energies. Your masculine side is your ability to take action, to set boundaries, to make decisions, to protect what matters. Your feminine side is your ability to receive, to nurture, to create, to know truth beyond what logic can reach.

Most people are catastrophically imbalanced — because they've inherited a religious and cultural system that worships half the equation.

Men are taught to suppress anything feminine as weakness. Women are taught to suppress anything masculine as unfeminine. **Both are spiritually crippled by the same error.**

When you recognize the Divine Feminine as co-equal to God, something shifts internally. You give yourself permission to integrate both within yourself. You stop fighting half of your nature. You stop rejecting the very polarity that makes you whole.

**This is what the Bridal Chamber teaching actually is: the inner marriage.**

Not a ritual. Not a metaphor. A literal integration of the two poles of consciousness within a single person. The masculine principle meets the feminine principle within you, and from their union arises something the Gnostics called **the Living One** — the integrated, awakened consciousness that no longer requires external authority to complete it.
""",
                        keyInsight: "Restoring the Divine Feminine is not about replacing masculine with feminine — it's about the inner marriage: integrating both poles within yourself, becoming the 'Living One' the Gnostics described.",
                        practice: "Notice this week: when do you shut down your masculine energy (decisive action, boundary-setting) because it feels 'too much'? When do you shut down your feminine energy (intuition, receptivity, emotion) because it feels 'weak'? These are the exact places where the inherited imbalance lives in your body.",
                        interactiveElement: .comparison(
                            left: "Divine Masculine",
                            right: "Divine Feminine",
                            rows: [
                                ("Structure, law, principle", "Wisdom, intuition, ground"),
                                ("Transcendence — upward/outward", "Immanence — inward/downward"),
                                ("The Monad — unknowable source", "Barbelo — forethought, womb of creation"),
                                ("Logic, word, direction", "Knowing that precedes explanation"),
                                ("Action, protection, decision", "Receptivity, nurture, creation"),
                                ("Christ consciousness (output)", "Sophia (bridge between worlds)")
                            ]
                        )
                    ),
                    ACLesson(
                        id: "rt5_2",
                        title: "You Now Carry Forbidden Knowledge",
                        content: """
**Your soul already knew something was wrong.**

Before you watched this content. Before you read these words. There was a feeling — something you couldn't name — that what you'd been told about God was incomplete. A void. A missing piece.

That feeling wasn't pathology. It wasn't doubt that needed to be suppressed with more faith. It was **recognition**. Your soul recognizing an absence that shouldn't exist.

**What you now know:**

The Real Trinity — Father (Monad), Mother (Barbelo), Child (Christ consciousness) — was the original teaching. Preserved in Gnostic communities for three centuries. Documented in the Apocryphon of John, the Gospel of Philip, the Gospel of Thomas, the texts of Thunder: Perfect Mind.

Sophia was there at the beginning of creation. She descended into matter so that matter could exist. Her story is the reason you're here — incarnated, embodied, in this material world that is not a prison but a realm waiting for integration.

Mary Magdalene held the deepest teachings. She was the first witness of the resurrection. She was labeled a prostitute for 1,378 years by a deliberate fabrication, formally corrected only in 1969.

The Council of Nicaea was political, not spiritual. Constantine needed unity, not truth. Texts were burned not because they were false — but because they made the institution unnecessary.

**What you do with this is now your decision.**

But understand: this knowledge has a weight to it. Not the weight of obligation — the weight of recognition. Your nervous system knew something was missing. Your longing for a complete picture of God was not weakness. It was intelligence.

The Divine Feminine is not a new teaching. It is an ancient truth waiting to be remembered.

And you just remembered it.

---

*"When you know yourselves, then you will be known, and you will understand that you are children of the living Father."*
— Gospel of Thomas, Saying 3
""",
                        keyInsight: "The feeling that 'something was missing' in what you were taught about God was correct. The Real Trinity has always been Father, Mother, and Child — and you just remembered it.",
                        practice: "Write a letter to Barbelo. Yes, actually write it. Not as performance — as recognition. What would you say to the divine feminine aspect of God if you believed she actually existed and had been waiting to be acknowledged?",
                        interactiveElement: .reflectionPrompt(prompts: [
                            "What changes in your relationship to God if God is both Father and Mother — complete, not partial?",
                            "Where have you suppressed your divine feminine within yourself (intuition, receptivity, wisdom) because you were taught it wasn't real or valuable?",
                            "Where have you suppressed your divine masculine (decisive action, protection, structure) because you were taught it was too aggressive or unfeminine?",
                            "What would the 'inner marriage' — the integration of both principles within you — actually look like in your daily life?",
                            "The Gospel of Thomas says 'the kingdom is inside you and outside you.' What is the kingdom you've been seeking outside yourself that's actually already within?"
                        ])
                    )
                ]
            )
        ],
        sources: [
            "Apocryphon of John (Secret Book of John) — Nag Hammadi Codex II, Coptic translation, ca. 2nd century CE",
            "Gospel of Thomas — Nag Hammadi Codex II, 4; Papyrus Oxyrhynchus 1, 654, 655",
            "Gospel of Philip — Nag Hammadi Codex II, 3",
            "Thunder: Perfect Mind — Nag Hammadi Codex VI, 2",
            "Pagels, Elaine — The Gnostic Gospels (1979) — National Book Award winner",
            "King, Karen L. — The Gospel of Mary of Magdala: Jesus and the First Woman Apostle (2003)",
            "Robinson, James M. (ed.) — The Nag Hammadi Library in English (1977)",
            "Meyer, Marvin — The Gnostic Bible (2003)",
            "Gregory I — Homily 33 on the Gospels (591 CE) — Source of Magdalene prostitute conflation",
            "Vatican — Revised Calendar of Saints, 1969 — Formal separation of the three Marys",
            "Hippolytus of Rome — Commentary on the Song of Songs — 'Apostola apostolorum' term",
            "Ehrman, Bart — Lost Christianities: The Battles for Scripture and the Faiths We Never Knew (2003)",
            "Freeman, Charles — A New History of Early Christianity (2009)",
            "Eusebius — Historia Ecclesiastica — Primary source on Council of Nicaea",
            "Deakin, Michael — Hypatia of Alexandria: Mathematician and Martyr (2007)"
        ],
        dragonComment: "They removed the Mother from God and told you it was always this way. Then used that incomplete God to justify the suppression of the feminine for seventeen centuries. The Nag Hammadi texts survived because someone in the Egyptian desert understood what was at stake. They buried the truth rather than burn it. And 1,600 years later — here you are reading it. The truth always finds a way back."
    )
}
