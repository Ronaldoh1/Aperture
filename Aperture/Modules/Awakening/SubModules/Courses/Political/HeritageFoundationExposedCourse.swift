// HeritageFoundationExposedCourse.swift
// The shadow government that grooms and places operatives
// Project 2025 and beyond

import SwiftUI

struct HeritageFoundationExposedCourse: View {
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                // Header
                courseHeader
                
                // Warning
                warningSection
                
                // Lessons
                ForEach(Array(lessons.enumerated()), id: \.offset) { index, lesson in
                    NavigationLink(destination: HeritageLessonView(lesson: lesson, index: index + 1)) {
                        lessonRow(lesson, index: index)
                    }
                }
                
                // Key figures
                keyFiguresSection
                
                // Sources
                sourcesSection
            }
        }
        .background(Color.black.ignoresSafeArea())
        .navigationTitle("Heritage Foundation")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private var courseHeader: some View {
        VStack(spacing: 16) {
            ZStack {
                Circle()
                    .fill(Color.red.opacity(0.2))
                    .frame(width: 100, height: 100)
                
                Image(systemName: "building.fill")
                    .font(.system(size: 44))
                    .foregroundColor(.red)
            }
            
            Text("Heritage Foundation Exposed")
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(.white)
            
            Text("The conservative machine that grooms government")
                .font(.system(size: 14))
                .foregroundColor(.gray)
            
            HStack {
                Text("8 Lessons")
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
    
    private var warningSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(systemName: "exclamationmark.triangle.fill")
                    .foregroundColor(.red)
                Text("Active Threat")
                    .font(.system(size: 14, weight: .bold))
                    .foregroundColor(.red)
            }
            
            Text("Project 2025 is being implemented NOW. This isn't history—it's happening.")
                .font(.system(size: 12))
                .foregroundColor(.white.opacity(0.8))
        }
        .padding()
        .background(Color.red.opacity(0.1))
        .cornerRadius(12)
        .padding()
    }
    
    private func lessonRow(_ lesson: HeritageLesson, index: Int) -> some View {
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
    
    // MARK: - Key Figures
    
    private var keyFiguresSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("KEY FIGURES")
                .font(.system(size: 14, weight: .black))
                .foregroundColor(.red)
            
            VStack(spacing: 12) {
                figureCard(
                    name: "Kevin Roberts",
                    role: "Heritage Foundation President",
                    background: "Former Texas Public Policy Foundation. Architect of Project 2025.",
                    quote: "We are in the process of the second American Revolution, which will remain bloodless if the left allows it to be."
                )
                
                figureCard(
                    name: "Leonard Leo",
                    role: "Federalist Society Co-Chair",
                    background: "Controls $1.6B dark money network. Selected all Trump Supreme Court justices.",
                    quote: nil
                )
                
                figureCard(
                    name: "Russell Vought",
                    role: "Project 2025 Policy Director",
                    background: "Former Trump OMB director. Now implementing Project 2025.",
                    quote: nil
                )
            }
        }
        .padding()
    }
    
    private func figureCard(name: String, role: String, background: String, quote: String?) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(name)
                .font(.system(size: 16, weight: .bold))
                .foregroundColor(.white)
            
            Text(role)
                .font(.system(size: 12, weight: .medium))
                .foregroundColor(.red)
            
            Text(background)
                .font(.system(size: 12))
                .foregroundColor(.gray)
            
            if let quote = quote {
                Text("\"\(quote)\"")
                    .font(.system(size: 11, weight: .medium))
                    .foregroundColor(.yellow)
                    .italic()
                    .padding(8)
                    .background(Color.yellow.opacity(0.1))
                    .cornerRadius(8)
            }
        }
        .padding()
        .background(Color.white.opacity(0.05))
        .cornerRadius(12)
    }
    
    private var sourcesSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("SOURCES")
                .font(.system(size: 14, weight: .black))
                .foregroundColor(.gray)
            
            VStack(alignment: .leading, spacing: 6) {
                Text("• Project 2025 document (920 pages, publicly available)")
                Text("• Heritage Foundation website and publications")
                Text("• OpenSecrets.org dark money tracking")
                Text("• ProPublica investigations")
                Text("• New York Times, Washington Post reporting")
            }
            .font(.system(size: 11))
            .foregroundColor(.gray)
        }
        .padding()
    }
    
    // MARK: - Lessons
    
    private var lessons: [HeritageLesson] {
        [
            HeritageLesson(
                title: "What is the Heritage Foundation?",
                subtitle: "The conservative policy machine",
                color: .red,
                content: """
                **The Shadow Government**
                
                The Heritage Foundation isn't just a think tank. It's a machine that creates policy, grooms operatives, and places them throughout government.
                
                ---
                
                **Founded:** 1973
                **Budget:** $100+ million/year
                **Staff:** 400+ employees
                **Influence:** Enormous
                
                ---
                
                **What They Do:**
                
                1. **Write policy:** Draft legislation, executive orders, regulations
                2. **Train operatives:** Groom young conservatives for government
                3. **Place people:** Get their people into key positions
                4. **Coordinate:** Connect donors, politicians, media
                5. **Legitimize:** Make radical ideas seem mainstream
                
                ---
                
                **The Reagan Revolution:**
                
                Heritage's first major success:
                
                - Published "Mandate for Leadership" (1980)
                - 2,000+ policy recommendations
                - Reagan implemented ~60% of them
                - Proved the model works
                
                ---
                
                **The Model:**
                
                **Step 1:** Wealthy donors fund Heritage
                **Step 2:** Heritage writes policy
                **Step 3:** Heritage trains operatives
                **Step 4:** Operatives get government jobs
                **Step 5:** Operatives implement Heritage policy
                **Step 6:** Repeat
                
                **This is not a conspiracy theory. This is their stated strategy.**
                
                ---
                
                **Who Funds Them:**
                
                Major donors include:
                - Koch network
                - Richard Mellon Scaife (deceased)
                - Bradley Foundation
                - Donors Trust (dark money)
                - Corporate donors
                
                Dark money means: You can't trace who paid for what.
                
                ---
                
                **The Network:**
                
                Heritage is part of a larger ecosystem:
                
                - **Federalist Society:** Selects judges
                - **ALEC:** Writes state legislation
                - **State Policy Network:** State-level Heritage clones
                - **Turning Point USA:** Youth recruitment
                - **Various PACs:** Electoral support
                
                **They coordinate. They're patient. They're effective.**
                """,
                keyTakeaway: "Heritage Foundation writes policy, trains operatives, and places them in government. They implemented 60% of their recommendations under Reagan. This is their stated strategy, funded by dark money."
            ),
            HeritageLesson(
                title: "Project 2025: The Blueprint",
                subtitle: "920 pages of plans for America",
                color: .orange,
                content: """
                **The Plan Is Public**
                
                Project 2025 is a 920-page document detailing exactly what they want to do. They published it openly.
                
                ---
                
                **What Is Project 2025:**
                
                A coalition of 100+ conservative organizations led by Heritage Foundation, creating:
                
                1. **Policy playbook:** Detailed plans for every agency
                2. **Personnel database:** 20,000+ vetted conservatives ready to serve
                3. **Training program:** 180-day intensive for future appointees
                4. **Day One agenda:** Executive orders ready to sign
                
                ---
                
                **Core Goals:**
                
                **1. Expand Presidential Power:**
                - Bring independent agencies under White House control
                - Reinstate "Schedule F" (fire career civil servants)
                - Replace expertise with loyalty
                
                **2. Dismantle the Administrative State:**
                - Gut EPA, Education, Commerce, etc.
                - Eliminate regulations
                - End "woke" policies
                
                **3. Reshape Society:**
                - Traditional family structure enforced
                - LGBTQ+ protections eliminated
                - Abortion access ended nationwide
                - Immigration drastically restricted
                
                ---
                
                **Key Proposals:**
                
                **Department of Justice:**
                - Place under direct presidential control
                - Prosecute political opponents
                - Pardon allies
                
                **Department of Education:**
                - Eliminate entirely
                - End student loan programs
                - Promote "patriotic" curriculum
                
                **EPA:**
                - Gut climate regulations
                - Expand drilling
                - Remove environmental protections
                
                **FBI:**
                - Restructure completely
                - Remove leadership
                - End "political" investigations
                
                **HHS:**
                - Declare personhood at fertilization
                - Ban abortion pill (mifepristone)
                - Restrict contraception access
                
                **DHS/ICE:**
                - Mass deportation operations
                - End asylum
                - Family detention expansion
                
                ---
                
                **The Schedule F Threat:**
                
                Currently: Career civil servants have protections
                Under Schedule F: 50,000+ can be fired and replaced
                
                **Purpose:** Replace expertise with loyalty
                
                This would convert government into a patronage system.
                
                ---
                
                **The Personnel Database:**
                
                Heritage has built a database of 20,000+ vetted conservatives:
                - Background checked
                - Ideologically screened
                - Ready for appointment
                - Trained in Heritage policies
                
                **They're not hiding this. It's on their website.**
                """,
                keyTakeaway: "Project 2025 is a public 920-page blueprint to reshape the government. Schedule F would let them fire 50,000+ career employees. They've pre-vetted 20,000 loyalists ready to replace them."
            ),
            HeritageLesson(
                title: "The Federalist Society Pipeline",
                subtitle: "How they captured the courts",
                color: .purple,
                content: """
                **The Courts: A 50-Year Project**
                
                The conservative legal movement spent 50 years capturing the federal courts. They succeeded.
                
                ---
                
                **The Federalist Society:**
                
                Founded: 1982
                Members: 70,000+ lawyers, judges, students
                Budget: $25+ million
                Goal: Conservative legal establishment
                
                ---
                
                **How It Works:**
                
                **1. Identify talent young:**
                - Recruit in law schools
                - Chapter at every major school
                - Networking events
                - Career advancement
                
                **2. Develop ideology:**
                - "Originalism" and "textualism"
                - Skepticism of federal power
                - Property rights emphasis
                - Religious liberty focus
                
                **3. Place in clerkships:**
                - Supreme Court clerkships
                - Federal appellate clerkships
                - These become future judges
                
                **4. Recommend for judgeship:**
                - Leonard Leo's list
                - Provided to Republican presidents
                - Pre-vetted for ideology
                
                ---
                
                **Leonard Leo: The Kingmaker**
                
                One man has more influence over the courts than anyone:
                
                - Co-chairman of Federalist Society
                - Controls $1.6 billion in dark money
                - Selected all Trump Supreme Court justices
                - Placed 200+ federal judges
                
                **How he did it:**
                
                2016: Provided Trump with "list" of potential SCOTUS picks
                - All Federalist Society approved
                - Trump committed to picking from list
                - Three justices appointed
                
                ---
                
                **The Results:**
                
                **Supreme Court:**
                - 6-3 conservative majority
                - All 6 conservatives have Federalist Society ties
                - Lifetime appointments
                
                **What they've done:**
                - Overturned Roe v. Wade
                - Expanded gun rights
                - Limited EPA power
                - Undermined voting rights
                - Religious exemptions expanded
                
                **Federal Appellate Courts:**
                - Trump appointed 54 appellate judges
                - 30% of active appellate judges
                - Federalist Society approved
                
                ---
                
                **The Long Game:**
                
                This took 50 years of patient work:
                
                - 1982: Federalist Society founded
                - 1980s-90s: Build network
                - 2000s: Place judges
                - 2010s: Accelerate appointments
                - 2020s: Reshape law
                
                **They planned. They funded. They won.**
                
                ---
                
                **The Ethics Scandals:**
                
                Justices Thomas and Alito revealed to have received:
                - Luxury trips from billionaires
                - Property deals
                - Gifts worth hundreds of thousands
                - No disclosure
                
                **Leonard Leo's network funded some of this.**
                
                The Supreme Court has no binding ethics code.
                """,
                keyTakeaway: "The Federalist Society spent 50 years capturing the courts. Leonard Leo controls $1.6B in dark money and selected all Trump's Supreme Court picks. 6-3 conservative majority is their victory."
            ),
            HeritageLesson(
                title: "ALEC: Writing Your State Laws",
                subtitle: "Corporate lobbyists write legislation",
                color: .green,
                content: """
                **Model Legislation Factory**
                
                ALEC (American Legislative Exchange Council) brings corporations and state legislators together to write laws. Corporate-friendly laws.
                
                ---
                
                **What Is ALEC:**
                
                - Founded: 1973
                - Members: ~2,000 state legislators (1/4 of all)
                - Corporate members: Hundreds
                - Budget: $10+ million
                - Status: 501(c)(3) nonprofit
                
                ---
                
                **How It Works:**
                
                **1. Corporations pay to join** ($7,000-$25,000+)
                **2. Legislators join for free**
                **3. They meet at luxury resorts**
                **4. Together they write "model bills"**
                **5. Legislators take bills home and introduce them**
                **6. Laws pass with ALEC's fingerprints**
                
                ---
                
                **The Problem:**
                
                Corporations are literally writing laws:
                
                - Tobacco companies wrote smoking laws
                - Pharma wrote drug pricing laws
                - Energy companies wrote environmental laws
                - Private prisons wrote sentencing laws
                - Gun lobby wrote "Stand Your Ground"
                
                **Legislators put their names on bills they didn't write.**
                
                ---
                
                **ALEC Model Bills That Became Law:**
                
                **"Stand Your Ground" laws:**
                - Written with NRA
                - Passed in 30+ states
                - Invoked in Trayvon Martin case
                
                **Voter ID laws:**
                - Restrict voting access
                - Passed in 25+ states
                - Disproportionately affect minorities
                
                **"Right to Work" laws:**
                - Weaken unions
                - Now in 27 states
                - Corporate-funded effort
                
                **Anti-protest "Critical Infrastructure" laws:**
                - Criminalize pipeline protests
                - Passed in multiple states
                - Written with energy companies
                
                **Private prison contracts:**
                - Guaranteed occupancy clauses
                - More incarceration = more profit
                - CCA and GEO Group involved
                
                ---
                
                **The Exposure:**
                
                In 2011-2012, ALEC was exposed:
                - Internal documents leaked
                - Corporate members fled (Coca-Cola, Pepsi, McDonald's)
                - Bad publicity
                
                **But ALEC continues.** Just more quietly.
                
                ---
                
                **Corporate Members Have Included:**
                
                - ExxonMobil
                - Koch Industries
                - PhRMA
                - AT&T
                - State Farm
                - UPS
                - Walmart
                - And many more
                
                Some left after exposure. Others stayed.
                
                ---
                
                **Why This Matters:**
                
                You vote for state legislators.
                They're supposed to represent you.
                Instead, they introduce bills written by corporations.
                
                **This is legalized corruption.**
                
                *Source: ALEC Exposed (Center for Media and Democracy)*
                """,
                keyTakeaway: "ALEC brings corporations and legislators together to write 'model bills.' Stand Your Ground, voter ID, right-to-work—all started as ALEC model legislation written by corporate lobbyists."
            ),
            HeritageLesson(
                title: "The Dark Money Network",
                subtitle: "Untraceable billions shaping policy",
                color: .gray,
                content: """
                **Following the Invisible Money**
                
                Dark money is political spending where the source is hidden. Billions of dollars flow through networks designed to hide donors.
                
                ---
                
                **What Is Dark Money:**
                
                - Political spending
                - Donor identity hidden
                - Usually through 501(c)(4) nonprofits
                - Don't have to disclose donors
                - Can give to Super PACs
                
                ---
                
                **How It Works:**
                
                **The Pass-Through:**
                
                1. Billionaire wants to influence politics
                2. Gives to nonprofit (Donors Trust)
                3. Donors Trust gives to another nonprofit
                4. That nonprofit funds political activity
                5. Original donor is hidden
                
                **It's money laundering for politics.**
                
                ---
                
                **Key Nodes:**
                
                **Donors Trust / Donors Capital:**
                - $1+ billion distributed since 2001
                - "Dark money ATM"
                - Donors anonymous
                - Funds Heritage, ALEC, Federalist Society, many others
                
                **Koch Network:**
                - Charles Koch and allies
                - ~$500 million per election cycle
                - Multiple organizations coordinate
                - Americans for Prosperity flagship
                
                **Leonard Leo's Network:**
                - $1.6 billion in 2021 Barre Seid donation
                - Largest dark money donation ever
                - Funds Federalist Society ecosystem
                - Shapes courts
                
                ---
                
                **The Seid Donation:**
                
                In 2021, Barre Seid gave Leonard Leo's network $1.6 billion.
                
                - Largest political donation in history
                - Structured to avoid gift taxes
                - Recipient: Marble Freedom Trust
                - Purpose: Fund conservative causes
                
                **One man. $1.6 billion. No accountability.**
                
                *Source: New York Times investigation (2022)*
                
                ---
                
                **Citizens United Made This Possible:**
                
                Supreme Court ruling (2010):
                - Corporations can spend unlimited money
                - "Money is speech"
                - Super PACs created
                - Dark money exploded
                
                Before Citizens United: Dark money was limited
                After: Unlimited and untraceable
                
                ---
                
                **What Dark Money Buys:**
                
                - Think tank "research" supporting positions
                - "Grassroots" campaigns (actually astroturf)
                - Judicial confirmations
                - State legislation (via ALEC)
                - Electoral campaigns
                - Media campaigns
                
                **All untraceable to original funders.**
                
                ---
                
                **The Ecosystem:**
                
                The conservative dark money network includes:
                
                - Heritage Foundation
                - Federalist Society
                - ALEC
                - State Policy Network
                - Judicial Crisis Network
                - Americans for Prosperity
                - Turning Point USA
                - Many, many more
                
                **They coordinate. They share staff. They share donors.**
                
                *Source: OpenSecrets.org, ProPublica*
                """,
                keyTakeaway: "Dark money hides donor identities. Leonard Leo received $1.6 billion in a single donation. The Koch network spends ~$500M per cycle. Citizens United made this possible. It's untraceable influence."
            ),
            HeritageLesson(
                title: "Implementation: It's Happening Now",
                subtitle: "Project 2025 in action",
                color: .red,
                content: """
                **The Plan Is Being Executed**
                
                Project 2025 isn't a future threat. Implementation began immediately.
                
                ---
                
                **What's Already Happened:**
                
                **Personnel:**
                - Heritage-vetted appointees throughout administration
                - Career officials replaced with loyalists
                - Schedule F concepts being implemented
                - Expertise replaced with ideology
                
                **Justice Department:**
                - Cases against allies dropped
                - New investigations of opponents
                - Independence undermined
                
                **Immigration:**
                - Mass deportation operations expanded
                - Asylum effectively ended
                - Military involved in domestic enforcement
                - Birthright citizenship challenged
                
                **Federal Workforce:**
                - Hiring freezes
                - Return to office mandates designed to force resignations
                - "Loyalty tests" for remaining staff
                - Institutional knowledge being lost
                
                ---
                
                **The Playbook in Action:**
                
                **Step 1: Decapitate agencies**
                - Fire or force out career leadership
                - Replace with Heritage-approved picks
                
                **Step 2: Policy reversal**
                - Executive orders reversing previous policies
                - Regulatory rollbacks
                - Enforcement priorities changed
                
                **Step 3: Structural changes**
                - Reorganize agencies
                - Move offices
                - Eliminate programs
                
                **Step 4: Lock in**
                - Make changes hard to reverse
                - Embed loyalists
                - Destroy institutional capacity
                
                ---
                
                **Agencies Under Attack:**
                
                **EPA:**
                - Climate regulations suspended
                - Scientific advisory boards disbanded
                - Industry lobbyists appointed
                
                **Education:**
                - Civil rights enforcement gutted
                - Title IX changes
                - LGBTQ+ student protections removed
                
                **HHS:**
                - Reproductive rights attacked
                - Contraception access restricted
                - Gender-affirming care targeted
                
                **DHS:**
                - Mass deportation operations
                - Local police cooperation required
                - Asylum processing eliminated
                
                ---
                
                **Despite Denials:**
                
                Trump publicly "disavowed" Project 2025.
                
                **But:**
                - 140+ former Trump officials wrote it
                - Heritage alumni fill the administration
                - Policies match Project 2025 exactly
                - The playbook is being followed
                
                **The denial was political strategy.**
                
                ---
                
                **What Comes Next:**
                
                If unchallenged:
                - Independent agencies brought under White House
                - Civil service protections ended
                - Regulatory state dismantled
                - Courts packed with Federalist Society picks
                - Elections administered by loyalists
                
                **This is not alarmism. This is their stated plan.**
                """,
                keyTakeaway: "Project 2025 is being implemented now despite denials. 140+ Trump officials wrote it. Heritage-vetted appointees fill the administration. The policies match the document exactly."
            ),
            HeritageLesson(
                title: "The Resistance Playbook",
                subtitle: "What can be done",
                color: .blue,
                content: """
                **Understanding Enables Action**
                
                Now that you understand the machine, what can you do about it?
                
                ---
                
                **Individual Actions:**
                
                **1. Stay informed:**
                - Follow the implementation
                - Read primary sources
                - Understand what's actually happening
                
                **2. Educate others:**
                - Share this information
                - Help people understand the network
                - Connect the dots for them
                
                **3. Support journalism:**
                - Fund investigative reporting
                - ProPublica, local news, nonprofit media
                - Democracy needs information
                
                **4. Vote in EVERY election:**
                - School boards
                - State legislature
                - City council
                - Not just presidential
                
                ---
                
                **Political Actions:**
                
                **1. Support dark money disclosure:**
                - DISCLOSE Act (federal)
                - State disclosure laws
                - Make the money visible
                
                **2. Support judicial reform:**
                - Court expansion
                - Term limits
                - Ethics requirements
                - Circuit rebalancing
                
                **3. Support voting rights:**
                - Automatic registration
                - Early voting
                - No voter ID barriers
                - End gerrymandering
                
                **4. Support civil service protection:**
                - Block Schedule F
                - Protect career employees
                - Preserve expertise
                
                ---
                
                **Legal Actions:**
                
                Organizations fighting back:
                
                - **ACLU:** Constitutional challenges
                - **Democracy Forward:** Government accountability
                - **Public Citizen:** Regulatory protection
                - **NAACP Legal Defense Fund:** Civil rights
                - **Lambda Legal:** LGBTQ+ rights
                - **Earthjustice:** Environmental protection
                
                **Support these organizations.**
                
                ---
                
                **Community Actions:**
                
                **1. Local organizing:**
                - Show up at school boards
                - Attend city council
                - Run for local office
                
                **2. Build coalitions:**
                - Labor unions
                - Faith communities
                - Student groups
                - Professional associations
                
                **3. Direct action:**
                - Protests (know your rights)
                - Boycotts
                - Civil disobedience
                
                ---
                
                **The Long Game:**
                
                Heritage took 50 years to reach this moment.
                
                Reversing it won't happen overnight.
                
                **But:**
                - Younger generations are more progressive
                - Demographics are shifting
                - Climate reality is undeniable
                - Economic inequality is felt
                
                **The machine is powerful but not invincible.**
                
                ---
                
                **What They Fear:**
                
                - High voter turnout
                - Educated populace
                - Organized labor
                - Multiracial coalitions
                - Young people voting
                - Their tactics being exposed
                
                **Every one of these is something you can help with.**
                """,
                keyTakeaway: "Individual actions: stay informed, educate others, vote in every election. Support dark money disclosure, judicial reform, voting rights. Back organizations fighting back. The machine is powerful but not invincible."
            ),
            HeritageLesson(
                title: "Why This Matters",
                subtitle: "Democracy at stake",
                color: .yellow,
                content: """
                **The Stakes**
                
                This isn't about partisan politics. It's about whether democratic self-governance survives.
                
                ---
                
                **What's Being Dismantled:**
                
                **1. Expertise:**
                - Career officials who know how things work
                - Replaced with political loyalists
                - Institutional memory destroyed
                - Government becomes dysfunctional
                
                **2. Independence:**
                - Justice Department politicized
                - FBI under White House control
                - Regulatory agencies captured
                - No check on power
                
                **3. Democratic norms:**
                - Elections administered by partisans
                - Peaceful transfer threatened
                - Opponents criminalized
                - Dissent suppressed
                
                ---
                
                **The Authoritarian Template:**
                
                This follows a recognizable pattern:
                
                - Hungary under Orbán
                - Poland under PiS
                - Turkey under Erdoğan
                
                **Steps:**
                1. Capture courts
                2. Control media
                3. Demonize opponents
                4. Change electoral rules
                5. Eliminate checks
                6. Consolidate power
                
                **Heritage's playbook matches this template.**
                
                ---
                
                **Who Gets Hurt:**
                
                Project 2025 disproportionately targets:
                
                - **LGBTQ+ Americans:** Rights rolled back
                - **Immigrants:** Mass deportation, family separation
                - **Women:** Reproductive rights eliminated
                - **People of color:** Voting access restricted
                - **Workers:** Union rights weakened
                - **Poor people:** Safety net cut
                - **The environment:** Protections gutted
                
                **Not everyone is equally vulnerable.**
                
                ---
                
                **The Optimistic Case:**
                
                **They're overreaching:**
                - Unpopular positions (abortion bans)
                - Exposed their plans (Project 2025 is public)
                - Demographic headwinds
                - Young people activated
                
                **Institutions are pushing back:**
                - Courts blocking some actions
                - States protecting rights
                - Career employees resisting
                - Journalism exposing
                
                **People are paying attention:**
                - Highest engagement ever
                - Protests
                - Organizing
                - Donations to opposition
                
                ---
                
                **The Realistic Assessment:**
                
                This is a serious, well-funded, patient effort to reshape America.
                
                **It can be stopped. But not without effort.**
                
                - Complacency is the enemy
                - Every election matters
                - Local politics matters
                - Sustained engagement required
                
                ---
                
                **Final Thought:**
                
                **Kevin Roberts, Heritage Foundation President:**
                
                > "We are in the process of the second American Revolution, which will remain bloodless if the left allows it to be."
                
                He said it. They mean it.
                
                **Now you know what you're dealing with.**
                """,
                keyTakeaway: "Heritage is following an authoritarian template used in Hungary, Poland, and Turkey. Kevin Roberts called it a 'revolution' that will be 'bloodless if the left allows it.' This is a serious threat to democracy—but it can be stopped."
            )
        ]
    }
}

// MARK: - Models

struct HeritageLesson: Identifiable {
    let id = UUID()
    let title: String
    let subtitle: String
    let color: Color
    let content: String
    let keyTakeaway: String
}

struct HeritageLessonView: View {
    let lesson: HeritageLesson
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
    NavigationView {
        HeritageFoundationExposedCourse()
    }
}
