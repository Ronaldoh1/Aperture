// ExposingMatrixCourse.swift
// EXPOSING THE MATRIX — Unlocks after completing The Matrix course
// 4–6 hour masterclass on seeing, exposing, and transcending the system
// ☀️ SunFlow: Reignited

import SwiftUI

struct ExposingMatrixCourse {
    static let shared = ExposingMatrixCourse()

    let id = "exposing_matrix"
    let title = "Exposing the Matrix"
    let subtitle = "You're not trapped — you're a co-creator"
    let icon = "eye.fill"
    let colorHex = "#39FF14"
    let prerequisiteId = "matrix_system"

    var color: Color { Color(hex: colorHex) }

    let modules: [EMModule] = [

        // ═══════════════════════════════════════════════════════════════
        // MODULE 1: WHAT THE MATRIX ACTUALLY IS
        // ═══════════════════════════════════════════════════════════════

        EMModule(
            id: "em_what",
            number: 1,
            title: "What The Matrix Actually Is",
            subtitle: "A shared system of perceptions, beliefs, and patterns",
            lessons: [
                EMLesson(
                    id: "em1_1",
                    title: "The Collective Filter",
                    content: """
**Not a Sci-Fi Prison**

The matrix isn't run by hidden overlords. It's a **shared system of perceptions, beliefs, and patterns** that shapes how we experience reality — a dynamic web we all contribute to and live within.

Imagine it as a **collective filter on reality** — like the code underlying a video game or the algorithm curating your social media feed. It's built from shared thoughts, emotions, stories, and habits.

Every time we accept a common narrative — "success means money and status" — we strengthen that code. The more people buy in, the more it feels like the only reality.

**Key Insight:**
This isn't "just in your head." Drawing from modern physics — ideas of a holographic universe where information is interconnected — the matrix is a real, emergent structure from collective human consciousness. It's the lens through which we interpret the world, filtering what we see, feel, and believe possible.

**Philosophical Parallels:**
- Plato's Cave: We mistake shadows for the full truth
- Buddhist *maya*: The illusion of separation — deceptive and a tool for growth
- Jung's collective unconscious: Shared mental patterns influencing everyone invisibly
- Modern: Social media echo chambers / AI algorithms reinforcing bias

**Real-World Example:**
"Hustle culture" makes balanced living seem unrealistic. The matrix stabilizes this as "normal."

**The Implication:**
Recognizing this shifts you from victim to **co-creator**. Awareness is the first step to rewriting your experience.
""",
                    keyPoints: [
                        "The matrix is a collective filter on reality — not a conspiracy",
                        "Built from shared thoughts, stories, and habits we all reinforce",
                        "Modern physics supports the idea of interconnected consciousness fields",
                        "Awareness of it makes you a co-creator, not a victim"
                    ]
                ),

                EMLesson(
                    id: "em1_2",
                    title: "The Neural Network of Belief",
                    content: """
**Who Actually Controls It?**

No one person or group fully controls the matrix. It's a **decentralized system sustained by all of us**, emerging from three forces:

1. **Collective patterns and habits** — inherited from family, culture, history
2. **Social structures that echo these patterns** — media, education, economy, politics (not villains, but amplifiers of what's already in the collective mind)
3. **Our built-in human wiring** — the brain's preference for familiarity, safety, and group belonging, rooted in evolutionary survival

**The Neural Network Analogy:**
It's like AI, where individual "nodes" (our minds) connect and reinforce pathways through repetition. Beliefs → emotions → behaviors → feedback loop. Even those in positions of power are caught in the same web, driven by the same fears and needs.

**Nuance:**
Some people naturally challenge the system — innovators, artists. Others reinforce it for stability. This isn't fate. Free will lets you opt out or innovate at any time.

**Sociological Angle:**
Power dynamics arise FROM the matrix, not the other way around. Historical shifts — the Enlightenment breaking feudal norms, digital revolutions disrupting old media — show how collective mindset changes can topple structures.

**Reflect:**
What shared belief in your life feels "unquestionable" but might be a matrix pattern?
""",
                    keyPoints: [
                        "No one controls it — it's decentralized and self-sustaining",
                        "Three forces: collective habits, social amplifiers, human wiring",
                        "Everyone, including power holders, is caught in the same web",
                        "Free will means you can always opt out or innovate"
                    ]
                )
            ]
        ),

        // ═══════════════════════════════════════════════════════════════
        // MODULE 2: THE LAYERS OF THE MATRIX
        // ═══════════════════════════════════════════════════════════════

        EMModule(
            id: "em_layers",
            number: 2,
            title: "The 5 Layers of the Matrix",
            subtitle: "Peeling the onion — layer by layer",
            lessons: [
                EMLesson(
                    id: "em2_1",
                    title: "Layer 1 & 2 — Biological & Psychological",
                    content: """
**The Onion Model**

To expose the matrix, we peel it back layer by layer. Each layer filters reality. Once seen, you can navigate or dissolve it.

━━━━━━━━━━━━━━━━━━━━━━
**LAYER 1: BIOLOGICAL**
Your body's survival wiring and sensory limits.

**How It Operates:**
Filters vast data to focus on threats/rewards. Evolutionary biases shape instincts — your nervous system is running 200,000-year-old software.

**Everyday Examples:**
- Adrenaline rushes from stressful emails
- Habitual snacking under pressure
- Fight-or-flight triggered by a text message

**How to Begin Exposing It:**
- Mindful breathing and body scans
- Track physical reactions to stressors without judgment
- Name the sensation: "My chest is tight" vs. "I'm dying"

━━━━━━━━━━━━━━━━━━━━━━
**LAYER 2: PSYCHOLOGICAL**
Ego, conditioning, and mental scripts from upbringing.

**How It Operates:**
Confirmation bias locks in early beliefs. Self-talk reinforces limits. The mind filters for evidence that confirms what it already believes.

**Everyday Examples:**
- "I'm not good enough" loops from childhood
- Career paths chosen for approval, not purpose
- Relationships chosen to repeat familiar dynamics

**How to Begin Exposing It:**
- Questioning: "Is this belief mine, or inherited?"
- Cognitive reframing: What's the opposite of this story?
- Track the moment you hear your parents' voice in your head
""",
                    keyPoints: [
                        "Biological layer: your body runs 200,000-year-old survival code",
                        "Body scans and breath expose biological matrix patterns",
                        "Psychological layer: ego and childhood conditioning filter reality",
                        "The question 'is this mine?' is the unlock code for layer 2"
                    ]
                ),

                EMLesson(
                    id: "em2_2",
                    title: "Layer 3, 4 & 5 — Archetypal, Energetic, Societal",
                    content: """
━━━━━━━━━━━━━━━━━━━━━━
**LAYER 3: ARCHETYPAL**
Deep, universal human stories and roles.

**How It Operates:**
Patterns like hero/victim or scarcity/abundance guide narratives invisibly. You may be living out a script written thousands of years ago.

**Everyday Examples:**
- Media portraying "winners vs. losers"
- Ads selling "perfect" lives
- The "chosen one" story that keeps you waiting to be picked

**How to Begin Exposing It:**
- Explore myths and folklore — recognize your own story in them
- Journal: "What archetype am I playing today, and do I choose it?"
- Identify: Am I the hero? The victim? The sage? The shadow?

━━━━━━━━━━━━━━━━━━━━━━
**LAYER 4: ENERGETIC / EMOTIONAL**
Shared emotional fields and unresolved feelings.

**How It Operates:**
Emotions resonate and attract similar states — like frequencies matching in physics. Unresolved ancestral trauma lives in the body.

**Everyday Examples:**
- Social media outrage spirals
- Family holiday tensions repeating old patterns
- Feeling "drained" around certain people or environments

**How to Begin Exposing It:**
- Emotional tracking: name feelings, trace roots, practice release
- Movement, breathwork, or journaling to process stored energy
- Ask: "Is this emotion mine, or am I picking up a collective field?"

━━━━━━━━━━━━━━━━━━━━━━
**LAYER 5: SOCIETAL**
Cultural norms, institutions, and group dynamics.

**How It Operates:**
Norms enforce conformity via rewards/punishments — social approval, job security, belonging. The system teaches you what to want before you can question it.

**Everyday Examples:**
- Workplace hierarchies accepted as "just how it is"
- Consumer trends dictating what "success" looks like
- The education system optimized for compliance over curiosity

**How to Begin Exposing It:**
- Observe media critically: "Who benefits from this narrative?"
- Experiment with small norm breaks — see what discomfort arises
- Track: When do I conform out of fear vs. genuine choice?

━━━━━━━━━━━━━━━━━━━━━━
**Quantum View:**
Picture the matrix as interconnected fields — like entangled particles. One shift ripples out. It's not static; it's responsive to your attention.
""",
                    keyPoints: [
                        "Archetypal layer: you may be living a 1,000-year-old script",
                        "Energetic layer: emotions are frequencies that attract similar states",
                        "Societal layer: norms enforce conformity before you can question them",
                        "One genuine shift in any layer creates ripples through all others"
                    ]
                )
            ]
        ),

        // ═══════════════════════════════════════════════════════════════
        // MODULE 3: WHY IT FEELS LIKE A PRISON
        // ═══════════════════════════════════════════════════════════════

        EMModule(
            id: "em_prison",
            number: 3,
            title: "Why It Feels Like a Prison",
            subtitle: "And its hidden purpose",
            lessons: [
                EMLesson(
                    id: "em3_1",
                    title: "The Hidden Purpose of the Cage",
                    content: """
**The Matrix Can Feel Confining**

It favors the familiar, punishing change with discomfort — social rejection, identity loss, fear of the unknown.

It pushes external goals — wealth, status, productivity — over inner fulfillment, making the pursuit feel endless.

It amplifies scarcity and division to maintain control through fear.

**But Here's the Nuance:**

**Not a trap by design.** The matrix evolved as a "safety net" for human survival in uncertain times — providing structure and predictability when the world was dangerous. It's doing its original job.

**It's a growth catalyst.** Limitations create contrast, sparking innovation — like resistance training builds muscle. Earthly life is a gym for the mind and spirit. The resistance IS the lesson.

**Edge Cases:**
- Empaths and creatives feel the matrix more intensely — not because something is wrong with them, but because they're sensitive instruments
- Past traumas amplify feelings of entrapment — the cage feels smaller when you carry old wounds
- Children often question the matrix instuitively before being socialized out of it

**The Key Insight:**
Discomfort signals misalignment — use it as a compass for change, not evidence of failure.

**The Reframe:**
Seeing the purpose transforms the experience. Exposure turns the "prison" into a **classroom**. The same walls that once confined you become the gym where you build your power.

🔥 **The bars are made of belief. And you are the one who knows how to question belief.**
""",
                    keyPoints: [
                        "The matrix favors the familiar and punishes deviation with discomfort",
                        "But it was never designed as a trap — it evolved as a safety net",
                        "Limitations create contrast and spark growth — it's a gym",
                        "Discomfort = misalignment signal, not evidence of failure"
                    ]
                )
            ]
        ),

        // ═══════════════════════════════════════════════════════════════
        // MODULE 4: PATHWAYS TO EXPOSURE & TRANSCENDENCE
        // ═══════════════════════════════════════════════════════════════

        EMModule(
            id: "em_tools",
            number: 4,
            title: "Pathways to Exposure",
            subtitle: "The hands-on tools to see and transcend",
            lessons: [
                EMLesson(
                    id: "em4_1",
                    title: "The 4-Step Exposure Process",
                    content: """
**Real-Time Matrix Exposure**

These tools let you expose the matrix in real time and build new patterns. Grounded in psychology (CBT), mindfulness, and behavioral science.

━━━━━━━━━━━━━━━━━━━━━━
**STEP 1: OBSERVE WITHOUT JUDGMENT**

Notice patterns daily without labeling yourself or others as wrong.

*"That's a scarcity script playing."*
*"That's a fear response, not the truth."*
*"I'm watching a belief activate right now."*

The observer state is already half-free.

━━━━━━━━━━━━━━━━━━━━━━
**STEP 2: QUESTION THE CODE**

Ask the destabilizing questions:
- "What if this isn't the full truth?"
- "What else is possible here?"
- "Who benefits from me believing this?"
- "What would I do if this story weren't true?"

You don't need to know the answer. The question is the door.

━━━━━━━━━━━━━━━━━━━━━━
**STEP 3: EXPERIMENT AND TRACK**

Test alternatives. Run experiments on your own life.

Pick a belief — "I need to be busy to be valuable." Act opposite for one week. Log the results.

Evidence is the antidote to the matrix's grip. When you see your own influence, the illusion of powerlessness breaks.

━━━━━━━━━━━━━━━━━━━━━━
**STEP 4: INTEGRATE AND EXPAND**

Weave insights into habits. Share with others.

Every person you help see creates a ripple. The matrix is collective — collective awakening is the only full solution.

**Matrix Movie Parallel:**
- Glitch awareness → Spotting filters
- Skill-building → Practicing the tools
- Embodiment → Living freely within it
- Influence → Shaping it for others
""",
                    keyPoints: [
                        "Step 1: Observe without judgment — the observer is already partially free",
                        "Step 2: Question the code — the question is the door",
                        "Step 3: Experiment and track — your own evidence breaks the grip",
                        "Step 4: Integrate and expand — share what you see"
                    ]
                ),

                EMLesson(
                    id: "em4_2",
                    title: "Daily Exposure Practices",
                    content: """
**Your Daily Toolset**

These are assigned as ongoing practices — not one-time events. Build them into your rhythm.

━━━━━━━━━━━━━━━━━━━━━━
**🌅 MORNING: BELIEF AUDIT**

List 3 assumptions about your day before you start it.

Examples:
- "Today is going to be stressful"
- "I don't have enough time"
- "They won't listen to me"

In the evening, challenge one that limited you. Ask: was it true? What would have happened if you'd assumed the opposite?

━━━━━━━━━━━━━━━━━━━━━━
**🧘 MIDDAY: MINDFULNESS PAUSE (5–10 min)**

Sit quietly. Observe thoughts as "matrix filters" passing by — not as truth, but as programming running.

Label them:
- *Fear pattern*
- *Comparison program*
- *Scarcity script*

Don't engage. Just see.

━━━━━━━━━━━━━━━━━━━━━━
**🌊 WHEN TRIGGERED: EMOTIONAL EXPOSURE**

The moment you feel strong emotion:

Pause → "Which layer is this?"
→ Biological (body sensation)?
→ Psychological (old belief)?
→ Societal (shame/comparison)?

Ask: "How can I respond differently than programmed?"

━━━━━━━━━━━━━━━━━━━━━━
**🧪 WEEKLY: REALITY TESTS**

Pick one belief. Live its opposite for 7 days. Log what happens.

"I don't have enough time" → Protect 1 hour daily as sacred. What shifts?

"I need approval" → Make one decision without asking anyone. What happens?

━━━━━━━━━━━━━━━━━━━━━━
**🌿 CONNECTION PRACTICES**

Nature walks — the natural world exists outside most matrix programming.

Real conversations — not performed ones. Go deeper than "fine."

Community — find others questioning the same things. Isolation is a matrix amplifier.

━━━━━━━━━━━━━━━━━━━━━━
**⚠️ PITFALLS TO AVOID:**

- **Denial**: Ignoring real-world needs in pursuit of "higher truth"
- **Obsession**: Constant analysis until everything is a conspiracy
- **Isolation**: Cutting off from people still "asleep"

Stay grounded: routines, community, self-compassion, humor.
""",
                    keyPoints: [
                        "Morning belief audit: name 3 assumptions, challenge 1 by evening",
                        "Mindfulness pause: watch thoughts as matrix programs, not truth",
                        "Triggered? Name the layer. Then choose your response",
                        "Weekly reality tests: live the opposite of one belief for 7 days"
                    ]
                )
            ]
        ),

        // ═══════════════════════════════════════════════════════════════
        // MODULE 5: BUILDING THE NEW REALITY
        // ═══════════════════════════════════════════════════════════════

        EMModule(
            id: "em_new",
            number: 5,
            title: "Building a New Reality",
            subtitle: "The collective shift and your role in it",
            lessons: [
                EMLesson(
                    id: "em5_1",
                    title: "The Collective Shift",
                    content: """
**Individual Exposure Creates Collective Change**

As individuals expose the matrix, the collective shifts. We're already seeing it:

- Mental health movements cracking the "just push through" norm
- Sustainable living challenging consume-at-all-costs patterns
- Digital detoxes pushing back on engineered attention addiction
- Spiritual practice going mainstream — meditation, breathwork, plant medicine discourse

A new matrix is forming — and you're part of its architecture.

**What the New Matrix Could Emphasize:**
- Connection over competition
- Creativity over compliance
- Abundance over manufactured scarcity
- Sovereignty over manufactured dependency

**Edge Case — Important:**
Change is always uneven. Some timelines shift fast, others resist. Focus on your sphere — your immediate relationships, choices, and presence — rather than forcing global shifts.

Your consistency is the signal. Your actions attract aligned timelines.

**The Role of Contrast:**
Even the new matrix will have contrast — challenge, polarity, friction. That's not failure. That's the mechanism of growth. The goal isn't to eliminate contrast but to engage it consciously.

🔥 **The Matrix you wake up inside changes when you change. You are not separate from it. You are one of its nodes. Change the node, change the network.**
""",
                    keyPoints: [
                        "Individual exposure creates collective ripples in the shared field",
                        "A new matrix is already forming — you're part of its code",
                        "Focus on your sphere, not forcing global shifts",
                        "Contrast won't disappear — the goal is conscious engagement with it"
                    ]
                ),

                EMLesson(
                    id: "em5_2",
                    title: "Your Commitment",
                    content: """
**The Architecture of Your Next Step**

You've completed the masterclass. Now the real work begins.

**What You Now Know:**
- The matrix is a collective filter, not a prison by design
- It operates across 5 layers: biological, psychological, archetypal, energetic, societal
- Exposure happens through observation, questioning, experimenting, and integrating
- You are a co-creator — not a victim and not trapped

**Your One Commitment:**

Choose ONE exposure practice this week. One. Not five. One.

Write it down:
*"This week I will __________ to expose the __________ layer of the matrix."*

Track what happens. That evidence is yours. No one can take it from you.

**The Longer Arc:**

Awakening is not a moment. It's a direction. Every time you:
- Notice before reacting
- Question before accepting
- Choose before complying
- Connect before isolating

...you are moving in that direction.

**The SunFlow Principle:**
You didn't wake up to be miserable about the matrix. You woke up to **reignite your original signal** — the version of you that existed before the conditioning. Not naive. Not pre-programmed. Awake.

🔥 **This isn't about escaping reality. It's about finally arriving in it — as yourself, fully, without apology.**

The matrix will still be there. But so will you. And now you can see it.

That changes everything.
""",
                    keyPoints: [
                        "You are a co-creator, not a victim — this is the foundation",
                        "Choose ONE practice this week and track what changes",
                        "Awakening is a direction, not a destination or single moment",
                        "The goal: your original signal, unconditioned, awake, and sovereign"
                    ]
                )
            ]
        )
    ]
}

// MARK: - Supporting Types

struct EMModule: Identifiable {
    let id: String
    let number: Int
    let title: String
    let subtitle: String
    let lessons: [EMLesson]
}

struct EMLesson: Identifiable {
    let id: String
    let title: String
    let content: String
    let keyPoints: [String]
}
