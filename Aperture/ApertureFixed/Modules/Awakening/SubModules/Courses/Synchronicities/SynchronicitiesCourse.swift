// SynchronicitiesCourse.swift
// SYNCHRONICITIES - The Universe Speaking in Symbols
// An interactive course on meaningful coincidences
// Based on Carl Jung's research and pattern recognition principles

import Foundation
import SwiftUI

// MARK: - Synchronicity Course

struct SynchronicitiesCourse {
    static let shared = SynchronicitiesCourse()
    
    let id = "synchronicities"
    let title = "Synchronicities"
    let subtitle = "The Universe Speaking in Symbols"
    let icon = "link.circle.fill"
    let colorHex = "#9C27B0"
    let totalMinutes = 120
    
    var color: Color { Color(hex: colorHex) }
    
    // MARK: - Modules
    
    let modules: [SyncModule] = [
        
        // ═══════════════════════════════════════════════════════════════
        // MODULE 1: WHAT ARE SYNCHRONICITIES?
        // ═══════════════════════════════════════════════════════════════
        
        SyncModule(
            id: "sync_1",
            number: 1,
            title: "What Are Synchronicities?",
            subtitle: "Beyond coincidence",
            lessons: [
                SyncLesson(
                    id: "s1_1",
                    title: "The Definition",
                    content: """
**SYNCHRONICITY** (term coined by Carl Jung, 1952):

Meaningful coincidences that feel too precise to be random.

Not just "coincidence" — these are events that:
• Connect without causation (A doesn't cause B)
• Carry personal significance
• Feel like a message or confirmation
• Repeat in patterns

**Jung's Definition:**
"The simultaneous occurrence of a certain psychic state with one or more external events which appear as meaningful parallels to the momentary subjective state."

Translation: Your inner state and outer reality align in ways that feel designed.

**The Key Distinction:**

COINCIDENCE = Random chance, no meaning
Example: You flip a coin, get heads 5 times

SYNCHRONICITY = Meaningful pattern, personal significance
Example: You're thinking about calling your mom, she calls you. You decide to change careers, three unrelated people mention the exact job you were considering.

**Why This Matters:**

If synchronicities are real, then:
• Consciousness and reality interact
• The universe "responds" to awareness
• You're getting guidance you can learn to read

If they're just coincidence:
• You're pattern-matching randomly
• Confirmation bias creates false meaning

The awakened position: Test both hypotheses. Track patterns. See what emerges.
""",
                    example: SyncExample(
                        title: "Classic Synchronicity",
                        description: "You think of someone you haven't talked to in years. Within hours, they call or text. No logical reason they would reach out at that exact moment."
                    )
                ),
                
                SyncLesson(
                    id: "s1_2",
                    title: "Jung's Golden Scarab",
                    content: """
**THE FAMOUS CASE**

Carl Jung was treating a patient who was highly rational, resistant to anything that couldn't be logically explained. She was describing a dream about being given a golden scarab beetle.

At that exact moment, Jung heard a tapping at the window. He opened it and caught a scarabaeid beetle — the closest equivalent to the Egyptian scarab in Switzerland.

He handed her the beetle and said: "Here is your scarab."

The experience cracked open her rigid rationality. Her treatment progressed rapidly after this.

**WHY IT MATTERS:**

Jung didn't cause the beetle to appear. The patient didn't summon it. Yet it arrived at the precise moment they were discussing it.

The scarab in Egyptian mythology represents rebirth and transformation — exactly what the patient needed psychologically.

**THE PATTERN:**
1. Inner state (discussing transformation)
2. Outer event (beetle appears)
3. Meaningful connection (scarab = rebirth)
4. Timing too precise to dismiss

This is the synchronicity signature.

**Skeptic Response:** "Beetles exist. One happened to arrive. You're assigning meaning to randomness."

**Jung's Response:** "The meaning is the point. Whether 'caused' or not, the patient's psyche received exactly what it needed at exactly the right moment. That's clinically useful, regardless of mechanism."

**The Engineering Perspective:**
Don't argue mechanism. Track outcomes. If attending to synchronicities improves decision-making, navigation, and wellbeing — use the pattern.
""",
                    example: SyncExample(
                        title: "Jung's Scarab Moment",
                        description: "A beetle appears at the exact moment patient describes dreaming of a scarab, breaking her resistance to non-rational experience."
                    )
                ),
                
                SyncLesson(
                    id: "s1_3",
                    title: "The Science (And Limits)",
                    content: """
**WHAT SCIENCE SAYS:**

1. **Confirmation Bias** (skeptic view)
   We remember hits, forget misses. You think of someone 100 times, they call once — you remember only the hit.
   
   Valid concern. This is why tracking matters.

2. **Pattern Recognition** (neutral view)
   Humans evolved to detect patterns — it's survival. Sometimes we find patterns that aren't there (pareidolia).
   
   Also valid. Discernment is essential.

3. **Quantum Entanglement** (speculative)
   Particles can be correlated across space without causal connection. Could consciousness work similarly?
   
   Unproven but intriguing. The universe demonstrably has non-local correlations.

4. **Jung's Collective Unconscious** (psychological)
   Shared archetypal patterns connect all minds. Synchronicities arise when individual consciousness touches collective patterns.
   
   Not testable scientifically, but experientially meaningful.

**THE HONEST POSITION:**

We don't know the mechanism. We can observe the phenomenon.

If synchronicities help you:
• Make better decisions
• Feel connected to something larger
• Navigate uncertainty with more confidence
• Receive timely information

Then the mechanism matters less than the utility.

**WARNING:**
Psychosis = seeing patterns that aren't there
Awakening = seeing patterns that ARE there but were previously invisible

Discernment required. Don't force meaning. Don't dismiss genuine patterns.

Group validation helps (shared pattern recognition prevents solo delusion).
""",
                    example: SyncExample(
                        title: "The Balance",
                        description: "Track your synchronicities for 30 days. Note the hits AND misses. Let the data show you whether patterns are real."
                    )
                )
            ]
        ),
        
        // ═══════════════════════════════════════════════════════════════
        // MODULE 2: TYPES OF SYNCHRONICITIES
        // ═══════════════════════════════════════════════════════════════
        
        SyncModule(
            id: "sync_2",
            number: 2,
            title: "Types of Synchronicities",
            subtitle: "Recognizing the patterns",
            lessons: [
                SyncLesson(
                    id: "s2_1",
                    title: "Thought-Event Synchronicities",
                    content: """
**THE PATTERN:**
You think of something → It appears in reality

**EXAMPLES:**

📱 **Communication Sync**
You think of someone you haven't talked to in months.
Within hours (sometimes minutes), they contact you.
No special occasion. No logical reason.

📚 **Information Sync**
You're pondering a specific question.
You "randomly" open a book, website, or turn on a video — and it addresses your exact question.

🎵 **Song Sync**
A song pops into your head.
You turn on the radio — that exact song is playing.
Or someone starts humming it nearby.

**HOW TO WORK WITH THIS:**

1. Notice the thought (be present enough to catch it)
2. Note the time
3. Track when the external event occurs
4. Assess: How specific was the match?

**COMMON MISTAKE:**
Forcing it. "I'll think about winning the lottery constantly, then I'll win!"

Synchronicities aren't magic manifestation tools. They're information signals. You receive them — you don't manufacture them.

**DISCERNMENT:**
If you think about someone constantly, eventually they might contact you. That's not synchronicity — that's statistics.

Synchronicity = LOW base rate + HIGH specificity + MEANINGFUL timing
""",
                    example: SyncExample(
                        title: "The Phone Call",
                        description: "You haven't thought about your college roommate in 2 years. Suddenly they cross your mind vividly. Your phone rings within the hour — it's them."
                    )
                ),
                
                SyncLesson(
                    id: "s2_2",
                    title: "Number Synchronicities",
                    content: """
**REPEATING NUMBERS**

Many people report seeing specific number sequences repeatedly:
• 11:11 on clocks
• 222, 333, 444
• Their birthday numbers
• Significant dates

**WHAT'S HAPPENING:**

Option 1: **Selective Attention**
You've primed yourself to notice these numbers. You see the clock 100 times a day, remember only when it's 11:11.

Option 2: **Genuine Pattern**
Your attention is being drawn to these moments for a reason. The numbers are markers for awareness states.

Option 3: **Both**
Selective attention is the mechanism; the REASON you're primed for these numbers is meaningful.

**WORKING WITH NUMBER SYNC:**

Don't get superstitious. "11:11 means angels are watching!" Maybe. Or maybe:

• 11:11 = Wake up call. "Pay attention NOW."
• Repeating numbers = Pattern recognition activating
• Your specific numbers = Personal significance to decode

**PRACTICAL APPROACH:**

When you see repeating numbers:
1. Pause
2. Note what you were thinking/feeling
3. Note what you were doing
4. Track patterns over time

After 30 days, review:
• What state were you in when numbers appeared?
• Any consistent themes?
• Did the numbers correlate with important decisions or moments?

**THE UTILITY:**
Even if it's "just" selective attention, the PAUSE creates mindfulness. You're using the pattern to become more present. That's valuable regardless of metaphysics.
""",
                    example: SyncExample(
                        title: "11:11 Pattern",
                        description: "For a week, you keep seeing 11:11 on clocks, receipts ($11.11), addresses. Each time you pause and notice you were thinking about a major life decision."
                    )
                ),
                
                SyncLesson(
                    id: "s2_3",
                    title: "Theme Synchronicities",
                    content: """
**THE PATTERN:**
The same theme appears across multiple unrelated sources

**EXAMPLE:**

Monday: You read an article about courage
Tuesday: A friend randomly shares a quote about courage
Wednesday: A movie you watch has courage as central theme
Thursday: Your boss mentions needing courage for a new project

Four unrelated sources. One theme. Within a week.

**WHAT IT MIGHT MEAN:**

The universe (or your unconscious, or collective patterns) is highlighting something you need to pay attention to.

In this example: Maybe you need courage for something. Maybe a decision is coming that requires it.

**HOW TO WORK WITH THEME SYNC:**

1. **Track themes** — Keep a simple log: Date + Theme + Source
2. **Notice clustering** — When does one theme dominate?
3. **Ask why** — What in your life relates to this theme?
4. **Act accordingly** — If "courage" keeps appearing, where do you need courage?

**ADVANCED PATTERN:**

Sometimes themes precede events.

You keep seeing references to "endings" all week.
Friday: A relationship ends. Or a job. Or a chapter.

The theme sync was preparation — your psyche was being readied.

**CAUTION:**
Don't become paranoid. Not every theme is a premonition. Most are simply:
• Your current focus reflected back
• Random clustering (statistics allows for this)
• Confirmation of direction you're already heading

The value is in the AWARENESS it creates, not prediction.
""",
                    example: SyncExample(
                        title: "The Water Theme",
                        description: "In one week: dream about ocean, coworker mentions learning to swim, water main breaks on your street, friend invites you kayaking. Later you realize you've been suppressing emotions (water = feelings)."
                    )
                ),
                
                SyncLesson(
                    id: "s2_4",
                    title: "Guidance Synchronicities",
                    content: """
**THE PATTERN:**
You face a decision → The universe sends confirmation or redirection

**EXAMPLE:**

You're considering two job offers.

Leaning toward Company A, you see their logo three times in one day — on a truck, a stranger's laptop, a TV commercial. "Sign!" you think.

But then you meet someone at a coffee shop who worked there and shares a warning.

**THE COMPLEXITY:**
Synchronicities aren't always "green light, go!" Sometimes they're "look closer" or "here's information you need."

**HOW TO REQUEST GUIDANCE:**

This is where synchronicity becomes interactive:

1. **Ask clearly** — "If this is the right path, show me [specific sign]"
2. **Be open to the answer** — It might not be what you want
3. **Set a timeframe** — "Within 48 hours" (prevents indefinite waiting)
4. **Don't force** — If the sign doesn't come, that's also information

**IMPORTANT:**
Don't outsource decisions to synchronicity. You still have to choose. The synchronicities provide additional information, not absolution of responsibility.

**EXAMPLE PROTOCOL:**

"I'm considering moving to Austin. If this is aligned, show me a yellow butterfly within 48 hours."

• Yellow butterfly appears → Additional data point toward yes
• No butterfly → Neutral (maybe ask a different way, or trust your reasoning)
• Something warns you about Austin → That's also a sign, even if not a butterfly

**THE MATURE APPROACH:**
Synchronicities inform. You decide. Take responsibility for outcomes regardless of what signs appeared.
""",
                    example: SyncExample(
                        title: "The Door Test",
                        description: "Stuck between two options, you ask for a sign. Within a day, one path gets blocked (literal closed door, canceled meeting). The other path opens unexpectedly. Message received."
                    )
                )
            ]
        ),
        
        // ═══════════════════════════════════════════════════════════════
        // MODULE 3: WORKING WITH SYNCHRONICITIES
        // ═══════════════════════════════════════════════════════════════
        
        SyncModule(
            id: "sync_3",
            number: 3,
            title: "Working With Synchronicities",
            subtitle: "Practical protocols",
            lessons: [
                SyncLesson(
                    id: "s3_1",
                    title: "The Synchronicity Journal",
                    content: """
**THE PRACTICE:**

Keep a dedicated log of synchronicities. This is the single most powerful tool for developing this skill.

**WHAT TO TRACK:**

📅 Date & Time
📍 Location
🧠 Your mental/emotional state
🎯 The synchronicity (what happened)
💡 Possible meaning
🔗 Related theme (if any)

**EXAMPLE ENTRY:**

Date: Feb 12, 2026
Time: 3:33 PM
Location: Coffee shop
State: Anxious about career decision
Event: Stranger at next table was discussing the exact career path I'm considering. Used the same unusual phrase I'd used in my journal that morning.
Possible meaning: Confirmation I'm on the right track? Or just pay attention to this decision?
Theme: Career/life direction

**WHY JOURNALING WORKS:**

1. **Creates awareness** — You notice more when you track
2. **Reveals patterns** — After 30 days, themes emerge
3. **Tests the phenomenon** — You can see hit/miss ratio
4. **Builds discernment** — You learn what's genuine vs. forced
5. **Creates a dialogue** — You're signaling you're paying attention

**PRO TIP:**
Don't only log synchronicities. Log when you EXPECTED one and it didn't come. This prevents confirmation bias and gives you honest data.
""",
                    example: SyncExample(
                        title: "30-Day Challenge",
                        description: "Keep a synchronicity journal for 30 days. At the end, review: What themes dominated? What was your hit rate? Did tracking change your experience?"
                    )
                ),
                
                SyncLesson(
                    id: "s3_2",
                    title: "Increasing Synchronicity Frequency",
                    content: """
**CAN YOU HAVE MORE SYNCHRONICITIES?**

People who report frequent synchronicities share common traits:
• High present-moment awareness
• Openness to experience
• Pattern recognition skills
• Less rigid thinking
• Connection to intuition

**PRACTICES THAT SEEM TO INCREASE SYNC:**

1. **Meditation** — Quiets mental noise, increases receptivity
2. **Nature immersion** — Disconnects from artificial rhythms
3. **Creative flow states** — Art, music, writing
4. **Reduced screen time** — Less algorithmic curation of reality
5. **Asking questions** — Priming your pattern recognition

**THE PARADOX:**

Trying too hard to have synchronicities often blocks them.

It's like trying to fall asleep — effort prevents the state.

The best approach:
• Intend to notice (set the intention)
• Then release and live normally
• Stay present and curious
• Trust what comes

**WHAT DOESN'T WORK:**

• Forcing meaning onto random events
• Seeing "signs" in everything (that's anxiety, not synchronicity)
• Manufacturing synchronicities through manipulation
• Using synchronicities to avoid making decisions

**THE SWEET SPOT:**

Open but discerning.
Receptive but grounded.
Tracking but not obsessing.
Trusting but verifying.
""",
                    example: SyncExample(
                        title: "The Awareness Experiment",
                        description: "Spend one week in high awareness mode: meditate daily, reduce phone use, spend time in nature. Track whether synchronicity frequency changes."
                    )
                ),
                
                SyncLesson(
                    id: "s3_3",
                    title: "Acting on Synchronicities",
                    content: """
**THE BIG QUESTION:**

When synchronicities point somewhere, do you follow?

**THE SPECTRUM:**

🔴 **Never act** — Dismiss all synchronicities as coincidence
→ You might miss genuine guidance

🟡 **Always act** — Follow every synchronicity blindly
→ You might be chasing noise

🟢 **Discerned action** — Use synchronicities as one input among many
→ The balanced path

**DECISION FRAMEWORK:**

When a synchronicity seems to point somewhere, ask:

1. **Does this align with my values?**
   Synchronicities shouldn't override your ethics.

2. **Does this align with my intuition?**
   Synchronicity + gut feeling = stronger signal

3. **What are the stakes?**
   Low-risk action? Try it.
   High-risk action? Need more confirmation.

4. **Is this the only input?**
   Don't make life-changing decisions on synchronicity alone. Use it alongside reason, advice, research.

**THE TEST:**

Follow a small synchronicity. See what happens.
Build trust incrementally through small experiments before betting big.

**EXAMPLE:**

Synchronicity suggests you should reach out to someone.
Low risk. Try it. See what unfolds.

vs.

Synchronicity suggests you should quit your job.
High risk. This needs more than one sign. Use it as a prompt to investigate, not as a decision.

**THE MATURE POSITION:**

Synchronicities are information, not commands.
You receive them. You interpret them. You decide.
Take responsibility for your choices regardless.
""",
                    example: SyncExample(
                        title: "The Follow-Through",
                        description: "A synchronicity suggests you contact an old mentor. You do. They mention a job opening that changes your career. Following the small sign led to something big."
                    )
                )
            ]
        ),
        
        // ═══════════════════════════════════════════════════════════════
        // MODULE 4: THE DEEPER MEANING
        // ═══════════════════════════════════════════════════════════════
        
        SyncModule(
            id: "sync_4",
            number: 4,
            title: "The Deeper Meaning",
            subtitle: "What synchronicities reveal about reality",
            lessons: [
                SyncLesson(
                    id: "s4_1",
                    title: "Consciousness and Reality",
                    content: """
**IF SYNCHRONICITIES ARE REAL...**

What does that imply about the nature of reality?

**POSSIBILITY 1: Interconnected Consciousness**

All minds are connected at a deeper level (Jung's collective unconscious, eastern concepts of universal mind).

Synchronicities are moments when that connection surfaces.

Your thought and the external event aren't causally connected — they're both expressions of a deeper pattern.

**POSSIBILITY 2: Responsive Universe**

Reality isn't dead matter. It's alive, aware, responsive.

When you hold a clear intention or question, reality "responds" with relevant information.

This is the basis of many spiritual traditions: Prayer, manifestation, "the universe provides."

**POSSIBILITY 3: Simulation Hypothesis**

If we're in a simulation, synchronicities could be:
• Bugs in the code
• Intentional guidance systems
• NPCs responding to player state
• Lazy rendering (similar events cluster to save processing)

**POSSIBILITY 4: Probability Mathematics**

In a complex universe with billions of events, some meaningful-looking patterns are statistically inevitable.

Synchronicities are real patterns that we mistakenly assign supernatural cause.

**THE HONEST ANSWER:**

We don't know which (if any) is true.

What we can say: The phenomenon exists (people report it consistently across cultures and eras). The mechanism is unknown. The utility is demonstrable.

Use synchronicities pragmatically while holding metaphysics lightly.
""",
                    example: SyncExample(
                        title: "The Meta-Synchronicity",
                        description: "While studying synchronicities, you experience an unusual cluster of them — as if the universe is demonstrating the concept. This is commonly reported."
                    )
                ),
                
                SyncLesson(
                    id: "s4_2",
                    title: "Synchronicity and Awakening",
                    content: """
**THE RELATIONSHIP:**

Many people report that synchronicities increase dramatically during spiritual awakening.

Why might this be?

**THEORY 1: Increased Attention**

Awakening increases present-moment awareness.
You notice more because you're paying more attention.
Synchronicities were always there; you see them now.

**THEORY 2: Shifted Consciousness**

Awakening changes your relationship with reality.
As you recognize interconnection, you experience more evidence of it.
Like tuning into a radio station that was always broadcasting.

**THEORY 3: Support System**

The universe/source/higher self sends more guidance during transformation.
Synchronicities are like breadcrumbs on the path.
More intense awakening = more frequent guidance.

**THE PRACTICAL TAKEAWAY:**

If you're experiencing lots of synchronicities:
• You might be awakening
• Pay attention to the guidance
• Don't get lost in sign-chasing
• Keep one foot on the ground

If synchronicities decrease:
• Not necessarily regression
• Sometimes silence means you don't need external confirmation
• You've internalized the guidance
• Or you need to slow down and get present again

**WARNING:**
Mania and psychosis can also produce a sense of extreme synchronicity (everything feels connected and meaningful).

Discernment: Genuine synchronicities are specific and relatively rare.
Psychotic pattern-matching is constant and overwhelming.

If EVERYTHING feels like a sign, slow down. Ground. Talk to someone.
""",
                    example: SyncExample(
                        title: "The Awakening Surge",
                        description: "During a period of intense spiritual growth, synchronicities become almost daily. Books fall open to relevant pages. Conversations answer questions you were holding. It feels like the universe is teaching directly."
                    )
                ),
                
                SyncLesson(
                    id: "s4_3",
                    title: "Living Synchronistically",
                    content: """
**THE INTEGRATED LIFE:**

The goal isn't to become obsessed with synchronicities.

It's to live with an open, curious, responsive awareness — where synchronicities are a natural part of navigating reality.

**WHAT THIS LOOKS LIKE:**

• You hold questions lightly and notice when answers appear
• You make decisions using reason AND intuition AND synchronicity
• You trust the flow while taking responsibility
• You're surprised by meaningful coincidences but not shocked
• You use signs as data, not commands

**THE DAILY PRACTICE:**

Morning: Set a simple intention for awareness
"I'm open to receiving what I need to see today."

Throughout day: Notice without grasping
When something meaningful occurs, acknowledge it.
Don't force interpretation.

Evening: Brief reflection
"What stood out today? Any patterns?"

**THE LONG GAME:**

Over months and years of this practice:
• Your pattern recognition sharpens
• You develop genuine discernment
• Decision-making becomes more fluid
• You feel less alone in the universe
• Life becomes more dialogical (call and response)

**THE PARADOX OF MASTERY:**

The more skilled you become at reading synchronicities, the less you need them.

You start trusting your own knowing.
External confirmation becomes less necessary.
You've internalized the connection.

This is the goal: Not dependence on signs, but integration with the flow of reality itself.

**FINAL WORD:**

Synchronicities are training wheels for cosmic consciousness.

Eventually you ride without them — but you're grateful they helped you learn.
""",
                    example: SyncExample(
                        title: "The Integrated Life",
                        description: "Years of practice later, synchronicities are natural. You notice them, smile, adjust course. No obsession. No doubt. Just a continuous conversation with reality."
                    )
                )
            ]
        )
    ]
}

// MARK: - Supporting Types

struct SyncModule: Identifiable {
    let id: String
    let number: Int
    let title: String
    let subtitle: String
    let lessons: [SyncLesson]
}

struct SyncLesson: Identifiable {
    let id: String
    let title: String
    let content: String
    let example: SyncExample
}

struct SyncExample: Identifiable {
    var id: String { title }
    let title: String
    let description: String
}

// MARK: - Synchronicity Tracker (Gamified Journal)

struct SynchronicityEntry: Identifiable, Codable {
    let id: UUID
    let date: Date
    let type: SyncType
    let description: String
    let emotionalState: String
    let possibleMeaning: String
    let theme: String?
    let significance: Int // 1-5 rating
    
    enum SyncType: String, Codable, CaseIterable {
        case thoughtEvent = "Thought → Event"
        case numbers = "Number Pattern"
        case theme = "Theme Cluster"
        case guidance = "Guidance Signal"
        case communication = "Communication Sync"
        case other = "Other"
        
        var icon: String {
            switch self {
            case .thoughtEvent: return "brain.head.profile"
            case .numbers: return "number.circle"
            case .theme: return "text.alignleft"
            case .guidance: return "signpost.right"
            case .communication: return "bubble.left.and.bubble.right"
            case .other: return "sparkles"
            }
        }
    }
}

// MARK: - Synchronicity Game - Pattern Detector

struct SyncPatternGame {
    
    static let title = "Pattern Detector"
    static let subtitle = "Can you spot the synchronicities?"
    
    struct Scenario: Identifiable {
        let id = UUID()
        let description: String
        let options: [String]
        let correctIndex: Int
        let explanation: String
        let difficulty: Difficulty
        
        enum Difficulty: String {
            case easy = "Beginner"
            case medium = "Intermediate"
            case hard = "Advanced"
        }
    }
    
    static let scenarios: [Scenario] = [
        Scenario(
            description: "You've been thinking about your grandmother who passed away 5 years ago. While walking, you smell her exact perfume from a stranger passing by. This is:",
            options: [
                "Just a coincidence - many people wear that perfume",
                "A possible synchronicity - meaningful timing with your thoughts",
                "Definitely a message from the afterlife",
                "Your mind playing tricks on you"
            ],
            correctIndex: 1,
            explanation: "This has the synchronicity signature: inner state (thinking of grandmother) + outer event (her perfume) + meaningful timing. We don't need to claim it's 'definitely' a message, but it's worth noting as a possible synchronicity.",
            difficulty: .easy
        ),
        
        Scenario(
            description: "You see 11:11 on your phone. Then your coffee order is $11.11. Then your Uber is 11 minutes away. You've been anxious about a decision all day. This is:",
            options: [
                "Random number clustering - statistically normal",
                "A synchronicity cluster - pay attention to your decision",
                "The universe telling you to gamble on number 11",
                "Proof you're in a simulation"
            ],
            correctIndex: 1,
            explanation: "Number clusters during heightened emotional states are classic synchronicities. They're not telling you WHAT to decide, but to PAY ATTENTION. The 11s are a 'wake up' signal - get present with your decision.",
            difficulty: .medium
        ),
        
        Scenario(
            description: "You've been forcing yourself to see 'signs' everywhere for weeks. Everything feels meaningful. You're exhausted but can't stop looking for patterns. This is:",
            options: [
                "Advanced synchronicity awareness",
                "Spiritual awakening accelerating",
                "Pattern-matching gone overboard - time to ground",
                "Normal part of the journey"
            ],
            correctIndex: 2,
            explanation: "When EVERYTHING feels like a sign, you've lost discernment. Genuine synchronicities are specific and relatively rare. Constant overwhelming meaning-making is a warning sign to ground, rest, and possibly seek support.",
            difficulty: .hard
        ),
        
        Scenario(
            description: "You ask the universe: 'If I should take this job, show me a red cardinal.' For 3 days, no cardinal. Then you see one, but you're not even thinking about the job. This is:",
            options: [
                "A clear yes - take the job",
                "The sign came late, so it's a weak yes",
                "Inconclusive - the timing breaks the pattern",
                "A no - the delay means rejection"
            ],
            correctIndex: 2,
            explanation: "Synchronicity depends on timing AND context. If you asked for a sign about a specific decision and the sign appears when you're not even holding the question, it's inconclusive. The synchronicity signature requires meaningful alignment of inner and outer.",
            difficulty: .hard
        ),
        
        Scenario(
            description: "Three different friends, unprompted, recommend the same book to you in one week. You've never heard of it. This is:",
            options: [
                "Viral marketing - the book is trending",
                "A strong synchronicity - read that book",
                "Coincidence - friends have similar tastes",
                "Can't determine without more information"
            ],
            correctIndex: 1,
            explanation: "Three independent sources pointing to the same thing is a classic theme synchronicity. Unless the book just went viral (check), this is a strong signal. The universe is highlighting this information for you.",
            difficulty: .easy
        )
    ]
}

// MARK: - Daily Sync Practice

struct DailySyncPractice {
    
    static let morningIntention = """
    MORNING INTENTION (30 seconds):
    
    "I am open and attentive today.
    I will notice what the universe shows me.
    I hold my questions lightly.
    I trust the answers will come."
    
    Then release. Don't grasp. Live your day.
    """
    
    static let eveningReflection = """
    EVENING REFLECTION (2 minutes):
    
    1. What stood out today? Any unusual coincidences?
    2. What was I thinking/feeling when they occurred?
    3. Any themes that repeated across different sources?
    4. How do I feel about what I noticed?
    
    Log anything significant in your synchronicity journal.
    """
    
    static let weeklyReview = """
    WEEKLY REVIEW (10 minutes):
    
    Review your synchronicity journal entries.
    
    Ask:
    • What themes dominated this week?
    • Which synchronicities felt most significant?
    • Did I act on any guidance? What happened?
    • Am I forcing meaning or staying discerning?
    • What questions am I holding for next week?
    
    Adjust your practice based on what you learn.
    """
}
