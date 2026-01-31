// EducationExposedCourse.swift
// Two education systems: one for the rich, one for everyone else
// The student loan debt trap by design

import SwiftUI

struct EducationExposedCourse: View {
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                // Course Header
                courseHeader
                
                // Key stat comparison
                comparisonCard
                
                // Lessons
                ForEach(Array(lessons.enumerated()), id: \.offset) { index, lesson in
                    NavigationLink(destination: EducationLessonView(lesson: lesson, index: index + 1)) {
                        lessonRow(lesson, index: index)
                    }
                }
                
                // What they don't teach
                hiddenCurriculumCard
            }
        }
        .background(Color.black.ignoresSafeArea())
        .navigationTitle("Education Exposed")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    // MARK: - Header
    
    private var courseHeader: some View {
        VStack(spacing: 16) {
            ZStack {
                Circle()
                    .fill(Color.orange.opacity(0.2))
                    .frame(width: 100, height: 100)
                
                Image(systemName: "graduationcap.fill")
                    .font(.system(size: 44))
                    .foregroundColor(.orange)
                
                // Chain icon
                Image(systemName: "link")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(.red)
                    .offset(x: 30, y: 25)
            }
            
            Text("The Education System")
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(.white)
            
            Text("EXPOSED")
                .font(.system(size: 14, weight: .black, design: .rounded))
                .foregroundColor(.orange)
                .tracking(4)
            
            Text("Two systems: One for the rich.\nOne designed to create debt slaves.")
                .font(.system(size: 14))
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
            
            HStack {
                Text("9 Lessons")
                    .font(.system(size: 12, weight: .medium))
                    .foregroundColor(.gray)
                Spacer()
                Text("~55 min")
                    .font(.system(size: 12, weight: .medium))
                    .foregroundColor(.gray)
            }
            .padding(.horizontal)
        }
        .padding()
    }
    
    // MARK: - Comparison Card
    
    private var comparisonCard: some View {
        VStack(spacing: 16) {
            Text("THE TWO AMERICAS")
                .font(.system(size: 12, weight: .black))
                .foregroundColor(.red)
                .tracking(2)
            
            HStack(spacing: 20) {
                // Rich side
                VStack(spacing: 12) {
                    Image(systemName: "building.columns.fill")
                        .font(.system(size: 28))
                        .foregroundColor(.yellow)
                    
                    Text("The Elite")
                        .font(.system(size: 14, weight: .bold))
                        .foregroundColor(.yellow)
                    
                    VStack(alignment: .leading, spacing: 6) {
                        eliteItem("$60k/year private school")
                        eliteItem("Legacy admissions")
                        eliteItem("No student debt")
                        eliteItem("Connections > Grades")
                        eliteItem("Fail up")
                    }
                }
                .frame(maxWidth: .infinity)
                
                Rectangle()
                    .fill(Color.white.opacity(0.2))
                    .frame(width: 1)
                
                // Everyone else
                VStack(spacing: 12) {
                    Image(systemName: "graduationcap.fill")
                        .font(.system(size: 28))
                        .foregroundColor(.gray)
                    
                    Text("Everyone Else")
                        .font(.system(size: 14, weight: .bold))
                        .foregroundColor(.gray)
                    
                    VStack(alignment: .leading, spacing: 6) {
                        massItem("Underfunded schools")
                        massItem("Merit myth")
                        massItem("$37k+ debt average")
                        massItem("Grades = survival")
                        massItem("One mistake = done")
                    }
                }
                .frame(maxWidth: .infinity)
            }
        }
        .padding()
        .background(Color.white.opacity(0.05))
        .cornerRadius(16)
        .padding()
    }
    
    private func eliteItem(_ text: String) -> some View {
        HStack(spacing: 6) {
            Image(systemName: "checkmark")
                .font(.system(size: 10, weight: .bold))
                .foregroundColor(.yellow)
            Text(text)
                .font(.system(size: 11))
                .foregroundColor(.white.opacity(0.8))
        }
    }
    
    private func massItem(_ text: String) -> some View {
        HStack(spacing: 6) {
            Image(systemName: "xmark")
                .font(.system(size: 10, weight: .bold))
                .foregroundColor(.red)
            Text(text)
                .font(.system(size: 11))
                .foregroundColor(.white.opacity(0.6))
        }
    }
    
    // MARK: - Lesson Row
    
    private func lessonRow(_ lesson: EducationLesson, index: Int) -> some View {
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
    
    // MARK: - Hidden Curriculum Card
    
    private var hiddenCurriculumCard: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Image(systemName: "eye.slash.fill")
                    .foregroundColor(.purple)
                Text("What They DON'T Teach")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.white)
            }
            
            VStack(alignment: .leading, spacing: 10) {
                hiddenItem("How to do taxes")
                hiddenItem("How credit scores work")
                hiddenItem("How compound interest can trap you")
                hiddenItem("Your constitutional rights")
                hiddenItem("How to negotiate salary")
                hiddenItem("How the political system actually works")
                hiddenItem("Financial literacy")
                hiddenItem("Critical thinking about authority")
                hiddenItem("How to build wealth")
                hiddenItem("Why any of this is hidden")
            }
            
            Text("This isn't an accident. The hidden curriculum is compliance.")
                .font(.system(size: 12, weight: .medium))
                .foregroundColor(.orange)
                .padding(.top, 8)
        }
        .padding()
        .background(Color.purple.opacity(0.1))
        .cornerRadius(16)
        .padding()
    }
    
    private func hiddenItem(_ text: String) -> some View {
        HStack(spacing: 10) {
            Image(systemName: "questionmark.circle")
                .foregroundColor(.purple)
                .font(.system(size: 12))
            Text(text)
                .font(.system(size: 13))
                .foregroundColor(.white.opacity(0.8))
        }
    }
    
    // MARK: - Lessons Data
    
    private var lessons: [EducationLesson] {
        [
            EducationLesson(
                title: "Two Education Systems",
                subtitle: "The pipeline for the rich vs everyone else",
                icon: "arrow.left.arrow.right",
                color: .blue,
                content: """
                **America Has Two Education Systems**
                
                One for the wealthy. One for everyone else. They exist in parallel, rarely intersecting.
                
                ---
                
                **THE ELITE PIPELINE:**
                
                **Pre-K - Elementary:**
                - Private schools: $30,000-$60,000/year
                - 10:1 student-teacher ratios
                - Art, music, languages, coding
                - Outdoor education, travel
                - Connected parent networks
                
                **Examples:** Dalton (NYC), Sidwell Friends (DC), Harvard-Westlake (LA)
                
                **High School:**
                - Boarding schools: $60,000-$80,000/year
                - College counselors per student
                - Legacy relationships with elite colleges
                - Internships through family connections
                - "Character building" not job training
                
                **Examples:** Exeter, Andover, Choate
                
                **College:**
                - Legacy admissions (43% of Harvard's white students are legacy, athlete, or donor-connected)
                - Full price tuition: $80,000/year (no loans needed)
                - Summers for internships, not jobs
                - Study abroad, research, networking
                - Degree from elite institution opens all doors
                
                ---
                
                **THE MASS PIPELINE:**
                
                **Pre-K:**
                - Often none (working parents can't afford childcare)
                - Head Start if lucky (underfunded)
                - Already behind before starting
                
                **Elementary - High School:**
                - Funded by local property taxes (poor areas = poor schools)
                - 30+ students per class
                - Outdated textbooks, limited technology
                - Focus on test prep, not learning
                - Arts and music cut first
                - School-to-prison pipeline in many areas
                
                **College:**
                - Sold as "the only way" to succeed
                - Take on massive debt ($30,000-$200,000+)
                - Work part-time, grades suffer
                - No internship connections
                - Graduate with debt and a degree worth less every year
                
                ---
                
                **THE SPENDING GAP:**
                
                Per-pupil spending varies wildly:
                
                - Wealthy districts: $30,000+/student
                - Poor districts: $8,000/student
                
                Within the same state. Same country. Different worlds.
                
                ---
                
                **WHO GOES WHERE:**
                
                **Elite private schools:**
                - 1% of students
                - 10% of Ivy League admissions
                
                **Feeder schools to Harvard:**
                - 12 schools send more students than 2,000+ public schools combined
                
                ---
                
                **WHY THIS MATTERS:**
                
                Education is sold as "the great equalizer."
                
                But when one group starts at $60k/year schools with connections, and another starts in underfunded public schools with debt ahead...
                
                It's not a race. It's a predetermined outcome with the illusion of competition.
                """,
                keyTakeaway: "America has two education systems: elite private schools that create connections and opportunities, and underfunded public schools that prepare students for debt and compliance."
            ),
            EducationLesson(
                title: "The Property Tax Scam",
                subtitle: "How school funding guarantees inequality",
                icon: "house.fill",
                color: .green,
                content: """
                **School Funding by ZIP Code**
                
                In America, school quality depends largely on where you live. This is by design.
                
                ---
                
                **How Schools Are Funded:**
                
                Most K-12 school funding comes from:
                - Local property taxes: ~45%
                - State funding: ~45%
                - Federal funding: ~10%
                
                The local property tax portion is the key.
                
                ---
                
                **The Math of Inequality:**
                
                **Wealthy Suburb:**
                - Average home value: $800,000
                - Property tax rate: 2%
                - Tax revenue: $16,000/home
                - Few students per household
                - Result: $25,000+ per student
                
                **Poor Urban Area:**
                - Average home value: $150,000
                - Property tax rate: 3% (often higher!)
                - Tax revenue: $4,500/home
                - More students per household
                - Result: $8,000 per student
                
                ---
                
                **What This Buys:**
                
                **High-Spending Districts:**
                - Newer facilities
                - Updated technology
                - More teachers (smaller classes)
                - Counselors, nurses, librarians
                - Advanced courses (AP, IB)
                - Arts, music, sports programs
                - College prep resources
                
                **Low-Spending Districts:**
                - Crumbling buildings
                - Outdated books
                - Overcrowded classes
                - No counselors
                - Fewer advanced courses
                - Programs cut constantly
                - Focus on test prep to keep funding
                
                ---
                
                **Why Not Fix It?**
                
                Courts have ruled this unconstitutional in some states.
                
                But wealthy areas fight equalization because:
                - They don't want their taxes going elsewhere
                - They want exclusivity
                - They have political power
                - "Local control" is the argument
                
                ---
                
                **The Segregation Connection:**
                
                School funding by property tax was designed during segregation.
                
                When schools were legally segregated, white schools got more money.
                
                After Brown v. Board, explicit segregation ended. But property-tax funding achieved the same result through:
                - Redlining (keeping Black families out of wealthy areas)
                - White flight to suburbs
                - Exclusionary zoning
                
                Today's school inequality maps directly onto historic segregation patterns.
                
                ---
                
                **The Cycle:**
                
                1. Wealthy area has high property values
                2. High values = high school funding
                3. Good schools attract families who can afford homes
                4. Property values increase
                5. Repeat
                
                Meanwhile:
                
                1. Poor area has low property values
                2. Low funding = struggling schools
                3. Families who can afford to leave, do
                4. Property values stay low or decline
                5. Repeat
                
                This is not a bug. It's the system working as designed.
                
                ---
                
                **Other Countries:**
                
                Many countries fund schools NATIONALLY to ensure equality:
                - Finland: National funding, world-class results
                - Canada: Provincial funding, more equitable
                - Japan: National standards, equal resources
                
                America's "local control" argument is a choice to maintain inequality.
                """,
                keyTakeaway: "School funding through property taxes guarantees that poor areas have poor schools. This isn't an accident—it's the system that replaced explicit segregation."
            ),
            EducationLesson(
                title: "The Student Loan Trap",
                subtitle: "Debt that can't be escaped",
                icon: "dollarsign.circle.fill",
                color: .red,
                content: """
                **$1.77 Trillion in Student Debt**
                
                Student loans are uniquely cruel in American law. Here's why.
                
                ---
                
                **What Makes Student Loans Special:**
                
                Unlike almost any other debt:
                
                ❌ **Cannot be discharged in bankruptcy**
                - You can bankrupt out of credit cards, medical bills, even gambling debt
                - But not student loans (since 2005)
                
                ❌ **Government can garnish without judgment**
                - Wages, tax refunds, even Social Security
                - No court order needed
                
                ❌ **Interest capitalizes**
                - If you can't pay, interest adds to principal
                - You pay interest on interest
                
                ❌ **No statute of limitations**
                - Debt never expires
                - They can collect forever
                
                ---
                
                **How We Got Here:**
                
                **1965:** Federal student loans created (good intentions)
                
                **1976:** Bankruptcy protection limited
                
                **1998:** Bankruptcy protection eliminated for federal loans
                
                **2005:** Bankruptcy protection eliminated for private loans too
                
                **Who lobbied for these changes?** Sallie Mae, banks, for-profit colleges.
                
                ---
                
                **The Numbers:**
                
                - **45 million** borrowers
                - **$1.77 trillion** total debt
                - **Average debt:** $37,338
                - **Median payment:** $222/month
                - **Default rate:** ~11%
                - **Average time to repay:** 20 years
                
                ---
                
                **The Compound Trap:**
                
                Borrow $30,000 at 6% interest:
                
                - Minimum payment: ~$333/month
                - Pay for 10 years
                - **Total paid: $40,000**
                
                But if you defer or go on income-based repayment:
                
                - Interest keeps accruing
                - Capitalizes (adds to principal)
                - $30,000 can become $50,000+
                - Pay for 20+ years
                - **Total paid: $70,000+**
                
                ---
                
                **Who Profits:**
                
                **Loan Servicers:**
                - Navient (former Sallie Mae): Made billions
                - Sued for steering borrowers to wrong repayment plans
                - Incentive: Keep you paying longer
                
                **For-Profit Colleges:**
                - 90% of revenue from federal loans
                - Aggressive recruitment, poor outcomes
                - Students with worthless degrees, massive debt
                - ITT Tech, Corinthian, University of Phoenix
                
                **Regular Colleges:**
                - Tuition rises because loans available
                - Administrative bloat
                - Luxury amenities over education
                - No incentive to control costs
                
                ---
                
                **The Psychological Trap:**
                
                You're told:
                - "Good debt" (it's not)
                - "Investment in yourself" (the return has collapsed)
                - "You have to go to college" (you don't)
                - "Monthly payments are manageable" (they trap you)
                
                You're not told:
                - Alternatives exist
                - The job market has changed
                - The debt is inescapable
                - The degree may not help
                
                ---
                
                **The Life Impact:**
                
                Student debt prevents:
                - Buying a home (can't save down payment)
                - Starting a business (can't take risk)
                - Getting married (debt as shared burden)
                - Having children (can't afford them)
                - Saving for retirement (no extra money)
                - Taking fulfilling but lower-paying work
                
                ---
                
                **Other Countries:**
                
                - **Germany:** Free university
                - **Norway:** Free university
                - **France:** ~$200/year
                - **UK:** Capped tuition, income-based repayment, forgiven after 30 years
                
                America chose this. It wasn't inevitable.
                """,
                keyTakeaway: "Student loans can't be discharged in bankruptcy, unlike almost any other debt. This was lobbied for by the loan industry. $1.77 trillion in debt traps 45 million Americans."
            ),
            EducationLesson(
                title: "College: The Credential Scam",
                subtitle: "Why degrees are required for jobs that don't need them",
                icon: "doc.text.fill",
                color: .purple,
                content: """
                **Credential Inflation**
                
                Jobs that once required a high school diploma now "require" a bachelor's degree. Why?
                
                ---
                
                **The Inflation:**
                
                **1970:**
                - Bank teller: High school
                - Administrative assistant: High school
                - Sales rep: High school
                - Police officer: High school
                
                **2024:**
                - Bank teller: "Bachelor's preferred"
                - Administrative assistant: "Bachelor's required"
                - Sales rep: "Bachelor's required"
                - Police officer: Often bachelor's required
                
                Did these jobs get harder? No.
                
                ---
                
                **Why This Happened:**
                
                **1. Oversupply of graduates**
                - More people have degrees
                - Employers can demand more
                - Creates arms race
                
                **2. Legal cover**
                - Can't ask about criminal history (in some places)
                - Can't discriminate on protected classes
                - "Bachelor's required" filters legally
                
                **3. Outsourcing of training**
                - Companies used to train workers
                - Now expect workers to arrive trained
                - Shift cost to workers (via debt)
                
                **4. HR laziness**
                - Easy filter for applications
                - No thought about actual requirements
                - "Everyone does it"
                
                ---
                
                **The Skills Disconnect:**
                
                Studies show:
                
                - 65% of jobs require on-the-job training regardless of degree
                - Most job skills are learned on the job
                - Degree content often irrelevant to job duties
                - Employers say graduates lack practical skills
                
                So why require degrees?
                
                **Signaling theory:** Degree shows you can:
                - Follow instructions
                - Complete long-term projects
                - Tolerate boredom
                - Comply with authority
                
                It's a compliance test, not skills training.
                
                ---
                
                **Who Benefits:**
                
                **Universities:**
                - More students = more tuition = more money
                - Credential inflation creates demand
                
                **Loan industry:**
                - More students = more loans = more profit
                
                **Existing degree holders:**
                - Credential requirement protects their position
                - Raises barrier for competition
                
                **Employers:**
                - Free screening mechanism
                - Workers arrive with debt = desperate for job
                - Training costs shifted to workers
                
                ---
                
                **Who Loses:**
                
                **Students without wealthy parents:**
                - Must take on debt for job that didn't need degree
                - Four years of opportunity cost
                - May not finish (debt without degree = worst outcome)
                
                **Society:**
                - Talent wasted in credential pursuit
                - Innovation suppressed by debt-averse workforce
                - Class mobility decreases
                
                ---
                
                **The Data:**
                
                - 41% of recent graduates are underemployed (working jobs that don't need degree)
                - Average starting salary hasn't kept pace with tuition
                - ROI of degree varies wildly by major and school
                
                **Yet:**
                - "Everyone needs a degree" persists
                - Alternatives are stigmatized
                - The trap continues
                
                ---
                
                **What's Actually Valuable:**
                
                - Specific technical skills (coding, trades, healthcare)
                - Problem-solving ability (not taught in lectures)
                - Communication skills (learned by doing)
                - Connections (only wealthy get these from college)
                
                For most people, most of what makes them employable isn't from their degree.
                """,
                keyTakeaway: "Jobs that never needed degrees now 'require' them—not because they're harder, but because employers can demand it and shift training costs to workers via debt."
            ),
            EducationLesson(
                title: "Legacy Admissions",
                subtitle: "Affirmative action for the wealthy",
                icon: "person.2.fill",
                color: .yellow,
                content: """
                **The Legacy System**
                
                While "meritocracy" is preached, elite colleges reserve spots for the children of alumni and donors.
                
                ---
                
                **What Is Legacy Admission?**
                
                Preference given to applicants whose parents attended the university.
                
                **At Harvard:**
                - Legacy applicants admitted at ~33%
                - General applicants admitted at ~5%
                - 6x advantage
                
                **The Numbers:**
                
                - 43% of Harvard's white students are recruited athletes, legacies, children of faculty, or on dean's interest list (donors)
                - Without these preferences, white enrollment would drop significantly
                
                ---
                
                **The Donor List:**
                
                Beyond legacy, there's the "Dean's Interest List" or "Development Cases":
                
                - Children of major donors
                - Separately tracked
                - Special consideration
                - How much does a spot cost? $2-10 million+ at elite schools
                
                **Kushner admission to Harvard:**
                - Charles Kushner pledged $2.5 million
                - Jared Kushner admitted despite mediocre grades
                - School administrators called it "ichallowed"
                
                This is legal. And common.
                
                ---
                
                **The Justification:**
                
                Universities claim legacy:
                - "Builds community across generations"
                - "Encourages alumni donations"
                - "Maintains traditions"
                
                What they don't say:
                - It perpetuates class
                - It's affirmative action for the privileged
                - It undermines meritocracy claims
                
                ---
                
                **The Racial Impact:**
                
                Legacy admissions disproportionately benefit white students because:
                - Past discrimination meant fewer minorities attended
                - Wealth gaps mean fewer minority donors
                - The system perpetuates historical exclusion
                
                The same institutions that claim commitment to diversity maintain policies that perpetuate homogeneity.
                
                ---
                
                **After the Affirmative Action Ruling:**
                
                Supreme Court banned race-conscious admissions (2023).
                
                But legacy admissions? Still legal.
                
                So:
                - ❌ Can't consider race (helps disadvantaged minorities)
                - ✓ Can consider legacy (helps privileged whites)
                
                The hypocrisy is quiet part said loud.
                
                ---
                
                **Who Gets In:**
                
                A study of 12 elite colleges found students from:
                - Top 1% of income: 15x more likely to attend than bottom 20%
                - Top 0.1%: 20x more likely
                
                At Princeton:
                - More students from top 1% than bottom 60% combined
                
                ---
                
                **The Pipeline:**
                
                Elite prep school → Legacy admission → Elite college → Elite job → Wealth → Children go to elite prep school
                
                Repeat for generations.
                
                This is not mobility. This is aristocracy with a meritocratic veneer.
                
                ---
                
                **Other Countries:**
                
                Most countries don't have legacy admissions:
                - UK: Recently under scrutiny, some schools ending it
                - Most of Europe: Admissions based on exams/grades only
                - Japan: Entrance exams only
                
                America chose this system. It reflects values.
                """,
                keyTakeaway: "Legacy admissions give a 6x advantage to children of alumni at elite schools. It's affirmative action for the wealthy, perpetuating class across generations."
            ),
            EducationLesson(
                title: "What Schools Actually Teach",
                subtitle: "The hidden curriculum of compliance",
                icon: "book.closed.fill",
                color: .orange,
                content: """
                **The Hidden Curriculum**
                
                Schools teach more than math and reading. The "hidden curriculum" teaches:
                
                - How to follow orders
                - How to sit still for hours
                - How to suppress curiosity
                - How to compete against peers
                - How to accept authority without question
                - How to measure self-worth by grades
                
                ---
                
                **The Factory Model:**
                
                Modern schooling was designed during industrialization to create factory workers.
                
                **Factory needs:**
                - Workers who show up on time
                - Workers who follow instructions
                - Workers who don't question
                - Workers who tolerate boredom
                - Workers who work in shifts
                
                **School provides:**
                - Bells (like factory whistles)
                - Sitting in rows
                - Following orders
                - Raising hand to speak
                - Asking permission for bathroom
                - Graded on compliance as much as knowledge
                
                ---
                
                **What's NOT Taught:**
                
                **Financial Literacy:**
                - How credit cards work
                - Compound interest (how debt traps you)
                - How to do taxes
                - How to invest
                - How to negotiate salary
                
                **Civic Knowledge:**
                - Your constitutional rights
                - How to interact with police
                - How political donations work
                - How bills actually become laws
                - How to identify propaganda
                
                **Practical Skills:**
                - How to cook
                - Basic home repair
                - How to change a tire
                - How to read a contract
                - How to start a business
                
                **Critical Thinking About:**
                - Authority
                - Media
                - Advertising
                - The education system itself
                
                ---
                
                **Why These Are Missing:**
                
                It's not accidental. Consider who benefits from citizens who:
                - Don't understand debt (banks, loan companies)
                - Don't know their rights (police, government)
                - Can't think critically about ads (corporations)
                - Don't understand politics (those in power)
                - Accept authority (all of the above)
                
                ---
                
                **Standardized Testing:**
                
                Tests don't measure intelligence. They measure:
                - Access to test prep
                - Freedom from stress (hard when poor)
                - Exposure to "standard" culture
                - Ability to perform under arbitrary conditions
                
                **Who designs the tests?** For-profit companies.
                **Who profits from test prep?** For-profit companies.
                **Who gets harmed by low scores?** Poor students and schools.
                
                ---
                
                **The Sorting Function:**
                
                School's primary function is sorting people:
                
                - Into "smart" and "not smart"
                - Into college-bound and not
                - Into white collar and blue collar
                - Into compliant and troublemaker
                
                This sorting happens early and follows you.
                
                ---
                
                **Different Schools, Different Training:**
                
                Research shows schools train different classes differently:
                
                **Working-class schools:** Teach following rules, rote procedures
                **Middle-class schools:** Teach getting right answers, some creativity
                **Affluent schools:** Teach independent thinking, leadership
                **Elite schools:** Teach ruling, questioning, creating systems
                
                Same country. Different preparation for different positions.
                
                ---
                
                **Breaking the Conditioning:**
                
                Once you see the hidden curriculum:
                - Question what you were taught to accept
                - Learn what was deliberately not taught
                - Recognize compliance training vs. education
                - Seek real education outside the system
                
                That's what this app is for.
                """,
                keyTakeaway: "Schools teach compliance as much as content. Financial literacy, rights, and critical thinking are deliberately NOT taught. The hidden curriculum creates workers, not citizens."
            ),
            EducationLesson(
                title: "For-Profit College Scams",
                subtitle: "Predatory institutions that target the vulnerable",
                icon: "exclamationmark.triangle.fill",
                color: .red,
                content: """
                **For-Profit Colleges: The Scam**
                
                For-profit colleges exist to extract federal loan money, not to educate.
                
                ---
                
                **The Business Model:**
                
                1. Target vulnerable populations (veterans, single mothers, minorities)
                2. Promise career advancement
                3. Enroll them in federal loans
                4. Provide substandard education
                5. Collect 90% of revenue from federal aid
                6. Students left with debt and worthless credentials
                
                ---
                
                **The Numbers:**
                
                For-profit colleges:
                - Enroll: 10% of students
                - Receive: 25% of federal aid
                - Account for: 50% of loan defaults
                
                **Average cost:** $15,000/year (vs. $3,000 at community college for same programs)
                
                **Graduation rate:** Often under 25%
                
                ---
                
                **Predatory Recruiting:**
                
                For-profit schools spend more on recruiting than teaching.
                
                **Tactics:**
                - Target military bases (GI Bill money)
                - Target unemployment offices
                - Emotional manipulation ("Don't you want better for your kids?")
                - False job placement statistics
                - Pressure to enroll immediately
                - Lies about accreditation and transferability
                
                **Former recruiter testimony:**
                
                > "We were trained to find their pain points. Single mother? 'Don't you want to provide better?' Unemployed? 'This is your only hope.' We got bonuses for enrollments."
                
                ---
                
                **The Results:**
                
                **ITT Technical Institute:**
                - Enrolled 40,000+ students
                - Closed in 2016 under federal investigation
                - Students left with debt, no degree
                - Credits don't transfer
                
                **Corinthian Colleges:**
                - Enrolled 70,000+ students
                - Collapsed in 2015
                - Fraud in job placement rates
                - Students still fighting for debt relief
                
                **University of Phoenix:**
                - Peak enrollment: 470,000
                - Repeatedly fined for deceptive practices
                - Graduates earn less than high school grads in some studies
                
                ---
                
                **Worthless Credits:**
                
                For-profit college credits often:
                - Don't transfer to real colleges
                - Aren't recognized by employers
                - Come from fake or weak accreditation
                - Leave students having to start over
                
                ---
                
                **Political Protection:**
                
                For-profit colleges survive because:
                - Massive lobbying ($20+ million/year)
                - Donations to both parties
                - Revolving door (executives become regulators)
                - Powerful alumni in government
                
                **Betsy DeVos** (Trump's Education Secretary):
                - Invested in for-profit education
                - Rolled back Obama-era regulations
                - Made it harder to get debt relief
                
                ---
                
                **Who Gets Hurt:**
                
                - Single parents trying to advance
                - Veterans using GI Bill
                - First-generation college students
                - Those already struggling financially
                - People of color (disproportionately targeted)
                
                The people most trying to achieve the "American Dream" are the most exploited.
                
                ---
                
                **Red Flags:**
                
                Avoid schools that:
                - Pressure you to enroll immediately
                - Promise unrealistic job placement
                - Won't let you talk to current students
                - Have mostly online instruction at high prices
                - Are "nationally accredited" (not regionally)
                - Spend more on advertising than academics
                
                **Better options:**
                - Community college (cheap, credits transfer)
                - State university (regulated, recognized)
                - Apprenticeships (earn while learning)
                - Trade schools (non-profit ones)
                """,
                keyTakeaway: "For-profit colleges take 25% of federal aid but cause 50% of defaults. They target veterans and the poor with predatory recruiting, extract loan money, and leave students with debt and worthless credentials."
            ),
            EducationLesson(
                title: "The Alternatives",
                subtitle: "Paths they don't tell you about",
                icon: "arrow.triangle.branch",
                color: .green,
                content: """
                **You Don't Have to Play Their Game**
                
                The system wants you to think college is the only path. It's not.
                
                ---
                
                **TRADE SCHOOLS & APPRENTICESHIPS**
                
                **Electricians:**
                - Median salary: $60,000
                - Apprenticeship: Paid while learning
                - No college debt
                - Always in demand
                
                **Plumbers:**
                - Median salary: $59,000
                - 4-5 year apprenticeship
                - Paid from day one
                - Can start own business
                
                **HVAC Technicians:**
                - Median salary: $50,000
                - 6-month to 2-year training
                - Certification, not degree
                - Growing demand (climate change)
                
                **Welders:**
                - Median salary: $47,000 (up to $100k+ specialized)
                - Certificate programs
                - Union apprenticeships available
                - Underwater welders: $100k+
                
                ---
                
                **TECH WITHOUT DEGREE**
                
                Many tech companies have dropped degree requirements:
                - Google
                - Apple
                - IBM
                - Tesla
                
                **Paths into tech:**
                - Coding bootcamps (3-6 months, much cheaper)
                - Self-teaching + portfolio
                - Certifications (AWS, Google, etc.)
                - Apprenticeship programs
                
                **Starting salaries:** $50k-$100k+ depending on role
                
                ---
                
                **COMMUNITY COLLEGE**
                
                If you do want college:
                - 2 years at community college: ~$3,500/year
                - 2 years at state school: ~$10,000/year
                - **Total: $27,000** vs. $100,000+ for 4-year private
                
                Same degree. Fraction of the debt.
                
                ---
                
                **MILITARY (WITH CAUTION)**
                
                The military offers:
                - GI Bill for education
                - Job training
                - Healthcare
                
                **But understand:**
                - You may be deployed to war
                - Long-term health impacts
                - Not everyone qualifies
                - The "deal" has gotten worse over time
                
                ---
                
                **STARTING A BUSINESS**
                
                Many successful businesses started without degrees:
                - Bill Gates (dropped out)
                - Mark Zuckerberg (dropped out)
                - Richard Branson (no degree)
                
                **Modern options:**
                - E-commerce (low startup cost)
                - Freelancing (sell skills directly)
                - Content creation
                - Service businesses
                
                **Risk:** High failure rate
                **Benefit:** No debt, unlimited upside, your own boss
                
                ---
                
                **REAL SELF-EDUCATION**
                
                More knowledge is free online than ever:
                - MIT OpenCourseWare
                - Khan Academy
                - YouTube tutorials
                - Free coding resources (freeCodeCamp)
                - Library access to everything
                
                The internet democratized knowledge.
                The credential system exists to gatekeep.
                
                ---
                
                **THE QUESTIONS TO ASK:**
                
                Before taking on debt, ask:
                
                1. What job do I actually want?
                2. Does that job require a degree, or just say it does?
                3. What's the actual ROI of this specific program?
                4. What are the alternatives?
                5. Can I test this career before committing?
                
                ---
                
                **THE MINDSET SHIFT:**
                
                **Old thinking:**
                - Degree → Job → Success
                
                **New reality:**
                - Skills → Value → Income
                
                The question isn't "what degree should I get?"
                
                It's "what value can I create, and what's the cheapest way to learn to create it?"
                """,
                keyTakeaway: "Trades, tech bootcamps, community college, and self-education are all viable paths. The question isn't 'what degree?' but 'what skills create value, and what's the cheapest way to learn them?'"
            ),
            EducationLesson(
                title: "Reclaiming Your Education",
                subtitle: "Learning what they didn't teach you",
                icon: "brain.head.profile",
                color: .cyan,
                content: """
                **Education vs. Schooling**
                
                Schooling is what was done to you.
                Education is what you do for yourself.
                
                ---
                
                **WHAT TO LEARN NOW:**
                
                **Financial Literacy:**
                - How compound interest works (for and against you)
                - How credit scores are calculated
                - How to do your own taxes
                - How investing works
                - How debt traps you
                
                **This app covers this. Use it.**
                
                **Your Rights:**
                - Constitutional rights
                - Interactions with police
                - Employment rights
                - Tenant rights
                
                **This app covers this too.**
                
                **Critical Thinking:**
                - How to identify propaganda
                - How to evaluate sources
                - How to recognize manipulation
                - How advertising works on you
                - How to think about statistics
                
                **How Systems Work:**
                - How money actually works
                - How politics actually works
                - How media actually works
                - How power actually works
                
                ---
                
                **HOW TO LEARN:**
                
                **Read widely:**
                - Books that challenge you
                - Primary sources, not just summaries
                - Perspectives you disagree with
                - History from multiple viewpoints
                
                **Think critically:**
                - Who wrote this and why?
                - What are they not saying?
                - Who benefits from me believing this?
                - What would change my mind?
                
                **Learn by doing:**
                - Skills are learned through practice
                - Fail early and often
                - Teach others (best way to learn)
                - Apply knowledge immediately
                
                ---
                
                **UNLEARNING:**
                
                Some things to unlearn:
                
                ❌ "Grades measure intelligence"
                ✓ Grades measure compliance and test-taking
                
                ❌ "College is the only path"
                ✓ College is one path, often not the best
                
                ❌ "Experts are always right"
                ✓ Experts have biases and funders
                
                ❌ "If it's in the textbook, it's true"
                ✓ Textbooks are political documents
                
                ❌ "Question authority is disrespectful"
                ✓ Questioning authority is citizenship
                
                ---
                
                **BUILD YOUR OWN CURRICULUM:**
                
                What do YOU need to know?
                
                1. **For your career:** What skills actually matter?
                2. **For your finances:** How do you stop being exploited?
                3. **For your rights:** How do you protect yourself?
                4. **For your community:** How do you help others?
                5. **For your mind:** What makes you think better?
                
                Create your own reading list. Set your own curriculum. Test yourself on what matters to YOU.
                
                ---
                
                **RESOURCES:**
                
                **Books:**
                - "Pedagogy of the Oppressed" - Paulo Freire
                - "Deschooling Society" - Ivan Illich
                - "The Underground History of American Education" - John Taylor Gatto
                
                **Online:**
                - Khan Academy (free courses)
                - MIT OpenCourseWare
                - Coursera (many free options)
                - Library Genesis (books)
                
                ---
                
                **THE GOAL:**
                
                Move from:
                - Passive recipient of information
                - To active seeker of truth
                
                From:
                - Compliant accepter of systems
                - To critical questioner of power
                
                From:
                - Isolated individual
                - To educated citizen
                
                **That's what this app is for.**
                
                Your real education starts when you take control of it.
                """,
                keyTakeaway: "Schooling was done to you. Education is what you do for yourself. Learn financial literacy, your rights, critical thinking, and how systems actually work. Take control of your own education."
            )
        ]
    }
}

// MARK: - Lesson Model

struct EducationLesson: Identifiable {
    let id = UUID()
    let title: String
    let subtitle: String
    let icon: String
    let color: Color
    let content: String
    let keyTakeaway: String
}

// MARK: - Lesson View

struct EducationLessonView: View {
    let lesson: EducationLesson
    let index: Int
    
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
                            .foregroundColor(lesson.color)
                        Text("Key Takeaway")
                            .font(.system(size: 14, weight: .bold))
                            .foregroundColor(lesson.color)
                    }
                    
                    Text(lesson.keyTakeaway)
                        .font(.system(size: 16, weight: .medium))
                        .foregroundColor(.white)
                        .lineSpacing(4)
                }
                .padding()
                .background(lesson.color.opacity(0.1))
                .cornerRadius(16)
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(lesson.color.opacity(0.3), lineWidth: 1)
                    )
            }
            .padding()
        }
        .background(Color.black.ignoresSafeArea())
        .navigationBarTitleDisplayMode(.inline)
    }
}

// MARK: - Preview

#Preview {
    NavigationView {
        EducationExposedCourse()
    }
}
