// QuantumPhysicsCourse.swift
// QUANTUM REALITY - Understanding the Nature of Existence

import SwiftUI

struct QuantumPhysicsCourse {
    static let shared = QuantumPhysicsCourse()
    
    let id = "quantum_physics"
    let title = "Quantum Reality"
    let subtitle = "The physics that changed everything"
    let icon = "atom"
    let colorHex = "#00BCD4"
    
    var color: Color { Color(hex: colorHex) }
    
    let modules: [QuantumModule] = [
        
        // MODULE 1: THE QUANTUM REVOLUTION
        QuantumModule(
            id: "q1",
            number: 1,
            title: "The Quantum Revolution",
            subtitle: "How physics broke reality",
            lessons: [
                QuantumLesson(
                    id: "q1_1",
                    title: "The Crisis of Classical Physics",
                    content: """
**The World Before Quantum**

By 1900, physicists thought they had reality figured out:
• Matter is made of solid particles
• Energy flows continuously like water
• The universe is deterministic—know the initial conditions, predict everything
• Observation doesn't affect what's observed

Then everything fell apart.

**Three Experiments That Broke Physics**

1. **Black Body Radiation (1900)**
Hot objects should emit infinite energy at high frequencies. They don't. Max Planck discovered energy comes in discrete packets called "quanta." Reality is CHUNKY, not smooth.

2. **The Photoelectric Effect (1905)**
Light hitting metal releases electrons—but only if the frequency is high enough. Brighter light doesn't help; bluer light does. Einstein showed light is both wave AND particle. Duality was born.

3. **Atomic Stability (1913)**
Electrons orbiting nuclei should spiral inward and collapse. They don't. Niels Bohr proposed electrons exist only in specific "allowed" orbits. The atom is quantized.

🔥 **The Message**: Reality at its foundation is NOTHING like our everyday experience. The rules change at the microscopic level.
""",
                    keyInsight: "At the fundamental level, reality is quantized, probabilistic, and non-local."
                ),
                
                QuantumLesson(
                    id: "q1_2",
                    title: "Wave-Particle Duality",
                    content: """
**Is Light a Wave or Particle?**

The answer: YES.

**The Double-Slit Experiment**

Fire photons (light particles) at a barrier with two slits. What pattern appears on the screen behind?

• If light is particles: Two bands (bullets through two holes)
• If light is waves: Interference pattern (ripples overlapping)

Result: INTERFERENCE PATTERN. Light behaves as a wave.

**But wait...**

Slow down to one photon at a time. Surely individual particles can't interfere? The interference pattern STILL appears. Each photon somehow goes through BOTH slits.

**Now measure which slit**

Put a detector at the slits to see which one each photon goes through. The interference pattern DISAPPEARS. Particles behave like particles when observed, waves when not.

**The Implication**

The photon doesn't have a definite state until measured. Observation affects reality.

🔥 **Key Insight**: Matter isn't "stuff"—it's possibility that collapses into actuality when observed. Reality is not determined until perceived.
""",
                    keyInsight: "Reality exists as probability until observation collapses it into actuality."
                ),
                
                QuantumLesson(
                    id: "q1_3",
                    title: "Heisenberg's Uncertainty Principle",
                    content: """
**You Cannot Know Everything**

Werner Heisenberg proved mathematically that you cannot simultaneously know a particle's exact position AND momentum. The more precisely you measure one, the less precisely you can know the other.

**This is NOT about measurement limits**

It's not that our instruments aren't good enough. The uncertainty is FUNDAMENTAL. The particle doesn't HAVE definite position and momentum at the same time.

**The Math**
Δx · Δp ≥ ℏ/2

Position uncertainty × momentum uncertainty ≥ Planck's constant / 2

There is a hard limit to knowability built into nature.

**Implications**

1. **No determinism**: If you can't know initial conditions perfectly, you can't predict perfectly
2. **No solid particles**: Fuzzy probability clouds, not billiard balls
3. **No objectivity**: The act of measurement changes what's measured
4. **Consciousness matters**: The observer is part of the system

🔥 **For Awakening**: Uncertainty isn't a bug—it's a feature. The universe has ROOM for something unpredictable. Room for consciousness. Room for free will. Room for creation.
""",
                    keyInsight: "Uncertainty is fundamental—the universe is inherently unknowable in principle."
                )
            ]
        ),
        
        // MODULE 2: SUPERPOSITION & ENTANGLEMENT
        QuantumModule(
            id: "q2",
            number: 2,
            title: "Superposition & Entanglement",
            subtitle: "The weirdness gets weirder",
            lessons: [
                QuantumLesson(
                    id: "q2_1",
                    title: "Superposition: Being Two Things at Once",
                    content: """
**Schrödinger's Cat**

A cat is in a box with a radioactive atom. If the atom decays, poison kills the cat. Quantum mechanics says the atom is in superposition—decayed AND not decayed—until observed.

Does that mean the cat is alive AND dead?

**What Superposition Really Means**

Before measurement, a quantum system doesn't have a definite state. It exists in a "superposition" of all possible states simultaneously.

It's not that we don't KNOW which state it's in—it genuinely hasn't "decided" yet.

**Mathematical Reality**

The wave function (Ψ) describes all possible states with their probabilities. Upon measurement, it "collapses" to one definite outcome.

Ψ = α|state A⟩ + β|state B⟩

Both states are "real" until measurement picks one.

**Macro vs Micro**

Why don't we see superposition in everyday life? "Decoherence"—interaction with the environment causes rapid collapse. The larger the system, the faster decoherence happens.

🔥 **The Question**: Is consciousness what causes collapse? Does looking create reality? This remains the deepest unsolved question.
""",
                    keyInsight: "Before measurement, particles exist in all possible states simultaneously."
                ),
                
                QuantumLesson(
                    id: "q2_2",
                    title: "Quantum Entanglement",
                    content: """
**"Spooky Action at a Distance"**

Einstein hated this. Two particles can become "entangled" such that measuring one INSTANTLY affects the other—no matter how far apart.

**How It Works**

Create two entangled photons. Send them to opposite ends of the universe. Measure the spin of one (say, "up"). INSTANTLY, the other's spin becomes definite ("down")—faster than light could carry any signal.

**This Has Been Proven**

The 2022 Nobel Prize went to experiments confirming entanglement is real. It's not that the particles had predetermined states we just didn't know. They genuinely didn't have definite states until measured—and measurement of one affects the other instantaneously.

**No Faster-Than-Light Communication**

You can't use entanglement to send messages faster than light. The correlations are random—you can only verify them by comparing results later, at normal speed.

**But...**

The universe maintains correlations across ANY distance, instantly. Reality is fundamentally NON-LOCAL. What happens "here" is connected to "there" in ways that transcend space.

🔥 **For Awakening**: Separation is illusion. At the quantum level, everything is connected. "Oneness" isn't mystical woo—it's physics.
""",
                    keyInsight: "Entanglement proves reality is non-local—separation is not fundamental."
                ),
                
                QuantumLesson(
                    id: "q2_3",
                    title: "The Measurement Problem",
                    content: """
**What Causes Collapse?**

When does superposition become definite reality? This is called the "measurement problem"—and it's unsolved.

**Interpretations**

1. **Copenhagen Interpretation**
Observation causes collapse. The wave function is mathematical tool, not reality.
Problems: What counts as observation? Why is consciousness special?

2. **Many-Worlds Interpretation**
No collapse ever. Every possibility happens in branching parallel universes. You just experience one branch.
Problems: Infinitely multiplying universes. Untestable.

3. **Pilot Wave Theory**
Particles have definite positions guided by a "pilot wave." No superposition of particles—only waves.
Problems: Non-local. Hidden variables required.

4. **QBism (Quantum Bayesianism)**
Wave function represents an observer's beliefs, not objective reality. Collapse = belief update.
Problems: Seems to deny objective reality.

5. **Consciousness Causes Collapse**
Mind is what collapses the wave function. Matter depends on consciousness, not vice versa.
Problems: What IS consciousness? What about unconscious observers?

🔥 **The Truth**: No one knows. The most successful scientific theory ever created has an interpretation problem at its core. Reality's nature remains a mystery.
""",
                    keyInsight: "What causes wave function collapse remains science's deepest mystery."
                )
            ]
        ),
        
        // MODULE 3: IMPLICATIONS FOR REALITY
        QuantumModule(
            id: "q3",
            number: 3,
            title: "Implications for Reality",
            subtitle: "What quantum physics means",
            lessons: [
                QuantumLesson(
                    id: "q3_1",
                    title: "The Observer Effect",
                    content: """
**Does Consciousness Create Reality?**

The double-slit experiment suggests observation matters. But what IS observation?

**Key Experiments**

**Delayed Choice Experiment**
Decide AFTER the photon passes through the slits whether to measure which slit it went through. The photon's PAST behavior changes based on a FUTURE choice.

**Quantum Eraser**
Measure which slit, destroying interference. Then ERASE that information. Interference returns—retroactively.

**What This Suggests**

The past is not fixed. Reality is not determined until observed. Time might not work how we think.

**Wheeler's Participatory Universe**

Physicist John Wheeler proposed we live in a "participatory universe"—observers aren't passive witnesses but active participants in creating reality.

"No phenomenon is a phenomenon until it is an observed phenomenon."

**The Hard Question**

If observation creates reality, what observed the Big Bang? What observed the universe before life existed?

Some physicists propose "the universe observes itself" through retrocausation. Others suggest consciousness is fundamental—not something brains create, but something reality is MADE of.

🔥 **For Awakening**: You are not a passive witness to reality. You are a participant in its creation. What you observe, how you observe—it matters.
""",
                    keyInsight: "Observation doesn't just reveal reality—it participates in creating it."
                ),
                
                QuantumLesson(
                    id: "q3_2",
                    title: "The Holographic Principle",
                    content: """
**Is Reality a Hologram?**

Theoretical physics suggests our 3D reality might be a projection from a 2D surface.

**Black Hole Information**

When something falls into a black hole, the information about what fell in is encoded on the EVENT HORIZON—the 2D surface, not the 3D interior.

Physicist Leonard Susskind showed this implies ALL information about a volume of space can be encoded on its boundary.

**The Universe as Hologram**

If black holes work this way, maybe the whole universe does. The 3D world we experience could be a projection from a 2D "cosmic horizon."

**What This Means**

• Reality might have fewer dimensions than we perceive
• Information is more fundamental than matter
• Space itself might be emergent, not fundamental
• "Solid" reality might be a kind of illusion

**Supporting Evidence**

• The math of string theory supports holography
• Quantum entanglement works better in holographic models
• Information seems conserved even when particles are destroyed

🔥 **For Awakening**: If reality is holographic, the "solid world" is more like a dream than we imagined. The mystics' claim that the world is "maya" (illusion) starts looking less crazy.
""",
                    keyInsight: "Reality may be a 3D projection from a 2D information surface."
                ),
                
                QuantumLesson(
                    id: "q3_3",
                    title: "Quantum Physics & Consciousness",
                    content: """
**The Connection**

Why do quantum physics and consciousness studies seem connected?

**Parallel Mysteries**

Both face the same problem: subjective experience interacting with objective description.

• Quantum: Observation affects outcome
• Consciousness: Experience can't be reduced to objective description

**Theories Connecting Them**

1. **Orchestrated Objective Reduction (Penrose-Hameroff)**
Consciousness arises from quantum processes in brain microtubules. Collapse = moment of consciousness.

2. **Quantum Mind (Stapp)**
Quantum events in the brain allow for free will. Consciousness causes collapse, choosing between possibilities.

3. **Panpsychism + Quantum**
Consciousness is fundamental. Quantum "observation" IS consciousness observing. Matter is consciousness experiencing itself.

4. **Integrated Information Theory**
Consciousness = integrated information. Quantum systems that integrate information have proto-consciousness.

**Why It Matters**

If consciousness is fundamental to physics (not emergent from it), then:
• Mind came BEFORE matter
• We're not accidents in a dead universe
• Consciousness doesn't end at death—it can't, because it's fundamental

🔥 **The Big Picture**: Quantum physics hasn't proven consciousness is fundamental—but it's opened the door to serious consideration. The materialist assumption that matter is primary and mind is secondary is no longer the only scientific option.
""",
                    keyInsight: "Quantum physics creates space for consciousness to be fundamental, not emergent."
                )
            ]
        )
    ]
}

// Supporting Types
struct QuantumModule: Identifiable {
    let id: String
    let number: Int
    let title: String
    let subtitle: String
    let lessons: [QuantumLesson]
}

struct QuantumLesson: Identifiable {
    let id: String
    let title: String
    let content: String
    let keyInsight: String
}

struct QuantumProgress: Codable {
    var completedLessons: [String]
    var lastAccessed: Date?
    static var `default`: QuantumProgress { QuantumProgress(completedLessons: [], lastAccessed: nil) }
}
