// TeslaResonanceCourse.swift
// SunFlow: Reignited — Aperture
// "Resonant Awakening: Tesla's Vibrational Keys to Energetic Mastery"
// Premium 9-module course in GodMode

import SwiftUI

// MARK: - Models

struct TeslaLesson: Identifiable {
    let id: String
    let title: String
    let icon: String
    let duration: Int            // minutes
    let body: String
    let practice: String         // guided practice for the lesson
    let journalPrompt: String
}

struct TeslaModule: Identifiable {
    let id: String
    let number: Int
    let emoji: String
    let title: String
    let subtitle: String
    let colorHex: String
    let lessons: [TeslaLesson]
    let quizQuestions: [TeslaQuizQuestion]
    let weeklyExperiment: String // homework
}

struct TeslaQuizQuestion: Identifiable {
    let id: String
    let question: String
    let options: [String]
    let correctIndex: Int
    let explanation: String
}

// MARK: - Progress

struct TeslaProgress {
    var completedLessons: Set<String> = []
    var completedModules: Set<String> = []
    var resonanceScore: Int = 0       // 0-100, increases with practice
    var streak: Int = 0
    private let key = "aperture_tesla_resonance_v1"

    mutating func completeLesson(_ id: String, points: Int = 5) {
        completedLessons.insert(id)
        resonanceScore = min(100, resonanceScore + points)
        save()
    }

    mutating func completeModule(_ id: String) {
        completedModules.insert(id)
        resonanceScore = min(100, resonanceScore + 10)
        save()
    }

    func completionFraction(for module: TeslaModule) -> Double {
        guard !module.lessons.isEmpty else { return 0 }
        let done = module.lessons.filter { completedLessons.contains($0.id) }.count
        return Double(done) / Double(module.lessons.count)
    }

    func save() {
        UserDefaults.standard.set([
            "lessons": Array(completedLessons),
            "modules": Array(completedModules),
            "score": resonanceScore,
            "streak": streak
        ], forKey: key)
    }

    mutating func load() {
        guard let d = UserDefaults.standard.dictionary(forKey: key) else { return }
        completedLessons = Set((d["lessons"] as? [String]) ?? [])
        completedModules = Set((d["modules"] as? [String]) ?? [])
        resonanceScore = (d["score"] as? Int) ?? 0
        streak = (d["streak"] as? Int) ?? 0
    }
}

// MARK: - Course Data

let teslaResonanceCourse: [TeslaModule] = [

    TeslaModule(
        id: "t1_electric_symphony",
        number: 1,
        emoji: "⚡",
        title: "The Electric Symphony",
        subtitle: "Foundations of Vibrational Reality",
        colorHex: "#FFD700",
        lessons: [
            TeslaLesson(
                id: "t1l1",
                title: "Everything Is Frequency",
                icon: "waveform",
                duration: 8,
                body: """
**Tesla's Core Revelation**

"If you want to find the secrets of the universe, think in terms of energy, frequency, and vibration." Tesla didn't mean this metaphorically. He meant it as a literal description of how reality is structured at its foundation.

Matter is not solid. Every particle is a wave. Every atom is vibrating at a specific frequency. The chair you're sitting on is a pattern of vibrating energy that appears solid because your own nervous system vibrates at a frequency that perceives it as solid. Change the frequency, change the perception of reality.

**The Resonance Law**

When two objects vibrate at the same or harmonically related frequencies, they transfer energy without direct contact. A singer hitting a precise pitch can shatter a crystal glass. Not through force — through resonance. The glass receives the frequency, amplifies it internally, and reorganizes.

This is not a metaphor for human experience. It is a description of how human experience actually works. Your emotional state is a frequency. The people and situations that appear in your life resonate with that frequency.

**The Schumann Connection**

Earth vibrates at approximately 7.83 Hz — the Schumann Resonance. Human alpha brainwaves (relaxed, creative awareness) operate in the 8–12 Hz range. Theta (deep meditation, insight) operates at 4–8 Hz. These are not coincidences. They are evolutionary adaptations — the human nervous system tuned to the planet it evolved on.

Modern life — EMF fields, artificial lighting, urban noise — creates interference patterns that disrupt this natural entrainment. Restoring it is not mysticism. It is biological calibration.
""",
                practice: "Daily Frequency Audit: Before sleep, take 3 minutes to identify the dominant emotion you experienced today. Rate it: 1-10 (1 = fear/contraction, 10 = love/expansion). Log it for 7 days and watch your baseline. This is not positive thinking — this is data collection about your broadcast signal.",
                journalPrompt: "What frequency were you broadcasting most today? Not what you wanted to feel — what you actually felt. What events or interactions amplified that frequency?"
            ),
            TeslaLesson(
                id: "t1l2",
                title: "The Ether Tesla Never Abandoned",
                icon: "atom",
                duration: 7,
                body: """
**What Modern Physics Erased**

When Einstein's relativity replaced aether theory in mainstream physics, something was lost in the translation: Tesla's working model of a medium through which energy propagates — the ether. Tesla never accepted relativity's conclusions. He continued designing systems based on the ether model until his death.

Why does this matter for you? Because the ether model — now reappearing in quantum field theory as the "quantum vacuum" or "zero-point field" — treats space not as empty but as a plenum: a fullness of potential energy. You are not objects moving through empty space. You are patterns of organization arising from and embedded in a field of infinite potential.

**Zero-Point Field**

Modern physicists like Harold Puthoff have demonstrated mathematically that the quantum vacuum contains enormous amounts of energy — more energy per cubic centimeter than the total energy of all visible matter in the known universe. This is not New Age speculation. It's in peer-reviewed physics journals.

Tesla's intuition was essentially correct: there is a medium. It is active. It is accessible. And it responds to organized information — which is what consciousness is.

**Practical Implication**

You are not an island. You are a pattern in a field. The field is not neutral — it carries information. When you shift your internal state, you are shifting your relationship to this field. This is why practices like focused intention, visualization, and coherent emotion produce measurable effects on external reality. Not magic. Physics.
""",
                practice: "Field Sensing: Sit still for 5 minutes with eyes closed. Rather than trying to clear your mind, try to sense the space around you as filled rather than empty. Notice any tingling, warmth, or sense of energy in your hands or around your body. This is proprioceptive awareness of the biofield — you are feeling the field you're embedded in.",
                journalPrompt: "When have you experienced something that suggested reality was more connected than it appears? Intuitions, synchronicities, precognitions. What happened?"
            ),
            TeslaLesson(
                id: "t1l3",
                title: "3-6-9: The Pattern Behind Patterns",
                icon: "number.circle",
                duration: 9,
                body: """
**Tesla's Mathematical Obsession**

"If you only knew the magnificence of the 3, 6, and 9, you would have the key to the universe." Tesla reportedly circled buildings three times before entering, requested 18 napkins at meals (1+8=9), lived in hotel rooms divisible by 3. This was not superstition — it was a systematic exploration of numerical patterns he observed throughout nature.

**Vortex Mathematics**

Marko Rodin's work on vortex mathematics — building on the 3-6-9 pattern — reveals a structure underlying number sequences that appears to describe how energy actually flows. The doubling sequence (1, 2, 4, 8, 16, 32...) in base-9 arithmetic produces an oscillating sequence (1, 2, 4, 8, 7, 5) that never touches 3, 6, or 9. These numbers exist outside the oscillation — they are the axis, the organizing principle.

The Fibonacci sequence (0, 1, 1, 2, 3, 5, 8, 13, 21...) reduced to single digits produces a 24-number pattern that, when arranged in a circle, reveals bilateral symmetry organized around the same 3-6-9 axis.

**Why It Matters**

These are not decorative coincidences. The same patterns appear in: the structure of DNA (6 sides, double helix that completes in 36 Angstroms), water crystal formation, plant phyllotaxis, galaxy formation, and quantum spin states. Whether or not 3-6-9 is the literal "key to the universe," it is clearly a signature pattern that appears across scales of organization.

The practice: use these numbers as entry points into different qualities of awareness. 3 = creative impulse. 6 = balance and reflection. 9 = completion and return.
""",
                practice: "369 Breath: Inhale for 3 counts. Hold for 6 counts. Exhale for 9 counts. Repeat for 9 minutes. This breath ratio creates a specific CO2/O2 balance that activates the parasympathetic nervous system and produces measurable heart rate variability improvements. The numbers are not arbitrary — they produce a real physiological shift.",
                journalPrompt: "Where do you see pattern repetition in your life? The same types of situations, same relationship dynamics, same thought loops. What number pattern might describe the cycle you're in?"
            )
        ],
        quizQuestions: [
            TeslaQuizQuestion(id: "t1q1", question: "What did Tesla mean when he said 'think in terms of energy, frequency, and vibration'?", options: ["It was a metaphor for positive thinking", "A literal description of reality's structure", "A poetic way of describing emotions", "A reference to sound healing only"], correctIndex: 1, explanation: "Tesla was describing his literal working model of reality — not metaphor. Everything physical is electromagnetic vibration at different frequencies."),
            TeslaQuizQuestion(id: "t1q2", question: "What is the Schumann Resonance?", options: ["Tesla's personal frequency", "Earth's base electromagnetic vibration (~7.83 Hz)", "The frequency of human DNA", "The resonance of the Great Pyramid"], correctIndex: 1, explanation: "The Schumann Resonance is the electromagnetic resonance of Earth's cavity (between surface and ionosphere), approximately 7.83 Hz — which overlaps with human alpha/theta brainwave states."),
            TeslaQuizQuestion(id: "t1q3", question: "What does the 369 breath ratio (inhale 3, hold 6, exhale 9) actually do physiologically?", options: ["Nothing — it's purely symbolic", "Activates fight-or-flight response", "Activates parasympathetic nervous system, improves HRV", "Raises blood pressure"], correctIndex: 2, explanation: "The extended exhale (9 counts) activates the vagus nerve and parasympathetic nervous system. This is measurable — heart rate variability improves with this pattern.")
        ],
        weeklyExperiment: "Keep a frequency log for 7 days. Morning and evening, rate your dominant emotional frequency (1-10). Note any external events that seemed to 'match' your internal state. Look for the correlation between broadcast and reception."
    ),

    TeslaModule(
        id: "t2_living_antenna",
        number: 2,
        emoji: "📡",
        title: "You as Living Antenna",
        subtitle: "Consciousness, Biofield & DNA as Receiver",
        colorHex: "#00BFFF",
        lessons: [
            TeslaLesson(
                id: "t2l1",
                title: "The Brain as Receiver, Not Generator",
                icon: "brain",
                duration: 8,
                body: """
**The Transmission Model**

The dominant model in neuroscience treats the brain as the generator of consciousness — mind is what the brain produces, like light is what a bulb produces. Tesla, and a growing minority of neuroscientists and physicists, held a different model: the brain as receiver. Consciousness exists independently and the brain acts as a transceiver — a tuning device that selects which frequency of the universal signal it processes.

This model has serious scientific defenders. Neuroscientist Bernardo Kastrup has mathematically demonstrated that the "hard problem of consciousness" — why physical processes produce subjective experience — is unsolvable within the production model and dissolves within the transmission model.

**The Biofield**

Your body generates and is surrounded by measurable electromagnetic fields. The heart's field is detectable up to several feet away from the body. The brain's field is measurable. These fields are not epiphenomena — they carry information. HeartMath Institute has published research showing that the heart's electromagnetic field changes measurably with different emotional states and can be detected by other people and animals.

The ancient concept of the "aura" is likely a folk description of this biofield — imprecise in its traditional framing but pointing at something real.

**Practical Implication**

If the brain is a receiver, then the quality of what you receive depends on the quality of your tuning. Physical health, emotional coherence, and stillness of mind are not virtues in an abstract sense — they are the literal conditions for clear signal reception. Anxiety, trauma, and chronic stress are not just unpleasant. They are distortion in the receiver.
""",
                practice: "Heart Coherence (HeartMath protocol): Place one hand on your heart. Breathe slowly (5 seconds in, 5 seconds out). As you breathe, recall a genuine memory of appreciation or care — not a concept, a specific memory. Hold this for 5 minutes. Research from HeartMath Institute shows this produces measurable coherence in heart rate variability, which correlates with clearer thinking and stronger immune function.",
                journalPrompt: "When have you had a 'download' — information, insight, or knowing that seemed to come from outside your normal thinking? What conditions were present? What were you doing, feeling, or open to?"
            ),
            TeslaLesson(
                id: "t2l2",
                title: "DNA: The Cosmic Receiver",
                icon: "helix",
                duration: 7,
                body: """
**Beyond the Gene Machine**

The dominant model of DNA as a static blueprint — gene A produces protein B — has been fundamentally revised by epigenetics. Genes are not simply on or off. Their expression is regulated by the cellular environment, which is regulated by the organism's overall state, which is regulated by its experiences, emotions, and perceptions. This is not fringe science. It is the consensus of modern epigenetics.

Russian molecular biologist Pjotr Garjajev and colleagues conducted experiments suggesting DNA functions as a biocomputer that can be reprogrammed by language, frequencies, and coherent light. Their work remains contested in Western science but has produced replicated results in Russian research institutions.

**The Phantom DNA Effect**

Even more striking: Garjajev's group demonstrated a "phantom DNA" effect — when DNA was placed in a container and then removed, the electromagnetic phantom of its structure remained detectable for up to 30 days. This suggests DNA leaves an organizational imprint on the quantum field around it.

**Junk DNA as Receiver**

Approximately 98% of human DNA does not code for proteins. For decades this was called "junk DNA." Current research increasingly suggests these sequences are regulatory — they control when and how the coding sequences are expressed. Some researchers, including molecular biologist William Brown, propose that non-coding DNA sequences function as antennae for environmental electromagnetic information, translating field conditions into gene expression.

Whether or not this specific mechanism is correct, the broader principle holds: your DNA is not a fixed script. It is a responsive, dynamic system that reflects and responds to your internal state and external environment.
""",
                practice: "Intention Activation: Before sleep, spend 5 minutes in a coherent, elevated emotional state (use the HeartMath heart coherence protocol). Then speak aloud or in your mind a specific quality you want to amplify — 'I am activating clarity,' 'I am opening to health.' This is not affirmation as wishful thinking. It is using coherent emotion (which changes your body chemistry and bioelectric field) combined with directed intention to influence the cellular environment in which your DNA expresses.",
                journalPrompt: "What qualities do you know are in your nature but aren't yet expressing fully? What would 'activating' them feel like in your body, not just your mind?"
            )
        ],
        quizQuestions: [
            TeslaQuizQuestion(id: "t2q1", question: "What distinguishes the 'transmission model' of consciousness from the standard neuroscience model?", options: ["It claims consciousness doesn't exist", "The brain generates consciousness like a bulb generates light", "The brain receives/tunes consciousness rather than generating it", "Consciousness lives in the heart, not the brain"], correctIndex: 2, explanation: "The transmission model (defended by philosophers like Bernardo Kastrup and aligned with Tesla's view) holds that consciousness is fundamental and the brain acts as a receiver/transceiver, not the source."),
            TeslaQuizQuestion(id: "t2q2", question: "What has HeartMath Institute demonstrated about the heart's electromagnetic field?", options: ["It has no measurable field", "It only changes during extreme emotions", "It changes measurably with emotional states and can be detected by others", "It is identical in all emotional states"], correctIndex: 2, explanation: "HeartMath Institute research has repeatedly demonstrated that the heart's electromagnetic field (detectable several feet from the body) changes measurably with emotional states and can influence the physiological state of others.")
        ],
        weeklyExperiment: "Practice the Heart Coherence protocol daily for 7 days, each morning. After 7 days, write what shifted: in clarity of thought, in emotional baseline, in interactions with others. This is your personal epigenetic experiment."
    ),

    TeslaModule(
        id: "t3_portals",
        number: 3,
        emoji: "🌀",
        title: "Energetic Portals",
        subtitle: "Doorways of Frequency & Consciousness",
        colorHex: "#9B59B6",
        lessons: [
            TeslaLesson(
                id: "t3l1",
                title: "What Portals Actually Are",
                icon: "circle.hexagonpath.fill",
                duration: 7,
                body: """
**Demystifying the Term**

The word "portal" has been so over-used in esoteric culture that it risks losing meaning. Let's define it precisely: an energetic portal is a localized region of stabilized, coherent electromagnetic field that functions as a threshold — a place where the usual parameters of space, time, or consciousness become more permeable.

This is not science fiction. It is a description of what certain physical and electromagnetic conditions produce. Tesla's Wardenclyffe tower was designed, in part, to create specific resonant standing waves in Earth's electromagnetic field. The nodes of these standing waves — points of maximum amplitude — would create regions where energy transmission occurred with unusual efficiency.

**Personal Portals**

At the level of individual consciousness, a portal is more often an internal event than a physical location. Certain emotional and mental conditions — profound coherence, the dissolution of the habitual thought-self, or states induced by specific resonant frequencies — create thresholds in consciousness through which information from non-ordinary states of awareness becomes accessible.

These are not the exclusive province of mystics. They happen in flow states, in moments of extreme grief or joy, in the deepest phases of meditation, and occasionally in dreams. The difference between a mystic and someone who has had one extraordinary experience is not the experience — it is systematic attention to the conditions that produce it.

**Sacred Sites as Resonant Nodes**

The consistent relationship between sacred sites (Stonehenge, the pyramids, Göbekli Tepe, Newgrange) and geomagnetic anomalies or electromagnetic properties has been documented by researchers including Paul Devereux (Dragon Project) and John Burke. These sites were not chosen arbitrarily. They were chosen because the location had measurable electromagnetic properties that amplified specific states of consciousness.
""",
                practice: "Portal Visualization: Sit with spine straight. 10 slow breaths. Visualize a field of coherent light about 18 inches in front of you — not a tunnel but a sphere of organized, high-frequency energy. Feel in your chest the emotion of peace and openness (not forced, recalled). Spend 5 minutes in the felt sense of approaching and entering this field. Notice: what shifts in your body, your thoughts, your sense of self?",
                journalPrompt: "Have you ever stepped into a space — a building, a natural place, a room — and immediately felt a shift? What made that space different? What do you think was actually happening?"
            ),
            TeslaLesson(
                id: "t3l2",
                title: "Initiatory Crucibles",
                icon: "flame.fill",
                duration: 8,
                body: """
**The Portal as Crucible**

Every genuine threshold — whether physical, emotional, or consciousness-based — functions as a crucible. You cannot pass through unchanged. This is not metaphor. It is structural.

In Jungian psychology, this is the function of the 'threshold guardian' — the figure at the gate of transformation who presents the challenge that must be faced before passage. Every major life transition — death of a relationship, career collapse, physical illness, spiritual awakening — functions as an energetic portal. The suffering is not the point. The transformation is the point.

**Calibrating for Passage**

Tesla understood that his electrical experiments required specific conditions for reliable results. Voltage too low: nothing happens. Voltage too high: destruction. The same applies to consciousness portals. This is why initiation traditions across cultures — from Eleusinian Mysteries to Indigenous vision quests to Sufi retreats — were carefully designed and supervised. The conditions matter.

**Modern Application**

You cannot manufacture a genuine transformative threshold experience through effort of will. But you can create the conditions: elevated emotional state, focused intention, physiological preparation (fasting, movement, breath), environmental factors (nature, sacred space, sound), and — critically — the willingness to be changed. Not the willingness to have a cool experience. The willingness to come out different.

Most people approach potential threshold experiences with the goal of returning to their current self, enriched by the experience. The threshold refuses this. Genuine passage requires not knowing who you'll be on the other side.
""",
                practice: "Threshold Inventory: Write three experiences in your life that functioned as portals — moments after which you were genuinely different, not just informed of something new. For each: What were the conditions? What resisted passage? What was shed? What emerged? Look for the pattern. Your portals have a signature.",
                journalPrompt: "What portal are you standing at right now? What is requiring you to change, and what in you is refusing to? What would full passage through this threshold actually look like?"
            )
        ],
        quizQuestions: [
            TeslaQuizQuestion(id: "t3q1", question: "What characterizes an energetic portal according to the electromagnetic model?", options: ["A physical doorway with supernatural properties", "A localized region of coherent, stabilized electromagnetic field creating a threshold", "Any place associated with spiritual tradition", "A metaphor for personal change"], correctIndex: 1, explanation: "Precisely defined: a region of stabilized coherent EM field where usual parameters of energy, space, or consciousness become more permeable. The mystical description and the electromagnetic description converge."),
            TeslaQuizQuestion(id: "t3q2", question: "Why did researchers like Paul Devereux investigate sacred sites like Stonehenge?", options: ["To disprove their significance", "They found consistent correlations between sacred sites and measurable geomagnetic anomalies", "They were looking for buried treasure", "To study ancient construction techniques only"], correctIndex: 1, explanation: "The Dragon Project (Devereux et al.) documented measurable electromagnetic anomalies at sacred sites across cultures, suggesting these locations were selected for their inherent energetic properties, not chosen arbitrarily.")
        ],
        weeklyExperiment: "Visit a natural location you find genuinely powerful — a specific place in nature, not a built environment. Spend 30 minutes there with no phone, no agenda. Practice the portal visualization. Write afterward: what shifted? What information arrived?"
    ),

    TeslaModule(
        id: "t4_soul_upgrade",
        number: 4,
        emoji: "🧬",
        title: "Soul Upgrade",
        subtitle: "Entrainment, Activation & Accelerated Evolution",
        colorHex: "#2ECC71",
        lessons: [
            TeslaLesson(
                id: "t4l1",
                title: "Entrainment: How Fields Rewrite Systems",
                icon: "waveform.path.ecg",
                duration: 8,
                body: """
**The Physics of Transformation**

Entrainment is the process by which a dominant oscillator reorganizes a weaker one to match its frequency. Christiaan Huygens discovered this in 1665: pendulum clocks mounted on the same wall will synchronize their oscillations. The wall transmits the mechanical vibration; the clocks entrain.

This principle operates at every scale of physical reality. Neural oscillations entrain to acoustic rhythms — which is why music changes your brain state. Brain waves entrain to other brain waves — which is why the emotional state of the person next to you affects your own. Cellular oscillations entrain to coherent electromagnetic fields — which is Tesla's insight applied to biology.

**What Upgrades Actually Look Like**

Genuine transformation is not the acquisition of new beliefs or behaviors layered onto an unchanged substrate. It is the reorganization of the substrate itself — the nervous system, the cellular environment, the habitual patterns of the brain — by sustained contact with a more coherent, higher-frequency field.

This is what meditation actually does over years of practice: it creates a more coherent bioelectric field by repeatedly training the nervous system toward parasympathetic dominance, which over time literally changes the neural architecture. The meditator doesn't just behave differently. They are different, measurably, at the neurological level.

**The Solfeggio Frequencies**

528 Hz is associated with DNA repair in some research contexts. 432 Hz tuning (vs. the standard 440 Hz) has been associated by some researchers with reduced stress response. 396 Hz has been used in sound healing applications related to trauma release. The mechanistic pathways are not fully understood, but the frequencies appear to have measurable physiological effects distinct from placebo, which is what makes them worth taking seriously.
""",
                practice: "Sound Intention Session: Find or create 528 Hz audio (widely available online). Listen for 15 minutes while holding a clear intention — 'I am integrating this frequency' or 'I am open to cellular coherence.' The combination of specific frequency + directed intention produces a stronger effect than either alone. This is the soul upgrade protocol: external resonant field + internal coherent state.",
                journalPrompt: "When in your life have you experienced the entrainment effect — being in the presence of someone or something whose frequency pulled you into alignment? What did that feel like? What changed in you during or after?"
            ),
            TeslaLesson(
                id: "t4l2",
                title: "Chakras as Coherence Centers",
                icon: "circle.grid.cross.fill",
                duration: 6,
                body: """
**Translating the Ancient Map**

The chakra system is not a religious claim. It is an energetic map developed by practitioners who spent millennia observing the relationship between consciousness, physiology, and energetic experience. Like all maps, it is not the territory — but it describes the territory with enough precision to be practically useful.

Modern correspondence: The seven primary chakras correspond approximately to major nerve plexuses and endocrine glands along the spine. The root chakra (base of spine) corresponds to the sacral plexus and adrenal glands. The heart chakra corresponds to the cardiac plexus and thymus gland. The crown chakra corresponds to the cerebral cortex and pineal gland.

**The Coherence Model**

Rather than thinking of chakras as spinning wheels of colored light (a useful visualization but not a literal description), think of them as electromagnetic coherence centers — regions where biological complexity is sufficient to generate organized electromagnetic fields that interact with both the body's own systems and the external field.

When these centers are 'open' or 'balanced,' the electromagnetic fields generated are coherent — organized, predictable, resonant with the field around them. When 'blocked,' the fields are incoherent — random, low-amplitude, non-resonant.

**Practical Activation**

The most effective activation of these centers is not visualization alone but the combination of: breath directed to the anatomical location, coherent emotion (specifically the emotion most naturally associated with each center), and physical movement or vibration (toning, movement, touch). This multimodal approach produces measurable changes in the biological systems associated with each center.
""",
                practice: "Spinal Coherence Scan: Sit with spine straight. Starting at the base of the spine, breathe into each energy center and hold the corresponding quality: Root (safety/earth), Sacral (creativity/flow), Solar Plexus (power/autonomy), Heart (love/connection), Throat (truth/expression), Third Eye (clarity/vision), Crown (openness/surrender). 3 breaths per center. Feel, don't visualize.",
                journalPrompt: "Which center do you feel most alive in? Which feels most contracted? The contracted one is your current edge — what would it take to breathe life into it?"
            )
        ],
        quizQuestions: [
            TeslaQuizQuestion(id: "t4q1", question: "What is entrainment?", options: ["Training to resist outside influences", "A dominant oscillator reorganizing a weaker one to match its frequency", "A meditation technique", "Memorizing frequency patterns"], correctIndex: 1, explanation: "Discovered by Huygens in 1665 with synchronized pendulum clocks. Operates at every scale — from pendulums to neurons to cellular oscillations. The basis for sound healing, meditation's neural effects, and social-emotional contagion."),
            TeslaQuizQuestion(id: "t4q2", question: "528 Hz is associated with what effect in research contexts?", options: ["Increased aggression", "Sleep induction", "DNA repair and cellular coherence", "Hearing damage"], correctIndex: 2, explanation: "Multiple studies (Rein, Horowitz, et al.) have associated 528 Hz with DNA repair processes and cellular coherence, though the mechanisms aren't fully characterized. It's the most studied of the Solfeggio frequencies.")
        ],
        weeklyExperiment: "15 minutes daily for 7 days: 528 Hz audio + coherent intention. Track: sleep quality, clarity, emotional baseline, and any physical sensations. This is a reproducible experiment, not a belief exercise. Collect your data."
    ),

    TeslaModule(
        id: "t5_cosmic_keys",
        number: 5,
        emoji: "🔢",
        title: "The Cosmic Keys",
        subtitle: "3-6-9 & Sacred Geometry in Nature",
        colorHex: "#E74C3C",
        lessons: [
            TeslaLesson(
                id: "t5l1",
                title: "Vortex Mathematics & the 369 Pattern",
                icon: "infinity",
                duration: 9,
                body: """
**Marko Rodin's Discovery**

Marko Rodin, working from a Bahá'í mystical text, developed what he calls Vortex Mathematics — a system based on the observation that reducing the doubling sequence (1, 2, 4, 8, 16, 32, 64...) in base-9 arithmetic produces the pattern 1, 2, 4, 8, 7, 5 that repeats indefinitely, never producing 3, 6, or 9.

These three numbers exist outside the doubling pattern. They are the axis around which the pattern revolves. In Rodin's model, this makes them the organizing principle — the dimension that governs how energy flows in the other numbers.

This has been formalized by engineers at Rodin's foundation and has produced an actual physical application: the Rodin Coil, which has unusual electromagnetic properties that are currently being studied for their potential in generating coherent fields with unusual energy density.

**Fibonacci & Nature's 3-6-9 Fingerprint**

The Fibonacci sequence, when reduced to single digits and arranged in a circle, reveals bilateral symmetry and a pattern organized around the 3-6-9 axis. This is not numerological speculation — it is a mathematical property of the sequence.

And the Fibonacci sequence appears throughout nature: sunflower seed arrangements, nautilus shells, galaxy spiral arms, DNA double helix measurements (34 and 21 Angstroms per full cycle, both Fibonacci numbers), pine cone scales, leaf arrangement patterns.

The conclusion isn't mystical. It's structural: 3-6-9 describes something real about how energy organizes in the physical universe.
""",
                practice: "369 Pattern Meditation: Set a timer for 9 minutes. Breathe in 3-count cycles. Visualize a torus (donut-shaped energy field) around your body — the shape that Rodin's mathematics describes as the fundamental form of energy flow. Feel the rotation of this field: gathering from below, expanding above, releasing and returning. This is not fantasy — the toroidal field structure of the heart's electromagnetic field has been measured by HeartMath Institute.",
                journalPrompt: "Where does the 3-6-9 pattern show up in your life? Creative cycles? Relationship patterns? Time cycles? Look for the oscillation — there is always a trinity of phases."
            ),
            TeslaLesson(
                id: "t5l2",
                title: "Sacred Geometry as Field Architecture",
                icon: "hexagon.fill",
                duration: 8,
                body: """
**Shapes That Organize Fields**

Sacred geometry is not art history. It is the study of forms that have specific electromagnetic properties because of their structural relationships to mathematical principles like phi (1.618) and pi.

The hexagon appears in: honeycomb structure (optimal space/material efficiency), snowflake formation (water crystallization follows hexagonal symmetry), Saturn's polar vortex (an actual hexagonal storm pattern 25,000 km across), benzene rings (the basis of organic chemistry), graphene (the strongest material known, arranged in hexagonal lattice), and the Flower of Life pattern found in sacred architecture worldwide.

Why hexagons? The hexagonal packing pattern is the most efficient way to fill a plane with equal circles. Nature optimizes. Where you see hexagons, you're seeing nature's optimization principle made visible.

**The Torus: Energy's Fundamental Shape**

The torus (donut form) appears to be the fundamental shape of self-sustaining energy systems: the Earth's magnetic field, the Sun's heliosphere, the shape of the electromagnetic field around the heart, the form of atoms in some quantum models, and — at the extreme scale — potentially the large-scale structure of the observable universe.

A toroidal field is self-sustaining because it continuously recirculates energy through itself. It is the shape of a system that feeds itself — that doesn't require external input to maintain its coherence. This is the energetic geometry of sovereignty.
""",
                practice: "Torus Field Building: Stand or sit. Imagine energy descending through the top of your head, flowing through your core to your feet, then radiating outward in all directions from your feet, arcing up around you to meet above your head, then descending again. Repeat this as a fluid, continuous movement of awareness for 10 minutes. You are tracing the pattern of your actual bioelectromagnetic field.",
                journalPrompt: "Where in your life are you operating like a torus — self-sustaining, continuously recirculating energy from your own source? Where are you leaking — dependent on external supply to maintain your state?"
            )
        ],
        quizQuestions: [
            TeslaQuizQuestion(id: "t5q1", question: "In vortex mathematics, what is special about 3, 6, and 9?", options: ["They are Tesla's lucky numbers", "They appear in the doubling sequence at positions 3, 6, and 9", "They are outside the doubling sequence pattern — the axis around which it rotates", "They are the only prime numbers that matter"], correctIndex: 2, explanation: "The doubling sequence reduced in base-9 produces 1,2,4,8,7,5 endlessly — never 3, 6, or 9. These three exist outside the pattern and function as its organizing axis."),
            TeslaQuizQuestion(id: "t5q2", question: "Why does the hexagonal form appear so frequently in nature?", options: ["It's aesthetically pleasing to living things", "Coincidence at different scales", "Hexagonal packing is the optimal spatial efficiency pattern", "It relates to the number 6 being sacred"], correctIndex: 2, explanation: "Hexagonal packing is mathematically the most efficient way to fill a plane with equal circles. Nature optimizes — where you see hexagons, you're seeing nature's mathematical solution to spatial efficiency: honeycomb, snowflakes, Saturn's polar vortex, graphene.")
        ],
        weeklyExperiment: "Draw or find a Flower of Life mandala. Place it somewhere you see daily. Each time you see it, take one breath and trace the pattern with your eyes. After 7 days, note if there's any change in your relationship to pattern, in how you perceive the underlying order of events in your life."
    ),

    TeslaModule(
        id: "t6_conscious_resonator",
        number: 6,
        emoji: "🎛️",
        title: "Becoming the Conscious Resonator",
        subtitle: "Frequency Management & Intention",
        colorHex: "#E67E22",
        lessons: [
            TeslaLesson(
                id: "t6l1",
                title: "Tesla's Mental Prototyping Method",
                icon: "brain.head.profile",
                duration: 7,
                body: """
**The Method That Built Alternating Current**

Tesla claimed he could design, build, test, and refine his inventions entirely in his mind before ever touching physical materials. He described his mental prototypes as "indistinguishable from physical reality" — he could run them, observe wear patterns, and identify failure points. The physical build was then simply confirmation.

This is not legend. The inventions exist. The method worked.

**The Neuroscience of Mental Simulation**

Neuroscience has established that the neural patterns activated during vivid mental simulation are, to a significant degree, identical to those activated during actual physical experience. Athletes who use detailed mental rehearsal improve nearly as much as those doing physical practice (and significantly outperform those doing neither).

The key variable is specificity and sensory richness. Vague visualization ("I want to succeed") produces minimal training effect. Vivid, multi-sensory mental simulation of specific sequences of action produces measurable neurological change.

**Applied to Your Life**

Tesla's method, applied to your life: When you want to create something — a relationship, a result, a capacity — build it completely in your mind first. Not a mood board or a wish. A functioning prototype. Experience the created reality from the inside, in detail, in sequence. Feel the specific emotions of the specific moments. Identify the obstacles in the mental prototype and solve them there.

Then move toward the physical with the confidence of someone who has already succeeded many times internally.
""",
                practice: "5-Minute Prototype: Choose one thing you're working toward. Close your eyes. Build it in your mind — not as a scene you're watching, but as an experience you're inhabiting. What does it smell like? What sounds? What is the texture of the objects in it? What emotion is moving through your body? Stay until the prototype is running smoothly and feels real. Then open your eyes and write one concrete action you can take today that moves toward it.",
                journalPrompt: "What is the clearest prototype in your mind of the life you're building? Where is it vivid and detailed? Where is it vague? The vague spots are where your unconscious resistance lives — what are they protecting you from?"
            ),
            TeslaLesson(
                id: "t6l2",
                title: "The Frequency Diet",
                icon: "leaf.fill",
                duration: 6,
                body: """
**Input as Broadcast Modifier**

Everything you consume changes your frequency: food, media, conversations, music, environments, information. This is not metaphorical wellness advice. Each of these inputs modulates your nervous system's state, which changes your bioelectric field, which changes what you resonate with and therefore what appears in your reality.

The concept of 'frequency diet' is not about spiritual purity or avoiding anything negative. It is about conscious curation: being intentional about what inputs you allow, recognizing their effect on your broadcast signal.

**What Lowers Frequency**

Chronic stress responses (news designed to trigger fear, social media comparison loops, inflammatory foods): These activate the sympathetic nervous system, create cortisol spikes, and produce low-coherence heart rate variability. Measurably.

**What Raises Frequency**

Nature contact (Shinrin-yoku / forest bathing is one of the most well-researched stress-reduction interventions: reduces cortisol, blood pressure, and inflammatory markers). Music in coherent frequencies. Deep relationships with genuine emotional presence. Food that is minimally processed and close to its natural state. Physical movement. Adequate sleep.

**The Practical Question**

Not: am I consuming enough spiritual content? But: Am I consistently in states that produce high heart rate variability, parasympathetic dominance, and coherent bioelectric fields? That is the frequency diet question.
""",
                practice: "Frequency Diet Audit: For 3 days, track your inputs: media (what, how long, emotional effect), food (type, how you feel 2 hours later), conversations (energizing or draining), environments (where you feel most coherent). At the end of 3 days, you will have a complete map of what is raising and lowering your signal. Make one deliberate change in the lowest-scoring category.",
                journalPrompt: "What inputs in your current life are you consuming out of habit that, if you're honest, consistently lower your frequency? What is your actual resistance to changing them?"
            )
        ],
        quizQuestions: [
            TeslaQuizQuestion(id: "t6q1", question: "What does neuroscience show about vivid mental simulation vs. physical practice?", options: ["Mental simulation has no neurological effect", "Mental simulation activates largely the same neural patterns as physical experience", "Physical practice is always dramatically more effective", "Mental simulation works only for athletes"], correctIndex: 1, explanation: "Neuroscience research (Jeannerod et al., Yao et al.) has established that vivid, specific mental simulation activates neural patterns largely identical to physical performance. The key variable is specificity — vague visualization produces minimal effect."),
            TeslaQuizQuestion(id: "t6q2", question: "What is 'Shinrin-yoku' and why is it relevant to frequency management?", options: ["A Japanese meditation technique", "Forest bathing — one of the most researched stress-reduction interventions, measurably lowering cortisol", "A dietary practice", "A breathing method"], correctIndex: 1, explanation: "Shinrin-yoku (forest bathing) is supported by extensive Japanese and international research showing measurable reductions in cortisol, blood pressure, and inflammatory markers from time in forest environments. It's the most concrete example of environmental frequency affecting physiology.")
        ],
        weeklyExperiment: "Conduct a 7-day frequency diet experiment: Add one nature experience daily (minimum 20 minutes outdoors, no phone). Remove or reduce your lowest-frequency media input. Track your coherence rating daily (1-10). Compare start and end states."
    ),

    TeslaModule(
        id: "t7_earth_symphony",
        number: 7,
        emoji: "🌍",
        title: "Tuning to Earth's Symphony",
        subtitle: "Grounding, Schumann Resonance & Sound Healing",
        colorHex: "#27AE60",
        lessons: [
            TeslaLesson(
                id: "t7l1",
                title: "Earthing: The Research Behind the Practice",
                icon: "leaf.arrow.circlepath",
                duration: 7,
                body: """
**What Grounding Research Shows**

Earthing — direct skin contact with the Earth's surface — has been studied by researchers including Gaétan Chevalier (Chopra Foundation), James Oschman (biophysics), and Clinton Ober. The findings, published in peer-reviewed journals including the Journal of Environmental and Public Health, indicate measurable effects: reduction in inflammatory markers, improvement in sleep quality, normalization of cortisol rhythms, and reduction in blood viscosity (a cardiovascular risk factor).

The proposed mechanism: Earth maintains a negative electric charge (approximately -300,000 volts at the ionosphere, balanced by a negative surface charge). Direct contact with the Earth's surface allows free electrons to flow into the body, which have an antioxidant effect. The body's electrical environment normalizes when it is in direct contact with Earth's electrical environment.

**The Modern Disconnect**

Rubber and synthetic soles are electrical insulators. Modern buildings insulate us from the Earth's surface. The average American spends approximately 90% of their time indoors. This is an unprecedented situation in human evolutionary history — and it may have measurable health consequences through the mechanism of electrical disconnection.

**Sound Healing Roots**

Ancient healing traditions across cultures used sound as medicine: Tibetan singing bowls, Gregorian chant, didgeridoo, indigenous drumming. The 40 Hz gamma brainwave frequency (associated with high-order cognitive function and mystical experiences) can be entrained through drumming patterns found in traditional healing ceremonies.

Modern research confirms: 40 Hz sound and light stimulation has been shown in peer-reviewed studies (MIT/Picower Institute) to reduce amyloid plaques associated with Alzheimer's disease in animal models.
""",
                practice: "Barefoot Earth Contact: Find 20 minutes to stand or walk barefoot on natural ground — grass, soil, sand. No phone. If possible, near water or trees. While grounding: practice the 369 breath. This combines the electrical grounding (measurable effect) with the breath pattern (measurable parasympathetic activation). This is a stacked practice — multiple mechanisms, one simple activity.",
                journalPrompt: "When did you last have consistent, daily contact with the natural world — not as exercise or achievement but as relationship? What is the quality of your relationship with the Earth as a living system?"
            )
        ],
        quizQuestions: [
            TeslaQuizQuestion(id: "t7q1", question: "What has peer-reviewed research on 'earthing' (grounding) demonstrated?", options: ["No measurable effect", "Reduction in inflammatory markers, improved sleep, normalized cortisol", "Dangerous electromagnetic exposure", "Only a placebo effect"], correctIndex: 1, explanation: "Multiple peer-reviewed studies (Chevalier, Oschman, et al.) have demonstrated measurable effects of earthing including reduced inflammatory markers, improved sleep quality, normalized cortisol rhythms, and reduced blood viscosity."),
            TeslaQuizQuestion(id: "t7q2", question: "What frequency has MIT/Picower Institute research associated with reduced Alzheimer's markers?", options: ["528 Hz", "432 Hz", "40 Hz (gamma)", "7.83 Hz (Schumann)"], correctIndex: 2, explanation: "MIT Picower Institute research (Tsai et al., published in Nature) showed that 40 Hz light and sound stimulation (gamma brainwave frequency) reduced amyloid plaques in Alzheimer's disease animal models — now in human clinical trials.")
        ],
        weeklyExperiment: "7 consecutive days: 20 minutes barefoot on natural ground, each morning if possible. Log sleep quality, morning energy, and emotional baseline each day. Compare day 1 to day 7."
    ),

    TeslaModule(
        id: "t8_advanced_experiments",
        number: 8,
        emoji: "🔬",
        title: "Advanced Experiments",
        subtitle: "Toning, Space Harmonization & Mindful Technology",
        colorHex: "#3498DB",
        lessons: [
            TeslaLesson(
                id: "t8l1",
                title: "Toning: Your Voice as Healing Technology",
                icon: "music.mic",
                duration: 7,
                body: """
**The Science of Toning**

Toning — sustained vocal sound, typically vowels or simple tones — has measurable physiological effects. The vagus nerve, the primary regulator of the parasympathetic nervous system, is directly activated by vocalization. This is why singing, chanting, and toning have appeared in virtually every human healing tradition across cultures and history.

Specific research: humming and nasal toning increases nitric oxide (NO) production in the nasal sinuses by over 15 times compared to silent breathing (Weitzberg & Lundberg, 2002, published in the American Journal of Respiratory and Critical Care Medicine). Nitric oxide is a vasodilator that improves cardiovascular function, is antiviral, and plays a role in neurotransmission.

Jonathan Goldman's work on toning and harmonics has documented measurable changes in brain states corresponding to different sustained vowel sounds. The vowel 'AH' (as in "father") produces distinct neural patterns from 'EE', 'OH', or 'UM.'

**The OM Connection**

The chant 'OM' (pronounced AUM) is a three-phase sound: the A activates the chest and heart center, the U activates the throat and skull cavity, and the M (nasal resonance) activates the frontal sinuses and cerebral cortex. The sequence traverses the body's major resonant cavities.

The Schumann Resonance (7.83 Hz) is in the infrasound range — below human hearing. But the practice of extended OM chanting has been measured to produce coherent 7.83 Hz oscillations in the body's bioelectromagnetic field, suggesting the practice produces entrainment to Earth's base frequency.
""",
                practice: "Morning Toning Protocol: 10 minutes, each morning for 7 days. Start with 3 minutes of humming with lips closed — feel the vibration in your skull and chest. Then 3 minutes of AH (chest center activated). Then 3 minutes of AUM — A (chest), U (head cavity), M (nasal sinuses). Notice which areas feel most alive, which feel numb or resistant. Those resistances have information.",
                journalPrompt: "How comfortable are you with the sound of your own voice? What would it mean to actually use your voice as a healing instrument — for yourself first? What does your voice want to express that it hasn't been given permission to?"
            )
        ],
        quizQuestions: [
            TeslaQuizQuestion(id: "t8q1", question: "What did Weitzberg & Lundberg's research on humming demonstrate?", options: ["No measurable effect", "Humming reduced nitric oxide", "Humming increased nitric oxide production 15x vs. silent breathing", "Humming raised blood pressure"], correctIndex: 2, explanation: "Published in Am. J. Respiratory Critical Care Medicine, 2002: nasal toning/humming increased nitric oxide production in nasal sinuses by over 15x compared to silent breathing. NO is a vasodilator with antiviral and neurotransmission roles.")
        ],
        weeklyExperiment: "Morning toning practice for 7 consecutive days. Experiment with different tones and vowels. Notice which produce the most physical sensation. Note any changes in how your voice feels to use in conversation by day 7."
    ),

    TeslaModule(
        id: "t9_collective_mastery",
        number: 9,
        emoji: "🌐",
        title: "Collective Resonance & Mastery",
        subtitle: "Ethics, the Planetary Grid & Your Resonant Blueprint",
        colorHex: "#FFD700",
        lessons: [
            TeslaLesson(
                id: "t9l1",
                title: "The Global Coherence Initiative",
                icon: "globe.americas.fill",
                duration: 8,
                body: """
**Measurable Collective Effects**

The Global Coherence Initiative (HeartMath Institute) monitors global electromagnetic data through a worldwide network of magnetometers. Their ongoing research has documented correlations between global emotional events (September 11, 2001; global meditation events; major natural disasters) and anomalies in the Earth's magnetic field measured at monitoring stations worldwide.

The Princeton PEAR (Princeton Engineering Anomalies Research) laboratory ran 28 years of experiments documenting statistically significant correlations between focused human intention and random event generator outputs — the effect is small but reproducible and has withstood three decades of scrutiny.

The Global Consciousness Project, an ongoing collaborative scientific project based at Princeton, operates a network of random number generators worldwide and continues to document global correlation events corresponding to major human events.

**The Maharishi Effect**

A documented social phenomenon: cities where 1% of the population practiced Transcendental Meditation showed measurable reductions in crime rate. The effect was replicated across multiple cities and has been published in peer-reviewed journals including the Journal of Crime and Justice. This is called the Maharishi Effect — and it suggests that a relatively small percentage of individuals in coherent states has measurable impact on the social fabric.

**The Responsibility**

This data has a direct implication: the quality of your internal state is not a private matter. It is a contribution (or a cost) to the collective field. This is the most serious possible motivation for personal consciousness work — not self-improvement, but understanding that your coherence or incoherence literally affects the people around you, and scales upward from there.
""",
                practice: "Group Intention Practice: Find or create a group of any size (even 2 people) committed to synchronizing intention for a specific period — 5-20 minutes. Choose a clear focus: a quality (peace, clarity, healing) rather than a specific outcome. Practice the heart coherence protocol together. There is research (HeartMath Global Coherence Initiative) suggesting that synchronized heart coherence in groups produces field effects beyond what individual practice creates.",
                journalPrompt: "What is your contribution to the collective field? Not your public actions — your private frequency, your most common internal state, the quality of awareness you bring to interactions. Is it a net positive or a net drain on the field around you? What would need to change for you to be a consistently coherent node in the network?"
            ),
            TeslaLesson(
                id: "t9l2",
                title: "The Critical Safeguards",
                icon: "shield.fill",
                duration: 6,
                body: """
**Why Tesla Emphasized Ethics**

Tesla's vision of wireless energy transmission was not simply technological — it was explicitly humanitarian. He wanted free energy available to all. He explicitly rejected the weaponization of his research. This ethical commitment was not separate from his scientific and spiritual vision — it was integral to it.

The same holds for consciousness work. The forces and fields engaged in advanced resonance practice are not neutral tools. They amplify whatever they encounter — including shadow material, unprocessed trauma, and ego inflation. This is why every genuine initiatory tradition has gatekeepers, teachers, and ethical frameworks.

**The Three Critical Safeguards**

1. **Discernment**: Before acting on any 'received' information or strong internal impulse, test it: Is it loving? Does it respect the free will of others? Is it empowering to you and others, or does it create dependency? Does it come from a state of coherence or from anxiety/ego?

2. **Grounding**: Advanced consciousness work requires proportional grounding. Physical health, daily mundane responsibilities (they anchor you to the material plane for good reason), regular nature contact, sleep, and diet. Spiritual bypassing — using elevated states to avoid material-plane responsibilities — always backfires.

3. **Ethics**: Never use these capabilities to manipulate others. Serve from wholeness, not from need. The goal is always to leave others more free and more coherent, not more dependent on you or more attuned to your frequency.

**The Integration Imperative**

The most common failure mode in serious consciousness work is getting the expansion right and the integration wrong. Insight without behavioral change is spiritual entertainment. The measure of any expanded state is: what did you do differently when you came back?
""",
                practice: "Resonant Blueprint: Spend 30 minutes designing your personal resonant blueprint — not goals, but a description of the quality of field you commit to generating: How you will tend your physical vessel (the receiver). How you will manage your emotional frequency (the broadcast). Your practices (the tuning protocols). Your ethics (the operating system). Your contribution to the collective (the transmission).",
                journalPrompt: "What is the one safeguard you most consistently neglect — discernment, grounding, or ethics? What specifically would it look like to strengthen it over the next 90 days?"
            )
        ],
        quizQuestions: [
            TeslaQuizQuestion(id: "t9q1", question: "What is the 'Maharishi Effect'?", options: ["A meditation that works only for one person", "The documented correlation between 1% of a city practicing TM and reduced crime rate", "A myth with no scientific backing", "Tesla's meditation practice"], correctIndex: 1, explanation: "Published in the Journal of Crime and Justice: cities with 1% TM practice showed measurable crime reduction. Replicated across multiple cities. Suggests a small percentage of people in coherent states has measurable collective social impact."),
            TeslaQuizQuestion(id: "t9q2", question: "What is 'spiritual bypassing'?", options: ["Using elevated states to avoid material-plane responsibilities", "A form of astral projection", "Meditating too much", "Avoiding spiritual practice"], correctIndex: 0, explanation: "Coined by therapist John Welwood: using spiritual practice, elevated states, or spiritual identity to avoid addressing real psychological, relational, or material responsibilities. Common failure mode in advanced consciousness work — always backfires.")
        ],
        weeklyExperiment: "Design and write your complete Resonant Blueprint. This is your capstone. Include: your physical practice protocol, emotional frequency management approach, primary ethical commitments, and one specific contribution you are committing to make to the collective field. Date and sign it."
    )
]
