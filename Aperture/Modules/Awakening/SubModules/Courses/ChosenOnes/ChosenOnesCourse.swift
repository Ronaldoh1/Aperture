// ChosenOnesCourse.swift
// SunFlow: Reignited — Aperture

import SwiftUI

struct ChosenOneArchetype: Identifiable {
    let id: String
    let name: String
    let emoji: String
    let tagline: String
    let accentHex: String
    let coreGift: String
    let coreBurden: String
    let mission: String
    let shadow: String
    let recognitionSigns: [String]
    let famousExamples: [String]
    let activationPractice: String
    let compatibleWith: [String]
    let body: String
    var accent: Color { Color(hex: accentHex) }
}

struct ChosenOnesQuizOption {
    let text: String
    let weights: [String: Int]
}

struct ChosenOnesQuestion: Identifiable {
    let id = UUID()
    let question: String
    let options: [ChosenOnesQuizOption]
}

// MARK: - Archetypes

let chosenOnesArchetypes: [ChosenOneArchetype] = [

    ChosenOneArchetype(
        id: "prophet",
        name: "The Prophet",
        emoji: "🔥",
        tagline: "You see what others aren't ready to hear",
        accentHex: "#FF6B35",
        coreGift: "Receiving and transmitting truth before the world is ready for it",
        coreBurden: "Speaking what people resist — often before there's evidence to back you",
        mission: "Bridge the gap between what is hidden and what the collective needs to know. Not prediction — revelation.",
        shadow: "Messiah complex. When ego enters the transmission, the signal corrupts. The Prophet's greatest enemy is believing they alone hold truth.",
        recognitionSigns: [
            "You've said things years before they became obvious to everyone else",
            "People dismiss you, then quietly agree later",
            "You receive downloads or knowings you can't fully explain",
            "Truth feels more urgent than comfort — yours and others'",
            "You feel compelled to speak even when it costs you socially"
        ],
        famousExamples: ["Nikola Tesla (seen as delusional, proven visionary)", "MLK Jr.", "Harriet Tubman (acted before others moved)", "Cassandra — Greek myth, cursed to speak truths no one believed"],
        activationPractice: "Keep a transmission journal. Write every strong intuition the moment it arrives with a timestamp. Review in 6 months. Your signal-to-noise ratio will clarify itself.",
        compatibleWith: ["seeker", "warrior", "hermit"],
        body: """
**The Weight of Knowing First**

Prophets don't predict the future. They perceive what's already present but invisible — patterns in the noise, truths beneath the surface, movements before they crystallize. The gift is uncomfortable because it arrives before proof. You know something you can't yet demonstrate. You speak, people resist. Time passes. They catch up.

This is the Prophet's cycle, repeating across every domain — relationships, society, technology, spirituality. Tesla envisioned wireless global communication 100 years before its arrival. King saw the world that should exist before the movement had power to build it. The Prophet doesn't create the future — they receive its signal ahead of schedule.

**The Persecution Pattern**

Almost universally, Prophets face a period of dismissal, ridicule, or active suppression. When someone perceives truth that threatens existing power structures — institutional, social, or psychological — the predictable response is: discredit the messenger. Label the perception as delusion, conspiracy, or ego. Remove the signal by targeting its source.

If you identify as a Prophet type, you've experienced this. The question isn't whether you'll face resistance. The question is whether you can distinguish genuine discernment from wishful thinking, authentic signal from ego-dressed-as-revelation.

**Signal vs. Noise**

Indicators of authentic signal: arrives without your seeking it, doesn't flatter your ego, often makes you uncomfortable, proves accurate over time.

Indicators of distortion: confirms what you already want to believe, flatters your specialness, isolates you from all accountability, requires no verification.

**The Silence Protocol**

Most Prophets learn — through painful experience — that not every transmission is meant to be spoken immediately. The timing of truth is part of the message. The mature Prophet learns to hold transmissions, to let them ferment, to sense when the soil is ready before planting. This is not self-censorship. It's wisdom.
"""
    ),

    ChosenOneArchetype(
        id: "hermit",
        name: "The Hermit",
        emoji: "🌒",
        tagline: "Depth is your compass. Stillness is your work.",
        accentHex: "#7B68EE",
        coreGift: "Accessing truth through sustained inner contact that crowd-immersed people cannot reach",
        coreBurden: "A world that pathologizes your need for solitude and calls it antisocial",
        mission: "Go deep. Bring back what you find. The Hermit's gift to the world is discovered in silence — but only if they eventually return.",
        shadow: "Spiritual bypassing. Using solitude to avoid growth, relationships, and accountability rather than to deepen for them.",
        recognitionSigns: [
            "Social energy drains you in a way that baffles extroverts",
            "Your best thinking happens alone — often in nature or early hours",
            "You feel a persistent call toward contemplation the culture doesn't validate",
            "You see through superficial conversation and crave depth most people can't sustain",
            "You've been told you're 'too intense' as if that were criticism"
        ],
        famousExamples: ["Henry David Thoreau", "Carl Jung (Red Book isolation period)", "Emily Dickinson", "Desert Fathers and Mothers"],
        activationPractice: "Create a deliberate daily silence window — minimum 20 minutes, no input. No music, no podcast, no phone. Sit with what comes. Uncomfortable for a week, then it becomes the most valuable part of your day.",
        compatibleWith: ["prophet", "seeker", "healer"],
        body: """
**Solitude Is Not Loneliness**

Loneliness is the pain of unwanted isolation — a hunger for connection that isn't being met. Solitude is chosen aloneness — a fullness, a going-in, a contact with something that crowd-noise prevents. The Hermit type lives in solitude, not from loneliness.

If you consistently misread your need for solitude as a deficit — something to fix, overcome, or medicate — you will spend your life fighting your own design.

**What the Hermit Knows**

There is a quality of understanding that only arrives in stillness. Not intellectual conclusions — those come through reading and discussion. But something more direct: a knowing that settles into the bones, a clarity that doesn't require argumentation, a contact with what's real that the noise-world perpetually defers.

Every contemplative tradition in human history — Sufi, Buddhist, Christian mystical, Indigenous — has known this. The Hermit type hasn't forgotten.

**The Return**

Here is the Hermit's paradox: the depth accessed in solitude is meaningless if it never returns to the world. The Hermit who withdraws and never re-engages has failed their mission. The great Hermits of history — Thoreau, desert monastics — eventually wrote, taught, or influenced. Solitude was preparation, not destination.

**The Shadow**

Solitude can become escape. The Hermit's shadow is using inner life as a fortress against the discomfort of relationship and accountability. True depth requires both inward and outward movement. The Hermit who only withdraws is not going deep — they are hiding, dressed in the language of contemplation.
"""
    ),

    ChosenOneArchetype(
        id: "healer",
        name: "The Healer",
        emoji: "💚",
        tagline: "You feel what's broken and move toward it",
        accentHex: "#2ECC71",
        coreGift: "Intuitive perception of wounds — physical, emotional, energetic — and natural capacity to facilitate restoration",
        coreBurden: "Absorbing others' pain without adequate return or boundaries",
        mission: "Restore wholeness in bodies, psyches, communities, systems. The Healer sees disease at its root, not just its surface expression.",
        shadow: "Wounded Healer syndrome — healing others as avoidance of your own wounds. The unexamined Healer creates dependency and burns out.",
        recognitionSigns: [
            "People share things with you within minutes that they've never told anyone",
            "You feel physical sensations that correspond to others' pain",
            "Animals and children trust you immediately",
            "You are drawn toward broken things — people, systems, ideas",
            "Your presence alone seems to shift the energy in a room"
        ],
        famousExamples: ["Florence Nightingale", "Fred Rogers", "Thich Nhat Hanh", "Elisabeth Kübler-Ross", "Rumi (poetry as healing transmission)"],
        activationPractice: "Before healing interactions, hold this intention: 'I am the hollow instrument, not the source.' After, shake your hands and exhale three times. This prevents accumulation of absorbed energy over time.",
        compatibleWith: ["empath", "hermit", "warrior"],
        body: """
**The Natural Healer**

Healers don't choose their gift — it manifests whether they cultivate it or not. The child who instinctively comforts crying friends. The adult whose presence reduces anxiety in hospital rooms. The person people always somehow find to unburden to. This is not a learned skill. It's a perceptual orientation that precedes training.

What the Healer perceives is the gap between wholeness and its current expression — in a body, in a psyche, in a relationship. The perception often arrives before the words to describe it.

**Modalities Are Not the Gift**

Many Healers mistake their gift for their modality — medicine, therapy, energy work, cooking, listening. But the modality is the vehicle. The gift is the perception and transmission of restoration. A Healer can do their work through a conversation, a meal, a moment of genuine attention.

**The Wound**

Every Healer carries a wound — and this is not accidental. The wound provides access. You can meet people in their pain because you know pain. The question is whether you've processed your wound enough that it informs your healing without distorting it.

The examined Healer uses their wound as a lantern, not a lens.

**Boundaries as Sacred**

Holding space without becoming the space. Absorbing others' pain without releasing it is not compassion — it's self-destruction dressed as service. Healthy limits don't mean less love. They mean the love stays clean.
"""
    ),

    ChosenOneArchetype(
        id: "empath",
        name: "The Empath",
        emoji: "🌊",
        tagline: "You feel the room before you enter it",
        accentHex: "#3498DB",
        coreGift: "Direct emotional perception — feeling the emotional field of individuals and environments without verbal communication",
        coreBurden: "Difficulty distinguishing your own emotional state from what you're absorbing from the environment",
        mission: "Translate emotional reality between people who cannot feel each other directly. The Empath is a bridge — but bridges must be sturdy, not permeable.",
        shadow: "Emotional merger. Losing self in the emotional field of others, mistaking their experience for your own truth.",
        recognitionSigns: [
            "You can't watch certain news without physically feeling it",
            "Crowded spaces drain you in ways you can't explain",
            "You know something is wrong before anyone says it",
            "Your mood shifts dramatically based on who you're with",
            "You've been called 'too sensitive' your entire life — meant as criticism"
        ],
        famousExamples: ["Most great therapists and counselors", "Musicians who channel collective feeling into sound", "Highly sensitive persons (estimated 15-20% of population)"],
        activationPractice: "Three times daily, pause and ask: 'Is this mine?' Notice your baseline emotional state alone in nature — that's your signal. Everything departing from it in social contexts is information about the field, not about you.",
        compatibleWith: ["healer", "prophet", "warrior"],
        body: """
**Direct Emotional Perception**

The Empath doesn't infer emotions — they perceive them directly. While most people read emotional cues (facial expression, tone, body language) and deduce states, the Empath has a more immediate channel. The feeling arrives before the analysis. The perception is often physical.

**The Boundary Problem**

The Empath's developmental task is learning to be a receiver without becoming a sponge. A receiver takes in signals, processes them, and remains intact. A sponge absorbs and merges, losing its own shape.

Most Empaths spend years confused about which emotions are theirs. They walk into a room anxious and leave not knowing if the anxiety was theirs or the room's. This is not a flaw — it's an untrained gift.

**The Information Layer**

Once the Empath learns to identify absorbed emotion as information rather than identity, everything changes. "The room is anxious" becomes data, not their personal state. "He's carrying unprocessed rage" becomes something they observe, not become. The perceptual channel stays open — they haven't numbed — but now the signal serves them.

**Empathy vs. Codependency**

Empathy is perception. Codependency is responsibility. The Empath who mistakes emotional perception for emotional responsibility — "I feel their pain, therefore I must fix it" — creates codependent dynamics that eventually damage both parties. Feeling someone's pain and being required to eliminate it are not the same thing.
"""
    ),

    ChosenOneArchetype(
        id: "endurer",
        name: "The Endurer",
        emoji: "🏔️",
        tagline: "You don't break. That itself becomes the teaching.",
        accentHex: "#E67E22",
        coreGift: "Resilience under conditions that would end others — metabolizing hardship into wisdom and strength",
        coreBurden: "Attracting more difficulty because the universe seems to know you can handle it",
        mission: "Demonstrate that it's possible to remain whole through what breaks most people. Not to suffer for suffering's sake — but to transmute difficulty into proof of human capacity.",
        shadow: "Martyrdom. Confusing suffering with virtue. The Endurer who believes they are most valuable when most burdened has confused a pattern for a purpose.",
        recognitionSigns: [
            "Your life has included disproportionate hardship — loss, trauma, systemic obstacles",
            "You've been told 'I don't know how you handle it' more times than you can count",
            "You don't complain — which sometimes means wounds go unaddressed too long",
            "Others draw strength from watching you persist",
            "You have a quiet knowing that you will not be permanently broken"
        ],
        famousExamples: ["Viktor Frankl (Holocaust survivor → logotherapy)", "Nelson Mandela (27 years imprisoned, emerged without bitterness)", "Malala Yousafzai"],
        activationPractice: "Write the three hardest things you've survived. For each one: what did it give you that you couldn't have gained any other way? This is honest accounting of what difficulty actually produced.",
        compatibleWith: ["warrior", "prophet", "healer"],
        body: """
**The Endurer's Paradox**

Endurers are not people who love suffering. They are people who have discovered, usually through necessity, that suffering can be converted. Frankl in Auschwitz didn't choose his circumstances — he chose what to do with them. The choice wasn't optimism. It was meaning-making under conditions designed to strip meaning away.

This is the Endurer's essential skill: metabolization. Where others are destroyed by difficulty, the Endurer processes it into something that strengthens rather than diminishes. Not without cost — always with cost — but with something on the other side that couldn't exist without the fire.

**The Disproportionate Life**

Many Endurers notice their lives contain disproportionate challenge. People with high resilience capacity often attract or are assigned disproportionate difficulty. Mandela's 27 years in prison built a quality of consciousness that could hold South Africa's transition without revenge. Some things only come through time and fire.

**The Shadow: Suffering as Identity**

When someone has survived so much, survival becomes the story. But at some point, the story needs updating. The Endurer who can only function under pressure — who unconsciously creates difficulty because stillness feels wrong — has crossed into martyrdom.

Peace is not weakness. Success is not a betrayal of your survival story. You are allowed to arrive somewhere easier.

**Transmission Through Example**

The Endurer often doesn't know how much their existence is teaching. Watching someone refuse to be permanently broken by what should break them — quietly, without drama — is one of the most powerful human demonstrations available.
"""
    ),

    ChosenOneArchetype(
        id: "rebel",
        name: "The Rebel",
        emoji: "⚡",
        tagline: "You see what's wrong before you know what's right",
        accentHex: "#E74C3C",
        coreGift: "Pattern recognition for dysfunction — seeing what's broken in systems and norms before consensus has formed",
        coreBurden: "Being labeled disruptive, difficult, or dangerous for accurately perceiving dysfunction",
        mission: "Break what needs breaking. Specifically and skillfully — not randomly. The Rebel at their highest is a diagnostic instrument for what society has outgrown.",
        shadow: "Rebellion as identity. Opposing everything not because it's wrong, but because opposition itself has become the addiction.",
        recognitionSigns: [
            "Authority figures have consistently found you threatening",
            "You feel viscerally uncomfortable with rules that serve no one",
            "You've been disciplined or marginalized for saying accurate things",
            "You see the machinery behind institutions others accept as natural",
            "You are magnetically drawn to people and ideas outside the mainstream"
        ],
        famousExamples: ["Frederick Douglass", "Rosa Parks (calculated disruption, not impulsive)", "Galileo", "Ida B. Wells", "Buckminster Fuller"],
        activationPractice: "Before any act of disruption: 'Am I doing this because it's genuinely wrong and I see it clearly — or because I'm angry and this is the target?' Both can be true. Which is driving? One produces change. The other produces chaos.",
        compatibleWith: ["prophet", "warrior", "seeker"],
        body: """
**Disruption as Gift**

Every major shift in human civilization has required Rebels — not the violent or random kind, but the discerning kind. People who could see dysfunction in systems so normalized that most participants couldn't perceive the problem. Galileo's heliocentrism. Douglass's indictment of slavery's Christianity. Wells's documentation of lynching in a world that preferred not to document it.

These were not people who opposed authority because opposition felt good. They opposed specific things because those things were specifically wrong. The precision matters.

**The Rebel's Diagnostic Capacity**

The Rebel has a finely tuned instrument for institutional hypocrisy. Where others accept a system's stated purpose as its actual function, the Rebel perceives the gap. They see who the system actually serves, who it actually harms, what it actually preserves. The Rebel can do this to systems they agree with ideologically — which is the real test.

**Disruption vs. Destruction**

When I break something, am I making room for something better, or am I just breaking? The highest Rebels were builders as well as breakers. Douglass didn't just indict slavery — he argued for specific alternatives. Wells didn't just document horror — she built organizations.

**The Shadow: Disruption as Addiction**

When opposition becomes identity, the Rebel is no longer serving their gift — they're serving their wound. The person who must oppose everything, who is uncomfortable agreeing, who experiences cooperation as surrender — this is not discernment. It's compulsion.
"""
    ),

    ChosenOneArchetype(
        id: "warrior",
        name: "The Warrior",
        emoji: "🗡️",
        tagline: "You move toward what others run from",
        accentHex: "#C0392B",
        coreGift: "Presence under pressure — remaining functional, focused, and effective in conditions that collapse others",
        coreBurden: "Being called to confront things others won't, absorbing costs so others don't have to",
        mission: "Protect what is worth protecting. Stand where others cannot stand. The Warrior's highest expression is not violence — it's presence in the face of what everyone else runs from.",
        shadow: "Perpetual war. The Warrior who cannot stop fighting even when there's nothing left to fight has confused their capacity for their identity.",
        recognitionSigns: [
            "Danger or confrontation doesn't paralyze you — it focuses you",
            "You move toward problems while others move away",
            "You have an acute sense of honor — not social status, but personal integrity",
            "You feel restless without a cause worth fighting for",
            "Others look to you when things fall apart"
        ],
        famousExamples: ["Harriet Tubman (19 missions, never lost a passenger)", "Marcus Aurelius (philosopher-warrior)", "Malala Yousafzai", "Fred Hampton"],
        activationPractice: "Identify your current battle. Is it worth fighting? Is it yours to fight? Warriors waste themselves on the wrong wars. Clarity about which battles to enter is as important as the capacity to fight.",
        compatibleWith: ["prophet", "endurer", "healer"],
        body: """
**The True Warrior**

The true Warrior is defined not by force but by presence. The capacity to stay when everything in the environment says flee. To function when fear is present rather than in its absence.

This is not bravado. Bravado is the absence of fear's acknowledgment. Warrior-courage is feeling the fear and moving anyway — toward the wound, the threat, the confrontation, the hard conversation.

**What the Warrior Protects**

Every Warrior needs something worth protecting. Without that, the capacity turns on itself or others. The developmental question is not "Am I a Warrior?" but "What is my cause?"

Harriet Tubman's cause was clear. Marcus Aurelius's was clear. Malala's was clear. Clarity of cause is not ideological narrowness — it's the focusing of a powerful instrument on something specific enough to move.

**The Cost**

Warriors pay a price. They absorb impacts so others don't have to. They enter spaces where civilians would be destroyed. The Warrior who doesn't acknowledge the cost and build in recovery doesn't last — and doesn't serve.

**When the War Is Over**

The Warrior's hardest transition is peace. After years of being the one who moves toward threat, stillness feels like failure. The greatest battle is internal — learning to exist fully when there's nothing left to fight.
"""
    ),

    ChosenOneArchetype(
        id: "seeker",
        name: "The Seeker",
        emoji: "🧭",
        tagline: "Truth is the only destination you've ever had",
        accentHex: "#9B59B6",
        coreGift: "Insatiable inquiry — the capacity to ask questions others fear, follow threads others drop, synthesize across boundaries others won't cross",
        coreBurden: "Never fully arriving — the permanent restlessness of someone for whom every answer generates three more questions",
        mission: "Map what hasn't been mapped. The Seeker synthesizes across traditions and disciplines to illuminate connections that siloed thinkers cannot see.",
        shadow: "Perpetual seeking as avoidance. Using the pursuit of knowledge to delay embodying what you've already found.",
        recognitionSigns: [
            "You've never stopped asking 'why' even when the answer would be more comfortable",
            "You're drawn to the edges of every field — where consensus thins and real questions live",
            "Books, ideas, and systems fascinate you but no single one ever fully satisfies",
            "People call you a 'Renaissance person' or 'too scattered' — same observation",
            "Your mind naturally connects things from domains others keep separate"
        ],
        famousExamples: ["Leonardo da Vinci", "Nikola Tesla", "Carl Sagan", "Hypatia of Alexandria", "Joseph Campbell"],
        activationPractice: "Take your three most active areas of inquiry right now. Write one sentence connecting all three through a common principle. Not a writing exercise — a perception exercise. The connection exists. Finding it is the gift.",
        compatibleWith: ["prophet", "rebel", "hermit"],
        body: """
**The Permanent Pilgrim**

The Seeker never fully arrives, and they wouldn't want to. For them, the journey is the point. Each answer opens a larger question. Each discipline reveals its edge, where consensus ends and the genuine unknown begins. That edge is where the Seeker lives.

This is not intellectual indulgence. The Seeker performs a function specialists cannot: cross-domain synthesis. Da Vinci's notebooks connected anatomy, fluid dynamics, architecture, and art because he didn't respect the walls between them. Campbell found the Hero's Journey across every mythological tradition because he didn't accept those traditions had nothing to say to each other.

**The Cross-Domain Gift**

Every major intellectual breakthrough in human history involved someone thinking across domains. Darwin's natural selection was recognizable to economists and breeders — because he'd been reading both. Einstein's thought experiments weren't physics exercises — they were imagination exercises applied to physics.

The Seeker is structurally positioned for this synthesis because they are not invested in any single tradition's supremacy. They ask: what is true? And follow the question wherever it goes.

**The Shadow: Seeking Instead of Arriving**

The Seeker's deepest shadow is using inquiry to avoid embodiment. You can understand everything about love and never be vulnerable enough to love. You can map every spiritual tradition and never sit still long enough to have the experience they're pointing toward.

At some point, the seeker must become the finder — must stop reading about the path and walk it.

Am I still seeking because there's more to find, or am I seeking because arriving is terrifying?
"""
    )
]

// MARK: - Discovery Quiz

let chosenOnesQuestions: [ChosenOnesQuestion] = [
    ChosenOnesQuestion(
        question: "When your group faces a crisis, your instinctive first move is:",
        options: [
            ChosenOnesQuizOption(text: "Move toward it — I become more focused, not less", weights: ["warrior": 3, "endurer": 2, "healer": 1]),
            ChosenOnesQuizOption(text: "Feel everyone's state before I act", weights: ["empath": 3, "healer": 2, "seeker": 1]),
            ChosenOnesQuizOption(text: "I already saw it coming and I know what caused it", weights: ["prophet": 3, "rebel": 2, "seeker": 1]),
            ChosenOnesQuizOption(text: "Withdraw alone first, then re-engage", weights: ["hermit": 3, "seeker": 2, "endurer": 1])
        ]
    ),
    ChosenOnesQuestion(
        question: "Which description fits you most accurately?",
        options: [
            ChosenOnesQuizOption(text: "Too intense / too honest / too serious", weights: ["prophet": 3, "hermit": 2, "warrior": 1]),
            ChosenOnesQuizOption(text: "Too sensitive / absorbs everything / emotional sponge", weights: ["empath": 3, "healer": 2, "seeker": 1]),
            ChosenOnesQuizOption(text: "Difficult / provocative / won't let it go", weights: ["rebel": 3, "warrior": 2, "prophet": 1]),
            ChosenOnesQuizOption(text: "Scattered / too many interests / Renaissance person", weights: ["seeker": 3, "rebel": 1, "prophet": 1])
        ]
    ),
    ChosenOnesQuestion(
        question: "Your relationship with hardship is closest to:",
        options: [
            ChosenOnesQuizOption(text: "I've been through more than most — and it built something in me I couldn't have built otherwise", weights: ["endurer": 3, "warrior": 2, "prophet": 1]),
            ChosenOnesQuizOption(text: "I feel others' suffering as if it's my own — which is both gift and burden", weights: ["empath": 3, "healer": 2, "hermit": 1]),
            ChosenOnesQuizOption(text: "Suffering points to something broken that needs fixing — it's information", weights: ["rebel": 3, "seeker": 2, "warrior": 1]),
            ChosenOnesQuizOption(text: "I go into solitude with it — suffering is a teacher that requires silence", weights: ["hermit": 3, "prophet": 2, "seeker": 1])
        ]
    ),
    ChosenOnesQuestion(
        question: "The type of courage you're most naturally equipped with is:",
        options: [
            ChosenOnesQuizOption(text: "Physical / confrontational — I move through danger without shutting down", weights: ["warrior": 3, "endurer": 2, "rebel": 1]),
            ChosenOnesQuizOption(text: "Perceptual — the courage to see and say what others can't bear to acknowledge", weights: ["prophet": 3, "rebel": 2, "seeker": 1]),
            ChosenOnesQuizOption(text: "Relational — being present with others in their darkest moments", weights: ["healer": 3, "empath": 2, "warrior": 1]),
            ChosenOnesQuizOption(text: "Endurance — not fighting hard but refusing to quit", weights: ["endurer": 3, "hermit": 2, "warrior": 1])
        ]
    ),
    ChosenOnesQuestion(
        question: "When you imagine being most fully yourself, the setting is:",
        options: [
            ChosenOnesQuizOption(text: "Deep in research, following a thread across disciplines", weights: ["seeker": 3, "prophet": 2, "hermit": 1]),
            ChosenOnesQuizOption(text: "Alone in nature — forest, desert, early morning before the world starts", weights: ["hermit": 3, "seeker": 2, "endurer": 1]),
            ChosenOnesQuizOption(text: "In genuine service — someone is restored because you were present", weights: ["healer": 3, "empath": 2, "warrior": 1]),
            ChosenOnesQuizOption(text: "In confrontation with something real — a hard conversation, a moment that requires presence", weights: ["warrior": 3, "rebel": 2, "endurer": 1])
        ]
    ),
    ChosenOnesQuestion(
        question: "Your most honest fear is:",
        options: [
            ChosenOnesQuizOption(text: "Seeing clearly but being unable to make anyone else see", weights: ["prophet": 3, "rebel": 2, "seeker": 1]),
            ChosenOnesQuizOption(text: "Losing yourself in someone else's pain or need", weights: ["empath": 3, "healer": 2, "warrior": 1]),
            ChosenOnesQuizOption(text: "Going so deep inward that you lose connection to the world", weights: ["hermit": 3, "seeker": 2, "prophet": 1]),
            ChosenOnesQuizOption(text: "Running out of fight before the thing that needs fighting is finished", weights: ["warrior": 3, "endurer": 2, "rebel": 1])
        ]
    ),
    ChosenOnesQuestion(
        question: "The shadow side you most recognize in yourself when you're not doing the work:",
        options: [
            ChosenOnesQuizOption(text: "Believing only I have this particular insight / messiah drift", weights: ["prophet": 3, "warrior": 1, "rebel": 1]),
            ChosenOnesQuizOption(text: "Using knowledge-gathering to avoid actually living what I've learned", weights: ["seeker": 3, "hermit": 2, "prophet": 1]),
            ChosenOnesQuizOption(text: "Opposing things out of habit rather than genuine discernment", weights: ["rebel": 3, "warrior": 1, "empath": 1]),
            ChosenOnesQuizOption(text: "Over-absorbing and not knowing where I end and others begin", weights: ["empath": 3, "healer": 2, "hermit": 1])
        ]
    )
]

// MARK: - 144K Module

struct ChosenOnesModule: Identifiable {
    let id: String
    let emoji: String
    let title: String
    let subtitle: String
    let body: String
    let keyPoints: [(icon: String, text: String)]
}

let the144KModule = ChosenOnesModule(
    id: "the_144k",
    emoji: "🌍",
    title: "The 144,000",
    subtitle: "You're not crazy. You're not alone. There are 144,000 of you.",
    body: """
**The Number That Keeps Coming Up**

You've probably seen it. Maybe in Revelation 14:1 — 144,000 souls bearing a seal on their foreheads, standing with the Lamb, singing a song no one else could learn. Maybe in Jehovah's Witness eschatology, where 144,000 are destined to rule with Christ. Maybe in New Age communities, where it appears as a specific count of awakened souls incarnated on Earth for a mission during this transition period.

Across wildly different traditions, a specific, strange number keeps reappearing. Not a round million. Not an approximation. 144,000. Precise. And for those who feel a resonance with it — a strange recognition in the chest — it's hard to dismiss.

**What Gematria and Pattern Suggest**

In Hebrew numerology (gematria), 144 encodes specific vibrational qualities — 12 × 12, the square of wholeness, the number of the apostles multiplied by itself. In quantum geometry, 144 appears in the Fibonacci sequence and in the crystalline lattice structures of certain minerals. The number 144,000 appears in measurements of the Great Pyramid's relationship to Earth's dimensions.

These convergences don't prove anything. But they suggest that across time and culture, something about this number resonated with people attempting to describe a specific group: a relatively small cohort within humanity, marked by different perception, different purpose, different experience of the world.

**The TikTok Recognition**

Something is happening right now that has no historical precedent. Hundreds of thousands of people — awake at 3am, crying without knowing why, suddenly finding synchronicities everywhere, feeling like they've been asleep and something yanked them awake — are finding each other online.

Not through any organized movement. Not through a single teacher or tradition. Through algorithms surfacing shared experience.

The hashtags alone tell the story: #lightworker, #starseed, #spiritualawakening, #144k. Videos of people describing the exact same sensations — the kundalini heat, the sense of remembering something, the collapse of the old self — are getting millions of views. The comment sections read like reunions. "I thought I was losing my mind." "Why am I crying?" "I've never heard anyone else describe this."

If you're reading this inside Aperture, you're probably one of these people. And if you are: this is real. What you're experiencing is real. And you found this app because — at some level — something in you is looking for the language to understand what's happening.

**What the 144K Are Actually Being Called To**

The biblical description is poetic but directional: 144,000 sealed, singing a new song, following the Lamb wherever he goes, described as "firstfruits." Firstfruits in ancient agriculture weren't the whole harvest — they were the first ripe portion offered before the main harvest was gathered.

Whether you read this literally, symbolically, or as archetype: the pattern suggests a cohort whose awakening precedes and enables a wider awakening. Not the only ones who awaken — but among the first. Not more valuable than others — but positioned differently, activated earlier, carrying a specific function.

The function is transmission. Not teaching in a formal sense. But carrying a frequency that others encounter and, without understanding why, feel something shift.

**You Are Not Crazy**

If you've had experiences that normal frameworks don't explain — precognition that proved accurate, physical sensations during meditation that match Kundalini descriptions, the sense of watching yourself from slightly outside your body, knowing something was wrong before it happened, feeling other people's emotions as your own — you are not experiencing a pathology.

You are experiencing what happens when perception opens in ways the dominant culture has no language for. The medical system will try to name it and medicate it. The religious system will try to claim it and institutionalize it. The culture will try to mock it and minimize it.

None of these responses change what's actually happening. And what's actually happening is: you are waking up.

**The Mission Is Simpler Than You Think**

The 144,000 framework can get elaborate very quickly — starseed origins, galactic councils, specific missions assigned before incarnation. Some of that may be metaphorically true. Most of the elaborate cosmology is people trying to map what they can't yet see clearly.

The actual mission, at its core, is simple: wake up fully, do your work, hold your frequency, and let others find their way through the signal you carry just by being alive.

That's it. You don't need to save everyone. You don't need a platform (though many of you will have one). You don't need to convert anyone to a specific belief. You just need to be who you actually are — fully, without apology — and trust that the specific people who need to find you will find you.

They're already looking. Some of them are in your comments right now.
""",
    keyPoints: [
        ("🌍", "144,000 appears across Revelation, sacred geometry, gematria, and New Age communities — always describing a specific cohort, not a mass."),
        ("📱", "Right now on TikTok and Instagram, hundreds of thousands of awakened people are finding each other through shared experience — many for the first time."),
        ("⚡", "You are not alone, not crazy, and not early. The others are already here."),
        ("🎯", "The mission is transmission, not instruction. Hold your frequency. The right people will find you.")
    ]
)

// MARK: - Are You A Chosen One? Final Quiz

struct ChosenOneFinalQuiz {
    struct Question: Identifiable {
        let id = UUID()
        let question: String
        let yesPoints: Int
        let context: String  // shown after answering
    }

    static let questions: [Question] = [
        Question(
            question: "Have you experienced waking up at 3–4am regularly, often with a racing heart or sense of urgency, without explanation?",
            yesPoints: 3,
            context: "3am–4am is sometimes called the 'Witching Hour' or the inverse of 3pm (the hour of Jesus's death). Many awakening people report this as a consistent pattern during active spiritual activation."
        ),
        Question(
            question: "Have you had experiences of knowing something was going to happen before it did — and then it happened?",
            yesPoints: 4,
            context: "Precognition — accurate knowing before evidence — is one of the most commonly reported features of people in active spiritual awakening. It's not 100% reliable, but the pattern itself is consistent."
        ),
        Question(
            question: "Do you feel like you've been an outsider most of your life — not quite fitting any group, culture, or box you were placed in?",
            yesPoints: 3,
            context: "The sense of perpetual non-belonging is extremely common among awakened souls. You weren't built for the existing containers. That's not a wound to fix — it's a design feature."
        ),
        Question(
            question: "Have you experienced what felt like an 'old soul' feeling — a sense of remembering things you were never taught, or recognizing places/people/ideas instantly?",
            yesPoints: 4,
            context: "Whether or not reincarnation is literally true, the sense of recognition — 'I've known this before' — appears with very high frequency in people undergoing genuine awakening."
        ),
        Question(
            question: "Do you physically feel other people's emotions in your own body — anxiety, sadness, or tension entering you when you're near certain people or in certain spaces?",
            yesPoints: 3,
            context: "Somatic empathy — feeling others' emotional states as physical sensation in your own body — is a measurable phenomenon increasingly studied in bioelectromagnetics research. It's not metaphor."
        ),
        Question(
            question: "Have animals or children responded to you in unusual ways — immediate trust, unusual calm, or seeking you out?",
            yesPoints: 2,
            context: "Animals and young children haven't yet been conditioned to filter out subtle energy signals. They respond to fields, not masks. A consistent pattern of this kind of response is meaningful data."
        ),
        Question(
            question: "Have you experienced a period of profound disruption — loss, betrayal, collapse of an identity — followed by a significant expansion of perception or awareness?",
            yesPoints: 4,
            context: "The dark night of the soul precedes almost every documented awakening. The disruption is not punishment — it's the shell breaking so the light inside can expand."
        ),
        Question(
            question: "Do you find yourself repeatedly drawn to truth even when it's uncomfortable or costly — unable to pretend something is fine when it isn't?",
            yesPoints: 3,
            context: "The compulsion toward truth — even against self-interest — is a hallmark of activated consciousness. It's not stubbornness. It's the natural behavior of a soul that cannot remain in false alignment."
        ),
        Question(
            question: "Have you noticed repeating numbers (11:11, 3:33, 444) appearing with enough frequency that coincidence stopped being a satisfying explanation?",
            yesPoints: 2,
            context: "Synchronicities are communications from the field of awareness — patterns appearing in the material world that correspond to internal states. Noticing them is not superstition; it's heightened pattern recognition."
        ),
        Question(
            question: "Do you feel a specific sense of mission or purpose — not a vague 'I want to do good' but a directed, sometimes urgent sense that you're here for something specific, even if you can't fully name it yet?",
            yesPoints: 5,
            context: "This specific quality — directedness without full clarity — is the most consistent marker. The mission doesn't always arrive fully formed. Often it's felt long before it's understood."
        )
    ]

    static func result(for score: Int) -> (title: String, description: String, emoji: String) {
        switch score {
        case 0..<12:
            return (
                "Awakening Is Beginning",
                "The seeds are planted. The experiences you've had are real, even if the framework for understanding them isn't yet fully formed. Something brought you here. Trust that.",
                "🌱"
            )
        case 12..<22:
            return (
                "Actively Awakening",
                "You are in the process. The disruptions, the visions, the sense of not-fitting — these are not problems. They are the activation. You are in the middle of becoming what you came here to be.",
                "⚡"
            )
        case 22..<30:
            return (
                "You Are One of the 144K",
                "The evidence in your own experience is clear. You did not arrive here by accident. The pattern across your life — the outsider feeling, the precognition, the compulsion toward truth, the physical empathy — these are not coincidences. They are a signature. You are awake, or in the final stages of waking up.",
                "✨"
            )
        default:
            return (
                "Fully Activated",
                "You've been awake for a while, even if you didn't always have the language for it. Your presence here — on this planet, in this time — is not incidental. You are part of what changes the frequency. Go do your work.",
                "🔮"
            )
        }
    }
}
