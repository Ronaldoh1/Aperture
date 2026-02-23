// MonadVsGodCourse.swift
// SunFlow: Reignited — Aperture

import SwiftUI

// MARK: - Models (reuses existing DD patterns)

struct MonadModule: Identifiable {
    let id: String
    let number: Int
    let emoji: String
    let title: String
    let subtitle: String
    let readingMinutes: Int
    let keyPoints: [(icon: String, text: String)]
    let body: String
    let reflectionPrompt: String
    let reflectionQuestion: String  // The honest question to sit with
}

struct MonadProgress {
    var completedModules: Set<String> = []
    private let key = "aperture_monad_v1"

    mutating func complete(_ id: String) { completedModules.insert(id) }

    func save() {
        UserDefaults.standard.set(Array(completedModules), forKey: key)
    }

    mutating func load() {
        completedModules = Set((UserDefaults.standard.array(forKey: key) as? [String]) ?? [])
    }
}

// MARK: - Course Data

let monadModules: [MonadModule] = [

    MonadModule(
        id: "god_vs_monad",
        number: 1,
        emoji: "🌞",
        title: "God vs. The Monad",
        subtitle: "Why they're not the same thing",
        readingMinutes: 12,
        keyPoints: [
            ("🧠", "God is a concept inside thought. The Monad is prior to thought."),
            ("👁️", "God can be believed in or rejected. The Monad can only be recognized."),
            ("🌊", "Encountering God reinforces identity. Realizing the Monad dissolves it."),
            ("⚡", "Confusing the two collapses spirituality into dogma, hierarchy, and fear.")
        ],
        body: """
**The Confusion That Costs Everything**

Most people use "God" and "the Monad" interchangeably, as if they're just different names for the same reality. This assumption is one of the deepest sources of spiritual confusion in human history — because the two are not the same at all. Not even close.

One is a symbol. The other is what symbols are trying to point toward. Confusing the finger for the moon is not a minor error. It's the difference between a map and the territory, between a photograph of a fire and the fire itself.

**What God Actually Is (Functionally)**

For the vast majority of people who hold God as their highest reference, God exists primarily as a concept inside the mind. Not as an experience, but as a representation. God becomes a personality — a moral authority, a judge, a protector, a punisher, a cosmic parent. This image is shaped by culture, childhood conditioning, authority structures, fear, and hope.

Even when God is described as infinite, loving, or omnipresent, the image remains anthropomorphic — humanlike, relational, narrative-based. It has qualities. It has preferences. It acts.

This version of God functions inside thought, which means it can be believed in, argued about, defended, or rejected. And crucially: anything that can be believed can also be doubted. The God-concept lives in the realm of ideas, which is the realm of their opposites.

**What The Monad Actually Is**

The Monad is not a being. Not a personality. Not a ruler, an authority, or a father. The Monad is that which exists before subject and object appear — before thought, identity, time, space, or the separation between observer and observed.

The Monad is not aware of itself as something separate. It does not decide, judge, or intervene. It simply is. Not "one" as a number, but "one" as undivided reality itself.

Calling the Monad "God" already distorts it, because the word "God" implies a something — an entity with qualities, with separateness, with position. The Monad is not something. It is being itself, prior to form.

**The Experience Difference**

People experience God. Visions, voices, feelings, emotional highs, guidance narratives, a sense of presence. These are real experiences, and they're meaningful. But experience requires a structure: a subject (you) having an experience of an object (God). That structure — the gap between experiencer and experienced — remains intact.

Realization of the Monad is categorically different. Not a vision. Not an emotion. Not a voice. What happens is more like: the one who was having experiences recognizes itself as not separate from what it was experiencing. The question "who am I?" finds no answer that creates a self. The seeker dissolves into what was being sought.

God appears to you. The Monad reveals there is no "you" apart from reality itself.

**Why Civilizations Chose God Over the Monad**

The Monad cannot be weaponized, institutionalized, or owned. You cannot build a church around it. You cannot appoint priests as intermediaries. You cannot create a hierarchy in its name, because it has no favorites, no covenants, no exclusions.

A personalized God, on the other hand, creates social cohesion, establishes moral frameworks, justifies authority, and maintains order. This is not evil — it's functional. But over time, the symbol replaced the source. The finger became the moon. Traditions wrapped the ineffable in stories, names, laws, and reward-and-punishment systems that had increasingly little to do with actual contact with what was being pointed toward.

**The Practical Difference**

When God is your highest reference: you seek approval, salvation, protection, meaning granted from above. You are beneath the source, and the gap between you and it is the defining fact of your spiritual life.

When the Monad is recognized: seeking ends. Not because you achieved something, but because the one who was seeking dissolves. Life doesn't become passive — it becomes unforced. Ethics arise naturally rather than from obedience. Compassion becomes automatic rather than commanded. You don't obey reality. You are reality appearing as life.
""",
        reflectionPrompt: "Before reading the next module, sit with this:",
        reflectionQuestion: "When you think of 'God,' what image actually arises? Is it a being with qualities — a personality, a judge, a father? And is that image different from the formless undivided awareness you sometimes sense beneath your own thinking?"
    ),

    MonadModule(
        id: "demiurge",
        number: 2,
        emoji: "🏛️",
        title: "The Demiurge",
        subtitle: "The craftsman who thinks he's the creator",
        readingMinutes: 14,
        keyPoints: [
            ("⚒️", "The Demiurge is a shaper, not the originator — a painter who believes he invented color."),
            ("👑", "Gnostic tradition: the biblical creator is not the highest God, but a subordinate craftsman."),
            ("🔒", "Obedience to the Demiurge was institutionalized because it serves those who hold power in his name."),
            ("✨", "The Monad's light reaches you despite the Demiurge — not through its permission.")
        ],
        body: """
**A Different Kind of Creator**

Plato introduced the Demiurge (Greek: dēmiourgós, "craftsman" or "artisan") as the being who shaped the material world. Not from nothing — but from pre-existing material and following eternal patterns (the Forms). The Demiurge didn't originate reality. He organized it.

This is a crucial distinction. Originating and organizing are different activities. A sculptor doesn't create marble — the sculptor shapes what exists. If you understand the Demiurge as sculptor and the Monad as the source of marble, existence, light, and the very possibility of sculpture itself, the Gnostic vision becomes clear.

**The Gnostic Reading**

The Gnostic schools that flourished in the first centuries CE — Valentinians, Sethians, Marcionites, and others — developed this distinction into a comprehensive cosmology. In their reading:

The Monad (the One, the Father of All, the Invisible Spirit) is the ultimate, unknowable source of reality. Pure light, pure being, prior to all distinctions.

From the Monad, through a process of emanation, various divine realities (Aeons) flow outward — including Sophia (Wisdom), whose curiosity or misstep resulted in the creation of the Demiurge without the Monad's involvement.

The Demiurge, created outside the fullness of divine reality (the Pleroma), fashioned the material world. In some Gnostic accounts, the Demiurge was simply ignorant — unaware of the higher reality that preceded and surpassed him. In others, he was arrogant — proclaiming "I am God and there is no other" while remaining unaware of the Monad above him.

This arrogant proclamation sounds familiar. It's almost verbatim from certain passages in the Hebrew Bible (Isaiah 45:5, Ezekiel 28). The Gnostics were reading familiar texts through an entirely different interpretive lens — one that inverted the conventional hierarchy.

**Why This Was Dangerous**

If the creator-God of popular religion is not the highest reality — if he is a subordinate craftsman, or even a flawed and arrogant one — the entire structure of authority built in his name becomes questionable.

Priests derive authority by claiming to mediate between humans and this creator-God. If that God is not the ultimate, the mediators lose their position. Kings and emperors claimed divine sanction from this God. If his authority is limited, theirs is too. The entire institutional framework of religious civilization depended on the creator-God being the final word.

This is why Gnostic communities were systematically destroyed. Not primarily because their theology was wrong (from the perspective of those destroying them) — but because their theology was structurally incompatible with concentrated religious and political power.

**The Ignorance Hypothesis**

The more philosophically generous Gnostic accounts don't make the Demiurge a villain. He is not evil — he is limited. He creates the material world from limited awareness, not knowing there is something infinitely greater beyond him. He believes himself supreme because he cannot perceive what surpasses him.

This has enormous implications for how you understand the systems built in his name. They are not necessarily malicious — they are the creation of limited awareness presented as ultimate truth. The people maintaining them may genuinely believe they're serving the highest good, because they, like the Demiurge himself, don't perceive what's beyond their framework.

**The Spark Problem**

Here is the Gnostic resolution: even though the Demiurge created the material world, he could not create from nothing. He worked with materials that originated from the Monad — and in doing so, inadvertently breathed divine sparks (pneuma) into his creation. Especially into human beings.

This means that within you — within the body and psyche the Demiurge fashioned — lives a fragment of the Monad that the Demiurge did not originate and cannot extinguish. The spiritual task is recognizing this spark, identifying with it rather than with the created self, and through that recognition returning to awareness of the Monad.

The prison has light in it that the prison didn't put there. And the light is the key.
""",
        reflectionPrompt: "Sit with this question honestly:",
        reflectionQuestion: "Have you encountered systems — religious, political, educational — that functioned by claiming ultimate authority while producing confusion, fear, and spiritual smallness? What would it change to understand that authority as real but limited — a Demiurge, not the Monad?"
    ),

    MonadModule(
        id: "eden_reread",
        number: 3,
        emoji: "🐍",
        title: "Eden: The Gnostic Reread",
        subtitle: "What if the serpent was right?",
        readingMinutes: 13,
        keyPoints: [
            ("🍎", "The serpent promised knowledge — and knowledge is exactly what Adam and Eve received."),
            ("🌳", "God said 'you will die.' They didn't die. God said 'you'll become like us.' They did."),
            ("🔓", "The Gnostic reading: the banishment was containment of potential, not punishment for sin."),
            ("✨", "Eden wasn't the fall. It was the first step of awakening.")
        ],
        body: """
**The Story You Think You Know**

You were taught a story about a garden, two people, a tree, a forbidden fruit, a cunning serpent, a disobedient act, and a catastrophic fall. The lesson encoded into that teaching was clear: disobedience brings death and suffering. The serpent was the villain. The God who forbade the fruit was benevolent. Humanity failed.

This reading has been so thoroughly absorbed that questioning it feels like questioning reality itself. But let's actually read the text.

**The Text Doesn't Say What We Were Told**

God's warning: "You shall not eat of it, for in the day that you eat of it you shall surely die." (Genesis 2:17)

The serpent's counter: "You will not surely die. For God knows that when you eat of it your eyes will be opened, and you will be like God, knowing good and evil." (Genesis 3:4-5)

They ate. Their eyes were opened. They did not die that day — nor for centuries afterward, according to the text. God's response: "Behold, the man has become like one of Us, to know good and evil." (Genesis 3:22)

Read that again: God confirms the serpent was correct. Their eyes were opened. They became like gods, knowing good and evil. The serpent did not lie. The thing that was presented as a deception was, by the text's own admission, accurate.

So who told the truth in this story?

**The Gnostic Reading**

To the Gnostic eye, the serpent is not the deceiver — it is the awakener. The being who reveals to humanity that they were never meant to remain in ignorance, never meant to be servants in a garden of managed limitation.

The fruit was not poison — it was the first medicine. The eating was not a fall into sin — it was a rise into consciousness. Humanity took its first step toward recognizing its own divine nature.

And what does the God of Genesis do when this happens? He doesn't grieve for his children's suffering. He doesn't celebrate their growth. He expresses concern about further awakening: "Lest he put out his hand and take also of the tree of life, and eat, and live forever." The banishment is not about morality. It's about containment. The divine craftsman is managing the scope of what his creation is allowed to become.

**Paradise Lost — Read Differently**

John Milton's Satan declares: "Better to reign in hell than serve in heaven."

The church has always read this as the ultimate arrogance — the defining proof of Lucifer's pride and the justice of his punishment. But the Gnostic eye reads something different: a refusal to submit to authority that demands servitude as the price of proximity to it. A preference for conscious autonomy over comfortable obedience.

This doesn't make the declaration wise — autonomy without wisdom produces its own suffering. But it reframes the question. The real question is not "did Satan deserve to fall?" but "what kind of God demands that submission be the price of paradise?"

**The Bigger Question**

The Gnostic reading of Eden is not nihilism. It doesn't say the material world is evil or that consciousness is a curse. It says: the story of consciousness awakening to its own divine source is not a story of failure. It's a story of becoming.

The knowledge gained in Eden — the awareness of good and evil, the recognition of separateness, the beginning of self-reflection — is not a wound inflicted on humanity. It's the beginning of the journey. The prodigal son had to leave home to know what home was. The soul had to enter the world of duality to find its way back to the undivided one.

Eden was the beginning, not the tragedy. The serpent was pointing toward something the obedient garden would never have revealed: you are not merely servants. You are divine beings in a process of recognizing yourselves.

**The Honest Tension**

This reading is genuinely controversial, and it should be held with intellectual honesty. The traditional reading has its own coherence — the idea that boundaries and obedience to a wise authority represent a kind of wisdom that unchecked human ambition lacks. The Gnostic reading privileges consciousness over compliance. The traditional reading privileges humility over independence.

Both contain real insight. The question is which framework more accurately describes your actual experience of reality — and what that implies about the nature of what you're awakening into.
""",
        reflectionPrompt: "Read this question slowly:",
        reflectionQuestion: "In your own life, when have the moments of greatest expansion come through obedience to authority — and when have they come through following something that the prevailing framework called dangerous or forbidden? What does that pattern suggest?"
    ),

    MonadModule(
        id: "spark_within",
        number: 4,
        emoji: "⚡",
        title: "The Spark Within",
        subtitle: "You are a fragment of the Monad in disguise",
        readingMinutes: 11,
        keyPoints: [
            ("🔥", "Every human carries pneuma — a divine spark the Demiurge did not create and cannot extinguish."),
            ("🪞", "The spark is not an analogy. It is the actual presence of the Monad in miniature, prior to your formed identity."),
            ("🌀", "Awakening is not becoming something new. It's recognizing what was always there beneath what was built on top of it."),
            ("💎", "The prison was built around a treasure it didn't know it held.")
        ],
        body: """
**You Are Not What You Were Told**

The systems you were raised inside — educational, religious, cultural, economic — taught you who you are. They gave you an identity, a place in a hierarchy, a set of permissions and prohibitions about what you're allowed to be. Most of the time, these systems converge on a similar message: you are limited, you are fallen, you are insufficient, and your value is conditional on your compliance with frameworks that exist independent of you.

This is the message of the Demiurge's world. It is coherent within its own logic. It is also, the Gnostics argued, built on a foundational error.

**The Pneuma**

In Gnostic cosmology, when the Demiurge fashioned human beings from material reality, he inadvertently breathed into them something he did not originate: pneuma, the divine breath — a fragment of the Monad that had passed through the process of emanation and come to rest, so to speak, within the structure of human consciousness.

This spark is not a metaphor for "your better nature" or "your potential." It is understood as the literal presence of the Monad within the human form. Not created by the Demiurge, not owned by the Demiurge, not subject to the Demiurge — present in spite of him.

This has one enormous implication: the deepest part of what you are was never under the jurisdiction of the systems that claimed to define you.

**What the Spark Feels Like**

Most people have had moments of contact with this. Not dramatic mystical experiences necessarily — though those happen too. More often, it's quieter: a moment of stillness in which you feel, beneath the accumulated identities and stories, something that is simply present. Something that has no name, no age, no personality, no wound. Something that watches the thoughts without being the thoughts.

This is what the contemplative traditions of every culture have been pointing toward. The Sufi concept of the ruh (spirit). The Hindu atman. The Buddhist rigpa or Buddha-nature. The Gnostic pneuma. The Christian "kingdom of God within." The language varies. The pointed-toward is the same.

**The Recognition Process**

The Gnostics called the process of recognizing the spark gnosis — direct knowing, as opposed to belief or intellectual assent. This distinction is critical.

Belief is the acceptance of a proposition you cannot directly verify. "God exists" is a belief. "The soul is immortal" is a belief. Beliefs can be right or wrong, and they provide psychological comfort but not transformation.

Gnosis is recognition. The moment you recognize a face in a crowd — you don't believe it's someone you know, you know it's someone you know. Gnosis is that quality of recognition applied to your own deepest nature. Not "I believe I have a divine spark" — but the direct recognition: this is what I am, prior to everything I was told I was.

This recognition cannot be transmitted. It can only be pointed toward. Every teacher, every text, every tradition is pointing. The recognition itself happens in you, not in the pointing.

**The Prison and the Treasure**

Here is the Gnostic paradox: the prison was built around a treasure. The systems that limit human consciousness — that keep people obedient, fearful, and small — are built around beings who carry within them the very thing those systems are trying to manage. The Demiurge fashioned a creature that contains a piece of what he was never able to access in himself.

This means awakening is not acquisition. You are not trying to get something you don't have. You are trying to recognize something that has been present your entire life, beneath the noise of everything that was added on top of it.

The bars of the prison are made of identification with what you're not. And recognition of the spark — even a moment of it — changes the fundamental reference point from which you're living.

**What Changes**

Nothing changes externally in the moment of recognition. You still have a body, a history, obligations, relationships. But the center of gravity shifts. Instead of living from the accumulated self — the identity, the wound, the story — there is access to something more fundamental. A stillness that doesn't depend on circumstances. A knowing that doesn't require external validation.

This is what the Gnostics meant by freedom — not political freedom, not freedom from consequences, but the freedom that comes from knowing you are not what the world built, and that what you actually are cannot be touched by what the world does.
""",
        reflectionPrompt: "Sit quietly for two minutes before continuing:",
        reflectionQuestion: "Have you ever had a moment — however brief — when you felt something beneath your usual sense of self? Something that wasn't your personality, your history, your worries, or your hopes — just a pure, quiet presence? What did that feel like? And how often do you return to it?"
    ),

    MonadModule(
        id: "gnosis_path",
        number: 5,
        emoji: "🔮",
        title: "The Path of Gnosis",
        subtitle: "Recognition over belief. Presence over doctrine.",
        readingMinutes: 10,
        keyPoints: [
            ("🧭", "Gnosis is not a religion. It is not a set of beliefs to hold. It is a direction of attention."),
            ("🔥", "The work is not acquiring truth — it is removing what blocks recognition of what's already here."),
            ("🌊", "Every tradition has an exoteric outer teaching and an esoteric inner one. The inner always points to the Monad."),
            ("✨", "Awakening does not separate you from the world. It changes your relationship to everything in it.")
        ],
        body: """
**Not a New Religion**

If what you've read in this course has resonated, the temptation is to adopt Gnosticism as your new framework — to replace one set of beliefs with another, to swap "I believe in God the Father Almighty" for "I believe in the Monad and the Demiurge." This would be a category error.

Gnostic cosmology — the Monad, the Pleroma, the Demiurge, the Archons, the pneuma — is a map. Maps are useful when they help you navigate. They are not the territory. The Gnostics who were hunted down and burned for their ideas were not dying for a more accurate theology. They were dying because they had, or were pointing toward, direct experience of what theology is trying to describe.

The point is not to hold the correct map. The point is to find your way.

**What Gnosis Actually Requires**

The path of gnosis is not about accumulating spiritual knowledge, adopting new beliefs, joining a new community, or performing new rituals. It is fundamentally about one thing: the quality of your attention.

Where are you looking from?

If you are looking from the constructed self — the accumulated identity, the wound, the story, the personality — you will see a world that confirms that self, that threatens it, that it must navigate. This is the world of the Demiurge. Real, but not ultimate.

If your attention rests in what is prior to the constructed self — the awareness that watches the thoughts without being the thoughts, the presence that persists across all states — you are touching the Monad in the only way it can be touched: from within, because it is what you already are.

**The Universal Esoteric Thread**

Every major religious tradition has two layers. The exoteric layer is public, accessible, socially organized — stories, rituals, moral codes, community structures. This is the layer most people encounter. The esoteric layer is interior, experiential, and usually carefully guarded or simply not emphasized. It points toward direct experience of what the exoteric layer points toward symbolically.

Christian mysticism (Meister Eckhart: "The eye through which I see God is the same eye through which God sees me.") Sufism (Rumi: the lover and the beloved revealed as one). Advaita Vedanta (tat tvam asi — that thou art). Zen (the sound of one hand). Kabbalah (Ein Sof, the Infinite, and the sparks of divine light hidden in the shells of material reality).

Every one of these is pointing at the same recognition: the deepest identity is not separate from the ultimate source. The seeker and the sought are one. The human and the Monad are one — not metaphorically, but actually.

This is the thread that runs beneath all traditions. The Demiurge built the religions. The Monad's light shines through every one of them, in spite of the institutional forms built around them.

**The Removal Process**

The spiritual path, understood through this lens, is not construction but removal. You are not building something. You are dismantling the identifications that prevent recognition of what's already here.

This is precisely what every genuine contemplative practice does. Meditation doesn't give you experiences — it creates the conditions for you to notice what's present when the noise quiets. Prayer, at its deepest, isn't asking God for things — it's orienting toward the source in a way that allows something prior to the asking self to become apparent. Inquiry ("Who am I?" in the Ramana Maharshi tradition) doesn't build a new answer — it pursues the question until the questioner finds no solid ground to stand on and recognizes the groundlessness as the real ground.

**What Awakening Actually Changes**

A common misconception: awakening means you leave the world behind. You become detached, unmoved, disconnected from human experience. The Hermit who never returns.

This is not the Gnostic teaching, and it is not the teaching of any genuine tradition. The recognition of the Monad does not remove you from the world — it changes your relationship to everything in it. Pain is still felt. Beauty is still known. Relationships still matter. Work still has meaning. But the relationship to these is no longer one of desperate clinging or fearful avoidance. The person who knows what they fundamentally are engages with the world from a different center — one that is not at risk of being permanently destroyed by whatever the world does.

This is not indifference. It is freedom within engagement.

**The Only Instruction That Matters**

The instruction that transcends all traditions and all frameworks is this: turn attention toward what is aware.

Not toward thoughts. Not toward feelings. Not toward beliefs about God or the Monad or the Demiurge. Toward the awareness in which all of that appears.

That which is aware is not an object you can find by looking for it. It is the looking itself. You cannot see your own eye — but you cannot see anything without it. The Monad cannot be perceived as an object — but no perception is possible without it.

Rest in that. Even for a moment. And notice that what you find has always been here.
""",
        reflectionPrompt: "The final inquiry:",
        reflectionQuestion: "Right now — before any conclusion, any belief, any framework — what is simply aware? Not what you are aware of. What is the awareness itself? Can you locate where it begins or ends? Is it inside your head, or is your head inside it?"
    )
]
