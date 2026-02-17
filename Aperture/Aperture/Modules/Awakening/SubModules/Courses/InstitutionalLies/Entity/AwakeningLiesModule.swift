// AwakeningLiesModule.swift
// The illusions people recognize after awakening

import SwiftUI

struct AwakeningLie: Identifiable {
  let id: String
  let number: Int
  let lie: String
  let truth: String
  let category: LieCategory
}

enum LieCategory: String, CaseIterable {
  case identity = "Identity"
  case worth = "Worth & Success"
  case relationships = "Relationships"
  case reality = "Reality & Truth"
  case spirituality = "Spirituality"
  case emotions = "Emotions"

  var icon: String {
    switch self {
    case .identity: return "person.fill.questionmark"
    case .worth: return "trophy.fill"
    case .relationships: return "heart.fill"
    case .reality: return "eye.fill"
    case .spirituality: return "sparkles"
    case .emotions: return "brain.head.profile"
    }
  }

  var color: Color {
    switch self {
    case .identity: return Color(hex: "#9C27B0")
    case .worth: return Color(hex: "#FFD700")
    case .relationships: return Color(hex: "#E91E63")
    case .reality: return Color(hex: "#00BCD4")
    case .spirituality: return Color(hex: "#7C5CFF")
    case .emotions: return Color(hex: "#4CAF50")
    }
  }
}

extension AwakeningLie {
  static let all: [AwakeningLie] = [
    // IDENTITY LIES

    AwakeningLie(
      id: "lie_1",
      number: 1,
      lie: "You are your thoughts.",
      truth:
        "Thoughts are events, not identity. You are the awareness observing them. Attention is trainable - you can choose which thoughts to engage.",
      category: .identity
    ),

    AwakeningLie(
      id: "lie_17",
      number: 17,
      lie: "There is one correct identity label that will complete you.",
      truth:
        "Identity is a tool, not a prison. Awakening often involves loosening the grip on fixed identity and seeing labels as useful shortcuts, not essential truths.",
      category: .identity
    ),

    AwakeningLie(
      id: "lie_12",
      number: 12,
      lie: "You are separate.",
      truth:
        "We are biologically and socially interdependent. The felt sense of connectedness isn't mystical - it's recognizing the scientific truth that no human exists in isolation.",
      category: .identity
    ),

    // WORTH & SUCCESS LIES

    AwakeningLie(
      id: "lie_2",
      number: 2,
      lie: "Your worth equals your productivity.",
      truth:
        "Rest is not laziness. Burnout is not normal. You don't have to earn the right to exist. Your value is inherent, not calculated by output.",
      category: .worth
    ),

    AwakeningLie(
      id: "lie_4",
      number: 4,
      lie: "More money automatically equals more happiness.",
      truth:
        "Money reduces stress at low levels. After basics are met, satisfaction is shaped by meaning, relationships, and avoiding comparison loops - not accumulation.",
      category: .worth
    ),

    AwakeningLie(
      id: "lie_5",
      number: 5,
      lie: "Success is one linear ladder: school → career → status → retire.",
      truth:
        "This is a script, not a law of nature. Many discover fulfillment comes from defining their own path rather than climbing someone else's ladder.",
      category: .worth
    ),

    AwakeningLie(
      id: "lie_18",
      number: 18,
      lie: "You must be chosen to matter.",
      truth:
        "Meaning is built through action, not bestowed like a royal certificate. You create significance by how you live, not by waiting for external validation.",
      category: .worth
    ),

    // REALITY & TRUTH LIES

    AwakeningLie(
      id: "lie_6",
      number: 6,
      lie: "Authority equals truth.",
      truth:
        "Titles, uniforms, institutions, and follower counts don't equal correctness. Credentials indicate training, not infallibility. Separate the claim from the claimant.",
      category: .reality
    ),

    AwakeningLie(
      id: "lie_7",
      number: 7,
      lie: "Consensus equals reality.",
      truth:
        "Majority belief feels like proof but is often just social gravity. Throughout history, the majority was wrong about the Earth's shape, slavery, women's rights, and more.",
      category: .reality
    ),

    AwakeningLie(
      id: "lie_8",
      number: 8,
      lie: "If it's repeated enough, it must be true.",
      truth:
        "The illusory truth effect: repetition increases perceived accuracy, even for misinformation. Frequency of a claim says nothing about its validity.",
      category: .reality
    ),

    AwakeningLie(
      id: "lie_9",
      number: 9,
      lie: "Your feed is the world.",
      truth:
        "Algorithmic attention markets shape perceived reality. What you see is curated to maximize engagement, not to represent what actually exists.",
      category: .reality
    ),

    AwakeningLie(
      id: "lie_10",
      number: 10,
      lie: "Urgency means importance.",
      truth:
        "Outrage and fear hijack attention. The loudest thing feels like the biggest thing, but volume correlates with engagement optimization, not significance.",
      category: .reality
    ),

    AwakeningLie(
      id: "lie_24",
      number: 24,
      lie: "If you notice patterns, it must be destiny.",
      truth:
        "Brains are pattern engines. Frequency illusion (Baader-Meinhof phenomenon) makes something feel suddenly everywhere once it's on your radar.",
      category: .reality
    ),

    AwakeningLie(
      id: "lie_25",
      number: 25,
      lie: "Memory is a recording.",
      truth:
        "Memory is reconstructive and vulnerable to misinformation. You can become confident in narratives that aren't reliably grounded in what actually happened.",
      category: .reality
    ),

    // RELATIONSHIPS LIES

    AwakeningLie(
      id: "lie_13",
      number: 13,
      lie: "Love is possession.",
      truth:
        "Romance scripts confuse attachment, control, jealousy, and security with love. Real love involves freedom, not ownership.",
      category: .relationships
    ),

    AwakeningLie(
      id: "lie_14",
      number: 14,
      lie: "Conflict means the relationship is failing.",
      truth:
        "Conflict is information, not apocalypse. Healthy relationships navigate disagreement; they don't avoid it through suppression or compliance.",
      category: .relationships
    ),

    AwakeningLie(
      id: "lie_15",
      number: 15,
      lie: "Boundaries are selfish.",
      truth:
        "Boundaries are the price of real intimacy. Without them, resentment builds. Setting limits protects relationships; it doesn't destroy them.",
      category: .relationships
    ),

    AwakeningLie(
      id: "lie_23",
      number: 23,
      lie: "You can outsource your thinking.",
      truth:
        "Guru dependency, influencer dependency, party-line dependency - awakening includes reclaiming epistemic responsibility. No one can think for you.",
      category: .relationships
    ),

    // EMOTIONS LIES

    AwakeningLie(
      id: "lie_3",
      number: 3,
      lie: "Happiness is the absence of negative emotion.",
      truth:
        "Avoidance and suppression backfire. Discomfort is part of processing and growth. Trying to eliminate negative emotions creates more suffering.",
      category: .emotions
    ),

    AwakeningLie(
      id: "lie_11",
      number: 11,
      lie: "You can think your way out of everything.",
      truth:
        "Embodiment, nervous system regulation, and environment matter - not just 'mindset.' Some problems require body-level solutions, not more analysis.",
      category: .emotions
    ),

    AwakeningLie(
      id: "lie_16",
      number: 16,
      lie: "If you suffer, you are weak.",
      truth:
        "Suffering is data - a signal to adjust, not proof of inferiority. Everyone suffers. The question is what you do with the information.",
      category: .emotions
    ),

    AwakeningLie(
      id: "lie_21",
      number: 21,
      lie: "Pain always means stop.",
      truth:
        "Sometimes pain means stop. Sometimes it means learn. Awakening improves discrimination between harm and growth discomfort.",
      category: .emotions
    ),

    AwakeningLie(
      id: "lie_22",
      number: 22,
      lie: "'Everything happens for a reason' as a comfort blanket.",
      truth:
        "Things happen, then meaning is made through response. Retroactive meaning-making is a coping mechanism, not cosmic truth.",
      category: .emotions
    ),

    // SPIRITUALITY LIES

    AwakeningLie(
      id: "lie_19",
      number: 19,
      lie: "Spirituality makes you superior.",
      truth:
        "The spiritual ego trap: ego grabs spiritual language as status. 'I'm more awakened than you' is ego wearing a costume.",
      category: .spirituality
    ),

    AwakeningLie(
      id: "lie_20",
      number: 20,
      lie: "Purity equals enlightenment.",
      truth:
        "The awakened person is not flawless - never angry, never triggered, never petty. Awakening doesn't delete being human; it integrates it.",
      category: .spirituality
    ),
  ]

  static func byCategory(_ category: LieCategory) -> [AwakeningLie] {
    all.filter { $0.category == category }
  }
}
