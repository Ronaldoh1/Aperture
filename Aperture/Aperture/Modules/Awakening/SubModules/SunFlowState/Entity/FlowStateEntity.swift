// FlowStateEntity.swift
// The science and practice of entering flow on command

import SwiftUI

// MARK: - Flow State

struct FlowState: Identifiable {

    let id: String
    let name: String
    let description: String
    let icon: String
    let color: Color
    let brainwaveRange: String
    let characteristics: [String]
    let dbzEquivalent: String

}

extension FlowState {

    static let states: [FlowState] = [

        FlowState(
            id: "micro_flow",
            name: "Micro Flow",
            description: "Brief moments of absorbed attention. The entry point. You've felt this reading a good book or having a great conversation.",
            icon: "drop.fill",
            color: Color(hex: "#4FC3F7"),
            brainwaveRange: "Low Alpha (8-10 Hz)",
            characteristics: [
                "Time slightly distorted",
                "Reduced self-consciousness",
                "Task feels slightly easier",
                "Mild sense of enjoyment"
            ],
            dbzEquivalent: "Kaioken x2 - Amplified but sustainable"
        ),

        FlowState(
            id: "shallow_flow",
            name: "Shallow Flow",
            description: "Sustained engagement where challenge meets skill. Most productive work happens here. 30-60 minute sessions.",
            icon: "water.waves",
            color: Color(hex: "#29B6F6"),
            brainwaveRange: "Alpha-Theta Border (7-10 Hz)",
            characteristics: [
                "Clear goals emerge naturally",
                "Immediate feedback loop",
                "Reduced inner critic",
                "Enhanced pattern recognition"
            ],
            dbzEquivalent: "Super Saiyan - Elevated but controlled"
        ),

        FlowState(
            id: "deep_flow",
            name: "Deep Flow",
            description: "Complete absorption. The self disappears. Time dilates significantly. This is where breakthrough insights occur.",
            icon: "hurricane",
            color: Color(hex: "#7C5CFF"),
            brainwaveRange: "Theta Dominant (4-7 Hz)",
            characteristics: [
                "Ego dissolution",
                "Action and awareness merge",
                "Effortless concentration",
                "Intrinsic reward - the activity IS the reward"
            ],
            dbzEquivalent: "Super Saiyan Blue - Calm mastery"
        ),

        FlowState(
            id: "group_flow",
            name: "Group Flow",
            description: "Collective flow state. Jazz bands, sports teams, great conversations. The group becomes one organism.",
            icon: "person.3.fill",
            color: Color(hex: "#FFD700"),
            brainwaveRange: "Synchronized Alpha across participants",
            characteristics: [
                "Shared goals and instant feedback",
                "Equal participation",
                "Familiarity + novelty balance",
                "Sense of control within chaos"
            ],
            dbzEquivalent: "Fusion - Two become one"
        ),

        FlowState(
            id: "ultra_instinct",
            name: "Ultra Instinct",
            description: "The body moves before the mind thinks. Mastery so complete that consciousness observes rather than directs. Rare and profound.",
            icon: "sparkles",
            color: Color(hex: "#E0E0E0"),
            brainwaveRange: "Gamma bursts (30-100 Hz) on Theta base",
            characteristics: [
                "No separation between thought and action",
                "Perfect present-moment awareness",
                "Intuition operates at full capacity",
                "The watcher and the watched are one"
            ],
            dbzEquivalent: "Ultra Instinct - The body reacts on its own"
        )

    ]

}

// MARK: - Flow Trigger

struct FlowTrigger: Identifiable {

    let id: String
    let category: TriggerCategory
    let name: String
    let description: String
    let howTo: String
    let scienceBehind: String
    let icon: String
    let timeToEffect: String

}

enum TriggerCategory: String, CaseIterable {

    case psychological = "Psychological"
    case environmental = "Environmental"
    case social = "Social"
    case creative = "Creative"

    var color: Color {
        switch self {
        case .psychological: return Color(hex: "#7C5CFF")
        case .environmental: return Color(hex: "#4CAF50")
        case .social: return Color(hex: "#FFD700")
        case .creative: return Color(hex: "#FF6B6B")
        }
    }

    var icon: String {
        switch self {
        case .psychological: return "brain.head.profile"
        case .environmental: return "leaf.fill"
        case .social: return "person.2.fill"
        case .creative: return "paintbrush.fill"
        }
    }

}

extension FlowTrigger {

    static let all: [FlowTrigger] = [

        // PSYCHOLOGICAL TRIGGERS

        FlowTrigger(
            id: "challenge_skill",
            category: .psychological,
            name: "Challenge-Skill Balance",
            description: "The golden ratio: challenge 4% above current skill level. Too easy = boredom. Too hard = anxiety.",
            howTo: "Before starting, rate task difficulty 1-10. Rate your skill 1-10. Adjust until challenge is slightly higher than skill.",
            scienceBehind: "Csikszentmihalyi's research shows flow occurs in the 'channel' between anxiety and boredom. The 4% rule comes from Anders Ericsson's deliberate practice research.",
            icon: "scale.3d",
            timeToEffect: "Immediate when calibrated correctly"
        ),

        FlowTrigger(
            id: "clear_goals",
            category: .psychological,
            name: "Clear Goals",
            description: "Know exactly what you're trying to accomplish in the next 90 minutes. Ambiguity kills flow.",
            howTo: "Write ONE sentence: 'In the next 90 minutes, I will [specific outcome].' If you can't write it, you're not ready.",
            scienceBehind: "Clear goals reduce cognitive load and decision fatigue, freeing prefrontal cortex resources for the task itself.",
            icon: "target",
            timeToEffect: "Immediate"
        ),

        FlowTrigger(
            id: "immediate_feedback",
            category: .psychological,
            name: "Immediate Feedback",
            description: "Know instantly whether you're succeeding or failing. The tighter the feedback loop, the faster you enter flow.",
            howTo: "Set up metrics you can see in real-time. For coding: tests. For writing: word count. For music: the sound itself.",
            scienceBehind: "Feedback activates the reward circuitry and allows for micro-adjustments that keep you in the flow channel.",
            icon: "arrow.triangle.2.circlepath",
            timeToEffect: "5-10 minutes once established"
        ),

        FlowTrigger(
            id: "deep_embodiment",
            category: .psychological,
            name: "Deep Embodiment",
            description: "Get out of your head and into your body. Flow lives in the body, not the mind.",
            howTo: "Before deep work: 5 minutes of breathwork (box breathing or Wim Hof). Feel your feet. Notice your hands. Arrive in your body.",
            scienceBehind: "Embodiment practices shift activity from the default mode network (rumination) to the salience network (present awareness).",
            icon: "figure.mind.and.body",
            timeToEffect: "5-10 minutes"
        ),

        FlowTrigger(
            id: "risk",
            category: .psychological,
            name: "Risk & Consequences",
            description: "Stakes focus attention. Not dangerous risk - meaningful risk. Something must be on the line.",
            howTo: "Create artificial stakes: public commitment, deadline with consequences, money on the line, reputation.",
            scienceBehind: "Risk releases norepinephrine and dopamine, narrowing attention and increasing focus. This is why procrastination 'works' - the deadline creates risk.",
            icon: "exclamationmark.triangle.fill",
            timeToEffect: "Immediate"
        ),

        // ENVIRONMENTAL TRIGGERS

        FlowTrigger(
            id: "novelty",
            category: .environmental,
            name: "Novelty",
            description: "New environments, new inputs, pattern interrupts. Novelty releases dopamine and opens attention.",
            howTo: "Change your environment. Work from a new location. Rearrange your desk. Take a new route. Listen to unfamiliar music.",
            scienceBehind: "Novelty activates the locus coeruleus and releases norepinephrine, which enhances signal-to-noise ratio in the brain.",
            icon: "sparkle",
            timeToEffect: "15-30 minutes"
        ),

        FlowTrigger(
            id: "complexity",
            category: .environmental,
            name: "Complexity & Unpredictability",
            description: "Rich environments with multiple variables keep attention engaged. Predictability breeds boredom.",
            howTo: "Add controlled complexity to your task. For coding: tackle the hard problem first. For writing: start with the section you don't know how to write.",
            scienceBehind: "Complex environments require more neural resources, which paradoxically frees up the prefrontal cortex by engaging other brain regions.",
            icon: "square.grid.3x3.fill",
            timeToEffect: "10-20 minutes"
        ),

        FlowTrigger(
            id: "distraction_elimination",
            category: .environmental,
            name: "Distraction Elimination",
            description: "Every notification is a flow killer. Context switching costs 23 minutes to recover. Ruthlessly eliminate.",
            howTo: "Phone in another room. Notifications OFF. Browser blockers ON. Tell people you're unavailable. Protect the container.",
            scienceBehind: "The prefrontal cortex can only hold ~4 items. Every distraction consumes slots. Flow requires all slots dedicated to one task.",
            icon: "bell.slash.fill",
            timeToEffect: "Immediate - prevents flow interruption"
        ),

        FlowTrigger(
            id: "circadian_alignment",
            category: .environmental,
            name: "Circadian Alignment",
            description: "Work with your biology, not against it. Deep work during peak hours. Admin during troughs.",
            howTo: "Track your energy for 2 weeks. Find your peaks (usually 2-4 hours after waking and again in late afternoon). Protect those windows.",
            scienceBehind: "Cortisol and body temperature cycles create natural peaks in cognitive performance. Fighting these cycles wastes energy.",
            icon: "sun.max.fill",
            timeToEffect: "Scheduling - not immediate"
        ),

        // SOCIAL TRIGGERS

        FlowTrigger(
            id: "serious_concentration",
            category: .social,
            name: "Serious Concentration (Mirroring)",
            description: "Being around focused people makes you focused. Concentration is contagious.",
            howTo: "Work alongside focused people (library, coworking space). Use body doubling. Even a video of someone working can help.",
            scienceBehind: "Mirror neurons cause us to mimic the states of those around us. Focused energy is transmitted through the social field.",
            icon: "person.2.wave.2.fill",
            timeToEffect: "10-15 minutes"
        ),

        FlowTrigger(
            id: "shared_risk",
            category: .social,
            name: "Shared Risk & Goals",
            description: "Working toward a shared goal with real stakes creates group flow faster than anything.",
            howTo: "Find collaborators. Set shared deadlines. Create collective accountability. The team succeeds or fails together.",
            scienceBehind: "Shared risk releases oxytocin (bonding) combined with norepinephrine (focus), creating optimal conditions for group flow.",
            icon: "person.3.sequence.fill",
            timeToEffect: "20-30 minutes"
        ),

        FlowTrigger(
            id: "yes_and",
            category: .social,
            name: "Yes, And... (Additive)",
            description: "In group flow, nothing gets blocked. Every contribution builds on the last. No criticism during creation.",
            howTo: "Defer judgment. Build on ideas instead of evaluating them. Say 'Yes, and...' instead of 'Yes, but...'",
            scienceBehind: "Criticism activates the threat response and kicks people out of flow. Additive dynamics keep the creative channel open.",
            icon: "plus.circle.fill",
            timeToEffect: "Immediate in group settings"
        ),

        // CREATIVE TRIGGERS

        FlowTrigger(
            id: "pattern_recognition",
            category: .creative,
            name: "Pattern Recognition",
            description: "Linking new information to existing knowledge. The 'aha!' moment is a flow trigger.",
            howTo: "Before deep work, prime your mind with related content. Read, watch, discuss. Then let connections emerge.",
            scienceBehind: "Pattern recognition releases dopamine and activates the default mode network in a focused way, creating the conditions for insight.",
            icon: "circle.hexagongrid.fill",
            timeToEffect: "Variable - depends on incubation"
        ),

        FlowTrigger(
            id: "creativity_over_consumption",
            category: .creative,
            name: "Creation Over Consumption",
            description: "Passive consumption kills flow capacity. Active creation builds it. The muscle must be used.",
            howTo: "For every hour of consumption, create for 30 minutes. Write, code, draw, build. Anything generative counts.",
            scienceBehind: "Creation activates the prefrontal cortex and builds the neural pathways needed for sustained attention.",
            icon: "hammer.fill",
            timeToEffect: "Cumulative - builds over weeks"
        )

    ]

    static func byCategory(_ category: TriggerCategory) -> [FlowTrigger] {
        all.filter { $0.category == category }
    }

}

// MARK: - Flow Blocker

struct FlowBlocker: Identifiable {

    let id: String
    let name: String
    let description: String
    let icon: String
    let solution: String

}

extension FlowBlocker {

    static let all: [FlowBlocker] = [

        FlowBlocker(
            id: "multitasking",
            name: "Multitasking",
            description: "The flow killer. Every task switch costs 23 minutes of recovery. You cannot multitask into flow.",
            icon: "square.stack.3d.up.fill",
            solution: "Single-task ruthlessly. One tab. One project. One outcome. The brain is a single-threaded processor for deep work."
        ),

        FlowBlocker(
            id: "notifications",
            name: "Notifications",
            description: "Each notification hijacks your attention and releases cortisol. Even the anticipation of notifications prevents flow.",
            icon: "bell.badge.fill",
            solution: "Airplane mode. Do Not Disturb. Phone in another room. The world can wait 90 minutes."
        ),

        FlowBlocker(
            id: "perfectionism",
            name: "Perfectionism",
            description: "The inner critic kills flow by creating evaluation anxiety. You can't be absorbed if you're judging.",
            icon: "checkmark.seal.fill",
            solution: "Separate creation from editing. First draft is for getting it down. Second draft is for getting it right. Never do both at once."
        ),

        FlowBlocker(
            id: "low_stakes",
            name: "Low Stakes",
            description: "If nothing is on the line, attention wanders. The brain conserves energy when it doesn't matter.",
            icon: "gauge.low",
            solution: "Create artificial stakes. Public commitments. Deadlines with consequences. Money. Reputation. Make it matter."
        ),

        FlowBlocker(
            id: "energy_depletion",
            name: "Energy Depletion",
            description: "Flow requires energy. Sleep deprivation, poor nutrition, and chronic stress make flow impossible.",
            icon: "battery.25",
            solution: "Protect sleep. Move your body. Eat real food. Manage stress. Flow is a luxury good that requires a foundation."
        ),

        FlowBlocker(
            id: "unclear_goals",
            name: "Unclear Goals",
            description: "Ambiguity creates decision fatigue. The brain can't lock on when it doesn't know what it's aiming at.",
            icon: "questionmark.circle.fill",
            solution: "Before starting: write ONE sentence describing your specific outcome for this session. If you can't write it, clarify first."
        ),

        FlowBlocker(
            id: "wrong_time",
            name: "Wrong Time of Day",
            description: "Fighting your circadian rhythm wastes energy. Deep work during troughs is like swimming upstream.",
            icon: "clock.badge.xmark.fill",
            solution: "Track your energy. Find your peaks. Protect them for flow work. Use troughs for admin and recovery."
        ),

        FlowBlocker(
            id: "emotional_noise",
            name: "Emotional Noise",
            description: "Unprocessed emotions consume cognitive bandwidth. Anxiety, resentment, and unfinished business prevent flow.",
            icon: "brain.head.profile",
            solution: "Before deep work: 5 minutes of journaling to 'empty the buffer.' Process what's present so it doesn't hijack attention."
        )

    ]

}
