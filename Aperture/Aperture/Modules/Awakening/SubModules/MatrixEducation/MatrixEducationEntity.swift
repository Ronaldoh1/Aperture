// MatrixEducationEntity.swift
// THE MATRIX DECODED - 10 LAYER FRAMEWORK

import Foundation
import SwiftUI

// MARK: - Matrix Layer Model

struct MatrixLayer: Identifiable, Codable {
  let id: Int
  let name: String
  let subtitle: String
  let icon: String
  let colorHex: String
  let overview: String
  let mechanisms: [Mechanism]
  let realWorldExamples: [String]
  let recognitionSigns: [String]
  let questionPrompts: [String]
  let relatedDomains: [String]
  let breakingDifficulty: BreakingDifficulty

  var color: Color {
    Color(hex: colorHex)
  }

  struct Mechanism: Codable, Identifiable {
    let id: UUID
    let name: String
    let description: String
    let howItWorks: String

    init(name: String, description: String, howItWorks: String) {
      id = UUID()
      self.name = name
      self.description = description
      self.howItWorks = howItWorks
    }
  }

  enum BreakingDifficulty: String, Codable {
    case foundational = "Foundational (Hardest)"
    case deep = "Deep Programming"
    case institutional = "Institutional"
    case environmental = "Environmental"
    case surface = "Surface Level"

    var color: Color {
      switch self {
      case .foundational: return .red
      case .deep: return .orange
      case .institutional: return .yellow
      case .environmental: return .cyan
      case .surface: return .green
      }
    }
  }
}

// MARK: - User Progress

struct MatrixEducationProgress: Codable {
  var layersCompleted: [Int]
  var totalTimeSpent: TimeInterval
  var lastAccessedLayer: Int?

  var completionPercentage: Double {
    Double(layersCompleted.count) / 10.0
  }

  var hasCompletedAllLayers: Bool {
    layersCompleted.count >= 10
  }

  static var `default`: MatrixEducationProgress {
    MatrixEducationProgress(layersCompleted: [], totalTimeSpent: 0, lastAccessedLayer: nil)
  }
}

// MARK: - Matrix Layer Database (All 10 Layers)

final class MatrixLayerDatabase {
  static let shared = MatrixLayerDatabase()
  private init() {}

  let layers: [MatrixLayer] = [
    // LAYER 1: BIOLOGICAL HARDWARE
    MatrixLayer(
      id: 1,
      name: "Biological Hardware",
      subtitle: "The code you never opted into",
      icon: "brain",
      colorHex: "#FF4444",
      overview: """
        This is the deepest layer. It runs before thought. Your nervous system prioritizes safety and familiarity over truth.

        Survival instincts, fear response, hunger, sex drive, tribal bonding—these bias perception toward short-term safety over long-term understanding.

        Anything that threatens belonging triggers anxiety before logic even wakes up. This layer predates language. You never opted in. It's hardware, not software.
        """,
      mechanisms: [
        MatrixLayer.Mechanism(
          name: "Survival Code",
          description: "Fear, hunger, pain avoidance, status seeking",
          howItWorks:
            "Rewards familiarity, punishes deviation with anxiety. Makes the unfamiliar feel dangerous even when it's just different."
        ),
        MatrixLayer.Mechanism(
          name: "Attachment & Belonging",
          description: "Ostracism activates same circuits as physical pain",
          howItWorks:
            "Humans will betray truth to avoid exile. This makes conformity feel moral and necessary for survival."
        ),
        MatrixLayer.Mechanism(
          name: "Trauma Imprinting",
          description: "Early shocks become permanent filters",
          howItWorks:
            "The system doesn't need to oppress you later if your nervous system already does it automatically."
        ),
      ],
      realWorldExamples: [
        "Feeling anxious when considering leaving a job, relationship, or belief system—even when you know it's harmful",
        "Physical discomfort when someone challenges your deeply held beliefs",
        "Automatic distrust of 'outsiders' or people who look/think differently",
        "Choosing comfortable lies over uncomfortable truths",
      ],
      recognitionSigns: [
        "Your body reacts before your mind processes",
        "You feel fear when no actual threat exists",
        "Belonging feels more important than being right",
        "You avoid information that might change your worldview",
      ],
      questionPrompts: [
        "When was the last time I chose comfort over truth?",
        "What am I afraid to lose that keeps me compliant?",
        "What would I believe if I had no fear of rejection?",
      ],
      relatedDomains: ["Relationships", "Spirituality"],
      breakingDifficulty: .foundational
    ),

    // LAYER 2: FAMILY CONDITIONING
    MatrixLayer(
      id: 2,
      name: "Family Conditioning",
      subtitle: "Beliefs that arrived before consent",
      icon: "house.fill",
      colorHex: "#FF6B35",
      overview: """
        Beliefs arrive before consent. Religion, politics, money attitudes, gender roles, shame scripts—you absorb these as "normal" because they arrive wrapped in love and authority.

        This is where guilt gets installed as a control mechanism. Questioning these feels like betraying the people who raised you, not like curiosity or growth.
        """,
      mechanisms: [
        MatrixLayer.Mechanism(
          name: "Pre-Consent Installation",
          description: "Beliefs arrive before critical thinking develops",
          howItWorks:
            "Children absorb worldviews wholesale. By the time you can question, the beliefs feel like 'you' rather than 'programs.'"
        ),
        MatrixLayer.Mechanism(
          name: "Love-Wrapped Authority",
          description: "Truth claims bundled with emotional bonds",
          howItWorks:
            "Rejecting a belief feels like rejecting the person who gave it. Loyalty and truth become confused."
        ),
        MatrixLayer.Mechanism(
          name: "Shame Script Installation",
          description: "Guilt as internal control mechanism",
          howItWorks:
            "You learn to feel bad about certain thoughts, desires, or questions. Self-policing begins here."
        ),
      ],
      realWorldExamples: [
        "Feeling guilty for questioning your parents' religion",
        "Inheriting money anxiety from parents who grew up poor",
        "Absorbing political views without ever examining them",
        "Gender role expectations you never chose",
      ],
      recognitionSigns: [
        "You feel guilt when questioning family beliefs",
        "Some topics are 'off limits' in your family",
        "You hold beliefs you've never actually examined",
        "Disagreeing with family feels like betrayal",
      ],
      questionPrompts: [
        "What beliefs did I inherit that I've never examined?",
        "What would my family reject me for believing?",
        "Which of my values are mine vs. installed?",
      ],
      relatedDomains: ["Relationships", "Spirituality", "Money"],
      breakingDifficulty: .foundational
    ),

    // LAYER 3: LANGUAGE FRAMING
    MatrixLayer(
      id: 3,
      name: "Language Framing",
      subtitle: "The fence around thought",
      icon: "text.quote",
      colorHex: "#FFB347",
      overview: """
        Language does not just describe reality—it fences it. Words are compression algorithms. They simplify, distort, and freeze meaning.

        Vocabulary limits thought. Labels collapse complexity. Once something is named, it feels understood even when it's not. This is where nuance dies quietly.

        Whoever controls definitions controls debate.
        """,
      mechanisms: [
        MatrixLayer.Mechanism(
          name: "Vocabulary Limitation",
          description: "You can't think what you can't name",
          howItWorks:
            "Limited vocabulary = limited perception. The words available shape what thoughts are even possible."
        ),
        MatrixLayer.Mechanism(
          name: "Label Collapse",
          description: "Complex phenomena reduced to simple tags",
          howItWorks:
            "Once labeled, inquiry stops. 'That's just a conspiracy theory' ends investigation before it begins."
        ),
        MatrixLayer.Mechanism(
          name: "Definition Control",
          description: "Who defines terms wins debates",
          howItWorks:
            "If I define 'terrorism' or 'freedom' or 'success,' I control what qualifies and what doesn't."
        ),
      ],
      realWorldExamples: [
        "'Collateral damage' instead of 'civilians killed'",
        "'Human resources' instead of 'people'",
        "'Enhanced interrogation' instead of 'torture'",
        "Dismissing ideas as 'conspiracy theory' without examination",
      ],
      recognitionSigns: [
        "You stop thinking once something is labeled",
        "You use terms you've never actually defined",
        "Complex issues feel simple once named",
        "You dismiss ideas based on their label, not content",
      ],
      questionPrompts: [
        "What labels do I use that I've never defined?",
        "What idea have I dismissed without examining?",
        "How would I describe this without the usual words?",
      ],
      relatedDomains: ["Education", "Authority"],
      breakingDifficulty: .deep
    ),

    // LAYER 4: EDUCATION PROGRAMMING
    MatrixLayer(
      id: 4,
      name: "Education Programming",
      subtitle: "Training permission-seekers",
      icon: "graduationcap.fill",
      colorHex: "#FFEB3B",
      overview: """
        What is emphasized matters more than what is taught. Obedience over curiosity. Memorization over synthesis. Authority over inquiry. Failure is punished, not explored.

        This layer trains people to wait for permission and external validation. Compliance is rewarded. Curiosity is tolerated only when harmless.
        """,
      mechanisms: [
        MatrixLayer.Mechanism(
          name: "Compliance Rewards",
          description: "Following rules matters more than understanding",
          howItWorks:
            "Grades reward conformity. The 'best' students are often the most obedient, not the most curious."
        ),
        MatrixLayer.Mechanism(
          name: "Permission-Seeking Installation",
          description: "You learn to wait for authority to validate",
          howItWorks:
            "Raise your hand. Ask permission. Wait to be called on. Don't act until approved."
        ),
        MatrixLayer.Mechanism(
          name: "Failure Punishment",
          description: "Mistakes are shameful, not educational",
          howItWorks:
            "Fear of wrong answers kills experimentation. You learn to play it safe, not play."
        ),
      ],
      realWorldExamples: [
        "Waiting for a boss to tell you it's okay to innovate",
        "Feeling anxious about making decisions without approval",
        "Measuring intelligence by credentials, not insight",
        "Avoiding risk because failure feels like identity threat",
      ],
      recognitionSigns: [
        "You seek external validation before acting",
        "You equate grades/credentials with intelligence",
        "You fear 'wrong' answers more than ignorance",
        "You wait for permission to pursue ideas",
      ],
      questionPrompts: [
        "What would I learn if grades didn't exist?",
        "What am I waiting for permission to do?",
        "Who told me I wasn't smart enough?",
      ],
      relatedDomains: ["Education", "Career", "Identity"],
      breakingDifficulty: .institutional
    ),

    // LAYER 5: ECONOMIC CONDITIONING
    MatrixLayer(
      id: 5,
      name: "Economic Conditioning",
      subtitle: "Work = worth, time = money",
      icon: "dollarsign.circle.fill",
      colorHex: "#4CAF50",
      overview: """
        Work equals worth. Productivity equals virtue. Scarcity is treated as natural, not engineered. Debt becomes normalized. Time is sold back to you in pieces.

        This layer is powerful because it hijacks survival anxiety and calls it responsibility. You feel lazy for resting and guilty for wanting more.
        """,
      mechanisms: [
        MatrixLayer.Mechanism(
          name: "Work-Worth Equation",
          description: "Your value is your productivity",
          howItWorks:
            "Rest feels like laziness. Your identity becomes your job title. Without work, you feel worthless."
        ),
        MatrixLayer.Mechanism(
          name: "Engineered Scarcity",
          description: "Artificial limits create control",
          howItWorks:
            "There's 'not enough' jobs, money, housing—but is that natural or designed? Scarcity makes you compete instead of cooperate."
        ),
        MatrixLayer.Mechanism(
          name: "Debt Normalization",
          description: "Owing money is just 'how things work'",
          howItWorks:
            "Student loans, mortgages, credit cards—you start life in debt and work to escape a hole you didn't dig."
        ),
      ],
      realWorldExamples: [
        "Feeling guilty for taking a day off",
        "Defining yourself by your job title",
        "Accepting 'I can't afford it' without questioning the system",
        "Working jobs you hate to pay debts you didn't understand",
      ],
      recognitionSigns: [
        "You feel guilty when not productive",
        "Your job defines your identity",
        "You accept scarcity as natural",
        "You measure success by income",
      ],
      questionPrompts: [
        "What would I do if money wasn't a factor?",
        "Who benefits from me believing I'm not enough?",
        "What is 'success' without the money definition?",
      ],
      relatedDomains: ["Money", "Career", "Identity"],
      breakingDifficulty: .institutional
    ),

    // LAYER 6: MEDIA & NARRATIVE CONTROL
    MatrixLayer(
      id: 6,
      name: "Media & Narrative Control",
      subtitle: "Manufacturing consensus",
      icon: "newspaper.fill",
      colorHex: "#2196F3",
      overview: """
        Repetition creates truthiness. Emotional stories override statistical reality. Outrage is monetized. Complex systems are reduced to villains and heroes.

        This layer keeps attention reactive, not reflective. A distracted mind does not question structure. Entertainment becomes the new opiate.
        """,
      mechanisms: [
        MatrixLayer.Mechanism(
          name: "Repetition = Truth",
          description: "Say it enough and it becomes real",
          howItWorks:
            "Familiar claims feel true. If you've heard it a hundred times, it must be right—right?"
        ),
        MatrixLayer.Mechanism(
          name: "Outrage Monetization",
          description: "Anger gets clicks, clicks get money",
          howItWorks:
            "Media profits from division. Nuance doesn't trend. You're kept angry, not informed."
        ),
        MatrixLayer.Mechanism(
          name: "Hero/Villain Reduction",
          description: "Complex systems become simple stories",
          howItWorks:
            "Systemic issues are blamed on individuals. Fixing the villain feels easier than fixing the system."
        ),
      ],
      realWorldExamples: [
        "Believing something because it's repeated everywhere",
        "Getting angry at news designed to provoke you",
        "Blaming one politician for systemic problems",
        "Consuming entertainment instead of investigating",
      ],
      recognitionSigns: [
        "You accept repeated claims without verification",
        "News makes you angry more than informed",
        "You think in heroes and villains",
        "Your attention is constantly hijacked",
      ],
      questionPrompts: [
        "What narrative have I accepted without examining?",
        "Who profits from my outrage?",
        "What am I not being shown?",
      ],
      relatedDomains: ["Authority", "Identity"],
      breakingDifficulty: .environmental
    ),

    // LAYER 7: SOCIAL IDENTITY FUSION
    MatrixLayer(
      id: 7,
      name: "Social Identity Fusion",
      subtitle: "When criticism feels like violence",
      icon: "person.3.fill",
      colorHex: "#9C27B0",
      overview: """
        Race, nation, party, religion, team. Identity becomes a proxy for thinking. Once fused, criticism feels like attack.

        This layer ensures people defend systems that harm them because those systems are tied to who they think they are. Disagreement becomes personal.
        """,
      mechanisms: [
        MatrixLayer.Mechanism(
          name: "Identity-Belief Fusion",
          description: "What you believe = who you are",
          howItWorks:
            "Changing your mind means changing your identity. The psychological cost is too high, so people double down."
        ),
        MatrixLayer.Mechanism(
          name: "Tribal Proxy Thinking",
          description: "Let the group think for you",
          howItWorks:
            "Instead of evaluating ideas, check if your tribe approves. Saves cognitive effort, costs independent thought."
        ),
        MatrixLayer.Mechanism(
          name: "Criticism-as-Attack",
          description: "Disagreement triggers defense response",
          howItWorks:
            "When identity and belief are fused, questioning ideas feels like questioning existence."
        ),
      ],
      realWorldExamples: [
        "Defending a politician's actions you'd condemn in the other party",
        "Feeling personally attacked when your country is criticized",
        "Refusing to consider evidence that challenges your team",
        "Losing friends over political disagreements",
      ],
      recognitionSigns: [
        "You feel attacked when your group is criticized",
        "You defend positions without examining them",
        "Your opinions match your tribe's opinions",
        "Changing your mind feels like betrayal",
      ],
      questionPrompts: [
        "What would I believe if I had no tribe?",
        "Am I defending this idea or defending my identity?",
        "Can I steelman the opposing view?",
      ],
      relatedDomains: ["Relationships", "Authority", "Identity"],
      breakingDifficulty: .deep
    ),

    // LAYER 8: TECHNOLOGICAL FEEDBACK LOOPS
    MatrixLayer(
      id: 8,
      name: "Technological Feedback Loops",
      subtitle: "The algorithm is the new authority",
      icon: "iphone",
      colorHex: "#00BCD4",
      overview: """
        Algorithms reward conformity, not accuracy. Dopamine loops replace meaning. Outrage, validation, and tribal affirmation become addictive.

        This layer constantly rewires attention spans and emotional baselines. Visibility is not neutral. Silence becomes threat. People outsource self-worth to metrics.
        """,
      mechanisms: [
        MatrixLayer.Mechanism(
          name: "Algorithmic Shaping",
          description: "What you see is what they want you to see",
          howItWorks:
            "Algorithms reward engagement, not truth. Polarization and outrage perform better than nuance."
        ),
        MatrixLayer.Mechanism(
          name: "Dopamine Hijacking",
          description: "Validation becomes currency",
          howItWorks:
            "Likes, shares, comments trigger dopamine. You become addicted to external validation."
        ),
        MatrixLayer.Mechanism(
          name: "Surveillance Normalization",
          description: "Knowing you might be watched changes behavior",
          howItWorks:
            "You don't need actual surveillance—just the possibility. Self-censorship becomes automatic."
        ),
      ],
      realWorldExamples: [
        "Checking your phone before getting out of bed",
        "Feeling anxious when a post doesn't get likes",
        "Inability to focus for more than a few minutes",
        "Curating your life for social media",
      ],
      recognitionSigns: [
        "Your mood depends on notifications",
        "You can't sit in silence comfortably",
        "Your attention span has shortened",
        "You present a curated version of yourself",
      ],
      questionPrompts: [
        "How much of my self-worth comes from metrics?",
        "What would I think without the algorithm?",
        "When did I last have an original thought?",
      ],
      relatedDomains: ["Relationships", "Health", "Identity"],
      breakingDifficulty: .environmental
    ),

    // LAYER 9: METAPHYSICAL FRAMING
    MatrixLayer(
      id: 9,
      name: "Metaphysical Framing",
      subtitle: "Cosmic narratives that justify suffering",
      icon: "sparkles",
      colorHex: "#E91E63",
      overview: """
        Stories about destiny, chosenness, apocalypse, salvation. These give suffering meaning but also delay action. Power structures hide inside cosmic narratives.

        'Everything happens for a reason' is one of the most effective pacifiers ever deployed. Justice is postponed to an imagined future so it never has to be enacted now.
        """,
      mechanisms: [
        MatrixLayer.Mechanism(
          name: "Destiny Narratives",
          description: "Everything happens for a reason",
          howItWorks: "Anesthetizes injustice. If it's 'meant to be,' there's no need to fight it."
        ),
        MatrixLayer.Mechanism(
          name: "Chosenness Myths",
          description: "Some are meant to rule, others to serve",
          howItWorks:
            "Hierarchy becomes sacred. Inequality is divine order, not human construction."
        ),
        MatrixLayer.Mechanism(
          name: "Apocalypse Deferral",
          description: "Justice comes later, so accept injustice now",
          howItWorks:
            "Heaven, karma, the revolution—justice is always coming 'soon' so it never has to be enacted today."
        ),
      ],
      realWorldExamples: [
        "Accepting abuse because 'God has a plan'",
        "Believing poverty is karmic punishment",
        "Waiting for revolution instead of acting now",
        "Justifying inequality as 'natural order'",
      ],
      recognitionSigns: [
        "You accept suffering as 'meant to be'",
        "You defer action to some future event",
        "You believe some people are inherently superior",
        "You use spirituality to avoid confrontation",
      ],
      questionPrompts: [
        "What injustice am I accepting as 'God's plan'?",
        "What am I waiting for that's never coming?",
        "Who benefits from my spiritual passivity?",
      ],
      relatedDomains: ["Spirituality", "Authority"],
      breakingDifficulty: .deep
    ),

    // LAYER 10: INTERNALIZED SELF-POLICING
    MatrixLayer(
      id: 10,
      name: "Internalized Self-Policing",
      subtitle: "The final boss: The cage inside",
      icon: "lock.fill",
      colorHex: "#607D8B",
      overview: """
        This is the final boss. No external enforcer required. You censor yourself. You doubt your perception. You preemptively shrink.

        At this stage the system runs itself. The cage is now inside the mind. You question your perception before questioning authority. You silence yourself to avoid punishment that hasn't occurred.

        You correct others on behalf of the system. You become a node.
        """,
      mechanisms: [
        MatrixLayer.Mechanism(
          name: "Self-Doubt Installation",
          description: "Question yourself before questioning authority",
          howItWorks:
            "Your first instinct is to assume you're wrong. 'Maybe I'm just being crazy' protects the system."
        ),
        MatrixLayer.Mechanism(
          name: "Preemptive Compliance",
          description: "Silence yourself before anyone makes you",
          howItWorks:
            "You don't say the thing, apply for the job, or challenge the norm—just in case. Fear of hypothetical consequences."
        ),
        MatrixLayer.Mechanism(
          name: "Identity Policing",
          description: "You enforce the system on others",
          howItWorks:
            "You correct others. You mock questioners. You become an unpaid enforcement node for the Matrix."
        ),
      ],
      realWorldExamples: [
        "Not speaking up in meetings because 'it's probably a dumb idea'",
        "Editing yourself before anyone criticizes you",
        "Mocking 'conspiracy theorists' without examining their claims",
        "Feeling crazy for seeing patterns others miss",
      ],
      recognitionSigns: [
        "You doubt your perception automatically",
        "You silence yourself before being silenced",
        "You enforce norms you never chose",
        "You feel 'crazy' for questioning",
      ],
      questionPrompts: [
        "What am I not saying that I should?",
        "Whose rules am I enforcing on myself?",
        "What would I do if I trusted my perception?",
      ],
      relatedDomains: ["Identity", "Relationships", "Career"],
      breakingDifficulty: .foundational
    ),
  ]

  func getLayer(by id: Int) -> MatrixLayer? {
    layers.first { $0.id == id }
  }
}
