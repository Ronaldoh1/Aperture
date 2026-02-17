// HakaiMatrixLiesView.swift
// 破壊 HAKAI: Matrix Lies - Unprogramming the Societal Deceptions
// Comprehensive database of lies we've been programmed to believe
// "You're the visionary hacker - debugging the simulation"

import SwiftUI

// MARK: - Models

struct MatrixLie: Identifiable, Codable {
  var id = UUID()
  let lie: String
  let category: MatrixLieCategory
  let whyPerpetruated: String
  let exposure: String
  let escapeHack: String
  let severity: Int  // 1-5 (how deeply programmed)
  let whoBenefits: [String]
  let dragonComment: String

  enum CodingKeys: String, CodingKey {
    case lie, category, whyPerpetruated, exposure, escapeHack, severity, whoBenefits, dragonComment
  }
}

enum MatrixLieCategory: String, CaseIterable, Codable {
  case education = "Education"
  case health = "Health"
  case work = "Work"
  case life = "Life"
  case love = "Love"
  case food = "Food"
  case drinks = "Drinks"
  case social = "Social"
  case ego = "Ego"
  case financial = "Financial"
  case media = "Media"
  case racism = "Racism"
  case environmental = "Environmental"
  case foreignAffairs = "Foreign Affairs"
  case investment = "Investment"
  case retirement = "Retirement"
  case manipulation = "Manipulation"
  case economic = "Economic"

  var icon: String {
    switch self {
    case .education: return "graduationcap.fill"
    case .health: return "heart.fill"
    case .work: return "briefcase.fill"
    case .life: return "figure.stand"
    case .love: return "heart.circle.fill"
    case .food: return "fork.knife"
    case .drinks: return "cup.and.saucer.fill"
    case .social: return "person.3.fill"
    case .ego: return "brain.head.profile"
    case .financial: return "dollarsign.circle.fill"
    case .media: return "tv.fill"
    case .racism: return "person.fill.xmark"
    case .environmental: return "leaf.fill"
    case .foreignAffairs: return "globe.americas.fill"
    case .investment: return "chart.line.uptrend.xyaxis"
    case .retirement: return "figure.walk"
    case .manipulation: return "theatermasks.fill"
    case .economic: return "building.columns.fill"
    }
  }

  var color: Color {
    switch self {
    case .education: return .blue
    case .health: return .red
    case .work: return .orange
    case .life: return .green
    case .love: return .pink
    case .food: return .yellow
    case .drinks: return .cyan
    case .social: return .purple
    case .ego: return .indigo
    case .financial: return .green
    case .media: return .gray
    case .racism: return .red
    case .environmental: return Color(red: 0.2, green: 0.6, blue: 0.3)
    case .foreignAffairs: return Color(red: 0.3, green: 0.4, blue: 0.7)
    case .investment: return Color(red: 0.9, green: 0.7, blue: 0.1)
    case .retirement: return Color(red: 0.5, green: 0.3, blue: 0.7)
    case .manipulation: return Color(red: 0.8, green: 0.2, blue: 0.4)
    case .economic: return Color(red: 0.4, green: 0.5, blue: 0.6)
    }
  }

  var subtitle: String {
    switch self {
    case .education: return "The Factory Model Myth"
    case .health: return "The Wellness Industrial Complex"
    case .work: return "The Hustle Grind Illusion"
    case .life: return "The 'Happily Ever After' Script"
    case .love: return "The Fairy Tale Trap"
    case .food: return "The 'Healthy' Label Scam"
    case .drinks: return "The Hydration & Buzz Hype"
    case .social: return "The Facade Game"
    case .ego: return "The Inner Saboteur"
    case .financial: return "The Debt & Wealth Mirage"
    case .media: return "The Narrative Spin Cycle"
    case .racism: return "The Systemic Rootkit"
    case .environmental: return "The Greenwashing Grid"
    case .foreignAffairs: return "The Geopolitical Smoke Screen"
    case .investment: return "The Wall Street Casino"
    case .retirement: return "The Golden Years Mirage"
    case .manipulation: return "The Mind Control Playbook"
    case .economic: return "The Invisible Hand Job"
    }
  }
}

// MARK: - Lies Database

enum MatrixLiesDatabase {
  static let allLies: [MatrixLie] =
    educationLies + healthLies + workLies + lifeLies + loveLies + foodLies + drinkLies + socialLies
    + egoLies + financialLies + mediaLies + racismLies + environmentalLies + foreignAffairsLies
    + investmentLies + retirementLies + manipulationLies + economicLies

  // MARK: - Education

  static let educationLies: [MatrixLie] = [
    MatrixLie(
      lie: "Standardized tests accurately measure intelligence and school quality",
      category: .education,
      whyPerpetruated:
        "Justifies funding cuts, rankings, and a competitive system that benefits testing companies and politicians pushing 'accountability' agendas.",
      exposure:
        "Tests ignore creativity, emotional intelligence, and real-world skills. They're biased by socioeconomic factors and don't predict life success.",
      escapeHack:
        "Focus on lifelong learning—read widely, pursue passions via online courses. Question metrics; build critical thinking to spot systemic flaws.",
      severity: 4,
      whoBenefits: [
        "Testing companies (Pearson, College Board)", "Politicians pushing 'accountability'",
        "Elite schools that game the system",
      ],
      dragonComment:
        "They measure your ability to regurgitate, not to think. A fish judged by its tree-climbing gets a failing grade."
    ),

    MatrixLie(
      lie: "A college degree guarantees a good job and financial stability",
      category: .education,
      whyPerpetruated:
        "Universities and lenders profit from tuition debt; society equates credentials with worth to maintain class hierarchies.",
      exposure:
        "Many graduates are underemployed; skills gaps persist. Trade jobs often out-earn degrees without the debt.",
      escapeHack:
        "Prioritize value over prestige—vet programs for ROI. Learn via free resources like Khan Academy. Network for real opportunities.",
      severity: 5,
      whoBenefits: [
        "Universities ($1.7T student debt)", "Student loan lenders",
        "Corporate HR departments (easy filtering)",
      ],
      dragonComment:
        "The degree is a receipt, not a guarantee. They sold you a lottery ticket and called it a career."
    ),

    MatrixLie(
      lie: "Education is about facts and memorization, not self-discovery",
      category: .education,
      whyPerpetruated:
        "Produces compliant workers, not free thinkers. Easier to control via rote learning than empowering curiosity.",
      exposure:
        "True education fosters awareness; modern systems prioritize utility over understanding human potential.",
      escapeHack:
        "Journal reflections on lessons. Seek mentors. Integrate mindfulness to align learning with your inner 'why.' Turn knowledge into wisdom.",
      severity: 4,
      whoBenefits: [
        "Corporations needing compliant workers", "Governments maintaining status quo",
        "Textbook publishers",
      ],
      dragonComment:
        "They taught you WHAT to think, not HOW to think. The unexamined education is not worth having."
    ),
  ]

  // MARK: - Health

  static let healthLies: [MatrixLie] = [
    MatrixLie(
      lie: "You need 8 glasses of water a day for optimal health",
      category: .health,
      whyPerpetruated: "Bottled water industry hype. Simplifies hydration to sell products.",
      exposure: "Needs vary by activity, diet, and climate. Overhydration can dilute electrolytes.",
      escapeHack:
        "Listen to your body—thirst is a reliable cue. Track intake, include hydrating foods like fruits.",
      severity: 2,
      whoBenefits: ["Bottled water industry ($350B)", "Supplement makers (electrolyte products)"],
      dragonComment:
        "Your body has survived millions of years without a Nalgene. Trust its signals."
    ),

    MatrixLie(
      lie: "Eggs (or carbs/fats) are inherently bad for you",
      category: .health,
      whyPerpetruated: "Diet fads and food lobbies shift blame to single items for quick sales.",
      exposure:
        "Balanced intake matters. Eggs provide nutrients without raising heart risk in moderation.",
      escapeHack:
        "Adopt evidence-based eating (Mediterranean diet). Consult professionals, ignore trends—focus on whole foods.",
      severity: 3,
      whoBenefits: [
        "Cereal industry (anti-egg campaigns)", "Diet book authors",
        "Low-fat product manufacturers",
      ],
      dragonComment:
        "They demonize whole foods while selling you processed garbage. Follow the money, not the headlines."
    ),

    MatrixLie(
      lie: "Natural remedies are always safe and effective",
      category: .health,
      whyPerpetruated:
        "Supplement industry exploits 'natural' appeal for unregulated profits ($50B+ market).",
      exposure:
        "Many lack evidence; interactions with medications can harm. 'Natural' includes arsenic and poison ivy.",
      escapeHack:
        "Research via PubMed. Use herbs as adjuncts, not cures. Prioritize lifestyle: sleep, movement, stress reduction.",
      severity: 3,
      whoBenefits: [
        "Supplement industry (largely unregulated)", "Wellness influencers",
        "MLM companies (essential oils, etc.)",
      ],
      dragonComment: "Hemlock is natural. So is uranium. 'Natural' is not a synonym for 'safe.'"
    ),
  ]

  // MARK: - Work

  static let workLies: [MatrixLie] = [
    MatrixLie(
      lie: "Hard work alone guarantees success and promotion",
      category: .work,
      whyPerpetruated:
        "Corporations encourage overwork to maximize output without fair pay. Maintains illusion of meritocracy.",
      exposure:
        "Bias, politics, and luck play bigger roles. Many toil without advancement while connected mediocrity rises.",
      escapeHack:
        "Build leverage—network strategically, upskill in high-demand areas. Set boundaries; redefine success as impact + balance.",
      severity: 5,
      whoBenefits: [
        "Corporations (free overtime)", "Those born into networks", "The already-privileged",
      ],
      dragonComment:
        "The hardest workers are often the poorest. The richest often work the least. Hard work is necessary but not sufficient."
    ),

    MatrixLie(
      lie: "Deception (inflating accomplishments) is normal for career gain",
      category: .work,
      whyPerpetruated:
        "Competitive cultures reward 'winners' at any cost. Normalizes CYA lies and self-promotion over substance.",
      exposure:
        "It erodes trust and leads to organizational fragmentation. Ethical paths build lasting networks.",
      escapeHack:
        "Practice transparency—own mistakes, seek win-wins. Use 360 feedback to align perception with reality.",
      severity: 3,
      whoBenefits: [
        "Sociopaths climbing ladders", "PR/spin industries", "Resume padding services",
      ],
      dragonComment:
        "The best performers rarely need to advertise. Competence speaks; incompetence promotes."
    ),

    MatrixLie(
      lie: "Job security comes from loyalty to one employer",
      category: .work,
      whyPerpetruated:
        "Companies foster dependence to retain cheap labor. Benefits employer loyalty without reciprocation.",
      exposure:
        "Mass layoffs prove otherwise. Average tenure is 4 years. Companies have no loyalty to you.",
      escapeHack:
        "Diversify skills/portfolio. Treat career as a lattice, not ladder. Build a personal brand beyond any employer.",
      severity: 4,
      whoBenefits: [
        "Corporations (cheap retention)", "HR departments", "The 'company man' mythology",
      ],
      dragonComment:
        "They'll fire you via email while posting 'family values' on LinkedIn. Loyalty is a one-way street."
    ),
  ]

  // MARK: - Life

  static let lifeLies: [MatrixLie] = [
    MatrixLie(
      lie: "Happiness comes from money, status, or external achievements",
      category: .life,
      whyPerpetruated:
        "Consumerism drives economies. Media glorifies wealth. Keeps you chasing external validation.",
      exposure:
        "Beyond $75K, more money doesn't boost joy. Internal factors like gratitude, purpose, and connection do.",
      escapeHack:
        "Cultivate inner wealth—meditate, journal wins. Frame life as growth: transform chaos into clarity via systems.",
      severity: 5,
      whoBenefits: [
        "Advertising industry ($700B)", "Luxury brands", "Social media (engagement = envy)",
      ],
      dragonComment:
        "The billionaire and the monk have the same 24 hours. One is usually happier. Guess which."
    ),

    MatrixLie(
      lie: "Follow society's script (job, marriage, kids) for fulfillment",
      category: .life,
      whyPerpetruated:
        "Maintains social order. Challenges to the script threaten norms and make others question their choices.",
      exposure:
        "Many regret the default path. Happiness varies by individual purpose. The script serves society, not you.",
      escapeHack:
        "Design YOUR blueprint—question 'shoulds,' experiment boldly. Synthesize: What augments YOUR potential?",
      severity: 5,
      whoBenefits: [
        "Wedding industry ($76B)", "Real estate (suburban homes)",
        "Those who followed it and need validation",
      ],
      dragonComment:
        "They gave you a paint-by-numbers and called it 'your life.' The canvas is blank. Create."
    ),

    MatrixLie(
      lie: "Unhappiness is failure; life should be constant positivity",
      category: .life,
      whyPerpetruated:
        "Social media filters reality. Suppresses growth through adversity. Sells 'happiness products.'",
      exposure:
        "Hardships build resilience. Balance includes processing lows. 'Toxic positivity' denies authentic experience.",
      escapeHack:
        "Embrace duality—use tools for shadow integration. Humor it: 'Even universes expand through dark matter.'",
      severity: 4,
      whoBenefits: ["Self-help industry", "Pharma (mood medications)", "Motivational speakers"],
      dragonComment:
        "A sword is forged in fire, not comfort. Your darkness is not a bug—it's a feature."
    ),
  ]

  // MARK: - Love

  static let loveLies: [MatrixLie] = [
    MatrixLie(
      lie: "True love is effortless and conquers all",
      category: .love,
      whyPerpetruated:
        "Hollywood sells escapism. Avoids teaching relationship skills. Romanticizes dysfunction.",
      exposure:
        "Healthy bonds require work. Unresolved issues don't magically resolve. 'Effortless' usually means 'avoiding.'",
      escapeHack:
        "Invest in communication—use frameworks like Gottman methods. See love as co-creation, not destiny.",
      severity: 4,
      whoBenefits: [
        "Romance movie industry", "Wedding industrial complex",
        "Divorce lawyers (when fantasy fails)",
      ],
      dragonComment:
        "Love is a verb, not a feeling. The feeling comes and goes; the verb is a choice."
    ),

    MatrixLie(
      lie: "Jealousy means deep love",
      category: .love,
      whyPerpetruated: "Media dramatizes possession as passion. Confuses control with care.",
      exposure:
        "Jealousy is insecurity and fear, not love. Trust fosters real intimacy; jealousy destroys it.",
      escapeHack:
        "Build self-worth independently. Practice vulnerability. Note triggers for reflection and healing.",
      severity: 4,
      whoBenefits: [
        "Drama entertainment", "Those who confuse intensity with depth", "Controlling partners",
      ],
      dragonComment:
        "Jealousy is not 'I love you too much.' It's 'I trust you too little.' Different energy."
    ),

    MatrixLie(
      lie: "Love heals all wounds",
      category: .love,
      whyPerpetruated:
        "Avoids personal accountability. Sells 'soulmate' myths. Makes partners responsible for your healing.",
      exposure:
        "Partners aren't therapists. Self-healing comes first. Expecting others to fix you destroys relationships.",
      escapeHack:
        "Therapy for your shadows first. Choose partners as amplifiers, not saviors. Heal yourself, then share.",
      severity: 4,
      whoBenefits: ["Codependency patterns", "Those avoiding inner work", "Romance mythology"],
      dragonComment:
        "You can't pour from an empty cup, and you can't receive healing you haven't done yourself."
    ),
  ]

  // MARK: - Food

  static let foodLies: [MatrixLie] = [
    MatrixLie(
      lie: "'All natural' means healthy and unprocessed",
      category: .food,
      whyPerpetruated: "Marketers exploit vagueness for premium pricing. No legal definition.",
      exposure:
        "No regulation. Can include added sugars, additives, and processed ingredients. 'Natural flavors' are chemicals.",
      escapeHack:
        "Read ingredients first—ignore front labels. Shop edges of stores for whole foods.",
      severity: 3,
      whoBenefits: [
        "Food manufacturers (higher margins)", "Marketing agencies",
        "Grocery stores (premium sections)",
      ],
      dragonComment:
        "'Natural' is the most unnatural word in the supermarket. It means nothing legally."
    ),

    MatrixLie(
      lie: "Organic is always better for you and the environment",
      category: .food,
      whyPerpetruated: "Higher margins for producers. Greenwashing. Exploits consumer guilt.",
      exposure:
        "May use more land/water resources. Nutrition is similar. 'Organic' pesticides exist.",
      escapeHack:
        "Prioritize local/seasonal. Know dirty dozen vs. clean fifteen. Grow your own for true control.",
      severity: 3,
      whoBenefits: [
        "Organic food industry", "Whole Foods/premium grocers", "Organic certification bodies",
      ],
      dragonComment: "Organic junk food is still junk food. An organic Oreo is not health food."
    ),

    MatrixLie(
      lie: "Low-fat products aid weight loss",
      category: .food,
      whyPerpetruated:
        "1980s fat-phobia sells products. Manufacturers add sugar to compensate for taste.",
      exposure:
        "Healthy fats are essential. Low-fat often means high-sugar. The obesity epidemic rose WITH low-fat trends.",
      escapeHack:
        "Balance macros. Focus on quality fats (olive oil, avocado, nuts). Read labels for added sugars.",
      severity: 4,
      whoBenefits: [
        "Sugar industry (blamed fat instead)", "Low-fat product manufacturers", "Diet industry",
      ],
      dragonComment:
        "They removed the fat that satisfies you and added sugar that addicts you. Brilliant scam."
    ),
  ]

  // MARK: - Drinks

  static let drinkLies: [MatrixLie] = [
    MatrixLie(
      lie: "Alcohol in moderation is healthy (e.g., red wine for heart)",
      category: .drinks,
      whyPerpetruated:
        "Industry lobbies fund studies. Social normalization. 'French Paradox' marketing.",
      exposure:
        "ANY amount raises cancer risk. No safe level according to WHO. Resveratrol benefits require impossible wine quantities.",
      escapeHack:
        "Mocktails for rituals. Track effects with wearables to see sleep/recovery impacts.",
      severity: 4,
      whoBenefits: [
        "Alcohol industry ($1.5T)", "Wine industry ('health halo')", "Hospitality/social venues",
      ],
      dragonComment:
        "They told you poison was medicine because they profit from your 'moderate' addiction."
    ),

    MatrixLie(
      lie: "Energy drinks boost performance without harm",
      category: .drinks,
      whyPerpetruated:
        "Caffeine/sugar combo creates quick perceived effect. Extreme sports marketing.",
      exposure:
        "Crashes follow spikes. Heart strain documented. Not sustainable energy—borrowed from future you.",
      escapeHack:
        "Natural boosts like green tea (L-theanine smooths caffeine). Prioritize sleep for real energy.",
      severity: 3,
      whoBenefits: [
        "Energy drink companies (Red Bull, Monster)", "Convenience stores",
        "Extreme sports marketing",
      ],
      dragonComment:
        "You're not tired because you lack Red Bull. You're tired because you lack sleep."
    ),

    MatrixLie(
      lie: "Sports drinks are essential for workouts",
      category: .drinks,
      whyPerpetruated:
        "Branding as 'elite fuel.' Sponsorships create association with performance.",
      exposure:
        "Mostly sugar water. Water suffices for workouts under 90 minutes. Elite athletes have different needs than you.",
      escapeHack:
        "Electrolytes from food (bananas, salt). Coconut water if needed. Water for most activities.",
      severity: 2,
      whoBenefits: [
        "Gatorade/Powerade (PepsiCo/Coca-Cola)", "Sports leagues (sponsorships)",
        "Gyms (vending machines)",
      ],
      dragonComment:
        "Gatorade was made for Florida football players in extreme heat. You're on a treadmill in AC."
    ),
  ]

  // MARK: - Social

  static let socialLies: [MatrixLie] = [
    MatrixLie(
      lie: "White lies are harmless and necessary for harmony",
      category: .social,
      whyPerpetruated:
        "Avoids conflict. Societal 'politeness' norms. Short-term comfort over long-term trust.",
      exposure:
        "Builds patterns of distrust. 'Prosocial' lies fragment relationships when discovered or overused.",
      escapeHack:
        "Practice kind honesty. Set boundaries for deeper bonds. Truth with compassion, not brutal honesty.",
      severity: 3,
      whoBenefits: [
        "Conflict-avoiders", "Surface-level relationships", "Those uncomfortable with authenticity",
      ],
      dragonComment:
        "Small lies are practice for big lies. And the person you lie to most is yourself."
    ),

    MatrixLie(
      lie: "Social media reflects real life and connections",
      category: .social,
      whyPerpetruated:
        "Platforms profit from engagement. Users curate for validation. Comparison drives consumption.",
      exposure:
        "Curated illusions breed envy. True ties need offline effort. 'Friends' online ≠ friends in life.",
      escapeHack:
        "Curate feeds mindfully. Prioritize in-person rituals. Use social media as tool, not reality.",
      severity: 5,
      whoBenefits: [
        "Social media platforms ($200B+)", "Influencers", "Advertisers", "Your insecurities",
      ],
      dragonComment:
        "You're comparing your behind-the-scenes to everyone's highlight reel. The game is rigged."
    ),

    MatrixLie(
      lie: "Popularity equals worth",
      category: .social,
      whyPerpetruated:
        "Evolutionary survival instincts. Media amplifies. Metrics gamify social value.",
      exposure:
        "Shallow networks provide shallow support. Quality over quantity for fulfillment. Popularity is not love.",
      escapeHack:
        "Nurture a few deep relationships. Use vulnerability to filter authentic connections.",
      severity: 4,
      whoBenefits: [
        "Popularity economy (influencers)", "Social platforms (engagement)",
        "Those who peaked in high school",
      ],
      dragonComment:
        "You can have a million followers and zero people who'd help you move. Choose depth."
    ),
  ]

  // MARK: - Ego

  static let egoLies: [MatrixLie] = [
    MatrixLie(
      lie: "You're not enough without external validation",
      category: .ego,
      whyPerpetruated:
        "Society ties worth to achievements. Creates consumers who buy to fill the void.",
      exposure:
        "Inherent value exists independent of accomplishment. Ego protects via comparison, not truth.",
      escapeHack:
        "Affirmations + evidence. Meditate to observe ego thoughts as thoughts, not truth.",
      severity: 5,
      whoBenefits: [
        "Advertising industry", "Social comparison platforms", "Achievement-industrial complex",
      ],
      dragonComment:
        "You were born worthy. Everything since has been programming to make you forget."
    ),

    MatrixLie(
      lie: "Control everything to avoid failure",
      category: .ego,
      whyPerpetruated:
        "Fear-based programming. Ego avoids vulnerability. Illusion of safety through control.",
      exposure:
        "Life's unpredictable. Surrender fosters flow. Control is often just anxiety in a suit.",
      escapeHack:
        "Focus on responses, not outcomes. Journal control illusions. Practice radical acceptance.",
      severity: 4,
      whoBenefits: [
        "Anxiety-driven productivity culture", "Control-based parenting",
        "Perfectionism industries",
      ],
      dragonComment:
        "The tighter you grip, the more slips through your fingers. The paradox of control."
    ),

    MatrixLie(
      lie: "Ego is your true self",
      category: .ego,
      whyPerpetruated:
        "Cultural individualism. Hides deeper essence. Makes identity a product to sell.",
      exposure:
        "Ego is constructed—true self is awareness beyond it. You are not your thoughts or identity.",
      escapeHack:
        "Mindfulness practices. Question 'I am' labels. Recognize ego as useful fiction, not truth.",
      severity: 5,
      whoBenefits: [
        "Consumer identity marketing", "Those profiting from your insecurities",
        "The matrix itself",
      ],
      dragonComment:
        "You are not your job title, your follower count, or your trauma. You are the awareness watching all of it."
    ),
  ]

  // MARK: - Financial

  static let financialLies: [MatrixLie] = [
    MatrixLie(
      lie: "National debt is a household-like crisis we must 'pay off'",
      category: .financial,
      whyPerpetruated:
        "Politicians scare for austerity. Hides fiat currency power. Justifies cutting social programs.",
      exposure:
        "Governments create money (MMT). Focus should be on investment and inflation, not deficit fear.",
      escapeHack:
        "Learn MMT basics. Vote for policies aiding people over cuts. Understand monetary sovereignty.",
      severity: 4,
      whoBenefits: [
        "Austerity politicians", "Those wanting to cut social programs", "Deficit hawks",
      ],
      dragonComment:
        "They told you the country is broke while printing trillions for banks. Notice that."
    ),

    MatrixLie(
      lie: "Carrying a credit card balance improves your credit score",
      category: .financial,
      whyPerpetruated:
        "Credit issuers profit from interest. Perpetuates debt cycles under guise of 'building credit.'",
      exposure:
        "Actually hurts by raising utilization ratios. Paying in full shows responsibility without extra costs.",
      escapeHack: "Automate full payments. Track via apps. Treat credit as tool, not trap.",
      severity: 4,
      whoBenefits: ["Credit card companies (interest income)", "Banks", "Credit score mythology"],
      dragonComment:
        "They make money when you owe money. Of course they want you to carry a balance."
    ),

    MatrixLie(
      lie: "Investing is only for the wealthy",
      category: .financial,
      whyPerpetruated:
        "Gatekeeps wealth-building. Financial advisors historically catered to high-net-worth.",
      exposure:
        "Fractional shares start at $1. Compounding works for small sums over time. Index funds require no expertise.",
      escapeHack:
        "Start micro—index funds via robo-advisors. Automate investments. Time in market > timing market.",
      severity: 4,
      whoBenefits: [
        "Financial advisors (high minimums)", "Banks (savings accounts)",
        "Those who want wealth gap",
      ],
      dragonComment:
        "They kept the wealth-building tools behind velvet ropes. The ropes are gone. Walk through."
    ),

    MatrixLie(
      lie: "All debt is bad and should be avoided",
      category: .financial,
      whyPerpetruated:
        "Fear sells financial products. Ignores strategic use for growth and leverage.",
      exposure:
        "'Good debt' like mortgages or business loans can build assets. It's about ROI, not blanket avoidance.",
      escapeHack:
        "Debt-snowball for bad debt. Leverage good debt wisely. Understand the difference.",
      severity: 3,
      whoBenefits: [
        "Financial fear industry", "Those who've never used leverage", "Dave Ramsey (sometimes)",
      ],
      dragonComment:
        "The wealthy use debt as a tool. The poor are taught to fear it. Interesting, isn't it?"
    ),

    MatrixLie(
      lie: "Black buying power alone solves inequality",
      category: .financial,
      whyPerpetruated:
        "Diverts from systemic racism. Promotes consumerism as activism. Feels actionable without threatening power.",
      exposure:
        "Wealth gaps persist regardless of spending. Power needs policy change, not just purchase decisions.",
      escapeHack:
        "Build community wealth—co-ops, investments, land ownership. Educate on real economic levers.",
      severity: 4,
      whoBenefits: [
        "Corporations wanting Black dollars", "Those avoiding systemic change",
        "Consumerism-as-activism narrative",
      ],
      dragonComment:
        "Spending money at a different store while living in a rigged economy is rearranging deck chairs."
    ),
  ]

  // MARK: - Media

  static let mediaLies: [MatrixLie] = [
    MatrixLie(
      lie: "Mainstream media is objective and unbiased",
      category: .media,
      whyPerpetruated:
        "Maintains credibility for profit-driven outlets. Hides corporate ownership and advertiser influence.",
      exposure:
        "Six conglomerates control 90% of US media. Biases show in selective coverage and framing.",
      escapeHack:
        "Cross-reference with indie sources (ProPublica, The Intercept). Curate a 'truth feed' via RSS—diversify like a portfolio.",
      severity: 5,
      whoBenefits: ["Media conglomerates", "Advertisers", "Status quo power structures"],
      dragonComment:
        "They're not lying to you—they're selling you. Ads pay the bills; truth doesn't."
    ),

    MatrixLie(
      lie: "Fake news and media hoaxes are a modern phenomenon",
      category: .media,
      whyPerpetruated:
        "Blames tech for systemic issues. Distracts from historical propaganda. Makes it seem solvable by banning.",
      exposure:
        "Deceptions date back centuries (yellow journalism, 1898 Spanish-American War hype). Social media just amplifies existing patterns.",
      escapeHack:
        "Fact-check via FactCheck.org or Snopes. Pause before sharing—ask, 'Does this augment or obfuscate?'",
      severity: 3,
      whoBenefits: [
        "Those who want to control 'approved' information", "Platforms (engagement)", "Politicians",
      ],
      dragonComment: "Propaganda is ancient. The medium changed. The manipulation didn't."
    ),

    MatrixLie(
      lie: "Media portrayals of beauty and success are realistic",
      category: .media,
      whyPerpetruated:
        "Drives consumerism. Ads sell 'fixes' for induced insecurities. Creates perpetual inadequacy.",
      exposure:
        "Photoshopped ideals distort reality. Linked to mental health issues. Models don't look like models.",
      escapeHack:
        "Consume mindfully—follow diverse creators. Journal 'media mirrors' to reflect true self vs. scripted ideals.",
      severity: 5,
      whoBenefits: [
        "Beauty industry ($500B)", "Fashion industry", "Cosmetic surgery", "Insecurity economy",
      ],
      dragonComment: "They profit from your self-hatred. Loving yourself is a revolutionary act."
    ),

    MatrixLie(
      lie: "Social media deception is mostly harmless",
      category: .media,
      whyPerpetruated:
        "Platforms profit from engagement. Normalizes filters and facades. 'Everyone does it.'",
      exposure:
        "From deepfakes to astroturfing, it erodes societal trust and polarizes communities. Information warfare is real.",
      escapeHack: "Verify sources. Use reverse image search. Assume manipulation until verified.",
      severity: 4,
      whoBenefits: [
        "Bad actors (state and corporate)", "Engagement-driven platforms", "Grifters and scammers",
      ],
      dragonComment:
        "Your feed is a battlefield. Every scroll is a choice of what reality to accept."
    ),
  ]

  // MARK: - Racism

  static let racismLies: [MatrixLie] = [
    MatrixLie(
      lie: "Race is a biological reality with inherent differences",
      category: .racism,
      whyPerpetruated:
        "Justifies inequality. Rooted in pseudoscience for colonialism and slavery. Maintains hierarchy.",
      exposure:
        "Genetically, humans are 99.9% identical. 'Races' are social constructs with no biological basis. More genetic variation within groups than between.",
      escapeHack:
        "Read genetics primers (e.g., 'How to Argue with a Racist'). View humanity as a spectrum—diversity augments, doesn't divide.",
      severity: 5,
      whoBenefits: [
        "White supremacy systems", "Those benefiting from hierarchy", "Colonial legacy maintenance",
      ],
      dragonComment: "Race was invented to justify theft. It's not biology—it's a business model."
    ),

    MatrixLie(
      lie: "White privilege doesn't exist or is exaggerated",
      category: .racism,
      whyPerpetruated:
        "Avoids accountability. Frames success as pure meritocracy. Protects comfort of the privileged.",
      exposure:
        "Systemic advantages in housing, education, policing persist. History of policies like redlining prove structural bias.",
      escapeHack:
        "Acknowledge via resources like 'White Fragility.' Listen to diverse stories. See equity as collective self-actualization.",
      severity: 5,
      whoBenefits: [
        "Those who benefit from current system", "Meritocracy mythology", "Status quo maintenance",
      ],
      dragonComment: "Privilege is invisible to those who have it. That's the whole point."
    ),

    MatrixLie(
      lie: "We're in a post-racial society where racism is solved",
      category: .racism,
      whyPerpetruated:
        "Comforts the privileged. Ignores ongoing disparities. 'We had Obama' as proof.",
      exposure:
        "Stats show persistent gaps: Black wealth 1/10th White, incarceration rates, health outcomes. Events like 2020 protests highlight reality.",
      escapeHack:
        "Engage history (1619 Project). Support policies addressing roots. Forward-view: Build inclusive systems.",
      severity: 5,
      whoBenefits: [
        "Those who want to stop talking about race", "Status quo beneficiaries",
        "Colorblind mythology",
      ],
      dragonComment:
        "Declaring victory doesn't end a war. It just lets you stop fighting while the other side doesn't."
    ),

    MatrixLie(
      lie: "The 'model minority' myth—some groups succeed due to innate traits",
      category: .racism,
      whyPerpetruated:
        "Pits minorities against each other. Diverts from systemic racism. Implies 'pull yourself up' works for all.",
      exposure:
        "Ignores intra-group disparities (Bhutanese poverty vs. Japanese success). Rooted in 1960s anti-Black narratives during civil rights era.",
      escapeHack:
        "Dismantle via aggregated data (AAPIData stats). Amplify diverse stories. Recognize the wedge being driven.",
      severity: 4,
      whoBenefits: [
        "White supremacy (division tool)", "Those denying systemic racism", "Meritocracy mythology",
      ],
      dragonComment:
        "The 'model minority' is a weapon pointed at other minorities. Don't be the gun."
    ),

    MatrixLie(
      lie: "Colorblindness ('I don't see race') ends racism",
      category: .racism,
      whyPerpetruated:
        "Evades uncomfortable truths. Pretends neutrality. Feels virtuous without action.",
      exposure:
        "Ignores real impacts. 'Race-neutral' policies perpetuate inequality. Not seeing race means not seeing racism.",
      escapeHack:
        "Embrace anti-racism—see differences, address inequities. Colorblindness is not the goal; equity is.",
      severity: 4,
      whoBenefits: [
        "Those uncomfortable with race conversations", "Status quo",
        "Those wanting to feel good without acting",
      ],
      dragonComment: "If you don't see race, you don't see racism. And that's exactly the point."
    ),

    MatrixLie(
      lie: "Model minorities don't face racism or need support",
      category: .racism,
      whyPerpetruated:
        "Reinforces colorblindness. Justifies neglecting policies for Asian Americans.",
      exposure:
        "Harms mental health by internalizing pressure. Overlooks anti-Asian hate spikes (COVID era). Erases real discrimination.",
      escapeHack:
        "Journal internalized myths. Join coalitions like AAPI advocacy groups. Share diverse Asian experiences.",
      severity: 4,
      whoBenefits: [
        "Those cutting support programs", "Model minority promoters",
        "Divide-and-conquer strategists",
      ],
      dragonComment:
        "The 'successful' minority is still a minority. The cage is gilded, but it's still a cage."
    ),

    MatrixLie(
      lie: "Black communities rely on welfare due to laziness ('welfare queen' myth)",
      category: .racism,
      whyPerpetruated:
        "Shifts blame from economic policies to individuals. Fuels anti-poverty program cuts. Reagan-era propaganda.",
      exposure:
        "Most welfare recipients are white. Disparities stem from redlining, job discrimination, generational wealth theft.",
      escapeHack:
        "Fact-check via Census data. Support universal basic income pilots. Challenge lazy stereotypes with structural analysis.",
      severity: 5,
      whoBenefits: [
        "Politicians cutting social programs", "Those avoiding systemic accountability",
        "Racial resentment exploiters",
      ],
      dragonComment: "They stole the wealth, then blamed you for being poor. Classic abuser logic."
    ),

    MatrixLie(
      lie: "Latinos are inherently criminal or 'taking jobs'",
      category: .racism,
      whyPerpetruated:
        "Justifies immigration crackdowns. Distracts from labor exploitation. Scapegoating for economic anxiety.",
      exposure:
        "Undocumented immigrants commit fewer crimes than citizens. They fill essential roles without displacing natives. Net positive economic contribution.",
      escapeHack:
        "Read immigrant economic studies. Volunteer with border aid organizations. Challenge xenophobic narratives.",
      severity: 5,
      whoBenefits: [
        "Anti-immigrant politicians", "Private prison industry", "Those exploiting cheap labor",
      ],
      dragonComment:
        "They want the labor but not the laborer. They want the food but not the farmer."
    ),
  ]

  // MARK: - Environmental (NEW)

  static let environmentalLies: [MatrixLie] = [
    MatrixLie(
      lie: "Climate change science is uncertain or a hoax",
      category: .environmental,
      whyPerpetruated:
        "Fossil fuel giants delay regulations. Funds denial campaigns for profits. Decades of intentional misinformation.",
      exposure:
        "97%+ scientist consensus. Human activity drives warming via CO2 data. ExxonMobil knew in 1977 and buried it.",
      escapeHack:
        "Follow IPCC reports. Cut carbon via EV/renewables switch. Divest from fossil fuels.",
      severity: 5,
      whoBenefits: [
        "Fossil fuel companies ($5.9T in subsidies)", "Koch brothers network",
        "Climate denial think tanks",
      ],
      dragonComment: "They knew. They lied. They profited. Now we all pay. The receipts exist."
    ),

    MatrixLie(
      lie: "Recycling alone solves plastic pollution",
      category: .environmental,
      whyPerpetruated:
        "Shifts blame to consumers. Oil companies push 'recyclable' labels. Avoids producer responsibility.",
      exposure:
        "Only 9% recycled globally. Most ends in landfills/oceans. Recycling was a PR campaign by plastic makers.",
      escapeHack:
        "Reduce single-use plastics. Lobby for producer responsibility laws. Support plastic bans.",
      severity: 4,
      whoBenefits: [
        "Plastic/oil industry", "Companies avoiding accountability", "Feel-good environmentalism",
      ],
      dragonComment:
        "They sold you the problem and the fake solution. Recycling is their get-out-of-jail card."
    ),

    MatrixLie(
      lie: "'Green' products are always eco-friendly (greenwashing)",
      category: .environmental,
      whyPerpetruated:
        "Boosts sales with vague claims. Unregulated marketing. Exploits environmental guilt.",
      exposure:
        "Many hide supply chain harms (palm oil deforestation). 'Eco' labels often meaningless. Carbon offsets rarely work.",
      escapeHack:
        "Check certifications (Fair Trade, B Corp). Use apps like Good On You. Research actual practices.",
      severity: 4,
      whoBenefits: [
        "Corporate greenwashers", "Marketing agencies", "Companies avoiding real change",
      ],
      dragonComment:
        "Green packaging on a destructive product is like a murderer wearing a peace sign."
    ),

    MatrixLie(
      lie: "Electric vehicles are zero-emission miracles",
      category: .environmental,
      whyPerpetruated:
        "Auto industry hype. Ignores battery mining impacts. Simplifies complex lifecycle analysis.",
      exposure:
        "Lifecycle emissions lower but not zero. Cobalt mining exploits workers and environments. Grid still often fossil-powered.",
      escapeHack:
        "Opt for public transit when possible. Demand ethical sourcing. Support grid decarbonization.",
      severity: 3,
      whoBenefits: [
        "EV manufacturers", "Lithium/cobalt mining companies", "Tech optimism narratives",
      ],
      dragonComment: "Better is not the same as good. EVs are a step, not the destination."
    ),

    MatrixLie(
      lie: "Individual action alone can solve climate change",
      category: .environmental,
      whyPerpetruated:
        "Deflects from corporate responsibility. 100 companies cause 71% of emissions. Keeps you guilt-focused instead of system-focused.",
      exposure:
        "Personal carbon footprint concept was BP propaganda. Systemic change requires policy. Individual action matters but isn't sufficient.",
      escapeHack:
        "Vote climate. Organize collectively. Pressure corporations and governments. Individual AND systemic action.",
      severity: 4,
      whoBenefits: [
        "Polluting corporations", "Politicians avoiding regulation",
        "Those profiting from status quo",
      ],
      dragonComment:
        "They convinced you to feel guilty about straws while they burned the planet. Clever misdirection."
    ),

    MatrixLie(
      lie: "Technology will save us without lifestyle changes",
      category: .environmental,
      whyPerpetruated:
        "Maintains consumption economy. Tech optimism delays action. 'Future tech' as excuse for present inaction.",
      exposure:
        "Carbon capture at scale doesn't exist yet. Geoengineering has massive risks. We have the tech now—it's political will missing.",
      escapeHack:
        "Demand proven solutions now. Support degrowth economics. Question techno-salvation narratives.",
      severity: 4,
      whoBenefits: [
        "Tech companies promising futures", "Those avoiding present sacrifice",
        "Growth-at-all-costs ideology",
      ],
      dragonComment:
        "Waiting for a tech savior is like waiting for the fire department while holding a hose."
    ),
  ]

  // MARK: - Foreign Affairs (NEW)

  static let foreignAffairsLies: [MatrixLie] = [
    MatrixLie(
      lie: "Threats to global order come only from 'rogue' states",
      category: .foreignAffairs,
      whyPerpetruated:
        "Blames externals. Ignores internal decays like inequality. Justifies military spending.",
      exposure:
        "Liberal order erodes from within (US populism, inequality). 'Rogue states' often created by Western intervention.",
      escapeHack:
        "Read diverse international relations sources. Track domestic-foreign links. Question 'good guys vs. bad guys' framing.",
      severity: 4,
      whoBenefits: [
        "Military-industrial complex", "Interventionist politicians", "Defense contractors",
      ],
      dragonComment:
        "The call is coming from inside the house. The 'threats' are often our own chickens roosting."
    ),

    MatrixLie(
      lie: "The US always promotes democracy abroad",
      category: .foreignAffairs,
      whyPerpetruated:
        "Justifies interventions. Hides self-interest. Maintains 'shining city on hill' mythology.",
      exposure:
        "Supported dictators (Saudi Arabia, Pinochet, Shah of Iran). Overthrew democracies (Iran 1953, Guatemala 1954, Chile 1973). Actions contradict rhetoric.",
      escapeHack:
        "Study declassified history (CIA coups). Support transparent foreign aid. Question intervention narratives.",
      severity: 5,
      whoBenefits: [
        "Military-industrial complex", "Oil and resource companies", "Geopolitical strategists",
      ],
      dragonComment:
        "Democracy promotion is often code for 'governments that do what we want.' Read the receipts."
    ),

    MatrixLie(
      lie: "International law binds all nations equally",
      category: .foreignAffairs,
      whyPerpetruated:
        "Upholds 'rules-based order' facade. Legitimizes power imbalances. Makes might look like right.",
      exposure:
        "Power imbalances persist. UN veto system skews enforcement. US withdrew from ICC. Rules apply differently to different nations.",
      escapeHack:
        "Follow ICJ cases. Advocate for UN reforms. Support accountability for all nations.",
      severity: 4,
      whoBenefits: [
        "Powerful nations (P5 veto holders)", "International law violators with power",
        "Rules-for-thee narratives",
      ],
      dragonComment:
        "International law is a suggestion for the powerful and a command for the weak."
    ),

    MatrixLie(
      lie: "Democracies never go to war with each other",
      category: .foreignAffairs,
      whyPerpetruated:
        "Promotes liberal peace theory. Justifies democracy promotion. Simplifies complex geopolitics.",
      exposure:
        "Exceptions exist (covert operations count). Definition games exclude inconvenient wars. Economic ties matter more than regime type.",
      escapeHack:
        "Cross-check theories with data. Prioritize diplomacy over ideology. Study exceptions to rules.",
      severity: 3,
      whoBenefits: [
        "Democracy-promotion industry", "Interventionists", "Ideological foreign policy makers",
      ],
      dragonComment:
        "Democracies don't war openly—they coup, sanction, and destabilize. Different verbs, same violence."
    ),

    MatrixLie(
      lie: "Sanctions only hurt bad leaders, not ordinary people",
      category: .foreignAffairs,
      whyPerpetruated:
        "Makes sanctions seem humane. Avoids accountability for civilian suffering. 'Targeted' sanctions as PR.",
      exposure:
        "Broad sanctions devastate economies (Iraq, Venezuela, Iran). Medicine and food shortages kill civilians. Leaders often insulated.",
      escapeHack:
        "Research sanction impacts. Support humanitarian exemptions. Question collective punishment.",
      severity: 4,
      whoBenefits: [
        "Those avoiding military intervention optics", "Sanctions-as-warfare proponents",
        "Leaders who can blame external enemies",
      ],
      dragonComment:
        "Starving children to pressure dictators who eat caviar. That's the sanctions logic."
    ),
  ]

  // MARK: - Investment (NEW)

  static let investmentLies: [MatrixLie] = [
    MatrixLie(
      lie: "You can time the market consistently",
      category: .investment,
      whyPerpetruated:
        "Sells trading platforms, newsletters, and courses. Creates dependency on 'experts.' Gambling dressed as strategy.",
      exposure:
        "Even professionals fail. Missing 10 best days over 20 years cuts returns by 50%. Time IN market beats timing market.",
      escapeHack:
        "Dollar-cost average into index funds. Ignore market noise. Stay invested through volatility.",
      severity: 4,
      whoBenefits: ["Trading platforms (fees)", "Financial media (clicks)", "Day trading gurus"],
      dragonComment:
        "If anyone could time the market consistently, they wouldn't sell you a course—they'd be on a yacht."
    ),

    MatrixLie(
      lie: "Actively managed funds beat index funds",
      category: .investment,
      whyPerpetruated:
        "Justifies high management fees. Keeps financial advisor industry alive. 'Expert' mythology.",
      exposure:
        "Over 90% of active funds underperform indexes over 15 years. Fees compound negatively. Index funds won.",
      escapeHack:
        "Buy low-cost index funds (VTI, VOO). Check expense ratios. Fire expensive advisors.",
      severity: 4,
      whoBenefits: [
        "Fund managers ($100B+ in fees)", "Financial advisors", "Active trading platforms",
      ],
      dragonComment: "They charge 1% to underperform free indexes. The math doesn't lie—they do."
    ),

    MatrixLie(
      lie: "Crypto is guaranteed to make you rich",
      category: .investment,
      whyPerpetruated:
        "Early adopters need new buyers. Exchanges profit from trading. FOMO drives speculation.",
      exposure:
        "Extreme volatility. Many lose everything. Scams rampant. Not 'investing'—speculation at best.",
      escapeHack:
        "Only invest what you can lose completely. Understand the tech before buying. Avoid meme coins.",
      severity: 5,
      whoBenefits: [
        "Early crypto holders", "Exchanges (trading fees)", "Influencers paid to pump",
      ],
      dragonComment:
        "For every crypto millionaire, there are thousands of people who lost rent money. Survivorship bias is real."
    ),

    MatrixLie(
      lie: "Real estate always goes up",
      category: .investment,
      whyPerpetruated:
        "Real estate industry profits from transactions. Banks profit from mortgages. 'Safe as houses' mythology.",
      exposure:
        "2008 proved otherwise. Local markets crash. Illiquid asset. Maintenance, taxes, and time costs ignored.",
      escapeHack:
        "Calculate true costs (maintenance, taxes, opportunity cost). Consider REITs for exposure. Don't overextend.",
      severity: 4,
      whoBenefits: [
        "Real estate agents (commissions)", "Banks (mortgage interest)", "Property developers",
      ],
      dragonComment:
        "2008 called. Your 'safe investment' became a foreclosure crisis. History has receipts."
    ),

    MatrixLie(
      lie: "You need to pick stocks to build wealth",
      category: .investment,
      whyPerpetruated:
        "Creates trading activity (fees). Makes investing seem skill-based. Hero stories of big winners.",
      exposure:
        "Most individual stock pickers underperform. Diversification wins. One bad pick can devastate concentrated portfolios.",
      escapeHack:
        "Total market index funds. Don't try to find the next Amazon. Diversify globally.",
      severity: 3,
      whoBenefits: ["Brokerage platforms", "Stock-picking gurus", "Financial media (content)"],
      dragonComment:
        "You're competing against algorithms with PhDs. Buy the whole market and go live your life."
    ),

    MatrixLie(
      lie: "Gold is the best hedge against everything",
      category: .investment,
      whyPerpetruated:
        "Gold dealers have high markups. Fear-based marketing. 'Collapse' narratives sell precious metals.",
      exposure:
        "Gold underperforms stocks long-term. Doesn't produce income. Storage costs. Poor inflation hedge historically.",
      escapeHack:
        "Small allocation if desired (5%). TIPS for inflation. Diversify hedges. Question collapse narratives.",
      severity: 3,
      whoBenefits: [
        "Gold dealers (high spreads)", "Doomsday marketers", "Fear-based financial media",
      ],
      dragonComment:
        "If civilization collapses, you can't eat gold. And if it doesn't, stocks beat gold."
    ),

    MatrixLie(
      lie: "You're too young to worry about investing",
      category: .investment,
      whyPerpetruated:
        "Keeps young people consuming instead of building wealth. Delays wealth accumulation. 'Live now' culture.",
      exposure:
        "Compound interest favors early starters exponentially. $100/month at 22 beats $300/month at 35. Time is the asset.",
      escapeHack:
        "Start with $1 if needed. Automate investments. Your 20s are your wealth superpower.",
      severity: 4,
      whoBenefits: [
        "Consumer economy", "Credit card companies", "Those who benefit from wealth inequality",
      ],
      dragonComment:
        "Every year you delay, you're paying a tax to your future self. Compound interest doesn't wait."
    ),
  ]

  // MARK: - Retirement (NEW)

  static let retirementLies: [MatrixLie] = [
    MatrixLie(
      lie: "Social Security will be there for you",
      category: .retirement,
      whyPerpetruated:
        "Politicians avoid hard conversations. Delays reform. 'Don't worry' messaging easier than solutions.",
      exposure:
        "Trust fund projected to run short by 2034. Benefits may be cut 23% without reform. Younger generations face uncertainty.",
      escapeHack:
        "Plan as if Social Security is a bonus, not the plan. Max retirement accounts. Advocate for reform.",
      severity: 4,
      whoBenefits: [
        "Politicians avoiding reform", "Those who'll be gone when it fails",
        "Status quo maintenance",
      ],
      dragonComment: "It's a Ponzi scheme that works until it doesn't. Have a backup plan."
    ),

    MatrixLie(
      lie: "You need $1 million to retire",
      category: .retirement,
      whyPerpetruated:
        "Creates anxiety (financial advisor dependency). One-size-fits-all ignores reality. Keeps you working longer.",
      exposure:
        "Depends entirely on lifestyle and location. $500K in low-cost area may suffice. $2M in NYC may not. Calculate YOUR number.",
      escapeHack:
        "Use the 4% rule as starting point. Calculate actual expenses. Consider geographic arbitrage.",
      severity: 3,
      whoBenefits: [
        "Financial advisors", "Fear-based retirement industry", "Those selling retirement products",
      ],
      dragonComment:
        "Your number depends on YOUR life. A millionaire in Manhattan is middle class. Do your own math."
    ),

    MatrixLie(
      lie: "You should pay off your mortgage before retiring",
      category: .retirement,
      whyPerpetruated:
        "Emotional peace of mind marketed. Ignores opportunity cost. 'Debt-free' as moral imperative.",
      exposure:
        "Low-interest debt may be worth keeping. Invested money may grow faster than mortgage rate. Flexibility matters.",
      escapeHack:
        "Compare mortgage rate to expected investment returns. Keep liquidity. No universal right answer.",
      severity: 2,
      whoBenefits: [
        "Debt-free ideology", "Those who've already done it", "Simple narrative preference",
      ],
      dragonComment:
        "A 3% mortgage while markets return 7% is arbitrage. Math doesn't care about your feelings."
    ),

    MatrixLie(
      lie: "Medicare will cover all your health costs",
      category: .retirement,
      whyPerpetruated:
        "Avoids planning complexity. 'Government will handle it' comfort. Delays hard conversations.",
      exposure:
        "Medicare covers about 60%. Supplemental insurance needed. Dental, vision, hearing often excluded. Long-term care not covered.",
      escapeHack:
        "Budget for supplemental coverage. Consider long-term care insurance. Health savings accounts.",
      severity: 4,
      whoBenefits: [
        "Those avoiding planning conversations", "Politicians avoiding healthcare debate",
        "Simplistic retirement narratives",
      ],
      dragonComment: "Medicare is the floor, not the ceiling. The gaps can bankrupt you."
    ),

    MatrixLie(
      lie: "You'll spend less in retirement",
      category: .retirement,
      whyPerpetruated:
        "Justifies under-saving. 'Lifestyle downgrade' assumption. Makes current spending easier to justify.",
      exposure:
        "Healthcare costs rise dramatically. Travel and hobbies cost money. First decade often MORE expensive. Inflation compounds.",
      escapeHack:
        "Plan for 80-100% of pre-retirement expenses. Build in healthcare inflation. Have buffer for early active years.",
      severity: 3,
      whoBenefits: [
        "Those justifying current spending", "Financial products requiring less saving",
        "Optimism bias",
      ],
      dragonComment:
        "You'll have more time and less income. Time is expensive to fill. Do the real math."
    ),

    MatrixLie(
      lie: "Age 65 is the right retirement age",
      category: .retirement,
      whyPerpetruated:
        "Arbitrary historical standard. Keeps workforce productive longer. Social Security full benefits benchmark.",
      exposure:
        "Life expectancy and health vary wildly. FIRE movement proves early retirement possible. Some love working longer. YOUR choice.",
      escapeHack:
        "Calculate your financial independence number. Consider phased retirement. Design YOUR timeline.",
      severity: 3,
      whoBenefits: [
        "Employers keeping experienced workers", "Social Security system",
        "Traditional career path narrative",
      ],
      dragonComment: "65 was set when life expectancy was 62. The math has changed. Have you?"
    ),

    MatrixLie(
      lie: "Your pension is guaranteed",
      category: .retirement,
      whyPerpetruated: "Employer retention tool. Avoids anxiety. Legal protections seem solid.",
      exposure:
        "Private pensions can be underfunded. Companies go bankrupt. Public pensions face funding crises. PBGC has limits.",
      escapeHack:
        "Don't rely solely on pension. Diversify retirement income. Monitor pension fund health.",
      severity: 4,
      whoBenefits: [
        "Employers with underfunded pensions", "Those avoiding hard conversations",
        "Pension fund managers",
      ],
      dragonComment: "A promise is only as good as the promiser. Have a Plan B."
    ),
  ]

  // MARK: - Manipulation (NEW)

  static let manipulationLies: [MatrixLie] = [
    MatrixLie(
      lie: "You're too smart to be manipulated",
      category: .manipulation,
      whyPerpetruated:
        "Pride prevents defenses. Intellectuals especially vulnerable. Confidence creates blind spots.",
      exposure:
        "Intelligence doesn't protect against manipulation—awareness does. Smart people are targeted more. Cognitive biases affect everyone.",
      escapeHack: "Study manipulation tactics. Assume you're vulnerable. Verify before trusting.",
      severity: 5,
      whoBenefits: [
        "Manipulators targeting the confident", "Those exploiting intellectual pride",
        "Con artists",
      ],
      dragonComment: "The smartest mark is the one who thinks they can't be conned. That's the con."
    ),

    MatrixLie(
      lie: "If it's on the news, it must be important",
      category: .manipulation,
      whyPerpetruated:
        "News sells attention, not importance. Outrage drives engagement. 'Newsworthy' means profitable.",
      exposure:
        "News prioritizes drama over significance. Local crime covered over systemic issues. Attention ≠ importance.",
      escapeHack:
        "Ask: 'Will this matter in a year?' Curate information diet. Seek slow journalism.",
      severity: 4,
      whoBenefits: [
        "Media companies (engagement)", "Advertisers", "Those distracting from real issues",
      ],
      dragonComment:
        "The news tells you what to think about, not what's important. There's a difference."
    ),

    MatrixLie(
      lie: "Authority figures have your best interest at heart",
      category: .manipulation,
      whyPerpetruated:
        "Maintains social order. Easier to follow than question. Trust is default programming.",
      exposure:
        "Authorities have their own interests. Institutions protect themselves. Expertise in one area doesn't transfer to others.",
      escapeHack:
        "Verify claims regardless of source. Ask who benefits. Respect expertise, question authority.",
      severity: 4,
      whoBenefits: ["Authority figures", "Institutions", "Those who benefit from compliance"],
      dragonComment:
        "A white coat or a title doesn't make someone honest. Trust must be earned, not assumed."
    ),

    MatrixLie(
      lie: "Consensus means truth",
      category: .manipulation,
      whyPerpetruated:
        "Social proof exploited. Easier than individual research. Manufactured consensus possible.",
      exposure:
        "History full of wrong consensus (flat earth, bloodletting). Consensus can be manufactured. Appeal to popularity is fallacy.",
      escapeHack:
        "Examine evidence directly. Understand consensus can shift. Distinguish scientific from social consensus.",
      severity: 4,
      whoBenefits: [
        "Consensus manufacturers", "Those benefiting from current beliefs", "Conformity enforcers",
      ],
      dragonComment:
        "Everyone believing something doesn't make it true. Everyone once believed the sun revolved around Earth."
    ),

    MatrixLie(
      lie: "Emotions are irrational and should be suppressed",
      category: .manipulation,
      whyPerpetruated:
        "Disconnected people are easier to control. Suppression creates dysfunction. 'Logic' as manipulation tool.",
      exposure:
        "Emotions are data. Suppression causes problems. Emotional intelligence crucial for decisions. Heart and head work together.",
      escapeHack:
        "Feel emotions fully. Use them as information. Integrate emotional and rational processing.",
      severity: 4,
      whoBenefits: [
        "Those who exploit emotional suppression", "Manipulators using 'logic'",
        "Systems requiring compliant workers",
      ],
      dragonComment:
        "They taught you emotions are weakness so they could exploit them. Emotions are wisdom your body knows."
    ),

    MatrixLie(
      lie: "If you question this, you're crazy/conspiracy theorist",
      category: .manipulation,
      whyPerpetruated:
        "Shuts down inquiry. Labels replace arguments. Social pressure enforces compliance.",
      exposure:
        "Ad hominem attacks signal weak arguments. 'Conspiracy theorist' weaponized to dismiss legitimate questions. Question ≠ belief.",
      escapeHack:
        "Notice when labels replace arguments. Distinguish questions from conclusions. Maintain intellectual courage.",
      severity: 5,
      whoBenefits: ["Those avoiding scrutiny", "Power structures", "Narrative controllers"],
      dragonComment:
        "When they attack you instead of your question, the question is usually worth asking."
    ),

    MatrixLie(
      lie: "There's no agenda behind this",
      category: .manipulation,
      whyPerpetruated:
        "Hides motives. Creates trust through naivety. 'Just sharing information' facade.",
      exposure:
        "Everything has an agenda—even good things. Invisible agendas are most dangerous. Funding sources reveal motives.",
      escapeHack: "Always ask: Who benefits? Who funds this? What's not being said?",
      severity: 4,
      whoBenefits: [
        "Hidden agenda holders", "Astroturfing operations",
        "Those who benefit from perceived neutrality",
      ],
      dragonComment:
        "Everyone has an agenda. The honest ones tell you theirs. The dangerous ones claim neutrality."
    ),

    MatrixLie(
      lie: "You need to pick a side (false dichotomy)",
      category: .manipulation,
      whyPerpetruated:
        "Simplifies complex issues for control. Creates tribal loyalty. Prevents nuanced thinking.",
      exposure:
        "Most issues have more than two sides. Forced choices often false. Nuance is strength, not weakness.",
      escapeHack:
        "Question binary frames. Look for third options. Hold contradictions without resolving them.",
      severity: 5,
      whoBenefits: [
        "Political parties", "Media (conflict drives engagement)",
        "Those who benefit from division",
      ],
      dragonComment:
        "Two doors both lead to the same room. They just want you to pick one so you stop looking for the window."
    ),
  ]

  // MARK: - Economic (NEW)

  static let economicLies: [MatrixLie] = [
    MatrixLie(
      lie: "The economy is too complex for ordinary people to understand",
      category: .economic,
      whyPerpetruated:
        "Gatekeeps power. Creates expert dependency. Hides simple extraction mechanisms.",
      exposure:
        "Core concepts are simple: who produces, who takes, who decides. Complexity is often intentional obscurantism.",
      escapeHack: "Learn basic economics. Follow the money. Ask who benefits from complexity.",
      severity: 4,
      whoBenefits: [
        "Economists with jobs", "Those hiding simple truths", "Financial industry gatekeepers",
      ],
      dragonComment:
        "It's not complicated: Labor creates value. Capital extracts it. The formulas just hide that."
    ),

    MatrixLie(
      lie: "Trickle-down economics works",
      category: .economic,
      whyPerpetruated:
        "Justifies tax cuts for wealthy. Sounds plausible. Delays accountability (always 'almost working').",
      exposure:
        "40 years of data show wealth concentrates, doesn't trickle. Tax cuts mostly captured at top. Middle class stagnant since 1980.",
      escapeHack:
        "Demand direct investment. Support worker-owned enterprises. Vote economic policy based on data, not promises.",
      severity: 5,
      whoBenefits: [
        "Wealthy individuals", "Corporations seeking tax cuts",
        "Politicians funded by wealthy donors",
      ],
      dragonComment:
        "They've been promising trickle-down for 40 years. Still waiting. Maybe the trickle was the con."
    ),

    MatrixLie(
      lie: "GDP growth means everyone is better off",
      category: .economic,
      whyPerpetruated:
        "Simple metric for complex reality. Hides distribution issues. Politicians can claim success.",
      exposure:
        "GDP can grow while median wages stagnate. Doesn't measure wellbeing, inequality, or sustainability. Billionaire gains inflate GDP.",
      escapeHack:
        "Track median wages, not averages. Look at distribution. Consider alternative metrics like genuine progress indicator.",
      severity: 4,
      whoBenefits: [
        "Politicians claiming economic wins", "Those capturing GDP gains",
        "Growth-at-all-costs ideology",
      ],
      dragonComment:
        "GDP went up because Bezos got richer. You didn't feel it because it wasn't for you."
    ),

    MatrixLie(
      lie: "Inflation is always bad",
      category: .economic,
      whyPerpetruated:
        "Simplifies complex economics. Benefits creditors over debtors. Fear-based financial media.",
      exposure:
        "Moderate inflation (2-3%) is healthy. Deflation is worse (ask Japan). Inflation reduces debt burden. Context matters.",
      escapeHack:
        "Understand inflation nuance. Hard assets hedge inflation. Wages should track inflation (they often don't).",
      severity: 3,
      whoBenefits: [
        "Creditors and bondholders", "Those with fixed-income assets", "Deflationary fear-mongers",
      ],
      dragonComment:
        "Inflation is a tax on cash. But so is wage stagnation. One they talk about, one they don't."
    ),

    MatrixLie(
      lie: "Free markets solve everything",
      category: .economic,
      whyPerpetruated:
        "Simplifies policy. Benefits those with market power. 'Invisible hand' as ideology not description.",
      exposure:
        "Markets fail regularly (externalities, monopolies, public goods). Every market has rules—question who sets them. Pure free markets don't exist.",
      escapeHack:
        "Study market failures. Support smart regulation. Ask who benefits from deregulation narratives.",
      severity: 4,
      whoBenefits: [
        "Those with market power", "Corporations avoiding regulation", "Free market ideologues",
      ],
      dragonComment:
        "The 'free' market is full of rules—they're just written by the powerful. Freedom for whom?"
    ),

    MatrixLie(
      lie: "Government debt is like household debt",
      category: .economic,
      whyPerpetruated:
        "Makes austerity seem sensible. Hides monetary sovereignty. Politicians use 'family budget' analogy.",
      exposure:
        "Governments that issue their own currency can't go broke like households. Constraint is inflation, not solvency. This isn't controversial in economics.",
      escapeHack:
        "Learn Modern Monetary Theory basics. Understand fiat currency. Question austerity premises.",
      severity: 4,
      whoBenefits: [
        "Austerity politicians", "Those cutting social programs", "Bond vigilante mythology",
      ],
      dragonComment:
        "Your family can't print dollars. The US can. Comparing them is either ignorant or lying."
    ),

    MatrixLie(
      lie: "Minimum wage increases cause unemployment",
      category: .economic,
      whyPerpetruated:
        "Justifies poverty wages. Econ 101 oversimplification. Employer lobby talking point.",
      exposure:
        "Empirical studies show minimal job loss effects. Money goes directly into economy. Many states raised minimum wage without predicted job losses.",
      escapeHack:
        "Read Card-Krueger studies. Look at actual data, not theoretical models. Support living wages.",
      severity: 4,
      whoBenefits: ["Low-wage employers", "Business lobbies", "Those benefiting from cheap labor"],
      dragonComment:
        "If paying workers more destroyed jobs, every raise you ever got would've fired you. Think about it."
    ),

    MatrixLie(
      lie: "The economy is separate from society and politics",
      category: .economic,
      whyPerpetruated:
        "Depoliticizes economic decisions. Makes exploitation seem natural. 'Just economics' hides choices.",
      exposure:
        "Economic rules are political choices. Markets are social institutions. 'Natural' economic laws are often ideological.",
      escapeHack:
        "See economic claims as political claims. Ask who benefits. Understand economics as power.",
      severity: 4,
      whoBenefits: [
        "Those who control economic rules", "Status quo beneficiaries", "Depoliticization ideology",
      ],
      dragonComment:
        "Economics is politics wearing a math costume. Don't let the formulas fool you."
    ),
  ]
}

// MARK: - Main View

struct HakaiMatrixLiesView: View {
  @State private var selectedCategory: MatrixLieCategory?
  @State private var searchText = ""
  @State private var showingLieDetail: MatrixLie?
  @State private var awarenessScore: Int = 0  // Lies exposed

  private var filteredLies: [MatrixLie] {
    MatrixLiesDatabase.allLies.filter { lie in
      let matchesCategory = selectedCategory == nil || lie.category == selectedCategory
      let matchesSearch =
        searchText.isEmpty || lie.lie.localizedCaseInsensitiveContains(searchText)
        || lie.exposure.localizedCaseInsensitiveContains(searchText)
      return matchesCategory && matchesSearch
    }
  }

  private var liesByCategory: [MatrixLieCategory: [MatrixLie]] {
    Dictionary(grouping: filteredLies, by: { $0.category })
  }

  var body: some View {
    ScrollView {
      VStack(spacing: 24) {
        // Header
        headerSection

        // Stats
        statsSection

        // Search
        searchBar

        // Category Filter
        categoryFilter

        // Lies List
        liesSection
      }
      .padding()
    }
    .background(Color.black.ignoresSafeArea())
    .navigationTitle("Matrix Lies")
    .navigationBarTitleDisplayMode(.inline)
    .sheet(item: $showingLieDetail) { lie in
      MatrixLieDetailView(lie: lie)
    }
  }

  // MARK: - Header

  private var headerSection: some View {
    VStack(spacing: 12) {
      ZStack {
        // Glitch effect circles
        ForEach(0..<3, id: \.self) { i in
          Circle()
            .stroke(Color.red.opacity(0.3), lineWidth: 2)
            .frame(width: CGFloat(80 + i * 15), height: CGFloat(80 + i * 15))
            .offset(x: CGFloat(i * 2), y: CGFloat(-i * 2))
        }

        Circle()
          .fill(
            LinearGradient(
              colors: [.red, .orange, .yellow],
              startPoint: .topLeading,
              endPoint: .bottomTrailing
            )
          )
          .frame(width: 80, height: 80)

        VStack(spacing: 2) {
          Text("破壊")
            .font(.system(size: 24, weight: .black))
            .foregroundColor(.white)
          Text("HAKAI")
            .font(.system(size: 10, weight: .bold))
            .foregroundColor(.white.opacity(0.8))
        }
      }

      Text("MATRIX LIES")
        .font(.system(size: 24, weight: .black))
        .foregroundColor(.white)

      Text("Unprogramming the Societal Deceptions")
        .font(.system(size: 12))
        .foregroundColor(.gray)

      Text("\"You're the visionary hacker—debugging the simulation\"")
        .font(.system(size: 10))
        .foregroundColor(.red)
        .italic()
    }
  }

  // MARK: - Stats

  private var statsSection: some View {
    HStack(spacing: 20) {
      statBox("\(MatrixLiesDatabase.allLies.count)", "Total Lies", .red)
      statBox("\(MatrixLieCategory.allCases.count)", "Categories", .orange)
      statBox("\(awarenessScore)", "Exposed", .green)
    }
    .padding()
    .background(Color.white.opacity(0.05))
    .cornerRadius(16)
  }

  private func statBox(_ value: String, _ label: String, _ color: Color) -> some View {
    VStack(spacing: 4) {
      Text(value)
        .font(.system(size: 24, weight: .bold))
        .foregroundColor(color)
      Text(label)
        .font(.system(size: 10))
        .foregroundColor(.gray)
    }
    .frame(maxWidth: .infinity)
  }

  // MARK: - Search

  private var searchBar: some View {
    HStack(spacing: 10) {
      Image(systemName: "magnifyingglass")
        .foregroundColor(.gray)
      TextField("Search lies...", text: $searchText)
        .foregroundColor(.white)
    }
    .padding(12)
    .background(Color.white.opacity(0.1))
    .cornerRadius(12)
  }

  // MARK: - Category Filter

  private var categoryFilter: some View {
    ScrollView(.horizontal, showsIndicators: false) {
      HStack(spacing: 8) {
        categoryPill(nil, "All", .white)
        ForEach(MatrixLieCategory.allCases, id: \.self) { category in
          categoryPill(category, category.rawValue, category.color)
        }
      }
    }
  }

  private func categoryPill(_ category: MatrixLieCategory?, _ title: String, _ color: Color)
    -> some View
  {
    Button(action: { selectedCategory = category }) {
      HStack(spacing: 4) {
        if let cat = category {
          Image(systemName: cat.icon)
            .font(.system(size: 10))
        }
        Text(title)
          .font(.system(size: 10, weight: .semibold))
      }
      .foregroundColor(selectedCategory == category ? .white : .gray)
      .padding(.horizontal, 10)
      .padding(.vertical, 6)
      .background(selectedCategory == category ? color : Color.white.opacity(0.1))
      .cornerRadius(16)
    }
  }

  // MARK: - Lies Section

  private var liesSection: some View {
    VStack(alignment: .leading, spacing: 16) {
      if selectedCategory == nil {
        // Show by category
        ForEach(MatrixLieCategory.allCases, id: \.self) { category in
          if let lies = liesByCategory[category], !lies.isEmpty {
            categorySection(category, lies)
          }
        }
      } else {
        // Show filtered list
        ForEach(filteredLies) { lie in
          lieCard(lie)
        }
      }
    }
  }

  private func categorySection(_ category: MatrixLieCategory, _ lies: [MatrixLie]) -> some View {
    VStack(alignment: .leading, spacing: 10) {
      HStack {
        Image(systemName: category.icon)
          .foregroundColor(category.color)

        VStack(alignment: .leading, spacing: 2) {
          Text(category.rawValue.uppercased())
            .font(.system(size: 12, weight: .black))
            .foregroundColor(category.color)
          Text(category.subtitle)
            .font(.system(size: 10))
            .foregroundColor(.gray)
        }

        Spacer()

        Text("\(lies.count) lies")
          .font(.system(size: 10))
          .foregroundColor(.gray)
      }

      ForEach(lies) { lie in
        lieCard(lie)
      }
    }
  }

  private func lieCard(_ lie: MatrixLie) -> some View {
    Button(action: { showingLieDetail = lie }) {
      VStack(alignment: .leading, spacing: 8) {
        HStack(alignment: .top) {
          Image(systemName: lie.category.icon)
            .foregroundColor(lie.category.color)
            .frame(width: 24)

          VStack(alignment: .leading, spacing: 4) {
            Text(lie.lie)
              .font(.system(size: 13, weight: .semibold))
              .foregroundColor(.white)
              .multilineTextAlignment(.leading)

            // Severity
            HStack(spacing: 2) {
              ForEach(0..<5, id: \.self) { i in
                Image(systemName: i < lie.severity ? "circle.fill" : "circle")
                  .font(.system(size: 6))
                  .foregroundColor(i < lie.severity ? .red : .gray)
              }
              Text("Programming Depth")
                .font(.system(size: 8))
                .foregroundColor(.gray)
            }
          }

          Spacer()

          Image(systemName: "chevron.right")
            .foregroundColor(.gray)
            .font(.system(size: 12))
        }
      }
      .padding()
      .background(lie.category.color.opacity(0.1))
      .cornerRadius(12)
    }
  }
}

// MARK: - Lie Detail View

struct MatrixLieDetailView: View {
  let lie: MatrixLie
  @Environment(\.dismiss) private var dismiss

  var body: some View {
    NavigationStack {
      ScrollView {
        VStack(alignment: .leading, spacing: 20) {
          // Header
          VStack(spacing: 12) {
            ZStack {
              Circle()
                .fill(lie.category.color.opacity(0.3))
                .frame(width: 70, height: 70)
              Image(systemName: lie.category.icon)
                .font(.system(size: 30))
                .foregroundColor(lie.category.color)
            }

            Text(lie.category.rawValue)
              .font(.system(size: 12, weight: .bold))
              .foregroundColor(lie.category.color)

            Text(lie.category.subtitle)
              .font(.system(size: 10))
              .foregroundColor(.gray)
          }
          .frame(maxWidth: .infinity)

          // The Lie
          VStack(alignment: .leading, spacing: 8) {
            HStack {
              Image(systemName: "xmark.circle.fill")
                .foregroundColor(.red)
              Text("THE LIE")
                .font(.system(size: 10, weight: .bold))
                .foregroundColor(.red)
            }

            Text("\"\(lie.lie)\"")
              .font(.system(size: 16, weight: .semibold))
              .foregroundColor(.white)
              .italic()

            // Severity
            HStack(spacing: 4) {
              Text("Programming Depth:")
                .font(.system(size: 10))
                .foregroundColor(.gray)
              ForEach(0..<5, id: \.self) { i in
                Circle()
                  .fill(i < lie.severity ? Color.red : Color.white.opacity(0.2))
                  .frame(width: 8, height: 8)
              }
            }
          }
          .padding()
          .background(Color.red.opacity(0.1))
          .cornerRadius(12)

          // Why Perpetuated
          sectionCard(
            "WHY IT'S PERPETUATED",
            lie.whyPerpetruated,
            "questionmark.circle.fill",
            .orange
          )

          // Who Benefits
          VStack(alignment: .leading, spacing: 8) {
            HStack {
              Image(systemName: "dollarsign.circle.fill")
                .foregroundColor(.yellow)
              Text("WHO BENEFITS")
                .font(.system(size: 10, weight: .bold))
                .foregroundColor(.yellow)
            }

            ForEach(lie.whoBenefits, id: \.self) { beneficiary in
              HStack(alignment: .top, spacing: 8) {
                Image(systemName: "arrow.right.circle")
                  .font(.system(size: 10))
                  .foregroundColor(.yellow)
                Text(beneficiary)
                  .font(.system(size: 12))
                  .foregroundColor(.white)
              }
            }
          }
          .padding()
          .background(Color.yellow.opacity(0.1))
          .cornerRadius(12)

          // Exposure
          sectionCard(
            "THE EXPOSURE",
            lie.exposure,
            "lightbulb.fill",
            .cyan
          )

          // Escape Hack
          sectionCard(
            "ESCAPE HACK",
            lie.escapeHack,
            "bolt.fill",
            .green
          )

          // Dragon Comment
          VStack(alignment: .leading, spacing: 8) {
            HStack {
              Text("🐉")
              Text("DRAGON SAYS")
                .font(.system(size: 10, weight: .bold))
                .foregroundColor(.purple)
            }

            Text("\"\(lie.dragonComment)\"")
              .font(.system(size: 13))
              .foregroundColor(.white)
              .italic()
          }
          .padding()
          .background(Color.purple.opacity(0.15))
          .cornerRadius(12)
        }
        .padding()
      }
      .background(Color.black.ignoresSafeArea())
      .navigationTitle("Lie Exposed")
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItem(placement: .navigationBarTrailing) {
          Button("Done") { dismiss() }
        }
      }
    }
  }

  private func sectionCard(_ title: String, _ content: String, _ icon: String, _ color: Color)
    -> some View
  {
    VStack(alignment: .leading, spacing: 8) {
      HStack {
        Image(systemName: icon)
          .foregroundColor(color)
        Text(title)
          .font(.system(size: 10, weight: .bold))
          .foregroundColor(color)
      }

      Text(content)
        .font(.system(size: 12))
        .foregroundColor(.white)
    }
    .padding()
    .background(color.opacity(0.1))
    .cornerRadius(12)
  }
}

#Preview {
  NavigationStack {
    HakaiMatrixLiesView()
  }
}
