// CollegeIndustrialComplexCourse.swift
// The truth about higher education they don't want you to know
// It's a business, not an investment in your future

import SwiftUI

struct CollegeIndustrialComplexCourse: View {
  var body: some View {
    ScrollView {
      VStack(spacing: 0) {
        // Header
        courseHeader

        // Shocking stats
        shockingStats

        // Lessons
        ForEach(Array(lessons.enumerated()), id: \.offset) { index, lesson in
          NavigationLink(destination: CollegeLessonView(lesson: lesson, index: index + 1)) {
            lessonRow(lesson, index: index)
          }
        }

        // Major reality check
        majorRealitySection

        // International comparison
        internationalSection

        // What to do
        actionSection
      }
    }
    .background(Color.black.ignoresSafeArea())
    .navigationTitle("College Exposed")
    .navigationBarTitleDisplayMode(.inline)
  }

  private var courseHeader: some View {
    VStack(spacing: 16) {
      ZStack {
        Circle()
          .fill(Color.blue.opacity(0.2))
          .frame(width: 100, height: 100)

        Image(systemName: "graduationcap.fill")
          .font(.system(size: 44))
          .foregroundColor(.blue)
      }

      Text("College Industrial Complex")
        .font(.system(size: 24, weight: .bold))
        .foregroundColor(.white)

      Text("The $1.7 trillion scam they call 'education'")
        .font(.system(size: 14))
        .foregroundColor(.gray)

      HStack {
        Text("12 Lessons")
          .font(.system(size: 12, weight: .medium))
          .foregroundColor(.gray)
        Spacer()
        Text("~90 min")
          .font(.system(size: 12, weight: .medium))
          .foregroundColor(.gray)
      }
      .padding(.horizontal)
    }
    .padding()
  }

  private var shockingStats: some View {
    VStack(alignment: .leading, spacing: 16) {
      Text("THE NUMBERS THEY HIDE")
        .font(.system(size: 12, weight: .black))
        .foregroundColor(.red)

      HStack(spacing: 12) {
        statBubble("$1.77T", "Total Student\nDebt", .red)
        statBubble("$37,574", "Avg Debt Per\nBorrower", .orange)
        statBubble("45M", "Americans With\nStudent Debt", .purple)
      }

      HStack(spacing: 12) {
        statBubble("1,200%", "Tuition Increase\nSince 1980", .red)
        statBubble("$80K+", "Private School\nPer Year", .orange)
        statBubble("54%", "Grads Working Jobs\nNot Requiring Degree", .yellow)
      }

      Text(
        "College costs increased 1,200% since 1980. Wages increased 236%. This isn't education—it's extraction."
      )
      .font(.system(size: 12))
      .foregroundColor(.white.opacity(0.8))
    }
    .padding()
    .background(Color.red.opacity(0.1))
    .cornerRadius(16)
    .padding()
  }

  private func statBubble(_ value: String, _ label: String, _ color: Color) -> some View {
    VStack(spacing: 4) {
      Text(value)
        .font(.system(size: 16, weight: .black))
        .foregroundColor(color)
      Text(label)
        .font(.system(size: 9))
        .foregroundColor(.gray)
        .multilineTextAlignment(.center)
    }
    .frame(maxWidth: .infinity)
    .padding(.vertical, 10)
    .background(Color.white.opacity(0.05))
    .cornerRadius(8)
  }

  private func lessonRow(_ lesson: CollegeLesson, index: Int) -> some View {
    HStack(spacing: 16) {
      ZStack {
        Circle()
          .fill(lesson.color.opacity(0.2))
          .frame(width: 48, height: 48)
        Text("\(index + 1)")
          .font(.system(size: 18, weight: .bold))
          .foregroundColor(lesson.color)
      }

      VStack(alignment: .leading, spacing: 4) {
        Text(lesson.title)
          .font(.system(size: 15, weight: .semibold))
          .foregroundColor(.white)
        Text(lesson.subtitle)
          .font(.system(size: 12))
          .foregroundColor(.gray)
      }

      Spacer()

      Image(systemName: "chevron.right")
        .foregroundColor(.gray)
    }
    .padding()
    .background(Color.white.opacity(0.03))
  }

  // MARK: - Major Reality Section

  private var majorRealitySection: some View {
    VStack(alignment: .leading, spacing: 16) {
      Text("20 MAJORS: THE REALITY CHECK")
        .font(.system(size: 14, weight: .black))
        .foregroundColor(.orange)

      Text("What they DON'T tell you at orientation")
        .font(.system(size: 12))
        .foregroundColor(.gray)

      // High earning majors
      VStack(alignment: .leading, spacing: 8) {
        Text("💰 Worth the Investment (Maybe)")
          .font(.system(size: 12, weight: .bold))
          .foregroundColor(.green)

        majorRow("Computer Science", "$85K", "High demand, can self-teach cheaper", .green)
        majorRow("Nursing (BSN)", "$77K", "Job security, but burnout is real", .green)
        majorRow("Engineering (Various)", "$75K", "Hard work but pays off", .green)
        majorRow("Accounting", "$73K", "Stable but can get CPA without degree", .green)
        majorRow("Finance", "$72K", "Good if you network, competitive", .yellow)
      }

      // Mid-tier
      VStack(alignment: .leading, spacing: 8) {
        Text("⚠️ Proceed With Caution")
          .font(.system(size: 12, weight: .bold))
          .foregroundColor(.yellow)

        majorRow("Business Administration", "$55K", "Too general, everyone has it", .yellow)
        majorRow("Marketing", "$52K", "Saturated, skills > degree", .yellow)
        majorRow("Biology", "$50K", "Need grad school for real jobs", .yellow)
        majorRow("Economics", "$65K", "Good but often need grad school", .yellow)
        majorRow("Political Science", "$52K", "Law school or bust basically", .yellow)
      }

      // Danger zone
      VStack(alignment: .leading, spacing: 8) {
        Text("🚨 The Debt Trap Majors")
          .font(.system(size: 12, weight: .bold))
          .foregroundColor(.red)

        majorRow("Psychology", "$38K", "Need PhD to make money, 6+ more years", .red)
        majorRow("Sociology", "$35K", "Love the subject? Teach it for $35K", .red)
        majorRow("Communications", "$40K", "Everyone's backup, oversaturated", .red)
        majorRow("English/Literature", "$38K", "Teaching or content writing", .red)
        majorRow("Art/Art History", "$35K", "Passion ≠ paycheck", .red)
        majorRow("Philosophy", "$42K", "Great thinking, bad earning", .red)
        majorRow("History", "$40K", "Teach or go to grad school", .red)
        majorRow("Theater/Drama", "$32K", "1% make it, 99% wait tables", .red)
        majorRow("Anthropology", "$40K", "Academic jobs nearly impossible", .red)
        majorRow("Gender Studies", "$36K", "Activism doesn't pay bills", .red)
      }

      Text(
        "Note: These are MEDIAN starting salaries. Half make less. And you're starting with $30-100K+ in debt."
      )
      .font(.system(size: 11, weight: .medium))
      .foregroundColor(.orange)
      .padding(.top, 8)
    }
    .padding()
    .background(Color.orange.opacity(0.1))
    .cornerRadius(16)
    .padding()
  }

  private func majorRow(_ major: String, _ salary: String, _ reality: String, _ color: Color)
    -> some View
  {
    HStack {
      VStack(alignment: .leading, spacing: 2) {
        Text(major)
          .font(.system(size: 13, weight: .semibold))
          .foregroundColor(.white)
        Text(reality)
          .font(.system(size: 10))
          .foregroundColor(.gray)
      }
      Spacer()
      Text(salary)
        .font(.system(size: 14, weight: .bold))
        .foregroundColor(color)
    }
    .padding(8)
    .background(Color.white.opacity(0.05))
    .cornerRadius(6)
  }

  // MARK: - International Comparison

  private var internationalSection: some View {
    VStack(alignment: .leading, spacing: 16) {
      Text("HOW OTHER COUNTRIES DO IT")
        .font(.system(size: 14, weight: .black))
        .foregroundColor(.cyan)

      Text("Free or nearly free college in developed nations:")
        .font(.system(size: 12))
        .foregroundColor(.gray)

      VStack(spacing: 10) {
        countryRow("🇩🇪 Germany", "FREE", "Even for international students", .green)
        countryRow("🇳🇴 Norway", "FREE", "Even for international students", .green)
        countryRow("🇫🇮 Finland", "FREE", "World's best education system", .green)
        countryRow("🇸🇪 Sweden", "FREE", "For EU students", .green)
        countryRow("🇩🇰 Denmark", "FREE", "Students get PAID to attend", .green)
        countryRow("🇫🇷 France", "~$200/yr", "Public universities", .green)
        countryRow("🇪🇸 Spain", "~$1,500/yr", "Public universities", .yellow)
        countryRow("🇬🇧 UK", "~$12K/yr", "Still half US prices", .yellow)
        countryRow("🇺🇸 USA", "$20-80K/yr", "Because freedom? 🙄", .red)
      }

      Text(
        "These countries have higher quality of life, longer life expectancy, and their graduates aren't drowning in debt."
      )
      .font(.system(size: 11, weight: .medium))
      .foregroundColor(.cyan)
    }
    .padding()
    .background(Color.cyan.opacity(0.1))
    .cornerRadius(16)
    .padding()
  }

  private func countryRow(_ country: String, _ cost: String, _ note: String, _ color: Color)
    -> some View
  {
    HStack {
      Text(country)
        .font(.system(size: 13, weight: .semibold))
        .foregroundColor(.white)
      Spacer()
      VStack(alignment: .trailing, spacing: 2) {
        Text(cost)
          .font(.system(size: 13, weight: .bold))
          .foregroundColor(color)
        Text(note)
          .font(.system(size: 9))
          .foregroundColor(.gray)
      }
    }
    .padding(8)
    .background(Color.white.opacity(0.05))
    .cornerRadius(6)
  }

  // MARK: - Action Section

  private var actionSection: some View {
    VStack(alignment: .leading, spacing: 16) {
      Text("WHAT YOU CAN DO")
        .font(.system(size: 14, weight: .black))
        .foregroundColor(.green)

      VStack(alignment: .leading, spacing: 10) {
        actionRow("Community college first", "Same credits, 1/4 the price")
        actionRow("Consider trade schools", "Electricians make $60K+, no debt")
        actionRow("Research actual job outcomes", "Not what brochures say")
        actionRow("Calculate true ROI", "Debt vs expected salary")
        actionRow("Look at coding bootcamps", "3-6 months, actual skills")
        actionRow("Consider studying abroad", "Germany is free, even for Americans")
        actionRow("Gap year to figure it out", "Better than $100K on wrong major")
        actionRow("Self-education + certifications", "Many fields value skills over degrees")
      }

      Text(
        "College CAN be worth it—but only with eyes wide open about the real costs and outcomes."
      )
      .font(.system(size: 12, weight: .medium))
      .foregroundColor(.green)
    }
    .padding()
    .background(Color.green.opacity(0.1))
    .cornerRadius(16)
    .padding()
  }

  private func actionRow(_ title: String, _ desc: String) -> some View {
    HStack(alignment: .top, spacing: 10) {
      Image(systemName: "checkmark.circle.fill")
        .foregroundColor(.green)
        .font(.system(size: 14))
      VStack(alignment: .leading, spacing: 2) {
        Text(title)
          .font(.system(size: 13, weight: .semibold))
          .foregroundColor(.white)
        Text(desc)
          .font(.system(size: 11))
          .foregroundColor(.gray)
      }
    }
  }

  // MARK: - Lessons Data

  private var lessons: [CollegeLesson] {
    [
      CollegeLesson(
        title: "The Business Model",
        subtitle: "It's not education—it's extraction",
        color: .red,
        content: """
          **College Is a Business**

          The first thing to understand: American higher education is not primarily about education. It's a $700+ billion industry designed to extract maximum wealth from students and families.

          ---

          **The Numbers:**

          **Tuition increases:**
          - 1980: Average tuition $3,190 (inflation-adjusted: $10,231)
          - 2023: Average tuition $22,690 (public in-state)
          - Private universities: $50,000-$85,000/year

          **That's a 1,200% increase since 1980.**

          Meanwhile:
          - Wages increased 236%
          - Inflation increased 236%
          - Housing increased 400%

          **Why did college go up 1,200%?**

          Because they can. And because loans are guaranteed.

          ---

          **The Business Strategy:**

          1. **Create artificial scarcity** - Limited admissions create exclusivity
          2. **Market prestige** - Rankings, sports, campus amenities
          3. **Capture customers early** - High school visits, tours, brochures
          4. **Maximize extraction** - Tuition, fees, housing, dining, parking, books
          5. **Lock in for 4+ years** - Transfer credits often don't work
          6. **Guaranteed payment** - Federal loans mean they always get paid

          ---

          **The Amenities Arms Race:**

          Why does your tuition keep rising? Look at what schools spend on:

          - **Lazy rivers and luxury dorms** - Yes, actual lazy rivers
          - **Climbing walls and fitness centers** - Fancier than any gym
          - **Dining halls like food courts** - Sushi, smoothie bars
          - **Administrative bloat** - More administrators than faculty
          - **Sports programs** - Stadiums, coaches making millions

          **None of this improves education.**

          It's marketing. To justify higher prices.

          ---

          **Administrative Bloat:**

          **1975:** 1 administrator per 3.5 faculty
          **2022:** 1 administrator per 1.1 faculty

          Between 1987-2012:
          - Administrators increased 60%
          - Administrator spending increased 750%
          - Faculty increased 50%

          Who do you think is getting your tuition money?

          ---

          **The Nonprofit Lie:**

          Most universities are "nonprofit." What does that mean?

          - Can't distribute profits to shareholders
          - CAN pay executives millions
          - CAN build $billion endowments
          - CAN spend unlimited on amenities
          - PAY NO TAXES

          Harvard's endowment: $50+ billion
          Yale's endowment: $40+ billion

          **They have more money than most countries. But tuition keeps rising.**

          ---

          **Why They Don't Lower Prices:**

          They COULD charge less. They choose not to.

          1. **High prices signal prestige** - Cheap = must not be good
          2. **Loans guarantee payment** - Students can always borrow
          3. **No real competition** - All schools raise prices together
          4. **Captured regulators** - Accreditation is a cartel
          5. **Tax advantages** - Donations are tax-deductible

          **The system is working exactly as designed—for them.**
          """,
        keyTakeaway:
          "College tuition increased 1,200% since 1980 while wages increased 236%. It's not about education—it's a $700B industry. Administrative bloat, amenities arms race, and guaranteed federal loans enable endless price increases."
      ),
      CollegeLesson(
        title: "The Vagueness Is Strategic",
        subtitle: "Why college selection is so confusing",
        color: .orange,
        content: """
          **Confusion Is the Business Model**

          Ever wonder why choosing a college is so overwhelming? Why the information is scattered, confusing, and hard to compare?

          **That's by design.**

          ---

          **What They Hide:**

          **Actual job placement rates:**
          - Not just "employed" but employed in their field
          - Most schools don't track this or hide it
          - "95% employment rate" includes baristas with degrees

          **Actual average salaries:**
          - By major, not overall
          - 5 years out, not just starting
          - Compared to people without degrees in same field

          **True total cost:**
          - Not just tuition
          - Room, board, fees, books, transportation
          - 4 years? Or the actual average of 5-6 years?

          **Default rates:**
          - How many graduates can't pay loans?
          - Hidden or buried in data

          ---

          **The Propaganda Machine:**

          **What college marketing shows:**
          - Beautiful campus shots
          - Happy, diverse students
          - Successful alumni (cherry-picked)
          - Research and innovation
          - "Life-changing experiences"

          **What they don't show:**
          - Stressed students in debt
          - Graduates working retail
          - Actual classroom sizes
          - Adjunct professors making poverty wages
          - Mental health crisis on campus

          ---

          **Rankings Are a Scam:**

          **US News & World Report rankings:**

          Based on:
          - Reputation surveys (subjective)
          - Spending per student (rewards waste)
          - Alumni giving (rewards rich alumni)
          - Faculty salaries (not teaching quality)
          - Acceptance rate (rewards rejecting students)

          **NOT based on:**
          - Actual learning outcomes
          - Job placement in field
          - Graduate satisfaction
          - Return on investment
          - Loan default rates

          **Schools GAME the rankings:**
          - Encourage applications to reject more
          - Reclassify spending
          - Manipulate class sizes
          - Change reporting methods

          Some schools have been caught lying about data.

          ---

          **The Visit Trap:**

          Campus visits are designed to SELL, not inform:

          - Tours avoid bad areas
          - Use student ambassadors (paid, trained)
          - Schedule during best weather
          - Show newest buildings
          - Emotional manipulation
          - Pressure tactics ("applications are up!")

          **You're being marketed to, not educated.**

          ---

          **Financial Aid Letters:**

          **Designed to confuse:**

          - "Award" sounds like free money
          - Loans listed as "aid"
          - Different formats at every school
          - Hard to compare offers
          - Hidden fees added later

          **"Cost of attendance: $50,000
          Your award package: $45,000!"**

          But $35,000 of that "award" is LOANS.

          You're only getting $10,000 in actual help.

          ---

          **Why Keep It Confusing:**

          1. **Prevents comparison shopping** - Can't easily compare schools
          2. **Emotional decisions** - "It felt right" costs $200K
          3. **FOMO** - Fear of missing out on "dream school"
          4. **Prestige over value** - Name brand obsession
          5. **Trust in institutions** - "They wouldn't mislead us"

          **Clarity would destroy the business model.**

          If families could easily see:
          - True costs
          - Actual outcomes
          - ROI by major

          Many would make very different choices.

          **That's exactly what they're afraid of.**
          """,
        keyTakeaway:
          "College selection is confusing BY DESIGN. Rankings reward spending, not outcomes. Campus visits are sales pitches. Financial aid letters disguise loans as 'awards.' If you could easily compare, you'd make different choices—and they know it."
      ),
      CollegeLesson(
        title: "The Financial Aid Illusion",
        subtitle: "Scholarships and aid aren't what you think",
        color: .purple,
        content: """
          **The Aid Mirage**

          "Don't worry about the price—just apply and see what aid you get."

          This advice has trapped millions in debt.

          ---

          **The Reality of Scholarships:**

          **Full ride scholarships:**
          - Less than 1% of students get them
          - Mostly athletic or extreme academic merit
          - Often have GPA requirements (lose scholarship if you slip)

          **Partial scholarships:**
          - Average merit aid at private schools: $22,000
          - Average tuition at private schools: $55,000
          - That's still $33,000/year out of pocket

          **Most students get:**
          - Small grants
          - Work-study (a JOB, not a gift)
          - LOANS (not aid, just delayed payment)

          ---

          **Financial Aid Letter Decoded:**

          **Sample "award" letter:**

          ```
          Cost of Attendance: $70,000

          Your Financial Aid Package:
          - Federal Pell Grant: $7,000
          - University Grant: $15,000
          - Federal Subsidized Loan: $5,500
          - Federal Unsubsidized Loan: $7,000
          - Parent PLUS Loan: $20,000
          - Work-Study: $3,000

          Total Aid: $57,500
          Remaining Balance: $12,500
          ```

          **The truth:**

          FREE money (grants): $22,000
          LOANS (debt): $32,500
          WORK (your labor): $3,000

          **You're getting $22K in actual aid, not $57.5K**

          And you still owe $12,500 after all that.

          ---

          **The EFC Scam:**

          **Expected Family Contribution (EFC):**

          The government calculates what your family "can afford."

          Problems:
          - Assumes parents will pay (they might not)
          - Doesn't account for other children's college
          - Counts home equity as "available"
          - Uses income from 2 years ago
          - Ignores debt
          - Often wildly unrealistic

          EFC of $30,000 doesn't mean you HAVE $30,000.

          ---

          **Merit Aid Manipulation:**

          **How schools use "scholarships" to manipulate:**

          1. **High sticker price** - Set tuition at $60,000
          2. **Everyone gets "scholarships"** - $15-25K off
          3. **You feel special** - "I got a scholarship!"
          4. **But you're still paying $35-45K** - More than state school

          **This is just a discount, not a scholarship.**

          It's like a furniture store with perpetual "50% off" sales.

          ---

          **FAFSA Problems:**

          **The Free Application for Federal Student Aid:**

          - 108 questions
          - Confusing language
          - Requires tax returns, bank statements
          - Many families don't complete it
          - Errors delay or reduce aid
          - Doesn't guarantee enough aid

          **First-generation students are disadvantaged:**
          - Parents don't know the process
          - No one to help navigate
          - Miss deadlines
          - Accept bad deals

          ---

          **Work-Study Reality:**

          **Work-study is a JOB, not free money:**

          - You work 10-15 hours/week
          - At minimum wage or slightly above
          - That's maybe $3,000-4,000/year
          - Takes time from studying
          - Jobs might not be available

          **They count your labor as "aid."**

          ---

          **The Gap:**

          Even after all aid, most students face a gap:

          - Average annual gap: $10,000-$15,000
          - Over 4 years: $40,000-$60,000
          - Filled by: Parent loans, private loans, credit cards
          - Or: Not attending

          **"Financial aid" often just means "debt you qualify for."**
          """,
        keyTakeaway:
          "Less than 1% get full rides. Average scholarship still leaves $33K/year to pay. 'Award' letters include loans as 'aid.' A $57K 'package' might only be $22K in actual free money. Work-study is just a job they count as aid."
      ),
      CollegeLesson(
        title: "The Textbook Racket",
        subtitle: "How they squeeze more money from you",
        color: .green,
        content: """
          **The $1,200/Year Scam**

          Average student spends $1,200/year on textbooks. For what are often just information that's freely available.

          ---

          **How the Racket Works:**

          **1. New editions every 2-3 years:**
          - Change a few pages
          - Rearrange chapters
          - Update "current events" examples
          - Change problem numbers
          - Charge full price again

          **The information doesn't change.**

          Math didn't change since last edition.
          Biology basics didn't change.
          History... literally can't change.

          **But you can't use the old edition because:**
          - Homework problems don't match
          - Page numbers are different
          - Professor "requires" new edition

          ---

          **The Professor Conflict:**

          **Professors writing their own textbooks:**

          - Assign their own book to captive audience
          - Students MUST buy it for class
          - Professor gets royalties
          - Often self-published = high prices
          - "New edition" every year or two

          **This is a conflict of interest.**

          Some schools have policies against it. Most don't.

          ---

          **The Access Code Scam:**

          **Modern textbook scam evolution:**

          1. Textbook costs $150
          2. Comes with "access code" for online homework
          3. Access code is REQUIRED for class
          4. Code expires after semester
          5. Can't buy used books (code is used)
          6. Can't resell your book (code is used)
          7. Pay full price every time

          **They eliminated the used book market.**

          ---

          **The Numbers:**

          **Textbook prices:**
          - 1977-2015: Increased 1,041%
          - General inflation: 308%
          - College textbooks rose 3x faster than inflation

          **Why?**
          - Captive market (you must buy)
          - No competition (professor chooses)
          - Oligopoly (few publishers)
          - Bundling with access codes

          **Pearson, Cengage, and McGraw-Hill control 80% of market.**

          ---

          **What Schools Could Do:**

          - Require Open Educational Resources (OER)
          - Provide textbooks through tuition (some do)
          - Standardize across sections
          - Use older editions
          - Create institutional materials

          **What they actually do:**
          - Nothing
          - Some even get kickbacks from publishers

          ---

          **How to Fight Back:**

          **Before buying:**

          1. **Check the library** - They often have copies
          2. **Ask if older edition works** - Usually it does
          3. **International editions** - Same content, fraction of price
          4. **Rent don't buy** - Chegg, Amazon rental
          5. **Split with classmates** - Share one copy
          6. **PDF versions** - Legal free ones exist for many
          7. **Wait and see** - Do you actually need it?

          **Don't buy until first week of class.**

          Many professors say "required" but never actually use it.

          ---

          **Open Educational Resources:**

          **Free, legal textbook alternatives:**

          - OpenStax (Rice University)
          - MIT OpenCourseWare
          - Project Gutenberg
          - Library Genesis (legal in many countries)
          - Khan Academy
          - Many professor-created materials

          **The knowledge should be free. It's only expensive because of artificial scarcity.**
          """,
        keyTakeaway:
          "Textbook prices rose 1,041% since 1977—3x faster than inflation. 'New editions' often change almost nothing. Access codes eliminated the used book market. Three publishers control 80% of the market. Fight back: library, older editions, international versions, split costs."
      ),
      CollegeLesson(
        title: "The Student Loan Trap",
        subtitle: "How they enslave you with debt",
        color: .red,
        content: """
          **$1.77 Trillion in Chains**

          Student loan debt is the only debt you cannot escape through bankruptcy. That's not an accident.

          ---

          **The Numbers:**

          - **Total debt:** $1.77 trillion
          - **Borrowers:** 45 million Americans
          - **Average debt:** $37,574
          - **Median debt:** $20,000
          - **Borrowers over $100K:** 7%
          - **Default rate:** 10%+ (pre-pandemic)

          **More than credit card and auto loan debt combined.**

          ---

          **The History:**

          **How we got here:**

          1958: National Defense Education Act (small loans)
          1965: Higher Education Act (expanded access)
          1972: Sallie Mae created (government-backed)
          1978: Middle Income Student Assistance Act
          1992: Unsubsidized loans created
          1997: Sallie Mae privatized
          2005: **Bankruptcy protection removed** (!)
          2010: Direct lending only through government

          **Key moment: 2005**

          Student loans became essentially inescapable.
          - Can't be discharged in bankruptcy
          - Government can garnish wages
          - Government can take tax refunds
          - Government can take Social Security (yes, really)

          **No other consumer debt has these features.**

          ---

          **Federal vs Private:**

          **Federal loans:**
          - Lower interest rates (5-7%)
          - Income-driven repayment options
          - Forgiveness programs (PSLF, etc.)
          - Deferment options
          - Still can't escape through bankruptcy

          **Private loans:**
          - Higher interest rates (6-14%+)
          - Variable rates that can increase
          - Fewer protections
          - Need cosigner (usually parents)
          - Even harder to escape

          **Both types are designed to profit from you, not help you.**

          ---

          **The Interest Trap:**

          **How compound interest destroys you:**

          Borrow: $40,000 at 6%
          Monthly payment: $444 (10-year plan)
          Total repaid: $53,288
          Interest paid: **$13,288**

          **That's 33% extra.**

          But wait—most people can't afford $444/month...

          Income-driven plan: $200/month
          Time to repay: 25 years
          Total repaid: **$60,000+**

          **You paid more by trying to pay less.**

          ---

          **The Capitalization Scam:**

          **During deferment or forbearance:**

          Interest keeps accruing.
          When you resume payments, that interest is added to principal.
          Now you pay interest on interest.

          Example:
          - Borrowed: $30,000
          - Graduate school deferment: 3 years
          - Interest accrued: $5,400
          - New principal: $35,400
          - Now 6% on $35,400, not $30,000

          **The loan grows even when you're not paying.**

          ---

          **Who Profits:**

          **Loan servicers:**
          - Paid per loan, not per successful outcome
          - Incentive to keep you paying longer
          - Poor customer service is feature, not bug
          - Make money on late fees, penalties

          **The government:**
          - Makes billions in profit on federal loans
          - Yes, your government profits from your debt

          **Colleges:**
          - Get paid upfront regardless of outcomes
          - No skin in the game
          - Don't care if you can repay

          ---

          **The Bankruptcy Exception:**

          **You can discharge:**
          - Credit card debt
          - Medical debt
          - Mortgage debt (lose house)
          - Business debt
          - Gambling debt
          - Almost anything

          **You cannot discharge:**
          - Student loans (without proving "undue hardship")
          - "Undue hardship" is nearly impossible to prove
          - Only 0.1% of bankruptcy filers even try

          **Why?**

          Banks and loan companies lobbied for this.
          In 2005, Congress (both parties) delivered.

          **You can destroy your life gambling, go bankrupt, and start fresh.**
          **You cannot escape the "investment" in your education.**
          """,
        keyTakeaway:
          "$1.77 trillion in student debt. In 2005, bankruptcy protection was removed—you can NEVER escape. Interest capitalizes during deferment. A $40K loan becomes $60K+ over time. The government profits billions from your debt."
      ),
      CollegeLesson(
        title: "The 4-Year Filler Scam",
        subtitle: "Why degrees take so long",
        color: .yellow,
        content: """
          **Why Does It Take 4 Years?**

          Most professional skills could be taught in 1-2 years. So why 4? And why do most students take 5-6?

          **Because more years = more tuition.**

          ---

          **The General Education Racket:**

          **"Well-rounded education" requirements:**

          - 2 semesters English composition
          - 2 semesters math
          - 2 semesters science
          - 2 semesters history
          - 2 semesters social science
          - 2 semesters humanities
          - 1-2 semesters foreign language
          - 1 semester diversity requirement
          - 1 semester ethics
          - Various other requirements

          **That's 30-40 credits of requirements** before you even start your major.

          ---

          **The Reality:**

          **You already learned this:**

          - English composition? You took 12 years of English
          - Basic math? You've had it since elementary school
          - History? Covered in high school
          - Science? Same

          **But college makes you PAY to do it again.**

          At $1,000+ per credit hour at many schools.

          ---

          **Who Benefits:**

          **From general education requirements:**

          1. **The university** - More tuition revenue
          2. **Departments** - Justifies hiring (English dept needs students)
          3. **Adjunct professors** - Someone to teach sections
          4. **Textbook publishers** - More books to sell

          **Who doesn't benefit:**

          YOU.

          ---

          **The Major Requirements Padding:**

          Even within your major:

          - Intro to [Field] (stuff you could Google)
          - History of [Field] (interesting but not practical)
          - Theory of [Field] (when do you use this?)
          - Research methods (one paper, one course)
          - Capstone (4 credits to write one project)
          - Electives "within the department"

          **How many courses actually teach usable skills?**

          In most majors: 5-8 out of 40.

          ---

          **Why It Takes 5-6 Years:**

          **Reality for most students:**

          - Required courses full, can't get in
          - Prerequisites not offered when needed
          - Changed majors (lost credits)
          - Failed/repeated courses
          - Had to work, took fewer credits
          - Co-op/internship added time
          - Study abroad didn't transfer

          **Average time to bachelor's: 5.1 years**

          That's another $20-50K they didn't mention.

          ---

          **The Credit Transfer Scam:**

          **Changing schools? Transferring?**

          - Community college credits might not transfer
          - AP credits often limited
          - Different schools, different requirements
          - "We don't accept that course"
          - Must retake at new school (and pay again)

          **This keeps you locked in.**

          Like a cell phone contract with huge cancellation fees.

          ---

          **International Comparison:**

          **Bachelor's degrees elsewhere:**

          - **UK:** 3 years standard
          - **Australia:** 3 years standard
          - **Europe (Bologna system):** 3 years
          - **India:** 3 years

          **Why can they do it in 3?**

          - No general education requirements (you did that in high school)
          - Focused curriculum
          - Enter directly into field of study

          **American students pay 33% more for the same degree.**

          ---

          **What Actually Matters:**

          For most careers:

          - 6-12 months of focused training
          - Real-world experience (internships)
          - Portfolio of work
          - Professional certifications
          - Network connections

          **4 years of sitting in lectures is often the least important part.**

          But it's the part they charge you $100K+ for.
          """,
        keyTakeaway:
          "Most degrees could be completed in 1-2 years. General education requirements are revenue generation. Other countries do bachelor's in 3 years. Average US completion is 5.1 years. Credit transfers are designed to keep you locked in."
      ),
      CollegeLesson(
        title: "The In-State/Out-of-State Scam",
        subtitle: "We're one country, right?",
        color: .blue,
        content: """
          **Arbitrary Lines, Real Costs**

          Move 10 miles across a state line, and your tuition triples. Why?

          ---

          **The Numbers:**

          **Average public university tuition (2023-24):**

          - In-state: $10,662
          - Out-of-state: $23,630

          **That's $12,968 MORE per year** for the same education.

          Over 4 years: **$51,872** extra

          Some examples:
          - UC Berkeley: $14K in-state / $44K out-of-state
          - UMichigan: $16K in-state / $55K out-of-state
          - UT Austin: $11K in-state / $41K out-of-state

          ---

          **The Justification:**

          **"Your state taxes paid for this school"**

          But:
          - State funding has collapsed (averages 10-20% of budget now)
          - Federal money (your federal taxes) flows to all states
          - You'll pay state taxes wherever you work
          - Many students STAY in state after graduation

          **The argument made sense in 1970. It doesn't anymore.**

          ---

          **The Revenue Reality:**

          **Why out-of-state students are valuable:**

          Schools WANT out-of-state students because:
          - Pay 2-3x more
          - Cash flow immediately (not waiting for state budget)
          - Diversity metrics for rankings
          - Some states incentivize recruiting them

          **Many schools:**
          - Reserve spots for out-of-state students
          - Admit more out-of-state than they "need"
          - Use out-of-state tuition to subsidize in-state

          **You're a cash cow, not a student.**

          ---

          **The Regional Compacts:**

          **Some states have agreements:**

          - **WUE (Western Undergraduate Exchange):** 16 states, 150% of in-state
          - **MHEC (Midwest Student Exchange):** 12 states, discounted
          - **NEBHE (New England):** 6 states, discounted
          - **SREB (Academic Common Market):** 16 southern states

          **These help but:**
          - Limited to certain programs
          - Not all schools participate
          - Still more than in-state
          - Complicated eligibility

          ---

          **Establishing Residency:**

          **Want in-state rates? You need:**

          - Live in state 12+ months (varies)
          - Not primarily for education
          - File state taxes
          - Driver's license
          - Voter registration
          - Car registration
          - Sometimes: Employed

          **But:**
          - Can't be enrolled full-time while establishing
          - Schools fight residency claims
          - Rules are intentionally complex
          - Some states nearly impossible

          ---

          **The Absurdity:**

          **Imagine if this applied elsewhere:**

          - Hospital: "Sorry, you're from out of state—triple the price"
          - Grocery store: "Show your driver's license for pricing"
          - Highway: "Out-of-state plates? $50 toll"

          **We don't do this for anything else.**

          ---

          **Alternative Framing:**

          **What if we saw it this way:**

          - All Americans fund federal education grants
          - All Americans deserve equal access
          - States benefit from educated workforce
          - Mobility is economic freedom
          - Borders within a country shouldn't limit opportunity

          **The current system:**
          - Punishes mobility
          - Favors wealthy (can afford out-of-state)
          - Limits options for middle class
          - Creates arbitrary disadvantages

          ---

          **What This Really Is:**

          A hidden tax on freedom.

          Want to:
          - Study your passion at a great program?
          - Be near family in another state?
          - Access opportunities not in your state?
          - Escape a bad home situation?

          **Pay extra. Because lines on a map.**
          """,
        keyTakeaway:
          "Out-of-state tuition is $52K+ more over 4 years—for the same education. State funding is now only 10-20% of school budgets, so 'taxpayer' argument is outdated. It's arbitrary punishment for mobility. We're supposed to be one country."
      ),
      CollegeLesson(
        title: "When College WAS Affordable",
        subtitle: "How they stole public education",
        color: .purple,
        content: """
          **It Wasn't Always Like This**

          There was a time when Americans could work part-time and pay for college. What happened?

          ---

          **The Golden Era:**

          **1960s-1970s:**

          - **UC system:** FREE tuition for California residents
          - **SUNY (New York):** FREE until 1963
          - **CUNY (New York City):** FREE until 1976
          - Most state schools: Minimal tuition

          **A summer job could pay for a year of college.**

          1979: Minimum wage worker needed 385 hours to pay average public tuition.
          2023: Minimum wage worker needs 1,800+ hours.

          ---

          **What Changed:**

          **The Powell Memo (1971):**

          Lewis Powell (later Supreme Court Justice) wrote a memo for the Chamber of Commerce:

          - "Attack on American free enterprise system"
          - Universities are "the single most dynamic source"
          - Need to fight for corporate interests
          - Influence campuses, media, politics

          This memo launched decades of organizing against public institutions.

          **The Reagan Revolution (1980s):**

          - Cut federal education funding
          - Reduced state funding incentives
          - Promoted "personal responsibility"
          - Education as private investment, not public good

          **Reagan as California Governor** ended free UC tuition in 1970.

          ---

          **The Shift in Funding:**

          **State funding per student:**

          - 1988: $8,600 (inflation-adjusted)
          - 2023: $6,800

          **Percent of public school budget from state:**

          - 1980: ~70%
          - 2023: ~20-30%

          **As state funding dropped, tuition rose to fill gap.**

          ---

          **The Philosophy Shift:**

          **Education as public good:**
          - Society benefits from educated citizens
          - Educated workforce benefits economy
          - Everyone should have access
          - Funded by progressive taxation

          **Education as private investment:**
          - Individual benefits from their degree
          - Individual should bear cost
          - Loans create "skin in the game"
          - Market should determine value

          **We went from column A to column B.**

          But the JOBS still require degrees. You don't have a choice.

          ---

          **Key Policy Changes:**

          **1972:** Pell Grants created (good!)
          **1992:** Unsubsidized loans created (questionable)
          **1996:** HOPE/Lifetime Learning credits (helps wealthy more)
          **2005:** Bankruptcy protection removed (disaster)
          **2010:** Government takes over all federal lending

          **Each step made debt more normalized, more available, more inescapable.**

          ---

          **The Boomer Blind Spot:**

          **Why older generations don't understand:**

          1960s graduate: "I paid my way through college working summers"

          Reality for them:
          - Tuition: $500/year
          - Summer job: $4,000
          - Plenty left over

          Reality today:
          - Tuition: $25,000/year
          - Summer job: $5,000-8,000
          - Massive deficit

          **They think they were just harder workers. They were just luckier timing.**

          ---

          **Who Did This:**

          Not an accident. Deliberate policy choices by:

          - Politicians who cut state funding
          - University administrators who raised prices
          - Banks who lobbied for bankruptcy exceptions
          - Think tanks funded by wealthy donors
          - Voters who supported "fiscal responsibility"

          **Both parties participated.**

          But some more than others.

          ---

          **The Irony:**

          The generation that benefited from:
          - Free or cheap public university
          - Strong job market
          - Affordable housing
          - Defined benefit pensions

          **Pulled the ladder up behind them.**

          And tells you to "work harder."
          """,
        keyTakeaway:
          "UC was FREE until 1970. A summer job could pay for a year of college in the 1970s. State funding dropped from 70% to 20-30%. The shift from 'public good' to 'private investment' was deliberate policy. The generation that got free college pulled the ladder up."
      ),
      CollegeLesson(
        title: "The College-Or-Nothing Myth",
        subtitle: "Alternative paths they don't tell you",
        color: .green,
        content: """
          **The Propaganda**

          "You MUST go to college to succeed."

          This is repeated by:
          - High school counselors
          - Parents
          - Media
          - Politicians
          - College marketing

          **But is it true?**

          ---

          **The Statistics:**

          **College graduates vs non-graduates (median income):**

          - Bachelor's: $67,860
          - Associate's: $48,776
          - High school: $40,612

          **Seems clear, right? But wait:**

          - Skilled trades: $50,000-$100,000+
          - Tech with bootcamp: $65,000-$100,000+
          - Sales: Varies wildly, no degree needed
          - Entrepreneurship: No degree matters

          **And those college numbers include massive debt.**

          ---

          **The Hidden Costs:**

          **4-year degree true cost:**

          - Tuition: $100,000-$200,000+
          - Lost wages (4 years): $120,000+
          - Interest on loans: $20,000-$50,000+
          - **Total: $240,000-$370,000**

          **Meanwhile, someone learning a trade:**

          - Training cost: $0-$20,000
          - Earning during apprenticeship: $80,000+
          - After 4 years: Working, no debt
          - **Net position: +$100,000**

          **That's a $340,000+ difference.**

          ---

          **Paths Without College:**

          **Skilled Trades:**

          - Electrician: $60,000-$100,000
          - Plumber: $55,000-$90,000
          - HVAC: $50,000-$80,000
          - Welder: $45,000-$75,000
          - Carpenter: $50,000-$80,000
          - Elevator mechanic: $90,000-$120,000

          **Shortage of workers.** High job security. Can start business.

          ---

          **Tech Without Degree:**

          **Coding bootcamps:**
          - Duration: 3-6 months
          - Cost: $10,000-$20,000
          - Average salary after: $67,000
          - Companies hiring: Many dropped degree requirements

          **Certifications:**
          - AWS, Google Cloud, Azure
          - CompTIA (IT support)
          - Salesforce
          - Many others

          **Self-teaching:**
          - Free resources everywhere
          - Portfolio matters more than degree
          - Open source contributions
          - Freelancing to build experience

          ---

          **Military:**

          **Benefits:**
          - Training in various skills
          - GI Bill for later education (if wanted)
          - Veterans benefits
          - Discipline and experience

          **Drawbacks:**
          - Commitment (4+ years)
          - Risk
          - Not for everyone

          **But it's an option with real benefits.**

          ---

          **Entrepreneurship:**

          **Reality check:**

          - Most successful entrepreneurs don't have relevant degrees
          - Real-world experience matters more
          - Capital and connections matter most
          - Can start while learning

          **College can actually DELAY entrepreneurship:**
          - 4 years of not building
          - Debt creates risk aversion
          - Corporate jobs to pay loans

          ---

          **The Credential Inflation Problem:**

          **Why "you need a degree":**

          1. HR uses degree as filter (lazy hiring)
          2. So many have degrees, you need one too
          3. Regulatory capture (licensing requires degrees)
          4. Status signaling

          **But:**
          - Many companies dropping degree requirements
          - Google, Apple, IBM, many others
          - Skills-based hiring growing
          - Portfolio > diploma for many fields

          ---

          **When College DOES Make Sense:**

          **Definitely need degree:**
          - Doctor, lawyer, engineer (licensed)
          - Research scientist
          - Professor
          - Some government jobs

          **Helps significantly:**
          - Some business paths
          - Certain corporate tracks
          - Networking opportunities

          **Probably doesn't matter:**
          - Creative fields
          - Entrepreneurship
          - Tech (increasingly)
          - Sales
          - Trades
          - Many, many others

          **Know which category your goal fits.**
          """,
        keyTakeaway:
          "Skilled trades pay $50-100K+ with no debt. Tech bootcamps are 3-6 months and lead to $67K+ jobs. Many companies (Google, Apple, IBM) dropped degree requirements. True cost of college + lost wages = $300K+. Know when a degree actually matters vs propaganda."
      ),
      CollegeLesson(
        title: "Choosing Smart (If You Go)",
        subtitle: "How to not get destroyed",
        color: .cyan,
        content: """
          **If You're Going Anyway...**

          College can be worth it—IF you go in with eyes open and strategy clear.

          ---

          **Step 1: Know Your Why**

          **Good reasons to go:**
          - Specific career requiring degree (doctor, lawyer, engineer)
          - You've researched job market and ROI
          - Clear plan for major and career
          - Free or very cheap option available

          **Bad reasons to go:**
          - "Everyone else is going"
          - "I don't know what else to do"
          - "My parents expect it"
          - "To find myself"
          - "The college experience"

          **$100K+ is expensive for "finding yourself."**

          ---

          **Step 2: Calculate True ROI**

          **Before choosing:**

          1. Total cost (4-5 years, ALL expenses)
          2. Expected starting salary (median, not top)
          3. Expected salary at 10 years
          4. Job availability in field
          5. Geographic constraints
          6. Alternative paths to same career

          **Formula:**

          (Expected lifetime earnings - what you'd earn without degree) > Total cost + interest + lost wages?

          **If no, reconsider.**

          ---

          **Step 3: Community College First**

          **The smart play:**

          - Complete general requirements at CC
          - Cost: $3,000-$8,000/year vs $20,000+
          - Same credits (if you plan transfer)
          - Smaller classes often
          - Live at home, save money
          - Then transfer for final 2 years

          **Savings: $30,000-$60,000**

          **Make sure credits transfer** before starting.

          ---

          **Step 4: State School Over Private**

          **Unless:**
          - Private gives full ride
          - Private has unique program
          - Network difference is massive for your field

          **The math:**

          State school: $80,000-$120,000 total
          Private school: $200,000-$300,000 total

          **Is the name worth $100,000-$200,000?**

          For most careers: No.

          ---

          **Step 5: Live Off Campus (Maybe)**

          **Dorm costs:**
          - $8,000-$15,000/year
          - Meal plan required: $4,000-$6,000/year
          - Total: $12,000-$21,000/year

          **Off campus:**
          - Apartment with roommates: $6,000-$10,000/year
          - Cook your own food: $3,000-$5,000/year
          - Total: $9,000-$15,000/year

          **Savings: $3,000-$6,000/year**

          (First year on campus might be required and useful for adjustment)

          ---

          **Step 6: Graduate On Time**

          **Every extra semester:**
          - Tuition: $10,000-$25,000
          - Living: $8,000-$15,000
          - Lost wages: $20,000+
          - **Total: $38,000-$60,000**

          **How to graduate on time:**
          - Map out every required course before starting
          - Take full course loads
          - Summer classes if behind
          - Don't change majors (explore first year, decide second)
          - AP/CLEP credits count

          ---

          **Step 7: Work Smart**

          **Internships > Random jobs:**

          - Builds resume
          - Tests career fit
          - Often leads to job offer
          - Network in your field

          **Part-time work:**
          - Related to field: Yes
          - Random retail: Minimize if possible
          - Work-study: Take it if offered

          ---

          **Step 8: Network Aggressively**

          **The real value of college:**

          - Professors who can recommend you
          - Alumni in your target field
          - Classmates who become colleagues
          - Career center resources

          **Don't waste this:**
          - Go to office hours
          - Join relevant clubs/organizations
          - Attend career events
          - LinkedIn connections before graduation

          ---

          **Step 9: Minimize Debt**

          **Debt limits:**

          Total debt should be less than expected first year salary.

          - Expect $50K salary? Borrow max $50K
          - Expect $35K salary? Borrow max $35K

          **If the math doesn't work, change the plan:**
          - Cheaper school
          - Different major
          - Alternative path

          ---

          **The Bottom Line:**

          College is a financial decision disguised as an educational one.

          **Treat it like a business decision:**
          - Know the costs
          - Research the outcomes
          - Calculate the ROI
          - Have a clear plan
          - Minimize risk

          **Don't let emotion or prestige bankrupt your future.**
          """,
        keyTakeaway:
          "Community college first saves $30-60K. State over private unless full ride. Graduate on time—each extra semester costs $40-60K. Total debt should be less than expected first year salary. Treat it like a business decision, not an emotional one."
      ),
      CollegeLesson(
        title: "Studying Abroad: The Escape Hatch",
        subtitle: "Free college exists—just not here",
        color: .teal,
        content: """
          **The Best Kept Secret**

          You can get a free or nearly free degree in another country—and it might be better than what you'd get in the US.

          ---

          **Countries With Free/Cheap University:**

          **Germany:**
          - **Cost:** FREE (even for international students)
          - **Language:** Many programs in English
          - **Quality:** World-class research universities
          - **Living costs:** $800-$1,200/month
          - **After graduation:** Can stay and work

          **How:** Apply directly, prove language ability, some programs have entrance exams.

          ---

          **Norway:**
          - **Cost:** FREE (even for international students)
          - **Language:** Many master's programs in English
          - **Quality:** Excellent, high quality of life
          - **Living costs:** High ($1,500-$2,000/month)
          - **But:** Free tuition offsets it

          ---

          **Finland:**
          - **Cost:** FREE for PhD; Master's free for some
          - **Language:** Programs in English available
          - **Quality:** Best education system in world
          - **Living costs:** Moderate ($800-$1,200/month)

          ---

          **France:**
          - **Cost:** ~$200-$400/year (public universities)
          - **Language:** Programs in English exist
          - **Quality:** Strong, especially in certain fields
          - **Living costs:** $1,000-$1,500/month (varies)

          ---

          **Czech Republic:**
          - **Cost:** FREE if taught in Czech; low fees for English
          - **Language:** English programs: $2,000-$4,000/year
          - **Quality:** Good, affordable
          - **Living costs:** Very low ($500-$800/month)

          ---

          **The Math:**

          **4 years in US:**
          - Tuition: $100,000-$200,000
          - Living: $60,000-$80,000
          - **Total: $160,000-$280,000**

          **4 years in Germany:**
          - Tuition: $0
          - Living: $50,000-$60,000
          - Flights/setup: $5,000
          - **Total: $55,000-$65,000**

          **Savings: $100,000-$200,000+**

          Plus international experience, language skills, perspective.

          ---

          **Common Concerns:**

          **"Will employers accept it?"**
          - German/UK/etc degrees are recognized worldwide
          - Often more prestigious than many US schools
          - International experience is a plus
          - Network might be different (but exists)

          **"I don't speak the language"**
          - Many programs in English
          - Can learn language while there
          - Immersion is fastest way to learn

          **"I'll miss home"**
          - Flights are cheaper than tuition
          - Technology keeps you connected
          - You'll visit
          - You'll also grow

          **"It's scary"**
          - Yes. Growth is scary.
          - 18-year-olds have been doing this forever
          - Study abroad offices help
          - American communities exist everywhere

          ---

          **How to Do It:**

          1. **Research programs** (DAAD for Germany, StudyInEurope, etc.)
          2. **Check requirements** (language, entrance exams, deadlines)
          3. **Apply early** (1+ year ahead)
          4. **Figure out visa** (student visas usually straightforward)
          5. **Plan finances** (need to show funds for living)
          6. **Connect with others** (Facebook groups, Reddit, forums)

          ---

          **Resources:**

          - **DAAD:** German Academic Exchange Service
          - **StudyInGermany.de:** Official guide
          - **MastersPortal.com:** Search programs
          - **TopUniversities.com:** Rankings and info
          - **Reddit:** r/Germany, r/StudyInEurope

          ---

          **The Bottom Line:**

          **You have options they don't tell you about.**

          Free, high-quality education exists. You might just have to cross an ocean for it.

          **Is that harder than $200K in debt?**
          """,
        keyTakeaway:
          "Germany offers FREE university—even for Americans. Many European programs are in English. 4 years in Germany costs $55-65K total vs $200K+ in US. International degrees are recognized and valued. It's an option they don't want you to know about."
      ),
      CollegeLesson(
        title: "The System Must Change",
        subtitle: "What we should demand",
        color: .purple,
        content: """
          **It Doesn't Have to Be This Way**

          American higher education is broken. But it's broken by choice. Choices can be changed.

          ---

          **What Other Countries Prove:**

          It's possible to have:
          - Free or low-cost public university
          - High quality education
          - Low student debt
          - Strong economy
          - Educated workforce

          **Germany, Norway, Finland prove it works.**

          ---

          **Policy Solutions:**

          **Free Public College:**

          - Cost estimate: $80 billion/year
          - That's 10% of military budget
          - Less than 2017 tax cuts cost
          - Would affect 20+ million students

          **How to pay:**
          - Small financial transaction tax
          - Close carried interest loophole
          - Wealth tax on billionaires
          - Redirect existing education spending

          ---

          **Student Debt Cancellation:**

          **The argument:**
          - Debt was predatory
          - System is rigged
          - Economic stimulus
          - Forgiven debt = consumer spending
          - Racial equity (Black students have more debt)

          **Counter-arguments and responses:**
          - "Not fair to those who paid": Vaccines aren't unfair to people who had measles
          - "Moral hazard": The hazard was created by the system
          - "Expensive": Cheaper than many things we fund

          ---

          **Reform Student Loans:**

          **Immediate changes:**
          - Cap interest rates
          - Allow bankruptcy discharge
          - Income-based repayment default
          - No capitalization of interest
          - Eliminate private loan industry

          **These would help current borrowers survive.**

          ---

          **Regulate Tuition:**

          **Possible approaches:**
          - Tie federal funding to tuition limits
          - Require transparency on outcomes
          - Cap administrative spending
          - Require skin in the game (schools liable for defaults)

          **Schools only respond to incentives.**

          ---

          **Alternative Pathways:**

          **Fund alternatives:**
          - Apprenticeships
          - Trade schools
          - Coding bootcamps
          - Community colleges
          - Certification programs

          **Not everyone needs a 4-year degree.**

          ---

          **Who Opposes Change:**

          **Universities:**
          - Like high tuition (more money)
          - Like current system (works for them)
          - Powerful lobbying

          **Banks/Loan servicers:**
          - Profit from current system
          - Oppose bankruptcy rights
          - Fund politicians

          **Some politicians:**
          - Receive donations from above
          - Ideologically opposed to "free stuff"
          - Benefited from old system, don't understand new reality

          **Some taxpayers:**
          - "I paid mine, you pay yours"
          - Don't understand how much worse it is now
          - Misled by propaganda

          ---

          **What You Can Do:**

          **Individual:**
          - Make smart choices for yourself
          - Help others navigate the system
          - Talk about reality, not propaganda

          **Political:**
          - Support candidates who back reform
          - Push for state-level free college
          - Contact representatives
          - Organize and demonstrate

          **Cultural:**
          - Challenge "college is the only way"
          - Celebrate alternative paths
          - Reduce stigma of trades
          - Call out the scam publicly

          ---

          **The Vision:**

          Imagine America where:
          - Anyone can get higher education without debt
          - Multiple pathways to good careers
          - Education is a right, not a product
          - Young people start careers with savings, not debt
          - Innovation flourishes because risk-taking is possible

          **Other countries have this. We can too.**

          It's a choice.
          """,
        keyTakeaway:
          "Free public college would cost $80B/year—10% of military budget. Germany, Norway, Finland prove it works. Debt cancellation, interest caps, and bankruptcy rights are all possible. Who opposes: universities, banks, some politicians, and people who don't understand how bad it's gotten."
      ),
    ]
  }
}

// MARK: - Models

struct CollegeLesson: Identifiable {
  let id = UUID()
  let title: String
  let subtitle: String
  let color: Color
  let content: String
  let keyTakeaway: String
}

struct CollegeLessonView: View {
  let lesson: CollegeLesson
  let index: Int

  var body: some View {
    ScrollView {
      VStack(alignment: .leading, spacing: 24) {
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
          }

          Text(lesson.title)
            .font(.system(size: 26, weight: .bold))
            .foregroundColor(.white)

          Text(lesson.subtitle)
            .font(.system(size: 14))
            .foregroundColor(.gray)
        }

        Divider().background(Color.white.opacity(0.2))

        Text(lesson.content)
          .font(.system(size: 15))
          .foregroundColor(.white.opacity(0.9))
          .lineSpacing(6)

        VStack(alignment: .leading, spacing: 12) {
          HStack {
            Image(systemName: "lightbulb.fill")
              .foregroundColor(lesson.color)
            Text("Key Takeaway")
              .font(.system(size: 14, weight: .bold))
              .foregroundColor(lesson.color)
          }

          Text(lesson.keyTakeaway)
            .font(.system(size: 16, weight: .medium))
            .foregroundColor(.white)
        }
        .padding()
        .background(lesson.color.opacity(0.1))
        .cornerRadius(16)
      }
      .padding()
    }
    .background(Color.black.ignoresSafeArea())
    .navigationBarTitleDisplayMode(.inline)
  }
}

#Preview {
  NavigationStack {
    CollegeIndustrialComplexCourse()
  }
}
