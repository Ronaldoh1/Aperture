// DBZDivineHierarchyEntity.swift
// Dragon Ball Z/Super Divine Hierarchy
// From Omni-King (Source/Monad) to Planetary Gods (Local Manifestations)
// Mapping DBZ cosmology to consciousness concepts

import Foundation
import SwiftUI

// MARK: - DBZ Divine Hierarchy

enum DBZDivineHierarchy {
  static let title = "Universe 7 Divine Hierarchy"
  static let subtitle = "From Source to Manifestation"

  // MARK: - Hierarchy Levels

  struct DivineBeing: Identifiable {
    let id = UUID()
    let name: String
    let title: String
    let level: HierarchyLevel
    let description: String
    let consciousnessParallel: String
    let symbol: String
    let color: String
    let attendants: [String]?
    let subordinates: [String]?
  }

  enum HierarchyLevel: Int, CaseIterable {
    case source = 0  // Omni-King
    case attendant = 1  // Grand Priest
    case destruction = 2  // Gods of Destruction + Angels
    case creation = 3  // Kaiōshin (Supreme Kai)
    case oversight = 4  // Dai Kaiō (Grand Kai)
    case cardinal = 5  // Four Kaiō (North, South, East, West)
    case judgment = 6  // King Enma (Yama)
    case planetary = 7  // Kami, Earth's God

    var name: String {
      switch self {
      case .source: return "Source"
      case .attendant: return "Prime Attendant"
      case .destruction: return "Destruction/Balance"
      case .creation: return "Creation/Life"
      case .oversight: return "Oversight"
      case .cardinal: return "Cardinal Direction"
      case .judgment: return "Judgment"
      case .planetary: return "Planetary"
      }
    }
  }

  // MARK: - The Full Hierarchy

  static let hierarchy: [DivineBeing] = [
    // LEVEL 0: SOURCE
    DivineBeing(
      name: "Zeno (Omni-King)",
      title: "King of Everything",
      level: .source,
      description: """
        Zeno is the supreme ruler of all 12 universes. Despite his childlike appearance, he holds absolute power - capable of erasing entire universes with a thought.

        He exists beyond morality (erased 6 universes on a whim). He doesn't fight - he simply IS. Even the Gods of Destruction fear him.

        Importantly: There are TWO Zenos after the Future Trunks arc - representing how Source can observe itself (consciousness aware of consciousness).
        """,
      consciousnessParallel: """
        **THE MONAD / SOURCE / BRAHMAN**

        Zeno represents the ultimate Source - consciousness itself before differentiation.

        • Childlike = Pure, unconditioned awareness
        • Absolute power = Source creates and destroys all
        • Beyond morality = Source is prior to good/evil duality
        • Two Zenos = Awareness aware of itself (the witness witnessing)

        In Gnostic terms: The TRUE God beyond the Demiurge
        In Hindu terms: Brahman - the absolute reality
        In physics terms: The quantum field from which all arises
        """,
      symbol: "👑",
      color: "#FFD700",
      attendants: ["Grand Priest"],
      subordinates: nil
    ),

    // LEVEL 1: PRIME ATTENDANT
    DivineBeing(
      name: "Grand Priest",
      title: "Father of Angels",
      level: .attendant,
      description: """
        The Grand Priest serves Zeno directly and is the father of all Angels. He's considered one of the five strongest beings in the multiverse.

        He announces tournaments, enforces rules, and acts as intermediary between Zeno and all lower beings.

        He remains neutral, emotionless, and perfectly aligned with Zeno's will.
        """,
      consciousnessParallel: """
        **LOGOS / COSMIC INTELLIGENCE**

        The Grand Priest is the first emanation from Source - cosmic order made manifest.

        • "Father of Angels" = First differentiation, source of guides
        • Neutral/emotionless = Pure cosmic law, no personal agenda
        • Announces rules = Establishes how reality operates
        • Intermediary = Bridge between absolute and relative

        In Gnostic terms: The Logos (divine reason)
        In Hindu terms: Ishvara (personal God)
        In Kabbalah: Keter (Crown) - first emanation
        """,
      symbol: "⚡",
      color: "#E0E0E0",
      attendants: nil,
      subordinates: ["Angels", "Gods of Destruction"]
    ),

    // LEVEL 2: DESTRUCTION/BALANCE
    DivineBeing(
      name: "Beerus",
      title: "God of Destruction (Universe 7)",
      level: .destruction,
      description: """
        Beerus is the God of Destruction for Universe 7. His role is to destroy - planets, civilizations, threats - to maintain cosmic balance.

        He's linked to the Supreme Kai: If one dies, the other dies too. Destruction and Creation are bound.

        Despite immense power, Beerus is capricious, petty, and ruled by appetite. He nearly destroyed Earth over pudding.
        """,
      consciousnessParallel: """
        **SHIVA / DESTROYER ASPECT**

        Beerus represents the destructive aspect of divinity - necessary for renewal.

        • Destroys to balance = Death enables new life
        • Linked to Supreme Kai = Destruction-Creation duality
        • Capricious = Destruction seems random from limited view
        • Ruled by appetite = Lower aspects still present in gods

        In Hindu terms: Shiva (destroyer in Trimurti)
        In nature: Forest fires clear for new growth
        In psychology: Ego death precedes transformation
        """,
      symbol: "💀",
      color: "#9C27B0",
      attendants: ["Whis (Angel)"],
      subordinates: nil
    ),

    DivineBeing(
      name: "Whis",
      title: "Angel Attendant",
      level: .destruction,
      description: """
        Whis is Beerus's Angel attendant and martial arts teacher. Angels are actually MORE powerful than Gods of Destruction but serve them.

        Whis can rewind time by 3 minutes, moves faster than any mortal, and has mastered Ultra Instinct.

        Angels remain neutral - they don't intervene in mortal affairs and exist only to guide their God of Destruction.
        """,
      consciousnessParallel: """
        **GUARDIAN ANGEL / HIGHER SELF**

        Whis represents the guide who is actually more advanced than those they serve.

        • More powerful but serves = Higher self guides, doesn't control
        • Can rewind time = Access to akashic records, beyond linear time
        • Teaches Ultra Instinct = Points toward pure consciousness
        • Neutral = Doesn't impose, only guides when asked

        In spiritual terms: Your higher self/guardian
        In Jungian terms: The Self (transcendent function)
        In practice: The inner teacher that emerges in meditation
        """,
      symbol: "😇",
      color: "#00BCD4",
      attendants: nil,
      subordinates: nil
    ),

    // LEVEL 3: CREATION
    DivineBeing(
      name: "Shin (Supreme Kai)",
      title: "Dai Kaiōshin of Universe 7",
      level: .creation,
      description: """
        The Supreme Kai (Kaiōshin) oversees creation and life in Universe 7. Originally there were multiple Supreme Kais, but Majin Buu absorbed most of them.

        Shin is young, inexperienced, and often uncertain - in contrast to the ancient, confident Gods of Destruction.

        The Kaiōshin create, the Gods of Destruction destroy - maintaining balance.
        """,
      consciousnessParallel: """
        **BRAHMA / CREATOR ASPECT**

        The Supreme Kai represents the creative, life-giving aspect of divinity.

        • Oversees creation = Generates and nurtures life
        • Linked to Beerus = Creation and destruction are inseparable
        • Young/uncertain = Creating is vulnerable, risky
        • Absorbed by Buu = Evil can consume creative power

        In Hindu terms: Brahma (creator in Trimurti)
        In Gnostic terms: Sophia (wisdom that creates)
        In biology: The generative principle
        """,
      symbol: "🌱",
      color: "#4CAF50",
      attendants: ["Kibito"],
      subordinates: ["Elder Kaiōshin"]
    ),

    // LEVEL 4: OVERSIGHT
    DivineBeing(
      name: "Dai Kaiō (Grand Kai)",
      title: "Overseer of Kaiō",
      level: .oversight,
      description: """
        The Grand Kai oversees the four directional Kaiō (North, South, East, West). He lives on the Grand Kai's Planet at the end of Snake Way.

        He's portrayed as a hip, music-loving old man - less formal than other divine beings.

        He trains the greatest fighters in the afterlife.
        """,
      consciousnessParallel: """
        **COSMIC ADMINISTRATOR**

        The Grand Kai represents the organizing intelligence that coordinates different aspects.

        • Oversees four directions = Coordinates different domains
        • Informal, hip = Higher consciousness isn't always serious
        • Trains fighters = Develops souls through challenge

        In Jungian terms: The Self coordinating the four functions
        In organization: Middle management of the cosmos
        """,
      symbol: "🎵",
      color: "#FF9800",
      attendants: nil,
      subordinates: ["North Kai", "South Kai", "East Kai", "West Kai"]
    ),

    // LEVEL 5: CARDINAL
    DivineBeing(
      name: "King Kai (North Kai)",
      title: "Kaiō of the North",
      level: .cardinal,
      description: """
        King Kai oversees the North Galaxy. He trained Goku in Kaio-ken and Spirit Bomb - techniques that shaped Goku's path.

        He lives on a tiny planet at the end of Snake Way with his monkey Bubbles and cricket Gregory.

        Despite being a god, he's comedic, loves bad jokes, and drives a car on his tiny planet.
        """,
      consciousnessParallel: """
        **SPIRITUAL TEACHER / GURU**

        King Kai represents the teacher who appears when the student is ready.

        • Teaches transformative techniques = Passes on wisdom
        • Comedic despite power = Wisdom doesn't require solemnity
        • Tiny planet = Teachers work in small, focused spaces
        • Goku must EARN the teaching = No free passes

        In spiritual tradition: The guru figure
        In awakening: The teacher who catalyzes transformation
        """,
      symbol: "👴",
      color: "#2196F3",
      attendants: ["Bubbles", "Gregory"],
      subordinates: nil
    ),

    // LEVEL 6: JUDGMENT
    DivineBeing(
      name: "King Enma (Yama)",
      title: "Judge of the Dead",
      level: .judgment,
      description: """
        King Enma judges all souls that die, determining whether they go to Heaven, Hell, or are reincarnated.

        He's enormous, sitting at a massive desk processing souls. He claims to have defeated Raditz (though this is dubious).

        His office is between the living world and the afterlife - a checkpoint for consciousness.
        """,
      consciousnessParallel: """
        **KARMIC JUDGE / LIFE REVIEW**

        King Enma represents the moment of death when life is reviewed.

        • Judges souls = Actions have consequences
        • Heaven/Hell/Reincarnation = Different outcomes based on karma
        • Checkpoint = Transition point in consciousness

        In Buddhist/Hindu tradition: Yama, judge of the dead
        In near-death experiences: The life review
        In psychology: The superego judging the ego
        """,
      symbol: "⚖️",
      color: "#F44336",
      attendants: nil,
      subordinates: nil
    ),

    // LEVEL 7: PLANETARY
    DivineBeing(
      name: "Kami / Dende",
      title: "God of Earth",
      level: .planetary,
      description: """
        Kami (and later Dende) serves as Earth's God - creating Dragon Balls, overseeing the planet, and serving as its guardian.

        Kami was originally one being with Piccolo (King Piccolo). He split off his evil to become God - but this made both weaker.

        When Kami merged back with Piccolo, Dende (a young Namekian) became Earth's new God.
        """,
      consciousnessParallel: """
        **LOCAL DIVINE MANIFESTATION**

        Earth's God represents divinity localized - Source expressed through a specific place.

        • Creates Dragon Balls = Provides mechanism for miracles
        • Split from Piccolo = Divinity requires shadow integration
        • Lookout tower = Higher perspective on local reality
        • Replaceable = Individual gods come and go

        In spiritual terms: Local deities, land spirits
        In psychology: The god-image in the psyche
        In practice: Your personal relationship with the divine
        """,
      symbol: "🌍",
      color: "#8BC34A",
      attendants: ["Mr. Popo"],
      subordinates: nil
    ),
  ]

  // MARK: - The Teaching

  static let hierarchyTeaching = """
    **WHAT THE DBZ HIERARCHY TEACHES:**

    1. **LAYERS OF CONSCIOUSNESS**
       Reality has multiple levels. What seems like "God" from one level is just a mid-level bureaucrat from a higher view.
       
       Kami seems all-powerful to humans.
       King Kai is far above Kami.
       Supreme Kai is above King Kai.
       Beerus can erase Supreme Kai.
       Zeno can erase Beerus.
       
       There's always another level up.

    2. **DESTRUCTION AND CREATION ARE LINKED**
       Beerus and Supreme Kai die together. You can't have creation without destruction. This is cosmic law, not accident.
       
       In your life: You can't build the new without releasing the old.

    3. **POWER ISN'T WISDOM**
       Beerus is incredibly powerful but petty and capricious. Zeno is omnipotent but childlike. Power alone doesn't equal spiritual development.
       
       In your life: Don't confuse capability with consciousness.

    4. **GUIDES ARE MORE POWERFUL THAN THEY APPEAR**
       Angels are stronger than Gods of Destruction but SERVE them. The teacher serves the student, even when more advanced.
       
       In your life: True teachers empower, not dominate.

    5. **MORTALS CAN SURPASS GODS**
       Goku achieves Ultra Instinct - a state "even gods struggle with." The hierarchy isn't fixed. Evolution is possible.
       
       In your life: Your current level isn't your ceiling.

    6. **THE SHADOW MUST BE INTEGRATED**
       Kami split from Piccolo (his shadow) and both became weak. Only when they merged did full power return.
       
       In your life: Rejecting your shadow diminishes you.

    7. **SOURCE IS BEYOND MORALITY**
       Zeno erases universes without malice or virtue - just because. Source isn't "good" in human terms. It simply IS.
       
       In your life: Don't anthropomorphize the absolute.
    """

  // MARK: - Universe Structure

  static let universeStructure = """
    **UNIVERSE 7 STRUCTURE:**

    ┌─────────────────────────────────────────┐
    │            OMNI-KING (Zeno)             │
    │              Source/Monad               │
    └──────────────────┬──────────────────────┘
                       │
    ┌──────────────────▼──────────────────────┐
    │           GRAND PRIEST                   │
    │         Logos/Cosmic Order               │
    └──────────────────┬──────────────────────┘
                       │
    ┌──────────────────▼──────────────────────┐
    │    BEERUS ◄──────────────► WHIS         │
    │  (Destruction)    │     (Angel/Guide)    │
    └──────────────────┬──────────────────────┘
                       │
    ┌──────────────────▼──────────────────────┐
    │         SUPREME KAI (Shin)               │
    │        Creation/Life Force               │
    └──────────────────┬──────────────────────┘
                       │
    ┌──────────────────▼──────────────────────┐
    │           GRAND KAI (Dai Kaiō)           │
    │          Cosmic Administrator            │
    └──────────────────┬──────────────────────┘
                       │
    ┌──────────────────▼──────────────────────┐
    │   NORTH │ SOUTH │ EAST │ WEST  KAI      │
    │        Cardinal Guardians                │
    └──────────────────┬──────────────────────┘
                       │
    ┌──────────────────▼──────────────────────┐
    │          KING ENMA (Yama)                │
    │         Judge of the Dead                │
    └──────────────────┬──────────────────────┘
                       │
    ┌──────────────────▼──────────────────────┐
    │           KAMI / DENDE                   │
    │        Earth's God (Local)               │
    │              + Mr. Popo                  │
    └─────────────────────────────────────────┘
    """
}

// MARK: - DBZ Cosmos View Data

enum DBZCosmosData {
  static let cosmicLevels: [CosmicLevel] = [
    CosmicLevel(
      name: "The Absolute",
      beings: ["Zeno (Omni-King)"],
      description: "Source consciousness - beyond all universes",
      color: "#FFD700"
    ),
    CosmicLevel(
      name: "Prime Emanation",
      beings: ["Grand Priest"],
      description: "First differentiation - cosmic intelligence",
      color: "#E0E0E0"
    ),
    CosmicLevel(
      name: "Universal Balance",
      beings: ["Beerus (Destruction)", "Whis (Angel)", "Supreme Kai (Creation)"],
      description: "Forces that maintain cosmic equilibrium",
      color: "#9C27B0"
    ),
    CosmicLevel(
      name: "Galactic Oversight",
      beings: ["Grand Kai", "North/South/East/West Kai"],
      description: "Administration of galactic sectors",
      color: "#FF9800"
    ),
    CosmicLevel(
      name: "Transition",
      beings: ["King Enma"],
      description: "Gateway between life and afterlife",
      color: "#F44336"
    ),
    CosmicLevel(
      name: "Planetary",
      beings: ["Kami/Dende", "Mr. Popo"],
      description: "Local divine manifestation on Earth",
      color: "#4CAF50"
    ),
  ]

  struct CosmicLevel: Identifiable {
    let id = UUID()
    let name: String
    let beings: [String]
    let description: String
    let color: String
  }
}
