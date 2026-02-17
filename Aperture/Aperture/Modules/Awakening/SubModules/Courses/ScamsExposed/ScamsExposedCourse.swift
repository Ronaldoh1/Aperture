// ScamsExposedCourse.swift
// THE GREAT SCAMS - American Dream, College, Debt, and More

import SwiftUI

struct ScamsExposedCourse {
  static let shared = ScamsExposedCourse()

  let id = "scams_exposed"
  let title = "The Great Scams"
  let subtitle = "How they extract your wealth and freedom"
  let icon = "dollarsign.arrow.circlepath"
  let colorHex = "#D32F2F"

  var color: Color {
    Color(hex: colorHex)
  }

  let modules: [ScamModule] = [
    // ═══════════════════════════════════════════════════════════════
    // MODULE 1: THE AMERICAN DREAM SCAM
    // ═══════════════════════════════════════════════════════════════

    ScamModule(
      id: "scam_dream",
      number: 1,
      title: "The American Dream Scam",
      subtitle: "The myth that keeps you working",
      icon: "house.fill",
      scams: [
        ScamExposed(
          id: "dream_1",
          title: "The Dream Was Manufactured",
          subtitle: "A marketing campaign, not a birthright",
          content: """
            **The Lie:**
            Work hard, play by the rules, and you'll achieve prosperity. Home ownership, a good job, financial security—it's available to anyone who tries.

            **The Truth:**
            The "American Dream" was a term popularized in 1931 by James Truslow Adams. But the VERSION you know? That was manufactured by corporations and government in the post-WWII era to:

            1. Create consumers for mass-produced goods
            2. Trap workers in mortgages (can't quit, can't strike)
            3. Move people to suburbs (car dependency, isolation)
            4. Replace community with consumption

            **The Numbers That Kill The Dream:**

            **Wages vs. Productivity:**
            • 1948-1973: Productivity up 96.7%, wages up 91.3% (workers got the gains)
            • 1973-2013: Productivity up 74.4%, wages up 9.2% (where did the gains go?)

            **Home Ownership:**
            • 1950: Average home cost 2x annual income
            • 2024: Average home cost 8x annual income
            • Your grandparents' "hard work" bought 4x more house

            **Social Mobility:**
            • A child born poor in Denmark has a better chance of becoming rich than a child born poor in America
            • 50% of Americans earn less than their parents (adjusted for inflation)
            • The "land of opportunity" ranks below most European nations

            **The Trap Design:**
            • Get educated (take on debt)
            • Get a job (need degree to apply)
            • Buy a house (30-year mortgage = can't take risks)
            • Have kids (more expenses, more fear)
            • Work until 65 (if Social Security exists)
            • Die

            This isn't a dream—it's a treadmill.

            🔥 **The Wake-Up:** The American Dream isn't dead—it was always a lie. It was designed to keep you running on the hamster wheel, grateful for the cage.
            """,
          whoCreatedIt: "Post-WWII government and corporations",
          whoBenefits:
            "Banks (mortgages), corporations (workers who can't quit), government (stable tax base)",
          whatToDoInstead: "Define YOUR dream. Don't inherit one designed to exploit you."
        ),

        ScamExposed(
          id: "dream_2",
          title: "Work Hard = Success (The Meritocracy Myth)",
          subtitle: "The lie that blames you for systemic failure",
          content: """
            **The Lie:**
            Success comes to those who work hard. If you're poor, you didn't try hard enough. If you're rich, you earned it.

            **The Truth:**
            The biggest predictor of your income is your parents' income. Not effort. Not talent. Not education. BIRTH.

            **The Data:**

            **Inheritance of Class:**
            • 42% of children born to parents in the bottom quintile stay there
            • Only 8% make it to the top quintile
            • Born rich? 40% chance of staying rich. Born poor? 4% chance of getting rich.

            **Who Works Hardest:**
            • The working poor work longer hours than the wealthy
            • Multiple jobs, no benefits, no security
            • "Hard work" doesn't mean what they told you

            **What Actually Predicts Success:**
            1. Parents' wealth (biggest factor)
            2. ZIP code (determines school quality, networks)
            3. Race (systemic advantages/disadvantages)
            4. Connections (who you know > what you know)
            5. Luck (timing, opportunities)

            **Why The Myth Persists:**
            • Rich people like believing they earned it
            • Poor people are blamed for their poverty
            • Systemic change isn't required if it's individual failure
            • It keeps people competing instead of cooperating

            **The Cruel Irony:**
            Those who promote "pull yourself up by your bootstraps" usually started with boots. And servants to pull them.

            🔥 **The Truth:** Hard work is necessary but not sufficient. The game is rigged. Acknowledging this isn't weakness—it's clarity.
            """,
          whoCreatedIt: "Wealthy class protecting their position",
          whoBenefits: "Owners, not workers. Inheritors, not earners.",
          whatToDoInstead:
            "Work smart, not just hard. Build assets, not just income. Change the game, don't just play it."
        ),

        ScamExposed(
          id: "dream_3",
          title: "Retirement at 65",
          subtitle: "A finish line designed when people died at 60",
          content: """
            **The Lie:**
            Work for 40-50 years, then enjoy retirement with a pension and Social Security.

            **The Truth:**
            Retirement at 65 was designed when life expectancy was 62.

            **The History:**
            • 1881: Germany set retirement at 70 (average death: 45)
            • 1935: US Social Security set at 65 (average death: 62)
            • The math was simple: most people die before collecting

            **Now:**
            • Life expectancy: ~78
            • Social Security: Projected to be insolvent by 2034
            • Pensions: Almost extinct (replaced by 401k gambling)
            • Average retirement savings: $65,000 (enough for ~2 years)

            **The 401(k) Scam:**
            • Invented in 1978 as a TAX SHELTER for executives
            • Not designed as primary retirement vehicle
            • Shifts all risk to the employee
            • Fees extract billions annually
            • Most people won't have enough

            **What They Don't Tell You:**
            • 50% of Americans have ZERO retirement savings
            • Many will work until they die
            • "Retirement" is becoming a privilege, not a right
            • Healthcare costs can wipe out savings instantly

            **The Design:**
            1. Work your best years making someone else rich
            2. Assume you'll be rewarded at the end
            3. Die before collecting, or broke after collecting
            4. Never question the system

            🔥 **The Alternative:** Build freedom NOW. Don't wait for a finish line that might not exist.
            """,
          whoCreatedIt: "Government actuaries who calculated you'd die first",
          whoBenefits:
            "Employers who don't pay pensions. Government that collects more than it pays.",
          whatToDoInstead:
            "Build passive income. Create assets. Don't trade 40 years of life for a maybe-retirement."
        ),
      ]
    ),

    // ═══════════════════════════════════════════════════════════════
    // MODULE 2: THE COLLEGE SCAM
    // ═══════════════════════════════════════════════════════════════

    ScamModule(
      id: "scam_college",
      number: 2,
      title: "The College Scam",
      subtitle: "$100K for a piece of paper",
      icon: "graduationcap.fill",
      scams: [
        ScamExposed(
          id: "college_1",
          title: "Degrees Don't Guarantee Jobs",
          subtitle: "The $1.7 trillion lie",
          content: """
            **The Lie:**
            Go to college, get a degree, get a good job. It's the only path to success.

            **The Truth:**
            College has become a $1.7 trillion debt machine that guarantees nothing.

            **The Numbers:**

            **The Cost Explosion:**
            • 1980: Average tuition $10,000/year (adjusted for inflation)
            • 2023: Average tuition $35,000+/year
            • Tuition has increased 1,200% since 1980
            • Wages have increased ~30% in the same period

            **The Debt:**
            • Total US student loan debt: $1.7 TRILLION
            • Average graduate debt: $30,000+
            • 45 million Americans have student loans
            • Average monthly payment: $400+
            • Many will pay for 20+ years

            **The Job Myth:**

            **Underemployment:**
            • 41% of recent graduates are underemployed
            • Working jobs that don't require degrees
            • Baristas with bachelor's degrees

            **Degree Inflation:**
            • Jobs that never required degrees now demand them
            • Not because the job changed
            • Because employers can filter with so many applicants

            **The ROI:**
            • English degree average ROI: Often negative
            • Psychology degree: Often negative
            • Art history: Often negative
            • Only ~30% of degrees have positive ROI

            **What Actually Matters:**
            • 75% of jobs are found through networking
            • Skills matter more than credentials
            • Experience beats education
            • Google, Apple, IBM dropped degree requirements

            🔥 **The Scam:** They sold education as the path to prosperity. They delivered debt and uncertain outcomes. It's a $1.7 trillion wealth transfer from young people to institutions.
            """,
          whoCreatedIt: "Universities, government-backed loan programs, credentialism culture",
          whoBenefits: "Universities, loan servicers, employers who use degrees as filters",
          whatToDoInstead:
            "Consider trade schools, apprenticeships, self-education, building skills directly. College can be valuable—but it's not the only path."
        ),

        ScamExposed(
          id: "college_2",
          title: "Why College Costs So Much",
          subtitle: "Administrative bloat and guaranteed loans",
          content: """
            **The Lie:**
            College is expensive because education is expensive.

            **The Truth:**
            College is expensive because of administrative bloat, amenities arms races, and guaranteed government money.

            **Administrative Bloat:**
            • 1975: 1 administrator per 50 students
            • 2023: 1 administrator per 21 students
            • Administrative costs up 600%+ since 1975
            • Meanwhile, professor numbers barely increased
            • Many admins make $200k+/year

            **The Amenities Arms Race:**
            • Rock climbing walls
            • Luxury dorms
            • Gourmet dining halls
            • Fancy student centers
            • These aren't education—they're marketing

            **The Government Guarantee:**
            Here's the real scam:

            1. Government guarantees student loans
            2. Students can borrow almost unlimited amounts
            3. Universities know students have access to money
            4. Universities raise prices
            5. Students borrow more
            6. Cycle repeats

            **If loans weren't guaranteed:**
            • Students couldn't pay inflated prices
            • Universities would have to lower costs
            • Market forces would apply

            **But loans ARE guaranteed:**
            • Students borrow whatever universities charge
            • Universities have no incentive to lower prices
            • Prices rise endlessly
            • Taxpayers back the loans

            **The Comparison:**
            • Medical procedure costs: Down (market pressure)
            • College costs: Up 1,200% (no market pressure)

            🔥 **The Mechanism:** Unlimited guaranteed money + no accountability = infinite price increases. It's not education—it's extraction.
            """,
          whoCreatedIt: "Universities lobbied for guaranteed loans. Government complied.",
          whoBenefits: "University administrators, construction companies, loan servicers",
          whatToDoInstead:
            "If you go, minimize debt. Community college first. In-state schools. Scholarships. Or skip entirely and build skills."
        ),

        ScamExposed(
          id: "college_3",
          title: "What College Actually Teaches",
          subtitle: "Compliance, not competence",
          content: """
            **The Lie:**
            College teaches critical thinking, prepares you for careers, develops well-rounded individuals.

            **The Truth:**
            For most students, college teaches:
            • How to follow instructions
            • How to perform for grades
            • How to handle debt
            • How to delay adulthood by 4+ years

            **The Skills Gap:**
            Employers consistently report:
            • Graduates lack practical skills
            • Can't communicate effectively
            • Don't know how to solve real problems
            • Need extensive on-the-job training

            **What's NOT Taught:**
            • How to start a business
            • How to manage money
            • How to negotiate salary
            • How to build professional networks
            • How to learn independently
            • How to handle failure

            **What IS Taught:**
            • How to take tests
            • How to meet deadlines
            • How to appeal to authority
            • How to follow rubrics
            • Compliance

            **The Credential Game:**
            Many students aren't there to learn—they're there to get the paper that unlocks job applications. This is called "signaling":
            • Degree signals: "I can follow rules for 4 years"
            • GPA signals: "I can perform on command"
            • These have little to do with job performance

            **The Alternative:**
            • Trade schools: Direct skills, less debt, guaranteed demand
            • Self-education: Internet has everything, free or cheap
            • Apprenticeships: Get paid to learn
            • Entrepreneurship: Build while others study

            🔥 **The Question:** Is 4 years and $100k+ worth a credential that increasingly means nothing? Or could you spend that time and money building something real?
            """,
          whoCreatedIt: "Credentialism culture, HR departments, universities",
          whoBenefits: "Universities (tuition), employers (filter applicants cheaply)",
          whatToDoInstead:
            "Learn skills that matter. Build a portfolio. Create proof of competence, not just credentials."
        ),
      ]
    ),

    // ═══════════════════════════════════════════════════════════════
    // MODULE 3: CREDIT & DEBT SCAMS
    // ═══════════════════════════════════════════════════════════════

    ScamModule(
      id: "scam_debt",
      number: 3,
      title: "The Debt Trap",
      subtitle: "Credit cards, loans, and financial slavery",
      icon: "creditcard.fill",
      scams: [
        ScamExposed(
          id: "debt_1",
          title: "Credit Cards: The 29% Trap",
          subtitle: "Making minimum payments forever",
          content: """
            **The Lie:**
            Credit cards are convenient and help you build credit. Just pay the minimum!

            **The Truth:**
            Credit cards are designed to trap you in permanent debt at up to 29% interest.

            **The Math of Minimum Payments:**

            **Example: $5,000 balance at 20% APR**
            • Minimum payment: $100/month
            • Time to pay off: 9 years, 8 months
            • Total paid: $11,680
            • Interest paid: $6,680 (133% of original purchase!)

            **At 29% APR:**
            • Time to pay off: 27+ years
            • Total paid: $23,000+
            • You pay for everything 4-5 times

            **The Design:**
            Credit cards are engineered for maximum debt:

            1. **Low minimums**: Keep you paying forever
            2. **High limits**: Encourage overspending
            3. **Rewards**: Make you feel smart while paying 20%+
            4. **Complexity**: Hide true costs
            5. **Variable rates**: Increase when you're vulnerable

            **The "Rewards" Scam:**
            • "I get 2% cash back!"
            • You pay 20% interest
            • Net loss: 18%
            • The rewards fund themselves from your interest

            **Who REALLY Benefits:**
            Credit card companies made $130+ billion in interest and fees in 2022. That's wealth transferred from cardholders to shareholders.

            **The Debt Cycle:**
            1. Can't afford something
            2. Put it on credit
            3. Can't pay in full
            4. Pay minimum
            5. Interest accrues
            6. Less money available
            7. Return to step 1

            🔥 **The Truth:** Credit cards aren't financial tools—they're extraction machines designed by PhD mathematicians to keep you in debt forever.
            """,
          whoCreatedIt: "Banks, financial institutions",
          whoBenefits: "Credit card companies, shareholders, executives",
          whatToDoInstead:
            "Pay in full every month or don't use cards. Use debit. Build emergency fund. Live below means."
        ),

        ScamExposed(
          id: "debt_2",
          title: "Student Loans: Debt You Can't Escape",
          subtitle: "The only debt that survives bankruptcy",
          content: """
            **The Lie:**
            Student loans are an investment in your future. The government is helping you!

            **The Truth:**
            Student loans are the only consumer debt you cannot discharge in bankruptcy. Ever.

            **The Special Status:**
            Credit card debt? Bankruptcy erases it.
            Medical debt? Bankruptcy erases it.
            Mortgage? Bankruptcy erases it.
            Student loans? NOTHING erases them.

            • Can't discharge in bankruptcy (since 2005)
            • Government can garnish wages
            • Government can take Social Security
            • Government can take tax refunds
            • Follows you until death

            **Why This Exception?**
            Because banks and the government wanted guaranteed returns with zero risk. They created debt slavery with no exit.

            **The Numbers:**
            • $1.77 trillion total student debt
            • 45 million borrowers
            • Average debt: $38,000
            • Many owe $100k+
            • Default rate: 10%+ (and rising)

            **The Interest Trap:**
            Many borrowers pay for years and owe MORE than they started:
            • $50,000 borrowed
            • $30,000 paid over 10 years
            • Current balance: $55,000
            • This is called negative amortization

            **Income-Driven Repayment:**
            • Sounds helpful
            • Pays based on income
            • But interest still accrues
            • 20-25 years of payments
            • Forgiven amount is taxed as income
            • You might owe $50k+ in taxes

            **PSLF (Public Service Loan Forgiveness):**
            • Work 10 years in public service
            • Make 120 payments
            • Loans forgiven!
            • Rejection rate: 98%+
            • Fine print disqualifies most people

            🔥 **The Reality:** An 18-year-old can sign away decades of their life for debt they can never escape, for a degree that might not pay off.
            """,
          whoCreatedIt:
            "Government (guaranteed the loans), banks (lobbied for no bankruptcy discharge)",
          whoBenefits: "Loan servicers, universities, collection agencies",
          whatToDoInstead:
            "Minimize borrowing. Understand the terms. Consider alternatives. If you have loans, aggressive payoff > minimum payments."
        ),

        ScamExposed(
          id: "debt_3",
          title: "The Credit Score Scam",
          subtitle: "Your life controlled by three private companies",
          content: """
            **The Lie:**
            Your credit score objectively measures your financial responsibility.

            **The Truth:**
            Your credit score is a number created by three private companies (Equifax, Experian, TransUnion) that controls your access to housing, employment, and financial services.

            **What The Score Actually Measures:**
            • How profitable you are to lenders
            • NOT how financially responsible you are
            • NOT your actual ability to pay

            **The Paradox:**
            • Pay cash for everything? LOW score (not profitable)
            • Take on debt and pay interest? HIGH score (profitable)
            • The "responsible" behavior is penalized

            **How It Controls Your Life:**
            • Apartment applications (rejected for low score)
            • Job applications (many employers check credit)
            • Insurance rates (low score = higher premiums)
            • Interest rates (low score = pay more)
            • Security deposits (low score = higher deposits)
            • Cell phone contracts
            • Utility accounts

            **The Problems:**
            • Errors are common (1 in 5 reports have errors)
            • Fixing errors is difficult
            • Algorithms are secret
            • No right to appeal
            • Private companies with massive power

            **The Equifax Breach (2017):**
            • 147 million Americans' data exposed
            • Social Security numbers stolen
            • Credit data compromised
            • Equifax's punishment: Minor fine, no real accountability
            • Your data, their profit, your risk

            **The Score Is A Leash:**
            Good score? You're approved to take on debt.
            Bad score? You're punished—can't rent, can't get jobs.
            Either way, the system controls you.

            🔥 **The Truth:** Three private companies you never chose have life-or-death power over your housing and employment. That's not a system—it's control.
            """,
          whoCreatedIt: "Credit bureaus, banks, lenders",
          whoBenefits: "Credit bureaus (sell your data), lenders (control who gets credit)",
          whatToDoInstead:
            "Understand the game. Play it strategically. But recognize it's a game designed for their benefit, not yours."
        ),
      ]
    ),

    // ═══════════════════════════════════════════════════════════════
    // MODULE 4: WHERE YOUR TAX DOLLARS GO
    // ═══════════════════════════════════════════════════════════════

    ScamModule(
      id: "scam_taxes",
      number: 4,
      title: "Where Your Money Goes",
      subtitle: "Billions abroad while you struggle",
      icon: "banknote.fill",
      scams: [
        ScamExposed(
          id: "tax_1",
          title: "Foreign Aid vs. Domestic Need",
          subtitle: "Billions leave while infrastructure crumbles",
          content: """
            **The Situation:**
            The US sends billions in foreign aid annually while:
            • 38 million Americans live in poverty
            • 27 million have no health insurance
            • Infrastructure grades: D+ overall
            • Public schools are underfunded

            **The Numbers:**

            **Foreign Aid (2022-2024):**
            • Total foreign aid: $60+ billion annually
            • Military aid to various nations: billions
            • Meanwhile at home...

            **Domestic Crises:**
            • Student debt: $1.77 trillion
            • Medical debt: #1 cause of bankruptcy
            • Homelessness: 650,000+ on any given night
            • Flint, MI: Still has water issues years later
            • Bridges rated "structurally deficient": 42,000+

            **The Comparison:**
            What could domestic investment look like?
            • Universal pre-K: ~$20 billion/year
            • Free community college: ~$6 billion/year
            • Lead pipe replacement (national): ~$45 billion total
            • These are "unaffordable"—but foreign aid is always available

            **The Question:**
            Why can the government always find money for foreign priorities but claims there's no money for:
            • Healthcare
            • Education
            • Infrastructure
            • Housing
            • Clean water

            **The Pattern:**
            Money flows to where power wants it:
            • Defense contractors
            • Foreign policy objectives
            • Politically connected entities

            Money doesn't flow to:
            • Regular citizens
            • Domestic infrastructure
            • Social programs

            🔥 **The Wake-Up:** You're told there's no money for your healthcare or your kids' education. But there's always money for foreign aid and military spending. It's not about the money—it's about priorities.
            """,
          whoCreatedIt: "Foreign policy establishment, defense industry, lobbying",
          whoBenefits: "Defense contractors, foreign governments, geopolitical interests",
          whatToDoInstead:
            "Vote. Organize. Demand accountability. Question every budget that claims there's 'no money' for domestic needs."
        ),

        ScamExposed(
          id: "tax_2",
          title: "The Military Budget",
          subtitle: "$886 billion and counting",
          content: """
            **The Numbers:**

            **US Military Budget (2024): $886 Billion**
            • More than the next 10 countries COMBINED
            • 3x China's military budget
            • 10x Russia's military budget
            • 53% of discretionary federal spending

            **What $886 Billion Could Buy:**
            (These are rough equivalents, not proposals)
            • Free public college for all: $80B/year
            • Universal pre-K: $20B/year
            • Homelessness elimination: $20B one-time
            • Clean water infrastructure: $50B
            • Still have $700B+ left for "defense"

            **The Waste:**
            • Pentagon has never passed an audit
            • TRILLIONS in "accounting adjustments" (money disappeared)
            • Cost overruns are standard
            • $35+ trillion in accounting errors reported
            • No one is accountable

            **The F-35 Program:**
            • Cost: $1.7 trillion (lifetime)
            • Still has major problems
            • Most expensive weapons system in history
            • Could have funded public college for decades

            **Who Benefits:**
            • Top 5 defense contractors: $150+ billion in contracts
            • Executives: Multi-million dollar salaries
            • Shareholders: Steady returns
            • Politicians: Campaign contributions
            • Lobbyists: Revolving door jobs

            **The Justification:**
            "National security" justifies everything:
            • No audit required
            • No public debate
            • Classified budgets
            • Perpetual threat narrative

            🔥 **The Question:** Are you more threatened by foreign enemies or by lack of healthcare, education, and infrastructure? Who decides what "security" means?
            """,
          whoCreatedIt: "Military-industrial complex (Eisenhower warned about this)",
          whoBenefits:
            "Defense contractors, military officials, politicians who receive contributions",
          whatToDoInstead:
            "Support military audit requirements. Question 'defense' spending. Demand domestic investment."
        ),

        ScamExposed(
          id: "tax_3",
          title: "Healthcare: A Right Elsewhere, A Privilege Here",
          subtitle: "Every other developed nation figured it out",
          content: """
            **The US Exception:**
            The United States is the ONLY developed nation without universal healthcare.

            **The Comparison:**

            **Other Developed Nations:**
            • Canada: Universal healthcare
            • UK: National Health Service (free at point of use)
            • Germany: Universal multi-payer
            • France: Universal healthcare
            • Japan: Universal healthcare
            • Australia: Universal healthcare
            • Every other developed nation: Universal healthcare

            **USA:**
            • 27+ million uninsured
            • Millions more underinsured
            • #1 cause of bankruptcy: Medical debt
            • GoFundMe: De facto healthcare system

            **The Costs:**

            **Per Capita Healthcare Spending:**
            • USA: $12,000+/person/year (highest in world)
            • Other developed nations: $4,000-6,000/person

            **Outcomes:**
            • USA life expectancy: Lower than peers
            • USA infant mortality: Higher than peers
            • USA healthcare satisfaction: Lower than peers

            **We pay MORE and get LESS.**

            **Why?**
            • Insurance company profits: $30+ billion/year
            • Pharma profits: $100+ billion/year
            • Hospital admin costs: Highest in world
            • No price negotiation for Medicare drugs (until recently)
            • Lobbying: $700+ million/year from healthcare industry

            **The Argument Against:**
            "We can't afford it!"

            **The Math:**
            • Current system: $4.3 trillion/year
            • Universal systems cost LESS per capita
            • We could cover everyone for less than we spend now
            • Other countries prove it's possible

            🔥 **The Truth:** Universal healthcare isn't impossible—every other developed nation has it. It's opposed because it would end the profit extraction of insurance and pharma companies.
            """,
          whoCreatedIt: "Insurance lobby, pharmaceutical industry, politicians they fund",
          whoBenefits: "Insurance executives, pharma shareholders, hospital administrators",
          whatToDoInstead:
            "Support universal healthcare. Understand that 'we can't afford it' is a lie—we already pay more than universal would cost."
        ),
      ]
    ),
  ]
}

// MARK: - Supporting Types

struct ScamModule: Identifiable {
  let id: String
  let number: Int
  let title: String
  let subtitle: String
  let icon: String
  let scams: [ScamExposed]
}

struct ScamExposed: Identifiable {
  let id: String
  let title: String
  let subtitle: String
  let content: String
  let whoCreatedIt: String
  let whoBenefits: String
  let whatToDoInstead: String
}

struct ScamProgress: Codable {
  var completedScams: [String]
  var lastAccessed: Date?
  static var `default`: ScamProgress {
    ScamProgress(completedScams: [], lastAccessed: nil)
  }
}
