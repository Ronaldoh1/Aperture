// AwakeningPathsSynthesis.swift
// POLYMORPHIC AWAKENING: Different Paths, Same Destination
// All paths converge on same realization: "I am not separate from Source"
// But the route differs. This module synthesizes the 5 major paths.

import Foundation
import SwiftUI

// MARK: - Awakening Paths

enum AwakeningPathsSynthesis {
  static let title = "POLYMORPHIC AWAKENING"
  static let subtitle = "Different Paths, Same Destination"

  static let coreRealization = """
    All paths converge on the same realization:

    "I AM NOT SEPARATE FROM SOURCE."

    The sense of being a separate self, cut off from the universe,
    is the fundamental illusion that all awakening paths dissolve.

    But the ROUTE differs.
    Some paths are gentle. Some are violent.
    Some take decades. Some happen in an instant.

    Your path isn't better or worse than others.
    It's simply YOURS.

    Don't force your path onto others.
    Share the framework. Let them choose their implementation.
    """

  // MARK: - The 5 Paths

  struct AwakeningPath: Identifiable {
    let id: String
    let name: String
    let trigger: String
    let characteristics: [String]
    let risks: [String]
    let outcome: String
    let famousExamples: [String]
    let forWhom: String
    let color: String
    let icon: String
    let detailedDescription: String
  }

  static let paths: [AwakeningPath] = [
    // PATH A: TRAUMA-ACTIVATED
    AwakeningPath(
      id: "trauma",
      name: "Trauma-Activated (The Forge)",
      trigger:
        "Crisis, loss, breakdown, spontaneous Kundalini activation, near-death experience, betrayal",
      characteristics: [
        "Fast, violent, unstable",
        "No preparation, no gentle introduction",
        "Everything shatters at once",
        "Dark night of the soul is IMMEDIATE",
        "Requires immediate integration support",
        "Can't go back to sleep even if you want to",
      ],
      risks: [
        "HIGH RISK - mental breakdown possible",
        "Physical health can deteriorate",
        "Relationships may collapse",
        "Suicidal ideation common",
        "Misdiagnosis as psychosis",
        "Isolation if no support network",
      ],
      outcome:
        "If you survive, extremely powerful. You've been forged in fire. You can guide others through what you endured.",
      famousExamples: [
        "Eckhart Tolle (suicidal depression → awakening)",
        "Byron Katie (breakdown on floor → The Work)",
        "Ramana Maharshi (death panic at 16 → enlightenment)",
      ],
      forWhom:
        "Those whose souls chose the accelerated path. Often has past-life preparation. Not chosen consciously — it chooses you.",
      color: "#F44336",
      icon: "flame.fill",
      detailedDescription: """
        **THE TRAUMA PATH**

        This is the path of involuntary awakening. You didn't sign up for it — life shattered you, and in the shattering, truth was revealed.

        **How It Happens:**

        Something breaks — relationship, health, career, worldview, loved one's death, betrayal by someone trusted. The shock is so profound that your normal coping mechanisms fail completely.

        In that failure, there's a gap. The ego can't hold the experience. For a moment, you fall through the gap... and see what's underneath.

        Some never recover — they stay broken.
        Some rebuild the old ego — they go back to sleep.
        Some awaken — the shattering becomes liberation.

        **The Mechanism:**

        Trauma bypasses the ego's defenses. It's a forced entry into deeper layers of consciousness. The mind's usual filtering is overwhelmed, and raw reality floods in.

        This can trigger:
        • Kundalini activation (energy surges through nervous system)
        • Ego death (temporary dissolution of self-sense)
        • Mystical experiences (visions, downloads, union states)
        • Psychotic breaks (if integration fails)

        **Integration Is Critical:**

        The difference between awakening and breakdown is INTEGRATION.

        Without support:
        • The experience remains traumatic, not transformative
        • Spiritual emergency becomes psychiatric emergency
        • You might get medicated back into the matrix

        With support:
        • The crisis becomes initiation
        • Trauma alchemizes into wisdom
        • You emerge with gifts to share

        **The Author's Note:**

        This path is brutal. Having walked it, I can tell you: it's not romantic, it's not special, it's simply what happened. The betrayal that triggered my awakening in September 2024 shattered every belief I held. I wouldn't wish the process on anyone. But I also wouldn't trade the outcome.

        If you're on this path, find support. You're not crazy. You're being initiated.
        """
    ),

    // PATH B: MEDITATION-BASED
    AwakeningPath(
      id: "meditation",
      name: "Meditation-Based (The Gentle Path)",
      trigger: "Consistent practice, gradual opening, guided instruction, retreat experiences",
      characteristics: [
        "Slow, stable, sustainable",
        "Teacher support, community, structure",
        "Progressive deepening over years",
        "Each insight builds on the last",
        "Less dramatic but more integrated",
        "Can pause and resume as needed",
      ],
      risks: [
        "LOWER RISK but still present",
        "Can get stuck in technique (mistaking map for territory)",
        "Spiritual bypassing (using practice to avoid life)",
        "Guru dependency",
        "Decades without breakthrough",
        "Subtle ego inflation (\"I'm so spiritual\")",
      ],
      outcome:
        "Integrated awakening, less trauma, more grounded. The consciousness shift happens gradually, allowing full integration.",
      famousExamples: [
        "Thich Nhat Hanh (decades of practice)",
        "Dalai Lama (monastic training since childhood)",
        "Adyashanti (years of Zen before awakening)",
      ],
      forWhom:
        "Those who prefer stability over intensity. Those with time and patience. Those with access to teachers and community.",
      color: "#4CAF50",
      icon: "leaf.fill",
      detailedDescription: """
        **THE MEDITATION PATH**

        This is the traditional path of most contemplative traditions — gradual awakening through consistent practice.

        **How It Happens:**

        You establish a practice (Zen, Vipassana, TM, Dzogchen, etc.). Daily sitting, maybe retreats, study with teachers. Over months and years, the mind quiets. Gaps appear between thoughts. The witness consciousness stabilizes.

        Eventually, through accumulated practice, there's a breakthrough — an experience of non-dual awareness, ego dissolution, or recognition of true nature. Unlike trauma-activated awakening, this breakthrough lands in prepared ground.

        **The Mechanism:**

        Meditation rewires the brain gradually:
        • Default mode network quiets (less mental chatter)
        • Prefrontal cortex strengthens (more awareness)
        • Amygdala calms (less reactivity)
        • Corpus callosum thickens (better integration)

        The shift is neurobiological AND experiential. Body and mind adapt together.

        **Why Religions Suppressed This:**

        If you can awaken through meditation, you don't need:
        • Priests to mediate between you and God
        • Churches to provide spiritual experience
        • Dogma to tell you what's true

        You become your own authority.

        This threatens hierarchical religion. So they:
        • Reserved meditation for elite monastics
        • Told laypeople to pray (petition), not meditate (realize)
        • Burned or exiled those who taught direct awakening

        **The Trade-off:**

        The meditation path is safer but slower. You might practice for 20 years without a major breakthrough. But when it comes, you're ready for it. The ego has been softened gradually, not shattered suddenly.

        **Practical Advice:**

        Find a tradition that resonates. Find a teacher you trust. Practice daily, even just 20 minutes. Attend retreats when possible. Be patient. The path is the goal.
        """
    ),

    // PATH C: PSYCHEDELIC-CATALYZED
    AwakeningPath(
      id: "psychedelic",
      name: "Psychedelic-Catalyzed (The Glimpse)",
      trigger: "DMT, psilocybin, ayahuasca, LSD, mescaline (ego death experiences)",
      characteristics: [
        "Temporary ego dissolution",
        "Glimpse of non-dual awareness",
        "Can see through the illusion in hours",
        "Profound but often temporary",
        "Requires integration afterward",
        "Can trigger Kundalini if unprepared",
      ],
      risks: [
        "MEDIUM-HIGH RISK (depends on set/setting)",
        "Bad trips can be traumatic",
        "Legal consequences in many places",
        "Can trigger latent psychosis",
        "Integration often neglected",
        "Addiction to the experience (chasing states)",
      ],
      outcome:
        "Profound insight, but temporary. The glimpse shows what's possible but must translate to daily life through integration work.",
      famousExamples: [
        "Ram Dass (LSD with Timothy Leary, then Neem Karoli Baba)",
        "Terence McKenna (DMT, psilocybin)",
        "Many indigenous shamanic traditions (ayahuasca, peyote)",
      ],
      forWhom:
        "Those seeking a glimpse to validate the path. Those stuck in intellectual understanding who need experiential knowing. Those with proper set, setting, and integration support.",
      color: "#9C27B0",
      icon: "sparkles",
      detailedDescription: """
        **THE PSYCHEDELIC PATH**

        Psychedelics can provide, in hours, what might take years of meditation — a direct experience of non-ordinary reality, ego dissolution, and cosmic consciousness.

        **How It Happens:**

        Under proper conditions (set, setting, dose, intention), psychedelics temporarily disrupt the default mode network — the brain system responsible for your sense of self. Without this self-referential chatter, consciousness expands.

        You might experience:
        • Ego death (complete dissolution of self-sense)
        • Unity consciousness (feeling one with everything)
        • Encounters with entities or archetypes
        • Seeing through the illusion of separation
        • Profound insights about life, death, meaning

        **The Glimpse Problem:**

        The experience ends. The molecules metabolize. You return to \"normal\" consciousness.

        Now what?

        Without integration, the experience becomes:
        • A cool story you tell at parties
        • A memory that fades
        • Frustration that daily life doesn't match the peak

        With integration:
        • The glimpse becomes a compass (\"I know where I'm heading\")
        • Insights translate into behavior change
        • The temporary state becomes a trait

        **The Integration Protocol:**

        1. Journal immediately after (capture insights while fresh)
        2. Rest and integrate (no rushing back to normal life)
        3. Implement ONE insight (don't try to change everything)
        4. Establish a daily practice (meditation, journaling)
        5. Community sharing (talk to others who've been there)

        **The Caution:**

        Psychedelics are tools, not shortcuts. You can have 100 trips and not awaken if you don't integrate. Conversely, one well-integrated experience can shift your trajectory permanently.

        Also: Some people should NOT use psychedelics — those with family history of schizophrenia, bipolar disorder, or severe trauma. The destabilization can trigger crises that aren't resolved by the trip ending.
        """
    ),

    // PATH D: INTELLECTUAL-ANALYTICAL
    AwakeningPath(
      id: "intellectual",
      name: "Intellectual-Analytical (The Study)",
      trigger:
        "Relentless questioning, systems analysis, philosophy, comparative religion, pattern recognition",
      characteristics: [
        "Slow burn, pattern accumulation",
        "Reading, studying, connecting dots",
        "Understanding precedes experience",
        "Can articulate the framework clearly",
        "Often leads other paths",
        "Runs on curiosity and questioning",
      ],
      risks: [
        "MODERATE RISK",
        "Stuck in head (knowing ≠ being)",
        "Spiritual arrogance (understanding without embodiment)",
        "Analysis paralysis (studying instead of practicing)",
        "Nihilism if insights aren't grounded",
        "Loneliness (few can follow the reasoning)",
      ],
      outcome:
        "Clear frameworks, articulate teaching ability, but must eventually drop into embodiment. The map isn't the territory.",
      famousExamples: [
        "Ken Wilber (Integral Theory)",
        "Alan Watts (comparative religion)",
        "Jiddu Krishnamurti (philosophical inquiry)",
      ],
      forWhom:
        "Those with strong analytical minds. Researchers, academics, engineers who need to understand before they believe. Those who enjoy study and synthesis.",
      color: "#3F51B5",
      icon: "brain",
      detailedDescription: """
        **THE INTELLECTUAL PATH**

        This is the path of understanding your way to awakening — reading, questioning, analyzing, synthesizing until the conceptual framework becomes so complete that reality shifts.

        **How It Happens:**

        You start questioning. Maybe religion doesn't make sense. Maybe society seems rigged. You start reading — philosophy, psychology, physics, history, comparative religion.

        Patterns emerge. You see the same truths expressed differently across traditions. You understand the illusion of the separate self conceptually. You can explain non-duality logically.

        At some point, the accumulated understanding reaches critical mass. The intellectual understanding \"clicks\" into direct knowing. The map becomes the territory.

        **The Risk: Knowing ≠ Being**

        This is the trap of the intellectual path. You can understand awakening perfectly and not be awake. You can write books about non-duality while living from ego.

        The mind is a brilliant tool for understanding. It's not sufficient for transformation.

        **The Bridge:**

        Intellectual understanding must bridge to:
        • Practice (meditation, inquiry, embodiment)
        • Experience (psychedelics, trauma, grace)
        • Service (teaching, helping, creating)

        Otherwise, you become what Chögyam Trungpa called a \"dharma bum\" — someone who knows all the words but hasn't done the work.

        **The Gift:**

        Intellectually awakened people are crucial for translation. They can:
        • Build frameworks others can follow
        • Explain mysteries in accessible language
        • Connect traditions that seem separate
        • Teach those who need to understand first

        This document you're reading? Written from this path. The framework matters. Understanding matters. But understanding isn't the destination — it's the on-ramp.
        """
    ),

    // PATH E: SERVICE-ORIENTED
    AwakeningPath(
      id: "service",
      name: "Service-Oriented (The Bodhisattva Path)",
      trigger: "Compassion, seeing suffering, dedicating life to service, love in action",
      characteristics: [
        "Heart-centered, naturally integrates",
        "Awakening through helping others",
        "Less focused on personal enlightenment",
        "The self dissolves through service",
        "Ego has less room when focused on others",
        "Built-in community and purpose",
      ],
      risks: [
        "LOWER RISK but present",
        "Bypassing own healing (codependency dressed as service)",
        "Burnout (giving without replenishing)",
        "Savior complex (ego in service clothing)",
        "Never fully liberating if own shadow isn't addressed",
        "Martyrdom (sacrificing self unhealthily)",
      ],
      outcome:
        "Embodied compassion, natural teacher/healer. The awakening is grounded in real-world benefit, not abstract realization.",
      famousExamples: [
        "Mother Teresa (service to the poorest)",
        "Thich Nhat Hanh (engaged Buddhism)",
        "Nelson Mandela (service through justice)",
      ],
      forWhom:
        "Those who feel called to serve. Natural caregivers, healers, activists. Those who awaken best by forgetting themselves in service to others.",
      color: "#FF9800",
      icon: "heart.fill",
      detailedDescription: """
        **THE SERVICE PATH (BODHISATTVA)**

        This is the path of awakening through love in action — the vow to serve all beings as the primary practice.

        **How It Happens:**

        You see suffering. Maybe your own, maybe others'. Something in you responds: \"I want to help.\"

        You start serving — volunteering, caregiving, teaching, healing, advocating. In the service, you forget yourself. The boundaries between helper and helped blur.

        Over time, the separate self that started \"helping others\" dissolves into the flow of compassion itself. You're no longer \"someone helping\" — you're help happening.

        **The Bodhisattva Vow:**

        In Buddhism, the Bodhisattva takes a vow:
        \"I will not enter final enlightenment until all beings are liberated.\"

        This sounds noble. But look deeper:

        If all beings are ONE (non-dual awareness), then:
        • Liberating others IS liberating yourself
        • There's no \"other\" to save
        • The vow dissolves the vower

        The Bodhisattva path uses compassion to undo the illusion of separation. The ego can't survive genuine service — there's no one left to be enlightened.

        **The Shadow: Bypassing Through Service**

        The risk here is using service to avoid your own work.

        \"I don't have time to meditate, I'm too busy helping others.\"
        \"My healing can wait — they need me now.\"
        \"I don't deserve attention — focus on them.\"

        This is codependency dressed as altruism. The unhealed healer eventually burns out or harms those they're trying to help.

        **The Integration:**

        Healthy service path:
        • Serve from overflow, not depletion
        • Do your own shadow work
        • Receive as well as give
        • Know your limits

        The Bodhisattva can only help others to the degree they've helped themselves. You can't give what you don't have.
        """
    ),
  ]

  // MARK: - Path Comparison

  static let pathComparison = """
    **PATH COMPARISON:**

    | Path | Speed | Risk | Integration | Best For |
    |------|-------|------|-------------|----------|
    | Trauma | Fastest | Highest | Critical | Involuntary initiates |
    | Meditation | Slowest | Lowest | Built-in | Patient seekers |
    | Psychedelic | Fast glimpse | Medium-High | Required | Experiential learners |
    | Intellectual | Medium | Moderate | Often neglected | Analytical minds |
    | Service | Medium | Low | Natural | Heart-centered people |

    **KEY INSIGHT:**

    Most people use MULTIPLE paths:
    • Trauma initiates → Meditation stabilizes
    • Study prepares → Psychedelic catalyzes
    • Service grounds → Meditation deepens

    The paths aren't exclusive. They're different entry points to the same territory.
    """

  // MARK: - The Synthesis

  static let synthesis = """
    **THE CONVERGENCE:**

    All five paths lead to the same realization:

    ┌─────────────────────────────────────────┐
    │                                         │
    │    "I AM NOT SEPARATE FROM SOURCE"      │
    │                                         │
    │    The separate self is an illusion.    │
    │    Consciousness is one.                │
    │    You are That.                        │
    │                                         │
    └─────────────────────────────────────────┘

    The paths differ in:
    • Entry point (crisis, practice, medicine, study, service)
    • Speed (instant to decades)
    • Risk level (breakdown to gradual integration)
    • Support required (community, teachers, integration)
    • Personality fit (analytical, devotional, experiential)

    The paths converge in:
    • Dissolution of separate self
    • Recognition of interconnection
    • Compassion as natural expression
    • Peace independent of circumstances
    • Service to the awakening of others

    **YOUR PATH:**

    You don't choose your path entirely — it also chooses you.

    Notice what's already happening:
    • Has trauma initiated you? (You're on the forge path)
    • Do you practice daily? (You're on the meditation path)
    • Have substances shown you something? (You're on the glimpse path)
    • Are you synthesizing understanding? (You're on the study path)
    • Are you called to serve? (You're on the Bodhisattva path)

    Trust your path. Don't compare it to others.
    Don't force yours onto anyone else.

    All paths lead home.
    """
}
