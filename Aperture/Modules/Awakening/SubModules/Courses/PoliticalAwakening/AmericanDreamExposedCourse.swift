// AmericanDreamExposedCourse.swift
// The mythology that keeps people running on a broken treadmill

import SwiftUI

struct AmericanDreamExposedCourse: View {
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                // Course Header
                courseHeader
                
                // Lessons
                ForEach(Array(lessons.enumerated()), id: \.offset) { index, lesson in
                    NavigationLink(destination: AmericanDreamLessonView(lesson: lesson, index: index + 1)) {
                        lessonRow(lesson, index: index)
                    }
                }
                
                // Statistics Card
                statisticsCard
                
                // Resources
                resourcesSection
            }
        }
        .background(Color.black.ignoresSafeArea())
        .navigationTitle("American Dream Exposed")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    // MARK: - Header
    
    private var courseHeader: some View {
        VStack(spacing: 16) {
            ZStack {
                Circle()
                    .fill(Color.red.opacity(0.2))
                    .frame(width: 100, height: 100)
                
                Image(systemName: "house.lodge.fill")
                    .font(.system(size: 44))
                    .foregroundColor(.red)
                
                // Crack overlay
                Image(systemName: "bolt.fill")
                    .font(.system(size: 24))
                    .foregroundColor(.yellow)
                    .offset(x: 20, y: -15)
            }
            
            Text("The American Dream")
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(.white)
            
            Text("EXPOSED")
                .font(.system(size: 14, weight: .black, design: .rounded))
                .foregroundColor(.red)
                .tracking(4)
            
            Text("The mythology that keeps you running\non a treadmill designed to break you.")
                .font(.system(size: 14))
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
            
            // Key stat
            VStack(spacing: 4) {
                Text("90%")
                    .font(.system(size: 48, weight: .bold, design: .rounded))
                    .foregroundColor(.orange)
                Text("of children born in 1940 earned more than their parents")
                    .font(.system(size: 11))
                    .foregroundColor(.gray)
                Text("Only 50% born in 1980 can say the same")
                    .font(.system(size: 11, weight: .semibold))
                    .foregroundColor(.red)
            }
            .padding()
            .background(Color.white.opacity(0.05))
            .cornerRadius(12)
            
            // Progress
            HStack {
                Text("10 Lessons")
                    .font(.system(size: 12, weight: .medium))
                    .foregroundColor(.gray)
                Spacer()
                Text("~60 min")
                    .font(.system(size: 12, weight: .medium))
                    .foregroundColor(.gray)
            }
            .padding(.horizontal)
        }
        .padding()
    }
    
    // MARK: - Lesson Row
    
    private func lessonRow(_ lesson: DreamLesson, index: Int) -> some View {
        HStack(spacing: 16) {
            ZStack {
                Circle()
                    .fill(lesson.color.opacity(0.2))
                    .frame(width: 48, height: 48)
                Image(systemName: lesson.icon)
                    .font(.system(size: 20))
                    .foregroundColor(lesson.color)
            }
            
            VStack(alignment: .leading, spacing: 4) {
                Text(lesson.title)
                    .font(.system(size: 15, weight: .semibold))
                    .foregroundColor(.white)
                Text(lesson.subtitle)
                    .font(.system(size: 12))
                    .foregroundColor(.gray)
                    .lineLimit(1)
            }
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
        }
        .padding()
        .background(Color.white.opacity(0.03))
    }
    
    // MARK: - Statistics Card
    
    private var statisticsCard: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Image(systemName: "chart.bar.fill")
                    .foregroundColor(.orange)
                Text("The Numbers Don't Lie")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.white)
            }
            
            VStack(spacing: 12) {
                statRow("Wealth owned by top 1%", "32%", .red)
                statRow("Workers living paycheck to paycheck", "78%", .orange)
                statRow("Bankruptcies from medical bills", "66%", .red)
                statRow("College grads with student debt", "45M", .orange)
                statRow("Average student loan balance", "$37,338", .yellow)
                statRow("Median home price vs. 1970 (adjusted)", "+300%", .red)
                statRow("Minimum wage buying power vs. 1968", "-40%", .red)
            }
        }
        .padding()
        .background(Color.orange.opacity(0.05))
        .cornerRadius(16)
        .padding()
    }
    
    private func statRow(_ label: String, _ value: String, _ color: Color) -> some View {
        HStack {
            Text(label)
                .font(.system(size: 13))
                .foregroundColor(.gray)
            Spacer()
            Text(value)
                .font(.system(size: 14, weight: .bold))
                .foregroundColor(color)
        }
    }
    
    // MARK: - Resources
    
    private var resourcesSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Deep Dive Resources")
                .font(.system(size: 16, weight: .bold))
                .foregroundColor(.white)
            
            VStack(spacing: 8) {
                resourceRow("The Fading American Dream", "Chetty et al., Stanford", "doc.text")
                resourceRow("Capital in the 21st Century", "Thomas Piketty", "book.closed")
                resourceRow("Nickel and Dimed", "Barbara Ehrenreich", "book.closed")
                resourceRow("Evicted", "Matthew Desmond", "book.closed")
                resourceRow("inequality.org", "Data & research", "globe")
            }
        }
        .padding()
    }
    
    private func resourceRow(_ title: String, _ author: String, _ icon: String) -> some View {
        HStack(spacing: 12) {
            Image(systemName: icon)
                .foregroundColor(.blue)
                .frame(width: 24)
            VStack(alignment: .leading) {
                Text(title)
                    .font(.system(size: 13, weight: .medium))
                    .foregroundColor(.white)
                Text(author)
                    .font(.system(size: 11))
                    .foregroundColor(.gray)
            }
            Spacer()
        }
    }
    
    // MARK: - Lessons Data
    
    private var lessons: [DreamLesson] {
        [
            DreamLesson(
                title: "The Origin of the Myth",
                subtitle: "How a phrase became a control mechanism",
                icon: "book.fill",
                color: .blue,
                content: """
                **Who Invented the "American Dream"?**
                
                The phrase "American Dream" was coined by historian James Truslow Adams in 1931—during the Great Depression.
                
                In his book "The Epic of America," Adams defined it as:
                
                > "A dream of a land in which life should be better and richer and fuller for everyone, with opportunity for each according to ability or achievement... regardless of the fortuitous circumstances of birth or position."
                
                **Notice What's Missing:**
                
                Adams never mentioned:
                - Homeownership
                - Cars
                - Material wealth
                - Individual success over collective wellbeing
                
                He actually warned against exactly what the dream became:
                
                > "It is not a dream of motor cars and high wages merely, but a dream of social order in which each man and each woman shall be able to attain to the fullest stature of which they are innately capable."
                
                **How It Got Corrupted:**
                
                Post-WWII, the dream was co-opted to mean:
                - Own a home (in the suburbs, away from "those people")
                - Two cars
                - Consumer goods
                - Upward mobility through individual effort
                
                This version served:
                - Real estate developers
                - Automobile manufacturers
                - Consumer goods companies
                - Those who wanted segregated communities
                
                **The Useful Myth:**
                
                The corrupted American Dream is useful because it:
                
                1. **Individualizes structural problems**: If you're poor, you didn't work hard enough
                2. **Encourages consumption**: Happiness = buying things
                3. **Discourages collective action**: Everyone for themselves
                4. **Blames victims**: Poverty is moral failure, not system failure
                5. **Justifies inequality**: The rich "earned" it
                
                **The Original Sin:**
                
                From the beginning, the "American Dream" was never available to:
                - Black Americans (redlining, Jim Crow, slavery's legacy)
                - Indigenous peoples (genocide, land theft)
                - Women (couldn't own property, open bank accounts)
                - Immigrants (exploited labor, then blamed)
                
                The dream was always for a select group—then used to tell everyone else they failed.
                """,
                keyTakeaway: "The 'American Dream' started as a vision of equal opportunity and was corrupted into a consumer fantasy that blames individuals for systemic failures."
            ),
            DreamLesson(
                title: "Social Mobility is Dead",
                subtitle: "The data that shatters the myth",
                icon: "arrow.up.right",
                color: .red,
                content: """
                **The Fading American Dream**
                
                Stanford economist Raj Chetty's landmark research revealed a devastating truth:
                
                **Absolute Mobility (earning more than your parents):**
                
                • Born in 1940: **90%** earned more than their parents
                • Born in 1950: 79%
                • Born in 1960: 68%
                • Born in 1970: 61%
                • Born in 1980: **50%** (coin flip)
                • Born in 1990+: Projected worse
                
                **What Changed?**
                
                1. **GDP still grew** - the economy got bigger
                2. **But gains went to the top** - workers didn't benefit
                3. **Costs exploded** - housing, healthcare, education
                4. **Wages stagnated** - productivity gains not shared
                
                **Relative Mobility (moving between classes):**
                
                America ranks **27th** in social mobility among developed nations.
                
                Countries with MORE mobility than the US:
                - Denmark, Norway, Finland
                - Canada, Germany, France
                - Even the UK (with its literal class system)
                
                **The Birth Lottery:**
                
                Your economic future is largely determined by:
                
                • **ZIP code you're born in**: Some areas have 4x the mobility of others
                • **Parents' income**: Born poor? 70% chance you stay poor
                • **Race**: Black children born to wealthy families often fall to lower classes
                • **Gender**: Women still earn less, own less
                
                **The "Pull Yourself Up" Lie:**
                
                If America had true mobility:
                - 20% born in bottom quintile would stay there (random distribution)
                - Reality: **43%** born in bottom quintile stay there
                
                If born in bottom 20%:
                - Chance of reaching top 20%: **7.5%**
                - Chance of staying in bottom 40%: **66%**
                
                **Compare to Denmark:**
                - Bottom 20% staying there: 25%
                - Reaching top 20%: 14%
                
                **Why This Matters:**
                
                Americans believe in mobility more than any other nation.
                Americans have less mobility than most developed nations.
                
                This gap between belief and reality is not accidental—it's useful for those at the top.
                """,
                keyTakeaway: "Only 50% of people born in 1980 will earn more than their parents. America ranks 27th in social mobility. The 'land of opportunity' is a statistical lie."
            ),
            DreamLesson(
                title: "The Homeownership Trap",
                subtitle: "How housing became unaffordable by design",
                icon: "house.fill",
                color: .orange,
                content: """
                **The Centerpiece of the Dream**
                
                Homeownership became the American Dream's core promise. But it was always a rigged game.
                
                **The Numbers:**
                
                • 1950: Median home = 2.2x median income
                • 1970: Median home = 2.8x median income
                • 2000: Median home = 4.0x median income
                • 2024: Median home = **8.0x median income**
                
                A home that cost 2 years' salary now costs 8.
                
                **How Did This Happen?**
                
                **1. Redlining (1934-1968)**
                - FHA maps literally colored Black neighborhoods red
                - Banks denied loans to "red" areas
                - White families built wealth; Black families locked out
                - Effects persist today
                
                **2. Suburban Subsidies**
                - Highway system built to serve suburbs
                - Mortgage interest deduction benefits homeowners
                - Property tax system benefits wealthy areas
                - Zoning laws prevent affordable housing
                
                **3. Housing as Investment**
                - Homes became speculative assets, not shelter
                - NIMBYism restricts supply
                - Real estate investors buy up inventory
                - Private equity now owns single-family homes
                
                **4. The 2008 Crime**
                - Banks gave predatory loans knowing they'd fail
                - Homeowners lost everything
                - Banks got bailouts, kept the houses
                - BlackRock bought foreclosures, became America's landlord
                
                **Today's Reality:**
                
                • **Homeownership rate**: 66% (same as 1960s)
                • **Young adult homeownership**: Lowest in 40 years
                • **Down payment needed**: $60,000+ average
                • **Corporate landlords**: Own 1 in 4 single-family rentals in some markets
                
                **The Wealth Gap:**
                
                Median net worth:
                - Homeowner: $255,000
                - Renter: $6,300
                
                This isn't because renters are irresponsible. It's because:
                - They were locked out by redlining
                - They can't afford down payments
                - They live where housing costs exploded
                - The system was designed this way
                
                **Who Benefits:**
                
                • Real estate developers
                • Banks (mortgage interest)
                • Existing homeowners (property values)
                • Corporate landlords
                • Construction industry
                
                **Who Suffers:**
                
                • Young people
                • Renters
                • Communities of color
                • Anyone who missed the property ladder
                """,
                keyTakeaway: "Homes cost 8x median income today vs. 2x in 1950. This isn't market forces—it's policy choices that benefit property owners and lock everyone else out."
            ),
            DreamLesson(
                title: "The Education Debt Trap",
                subtitle: "How college became a financial prison",
                icon: "graduationcap.fill",
                color: .purple,
                content: """
                **The Promise:**
                
                "Go to college, get a good job, live the American Dream."
                
                **The Reality:**
                
                • **45 million Americans** have student loan debt
                • **$1.77 trillion** total student debt
                • **Average debt**: $37,338 per borrower
                • **Default rate**: 1 in 10 borrowers
                
                **How We Got Here:**
                
                **1. Defunding Public Education**
                
                State funding per student:
                - 1980: States covered 75% of public university costs
                - 2020: States cover 35%
                
                Students make up the difference with loans.
                
                **2. The Loan Industry**
                
                Student loans are uniquely cruel:
                - Cannot be discharged in bankruptcy
                - Government can garnish wages, Social Security
                - Interest capitalizes (you owe interest on interest)
                - Servicers profit from keeping you in debt longer
                
                This was by design. Banks lobbied for these rules.
                
                **3. The College Arms Race**
                
                Universities compete on:
                - Luxury dorms
                - Climbing walls
                - Football stadiums
                - Administrative bloat
                
                NOT on:
                - Affordable tuition
                - Job placement
                - Teaching quality
                
                **4. Credential Inflation**
                
                Jobs that required high school now "require" bachelor's.
                Jobs that required bachelor's now "require" master's.
                
                This isn't because jobs are harder. It's because:
                - HR uses degrees as filters
                - More graduates = more competition
                - Employers can demand more for less
                
                **The Debt Trap in Action:**
                
                Graduate with $40,000 debt at 6% interest:
                - Minimum payment: ~$450/month
                - Pay for 10 years: $53,000 total
                - Can't save for home down payment
                - Can't invest in retirement
                - Can't take entrepreneurial risks
                - Must take any job that pays
                
                **Who Benefits:**
                
                • Loan servicers (Navient made $1.4B in 2020)
                • Universities (tuition keeps rising)
                • Employers (desperate, indebted workers)
                • The wealthy (their kids have no debt)
                
                **The Class Divide:**
                
                Children of wealthy families:
                - No student debt
                - Can take unpaid internships
                - Can take risks, start businesses
                - Can buy homes younger
                
                Children of working families:
                - Decades of debt
                - Must take any paying job
                - Can't take risks
                - Delayed homeownership, family, retirement
                
                **Other Countries:**
                
                • Germany: Free public university
                • Norway: Free
                • France: ~$200/year
                • Even UK: Capped at £9,250/year with income-based repayment
                
                America chose debt servitude. It wasn't inevitable.
                """,
                keyTakeaway: "$1.77 trillion in student debt. Can't be discharged in bankruptcy. Other developed nations offer free or cheap college. America chose to trap its young people in debt."
            ),
            DreamLesson(
                title: "The Healthcare Bankruptcy",
                subtitle: "Medical debt: The American exception",
                icon: "cross.case.fill",
                color: .red,
                content: """
                **Only in America:**
                
                The United States is the **only** developed nation where:
                - Medical bills cause bankruptcy
                - GoFundMe is a healthcare plan
                - Insulin costs $300+ per vial
                - People ration life-saving medication
                
                **The Numbers:**
                
                • **66.5%** of bankruptcies cite medical bills as a factor
                • **100 million Americans** have medical debt
                • **$88 billion** in medical debt on credit reports
                • **50%** of debt in collections is medical
                
                **How We Got Here:**
                
                **1. Employer-Based Insurance (WWII accident)**
                
                During WWII, wages were frozen. Companies offered health insurance instead.
                This accident became permanent policy.
                
                Problems:
                - Lose your job? Lose your insurance
                - Pre-existing conditions? Denied
                - Change jobs? Coverage gaps
                - Employer picks your plan, not you
                
                **2. For-Profit Healthcare**
                
                Only in America:
                - Hospitals are profit centers
                - Insurance companies make billions denying claims
                - Pharmaceutical companies charge whatever they want
                - "Surprise billing" is legal
                
                **3. Lobbying Power**
                
                Healthcare industry lobbying:
                - $713 million in 2021 alone
                - More than any other industry
                - 5 lobbyists for every member of Congress
                - Both parties receive massive donations
                
                **The American vs. Canadian Experience:**
                
                **Appendectomy:**
                - US: $15,000-$35,000
                - Canada: $0
                
                **Childbirth:**
                - US: $10,000-$30,000
                - Canada: $0
                
                **Insulin (monthly):**
                - US: $300-$1,000
                - Canada: $30-$50
                
                **Cancer treatment:**
                - US: Average $150,000 out of pocket
                - Canada: $0
                
                **We Pay More, Get Less:**
                
                US healthcare spending: $12,000/person/year (highest in world)
                
                Results:
                - Life expectancy: 76 years (46th globally)
                - Infant mortality: Worst among developed nations
                - Maternal mortality: Worst among developed nations
                - Medical errors: 3rd leading cause of death
                
                **The Cruel Math:**
                
                You can do everything "right":
                - Work hard
                - Save money
                - Buy insurance
                
                And still:
                - Get cancer
                - Reach insurance cap
                - Lose your home
                - Declare bankruptcy
                
                **Who Benefits:**
                
                • Insurance executives (billions in compensation)
                • Pharmaceutical CEOs (billions in compensation)
                • Hospital chains (billions in profits)
                • Medical device makers (billions in profits)
                
                **Who Suffers:**
                
                Everyone else.
                """,
                keyTakeaway: "66.5% of bankruptcies involve medical debt. America spends the most on healthcare and has worse outcomes than every other developed nation. This is policy, not nature."
            ),
            DreamLesson(
                title: "The Wage Theft Economy",
                subtitle: "Productivity up, wages flat—where did the money go?",
                icon: "dollarsign.circle.fill",
                color: .green,
                content: """
                **The Great Divergence:**
                
                From 1948-1973:
                - Productivity grew 96%
                - Worker compensation grew 91%
                - Workers shared in the gains
                
                From 1973-2023:
                - Productivity grew 64%
                - Worker compensation grew 17%
                - **Where did the other 47% go?**
                
                **The Money Went Up:**
                
                CEO-to-worker pay ratio:
                - 1965: 21:1
                - 1989: 61:1
                - 2000: 366:1
                - 2021: 399:1
                
                If minimum wage kept pace with productivity:
                - It would be **$24/hour** today
                - Actual federal minimum: $7.25
                
                If minimum wage kept pace with CEO pay:
                - It would be **$33/hour** today
                
                **How They Stole It:**
                
                **1. Union Busting**
                
                Union membership:
                - 1954: 35%
                - 2022: 10%
                
                Tactics used:
                - Illegal firings (worth the fine)
                - Mandatory anti-union meetings
                - Hiring "union avoidance" consultants
                - Moving jobs overseas/to "right to work" states
                - Classifying workers as "contractors"
                
                **2. Outsourcing & Offshoring**
                
                - Manufacturing jobs sent overseas
                - "You should be grateful to have a job"
                - Race to the bottom on wages
                - Threat of moving keeps workers quiet
                
                **3. The Gig Economy Scam**
                
                Companies like Uber, DoorDash, Amazon:
                - Workers are "independent contractors"
                - No minimum wage protections
                - No benefits
                - No unemployment insurance
                - Workers bear all costs and risks
                
                **4. Actual Wage Theft**
                
                Employers steal more than all robberies combined:
                
                - Wage theft: $50 billion/year
                - All robberies: $14 billion/year
                
                Forms:
                - Unpaid overtime
                - Working off the clock
                - Misclassification
                - Tip theft
                - Illegal deductions
                
                **5. "Benefits" Instead of Wages**
                
                Employers shift costs to workers:
                - Higher insurance premiums
                - Higher deductibles
                - 401k instead of pensions
                - Stock options instead of raises
                
                **The Result:**
                
                • 78% of workers live paycheck to paycheck
                • 40% can't cover a $400 emergency
                • 44% of workers are "low wage" (<$18/hour)
                • Real wages haven't risen since 1970s
                
                **Who Benefits:**
                
                • Shareholders (record profits)
                • Executives (record compensation)
                • Private equity (record returns)
                
                **Who Suffers:**
                
                The people who do the actual work.
                """,
                keyTakeaway: "Productivity rose 64% since 1973, but workers only got 17% of those gains. The rest went to executives and shareholders. This is wage theft on a civilizational scale."
            ),
            DreamLesson(
                title: "The Retirement Lie",
                subtitle: "How 401(k)s replaced pensions (and failed)",
                icon: "calendar.badge.clock",
                color: .orange,
                content: """
                **The Promise:**
                
                "Work hard, save for retirement, enjoy your golden years."
                
                **The Reality:**
                
                • **50%** of Americans have no retirement savings
                • **Median 401(k) balance** (ages 55-64): $89,000
                  - That's ~3 years of expenses
                • **Average Social Security**: $1,827/month
                  - Below poverty line in most cities
                • **Retirement age rising**: Many will work until they die
                
                **What Happened to Pensions?**
                
                **The Old Deal:**
                - Work for a company 20-30 years
                - Receive guaranteed income for life
                - Employer bears investment risk
                - Predictable, secure retirement
                
                **The New Deal (401k):**
                - You save your own money
                - You pick investments (hope you guess right)
                - You bear all the risk
                - Market crashes? Your problem
                - Live too long? Run out of money
                
                **How 401(k)s Happened:**
                
                The 401(k) was a tax loophole for executives, not a retirement plan.
                
                1978: Added to tax code for executive bonuses
                1981: IRS ruled it could apply to all employees
                1980s: Companies realized they could dump pensions
                
                **The man who helped create it, Ted Benna, calls it a "monster":**
                
                > "I would blow up the system and restart with something totally different."
                
                **Why Companies Love 401(k)s:**
                
                - No long-term liability
                - Workers bear all risk
                - Cheaper than pensions
                - Workers tied to jobs for vesting
                - Financial industry gets fees
                
                **The Hidden Fees:**
                
                Average 401(k) fees: 1-2% annually
                
                Over 40 years on $100,000:
                - 0.5% fees: Grows to $453,000
                - 1.5% fees: Grows to $329,000
                - **$124,000 lost to fees**
                
                That's your retirement—taken by fund managers.
                
                **The Market Risk:**
                
                Retired in 2008? Lost 40% immediately.
                Retired in 2022? Lost 20% immediately.
                
                With a pension: Still got your check.
                With a 401(k): Hope you don't run out.
                
                **Other Countries:**
                
                • **Netherlands**: Mandatory pensions, 80% of final salary
                • **Australia**: 11.5% mandatory employer contribution
                • **Denmark**: Universal pension + mandatory employer plans
                
                America: "Figure it out yourself, good luck."
                
                **The Coming Crisis:**
                
                Baby Boomers with insufficient savings:
                - Will rely on children (who have student debt)
                - Will rely on Social Security (being defunded)
                - Will work until physically unable
                - Will face poverty in old age
                
                This is not a personal failure. This is policy.
                """,
                keyTakeaway: "50% of Americans have zero retirement savings. The 401(k) shifted all risk from employers to workers. Even its creator calls it a 'monster.'"
            ),
            DreamLesson(
                title: "The Myth of Meritocracy",
                subtitle: "Why 'work hard' isn't enough",
                icon: "trophy.fill",
                color: .yellow,
                content: """
                **The Core Lie:**
                
                "In America, if you work hard, you'll succeed."
                
                This is the foundational myth—and the most damaging.
                
                **What Meritocracy Claims:**
                
                - Success = hard work + talent
                - Rich people earned it
                - Poor people deserve it
                - The system is fair
                - Your position reflects your worth
                
                **What the Data Shows:**
                
                **The biggest predictor of your income is your parents' income.**
                
                - Born to top 20%: 40% chance of staying there
                - Born to bottom 20%: 43% chance of staying there
                
                If meritocracy were real:
                - 20% would stay in each quintile (random)
                - Movement would be based on merit
                - Your parents' wealth wouldn't matter
                
                **Hard Work Doesn't Correlate:**
                
                Who works more hours?
                - Single mothers working 2 jobs
                - Construction workers
                - Amazon warehouse employees
                
                Who works fewer hours and earns more?
                - Hedge fund managers
                - Corporate executives
                - Trust fund recipients
                
                **The Inheritance Factor:**
                
                • 35-45% of wealth is inherited
                • By 2030: $68 trillion will transfer to heirs
                • Wealthy children: Better schools, connections, safety nets
                • Poor children: Debt, no connections, no safety net
                
                **What Actually Predicts Success:**
                
                1. **Parents' wealth**: #1 factor
                2. **ZIP code**: Schools, safety, opportunities
                3. **Race**: Systemic advantages/disadvantages
                4. **Gender**: Pay gaps, opportunity gaps
                5. **Connections**: Who you know > what you know
                6. **Luck**: Right place, right time
                7. **Hard work**: Matters, but not enough alone
                
                **The Useful Lie:**
                
                Believing in meritocracy serves the wealthy:
                
                • **Justifies inequality**: They "earned" it
                • **Blames victims**: Poor people are lazy
                • **Prevents solidarity**: You're competing, not organizing
                • **Protects the system**: No need for change
                
                **The Psychological Damage:**
                
                Believing in meritocracy causes:
                - Self-blame for systemic failures
                - Depression when "hard work" doesn't pay off
                - Judgment of others who struggle
                - Acceptance of exploitation
                
                **A Better Framework:**
                
                Success requires:
                - Hard work AND opportunity
                - Talent AND connections
                - Effort AND luck
                - Individual action AND systemic fairness
                
                You can work hard AND recognize the game is rigged.
                You can succeed AND advocate for systemic change.
                You can be proud of achievements AND acknowledge advantages.
                
                **The Real Question:**
                
                Not "did they work hard?"
                But "did they have the opportunity to have their work pay off?"
                """,
                keyTakeaway: "Your parents' income is the best predictor of your income—not hard work. Meritocracy is a myth that blames individuals for systemic failures."
            ),
            DreamLesson(
                title: "The Consumption Trap",
                subtitle: "How you're sold happiness you can't afford",
                icon: "cart.fill",
                color: .pink,
                content: """
                **The American Dream = Buying Stuff**
                
                The dream was corrupted into consumption:
                - Bigger house
                - Newer car
                - Latest gadgets
                - Designer clothes
                - Expensive vacations
                
                **By Design:**
                
                The advertising industry exists to make you feel inadequate so you buy things.
                
                Annual US ad spending: **$300+ billion**
                
                Average American sees: **4,000-10,000 ads per day**
                
                **The Hedonic Treadmill:**
                
                Studies show:
                - Material purchases provide temporary happiness
                - You adapt, need more to feel the same
                - Comparison with others drives dissatisfaction
                - Social media amplifies this 100x
                
                **The Debt Cycle:**
                
                1. See advertising, feel inadequate
                2. Buy thing you can't afford
                3. Feel good briefly
                4. Debt causes stress
                5. Work more to pay debt
                6. See advertising, feel inadequate
                7. Repeat
                
                **Credit Card Industry:**
                
                • Average household debt: $7,951
                • Total credit card debt: $1+ trillion
                • Average interest rate: 24%
                • Late fees in 2022: $12 billion (profit for banks)
                
                The industry's ideal customer:
                - Always in debt
                - Makes minimum payments
                - Never defaults
                - Pays interest forever
                
                **Manufactured Dissatisfaction:**
                
                **Planned Obsolescence:**
                - Products designed to break
                - Software updates slow old devices
                - Fashion "seasons" create artificial newness
                - Impossible-to-repair products
                
                **Status Competition:**
                - Visible brands signal status
                - "Luxury" goods cost 100x to make, sell for 1000x
                - Keeping up with the Joneses
                - Social media flexing
                
                **What Actually Makes People Happy:**
                
                Research shows:
                - **Experiences** over things
                - **Relationships** over status
                - **Purpose** over consumption
                - **Security** over luxury
                - **Time** over money (after basic needs met)
                
                **The Alternative:**
                
                The countries with highest happiness scores prioritize:
                - Work-life balance
                - Social safety nets
                - Community connection
                - Access to nature
                - Healthcare security
                
                NOT:
                - Maximum consumption
                - Status competition
                - Individual accumulation
                
                **Breaking Free:**
                
                1. Recognize advertising as manipulation
                2. Distinguish needs from manufactured wants
                3. Calculate true cost (hours of life to earn it)
                4. Invest in experiences and relationships
                5. Find identity outside of consumption
                """,
                keyTakeaway: "The American Dream became 'buy more stuff.' $300 billion/year in advertising exists to make you feel inadequate. Consumption doesn't create happiness—it creates debt."
            ),
            DreamLesson(
                title: "A Different Dream",
                subtitle: "What prosperity could actually look like",
                icon: "sun.max.fill",
                color: .yellow,
                content: """
                **The Dream Isn't Dead—It Was Stolen**
                
                The original dream—a society where everyone can thrive regardless of birth—is worth fighting for.
                
                But it requires systemic change, not just individual effort.
                
                **What Other Countries Have:**
                
                **Denmark, Norway, Finland consistently rank happiest**
                
                They have:
                - Universal healthcare (no medical bankruptcy)
                - Free/cheap education (no student debt trap)
                - Strong labor protections (unions, living wages)
                - Generous parental leave (12+ months)
                - Work-life balance (5+ weeks vacation)
                - Robust safety nets (no fear of falling)
                
                **Are They "Socialist"?**
                
                No. They're capitalist with guardrails:
                - Private businesses exist
                - Markets function
                - Innovation happens
                - People get rich
                
                BUT the gains are shared more broadly.
                
                **The Trade-Off:**
                
                Higher taxes, but:
                - No healthcare costs
                - No education costs
                - No fear of bankruptcy
                - More time off
                - Higher life satisfaction
                
                Americans pay less in taxes but more overall when you add:
                - Healthcare premiums, deductibles, copays
                - Student loan payments
                - Childcare costs
                - Retirement savings
                
                **What Could Change:**
                
                **Healthcare:**
                - Medicare for All would cover everyone
                - Cost: Less than current system
                - Every other developed nation does this
                
                **Education:**
                - Free public university
                - Trade school investment
                - Student debt cancellation
                - Early childhood education
                
                **Housing:**
                - Public housing investment
                - Zoning reform
                - Tenant protections
                - Break up corporate landlords
                
                **Labor:**
                - $20+ minimum wage (indexed to inflation)
                - Strengthen union rights
                - Paid family leave
                - Mandatory vacation
                
                **Wealth:**
                - Wealth tax
                - Close inheritance loopholes
                - Tax capital gains like income
                - Corporate tax enforcement
                
                **What You Can Do:**
                
                **1. Stop Blaming Yourself**
                - Systemic problems require systemic solutions
                - Your struggle is not moral failure
                
                **2. Educate Others**
                - Share what you've learned
                - Break the myth for those around you
                
                **3. Organize**
                - Join unions if possible
                - Support worker movements
                - Collective action > individual striving
                
                **4. Vote—Especially in Primaries**
                - Primary elections are where change happens
                - Research candidates' actual positions
                - Follow the money
                
                **5. Build Alternative Structures**
                - Mutual aid networks
                - Credit unions over banks
                - Co-ops and worker-owned businesses
                - Community over consumption
                
                **The Real American Dream:**
                
                Not: Individual wealth accumulation
                
                But: A society where everyone has:
                - Healthcare without bankruptcy
                - Education without debt
                - Housing without exploitation
                - Work that pays fairly
                - Time for family and community
                - Security in old age
                - A planet that's livable
                
                This dream is possible. It exists elsewhere. The only thing stopping it here is the people who profit from the current nightmare.
                """,
                keyTakeaway: "The dream isn't dead—it was stolen. Other countries prove a different system is possible. It requires collective action to take it back."
            )
        ]
    }
}

// MARK: - Lesson Model

struct DreamLesson: Identifiable {
    let id = UUID()
    let title: String
    let subtitle: String
    let icon: String
    let color: Color
    let content: String
    let keyTakeaway: String
}

// MARK: - Lesson View

struct AmericanDreamLessonView: View {
    let lesson: DreamLesson
    let index: Int
    
    @State private var showShareSheet = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                // Header
                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        Text("Lesson \(index)")
                            .font(.system(size: 12, weight: .medium))
                            .foregroundColor(lesson.color)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 4)
                            .background(lesson.color.opacity(0.2))
                            .cornerRadius(8)
                        
                        Spacer()
                        
                        Button(action: {
                            HapticManager.shared.light()
                            showShareSheet = true
                        }) {
                            Image(systemName: "square.and.arrow.up")
                                .foregroundColor(.gray)
                        }
                    }
                    
                    Text(lesson.title)
                        .font(.system(size: 26, weight: .bold))
                        .foregroundColor(.white)
                    
                    Text(lesson.subtitle)
                        .font(.system(size: 16))
                        .foregroundColor(.gray)
                }
                
                Divider()
                    .background(Color.white.opacity(0.2))
                
                // Content
                Text(lesson.content)
                    .font(.system(size: 15))
                    .foregroundColor(.white.opacity(0.9))
                    .lineSpacing(6)
                
                // Key Takeaway
                VStack(alignment: .leading, spacing: 12) {
                    HStack {
                        Image(systemName: "lightbulb.fill")
                            .foregroundColor(.yellow)
                        Text("Key Takeaway")
                            .font(.system(size: 14, weight: .bold))
                            .foregroundColor(.yellow)
                    }
                    
                    Text(lesson.keyTakeaway)
                        .font(.system(size: 16, weight: .medium))
                        .foregroundColor(.white)
                        .lineSpacing(4)
                }
                .padding()
                .background(Color.yellow.opacity(0.1))
                .cornerRadius(16)
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.yellow.opacity(0.3), lineWidth: 1)
                )
                
                // Navigation
                HStack {
                    if index > 1 {
                        Button(action: {
                            HapticManager.shared.light()
                            // Previous lesson
                        }) {
                            HStack {
                                Image(systemName: "chevron.left")
                                Text("Previous")
                            }
                            .font(.system(size: 14, weight: .medium))
                            .foregroundColor(.gray)
                        }
                    }
                    
                    Spacer()
                    
                    if index < 10 {
                        Button(action: {
                            HapticManager.shared.medium()
                            // Next lesson
                        }) {
                            HStack {
                                Text("Next Lesson")
                                Image(systemName: "chevron.right")
                            }
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(.white)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 12)
                            .background(lesson.color)
                            .cornerRadius(10)
                        }
                    } else {
                        Button(action: {
                            HapticManager.shared.success()
                            // Complete course
                        }) {
                            HStack {
                                Image(systemName: "checkmark.circle.fill")
                                Text("Complete Course")
                            }
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(.white)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 12)
                            .background(Color.green)
                            .cornerRadius(10)
                        }
                    }
                }
                .padding(.top)
            }
            .padding()
        }
        .background(Color.black.ignoresSafeArea())
        .navigationBarTitleDisplayMode(.inline)
    }
}

// MARK: - Preview

#Preview {
    NavigationStack {
        AmericanDreamExposedCourse()
    }
}
