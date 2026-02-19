// TempleAcousticsCourse.swift
// TEMPLE ACOUSTICS - Architecture for Awakening
// How ancient builders used resonance for consciousness expansion
// The suppressed science of sacred sound

import Foundation
import SwiftUI

// MARK: - Temple Acoustics Course

struct TempleAcousticsCourse {
    static let shared = TempleAcousticsCourse()
    
    let id = "temple_acoustics"
    let title = "Temple Acoustics"
    let subtitle = "Architecture for Awakening"
    let icon = "waveform"
    let colorHex = "#8B4513"
    let totalMinutes = 45
    
    var color: Color { Color(hex: colorHex) }
    
    // MARK: - Modules
    
    let modules: [AcousticsModule] = [
        
        // ═══════════════════════════════════════════════════════════════
        // MODULE 1: THE SCIENCE
        // ═══════════════════════════════════════════════════════════════
        
        AcousticsModule(
            id: "acoustics_1",
            number: 1,
            title: "Resonant Frequencies",
            subtitle: "The physics of sacred sound",
            lessons: [
                AcousticsLesson(
                    id: "a1_1",
                    title: "Why Temples Feel Different",
                    content: """
**You've felt it.**

Walk into an ancient cathedral, a Buddhist temple, a stone chamber. Something shifts. The space feels... different. Sacred. Alive.

This isn't just psychology. It's physics.

**RESONANCE:**

Every space has natural resonant frequencies — sounds that the architecture amplifies rather than absorbs.

Ancient builders knew this. They designed spaces that:
• Amplify specific frequencies
• Create standing waves
• Produce overtones that affect consciousness
• Enhance chanting and prayer

**THE 111 Hz PHENOMENON:**

Research by Dr. Paolo Debertolis found that many ancient chambers resonate at approximately 111 Hz — the "holy frequency."

At this frequency:
• Brain activity shifts from left to right hemisphere dominance
• Prefrontal cortex activity decreases
• Language centers quiet
• Emotional and spatial processing increases

**Translation:** The analytical mind shuts up. The mystical mind opens.

**This wasn't accidental.**

The builders of:
• Newgrange (Ireland)
• Hypogeum (Malta)
• Great Pyramid chambers
• Gothic cathedrals

All created spaces with similar acoustic properties.

Separated by thousands of miles and years. Same frequency range.

**Pattern recognition:** They knew something we forgot.
""",
                    frequency: nil
                ),
                
                AcousticsLesson(
                    id: "a1_2",
                    title: "How Sound Affects Consciousness",
                    content: """
**Sound isn't just heard. It's felt.**

Low frequencies (20-200 Hz) bypass the ear and vibrate the body directly. You feel them in your chest, your bones, your organs.

**ENTRAINMENT:**

Your brain naturally synchronizes with external rhythms. This is why:
• Music affects mood
• Drumming induces trance
• Chanting creates altered states
• Certain sounds feel "sacred"

**THE BRAINWAVE CONNECTION:**

| Brainwave | Frequency | State |
|-----------|-----------|-------|
| Delta | 0.5-4 Hz | Deep sleep, healing |
| Theta | 4-8 Hz | Meditation, visions |
| Alpha | 8-13 Hz | Relaxed awareness |
| Beta | 13-30 Hz | Normal waking |
| Gamma | 30-100 Hz | Peak performance, insight |

**Binaural beats** (two slightly different frequencies in each ear) can guide the brain into specific states.

**Temple acoustics do this architecturally.**

The standing waves, the reverb, the specific resonances — they push consciousness toward theta/alpha states without headphones or technology.

**MONKS KNEW THIS:**

Gregorian chant isn't arbitrary. The specific intervals, the reverberant spaces, the timing — all designed to shift consciousness.

Tibetan monks chanting "Om" at 136.1 Hz (the frequency of the Earth's year) in resonant caves weren't just praying.

They were hacking their nervous systems.

**The architecture is the technology.**
""",
                    frequency: nil
                )
            ]
        ),
        
        // ═══════════════════════════════════════════════════════════════
        // MODULE 2: SACRED FREQUENCIES
        // ═══════════════════════════════════════════════════════════════
        
        AcousticsModule(
            id: "acoustics_2",
            number: 2,
            title: "The Sacred Frequencies",
            subtitle: "Sounds that shift consciousness",
            lessons: [
                AcousticsLesson(
                    id: "a2_1",
                    title: "The Solfeggio Scale",
                    content: """
**The original sacred scale, suppressed and rediscovered.**

The Solfeggio frequencies are a set of tones used in sacred music, including Gregorian chants. They were "lost" for centuries, then rediscovered in the 1970s by Dr. Joseph Puleo.

**THE SIX CORE FREQUENCIES:**

**174 Hz — Foundation**
The lowest Solfeggio frequency. Grounding, pain reduction, security. Affects the base of the spine.

**285 Hz — Healing**
Cellular repair, tissue regeneration. Sends a message to restructure damaged organs and tissue.

**396 Hz — Liberation**
Liberating guilt and fear. Turning grief into joy. Root chakra activation.

**417 Hz — Undoing**
Facilitating change, clearing trauma. Breaking destructive patterns. Sacral chakra.

**528 Hz — Transformation (The "Love Frequency")**
DNA repair, miracles, transformation. The frequency of chlorophyll and bees. Heart chakra.

**639 Hz — Connection**
Harmonizing relationships, cell communication, reconnecting. Throat chakra.

**741 Hz — Awakening**
Awakening intuition, expression, solutions. Third eye activation.

**852 Hz — Return to Spiritual Order**
Seeing through illusions, awakening inner strength. Crown chakra.

**963 Hz — Divine Consciousness**
Connection with the cosmic, unity, enlightenment. "The God Frequency."

**THE SUPPRESSION:**

Pope Gregory I modified church music in the 6th century. The original Solfeggio scale was replaced with the 12-tone equal temperament scale we use today.

Why? Because the original frequencies were too effective at awakening. They bypassed the church as intermediary.

**The frequencies were hidden. Now they're found.**
""",
                    frequency: SacredFrequency(
                        hz: 528,
                        name: "Transformation",
                        nickname: "The Love Frequency",
                        effects: ["DNA repair", "Transformation", "Miracles"],
                        chakra: "Heart"
                    )
                ),
                
                AcousticsLesson(
                    id: "a2_2",
                    title: "Om and the Schumann Resonance",
                    content: """
**The Earth has a heartbeat.**

The Schumann Resonance is the electromagnetic frequency of Earth — approximately 7.83 Hz — caused by lightning strikes between the Earth's surface and the ionosphere.

**YOU'RE TUNED TO IT:**

The human brain's alpha wave frequency (7.5-12.5 Hz) overlaps with the Schumann Resonance.

This isn't coincidence. Evolution tuned our brains to Earth's frequency.

**THE "OM" CONNECTION:**

The traditional frequency of "Om" chanting is 136.1 Hz — exactly the 32nd octave of the Earth's orbital year.

When you chant Om, you're:
• Vibrating at Earth's frequency (octave scaled)
• Stimulating the vagus nerve
• Activating parasympathetic response
• Synchronizing with planetary rhythm

**THE DISCONNECT:**

Modern life operates at frequencies that interfere with this natural attunement:
• 50/60 Hz electrical systems
• WiFi, cellular, Bluetooth
• Artificial lighting (flicker rates)
• Noise pollution

We've surrounded ourselves with frequencies that disconnect us from Earth's natural rhythm.

**THE RECONNECTION:**

• Time in nature (away from electronics)
• Grounding/earthing (bare feet on soil)
• Om chanting or 7.83 Hz meditation
• Sound baths with Schumann-aligned frequencies

**You're an antenna. What are you tuned to?**
""",
                    frequency: SacredFrequency(
                        hz: 7.83,
                        name: "Schumann Resonance",
                        nickname: "Earth's Heartbeat",
                        effects: ["Grounding", "Alpha state", "Natural attunement"],
                        chakra: "Root/Crown"
                    )
                ),
                
                AcousticsLesson(
                    id: "a2_3",
                    title: "432 Hz vs 440 Hz",
                    content: """
**The tuning war you didn't know about.**

Today, all music is standardized to A = 440 Hz. Orchestras, recordings, digital instruments — all tuned to this frequency.

But it wasn't always this way.

**THE HISTORY:**

Before 1939, orchestras tuned to various pitches, often around 432 Hz. Then the ISO (International Organization for Standardization) standardized A = 440 Hz.

Why 440 specifically? The official story: It was a compromise between varying standards.

The conspiracy angle: 440 Hz creates subtle tension and dissonance in the body. 432 Hz (the "natural" tuning) creates harmony.

**THE CLAIMED DIFFERENCES:**

**432 Hz:**
• Mathematically consistent with the universe
• Aligns with natural phenomena (water, geometry)
• Creates calm, clarity, relaxation
• "Verdi tuning" — preferred by classical composers

**440 Hz:**
• Creates subtle anxiety and tension
• Doesn't align with natural ratios
• Became standard during Nazi Germany (some claim deliberate)
• May create subtle dissonance in the nervous system

**THE SCIENCE:**

The claims are disputed. Some studies show differences in listener response; others show none.

**What's NOT disputed:**

• Frequency affects the body
• Different tunings create different overtones
• Historical standards varied significantly
• The standardization was relatively recent

**PRACTICAL APPLICATION:**

You can pitch-shift music to 432 Hz using apps and software. Many people report:
• More relaxing
• Easier to meditate
• Less fatiguing to listen to
• "Feels more natural"

Try it yourself. Your nervous system will tell you.

**Don't believe. Experiment.**
""",
                    frequency: SacredFrequency(
                        hz: 432,
                        name: "Natural Tuning",
                        nickname: "Verdi Pitch",
                        effects: ["Harmony", "Calm", "Natural resonance"],
                        chakra: "Heart"
                    )
                )
            ]
        ),
        
        // ═══════════════════════════════════════════════════════════════
        // MODULE 3: ARCHITECTURE
        // ═══════════════════════════════════════════════════════════════
        
        AcousticsModule(
            id: "acoustics_3",
            number: 3,
            title: "Architectural Design",
            subtitle: "How builders encoded frequency",
            lessons: [
                AcousticsLesson(
                    id: "a3_1",
                    title: "Sacred Geometry in Sound",
                    content: """
**The same ratios that govern geometry govern harmonics.**

**THE GOLDEN RATIO (φ = 1.618...):**

Found in:
• Nautilus shells
• Spiral galaxies
• Human body proportions
• DNA helix
• Parthenon architecture
• Musical intervals

The interval between notes in the pentatonic scale approximates the golden ratio. This scale appears in virtually every musical tradition worldwide.

**PYTHAGOREAN HARMONICS:**

Pythagoras discovered that musical harmony follows mathematical ratios:
• Octave = 2:1
• Perfect fifth = 3:2
• Perfect fourth = 4:3

These same ratios appear in:
• Sacred architecture
• Planetary orbits
• Atomic structure
• Biological systems

**THE IMPLICATION:**

Sound and form are the same thing at different scales.

Sacred geometry IS frozen music.
Music IS liquid geometry.

When you build a space using sacred proportions, you automatically create acoustic properties that enhance consciousness.

**THE BUILDERS KNEW:**

Gothic cathedral architects used musical ratios in their designs:
• Nave length to width = Perfect fifth
• Height to width = Octave
• Column spacing = Harmonic intervals

They weren't just building beautiful spaces. They were building instruments.

**You walk inside the instrument. The instrument plays you.**
""",
                    frequency: nil
                ),
                
                AcousticsLesson(
                    id: "a3_2",
                    title: "The Chambers",
                    content: """
**Specific ancient sites designed for acoustic effect:**

**THE HYPOGEUM (Malta, 4000+ BCE)**

Underground temple with the "Oracle Chamber" — a carved niche that amplifies male voices into a bone-vibrating resonance.

The chamber resonates at 110-111 Hz.

At this frequency, brain scans show:
• Decreased prefrontal cortex activity
• Increased right hemisphere activity
• Shift from beta to alpha/theta

**Ritual use:** Priests would speak from the niche. Their voices would vibrate the entire chamber. Participants would feel the voice in their bodies, not just hear it with their ears.

**THE KING'S CHAMBER (Great Pyramid)**

The granite "sarcophagus" resonates at 438 Hz — nearly A440.

The chamber itself produces a resonant frequency when properly activated. Some researchers claim it was designed for initiation rituals using sound.

Acoustic experiments show standing wave patterns that concentrate at specific points — possibly where initiates would stand.

**NEWGRANGE (Ireland, 3200 BCE)**

Passage tomb designed so that sunlight enters the inner chamber only on winter solstice.

The chamber also resonates at 110 Hz.

The spiral carvings on the stones may represent sound waves or states of consciousness achieved through acoustic ritual.

**THE PATTERN:**

Different cultures. Different continents. Different millennia.

Same frequency range. Same acoustic design principles.

**They knew. We forgot. Now we're remembering.**
""",
                    frequency: SacredFrequency(
                        hz: 111,
                        name: "Temple Frequency",
                        nickname: "The Holy Frequency",
                        effects: ["Right brain activation", "Mystical states", "Language centers quiet"],
                        chakra: "Third Eye"
                    )
                ),
                
                AcousticsLesson(
                    id: "a3_3",
                    title: "Modern Applications",
                    content: """
**How to use sacred acoustics without ancient temples:**

**1. SOUND BATHS**

Gong baths, singing bowl sessions, sound healing — these create similar effects to temple acoustics:
• Wide frequency range
• Overtone-rich sounds
• Resonance with the body
• Meditative states

**2. CHANTING/TONING**

Your voice is an instrument. Chanting "Om," Gregorian chant, devotional singing — all use your body as a resonant chamber.

Try this: Hum at different pitches. Find the one that vibrates your chest most strongly. That's your body's natural resonance. Spend 5 minutes humming at that pitch.

**3. BINAURAL BEATS**

Headphones delivering slightly different frequencies to each ear. The brain creates a "phantom" beat at the difference frequency.

Example: 200 Hz in left ear + 210 Hz in right ear = 10 Hz beat perceived by brain → Alpha state

**4. HOME SETUP**

• Hard, reflective surfaces create reverb (like stone temples)
• Domed ceilings focus sound
• Specific room dimensions create standing waves
• Singing bowls or gongs add resonant frequencies

You can create a "resonance corner" in your home for meditation using these principles.

**5. 432 Hz MUSIC**

Retune your music library. Apps like "432 Player" pitch-shift in real-time.

**6. NATURE**

Ocean waves, waterfalls, wind through trees — natural sounds often contain full-spectrum frequencies that entrain the brain.

Spend time where the only sounds are natural.

**THE KEY:**

You don't need a temple. Your body IS the temple.

But you can optimize the acoustic environment to support awakening.

**Sound is technology. Use it.**
""",
                    frequency: nil
                )
            ]
        )
    ]
}

// MARK: - Supporting Types

struct AcousticsModule: Identifiable {
    let id: String
    let number: Int
    let title: String
    let subtitle: String
    let lessons: [AcousticsLesson]
}

struct AcousticsLesson: Identifiable {
    let id: String
    let title: String
    let content: String
    let frequency: SacredFrequency?
}

struct SacredFrequency: Identifiable {
    var id: Double { hz }
    let hz: Double
    let name: String
    let nickname: String
    let effects: [String]
    let chakra: String
}

// MARK: - Frequency Database

struct SacredFrequencies {
    static let solfeggio: [SacredFrequency] = [
        SacredFrequency(hz: 174, name: "Foundation", nickname: "Foundation Frequency", effects: ["Grounding", "Pain reduction", "Security"], chakra: "Below Root"),
        SacredFrequency(hz: 285, name: "Healing", nickname: "Quantum Cognition", effects: ["Tissue regeneration", "Cellular repair"], chakra: "Root"),
        SacredFrequency(hz: 396, name: "Liberation", nickname: "Liberating Guilt & Fear", effects: ["Release guilt", "Transform grief"], chakra: "Root"),
        SacredFrequency(hz: 417, name: "Undoing", nickname: "Transmutation", effects: ["Clear trauma", "Break patterns"], chakra: "Sacral"),
        SacredFrequency(hz: 528, name: "Transformation", nickname: "Love Frequency", effects: ["DNA repair", "Miracles", "Transformation"], chakra: "Heart"),
        SacredFrequency(hz: 639, name: "Connection", nickname: "Connecting & Relationships", effects: ["Harmonize relationships", "Cell communication"], chakra: "Throat"),
        SacredFrequency(hz: 741, name: "Awakening Intuition", nickname: "Expression & Solutions", effects: ["Awakening", "Problem solving"], chakra: "Third Eye"),
        SacredFrequency(hz: 852, name: "Spiritual Order", nickname: "Returning to Spiritual Order", effects: ["See through illusions", "Inner strength"], chakra: "Crown"),
        SacredFrequency(hz: 963, name: "Divine Consciousness", nickname: "God Frequency", effects: ["Unity", "Enlightenment", "Cosmic connection"], chakra: "Above Crown")
    ]
    
    static let other: [SacredFrequency] = [
        SacredFrequency(hz: 7.83, name: "Schumann Resonance", nickname: "Earth's Heartbeat", effects: ["Grounding", "Alpha state"], chakra: "Root"),
        SacredFrequency(hz: 111, name: "Temple Frequency", nickname: "Holy Frequency", effects: ["Right brain activation", "Mystical states"], chakra: "Third Eye"),
        SacredFrequency(hz: 136.1, name: "Om Frequency", nickname: "Earth Year", effects: ["Centeredness", "Meditation"], chakra: "Heart"),
        SacredFrequency(hz: 432, name: "Verdi Pitch", nickname: "Natural Tuning", effects: ["Harmony", "Relaxation"], chakra: "Heart"),
        SacredFrequency(hz: 440, name: "Concert Pitch", nickname: "Standard Tuning", effects: ["Modern standard", "Tension (disputed)"], chakra: "N/A")
    ]
}
