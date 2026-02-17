// GodModeEntity.swift
// Data models for the GodMode reality operating system
// Includes manifestation techniques, SATS sessions, 3-6-9 encoding, and more

import Foundation

// MARK: - Reality Shift

struct RealityShift: Identifiable, Codable {
  let id: UUID
  var desire: String
  var scene: String  // The SATS scene
  var feelingState: String  // "Isn't it wonderful?" anchor
  var createdAt: Date
  var completedNights: Int  // SATS sessions completed
  var targetNights: Int  // Aim for 7-21
  var synchronicities: [Synchronicity]
  var status: ShiftStatus
  var notes: String

  enum ShiftStatus: String, Codable, CaseIterable {
    case planting = "Planting"
    case embodying = "Embodying"
    case manifesting = "Manifesting"
    case realized = "Realized"
    case revised = "Revised"
  }

  var progress: Double {
    Double(completedNights) / Double(max(targetNights, 1))
  }

  static func create(desire: String, scene: String, feeling: String) -> RealityShift {
    RealityShift(
      id: UUID(),
      desire: desire,
      scene: scene,
      feelingState: feeling,
      createdAt: Date(),
      completedNights: 0,
      targetNights: 14,
      synchronicities: [],
      status: .planting,
      notes: ""
    )
  }
}

// MARK: - Synchronicity Tracker

struct Synchronicity: Identifiable, Codable {
  let id: UUID
  var description: String
  var category: SyncCategory
  var timestamp: Date
  var relatedShiftId: UUID?

  enum SyncCategory: String, Codable, CaseIterable {
    case numberPattern = "Number Pattern"
    case unexpectedContact = "Unexpected Contact"
    case dreamMessage = "Dream Message"
    case physicalSign = "Physical Sign"
    case innerKnowing = "Inner Knowing"
    case bridgeOfIncidents = "Bridge of Incidents"
    case other = "Other"

    var icon: String {
      switch self {
      case .numberPattern: return "number.circle.fill"
      case .unexpectedContact: return "person.wave.2.fill"
      case .dreamMessage: return "moon.stars.fill"
      case .physicalSign: return "eye.fill"
      case .innerKnowing: return "brain.head.profile"
      case .bridgeOfIncidents: return "point.3.connected.trianglepath.dotted"
      case .other: return "sparkles"
      }
    }
  }
}

// MARK: - 3-6-9 Encoding Session

struct ThreeSixNineSession: Identifiable, Codable {
  let id: UUID
  var intention: String
  var phase: EncodingPhase
  var repetitionsCompleted: Int
  var timestamp: Date
  var notes: String

  enum EncodingPhase: String, Codable, CaseIterable {
    case planting = "3 - Planting"  // Write 3x
    case embodying = "6 - Embodying"  // Write 6x with feeling
    case completing = "9 - Completing"  // Write 9x with visualization

    var targetCount: Int {
      switch self {
      case .planting: return 3
      case .embodying: return 6
      case .completing: return 9
      }
    }

    var instruction: String {
      switch self {
      case .planting: return "Write your intention 3 times. Plant the seed."
      case .embodying: return "Write 6 times, FEELING it as already true."
      case .completing: return "Write 9 times while visualizing the end-state reality."
      }
    }
  }

  var isComplete: Bool {
    phase == .completing && repetitionsCompleted >= 9
  }
}

// MARK: - SATS Session (State Akin to Sleep)

struct SATSSession: Identifiable, Codable {
  let id: UUID
  var relatedShiftId: UUID?
  var scene: String
  var duration: TimeInterval
  var loopCount: Int  // Aim for 3-5 loops
  var quality: SessionQuality
  var fellAsleepInState: Bool
  var timestamp: Date
  var notes: String

  enum SessionQuality: String, Codable, CaseIterable {
    case deepImmersion = "Deep Immersion"
    case partialFeeling = "Partial Feeling"
    case intellectualOnly = "Intellectual Only"
    case distracted = "Distracted"

    var score: Int {
      switch self {
      case .deepImmersion: return 4
      case .partialFeeling: return 3
      case .intellectualOnly: return 2
      case .distracted: return 1
      }
    }
  }
}

// MARK: - Revision Entry

struct RevisionEntry: Identifiable, Codable {
  let id: UUID
  var originalEvent: String
  var revisedVersion: String
  var emotionalShift: String  // How you felt after revising
  var timestamp: Date
  var category: RevisionCategory

  enum RevisionCategory: String, Codable, CaseIterable {
    case relationship = "Relationship"
    case selfImage = "Self-Image"
    case money = "Money"
    case health = "Health"
    case career = "Career"
    case spiritual = "Spiritual"
    case other = "Other"
  }
}

// MARK: - Mental Diet Entry

struct MentalDietEntry: Identifiable, Codable {
  let id: UUID
  var caughtThought: String  // The negative/contradictory thought
  var flippedTo: String  // The revised assumption
  var timestamp: Date
  var difficulty: Int  // 1-5 how hard it was to flip
}

// MARK: - Daily Monad Check-In

struct MonadCheckIn: Identifiable, Codable {
  let id: UUID
  var date: Date
  var vibrationLevel: Int  // 1-9
  var dominantState: String
  var realityFocus: String  // What end-state are you dwelling in?
  var challenges: String
  var wins: [String]
  var tomorrowIntention: String

  var digitalRoot: Int {
    // Calculate digital root of vibration for 3-6-9 alignment
    var sum = vibrationLevel
    while sum > 9 {
      sum = String(sum).compactMap { $0.wholeNumberValue }.reduce(0, +)
    }
    return sum
  }
}

// MARK: - Solar Sync Session

struct SolarSyncSession: Identifiable, Codable {
  let id: UUID
  var type: SolarType
  var duration: TimeInterval  // Seconds of gazing
  var wasGrounded: Bool  // Barefoot?
  var intuitionNote: String  // Post-gaze insight
  var timestamp: Date

  enum SolarType: String, Codable, CaseIterable {
    case sunrise = "Sunrise"
    case sunset = "Sunset"
    case midday = "Midday (eyes closed)"

    var safetyNote: String {
      switch self {
      case .sunrise: return "Safe within first hour after sunrise. Start with 10 seconds."
      case .sunset: return "Safe within last hour before sunset. Build gradually."
      case .midday: return "Close eyes. Feel warmth on pineal area."
      }
    }
  }
}

// MARK: - Bardo Practice

struct BardoPractice: Identifiable, Codable {
  let id: UUID
  var bardoType: BardoType
  var experienceNote: String
  var integrationInsight: String
  var timestamp: Date

  enum BardoType: String, Codable, CaseIterable {
    case clearLight = "Clear Light Recognition"
    case peacefulVisions = "Peaceful Visions"
    case wrathfulVisions = "Wrathful Visions (Shadow)"
    case miniDeath = "Mini-Death (Ego Dissolution)"

    var guidance: String {
      switch self {
      case .clearLight: return "Flash of pure awareness. THIS is your essence. Don't retreat."
      case .peacefulVisions:
        return "Blissful states arise. Don't grasp. Recognize as your own light."
      case .wrathfulVisions:
        return "Fear arises. Face it. These are shadow aspects seeking integration."
      case .miniDeath: return "Let the small self dissolve. You are not your thoughts."
      }
    }
  }
}

// MARK: - Vibration Shield

struct VibrationShield: Identifiable, Codable {
  let id: UUID
  var name: String
  var visualization: String
  var triggerCondition: String  // When to activate
  var affirmation: String
  var isActive: Bool

  static let presets: [VibrationShield] = [
    VibrationShield(
      id: UUID(),
      name: "Eye of Horus",
      visualization: "Golden Eye of Horus surrounding your aura, deflecting low vibrations",
      triggerCondition: "Before meetings, confrontations, or entering crowds",
      affirmation: "I am protected. Only light may enter my field.",
      isActive: false
    ),
    VibrationShield(
      id: UUID(),
      name: "Ankh Life Force",
      visualization: "Glowing Ankh at heart center, radiating infinite life force",
      triggerCondition: "When feeling drained or attacked",
      affirmation: "I am eternal. My life force is inexhaustible.",
      isActive: false
    ),
    VibrationShield(
      id: UUID(),
      name: "Solar Armor",
      visualization: "Sun's rays forming golden armor around your body",
      triggerCondition: "During solar hours (6am-6pm)",
      affirmation: "I carry the sun within. Nothing external diminishes my light.",
      isActive: false
    ),
    VibrationShield(
      id: UUID(),
      name: "Monad Sphere",
      visualization: "Perfect sphere of white-gold light. The divine spark as your boundary.",
      triggerCondition: "Always on - default state",
      affirmation: "I AM the Monad. Reality conforms to my assumption.",
      isActive: true
    ),
  ]
}

// MARK: - Monad Affirmations

struct MonadAffirmation: Identifiable {
  let id = UUID()
  let text: String
  let category: AffirmationCategory

  enum AffirmationCategory: String, CaseIterable {
    case identity = "I AM"
    case reality = "Reality"
    case power = "Power"
    case protection = "Protection"
    case manifestation = "Manifestation"
  }

  static let library: [MonadAffirmation] = [
    // I AM
    MonadAffirmation(text: "I am the Monad. The divine spark incarnate.", category: .identity),
    MonadAffirmation(
      text: "I am the operant power. Nothing acts upon me without my consent.", category: .identity),
    MonadAffirmation(text: "I am the dreamer and the dream.", category: .identity),
    MonadAffirmation(text: "I am the I AM that I AM.", category: .identity),

    // Reality
    MonadAffirmation(
      text: "Assumption hardens into fact. I assume my desired reality now.", category: .reality),
    MonadAffirmation(
      text: "Everyone is me pushed out. As I change, they change.", category: .reality),
    MonadAffirmation(
      text: "The bridge of incidents is already forming. I don't need to know how.",
      category: .reality),
    MonadAffirmation(text: "I live in the end. It is done.", category: .reality),

    // Power
    MonadAffirmation(
      text: "My imagination is God in action. What I imagine, I become.", category: .power),
    MonadAffirmation(
      text: "3-6-9: I plant, I embody, I complete. The universe responds.", category: .power),
    MonadAffirmation(
      text: "Feeling is the secret. I feel it real, therefore it is.", category: .power),
    MonadAffirmation(text: "I think from the wish fulfilled, not of it.", category: .power),

    // Protection
    MonadAffirmation(
      text: "My vibration is sovereign. No external force can lower it.", category: .protection),
    MonadAffirmation(
      text: "I am shielded by my own light. Low energies dissolve before me.", category: .protection
    ),
    MonadAffirmation(
      text: "I protect my energy as I protect my spark. It is sacred.", category: .protection),

    // Manifestation
    MonadAffirmation(
      text: "It is done. I give thanks for the swift manifestation.", category: .manifestation),
    MonadAffirmation(
      text: "Isn't it wonderful? My desire is already fulfilled.", category: .manifestation),
    MonadAffirmation(
      text: "I fell asleep in the state of the wish fulfilled. It is law.", category: .manifestation
    ),
    MonadAffirmation(
      text: "9 is completion. My intention reaches 9 and manifests.", category: .manifestation),
  ]
}
