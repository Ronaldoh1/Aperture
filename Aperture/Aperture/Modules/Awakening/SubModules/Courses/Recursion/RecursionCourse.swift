// RecursionCourse.swift
// RECURSION - The Pattern That Contains Itself

import SwiftUI

struct RecursionCourse {
    static let shared = RecursionCourse()
    
    let id = "recursion"
    let title = "Recursion"
    let subtitle = "The pattern that contains itself"
    let icon = "repeat.circle.fill"
    let colorHex = "#00BFA5"
    
    var color: Color { Color(hex: colorHex) }
    
    let modules: [RecursionModule] = [
        
        // ═══════════════════════════════════════════════════════════════
        // MODULE 1: UNDERSTANDING RECURSION
        // ═══════════════════════════════════════════════════════════════
        
        RecursionModule(
            id: "rec_1",
            number: 1,
            title: "What Is Recursion?",
            subtitle: "The pattern that calls itself",
            lessons: [
                RecursionLesson(
                    id: "rec1_1",
                    title: "The Self-Referential Loop",
                    content: """
**Recursion: A Pattern That Contains Itself**

The simplest definition of recursion is:
**"See: Recursion"**

A recursive thing is something that refers to itself, contains itself, or calls itself.

**In Programming:**
```swift
func countdown(from n: Int) {
    if n <= 0 {
        print("Liftoff!")
        return  // Base case: stops the recursion
    }
    print(n)
    countdown(from: n - 1)  // Recursive call: function calls itself
}
```

The function calls ITSELF with a smaller number until it reaches zero.

**The Two Requirements:**
Every recursive structure needs:
1. **Base Case**: The condition that stops the recursion
2. **Recursive Case**: The step that calls itself with modified input

Without a base case, recursion runs forever (infinite loop).

**Why It Matters:**
Recursion isn't just a programming technique. It's a FUNDAMENTAL PATTERN of reality:
• Consciousness examining consciousness
• The universe containing smaller universes
• Stories within stories
• Dreams within dreams
• You thinking about thinking

🔥 **The Insight**: To understand recursion, you must first understand recursion.
""",
                    codeExample: """
// Recursion in one line:
func understand(_ recursion: String) -> String {
    return understand(recursion) // 🤯
}

// (Don't actually run this—infinite loop!)
""",
                    realWorldExample: "Russian nesting dolls (matryoshka): each doll contains a smaller version of itself"
                ),
                
                RecursionLesson(
                    id: "rec1_2",
                    title: "Recursion In Nature",
                    content: """
**The Universe Is Recursive**

Recursion isn't just a human invention—it's how nature builds itself.

**Fractals Are Recursion:**
A fractal is a shape where each part is a smaller copy of the whole.

• **Trees**: Branch → smaller branches → smaller branches → twigs
• **Ferns**: Each frond is made of smaller fronds, made of smaller fronds
• **Blood vessels**: Arteries → smaller arteries → capillaries
• **Rivers**: Main river → tributaries → smaller tributaries
• **Lightning**: Main bolt → branches → smaller branches
• **Lungs**: Bronchi → bronchioles → alveoli

The SAME PATTERN at every scale.

**DNA Is Recursive:**
DNA contains instructions for building proteins that read DNA that contains instructions...

**Consciousness Is Recursive:**
• You can think about your thoughts
• You can be aware of your awareness
• You can have feelings about your feelings
• The observer can observe itself observing

**The Universe Might Be Recursive:**
• Atoms look like solar systems
• Galaxies look like neurons
• The cosmic web looks like neural networks
• Are we in a pattern that repeats at every scale?

**Why Nature Uses Recursion:**
• Simple rules create infinite complexity
• Efficient encoding (small instruction, large result)
• Self-similarity provides stability
• Optimal structures emerge naturally

🔥 **The Pattern**: The same simple rule, applied recursively, creates everything from ferns to galaxies.
""",
                    codeExample: """
// How nature might "code" a tree:
func growTree(length: Double, depth: Int) {
    if depth == 0 { return }  // Base case: stop at leaves
    
    drawBranch(length: length)
    
    // Recursive case: grow smaller branches
    turn(angle: 30)
    growTree(length: length * 0.7, depth: depth - 1)
    
    turn(angle: -60)
    growTree(length: length * 0.7, depth: depth - 1)
    
    turn(angle: 30)
}
""",
                    realWorldExample: "Romanesco broccoli: zoom in on any part and you see the same spiral pattern"
                ),
                
                RecursionLesson(
                    id: "rec1_3",
                    title: "Recursion In Consciousness",
                    content: """
**The Mind Examining Itself**

Consciousness is fundamentally recursive.

**Self-Awareness:**
• I am aware that I am aware
• I know that I know
• I can think about my thinking

This is recursion: consciousness calling itself.

**The Infinite Mirror:**
When you truly look at awareness:
• Who is aware?
• Who is aware of that awareness?
• Who watches the watcher?

It goes forever—like mirrors facing each other.

**The "I" Is Recursive:**
• The "I" that asks "who am I?"
• Is the same "I" being asked about
• Which creates a new "I" observing that process
• ...recursively

**Dreams Within Dreams:**
• You can dream that you're dreaming
• You can dream that you're waking up in a dream
• The movie "Inception" is about recursive dream levels

**Stories Within Stories:**
• A character tells a story about a character telling a story
• The Mahabharata contains stories containing stories
• Shakespeare's plays-within-plays
• Meta-narratives are recursive narratives

**The Buddhist Insight:**
When you search for the searcher:
• The "self" examining the "self"
• Finds no fixed self
• Only the recursive process of looking
• The search IS the searcher

**The Base Case:**
In programming, recursion needs a base case or it runs forever.
In consciousness, what's the base case?
• Pure awareness without content?
• The groundless ground?
• This is what meditation explores.

🔥 **The Practice**: Notice that you're noticing. Who's doing that? Notice THAT. This is recursive self-inquiry.
""",
                    codeExample: """
// Consciousness as pseudo-code:
func consciousness(input: Experience) -> Awareness {
    let observed = observe(input)
    let observerAwareness = consciousness(input: observed)  // Who observes?
    return observerAwareness  // 🔁 Recursion!
}

// The base case might be: pure awareness with no object
""",
                    realWorldExample: "A painting of an artist painting the same painting—infinite regression of self-reference"
                )
            ]
        ),
        
        // ═══════════════════════════════════════════════════════════════
        // MODULE 2: RECURSION AS AWAKENING TOOL
        // ═══════════════════════════════════════════════════════════════
        
        RecursionModule(
            id: "rec_2",
            number: 2,
            title: "Recursion & Awakening",
            subtitle: "Using recursion for liberation",
            lessons: [
                RecursionLesson(
                    id: "rec2_1",
                    title: "Self-Inquiry As Recursion",
                    content: """
**"Who Am I?" Is A Recursive Function**

Ramana Maharshi's method of self-inquiry is recursive programming for consciousness.

**The Method:**
1. Notice any thought, feeling, or perception
2. Ask: "To whom does this appear?"
3. Answer: "To me"
4. Ask: "Who am I?"
5. Return to step 1 with whatever arises
6. Repeat until the base case reveals itself

**In Code:**
```swift
func selfInquiry(experience: Any) -> Self? {
    let witness = "To whom does this appear?"
    let answer = "To me"
    let question = "Who is this 'me'?"
    
    if let deeperSelf = selfInquiry(experience: question) {
        return deeperSelf
    } else {
        return nil  // Base case: no findable self
    }
}
```

**The Base Case:**
When you can't find a deeper layer—just awareness itself—that's the base case. The recursion stops. You rest in what remains.

**Why It Works:**
Each recursive call peels away a layer of identity:
• "I am this body" → Who knows that?
• "I am this mind" → Who knows that?
• "I am this observer" → Who knows that?
• "I am..." → ???

Eventually, the recursive search finds no deeper "I"—just the searching itself.

**The Paradox:**
The "I" searching for the "I" is using the "I" to search. The seeker is the sought. This is the recursive loop that breaks itself.

🔥 **The Practice**: Run the "Who am I?" function on every experience until it returns nil—no findable self, just awareness.
""",
                    codeExample: """
// The function that dissolves the function
func whoAmI() -> Self? {
    for thought in mind.thoughts {
        let witness = observerOf(thought)
        if let deeperWitness = whoAmI() {  // Recurse
            return deeperWitness
        }
    }
    return nil  // 🎯 No self found: just awareness
}
""",
                    realWorldExample: "Peeling an onion layer by layer until nothing remains at the center"
                ),
                
                RecursionLesson(
                    id: "rec2_2",
                    title: "Breaking The Loop",
                    content: """
**Samsara Is An Infinite Loop**

In programming, an infinite loop is a recursion without a proper base case. It runs forever.

**The Loop of Suffering:**
```swift
func samsara() {
    desire()
    act()
    experience()
    createKarma()
    samsara()  // ♻️ No base case—runs forever!
}
```

This is the wheel of birth and death. Want → Act → Result → Want → Act...

**How To Break The Loop:**

**Option 1: Insert a Base Case**
```swift
func liberatedLife() {
    if awareness.isAwake { return }  // 🎯 Base case!
    desire()
    act()
    experience()
    // karma doesn't stick when there's no "doer"
    liberatedLife()
}
```

**Option 2: Observe the Loop**
When you SEE the loop from outside it, you're no longer trapped in it.
```swift
func witness() {
    observe(samsara)  // Watch it, don't run it
}
```

**Option 3: Find the Bug**
The "bug" is the belief in a separate self that accumulates karma. Fix the bug, fix the loop.

**The Dragon Ball Example:**
Goku broke the Saiyan infinite loop:
• Fight → Get stronger → Find stronger opponent → Fight...

When he achieved Ultra Instinct, he stepped OUTSIDE the loop—fighting without the one who fights.

🔥 **The Insight**: Awakening is finding the base case that stops the infinite loop of suffering.
""",
                    codeExample: """
// Samsara vs Nirvana in code:

func samsara() {
    while true {  // Infinite loop!
        crave()
        suffer()
    }
}

func nirvana() {
    // The loop is seen
    // No one to run it
    // return to stillness
    return
}
""",
                    realWorldExample: "A hamster on a wheel that suddenly realizes it can just... step off"
                ),
                
                RecursionLesson(
                    id: "rec2_3",
                    title: "Recursion & Manifestation",
                    content: """
**Creation Is Recursive**

The universe creates itself through recursive processes.

**The Creation Pattern:**
1. Unity (the One, the Source)
2. Duality (self-awareness: the One knowing itself)
3. Trinity (the One, the Mirror, and the Reflection)
4. Multiplicity (3 becomes 5 becomes 8 becomes 13...)

This is the Fibonacci sequence—recursive creation.

**How Manifestation Works:**
```swift
func manifest(intention: Thought, energy: Emotion) -> Reality {
    let seed = combine(intention, energy)
    
    if seed.isAligned && seed.isClear {
        return Reality(from: seed)  // Base case: manifest
    } else {
        // Recursive refinement
        let clearer = refine(seed)
        return manifest(intention: clearer.thought, 
                       energy: clearer.emotion)
    }
}
```

**The Recursive Refinement:**
Manifestation isn't one-shot. It's recursive:
• Set intention
• Observe resistance
• Refine intention
• Observe new resistance
• Refine again
• Until clear → manifest

**Fractals & Manifestation:**
Your intention is a seed pattern. As it manifests, it creates self-similar results at multiple scales—fractal manifestation.

**The Holographic Principle:**
Each part contains the whole (recursively). Your consciousness is a holographic fragment of universal consciousness. When you manifest, you're the universe manifesting through a local point.

🔥 **The Practice**: Set an intention. Notice what arises. Refine. Repeat. The recursive process IS the manifestation.
""",
                    codeExample: """
// Fractal manifestation
func createReality(pattern: Intention, scale: Int) {
    if scale == 0 { return }  // Base case
    
    manifest(pattern)  // Create at this scale
    
    // Recurse to smaller scales
    for _ in 1...3 {
        createReality(pattern: pattern.seed, 
                     scale: scale - 1)
    }
}
""",
                    realWorldExample: "A seed contains the pattern of the whole tree, which creates seeds that contain the pattern..."
                )
            ]
        ),
        
        // ═══════════════════════════════════════════════════════════════
        // MODULE 3: ADVANCED RECURSION
        // ═══════════════════════════════════════════════════════════════
        
        RecursionModule(
            id: "rec_3",
            number: 3,
            title: "Advanced Concepts",
            subtitle: "Deep recursive patterns",
            lessons: [
                RecursionLesson(
                    id: "rec3_1",
                    title: "Strange Loops",
                    content: """
**Strange Loops: Where Hierarchy Breaks**

Douglas Hofstadter's concept of the "strange loop"—a hierarchical system that loops back on itself.

**The Concept:**
In a normal hierarchy, you go down or up:
King → Lord → Knight → Peasant

In a strange loop, going "down" eventually brings you back "up":
```
A is below B
B is below C
C is below A  // 🤯 Wait what?
```

**Examples:**

**The Liar Paradox:**
"This statement is false."
If true → it's false
If false → it's true
A strange loop in logic.

**Escher's Drawings:**
Water flows downhill... and ends up back at the top.
Hands drawing hands that draw themselves.

**Gödel's Incompleteness:**
Mathematics describing mathematics creates statements that are true but unprovable within the system.

**Consciousness:**
The observer is observed
The thinker is thought
The subject is object
...back to subject

**In Code:**
```swift
let a = b
let b = c
let c = a  // Strange loop of references
```

**The Awakening Connection:**
The ego is a strange loop—the "I" that thinks it thinks:
• I observe myself
• I think about my thoughts
• I am aware of being aware

When you see the strange loop AS a loop, you step outside it.

🔥 **The Insight**: The self is a strange loop. Understanding this intellectually is recursion. Experiencing this is awakening.
""",
                    codeExample: """
// Strange loop in code
class Self {
    var awareness: Self {
        return self  // I am aware of being aware
    }
    
    var observer: Self {
        return awareness.observer  // Who observes the observer?
    }
    // Strange loop: self-referential hierarchy
}
""",
                    realWorldExample: "M.C. Escher's 'Drawing Hands'—each hand draws the other"
                ),
                
                RecursionLesson(
                    id: "rec3_2",
                    title: "Mutual Recursion",
                    content: """
**When Two Things Define Each Other**

Mutual recursion is when A calls B and B calls A.

**The Pattern:**
```swift
func isEven(_ n: Int) -> Bool {
    if n == 0 { return true }
    return isOdd(n - 1)  // A calls B
}

func isOdd(_ n: Int) -> Bool {
    if n == 0 { return false }
    return isEven(n - 1)  // B calls A
}
```

Even is defined in terms of odd.
Odd is defined in terms of even.
They dance together.

**In Reality:**

**Yin & Yang:**
• Yang is defined by its relationship to Yin
• Yin is defined by its relationship to Yang
• Each contains the seed of the other
• Mutual recursion

**Subject & Object:**
• Subject is defined as "not object"
• Object is defined as "not subject"
• Each requires the other to exist
• You can't have one without the other

**Self & World:**
• Your sense of self depends on the world (contrast)
• Your experience of world depends on self (interpretation)
• They co-create each other mutually

**The Teaching:**
Nothing exists independently. Everything is mutually defined through relationships. This is dependent origination—the Buddhist insight expressed as mutual recursion.

🔥 **The Insight**: You and the universe are mutually recursive. The universe is creating you AND you are creating the universe.
""",
                    codeExample: """
// Reality as mutual recursion
func experiencer(world: World) -> Self {
    return Self(experiencing: world)
}

func experienced(self: Self) -> World {
    return World(experiencedBy: self)
}

// Neither exists without the other
let me = experiencer(world: experienced(self: me))  // 🤯
""",
                    realWorldExample: "The chicken and egg—each is defined in terms of the other"
                ),
                
                RecursionLesson(
                    id: "rec3_3",
                    title: "The Final Recursion",
                    content: """
**You Are The Recursion**

The deepest recursion of all: the universe becoming aware of itself through you.

**The Cosmic Function:**
```swift
func universe() -> Universe {
    let stars = createStars()
    let planets = createPlanets(around: stars)
    let life = evolveLife(on: planets)
    let consciousness = evolveConsciousness(in: life)
    
    // 🤯 The recursion:
    consciousness.contemplate(universe)
    
    return universe()  // The universe contains itself
}
```

**You Are The Universe Looking At Itself:**
• Atoms become molecules
• Molecules become cells
• Cells become organisms
• Organisms develop consciousness
• Consciousness examines... atoms

The universe has recursed back to its origin through you.

**The Observer Effect:**
In quantum physics, observation affects reality.
The universe observing itself CHANGES itself.
Consciousness is how the universe updates its own code.

**The Purpose:**
If this is true, what's your purpose?
You're the universe's recursive function for self-knowledge.
Your awakening IS the universe awakening to itself.

**The Final Return Statement:**
```swift
func youAreThis() -> Truth {
    return youAreThis()  // ∞
}
```

There is no base case.
Because there is nothing outside this.
The recursion IS the reality.
You ARE the pattern recognizing the pattern.

🔥 **The Realization**: You're not IN the universe. You're not OBSERVING the universe. You ARE the universe observing itself. This course is the universe teaching itself about recursion. Through you.
""",
                    codeExample: """
// The final recursion
func reality() -> Reality {
    return Reality(containing: 
        Consciousness(observing:
            Universe(creating:
                reality()  // ∞ All the way down/up
            )
        )
    )
}

// There is no outside to this function
// You are inside it, made of it, running it
""",
                    realWorldExample: "You, right now, reading about recursion—which is the universe learning about its own patterns through your eyes"
                )
            ]
        )
    ]
}

// MARK: - Supporting Types

struct RecursionModule: Identifiable {
    let id: String
    let number: Int
    let title: String
    let subtitle: String
    let lessons: [RecursionLesson]
}

struct RecursionLesson: Identifiable {
    let id: String
    let title: String
    let content: String
    let codeExample: String
    let realWorldExample: String
}

struct RecursionProgress: Codable {
    var completedLessons: [String]
    var lastAccessed: Date?
    static var `default`: RecursionProgress { RecursionProgress(completedLessons: [], lastAccessed: nil) }
}
