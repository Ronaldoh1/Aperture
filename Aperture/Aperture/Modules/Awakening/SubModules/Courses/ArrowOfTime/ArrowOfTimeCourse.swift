// ArrowOfTimeCourse.swift
// THE ARROW OF TIME - Why Time Flows One Way
// From entropy to consciousness to why every moment matters

import SwiftUI

// MARK: - Course Data

struct ArrowOfTimeCourse {
    static let shared = ArrowOfTimeCourse()
    
    let id = "arrow_of_time"
    let title = "The Arrow of Time"
    let subtitle = "Why cups shatter but never unshatter"
    let icon = "arrow.right.circle.fill"
    let colorHex = "#7C4DFF"
    
    var color: Color { Color(hex: colorHex) }
    
    let modules: [ArrowModule] = [
        
        // ═══════════════════════════════════════════════════════════════
        // MODULE 1: THE PARADOX
        // ═══════════════════════════════════════════════════════════════
        ArrowModule(
            id: "at1",
            number: 1,
            title: "The Paradox of Time",
            subtitle: "Physics allows it both ways—reality doesn't",
            icon: "questionmark.circle.fill",
            lessons: [
                ArrowLesson(
                    id: "at1_1",
                    title: "The Shattered Cup",
                    content: """
**The Experiment You've Done a Thousand Times**

You drop a cup. It shatters on the floor. Pieces scatter across the tile.

Now wait for it to reassemble.

You'll be waiting a long time. The number of years you'd have to wait has more digits than there are atoms in the observable universe.

**But Here's the Strange Part**

Nothing in physics forbids it.

Not gravity. Not electromagnetism. Not quantum mechanics. Not the nuclear forces.

Run the equations backwards—they work perfectly. Every fundamental law of physics is time-symmetric.

A cup *can* shatter. A cup *can also* unshatter. The math doesn't care which direction you play the film.

Yet you have NEVER, not once in your entire life, seen a shattered cup spontaneously reassemble itself.

🔥 **Why not?**

This isn't a minor puzzle. Arthur Eddington, the British astrophysicist who helped prove Einstein's relativity, gave this mystery a name in 1927.

He called it **The Arrow of Time**.

He said: "The distinction between past and future holds the SUPREME POSITION among the laws of nature."

Not gravity. Not quantum mechanics. The arrow of time.

Almost a century later, it remains unsolved.
""",
                    keyInsight: "Every law of physics works both directions—yet reality stubbornly moves one way.",
                    animationType: .shatteringCup
                ),
                
                ArrowLesson(
                    id: "at1_2",
                    title: "The Question Behind the Question",
                    content: """
**The Obvious Answer That Isn't**

"Obviously time moves forward. Obviously the past is different from the future."

But that's not an explanation. That's a restatement of the mystery.

The question isn't WHETHER time has a direction. Clearly, it does.

The question is WHY.

**What Makes This Truly Strange**

Look at the actual laws—the equations that govern how particles move and fields interact. They are ALL reversible:

• **Newton's laws of motion** — Perfectly reversible
• **Maxwell's equations** (electromagnetism) — Perfectly reversible  
• **Einstein's general relativity** — Reversible
• **Schrödinger equation** (quantum mechanics) — Reversible
• **Strong & weak nuclear forces** — Reversible (with one tiny exception)

A photon can be emitted by an atom or absorbed by an atom. The math treats both as equally valid.

A planet can orbit clockwise or counterclockwise. Physics doesn't prefer one direction.

**So If All Laws Are Reversible...**

Why do we see:
- Cups shatter but never reassemble?
- Ice cubes melt but warm water never spontaneously forms ice?
- Smoke spread but never gather back?

Something is happening at the macroscopic level that the microscopic laws don't demand.

🔥 **The answer isn't physics. It's statistics.**
""",
                    keyInsight: "Time's direction emerges from probability, not from the fundamental laws themselves.",
                    animationType: .reversibleEquations
                ),
                
                ArrowLesson(
                    id: "at1_3",
                    title: "Boltzmann's Revelation",
                    content: """
**The Man Who Saw Through Time**

Ludwig Boltzmann, Austrian physicist, 1870s. He was trying to understand thermodynamics—the study of heat and energy—from the perspective of atoms and molecules.

He realized something profound about **entropy**.

Entropy isn't really about "disorder" in some vague sense.

**It's about counting.**

Specifically: How many different microscopic arrangements of particles can produce the same macroscopic appearance?

**The Deck of Cards**

There's ONE arrangement sorted by suit and rank. Clubs ace to king, then diamonds, then hearts, then spades.

But there are TRILLIONS upon TRILLIONS of arrangements that are shuffled.

If you shuffle a deck, the odds of it landing in perfect sorted order?

**1 in 10⁶⁸**

That's a 1 followed by 68 zeros.

You could shuffle once per second for the entire age of the universe and never see it sorted.

Not because sorting is forbidden—there's no law against it.

**Because there's only ONE sorted arrangement and billions of shuffled ones.**

Probability overwhelms everything.

**Boltzmann's Formula**

S = k log W

S is entropy. W is the number of microstates. k is Boltzmann's constant.

This formula is *engraved on his tombstone* in Vienna. That's how important it is.

🔥 **The shattered cup has HIGH entropy—countless ways for pieces to scatter. The intact cup has LOW entropy—few arrangements where atoms bond correctly. The universe keeps finding disordered states because there are so many more to find.**
""",
                    keyInsight: "Entropy measures probability: ordered states are rare, disordered states are everywhere.",
                    animationType: .cardShuffle
                )
            ]
        ),
        
        // ═══════════════════════════════════════════════════════════════
        // MODULE 2: THE SECOND LAW
        // ═══════════════════════════════════════════════════════════════
        ArrowModule(
            id: "at2",
            number: 2,
            title: "The Supreme Law",
            subtitle: "The one law that cannot be broken",
            icon: "arrow.up.right",
            lessons: [
                ArrowLesson(
                    id: "at2_1",
                    title: "The Second Law of Thermodynamics",
                    content: """
**The Law That Rules Them All**

Rudolph Clausius, German physicist, 1850:

> "In an isolated system, entropy never decreases. It either stays the same or increases. Always. No exceptions."

This is the Second Law of Thermodynamics.

Eddington's verdict:

> "If someone points out that your pet theory of the universe disagrees with the Second Law of Thermodynamics, I can give you no hope. There is nothing for it but to collapse in deepest humiliation."

He wasn't exaggerating.

**Every observation. Every experiment. Every process we've ever seen obeys the Second Law.**

Entropy increases. The arrow points forward.

**Why Isn't Everything Gray Soup?**

But wait—if entropy always increases, if systems always move toward disorder...

Why isn't the universe already at maximum entropy?

Why isn't everything a uniform gray soup of particles at the same temperature?

No structure. No stars. No planets. No life. No cups to drop.

If entropy has been increasing for 13.8 billion years, we should be at equilibrium by now.

**Yet Here We Are**

The universe is FULL of structure. Full of low-entropy configurations:
- Stars burning
- Galaxies swirling  
- Life metabolizing
- Consciousness wondering

**WHY?**

🔥 **The answer: The universe started in an extraordinarily low entropy state. Everything since then—every star that has ignited, every thought you've ever had—is that initial order unwinding like a spring slowly releasing tension.**
""",
                    keyInsight: "We exist because the universe began in an improbably ordered state.",
                    animationType: .entropyIncrease
                ),
                
                ArrowLesson(
                    id: "at2_2",
                    title: "The Past Hypothesis",
                    content: """
**The Wound-Up Spring**

Philosopher David Albert, 2000, gave it a name: **The Past Hypothesis**.

The reason entropy increases toward the future is because entropy was LOWER in the past.

Specifically: Entropy was astonishingly, inexplicably low at the Big Bang.

**And Here's Where It Gets Mysterious**

We don't know why.

We don't know why the universe began in such a low entropy state.

**Roger Penrose's Insight**

The British mathematical physicist argued this low entropy was GRAVITATIONAL.

Counterintuitively: A gas uniformly distributed through space seems disordered. But when you consider gravity, uniform distribution is actually LOW entropy.

Why? Because gravity wants matter to clump—to form stars, black holes, dense structures.

A uniform gas has enormous POTENTIAL to clump. That potential represents order.

As the universe evolves:
- Matter clumps under gravity
- Stars form
- Black holes form  
- Entropy increases

**The Numbers Are Staggering**

Current entropy of observable universe: ~10¹⁰⁴ (Boltzmann units)

Almost all of that is in supermassive black holes—the highest entropy objects in existence.

Maximum possible entropy? ~10¹²³

We are NOWHERE close. The universe still has an incomprehensibly long way to fall toward equilibrium.

🔥 **The spring is still unwinding. The arrow is still pointing. You exist in this brief cosmic window.**
""",
                    keyInsight: "The Big Bang was an impossibly ordered beginning—we're still unwinding from it.",
                    animationType: .cosmicSpring
                ),
                
                ArrowLesson(
                    id: "at2_3",
                    title: "You Are an Entropy Machine",
                    content: """
**But What About Life?**

Doesn't life violate entropy? Living things are organized, structured, ordered.

A baby starts as a single cell and grows into trillions of cells arranged in specific patterns.

Doesn't that DECREASE entropy?

**No. It doesn't.**

Life is a LOCAL entropy decrease PAID FOR by a larger entropy increase elsewhere.

**The Plant Example**

A plant absorbs sunlight—low-entropy energy. Photons from the sun are concentrated, directional, carrying energy in an organized way.

The plant uses that energy to build sugars, construct leaves and roots, grow.

That's a local decrease in entropy. The plant is more ordered than the CO₂ and water it started with.

**But here's the catch:**

The plant radiates HEAT—high-entropy energy. Dispersed, omnidirectional, useless for doing work.

The TOTAL entropy of plant + environment increases. Always.

**You Are a Dissipative Structure**

You eat food (low-entropy chemical energy). You metabolize it, use it to maintain your body, to think, to move.

And you radiate heat. Exhale CO₂. Excrete waste.

The entropy you PRODUCE is far greater than the entropy decrease represented by your organized body.

Sean Carroll, theoretical physicist at Caltech:

> "Every difference between past and future can be traced to the fact that entropy was lower in the past."

🔥 **You are a temporary eddy of order in a universe flowing toward disorder. You exist because the spring hasn't finished unwinding.**
""",
                    keyInsight: "Life doesn't violate entropy—it exploits low-entropy energy to locally decrease disorder while increasing universal entropy.",
                    animationType: .dissipativeStructure
                )
            ]
        ),
        
        // ═══════════════════════════════════════════════════════════════
        // MODULE 3: CONSCIOUSNESS & THE ARROW
        // ═══════════════════════════════════════════════════════════════
        ArrowModule(
            id: "at3",
            number: 3,
            title: "Consciousness & The Arrow",
            subtitle: "Why you remember the past but not the future",
            icon: "brain.head.profile",
            lessons: [
                ArrowLesson(
                    id: "at3_1",
                    title: "Memory Is Entropy",
                    content: """
**The Psychological Arrow**

Think about what memory means.

Every memory you have exists because recording information requires a LOW-ENTROPY state.

Your brain is a recording device. For it to write memories, it needs:
- Structure
- Order
- Systems far from equilibrium

**In a Maximum-Entropy Universe:**

Memory would be impossible.

There would be no difference between past and future because there would be no structure to RECORD differences.

**You Remember the Past Because:**

The past was lower entropy, and that allowed records to form.

**You Don't Remember the Future Because:**

The future is higher entropy, and records can't form running in that direction.

The arrow isn't just thermodynamic—it's PSYCHOLOGICAL.

It's built into your consciousness.

You are made of dissipating order.

**The Deepest Implication**

The fact that you can ASK "why does time flow this way?" is itself a product of that initial improbable state at the beginning of everything.

Consciousness requires the arrow. Without it, there's no experience, no sequence, no story.

🔥 **You are the universe asking itself about time, using the very conditions that make time's direction possible.**
""",
                    keyInsight: "Memory requires low entropy—you remember the past because records form from order, not disorder.",
                    animationType: .memoryFormation
                ),
                
                ArrowLesson(
                    id: "at3_2",
                    title: "Causation Requires The Arrow",
                    content: """
**Why Cause Precedes Effect**

Think about causation—the idea that causes come before effects.

This seems obvious. You flip a switch, THEN the light turns on. You drop a cup, THEN it shatters.

But WHY is this the order?

**The Answer: Entropy**

Cause precedes effect because the past is lower entropy than the future.

You can scramble an egg because eggs are low entropy and scrambled eggs are high entropy.

You can't UNSCRAMBLE an egg because that would require going from high entropy to low—and the universe doesn't do that on macroscopic scales.

Not because it's forbidden.

But because it's so unlikely you'd wait longer than the age of the universe to see it happen once.

**Causation Is Statistical**

The "flow" of causation from cause to effect is really the statistical flow from less probable to more probable states.

We perceive this as "time flowing."

But time doesn't flow. There is no river.

There are just states—macro states with high or low entropy.

And we happen to be in a part of the universe's history where entropy is still increasing. Where the arrow still points from low to high, from ordered beginning to disordered end.

🔥 **Causation isn't a fundamental property of reality—it emerges from probability and initial conditions.**
""",
                    keyInsight: "Cause and effect aren't fundamental—they emerge from the statistical flow toward higher entropy.",
                    animationType: .causationArrow
                ),
                
                ArrowLesson(
                    id: "at3_3",
                    title: "Why Every Moment Matters",
                    content: """
**The Heat Death**

Where is all this going?

Eventually—trillions upon trillions of years from now—the last stars will burn out. The last black holes will evaporate through Hawking radiation.

The universe will reach its final equilibrium: **Heat Death**.

Maximum entropy. Nothing can ever change again. No energy gradients to make anything happen.

Just timeless equilibrium. Particles evenly distributed. Temperature uniform everywhere. Nothing happening. Nothing to change. Forever.

**But We're Not There Yet**

We're still in the brief—cosmically BRIEF—window where:
- The arrow points
- Entropy increases
- Life can flourish
- Minds can wonder why

**This Is Why Every Moment Matters**

The arrow only points one way.

Every moment is unrepeatable. Every memory is precious. Every instant is unique.

Because the spring is unwinding.

And you are alive precisely because it hasn't finished.

**The Final Truth**

You are not just witnessing the arrow of time.

You ARE the arrow of time.

You are patterns in the flow. Temporary structures maintained by the constant influx of low-entropy energy and the constant expulsion of high-entropy waste.

You exist because the universe is out of equilibrium.

You persist because the spring hasn't finished unwinding.

And you wonder about time because you are conscious dissipative structures asking questions about the very conditions that make existence possible.

🔥 **Time doesn't flow. You do. Through a universe slowly unwinding from its improbable beginning. Every second is borrowed from that initial order. Spend it wisely.**
""",
                    keyInsight: "You exist in the brief window where the arrow points. Every moment is borrowed from the initial order of the universe.",
                    animationType: .cosmicPerspective
                )
            ]
        )
    ]
}

// MARK: - Models

struct ArrowModule: Identifiable {
    let id: String
    let number: Int
    let title: String
    let subtitle: String
    let icon: String
    let lessons: [ArrowLesson]
}

struct ArrowLesson: Identifiable {
    let id: String
    let title: String
    let content: String
    let keyInsight: String
    let animationType: ArrowAnimation
}

enum ArrowAnimation {
    case shatteringCup
    case reversibleEquations
    case cardShuffle
    case entropyIncrease
    case cosmicSpring
    case dissipativeStructure
    case memoryFormation
    case causationArrow
    case cosmicPerspective
}
