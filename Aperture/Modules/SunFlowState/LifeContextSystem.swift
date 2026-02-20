// LifeContextSystem.swift
// The first app that adapts to YOUR life — not just knowledge workers with MacBooks.
// Blue collar, students, shift workers, parents, gig workers, everybody.
// Templates, examples, and language that meets people where they are.
// ☀️ SunFlow: Reignited

import SwiftUI

// MARK: - ═══════════════════════════════════════════════════
// LIFE CONTEXT — "What does your day look like?"
// ═══════════════════════════════════════════════════════════

enum LifeContext: String, CaseIterable, Codable, Identifiable {
    case trades = "trades"
    case shiftWork = "shift_work"
    case office = "office"
    case highSchool = "high_school"
    case college = "college"
    case gigFreelance = "gig_freelance"
    case caretaker = "caretaker"
    case betweenJobs = "between_jobs"
    case military = "military"
    case retail = "retail"
    
    var id: String { rawValue }
    
    var title: String {
        switch self {
        case .trades: return "Trades / Physical Labor"
        case .shiftWork: return "Shift Work / Irregular Hours"
        case .office: return "Office / Remote"
        case .highSchool: return "High School Student"
        case .college: return "College Student"
        case .gigFreelance: return "Gig / Freelance"
        case .caretaker: return "Caretaker / Stay-at-Home"
        case .betweenJobs: return "Between Jobs / Transitioning"
        case .military: return "Military / First Responder"
        case .retail: return "Retail / Service Industry"
        }
    }
    
    var emoji: String {
        switch self {
        case .trades: return "🔧"
        case .shiftWork: return "🔄"
        case .office: return "💻"
        case .highSchool: return "📚"
        case .college: return "🎓"
        case .gigFreelance: return "🚗"
        case .caretaker: return "🏠"
        case .betweenJobs: return "🌱"
        case .military: return "🎖️"
        case .retail: return "🏪"
        }
    }
    
    var subtitle: String {
        switch self {
        case .trades: return "Electrician, plumber, construction, mechanic..."
        case .shiftWork: return "Nursing, warehouse, factory, security..."
        case .office: return "Desk job, remote work, corporate..."
        case .highSchool: return "Building the foundation. Making it count."
        case .college: return "Investing in your future. Stay locked in."
        case .gigFreelance: return "Uber, DoorDash, freelance, self-employed..."
        case .caretaker: return "Parenting, eldercare, managing a household..."
        case .betweenJobs: return "Searching, pivoting, building something new..."
        case .military: return "Active duty, veteran, EMT, fire, police..."
        case .retail: return "Customer-facing, food service, hospitality..."
        }
    }
    
    var encouragement: String {
        switch self {
        case .trades:
            return "You build the world with your hands. The system targets you the hardest — payday loans, tool financing, sports betting, energy drinks marketed as fuel. Your skills are valuable. Your time is valuable. Let's stop letting algorithms steal both."
        case .shiftWork:
            return "Irregular hours mean the system catches you at your most tired. 2 AM scrolling after a shift isn't rest — it's engineered consumption. Your schedule is different but your potential isn't less. Let's build around YOUR clock."
        case .office:
            return "You have the flexibility others don't. Don't waste it on Slack notifications and meeting theater. The knowledge worker trap is looking busy while building nothing. Let's convert that access into actual leverage."
        case .highSchool:
            return "This is the foundation. Every hour on TikTok right now is an hour you can't get back when college apps, trade programs, or real opportunities knock. The algorithm doesn't care about your GPA. We do. You have time — the most powerful asset there is. Don't let them steal it."
        case .college:
            return "You came here to build a future. The party scene, the social pressure, the 3 AM doom scrolling — that's not why you're paying tuition. Your parents, your loans, your future self — they're all counting on you to show up. The good news? You still can. Starting now."
        case .gigFreelance:
            return "No safety net means every hour counts double. The apps you drive for are also the apps draining your downtime. You're trading time for money — make sure you're not trading the rest of your time for nothing."
        case .caretaker:
            return "Taking care of everyone else means nobody's taking care of you. That's not noble — that's unsustainable. 10 minutes of intentional time for yourself isn't selfish. It's the oxygen mask on the airplane. Put yours on first."
        case .betweenJobs:
            return "This is the most dangerous time for your attention. Anxiety makes you scroll. Scrolling makes the anxiety worse. The loop is designed. Break it. Use this gap as the launchpad it actually is — not the pit they want you to fall into."
        case .military:
            return "You understand discipline better than anyone. Now apply it to the one battle nobody trained you for — the war for your attention. Transition, civilian life, the noise — it's all designed to keep you reactive. You've been through harder. This is tactical."
        case .retail:
            return "Standing on your feet all day, dealing with people, then coming home to a phone full of ads for things you can't afford. They target service workers because you're exhausted and vulnerable. Let's flip that. Your job is temporary if you want it to be."
        }
    }
    
    // MARK: - Adaptive Morning Routine Templates
    
    var morningRoutineTemplates: [(String, String, Int)] {
        switch self {
        case .trades, .shiftWork, .military:
            return [
                ("💧", "Water (before coffee)", 1),
                ("🫁", "3 deep breaths", 1),
                ("🎯", "Set 1 intention", 2),
                ("📵", "No phone 15 min", 15),
                ("🍳", "Real breakfast", 10),
                ("📝", "Review today's plan", 3),
            ]
        case .highSchool:
            return [
                ("💧", "Water first", 1),
                ("📵", "No phone 20 min", 20),
                ("📚", "Review homework/notes", 10),
                ("🎯", "1 goal for today", 2),
                ("🍳", "Eat something real", 10),
                ("🧘", "2-min breathing", 2),
            ]
        case .college:
            return [
                ("💧", "Hydrate (not last night's regret)", 1),
                ("📵", "No phone 30 min", 30),
                ("📝", "Check class schedule", 3),
                ("🎯", "Top 3 priorities", 5),
                ("🍳", "Real food (not vending machine)", 10),
                ("🧘", "5-min stillness", 5),
                ("📖", "Read 10 pages (not social media)", 10),
            ]
        case .caretaker:
            return [
                ("💧", "Water before anyone else wakes", 1),
                ("🧘", "5 min just for YOU", 5),
                ("🎯", "1 personal goal (not just household)", 2),
                ("📵", "No scroll before breakfast", 15),
                ("📝", "Today's must-dos (max 3)", 3),
            ]
        case .betweenJobs:
            return [
                ("💧", "Water", 1),
                ("🧘", "5-min stillness (anxiety killer)", 5),
                ("🎯", "1 application or skill action", 5),
                ("📵", "No phone 30 min", 30),
                ("📖", "Learn something (15 min)", 15),
                ("🏃", "Move your body", 15),
                ("📝", "Update job tracker", 5),
            ]
        case .gigFreelance:
            return [
                ("💧", "Water", 1),
                ("📵", "No apps 15 min", 15),
                ("💰", "Check earnings vs goals", 3),
                ("🎯", "Today's income target", 2),
                ("🧘", "3 deep breaths", 1),
                ("📝", "Plan route / schedule", 5),
            ]
        case .retail:
            return [
                ("💧", "Water (not energy drink)", 1),
                ("🧘", "3 min breathing", 3),
                ("📵", "No scroll before shift", 15),
                ("🎯", "1 personal goal reminder", 2),
                ("📖", "Learn 1 thing (5 min)", 5),
                ("🍳", "Eat real food", 10),
            ]
        default:
            return [
                ("💧", "Drink Water", 1),
                ("🧘", "Meditation", 5),
                ("📵", "No Phone 30min", 30),
                ("🎯", "Set Intentions", 5),
                ("📖", "Read", 15),
                ("🏃", "Exercise", 20),
            ]
        }
    }
    
    // MARK: - Adapted No-Phone Window
    
    var noPhoneFirstMinutes: Int {
        switch self {
        case .trades, .shiftWork, .military, .retail, .gigFreelance: return 15
        case .highSchool: return 20
        case .caretaker: return 15
        case .college, .office, .betweenJobs: return 30
        }
    }
    
    // MARK: - Adapted Stillness Start
    
    var initialStillnessMinutes: Int {
        switch self {
        case .trades, .shiftWork, .military, .retail, .gigFreelance: return 3
        case .highSchool: return 3
        case .college, .caretaker: return 5
        case .office, .betweenJobs: return 5
        }
    }
    
    // MARK: - Consumer Psyops Examples (Context-Specific)
    
    var psyopsExamples: [String] {
        switch self {
        case .trades:
            return [
                "\"0% financing on tools for 24 months\" — that's not free money, that's a debt trap with a 26% rate after the promo",
                "Sports betting apps during every commercial break — engineered to catch you when you're relaxing",
                "Energy drink \"fuel for hard workers\" marketing — $5/day = $1,825/year on sugar and caffeine",
                "Truck/tool upgrades marketed as \"investments\" — ask: would I buy this without financing?",
                "Payday loans near job sites — 400% APR is not a service, it's predation",
            ]
        case .highSchool:
            return [
                "TikTok's algorithm knows exactly when you should be studying and serves the most addictive content then",
                "\"Everyone has these shoes\" — social proof hacking aimed at teens costs parents $2,000+/year on trends",
                "Mobile game microtransactions: $4.99 × 20 times = $100 on virtual items that disappear",
                "Fast food apps with \"deals\" — you spend $8 to \"save\" $3 on food you wouldn't have bought",
                "Snapchat streaks keeping you on the app 30+ min/day = 180+ hours/year stolen from your future",
            ]
        case .college:
            return [
                "\"Student discount\" on subscriptions you'll forget to cancel after the trial — designed for that exact outcome",
                "Bar tabs averaging $40-80/weekend = $2,000-4,000/year = a semester of textbooks or a certificate course",
                "Uber Eats at 2 AM: $15 meal + $5 delivery + $3 fee + tip = $28 for food worth $6",
                "\"Buy now, pay later\" on clothes for one party = debt for an Instagram photo nobody remembers",
                "FOMO-driven spending: if you wouldn't do it alone and sober, the group pressure is doing the buying",
            ]
        case .shiftWork, .retail:
            return [
                "Ads that hit your phone at 2 AM when you're exhausted after a shift — they know your schedule",
                "\"Treat yourself, you earned it\" marketing after payday — you earned that money, don't let them take it back",
                "Subscription boxes marketed as self-care: $30/month for things you'd never buy individually",
                "Vending machine + convenience store markup: 300% on items you could prep for 1/4 the cost",
                "Credit card offers targeting shift workers: \"For people with busy lives\" = for people too tired to read the fine print",
            ]
        case .caretaker:
            return [
                "\"Mom deserves a break\" subscription boxes — they monetize your exhaustion",
                "Kids' in-app purchases designed to bypass parental awareness",
                "Grocery delivery markups averaging 15-30% over in-store prices for \"convenience\"",
                "Amazon \"Subscribe & Save\" auto-shipments of things you've stopped needing",
                "Guilt-driven spending on kids' activities and gear they'll outgrow in 3 months",
            ]
        default:
            return [
                "\"Spend $100, save $25\" — you didn't save $25, you spent $100",
                "Countdown timers that reset when you refresh the page",
                "\"Only 2 left in stock\" — often generated randomly, not real inventory",
                "Free trials requiring credit cards — designed for you to forget to cancel",
                "Buy-now-pay-later splits pain across months so your brain doesn't register the cost",
            ]
        }
    }
    
    // MARK: - Dream Prompts (Goal-Setting)
    
    var dreamPrompts: [String] {
        switch self {
        case .trades:
            return [
                "Start your own contracting business",
                "Get a contractor's license / master certification",
                "Learn a complementary trade (electrical + plumbing = rare combo)",
                "Build passive income from real estate you can maintain yourself",
                "Teach your trade to the next generation",
            ]
        case .highSchool:
            return [
                "Get into the college or program you actually want",
                "Learn to code — free resources exist right now",
                "Start a side project or small business before graduation",
                "Build a portfolio of skills, not just grades",
                "Travel somewhere that changes your perspective",
            ]
        case .college:
            return [
                "Graduate with skills, not just a degree",
                "Land an internship that leads somewhere real",
                "Build something — an app, a business, a project — before you graduate",
                "Network with intention, not obligation",
                "Graduate with less debt than your classmates by cutting the noise",
            ]
        case .shiftWork:
            return [
                "Transition to a schedule that gives you your life back",
                "Use off-hours to build a skill that opens new doors",
                "Start a certification program during downtime",
                "Save enough to have 6 months of freedom to pivot",
                "Find the role that uses your work ethic without destroying your body",
            ]
        case .gigFreelance:
            return [
                "Build a client base that replaces platform dependency",
                "Create a service or product that earns while you sleep",
                "Develop a skill that commands higher rates",
                "Save consistently even with variable income",
                "Transition from gig survival to business ownership",
            ]
        case .caretaker:
            return [
                "Carve out one hour daily that's entirely yours",
                "Start the project you shelved when responsibilities grew",
                "Build a skill during naptime / quiet hours",
                "Create a financial cushion for YOUR goals",
                "Model intentional living for the people you care for",
            ]
        case .betweenJobs:
            return [
                "Use this time as a launchpad, not a waiting room",
                "Learn a new skill every week with free resources",
                "Build something that showcases what you can do",
                "Network with purpose — not desperation",
                "Come out of this transition stronger and more focused than before",
            ]
        case .retail:
            return [
                "Learn a skill that moves you off the floor",
                "Save aggressively toward your next chapter",
                "Use customer-facing experience as sales/communication training",
                "Start an online project that grows while you're on shift",
                "This job is the bridge — what's on the other side?",
            ]
        default:
            return [
                "What would you pursue if failure wasn't possible?",
                "What skill would change your trajectory in 6 months?",
                "What does financial freedom look like for you specifically?",
                "Who do you want to become — not what do you want to have?",
                "What would make you proud to tell your younger self?",
            ]
        }
    }
    
    // MARK: - Biggest Time Thieves per Context
    
    var topTimeThieves: [(String, String)] {
        switch self {
        case .trades:
            return [("📱 Break scrolling", "15-30 min/break × 2-3 breaks = 1.5 hrs/day"), ("🎰 Sports betting", "Average user spends 45 min/day on betting apps"), ("📺 After-work TV binge", "3+ hours average for physical workers"), ("🍺 Weeknight bar time", "2-3 hrs + next-day productivity loss")]
        case .highSchool:
            return [("📱 TikTok/Reels", "Average teen: 95 min/day = 577 hours/year"), ("🎮 Gaming", "2-4 hrs/day average for teen gamers"), ("👻 Snapchat streaks", "30+ min/day maintaining artificial obligations"), ("📲 Group chat drama", "Constant attention fragments = zero deep focus")]
        case .college:
            return [("🍻 Party/bar scene", "Average: 10-15 hrs/week including recovery"), ("📱 Social media", "College students average 3+ hrs/day"), ("📺 Netflix/streaming", "Background noise that becomes 3-hour binges"), ("💬 Unstructured socializing", "Hanging out ≠ meaningful connection")]
        case .shiftWork:
            return [("📱 Post-shift scrolling", "2+ hours when you should be sleeping"), ("📺 Can't-sleep binge watching", "Blue light + stimulation = worse recovery"), ("🛒 Late-night impulse shopping", "Exhaustion + algorithms = regret purchases"), ("📰 Doom scrolling news", "Cortisol before bed = poor sleep quality")]
        case .caretaker:
            return [("📱 Stolen-moment scrolling", "5 min becomes 30 min × many times/day"), ("📺 After-bedtime binge", "The only \"me time\" shouldn't be passive consumption"), ("🛒 Online shopping as stress relief", "Dopamine shopping ≠ actual self-care"), ("💬 Over-committing to others' needs", "Saying yes to everyone else = saying no to yourself")]
        default:
            return [("📱 Social media", "Average: 2.5 hrs/day"), ("📺 Streaming", "Average: 3+ hrs/day"), ("🛒 Impulse browsing", "Average: 45 min/day"), ("📰 News/doom scrolling", "Average: 1+ hr/day")]
        }
    }
}

// MARK: - ═══════════════════════════════════════════════════
// LIFE CONTEXT MANAGER
// ═══════════════════════════════════════════════════════════

@MainActor
final class LifeContextManager: ObservableObject {
    
    static let shared = LifeContextManager()
    
    @Published var selectedContext: LifeContext?
    @Published var hasCompletedContextSelection = false
    @Published var aspirationalGoal: String = ""
    
    private let defaults = UserDefaults.standard
    
    private init() {
        loadState()
    }
    
    func selectContext(_ context: LifeContext) {
        selectedContext = context
        defaults.set(context.rawValue, forKey: "life_context")
    }
    
    func setAspirationGoal(_ goal: String) {
        aspirationalGoal = goal
        defaults.set(goal, forKey: "life_context_aspiration")
    }
    
    func completeSelection() {
        hasCompletedContextSelection = true
        defaults.set(true, forKey: "life_context_selected")
    }
    
    private func loadState() {
        hasCompletedContextSelection = defaults.bool(forKey: "life_context_selected")
        aspirationalGoal = defaults.string(forKey: "life_context_aspiration") ?? ""
        if let raw = defaults.string(forKey: "life_context"),
           let ctx = LifeContext(rawValue: raw) {
            selectedContext = ctx
        }
    }
}
