// SolarSovereigntyCourse.swift
// SOLAR SOVEREIGNTY - Reclaim Your Rhythm
// Circadian alignment, pineal activation, ancient solar wisdom

import SwiftUI

// MARK: - Course Data

struct SolarSovereigntyCourse {
  static let shared = SolarSovereigntyCourse()

  let id = "solar_sovereignty"
  let title = "Solar Sovereignty"
  let subtitle = "Align with the oldest rhythm"
  let icon = "sun.max.fill"
  let colorHex = "#FF9500"

  var color: Color {
    Color(hex: colorHex)
  }

  let modules: [SolarModule] = [
    // ═══════════════════════════════════════════════════════════════
    // MODULE 0: GATE IGNITION
    // ═══════════════════════════════════════════════════════════════
    SolarModule(
      id: "sol0",
      number: 0,
      title: "Aperture Ignition",
      subtitle: "The spark before dawn",
      icon: "sunrise.fill",
      lessons: [
        SolarLesson(
          id: "sol0_1",
          title: "You're Not Broken—You're Desynchronized",
          content: """
            **The Quiet Spark Before Dawn**

            Think of Gate 0 as the quiet spark before dawn—not a grand launch, but the subtle alignment that turns information overload into intuitive clarity.

            **The Gap We're Filling**

            In a world wired to wind you up, the unmet need isn't more apps.

            It's augmenting your brain's natural OS with seamless sunrise sync.

            Your phone as a minimalist portal to reclaim rhythm. No overwhelm; just 60 seconds daily to set intention and check in with sunrise.

            **Why This Matters**

            Your circadian rhythm isn't mystical fluff. It's a hardwired 24-hour cycle orchestrated by the suprachiasmatic nucleus (SCN) in your brain, syncing with light to regulate:

            • Sleep quality
            • Hormones (melatonin, cortisol)
            • Body temperature  
            • Metabolism
            • Mood and cognition

            Alignment brings stable glucose, reduced inflammation, sharper thinking, and lower risks of chronic disease.

            Misalignment brings insulin resistance, hypertension, depression, and chronic "jet lag" without travel.

            🔥 **The Why We're Selling: Never let chaos eclipse your potential again.**
            """,
          keyInsight: "You're not broken—you're desynchronized. Time to align.",
          visualType: .circadianOverview
        ),

        SolarLesson(
          id: "sol0_2",
          title: "The Circadian System",
          content: """
            **Your Body's Master Clock**

            The **Suprachiasmatic Nucleus (SCN)** sits just above where your optic nerves cross. It receives light signals directly from your eyes and orchestrates your entire body's rhythm.

            **The Two-Process Model**

            Your sleep-wake cycle is governed by two interacting systems:

            **Process C (Circadian)**
            - 24-hour biological rhythm
            - Controlled by the SCN
            - Wake-promoting during day
            - Sleep-promoting at night
            - Runs even without light cues

            **Process S (Homeostatic)**  
            - Sleep pressure that builds during waking
            - Adenosine accumulates the longer you're awake
            - Dissipates during sleep
            - Coffee blocks adenosine receptors (temporarily)

            **When They Align**
            - You feel awake in the morning
            - Alert through the day
            - Naturally tired at night
            - Deep, restorative sleep

            **When They Misalign**
            - Groggy mornings despite sleep
            - Afternoon crashes
            - Wide awake at bedtime
            - Fragmented, non-restorative sleep

            🔥 **The Goal: Synchronize these two systems with external light cues—especially morning sunlight.**
            """,
          keyInsight:
            "Two systems govern your energy: circadian rhythm and sleep pressure. Sunrise aligns both.",
          visualType: .twoProcessModel
        ),

        SolarLesson(
          id: "sol0_3",
          title: "The Clock Genes",
          content: """
            **The Molecular Clockwork**

            Inside nearly every cell of your body, four proteins dance in a 24-hour loop:

            **BMAL1 & CLOCK** (The Activators)
            - Team up to turn on "daytime" genes
            - Peak activity in morning/day
            - Promote metabolism, alertness, repair

            **PER & CRY** (The Inhibitors)
            - Gradually accumulate during day
            - Eventually shut down BMAL1/CLOCK
            - Reset overnight

            This molecular feedback loop runs in your liver, heart, gut, skin—everywhere. Light hitting your eyes synchronizes ALL these peripheral clocks through the SCN.

            **When Clocks Desync**

            Late-night eating? Your gut clock thinks it's day while your brain thinks it's night. Result: poor digestion, inflammation.

            Shift work? Your peripheral organs run on different schedules. Result: 29% higher heart disease risk.

            Screen time at night? Blue light signals "daytime" to your SCN while everything else expects sleep.

            **The Interventions**

            Morning light exposure (especially within first hour of waking) is the most powerful synchronizer available. Free, natural, and billions of years old.

            🔥 **Your cells are ancient solar technology. The sun is the API call that syncs them.**
            """,
          keyInsight: "Every cell runs a molecular clock. Morning light synchronizes them all.",
          visualType: .clockGenes
        ),
      ]
    ),

    // ═══════════════════════════════════════════════════════════════
    // MODULE 1: THE SUN'S HIDDEN LANGUAGE
    // ═══════════════════════════════════════════════════════════════
    SolarModule(
      id: "sol1",
      number: 1,
      title: "The Sun's Hidden Language",
      subtitle: "What the ancients knew",
      icon: "sun.horizon.fill",
      lessons: [
        SolarLesson(
          id: "sol1_1",
          title: "Ra and the Original Authority",
          content: """
            **Before Government, There Was the Sun**

            The Egyptians didn't worship the sun because they were primitive. They understood something we've forgotten.

            **Ra** wasn't just a god—he was the principle of ordered light, cosmic authority, the source from which all life emerged.

            Plant out of rhythm with the sun? Famine.
            Live aligned with solar cycles? Civilization flourishes.

            The Pharaoh was the earthly embodiment of Ra—not divine by birth, but by ALIGNMENT with cosmic order.

            **Ma'at: The Principle of Coherence**

            Ma'at was the Egyptian concept of truth, balance, order. It wasn't imposed by decree—it was recognized in the rhythms of nature.

            The sun rises. The Nile floods. Crops grow. This is Ma'at.

            Chaos (Isfet) was the opposite—the disorder that comes from fighting natural rhythms.

            **The Solar Plexus**

            Notice the name. The "solar" plexus—the nerve center in your gut that governs digestion, emotion, intuition.

            Ancient wisdom encoded in anatomy: Your core responds to the same light that governs the cosmos.

            🔥 **The sun wasn't worshipped—it was recognized as the original authority. Align or face consequence.**
            """,
          keyInsight:
            "The sun was recognized as cosmic authority because alignment meant survival, misalignment meant death.",
          visualType: .egyptianSolar
        ),

        SolarLesson(
          id: "sol1_2",
          title: "Pineal Portal Activation",
          content: """
            **The Third Eye Isn't Metaphor**

            The **pineal gland** sits at the geometric center of your brain. About the size of a grain of rice.

            It contains photoreceptor cells similar to those in your eyes.

            It produces **melatonin** (the sleep hormone) and possibly **DMT** (the "spirit molecule").

            Ancient Egyptians depicted it as the **Eye of Horus**—not symbolically, but anatomically. The Eye's shape maps precisely to a cross-section of the brain with the pineal at center.

            **Light's Direct Path**

            Light doesn't just help you see. It enters through a pathway that bypasses conscious processing entirely:

            Eyes → Retinohypothalamic tract → SCN → Pineal

            This is why blind people can still have circadian rhythms—specialized cells respond to light even without sight.

            **Pineal Calcification**

            Modern life calcifies the pineal:
            - Fluoride in water
            - Lack of sunlight
            - Screen exposure at night
            - Poor sleep

            A calcified pineal produces less melatonin, disrupts sleep, and may impair intuitive processing.

            **The Activation Protocol**

            • Morning sunlight (first hour after waking)
            • No screens 2+ hours before bed
            • Sleep in complete darkness
            • Reduce fluoride exposure
            • Consistent sleep schedule

            🔥 **The pineal gland is your interface with light. Protect it. Activate it.**
            """,
          keyInsight:
            "The pineal gland is a literal light-receiver at the center of your brain—ancient cultures knew this.",
          visualType: .pinealGland
        ),

        SolarLesson(
          id: "sol1_3",
          title: "From Chaos to Coherence",
          content: """
            **The Daily Practice**

            Reclaiming solar sovereignty isn't about belief. It's about ALIGNMENT.

            **Core Daily Mechanic**

            1. Open app at/near sunrise (auto-detected via location)
            2. 60-second timer: Breathe deeply while reading intention
            3. Quick check-in: Note one word on your energy
            4. Journal optional: Voice or text a single sentence
            5. Golden streak extends—visual continuity

            **The First 7 Intentions**

            *Day 1: Dawn Intention*
            "As the sun crests, affirm: 'I align with the oldest rhythm.'"
            Science: Morning light signals SCN to ramp cortisol gently, prepping metabolism.

            *Day 2: Light's Call*
            "Feel the sun's pull: 'I reclaim inner order from overstimulation.'"
            Science: Alignment curbs inflammation, slashes heart risk.

            *Day 3: Rhythm Reset*
            "Whisper: 'From desync to coherence, I flow.'"
            Science: Timed light boosts PER2 genes, aiding neurogenesis.

            *Day 4: Solar Anchor*
            "The sun demands nothing but attention—I give it."
            Science: Morning alignment improves glycemic control.

            *Day 5: Inner Dawn*
            "Light activates; I wake dormant potential."
            Science: Melatonin timing phases-shifts rhythms, eases symptoms.

            *Day 6: Cycle's Whisper*
            "In rhythm's embrace, chaos dissolves."
            Science: Time-restricted feeding realigns metabolic harmony.

            *Day 7: Coherent Flow*
            "Sunrise syncs me to source—I participate."
            Science: Earlier sleep midpoint cuts depression 23%.

            🔥 **60 seconds daily. Sunrise as API call. Sync body and mind.**
            """,
          keyInsight: "60 seconds of sunrise intention daily can reset your entire system.",
          visualType: .dailyPractice
        ),
      ]
    ),
  ]
}

// MARK: - Models

struct SolarModule: Identifiable {
  let id: String
  let number: Int
  let title: String
  let subtitle: String
  let icon: String
  let lessons: [SolarLesson]
}

struct SolarLesson: Identifiable {
  let id: String
  let title: String
  let content: String
  let keyInsight: String
  let visualType: SolarVisualType
}

enum SolarVisualType {
  case circadianOverview
  case twoProcessModel
  case clockGenes
  case egyptianSolar
  case pinealGland
  case dailyPractice
}
