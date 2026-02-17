// SystemsOfControlCourse.swift
// SYSTEMS OF CONTROL - Understanding Power Structures

import SwiftUI

struct SystemsOfControlCourse {
  static let shared = SystemsOfControlCourse()

  let id = "systems_control"
  let title = "Systems of Control"
  let subtitle = "How power operates—and how to see it"
  let icon = "eye.slash.circle.fill"
  let colorHex = "#B71C1C"

  var color: Color {
    Color(hex: colorHex)
  }

  let modules: [ControlModule] = [
    // MODULE 1: FRAMEWORKS FOR SEEING
    ControlModule(
      id: "ctrl_1",
      number: 1,
      title: "How To See Power",
      subtitle: "Frameworks for analysis",
      lessons: [
        ControlLesson(
          id: "c1_1",
          title: "Manufacturing Consent",
          content: """
            **Noam Chomsky's Propaganda Model**

            In "Manufacturing Consent" (1988), Chomsky and Herman revealed how media shapes public opinion to serve elite interests.

            **The Five Filters:**

            **1. Ownership**
            Media is owned by large corporations with their own interests. They won't report against their owners' interests.

            **2. Advertising**
            Media depends on advertisers for revenue. Content that threatens advertisers gets suppressed.

            **3. Sourcing**
            Media relies on "official sources" (government, corporations). These sources have agendas. Dissenting voices are marginalized.

            **4. Flak**
            Organized attacks on media that strays from acceptable narratives. Think tanks, pressure groups, advertiser boycotts.

            **5. Common Enemy**
            Fear of an enemy (Communism, terrorism, etc.) justifies censorship and propaganda.

            **The Result:**
            Media that APPEARS free but operates within invisible constraints. You think you're getting news—you're getting narrative management.

            **How To Apply:**
            When consuming media, ask:
            • Who owns this outlet?
            • Who advertises here?
            • Where are the sources getting THEIR info?
            • Who would attack this outlet for this story?
            • What enemy is being invoked?

            🔥 **The Wake-Up**: "Free press" doesn't mean free from influence. It means the chains are invisible.
            """,
          keyQuestion: "Who benefits if I believe this story?"
        ),

        ControlLesson(
          id: "c1_2",
          title: "The Overton Window",
          content: """
            **Controlling What's "Thinkable"**

            The Overton Window describes the range of ideas considered acceptable in public discourse.

            **The Spectrum:**
            Unthinkable → Radical → Acceptable → Sensible → Popular → Policy

            Ideas outside the window aren't debated—they're dismissed as crazy, dangerous, or irrelevant.

            **How The Window Shifts:**
            Those who control media, education, and political discourse can MOVE the window:
            • Yesterday's "radical" becomes today's "sensible"
            • Yesterday's "sensible" becomes today's "outdated"

            **Who Moves The Window:**
            • Think tanks (policy papers, "experts")
            • Media (what's covered vs. ignored)
            • Politicians (what they're willing to say)
            • Social pressure (what gets you cancelled)

            **Examples of Window Shifts:**
            • Gay marriage: Unthinkable (1990) → Policy (2015)
            • Mass surveillance: Radical concern (2000) → Accepted reality (2013)
            • Universal healthcare: Radical (US) vs. Policy (every other developed nation)

            **The Control Mechanism:**
            You don't have to censor ideas if you can make them unthinkable. People self-censor to stay within the window.

            🔥 **The Liberation**: Ask what's OUTSIDE the current window. The fact that an idea is "unthinkable" tells you nothing about whether it's TRUE.
            """,
          keyQuestion: "What ideas am I not even allowed to consider?"
        ),

        ControlLesson(
          id: "c1_3",
          title: "Problem-Reaction-Solution",
          content: """
            **The Hegelian Dialectic Weaponized**

            A classic technique for implementing policies that people would normally reject.

            **The Pattern:**

            **Step 1: CREATE or ALLOW a Problem**
            Either cause a crisis directly or allow one to develop that could have been prevented.

            **Step 2: Publicize the REACTION**
            Media amplifies fear, outrage, demand for "something to be done." The public begs for a solution.

            **Step 3: Offer the SOLUTION**
            The solution—which was the goal all along—is presented as the only option. People accept what they would have rejected before the "problem."

            **Historical Examples:**
            • 9/11 → Fear → Patriot Act (surveillance powers)
            • 2008 crash → Panic → Bank bailouts
            • Gulf of Tonkin → Outrage → Vietnam War escalation
            • War on Drugs → Fear → Mass incarceration

            **How To Recognize It:**
            • Crisis appears suddenly with clear villain
            • Media coverage is uniform and emotional
            • Pre-written solution appears quickly
            • Solution expands government/corporate power
            • Questioning the narrative is attacked

            **Not Every Crisis Is Manufactured**
            Real problems exist. The question is: Is the solution proportionate? Does it address root causes? Who benefits?

            🔥 **The Discernment**: When you see crisis → fear → solution, PAUSE. Ask who wrote the solution before the crisis appeared.
            """,
          keyQuestion: "Was this solution written before this problem existed?"
        ),
      ]
    ),

    // MODULE 2: THE STRUCTURES
    ControlModule(
      id: "ctrl_2",
      number: 2,
      title: "How Power Is Organized",
      subtitle: "The architecture of control",
      lessons: [
        ControlLesson(
          id: "c2_1",
          title: "The Lobbying Machine",
          content: """
            **Legal Bribery**

            In the US, lobbying is constitutionally protected. But it's become a system where money buys policy.

            **The Numbers (US):**
            • ~12,000 registered lobbyists in DC
            • $3.7 billion spent on lobbying annually
            • Top spenders: Pharma, insurance, tech, defense, finance
            • For every member of Congress: ~23 lobbyists

            **How It Works:**

            **1. Campaign Contributions**
            Corporations and wealthy donors fund campaigns. Politicians become dependent on this money to get elected.

            **2. Revolving Door**
            Politicians become lobbyists after leaving office. Lobbyists become regulators. The line between government and industry dissolves.

            **3. Writing Legislation**
            Lobbyists literally write bills that legislators then introduce. The "representative" is representing donors, not voters.

            **4. Information Control**
            Lobbyists provide "research" and "expertise" to legislators who don't have time to understand complex issues.

            **The Result:**
            Policies consistently favor concentrated wealth over public interest:
            • Tax codes with loopholes
            • Regulations that protect incumbents
            • Military contracts that never end
            • Healthcare costs that bankrupt families

            **Who Lobbies Most:**
            • Pharmaceutical/Health: ~$350M/year
            • Insurance: ~$150M/year
            • Tech: ~$100M/year
            • Finance: ~$100M/year
            • Defense: ~$100M/year

            🔥 **The Reality**: "Representative democracy" represents those who can afford representation.
            """,
          keyQuestion: "Who paid for this policy to exist?"
        ),

        ControlLesson(
          id: "c2_2",
          title: "The Intelligence State",
          content: """
            **Surveillance Beyond Accountability**

            Since WWII, the US has built an intelligence apparatus that operates largely beyond democratic oversight.

            **The Agencies:**
            • CIA: Foreign intelligence (officially)
            • NSA: Signals intelligence (mass surveillance)
            • FBI: Domestic intelligence
            • DIA: Military intelligence
            • + 13 other agencies

            **Budget**: ~$90 billion annually (known), plus classified "black budgets"

            **What We Know (Post-Snowden):**

            **Mass Surveillance:**
            • NSA collects metadata on ALL domestic calls
            • PRISM: Direct access to tech company servers
            • XKeyscore: Search anyone's online activity
            • Upstream: Tapping fiber optic cables

            **Domestic Operations:**
            • COINTELPRO (1956-1971): FBI targeted civil rights leaders, antiwar activists
            • Operation CHAOS: CIA domestic surveillance (illegal)
            • Parallel construction: Using secret surveillance, then creating fake evidence trails

            **No Accountability:**
            • FISA courts approve 99.97% of surveillance requests
            • Classification hides crimes from public
            • Whistleblowers are prosecuted; criminals are promoted

            **The Snowden Revelations (2013):**
            NSA contractor Edward Snowden revealed:
            • Government lied about surveillance scope
            • Tech companies were complicit
            • Constitutional rights were being violated at scale

            Result: Snowden exiled, surveillance continued.

            🔥 **The Question**: If they're watching everyone, who's watching them?
            """,
          keyQuestion: "What power exists that I'm not allowed to know about?"
        ),

        ControlLesson(
          id: "c2_3",
          title: "Financial Control",
          content: """
            **Money As Control Mechanism**

            The financial system isn't neutral—it's a control structure.

            **The Federal Reserve:**
            • Private bank with government charter
            • Creates money from nothing (fiat)
            • Sets interest rates that affect everyone
            • Bailed out banks in 2008 with $16+ trillion (audit revealed)
            • Not audited by Congress until partial audit in 2011

            **How Money Controls:**

            **1. Debt Slavery**
            • Student loans: $1.7 trillion
            • Mortgages: $12 trillion
            • Credit cards: $1 trillion
            • Medical debt: #1 cause of bankruptcy

            Debt keeps people working jobs they hate, afraid to take risks, unable to organize.

            **2. Inflation as Tax**
            When the Fed prints money, your savings lose value. This is a hidden tax that transfers wealth upward.

            **3. Credit Scores**
            Your entire financial life depends on a number controlled by three private companies. This number determines housing, employment, opportunities.

            **4. Bank Dependency**
            Try to exist without a bank account. You can't pay rent, receive wages, or function in modern society.

            **The 2008 Bailout:**
            Banks gambled with complex derivatives, crashed the economy, and were bailed out with public money. Homeowners were foreclosed; bankers got bonuses.

            No major banker went to prison.

            🔥 **The Design**: A system where you must work for money that loses value, to pay debts that grow, while those who control money creation get richer.
            """,
          keyQuestion: "Who creates the money—and who decides where it goes?"
        ),
      ]
    ),

    // MODULE 3: CASE STUDIES
    ControlModule(
      id: "ctrl_3",
      number: 3,
      title: "Case Studies in Control",
      subtitle: "Specific examples to analyze",
      lessons: [
        ControlLesson(
          id: "c3_1",
          title: "The Pharmaceutical Industry",
          content: """
            **Profit Over Health**

            The pharmaceutical industry exemplifies how corporate power captures regulatory systems.

            **The Numbers:**
            • US drug prices: Highest in the world
            • Pharma lobbying: $350M+ annually (most of any industry)
            • Marketing spend: Often exceeds R&D
            • Opioid crisis deaths: 500,000+ since 1999

            **Regulatory Capture:**
            • FDA funded largely by pharma "user fees"
            • 50%+ of FDA drug reviewers later work for pharma
            • Clinical trials run by companies selling the drugs
            • Negative results often hidden

            **The Opioid Example:**
            • Purdue Pharma knew OxyContin was addictive
            • Marketed it as safe for chronic pain
            • Paid doctors to prescribe it
            • Result: 500,000+ dead, Sackler family worth $11 billion
            • Penalty: Bankruptcy protection, no prison time

            **COVID Vaccines (Without Taking Sides):**
            • Developed with public funding ($18B+ Operation Warp Speed)
            • Companies retained patent profits
            • Liability shielded by government
            • Mandates implemented for products with EUA
            • Questioning safety labeled "misinformation"

            Regardless of your view on vaccine safety, the STRUCTURE is notable: public risk, private profit, no liability.

            **The Pattern:**
            • Create dependency
            • Capture regulators
            • Suppress competition
            • Externalize costs
            • Profit from illness, not health

            🔥 **The Question**: Is a system designed for profit incentivized to cure you—or to make you a lifelong customer?
            """,
          keyQuestion: "Does this industry profit more from my health or my illness?"
        ),

        ControlLesson(
          id: "c3_2",
          title: "Foreign Policy & Endless War",
          content: """
            **War As Business**

            The US has been at war for 93% of its existence. This isn't accident—it's design.

            **The Military-Industrial Complex:**
            Eisenhower warned in 1961: "We must guard against the acquisition of unwarranted influence by the military-industrial complex."

            **The Numbers:**
            • US military budget: ~$900 billion (more than next 10 countries combined)
            • 750+ military bases in 80 countries
            • Top defense contractors make billions annually

            **How It Perpetuates:**

            **1. Revolving Door**
            Generals retire to defense contractor boards. Contractor executives become Pentagon officials.

            **2. Congressional Districts**
            Defense contracts spread across many districts. Cutting military spending = cutting jobs = losing elections.

            **3. Threat Inflation**
            There's always a new enemy: Communists → Terrorists → China → ?
            Each enemy justifies more spending.

            **4. Classified Operations**
            What happens in secret can't be debated. Trillions spent on programs the public doesn't know exist.

            **Recent Wars:**
            • Afghanistan (20 years, $2.3 trillion, Taliban back in power)
            • Iraq (WMDs never found, 500,000+ dead)
            • Libya (destroyed functioning state)
            • Syria (funded "moderate rebels" who weren't)
            • Yemen (US-backed Saudi bombing, famine)

            **Who Benefits:**
            • Defense contractors
            • Oil companies
            • Banks that finance it all
            • Politicians who appear "tough"

            **Who Pays:**
            • US taxpayers ($8 trillion since 9/11)
            • Veterans (suicide, PTSD, homelessness)
            • Civilians in target countries
            • Future generations (debt)

            🔥 **The Pattern**: War is profitable for the few and catastrophic for the many. The machine needs enemies to survive.
            """,
          keyQuestion: "Who profits from this war—and who pays?"
        ),

        ControlLesson(
          id: "c3_3",
          title: "Media & Narrative Control",
          content: """
            **Six Companies Control 90% of US Media**

            In 1983, 50 companies controlled most US media. Today: 6.

            **The Six:**
            • Comcast (NBC, MSNBC, Universal)
            • Disney (ABC, ESPN, Marvel, Star Wars)
            • Warner Bros Discovery (CNN, HBO, WB)
            • Paramount (CBS, MTV, Nickelodeon)
            • Fox Corporation (Fox News, Fox Sports)
            • Sony (Columbia Pictures)

            **The Illusion of Choice:**
            You can choose between CNN and Fox—but both operate within limits. Both support:
            • Capitalism as the only option
            • US foreign policy (with minor variations)
            • The two-party duopoly
            • Corporate power (their advertisers)

            **Operation Mockingbird:**
            CIA program (1950s-70s) that placed agents in major news organizations. Officially ended. But relationships continue.

            **How Narratives Are Set:**

            **1. Story Selection**
            What's covered vs. ignored. A protest can be news or invisible.

            **2. Framing**
            "Terrorist" vs. "freedom fighter." "Regime" vs. "government." Language shapes perception.

            **3. Expert Selection**
            Who gets interviewed shapes what's thinkable. Same "experts" across channels.

            **4. Repetition**
            Repeat something enough, it becomes "true." Weapons of mass destruction.

            **5. Omission**
            What's NOT reported is often more important than what is.

            **Social Media:**
            • Algorithms amplify outrage (engagement)
            • "Fact-checkers" often have conflicts of interest
            • Deplatforming silences without debate
            • Coordination between government and platforms (Twitter Files)

            🔥 **The Liberation**: Diversify your sources. Include international media. Follow independent journalists. Notice what's NOT being covered.
            """,
          keyQuestion: "What story is NOT being told—and why?"
        ),

        ControlLesson(
          id: "c3_4",
          title: "Your Rights Under Erosion",
          content: """
            **Constitutional Rights: Theory vs. Practice**

            The Bill of Rights promises much. Reality delivers less.

            **1st Amendment (Speech, Religion, Assembly, Press)**
            • Free speech zones (protest only here)
            • Social media censorship (government-coordinated)
            • Journalist prosecution (Assange)
            • "Misinformation" as justification for suppression

            **2nd Amendment (Arms)**
            • Constant legislative battles
            • Red flag laws (confiscation without conviction)
            • ATF rule changes bypassing Congress

            **4th Amendment (Search & Seizure)**
            • Mass surveillance (NSA)
            • Civil asset forfeiture (police take property without charges)
            • No-knock raids
            • Border "Constitution-free zones" (100 miles from any border = 2/3 of population)

            **5th Amendment (Due Process)**
            • NDAA allows indefinite detention of citizens
            • No-fly lists (no due process to get off)
            • Parallel construction hides evidence sources

            **6th Amendment (Fair Trial)**
            • 97% of federal cases end in plea bargains
            • Public defenders overwhelmed
            • Cash bail = poverty punishment

            **10th Amendment (States' Rights)**
            • Federal overreach in countless areas
            • Commerce clause stretched to cover everything

            **The Patriot Act (2001):**
            • Passed without being read
            • Surveillance powers expanded
            • "National security" trumps rights
            • Renewed repeatedly

            **COVID Emergency Powers:**
            • Mandates for medical procedures
            • Business closures
            • Travel restrictions
            • Bank account freezes (Canada)

            Emergency powers tend to become permanent.

            🔥 **The Reality**: Rights exist on paper. Whether they exist in practice depends on your willingness to assert them—and the system's willingness to respect them.
            """,
          keyQuestion: "Do I have rights—or permissions that can be revoked?"
        ),
      ]
    ),

    // MODULE 4: WHAT TO DO
    ControlModule(
      id: "ctrl_4",
      number: 4,
      title: "What Now?",
      subtitle: "From awareness to action",
      lessons: [
        ControlLesson(
          id: "c4_1",
          title: "Avoiding Paranoia",
          content: """
            **The Trap of Seeing Conspiracy Everywhere**

            Understanding systems of control can lead to two traps:

            **Trap 1: Denial**
            "That can't be true. I would have heard about it."
            This is naivety masquerading as sophistication.

            **Trap 2: Paranoia**
            "EVERYTHING is a conspiracy. I can't trust anything."
            This is pattern recognition gone haywire.

            **The Balanced Path:**

            **1. Not Everything Is Coordinated**
            Some things are incompetence, not conspiracy. Some are emergent, not planned. Hanlon's Razor: Don't attribute to malice what can be explained by stupidity.

            **2. Cui Bono, But Also...**
            "Who benefits?" is useful. But sometimes events benefit no one who planned them. Unintended consequences are real.

            **3. Falsifiability**
            If nothing could disprove your theory, it's not a theory—it's a religion. Good analysis can be wrong.

            **4. Mental Health**
            If you can't enjoy life because you see control everywhere, the controllers won. Don't let awareness become imprisonment.

            **5. Proportion**
            Some conspiracies are real (COINTELPRO, MKUltra, Tuskegee). Most conspiracy theories are false. Learning to distinguish is a skill.

            **Questions For Any Theory:**
            • What evidence would change my mind?
            • Who is the source? What's their track record?
            • Does this explain MORE or LESS than simpler explanations?
            • Am I believing this because it's true or because it makes me feel special?

            🔥 **The Middle Way**: Eyes open, heart peaceful. See clearly without becoming consumed. Awareness serves life—not the other way around.
            """,
          keyQuestion: "Am I seeking truth—or seeking to confirm what I already believe?"
        ),

        ControlLesson(
          id: "c4_2",
          title: "Building Parallel Structures",
          content: """
            **You Can't Vote Your Way Out**

            If the system is captured, working within the system has limits. The alternative: build parallel structures.

            **What Are Parallel Structures?**

            Systems that exist alongside (and eventually can replace) corrupted institutions:

            **Financial:**
            • Local credit unions (vs. big banks)
            • Cryptocurrency (decentralized money)
            • Mutual aid networks
            • Barter and alternative exchange

            **Information:**
            • Independent media (subscriber-funded)
            • Alternative platforms (decentralized)
            • Local news cooperatives
            • Direct relationships with journalists

            **Food:**
            • Farmers markets
            • CSAs (Community Supported Agriculture)
            • Home gardens
            • Seed saving

            **Health:**
            • Direct primary care (skip insurance)
            • Functional/integrative medicine
            • Health sovereignty education
            • Traditional/herbal knowledge

            **Education:**
            • Homeschool cooperatives
            • Unschooling
            • Alternative universities
            • Mentorship networks

            **Community:**
            • Intentional communities
            • Mutual aid societies
            • Skill-sharing networks
            • Local resilience groups

            **The Strategy:**
            Don't fight the old system. Build the new one and make the old one irrelevant.

            🔥 **The Shift**: From "How do I fix the system?" to "How do I build something better?"
            """,
          keyQuestion: "What can I build that doesn't depend on systems I don't trust?"
        ),

        ControlLesson(
          id: "c4_3",
          title: "Inner Freedom First",
          content: """
            **The Most Important Liberation**

            External control systems are real. But the deepest prison is internal.

            **Internal Prisons:**
            • Fear of social rejection
            • Need for external validation
            • Attachment to comfort
            • Belief in your own powerlessness
            • Identification with victim narratives

            **Why Inner Work Comes First:**

            **1. You Can't Give What You Don't Have**
            A fearful person builds fearful structures. A free person builds free structures.

            **2. They Control Through Psychology**
            Fear, outrage, division—these are the levers. Master your psychology, and the levers don't work.

            **3. The System Needs Your Participation**
            The machine runs on your attention, your labor, your consent. Inner freedom means choosing where your energy goes.

            **4. Outer Change Follows Inner**
            Every external revolution that skipped inner work recreated the same patterns. Meet the new boss, same as the old boss.

            **The Practice:**
            • Meditation (observing your own mind)
            • Shadow work (integrating denied parts)
            • Sovereignty (developing internal authority)
            • Discernment (separating signal from noise)
            • Groundedness (rooted in body, present moment)

            **The Result:**
            You can see the prison clearly WITHOUT being emotionally imprisoned by the seeing. You act from clarity, not reaction.

            🔥 **The Ultimate Freedom**: "I see the game. I choose not to play. I build something different." This is only possible from inner freedom.
            """,
          keyQuestion: "Am I free inside—or just angry at my external cage?"
        ),
      ]
    ),
  ]
}

/// Supporting Types
struct ControlModule: Identifiable {
  let id: String
  let number: Int
  let title: String
  let subtitle: String
  let lessons: [ControlLesson]
}

struct ControlLesson: Identifiable {
  let id: String
  let title: String
  let content: String
  let keyQuestion: String
}

struct ControlProgress: Codable {
  var completedLessons: [String]
  var lastAccessed: Date?
  static var `default`: ControlProgress {
    ControlProgress(completedLessons: [], lastAccessed: nil)
  }
}
