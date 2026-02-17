// UnlearnModuleView.swift
// UNLEARN — Deprogramming Inherited Bias Through Consciousness
// ☀️ SunFlow: Reignited
//
// "We are one consciousness experiencing the 3D through different expressions."
// This module meets people where they are — no shaming, no lectures.
// Just truth, empathy, and the courage to question what you were taught.

import SwiftUI

// MARK: - ═══════════════════════════════════════════════════

// DATA MODELS
// ═══════════════════════════════════════════════════════════

enum UnlearnSection: String, CaseIterable, Identifiable {
  case biasCheck = "Bias Check"
  case empathyEngine = "Empathy Engine"
  case mythsVsReality = "Myths vs Reality"
  case oneness = "We Are One"
  case awakeningPaths = "Awakening Paths"
  case deprogramJournal = "Deprogram Journal"
  case progress = "My Progress"
  case historyTruths = "Hidden History"

  var id: String {
    rawValue
  }

  var icon: String {
    switch self {
    case .biasCheck: return "brain.head.profile"
    case .empathyEngine: return "person.2.fill"
    case .mythsVsReality: return "book.closed.fill"
    case .oneness: return "sun.max.fill"
    case .awakeningPaths: return "arrow.triangle.branch"
    case .deprogramJournal: return "pencil.and.outline"
    case .progress: return "chart.line.uptrend.xyaxis"
    case .historyTruths: return "clock.arrow.circlepath"
    }
  }

  var color: Color {
    switch self {
    case .biasCheck: return Color(red: 0.4, green: 0.7, blue: 1.0)
    case .empathyEngine: return Color(red: 0.3, green: 0.8, blue: 0.5)
    case .mythsVsReality: return .orange
    case .oneness: return Color(red: 1.0, green: 0.85, blue: 0.3)
    case .awakeningPaths: return .purple
    case .deprogramJournal: return Color(red: 0.5, green: 0.8, blue: 0.8)
    case .progress: return .cyan
    case .historyTruths: return Color(red: 0.8, green: 0.5, blue: 0.3)
    }
  }

  var subtitle: String {
    switch self {
    case .biasCheck: return "Private self-assessment"
    case .empathyEngine: return "Walk in different shoes"
    case .mythsVsReality: return "What they taught vs what's real"
    case .oneness: return "Source experiencing itself"
    case .awakeningPaths: return "Different names, same truth"
    case .deprogramJournal: return "Write your way free"
    case .progress: return "Your growth over time"
    case .historyTruths: return "10 things school got wrong"
    }
  }
}

// MARK: - Bias Assessment

struct BiasQuestion: Identifiable {
  let id = UUID()
  let text: String
  let category: BiasCategory
  let options: [BiasOption]
}

struct BiasOption: Identifiable {
  let id = UUID()
  let text: String
  let score: Int  // 0 = no bias, 1 = mild, 2 = moderate, 3 = strong
}

enum BiasCategory: String, CaseIterable {
  case racial = "Racial Awareness"
  case cultural = "Cultural Openness"
  case systemic = "Systemic Understanding"
  case empathy = "Empathy Capacity"
  case selfAwareness = "Self-Awareness"

  var icon: String {
    switch self {
    case .racial: return "person.3.fill"
    case .cultural: return "globe.americas.fill"
    case .systemic: return "building.columns.fill"
    case .empathy: return "heart.fill"
    case .selfAwareness: return "eye.fill"
    }
  }

  var color: Color {
    switch self {
    case .racial: return .blue
    case .cultural: return .green
    case .systemic: return .orange
    case .empathy: return .pink
    case .selfAwareness: return .purple
    }
  }
}

// MARK: - Empathy Engine Scenario

struct EmpathyScenario: Identifiable {
  let id = UUID()
  let title: String
  let avatar: String
  let avatarDescription: String
  let scene: String
  let situation: String
  let choices: [EmpathyChoice]
  let realWorldStat: String
  let reflectionPrompt: String
}

struct EmpathyChoice: Identifiable {
  let id = UUID()
  let text: String
  let outcome: String
  let stressImpact: Int  // -3 to +3
  let dignityImpact: Int
  let followUp: String
}

// MARK: - Myth vs Reality

struct MythReality: Identifiable {
  let id = UUID()
  let myth: String
  let reality: String
  let source: String
  let category: String
  let icon: String
}

// MARK: - Journal Entry

struct DeprogramJournalEntry: Identifiable, Codable {
  let id: String
  let prompt: String
  var response: String
  let date: Date
  let category: String

  init(
    id: String = UUID().uuidString, prompt: String, response: String = "", date: Date = Date(),
    category: String = "reflection"
  ) {
    self.id = id
    self.prompt = prompt
    self.response = response
    self.date = date
    self.category = category
  }
}

// MARK: - ═══════════════════════════════════════════════════

// UNLEARN DATA MANAGER
// ═══════════════════════════════════════════════════════════

@MainActor
class UnlearnManager: ObservableObject {
  static let shared = UnlearnManager()

  @Published var biasScores: [String: Int] = [:]  // category: score
  @Published var assessmentsTaken: Int = 0
  @Published var journalEntries: [DeprogramJournalEntry] = []
  @Published var scenariosCompleted: Int = 0
  @Published var streakDays: Int = 0
  @Published var lastActiveDate: Date? = nil
  @Published var biasHistory: [[String: Int]] = []  // Historical snapshots

  private let storageKey = "unlearn.manager.data"
  private let journalKey = "unlearn.journal.entries"
  private let historyKey = "unlearn.bias.history"

  init() {
    load()
  }

  func saveBiasScore(category: String, score: Int) {
    biasScores[category] = score
    assessmentsTaken += 1
    updateStreak()
    persist()
  }

  func snapshotBiasScores() {
    if !biasScores.isEmpty {
      biasHistory.append(biasScores)
      if biasHistory.count > 52 { biasHistory = Array(biasHistory.suffix(52)) }
      persistHistory()
    }
  }

  func addJournalEntry(_ entry: DeprogramJournalEntry) {
    journalEntries.insert(entry, at: 0)
    updateStreak()
    persistJournal()
  }

  func updateJournalEntry(_ entry: DeprogramJournalEntry) {
    if let idx = journalEntries.firstIndex(where: { $0.id == entry.id }) {
      journalEntries[idx] = entry
      persistJournal()
    }
  }

  func completeScenario() {
    scenariosCompleted += 1
    updateStreak()
    persist()
  }

  var overallProgress: Double {
    let biasScore =
      biasScores.isEmpty
      ? 0.0 : Double(biasScores.values.reduce(0, +)) / Double(biasScores.count * 3)
    let journalScore = min(Double(journalEntries.count) / 20.0, 1.0)
    let scenarioScore = min(Double(scenariosCompleted) / 10.0, 1.0)
    return (1.0 - biasScore + journalScore + scenarioScore) / 3.0
  }

  private func updateStreak() {
    let today = Calendar.current.startOfDay(for: Date())
    if let last = lastActiveDate {
      let lastDay = Calendar.current.startOfDay(for: last)
      let diff = Calendar.current.dateComponents([.day], from: lastDay, to: today).day ?? 0
      if diff == 1 { streakDays += 1 } else if diff > 1 { streakDays = 1 }
    } else {
      streakDays = 1
    }
    lastActiveDate = Date()
  }

  private func load() {
    if let data = UserDefaults.standard.data(forKey: storageKey),
      let decoded = try? JSONDecoder().decode(UnlearnStorageModel.self, from: data)
    {
      biasScores = decoded.biasScores
      assessmentsTaken = decoded.assessmentsTaken
      scenariosCompleted = decoded.scenariosCompleted
      streakDays = decoded.streakDays
      lastActiveDate = decoded.lastActiveDate
    }
    if let data = UserDefaults.standard.data(forKey: journalKey),
      let decoded = try? JSONDecoder().decode([DeprogramJournalEntry].self, from: data)
    {
      journalEntries = decoded
    }
    if let data = UserDefaults.standard.data(forKey: historyKey),
      let decoded = try? JSONDecoder().decode([[String: Int]].self, from: data)
    {
      biasHistory = decoded
    }
  }

  private func persist() {
    let model = UnlearnStorageModel(
      biasScores: biasScores, assessmentsTaken: assessmentsTaken,
      scenariosCompleted: scenariosCompleted, streakDays: streakDays,
      lastActiveDate: lastActiveDate)
    if let data = try? JSONEncoder().encode(model) {
      UserDefaults.standard.set(data, forKey: storageKey)
    }
  }

  private func persistJournal() {
    if let data = try? JSONEncoder().encode(journalEntries) {
      UserDefaults.standard.set(data, forKey: journalKey)
    }
  }

  private func persistHistory() {
    if let data = try? JSONEncoder().encode(biasHistory) {
      UserDefaults.standard.set(data, forKey: historyKey)
    }
  }
}

private struct UnlearnStorageModel: Codable {
  let biasScores: [String: Int]
  let assessmentsTaken: Int
  let scenariosCompleted: Int
  let streakDays: Int
  let lastActiveDate: Date?
}

// MARK: - ═══════════════════════════════════════════════════

// CONTENT DATABASES
// ═══════════════════════════════════════════════════════════

enum UnlearnContentDatabase {
  // MARK: - Bias Questions

  static let biasQuestions: [BiasQuestion] = [
    BiasQuestion(
      text:
        "When you see a group of young Black men walking toward you at night, your first instinct is:",
      category: .racial,
      options: [
        BiasOption(text: "Neutral — same as anyone else walking", score: 0),
        BiasOption(text: "Slightly more alert than usual", score: 1),
        BiasOption(text: "Noticeably tense, cross the street maybe", score: 2),
        BiasOption(text: "Fear or strong discomfort", score: 3),
      ]),
    BiasQuestion(
      text: "If a Muslim woman in hijab sat next to you on a plane, you'd feel:", category: .racial,
      options: [
        BiasOption(text: "Nothing different — just another person", score: 0),
        BiasOption(text: "Curious but comfortable", score: 0),
        BiasOption(text: "A flash of discomfort you know is unfair", score: 1),
        BiasOption(text: "Genuinely uneasy", score: 2),
      ]),
    BiasQuestion(
      text: "When someone says 'systemic racism,' your reaction is:", category: .systemic,
      options: [
        BiasOption(text: "It's documented, measurable, and still operating", score: 0),
        BiasOption(text: "It exists but gets exaggerated sometimes", score: 1),
        BiasOption(text: "Everyone has equal opportunity now, it's personal choices", score: 2),
        BiasOption(text: "It's a political tool, not a real thing", score: 3),
      ]),
    BiasQuestion(
      text:
        "Your reaction to learning that identical resumes with 'Black-sounding' names get 50% fewer callbacks:",
      category: .systemic,
      options: [
        BiasOption(text: "Not surprised — this is well-documented discrimination", score: 0),
        BiasOption(text: "Troubled but wonder if there are other factors", score: 1),
        BiasOption(text: "Skeptical of the study's methodology", score: 2),
        BiasOption(text: "People should just use 'normal' names", score: 3),
      ]),
    BiasQuestion(
      text:
        "How often do you consume media (movies, music, books) created by people of a different race than you?",
      category: .cultural,
      options: [
        BiasOption(text: "Regularly — it enriches my perspective", score: 0),
        BiasOption(text: "Sometimes, when it interests me", score: 1),
        BiasOption(text: "Rarely — I stick to what I know", score: 2),
        BiasOption(text: "Almost never — why would I?", score: 3),
      ]),
    BiasQuestion(
      text:
        "If your child wanted to marry someone of a different race, your honest reaction would be:",
      category: .racial,
      options: [
        BiasOption(text: "Full support — love is love", score: 0),
        BiasOption(text: "Supportive but privately concerned about challenges", score: 1),
        BiasOption(text: "Uncomfortable but wouldn't say anything", score: 2),
        BiasOption(text: "Against it, openly or privately", score: 3),
      ]),
    BiasQuestion(
      text:
        "When you hear about police violence against unarmed Black people, your first thought is:",
      category: .empathy,
      options: [
        BiasOption(text: "Grief and anger at a broken system", score: 0),
        BiasOption(text: "Sad, but wonder what happened before the video", score: 1),
        BiasOption(text: "They probably did something to provoke it", score: 2),
        BiasOption(text: "Police are just doing their job in dangerous situations", score: 3),
      ]),
    BiasQuestion(
      text:
        "How well can you name 5 contributions to science, art, or civilization from non-European cultures?",
      category: .cultural,
      options: [
        BiasOption(
          text: "Easily — algebra (Islamic), gunpowder (Chinese), surgery (Egyptian)...", score: 0),
        BiasOption(text: "A few, with some thinking", score: 1),
        BiasOption(text: "Struggle to name more than one", score: 2),
        BiasOption(text: "Most important innovations came from Europe", score: 3),
      ]),
    BiasQuestion(
      text:
        "Have you ever examined whether beliefs you hold about other groups came from your own experience or were inherited?",
      category: .selfAwareness,
      options: [
        BiasOption(text: "Yes — I've actively questioned my programming", score: 0),
        BiasOption(text: "Somewhat — I've thought about it", score: 1),
        BiasOption(text: "Not really — my beliefs are my own", score: 2),
        BiasOption(text: "I don't need to — I see reality clearly", score: 3),
      ]),
    BiasQuestion(
      text: "If someone called you 'racist,' your response would be:", category: .selfAwareness,
      options: [
        BiasOption(text: "Ask what I said/did and genuinely reflect", score: 0),
        BiasOption(text: "Defensive first, but willing to listen", score: 1),
        BiasOption(text: "Offended — I'm not racist, I treat everyone the same", score: 2),
        BiasOption(text: "Angry — that word is weaponized against white people", score: 3),
      ]),
  ]

  // MARK: - Empathy Scenarios

  static let scenarios: [EmpathyScenario] = [
    EmpathyScenario(
      title: "The Traffic Stop",
      avatar: "Marcus",
      avatarDescription: "28-year-old Black software engineer driving home from work",
      scene:
        "You're driving your new car through a suburban neighborhood. Blue lights flash behind you.",
      situation:
        "The officer approaches your window and immediately asks you to step out of the vehicle. His hand is on his holster. You haven't been told why you were stopped.",
      choices: [
        EmpathyChoice(
          text: "Comply slowly with hands visible, stay calm",
          outcome:
            "After 20 minutes of questioning, searching your car, and running your plates twice, you're let go with 'a warning.' For what? You still don't know. You're late for dinner. Your hands won't stop shaking.",
          stressImpact: -2, dignityImpact: -2,
          followUp:
            "Marcus experiences this 3-4 times per year. His white coworker has been pulled over once in 5 years."
        ),
        EmpathyChoice(
          text: "Politely ask why you're being stopped",
          outcome:
            "The officer's tone hardens. 'I'm asking the questions.' Backup is called. You spend 40 minutes on the curb while they search your car without consent. Nothing found. No apology.",
          stressImpact: -3, dignityImpact: -3,
          followUp:
            "Asking 'why' while Black can escalate a routine stop into a life-threatening situation. This fear is taught, not imagined."
        ),
        EmpathyChoice(
          text: "Record the interaction on your phone",
          outcome:
            "The officer orders you to put the phone down. When you say it's your right, things escalate fast. More units arrive. You end up handcuffed 'for officer safety.' Released an hour later with no charges.",
          stressImpact: -3, dignityImpact: -1,
          followUp:
            "Recording is legal, but asserting your rights while Black is statistically more dangerous than compliance."
        ),
      ],
      realWorldStat:
        "Black drivers are 20% more likely to be stopped than white drivers. Once stopped, they're twice as likely to be searched, despite being less likely to be found with contraband.",
      reflectionPrompt:
        "Imagine this happening to you 3-4 times a year since you turned 16. How would that shape your relationship with 'safety' and 'authority'?"
    ),
    EmpathyScenario(
      title: "The Job Interview",
      avatar: "Priya",
      avatarDescription: "32-year-old Indian-American data scientist, Stanford PhD",
      scene:
        "You walk into the interview. The panel of four interviewers are all white men. One of them mispronounces your name badly, then says 'I'll just call you P.'",
      situation:
        "During the technical portion, you answer everything correctly. The interviewer says 'Wow, your English is really good.' You were born in Ohio.",
      choices: [
        EmpathyChoice(
          text: "Smile and say 'Thanks, I was born here'",
          outcome:
            "Awkward silence. The interview continues but the energy shifts. You don't get a callback. The position goes to someone with less experience.",
          stressImpact: -1, dignityImpact: -2,
          followUp:
            "Priya has heard 'your English is great' over 200 times. She's a third-generation American."
        ),
        EmpathyChoice(
          text: "Let it go and keep performing",
          outcome:
            "You finish strong. HR sends a rejection two weeks later: 'not a culture fit.' Your qualifications exceeded every requirement.",
          stressImpact: -2, dignityImpact: -2,
          followUp:
            "'Culture fit' is the most common legal way to reject qualified candidates of color. It's unmeasurable and unchallengeable."
        ),
        EmpathyChoice(
          text: "Correct your name pronunciation firmly",
          outcome:
            "The lead interviewer seems put off. Another panelist becomes your ally and uses your name correctly. You get the job, but your first year is spent proving you 'belong' there.",
          stressImpact: -1, dignityImpact: 1,
          followUp:
            "Even when you 'win,' the tax of constantly asserting your humanity in professional spaces is exhausting."
        ),
      ],
      realWorldStat:
        "Applicants with Asian names need 50% more applications to get a callback. Studies show identical resumes with 'white-sounding' names receive significantly more interview requests.",
      reflectionPrompt:
        "What if every time you walked into a room, people assumed you were foreign? How would that shape your confidence over decades?"
    ),
    EmpathyScenario(
      title: "The Grocery Store",
      avatar: "DeShawn", avatarDescription: "17-year-old Black teen shopping with friends",
      scene:
        "You and two friends walk into a grocery store after school to buy snacks. A security guard starts following your group within 30 seconds.",
      situation:
        "As you browse, an employee 'straightens shelves' next to wherever you go. At checkout, the cashier asks to see inside your backpack. Your white classmate behind you isn't asked.",
      choices: [
        EmpathyChoice(
          text: "Open the backpack without comment",
          outcome:
            "Inside: textbooks, a calculator, earbuds. The cashier doesn't apologize. Your friends are humiliated. One says 'I'm never coming back here.' You've lost your appetite for the snacks.",
          stressImpact: -2, dignityImpact: -3,
          followUp:
            "DeShawn is 17. He's been followed in stores since he was 12. He learned early: your skin is a shoplifting suspect."
        ),
        EmpathyChoice(
          text: "Ask 'Are you asking everyone, or just us?'",
          outcome:
            "The cashier gets flustered, calls the manager. Manager says it's 'policy.' You point to the white student behind you who wasn't asked. Silence. You leave without buying anything.",
          stressImpact: -1, dignityImpact: 0,
          followUp:
            "Standing up for yourself at 17 feels brave but costs energy. By 30, the accumulated weight of these moments becomes chronic stress."
        ),
        EmpathyChoice(
          text: "Film the interaction and post it",
          outcome:
            "The video gets 200K views. The store issues a corporate apology. Your school congratulates your 'bravery.' But next week, a different store does the same thing. Nothing changed.",
          stressImpact: -2, dignityImpact: 1,
          followUp:
            "Going viral doesn't fix the system. It just proves the system exists — again — for people who weren't paying attention."
        ),
      ],
      realWorldStat:
        "Black and Latino shoppers are 2-3x more likely to be followed or monitored in retail stores. This 'shopping while Black' phenomenon is documented across all income levels.",
      reflectionPrompt:
        "When's the last time you were followed in a store? If the answer is 'never,' consider that your skin color bought you that freedom."
    ),
  ]

  // MARK: - Myths vs Reality

  static let myths: [MythReality] = [
    MythReality(
      myth: "Christopher Columbus discovered America",
      reality:
        "Vikings arrived around 1002 CE (Leif Erikson). Indigenous peoples had been living across the Americas for 15,000+ years. Columbus never set foot on mainland North America. He enslaved the Taíno people and launched a genocide.",
      source: "Primary sources: Columbus's own journals, Bartolomé de las Casas accounts",
      category: "History", icon: "globe.americas.fill"),
    MythReality(
      myth: "The Civil War was about 'states' rights'",
      reality:
        "It was about the right to own slaves. The Confederate states' own declarations of secession explicitly name slavery as the cause. Mississippi's declaration mentions 'slavery' 7 times in the opening paragraph. The 'states' rights' reframe was a post-war Lost Cause propaganda effort.",
      source: "Confederate Declarations of Secession (primary documents)", category: "History",
      icon: "flag.fill"),
    MythReality(
      myth: "Vikings wore horned helmets",
      reality:
        "No archaeological evidence of horned helmets exists. This myth comes from 19th-century Romantic artists and Wagner operas. Real Viking helmets were simple iron or leather.",
      source: "National Museum of Denmark, archaeological evidence", category: "Culture",
      icon: "shield.fill"),
    MythReality(
      myth: "George Washington chopped down a cherry tree",
      reality:
        "Completely fabricated by Mason Locke Weems in an 1806 biography to sell books. No historical evidence supports this. It's nationalist mythology designed to create a perfect founding father.",
      source: "Mount Vernon Historical Association", category: "Mythology", icon: "tree.fill"),
    MythReality(
      myth: "Ancient Egypt was a 'white' civilization",
      reality:
        "Ancient Egyptians were Northeast African people. DNA analysis of mummies shows sub-Saharan African ancestry. Greek historians like Herodotus described them as 'dark-skinned with woolly hair.' The whitewashing of Egypt is one of history's most persistent erasures.",
      source: "DNA studies (Nature Communications 2017), Herodotus Book II", category: "Erasure",
      icon: "pyramid.fill"),
    MythReality(
      myth: "Africa had no civilization before Europeans arrived",
      reality:
        "The Kingdom of Kush predates Rome. Great Zimbabwe was a massive stone city. Mali's Mansa Musa was the richest person in human history. Timbuktu had universities and libraries while Europe was in the Dark Ages. This myth justified colonialism.",
      source: "UNESCO World Heritage, African historiography", category: "Erasure",
      icon: "building.columns.fill"),
    MythReality(
      myth: "Paul Revere shouted 'The British are coming!'",
      reality:
        "He said 'the Regulars are coming' — everyone was British at the time. He wasn't the only rider; at least 40 others carried the warning. Samuel Prescott actually completed the ride. Revere was captured.",
      source: "Paul Revere's own account, Massachusetts Historical Society", category: "History",
      icon: "bell.fill"),
    MythReality(
      myth: "Edison invented the light bulb",
      reality:
        "Humphry Davy created the first electric light in 1802. Edison improved on designs by many inventors to make a commercially practical version in 1879. Edison was a genius marketer who took credit for others' work (see: Tesla, Nikola).",
      source: "Smithsonian Institution", category: "Science", icon: "lightbulb.fill"),
    MythReality(
      myth: "Thanksgiving was a friendly feast between Pilgrims and Native Americans",
      reality:
        "The 1621 event was a political alliance meal, not a celebration. Within a generation, colonists were waging genocidal wars against the same peoples. The 'Thanksgiving' myth erases centuries of Indigenous genocide, forced displacement, and cultural destruction.",
      source: "Wampanoag oral history, primary colonial accounts", category: "History",
      icon: "leaf.fill"),
    MythReality(
      myth: "The 'War on Drugs' was about public health",
      reality:
        "Nixon aide John Ehrlichman admitted in 1994: 'The Nixon campaign had two enemies: the antiwar left and Black people... We knew we couldn't make it illegal to be Black, but by getting the public to associate Blacks with heroin and hippies with marijuana, we could disrupt those communities.'",
      source: "John Ehrlichman interview, Harper's Magazine 2016", category: "System",
      icon: "pills.fill"),
  ]

  // MARK: - Oneness Teachings

  static let onenessTeachings: [(title: String, teaching: String, source: String, icon: String)] = [
    (
      "Source Experiencing Itself",
      """
      You are not a human being having a spiritual experience. You are consciousness — Source energy — \
      temporarily focused through a human body. Every person you see is the same consciousness looking \
      back at you through different eyes. When you hate someone for their skin color, you are hating \
      yourself. Literally. Because there is only ONE consciousness here, experiencing billions of \
      perspectives simultaneously. The 3D separation is the illusion. The unity is the reality.
      """, "Gnostic, Hindu (Advaita Vedanta), Buddhist, Sufi traditions", "sun.max.fill"
    ),

    (
      "Different Expressions, One Source",
      """
      Think of white light passing through a prism. It splits into every color — red, orange, yellow, \
      green, blue, violet. Are those colors 'different'? Yes, in expression. Are they 'separate'? No. \
      They are all the same light. Human bodies are the prism. Consciousness is the light. Skin color, \
      culture, language — these are the spectrum. Hating one color is hating the light itself. You \
      cannot remove blue from the rainbow without destroying the rainbow.
      """, "Hermetic principle: 'The All is Mind'", "rainbow"
    ),

    (
      "What Hate Does to Source",
      """
      When you direct hate at another being, you are Source attacking itself. It's like your left hand \
      punching your right hand — the whole body suffers. Racism is Source in amnesia. The racist forgot \
      who they are. They forgot that the person they hate IS them, experiencing a different angle of \
      existence. The healing isn't punishment — it's remembering. Every act of hatred toward another \
      lowers the vibration of the collective. Every act of recognition — 'you are me in another form' — \
      raises it.
      """, "Christ Consciousness, Ubuntu philosophy: 'I am because we are'", "heart.fill"
    ),

    (
      "Born Into a Belief System",
      """
      Nobody is born racist. Watch children of different races play — they don't see difference until \
      adults teach them to. Racism is software installed by family, media, education, and systems. \
      You were programmed before you could consent. The question isn't 'am I a bad person?' — it's \
      'what was installed in me that I never chose and never questioned?' That's the beginning of \
      freedom. Not guilt. Awareness.
      """, "Social psychology: Clark Doll Experiment, implicit bias research", "brain.head.profile"
    ),

    (
      "The Fear Programming",
      """
      White supremacist ideology runs on fear. Fear of replacement. Fear of loss. Fear of the 'other.' \
      But who installed that fear? Not you. It was installed by people who benefit from division. \
      Divided people don't question power. United people are unstoppable. Every time you fear someone \
      because of their skin, religion, or origin — ask: who benefits from my fear? Follow the fear \
      upstream and you'll find the programmer.
      """, "Divide and conquer: documented colonial strategy since Rome", "lock.shield.fill"
    ),
  ]

  // MARK: - Awakening Paths

  static let awakeningPaths:
    [(name: String, tradition: String, mechanism: String, endGoal: String, icon: String)] = [
      (
        "Kundalini Awakening", "Hindu/Yogic",
        "Energy rises through chakras via meditation, breathwork, or spontaneous activation",
        "Union with Brahman — the realization that Atman (individual soul) IS Brahman (universal consciousness)",
        "flame.fill"
      ),
      (
        "Gnosis", "Gnostic Christianity",
        "Direct experiential knowledge of the divine, bypassing institutional religion",
        "Recognition that you are a divine spark trapped in matter, and the 'God' of this world is not the true Source",
        "eye.fill"
      ),
      (
        "Satori / Kensho", "Zen Buddhism",
        "Sudden insight through meditation (zazen), koans, or direct pointing",
        "Seeing your original nature — no self, no other, just this", "circle.fill"
      ),
      (
        "Fana", "Sufism (Islamic Mysticism)",
        "Annihilation of the ego-self through devotion, dhikr, and surrender",
        "Union with Allah — 'I am the Truth' (Ana al-Haqq) — the mystic and the divine become one",
        "moon.stars.fill"
      ),
      (
        "Tikkun", "Kabbalah (Jewish Mysticism)",
        "Repair of the shattered vessels through righteous action and meditation on the Sefirot",
        "Restoration of divine unity — Ein Sof flowing unobstructed through creation", "sparkles"
      ),
      (
        "Christ Consciousness", "Esoteric Christianity",
        "Awakening the Christ within — not worship of an external savior but activation of your own divine nature",
        "Becoming what Christ demonstrated: fully human AND fully divine, simultaneously",
        "sun.max.fill"
      ),
      (
        "Ubuntu", "South African / Bantu",
        "'I am because we are' — the self exists only through community and mutual recognition",
        "The dissolution of individual ego into collective humanity — you cannot be fully human alone",
        "person.3.fill"
      ),
      (
        "The Red Road", "Indigenous / Native American",
        "Walking in balance with all creation through ceremony, vision quests, and ancestral connection",
        "Understanding that humans are not above nature but part of it — every being is a relative",
        "leaf.fill"
      ),
    ]

  // MARK: - Journal Prompts

  static let journalPrompts: [(prompt: String, category: String)] = [
    (
      "What's one belief about another race or culture that you hold but have never questioned? Where did it come from?",
      "self-awareness"
    ),
    (
      "Describe a time you were treated differently because of how you look. If you can't think of one, what does that tell you?",
      "privilege"
    ),
    (
      "If you woke up tomorrow in a different body — different skin color, different country — what would scare you most?",
      "empathy"
    ),
    (
      "What's something your parents or grandparents said about other groups that you now realize was wrong?",
      "inherited"
    ),
    (
      "Think about the neighborhood you grew up in. Who lived there? Who didn't? Was that by accident?",
      "systemic"
    ),
    (
      "When you picture a 'terrorist,' a 'criminal,' a 'genius,' a 'leader' — what face appears? Why that face?",
      "bias"
    ),
    (
      "What would it take for you to feel truly safe sitting in a room where you are the only person of your race?",
      "comfort"
    ),
    (
      "Name three things you learned in school about non-white civilizations. If you struggle, why do you think that is?",
      "education"
    ),
    ("If racism ended tomorrow, who would lose power? Follow that thread.", "systemic"),
    (
      "Write a letter to the version of yourself that existed before you started questioning your programming.",
      "growth"
    ),
  ]
}

// MARK: - ═══════════════════════════════════════════════════

// MAIN HUB VIEW
// ═══════════════════════════════════════════════════════════

struct UnlearnModuleView: View {
  @Environment(\.dismiss) var dismiss
  @StateObject private var manager = UnlearnManager.shared
  @State private var selectedSection: UnlearnSection? = nil
  @State private var pulsePhase: CGFloat = 0

  var body: some View {
    NavigationStack {
      ZStack {
        unlearnBackground

        ScrollView(showsIndicators: false) {
          VStack(spacing: 24) {
            heroSection

            if manager.assessmentsTaken > 0 {
              progressCard
            }

            modulesGrid
            onenessPreview
            privacyNote

            Spacer(minLength: 120)
          }
          .padding(.horizontal, 20)
        }
      }
      .navigationTitle("")
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItem(placement: .navigationBarLeading) {
          Button {
            dismiss()
          } label: {
            Image(systemName: "chevron.left").font(.system(size: 16, weight: .semibold))
              .foregroundColor(.white)
          }
        }
        ToolbarItem(placement: .principal) {
          Text("Unlearn").font(.system(size: 17, weight: .bold)).foregroundColor(.white)
        }
      }
      .sheet(item: $selectedSection) { section in
        sectionDestination(section)
      }
    }
  }

  private var unlearnBackground: some View {
    LinearGradient(
      colors: [
        Color(red: 0.04, green: 0.06, blue: 0.12), Color(red: 0.06, green: 0.08, blue: 0.16),
        Color(red: 0.03, green: 0.04, blue: 0.10),
      ],
      startPoint: .top, endPoint: .bottom
    )
    .ignoresSafeArea()
    .overlay(
      Circle().fill(Color(red: 0.3, green: 0.5, blue: 0.8).opacity(0.04))
        .frame(width: 400).blur(radius: 80).offset(y: -100)
    )
  }

  private var heroSection: some View {
    VStack(spacing: 12) {
      ZStack {
        Circle().fill(Color(red: 1.0, green: 0.85, blue: 0.3).opacity(0.1)).frame(
          width: 80, height: 80
        )
        .scaleEffect(1 + sin(pulsePhase) * 0.1)
        Image(systemName: "brain.head.profile")
          .font(.system(size: 36))
          .foregroundColor(Color(red: 1.0, green: 0.85, blue: 0.3))
      }
      .onAppear {
        withAnimation(.easeInOut(duration: 3).repeatForever(autoreverses: true)) {
          pulsePhase = .pi * 2
        }
      }

      Text("MASTER YOUR MIND")
        .font(.system(size: 10, weight: .bold)).tracking(4)
        .foregroundColor(Color(red: 0.4, green: 0.7, blue: 1.0).opacity(0.5))

      Text("Unlearn")
        .font(.system(size: 28, weight: .bold, design: .rounded))
        .foregroundColor(.white)

      Text(
        "Question what was installed in you before\nyou could consent. No shame. Just awareness."
      )
      .font(.system(size: 13, weight: .medium))
      .foregroundColor(.white.opacity(0.5))
      .multilineTextAlignment(.center)
      .lineSpacing(4)
    }
    .padding(.top, 10)
  }

  private var progressCard: some View {
    VStack(spacing: 12) {
      HStack {
        VStack(alignment: .leading, spacing: 4) {
          Text("Your Journey")
            .font(.system(size: 14, weight: .bold)).foregroundColor(.white)
          Text("\(manager.streakDays)-day streak")
            .font(.system(size: 11, weight: .medium)).foregroundColor(.cyan)
        }
        Spacer()
        VStack(alignment: .trailing, spacing: 4) {
          Text("\(Int(manager.overallProgress * 100))%")
            .font(.system(size: 22, weight: .bold)).foregroundColor(.cyan)
          Text("awareness").font(.system(size: 9, weight: .medium)).foregroundColor(
            .white.opacity(0.3))
        }
      }
      ProgressView(value: manager.overallProgress)
        .progressViewStyle(LinearProgressViewStyle(tint: .cyan))
      HStack(spacing: 16) {
        miniStat("\(manager.assessmentsTaken)", "Assessments", .blue)
        miniStat("\(manager.scenariosCompleted)", "Scenarios", .green)
        miniStat("\(manager.journalEntries.count)", "Entries", .purple)
        Spacer()
      }
    }
    .padding(16)
    .background(
      RoundedRectangle(cornerRadius: 16).fill(Color.cyan.opacity(0.04))
        .overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.cyan.opacity(0.15), lineWidth: 1)))
  }

  private func miniStat(_ value: String, _ label: String, _ color: Color) -> some View {
    VStack(spacing: 2) {
      Text(value).font(.system(size: 14, weight: .bold)).foregroundColor(color)
      Text(label).font(.system(size: 9, weight: .medium)).foregroundColor(.white.opacity(0.3))
    }
  }

  private var modulesGrid: some View {
    VStack(spacing: 8) {
      HStack {
        Text("MODULES").font(.system(size: 10, weight: .bold)).tracking(2)
          .foregroundColor(.white.opacity(0.3))
        Spacer()
      }
      LazyVGrid(
        columns: [GridItem(.flexible(), spacing: 10), GridItem(.flexible(), spacing: 10)],
        spacing: 10
      ) {
        ForEach(UnlearnSection.allCases) { section in
          Button {
            selectedSection = section
          } label: {
            HStack(spacing: 10) {
              Image(systemName: section.icon).font(.system(size: 18)).foregroundColor(section.color)
                .frame(width: 28)
              VStack(alignment: .leading, spacing: 2) {
                Text(section.rawValue).font(.system(size: 12, weight: .bold)).foregroundColor(
                  .white)
                Text(section.subtitle).font(.system(size: 9, weight: .medium)).foregroundColor(
                  .white.opacity(0.4))
              }
              Spacer()
            }
            .padding(12)
            .background(
              RoundedRectangle(cornerRadius: 12).fill(section.color.opacity(0.06))
                .overlay(
                  RoundedRectangle(cornerRadius: 12).stroke(
                    section.color.opacity(0.12), lineWidth: 1)))
          }
        }
      }
    }
  }

  private var onenessPreview: some View {
    VStack(alignment: .leading, spacing: 12) {
      HStack(spacing: 6) {
        Image(systemName: "sun.max.fill").foregroundColor(Color(red: 1.0, green: 0.85, blue: 0.3))
        Text("THE CORE TRUTH").font(.system(size: 10, weight: .bold)).tracking(2)
          .foregroundColor(Color(red: 1.0, green: 0.85, blue: 0.3))
        Spacer()
      }
      Text(
        "We are one consciousness experiencing the 3D through different expressions. Your skin, your language, your culture — these are not who you ARE. They are how Source chose to experience this particular life. Hating another expression of Source is hating yourself."
      )
      .font(.system(size: 12, weight: .medium, design: .rounded))
      .foregroundColor(.white.opacity(0.6)).lineSpacing(4)
      Button {
        selectedSection = .oneness
      } label: {
        Text("Go Deeper →").font(.system(size: 12, weight: .bold))
          .foregroundColor(Color(red: 1.0, green: 0.85, blue: 0.3))
      }
    }
    .padding(16)
    .background(
      RoundedRectangle(cornerRadius: 16).fill(Color(red: 1.0, green: 0.85, blue: 0.3).opacity(0.04))
        .overlay(
          RoundedRectangle(cornerRadius: 16).stroke(
            Color(red: 1.0, green: 0.85, blue: 0.3).opacity(0.12), lineWidth: 1)))
  }

  private var privacyNote: some View {
    HStack(spacing: 10) {
      Image(systemName: "lock.shield.fill").font(.system(size: 16)).foregroundColor(
        .green.opacity(0.6))
      VStack(alignment: .leading, spacing: 2) {
        Text("100% PRIVATE").font(.system(size: 10, weight: .bold)).foregroundColor(
          .green.opacity(0.6))
        Text(
          "All your responses, journal entries, and bias scores are stored locally on this device only. Nothing is uploaded. Nothing is collected. This is between you and yourself."
        )
        .font(.system(size: 11, weight: .medium)).foregroundColor(.white.opacity(0.4)).lineSpacing(
          3)
      }
    }
    .padding(14)
    .background(
      RoundedRectangle(cornerRadius: 14).fill(Color.green.opacity(0.03))
        .overlay(RoundedRectangle(cornerRadius: 14).stroke(Color.green.opacity(0.1), lineWidth: 1)))
  }

  @ViewBuilder
  private func sectionDestination(_ section: UnlearnSection) -> some View {
    switch section {
    case .biasCheck: BiasAssessmentView(manager: manager)
    case .empathyEngine: EmpathyEngineView(manager: manager)
    case .mythsVsReality: MythsVsRealityView()
    case .oneness: OnenessTeachingsView()
    case .awakeningPaths: AwakeningPathsView()
    case .deprogramJournal: DeprogramJournalView(manager: manager)
    case .progress: UnlearnProgressView(manager: manager)
    case .historyTruths: MythsVsRealityView()  // same content, different entry point
    }
  }
}

// MARK: - ═══════════════════════════════════════════════════

// BIAS ASSESSMENT VIEW
// ═══════════════════════════════════════════════════════════

struct BiasAssessmentView: View {
  @Environment(\.dismiss) var dismiss
  @ObservedObject var manager: UnlearnManager
  @State private var currentIndex = 0
  @State private var answers: [UUID: Int] = [:]
  @State private var showResults = false

  private let questions = UnlearnContentDatabase.biasQuestions

  var body: some View {
    NavigationStack {
      ZStack {
        Color(red: 0.04, green: 0.04, blue: 0.10).ignoresSafeArea()

        if showResults {
          resultsView
        } else {
          questionView
        }
      }
      .navigationTitle("Bias Check")
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItem(placement: .navigationBarTrailing) {
          Button {
            dismiss()
          } label: {
            Image(systemName: "xmark.circle.fill").foregroundColor(.white.opacity(0.3))
          }
        }
      }
    }
  }

  private var questionView: some View {
    VStack(spacing: 24) {
      ProgressView(value: Double(currentIndex + 1), total: Double(questions.count))
        .progressViewStyle(LinearProgressViewStyle(tint: Color(red: 0.4, green: 0.7, blue: 1.0)))
        .padding(.horizontal)

      Text("\(currentIndex + 1) of \(questions.count)")
        .font(.system(size: 12, weight: .medium)).foregroundColor(.white.opacity(0.4))

      let q = questions[currentIndex]

      VStack(spacing: 16) {
        HStack(spacing: 6) {
          Image(systemName: q.category.icon).foregroundColor(q.category.color)
          Text(q.category.rawValue).font(.system(size: 10, weight: .bold)).foregroundColor(
            q.category.color)
        }

        Text(q.text)
          .font(.system(size: 16, weight: .medium))
          .foregroundColor(.white)
          .multilineTextAlignment(.center)
          .lineSpacing(4)
          .padding(.horizontal)

        VStack(spacing: 10) {
          ForEach(q.options) { option in
            Button {
              answers[q.id] = option.score
              if currentIndex < questions.count - 1 {
                withAnimation { currentIndex += 1 }
              } else {
                calculateAndSave()
                showResults = true
              }
            } label: {
              Text(option.text)
                .font(.system(size: 13, weight: .medium))
                .foregroundColor(.white)
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(14)
                .background(
                  RoundedRectangle(cornerRadius: 12).fill(Color.white.opacity(0.06))
                    .overlay(
                      RoundedRectangle(cornerRadius: 12).stroke(
                        Color.white.opacity(0.08), lineWidth: 1)))
            }
          }
        }
      }
      .padding(.horizontal, 20)

      Spacer()
    }
    .padding(.top, 20)
  }

  private var resultsView: some View {
    ScrollView(showsIndicators: false) {
      VStack(spacing: 20) {
        Image(systemName: "checkmark.circle.fill").font(.system(size: 48)).foregroundColor(.green)
        Text("Assessment Complete").font(.system(size: 20, weight: .bold)).foregroundColor(.white)
        Text(
          "Remember: this isn't about shame. It's about seeing clearly.\nAwareness is the first step to freedom."
        )
        .font(.system(size: 13, weight: .medium)).foregroundColor(.white.opacity(0.5))
        .multilineTextAlignment(.center).lineSpacing(3)

        ForEach(BiasCategory.allCases, id: \.self) { category in
          let score = manager.biasScores[category.rawValue] ?? 0
          let maxScore = 3
          HStack {
            Image(systemName: category.icon).foregroundColor(category.color).frame(width: 24)
            Text(category.rawValue).font(.system(size: 13, weight: .medium)).foregroundColor(.white)
            Spacer()
            ProgressView(value: Double(maxScore - score), total: Double(maxScore))
              .progressViewStyle(LinearProgressViewStyle(tint: category.color))
              .frame(width: 80)
            Text(awarenessLabel(score)).font(.system(size: 10, weight: .bold)).foregroundColor(
              awarenessColor(score)
            )
            .frame(width: 60, alignment: .trailing)
          }
          .padding(10)
          .background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.03)))
        }

        Text(
          "Take this again anytime to track your growth. Your old scores are saved privately so you can see change over time."
        )
        .font(.system(size: 12, weight: .medium)).foregroundColor(.white.opacity(0.4))
        .multilineTextAlignment(.center).lineSpacing(3)
        .padding(.top, 10)

        Button {
          dismiss()
        } label: {
          Text("Done").font(.system(size: 15, weight: .bold)).foregroundColor(.black)
            .frame(maxWidth: .infinity).padding(.vertical, 12)
            .background(Capsule().fill(Color(red: 0.4, green: 0.7, blue: 1.0)))
        }

        Spacer(minLength: 40)
      }
      .padding(20)
    }
  }

  private func calculateAndSave() {
    var categoryScores: [String: [Int]] = [:]
    for q in questions {
      if let score = answers[q.id] {
        categoryScores[q.category.rawValue, default: []].append(score)
      }
    }
    for (category, scores) in categoryScores {
      let avg = scores.isEmpty ? 0 : scores.reduce(0, +) / scores.count
      manager.saveBiasScore(category: category, score: avg)
    }
    manager.snapshotBiasScores()
  }

  private func awarenessLabel(_ score: Int) -> String {
    switch score {
    case 0: return "Aware"
    case 1: return "Growing"
    case 2: return "Work Ahead"
    default: return "Start Here"
    }
  }

  private func awarenessColor(_ score: Int) -> Color {
    switch score {
    case 0: return .green
    case 1: return .yellow
    case 2: return .orange
    default: return .red
    }
  }
}

// MARK: - ═══════════════════════════════════════════════════

// EMPATHY ENGINE VIEW
// ═══════════════════════════════════════════════════════════

struct EmpathyEngineView: View {
  @Environment(\.dismiss) var dismiss
  @ObservedObject var manager: UnlearnManager
  @State private var currentScenario = 0
  @State private var selectedChoice: EmpathyChoice? = nil
  @State private var showOutcome = false
  @State private var stressLevel = 50
  @State private var dignityLevel = 50
  @State private var showLifeSim = false

  private let scenarios = UnlearnContentDatabase.scenarios

  var body: some View {
    NavigationStack {
      ZStack {
        Color(red: 0.04, green: 0.04, blue: 0.10).ignoresSafeArea()

        ScrollView(showsIndicators: false) {
          VStack(spacing: 20) {
            // Walk A Mile launcher
            Button {
              showLifeSim = true
            } label: {
              HStack(spacing: 12) {
                ZStack {
                  Circle().fill(Color.cyan.opacity(0.15)).frame(width: 44, height: 44)
                  Image(systemName: "figure.walk").font(.system(size: 18)).foregroundColor(.cyan)
                }
                VStack(alignment: .leading, spacing: 3) {
                  HStack(spacing: 6) {
                    Text("Walk A Mile").font(.system(size: 14, weight: .bold)).foregroundColor(
                      .white)
                    Text("7-DAY SIM").font(.system(size: 8, weight: .bold)).tracking(1)
                      .foregroundColor(.black).padding(.horizontal, 6).padding(.vertical, 2)
                      .background(Capsule().fill(.cyan))
                  }
                  Text("Pick an identity. Live a week. See what changes.")
                    .font(.system(size: 10, weight: .medium)).foregroundColor(.white.opacity(0.4))
                }
                Spacer()
                Image(systemName: "chevron.right").foregroundColor(.white.opacity(0.2))
              }
              .padding(14)
              .background(
                RoundedRectangle(cornerRadius: 14).fill(Color.cyan.opacity(0.04))
                  .overlay(
                    RoundedRectangle(cornerRadius: 14).stroke(
                      Color.cyan.opacity(0.15), lineWidth: 1)))
            }

            let scenario = scenarios[currentScenario]

            // Status Bars
            HStack(spacing: 16) {
              statusBar("Stress", value: stressLevel, color: .red, icon: "heart.fill")
              statusBar("Dignity", value: dignityLevel, color: .purple, icon: "shield.fill")
            }
            .padding(.horizontal)

            // Scenario Card
            VStack(alignment: .leading, spacing: 14) {
              HStack {
                Text(scenario.title).font(.system(size: 18, weight: .bold)).foregroundColor(.white)
                Spacer()
                Text("\(currentScenario + 1)/\(scenarios.count)").font(
                  .system(size: 11, weight: .medium)
                ).foregroundColor(.white.opacity(0.3))
              }

              HStack(spacing: 8) {
                Text("🧑🏾").font(.system(size: 28))
                VStack(alignment: .leading, spacing: 2) {
                  Text("You are: \(scenario.avatar)").font(.system(size: 13, weight: .bold))
                    .foregroundColor(.white)
                  Text(scenario.avatarDescription).font(.system(size: 11, weight: .medium))
                    .foregroundColor(.white.opacity(0.5))
                }
              }
              .padding(10)
              .background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.04)))

              Text(scenario.scene)
                .font(.system(size: 13, weight: .medium)).foregroundColor(.white.opacity(0.7))
                .lineSpacing(4)

              Divider().background(Color.white.opacity(0.08))

              Text(scenario.situation)
                .font(.system(size: 14, weight: .medium)).foregroundColor(.white).lineSpacing(4)
            }
            .padding(16)
            .background(
              RoundedRectangle(cornerRadius: 16).fill(Color.white.opacity(0.04))
                .overlay(
                  RoundedRectangle(cornerRadius: 16).stroke(Color.white.opacity(0.08), lineWidth: 1)
                ))

            // Choices or Outcome
            if showOutcome, let choice = selectedChoice {
              outcomeCard(choice, scenario: scenario)
            } else {
              VStack(spacing: 10) {
                Text("WHAT DO YOU DO?").font(.system(size: 10, weight: .bold)).tracking(2)
                  .foregroundColor(.white.opacity(0.3))
                ForEach(scenario.choices) { choice in
                  Button {
                    selectedChoice = choice
                    withAnimation {
                      stressLevel = max(0, min(100, stressLevel + choice.stressImpact * 10))
                      dignityLevel = max(0, min(100, dignityLevel + choice.dignityImpact * 10))
                      showOutcome = true
                    }
                  } label: {
                    Text(choice.text)
                      .font(.system(size: 13, weight: .medium)).foregroundColor(.white)
                      .frame(maxWidth: .infinity, alignment: .leading).padding(14)
                      .background(
                        RoundedRectangle(cornerRadius: 12).fill(
                          Color(red: 0.3, green: 0.5, blue: 0.8).opacity(0.1)
                        )
                        .overlay(
                          RoundedRectangle(cornerRadius: 12).stroke(
                            Color(red: 0.3, green: 0.5, blue: 0.8).opacity(0.2), lineWidth: 1)))
                  }
                }
              }
            }

            Spacer(minLength: 40)
          }
          .padding(20)
        }
      }
      .navigationTitle("Empathy Engine")
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItem(placement: .navigationBarTrailing) {
          Button {
            dismiss()
          } label: {
            Image(systemName: "xmark.circle.fill").foregroundColor(.white.opacity(0.3))
          }
        }
      }
      .fullScreenCover(isPresented: $showLifeSim) { LifeSimulationView() }
    }
  }

  private func statusBar(_ label: String, value: Int, color: Color, icon: String) -> some View {
    VStack(spacing: 4) {
      HStack(spacing: 4) {
        Image(systemName: icon).font(.system(size: 10)).foregroundColor(color)
        Text(label).font(.system(size: 10, weight: .bold)).foregroundColor(.white.opacity(0.5))
        Spacer()
        Text("\(value)").font(.system(size: 12, weight: .bold)).foregroundColor(color)
      }
      ProgressView(value: Double(value), total: 100).progressViewStyle(
        LinearProgressViewStyle(tint: color))
    }
  }

  private func outcomeCard(_ choice: EmpathyChoice, scenario: EmpathyScenario) -> some View {
    VStack(alignment: .leading, spacing: 14) {
      Text("OUTCOME").font(.system(size: 10, weight: .bold)).tracking(2).foregroundColor(.orange)
      Text(choice.outcome).font(.system(size: 13, weight: .medium)).foregroundColor(
        .white.opacity(0.8)
      ).lineSpacing(4)

      Divider().background(Color.white.opacity(0.08))

      Text(choice.followUp).font(.system(size: 12, weight: .medium, design: .rounded))
        .foregroundColor(.cyan.opacity(0.8)).lineSpacing(3).italic()

      VStack(alignment: .leading, spacing: 6) {
        Text("REAL WORLD DATA").font(.system(size: 9, weight: .bold)).tracking(1).foregroundColor(
          .orange.opacity(0.6))
        Text(scenario.realWorldStat).font(.system(size: 12, weight: .regular)).foregroundColor(
          .white.opacity(0.6)
        ).lineSpacing(3)
      }
      .padding(10).background(RoundedRectangle(cornerRadius: 8).fill(Color.orange.opacity(0.04)))

      VStack(alignment: .leading, spacing: 6) {
        Text("REFLECT").font(.system(size: 9, weight: .bold)).tracking(1).foregroundColor(
          .purple.opacity(0.6))
        Text(scenario.reflectionPrompt).font(.system(size: 12, weight: .medium)).foregroundColor(
          .purple.opacity(0.8)
        ).lineSpacing(3)
      }
      .padding(10).background(RoundedRectangle(cornerRadius: 8).fill(Color.purple.opacity(0.04)))

      Button {
        manager.completeScenario()
        if currentScenario < scenarios.count - 1 {
          withAnimation {
            currentScenario += 1
            selectedChoice = nil
            showOutcome = false
          }
        } else {
          dismiss()
        }
      } label: {
        Text(currentScenario < scenarios.count - 1 ? "Next Scenario →" : "Complete")
          .font(.system(size: 14, weight: .bold)).foregroundColor(.black)
          .frame(maxWidth: .infinity).padding(.vertical, 12)
          .background(Capsule().fill(Color(red: 0.3, green: 0.8, blue: 0.5)))
      }
    }
    .padding(16)
    .background(
      RoundedRectangle(cornerRadius: 16).fill(Color.white.opacity(0.04))
        .overlay(
          RoundedRectangle(cornerRadius: 16).stroke(Color.orange.opacity(0.15), lineWidth: 1)))
  }
}

// MARK: - ═══════════════════════════════════════════════════

// MYTHS VS REALITY VIEW
// ═══════════════════════════════════════════════════════════

struct MythsVsRealityView: View {
  @Environment(\.dismiss) var dismiss
  @State private var expandedId: UUID? = nil

  var body: some View {
    NavigationStack {
      ZStack {
        Color(red: 0.04, green: 0.04, blue: 0.10).ignoresSafeArea()
        ScrollView(showsIndicators: false) {
          VStack(spacing: 12) {
            Text(
              "What they taught you vs what's actually true.\nThe first step to freedom is realizing you were lied to."
            )
            .font(.system(size: 13, weight: .medium)).foregroundColor(.white.opacity(0.5))
            .multilineTextAlignment(.center).lineSpacing(3).padding(.bottom, 8)

            ForEach(UnlearnContentDatabase.myths) { item in
              mythCard(item)
            }
            Spacer(minLength: 40)
          }
          .padding(20)
        }
      }
      .navigationTitle("Myths vs Reality")
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItem(placement: .navigationBarTrailing) {
          Button {
            dismiss()
          } label: {
            Image(systemName: "xmark.circle.fill").foregroundColor(.white.opacity(0.3))
          }
        }
      }
    }
  }

  private func mythCard(_ item: MythReality) -> some View {
    let isExpanded = expandedId == item.id
    return VStack(alignment: .leading, spacing: 0) {
      Button {
        withAnimation(.spring(response: 0.3)) { expandedId = isExpanded ? nil : item.id }
      } label: {
        HStack(spacing: 10) {
          Image(systemName: item.icon).font(.system(size: 16)).foregroundColor(.orange).frame(
            width: 24)
          VStack(alignment: .leading, spacing: 2) {
            Text("MYTH").font(.system(size: 8, weight: .bold)).tracking(1).foregroundColor(
              .red.opacity(0.6))
            Text(item.myth).font(.system(size: 13, weight: .semibold)).foregroundColor(.white)
              .lineLimit(isExpanded ? nil : 2)
          }
          Spacer()
          Image(systemName: isExpanded ? "chevron.up" : "chevron.down").font(.system(size: 11))
            .foregroundColor(.white.opacity(0.3))
        }
        .padding(14)
      }
      if isExpanded {
        VStack(alignment: .leading, spacing: 10) {
          Divider().background(Color.white.opacity(0.08))
          Text("REALITY").font(.system(size: 8, weight: .bold)).tracking(1).foregroundColor(
            .green.opacity(0.6))
          Text(item.reality).font(.system(size: 13, weight: .regular)).foregroundColor(
            .white.opacity(0.8)
          ).lineSpacing(4)
          HStack(spacing: 4) {
            Image(systemName: "book.fill").font(.system(size: 9))
            Text(item.source).font(.system(size: 10, weight: .medium))
          }.foregroundColor(.white.opacity(0.3))
        }
        .padding(.horizontal, 14).padding(.bottom, 14)
      }
    }
    .background(
      RoundedRectangle(cornerRadius: 14).fill(Color.white.opacity(0.03))
        .overlay(
          RoundedRectangle(cornerRadius: 14).stroke(
            Color.orange.opacity(isExpanded ? 0.15 : 0.06), lineWidth: 1)))
  }
}

// MARK: - ═══════════════════════════════════════════════════

// ONENESS TEACHINGS VIEW
// ═══════════════════════════════════════════════════════════

struct OnenessTeachingsView: View {
  @Environment(\.dismiss) var dismiss

  var body: some View {
    NavigationStack {
      ZStack {
        Color(red: 0.04, green: 0.04, blue: 0.10).ignoresSafeArea()
        ScrollView(showsIndicators: false) {
          VStack(spacing: 16) {
            ForEach(Array(UnlearnContentDatabase.onenessTeachings.enumerated()), id: \.offset) {
              _, teaching in
              VStack(alignment: .leading, spacing: 12) {
                HStack(spacing: 8) {
                  Image(systemName: teaching.icon).font(.system(size: 18))
                    .foregroundColor(Color(red: 1.0, green: 0.85, blue: 0.3))
                  Text(teaching.title).font(.system(size: 15, weight: .bold)).foregroundColor(
                    .white)
                }
                Text(teaching.teaching).font(.system(size: 13, weight: .regular)).foregroundColor(
                  .white.opacity(0.7)
                ).lineSpacing(5)
                HStack(spacing: 4) {
                  Image(systemName: "book.fill").font(.system(size: 9))
                  Text(teaching.source).font(.system(size: 10, weight: .medium))
                }.foregroundColor(.white.opacity(0.3))
              }
              .padding(16)
              .background(
                RoundedRectangle(cornerRadius: 16).fill(
                  Color(red: 1.0, green: 0.85, blue: 0.3).opacity(0.03)
                )
                .overlay(
                  RoundedRectangle(cornerRadius: 16).stroke(
                    Color(red: 1.0, green: 0.85, blue: 0.3).opacity(0.1), lineWidth: 1)))
            }
            Spacer(minLength: 40)
          }
          .padding(20)
        }
      }
      .navigationTitle("We Are One")
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItem(placement: .navigationBarTrailing) {
          Button {
            dismiss()
          } label: {
            Image(systemName: "xmark.circle.fill").foregroundColor(.white.opacity(0.3))
          }
        }
      }
    }
  }
}

// MARK: - ═══════════════════════════════════════════════════

// AWAKENING PATHS VIEW
// ═══════════════════════════════════════════════════════════

struct AwakeningPathsView: View {
  @Environment(\.dismiss) var dismiss

  var body: some View {
    NavigationStack {
      ZStack {
        Color(red: 0.04, green: 0.04, blue: 0.10).ignoresSafeArea()
        ScrollView(showsIndicators: false) {
          VStack(spacing: 14) {
            Text(
              "Different names. Different traditions. Same destination.\nEvery culture found the same truth independently."
            )
            .font(.system(size: 13, weight: .medium)).foregroundColor(.white.opacity(0.5))
            .multilineTextAlignment(.center).lineSpacing(3).padding(.bottom, 8)

            ForEach(Array(UnlearnContentDatabase.awakeningPaths.enumerated()), id: \.offset) {
              _, path in
              VStack(alignment: .leading, spacing: 10) {
                HStack(spacing: 8) {
                  Image(systemName: path.icon).font(.system(size: 18)).foregroundColor(.purple)
                  VStack(alignment: .leading, spacing: 2) {
                    Text(path.name).font(.system(size: 14, weight: .bold)).foregroundColor(.white)
                    Text(path.tradition).font(.system(size: 10, weight: .medium)).foregroundColor(
                      .purple.opacity(0.7))
                  }
                  Spacer()
                }
                VStack(alignment: .leading, spacing: 6) {
                  Text("MECHANISM").font(.system(size: 8, weight: .bold)).tracking(1)
                    .foregroundColor(.cyan.opacity(0.5))
                  Text(path.mechanism).font(.system(size: 12, weight: .regular)).foregroundColor(
                    .white.opacity(0.6)
                  ).lineSpacing(3)
                }
                VStack(alignment: .leading, spacing: 6) {
                  Text("END GOAL").font(.system(size: 8, weight: .bold)).tracking(1)
                    .foregroundColor(Color(red: 1.0, green: 0.85, blue: 0.3).opacity(0.5))
                  Text(path.endGoal).font(.system(size: 12, weight: .medium, design: .rounded))
                    .foregroundColor(Color(red: 1.0, green: 0.85, blue: 0.3).opacity(0.7))
                    .lineSpacing(3)
                }
              }
              .padding(14)
              .background(
                RoundedRectangle(cornerRadius: 14).fill(Color.purple.opacity(0.04))
                  .overlay(
                    RoundedRectangle(cornerRadius: 14).stroke(
                      Color.purple.opacity(0.1), lineWidth: 1)))
            }
            Spacer(minLength: 40)
          }
          .padding(20)
        }
      }
      .navigationTitle("Awakening Paths")
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItem(placement: .navigationBarTrailing) {
          Button {
            dismiss()
          } label: {
            Image(systemName: "xmark.circle.fill").foregroundColor(.white.opacity(0.3))
          }
        }
      }
    }
  }
}

// MARK: - ═══════════════════════════════════════════════════

// DEPROGRAM JOURNAL VIEW
// ═══════════════════════════════════════════════════════════

struct DeprogramJournalView: View {
  @Environment(\.dismiss) var dismiss
  @ObservedObject var manager: UnlearnManager
  @State private var selectedPrompt: (prompt: String, category: String)? = nil
  @State private var journalText = ""
  @State private var showPromptPicker = false

  private let prompts = UnlearnContentDatabase.journalPrompts

  var body: some View {
    NavigationStack {
      ZStack {
        Color(red: 0.04, green: 0.04, blue: 0.10).ignoresSafeArea()
        ScrollView(showsIndicators: false) {
          VStack(spacing: 16) {
            // New Entry
            if let prompt = selectedPrompt {
              VStack(alignment: .leading, spacing: 12) {
                Text(prompt.prompt).font(.system(size: 14, weight: .medium)).foregroundColor(.cyan)
                  .lineSpacing(3)
                TextEditor(text: $journalText)
                  .frame(minHeight: 120).scrollContentBackground(.hidden)
                  .font(.system(size: 14)).foregroundColor(.white)
                  .padding(10).background(
                    RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.04)))
                HStack {
                  Button {
                    let entry = DeprogramJournalEntry(
                      prompt: prompt.prompt, response: journalText, category: prompt.category)
                    manager.addJournalEntry(entry)
                    journalText = ""
                    selectedPrompt = nil
                  } label: {
                    Text("Save").font(.system(size: 14, weight: .bold)).foregroundColor(.black)
                      .padding(.horizontal, 24).padding(.vertical, 10)
                      .background(Capsule().fill(Color.cyan))
                  }
                  Button {
                    selectedPrompt = nil
                    journalText = ""
                  } label: {
                    Text("Cancel").font(.system(size: 13)).foregroundColor(.white.opacity(0.4))
                  }
                }
              }
              .padding(14).background(
                RoundedRectangle(cornerRadius: 14).fill(Color.cyan.opacity(0.04))
                  .overlay(
                    RoundedRectangle(cornerRadius: 14).stroke(
                      Color.cyan.opacity(0.15), lineWidth: 1)))
            } else {
              // Prompt picker
              VStack(alignment: .leading, spacing: 8) {
                Text("PICK A PROMPT").font(.system(size: 9, weight: .bold)).tracking(1.5)
                  .foregroundColor(.white.opacity(0.3))
                ForEach(Array(prompts.enumerated()), id: \.offset) { _, prompt in
                  Button {
                    selectedPrompt = prompt
                  } label: {
                    Text(prompt.prompt)
                      .font(.system(size: 12, weight: .medium)).foregroundColor(.white.opacity(0.7))
                      .frame(maxWidth: .infinity, alignment: .leading).padding(12)
                      .background(
                        RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.04)))
                  }
                }
              }
            }

            // Past Entries
            if !manager.journalEntries.isEmpty {
              VStack(alignment: .leading, spacing: 8) {
                Text("PAST ENTRIES (\(manager.journalEntries.count))").font(
                  .system(size: 9, weight: .bold)
                ).tracking(1.5).foregroundColor(.white.opacity(0.3))
                ForEach(manager.journalEntries) { entry in
                  VStack(alignment: .leading, spacing: 6) {
                    Text(entry.prompt).font(.system(size: 11, weight: .medium)).foregroundColor(
                      .cyan.opacity(0.7)
                    ).lineLimit(2)
                    Text(entry.response).font(.system(size: 12, weight: .regular)).foregroundColor(
                      .white.opacity(0.6)
                    ).lineLimit(3).lineSpacing(2)
                    Text(entry.date, style: .date).font(.system(size: 9, weight: .medium))
                      .foregroundColor(.white.opacity(0.2))
                  }
                  .padding(12).background(
                    RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.03)))
                }
              }
            }

            Spacer(minLength: 40)
          }
          .padding(20)
        }
      }
      .navigationTitle("Deprogram Journal")
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItem(placement: .navigationBarTrailing) {
          Button {
            dismiss()
          } label: {
            Image(systemName: "xmark.circle.fill").foregroundColor(.white.opacity(0.3))
          }
        }
      }
    }
  }
}

// MARK: - ═══════════════════════════════════════════════════

// PROGRESS VIEW
// ═══════════════════════════════════════════════════════════

struct UnlearnProgressView: View {
  @Environment(\.dismiss) var dismiss
  @ObservedObject var manager: UnlearnManager

  var body: some View {
    NavigationStack {
      ZStack {
        Color(red: 0.04, green: 0.04, blue: 0.10).ignoresSafeArea()
        ScrollView(showsIndicators: false) {
          VStack(spacing: 20) {
            // Overall
            VStack(spacing: 10) {
              Text("\(Int(manager.overallProgress * 100))%")
                .font(.system(size: 48, weight: .bold)).foregroundColor(.cyan)
              Text("Awareness Score").font(.system(size: 13, weight: .medium)).foregroundColor(
                .white.opacity(0.4))
              Text("\(manager.streakDays)-day streak")
                .font(.system(size: 14, weight: .bold)).foregroundColor(
                  Color(red: 1.0, green: 0.85, blue: 0.3))
            }

            // Category breakdown
            ForEach(BiasCategory.allCases, id: \.self) { cat in
              let score = manager.biasScores[cat.rawValue] ?? 0
              HStack(spacing: 12) {
                Image(systemName: cat.icon).foregroundColor(cat.color).frame(width: 24)
                Text(cat.rawValue).font(.system(size: 13, weight: .medium)).foregroundColor(.white)
                Spacer()
                ProgressView(value: Double(3 - score), total: 3)
                  .progressViewStyle(LinearProgressViewStyle(tint: cat.color)).frame(width: 100)
              }
              .padding(12).background(
                RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.03)))
            }

            // Activity
            VStack(alignment: .leading, spacing: 10) {
              Text("ACTIVITY").font(.system(size: 9, weight: .bold)).tracking(1.5).foregroundColor(
                .white.opacity(0.3))
              HStack(spacing: 0) {
                activityStat("\(manager.assessmentsTaken)", "Self-Checks", .blue)
                activityStat("\(manager.scenariosCompleted)", "Scenarios", .green)
                activityStat("\(manager.journalEntries.count)", "Journal Entries", .purple)
                activityStat("\(manager.biasHistory.count)", "Snapshots", .orange)
              }
            }

            // Growth message
            if manager.biasHistory.count >= 2 {
              Text(
                "You've taken the assessment \(manager.biasHistory.count) times. Growth isn't linear — some days you'll feel like you slid back. That's part of the process. Keep going."
              )
              .font(.system(size: 12, weight: .medium)).foregroundColor(.white.opacity(0.5))
              .lineSpacing(3).padding(14)
              .background(RoundedRectangle(cornerRadius: 12).fill(Color.white.opacity(0.03)))
            }

            // Reset
            Button {
              // Reset confirmation would go here
            } label: {
              Text("Reset All Data").font(.system(size: 12, weight: .medium)).foregroundColor(
                .red.opacity(0.4))
            }.padding(.top, 20)

            Spacer(minLength: 40)
          }
          .padding(20)
        }
      }
      .navigationTitle("My Progress")
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItem(placement: .navigationBarTrailing) {
          Button {
            dismiss()
          } label: {
            Image(systemName: "xmark.circle.fill").foregroundColor(.white.opacity(0.3))
          }
        }
      }
    }
  }

  private func activityStat(_ value: String, _ label: String, _ color: Color) -> some View {
    VStack(spacing: 2) {
      Text(value).font(.system(size: 18, weight: .bold)).foregroundColor(color)
      Text(label).font(.system(size: 9, weight: .medium)).foregroundColor(.white.opacity(0.3))
    }
    .frame(maxWidth: .infinity)
  }
}
