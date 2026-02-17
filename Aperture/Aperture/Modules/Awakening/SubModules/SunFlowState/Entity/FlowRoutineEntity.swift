// FlowRoutineEntity.swift
// Practical routines for entering and maintaining flow

import SwiftUI

// MARK: - Flow Protocol

struct FlowProtocol: Identifiable {
  let id: String
  let name: String
  let duration: String
  let icon: String
  let color: Color
  let description: String
  let steps: [ProtocolStep]
  let bestFor: [String]
  let requirements: [String]
}

struct ProtocolStep: Identifiable {
  let id: String
  let order: Int
  let name: String
  let duration: String
  let instruction: String
  let icon: String
}

extension FlowProtocol {
  static let protocols: [FlowProtocol] = [
    // MARK: - 90-Minute Deep Work Protocol

    FlowProtocol(
      id: "deep_work_90",
      name: "90-Minute Deep Work Block",
      duration: "90 minutes",
      icon: "brain.head.profile",
      color: Color(hex: "#7C5CFF"),
      description:
        "The gold standard. One ultradian cycle of focused work. 90 minutes is the natural rhythm of human attention and sleep cycles.",
      steps: [
        ProtocolStep(
          id: "dw_1",
          order: 1,
          name: "Clear the Deck",
          duration: "5 min",
          instruction:
            "Close all tabs. Phone in another room. Tell people you're unavailable. Use the bathroom. Get water. Remove ALL friction.",
          icon: "xmark.circle.fill"
        ),
        ProtocolStep(
          id: "dw_2",
          order: 2,
          name: "Set the Intention",
          duration: "2 min",
          instruction:
            "Write ONE sentence: 'In the next 90 minutes, I will [specific outcome].' If you can't write it clearly, clarify before starting.",
          icon: "target"
        ),
        ProtocolStep(
          id: "dw_3",
          order: 3,
          name: "Activation Breathwork",
          duration: "3 min",
          instruction:
            "Box breathing: 4 seconds in, 4 hold, 4 out, 4 hold. Repeat 6-8 times. This shifts nervous system from sympathetic to parasympathetic baseline.",
          icon: "wind"
        ),
        ProtocolStep(
          id: "dw_4",
          order: 4,
          name: "Warm-Up Task",
          duration: "10 min",
          instruction:
            "Start with an easy, related task. Review yesterday's work. Outline today's section. Don't jump straight into the hardest thing.",
          icon: "flame.fill"
        ),
        ProtocolStep(
          id: "dw_5",
          order: 5,
          name: "Deep Work",
          duration: "60 min",
          instruction:
            "Full focus. One task. No switching. If you get stuck, stay with it - the discomfort is where growth happens. Use a timer.",
          icon: "brain"
        ),
        ProtocolStep(
          id: "dw_6",
          order: 6,
          name: "Capture & Close",
          duration: "10 min",
          instruction:
            "Document where you stopped. Write next session's starting point. Capture any loose threads. Clean mental exit.",
          icon: "checkmark.seal.fill"
        ),
      ],
      bestFor: [
        "Writing and content creation",
        "Complex coding problems",
        "Strategic thinking",
        "Creative projects",
        "Learning difficult material",
      ],
      requirements: [
        "Morning peak hours (ideally)",
        "Well-rested state",
        "No upcoming interruptions",
        "Clear outcome defined",
      ]
    ),

    // MARK: - Pomodoro Flow Protocol

    FlowProtocol(
      id: "pomodoro_flow",
      name: "Pomodoro Flow (4x25)",
      duration: "2 hours",
      icon: "timer",
      color: Color(hex: "#FF6B6B"),
      description:
        "Modified Pomodoro for flow. Short sprints with minimal breaks. Good for tasks that are hard to start or when motivation is low.",
      steps: [
        ProtocolStep(
          id: "pf_1",
          order: 1,
          name: "Task Selection",
          duration: "2 min",
          instruction:
            "Choose ONE task for all 4 pomodoros. Don't switch tasks between sprints - this destroys flow accumulation.",
          icon: "list.bullet"
        ),
        ProtocolStep(
          id: "pf_2",
          order: 2,
          name: "Sprint 1",
          duration: "25 min",
          instruction:
            "Pure focus. No exceptions. If a thought arises, write it on a 'distraction pad' and return immediately. Don't check anything.",
          icon: "1.circle.fill"
        ),
        ProtocolStep(
          id: "pf_3",
          order: 3,
          name: "Micro-Break",
          duration: "5 min",
          instruction:
            "Stand up. Move. Look at distance (20 feet+). No screens. No checking anything. Physical movement only.",
          icon: "figure.walk"
        ),
        ProtocolStep(
          id: "pf_4",
          order: 4,
          name: "Sprint 2",
          duration: "25 min",
          instruction:
            "Deeper now. The first sprint primed the pump. Ride the momentum. Don't start over - continue where you left off.",
          icon: "2.circle.fill"
        ),
        ProtocolStep(
          id: "pf_5",
          order: 5,
          name: "Micro-Break",
          duration: "5 min",
          instruction:
            "Same as before. Movement. Distance vision. No stimulation. This is recovery, not entertainment.",
          icon: "figure.walk"
        ),
        ProtocolStep(
          id: "pf_6",
          order: 6,
          name: "Sprint 3",
          duration: "25 min",
          instruction:
            "Flow state likely now. You're in the zone. Protect it. Don't look at the clock - let the timer do that.",
          icon: "3.circle.fill"
        ),
        ProtocolStep(
          id: "pf_7",
          order: 7,
          name: "Micro-Break",
          duration: "5 min",
          instruction:
            "You might not want to stop. That's good - but take the break anyway. It prevents burnout.",
          icon: "figure.walk"
        ),
        ProtocolStep(
          id: "pf_8",
          order: 8,
          name: "Sprint 4",
          duration: "25 min",
          instruction:
            "Final push. Leave yourself a clear starting point for next time. Don't end at a stuck point.",
          icon: "4.circle.fill"
        ),
      ],
      bestFor: [
        "Tasks you've been avoiding",
        "Low motivation days",
        "Administrative work",
        "When 90 minutes feels too long",
        "Building the flow habit",
      ],
      requirements: [
        "Timer (physical or app)",
        "Distraction pad for capture",
        "Commitment to full 4 cycles",
      ]
    ),

    // MARK: - Morning Activation Protocol

    FlowProtocol(
      id: "morning_activation",
      name: "Morning Activation",
      duration: "60 minutes",
      icon: "sunrise.fill",
      color: Color(hex: "#FFD700"),
      description:
        "The first 60 minutes set the trajectory for the entire day. This protocol optimizes circadian rhythm and primes for flow.",
      steps: [
        ProtocolStep(
          id: "ma_1",
          order: 1,
          name: "No Phone Zone",
          duration: "30 min",
          instruction:
            "Do NOT check your phone for the first 30 minutes. This is non-negotiable. Your attention is most valuable when fresh.",
          icon: "iphone.slash"
        ),
        ProtocolStep(
          id: "ma_2",
          order: 2,
          name: "Sunlight Exposure",
          duration: "10 min",
          instruction:
            "Get outside. Face the sun (don't stare). No sunglasses. Even overcast sky is 10,000+ lux. This resets your master clock.",
          icon: "sun.max.fill"
        ),
        ProtocolStep(
          id: "ma_3",
          order: 3,
          name: "Hydration",
          duration: "2 min",
          instruction:
            "16-32oz water immediately. You're dehydrated from sleep. Add salt if you want. Avoid caffeine for first 90-120 minutes.",
          icon: "drop.fill"
        ),
        ProtocolStep(
          id: "ma_4",
          order: 4,
          name: "Movement",
          duration: "10 min",
          instruction:
            "Light exercise. Walking, yoga, stretching. Raise body temperature. Don't exhaust yourself - just activate.",
          icon: "figure.walk"
        ),
        ProtocolStep(
          id: "ma_5",
          order: 5,
          name: "Cold Exposure (Optional)",
          duration: "2-3 min",
          instruction:
            "Cold shower or face splash. Releases norepinephrine and dopamine. Instant alertness without caffeine.",
          icon: "snowflake"
        ),
        ProtocolStep(
          id: "ma_6",
          order: 6,
          name: "Intention Setting",
          duration: "5 min",
          instruction:
            "Review calendar. Identify the ONE most important task for today. Write it down. This is your priority #1.",
          icon: "pencil.line"
        ),
        ProtocolStep(
          id: "ma_7",
          order: 7,
          name: "Mental Clearing",
          duration: "5-10 min",
          instruction:
            "Journal or brain dump. Get worries, tasks, and mental noise onto paper. Empty the buffer before loading the day.",
          icon: "doc.text"
        ),
      ],
      bestFor: [
        "Every single day",
        "Establishing circadian rhythm",
        "Maximizing morning peak",
        "Building sustainable energy",
      ],
      requirements: [
        "Willingness to wake early enough",
        "Commitment to no-phone rule",
        "Access to outdoor light",
      ]
    ),

    // MARK: - Pre-Flow Ritual

    FlowProtocol(
      id: "pre_flow_ritual",
      name: "Pre-Flow Ritual",
      duration: "15 minutes",
      icon: "sparkles",
      color: Color(hex: "#AB47BC"),
      description:
        "A condensed ritual to enter flow on command. Use before any deep work session. Trains the brain to associate these cues with focus.",
      steps: [
        ProtocolStep(
          id: "pfr_1",
          order: 1,
          name: "Environmental Reset",
          duration: "3 min",
          instruction:
            "Clear physical space. Close unnecessary tabs. Phone away. Water ready. Tools prepared. Create the container.",
          icon: "rectangle.on.rectangle.slash"
        ),
        ProtocolStep(
          id: "pfr_2",
          order: 2,
          name: "Physiological Shift",
          duration: "3 min",
          instruction:
            "5 deep breaths. Roll shoulders back. Unclench jaw. Feel your feet on the floor. Arrive in your body.",
          icon: "lungs.fill"
        ),
        ProtocolStep(
          id: "pfr_3",
          order: 3,
          name: "Anchor Activation",
          duration: "2 min",
          instruction:
            "Put on your 'flow music' or noise. This is a conditioned cue. Same music = same state. Build the association.",
          icon: "headphones"
        ),
        ProtocolStep(
          id: "pfr_4",
          order: 4,
          name: "Goal Crystallization",
          duration: "2 min",
          instruction:
            "Write the specific outcome for this session. Visualize completing it. See yourself in flow.",
          icon: "target"
        ),
        ProtocolStep(
          id: "pfr_5",
          order: 5,
          name: "Warm Start",
          duration: "5 min",
          instruction:
            "Begin with the easiest part of the task. Don't start with the hardest thing. Build momentum first.",
          icon: "play.fill"
        ),
      ],
      bestFor: [
        "Before any deep work block",
        "When motivation is low",
        "Training flow on command",
        "Transitioning between tasks",
      ],
      requirements: [
        "Consistent music/sound anchor",
        "Clear goal before starting",
        "15 minutes of protected time",
      ]
    ),

    // MARK: - Evening Wind-Down Protocol

    FlowProtocol(
      id: "evening_winddown",
      name: "Evening Wind-Down",
      duration: "90 minutes",
      icon: "moon.stars.fill",
      color: Color(hex: "#5C6BC0"),
      description:
        "The transition from day to night. Proper wind-down protects sleep quality, which protects tomorrow's flow capacity.",
      steps: [
        ProtocolStep(
          id: "ew_1",
          order: 1,
          name: "Work Shutdown",
          duration: "10 min",
          instruction:
            "Formal end to work. Review what was done. Capture loose ends. Write tomorrow's starting point. Say 'Shutdown complete.'",
          icon: "power"
        ),
        ProtocolStep(
          id: "ew_2",
          order: 2,
          name: "Light Dimming",
          duration: "Ongoing",
          instruction:
            "Dim all lights. Use lamps instead of overhead. Red/amber light if possible. This signals melatonin production.",
          icon: "lightbulb.fill"
        ),
        ProtocolStep(
          id: "ew_3",
          order: 3,
          name: "Screen Curfew",
          duration: "Final 60 min",
          instruction:
            "No screens in the last hour before bed. If you must, use blue light blockers. But really - no screens.",
          icon: "tv.slash"
        ),
        ProtocolStep(
          id: "ew_4",
          order: 4,
          name: "Body Temperature Drop",
          duration: "20 min",
          instruction:
            "Hot bath or shower. The subsequent cooling helps sleep onset. Do this 1-2 hours before bed.",
          icon: "thermometer.snowflake"
        ),
        ProtocolStep(
          id: "ew_5",
          order: 5,
          name: "Mental Unloading",
          duration: "10 min",
          instruction:
            "Journal or brain dump. Get tomorrow's worries onto paper. Process the day's emotions. Clear the mental buffer.",
          icon: "doc.text"
        ),
        ProtocolStep(
          id: "ew_6",
          order: 6,
          name: "Sleep Preparation",
          duration: "10 min",
          instruction:
            "Cool room (65-68°F). Complete darkness. White noise if needed. Same routine every night.",
          icon: "bed.double.fill"
        ),
      ],
      bestFor: [
        "Every night",
        "Sleep optimization",
        "Protecting next-day performance",
        "Breaking the 'one more thing' habit",
      ],
      requirements: [
        "Commitment to consistent bedtime",
        "Willingness to stop working",
        "Dim lighting available",
      ]
    ),
  ]
}

// MARK: - Weekly Flow Schedule

struct WeeklyFlowBlock: Identifiable {
  let id: String
  let day: String
  let timeSlot: String
  let blockType: FlowBlockType
  let duration: String
  let notes: String
}

enum FlowBlockType: String {
  case deepWork = "Deep Work"
  case admin = "Admin & Email"
  case meetings = "Meetings"
  case recovery = "Recovery"
  case exercise = "Exercise"
  case creative = "Creative"

  var color: Color {
    switch self {
    case .deepWork: return Color(hex: "#7C5CFF")
    case .admin: return Color(hex: "#78909C")
    case .meetings: return Color(hex: "#FFB74D")
    case .recovery: return Color(hex: "#4CAF50")
    case .exercise: return Color(hex: "#FF6B6B")
    case .creative: return Color(hex: "#AB47BC")
    }
  }

  var icon: String {
    switch self {
    case .deepWork: return "brain.head.profile"
    case .admin: return "envelope.fill"
    case .meetings: return "person.2.fill"
    case .recovery: return "leaf.fill"
    case .exercise: return "figure.run"
    case .creative: return "paintbrush.fill"
    }
  }
}

// MARK: - Flow Metric

struct FlowMetric: Identifiable {
  let id: String
  let name: String
  let icon: String
  let description: String
  let howToTrack: String
  let targetRange: String
}

extension FlowMetric {
  static let metrics: [FlowMetric] = [
    FlowMetric(
      id: "deep_work_hours",
      name: "Deep Work Hours",
      icon: "clock.fill",
      description: "Total hours of uninterrupted, focused work per day/week.",
      howToTrack:
        "Track each 90-minute block. Sum weekly. Most knowledge workers average 1-2 hours but are capable of 4-6.",
      targetRange: "4-6 hours/day (advanced), 2-3 hours/day (building)"
    ),

    FlowMetric(
      id: "flow_frequency",
      name: "Flow Frequency",
      icon: "waveform.path.ecg",
      description: "Number of times you entered a flow state this week.",
      howToTrack: "Rate each work session 1-10 for focus. Count sessions rated 7+.",
      targetRange: "5-10 flow sessions/week"
    ),

    FlowMetric(
      id: "time_to_flow",
      name: "Time to Flow",
      icon: "timer",
      description: "How long it takes to enter flow once you start a session.",
      howToTrack: "Note when you start and when you feel 'locked in.' Track average.",
      targetRange: "15-20 min (trained), 30-45 min (untrained)"
    ),

    FlowMetric(
      id: "sleep_quality",
      name: "Sleep Quality",
      icon: "moon.zzz.fill",
      description: "Foundation metric. Poor sleep = no flow. Track subjectively or with device.",
      howToTrack:
        "Rate morning energy 1-10. Track with Oura/Whoop if available. Note sleep duration.",
      targetRange: "7-9 hours, 7+ quality rating"
    ),

    FlowMetric(
      id: "distraction_events",
      name: "Distraction Events",
      icon: "bell.badge.fill",
      description: "Number of times you were pulled out of focus during a session.",
      howToTrack: "Tally each interruption. Include self-interruptions (checking phone, etc.).",
      targetRange: "0-2 per 90-minute session"
    ),
  ]
}
