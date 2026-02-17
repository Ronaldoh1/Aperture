// LifeSimulationView.swift
// WALK A MILE — Society Simulation Engine
// ☀️ SunFlow: Reignited
//
// "You can't understand someone's life by reading about it.
//  You have to LIVE it — even for a simulated week."
//
// Pick your identity. Get your budget. Navigate society.
// See what cascading bias does to everything: school, work,
// friends, money, luxuries, health, dignity, life quality.
// Then replay as someone else. Compare. Understand.

import SwiftUI

// MARK: - ═══════════════════════════════════════════════════

// IDENTITY & WORLD MODELS
// ═══════════════════════════════════════════════════════════

enum SimIdentity: String, CaseIterable, Identifiable {
  case blackMale = "Black Man"
  case blackFemale = "Black Woman"
  case whiteMale = "White Man"
  case whiteFemale = "White Woman"
  case muslimMale = "Muslim Man"
  case muslimFemale = "Muslim Woman (Hijab)"
  case asianMale = "Asian Man"
  case latinoMale = "Latino Man"
  case indigenous = "Indigenous Person"

  var id: String {
    rawValue
  }

  var emoji: String {
    switch self {
    case .blackMale: return "👨🏿"
    case .blackFemale: return "👩🏿"
    case .whiteMale: return "👨🏻"
    case .whiteFemale: return "👩🏻"
    case .muslimMale: return "🧔🏽"
    case .muslimFemale: return "🧕🏽"
    case .asianMale: return "👨🏻‍💼"
    case .latinoMale: return "👨🏽"
    case .indigenous: return "🧑🏽"
    }
  }

  var privilegeModifier: Double {
    switch self {
    case .whiteMale: return 1.0
    case .whiteFemale: return 0.85
    case .asianMale: return 0.72
    case .latinoMale: return 0.65
    case .blackFemale: return 0.58
    case .blackMale: return 0.55
    case .muslimMale: return 0.60
    case .muslimFemale: return 0.50
    case .indigenous: return 0.48
    }
  }

  var baseLifeExpectancy: Int {
    switch self {
    case .whiteMale: return 76
    case .whiteFemale: return 81
    case .asianMale: return 79
    case .blackMale: return 70
    case .blackFemale: return 77
    case .latinoMale: return 77
    case .muslimMale: return 76
    case .muslimFemale: return 80
    case .indigenous: return 67
    }
  }
}

enum IncomeBracket: String, CaseIterable, Identifiable {
  case low = "Low Income"
  case middle = "Middle Income"
  case high = "High Income"

  var id: String {
    rawValue
  }

  var weeklyBudget: Int {
    switch self {
    case .low: return 150
    case .middle: return 500
    case .high: return 1200
    }
  }

  var weeklyRent: Int {
    switch self {
    case .low: return 85
    case .middle: return 250
    case .high: return 500
    }
  }

  var emoji: String {
    switch self {
    case .low: return "💸"
    case .middle: return "💵"
    case .high: return "💰"
    }
  }
}

// MARK: - Life Quality Metrics

struct LifeMetrics {
  var health: Int = 80  // 0-100
  var happiness: Int = 70  // 0-100
  var dignity: Int = 80  // 0-100
  var finances: Int = 50  // weekly $ remaining
  var stress: Int = 20  // 0-100 (lower = better)
  var opportunities: Int = 50  // 0-100
  var socialLife: Int = 60  // 0-100
  var lifeExpectancy: Int = 76  // years

  var overallQuality: Int {
    let raw = (health + happiness + dignity + opportunities + socialLife) / 5
    let stressPenalty = stress / 4
    return max(0, min(100, raw - stressPenalty))
  }
}

// MARK: - Day Events

struct SimDay: Identifiable {
  let id = UUID()
  let dayNumber: Int
  let title: String
  let events: [SimEvent]
}

struct SimEvent: Identifiable {
  let id = UUID()
  let title: String
  let scene: String
  let choices: [SimChoice]
  let category: EventCategory
}

struct SimChoice: Identifiable {
  let id = UUID()
  let text: String
  let outcome: String
  let healthDelta: Int
  let happinessDelta: Int
  let dignityDelta: Int
  let financeDelta: Int
  let stressDelta: Int
  let opportunityDelta: Int
  let socialDelta: Int
  let realWorldContext: String
}

enum EventCategory: String {
  case work = "Work"
  case school = "School"
  case social = "Social"
  case police = "Police"
  case housing = "Housing"
  case shopping = "Shopping"
  case health = "Health"
  case financial = "Financial"

  var icon: String {
    switch self {
    case .work: return "briefcase.fill"
    case .school: return "graduationcap.fill"
    case .social: return "person.3.fill"
    case .police: return "shield.fill"
    case .housing: return "house.fill"
    case .shopping: return "cart.fill"
    case .health: return "heart.fill"
    case .financial: return "banknote.fill"
    }
  }

  var color: Color {
    switch self {
    case .work: return .blue
    case .school: return .purple
    case .social: return .green
    case .police: return .red
    case .housing: return .orange
    case .shopping: return .pink
    case .health: return Color(red: 0.3, green: 0.8, blue: 0.5)
    case .financial: return Color(red: 1.0, green: 0.85, blue: 0.3)
    }
  }
}

// MARK: - ═══════════════════════════════════════════════════

// SIMULATION ENGINE
// ═══════════════════════════════════════════════════════════

final class LifeSimEngine: ObservableObject {
  @Published var identity: SimIdentity = .blackMale
  @Published var income: IncomeBracket = .low
  @Published var metrics: LifeMetrics = .init()
  @Published var currentDay: Int = 1
  @Published var currentEventIndex: Int = 0
  @Published var completedDays: [Int: LifeMetrics] = [:]
  @Published var comparisonMetrics: LifeMetrics? = nil
  @Published var showComparison: Bool = false
  @Published var journalEntries: [String] = []

  func startSimulation(identity: SimIdentity, income: IncomeBracket) {
    self.identity = identity
    self.income = income
    currentDay = 1
    currentEventIndex = 0
    completedDays = [:]
    journalEntries = []

    // Apply identity modifiers to starting metrics
    let priv = identity.privilegeModifier
    metrics = LifeMetrics(
      health: Int(80.0 * priv) + Int.random(in: 0...10),
      happiness: Int(70.0 * priv) + Int.random(in: 0...15),
      dignity: Int(80.0 * priv) + Int.random(in: 0...10),
      finances: income.weeklyBudget - income.weeklyRent,
      stress: Int(20.0 / priv),
      opportunities: Int(60.0 * priv),
      socialLife: 60,
      lifeExpectancy: identity.baseLifeExpectancy
    )
  }

  func applyChoice(_ choice: SimChoice) {
    metrics.health = clamp(metrics.health + choice.healthDelta)
    metrics.happiness = clamp(metrics.happiness + choice.happinessDelta)
    metrics.dignity = clamp(metrics.dignity + choice.dignityDelta)
    metrics.finances += choice.financeDelta
    metrics.stress = clamp(metrics.stress + choice.stressDelta)
    metrics.opportunities = clamp(metrics.opportunities + choice.opportunityDelta)
    metrics.socialLife = clamp(metrics.socialLife + choice.socialDelta)

    // Chronic stress reduces life expectancy
    if metrics.stress > 70 { metrics.lifeExpectancy -= 1 }
    if metrics.health < 30 { metrics.lifeExpectancy -= 1 }
  }

  func advanceDay() {
    completedDays[currentDay] = metrics
    if currentDay < 7 {
      currentDay += 1
      currentEventIndex = 0
      // Daily costs
      metrics.finances -= Int.random(in: 15...35)
      if metrics.finances < 0 {
        metrics.stress = clamp(metrics.stress + 10)
        metrics.happiness = clamp(metrics.happiness - 5)
      }
    }
  }

  func generateComparison() {
    // Generate what white male / high income would look like
    let priv = SimIdentity.whiteMale.privilegeModifier
    comparisonMetrics = LifeMetrics(
      health: min(100, Int(Double(metrics.health) / identity.privilegeModifier * priv)),
      happiness: min(100, Int(Double(metrics.happiness) / identity.privilegeModifier * priv) + 10),
      dignity: min(100, Int(90.0 * priv)),
      finances: IncomeBracket.middle.weeklyBudget - IncomeBracket.middle.weeklyRent + 200,
      stress: max(5, Int(Double(metrics.stress) * identity.privilegeModifier)),
      opportunities: min(
        100, Int(Double(metrics.opportunities) / identity.privilegeModifier * priv)),
      socialLife: min(100, metrics.socialLife + 20),
      lifeExpectancy: SimIdentity.whiteMale.baseLifeExpectancy
    )
    showComparison = true
  }

  private func clamp(_ val: Int) -> Int {
    max(0, min(100, val))
  }

  // MARK: - Event Generation

  func eventsForDay(_ day: Int) -> [SimEvent] {
    let isMinority = identity != .whiteMale && identity != .whiteFemale
    let isBlack = identity == .blackMale || identity == .blackFemale
    let isMuslim = identity == .muslimMale || identity == .muslimFemale
    let isLow = income == .low

    var events: [SimEvent] = []

    switch day {
    case 1:  // Monday — Work/School + Police
      events.append(
        SimEvent(
          title: "Morning Commute",
          scene: isBlack
            ? "You're driving to work. A cop car pulls behind you and follows for three blocks before hitting lights."
            : isMuslim
              ? "You're on the subway. Someone moves away from you when you sit down. A woman clutches her bag tighter."
              : "You drive to work. Normal commute, light traffic. You grab coffee on the way.",
          choices: isBlack
            ? [
              SimChoice(
                text: "Pull over immediately, hands on wheel",
                outcome:
                  "Officer asks where you're going, runs your plates twice. You're late for work. Manager gives you a look. No apology from the cop.",
                healthDelta: -3, happinessDelta: -5, dignityDelta: -8, financeDelta: 0,
                stressDelta: 12, opportunityDelta: -3, socialDelta: 0,
                realWorldContext:
                  "Black drivers are stopped 20% more often. Once stopped, 2x more likely to be searched despite lower contraband rates."
              ),
              SimChoice(
                text: "Ask why you're being stopped",
                outcome:
                  "Tone escalates. Backup called. 40 minutes on the curb. Late for work. Written up. Your hands shake the rest of the day.",
                healthDelta: -5, happinessDelta: -8, dignityDelta: -5, financeDelta: 0,
                stressDelta: 18, opportunityDelta: -5, socialDelta: 0,
                realWorldContext:
                  "Asserting your rights while Black statistically increases the chance of force being used."
              ),
            ]
            : isMuslim
              ? [
                SimChoice(
                  text: "Ignore it and put in earbuds",
                  outcome:
                    "You arrive at work carrying the weight of being treated like a threat. Nobody at the office knows. You smile anyway.",
                  healthDelta: -2, happinessDelta: -3, dignityDelta: -5, financeDelta: 0,
                  stressDelta: 8, opportunityDelta: 0, socialDelta: -2,
                  realWorldContext:
                    "Muslims report daily microaggressions in public transit at 4x the rate of white Americans."
                ),
                SimChoice(
                  text: "Smile at her warmly",
                  outcome:
                    "She doesn't smile back. Another passenger shakes their head at her. Small win, but it costs energy you shouldn't have to spend.",
                  healthDelta: -1, happinessDelta: -2, dignityDelta: 0, financeDelta: 0,
                  stressDelta: 5, opportunityDelta: 0, socialDelta: 1,
                  realWorldContext:
                    "The emotional labor of constantly disarming fear is exhausting and unmeasured."
                ),
              ]
              : [
                SimChoice(
                  text: "Normal commute — grab coffee, listen to a podcast",
                  outcome:
                    "You arrive relaxed. Manager nods. Day starts smooth. Nobody questions your presence anywhere.",
                  healthDelta: 0, happinessDelta: 2, dignityDelta: 0, financeDelta: -5,
                  stressDelta: 0, opportunityDelta: 0, socialDelta: 0,
                  realWorldContext:
                    "A 'normal' commute is itself a privilege. Many people navigate bias before they even clock in."
                )
              ],
          category: isBlack ? .police : isMuslim ? .social : .work
        ))

      events.append(
        SimEvent(
          title: "At Work",
          scene: isMinority
            ? "Team meeting. Your idea from last week's email is presented by a coworker — as their own. Everyone praises them."
            : "Team meeting. You present your idea. Good reception. Boss mentions potential promotion track.",
          choices: isMinority
            ? [
              SimChoice(
                text: "Speak up: 'I actually sent that idea last Tuesday'",
                outcome:
                  "Awkward silence. Coworker says 'Oh, we were both thinking along those lines.' Boss moves on. You're labeled 'difficult' in the post-meeting chat.",
                healthDelta: -2, happinessDelta: -5, dignityDelta: 3, financeDelta: 0,
                stressDelta: 8, opportunityDelta: -5, socialDelta: -3,
                realWorldContext:
                  "Minorities who advocate for themselves are rated as 'less likeable' in workplace studies. White colleagues doing the same are rated as 'assertive.'"
              ),
              SimChoice(
                text: "Let it go, document for later",
                outcome:
                  "You swallow it. Again. Your contributions are invisible. Promotion goes to the idea-stealer next quarter.",
                healthDelta: -3, happinessDelta: -7, dignityDelta: -8, financeDelta: 0,
                stressDelta: 10, opportunityDelta: -8, socialDelta: 0,
                realWorldContext:
                  "Studies show ideas from minorities are attributed to others 2.5x more often. Over a career, this represents hundreds of thousands in lost advancement."
              ),
            ]
            : [
              SimChoice(
                text: "Thank the team, mention next steps",
                outcome:
                  "Boss pulls you aside after. 'Great initiative. Let's talk about that senior role.' Your career trajectory continues upward.",
                healthDelta: 2, happinessDelta: 5, dignityDelta: 3, financeDelta: 0,
                stressDelta: -3, opportunityDelta: 8, socialDelta: 2,
                realWorldContext:
                  "White men are promoted on potential. Women and minorities are promoted on proof. Same work, different runway."
              )
            ],
          category: .work
        ))

    case 2:  // Tuesday — School / Education
      events.append(
        SimEvent(
          title: "School Experience",
          scene: isBlack
            ? "Your kid comes home. Got detention for 'being disruptive' — they asked a question the teacher didn't like."
            : isLow
              ? "Your kid's school is underfunded. No AP classes. Textbooks from 2009. One counselor for 500 students."
              : "Your kid's school has great resources. New tech lab, college prep programs, three counselors.",
          choices: isBlack
            ? [
              SimChoice(
                text: "Go to the school to advocate",
                outcome:
                  "Principal is 'unavailable.' Secretary suggests your child 'learn to follow rules.' You miss a half-day of work — that's $60 gone.",
                healthDelta: -3, happinessDelta: -5, dignityDelta: -5, financeDelta: -60,
                stressDelta: 12, opportunityDelta: -3, socialDelta: 0,
                realWorldContext:
                  "Black students are suspended 3x more often than white students for the same behaviors. This is the school-to-prison pipeline's first stop."
              ),
              SimChoice(
                text: "Coach your kid to stay quiet and endure",
                outcome:
                  "Your child learns early: your voice doesn't matter here. Grades drop. Curiosity dies. Another bright mind dimmed by a system that sees color before character.",
                healthDelta: -5, happinessDelta: -8, dignityDelta: -10, financeDelta: 0,
                stressDelta: 8, opportunityDelta: -10, socialDelta: -3,
                realWorldContext:
                  "Teaching your child to shrink themselves for survival is a conversation most white parents never have to have."
              ),
            ]
            : isLow
              ? [
                SimChoice(
                  text: "Look into tutoring or afterschool programs",
                  outcome:
                    "Free programs have 6-month waitlists. Paid ones are $200/month you don't have. Your kid falls further behind peers in funded districts.",
                  healthDelta: -2, happinessDelta: -4, dignityDelta: -3, financeDelta: 0,
                  stressDelta: 8, opportunityDelta: -8, socialDelta: 0,
                  realWorldContext:
                    "School funding tied to property taxes means rich neighborhoods get rich schools. The zip code you're born in predicts your education quality more than your intelligence."
                )
              ]
              : [
                SimChoice(
                  text: "Help with college prep tonight",
                  outcome:
                    "Your kid has every resource. SAT tutor, extracurriculars, recommendation letters from connected parents. The system was built for them.",
                  healthDelta: 1, happinessDelta: 3, dignityDelta: 2, financeDelta: -50,
                  stressDelta: -2, opportunityDelta: 5, socialDelta: 2,
                  realWorldContext:
                    "Legacy admissions, donor preferences, and resource gaps mean 'meritocracy' often means 'whose parents had money first.'"
                )
              ],
          category: .school
        ))

    case 3:  // Wednesday — Friends / Social
      events.append(
        SimEvent(
          title: "Friends Want to Go Out",
          scene: isLow
            ? "Your friends are going out for dinner and drinks. The bill will be at least $40 per person. Your account has $\(max(0, metrics.finances))."
            : "Group chat pops off — dinner at that new spot downtown, then drinks. Everyone's in.",
          choices: isLow
            ? [
              SimChoice(
                text: "Go anyway — put it on credit",
                outcome:
                  "Great night. You laugh, you belong. Credit card balance: +$45 at 24% APR. That $45 becomes $65 by the time you pay it off. But at least you weren't alone tonight.",
                healthDelta: 2, happinessDelta: 8, dignityDelta: 3, financeDelta: -45,
                stressDelta: 5, opportunityDelta: 0, socialDelta: 8,
                realWorldContext:
                  "Poor people pay more for the same experiences. Credit card interest is a poverty tax. But isolation is its own disease."
              ),
              SimChoice(
                text: "Say you're busy (you're broke)",
                outcome:
                  "FOMO hits hard. They post stories all night. You eat ramen alone. Third time this month you've said no. Invitations will slow down — people stop asking eventually.",
                healthDelta: -2, happinessDelta: -8, dignityDelta: -5, financeDelta: 0,
                stressDelta: 8, opportunityDelta: -3, socialDelta: -10,
                realWorldContext:
                  "Social exclusion from poverty is invisible but devastating. Networks = opportunities. No network = no opportunities. Poverty isolates."
              ),
              SimChoice(
                text: "Suggest something free instead",
                outcome:
                  "One friend says yes. Others go without you. You have a decent night, but you feel the gap. The group is splitting into 'can afford' and 'can't afford.'",
                healthDelta: 0, happinessDelta: -2, dignityDelta: -2, financeDelta: 0,
                stressDelta: 3, opportunityDelta: -1, socialDelta: -3,
                realWorldContext:
                  "Friendships across income brackets erode over time. Economic segregation happens in friend groups too."
              ),
            ]
            : [
              SimChoice(
                text: "Let's go! First round's on me",
                outcome:
                  "Great night. Strong bonds. Someone mentions a job opening at their company — texts you the recruiter's name. Your network IS your net worth.",
                healthDelta: 3, happinessDelta: 8, dignityDelta: 2, financeDelta: -60,
                stressDelta: -5, opportunityDelta: 8, socialDelta: 8,
                realWorldContext:
                  "70% of jobs are filled through networking. Social capital IS economic capital. Those who can afford to socialize accumulate more opportunities."
              )
            ],
          category: .social
        ))

    case 4:  // Thursday — Housing
      events.append(
        SimEvent(
          title: "Housing Situation",
          scene: isBlack
            ? "Your landlord is 'selling the building.' Rent was $1,200. Everything in the neighborhood is now $1,800+. You have 60 days."
            : isLow
              ? "Rent increase notice: 15%. Your lease doesn't protect you. Move or pay more from money you don't have."
              : "Your mortgage payment auto-debits. You barely notice. Equity's up 12% this year. Wealth builds while you sleep.",
          choices: isBlack
            ? [
              SimChoice(
                text: "Look for a new apartment",
                outcome:
                  "Three applications denied. One landlord says 'we went with another applicant' — you hear them show the unit to a white couple the next day. Your credit score is fine. Your skin isn't.",
                healthDelta: -5, happinessDelta: -10, dignityDelta: -10, financeDelta: -200,
                stressDelta: 15, opportunityDelta: -5, socialDelta: -5,
                realWorldContext:
                  "Black renters are shown 17% fewer units than white renters. Discrimination is subtle, deniable, and devastating."
              )
            ]
            : isLow
              ? [
                SimChoice(
                  text: "Cut other expenses to cover rent",
                  outcome:
                    "No more eating out. Cancel the one streaming service. Skip the dentist. Your world shrinks to survive. This is how poverty compounds — each cut makes the next one deeper.",
                  healthDelta: -5, happinessDelta: -8, dignityDelta: -5, financeDelta: -50,
                  stressDelta: 12, opportunityDelta: -3, socialDelta: -5,
                  realWorldContext:
                    "One rent increase can trigger a cascade: skip health care → health worsens → miss work → lose income → can't pay rent. The spiral is real."
                )
              ]
              : [
                SimChoice(
                  text: "Check your home equity app",
                  outcome:
                    "Up $18,000 this year. You made money sleeping. Your parents' down payment help made this possible. Generational wealth compounds.",
                  healthDelta: 2, happinessDelta: 5, dignityDelta: 3, financeDelta: 50,
                  stressDelta: -5, opportunityDelta: 5, socialDelta: 0,
                  realWorldContext:
                    "The racial wealth gap: median white family wealth is 10x median Black family wealth. This isn't about effort — it's about which generation got to start accumulating."
                )
              ],
          category: .housing
        ))

    case 5:  // Friday — Health
      events.append(
        SimEvent(
          title: "Health Check",
          scene: isLow
            ? "You've had chest tightness for weeks. Doctor visit copay: $40. If they order tests, that's $200+ you don't have."
            : isBlack
              ? "Doctor's appointment. You describe your pain precisely. The doctor prescribes ibuprofen and says 'try to relax.' Your white friend described similar symptoms last month — got a full workup."
              : "Annual checkup. Everything's covered. Doctor spends 25 minutes with you. Orders preventive screenings. 'See you in six months.'",
          choices: isLow
            ? [
              SimChoice(
                text: "Go to the doctor",
                outcome:
                  "Tests ordered. Bill comes: $380. Payment plan at 12% interest. The stress of the bill probably causes more health damage than whatever they find.",
                healthDelta: 3, happinessDelta: -5, dignityDelta: -3, financeDelta: -380,
                stressDelta: 10, opportunityDelta: 0, socialDelta: 0,
                realWorldContext:
                  "66% of bankruptcies in America are tied to medical costs. The poorest pay the most for being sick."
              ),
              SimChoice(
                text: "Ignore it — can't afford it",
                outcome:
                  "You push through. Maybe it's nothing. Maybe it's something that gets worse for months until it becomes an ER visit that costs 10x more.",
                healthDelta: -10, happinessDelta: -3, dignityDelta: -5, financeDelta: 0,
                stressDelta: 8, opportunityDelta: 0, socialDelta: 0,
                realWorldContext:
                  "Delayed care due to cost is the #1 reason preventable conditions become fatal in low-income communities."
              ),
            ]
            : isBlack
              ? [
                SimChoice(
                  text: "Push for proper testing",
                  outcome:
                    "Doctor seems annoyed. Orders tests reluctantly. Results show something real. You were right. But the fact that you had to FIGHT for care leaves a mark.",
                  healthDelta: 5, happinessDelta: -3, dignityDelta: -5, financeDelta: -100,
                  stressDelta: 5, opportunityDelta: 0, socialDelta: 0,
                  realWorldContext:
                    "Black patients' pain is systematically undertreated. Studies show doctors perceive Black people as feeling less pain — a belief rooted in slavery-era pseudoscience."
                )
              ]
              : [
                SimChoice(
                  text: "Schedule the recommended screenings",
                  outcome:
                    "Preventive care catches everything early. You'll live longer because you can afford to. Health IS wealth — and wealth IS health.",
                  healthDelta: 5, happinessDelta: 3, dignityDelta: 2, financeDelta: -20,
                  stressDelta: -3, opportunityDelta: 2, socialDelta: 0,
                  realWorldContext:
                    "Life expectancy between the richest and poorest Americans differs by 15 years. Same country. Same species. Different access."
                )
              ],
          category: .health
        ))

    case 6:  // Saturday — Luxuries
      events.append(
        SimEvent(
          title: "Weekend — Do You Get Luxuries?",
          scene: isLow
            ? "Saturday. Your friends post brunch ($35), shopping ($100+), concert ($75). You scroll. Your account: $\(max(0, metrics.finances))."
            : "Saturday. Farmers market, new shoes, maybe a spa day. You don't check your account because you don't need to.",
          choices: isLow
            ? [
              SimChoice(
                text: "Stay home, clean, try to rest",
                outcome:
                  "You rest but the walls close in. No car to go anywhere free. Laundromat costs $8. Even being poor costs money.",
                healthDelta: 1, happinessDelta: -5, dignityDelta: -3, financeDelta: -8,
                stressDelta: 3, opportunityDelta: 0, socialDelta: -5,
                realWorldContext:
                  "'Just stay home and save' ignores that poverty is expensive. Laundry, transit, late fees, no bulk buying — being poor has a surcharge on everything."
              ),
              SimChoice(
                text: "Take a free walk in the park",
                outcome:
                  "Fresh air helps. But you pass people eating at restaurants, shopping bags swinging. The gap between your life and 'normal' is measured in every storefront you walk past.",
                healthDelta: 3, happinessDelta: -2, dignityDelta: 0, financeDelta: 0,
                stressDelta: -2, opportunityDelta: 0, socialDelta: -2,
                realWorldContext:
                  "The psychological weight of being surrounded by consumption you can't participate in is a uniquely modern form of suffering."
              ),
            ]
            : [
              SimChoice(
                text: "Treat yourself — you've earned it",
                outcome:
                  "Brunch, shopping, concert tickets. You don't think about the cost because you don't have to. THAT is the luxury nobody talks about — not thinking about money.",
                healthDelta: 3, happinessDelta: 8, dignityDelta: 3, financeDelta: -150,
                stressDelta: -8, opportunityDelta: 2, socialDelta: 5,
                realWorldContext:
                  "The greatest luxury isn't any specific purchase — it's the absence of financial anxiety. Rich people aren't 'happier' because of stuff. They're calmer because of margin."
              )
            ],
          category: .financial
        ))

    case 7:  // Sunday — Reflection + Comparison
      events.append(
        SimEvent(
          title: "End of Week — Life Quality Assessment",
          scene:
            "Seven days in someone else's life. Every choice mattered. Every bias accumulated. Every dollar counted. Let's see where you landed.",
          choices: [
            SimChoice(
              text: "See my results",
              outcome: "Your week is done. Let's measure the cost of being you in this society.",
              healthDelta: 0, happinessDelta: 0, dignityDelta: 0, financeDelta: 0, stressDelta: 0,
              opportunityDelta: 0, socialDelta: 0,
              realWorldContext:
                "This was one week. Imagine 52 of these. Then imagine a lifetime. That's what systemic means — it's not one event, it's every event, compounding."
            )
          ],
          category: .health
        ))

    default: break
    }

    return events
  }
}

// MARK: - ═══════════════════════════════════════════════════

// MAIN SIMULATION VIEW
// ═══════════════════════════════════════════════════════════

struct LifeSimulationView: View {
  @Environment(\.dismiss) var dismiss
  @StateObject private var engine = LifeSimEngine()
  @State private var phase: SimPhase = .setup
  @State private var selectedIdentity: SimIdentity = .blackMale
  @State private var selectedIncome: IncomeBracket = .low
  @State private var currentChoice: SimChoice? = nil
  @State private var showingOutcome = false
  @State private var journalText = ""

  enum SimPhase {
    case setup, playing, dayResults, weekResults, comparison
  }

  var body: some View {
    NavigationStack {
      ZStack {
        Color(red: 0.03, green: 0.03, blue: 0.08).ignoresSafeArea()

        switch phase {
        case .setup: setupView
        case .playing: gameplayView
        case .dayResults: dayResultsView
        case .weekResults: weekResultsView
        case .comparison: comparisonView
        }
      }
      .navigationTitle("")
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItem(placement: .navigationBarLeading) {
          Button {
            dismiss()
          } label: {
            Image(systemName: "xmark.circle.fill").foregroundColor(.white.opacity(0.3))
          }
        }
        ToolbarItem(placement: .principal) {
          Text("Walk A Mile").font(.system(size: 17, weight: .bold)).foregroundColor(.white)
        }
      }
    }
  }

  // MARK: - Setup

  private var setupView: some View {
    ScrollView(showsIndicators: false) {
      VStack(spacing: 20) {
        Text("CHOOSE YOUR IDENTITY").font(.system(size: 10, weight: .bold)).tracking(3)
          .foregroundColor(.cyan.opacity(0.5))
        Text("For the next 7 days,\nyou'll live as someone else.")
          .font(.system(size: 18, weight: .bold)).foregroundColor(.white).multilineTextAlignment(
            .center)
        Text("Same society. Different body.\nSee what changes.")
          .font(.system(size: 12)).foregroundColor(.white.opacity(0.4)).multilineTextAlignment(
            .center)

        // Identity grid
        LazyVGrid(
          columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())],
          spacing: 10
        ) {
          ForEach(SimIdentity.allCases) { id in
            Button {
              selectedIdentity = id
            } label: {
              VStack(spacing: 4) {
                Text(id.emoji).font(.system(size: 28))
                Text(id.rawValue).font(.system(size: 9, weight: .bold)).foregroundColor(.white)
                  .multilineTextAlignment(.center).lineLimit(2)
              }
              .frame(maxWidth: .infinity).padding(.vertical, 10)
              .background(
                RoundedRectangle(cornerRadius: 10).fill(
                  selectedIdentity == id ? Color.cyan.opacity(0.15) : Color.white.opacity(0.03)
                )
              )
              .overlay(
                RoundedRectangle(cornerRadius: 10).stroke(
                  selectedIdentity == id ? Color.cyan.opacity(0.4) : Color.white.opacity(0.05),
                  lineWidth: 1
                ))
            }
          }
        }

        // Income
        Text("INCOME BRACKET").font(.system(size: 10, weight: .bold)).tracking(2).foregroundColor(
          .white.opacity(0.3)
        ).padding(.top, 8)
        HStack(spacing: 10) {
          ForEach(IncomeBracket.allCases) { bracket in
            Button {
              selectedIncome = bracket
            } label: {
              VStack(spacing: 4) {
                Text(bracket.emoji).font(.system(size: 20))
                Text(bracket.rawValue).font(.system(size: 10, weight: .bold)).foregroundColor(
                  .white)
                Text("$\(bracket.weeklyBudget)/wk").font(.system(size: 9, weight: .medium))
                  .foregroundColor(.cyan.opacity(0.5))
              }
              .frame(maxWidth: .infinity).padding(.vertical, 10)
              .background(
                RoundedRectangle(cornerRadius: 10).fill(
                  selectedIncome == bracket ? Color.cyan.opacity(0.15) : Color.white.opacity(0.03)
                )
              )
              .overlay(
                RoundedRectangle(cornerRadius: 10).stroke(
                  selectedIncome == bracket ? Color.cyan.opacity(0.4) : Color.white.opacity(0.05),
                  lineWidth: 1
                ))
            }
          }
        }

        // Start
        Button {
          engine.startSimulation(identity: selectedIdentity, income: selectedIncome)
          phase = .playing
        } label: {
          HStack(spacing: 8) {
            Image(systemName: "play.fill")
            Text("BEGIN SIMULATION").font(.system(size: 14, weight: .bold))
          }
          .foregroundColor(.black).frame(maxWidth: .infinity).padding(.vertical, 14)
          .background(Capsule().fill(Color.cyan))
        }
        .padding(.top, 10)

        Spacer(minLength: 40)
      }
      .padding(20)
    }
  }

  // MARK: - Gameplay

  private var gameplayView: some View {
    let events = engine.eventsForDay(engine.currentDay)
    let event = engine.currentEventIndex < events.count ? events[engine.currentEventIndex] : nil

    return ScrollView(showsIndicators: false) {
      VStack(spacing: 16) {
        // Day header
        HStack {
          Text("DAY \(engine.currentDay)").font(.system(size: 10, weight: .bold)).tracking(2)
            .foregroundColor(.cyan)
          Spacer()
          Text("\(engine.identity.emoji) \(engine.identity.rawValue)").font(
            .system(size: 11, weight: .bold)
          ).foregroundColor(.white)
          Text("$\(max(0, engine.metrics.finances))").font(
            .system(size: 12, weight: .bold, design: .monospaced)
          )
          .foregroundColor(engine.metrics.finances > 0 ? .green : .red)
        }

        // Metrics bar
        metricsBar

        if let event = event {
          if !showingOutcome {
            // Scene
            VStack(alignment: .leading, spacing: 10) {
              HStack(spacing: 6) {
                Image(systemName: event.category.icon).foregroundColor(event.category.color)
                Text(event.title).font(.system(size: 14, weight: .bold)).foregroundColor(.white)
              }
              Text(event.scene).font(.system(size: 13, weight: .medium)).foregroundColor(
                .white.opacity(0.7)
              ).lineSpacing(4)
            }
            .padding(14).background(
              RoundedRectangle(cornerRadius: 14).fill(Color.white.opacity(0.03)))

            // Choices
            ForEach(event.choices) { choice in
              Button {
                currentChoice = choice
                engine.applyChoice(choice)
                showingOutcome = true
              } label: {
                Text(choice.text).font(.system(size: 13, weight: .bold)).foregroundColor(.white)
                  .frame(maxWidth: .infinity, alignment: .leading).padding(12)
                  .background(
                    RoundedRectangle(cornerRadius: 10).fill(event.category.color.opacity(0.08))
                      .overlay(
                        RoundedRectangle(cornerRadius: 10).stroke(
                          event.category.color.opacity(0.15), lineWidth: 1)))
              }
            }
          } else if let choice = currentChoice {
            // Outcome
            VStack(alignment: .leading, spacing: 10) {
              Text(choice.outcome).font(.system(size: 13, weight: .medium)).foregroundColor(
                .white.opacity(0.7)
              ).lineSpacing(4)

              // Impact
              HStack(spacing: 8) {
                impactBadge("Health", choice.healthDelta, .green)
                impactBadge("Dignity", choice.dignityDelta, .blue)
                impactBadge("Stress", choice.stressDelta, .red)
                impactBadge("Money", choice.financeDelta, Color(red: 1.0, green: 0.85, blue: 0.3))
              }

              // Real world context
              HStack(alignment: .top, spacing: 6) {
                Image(systemName: "info.circle.fill").font(.system(size: 10)).foregroundColor(.cyan)
                Text(choice.realWorldContext).font(.system(size: 10, weight: .medium))
                  .foregroundColor(.cyan.opacity(0.7)).lineSpacing(2)
              }
              .padding(8).background(
                RoundedRectangle(cornerRadius: 8).fill(Color.cyan.opacity(0.04)))
            }
            .padding(14).background(
              RoundedRectangle(cornerRadius: 14).fill(Color.white.opacity(0.03)))

            Button {
              showingOutcome = false
              currentChoice = nil
              if engine.currentEventIndex < events.count - 1 {
                engine.currentEventIndex += 1
              } else {
                if engine.currentDay < 7 {
                  engine.advanceDay()
                } else {
                  engine.generateComparison()
                  phase = .weekResults
                }
              }
            } label: {
              Text(engine.currentDay == 7 ? "See Week Results" : "Continue")
                .font(.system(size: 14, weight: .bold)).foregroundColor(.black)
                .frame(maxWidth: .infinity).padding(.vertical, 12)
                .background(Capsule().fill(Color.cyan))
            }
          }
        }

        Spacer(minLength: 40)
      }
      .padding(20)
    }
  }

  private var metricsBar: some View {
    HStack(spacing: 0) {
      metricCell("❤️", "\(engine.metrics.health)", engine.metrics.health > 50 ? .green : .red)
      metricCell(
        "😊", "\(engine.metrics.happiness)", engine.metrics.happiness > 50 ? .green : .orange)
      metricCell("👑", "\(engine.metrics.dignity)", engine.metrics.dignity > 50 ? .blue : .red)
      metricCell("😰", "\(engine.metrics.stress)", engine.metrics.stress < 40 ? .green : .red)
      metricCell(
        "🌐", "\(engine.metrics.socialLife)", engine.metrics.socialLife > 40 ? .green : .orange)
    }
    .padding(8).background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.03)))
  }

  private func metricCell(_ icon: String, _ value: String, _ color: Color) -> some View {
    VStack(spacing: 1) {
      Text(icon).font(.system(size: 12))
      Text(value).font(.system(size: 11, weight: .bold)).foregroundColor(color)
    }
    .frame(maxWidth: .infinity)
  }

  private func impactBadge(_ label: String, _ delta: Int, _ color: Color) -> some View {
    HStack(spacing: 2) {
      Text(delta > 0 ? "+\(delta)" : "\(delta)").font(.system(size: 10, weight: .bold))
        .foregroundColor(
          label == "Stress" ? (delta > 0 ? .red : .green) : (delta > 0 ? .green : .red))
    }
    .padding(.horizontal, 6).padding(.vertical, 3)
    .background(Capsule().fill(color.opacity(0.1)))
  }

  // MARK: - Day Results (unused in this flow, available for expansion)

  private var dayResultsView: some View {
    EmptyView()
  }

  // MARK: - Week Results

  private var weekResultsView: some View {
    ScrollView(showsIndicators: false) {
      VStack(spacing: 16) {
        Text("YOUR WEEK AS \(engine.identity.rawValue.uppercased())")
          .font(.system(size: 10, weight: .bold)).tracking(2).foregroundColor(.cyan.opacity(0.5))

        Text("Life Quality: \(engine.metrics.overallQuality)/100")
          .font(.system(size: 28, weight: .black))
          .foregroundColor(
            engine.metrics.overallQuality > 60
              ? .green : engine.metrics.overallQuality > 35 ? .orange : .red)

        Text("Projected Life Expectancy: \(engine.metrics.lifeExpectancy) years")
          .font(.system(size: 13, weight: .bold)).foregroundColor(.white.opacity(0.5))

        // Metrics breakdown
        VStack(spacing: 6) {
          metricRow("Health", engine.metrics.health, .green)
          metricRow("Happiness", engine.metrics.happiness, .yellow)
          metricRow("Dignity", engine.metrics.dignity, .blue)
          metricRow("Stress", engine.metrics.stress, .red)
          metricRow("Opportunities", engine.metrics.opportunities, .purple)
          metricRow("Social Life", engine.metrics.socialLife, .cyan)
          metricRow(
            "Finances", max(0, min(100, engine.metrics.finances / 5)),
            Color(red: 1.0, green: 0.85, blue: 0.3))
        }
        .padding(14).background(RoundedRectangle(cornerRadius: 14).fill(Color.white.opacity(0.03)))

        Button {
          phase = .comparison
        } label: {
          HStack(spacing: 8) {
            Image(systemName: "arrow.left.arrow.right")
            Text("NOW REPLAY AS WHITE MAN / MIDDLE INCOME").font(.system(size: 12, weight: .bold))
          }
          .foregroundColor(.black).frame(maxWidth: .infinity).padding(.vertical, 14)
          .background(Capsule().fill(Color.cyan))
        }

        Spacer(minLength: 40)
      }
      .padding(20)
    }
  }

  // MARK: - Comparison

  private var comparisonView: some View {
    ScrollView(showsIndicators: false) {
      VStack(spacing: 16) {
        Text("SIDE BY SIDE").font(.system(size: 10, weight: .bold)).tracking(3).foregroundColor(
          .cyan.opacity(0.5))
        Text("Same society. Different body.")
          .font(.system(size: 18, weight: .bold)).foregroundColor(.white)

        if let comp = engine.comparisonMetrics {
          HStack(spacing: 12) {
            // You
            VStack(spacing: 6) {
              Text(engine.identity.emoji).font(.system(size: 28))
              Text(engine.identity.rawValue).font(.system(size: 10, weight: .bold)).foregroundColor(
                .white)
              Text("\(engine.metrics.overallQuality)/100")
                .font(.system(size: 22, weight: .black))
                .foregroundColor(engine.metrics.overallQuality > 50 ? .orange : .red)
              Text("Life: \(engine.metrics.lifeExpectancy)y").font(.system(size: 10))
                .foregroundColor(.white.opacity(0.4))
            }
            .frame(maxWidth: .infinity).padding(12)
            .background(RoundedRectangle(cornerRadius: 12).fill(Color.red.opacity(0.05)))

            Text("vs").font(.system(size: 12, weight: .bold)).foregroundColor(.white.opacity(0.3))

            // White Male
            VStack(spacing: 6) {
              Text("👨🏻").font(.system(size: 28))
              Text("White Man").font(.system(size: 10, weight: .bold)).foregroundColor(.white)
              Text("\(comp.overallQuality)/100")
                .font(.system(size: 22, weight: .black)).foregroundColor(.green)
              Text("Life: \(comp.lifeExpectancy)y").font(.system(size: 10)).foregroundColor(
                .white.opacity(0.4))
            }
            .frame(maxWidth: .infinity).padding(12)
            .background(RoundedRectangle(cornerRadius: 12).fill(Color.green.opacity(0.05)))
          }

          // Detailed comparison
          VStack(spacing: 4) {
            compRow("Health", engine.metrics.health, comp.health)
            compRow("Happiness", engine.metrics.happiness, comp.happiness)
            compRow("Dignity", engine.metrics.dignity, comp.dignity)
            compRow("Stress", engine.metrics.stress, comp.stress)
            compRow("Opportunities", engine.metrics.opportunities, comp.opportunities)
            compRow("Social Life", engine.metrics.socialLife, comp.socialLife)
            compRow("$ Remaining", max(0, engine.metrics.finances), max(0, comp.finances))
          }
          .padding(14).background(
            RoundedRectangle(cornerRadius: 14).fill(Color.white.opacity(0.03)))

          Text(
            "Same effort. Same intelligence. Same humanity.\nDifferent body. Different outcome.\nThat's what systemic means."
          )
          .font(.system(size: 13, weight: .bold)).foregroundColor(.white.opacity(0.6))
          .multilineTextAlignment(.center).lineSpacing(4).padding(.vertical, 8)
        }

        // Journal
        VStack(alignment: .leading, spacing: 6) {
          Text("REFLECTION").font(.system(size: 10, weight: .bold)).tracking(1).foregroundColor(
            .cyan.opacity(0.5))
          Text("What surprised you? What felt unfair? What would you want changed?")
            .font(.system(size: 11)).foregroundColor(.white.opacity(0.4))
          TextEditor(text: $journalText).frame(minHeight: 80).scrollContentBackground(.hidden)
            .font(.system(size: 13)).foregroundColor(.white)
            .padding(10).background(
              RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.04)))
        }

        Button {
          dismiss()
        } label: {
          Text("Return to Unlearn Module").font(.system(size: 14, weight: .bold))
            .foregroundColor(.black).frame(maxWidth: .infinity).padding(.vertical, 12)
            .background(Capsule().fill(Color.cyan))
        }

        Spacer(minLength: 40)
      }
      .padding(20)
    }
  }

  private func metricRow(_ label: String, _ value: Int, _ color: Color) -> some View {
    HStack {
      Text(label).font(.system(size: 12, weight: .medium)).foregroundColor(.white.opacity(0.5))
        .frame(width: 90, alignment: .leading)
      GeometryReader { geo in
        ZStack(alignment: .leading) {
          RoundedRectangle(cornerRadius: 3).fill(Color.white.opacity(0.05)).frame(height: 8)
          RoundedRectangle(cornerRadius: 3).fill(color)
            .frame(width: geo.size.width * CGFloat(max(0, min(value, 100))) / 100, height: 8)
        }
      }.frame(height: 8)
      Text("\(value)").font(.system(size: 11, weight: .bold)).foregroundColor(color).frame(
        width: 30)
    }
  }

  private func compRow(_ label: String, _ yours: Int, _ theirs: Int) -> some View {
    HStack(spacing: 8) {
      Text(label).font(.system(size: 10, weight: .medium)).foregroundColor(.white.opacity(0.4))
        .frame(width: 80, alignment: .leading)
      Text("\(yours)").font(.system(size: 11, weight: .bold))
        .foregroundColor(
          label == "Stress" ? (yours < theirs ? .green : .red) : (yours > theirs ? .green : .red)
        )
        .frame(width: 35)
      Text("vs").font(.system(size: 8)).foregroundColor(.white.opacity(0.2))
      Text("\(theirs)").font(.system(size: 11, weight: .bold))
        .foregroundColor(
          label == "Stress" ? (theirs < yours ? .green : .blue) : (theirs > yours ? .green : .blue)
        )
        .frame(width: 35)
      let diff = label == "Stress" ? theirs - yours : yours - theirs
      Text(diff > 0 ? "" : "\(abs(diff)) gap").font(.system(size: 9, weight: .bold))
        .foregroundColor(diff < 0 ? .red : .green)
    }
  }
}
