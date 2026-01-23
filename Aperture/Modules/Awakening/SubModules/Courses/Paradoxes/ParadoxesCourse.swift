// ParadoxesCourse.swift
// REALITY PARADOXES - When Logic Breaks

import SwiftUI

struct ParadoxesCourse {
    static let shared = ParadoxesCourse()
    
    let id = "paradoxes"
    let title = "Reality Paradoxes"
    let subtitle = "When logic meets its limits"
    let icon = "infinity"
    let colorHex = "#9C27B0"
    
    var color: Color { Color(hex: colorHex) }
    
    let paradoxes: [Paradox] = [
        
        // TIME PARADOXES
        Paradox(
            id: "grandfather",
            category: .time,
            title: "The Grandfather Paradox",
            description: "If you travel back in time and kill your grandfather before your parent was born, you would never exist to go back in time.",
            explanation: """
**The Problem**
1. You travel back in time
2. You prevent your grandfather from meeting your grandmother
3. Your parent is never born
4. You are never born
5. You never travel back in time
6. Your grandfather DOES meet your grandmother
7. You ARE born
8. You travel back... (infinite loop)

**Possible Resolutions**

• **Novikov Self-Consistency**: The universe prevents paradoxes. Your attempt to kill your grandfather will always fail. Events conspire to maintain consistency.

• **Many-Worlds**: Killing your grandfather creates a branch. The "original you" came from a timeline where he lived. You continue in the new branch—but there's no paradox because there are two timelines.

• **Time is Immutable**: You can't change the past because you ALREADY didn't. Whatever you do in the past was always part of history.

🔥 **The Teaching**: Causality might be more flexible than we imagine. Or time travel might be impossible. Either way, our assumptions about cause-effect are challenged.
""",
            mindBender: "If you never existed to go back, did the trip happen? For whom?"
        ),
        
        Paradox(
            id: "bootstrap",
            category: .time,
            title: "The Bootstrap Paradox",
            description: "An object or information exists without ever being created because it was sent back in time.",
            explanation: """
**The Setup**
1. A future scientist discovers a mathematical theorem
2. They travel back in time and give it to their younger self
3. Young self grows up, "discovers" the theorem, travels back to give it to younger self
4. Question: Who INVENTED the theorem? No one. It exists in a causal loop.

**Real Example in Fiction**
In *Interstellar*, future humans create the tesseract that allows Cooper to send the data that allows humans to survive and become the future humans who create the tesseract.

**Why This Breaks Brains**
We assume every effect has a prior cause. The bootstrap paradox shows information or objects that are their OWN cause—they exist without origin.

**Possible Resolutions**
• **Information has no author**: Some patterns exist mathematically and get "discovered" rather than invented. The causal loop just accesses a platonic truth.
• **Closed timelike curves**: In certain spacetime geometries, effect-before-cause is consistent, not paradoxical.

🔥 **The Teaching**: Origins may be illusory. Some things might just BE, without beginning or cause.
""",
            mindBender: "Where does something come from if it only exists because it was already there?"
        ),
        
        Paradox(
            id: "fermi",
            category: .existence,
            title: "Fermi's Paradox",
            description: "If the universe is so vast, where is everybody?",
            explanation: """
**The Numbers**
• 200-400 billion stars in our galaxy
• Billions of galaxies in the observable universe
• The universe is 13.8 billion years old
• Life on Earth took ~4 billion years to produce technology

Even conservative estimates suggest intelligent civilizations should be EVERYWHERE. Space should be teeming with signals, artifacts, visitors.

**Yet: Silence.**

**Possible Explanations**

1. **We're Early**: We're among the first technological civilizations. Others haven't emerged yet.

2. **Great Filter**: Something prevents civilizations from becoming space-faring. Either behind us (life is rare) or ahead (civilizations destroy themselves).

3. **Zoo Hypothesis**: They're watching us but not interfering. Earth is a nature preserve.

4. **Dark Forest Theory**: Civilizations hide because revealing yourself gets you destroyed by paranoid aliens.

5. **Simulation**: We're in a simulation without other civilizations rendered.

6. **They're Already Here**: UFO phenomena. But why no clear contact?

7. **Different Dimensions**: Advanced civilizations leave 3D space for higher dimensions.

🔥 **The Teaching**: Either we're alone (terrifying) or we're not (terrifying). The silence is data. What does it mean?
""",
            mindBender: "If the universe is teeming with life, why does Earth feel so alone?"
        ),
        
        // PHYSICS PARADOXES
        Paradox(
            id: "twins",
            category: .physics,
            title: "The Twin Paradox",
            description: "One twin travels at near-light speed and returns younger than their sibling.",
            explanation: """
**The Setup**
• Twin A stays on Earth
• Twin B travels to a distant star at 0.99c (99% speed of light) and returns
• For Twin B: 2 years pass
• For Twin A: 14 years pass

Twin B is now YOUNGER than their twin. Not perception—actual biological aging difference.

**Why It's Paradoxical**
Relativity says motion is relative. From Twin B's perspective, Earth moved away and returned. Shouldn't Twin A be younger?

**Resolution**
The situation isn't symmetric. Twin B ACCELERATED—turned around. Acceleration is absolute, not relative. The accelerating twin ages less.

**This Is Real**
GPS satellites experience time dilation. Without corrections, GPS would drift by kilometers per day. Astronauts age microscopically slower.

🔥 **The Teaching**: Time is not absolute. Your experience of time depends on your motion through space. Reality is stranger than common sense suggests.
""",
            mindBender: "If you traveled fast enough for long enough, you could return to find everyone you knew dead—while you barely aged."
        ),
        
        Paradox(
            id: "schrodinger",
            category: .physics,
            title: "Schrödinger's Cat",
            description: "A cat in a box is simultaneously alive and dead until observed.",
            explanation: """
**The Thought Experiment**
• A cat is in a sealed box
• A radioactive atom has 50% chance of decaying in one hour
• If it decays, it triggers poison that kills the cat
• Quantum mechanics says the atom is in superposition (decayed AND not decayed)
• Is the cat alive AND dead until we open the box?

**The Point**
Schrödinger designed this to show quantum mechanics leads to absurd conclusions when applied to macro objects. But does it?

**Decoherence**
Interactions with the environment cause rapid "collapse" of superposition. The cat's own atoms act as "observers." Macro superposition is nearly impossible to maintain.

**But Still...**
When DOES collapse happen? What counts as observation? A measuring device? A conscious observer? The air molecules?

🔥 **The Teaching**: At what point does possibility become actuality? The boundary between quantum weirdness and classical reality remains unclear. The cat represents the mystery of manifestation itself.
""",
            mindBender: "If observation creates reality, and no one observes, does reality exist?"
        ),
        
        Paradox(
            id: "quantum_zeno",
            category: .physics,
            title: "Quantum Zeno Effect",
            description: "Continuous observation can freeze a quantum system, preventing change.",
            explanation: """
**The Effect**
If you measure a quantum system frequently enough, you can prevent it from evolving. An unstable atom observed constantly will never decay.

This is experimentally verified.

**Why It Works**
Each measurement "resets" the wave function to its initial state. If you measure before it has time to evolve significantly, you keep collapsing it back.

**The Paradox**
• Does watching something hard enough stop it from happening?
• At what observation frequency does "Zeno freezing" occur?
• Does the universe need periods of "not being observed" to evolve?

**Real Applications**
Quantum computing uses this effect to protect quantum states from decoherence.

🔥 **The Teaching**: Attention itself may be a form of power. What you observe, you influence. Focus might literally stabilize reality.
""",
            mindBender: "Could unwavering attention prevent change—for better or worse?"
        ),
        
        // LOGICAL PARADOXES
        Paradox(
            id: "liar",
            category: .logic,
            title: "The Liar's Paradox",
            description: "\"This statement is false.\" Is it true or false?",
            explanation: """
**The Problem**
"This statement is false."

• If it's TRUE, then what it says is correct—so it's FALSE.
• If it's FALSE, then what it says is wrong—so it's TRUE.
• It can't be either without being both. It can't be both without being neither.

**Self-Reference Creates Loops**
The paradox arises from self-reference. The statement talks about itself. This creates a strange loop with no stable state.

**Historical Impact**
This simple paradox caused a crisis in mathematics. Bertrand Russell showed it undermines naive set theory. Kurt Gödel used related ideas to prove mathematics is inherently incomplete.

**Gödel's Incompleteness**
Any consistent mathematical system complex enough to include arithmetic contains true statements that cannot be proven within the system. Logic has inherent limits.

🔥 **The Teaching**: Language can construct sentences that have no truth value. Reality may contain statements that are neither true nor false. Some questions might be meaningless, not unanswerable.
""",
            mindBender: "If a system is complex enough to talk about itself, it contains paradoxes. Does this apply to consciousness examining itself?"
        ),
        
        Paradox(
            id: "ship_theseus",
            category: .identity,
            title: "Ship of Theseus",
            description: "If you replace every part of a ship, is it still the same ship?",
            explanation: """
**The Scenario**
Theseus has a ship. Over time, every plank, nail, and rope is replaced. Is the final ship the "same" ship as the original?

**Making It Worse**
What if someone collects all the old parts and rebuilds the original? Now there are TWO ships. Which is "really" the Ship of Theseus?

**Why This Matters for YOU**
Your body replaces almost all its atoms every 7 years. Your memories change with each recall. Your personality evolves. Your beliefs shift.

Are you the "same person" you were at age 5? What makes you YOU?

**Possible Answers**
• **Continuity**: Identity is about continuity of form/function, not specific parts.
• **Pattern**: You're a pattern that persists while components change.
• **No Self**: There is no persistent "self"—just a narrative we tell.
• **Illusion**: Identity is a useful fiction, not a truth.

🔥 **The Teaching**: The "you" that fears death may not exist in the way you think. What dies if "you" are already constantly changing?
""",
            mindBender: "If every cell in your body is replaced, at what point did 'you' die and someone else take over?"
        ),
        
        Paradox(
            id: "omnipotence",
            category: .theological,
            title: "The Omnipotence Paradox",
            description: "Can God create a stone so heavy even God cannot lift it?",
            explanation: """
**The Dilemma**
• If YES: There's something God can't do (lift the stone). Not omnipotent.
• If NO: There's something God can't do (create the stone). Not omnipotent.

Either way, omnipotence seems self-contradictory.

**Proposed Resolutions**

1. **Omnipotence excludes logical contradictions**: God can do anything logically possible. A stone too heavy for an omnipotent being to lift is logically impossible—like a square circle.

2. **Sequential omnipotence**: God can limit God's own powers. Create the stone, then be unable to lift it—both acts of omnipotence.

3. **Beyond logic**: God operates outside logical constraints. Our categories don't apply.

4. **Language failure**: The question is grammatically correct but semantically empty—like asking "What's north of the North Pole?"

**Deeper Question**
Does omnipotence even make sense as a concept? Might infinity itself contain contradictions?

🔥 **The Teaching**: Some concepts may be incoherent at their core. Not all questions have answers because not all questions are valid. The limits of language are the limits of what we can meaningfully ask.
""",
            mindBender: "If unlimited power is self-contradictory, are there necessary limits built into existence?"
        ),
        
        Paradox(
            id: "simulation",
            category: .existence,
            title: "Simulation Argument",
            description: "We're almost certainly living in a computer simulation.",
            explanation: """
**Bostrom's Argument**
At least one of these must be true:

1. Civilizations go extinct before developing simulation technology
2. Advanced civilizations choose not to run ancestor simulations
3. We are almost certainly living in a simulation

**The Logic**
If (1) and (2) are false, simulated beings would vastly outnumber "real" ones. Statistically, you're probably simulated.

**Evidence?**
• Reality seems "pixelated" at Planck scale (minimum distance/time)
• Speed of light could be a processing limit
• Quantum "superposition" only calculated when observed—like video games only rendering what you look at
• Mathematical structure of reality seems "designed"

**Counter-Arguments**
• We don't know if consciousness can be simulated
• The "simulators" might also be simulated (infinite regress)
• Unfalsifiable—no test can prove it

**Why It Matters**
If true:
• "Physical laws" are code, not fundamental truth
• Death might be a transition, not end
• There might be a "programmer" (god)
• Free will depends on simulation constraints

🔥 **The Teaching**: Even if we're not in a simulation, we have no direct access to "base reality." We always experience representations, never the thing itself. Whether simulation or not, the world is more dreamlike than we assume.
""",
            mindBender: "If this is a simulation, what would you do differently? If nothing, does it matter?"
        ),
        
        Paradox(
            id: "free_will",
            category: .identity,
            title: "The Free Will Paradox",
            description: "Do you choose your choices? If so, what chose that?",
            explanation: """
**The Problem**
Every decision you make is either:
1. **Caused** by prior states (brain chemistry, upbringing, etc.) → Determinism, no free will
2. **Random** → Not determined, but also not "you" choosing → No free will
3. **Neither caused nor random** → What would that even be?

**You Can't Choose Your Wants**
Can you decide what to want? Can you choose your preferences? If your choices come from desires you didn't choose, are they "free"?

**The Infinite Regress**
To "choose" freely:
• Your choice must come from you
• But "you" came from factors you didn't choose
• To have chosen "you," there must have been a prior you
• But that prior you also came from somewhere...

**Possible Resolutions**

• **Compatibilism**: Free will = acting according to your desires, even if those desires were determined. "Free" means "not externally coerced."

• **Libertarian Free Will**: There's something beyond cause-and-effect. Consciousness isn't reducible to physics.

• **Illusion**: Free will is a useful narrative. We're automatons who feel free.

• **Quantum**: Indeterminacy at quantum level bubbles up, providing genuine openness.

🔥 **The Teaching**: The question may be malformed. "You" might not be the kind of thing that "has" or "lacks" free will. Perhaps consciousness IS freedom—not something that has freedom.
""",
            mindBender: "Did you choose to read this sentence, or was that 'choice' made billions of years ago at the Big Bang?"
        )
    ]
}

// Supporting Types
struct Paradox: Identifiable {
    let id: String
    let category: ParadoxCategory
    let title: String
    let description: String
    let explanation: String
    let mindBender: String
    
    enum ParadoxCategory: String, CaseIterable {
        case time = "Time"
        case physics = "Physics"
        case logic = "Logic"
        case identity = "Identity"
        case existence = "Existence"
        case theological = "Theological"
        
        var color: Color {
            switch self {
            case .time: return .blue
            case .physics: return .cyan
            case .logic: return .orange
            case .identity: return .purple
            case .existence: return .green
            case .theological: return .yellow
            }
        }
        
        var icon: String {
            switch self {
            case .time: return "clock"
            case .physics: return "atom"
            case .logic: return "brain"
            case .identity: return "person.fill.questionmark"
            case .existence: return "globe"
            case .theological: return "sparkles"
            }
        }
    }
}

struct ParadoxProgress: Codable {
    var completedParadoxes: [String]
    var lastAccessed: Date?
    static var `default`: ParadoxProgress { ParadoxProgress(completedParadoxes: [], lastAccessed: nil) }
}
