// CircadianRhythmEntity.swift
// Calibrating your internal clock for peak performance

import SwiftUI

// MARK: - Circadian Phase

struct CircadianPhase: Identifiable {
  let id: String
  let name: String
  let timeRange: String
  let icon: String
  let color: Color
  let description: String
  let optimalActivities: [String]
  let avoidActivities: [String]
  let hormoneProfile: String
  let brainState: String
}

extension CircadianPhase {
  static let phases: [CircadianPhase] = [
    CircadianPhase(
      id: "dawn_awakening",
      name: "Dawn Awakening",
      timeRange: "5:00 AM - 7:00 AM",
      icon: "sunrise.fill",
      color: Color(hex: "#FFB74D"),
      description:
        "Cortisol surge begins. Body temperature rises. The transition from sleep to wakefulness. Protect this window - it sets the tone for the entire day.",
      optimalActivities: [
        "Sunlight exposure (critical for circadian reset)",
        "Hydration (you're dehydrated from sleep)",
        "Light movement or stretching",
        "Intention setting for the day",
        "Avoid screens for first 30 minutes",
      ],
      avoidActivities: [
        "Checking phone/email immediately",
        "Caffeine (wait 90-120 minutes)",
        "Heavy exercise (cortisol already elevated)",
        "Complex decisions",
      ],
      hormoneProfile: "Cortisol rising rapidly, melatonin clearing",
      brainState: "Transitioning from theta/delta to alpha"
    ),

    CircadianPhase(
      id: "morning_peak",
      name: "Morning Peak",
      timeRange: "9:00 AM - 12:00 PM",
      icon: "sun.max.fill",
      color: Color(hex: "#FFD700"),
      description:
        "PRIME TIME. Cortisol peaks. Body temperature optimal. Prefrontal cortex fully online. This is your most valuable cognitive real estate. Protect it ruthlessly.",
      optimalActivities: [
        "Deep work - your hardest cognitive tasks",
        "Creative problem solving",
        "Strategic thinking and planning",
        "Writing and complex analysis",
        "Learning new, difficult material",
      ],
      avoidActivities: [
        "Meetings (unless absolutely necessary)",
        "Email and admin tasks",
        "Social media",
        "Routine tasks that don't require peak cognition",
      ],
      hormoneProfile: "Cortisol at peak, testosterone elevated (men), estrogen stable",
      brainState: "High alpha, capable of gamma bursts - optimal for flow"
    ),

    CircadianPhase(
      id: "midday_transition",
      name: "Midday Transition",
      timeRange: "12:00 PM - 2:00 PM",
      icon: "sun.haze.fill",
      color: Color(hex: "#FFA726"),
      description:
        "Post-lunch dip incoming. Blood flow shifts to digestion. This is NOT a bug - it's a feature. Use it wisely.",
      optimalActivities: [
        "Light lunch (heavy meals amplify the dip)",
        "Walking meetings",
        "Routine admin tasks",
        "Short nap (10-20 min) if possible",
        "Social connection",
      ],
      avoidActivities: [
        "Complex analytical work",
        "Important decisions",
        "Learning difficult new material",
        "Heavy meals with lots of carbs",
      ],
      hormoneProfile: "Cortisol declining, adenosine building",
      brainState: "Alpha decreasing, tendency toward drowsiness"
    ),

    CircadianPhase(
      id: "afternoon_recovery",
      name: "Afternoon Recovery",
      timeRange: "2:00 PM - 5:00 PM",
      icon: "cloud.sun.fill",
      color: Color(hex: "#42A5F5"),
      description:
        "Second wind begins around 3-4 PM. Body temperature rises again. Good for physical performance and collaborative work.",
      optimalActivities: [
        "Physical exercise (coordination peaks)",
        "Collaborative work and meetings",
        "Brainstorming sessions",
        "Tasks requiring social intelligence",
        "Physical tasks and errands",
      ],
      avoidActivities: [
        "Solo deep work (save for morning)",
        "Caffeine after 2 PM (disrupts sleep)",
        "Starting new complex projects",
      ],
      hormoneProfile: "Cortisol stable, growth hormone preparing for evening",
      brainState: "Alpha returning, good for sustained attention (not peak creativity)"
    ),

    CircadianPhase(
      id: "evening_wind_down",
      name: "Evening Wind Down",
      timeRange: "5:00 PM - 9:00 PM",
      icon: "sunset.fill",
      color: Color(hex: "#FF7043"),
      description:
        "Transition toward rest. Melatonin production begins as light dims. Critical window for next-day preparation.",
      optimalActivities: [
        "Light physical activity",
        "Social connection",
        "Meal preparation and eating",
        "Next-day planning (reduces morning cognitive load)",
        "Dimming lights 2 hours before bed",
      ],
      avoidActivities: [
        "Intense exercise (elevates cortisol)",
        "Heavy screen use (blue light blocks melatonin)",
        "Work stress or difficult conversations",
        "Large meals late in the window",
      ],
      hormoneProfile: "Melatonin beginning to rise, cortisol declining",
      brainState: "Shifting toward alpha/theta - reflective, not analytical"
    ),

    CircadianPhase(
      id: "night_rest",
      name: "Night Rest",
      timeRange: "9:00 PM - 5:00 AM",
      icon: "moon.stars.fill",
      color: Color(hex: "#5C6BC0"),
      description:
        "Sleep is not passive. It's when memory consolidation, cellular repair, and emotional processing happen. Protect it like your life depends on it - because it does.",
      optimalActivities: [
        "Sleep preparation rituals",
        "Reading (physical book, dim light)",
        "Journaling to clear mental buffer",
        "Gratitude practice",
        "Temperature regulation (cool room, 65-68°F)",
      ],
      avoidActivities: [
        "Screens (blue light)",
        "Alcohol (fragments sleep architecture)",
        "Late-night eating",
        "Stressful content or conversations",
        "Intense mental work",
      ],
      hormoneProfile:
        "Melatonin high, growth hormone released during deep sleep, cortisol at lowest",
      brainState: "Cycling through sleep stages: light sleep → deep sleep → REM"
    ),
  ]
}

// MARK: - Chronotype

struct Chronotype: Identifiable {
  let id: String
  let name: String
  let animal: String
  let icon: String
  let color: Color
  let description: String
  let peakWindow: String
  let troughWindow: String
  let population: String
  let recommendations: [String]
}

extension Chronotype {
  static let types: [Chronotype] = [
    Chronotype(
      id: "lion",
      name: "Lion",
      animal: "🦁",
      icon: "sunrise.fill",
      color: Color(hex: "#FFD700"),
      description:
        "Early risers. Peak energy in the morning. Most productive before noon. Often fade in the evening.",
      peakWindow: "6:00 AM - 12:00 PM",
      troughWindow: "2:00 PM - 4:00 PM",
      population: "~15-20% of population",
      recommendations: [
        "Protect morning hours for deep work",
        "Schedule important meetings before noon",
        "Exercise in the morning",
        "Plan wind-down to start by 8 PM",
        "Avoid late-night social events",
      ]
    ),

    Chronotype(
      id: "bear",
      name: "Bear",
      animal: "🐻",
      icon: "sun.max.fill",
      color: Color(hex: "#8D6E63"),
      description:
        "The majority chronotype. Follows the solar cycle closely. Most productive mid-morning to early afternoon.",
      peakWindow: "10:00 AM - 2:00 PM",
      troughWindow: "2:00 PM - 4:00 PM",
      population: "~55% of population",
      recommendations: [
        "Use mid-morning for your hardest work",
        "Take advantage of the afternoon dip for admin",
        "Exercise in late afternoon when coordination peaks",
        "Maintain consistent sleep schedule",
        "You're most adaptable - use this advantage",
      ]
    ),

    Chronotype(
      id: "wolf",
      name: "Wolf",
      animal: "🐺",
      icon: "moon.fill",
      color: Color(hex: "#5C6BC0"),
      description:
        "Night owls. Peak creativity and energy in the evening. Morning is difficult. Often most productive after 5 PM.",
      peakWindow: "5:00 PM - 12:00 AM",
      troughWindow: "8:00 AM - 12:00 PM",
      population: "~15-20% of population",
      recommendations: [
        "Don't fight your biology - work with it",
        "Schedule creative work for evening",
        "Use mornings for routine, low-stakes tasks",
        "Get sunlight exposure even if you wake late",
        "Find jobs/projects that allow evening work",
      ]
    ),

    Chronotype(
      id: "dolphin",
      name: "Dolphin",
      animal: "🐬",
      icon: "waveform.path.ecg",
      color: Color(hex: "#26C6DA"),
      description:
        "Light sleepers with irregular patterns. Often anxious or perfectionistic. Peak productivity comes in bursts.",
      peakWindow: "10:00 AM - 12:00 PM (variable)",
      troughWindow: "Variable - often early afternoon",
      population: "~10% of population",
      recommendations: [
        "Focus on sleep hygiene above all else",
        "Use anxiety as fuel - channel it into focused work",
        "Break work into shorter, intense bursts",
        "Avoid caffeine entirely or limit to early morning",
        "Meditation and nervous system regulation are essential",
      ]
    ),
  ]
}

// MARK: - Circadian Anchor

struct CircadianAnchor: Identifiable {
  let id: String
  let name: String
  let icon: String
  let description: String
  let howTo: String
  let scienceBehind: String
  let priority: Int
}

extension CircadianAnchor {
  static let anchors: [CircadianAnchor] = [
    CircadianAnchor(
      id: "morning_light",
      name: "Morning Sunlight",
      icon: "sun.max.fill",
      description:
        "The single most powerful circadian anchor. Morning light exposure sets the master clock for the entire day.",
      howTo:
        "Get 10-30 minutes of sunlight exposure within 1 hour of waking. Overcast counts (still 10,000+ lux). No sunglasses. Direct sun on face and eyes.",
      scienceBehind:
        "Morning light triggers melanopsin receptors in the eye, which signal the suprachiasmatic nucleus (SCN) to reset the circadian clock. This sets the timer for melatonin release 14-16 hours later.",
      priority: 1
    ),

    CircadianAnchor(
      id: "consistent_wake",
      name: "Consistent Wake Time",
      icon: "alarm.fill",
      description:
        "More important than bedtime. Your wake time anchors the entire circadian system. Variation disrupts everything.",
      howTo:
        "Wake at the same time every day, including weekends. ±30 minutes maximum variation. If you need more sleep, go to bed earlier - don't sleep in.",
      scienceBehind:
        "The circadian system runs on a 24.2-hour cycle. Without consistent anchoring, it drifts later each day. Consistent wake time prevents this drift.",
      priority: 2
    ),

    CircadianAnchor(
      id: "meal_timing",
      name: "Consistent Meal Times",
      icon: "fork.knife",
      description:
        "Peripheral clocks in organs are set by meal timing. Erratic eating confuses the system.",
      howTo:
        "Eat within a consistent 10-12 hour window each day. First meal and last meal at roughly the same times. Avoid eating within 3 hours of sleep.",
      scienceBehind:
        "Peripheral oscillators in the liver, gut, and other organs are entrained by food intake. Consistent meal timing synchronizes these clocks with the master clock.",
      priority: 3
    ),

    CircadianAnchor(
      id: "evening_darkness",
      name: "Evening Darkness",
      icon: "moon.fill",
      description:
        "Artificial light after sunset delays melatonin release. Darkness is the signal for sleep preparation.",
      howTo:
        "Dim lights 2-3 hours before bed. Use red/amber light. Blue light blocking glasses if screens are necessary. Make bedroom completely dark.",
      scienceBehind:
        "Light suppresses melatonin production via the same melanopsin pathway. Even dim artificial light (100 lux) significantly delays melatonin onset.",
      priority: 4
    ),

    CircadianAnchor(
      id: "temperature_rhythm",
      name: "Temperature Rhythm",
      icon: "thermometer.medium",
      description:
        "Body temperature drops at night and rises in the morning. Working with this rhythm improves sleep quality.",
      howTo:
        "Cool bedroom (65-68°F). Hot bath 1-2 hours before bed (the subsequent cooling helps sleep onset). Morning exercise or cold exposure to raise temperature.",
      scienceBehind:
        "Core body temperature needs to drop 2-3°F to initiate sleep. The circadian system controls this rhythm. Artificial manipulation can shift timing.",
      priority: 5
    ),

    CircadianAnchor(
      id: "exercise_timing",
      name: "Consistent Exercise Timing",
      icon: "figure.run",
      description:
        "Exercise is a powerful circadian anchor. Timing matters - morning exercise advances the clock, evening exercise delays it.",
      howTo:
        "Exercise at the same time each day. Morning exercise is best for most people. Avoid intense exercise within 3 hours of bedtime.",
      scienceBehind:
        "Exercise raises core body temperature and releases cortisol. These signals help entrain the circadian system. Consistent timing reinforces the rhythm.",
      priority: 6
    ),
  ]
}

// MARK: - Sleep Architecture

struct SleepStage: Identifiable {
  let id: String
  let name: String
  let icon: String
  let color: Color
  let brainwaves: String
  let duration: String
  let function: String
  let disrupts: [String]
}

extension SleepStage {
  static let stages: [SleepStage] = [
    SleepStage(
      id: "light_sleep",
      name: "Light Sleep (N1/N2)",
      icon: "zzz",
      color: Color(hex: "#90CAF9"),
      brainwaves: "Theta waves (4-7 Hz), sleep spindles, K-complexes",
      duration: "~50% of total sleep",
      function: "Transition stage. Memory consolidation begins. Body relaxes. Easy to wake from.",
      disrupts: ["Caffeine late in day", "Irregular schedule", "Light exposure"]
    ),

    SleepStage(
      id: "deep_sleep",
      name: "Deep Sleep (N3/SWS)",
      icon: "moon.zzz.fill",
      color: Color(hex: "#5C6BC0"),
      brainwaves: "Delta waves (0.5-4 Hz) - slowest brainwaves",
      duration: "~20% of total sleep (more in first half of night)",
      function:
        "Physical restoration. Growth hormone release. Immune function. Cellular repair. Memory consolidation.",
      disrupts: ["Alcohol", "Sleep apnea", "Late eating", "Inconsistent bedtime"]
    ),

    SleepStage(
      id: "rem_sleep",
      name: "REM Sleep",
      icon: "eye.fill",
      color: Color(hex: "#AB47BC"),
      brainwaves: "Beta-like activity (similar to waking), muscle atonia",
      duration: "~25% of total sleep (more in second half of night)",
      function:
        "Emotional processing. Procedural memory. Creativity and insight. Dreams. Brain 'defragmentation'.",
      disrupts: [
        "Alcohol (strongly suppresses)", "Cannabis", "Antidepressants (some)", "Early waking",
      ]
    ),
  ]
}
