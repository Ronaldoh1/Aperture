// DemocracyDecodedData.swift
// SunFlow: Reignited — Aperture
//
// DEMOCRACY DECODED: How Elections, Money, and Reform Actually Work
// 3 Courses · 27 Modules · Interactive Quizzes · RCV Simulator · Donor Tracker · Belief Audit
//
// "The first step in civic empowerment is understanding the machinery."

import SwiftUI

// MARK: - Core Models

struct DDCourse: Identifiable {
    let id: String
    let number: Int
    let title: String
    let subtitle: String
    let emoji: String
    let accentHex: String
    let level: String
    let estimatedMinutes: Int
    let modules: [DDModule]
    var accent: Color { Color(hex: accentHex) }
}

struct DDModule: Identifiable {
    let id: String
    let number: Int
    let title: String
    let subtitle: String
    let emoji: String
    let readingTime: Int    // minutes
    let body: String
    let keyStats: [DDStat]
    let beliefAuditPrompt: String?   // The assumption most people carry — surface it
    let quiz: [DDQuestion]
    let actionStep: String
}

struct DDStat: Identifiable {
    let id = UUID()
    let number: String
    let label: String
    let color: Color
}

struct DDQuestion: Identifiable {
    let id = UUID()
    let question: String
    let options: [String]
    let correctIndex: Int
    let explanation: String
    let beliefBias: String?   // What getting this wrong usually reveals about your prior assumptions
}

// MARK: - Progress Model (shared across all 3 DD courses)

struct DDProgress: Codable {
    var completedModules: Set<String> = []
    var quizScores: [String: Int] = [:]           // moduleID → score
    var beliefAuditAnswers: [String: Int] = [:]    // prompt → slider value 0–100
    var rcvSimRuns: Int = 0
    var totalScore: Int = 0

    mutating func markComplete(_ id: String, score: Int) {
        completedModules.insert(id)
        quizScores[id] = score
        totalScore = quizScores.values.reduce(0, +)
    }
    func isDone(_ id: String) -> Bool { completedModules.contains(id) }
    func score(_ id: String) -> Int? { quizScores[id] }
}

// MARK: ═══════════════════════════════════════════════════════════════
// COURSE 1: HOW OUR ELECTIONS ACTUALLY WORK
// ═══════════════════════════════════════════════════════════════════

let ddCourse1 = DDCourse(
    id: "dd_c1",
    number: 1,
    title: "How Elections Actually Work",
    subtitle: "The system nobody fully explained to you",
    emoji: "🗳️",
    accentHex: "#4A9EFF",
    level: "Beginner → Intermediate",
    estimatedMinutes: 90,
    modules: [

        DDModule(
            id: "dd_c1_m1",
            number: 1,
            title: "The Constitutional Foundation",
            subtitle: "Why the system is deliberately confusing",
            emoji: "📜",
            readingTime: 8,
            body: """
**The Founders Didn't Trust You**

That's not an insult. It's the design specification. The Constitution was written by men who had just lived through a monarchical system and were terrified of concentrated power — including the power of an unruly popular majority. Their solution was a system of layered filters, checks, and intentional complexity. Understanding that design intent explains why elections work the way they do today.

**The Federal vs. State Split**

The Constitution gives states enormous power over how elections are run. Article I gives states the authority to set the "Times, Places and Manner" of congressional elections. Article II gives state legislatures the power to determine how presidential electors are chosen. The 10th Amendment reserves all powers not given to the federal government to the states. This is why election rules vary dramatically across 50 states — voter ID requirements, mail voting, early voting, registration deadlines, felony disenfranchisement — all set at the state level.

**The Amendment Layer**

The original Constitution had no language guaranteeing the right to vote at all. It took six constitutional amendments over 170 years to extend voting rights:
— 15th (1870): Can't deny based on race or color
— 19th (1920): Can't deny based on sex
— 24th (1964): Eliminated poll taxes in federal elections
— 26th (1971): Lowered voting age to 18

Notice what's not in there: no affirmative right to vote. The Constitution says what governments can't do, not that voting is guaranteed.

**The Three Separate Tracks**

Most people think of "an election" as one thing. It's actually three separate systems running simultaneously:
1. **Primary elections** — Parties choose their nominees (rules set by parties, funded by taxpayers in many states)
2. **General elections** — The main event between nominees (run by states)
3. **Certification process** — Officials verify and certify results (multi-step, state + federal)

Confusion about which track is which is how misinformation spreads. When someone claims "election fraud," you need to ask: which track? Which step? Which state?
""",
            keyStats: [
                DDStat(number: "50", label: "Different sets of election rules", color: .blue),
                DDStat(number: "6", label: "Amendments needed to include everyone", color: .orange),
                DDStat(number: "0", label: "Places in Constitution guaranteeing the right to vote", color: .red),
                DDStat(number: "170", label: "Years to extend voting to all citizens", color: .purple)
            ],
            beliefAuditPrompt: "Before this lesson, did you believe the US Constitution guaranteed every citizen the right to vote? Most Americans do — and they're wrong. What does it mean that voting rights required repeated amendment rather than being foundational?",
            quiz: [
                DDQuestion(
                    question: "Which branch of government has primary authority over how presidential electors are chosen?",
                    options: ["Congress", "State legislatures", "The Supreme Court", "The President"],
                    correctIndex: 1,
                    explanation: "Article II gives state legislatures the power to determine how electors are appointed. This is why different states use different methods and why debates about state election laws matter so much in presidential races.",
                    beliefBias: "Most people assume elections are federally controlled — which is why federal election 'interference' claims are often misdirected. The real leverage is at the state level."
                ),
                DDQuestion(
                    question: "How many constitutional amendments were required to establish broad voting rights in the United States?",
                    options: ["1 (the original Bill of Rights)", "2 (15th and 19th)", "At least 6 amendments over 170 years", "Voting rights were in the original Constitution"],
                    correctIndex: 2,
                    explanation: "The 15th, 17th, 19th, 23rd, 24th, and 26th Amendments progressively expanded voting access. The original Constitution didn't guarantee the right to vote at all — it left that to states.",
                    beliefBias: "The assumption that voting is constitutionally guaranteed leads people to believe the right is more secure than it actually is legally."
                ),
                DDQuestion(
                    question: "Primary elections in most states are paid for by:",
                    options: ["The political parties themselves", "Federal government exclusively", "Taxpayers, even though they're run by private political parties", "Foreign governments are banned from funding them"],
                    correctIndex: 2,
                    explanation: "In most states, taxpayers fund the primary elections that political parties use to select their nominees — even primaries that exclude independent voters. You pay for a process you may not be allowed to participate in.",
                    beliefBias: "Most voters don't realize they fund private party processes they may be excluded from. This is one of the least-discussed aspects of how the electoral system works."
                )
            ],
            actionStep: "Look up your state's voter registration deadline and whether your primary is open, closed, or semi-open. That single piece of information changes how much power you have in the first filter."
        ),

        DDModule(
            id: "dd_c1_m2",
            number: 2,
            title: "Primaries — The Invisible Filter",
            subtitle: "How extremes pick your choices before you vote",
            emoji: "🔍",
            readingTime: 10,
            body: """
**The Most Important Election Nobody Talks About**

Presidential general elections get 140+ million voters. Presidential primaries often get 25–35 million — roughly 20–25% of eligible voters, skewing heavily toward older, whiter, more ideologically extreme participants on both sides. The people who vote in primaries are not representative of the American public. But they decide which candidates the other 75% get to choose from.

**Why Primary Voters Are Extreme (By Design)**

Primary voters are self-selected for high political engagement and strong ideological commitment. The more motivated you are by partisan identity, the more likely you vote in primaries. The more casual your political interest, the more likely you skip them. This creates a systematic filter: candidates must appeal to the most ideologically energized base — conservatives in Republican primaries, progressives in Democratic ones — before they ever face the general public.

The result: candidates routinely run extreme in primaries, then try to pivot to the center for the general. Voters who only tune in for the general election inherit nominees shaped by people who don't represent them.

**The 40% Problem**

Approximately 40% of American voters identify as independent — the largest single bloc in the electorate. In closed primary states (which include New York, Pennsylvania, Florida, and others), these voters are completely locked out of primaries. They can't vote for either party's nominee until the general election — when the choices have already been made without them.

This is not an accident. Both major parties benefit from a system where their most committed base controls nominations.

**Superdelegates: The Party's Override Button**

Democrats (until reforms after 2016) gave roughly 15% of convention votes to "superdelegates" — party insiders, elected officials, and DNC members who could vote for any candidate regardless of primary results. In 2016, Hillary Clinton had a superdelegate advantage of roughly 500 pledged before a single vote was cast, creating a visibility advantage that shaped media coverage and donor behavior.

After Bernie Sanders's campaigns drove reform pressure, the Democratic Party reduced superdelegate influence at the first ballot — but they still exist and can act at contested conventions.

**The Spoiler Effect in Primaries**

In multi-candidate primaries, the most extreme candidates often win with 30–35% of the vote while the moderate vote splits among several candidates. This means the person chosen as "the party's nominee" may represent a plurality of the base but a minority of total voters. Ranked Choice Voting (Course 3) directly addresses this problem.

**Real 2024 Data**

In the 2024 Republican primary, Donald Trump secured the nomination against a fractured field. In most states, he received between 50–80% of primary votes. But Republican primary turnout was roughly 25–30% of registered Republicans — meaning he was the choice of roughly 15–20% of all registered Republican voters before winning the nomination. This is not unique to Trump — it's how primaries structurally work.
""",
            keyStats: [
                DDStat(number: "20%", label: "Typical primary turnout of eligible voters", color: .red),
                DDStat(number: "40%", label: "Americans identifying as independent (excluded in closed primaries)", color: .orange),
                DDStat(number: "775", label: "Democratic superdelegates still exist (reduced role)", color: .blue),
                DDStat(number: "32", label: "States with closed or semi-closed primaries", color: .purple)
            ],
            beliefAuditPrompt: "Most people believe they 'choose' their candidates. In reality, roughly 20% of eligible voters — the most ideologically engaged — make that choice for everyone else. How does knowing this change how you see the nominees you've been given?",
            quiz: [
                DDQuestion(
                    question: "In a typical US presidential primary, what percentage of eligible voters actually cast ballots?",
                    options: ["60–70%", "40–50%", "20–30%", "5–10%"],
                    correctIndex: 2,
                    explanation: "Presidential primary turnout typically ranges from 20–30% of eligible voters. This self-selected group — more ideologically extreme than the general public — effectively determines which candidates the other 70–80% get to choose from in the general election.",
                    beliefBias: "Most people overestimate primary participation. Understanding the actual scale reveals why nominees often don't reflect the median voter."
                ),
                DDQuestion(
                    question: "What is a 'closed primary'?",
                    options: ["A primary that has been legally challenged", "A primary where only registered party members can vote", "A primary with a cap on the number of candidates", "A primary where results are kept secret"],
                    correctIndex: 1,
                    explanation: "In closed primaries, only voters registered with a party can vote in that party's primary. Independent voters — roughly 40% of the electorate — are completely excluded. About 32 states have some form of closed or semi-closed primaries.",
                    beliefBias: nil
                ),
                DDQuestion(
                    question: "The 'spoiler effect' in primaries occurs when:",
                    options: ["A candidate drops out too early", "Multiple moderate candidates split the vote, allowing an extreme candidate to win with a plurality", "Outside money influences the outcome", "Media coverage creates unfair advantages"],
                    correctIndex: 1,
                    explanation: "When multiple candidates with similar positions compete, their votes split while voters supporting a more extreme candidate remain concentrated. The extreme candidate wins with 30–35% while moderate voters' combined majority goes unrepresented. This is the structural origin of many unexpected primary outcomes.",
                    beliefBias: "Understanding the spoiler effect reveals that 'extreme' nominees aren't always chosen by extreme majorities — they're often chosen by extreme pluralities while the center splits."
                )
            ],
            actionStep: "Find out if your state has a closed, open, or top-two primary. Then find the next primary election date and whether you're registered in a party that lets you participate. If you're independent in a closed primary state, you're funding an election you can't vote in."
        ),

        DDModule(
            id: "dd_c1_m3",
            number: 3,
            title: "The Electoral College",
            subtitle: "Why Wyoming votes count more than California's",
            emoji: "🗺️",
            readingTime: 12,
            body: """
**The Original Compromise**

The Electoral College was created in 1787 for three reasons, none of which are the ones most people assume.

**Reason 1: The Founders didn't trust direct democracy.** They feared "mob rule" — a passionate majority voting away the rights of minorities. They wanted a buffer of "wise electors" who could exercise independent judgment.

**Reason 2: The Slave States demanded it.** Southern states had large populations of enslaved people who couldn't vote. If the president was chosen by popular vote, the North — with more eligible voters — would dominate. The Three-Fifths Compromise counted enslaved people as 3/5 of a person for congressional representation (and therefore Electoral College votes), giving slave states disproportionate power. This is documented historical record, not interpretation.

**Reason 3: The small states demanded it.** Less populated states feared being overwhelmed by large-state interests. The Electoral College gives every state a minimum of 3 electoral votes (2 senators + at least 1 representative), regardless of population.

**How It Works Today**

Each state gets electoral votes equal to its total congressional delegation (House + Senate). The winner of the popular vote in most states gets all of that state's electoral votes (winner-take-all). 270 electoral votes wins the presidency.

**The Math Problem**

Wyoming has approximately 580,000 people and 3 electoral votes = 1 electoral vote per 193,000 people.
California has approximately 39 million people and 54 electoral votes = 1 electoral vote per 722,000 people.

A Wyoming voter has roughly 3.6 times the presidential electoral power of a California voter. This violates the principle of equal protection in a direct, mathematical way. It is a structural feature of the system, not a bug.

**The Swing State Monopoly**

Because of winner-take-all, candidates focus entirely on competitive ("swing") states. Safe states — states where the outcome is predetermined — are strategically irrelevant. In 2020, approximately 96% of campaign events were held in just 12 states. Voters in California, Texas, New York, and Illinois — four of the five most populous states — received almost no presidential campaign attention because the outcome in their states was predetermined.

**The Popular Vote Mismatch**

Five times in American history, the winner of the Electoral College has lost the popular vote:
— 1824: John Quincy Adams over Andrew Jackson
— 1876: Rutherford Hayes over Samuel Tilden
— 1888: Benjamin Harrison over Grover Cleveland
— 2000: George W. Bush over Al Gore (by 543,895 votes)
— 2016: Donald Trump over Hillary Clinton (by 2.87 million votes)

In both 2000 and 2016, the person whom more Americans voted for did not become president. In both cases, the winner of the Electoral College subsequently made consequential appointments and policy decisions. The outcomes of those elections shaped American policy for decades.

**The "But Small States" Counter-Argument**

Defenders argue the Electoral College protects small-state interests. But there are only about 7 truly small states (fewer than 750,000 people). Candidates don't campaign in Wyoming, Montana, or Vermont any more than they campaign in California — because they're not swing states. The swing state benefit accrues to medium-sized competitive states (Pennsylvania, Michigan, Wisconsin, Arizona, Nevada), not to small states.

**The Reform Movement**

The National Popular Vote Interstate Compact (NPVIC) would award all electoral votes of participating states to the winner of the national popular vote, effectively creating a popular vote system without a constitutional amendment. As of February 2026, 17 states + DC have joined, representing 209 electoral votes. Virginia's Senate and House passed it on February 11, 2026, which would bring the total to 222. It activates when states totaling 270 electoral votes join.
""",
            keyStats: [
                DDStat(number: "3.6×", label: "More electoral power for Wyoming vs California voters", color: .red),
                DDStat(number: "5", label: "Times EC winner lost the popular vote", color: .orange),
                DDStat(number: "12", label: "States received 96% of 2020 campaign events", color: .blue),
                DDStat(number: "222", label: "NPVIC electoral votes as of Feb 2026 (needs 270)", color: .green)
            ],
            beliefAuditPrompt: "The Electoral College is defended as protecting small states and preventing 'mob rule.' The historical record shows it was also designed to protect slave-state power and was never actually used as intended (electors never exercised independent judgment as the Founders intended). Does knowing the actual historical design change how you evaluate the 'it protects small states' argument?",
            quiz: [
                DDQuestion(
                    question: "Which historical factor was explicitly a reason the Electoral College was created in 1787?",
                    options: ["To prevent foreign interference in elections", "To give Southern slave states more political power through the Three-Fifths Compromise", "To ensure military officers couldn't become president", "To allow third parties a chance to win"],
                    correctIndex: 1,
                    explanation: "The Three-Fifths Compromise counted enslaved people as 3/5 of a person for representation, giving Southern states more Electoral College votes than a pure eligible-voter count would provide. This is documented in the Constitutional Convention records and is not contested by historians.",
                    beliefBias: "Many people believe the Electoral College was purely about federalism or small-state protection. Its role in the pro-slavery compromise is rarely taught in high school civics."
                ),
                DDQuestion(
                    question: "In the 2016 and 2000 elections, what happened?",
                    options: ["The popular vote winner became president both times", "The popular vote winner lost the Electoral College and did not become president", "Third party candidates changed the outcomes", "The outcomes were determined by the Supreme Court both times"],
                    correctIndex: 1,
                    explanation: "In 2000, Al Gore won the popular vote by 543,895 votes but lost the Electoral College 271-266. In 2016, Hillary Clinton won the popular vote by 2.87 million votes but lost the Electoral College 306-232. The person more Americans voted for did not become president in either case.",
                    beliefBias: nil
                ),
                DDQuestion(
                    question: "A swing state voter has more presidential electoral influence than a safe state voter because:",
                    options: ["Swing state votes are counted twice", "Winner-take-all makes safe state votes strategically irrelevant to campaigns and candidates", "Swing states have more electoral votes per capita", "Safe state voters are excluded from primaries"],
                    correctIndex: 1,
                    explanation: "In a safe state, the outcome is predetermined. Campaigns don't spend resources there. Candidates don't tailor policy promises to those voters. In effect, safe state voters' presidential preferences are irrelevant to the outcome — their state's electoral votes are already counted before the campaign begins.",
                    beliefBias: "Many voters in safe states don't realize their presidential vote is effectively ceremonial under the current system."
                )
            ],
            actionStep: "Look up whether your state has joined the National Popular Vote Interstate Compact. If it hasn't, look up your state legislators and whether they've introduced or supported NPVIC legislation. The compact needs just 48 more electoral votes to reach the threshold."
        ),

        DDModule(
            id: "dd_c1_m4",
            number: 4,
            title: "Gerrymandering",
            subtitle: "How politicians choose their voters",
            emoji: "🧩",
            readingTime: 9,
            body: """
**The Basic Concept**

Congressional and state legislative district lines are redrawn every 10 years after the census. In most states, the party that controls the state legislature controls the redistricting process. This means the party in power draws the lines that determine which voters are in which district — and therefore, which party wins which seats. The voters don't choose their representatives. The party in power chooses its voters.

**Two Techniques: Packing and Cracking**

*Packing:* Concentrate opposition voters into as few districts as possible, so they win those districts by enormous margins (wasted votes) while the dominant party wins many more districts by comfortable margins.

*Cracking:* Split concentrations of opposition voters across multiple districts so they form a minority in each one and can't elect anyone.

Combined, packing and cracking can systematically dilute the opposition's voting power while maximizing the dominant party's seat count.

**The Numbers Don't Lie**

In North Carolina in 2022, Democrats won 50.4% of the total congressional votes cast but only 33% of the congressional seats (4 of 14). Republicans received 49.5% of votes and won 67% of seats (10 of 14). This mathematical inversion — where seat share dramatically diverges from vote share — is the signature of aggressive gerrymandering.

Wisconsin's state legislative maps were so aggressively gerrymandered after 2010 that Republicans consistently won supermajorities (60%+ of seats) while receiving roughly 50% of statewide votes. This persisted until the Wisconsin Supreme Court ordered new maps in 2023.

**Both Parties Do It**

Maryland (Democratic-controlled) gerrymanders aggressively to protect Democratic incumbents. Illinois's congressional map is designed to maximize Democratic seats. After 2010, Republicans gained control of more statehouses and gerrymandered more aggressively at a larger scale, but the mechanism is bipartisan.

**The Supreme Court's Non-Answer**

In 2019's Rucho v. Common Cause, the Supreme Court ruled 5-4 that federal courts cannot rule on partisan gerrymandering — that it's a "political question" outside their jurisdiction. This removed federal courts as a check on partisan gerrymandering, leaving only state courts and state constitutional provisions as remedies.

**Independent Redistricting**

California (2010), Arizona, Michigan, Colorado, and several other states have shifted redistricting to independent or bipartisan commissions. Studies show these states have significantly less gerrymandering and more competitive districts. The mechanism is proven. The question is whether parties with power will voluntarily give it up — and the historical answer is: only under sustained public pressure.
""",
            keyStats: [
                DDStat(number: "50%→33%", label: "NC Dems' votes vs. seats in 2022", color: .red),
                DDStat(number: "10yr", label: "Cycle between redistricting opportunities", color: .blue),
                DDStat(number: "2019", label: "Supreme Court removed federal oversight of partisan gerrymandering", color: .orange),
                DDStat(number: "8", label: "States with independent redistricting commissions", color: .green)
            ],
            beliefAuditPrompt: "Most people believe elections are won by candidates who appeal to voters. Gerrymandering reverses this: districts are drawn so that a specific party is mathematically guaranteed to win regardless of candidate quality or voter enthusiasm. How does this change your understanding of 'competitive democracy'?",
            quiz: [
                DDQuestion(
                    question: "What is 'cracking' in gerrymandering?",
                    options: ["Breaking voting machines to suppress turnout", "Splitting opposition voters across multiple districts so they're a minority in each", "Eliminating districts in certain counties", "Hacking election databases"],
                    correctIndex: 1,
                    explanation: "Cracking disperses the opposition's concentrated voter base across multiple districts, preventing them from forming a majority anywhere. Combined with 'packing' (concentrating opposition in a few districts), these techniques can mathematically neutralize a political party that receives roughly half of all votes.",
                    beliefBias: nil
                ),
                DDQuestion(
                    question: "Partisan gerrymandering at the federal level is currently:",
                    options: ["Illegal under the Voting Rights Act", "Banned by a 2015 Supreme Court ruling", "Unreviewable by federal courts since Rucho v. Common Cause (2019)", "Monitored by the Department of Justice"],
                    correctIndex: 2,
                    explanation: "In Rucho v. Common Cause (2019), the Supreme Court ruled 5-4 that partisan gerrymandering is a 'political question' that federal courts cannot adjudicate. This removed the main federal check on partisan districting. State courts remain a potential remedy under state constitutional provisions.",
                    beliefBias: "Many voters assume courts protect them from partisan manipulation of district lines. The opposite is true at the federal level since 2019."
                ),
                DDQuestion(
                    question: "Partisan gerrymandering is practiced by:",
                    options: ["Only Republicans (they gained more state legislatures after 2010)", "Only Democrats (they control coastal states)", "Both parties, wherever they hold state legislative power", "Neither party — it's done by independent commissions"],
                    correctIndex: 2,
                    explanation: "Gerrymandering is a bipartisan practice — any party controlling redistricting will use it to protect incumbents and expand seat share. Republicans gerrymandered more aggressively at scale after 2010 because they won more state legislatures, but Maryland, Illinois, and other Democrat-controlled states have aggressive gerrymanders too.",
                    beliefBias: "Partisan media coverage makes people think only the other party gerrymanders. The historical record shows it's structurally universal wherever parties control redistricting."
                )
            ],
            actionStep: "Look up who controls redistricting in your state and when the next census-based redistricting will occur. If your state doesn't have an independent commission, look up any pending legislation. The 2030 census maps will be drawn from 2031 state legislatures — which means 2030 state elections determine the next decade of congressional maps."
        ),

        DDModule(
            id: "dd_c1_m5",
            number: 5,
            title: "Voter Access & Barriers",
            subtitle: "The legal architecture of who gets to vote",
            emoji: "🚪",
            readingTime: 10,
            body: """
**The Access-Security Tension**

Every voting regulation involves a tradeoff between two legitimate interests: making voting accessible to all eligible citizens and preventing ineligible people from voting. The debate about voter ID laws, registration deadlines, mail voting, and polling place availability is fundamentally about where to draw that line. Both sides have real arguments. The evidence matters.

**Voter ID Laws: What the Data Shows**

As of 2026, 35 states have some form of voter ID requirement, ranging from strict photo ID to flexible requirements accepting various documents. Supporters argue these prevent fraud and maintain election integrity. Critics argue documented voter impersonation fraud is extremely rare (studies find fewer than 0.00001% of votes involve such fraud) while strict ID requirements disproportionately affect low-income voters, elderly voters, and voters of color who are less likely to have qualifying ID.

A 2017 study in the Journal of Politics found that strict voter ID laws reduced turnout among minority voters by 2–3 percentage points relative to white voters. A Government Accountability Office study found a 2–3% reduction in overall turnout in strict ID states.

The question is a values judgment: how much turnout reduction is acceptable to prevent what level of documented fraud? Reasonable people disagree on that tradeoff.

**Voter Roll Purging**

States regularly remove voters from registration rolls to keep them current. The controversy is over the methods. "Use it or lose it" purges remove voters who haven't voted recently. Critics note that not voting is legal and that purges have removed eligible voters, sometimes without adequate notice.

In Georgia, Secretary of State Brian Kemp (who was also the Republican candidate for governor in 2018) purged 340,000 voter registrations in the 8 months before the election using the "use it or lose it" method. Many of those voters were eligible but showed up to find themselves removed. Kemp won by approximately 55,000 votes.

**Felony Disenfranchisement**

The United States has the most extensive felony disenfranchisement system in the democratic world. As of 2026:
— 2 states (Maine, Vermont) allow incarcerated people to vote
— 21 states restore voting rights automatically upon release
— 16 states require a waiting period after release before rights are restored
— 11 states can permanently disenfranchise some felons

Approximately 4.6 million Americans — disproportionately Black men due to criminal justice disparities — cannot vote due to felony disenfranchisement. Florida voters passed Amendment 4 in 2018 (64% vote) restoring voting rights to most ex-felons. The Florida legislature then passed a law requiring all fines and fees to be paid first — effectively reinstating a poll tax.

**Mail Voting Evidence**

Studies of states with long-term universal mail voting (Oregon, Washington, Colorado) find no evidence of increased fraud compared to in-person voting. Oregon has used universal mail voting since 1998 and their documented fraud rate is 0.00025%. Mail voting does increase turnout, particularly among rural voters, elderly voters, and working parents.

**Same-Day Registration**

21 states allow voters to register on Election Day. Studies consistently find these states have 5–7% higher turnout than states with earlier registration deadlines. The main argument against is administrative complexity. The main argument for is that arbitrary registration deadlines serve no security purpose — someone who shows up to vote on Election Day is demonstrably a real person at that location.
""",
            keyStats: [
                DDStat(number: "4.6M", label: "Americans disenfranchised by felony laws", color: .red),
                DDStat(number: "35", label: "States with some form of voter ID law", color: .orange),
                DDStat(number: "5–7%", label: "Higher turnout in same-day registration states", color: .green),
                DDStat(number: "0.00025%", label: "Oregon mail vote fraud rate since 1998", color: .blue)
            ],
            beliefAuditPrompt: "Do you believe voter fraud is a major problem in American elections, or that voter suppression is a major problem? Studies show both forms of election manipulation are real — but their documented scales are very different. What evidence would you need to update your current belief on which is the larger problem?",
            quiz: [
                DDQuestion(
                    question: "What does research on strict voter ID laws most consistently find?",
                    options: ["Strict ID laws have no effect on turnout", "Strict ID laws increase turnout by reducing fraud concerns", "Strict ID laws reduce turnout, with disproportionate effects on minority voters", "Strict ID laws eliminate fraud completely"],
                    correctIndex: 2,
                    explanation: "Multiple peer-reviewed studies, including a GAO report and a Journal of Politics study, find that strict voter ID laws reduce turnout by 2–3% overall and by 2–3% more among minority voters than white voters. The question is whether this tradeoff is justified by the level of documented in-person voter impersonation fraud, which studies find is extremely rare.",
                    beliefBias: "People who believe voter fraud is widespread often support ID laws without weighing the documented turnout impact. People who believe suppression is the dominant problem often dismiss security concerns entirely. Both need to engage the actual data."
                ),
                DDQuestion(
                    question: "How many states allow currently incarcerated people to vote?",
                    options: ["None — it's federally prohibited", "2 (Maine and Vermont)", "All states, if they've served more than half their sentence", "25 states allow it"],
                    correctIndex: 1,
                    explanation: "Only Maine and Vermont allow incarcerated people to vote. The United States has the most extensive felony disenfranchisement system among democracies. In contrast, most European democracies allow incarcerated people to vote.",
                    beliefBias: "Most Americans assume voting is restored upon release. In many states, it requires waiting periods, payment of fines, or formal applications."
                ),
                DDQuestion(
                    question: "Oregon has used universal mail voting since 1998. What has their documented fraud rate been?",
                    options: ["About 5% — mail is less secure", "About 1% — manageable but real", "0.00025% — effectively negligible", "Unknown — they don't track it"],
                    correctIndex: 2,
                    explanation: "Oregon's documented mail vote fraud rate is approximately 0.00025% across 24+ years of universal mail voting. This evidence-based track record is cited by researchers who argue mail voting concerns are not supported by evidence from jurisdictions with extensive experience.",
                    beliefBias: "The assumption that mail voting is inherently fraud-prone is not supported by evidence from states that have practiced it for decades."
                )
            ],
            actionStep: "Find your state's current status on: voter ID requirements, automatic voter registration, same-day registration, early voting days, and mail voting. The Brennan Center's state voting laws database is the most comprehensive source. Knowing your state's specific rules tells you what your actual access looks like."
        )
    ]
)

// MARK: ═══════════════════════════════════════════════════════════════
// COURSE 2: MONEY IN POLITICS
// ═══════════════════════════════════════════════════════════════════

let ddCourse2 = DDCourse(
    id: "dd_c2",
    number: 2,
    title: "Money in Politics",
    subtitle: "Super PACs, dark money, and who actually funds campaigns",
    emoji: "💰",
    accentHex: "#34C78A",
    level: "Intermediate → Advanced",
    estimatedMinutes: 100,
    modules: [

        DDModule(
            id: "dd_c2_m1",
            number: 1,
            title: "Before & After Citizens United",
            subtitle: "The 2010 ruling that changed everything",
            emoji: "⚖️",
            readingTime: 10,
            body: """
**The Before: McCain-Feingold (2002)**

Before Citizens United, the Bipartisan Campaign Reform Act (McCain-Feingold, 2002) was the dominant campaign finance framework. It banned "soft money" — unlimited donations to political parties — and restricted "electioneering communications" (issue ads mentioning candidates) within 60 days of a general election. The intention was to reduce the influence of large donors and corporations on elections.

**The Case**

Citizens United v. FEC (2010) arose from a documentary: "Hillary: The Movie," produced by a conservative nonprofit called Citizens United. The group wanted to air it on video-on-demand during the 2008 Democratic primary. The FEC ruled this violated the electioneering communications restrictions. Citizens United sued.

**The 5-4 Ruling**

Justice Kennedy, writing for the 5-4 majority, held that the government cannot restrict independent political expenditures by corporations, associations, or labor unions. The ruling was grounded in the First Amendment — political speech is protected, and corporations (as associations of people) have First Amendment rights.

The dissent, written by Justice Stevens, argued that "corporations are not people" for First Amendment purposes and that the ruling would "undermine the integrity of elected institutions across the Nation."

**Immediate Aftermath: SpeechNow.org v. FEC (2010)**

The D.C. Circuit, following Citizens United's logic, ruled in SpeechNow.org v. FEC (2010) that groups making only "independent expenditures" (spending not coordinated with campaigns) could accept unlimited contributions from individuals. This directly created Super PACs — political action committees that can raise and spend unlimited amounts, provided they don't directly coordinate with campaigns.

**The Numbers: Before vs. After**

Outside spending in presidential elections:
— 2004: $405 million
— 2008: $338 million (pre-Citizens United)
— 2012: $1.03 billion (first post-CU presidential race — 3× increase)
— 2016: $1.4 billion
— 2020: $3.4 billion
— 2024: $4.5+ billion

Total outside spending has grown more than 13× since Citizens United. The 2024 cycle saw a single donor (Elon Musk) spend approximately $290+ million, mostly through America PAC.

**The "Independent" Fiction**

The ruling requires that Super PAC spending be "independent" — not coordinated with campaigns. In practice, the coordination rules have large loopholes. Super PACs regularly employ former campaign staff. Campaigns signal their strategies publicly through unaired ads and public statements. The "independence" requirement is formal, not functional.

**Dark Money: The Disclosure Problem**

Citizens United also enabled "dark money" — political spending by 501(c)(4) "social welfare" nonprofits that are not required to disclose their donors. A corporation or billionaire can give unlimited amounts to a 501(c)(4), which can then give to a Super PAC, which spends on elections — with no public trail to the original donor. Roughly $1 billion in dark money flowed through the 2020 cycle.
""",
            keyStats: [
                DDStat(number: "$4.5B+", label: "Outside spending in 2024 (vs $338M in 2008)", color: .red),
                DDStat(number: "5-4", label: "Citizens United decision margin", color: .orange),
                DDStat(number: "$290M", label: "Single donor (Musk) 2024 cycle", color: .purple),
                DDStat(number: "$1B", label: "Approximate dark money in 2020 cycle", color: .blue)
            ],
            beliefAuditPrompt: "The Citizens United majority argued that restricting corporate political spending violates the First Amendment. The dissent argued corporations aren't people with constitutional rights. Both are defensible constitutional positions. Where did you stand on this before reading the actual ruling — and was that based on the legal argument or on which party benefits from each position?",
            quiz: [
                DDQuestion(
                    question: "What was the primary constitutional basis for the Citizens United ruling?",
                    options: ["The 14th Amendment's equal protection clause", "The First Amendment's protection of political speech", "The Commerce Clause allowing corporate regulation", "The 10th Amendment reserving powers to states"],
                    correctIndex: 1,
                    explanation: "The majority held that the First Amendment prohibits the government from restricting political speech based on the identity of the speaker — including corporate identity. The ruling treated political spending by corporations and associations as protected speech, not as corrupt behavior.",
                    beliefBias: "Many people who oppose Citizens United are unaware that it's grounded in First Amendment logic. Understanding the actual legal argument is necessary to evaluate the counter-arguments for reform."
                ),
                DDQuestion(
                    question: "A '501(c)(4) dark money' group is:",
                    options: ["A Super PAC with extra disclosure requirements", "A nonprofit that can accept unlimited anonymous donations and spend on politics without revealing donors", "A government-funded election watchdog", "A bipartisan research organization"],
                    correctIndex: 1,
                    explanation: "501(c)(4) organizations are tax-exempt 'social welfare' nonprofits. They don't have to disclose their donors. They can give to Super PACs, which spend on elections. This creates a legal pathway for completely anonymous unlimited political spending — the 'dark money' problem.",
                    beliefBias: nil
                ),
                DDQuestion(
                    question: "Outside spending in presidential elections increased by approximately how much between 2008 and 2024?",
                    options: ["10% — relatively stable", "2× — doubled", "13× — from ~$340M to $4.5B+", "It actually decreased due to campaign finance reforms"],
                    correctIndex: 2,
                    explanation: "Pre-Citizens United (2008): ~$338 million. Post-Citizens United (2024): $4.5B+. This 13× increase represents a fundamental transformation of how campaigns are funded and who has disproportionate influence over election outcomes.",
                    beliefBias: "The scale of the change often surprises people who have abstract concerns about money in politics but haven't seen the actual numbers."
                )
            ],
            actionStep: "Go to OpenSecrets.org and look up outside spending for the last election in your congressional district. See which Super PACs spent money there and, if disclosed, who funded them. This is public information — most people just don't know it exists."
        ),

        DDModule(
            id: "dd_c2_m2",
            number: 2,
            title: "Where the Money Goes",
            subtitle: "2024 top donors decoded — tech, pharma, finance",
            emoji: "📊",
            readingTime: 11,
            body: """
**Reading the 2023–2024 Cycle Data**

OpenSecrets tracks all disclosed political spending. Here's what the 2023–2024 cycle actually shows. The story is not simply "corporations buy Republicans" — it's more complicated and more troubling.

**Tech, Crypto & Aerospace: The 2024 Dominant Sector**

Elon Musk / SpaceX-linked spending: ~$288.7 million (99% conservative / outside spending)
This represents the largest individual political spend in American history by a single person in a single cycle. Musk founded America PAC, which spent over $200 million for Donald Trump's campaign and on voter registration efforts in swing states.

Andreessen Horowitz (a16z): ~$89 million, mostly outside, mixed partisan
Coinbase: ~$79 million, heavy crypto industry PACs
Ripple (XRP): ~$63.6 million

The crypto sector's massive 2024 spending was specifically targeted at electing candidates who would block or delay crypto regulation. The industry faced potential SEC enforcement actions and wanted regulatory relief. The outcome: a pro-crypto Congress and administration, with crypto regulation pushed off the table in 2025.

**Big Pharma: The Bipartisan Access Game**

Abbott Laboratories: $5.24M (heavy conservative outside)
Pfizer: $2.23M (leans Democrat)
Merck: $1.95M (leans Democrat)
AbbVie: $1.67M; Amgen: $1.45M

Drug industry total lobbying: $391 million in 2024 alone

The pharmaceutical industry plays both sides. They give to both parties' key legislators, especially those on committees overseeing drug pricing and FDA regulation. This "access insurance" strategy means that regardless of who wins, the industry has relationships with the people writing drug policy. Drug pricing legislation consistently stalls despite 80%+ public support for Medicare drug price negotiation.

**Finance: Concentrated Conservative**

Citadel (Ken Griffin): $108.7 million (heavily conservative)
Susquehanna Financial: $101.5 million (heavily conservative)

These are hedge funds. Their primary policy interest is in avoiding financial regulation, maintaining favorable capital gains tax treatment, and opposing any "financial transaction tax" proposals.

**Agribusiness: Farm Bill Protection**

Mountaire Corp: ~$21.4M (almost entirely conservative)
Reyes Holdings: ~$21.3M (conservative)
Cargill, Altria/Philip Morris: $4–13M each, often bipartisan

These donors are primarily protecting farm subsidies (approximately $11.3 billion in federal payments in 2023), food safety regulations, and trade policy.

**What They Buy: Return on Investment**

The 2017 Republican tax bill reduced the corporate tax rate from 35% to 21%. For a company with $1 billion in taxable income, this represents $140 million/year in tax savings — forever. An industry that spent $10 million helping elect that Congress made back 14× in the first year alone. Political spending is an investment with documented returns.

**The Bipartisan Reality**

Both parties' institutions receive significant corporate money. The difference is often in which industries favor which party:
— Republicans receive more from fossil fuels, guns, construction, traditional finance
— Democrats receive more from entertainment, tech (especially pre-2024), education, healthcare
— Many industries play both sides for access insurance

The assumption that Democrats are "the party of the people" while Republicans are "the party of corporations" is contradicted by the donation data. The difference is more about which corporations and which policy areas, not whether corporations influence both parties.

**Who Refuses Corporate PAC Money**

A small but documented group of politicians have pledged to refuse corporate PAC contributions:
— House: Alexandria Ocasio-Cortez, Pramila Jayapal, Ro Khanna, Barbara Lee, Rashida Tlaib
— Senate: Bernie Sanders, Mark Kelly and Elissa Slotkin (co-sponsored Ban Corporate PACs Act 2025)
— Note: These pledges have varying definitions — some still accept individual executive donations, leadership PACs, or party committee money. Very few Republicans have made similar pledges.

The pledge doesn't guarantee independence — politicians can still be influenced by the prospect of corporate money flowing to primary challengers. But it reduces direct transactional relationships.
""",
            keyStats: [
                DDStat(number: "$288M", label: "Single donor (Musk) in 2024 — largest in US history", color: .red),
                DDStat(number: "$391M", label: "Pharma lobbying in 2024 alone", color: .orange),
                DDStat(number: "14×", label: "Typical ROI on political investment (tax bill example)", color: .green),
                DDStat(number: "80%+", label: "Public support for drug price negotiation — still stalled", color: .blue)
            ],
            beliefAuditPrompt: "Most people assume 'big money' primarily flows to one party. The data shows both parties receive significant corporate donations, from different industries. Does this change your assumption about which party is more 'bought' — or does it suggest the problem is systemic rather than partisan?",
            quiz: [
                DDQuestion(
                    question: "The pharmaceutical industry's strategy of donating to both parties is called:",
                    options: ["Bribery — it's illegal", "Access insurance — buying influence regardless of who wins", "Bipartisan compromise — industry working with both sides", "Lobbying — which is separate from campaign donations"],
                    correctIndex: 1,
                    explanation: "When an industry donates to both parties' key legislators, it ensures relationships regardless of electoral outcomes. This 'access insurance' is the documented dominant strategy for industries like pharma that are regulated by congressional committees with members from both parties.",
                    beliefBias: "People who believe 'their party' doesn't take corporate money often haven't looked at the donation data for both parties."
                ),
                DDQuestion(
                    question: "The crypto industry's massive 2024 political spending ($79M+ from Coinbase alone) was primarily aimed at:",
                    options: ["Promoting digital literacy education", "Blocking or delaying crypto regulation and SEC enforcement", "Supporting international cybersecurity legislation", "Funding congressional IT infrastructure"],
                    correctIndex: 1,
                    explanation: "Coinbase, Ripple, and other crypto companies faced potential SEC enforcement and regulatory frameworks that could limit their business models. Their 2024 spending specifically targeted candidates who would oppose crypto regulation. The outcome was a pro-crypto Congress and administration with enforcement actions shelved in 2025.",
                    beliefBias: "Political spending always has a policy objective. Finding it requires asking what regulations the donor most wants to prevent or pass."
                ),
                DDQuestion(
                    question: "If a corporation spends $10 million helping elect a Congress that cuts their taxes by $140 million/year permanently, that investment:",
                    options: ["Represents corruption and should be prosecuted", "Represents legal political speech under Citizens United with a 14× first-year return", "Is unusual — most political investments don't have measurable returns", "Is prohibited under campaign finance law"],
                    correctIndex: 1,
                    explanation: "Under current law, this is legal. Corporate political spending is protected First Amendment speech. The 2017 tax bill represented massive measurable returns for industries that invested in electing that Congress. This is the documented mechanism — not corruption in the legal sense, but structural alignment of legislative outcomes with donor interests.",
                    beliefBias: "Understanding that this is legal — and that the legal framework itself is the problem — changes what kind of reform is needed."
                )
            ],
            actionStep: "Go to OpenSecrets.org/industries and find your own congressional representative. Look at their top industry donors and cross-reference with their committee assignments and voting record on legislation affecting those industries. The pattern is usually obvious."
        ),

        DDModule(
            id: "dd_c2_m3",
            number: 3,
            title: "Reform: What Would Actually Work",
            subtitle: "Public financing, disclosure, and the Ban Corporate PACs Act",
            emoji: "🔧",
            readingTime: 9,
            body: """
**The Four Major Reform Proposals**

Reform advocates have four primary legislative pathways, each with different mechanisms, trade-offs, and political prospects.

**Reform 1: Overturn Citizens United (Constitutional Amendment)**

Citizens United is a Supreme Court ruling, which means the only permanent solution is either a new Supreme Court ruling or a constitutional amendment. An amendment requires two-thirds of both chambers of Congress and three-quarters of states. No amendment has passed Congress in 30+ years.

Public support: ~70% of Americans support overturning Citizens United, including majorities of Republicans, Democrats, and independents.

Political obstacle: Any bill proposing such an amendment requires Congress to vote to reduce its own access to campaign money. The incumbents who would pass it are the same incumbents who benefit from the current system. There is a structural conflict of interest in expecting those who benefit from a corrupt system to reform it.

**Reform 2: The DISCLOSE Act (Full Disclosure)**

The DISCLOSE Act (repeatedly introduced since 2010) would require any organization spending $10,000+ on federal elections to disclose donors. This would eliminate dark money without banning it. The argument: if you want to spend on elections, the public has a right to know who you are.

Has passed the House multiple times. Has been filibustered in the Senate multiple times. Has never become law. The filibuster requires 60 Senate votes, which the majority has never reached.

**Reform 3: Public Financing (Democracy Dollars)**

Small-dollar public financing systems provide candidates with public matching funds for small donations, amplifying the influence of ordinary donors. Washington D.C. gives candidates $11 in public match for every $1 in small donations (up to $200). New York City has a similar program.

Studies find that public matching programs dramatically increase the diversity of donors and reduce candidates' dependence on large donors. The argument against: it uses taxpayer money to fund political campaigns, including candidates some taxpayers oppose.

**Reform 4: Ban Corporate PACs Act (2025)**

Introduced by Senators Mark Kelly and Elissa Slotkin in 2025, this would ban corporate PAC contributions to federal candidates. It does not address Super PACs or dark money (which are the dominant post-Citizens United vehicles), but would eliminate direct corporate PAC contributions. Status: in committee as of early 2026.

**The Filibuster Problem**

Most campaign finance reform has passed the House in recent sessions. The Senate filibuster — which requires 60 votes to advance most legislation — effectively gives a minority the power to block legislation with majority support. The DISCLOSE Act has 50+ Senate supporters but cannot reach 60 because all Republicans oppose it, and without 60 votes, it can't come to a final vote.

**International Comparison**

Most other democracies have stricter campaign finance laws than the United States:
— Canada: Corporations and unions are banned from donating to federal parties
— UK: Caps on total campaign spending during election periods
— Germany: Parties receive public funding based on vote share; donations have low caps
— France: Private polling companies, corporations, and foreign nationals are banned from donating

None of these countries have eliminated money in politics. But they have dramatically lower caps on its influence.
""",
            keyStats: [
                DDStat(number: "70%", label: "Americans who support overturning Citizens United", color: .blue),
                DDStat(number: "60", label: "Senate votes needed to advance most reform bills", color: .orange),
                DDStat(number: "11:1", label: "DC public financing match ratio for small donors", color: .green),
                DDStat(number: "0", label: "Major campaign finance reforms enacted since 2002", color: .red)
            ],
            beliefAuditPrompt: "70% of Americans support overturning Citizens United — across party lines. Yet no reform has passed. What does it mean for democracy when a 70% majority position has been blocked for 15 years? What does that tell you about how responsive the system is to public opinion?",
            quiz: [
                DDQuestion(
                    question: "Why has the DISCLOSE Act (full donor disclosure requirement) failed to become law despite passing the House?",
                    options: ["It's unconstitutional under Citizens United", "The President has vetoed it multiple times", "The Senate filibuster requires 60 votes, and it has never reached that threshold", "It has been ruled unconstitutional by the Supreme Court"],
                    correctIndex: 2,
                    explanation: "The DISCLOSE Act has passed the House multiple times. In the Senate, the filibuster requires 60 votes to advance most legislation. Despite majority support, it has never reached 60 votes because no Republican senators have supported it, and the Democratic caucus has never had 60 Senate seats.",
                    beliefBias: "Many people blame the Supreme Court for the current dark money problem, when the more immediate barrier to the disclosure fix is the Senate filibuster."
                ),
                DDQuestion(
                    question: "Public matching programs for small campaign donations have been found to:",
                    options: ["Increase candidate dependence on large donors", "Have no effect on donation patterns", "Increase the diversity of donors and reduce dependence on large donors", "Be ruled unconstitutional in all 50 states"],
                    correctIndex: 2,
                    explanation: "Studies of New York City, Washington D.C., and other jurisdictions with small-dollar matching programs find that they dramatically increase the share of small donors and reduce candidates' structural dependence on large donors. The DC 11:1 match means a $100 small donation is worth $1,200 to a participating candidate.",
                    beliefBias: nil
                ),
                DDQuestion(
                    question: "Most other wealthy democracies differ from the US in campaign finance by:",
                    options: ["Having stricter campaign spending limits with no evidence of less political speech", "Having more corporate political spending than the US", "Banning elections entirely — campaigns are purely party-based", "Following the same Citizens United precedent"],
                    correctIndex: 0,
                    explanation: "Canada bans corporate and union federal donations. The UK caps total campaign spending. Germany uses public financing with low private caps. France bans corporate donations entirely. None of these countries have suppressed political speech — they have reduced the concentration of political influence in wealthy donors.",
                    beliefBias: "The argument that any limit on campaign spending means less political speech doesn't hold up to international comparison. Many democracies have robust political speech with strict finance limits."
                )
            ],
            actionStep: "Contact your senators and ask specifically where they stand on the DISCLOSE Act. Ask whether they support the 60-vote filibuster threshold for campaign finance reform or would support a simple majority vote. Their answer tells you their actual position on reform versus their stated position."
        )
    ]
)

// MARK: ═══════════════════════════════════════════════════════════════
// COURSE 3: ELECTION REFORM & BETTER ALTERNATIVES
// ═══════════════════════════════════════════════════════════════════

let ddCourse3 = DDCourse(
    id: "dd_c3",
    number: 3,
    title: "The Election Illusion",
    subtitle: "What's broken, what's better, and how we get there",
    emoji: "🔄",
    accentHex: "#FF7B3A",
    level: "Advanced",
    estimatedMinutes: 85,
    modules: [

        DDModule(
            id: "dd_c3_m1",
            number: 1,
            title: "What's Actually Broken",
            subtitle: "The structural failures no one party can fix alone",
            emoji: "🔬",
            readingTime: 9,
            body: """
**The Diagnosis First**

Before evaluating reforms, you need a clear diagnosis. What specific problems does the system have? "It's corrupt" is not a diagnosis. "Primaries select for ideologically extreme candidates who don't represent the median voter" is a diagnosis. Precision matters because different diagnoses call for different solutions.

**Problem 1: Primaries Select for Extremism**

As detailed in Course 1, primary elections with 20–30% turnout systematically select candidates who appeal to the ideologically committed base rather than the general electorate. This produces nominees who are often more extreme than the median voter in their own party, let alone the district or state.

Evidence: Polarization researchers have documented a significant increase in ideological extremism among members of Congress since the 1990s, correlating with the rise of closed primaries, partisan redistricting, and primary challenges from ideological activists.

**Problem 2: The Spoiler Effect Eliminates Third Options**

The plurality voting system (first-past-the-post) makes third-party candidacies structurally destructive. Ralph Nader in 2000 received 97,000 votes in Florida — almost certainly more aligned with Gore than Bush — while Bush won the state by 537 votes. By running and splitting the vote with Gore, Nader arguably cost Gore the presidency and handed it to Bush. Many Nader voters in retrospect would not have chosen to do this.

Under plurality voting, any voter who supports a third-party candidate risks being a "spoiler." This forces voters into a binary choice between the lesser of two evils. Third parties cannot break through, not because voters don't want alternatives, but because the voting math punishes choosing them.

**Problem 3: Winner-Take-All Wastes Votes**

In a district that votes 52% Republican and 48% Democratic, 100% of that district's congressional representation goes to the Republican. The 48% are unrepresented. Their votes counted for nothing in terms of actual representation. At the scale of the House of Representatives, this produces a chamber where tens of millions of voters have no effective representation.

**Problem 4: Polarization Feeds on Itself**

As primary processes produce more extreme nominees, the governing options become more extreme. As governing becomes more extreme and partisan, voters become more tribal. As voters become more tribal, they participate more in primaries to protect their side. The cycle accelerates. Each turn produces candidates who are more extreme than the last, requiring more outrage to compete, requiring more extreme positions to win.

**The System Is Working As Designed — Just Not For You**

Here's the counter-intuitive insight: none of these problems are malfunctions. They are structural features that serve specific interests:

— Extreme primaries benefit incumbents who are already in the base's good graces
— Gerrymandering benefits the party that controls redistricting
— The spoiler effect benefits the two major parties by eliminating competition
— Winner-take-all consolidates power for whoever wins plurality

The system is not broken. It is optimized — for the people currently winning it. Reform requires changing structures that those in power have incentives to preserve.
""",
            keyStats: [
                DDStat(number: "20%", label: "Primary turnout that determines 80% of safe-seat outcomes", color: .red),
                DDStat(number: "537", label: "Votes that decided 2000 FL — Nader got 97,000 there", color: .orange),
                DDStat(number: "48%", label: "Losing voters in winner-take-all with zero representation", color: .purple),
                DDStat(number: "0", label: "Third parties that have won a federal election in 60+ years", color: .blue)
            ],
            beliefAuditPrompt: "Do you believe the problems with American democracy are primarily caused by one party's bad actions — or by structural features that both parties use and benefit from? Your answer to this question determines whether you think the solution is 'vote out the bad guys' or 'change the rules.'",
            quiz: [
                DDQuestion(
                    question: "The 'spoiler effect' refers to:",
                    options: ["Incumbents who spoil reform efforts", "Third-party candidates splitting the vote and causing their closest major-party ally to lose", "Media coverage that spoils election surprises", "Super PACs that destroy candidates' reputations"],
                    correctIndex: 1,
                    explanation: "Under plurality voting, a third-party candidate who draws more votes from one major party than the other can cause that party to lose — even though most of the third-party voters would have preferred that major party over the other. This is why third parties rarely succeed and why voters feel trapped in binary choices.",
                    beliefBias: "Many voters blame third-party voters for 'spoiling' elections without questioning whether the voting system itself is the actual problem."
                ),
                DDQuestion(
                    question: "Why do structural problems like gerrymandering and extreme primaries persist despite widespread public opposition?",
                    options: ["Because the public doesn't really oppose them — polls are misleading", "Because the people who could change them are the same people who benefit from them", "Because they're constitutionally required", "Because there are no viable alternatives"],
                    correctIndex: 1,
                    explanation: "Incumbents benefit from the current system. Gerrymandered districts protect their seats. Extreme primaries mobilize their base. Corporate campaign money funds their campaigns. Asking incumbents to reform the system that keeps them in power is structurally difficult — which is why citizen-initiated ballot measures have been the primary vehicle for redistricting reform.",
                    beliefBias: "The assumption that 'good politicians will fix it' underestimates the structural incentives against reform."
                ),
                DDQuestion(
                    question: "Polarization researchers have found that Congressional ideological extremism since the 1990s:",
                    options: ["Has decreased as the parties become more moderate", "Has increased on both sides, with Republican members moving further right than Democrats moved left", "Is driven exclusively by Democratic radicalization", "Is a media narrative not supported by voting data"],
                    correctIndex: 1,
                    explanation: "Political scientists studying Congressional voting records (like DW-NOMINATE scores) find significant polarization increases since the 1980s, with Republican members moving further from the center than Democratic members. Both parties have polarized; the asymmetry in extent is documented. The causes include primaries, gerrymandering, closed information ecosystems, and campaign finance incentives.",
                    beliefBias: "The belief that 'both sides are equally extreme' is not supported by legislative voting data, though both have moved away from the center."
                )
            ],
            actionStep: "Find your congressional representative's DW-NOMINATE score — a political science measure of ideological position. Compare it to where the score was for their predecessor in the same seat 20 years ago. You can find this at voteview.com. The trend over time tells the polarization story more clearly than any news article."
        ),

        DDModule(
            id: "dd_c3_m2",
            number: 2,
            title: "Ranked Choice Voting",
            subtitle: "The best practical upgrade we already have evidence for",
            emoji: "🏆",
            readingTime: 11,
            body: """
**How RCV Actually Works**

Ranked Choice Voting (RCV) — also called instant-runoff voting — replaces the plurality "choose one" system with a ranked ballot. Voters rank candidates in order of preference: 1st choice, 2nd choice, 3rd choice, and so on. You can rank all candidates or just a few.

*Counting Process:*
Round 1: Count all first-choice votes. If any candidate has more than 50%, they win immediately.
If no candidate has 50%: Eliminate the last-place candidate. Redistribute their ballots — each ballot goes to the voter's next ranked choice among remaining candidates.
Repeat until someone has a majority.

*Key Result:* The winner has genuine majority support — more than 50% of voters chose them (directly or through ranked preferences) over everyone else. No spoilers. No strategic voting required.

**Real Results: Maine**

Maine adopted RCV for federal elections in 2016 after a referendum. In 2018, the 2nd Congressional District race went to multiple rounds. Democrat Jared Golden overtook Republican Bruce Poliquin after ranked choice redistribution. This was the first use of RCV in a federal general election. Poliquin challenged it in court — the courts upheld it.

Maine has now used RCV for multiple election cycles. What changed: Independent candidates ran without forcing voters to choose between them and their major-party preference. Campaigns shifted tone — candidates spent less time attacking opponents and more time appealing to voters who might rank them 2nd.

**Real Results: Alaska (2022)**

Alaska adopted RCV through ballot initiative in 2020, paired with a nonpartisan top-four primary. In the 2022 Senate race, incumbent Lisa Murkowski, a moderate Republican, faced a Trump-endorsed challenger, Kelly Tshibaka. Under the old system, the Republican primary would likely have been Murkowski's most dangerous moment — Tshibaka appealed strongly to the Trump base.

Under RCV, Murkowski appealed to the full electorate, including Democrats who preferred her over both Republican options. She won — demonstrating that RCV can allow moderate candidates to survive in districts where the party base would otherwise eliminate them. She won with broad coalition support rather than a narrow partisan plurality.

**Where RCV Is Used (as of Feb 2026)**

48 jurisdictions in the United States use some form of ranked choice voting, including:
— Maine (federal elections)
— Alaska (state and federal elections, paired with top-four primary)
— New York City (Democratic primaries)
— San Francisco
— Minneapolis
— St. Paul
— Portland, Oregon
— Over 30 other cities and counties

This represents approximately 14 million American voters with RCV experience. The evidence base is now substantial.

**What Research Shows**

Studies of RCV jurisdictions (FairVote, MIT Election Lab, academic researchers):
— Reduced negative campaigning: Candidates have incentive to be voters' 2nd choice, which means attacking opponents harms them with those opponents' voters
— Higher satisfaction with outcomes: Winners have majority support; fewer voters feel their vote was "wasted"
— More diverse candidates: Removes the spoiler barrier to third-party and independent candidates
— Comparable or higher turnout: No evidence that more complex ballots reduce participation in jurisdictions with voter education
— Reduced "lesser of two evils" voting: Voters can honestly express first preferences without strategic calculation

**Common Objections**

*"It's too complicated."* Studies find voters learn it quickly. Alaska exit polls found 83% of voters said RCV was "simple" or "somewhat simple." Australia has used it for 100+ years with a less-educated electorate than the US.

*"Counting takes longer."* True in close races. The 2022 Alaska Senate race took about a week to fully resolve. For most races, it's not an issue.

*"People don't understand it."* This is addressed by voter education. The system itself is not complex — you're just ranking candidates.

**The Bigger Picture**

RCV doesn't fix everything. It doesn't address dark money, gerrymandering, or the Electoral College. What it does: removes the spoiler effect, allows genuine majority representation, reduces negative campaigning incentives, and enables more candidate diversity. For the specific problem it addresses, the evidence is strong.
""",
            keyStats: [
                DDStat(number: "48", label: "US jurisdictions using RCV as of Feb 2026", color: .blue),
                DDStat(number: "14M", label: "American voters with RCV experience", color: .green),
                DDStat(number: "83%", label: "Alaska voters who found RCV 'simple' or 'somewhat simple'", color: .purple),
                DDStat(number: "100+", label: "Years Australia has used RCV at national level", color: .orange)
            ],
            beliefAuditPrompt: "Most Americans have been told that our current voting system is the only practical option. But 14 million Americans already vote with RCV and 100-year track records exist in other countries. Is your resistance to electoral reform based on genuine evidence that RCV doesn't work — or on the assumption that 'the American system is the best system' that you never fully examined?",
            quiz: [
                DDQuestion(
                    question: "Under Ranked Choice Voting, the spoiler effect is eliminated because:",
                    options: ["Third parties are banned from running", "Voters rank preferences, so their ballot transfers to their next choice if their first choice is eliminated — meaning voting for a minor candidate can't cause their least preferred major candidate to win", "Multiple candidates from the same party are allowed to run together", "The top two candidates always advance to a separate runoff"],
                    correctIndex: 1,
                    explanation: "Under RCV, if your first choice is eliminated, your ballot goes to your second choice. This means voting for a third-party candidate you prefer can't hurt your major-party preference. You're never forced to vote strategically — you can honestly express your first preference without 'wasting' your vote.",
                    beliefBias: "The assumption that you have to vote strategically (lesser of two evils) is a feature of plurality voting, not a feature of democracy. RCV removes this constraint."
                ),
                DDQuestion(
                    question: "Lisa Murkowski's 2022 Alaska Senate victory under RCV demonstrated:",
                    options: ["That extreme candidates win under RCV because they have the most motivated base", "That moderate candidates who appeal broadly can win even when the party base opposes them, because they accumulate 2nd and 3rd choice votes", "That RCV produces the same results as plurality voting", "That Democrats benefit most from RCV"],
                    correctIndex: 1,
                    explanation: "Murkowski, a moderate Republican opposed by the Trump-endorsed candidate, won by building a coalition that included Democrats and independents who ranked her 2nd or 3rd. Under the old closed primary system, she would have faced a hostile Republican base. RCV allowed her to appeal to the full electorate rather than just her partisan base.",
                    beliefBias: nil
                ),
                DDQuestion(
                    question: "Research on RCV campaigns compared to plurality campaigns most consistently finds:",
                    options: ["RCV produces more negative advertising because candidates compete for 2nd-choice votes", "RCV reduces negative campaigning because attacking opponents alienates their voters who might rank you 2nd", "RCV has no effect on campaign tone", "RCV only affects third-party candidates"],
                    correctIndex: 1,
                    explanation: "Under RCV, a candidate benefits from being voters' second choice, not just their first. Aggressively attacking an opponent alienates that opponent's supporters, who are less likely to rank the attacker 2nd. This creates a structural incentive for more civil campaigning — documented in both survey research and campaign spending data from RCV jurisdictions.",
                    beliefBias: "The assumption that negative campaigning is inevitable reflects the structure of plurality voting, not human nature."
                )
            ],
            actionStep: "Use the RCV simulator in this course to run a mock election. Try running the same candidates under both plurality and RCV rules and see if the winner changes. Then look up whether your state or city has any pending RCV legislation — FairVote.org has a state-by-state tracker."
        ),

        DDModule(
            id: "dd_c3_m3",
            number: 3,
            title: "The Full Reform Package",
            subtitle: "What a functioning democracy looks like — and how we get there",
            emoji: "🌐",
            readingTime: 10,
            body: """
**No Single Fix**

The problems with American democracy are structural and interconnected. There is no single reform that fixes everything. The full package of evidence-backed reforms addresses each specific problem:

**For Extremism in Primaries:**
— Ranked Choice Voting (eliminates spoilers, allows moderate survival)
— Open primaries (allow independents to participate — 40% of voters currently locked out)
— Nonpartisan "jungle" primaries (top-4 advance, as in Alaska)

**For Gerrymandering:**
— Independent redistricting commissions (demonstrated success in 8 states)
— Multi-member districts with proportional representation (represents all voters, not just pluralities)
— Court challenges using state constitutional provisions (where Rucho doesn't apply)

**For Money in Politics:**
— DISCLOSE Act (full donor transparency)
— Small-dollar public matching programs
— Ban Corporate PACs Act
— Constitutional amendment overturning Citizens United (long-term)

**For Electoral College:**
— National Popular Vote Interstate Compact (needs 270 EV; at 222 as of Feb 2026)
— Constitutional amendment (very long-term; requires 38 states)

**For Voter Access:**
— Automatic voter registration (when you interact with any government agency)
— Same-day voter registration (21 states already have this)
— National voting holiday or weekend voting
— Independent redistricting of polling places

**The Global Evidence**

The United States is not the only democracy that has wrestled with these problems. Most have arrived at different solutions with documented outcomes.

*Australia* has used compulsory voting + RCV for federal elections since 1924. Turnout: 90%+. Negative campaigning: significantly lower. Major parties have been forced to compete for the center rather than mobilize extreme bases.

*Germany* uses mixed-member proportional representation: half the parliament elected by districts, half by party-list proportional allocation. This ensures party seat share roughly matches vote share nationally while preserving local representation.

*Canada* has recently debated RCV reform extensively. A 2016 government commitment to reform was ultimately abandoned by the Liberal government after winning under the plurality system (a lesson in structural incentives against reform).

*New Zealand* switched from plurality voting to mixed-member proportional representation in 1996 following a referendum. Studies find more diverse parliament, more consensus-based legislation, and higher satisfaction with outcomes.

**The Ballot Initiative Path**

The most successful electoral reforms in recent US history have come through citizen ballot initiatives, not through Congress:
— Alaska's RCV + nonpartisan primary: passed by ballot initiative in 2020
— California's independent redistricting: ballot initiative 2010
— Michigan's independent redistricting + automatic voter registration: ballot initiative 2018
— Colorado's NPVIC: ballot initiative 2020

This is not a coincidence. Reforms that reduce incumbent power or party monopoly won't typically come from incumbents or parties. They come from citizens who use direct democracy tools to change the rules.

**The Cynicism Trap**

The most powerful argument against reform is: "It won't matter. The system is too corrupt to change." This argument has been used by every incumbent and every institution that benefits from the current arrangement since before the Civil Rights Act, before women's suffrage, before the 17th Amendment (direct election of senators, which was also "impossible" until it passed in 1913).

The history of American democracy is a history of citizens forcing structural changes that those in power said were impossible. Every voting right extension was "impossible" until it happened. The question is not whether change is possible — it demonstrably is. The question is whether you're going to be part of making it happen or part of the cynicism that prevents it.

**Your Actual Power**

Individual political actions that have documented impact:
1. Vote in primaries — 20% turnout means your vote is 5× more powerful than in a general election
2. Support ballot initiative campaigns for RCV and redistricting in your state
3. Give small amounts to candidates who refuse corporate PAC money (their $25 counts more relative to their donor base)
4. Contact your legislators specifically about the reforms you support — calls and letters have documented impact on swing-vote legislators
5. Show up in non-presidential years — congressional and state elections with low turnout amplify your individual impact
""",
            keyStats: [
                DDStat(number: "90%+", label: "Australian voter turnout with compulsory voting + RCV", color: .green),
                DDStat(number: "1913", label: "Direct election of senators finally passed — once 'impossible'", color: .blue),
                DDStat(number: "222", label: "NPVIC electoral votes — 48 short of activation (Feb 2026)", color: .orange),
                DDStat(number: "5×", label: "More powerful: your vote in a primary vs. general election", color: .purple)
            ],
            beliefAuditPrompt: "Are you more cynical about electoral reform than the historical evidence justifies? Women's suffrage was 'impossible.' Direct election of senators was 'impossible.' The Voting Rights Act was 'impossible.' All happened through sustained organized effort. What is the actual evidence that the cynicism is warranted — versus the cynicism being the thing that prevents action?",
            quiz: [
                DDQuestion(
                    question: "Most successful recent electoral reforms in the US (RCV in Alaska, independent redistricting in CA/MI) came through:",
                    options: ["Congressional legislation", "Supreme Court orders", "Citizen ballot initiatives, bypassing legislatures", "Presidential executive orders"],
                    correctIndex: 2,
                    explanation: "Because reforms that reduce incumbent power or party monopoly face structural opposition from the incumbents and parties who would vote on them, the most successful recent reforms have come through citizen ballot initiatives. This is not a coincidence — it's a structural consequence of who has to vote for reform.",
                    beliefBias: "Waiting for Congress to reform campaign finance or voting systems is waiting for incumbents to reduce their own advantages. Citizen-initiated reform has a significantly better track record."
                ),
                DDQuestion(
                    question: "Under mixed-member proportional representation (as used in Germany and New Zealand), seat share:",
                    options: ["Goes 100% to the winner of each district", "Roughly matches party vote share nationally, ensuring minority parties are represented", "Is determined by party leadership committees", "Ignores district-level results entirely"],
                    correctIndex: 1,
                    explanation: "Mixed-member proportional representation combines district representation (local winners get seats) with party list allocation (additional seats distributed to make total seats roughly proportional to vote share). If a party wins 30% of votes, they get roughly 30% of seats — even if they lost most individual districts. This dramatically reduces wasted votes.",
                    beliefBias: "Most Americans assume winner-take-all is the only way to do elections because it's the only way they've experienced. Most democracies use some form of proportional representation."
                ),
                DDQuestion(
                    question: "The National Popular Vote Interstate Compact would take effect when:",
                    options: ["Congress passes legislation authorizing it", "The Supreme Court approves the mechanism", "States representing 270+ electoral votes join the compact", "A constitutional amendment ratifies it"],
                    correctIndex: 2,
                    explanation: "The NPVIC is a contract among participating states to award all their electoral votes to the national popular vote winner. It activates only when states totaling at least 270 electoral votes have joined — enough to guarantee that the popular vote winner receives at least 270 electoral votes. This requires no federal action. As of Feb 2026, it's at 222 electoral votes, needing 48 more.",
                    beliefBias: "Many people assume reforming the Electoral College requires a constitutional amendment. The NPVIC is a legal mechanism that doesn't — which is why it's the most realistic near-term path."
                )
            ],
            actionStep: "Pick one reform from this module that you hadn't thought about before and research its current legislative status in your state. FairVote.org (RCV), NPVIC.org (Electoral College), and BrennanCenter.org (voting access and redistricting) all have state-by-state trackers. Then find one concrete action — a call, a donation, a ballot initiative signature — and do it before you close the app."
        )
    ]
)

// MARK: - All Courses Array
let allDemocracyDecodedCourses: [DDCourse] = [ddCourse1, ddCourse2, ddCourse3]
