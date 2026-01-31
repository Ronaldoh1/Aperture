// PoliticalCourses.swift
// Deep dives into Super PACs, Heritage Foundation, AIPAC, and more

import SwiftUI

// MARK: - Super PACs Course

struct SuperPACsCourse: View {
    var body: some View {
        CourseContentView(
            title: "Super PACs Exposed",
            subtitle: "Unlimited money, unlimited influence",
            icon: "dollarsign.circle.fill",
            iconColor: .green,
            lessons: [
                CourseLesson(
                    title: "What is a Super PAC?",
                    content: """
                    **Citizens United Changed Everything**
                    
                    In 2010, the Supreme Court ruled in Citizens United v. FEC that corporations and unions could spend unlimited money on elections, as long as they didn't "coordinate" with campaigns.
                    
                    **Super PACs (Independent Expenditure Committees):**
                    
                    • Can raise unlimited money from individuals, corporations, unions
                    • Can spend unlimited money on ads supporting or opposing candidates
                    • Must disclose donors (but there are ways around this)
                    • Cannot "coordinate" with campaigns (wink wink)
                    
                    **The Numbers:**
                    
                    • 2010: $62 million spent by Super PACs
                    • 2020: $2.6 BILLION spent by Super PACs
                    • Top 100 donors account for majority of Super PAC funding
                    
                    **The "Independence" Fiction:**
                    
                    Super PACs are "independent" but:
                    - Often run by former campaign staffers
                    - Share vendors and consultants
                    - Candidates publicly signal what ads they want
                    - Coordination rules are weakly enforced
                    """
                ),
                CourseLesson(
                    title: "Dark Money Explained",
                    content: """
                    **When Super PACs Aren't Transparent Enough**
                    
                    While Super PACs must disclose donors, "dark money" flows through 501(c)(4) "social welfare" organizations that don't have to disclose.
                    
                    **How Dark Money Works:**
                    
                    1. Billionaire gives to 501(c)(4) (no disclosure required)
                    2. 501(c)(4) gives to Super PAC (listed as organization, not individual)
                    3. Super PAC spends on election ads
                    4. Public never knows original source
                    
                    **Real Examples:**
                    
                    • Donors Trust: "Dark money ATM" for conservative causes
                    • Arabella Advisors: Liberal dark money network
                    • Both parties use these structures
                    
                    **The Scale:**
                    
                    • 2020 election: $1 billion+ in dark money
                    • Fastest growing category of political spending
                    • Impossible to trace original sources
                    """
                ),
                CourseLesson(
                    title: "Who Funds Super PACs?",
                    content: """
                    **Following the Money**
                    
                    Super PAC funding is dominated by a tiny number of ultra-wealthy donors.
                    
                    **Top Donor Categories:**
                    
                    • Finance/Investment: Wall Street wants deregulation
                    • Fossil Fuels: Oil/gas wants to block climate action
                    • Real Estate: Developers want favorable zoning/tax policy
                    • Tech: Silicon Valley wants light regulation
                    • Pharma: Drug companies want to protect pricing power
                    
                    **The Billionaire Primary:**
                    
                    Before voters ever weigh in, candidates must win the "billionaire primary":
                    
                    • Sheldon Adelson (casino): $500M+ lifetime political giving
                    • Koch Network: $400M+ per election cycle
                    • Michael Bloomberg: $1B+ in 2020 alone
                    • George Soros: $100M+ per cycle
                    
                    **What They Want:**
                    
                    These aren't charitable donations. Donors expect:
                    - Access to elected officials
                    - Favorable policy outcomes
                    - Regulatory appointments
                    - Tax policy that benefits their interests
                    """
                ),
                CourseLesson(
                    title: "Super PAC Tactics",
                    content: """
                    **How Super PACs Influence Elections**
                    
                    **1. Attack Ads**
                    
                    The majority of Super PAC spending is on negative advertising:
                    - Candidates can stay "positive" while PACs attack
                    - Creates plausible deniability
                    - Often runs misleading or out-of-context clips
                    
                    **2. Late Money Dumps**
                    
                    Flood airwaves in final weeks when:
                    - Opponents can't respond in time
                    - Fact-checkers can't keep up
                    - Voters form impressions that stick
                    
                    **3. Primary Manipulation**
                    
                    Sometimes Super PACs support the "weaker" opponent:
                    - Republican Super PACs funding far-left candidates
                    - Democratic Super PACs promoting extreme Republicans
                    - Goal: Create easier general election opponent
                    
                    **4. Issue Advocacy**
                    
                    Run ads on "issues" that clearly support one candidate:
                    - "Call Senator X and tell them to stop killing jobs"
                    - Technically not election ads, so fewer restrictions
                    """
                ),
                CourseLesson(
                    title: "Spotting Super PAC Influence",
                    content: """
                    **How to Follow the Money**
                    
                    **Resources:**
                    
                    • **OpenSecrets.org**: Comprehensive campaign finance data
                    • **FEC.gov**: Official filings (harder to navigate)
                    • **FollowTheMoney.org**: State-level data
                    • **ProPublica**: Investigative reporting
                    
                    **Red Flags to Watch:**
                    
                    1. Candidate has huge Super PAC support but claims to be "grassroots"
                    2. Sudden surge in ads from unknown groups
                    3. PAC names that sound like citizen groups but are industry funded
                    4. Candidates who vote against donor interests disappear
                    
                    **Questions to Ask:**
                    
                    • Who is funding this candidate's Super PAC?
                    • What industries benefit from this candidate's positions?
                    • How much small-dollar vs. big-dollar funding?
                    • Did positions change after large donations?
                    """
                ),
                CourseLesson(
                    title: "What Can Be Done?",
                    content: """
                    **Fighting Big Money**
                    
                    **Current Reform Efforts:**
                    
                    • **DISCLOSE Act**: Require disclosure of dark money (blocked in Senate)
                    • **Public Financing**: Matching funds for small donations
                    • **Constitutional Amendment**: Overturn Citizens United
                    • **State-Level Reforms**: Many states have stronger disclosure laws
                    
                    **What You Can Do:**
                    
                    1. **Research candidates' funding** before voting
                    2. **Support small-donor candidates** to shift incentives
                    3. **Share information** about who funds who
                    4. **Support reform organizations**: End Citizens United, Common Cause
                    5. **Vote for candidates** who support campaign finance reform
                    
                    **The Bigger Picture:**
                    
                    Campaign finance reform alone won't fix democracy. We also need:
                    - Voting rights protection
                    - Anti-gerrymandering reforms
                    - Media reform
                    - Ranked choice voting
                    
                    But following the money is the first step to seeing clearly.
                    """
                )
            ]
        )
    }
}

// MARK: - Heritage Foundation Course

struct HeritageFoundationCourse: View {
    var body: some View {
        CourseContentView(
            title: "The Heritage Foundation",
            subtitle: "The policy factory behind the curtain",
            icon: "building.2.fill",
            iconColor: .orange,
            lessons: [
                CourseLesson(
                    title: "What is Heritage?",
                    content: """
                    **The Most Influential Think Tank You've Never Heard Of**
                    
                    Founded in 1973, the Heritage Foundation is a conservative think tank that has shaped American policy for 50 years.
                    
                    **Key Facts:**
                    
                    • Budget: $80+ million annually
                    • Staff: 450+ policy experts
                    • Location: Washington D.C.
                    • Influence: Provided Reagan with "Mandate for Leadership" (2,000 pages of policy)
                    
                    **What They Do:**
                    
                    1. Write policy papers and model legislation
                    2. Train and place staff in government
                    3. Provide media talking points
                    4. Host events for policymakers
                    5. Rate members of Congress
                    
                    **The Revolving Door:**
                    
                    Heritage staff regularly move into:
                    - Congressional staff positions
                    - Executive branch appointments
                    - Judicial clerkships
                    - Media pundit roles
                    """
                ),
                CourseLesson(
                    title: "Project 2025",
                    content: """
                    **The Blueprint for the Next Administration**
                    
                    Project 2025 is Heritage's plan to reshape the entire federal government on Day 1 of a new administration.
                    
                    **Key Components:**
                    
                    1. **Policy Agenda**: 900+ page "Mandate for Leadership"
                    2. **Personnel Database**: 20,000+ vetted conservatives ready to appoint
                    3. **Training Academy**: Preparing appointees for government service
                    4. **"180-Day Playbook"**: Specific actions for each agency
                    
                    **Major Policy Goals:**
                    
                    • Dismantle the administrative state
                    • Reclassify civil servants to make them fireable
                    • Eliminate the Department of Education
                    • Restrict abortion access nationwide
                    • Expand presidential power
                    • Roll back environmental regulations
                    • Restructure the FBI and DOJ
                    
                    **Why It Matters:**
                    
                    This isn't just a wish list. It's a detailed implementation plan with:
                    - Specific executive orders ready to sign
                    - Legal justifications prepared
                    - Staff ready to implement
                    - Timeline for each action
                    """
                ),
                CourseLesson(
                    title: "Who Funds Heritage?",
                    content: """
                    **Following the Money**
                    
                    As a 501(c)(3), Heritage doesn't have to disclose donors. But investigative reporting has revealed:
                    
                    **Known Major Funders:**
                    
                    • **Koch Network**: Charles Koch foundations
                    • **Scaife Foundations**: Richard Mellon Scaife (deceased)
                    • **Bradley Foundation**: $5M+ annually
                    • **DeVos Family**: Education privatization advocates
                    • **Mercer Family**: Robert Mercer, hedge fund billionaire
                    
                    **Corporate Funders:**
                    
                    • ExxonMobil (climate skepticism)
                    • Pharmaceutical companies
                    • Defense contractors
                    • Financial institutions
                    
                    **The Donor Strategy:**
                    
                    Donors fund Heritage because it:
                    - Provides "academic" justification for their policy preferences
                    - Trains future government employees
                    - Shapes media narratives
                    - Provides a veneer of intellectual legitimacy
                    
                    **Tax Benefits:**
                    
                    Because Heritage is a 501(c)(3):
                    - Donations are tax-deductible
                    - Donors reduce their tax burden while shaping policy
                    - Public subsidizes private political agendas
                    """
                ),
                CourseLesson(
                    title: "Heritage's Network",
                    content: """
                    **The Conservative Policy Infrastructure**
                    
                    Heritage doesn't work alone. It's part of an interconnected network:
                    
                    **Think Tanks:**
                    
                    • American Enterprise Institute (AEI)
                    • Cato Institute
                    • Manhattan Institute
                    • Hoover Institution
                    
                    **Legal Organizations:**
                    
                    • Federalist Society (judges)
                    • Alliance Defending Freedom
                    • Pacific Legal Foundation
                    
                    **State-Level:**
                    
                    • State Policy Network (64 state think tanks)
                    • ALEC (model legislation)
                    • Americans for Prosperity
                    
                    **Media:**
                    
                    • Daily Signal (Heritage's media arm)
                    • The Daily Wire
                    • Fox News (frequent guest appearances)
                    
                    **How They Coordinate:**
                    
                    1. Heritage develops policy position
                    2. ALEC turns it into model legislation
                    3. State think tanks promote it locally
                    4. Federalist Society identifies judges to uphold it
                    5. Media amplifies the message
                    """
                ),
                CourseLesson(
                    title: "Policy Wins",
                    content: """
                    **Heritage's Track Record**
                    
                    **Reagan Administration:**
                    
                    • 60% of Heritage recommendations adopted
                    • Supplied hundreds of appointees
                    • Shaped tax cuts, deregulation, military buildup
                    
                    **Trump Administration:**
                    
                    • Heritage provided transition team members
                    • Supreme Court picks from Heritage/Federalist list
                    • Regulatory rollbacks followed Heritage playbook
                    • 64% of policy recommendations implemented in Year 1
                    
                    **Specific Policy Victories:**
                    
                    • 2017 Tax Cuts: Heritage-designed framework
                    • Paris Agreement withdrawal: Long-time Heritage goal
                    • Federal judge appointments: Heritage-vetted candidates
                    • EPA rollbacks: Heritage policy papers
                    • Education policy: School choice expansion
                    
                    **Ongoing Influence:**
                    
                    Even out of power, Heritage:
                    - Shapes Republican Party platform
                    - Trains next generation of staffers
                    - Provides opposition research
                    - Prepares for the next administration
                    """
                ),
                CourseLesson(
                    title: "Identifying Heritage Influence",
                    content: """
                    **Red Flags to Watch**
                    
                    **Signs a Candidate May Be Heritage-Aligned:**
                    
                    • Speaking at Heritage events
                    • Staff from Heritage background
                    • Citing Heritage "research" in speeches
                    • Endorsement from Heritage Action
                    • Positions matching Heritage policy papers
                    
                    **Heritage Action Scorecard:**
                    
                    Heritage rates every member of Congress. High scores indicate:
                    - Reliable votes on Heritage priorities
                    - Willingness to follow Heritage strategy
                    - Potential for Heritage support/opposition
                    
                    **Questions to Research:**
                    
                    1. Has this candidate worked at or with Heritage?
                    2. Do their policy positions match Heritage papers?
                    3. Who trained/mentored them in conservative policy?
                    4. Are they part of the Heritage pipeline?
                    
                    **Why This Matters:**
                    
                    Heritage-aligned candidates aren't independently developing policy. They're implementing an agenda designed by billionaire-funded think tanks.
                    
                    This doesn't make them wrong about everything. But voters deserve to know who's writing the script.
                    """
                ),
                CourseLesson(
                    title: "The Other Side",
                    content: """
                    **Liberal Think Tanks Exist Too**
                    
                    For balance, the progressive/liberal equivalent infrastructure:
                    
                    **Think Tanks:**
                    
                    • Center for American Progress (CAP)
                    • Brookings Institution
                    • Economic Policy Institute
                    • Roosevelt Institute
                    
                    **Legal:**
                    
                    • American Constitution Society
                    • ACLU
                    • Earthjustice
                    
                    **Funding:**
                    
                    • Soros Network (Open Society)
                    • Ford Foundation
                    • Rockefeller Foundation
                    • Tech billionaires
                    
                    **Key Differences:**
                    
                    • Conservative infrastructure is more coordinated
                    • Liberal groups often compete with each other
                    • Conservative movement started building in 1970s
                    • Both sides use same 501(c)(3) tax structures
                    
                    **The Bottom Line:**
                    
                    Both sides have policy infrastructure. The issue isn't that think tanks exist, but that:
                    
                    1. Donors have outsized influence on policy
                    2. "Research" is often reverse-engineered from conclusions
                    3. Voters don't know who's funding their representatives' ideas
                    4. The system advantages wealth over popular will
                    """
                )
            ]
        )
    }
}

// MARK: - AIPAC Course

struct AIPACCourse: View {
    var body: some View {
        CourseContentView(
            title: "AIPAC & Foreign Influence",
            subtitle: "How lobbying shapes foreign policy",
            icon: "globe.americas.fill",
            iconColor: .blue,
            lessons: [
                CourseLesson(
                    title: "What is AIPAC?",
                    content: """
                    **The American Israel Public Affairs Committee**
                    
                    AIPAC is one of the most powerful lobbying organizations in the United States.
                    
                    **Key Facts:**
                    
                    • Founded: 1963
                    • Members: 100,000+
                    • Budget: Estimated $100M+ annually
                    • Staff: 400+
                    
                    **What They Do:**
                    
                    1. Lobby Congress on Israel-related policy
                    2. Organize trips for members of Congress to Israel
                    3. Host annual policy conference (thousands of attendees)
                    4. Mobilize grassroots pressure on representatives
                    5. Support (until recently indirectly) pro-Israel candidates
                    
                    **Why It Matters:**
                    
                    AIPAC's influence is significant because:
                    - U.S. gives $3.8B+ annually to Israel
                    - U.S. vetoes UN resolutions critical of Israel
                    - U.S. weapons sales require AIPAC-friendly votes
                    - Middle East policy shapes regional conflicts
                    """
                ),
                CourseLesson(
                    title: "How AIPAC Works",
                    content: """
                    **The Lobbying Machine**
                    
                    **Congressional Trips:**
                    
                    AIPAC's education foundation funds trips to Israel for new members of Congress:
                    - All-expenses-paid tours
                    - Meetings with Israeli officials
                    - Framing of the conflict from one perspective
                    - Relationship-building for future lobbying
                    
                    **Policy Conference:**
                    
                    The annual AIPAC conference features:
                    - Speeches by top U.S. politicians (both parties)
                    - "Lobby Day" where attendees visit their representatives
                    - Networking between donors and candidates
                    
                    **The "No Daylight" Doctrine:**
                    
                    AIPAC promotes "no daylight" between U.S. and Israeli policy:
                    - Criticism of Israeli policy = criticism of Israel
                    - Criticism of Israel = potentially antisemitic
                    - This framing limits policy debate
                    
                    **Bipartisan Strategy:**
                    
                    Unlike most lobbies, AIPAC works both sides:
                    - Strong relationships with both parties
                    - Makes Israel support "consensus" not partisan
                    - Isolates critics as "fringe"
                    """
                ),
                CourseLesson(
                    title: "United Democracy Project",
                    content: """
                    **AIPAC's Super PAC**
                    
                    In 2022, AIPAC created its first Super PAC, United Democracy Project (UDP).
                    
                    **First Election Cycle (2022):**
                    
                    • Spent: $26+ million
                    • Primary targets: Progressive Democrats critical of Israel
                    • Results: Defeated several incumbent critics
                    
                    **Strategy:**
                    
                    UDP doesn't run on Israel policy. Instead:
                    - Funds attack ads on other issues
                    - Supports "moderate" primary challengers
                    - Floods airwaves in final weeks
                    - Never mentions Israel in ads
                    
                    **Funding Sources:**
                    
                    Top donors include:
                    - Republican mega-donors giving to Democratic primaries
                    - This unusual pattern reveals the single-issue focus
                    
                    **Why This Matters:**
                    
                    When a foreign policy lobby can:
                    - Spend millions to defeat members of Congress
                    - Use money from opposing party donors
                    - Run ads that never mention the actual issue
                    
                    It creates a chilling effect on policy debate.
                    """
                ),
                CourseLesson(
                    title: "Impact on Policy",
                    content: """
                    **What AIPAC Has Achieved**
                    
                    **Military Aid:**
                    
                    • $3.8B annual commitment (2016-2026 MOU)
                    • Largest recipient of U.S. foreign aid
                    • Advanced weapons systems (F-35s, etc.)
                    • Iron Dome funding
                    
                    **UN Vetoes:**
                    
                    U.S. has vetoed dozens of UN resolutions critical of Israel:
                    - Settlements in occupied territories
                    - Military actions in Gaza
                    - East Jerusalem status
                    
                    **Anti-BDS Laws:**
                    
                    35+ states have passed laws restricting boycotts of Israel:
                    - Some require contractors to pledge not to boycott
                    - First Amendment challenges ongoing
                    - AIPAC promoted model legislation
                    
                    **Iran Policy:**
                    
                    AIPAC lobbied heavily against the Iran nuclear deal:
                    - Multi-million dollar ad campaign
                    - Pressured Democrats to oppose Obama
                    - Eventually, deal was withdrawn under Trump
                    """
                ),
                CourseLesson(
                    title: "Other Foreign Lobbies",
                    content: """
                    **AIPAC Isn't Alone**
                    
                    Many countries lobby the U.S. government:
                    
                    **Saudi Arabia:**
                    
                    • Spends $20M+ annually on lobbying
                    • Hired multiple lobbying firms
                    • Funded think tanks
                    • Major weapons buyer ($100B+ deal)
                    
                    **UAE:**
                    
                    • Aggressive Washington presence
                    • Funds think tanks and universities
                    • Influenced Libya, Yemen policy
                    
                    **China:**
                    
                    • State media presence
                    • Confucius Institutes (many now closed)
                    • Business community lobbying
                    
                    **Russia:**
                    
                    • Various influence operations exposed
                    • NRA connections investigated
                    • Social media manipulation
                    
                    **The Difference:**
                    
                    AIPAC is unique because:
                    - It's domestic (American citizens, not foreign agents)
                    - Doesn't register under FARA
                    - Bipartisan establishment support
                    - Exceptionally well-organized and funded
                    """
                ),
                CourseLesson(
                    title: "Evaluating Influence",
                    content: """
                    **How to Assess Any Foreign Policy Lobby**
                    
                    **Questions to Ask:**
                    
                    1. What policy outcomes does this lobby seek?
                    2. Who funds them?
                    3. What access do they have to politicians?
                    4. How do they frame criticism of their position?
                    5. What happens to politicians who disagree?
                    
                    **Red Flags:**
                    
                    • Equating policy criticism with bigotry
                    • Spending heavily in primaries against critics
                    • Bipartisan support for policies voters don't prioritize
                    • Policy positions that don't match public opinion
                    
                    **For Voters:**
                    
                    • Check candidate's AIPAC relationship
                    • Look at campaign contributions from foreign-policy PACs
                    • Research Congressional trip sponsors
                    • Compare stated positions to voting records
                    
                    **The Bigger Picture:**
                    
                    Foreign policy should reflect:
                    - U.S. interests
                    - American values
                    - Public opinion
                    
                    When lobbying creates positions that contradict these, democracy suffers—regardless of which country the lobby supports.
                    """
                )
            ]
        )
    }
}

// MARK: - Gerrymandering Course

struct GerrymanderingCourse: View {
    var body: some View {
        CourseContentView(
            title: "Gerrymandering Decoded",
            subtitle: "How map-drawers choose voters",
            icon: "map.fill",
            iconColor: .red,
            lessons: [
                CourseLesson(
                    title: "The Basics",
                    content: """
                    **What is Gerrymandering?**
                    
                    Gerrymandering is manipulating electoral district boundaries to favor one party.
                    
                    Named after Elbridge Gerry, whose 1812 Massachusetts district resembled a salamander.
                    
                    **Two Main Techniques:**
                    
                    **Packing:** Concentrate opposition voters into few districts
                    - They win those by huge margins
                    - But have no influence elsewhere
                    
                    **Cracking:** Spread opposition voters across many districts
                    - They never achieve majority anywhere
                    - Votes are "wasted" in losing causes
                    
                    **Why It Matters:**
                    
                    In gerrymandered states:
                    - Election outcomes are predetermined
                    - Politicians choose voters, not vice versa
                    - "Safe" districts reduce accountability
                    - Extreme candidates win because only primaries matter
                    """
                ),
                CourseLesson(
                    title: "Real Examples",
                    content: """
                    **Gerrymandering in Action**
                    
                    **North Carolina:**
                    
                    2018 results:
                    - Republicans won 50% of votes
                    - Republicans won 10 of 13 seats (77%)
                    
                    **Wisconsin:**
                    
                    2018 results:
                    - Democrats won 53% of state legislature votes
                    - Democrats won only 36% of seats
                    
                    **Maryland:**
                    
                    Democrats drew a district so convoluted it was called "a broken-winged pterodactyl."
                    
                    **The Math:**
                    
                    Imagine 100 voters: 60 Blue, 40 Red
                    
                    **Fair Districts (10 districts of 10):**
                    - ~6 Blue districts, ~4 Red districts
                    
                    **Gerrymandered for Red:**
                    - Pack 50 Blue into 5 districts (10 Blue each, landslide wins)
                    - Spread remaining 10 Blue across 5 districts
                    - Each of those 5 has 6 Red, 4 Blue = Red wins
                    - Result: 5 Red seats, 5 Blue seats from 60-40 split
                    
                    Or worse: Create 6 districts with 7 Red, 3 Blue = 6 Red seats!
                    """
                ),
                CourseLesson(
                    title: "How It's Done",
                    content: """
                    **Modern Gerrymandering Technology**
                    
                    **Data Available:**
                    
                    • Voter registration records
                    • Past voting patterns (precinct level)
                    • Census demographic data
                    • Consumer data (purchases, subscriptions)
                    • Social media activity
                    
                    **Software:**
                    
                    Modern redistricting software can:
                    - Test millions of map configurations
                    - Predict outcomes with high accuracy
                    - Optimize for partisan advantage
                    - Make maps that look "reasonable"
                    
                    **Who Draws the Maps:**
                    
                    In most states:
                    - State legislature draws Congressional maps
                    - Governor signs or vetoes
                    - Whichever party controls both draws the lines
                    
                    **The 10-Year Cycle:**
                    
                    Redistricting happens after each Census (every 10 years):
                    - 2010 cycle: Republicans won big, drew favorable maps
                    - 2020 cycle: Mixed results, legal battles ongoing
                    - Maps lock in advantage for a decade
                    """
                ),
                CourseLesson(
                    title: "Legal Status",
                    content: """
                    **What the Courts Say**
                    
                    **Racial Gerrymandering:**
                    
                    Drawing districts to dilute minority voting power is ILLEGAL under:
                    - Voting Rights Act
                    - 14th Amendment Equal Protection
                    
                    But proving racial vs. partisan intent is difficult.
                    
                    **Partisan Gerrymandering:**
                    
                    The Supreme Court ruled in Rucho v. Common Cause (2019):
                    - Partisan gerrymandering claims are "non-justiciable"
                    - Federal courts cannot review them
                    - This is a POLITICAL question, not legal
                    
                    Chief Justice Roberts: Even "excessive" partisan gerrymandering is for voters and legislators to fix, not courts.
                    
                    **State Courts:**
                    
                    Some state courts have struck down maps under state constitutions:
                    - Pennsylvania
                    - North Carolina (initially)
                    - Ohio
                    
                    But this varies by state.
                    """
                ),
                CourseLesson(
                    title: "Solutions",
                    content: """
                    **How to Fix Gerrymandering**
                    
                    **Independent Commissions:**
                    
                    Take redistricting away from politicians:
                    - California: Citizens Redistricting Commission
                    - Arizona: Independent Redistricting Commission
                    - Michigan: Passed by ballot initiative in 2018
                    
                    Results: More competitive districts, less partisan manipulation.
                    
                    **Algorithmic Redistricting:**
                    
                    Use mathematical criteria:
                    - Compact, contiguous districts
                    - Respect existing boundaries
                    - Minimize county/city splits
                    - No partisan data input
                    
                    **Multi-Member Districts:**
                    
                    Instead of single-member "winner take all":
                    - Larger districts with multiple representatives
                    - Proportional representation
                    - Harder to gerrymander
                    
                    **What You Can Do:**
                    
                    • Support ballot initiatives for independent commissions
                    • Follow redistricting in your state
                    • Testify at public redistricting hearings
                    • Vote for candidates who support reform
                    """
                )
            ]
        )
    }
}

// MARK: - Corporate Capture Course

struct CorporateCaptureCourse: View {
    var body: some View {
        CourseContentView(
            title: "Corporate Capture",
            subtitle: "When regulators work for the regulated",
            icon: "briefcase.fill",
            iconColor: .yellow,
            lessons: [
                CourseLesson(
                    title: "What is Regulatory Capture?",
                    content: """
                    **When the Fox Guards the Henhouse**
                    
                    Regulatory capture occurs when agencies meant to regulate industries instead serve those industries' interests.
                    
                    **How It Happens:**
                    
                    1. **Revolving Door**: Industry executives become regulators, then return to industry
                    2. **Information Asymmetry**: Regulators depend on industry for expertise
                    3. **Lobbying**: Constant industry pressure on rules and enforcement
                    4. **Career Incentives**: Regulators want future industry jobs
                    
                    **Examples:**
                    
                    • SEC commissioners becoming Wall Street executives
                    • Pharma executives running FDA
                    • Telecom lawyers running FCC
                    • Oil executives running EPA
                    
                    **The Result:**
                    
                    Regulations that:
                    - Favor big companies over small competitors
                    - Create barriers to entry
                    - Impose fines that are "cost of doing business"
                    - Never result in criminal charges for executives
                    """
                ),
                CourseLesson(
                    title: "The Revolving Door",
                    content: """
                    **Personnel is Policy**
                    
                    **How It Works:**
                    
                    1. Work for industry, learn the business
                    2. Take government job, shape regulations
                    3. Return to industry with insider knowledge
                    4. Repeat, often multiple times
                    
                    **Real Examples:**
                    
                    **Finance:**
                    - Treasury Secretary from Goldman Sachs (multiple)
                    - SEC chairs to hedge funds
                    - Fed officials to banks they regulated
                    
                    **Pharma:**
                    - FDA commissioners to drug company boards
                    - Drug company executives to FDA
                    - Approval of drugs they later sell
                    
                    **Defense:**
                    - Pentagon officials to defense contractors
                    - Generals to boards of companies they bought from
                    - "Military-industrial complex"
                    
                    **Weak Rules:**
                    
                    "Cooling off" periods exist but:
                    - Often only 1-2 years
                    - Easy to circumvent through "consulting"
                    - Rarely enforced
                    - Don't address fundamental conflict
                    """
                ),
                CourseLesson(
                    title: "How Corporations Write Laws",
                    content: """
                    **ALEC and Model Legislation**
                    
                    **American Legislative Exchange Council (ALEC):**
                    
                    • Founded: 1973
                    • Members: ~2,000 state legislators
                    • Corporate "members" pay up to $50,000/year
                    • Produces "model bills" for state legislatures
                    
                    **How ALEC Works:**
                    
                    1. Corporations identify policy goals
                    2. ALEC drafts model legislation
                    3. Legislator members introduce bills in their states
                    4. Bills often pass word-for-word
                    
                    **ALEC-Written Laws:**
                    
                    • "Stand Your Ground" gun laws
                    • Voter ID requirements
                    • Anti-union "right to work" laws
                    • Prison privatization
                    • Environmental deregulation
                    
                    **Why It Matters:**
                    
                    When you see identical bills in multiple states:
                    - They often came from ALEC
                    - Written to benefit specific companies
                    - Legislators didn't write them
                    - "Local" politics isn't really local
                    """
                ),
                CourseLesson(
                    title: "Too Big to Jail",
                    content: """
                    **Corporate Crime Without Punishment**
                    
                    **The Pattern:**
                    
                    1. Corporation breaks law
                    2. Investigation (often years later)
                    3. Settlement with no admission of guilt
                    4. Fine that's fraction of profits from crime
                    5. No individual held accountable
                    6. Repeat
                    
                    **Examples:**
                    
                    **2008 Financial Crisis:**
                    - Banks committed massive fraud
                    - Millions lost homes
                    - Zero bank executives went to prison
                    - Banks paid fines, remained profitable
                    
                    **Opioid Crisis:**
                    - Pharma companies knew addiction risks
                    - 500,000+ Americans died
                    - Executives paid fines, no prison
                    - Companies stayed in business
                    
                    **Why No Prosecution:**
                    
                    • "Too big to fail" = too big to jail
                    • Fear of economic consequences
                    • Revolving door prosecutors
                    • Corporate legal resources
                    • Campaign contributions
                    
                    **The Two-Tier System:**
                    
                    Poor person steals $100: Prison
                    Corporation steals $100 billion: Fine (tax deductible)
                    """
                ),
                CourseLesson(
                    title: "Breaking the Capture",
                    content: """
                    **How to Fight Back**
                    
                    **Structural Reforms:**
                    
                    • Longer "cooling off" periods (5+ years)
                    • Ban direct industry-to-regulator transitions
                    • Public financing of campaigns
                    • Stronger conflict of interest rules
                    
                    **Transparency:**
                    
                    • Track the revolving door (OpenSecrets, LittleSis)
                    • Require disclosure of industry meetings
                    • Make lobbying records easily searchable
                    • Sunshine on regulatory decisions
                    
                    **What You Can Do:**
                    
                    1. Research regulators' backgrounds
                    2. Comment on proposed regulations
                    3. Support watchdog organizations
                    4. Vote for candidates who oppose the revolving door
                    5. Demand corporate criminal accountability
                    
                    **Resources:**
                    
                    • ProPublica - investigative journalism
                    • OpenSecrets - money in politics
                    • LittleSis - power networks
                    • Project on Government Oversight (POGO)
                    """
                )
            ]
        )
    }
}

// MARK: - Reusable Course View

struct CourseContentView: View {
    let title: String
    let subtitle: String
    let icon: String
    let iconColor: Color
    let lessons: [CourseLesson]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                // Header
                VStack(spacing: 16) {
                    ZStack {
                        Circle()
                            .fill(iconColor.opacity(0.2))
                            .frame(width: 80, height: 80)
                        Image(systemName: icon)
                            .font(.system(size: 36))
                            .foregroundColor(iconColor)
                    }
                    
                    Text(title)
                        .font(.system(size: 22, weight: .bold))
                        .foregroundColor(.white)
                    
                    Text(subtitle)
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                    
                    HStack {
                        Text("\(lessons.count) Lessons")
                            .font(.system(size: 12))
                            .foregroundColor(.gray)
                    }
                }
                .padding()
                
                // Lessons
                ForEach(Array(lessons.enumerated()), id: \.offset) { index, lesson in
                    NavigationLink(destination: GenericLessonView(lesson: lesson, index: index + 1)) {
                        HStack(spacing: 16) {
                            ZStack {
                                Circle()
                                    .fill(Color.white.opacity(0.1))
                                    .frame(width: 44, height: 44)
                                Text("\(index + 1)")
                                    .font(.system(size: 16, weight: .bold))
                                    .foregroundColor(.white)
                            }
                            
                            Text(lesson.title)
                                .font(.system(size: 15, weight: .medium))
                                .foregroundColor(.white)
                            
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                                .foregroundColor(.gray)
                        }
                        .padding()
                        .background(Color.white.opacity(0.03))
                    }
                }
            }
        }
        .background(Color.black.ignoresSafeArea())
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct CourseLesson {
    let title: String
    let content: String
}

struct GenericLessonView: View {
    let lesson: CourseLesson
    let index: Int
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text("Lesson \(index)")
                    .font(.system(size: 14, weight: .medium))
                    .foregroundColor(.gray)
                
                Text(lesson.title)
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(.white)
                
                Divider()
                    .background(Color.white.opacity(0.2))
                
                Text(lesson.content)
                    .font(.system(size: 15))
                    .foregroundColor(.white.opacity(0.9))
                    .lineSpacing(6)
            }
            .padding()
        }
        .background(Color.black.ignoresSafeArea())
        .navigationBarTitleDisplayMode(.inline)
    }
}

// MARK: - Previews

#Preview("Super PACs") {
    NavigationView {
        SuperPACsCourse()
    }
}

#Preview("Heritage") {
    NavigationView {
        HeritageFoundationCourse()
    }
}

#Preview("AIPAC") {
    NavigationView {
        AIPACCourse()
    }
}
