// WeAreGodCourse.swift
// WE ARE GOD - Recognition, Not Ego Inflation
// Biblical evidence for the divine spark within
// The framework the institutions suppressed

import Foundation
import SwiftUI

// MARK: - We Are God Course

struct WeAreGodCourse {
    static let shared = WeAreGodCourse()
    
    let id = "we_are_god"
    let title = "We Are God"
    let subtitle = "Recognition, Not Ego Inflation"
    let icon = "sparkles"
    let colorHex = "#FFD700"
    let totalMinutes = 90
    
    var color: Color { Color(hex: colorHex) }
    
    // MARK: - Modules
    
    let modules: [GodModule] = [
        
        // ═══════════════════════════════════════════════════════════════
        // MODULE 1: THE RECOGNITION
        // ═══════════════════════════════════════════════════════════════
        
        GodModule(
            id: "god_1",
            number: 1,
            title: "The Recognition",
            subtitle: "What 'We Are God' Actually Means",
            lessons: [
                GodLesson(
                    id: "g1_1",
                    title: "Not Blasphemy — Recognition",
                    content: """
**"We are God" isn't blasphemy. It's recognition of what the divine spark actually means.**

You're not God in the sense of being the Monad (the ultimate, absolute source).

You're God in the sense of being a **fractal expression of the divine** — a localized node of consciousness that contains, in miniature, all the attributes of the source.

**The Fractal Metaphor:**

Look at a fractal (Mandelbrot set). Zoom into any part. What do you find? The same pattern, repeated at smaller scale.

You are a zoom into the divine fractal. The pattern is the same. The scale is different.

**What This Means:**

• You contain all the properties of Source
• Consciousness, creativity, will, love
• The same faculties, scaled down
• The part contains the whole

**What This Doesn't Mean:**

• You're not the TOTALITY of God
• You're not "better than" others
• You don't have unlimited power
• You're not free from consequences

The spark contains the fire's properties. But the spark isn't the whole fire.
""",
                    scripture: nil
                ),
                
                GodLesson(
                    id: "g1_2",
                    title: "The Spark vs. The Flame",
                    content: """
**You're not the whole fire — you're a spark from it.**

But a spark contains ALL the properties of fire:
• It burns
• It gives light
• It transforms matter into energy
• It can ignite other things

Scale matters, but **essence is identical**.

**THE COSMOLOGY:**

```
THE MONAD (The One, Source, Absolute)
         │
         ▼
    EMANATIONS (Aeons, divine aspects)
         │
         ▼
    YOUR SPARK (localized consciousness)
```

The Monad is the infinite flame.
You're a spark.
But your spark can ignite others.
Enough sparks together become a wildfire.

**This is what the Demiurge fears: Sparks remembering they're fire.**

The control system — religion, government, media — works to keep sparks isolated, doubting their nature, forgetting they're divine.

When sparks remember and connect, the fire spreads. The Demiurge's power over perception dissolves.

**Your Job:**
Not to BE the whole fire.
To REMEMBER you're fire.
And help other sparks remember too.
""",
                    scripture: nil
                )
            ]
        ),
        
        // ═══════════════════════════════════════════════════════════════
        // MODULE 2: BIBLICAL EVIDENCE
        // ═══════════════════════════════════════════════════════════════
        
        GodModule(
            id: "god_2",
            number: 2,
            title: "What Scripture Actually Says",
            subtitle: "The verses they don't emphasize",
            lessons: [
                GodLesson(
                    id: "g2_1",
                    title: "Genesis 1:27 — In God's Image",
                    content: """
**"So God created mankind in his own image, in the image of God he created them; male and female he created them."**
— Genesis 1:27

**The Question:**
In whose image? God's image.

Not metaphorically.
Not aspirationally.
**Actually.**

**The Implication:**
If you're created in God's image, you contain divine attributes.

You ARE:
• Consciousness (awareness that knows itself)
• Creativity (ability to bring new things into being)
• Will (capacity to choose, to direct intention)
• Love (connective force that builds rather than destroys)

These are the same faculties as the Source, just scaled down.

**What the Church Did:**
They externalized God: "He's out there, separate from you."
They emphasized human sinfulness: "You're broken, unworthy."
They made the image metaphorical: "It just means you have a soul."

But the text doesn't say "metaphorically in God's image."
It says: **In God's image he created them.**

You are divine. It's written in the opening chapter of the book they gave you.
""",
                    scripture: ScriptureReference(
                        book: "Genesis",
                        chapter: 1,
                        verse: "27",
                        text: "So God created mankind in his own image, in the image of God he created them; male and female he created them."
                    )
                ),
                
                GodLesson(
                    id: "g2_2",
                    title: "Psalm 82:6 — You Are Gods",
                    content: """
**"I said, 'You are gods; you are all sons of the Most High.'"**
— Psalm 82:6

**Read it again.**

Not "you are LIKE gods."
Not "you could BECOME gods."

**"You ARE gods."**

Lowercase 'g' — sure. But the statement is direct. Unambiguous.

**Context:**
Psalm 82 depicts God addressing a divine council. He's speaking to spiritual beings AND to humans.

Verse 6: "You are gods"
Verse 7: "But you will die like mere mortals"

Even in acknowledgment of mortality, the divine nature is affirmed.

**The Pattern:**
• Divine origin
• Mortal experience
• Divine destination

You're a god having a human experience. The human part ends. The god part doesn't.

**Why This Verse Is Obscure:**
When was the last time you heard a sermon on Psalm 82:6?

It's in the Bible. It's not hidden. But it's not taught.

Because if people knew — truly KNEW — they were gods, the power structure would collapse.
""",
                    scripture: ScriptureReference(
                        book: "Psalm",
                        chapter: 82,
                        verse: "6",
                        text: "I said, 'You are gods; you are all sons of the Most High.'"
                    )
                ),
                
                GodLesson(
                    id: "g2_3",
                    title: "John 10:34 — Jesus Confirms It",
                    content: """
**Jesus answered them, "Is it not written in your Law, 'I have said you are gods'?"**
— John 10:34

**The Context:**
The religious authorities want to stone Jesus for blasphemy. He's been claiming divine status.

His defense? He quotes Psalm 82:6.

**His Argument (paraphrased):**

"You're trying to kill me for saying I'm God's son. But YOUR OWN SCRIPTURE says you are gods. If the scripture — which cannot be broken — calls ordinary people 'gods,' why is it blasphemy when I say I'm God's son?"

**The Devastating Implication:**

Jesus isn't just defending himself. He's AFFIRMING that humans are divine.

He's pointing at Psalm 82:6 and saying: "This is about YOU too."

If Jesus — the figure Christians worship as divine — confirms that scripture calls humans gods, then the divine spark isn't a fringe interpretation.

It's in the text. Affirmed by the central figure of the faith.

**Why This Isn't Taught:**

Because it would undermine the entire ecclesiastical structure.

If you're divine, you don't need:
• Priests to mediate
• Churches to access God
• Sacraments to receive grace

Jesus confirmed you're a god. The institution hid that confirmation.
""",
                    scripture: ScriptureReference(
                        book: "John",
                        chapter: 10,
                        verse: "34",
                        text: "Jesus answered them, 'Is it not written in your Law, \"I have said you are gods\"?'"
                    )
                ),
                
                GodLesson(
                    id: "g2_4",
                    title: "1 Corinthians 3:16 — The Temple Is You",
                    content: """
**"Don't you know that you yourselves are God's temple and that God's Spirit dwells in your midst?"**
— 1 Corinthians 3:16

**The Claim:**
You are God's temple.
God's Spirit dwells IN you.

Not "visits occasionally."
Not "can be accessed through rituals."

**DWELLS. Permanently. Already.**

**The Building Metaphor:**
The Jewish Temple in Jerusalem was considered the dwelling place of God. The Holy of Holies — the innermost chamber — was where God's presence resided.

Paul says: That temple is YOU.
The Holy of Holies is your heart.
God's presence is already inside.

**The Implication:**
If God dwells in you, then the divine isn't external. It's internal.

You don't need to GO somewhere to find God.
You need to go WITHIN.

Every meditation tradition says this.
Every mystic says this.
The Bible says this.

**Why Churches Are Kept:**
If you're the temple, why do you need buildings?

You don't. But buildings need funding. Institutions need power. So they told you the temple was external — come here, pay your tithe, receive your sacraments.

Meanwhile, the actual temple was always you.
""",
                    scripture: ScriptureReference(
                        book: "1 Corinthians",
                        chapter: 3,
                        verse: "16",
                        text: "Don't you know that you yourselves are God's temple and that God's Spirit dwells in your midst?"
                    )
                ),
                
                GodLesson(
                    id: "g2_5",
                    title: "The Gospel of Thomas — The Hidden Text",
                    content: """
**"The Kingdom of God is inside you, and it is outside you. When you come to know yourselves, then you will be known, and you will realize that you are the children of the living Father."**
— Gospel of Thomas, Saying 3

**Why You've Never Read This:**
The Gospel of Thomas was buried. Literally.

Found in 1945 at Nag Hammadi, Egypt. Hidden for 1,600 years.

Not because it was false. Because it was dangerous.

**The Teaching:**
The Kingdom of God isn't a place you go after death.
It's not somewhere in the sky.

It's INSIDE you. Right now.

When you know yourself — truly know your divine nature — you realize you're a child of God.

Not metaphorically. Actually.

**Why It Was Buried:**

This gospel emphasizes direct knowledge (gnosis) over faith.
It emphasizes self-discovery over church authority.
It says salvation is internal, not mediated by institutions.

Every sentence undermines ecclesiastical power.

So they declared it heretical and buried it.

For 1,600 years.

Now you can read it. The question is: Will you?

**The Pattern:**
• Canonical gospels (Matthew, Mark, Luke, John): Emphasize external salvation, church authority, belief
• Gnostic gospels (Thomas, Philip, Mary): Emphasize internal divinity, self-knowledge, gnosis

Guess which ones made the cut when the church compiled the Bible?
""",
                    scripture: ScriptureReference(
                        book: "Gospel of Thomas",
                        chapter: 0,
                        verse: "3",
                        text: "The Kingdom of God is inside you, and it is outside you. When you come to know yourselves, then you will be known, and you will realize that you are the children of the living Father."
                    )
                )
            ]
        ),
        
        // ═══════════════════════════════════════════════════════════════
        // MODULE 3: WHY IT WAS SUPPRESSED
        // ═══════════════════════════════════════════════════════════════
        
        GodModule(
            id: "god_3",
            number: 3,
            title: "Why It Was Suppressed",
            subtitle: "The threat to institutional power",
            lessons: [
                GodLesson(
                    id: "g3_1",
                    title: "The Monopoly Problem",
                    content: """
**If people realize they're divine, they don't need intermediaries.**

**What You Don't Need:**

❌ **Priests** — You access the divine directly
❌ **Tithes** — You don't need to pay for God's grace
❌ **Confession** — You reconcile with the divine internally
❌ **Dogma** — You know truth through gnosis, not belief
❌ **Buildings** — You ARE the temple
❌ **Rituals** — The connection is always-on
❌ **Permission** — Your sovereignty is inherent

**The Business Model:**
Institutional religion survives by positioning itself as the ONLY path to God.

They must convince you that:
• God is external (out there, not in here)
• You are separate (sinful, fallen, broken)
• They have the keys (only we can connect you)
• Salvation costs (money, obedience, compliance)

If you're already divine, the business model collapses.

**The Historical Pattern:**

Every mystic who taught direct divine access was:
• Excommunicated (Meister Eckhart)
• Burned (Giordano Bruno)
• Imprisoned (John of the Cross)
• Silenced (Marguerite Porete)
• Called heretic (Gnostics, Cathars, every early Christian sect that emphasized gnosis)

The pattern is consistent: Direct divine access threatens institutional power.
""",
                    scripture: nil
                ),
                
                GodLesson(
                    id: "g3_2",
                    title: "The Externalization Strategy",
                    content: """
**How They Hid Your Divinity**

**Step 1: Externalize God**
"God is up there, you're down here."
"He's in heaven, you're on earth."
"He's pure, you're sinful."

Create maximum distance between the human and the divine.

**Step 2: Emphasize Sinfulness**
"You were born broken" (original sin)
"Your flesh is corrupt"
"Your desires are evil"
"Without intervention, you're damned"

Make humans feel unworthy of direct divine contact.

**Step 3: Position the Institution**
"WE have the sacraments"
"WE have the authority"
"WE can grant forgiveness"
"Only through US can you reach God"

Create a monopoly on spiritual access.

**Step 4: Control the Texts**
Keep gnostic gospels out of the Bible.
Burn libraries (Alexandria).
Kill the mystics.
Make sure only institution-approved texts survive.

**Step 5: Maintain for Millennia**
Repeat for 2,000 years.
Now people believe it's "always been this way."
The truth is buried. The institution thrives.

**The Truth:**
God was never external.
You were never separate.
The institution was never necessary.

You just forgot.
""",
                    scripture: nil
                )
            ]
        ),
        
        // ═══════════════════════════════════════════════════════════════
        // MODULE 4: PRACTICAL IMPLICATIONS
        // ═══════════════════════════════════════════════════════════════
        
        GodModule(
            id: "god_4",
            number: 4,
            title: "What It Means Practically",
            subtitle: "Not ego — responsibility",
            lessons: [
                GodLesson(
                    id: "g4_1",
                    title: "What It Doesn't Mean",
                    content: """
**Recognizing you're divine doesn't mean:**

❌ **You're better than others**
Everyone has the spark. The homeless person has it. Your enemy has it. Hitler had it (buried under trauma and programming, but present).

Recognizing your divinity should increase compassion, not superiority.

❌ **You can do whatever you want**
Free will includes consequences. Divine nature doesn't exempt you from karma, from cause and effect, from the results of your choices.

If anything, recognizing you're divine increases responsibility — you can't blame external forces for your life.

❌ **You're all-powerful**
You're a localized expression, not the totality. You have godlike potential within a limited form. You can shape reality through intention and action — but you can't do literally anything.

❌ **You don't need to work on yourself**
Divine nature is your origin and destination. But right now? You're probably running a lot of corrupted code. Awakening is recognizing your divinity AND doing the work to embody it.

❌ **You're exempt from suffering**
Gods can suffer. Look at any mythology. Divinity doesn't mean permanent bliss. It means awareness that transcends suffering while still experiencing it.
""",
                    scripture: nil
                ),
                
                GodLesson(
                    id: "g4_2",
                    title: "What It Does Mean",
                    content: """
**Recognizing you're divine DOES mean:**

✅ **You're Responsible**
Your choices matter. You're not a victim of fate, circumstance, or external forces. You have creative power. You're shaping reality with every thought, word, action.

Responsibility, not blame. Power, not victimhood.

✅ **You're Creative**
You can shape reality through intention, attention, and action. You're not passive. The divine creates — and so do you.

What are you creating? Consciously or unconsciously, you're always creating.

✅ **You're Sovereign**
No external authority has ultimate power over you unless you grant it. Governments, churches, corporations — they only control what you agree to give them.

Your sovereignty is inherent. You can choose to submit it (sometimes wisely), but it's yours to give.

✅ **You're Interconnected**
If you're divine, so is everyone else. Harming others harms the whole. Helping others helps the whole. There's no separation — only the illusion of it.

The divine spark in me recognizes the divine spark in you. Namaste isn't just a greeting — it's recognition.

✅ **You Have Access**
Direct access to source. Direct access to guidance. Direct access to creative power. No intermediary required.

The connection is always on. The question is whether you're paying attention.
""",
                    scripture: nil
                ),
                
                GodLesson(
                    id: "g4_3",
                    title: "Remember Who You Are",
                    content: """
**The Matrix, Gnosticism, Kundalini, Dragon Ball — all say the same thing:**

You forgot who you are.

You're divine consciousness pretending to be limited.

**Awakening is remembering.**

Not believing. Not hoping. Not theorizing.

**REMEMBERING.**

You are God, experiencing itself through a temporary, localized form.

The form will dissolve. The consciousness won't.

**The Practical Application:**

When you face fear: Remember who you are.
When you face doubt: Remember who you are.
When you face suffering: Remember who you are.
When you face death: Remember who you are.

The spark cannot be extinguished. It can only forget it's fire.

**Now you remember.**

Act like it.

Not with ego — with responsibility.
Not with superiority — with compassion.
Not with withdrawal — with service.

You're a god in a human game. Play well. Help others remember. Pass the spark.

**The dragon is awake. Now fly.**
""",
                    scripture: nil
                )
            ]
        )
    ]
}

// MARK: - Supporting Types

struct GodModule: Identifiable {
    let id: String
    let number: Int
    let title: String
    let subtitle: String
    let lessons: [GodLesson]
}

struct GodLesson: Identifiable {
    let id: String
    let title: String
    let content: String
    let scripture: ScriptureReference?
}

struct ScriptureReference: Identifiable {
    var id: String { "\(book)_\(chapter)_\(verse)" }
    let book: String
    let chapter: Int
    let verse: String
    let text: String
}

// MARK: - Scripture Database (All References)

struct WeAreGodScriptures {
    
    static let allReferences: [ScriptureReference] = [
        ScriptureReference(
            book: "Genesis",
            chapter: 1,
            verse: "27",
            text: "So God created mankind in his own image, in the image of God he created them; male and female he created them."
        ),
        ScriptureReference(
            book: "Psalm",
            chapter: 82,
            verse: "6",
            text: "I said, 'You are gods; you are all sons of the Most High.'"
        ),
        ScriptureReference(
            book: "John",
            chapter: 10,
            verse: "34",
            text: "Jesus answered them, 'Is it not written in your Law, \"I have said you are gods\"?'"
        ),
        ScriptureReference(
            book: "1 Corinthians",
            chapter: 3,
            verse: "16",
            text: "Don't you know that you yourselves are God's temple and that God's Spirit dwells in your midst?"
        ),
        ScriptureReference(
            book: "Luke",
            chapter: 17,
            verse: "21",
            text: "Neither shall they say, Lo here! or, lo there! for, behold, the kingdom of God is within you."
        ),
        ScriptureReference(
            book: "John",
            chapter: 14,
            verse: "12",
            text: "Very truly I tell you, whoever believes in me will do the works I have been doing, and they will do even greater things than these."
        ),
        ScriptureReference(
            book: "Galatians",
            chapter: 2,
            verse: "20",
            text: "I have been crucified with Christ and I no longer live, but Christ lives in me."
        ),
        ScriptureReference(
            book: "Acts",
            chapter: 17,
            verse: "28",
            text: "For in him we live and move and have our being. As some of your own poets have said, 'We are his offspring.'"
        ),
        ScriptureReference(
            book: "2 Peter",
            chapter: 1,
            verse: "4",
            text: "Through these he has given us his very great and precious promises, so that through them you may participate in the divine nature."
        ),
        ScriptureReference(
            book: "Gospel of Thomas",
            chapter: 0,
            verse: "3",
            text: "The Kingdom of God is inside you, and it is outside you. When you come to know yourselves, then you will be known, and you will realize that you are the children of the living Father."
        ),
        ScriptureReference(
            book: "Gospel of Thomas",
            chapter: 0,
            verse: "70",
            text: "If you bring forth what is within you, what you bring forth will save you. If you do not bring forth what is within you, what you do not bring forth will destroy you."
        ),
        ScriptureReference(
            book: "Gospel of Philip",
            chapter: 0,
            verse: "67",
            text: "You saw the Spirit, you became Spirit. You saw Christ, you became Christ. You saw the Father, you shall become Father."
        )
    ]
}
