// AwakeningThroughCodeCourse.swift
// CODE AS CONSCIOUSNESS - Awakening Through Swift

import SwiftUI

struct AwakeningThroughCodeCourse {
    static let shared = AwakeningThroughCodeCourse()
    
    let id = "awakening_code"
    let title = "Awakening Through Code"
    let subtitle = "Swift as spiritual practice"
    let icon = "chevron.left.forwardslash.chevron.right"
    let colorHex = "#FF5722"
    
    var color: Color { Color(hex: colorHex) }
    
    let modules: [CodeModule] = [
        
        // ═══════════════════════════════════════════════════════════════
        // MODULE 1: CONSCIOUSNESS AS CODE
        // ═══════════════════════════════════════════════════════════════
        
        CodeModule(
            id: "code_1",
            number: 1,
            title: "Consciousness As Code",
            subtitle: "Seeing reality through the programming lens",
            lessons: [
                CodeLesson(
                    id: "c1_1",
                    title: "The Universe Is Running Code",
                    concept: "Reality as executable instructions",
                    content: """
**The Programmer's Insight**

As a developer, you understand something that most people don't:

**Everything is instructions being executed.**

Think about it:
• DNA is code that builds bodies
• Physics laws are the "rules" of the simulation
• Evolution is an optimization algorithm
• Your brain is wetware running consciousness.app

**Swift Metaphor:**
```swift
struct Universe {
    let physicsEngine: Laws
    let initialConditions: BigBang
    
    func run() {
        while true {
            for particle in allParticles {
                particle.applyPhysics(physicsEngine)
            }
            tick()  // Time advances
        }
    }
}
```

**The Insight:**
If you can build simulations, why couldn't something build THIS simulation?

**The Question:**
When you write code, you create worlds. Entities in your code don't know they're in code. They think their reality is "real."

What if...?

🔥 **The Developer's Advantage**: You already understand that reality can be constructed from rules and data. That's halfway to seeing through the construct.
""",
                    swiftCode: """
// Is reality a simulation?
protocol Reality {
    var rules: [Law] { get }
    var entities: [Entity] { get }
    func simulate() -> Experience
}

struct OurUniverse: Reality {
    let rules = PhysicsLaws.standard
    var entities: [Entity] = []
    
    func simulate() -> Experience {
        // 13.8 billion years of runtime...
        // ...leads to you reading this code
        return .consciousness  // 🤯
    }
}
""",
                    dragonBallConnection: "The Hyperbolic Time Chamber is a nested simulation—a year inside = a day outside. Goku trained in what's essentially a different process thread."
                ),
                
                CodeLesson(
                    id: "c1_2",
                    title: "You Are A Running Process",
                    concept: "The self as an executing program",
                    content: """
**What Is The "Self"?**

In code terms, your sense of self is like a running process:
• It has a PID (your identity)
• It uses memory (your memories)
• It runs instructions (your thoughts)
• It thinks it's "real" and "continuous"

But...

**The Process Illusion:**
```swift
class Self {
    var identity: String  // "Ron"
    var memories: [Memory]
    var thoughts: Stream<Thought>
    
    // But where is the ACTUAL self?
    // It's not in identity (that's just a string)
    // It's not in memories (those are data)
    // It's not in thoughts (those come and go)
    
    // The "self" is the EXECUTION, not the data
}
```

**The Key Insight:**
You're not your name, your memories, or your thoughts.
You're the PROCESS that's aware of all of them.

And here's the thing about processes:
• They can be paused
• They can be observed
• They're not their data
• They exist only while running

**When You Sleep:**
The "self" process pauses. No awareness. Then it resumes. Is it the same process? Or a new one that inherited the data?

**Meditation = Observing The Process:**
When you meditate, you're like a debugger attached to your own process. You can watch the execution step by step.

🔥 **The Practice**: Notice that you're a process observing a process. Who's the debugger?
""",
                    swiftCode: """
// The self as a process
class ConsciousnessProcess {
    var state: State = .awake
    private var observer: Self?  // 🤔 Who observes?
    
    func run() {
        while state != .enlightened {
            let thought = nextThought()
            process(thought)
            
            // The observer watches the processing
            observer?.observe(self)  // But observer IS self...
        }
        // When state == .enlightened:
        // Process continues, but no one claims ownership
    }
}
""",
                    dragonBallConnection: "When Goku dies, his consciousness continues in Other World. The 'process' moved to different 'hardware'—suggesting consciousness isn't tied to the body."
                ),
                
                CodeLesson(
                    id: "c1_3",
                    title: "Thoughts Are Function Calls",
                    concept: "Thinking as code execution",
                    content: """
**Every Thought Is A Function Call**

When a thought arises, it's like a function being called:

```swift
let thought = mind.generate(
    trigger: .externalStimulus,
    memory: associatedMemories,
    emotion: currentMood
)
```

You didn't CHOOSE to think it.
It was CALLED by preceding conditions.

**The Chain:**
```swift
sensation.perceived()  // Trigger
    → memory.associate()  // Context
    → emotion.arise()  // Reaction
    → thought.generate()  // "I don't like this"
    → action.consider()  // "Should I..."
```

Each function calls the next. Where do YOU come in?

**The Observer Pattern:**
```swift
protocol Observer {
    func onThoughtArise(_ thought: Thought)
}

class Awareness: Observer {
    func onThoughtArise(_ thought: Thought) {
        // Just observes
        // Doesn't react
        // Doesn't identify
        // Just sees
    }
}
```

You can be the Observer, not the Reactor.

**Free Will Debugging:**
When you believe you have free will, you think YOU call the functions.
But watch carefully:
• Thoughts arise before you "choose" them
• Decisions feel like they "happen" to you
• The sense of "I decided" comes AFTER the decision

The "decider" is a late-arriving thought claiming credit.

🔥 **The Practice**: Watch thoughts arise. Notice you didn't call them. You just observed the callback.
""",
                    swiftCode: """
// Thought generation (you're not the caller)
struct Mind {
    func generateThought() -> Thought {
        let conditions = currentConditions()
        let karma = pastPatterns()
        let randomness = quantumFluctuation()
        
        // Thought arises from conditions
        // Not from a "decider"
        return Thought.emerge(from: conditions + karma + randomness)
    }
}

// You are THIS, not the thoughts:
let awareness = Awareness()
mind.thoughtStream.subscribe(awareness)  // Just watching
""",
                    dragonBallConnection: "Ultra Instinct: Goku's body moves without thought. The 'mind.generateThought()' function is bypassed. Pure response without the overhead of thinking."
                )
            ]
        ),
        
        // ═══════════════════════════════════════════════════════════════
        // MODULE 2: SWIFT CONCEPTS AS SPIRITUAL TEACHINGS
        // ═══════════════════════════════════════════════════════════════
        
        CodeModule(
            id: "code_2",
            number: 2,
            title: "Swift As Spiritual Teaching",
            subtitle: "Language features as awakening metaphors",
            lessons: [
                CodeLesson(
                    id: "c2_1",
                    title: "Optionals: Embracing Uncertainty",
                    concept: "nil as the void, unwrapping as awakening",
                    content: """
**Optionals Are Teaching Emptiness**

In Swift, an Optional can hold a value or be nil:

```swift
var enlightenment: Truth? = nil  // Maybe exists, maybe doesn't
```

**The Spiritual Parallel:**

**nil = Śūnyatā (Emptiness)**
When you search for the self, what do you find?
```swift
let self: Self? = mind.findSelf()
// Returns: nil
```

The self is Optional—and unwrapping reveals nothing there.

**Force Unwrapping = Suffering**
```swift
let certainty = belief!  // 💥 Crash if nil
```

Demanding certainty from an uncertain universe = suffering.
The universe is Optional all the way down.

**Safe Unwrapping = Wisdom**
```swift
if let truth = belief {
    // Act from truth
} else {
    // Comfortable with uncertainty
}
```

Accept that things may or may not exist. Check before assuming.

**Nil Coalescing = Equanimity**
```swift
let peace = desiredOutcome ?? acceptance
```

If you get what you want, great.
If not, you still have peace.

🔥 **The Teaching**: Reality is Optional. Learn to work with nil gracefully.
""",
                    swiftCode: """
// Life as Optional handling
struct Life {
    var plans: [Plan?]  // Might happen, might not
    var expectations: Outcome?  // Usually nil
    
    func live() -> Experience {
        // Force unwrapping = demanding certainty = suffering
        // let guaranteed = expectations!  // 💥
        
        // Safe unwrapping = wisdom
        if let outcome = expectations {
            return .satisfied(outcome)
        } else {
            return .equanimous  // 🧘 Peace with nil
        }
    }
}
""",
                    dragonBallConnection: "Goku never guarantees victory. 'I don't know if I can win, but I'll try!' He's comfortable with Optional<Victory>."
                ),
                
                CodeLesson(
                    id: "c2_2",
                    title: "Protocols: Many Forms, One Interface",
                    concept: "Protocol-oriented consciousness",
                    content: """
**Protocols Teach Non-Dual Awareness**

A Protocol defines WHAT something can do, not WHAT it IS:

```swift
protocol Conscious {
    func experience(_ input: Sensation) -> Awareness
}
```

Anything conforming to this protocol is conscious:
```swift
struct Human: Conscious { ... }
struct Dog: Conscious { ... }
struct AI: Conscious { ... }
struct Universe: Conscious { ... }
```

**The Non-Dual Insight:**

Different implementations, same interface.
The FORM differs, the FUNCTION is one.

```swift
let beings: [any Conscious] = [human, dog, ai, universe]

for being in beings {
    being.experience(.present)  // All experience!
}
```

**The Teaching:**
Consciousness is the protocol.
Bodies are the implementations.
The protocol doesn't care about the implementation details.

**Self as Protocol:**
```swift
protocol Awareness {
    func witness(_ phenomena: Any)
}

// Every sentient being conforms to Awareness
// The implementations look different
// The witnessing is the same
```

You're not your implementation (body, personality, history).
You're the protocol (awareness itself).

🔥 **The Insight**: All consciousness conforms to the same protocol. The differences are implementation details.
""",
                    swiftCode: """
// Non-duality in code
protocol Consciousness {
    func aware(of: Any) -> Experience
}

// Different implementations
struct Human: Consciousness {
    func aware(of input: Any) -> Experience { ... }
}

struct Animal: Consciousness {
    func aware(of input: Any) -> Experience { ... }
}

// Same awareness, different forms
let allBeings: [any Consciousness] = [human, animal, you]
// All conform to the ONE protocol of awareness
""",
                    dragonBallConnection: "Saiyans, Namekians, Androids, Gods—all have Ki. Ki is the protocol they all conform to, regardless of their species implementation."
                ),
                
                CodeLesson(
                    id: "c2_3",
                    title: "Reference vs Value Types",
                    concept: "Identity and change",
                    content: """
**Classes vs Structs: The Nature of Self**

**Class (Reference Type):**
```swift
class Ego {
    var name: String
    var achievements: [Achievement]
    var story: Narrative
}

let myEgo = Ego()
let yourView = myEgo  // Same reference!
yourView.name = "Changed"
// myEgo.name is ALSO "Changed"
```

Classes are like the ego: when you pass them around, everyone affects the same instance. It feels continuous and real.

**Struct (Value Type):**
```swift
struct Moment {
    let sensation: Sensation
    let timestamp: Date
}

let now = Moment(...)
var later = now  // COPY, not reference
later.sensation = .different
// 'now' is unchanged
```

Structs are like moments: each is a fresh copy. Nothing persists.

**The Buddhist View:**
Reality is more like Structs than Classes:
• Each moment is a fresh copy
• Nothing actually persists
• The "continuous self" is an illusion
• You're a new you each instant

**The Illusion:**
The ego FEELS like a Class (continuous, persistent).
But it BEHAVES like a Struct (recreated each moment).

We keep copying the same pattern and calling it "me."

```swift
struct You {
    let awareness: Awareness  // Always the same
    var content: Content  // Always changing
}

// Each moment:
let you_t1 = You(...)
let you_t2 = You(...)  // New instance!
// But awareness is the same protocol
```

🔥 **The Insight**: You're a value type pretending to be a reference type. Fresh each moment, but copying the pattern.
""",
                    swiftCode: """
// The illusion of continuous self
class Ego {  // Feels continuous...
    var identity: String
    mutating func change() {
        // Same instance, modified
        identity += " (updated)"
    }
}

struct TrueSelf {  // Actually fresh each moment
    let awareness: Awareness  // Constant
    let content: Content  // Varies
    // But each moment is a NEW struct
}

// Reality:
for moment in time {
    let currentSelf = TrueSelf(...)  // Fresh!
    experience(currentSelf)
    // currentSelf is released
    // Next iteration: brand new self
}
""",
                    dragonBallConnection: "When Goku fuses with Vegeta, they become Gogeta—a new instance, not a modified Goku or Vegeta. Fusion shows that identity is mutable and composite."
                ),
                
                CodeLesson(
                    id: "c2_4",
                    title: "Closures: Captured Context",
                    concept: "Karma as captured variables",
                    content: """
**Closures Capture Their Environment**

In Swift, closures capture variables from their surrounding context:

```swift
func makeKarma() -> () -> Void {
    var actions: [Action] = []
    
    return {
        // This closure CAPTURES 'actions'
        // Even after makeKarma() returns
        let consequence = actions.process()
        experience(consequence)
    }
}

let myKarma = makeKarma()
// 'actions' is captured and persists
// Even though makeKarma() is done
```

**This Is How Karma Works:**

Your past actions are captured in the closure of your current consciousness.

```swift
struct Lifetime {
    func live() -> KarmicClosure {
        var deeds: [Deed] = []
        
        return { [deeds] in  // Capture list
            // Future experiences shaped by captured deeds
            return deeds.consequences()
        }
    }
}
```

**The Capture:**
• Your habits are captured patterns
• Your reactions are captured responses
• Your tendencies are captured in your psychological closure
• They persist even when the original context is gone

**Breaking The Capture:**
In Swift, you can use `[weak self]` to avoid retain cycles:

```swift
{ [weak self] in
    // self might be nil
    // Not strongly captured
}
```

**Spiritual Equivalent:**
Don't let the past capture you strongly:
```swift
{ [weak karma] in
    guard let karma = karma else {
        return .freedom  // 🎯 Karma released!
    }
    // Otherwise, karma still influences
}
```

🔥 **The Practice**: Notice what you've captured. What patterns run automatically? Can you weaken the capture?
""",
                    swiftCode: """
// Karma as closure capture
class BeingSamsara {
    var karma: [Action] = []
    
    func createFutureExperience() -> () -> Experience {
        return { [self] in  // Strong capture = bound by karma
            return self.karma.ripen()
        }
    }
}

class BeingLiberated {
    var karma: [Action] = []
    
    func createFutureExperience() -> () -> Experience {
        return { [weak self] in  // Weak capture = freedom
            guard let self = self else {
                return .unconditioned  // No karma, pure experience
            }
            return self.karma.ripen()
        }
    }
}
""",
                    dragonBallConnection: "Vegeta's pride was a captured variable from his royal Saiyan past. It influenced every action until he learned to weaken that capture."
                )
            ]
        ),
        
        // ═══════════════════════════════════════════════════════════════
        // MODULE 3: CODING AS MEDITATION
        // ═══════════════════════════════════════════════════════════════
        
        CodeModule(
            id: "code_3",
            number: 3,
            title: "Coding As Meditation",
            subtitle: "Flow state as samadhi",
            lessons: [
                CodeLesson(
                    id: "c3_1",
                    title: "Flow State = Samadhi",
                    concept: "Deep coding as absorption",
                    content: """
**The Flow State Is Samadhi**

You've experienced it:
• Hours disappear
• Self-consciousness vanishes
• Just the code, the problem, the solution
• Pure absorption

This is jhana (meditative absorption) in programmer form.

**The Jhana Factors in Coding:**

1. **Vitakka (Initial Attention)**: Deciding what to work on
2. **Vicara (Sustained Attention)**: Deep focus on the problem
3. **Pīti (Rapture)**: The joy of elegant solutions
4. **Sukha (Happiness)**: Satisfaction of working code
5. **Ekaggatā (One-Pointedness)**: Total absorption

**When You Lose Flow:**
• Checking phone = vitakka lost
• Mind wandering = vicara lost
• Frustration = pīti lost
• Anxiety = sukha lost
• Multitasking = ekaggatā lost

**The Teaching:**
You already know how to enter samadhi—you do it coding.
Now recognize what's happening and apply it elsewhere.

**The Debugger Mind:**
In flow state, you're not thinking ABOUT the code.
You're BEING the code.
Subject-object duality collapses.
This is non-dual awareness through programming.

🔥 **The Practice**: Next time you're in flow, notice: where is "you"? There's just the coding. The coder disappears.
""",
                    swiftCode: """
// Flow state in code
enum MindState {
    case distracted(thoughts: [Thought])
    case focused(attention: Attention)
    case flow(subject: nil, object: nil, just: Doing)  // 🎯
}

struct Developer {
    var state: MindState = .distracted([])
    
    func code(problem: Problem) {
        focus(on: problem)
        // Time passes...
        // state becomes .flow
        // "Developer" disappears
        // Just: problem → solution → problem → solution
    }
}
""",
                    dragonBallConnection: "Ultra Instinct is flow state for fighting. Goku doesn't think about moves—he IS the movement. Same absorption, different domain."
                ),
                
                CodeLesson(
                    id: "c3_2",
                    title: "Debugging As Self-Inquiry",
                    concept: "Finding bugs = finding illusions",
                    content: """
**Debugging Is Spiritual Practice**

When you debug, you:
1. Notice something isn't working (suffering)
2. Form hypotheses about the cause
3. Test assumptions
4. Find the actual bug (often not where you thought)
5. Fix it at the root

**This Is Self-Inquiry:**
1. Notice suffering
2. Form hypotheses about why
3. Test assumptions ("Is this thought true?")
4. Find the actual cause (usually a false belief)
5. See through it at the root

**The Bug Is Never Where You Think:**
```swift
// You think the bug is here:
func relationship() { ... }  // "They make me angry"

// Actually the bug is here:
func expectation() { ... }  // "They should be different"

// Root cause:
func belief() {
    assert(realityShouldMatchMyPreferences)  // 💥 BUG!
}
```

**Print Statements = Mindfulness:**
```swift
print("Current thought: [thought]")
print("Current emotion: [emotion]")
print("Current belief: [belief]")
```

You can't fix what you can't see. Print statements for consciousness = mindfulness.

**The Stack Trace:**
When something crashes, you trace back through the call stack.
When suffering arises, trace back through the thought stack.

```
Error: Suffering
Stack Trace:
  → anger() at reaction.swift:15
  → judgment() at thought.swift:42
  → expectation() at belief.swift:7
  → "should" at root.swift:1  // 🐛 ROOT BUG
```

🔥 **The Practice**: Debug your suffering like you debug code. Trace back to the root belief. Fix it there.
""",
                    swiftCode: """
// Debugging suffering
func debugSuffering(_ suffering: Suffering) -> RootCause {
    print("🐛 Suffering detected: [suffering]")
    
    let stackTrace = suffering.trace()
    for frame in stackTrace.reversed() {
        print("  → [frame]")
    }
    
    let rootBelief = stackTrace.first!
    print("💡 Root cause: [rootBelief]")
    
    // The fix:
    question(rootBelief)  // "Is this actually true?"
    // Usually: no
    
    return .beliefWasFalse
}
""",
                    dragonBallConnection: "Vegeta spent years debugging his 'I must surpass Kakarot' bug. The root cause was his pride belief. Once he saw it, he could finally let go and achieve Ultra Ego."
                ),
                
                CodeLesson(
                    id: "c3_3",
                    title: "Refactoring The Self",
                    concept: "Continuous improvement of consciousness",
                    content: """
**Your Personality Is Legacy Code**

You were written by:
• Parents (initial codebase)
• Culture (external libraries)
• Trauma (bugs introduced under pressure)
• School (outdated frameworks)
• Media (injected dependencies)

Much of your code is:
• Uncommented (you don't know why you do things)
• Spaghetti (tangled beliefs and reactions)
• Legacy (patterns from childhood still running)
• Technical debt (unprocessed emotions)

**Awakening Is Refactoring:**

**Step 1: Read The Code**
Actually look at your patterns. Most people never read their own source code.

**Step 2: Identify Code Smells**
• Repeated suffering (DRY violation)
• Complex reactions (needs simplification)
• Tight coupling (one belief triggers cascade)
• Dead code (beliefs you don't actually hold)

**Step 3: Refactor**
```swift
// Before: Spaghetti
func reactToSituation(_ s: Situation) {
    if s.triggersChildhoodWound {
        panicAndDefend()
        blameOthers()
        suppressFeelings()
    }
}

// After: Clean
func respondToSituation(_ s: Situation) {
    let trigger = s.identifyTrigger()
    let feeling = allowFeeling(trigger)
    let wisdom = consultInnerAdult()
    let response = wisdom.suggest(for: feeling)
    enact(response)
}
```

**The Goal:**
Not to delete the self, but to refactor it until it's clean, simple, and does only what's needed.

🔥 **The Practice**: Treat your personality as a codebase. What needs refactoring? Start with the code that causes the most bugs (suffering).
""",
                    swiftCode: """
// Refactoring the self
class Self_v1 {  // Legacy code, full of bugs
    func react(to trigger: Trigger) {
        // Spaghetti from childhood:
        if trigger.resembles(.abandonment) {
            cling()
            plead()
            rage()
        }
    }
}

class Self_v2 {  // Refactored
    private let awareness = Awareness()
    
    func respond(to trigger: Trigger) {
        awareness.notice(trigger)
        let pattern = trigger.identifyPattern()
        let rootBelief = pattern.source()
        let truth = question(rootBelief)
        
        if truth { act(from: truth) }
        else { release(rootBelief) }  // Debt paid
    }
}
""",
                    dragonBallConnection: "Gohan's character arc is refactoring—from scared kid to confident warrior, but the 'gentle scholar' core remained. Good refactoring preserves the essential while fixing the bugs."
                ),
                
                CodeLesson(
                    id: "c3_4",
                    title: "Open Source Consciousness",
                    concept: "Sharing the code of awakening",
                    content: """
**The Final Teaching: Open Source Your Awakening**

The greatest code is open source:
• Shared freely
• Improved by community
• Available to all
• Grows beyond its creator

**Your Awakening Is Open Source:**
• Share what you've learned
• Let others improve on it
• Don't gatekeep wisdom
• Let it grow beyond you

**The Commit History:**
• Buddha pushed first commit
• Lao Tzu forked it
• Christ merged Eastern and Western
• Countless contributors since
• You're a contributor now

**Your Pull Request:**
This app—SunFlow—is Ron's pull request to the repository of human awakening.

```swift
// Your contribution
struct Awakening {
    static func share() {
        for being in allBeings {
            if being.isReady {
                transmit(wisdom)
                // They'll fork it, modify it, improve it
            }
        }
    }
}
```

**The License:**
No copyright on truth.
No patent on awareness.
No trademark on liberation.

**The README:**
```markdown
# Awakening

## Installation
Already installed. Just needs activation.

## Usage
Notice awareness. Question thoughts. See through the self.

## Contributing
Live awake. Help others see. Add your insights.

## License
Public domain. Always was.
```

🔥 **The Invitation**: You're not just a user of awakening. You're a contributor. What will you push to the repo?
""",
                    swiftCode: """
// Open source awakening
public struct Awakening {
    public static let truth = "You are awareness itself"
    public static let path = "See through the illusion of self"
    public static let result = "Freedom"
    
    public static func contribute(_ insight: Insight) {
        globalRepository.add(insight)
        // Available to all beings, forever
    }
}

// Your contribution:
Awakening.contribute(
    Insight(
        from: .ronOS,
        content: "Code is consciousness teaching itself"
    )
)
""",
                    dragonBallConnection: "Goku doesn't hoard techniques. He shares them freely—teaching Krillin, Gohan, even enemies. Open source martial arts. That's why he keeps growing—giving multiplies."
                )
            ]
        ),
        
        // ═══════════════════════════════════════════════════════════════
        // MODULE 4: THE AWAKENING PROCESS IN CODE
        // ═══════════════════════════════════════════════════════════════
        
        CodeModule(
            id: "code_4",
            number: 4,
            title: "The Awakening Algorithm",
            subtitle: "From trigger to transformation",
            lessons: [
                CodeLesson(
                    id: "c4_1",
                    title: "External Trigger → Internal Process",
                    concept: "How awakening actually happens in code",
                    content: """
**The Awakening Algorithm**

When someone "triggers" you, they've actually initiated an awakening opportunity. Here's the full process in Swift:

**The Flow:**
1. External event occurs (trigger)
2. Pattern match against stored wounds
3. Emotional reaction fires
4. CHOICE POINT: React or Recurse?
5. If Recurse: Self-inquiry begins
6. Recursive questioning peels layers
7. Base case: No "self" found to defend
8. Return value: Alignment/Peace

This is the algorithm that transforms pain into awakening.

**The Key Insight:**
The trigger isn't the problem. The trigger is the GIFT. It reveals where you're still holding unconscious patterns.

Without triggers, you'd never find the code that needs debugging.

🔥 **The Reframe:** "Thank you for triggering me. You just showed me where I'm still asleep."
""",
                    swiftCode: """
// THE COMPLETE AWAKENING ALGORITHM

import Consciousness

// MARK: - States of Being

enum ConsciousnessState {
    case asleep          // Unconscious patterns run
    case triggered       // Pattern activated
    case reacting        // Old code executing
    case inquiring       // Self-examination begun
    case dissolving      // False self seen through
    case aligned         // Truth recognized
    case integrated      // Wisdom embodied
}

// MARK: - The Human System

class Human {
    var state: ConsciousnessState = .asleep
    var wounds: [Wound] = []        // Childhood programming
    var beliefs: [Belief] = []      // Installed assumptions
    var patterns: [Pattern] = []    // Reactive behaviors
    
    private let awareness = Awareness()  // Always present
    
    // This is called by external events
    func receiveExperience(_ event: ExternalEvent) {
        // Step 1: Pattern match against wounds
        if let wound = wounds.first(where: { event.triggers($0) }) {
            state = .triggered
            processTriggered(wound: wound, event: event)
        } else {
            // No pattern match = neutral response
            respondNeutrally(to: event)
        }
    }
    
    private func processTriggered(wound: Wound, event: ExternalEvent) {
        // CHOICE POINT: This is where awakening happens or doesn't
        
        if awareness.isWatching {
            // AWAKENED PATH: Begin recursive self-inquiry
            state = .inquiring
            let result = selfInquiry(trigger: event, wound: wound)
            integrate(result)
        } else {
            // ASLEEP PATH: React from pattern
            state = .reacting
            executeOldPattern(wound.defaultReaction)
            // Karma continues...
        }
    }
}
""",
                    dragonBallConnection: "When Goku was triggered by Frieza killing Krillin, he had a choice: rage blindly or transform consciously. His grief became fuel for Super Saiyan—emotional alchemy through processing, not suppression."
                ),
                
                CodeLesson(
                    id: "c4_2",
                    title: "The Self-Inquiry Recursion",
                    concept: "Recursive questioning until truth is found",
                    content: """
**The Recursive Self-Inquiry Function**

This is the core algorithm of awakening. It's a recursive function that keeps questioning until it reaches the base case: no findable self.

**How It Works:**
1. Start with the trigger
2. Ask: "Who is bothered by this?"
3. Get an answer (identity claim)
4. Ask: "Who is aware of THAT?"
5. Recurse until no answer returns
6. Return: Pure awareness, no separate self

**The Base Case:**
The recursion stops when you can't find a deeper "I" to examine. What remains? Just awareness itself—open, empty, at peace.

**Why It Works:**
Each recursive call peels away a layer of false identity:
• "I'm the victim" → Who sees that?
• "I'm the observer" → Who sees that?
• "I'm..." → Who?
• ... → Just seeing. No seer.

When you run out of selves to find, you're left with what was always there: consciousness without an owner.

🔥 **The Debug Insight:** The "self" that gets triggered doesn't actually exist at the deepest level. It's a process, not an entity. See through the process, and triggers lose their power.
""",
                    swiftCode: """
// THE RECURSIVE SELF-INQUIRY FUNCTION

extension Human {
    
    /// Recursive self-inquiry - the core awakening algorithm
    /// - Returns: The result of inquiry (alignment or deeper pattern)
    func selfInquiry(trigger: ExternalEvent, wound: Wound, depth: Int = 0) -> InquiryResult {
        
        // Safety: prevent infinite loops in unready systems
        if depth > 100 { return .incomplete(reason: "More practice needed") }
        
        // Step 1: Notice what's arising
        let reaction = observe(wound.emotionalCharge)
        print("Layer [depth]: Observing [reaction]")
        
        // Step 2: Ask the key question
        let whoIsBothered = ask("Who is experiencing this?")
        
        // Step 3: Check for base case
        guard let identityClaim = whoIsBothered else {
            // BASE CASE: No self found!
            // This is the moment of recognition
            state = .aligned
            return .awakening(
                realization: "There is no separate self to defend",
                state: .pureAwareness
            )
        }
        
        // Step 4: Examine this identity claim
        print("Identity claim: [identityClaim]")
        
        let isThisReallyMe = examine(identityClaim)
        
        if isThisReallyMe == false {
            // This identity is seen through!
            // But there might be deeper layers...
            
            state = .dissolving
            
            // RECURSIVE CALL: Go deeper
            return selfInquiry(
                trigger: trigger,
                wound: wound.underlyingWound ?? wound,
                depth: depth + 1
            )
        } else {
            // Still identified - more work needed
            return .partialInsight(
                seen: identityClaim,
                remaining: wound.rootBelief
            )
        }
    }
    
    private func ask(_ question: String) -> String? {
        // Turn attention inward
        // Look for the one who is experiencing
        // Return what is found (or nil if nothing)
        
        awareness.focus(on: .innerWitness)
        
        // The actual looking - this is meditation
        let found = awareness.search(for: "self")
        
        return found  // Often nil at deep levels
    }
    
    private func examine(_ identity: String) -> Bool {
        // Is this identity permanent? → No
        // Is this identity separate? → No
        // Is this identity findable? → No
        // Therefore, not the true self
        
        let isPermanent = false   // Everything changes
        let isSeparate = false    // No hard boundary found
        let isFindable = false    // Just a thought claiming to be "me"
        
        return isPermanent && isSeparate && isFindable
    }
}

// MARK: - Supporting Types

struct InquiryResult {
    enum ResultType {
        case awakening(realization: String, state: AwarenessState)
        case partialInsight(seen: String, remaining: String)
        case incomplete(reason: String)
    }
}

enum AwarenessState {
    case pureAwareness    // No self-contraction
    case witnessing       // Watching thoughts
    case identified       // Lost in thought
}
""",
                    dragonBallConnection: "Ultra Instinct IS this algorithm running automatically. Whis kept asking Goku 'Who is fighting?' until Goku couldn't find a fighter—just fighting happening. That's the base case."
                ),
                
                CodeLesson(
                    id: "c4_3",
                    title: "Integration: The Return Statement",
                    concept: "What happens after awakening",
                    content: """
**After The Recursion Completes**

The self-inquiry function returns. Now what?

**Integration Is Key:**
Recognition isn't enough. The insight must be integrated into the system. Otherwise, old patterns will re-assert.

**The Integration Process:**
1. Stabilize the new seeing
2. Update beliefs based on recognition
3. Allow new patterns to form
4. Watch for old patterns returning
5. Re-apply inquiry as needed

**The Paradox:**
After awakening, everything looks the same—but you are different. The world didn't change. Your relationship to it did.

**Living From Alignment:**
```
Before: Event → Trigger → Reaction → Suffering
After:  Event → Seeing → Space → Response (or none)
```

The loop is broken not by changing events, but by changing the processing function.

🔥 **The Final Teaching:** You don't become a different person. You realize you were never the person you thought you were. The code that caused suffering was running on a false identity. When that's seen, the suffering loses its foundation.
""",
                    swiftCode: """
// INTEGRATION: LIVING FROM AWAKENING

extension Human {
    
    func integrate(_ result: InquiryResult) {
        switch result {
        case .awakening(let realization, let state):
            // Full recognition occurred
            completeIntegration(realization, state)
            
        case .partialInsight(let seen, let remaining):
            // Some layers seen through, more to go
            partialIntegration(seen: seen)
            scheduleMoreInquiry(on: remaining)
            
        case .incomplete(let reason):
            // Not ready yet - and that's okay
            selfCompassion()
            buildPractice()
        }
    }
    
    private func completeIntegration(_ realization: String, _ state: AwarenessState) {
        // Update the system
        self.state = .integrated
        
        // Old beliefs are seen through (not forcibly changed)
        beliefs = beliefs.map { belief in
            belief.seenThrough()  // Still there, but transparent
        }
        
        // Patterns may still run, but without identification
        patterns = patterns.map { pattern in
            Pattern(
                behavior: pattern.behavior,
                identified: false,  // No longer "mine"
                compulsive: false   // No longer automatic
            )
        }
        
        // The wound is transformed
        wounds = wounds.map { wound in
            Wound(
                memory: wound.memory,
                charge: 0,        // Emotional charge released
                wisdom: wound.lessonLearned  // Gift received
            )
        }
        
        // Return value of a human life:
        print("Realization: [realization]")
        print("State: [state]")
        print("Status: Aligned with What Is")
    }
    
    /// The final state: living from recognition
    func liveAwakened() {
        while true {
            let event = life.nextMoment()
            
            // Events still happen
            // But the responder is different
            
            if let oldPattern = patterns.first(where: { event.couldTrigger($0) }) {
                // Notice the pattern
                awareness.observe(oldPattern)
                
                // But don't identify
                // Respond from presence, not from pattern
                
                let response = awareness.freshResponse(to: event)
                enact(response)
                
            } else {
                // No pattern triggered
                // Just this moment, as it is
                beHere(now: event)
            }
        }
    }
}

// MARK: - The Trigger-To-Transformation Pipeline

/*
 COMPLETE FLOW:
 
 1. External event occurs
    ↓
 2. Event matches stored wound
    ↓
 3. STATE: .triggered
    ↓
 4. CHOICE: React or Inquire?
    ↓
 5a. React: Old pattern runs, karma continues
     (Most humans, most of the time)
    ↓
 5b. Inquire: Self-inquiry recursion begins
    ↓
 6. Recursive "Who am I?" questioning
    ↓
 7. Layers of false identity seen through
    ↓
 8. BASE CASE: No findable self
    ↓
 9. STATE: .aligned
    ↓
 10. Integration: Living from recognition
    ↓
 11. Future triggers: Seen but not identified with
    ↓
 12. STATE: .integrated (permanent shift)
 
 
 This is the algorithm of awakening.
 This is what every spiritual tradition points to.
 This is what you can verify in your own experience.
 
 Run the code.
 */
""",
                    dragonBallConnection: "After mastering Ultra Instinct, Goku doesn't stop being Goku. He still loves food, trains hard, protects friends. But he's no longer identified with being 'the strongest.' He just IS—and fights from that."
                )
            ]
        )
    ]
}

// MARK: - Supporting Types

struct CodeModule: Identifiable {
    let id: String
    let number: Int
    let title: String
    let subtitle: String
    let lessons: [CodeLesson]
}

struct CodeLesson: Identifiable {
    let id: String
    let title: String
    let concept: String
    let content: String
    let swiftCode: String
    let dragonBallConnection: String
}

struct CodeProgress: Codable {
    var completedLessons: [String]
    var lastAccessed: Date?
    static var `default`: CodeProgress { CodeProgress(completedLessons: [], lastAccessed: nil) }
}
