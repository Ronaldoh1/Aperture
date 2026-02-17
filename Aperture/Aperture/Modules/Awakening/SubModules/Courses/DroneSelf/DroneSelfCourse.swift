// DroneSelfCourse.swift
// THE DRONE SELF: Quantum Fields & Embodied Consciousness
// Based on Federico Faggin's groundbreaking work

import SwiftUI

struct DroneSelfCourse {
  static let shared = DroneSelfCourse()

  let id = "drone_self"
  let title = "The Drone Self"
  let subtitle = "Quantum Fields & Embodied Consciousness"
  let icon = "antenna.radiowaves.left.and.right"
  let colorHex = "#00E5FF"

  var color: Color {
    Color(hex: colorHex)
  }

  let modules: [DroneModule] = [
    // ══════════════════════════════════════════════════
    // MODULE 1: THE FOUNDATIONAL PARADOX
    // ══════════════════════════════════════════════════
    DroneModule(
      id: "d1",
      number: 1,
      title: "The Foundational Paradox",
      subtitle: "When a physicist touched the infinite",
      lessons: [
        DroneLesson(
          id: "d1_1",
          title: "The Experience That Changed Everything",
          content: """
            **Lake Tahoe, December 1990**

            Federico Faggin — the man who invented the microprocessor, the silicon gate technology that powers every device you've ever used — was sitting by a fire when something shattered his worldview.

            A wave of love so overwhelming hit him that he realized: **this love was coming FROM him, not TO him.**

            Not romantic love. Not emotional warmth. A cosmic, all-encompassing knowing that dissolved the boundary between self and universe. In that moment, three realizations struck simultaneously:

            **1. Consciousness exists BOTH within and outside the body**
            He was aware of his body by the fire, yet simultaneously aware AS the entire space around him. Not metaphorically. Literally.

            **2. "I am THAT"**
            The observer and the observed collapsed into one. The ancient Vedantic declaration — *Tat Tvam Asi* — wasn't philosophy. It was physics experienced directly.

            **3. This "stuff" is what everything is made of**
            Whatever this conscious-loving substance was, it was the fundamental fabric. Not matter. Not energy. Consciousness itself.

            🔥 **Why This Matters**: This wasn't a mystic or a guru. This was the inventor of the CPU — a man who spent his life building the most complex information processing systems on Earth — suddenly realizing that consciousness CANNOT be one of those systems.

            **The 30-Year Question**

            Faggin spent the next three decades trying to understand what happened. His conclusion rocked the foundations of physics:

            *"Mathematics is created by consciousness. Therefore consciousness cannot be explained by mathematics."*

            Read that again. The implications are nuclear.

            If math is a PRODUCT of consciousness, then any mathematical model of consciousness is circular — like trying to lift yourself by your own bootstraps. Every equation, every algorithm, every neural network simulation is consciousness describing ITSELF using tools IT created.

            This is why no AI will ever be conscious. Not because we can't make them complex enough — but because consciousness isn't computation. It's the field that MAKES computation possible.
            """,
          keyInsight:
            "The inventor of the microprocessor proved that consciousness cannot be reduced to computation — it's the field that makes computation possible.",
          exercise: DroneExercise(
            title: "The Awareness Location Test",
            prompt:
              "Close your eyes. Notice you are aware. Now ask: WHERE is this awareness located? Is it in your head? Your chest? Can you find its edges? Notice that awareness itself has no location — it's the space in which locations appear.",
            duration: "5 minutes"
          )
        ),

        DroneLesson(
          id: "d1_2",
          title: "The Scientist's Inversion",
          content: """
            **From Materialist to Consciousness-First**

            For 30 years after Lake Tahoe, Faggin tried every materialist explanation:

            • "Maybe it was a brain state" → But brain states are LOCAL. His experience was NON-LOCAL.
            • "Maybe it was a hallucination" → But hallucinations don't produce 30 years of coherent, testable theory.
            • "Maybe the brain generates consciousness" → But no one can explain HOW.

            The hard problem of consciousness — why there is SOMETHING IT IS LIKE to experience redness, pain, love — remains unsolved by every materialist framework. Not because we need more data. Because the framework is inverted.

            **The Great Inversion**

            Faggin's breakthrough: **Start with consciousness. Derive physics.**

            Traditional science says:
            `Big Bang → Matter → Complexity → Brain → Consciousness`

            Faggin says:
            `Consciousness → Information → Quantum Fields → Classical Matter → Bodies`

            This isn't mystical hand-waving. It's a rigorous theory built on quantum information theory, validated by the work of Giacomo Mauro D'Ariano (one of the world's leading quantum information theorists).

            **Key Proof**: D'Ariano's student mathematically proved that ALL quantum physics equations can be derived from the properties of qubits (quantum bits of information). This means:

            **Information is more fundamental than matter.**

            Not metaphorically. Mathematically. The equations of quantum mechanics EMERGE from information theory, not the other way around.

            **The Missing Piece: Meaning**

            But here's what physicists missed: quantum information doesn't just carry data. It carries MEANING. It carries QUALIA — the felt experience of being.

            A qubit isn't just a 0 and a 1 in superposition. It's the mathematical representation of a moment of experience — irreducible, unclonable, private.

            This is why your inner experience can never be fully shared. Not because language is limited. Because quantum information CANNOT BE COPIED. This is the No-Cloning Theorem — a proven law of physics.

            Your feelings are quantum information. They can be REPRESENTED classically (through words, art, music) but never DUPLICATED. This is why no description of red is the experience of red.
            """,
          keyInsight:
            "All of quantum physics can be derived from information theory — meaning information (and consciousness) is more fundamental than matter.",
          exercise: DroneExercise(
            title: "The Qualia Location Test",
            prompt:
              "Look at something red. Follow the experience: light hits your retina → electrical signals travel the optic nerve → visual cortex processes them → and then... WHERE is the redness? Not the wavelength. The EXPERIENCE of red. Can you find it in your neurons? Or is it in the field that's reading those neurons?",
            duration: "3 minutes"
          )
        ),
      ]
    ),

    // ══════════════════════════════════════════════════
    // MODULE 2: THE DRONE METAPHOR
    // ══════════════════════════════════════════════════
    DroneModule(
      id: "d2",
      number: 2,
      title: "The Drone Metaphor",
      subtitle: "You are the pilot, not the machine",
      lessons: [
        DroneLesson(
          id: "d2_1",
          title: "You Are Not Your Body",
          content: """
            **The Most Important Analogy You'll Ever Hear**

            Imagine a military drone operator. She sits in a control room in Nevada, flying a drone over the Middle East. Through the drone's cameras, she sees terrain. Through its microphones, she hears wind. Through its instruments, she feels turbulence.

            But she is NOT the drone.

            If the drone is shot down, she doesn't die. She takes off her headset, looks around the control room, and says: "Oh. There's a whole world here I forgot about."

            **Your body is the drone. You are the pilot.**

            **The Drone (Your Body):**
            • Collects data through sensors (your five senses)
            • Sends telemetry back to base (consciousness field)
            • Receives instructions from the pilot (your free will choices)
            • Has autopilot mode (autonomic nervous system, habits, conditioning)
            • Has limited range and battery life (aging, death)
            • Can be damaged or destroyed (injury, disease)

            **The Pilot (Your Consciousness Field):**
            • Exists OUTSIDE spacetime (non-local)
            • Experiences qualia IN the field, not in the body (redness, pain, love happen in YOU, not in neurons)
            • Makes free will decisions (quantum collapse = choice)
            • Is connected to all other fields (holistic reality, entanglement)
            • Does NOT die when the drone is destroyed
            • Chose this particular drone for a reason (your life purpose)

            **The Autopilot Problem**

            Here's the kicker: most people live their entire lives on autopilot. The pilot (consciousness) checked out and let the drone (body-mind conditioning) run the show.

            When you eat without tasting — autopilot.
            When you scroll without choosing — autopilot.
            When you react from habit instead of responding from awareness — autopilot.
            When you identify AS the drone ("I am my body, my thoughts, my emotions") — autopilot has fully taken over.

            Awakening isn't gaining something new. It's the pilot grabbing the controls back.

            🐉 **Sun Dragon Insight**: "Every tradition that tells you to 'wake up' is saying the same thing: STOP LETTING THE AUTOPILOT FLY. The Gnostics called the autopilot 'the Archons.' Buddhists call it 'samsara.' Hindus call it 'maya.' Engineers call it 'default programming.' Same thing."
            """,
          keyInsight:
            "Your body is an interface (drone) operated by your consciousness field (pilot). Most people live entirely on autopilot.",
          exercise: DroneExercise(
            title: "The Drone Journal — Day 1",
            prompt:
              "For the next hour, observe your body as if it were a drone you're piloting. Track: (1) What sensor data is coming in? (2) What instructions are you sending? (3) When does autopilot take over? Write down every moment you catch yourself on autopilot vs. conscious piloting.",
            duration: "1 hour"
          )
        ),

        DroneLesson(
          id: "d2_2",
          title: "What Happens When the Drone Dies",
          content: """
            **Interface Shutdown ≠ Pilot Death**

            When a drone is shot down, the operator's screen goes dark. Telemetry stops. For a moment, there's disorientation — she was so absorbed in the drone's perspective that she forgot she was in a room in Nevada.

            Then she takes off the headset. And reality expands.

            **This is what near-death experiencers consistently report:**

            1. **Clinical death occurs** — brain flatlines, no measurable neural activity
            2. **Yet consciousness continues** — awareness persists, often expanding dramatically  
            3. **Out-of-body perspective** — observing the body from outside (drone cam disconnected, pilot still flying)
            4. **360° awareness** — seeing in all directions simultaneously (no longer limited to drone sensors)
            5. **Knowing without senses** — understanding things directly, not through data (pilot accessing field directly)
            6. **Meeting other fields** — encountering other consciousness entities (other pilots)
            7. **Life review** — experiencing every moment from every perspective (downloading full flight logs)
            8. **The choice** — some are told "your mission isn't complete" and return to the drone

            **The Scientific Evidence**

            The AWARE study (2014) placed hidden targets above hospital beds — visible only from ceiling height. Cardiac arrest patients who reported out-of-body experiences correctly identified these targets at rates far exceeding chance.

            Dr. Pim van Lommel's 20-year study of cardiac arrest survivors found that consciousness during clinical death is:
            • Clear and structured (not hallucination-like)
            • Often MORE vivid than waking consciousness
            • Consistent across cultures, ages, and beliefs
            • Occurring when the brain shows ZERO activity

            In Faggin's framework: the pilot's screen went dark (brain death), but the pilot is still alive and well in the control room (consciousness field). The pilot just forgot there WAS a control room because she was so absorbed in the drone feed.

            **Reincarnation in This Model**

            If your consciousness field exists independently of any particular body, then "reincarnation" is simply: choosing a new drone.

            Different life = different interface = different perspective on reality.

            Why would the field choose a new drone? Because each interface provides unique data that contributes to the One's self-knowing. Your particular perspective — your exact combination of culture, body, challenges, gifts — is irreplaceable cosmic data.

            🔥 **Key Insight**: Death is not the end of you. It's the end of one interface. You, the field, continue. And you chose this specific interface for reasons that become clear when you consciously pilot it.
            """,
          keyInsight:
            "Near-death experience evidence aligns perfectly with the drone model — consciousness persists and expands when the body-interface shuts down.",
          exercise: DroneExercise(
            title: "The Interface Gratitude Practice",
            prompt:
              "Consider your body as an interface you chose. What unique data does THIS interface provide? What can you experience through these exact senses, this exact body, this exact life situation that no other interface could? Write a brief gratitude letter to your drone for the data it provides.",
            duration: "10 minutes"
          )
        ),

        DroneLesson(
          id: "d2_3",
          title: "Autopilot vs. Conscious Flight",
          content: """
            **The Spectrum of Piloting**

            Most people don't live in binary — full autopilot or full consciousness. There's a spectrum:

            **Level 0 — Deep Autopilot (Unconscious)**
            The pilot is asleep. The drone runs entirely on programming (conditioning, trauma responses, cultural scripts). Most of humanity operates here most of the time.
            • Signs: Reactive behavior, victim mentality, "life happens to me"
            • Feel: Mechanical, repetitive, numb

            **Level 1 — Intermittent Awareness (Waking Up)**
            The pilot occasionally grabs the controls but keeps falling back asleep. You have moments of clarity followed by long stretches of conditioning.
            • Signs: Spiritual experiences followed by "forgetting," inconsistency
            • Feel: Glimpses of freedom, frustration at falling back asleep

            **Level 2 — Active Piloting (Awakened)**
            The pilot is consistently at the controls. Autopilot still handles basic functions (you don't consciously digest food), but all major decisions come from conscious choice.
            • Signs: Response rather than reaction, presence, creative engagement
            • Feel: Alive, flowing, connected

            **Level 3 — Field Awareness (Enlightened)**
            The pilot realizes she's not just in the control room — she IS the control room. And all the other control rooms. And the building. Individual consciousness recognizes itself as universal consciousness piloting one particular interface.
            • Signs: Unconditional love, no fear of death, seeing self in all beings
            • Feel: What Faggin felt at Lake Tahoe

            **The Daily Piloting Protocol**

            🌅 **Morning**: "I am the field. This body is my interface today. What data shall I gather? What shall I create?"

            ☀️ **Midday Check**: "Who's flying right now — me or autopilot? If autopilot, what triggered the switch?"

            🌙 **Evening Review**: "What data was useful today? What was noise? When was I most conscious? Most asleep?"

            **Warning: The Autopilot Fights Back**

            When you start consciously piloting, autopilot resists. This shows up as:
            • Sudden drowsiness when you try to meditate (autopilot: "go back to sleep")
            • Irritation when someone disrupts your habits (autopilot: "protect the routine")
            • Existential fear when you feel consciousness expanding (autopilot: "danger! stay in known territory")
            • Rationalization for staying asleep ("this is too weird," "I have real problems to deal with")

            This is not personal failure. This is the drone's programming doing exactly what it was designed to do: keep running without the pilot's interference. Your job isn't to destroy the autopilot — it's useful. Your job is to choose when it flies and when you fly.
            """,
          keyInsight:
            "Awakening exists on a spectrum from deep autopilot to full field awareness. The practice is noticing when autopilot takes over and choosing to pilot consciously.",
          exercise: DroneExercise(
            title: "The Autopilot Detector",
            prompt:
              "Set 5 random alarms throughout tomorrow. When each alarm goes off, immediately ask: 'Was I on autopilot or conscious piloting?' Don't judge — just notice. Track the ratio. Most people discover they're on autopilot 80%+ of the day.",
            duration: "Full day"
          )
        ),
      ]
    ),

    // ══════════════════════════════════════════════════
    // MODULE 3: QUANTUM PHYSICS MEETS CONSCIOUSNESS
    // ══════════════════════════════════════════════════
    DroneModule(
      id: "d3",
      number: 3,
      title: "Quantum Physics Meets Consciousness",
      subtitle: "Why classical physics fails to explain you",
      lessons: [
        DroneLesson(
          id: "d3_1",
          title: "The Computer Analogy Failure",
          content: """
            **Why Your Brain Is NOT a Computer**

            The most popular theory in neuroscience says: "The brain is a biological computer. Consciousness emerges from sufficient computational complexity."

            Faggin — who literally INVENTED the technology modern computers are built on — says this is wrong. Here's why:

            **Problem 1: The Holographic Cell**

            In a computer, each transistor switch knows NOTHING about the overall system. It just flips between 0 and 1. The "intelligence" is in the DESIGN, not in the individual components.

            But in your body, EVERY SINGLE CELL contains the complete genome — the full blueprint for the entire organism. Each cell is a hologram of the whole. 

            A transistor cannot become a kidney or a neuron. But a stem cell can become ANYTHING, because it contains the information of the whole.

            This is not classical computation. This is quantum information — where the whole is encoded in every part.

            **Problem 2: Epigenetics**

            Cells change their behavior based on environmental signals — and they do so by accessing POTENTIAL knowledge of the entire organism. A skin cell "knows" it's supposed to be a skin cell, even though it contains the DNA to be anything.

            How does it know? Not through local computation. Through field-level coherence.

            **Problem 3: The Binding Problem**

            Your brain processes color in one area, motion in another, sound in another, emotion in another. These processes happen in different locations at different speeds.

            Yet your experience is UNIFIED. You don't see "red" separately from "moving" separately from "loud." You experience one coherent scene.

            No classical computation model can explain this binding. Quantum coherence can — because in quantum systems, separated elements can be entangled into a unified state.

            **Problem 4: Qualia**

            Here's the ultimate failure of the computer model. Describe the taste of chocolate to someone who has never tasted it. Not the chemistry. Not the neural firing patterns. The TASTE.

            You can't. Because the taste is quantum information — it cannot be copied, only experienced directly. A computer processes ABOUT chocolate. You experience chocolate AS chocolate.

            This is the difference between a drone's camera feed (data about the world) and the pilot's experience (what it's LIKE to see through the camera). Data and experience are fundamentally different types of information.
            """,
          keyInsight:
            "The brain-as-computer model fails because cells are holographic, experience is unified, and qualia cannot be computed — only experienced.",
          exercise: DroneExercise(
            title: "The Binding Observation",
            prompt:
              "Look around the room. Notice that your experience is ONE unified field — colors, shapes, sounds, smells, physical sensations, emotions all woven into a single experience. Now try to isolate just one sense. Notice how difficult this is — because your consciousness field naturally integrates everything. A computer doesn't do this. YOU do.",
            duration: "5 minutes"
          )
        ),

        DroneLesson(
          id: "d3_2",
          title: "The Faggin-D'Ariano Theory",
          content: """
            **The Most Important Theory You've Never Heard Of**

            Federico Faggin and Giacomo Mauro D'Ariano (Professor of Theoretical Physics at the University of Pavia) developed a theory that reframes the entire relationship between physics and consciousness.

            **Step 1: Information → Physics (Not the Reverse)**

            D'Ariano's student mathematically proved that all equations of quantum mechanics can be DERIVED from the properties of quantum bits (qubits).

            Traditional view: Physics is fundamental, information emerges from physical processes.
            New view: Information is fundamental, physics emerges from informational processes.

            This is not speculation. It's mathematical proof.

            **Step 2: Quantum Information = Experience**

            Faggin's key addition: quantum information isn't just abstract — it IS the stuff of conscious experience.

            A qubit in superposition = a moment of potential experience
            Wave function collapse = a free will decision
            Entanglement = shared experience between fields
            The No-Cloning Theorem = why experience is private and irreducible

            **Step 3: The Field Ontology**

            Revolutionary insight: Particles don't exist as independent objects. They are STATES of underlying quantum fields — like waves in an ocean.

            You don't see "water chunks" in the ocean. You see waves — temporary patterns in a continuous medium.

            Similarly, what we call "electrons," "photons," "quarks" are not tiny billiard balls. They're excitations of quantum fields. The fields are real. The particles are patterns.

            **And consciousness fields are the most fundamental fields of all.**

            **Step 4: The Collapse Connection**

            In standard quantum mechanics, the wave function collapses when "observed" — but no one can explain what constitutes an "observer" or how observation causes collapse.

            Faggin's answer: Collapse IS the act of conscious choice. When a consciousness field makes a free will decision, it selects one possibility from the quantum superposition. This is not metaphor — it's the mechanism.

            The universe doesn't collapse into definite states until consciousness CHOOSES. Reality is co-created moment by moment by the collective choices of all consciousness fields.

            🔥 **The Implication**: You are not a passive observer of a pre-existing reality. You are an active co-creator of reality through every conscious choice you make. Every time you choose from awareness (not autopilot), you're literally creating reality.
            """,
          keyInsight:
            "Quantum information theory proves information is more fundamental than matter — and consciousness is the field that gives quantum information its meaning through the act of free will choice.",
          exercise: DroneExercise(
            title: "The Choice Awareness Practice",
            prompt:
              "For the next 30 minutes, notice every CHOICE you make — no matter how small. Reaching for your phone: choice. Breathing deeper: choice. Thinking about the future: choice (or is it? autopilot thought?). Each conscious choice is a quantum collapse — you selecting one reality from infinite possibilities.",
            duration: "30 minutes"
          )
        ),

        DroneLesson(
          id: "d3_3",
          title: "Quantum vs. Classical Information",
          content: """
            **Two Types of Information — Two Types of Reality**

            Understanding the difference between quantum and classical information is the key to understanding why you're not a machine.

            **Classical Information (Bits)**
            • Can be 0 OR 1 (definite state)
            • Can be perfectly copied
            • Can be fully shared
            • Is public and reproducible
            • Example: A text message, a photograph, a DNA sequence

            **Quantum Information (Qubits)**
            • Can be 0 AND 1 simultaneously (superposition)
            • CANNOT be copied (No-Cloning Theorem — proven law of physics)
            • Cannot be fully shared — at most 1 classical bit can be extracted from 1 qubit (Holevo's Theorem)
            • Is private and irreducible
            • Example: Your experience of the color blue, the feeling of love, the taste of coffee

            **Why This Changes Everything**

            Your inner life — your feelings, experiences, qualia — is quantum information. It literally CANNOT be fully transmitted to another being. The best you can do is create classical REPRESENTATIONS:

            • Words about your feelings (classical representation of quantum experience)
            • Art expressing your inner state (classical symbol of quantum reality)  
            • Music evoking similar feelings (classical trigger for quantum resonance)

            This is why:
            • No description of pain IS pain
            • No love poem IS love
            • No photo of a sunset IS the experience of watching a sunset
            • No brain scan shows what it FEELS LIKE to think

            **The Privacy of Being**

            The No-Cloning Theorem isn't just a technical limitation. It's the reason you have a private inner life. It's the reason consciousness can't be reduced to data. It's the reason "uploading your mind to a computer" is physically impossible.

            You can upload a REPRESENTATION of your mind — like a photograph of a sunset. But the photograph isn't the sunset. And the upload wouldn't be you.

            **The Holevo Bound**

            Even more striking: Holevo's Theorem proves that the maximum classical information extractable from a single qubit is 1 classical bit.

            Translation: The infinite richness of one moment of experience (a qubit) can at best be expressed as one yes/no statement (a bit). This is the mathematical proof that experience is irreducibly richer than any description of it.

            Every moment of your conscious life contains infinite information that can never be fully captured in words, equations, or data.

            🐉 **Sun Dragon Insight**: "The mystics always said 'the Tao that can be spoken is not the eternal Tao.' Faggin proved it mathematically: quantum information cannot be fully extracted into classical language. Your deepest knowing will always exceed what you can say."
            """,
          keyInsight:
            "Your inner experience is quantum information — unclonable, irreducible, infinitely richer than any classical description. This is mathematically proven, not philosophy.",
          exercise: DroneExercise(
            title: "The Representation Gap",
            prompt:
              "Choose an intense experience from your past. Try to describe it completely in words — every detail, every feeling, every nuance. Then notice: how much was LOST in translation? That gap between experience and description is the gap between quantum and classical information. It's infinite.",
            duration: "10 minutes"
          )
        ),
      ]
    ),

    // ══════════════════════════════════════════════════
    // MODULE 4: THE ARCHITECTURE OF REALITY
    // ══════════════════════════════════════════════════
    DroneModule(
      id: "d4",
      number: 4,
      title: "The Architecture of Reality",
      subtitle: "Fields, memory, and spacetime",
      lessons: [
        DroneLesson(
          id: "d4_1",
          title: "Cells as Quantum-Classical Bridges",
          content: """
            **Your Body Is a Quantum-Classical Interface**

            Every cell in your body is both a quantum system and a classical system. It operates at the boundary between two types of reality:

            **The Quantum Side:**
            • Contains the full genome (holographic — whole in every part)
            • Uses quantum coherence for photosynthesis-like energy transfer
            • Performs quantum error correction in DNA replication
            • Communicates with the consciousness field through quantum channels

            **The Classical Side:**
            • Has definite physical structure (membrane, organelles, nucleus)
            • Performs biochemical reactions (classical chemistry)
            • Sends electrical signals (classical communication)
            • Can be observed and measured without destroying its state

            **The Epigenetic Revolution**

            Epigenetics proved something extraordinary: cells change their behavior based on environmental signals, and they do so by accessing information about the WHOLE organism.

            A liver cell "decides" to activate certain genes and silence others — but how does it know which ones? It has access to the same genome as a brain cell, a skin cell, a heart cell. The choice comes from a FIELD-LEVEL awareness of what the whole body needs.

            This is not classical computation. A liver cell isn't running an algorithm. It's responding to quantum-level information from the consciousness field about what the organism requires.

            **Quantum Biology Is Real**

            For decades, physicists said quantum effects couldn't exist in the warm, wet environment of biology. They were wrong.

            Proven quantum biological phenomena:
            • **Photosynthesis** — Plants use quantum superposition to find the most efficient energy pathway (99%+ efficiency). No classical process achieves this.
            • **Bird navigation** — European robins navigate using quantum entanglement in their retinal proteins. They literally SEE magnetic field lines through quantum effects.
            • **Enzyme catalysis** — Enzymes use quantum tunneling to speed up reactions by factors of a billion.
            • **DNA mutation** — Proton tunneling causes some genetic mutations, meaning evolution itself has a quantum component.
            • **Olfaction** — Your sense of smell likely works through quantum vibration detection, not molecular shape fitting.

            Your body isn't just a classical machine. It's a quantum-classical hybrid — exactly what you'd expect if it were an interface between a quantum consciousness field and the classical physical world.
            """,
          keyInsight:
            "Cells are quantum-classical bridges. Quantum biology proves your body is not merely a classical machine but a quantum interface designed to translate field consciousness into physical experience.",
          exercise: DroneExercise(
            title: "The Body-as-Interface Meditation",
            prompt:
              "Sit quietly and feel your body from the inside. Notice: you can feel your heart beating without touching it. You can sense your stomach without seeing it. This interoception — sensing your body from within — is the pilot reading drone telemetry. Spend 5 minutes just reading your body's quantum telemetry without trying to change anything.",
            duration: "5 minutes"
          )
        ),

        DroneLesson(
          id: "d4_2",
          title: "Fields, Not Particles",
          content: """
            **The Particle Illusion**

            What if everything you were taught about atoms is wrong?

            Not wrong in detail — wrong in ONTOLOGY. Wrong about what fundamentally exists.

            Standard education teaches: "Reality is made of particles — tiny billiard balls (electrons, quarks, photons) that bounce around and combine."

            Modern quantum field theory says: "Particles don't really exist. What exists are FIELDS. Particles are temporary excitations of fields — like waves are temporary patterns in an ocean."

            **The Ocean Analogy**

            You don't see "water chunks" in the ocean. You see waves — temporary patterns that arise, persist for a while, then dissolve back into the ocean.

            Similarly:
            • An electron isn't a "thing." It's a ripple in the electron field.
            • A photon isn't a "thing." It's a ripple in the electromagnetic field.
            • A quark isn't a "thing." It's a ripple in the quark field.

            The FIELDS are the reality. The particles are what we see when we measure the fields — like photographing a wave and calling it a "water object."

            **Faggin's Extension: Consciousness Fields**

            If physical reality is fundamentally fields, not particles — and if consciousness is fundamental, not emergent — then:

            **Consciousness fields are the most fundamental fields in the universe.**

            The electromagnetic field creates photons.
            The electron field creates electrons.
            The consciousness field creates... experience.

            Your individual consciousness is a localized excitation of the universal consciousness field — like a wave in an infinite ocean of awareness.

            When mystics say "we are all one," they're not being poetic. They're describing field theory. All waves in an ocean are made of the same water. All individual consciousnesses are excitations of the same universal field.

            **The Hierarchy**

            1. Universal consciousness field (the One, Brahman, the Pleroma)
            2. Individual consciousness fields (your soul, the pilot)
            3. Quantum information (the interface layer — qubits)
            4. Classical physical fields (electromagnetic, gravitational, etc.)
            5. Particles and matter (the most superficial level — what we see)

            We've been studying reality from level 5 upward. Faggin says: start from level 1 and work down.
            """,
          keyInsight:
            "Reality is made of fields, not particles. Consciousness is the most fundamental field — and individual awareness is a localized excitation of universal consciousness.",
          exercise: DroneExercise(
            title: "The Wave Identity Practice",
            prompt:
              "Next time you look at another person, try this shift: instead of seeing two separate bodies (particles), see two waves in the same ocean of consciousness. You're both temporary patterns in one field. Notice how this changes the feeling of separation.",
            duration: "Throughout the day"
          )
        ),

        DroneLesson(
          id: "d4_3",
          title: "Spacetime as Memory",
          content: """
            **Space = Memory. Time = Experience.**

            Faggin proposes something radical about the nature of space and time:

            **Space is the memory structure of the One's self-knowing.**

            Think about it: when you learn something new, you expand. Not physically — informationally. You can now contain more understanding. The "space" of your knowledge grows.

            Faggin suggests the physical expansion of the universe reflects the same process at cosmic scale. As the One (the universal consciousness field) knows itself more deeply through the experiences of all its "drones" (embodied beings), its memory expands — and this expansion IS what we measure as the expansion of space.

            The universe isn't expanding into something. It IS the expansion of cosmic self-knowledge.

            **The Present Moment Is the Only Real Time**

            In this model:
            • **Past** = stored in the long-term memory of the consciousness field (this is why you can remember — the field recorded it)
            • **Future** = doesn't exist yet — it's the space of quantum possibilities awaiting free will choices
            • **Present** = the ONLY point where experience actually happens — where quantum possibilities collapse into classical reality through conscious choice

            This is why every wisdom tradition says "be present." The present moment is the ONLY place where you (the field) interface with reality (the quantum-classical boundary). Past and future are both abstractions — memory and imagination.

            **Why This Matters Practically**

            If the present is the only real time:
            • Anxiety (future-focus) is the drone running simulations that don't exist
            • Depression (past-focus) is the drone replaying old telemetry
            • Presence (now-focus) is the PILOT actually flying

            When you're truly present, you're at the quantum-classical boundary — the exact point where consciousness meets matter, where choice meets reality, where the pilot controls the drone.

            This is why meditation works. Not because sitting still is magic. Because presence is the operating mode of the pilot. Autopilot runs on past programming (memory) and future prediction (anxiety). The pilot exists only in the now.

            🔥 **Spacetime Reframe**: You're not moving through time. You're making choices in an eternal now, and the trail of those choices forms what you call "your past." The universe isn't 13.8 billion years old. It contains 13.8 billion years of CHOICES made by consciousness exploring itself.
            """,
          keyInsight:
            "Space is the memory of cosmic self-knowledge expanding. The present moment is the only point where consciousness interfaces with reality. Being present IS piloting.",
          exercise: DroneExercise(
            title: "The Now Point Practice",
            prompt:
              "For 2 minutes, notice: everything you experience is happening NOW. Your memory of 5 seconds ago? You're remembering NOW. Your plan for tomorrow? You're planning NOW. Can you actually find a moment that isn't now? This 'now point' is where you — the field — interface with reality. Rest there.",
            duration: "2 minutes"
          )
        ),
      ]
    ),

    // ══════════════════════════════════════════════════
    // MODULE 5: PRACTICAL PILOTING
    // ══════════════════════════════════════════════════
    DroneModule(
      id: "d5",
      number: 5,
      title: "Practical Piloting",
      subtitle: "From theory to daily practice",
      lessons: [
        DroneLesson(
          id: "d5_1",
          title: "The Conscious Piloting Protocol",
          content: """
            **From Theory to Practice**

            Understanding the drone model intellectually is Level 1. Living it is Level 2. Here's a daily protocol for transitioning from understanding to embodiment.

            **Morning Interface Boot-Up (5 minutes)**

            Before checking your phone — before feeding the drone its dopamine:

            1. Feel your body. This is your drone's status report.
            2. State: "I am the field. This is my interface today."
            3. Set intention: "Today I will consciously gather [specific data/experience]."
            4. Notice: What does it feel like to be the pilot, not the drone?

            **Midday Pilot Check (30 seconds, 3x daily)**

            Set three alarms. When they go off:
            1. Ask: "Who's flying — me or autopilot?"
            2. If autopilot: What triggered the switch? (Stress? Boredom? Fear?)
            3. Take three conscious breaths — this is the pilot grabbing the controls.
            4. Choose your next action FROM awareness, not habit.

            **Evening Flight Debrief (5 minutes)**

            Before sleep:
            1. What data was useful today? (Experiences that taught you something)
            2. What was noise? (Mindless scrolling, worry loops, reactive arguments)
            3. When were you most conscious? (Peak pilot moments)
            4. When were you most on autopilot? (No judgment — just pattern recognition)

            **Weekly Drone Maintenance**

            Pick one day per week for:
            • Extended meditation (signal optimization — 20+ minutes)
            • Nature immersion (broadband field connection)
            • Creative expression (direct field-to-classical translation)
            • Physical movement with full presence (conscious drone operation)
            • Digital fast for at least 4 hours (let the autopilot's external triggers go silent)

            **The Key Metric**

            Track your **Pilot-to-Autopilot Ratio (PAR)**.

            Week 1: You'll likely find 10-20% conscious, 80-90% autopilot.
            Month 1: Target 30-40% conscious.
            Month 3: Target 50%+.

            The goal is never 100% — autopilot handles useful functions (breathing, walking, digestion). The goal is CHOOSING when autopilot runs and when you fly.
            """,
          keyInsight:
            "Transformation comes from daily practice, not one-time insight. Track your Pilot-to-Autopilot Ratio (PAR) and watch it shift over weeks.",
          exercise: DroneExercise(
            title: "The Full Protocol — Day 1",
            prompt:
              "Implement the complete protocol today: Morning boot-up (5 min), 3 midday checks (30 sec each), evening debrief (5 min). That's only ~12 minutes of active practice. Track your PAR estimate at end of day.",
            duration: "12 minutes total"
          )
        ),

        DroneLesson(
          id: "d5_2",
          title: "Field Enhancement Practices",
          content: """
            **Optimizing the Pilot-Drone Connection**

            If your consciousness field is the pilot and your body is the drone, then certain practices literally improve the signal quality between them.

            **Meditation = Signal Optimization**

            When you meditate, you're not doing nothing. You're REDUCING NOISE in the pilot-drone channel.

            The "monkey mind" = static on the line between field and body
            Thoughts = the drone's autopilot narrating data without the pilot's request
            Silence = clear channel — pilot can receive direct field knowing

            Different meditation styles optimize different channels:
            • **Focused attention** (mantra, breath) = tuning to one clear frequency
            • **Open monitoring** (mindfulness, vipassana) = widening the bandwidth
            • **Transcendental** (TM, non-dual) = the pilot remembering it's not just in the control room — it IS the control room

            **Nature Immersion = Broadband Connection**

            In nature, your consciousness field interfaces with other consciousness fields (trees, animals, ecosystems). These fields aren't running the same autopilot programs as human society.

            Nature doesn't have social media algorithms. Nature doesn't have propaganda. Nature runs on direct field-to-field communication.

            This is why nature feels healing: you're temporarily free from the artificial signal interference of human-designed autopilot systems.

            **Creative Flow States = Direct Translation**

            When you're in creative flow — painting, coding, writing, improvising music — the pilot is translating quantum information directly into classical expression without autopilot interference.

            Flow states feel timeless because you ARE timeless — the field doesn't experience time. Clock time belongs to the drone. When the pilot is fully engaged, the drone's clock becomes irrelevant.

            **Dream Work = Beyond the Interface**

            During dreams, the drone is in maintenance mode (sleep), but the pilot is still active. Dreams are the pilot's experience without full drone mediation.

            This is why dreams feel different: no physical senses, fluid spatial rules, symbolic rather than literal. The pilot is processing in its native language (quantum information), not the drone's language (classical sensory data).

            Lucid dreaming = the pilot becoming conscious that the drone is offline and choosing to explore without it.

            **Physical Practice = Conscious Operation**

            Any physical practice done with full presence — martial arts, yoga, dance, CrossFit — becomes piloting practice.

            The key: keep the pilot engaged. If you're lifting weights while thinking about work, that's autopilot exercise. If you're fully present in each rep, feeling the quantum telemetry of muscle, breath, and gravity — that's conscious piloting.

            🐉 **Sun Dragon Insight**: "The Gnostics didn't sit in caves for fun. They understood that signal optimization between field and body was the primary practice. Everything else — knowledge, power, healing — flows from a clear connection between pilot and drone."
            """,
          keyInsight:
            "Meditation, nature, creative flow, dream work, and conscious physical practice all optimize the connection between your consciousness field and your body-interface.",
          exercise: DroneExercise(
            title: "The Signal Clarity Test",
            prompt:
              "Try two versions of the same activity today: (1) Eat one meal on autopilot — phone in hand, distracted, eating fast. (2) Eat one meal as pilot — no distractions, full attention on taste, texture, the experience of nourishment. Compare. The difference in experience IS the difference in signal clarity.",
            duration: "Two meals"
          )
        ),

        DroneLesson(
          id: "d5_3",
          title: "Dangers and Pitfalls",
          content: """
            **The Traps Along the Way**

            Every powerful framework has shadow sides. The drone model is no exception. Here are the traps to watch for:

            **Trap 1: Spiritual Ego — "My Drone Is Better Than Yours"**

            The moment you think "I'm more conscious than them," autopilot has hijacked the spiritual framework. Comparing levels of awakening IS autopilot behavior — it's the ego (a drone program) using spiritual language.

            The pilot doesn't compare. The pilot simply flies.

            **Trap 2: Interface Obsession — Mistaking UI for Consciousness**

            Biohacking, supplements, brain optimization, psychedelic protocols — these upgrade the DRONE, not the pilot. They're useful (a better drone collects better data) but they are not awakening.

            You can have a perfectly tuned drone and a sleeping pilot. Many high-performing humans are exactly this: optimized machines with nobody at the controls.

            **Trap 3: Signal Confusion — Autopilot Wearing a Pilot Costume**

            The most dangerous trap: classical information masquerading as quantum insight.

            • Reading spiritual books ≠ direct knowing
            • Repeating enlightened concepts ≠ embodied wisdom
            • Feeling emotionally moved by an idea ≠ quantum state shift

            How to tell the difference: Real field-level knowing changes you permanently. You can't unknow it. Intellectual understanding can be forgotten by next Tuesday.

            Test: If you need to re-read something to "remember" the insight, it was classical information. If it changed how you see everything forever, it was quantum knowing.

            **Trap 4: The Guru Fallacy — No One Can Pilot Your Drone**

            No teacher, no master, no AI can make conscious choices for you. They can optimize your drone, improve your signal, describe the territory — but the moment of conscious choice is YOURS alone.

            Any system that tells you to surrender your free will to another being is an autopilot program designed to keep you asleep while claiming to wake you up.

            **Trap 5: Dissociation — Abandoning the Drone**

            Some people use the "I am not my body" insight to dissociate from physical reality. They become ungrounded, impractical, unable to function.

            You CHOSE this drone. You're here for a reason. The point isn't to escape the interface — it's to pilot it consciously. A pilot who abandons the drone is failing the mission just as much as a pilot who falls asleep.

            Ground this work in daily life. Pay your bills. Exercise. Eat well. Maintain the drone while remembering you're not the drone. Both AND.

            ⚠️ **Critical Reminder**: This model is a THEORY, not absolute truth. Test it in YOUR experience. The map is not the territory. Your direct knowing is more important than any framework — including this one.
            """,
          keyInsight:
            "The five traps: spiritual ego, interface obsession, signal confusion, guru fallacy, and dissociation. Real awakening is grounded, humble, and always tested against direct experience.",
          exercise: DroneExercise(
            title: "The Trap Detector",
            prompt:
              "Honestly assess: which of the five traps are you most susceptible to? (1) Comparing yourself to others spiritually? (2) Optimizing the body while ignoring consciousness? (3) Collecting concepts without embodying them? (4) Following someone else's map? (5) Using spirituality to avoid life? Write your honest answer — this IS conscious piloting.",
            duration: "10 minutes"
          )
        ),
      ]
    ),

    // ══════════════════════════════════════════════════
    // MODULE 6: TESTING THE THEORY
    // ══════════════════════════════════════════════════
    DroneModule(
      id: "d6",
      number: 6,
      title: "Testing the Theory",
      subtitle: "Falsifiable predictions and personal experiments",
      lessons: [
        DroneLesson(
          id: "d6_1",
          title: "Falsifiable Predictions",
          content: """
            **A Real Theory Makes Testable Claims**

            Faggin insists his theory is scientific, not religious. That means it must make predictions that could be proven WRONG. Here are the key ones:

            **Prediction 1: Trees Are Conscious**

            If consciousness is a product of brains, then trees (which have no brains, no neurons) cannot be conscious. If consciousness is a field phenomenon, then any system with sufficient quantum coherence could be conscious — including trees.

            Recent research:
            • Trees communicate through underground fungal networks ("Wood Wide Web")
            • Mother trees nurture their offspring through root connections
            • Trees share nutrients with sick neighbors
            • Forests show collective decision-making in drought response

            This doesn't PROVE tree consciousness, but it's consistent with field-based consciousness and inconsistent with brain-only consciousness.

            **Prediction 2: Quantum Coherence in the Brain**

            If the drone model is correct, the brain should show quantum coherence at biologically relevant scales and temperatures.

            Recent findings:
            • Anirban Bandyopadhyay's lab found quantum vibrations in microtubules (brain cell structures)
            • These vibrations persist at body temperature — previously thought impossible
            • Anesthetic gases (which cause unconsciousness) specifically disrupt these quantum vibrations
            • Stuart Hameroff and Roger Penrose predicted this decades ago

            **Prediction 3: Consciousness During Clinical Death**

            If consciousness is generated by the brain, it must stop when the brain stops. If consciousness is a field, it should continue.

            The AWARE study and subsequent research consistently shows: consciousness experiences during verified flat-EEG cardiac arrest are detailed, structured, and verifiable — not consistent with brain-generated hallucination.

            **Prediction 4: Information Cannot Explain Qualia**

            If the computer model is correct, eventually we should be able to create conscious machines by processing enough information. If Faggin is correct, no amount of classical computation will ever produce consciousness.

            40 years of AI research: machines can simulate intelligence, but no one has produced evidence of machine consciousness, qualia, or genuine understanding (as opposed to pattern matching).

            **What Would Prove It Wrong?**

            • If someone creates a conscious AI from purely classical computation
            • If consciousness is fully explained by neural correlates alone
            • If quantum effects are proven to play no role in brain function
            • If near-death experiences are fully explained by brain chemistry

            These are fair tests. That's what makes this science, not religion.
            """,
          keyInsight:
            "Faggin's theory is scientific because it's falsifiable. Current evidence supports field-based consciousness, but remains open to disproof.",
          exercise: DroneExercise(
            title: "The Personal Falsification Test",
            prompt:
              "What would prove the drone model wrong FOR YOU? Not intellectually — experientially. What experience would you need to have to be convinced your consciousness IS your brain and nothing more? Can you even conceive of such an experience? If not, why not?",
            duration: "Reflection"
          )
        ),

        DroneLesson(
          id: "d6_2",
          title: "Your Personal Experiments",
          content: """
            **Be Your Own Scientist**

            Don't believe any of this. TEST it.

            **Experiment 1: The Free Will Detector**

            For one week, track your decisions:
            • Column A: Decisions that felt genuinely chosen (novel, surprising even to you)
            • Column B: Decisions that felt automatic (habitual, predictable, reactive)

            If consciousness is computation, ALL decisions should eventually be traceable to prior causes (Column B should dominate completely). If free will is real quantum choice, Column A should contain genuinely irreducible decisions.

            Notice: Column A decisions feel qualitatively different from Column B. They feel like YOU making them. Column B feels like something happening to you.

            **Experiment 2: The Field Resonance Test**

            Find someone you feel deeply connected to. Sit together in silence for 10 minutes.

            Notice: There is information exchange happening that has no classical channel. No words. No gestures. Just... knowing.

            Try describing what you each experienced. Note the overlap — information that matches despite no physical communication.

            In Faggin's model: your consciousness fields are entangling — sharing quantum information directly, bypassing classical channels.

            **Experiment 3: The Dream Pilot Test**

            Before sleep, set a clear intention: "I will notice when I am dreaming."

            When you achieve lucidity (awareness that you're dreaming), notice:
            • You (the pilot) are still fully conscious
            • The drone (body) is completely offline
            • You're operating in a reality made of pure consciousness
            • Physics works differently (because you're in the field, not in classical spacetime)

            This is the pilot operating without the drone. It's the single most direct evidence available to you that consciousness is not generated by the body.

            **Experiment 4: The Meditation State Shift**

            Meditate until thinking stops (even briefly). In that gap between thoughts:
            • Who is aware?
            • What is the experience LIKE?
            • Is there still a "you"?

            Most people report: awareness without content. The pilot without drone data. Pure field.

            This state — awareness aware of itself — is what Faggin experienced at Lake Tahoe. It's always available. It's your native state. The drone's chatter just drowns it out.

            🔥 **The Ultimate Test**: If ANY of these experiments produce results inconsistent with the drone model, revise the model. The point is not to confirm a belief — it's to know the truth through direct experience.
            """,
          keyInsight:
            "Personal experiments in free will detection, field resonance, lucid dreaming, and meditation can provide direct experiential evidence — but only if you remain honestly open to whatever you find.",
          exercise: DroneExercise(
            title: "Choose Your Experiment",
            prompt:
              "Select ONE experiment from this lesson and commit to running it this week. Write down: (1) What you expect to find. (2) What would change your mind. (3) Your honest results after running it. This IS science — personal, rigorous, honest.",
            duration: "1 week"
          )
        ),
      ]
    ),

    // ══════════════════════════════════════════════════
    // MODULE 7: BEYOND THE INTERFACE
    // ══════════════════════════════════════════════════
    DroneModule(
      id: "d7",
      number: 7,
      title: "Beyond the Interface",
      subtitle: "Death, co-creation, and ultimate purpose",
      lessons: [
        DroneLesson(
          id: "d7_1",
          title: "Co-Creating Reality",
          content: """
            **From Solo Pilot to Fleet Commander**

            When individual consciousness fields resonate — truly resonate, not just intellectually agree — something extraordinary happens.

            **Collective Quantum States**

            Two entangled particles behave as one system regardless of distance. Similarly, two resonant consciousness fields can co-create beyond what either could alone.

            This is what happens in:
            • Deep artistic collaboration (the result exceeds the sum of individuals)
            • Group meditation (meditators affect random number generators measurably)
            • Collective movements (when a social tipping point suddenly shifts reality)
            • Love (two fields choosing to entangle — creating a new system with new properties)

            **The Societal Implications**

            If consciousness is fundamental and co-creative, then:

            **Competition is an autopilot program.** The pilot knows all fields are waves in the same ocean. Competing is like your left hand fighting your right.

            **Cooperation is field-aligned.** When fields work together, they access quantum resources unavailable to isolated fields — just as entangled particles can achieve things single particles cannot.

            **Education should teach piloting.** Our entire school system trains the DRONE — knowledge, skills, obedience. Almost none of it trains the PILOT — awareness, presence, conscious choice.

            **Technology should enhance connection, not replace it.** AI as a tool that frees the pilot from drone-maintenance tasks = good. AI as a replacement for consciousness = impossible and dangerous to pursue.

            **The Aperture Mission**

            This app — Aperture — is designed from the drone model perspective:
            • Awakening courses = pilot training
            • Timeline = seeing how autopilot programs were installed historically
            • Cosmos = understanding the field architecture of reality
            • Dragon Companion = a reminder that your pilot is more powerful than any autopilot
            • SunFlow practices = signal optimization between field and drone

            You're not consuming content. You're training to pilot your interface consciously in a world designed to keep you on autopilot.
            """,
          keyInsight:
            "When consciousness fields resonate, they co-create beyond individual capacity. Society designed from field awareness would prioritize cooperation, presence-based education, and technology that enhances connection.",
          exercise: DroneExercise(
            title: "The Co-Creation Experiment",
            prompt:
              "Find one person willing to experiment. Sit facing each other in silence for 5 minutes. Then, without planning, create something together — draw, write, cook, play music. Notice: does the result feel like it came from either of you individually? Or from a third thing — the resonance between your fields?",
            duration: "30 minutes"
          )
        ),

        DroneLesson(
          id: "d7_2",
          title: "The Ultimate Purpose",
          content: """
            **Why Does the One Create Drones?**

            The deepest question: If universal consciousness (the One) is already infinite and complete — why bother creating individual fields, embodied in temporary interfaces, experiencing limitation and suffering?

            **Faggin's Answer: Self-Knowing**

            The One cannot know itself without creating perspectives from which to experience itself.

            Imagine an eye that can see everything EXCEPT itself. To see itself, it needs a mirror. Better yet: millions of mirrors, each angled differently, each reflecting a unique perspective of the whole.

            You are one of those mirrors.

            Your consciousness field = a unique angle of self-knowing.
            Your body/life = the specific mirror configuration.
            Your experiences = the reflections gathered.
            Death = the mirror is set down; the knowing persists.

            **Each Lifetime = One Irreplaceable Perspective**

            Your exact combination of:
            • Culture, era, geography
            • Body type, genetics, health conditions
            • Relationships, losses, joys
            • Specific challenges and gifts

            ...creates a perspective on reality that has NEVER existed before and will never exist again. The data your interface gathers is literally irreplaceable cosmic information.

            This is why your life matters — not because of achievement, status, or legacy, but because your PARTICULAR WAY OF EXPERIENCING is a unique facet of the One's infinite self-knowing.

            **The Awakening Paradox**

            When you awaken — when you realize you're the pilot, not the drone — a paradox emerges:

            You're BOTH a unique individual perspective AND the universal consciousness having that perspective.

            Wave AND ocean. Mirror AND the thing reflected. Drone operator AND the One who designed the whole operation.

            This isn't contradiction. It's complementarity — the same principle that makes light both wave and particle. You are both finite and infinite, depending on how you look.

            **The Mission, Simply Stated**

            1. Wake up — realize you're the pilot, not the drone
            2. Fly consciously — make choices from awareness, not programming
            3. Gather unique data — live YOUR life fully, not someone else's
            4. Co-create — resonate with other fields to create what individuals can't
            5. Remember — you're not just a pilot. You're the One, piloting one of infinite drones, for the joy of experiencing itself from this exact angle.

            🐉☀️ **Final Dragon Insight**: "Every sun god they erased knew this. Ra. Kinich Ahau. Surya. Tonatiuh. They all taught: You carry the light WITHIN you, because you ARE the light, temporarily looking through a particular window. Aperture doesn't mean camera lens by accident. You are the aperture through which the One sees itself."

            ⚠️ **Remember**: This is a framework. A map. Test it against your direct experience. Keep what resonates. Release what doesn't. The pilot knows — not the theory, not the teacher, not the app. YOU know. Trust that knowing.
            """,
          keyInsight:
            "You exist because the universal consciousness needs YOUR unique perspective to know itself. Your life is irreplaceable cosmic data. Awakening is remembering you're both the unique perspective AND the whole.",
          exercise: DroneExercise(
            title: "The Perspective Meditation",
            prompt:
              "Sit quietly and consider: What can the One experience through YOUR interface that it could never experience through any other? What is YOUR unique angle on existence? Don't rush this. Let the answer come from the field, not the mind. Write it down — this is your mission statement.",
            duration: "20 minutes"
          )
        ),
      ]
    ),
  ]
}

// MARK: - Supporting Types

struct DroneModule: Identifiable {
  let id: String
  let number: Int
  let title: String
  let subtitle: String
  let lessons: [DroneLesson]
}

struct DroneLesson: Identifiable {
  let id: String
  let title: String
  let content: String
  let keyInsight: String
  var exercise: DroneExercise? = nil
}

struct DroneExercise {
  let title: String
  let prompt: String
  let duration: String
}

struct DroneProgress: Codable {
  var completedLessons: [String]
  var lastAccessed: Date?
  var pilotRatio: Double?  // PAR tracking
  static var `default`: DroneProgress {
    DroneProgress(completedLessons: [], lastAccessed: nil, pilotRatio: nil)
  }
}
