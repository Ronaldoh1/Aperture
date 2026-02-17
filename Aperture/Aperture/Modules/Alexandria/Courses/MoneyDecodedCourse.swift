// MoneyDecodedCourse.swift
// MONEY DECODED — The System They Never Taught You
// ☀️ SunFlow: Reignited
//
// Companion to the Fourth Turning course.
// Fourth Turning = WHY the reset is coming.
// Money Decoded = HOW money actually works + what to do.
//
// "They'll teach you calculus before they teach you
//  how money works. That's not an accident."

import SwiftUI

enum MoneyDecodedCourse {
  static let course = AlexandriaCourse(
    id: "money_decoded",
    title: "Money Decoded",
    subtitle: "The System They Never Taught You",
    icon: "banknote.fill",
    colorHex: "#F1C40F",
    tier: 2,
    isPremium: false,
    isUltraPremium: false,
    modules: [
      // ═══════════════════════════════════════════════════════════
      // MODULE 1: WHAT IS MONEY?
      // ═══════════════════════════════════════════════════════════

      ACModule(
        id: "md1", number: 1,
        title: "What Is Money, Really?",
        subtitle: "The biggest question nobody asks",
        icon: "questionmark.circle.fill",
        lessons: [
          ACLesson(
            id: "md1_1",
            title: "The Spell of Money",
            content: """
              **You use money every single day. You spend most of your waking life earning it. Yet most people cannot answer a simple question: What IS money?**

              It's not a trick question. But the answer reveals everything.

              **Money is NOT:**
              - Gold (we left that behind in 1971)
              - Backed by anything physical (no gold, no silver, no commodity)
              - Created by the government (this is the big one)

              **Money IS:**
              - A shared belief system. It works because we all agree it works.
              - Created primarily by PRIVATE BANKS, not the government
              - Debt. Literally. Most money in circulation was created when someone took out a loan.

              When a bank gives you a mortgage, they don't take money from a vault and hand it to you. They CREATE the money by typing numbers into a computer. That money didn't exist before your loan. When you pay it back (with interest), the principal disappears — but the interest stays with the bank.

              **This means:**
              1. Banks create money from nothing
              2. All money enters circulation as debt
              3. There is always more debt than money (because of interest)
              4. Someone MUST always be in debt for the system to function

              **You were never taught this in school.** Not in elementary school. Not in high school. Not even in most college economics courses. They'll teach you calculus, poetry, and the lifecycle of a frog before they teach you how the thing you spend your ENTIRE LIFE chasing actually works.

              🔥 **That's not an oversight. It's by design. An educated debtor might question the system. An ignorant one just keeps paying.**
              """,
            keyInsight:
              "Money is created by private banks as debt, not by the government from a vault. When a bank issues a loan, they create that money from nothing. All money enters circulation as debt, which means there is always more debt than money in the system. This is the foundation nobody teaches you.",
            practice:
              "Look at your bank account. That number isn't 'your money sitting in a vault.' It's a digital entry in a database — a promise from a bank. What backs that promise?"
          ),
          ACLesson(
            id: "md1_2",
            title: "A Brief History of Money Deception",
            content: """
              **Every major shift in how money works was designed to benefit the people who control money — not the people who use it.**

              **Ancient World:** Money = gold/silver coins with intrinsic value. You could melt the coin and the metal was worth the same. Hard to manipulate.

              **Medieval Banking:** Goldsmiths realized people rarely withdrew all their gold at once. So they issued MORE receipts than they had gold. This is called **fractional reserve banking** — and it's still how banking works today. They lend money they don't have.

              **1694 — Bank of England:** The first central bank. Created to fund wars. Private institution given the monopoly on creating a nation's money. The template for every central bank since.

              **1913 — Federal Reserve Act:** The United States gets its central bank. Despite the name, it is NOT federal (it's privately owned) and has NO reserves. It was created on Jekyll Island by a group of the wealthiest bankers in America. The meeting was SECRET. The participants used code names.

              Your Timeline in Aperture covers this: find "Federal Reserve & Income Tax — Year America Was Captured" (1913).

              **1933 — Gold Confiscation:** FDR signed Executive Order 6102, making it ILLEGAL for Americans to own gold. Citizens were forced to sell their gold to the government at $20.67/oz. The government then revalued gold to $35/oz — instantly stealing 40% of the value.

              **1944 — Bretton Woods:** After WWII, the dollar became the world's reserve currency, backed by gold. Every other currency pegged to the dollar.

              **1971 — Nixon Closes the Gold Window:** The dollar is no longer backed by gold. Money becomes pure faith — "fiat" currency (from Latin "let it be done"). Since then, the money supply has expanded exponentially and the dollar has lost 98% of its purchasing power.

              **Each step removed YOUR control and increased THEIR ability to create money from nothing.**

              🔥 **The history of money is the history of power finding new ways to extract wealth from the people who create it. Understanding this history is financial self-defense.**
              """,
            keyInsight:
              "Every major monetary shift in history transferred power from the people to institutions: from real coins to fractional reserves to central banking to fiat currency. Each step made it easier for those who control the money supply to extract wealth from those who don't.",
            practice:
              "Open your Aperture Timeline. Find: Federal Reserve (1913), Gold Standard End (1971). Read the institutional control mechanisms. These aren't ancient history — they're the system you live in RIGHT NOW.",
            interactiveElement: .timeline(events: [
              (
                year: "1694", event: "Bank of England created",
                significance: "First central bank — private institution controls national money"
              ),
              (
                year: "1913", event: "Federal Reserve Act",
                significance:
                  "Private central bank controls US money supply — not federal, no reserves"
              ),
              (
                year: "1933", event: "FDR confiscates gold",
                significance:
                  "Americans forced to sell gold at $20.67 — revalued to $35. Instant 40% theft"
              ),
              (
                year: "1944", event: "Bretton Woods",
                significance: "Dollar becomes world reserve currency, backed by gold"
              ),
              (
                year: "1971", event: "Nixon ends gold standard",
                significance:
                  "Dollar backed by nothing. Money becomes pure faith. Printing unlimited"
              ),
            ])
          ),
        ]
      ),

      // ═══════════════════════════════════════════════════════════
      // MODULE 2: THE EXTRACTION MACHINE
      // ═══════════════════════════════════════════════════════════

      ACModule(
        id: "md2", number: 2,
        title: "How They Extract Your Wealth",
        subtitle: "The mechanisms you can't see",
        icon: "arrow.up.right",
        lessons: [
          ACLesson(
            id: "md2_1",
            title: "Inflation: The Invisible Tax",
            content: """
              **Inflation is not a natural phenomenon. It is a policy choice.**

              When the Federal Reserve creates money (through mechanisms like quantitative easing, repo operations, or simply buying government bonds), it increases the supply of dollars. More dollars chasing the same goods = higher prices.

              **But here's the trick:** the new money doesn't reach everyone equally.

              **The Cantillon Effect:** Named after 18th-century economist Richard Cantillon, this describes how newly created money benefits those CLOSEST to the money creation first. Banks, large corporations, and asset holders get the new money before prices rise. By the time it reaches workers and consumers, prices have already increased.

              **In plain English:**
              1. Fed creates $4.5 trillion (as in 2020-2021)
              2. Banks and corporations get it first → buy assets → prices soar
              3. Stock market hits record highs → rich get richer
              4. Eventually prices rise on groceries, gas, rent → you pay more
              5. Your wages lag behind → you get poorer in real terms

              **This is wealth transfer by design.** Not conspiracy — mechanism. The Fed doesn't hide this. They just describe it in language designed to put you to sleep: "quantitative easing," "monetary policy normalization," "balance sheet adjustment."

              **Translation:** We printed trillions. The rich got it first. You got the inflation.

              Since 1971 (end of gold standard):
              - CEO pay: up 1,460%
              - Worker pay: up 18%
              - Housing: up 1,500%+
              - College: up 1,200%+
              - Healthcare: up 2,500%+
              - The dollar: down 98%

              🔥 **Inflation isn't something that 'happens.' It's something that's DONE to you. And the people doing it are the ones who benefit from it.**
              """,
            keyInsight:
              "Inflation is wealth transfer, not a natural force. The Cantillon Effect means new money reaches banks and corporations first (who buy assets), then trickles to workers (who pay higher prices). Since 1971: CEO pay up 1,460%, worker pay up 18%. That gap IS the mechanism.",
            practice:
              "Calculate your REAL wage: take your salary, subtract the actual cost increases in your rent/mortgage, food, insurance, and transportation. Are you actually making more — or less?",
            interactiveElement: .comparison(
              left: "Since 1971 — UP",
              right: "Since 1971 — DOWN",
              rows: [
                (leftVal: "CEO pay: +1,460%", rightVal: "Dollar value: -98%"),
                (leftVal: "Housing: +1,500%", rightVal: "Worker purchasing power: -85%"),
                (leftVal: "College: +1,200%", rightVal: "Savings rate: -75%"),
                (leftVal: "Healthcare: +2,500%", rightVal: "Manufacturing jobs: -33%"),
                (leftVal: "Corporate profits: record highs", rightVal: "Union membership: -67%"),
              ]
            )
          ),
          ACLesson(
            id: "md2_2",
            title: "The Debt Trap Design",
            content: """
              **The modern economy runs on debt. That's not a bug — it's the architecture.**

              **Student Loans:** You're told education is the path to success. So you take on $30,000-$100,000+ in debt before you've earned your first real paycheck. This debt CANNOT be discharged in bankruptcy (thanks to legislation lobbied for by banks). You start adult life in a hole — and spend decades climbing out.

              **Credit Cards:** Average American household carries $7,000+ in credit card debt at 20%+ interest. At minimum payments, a $5,000 balance takes 25+ years to pay off and costs $12,000+ in interest. The minimum payment is designed to maximize interest extraction, not to help you pay it off.

              **Mortgages:** A 30-year mortgage at 7% means you pay roughly 2.5x the home's purchase price. A $300,000 home costs $720,000. The bank creates the $300,000 from nothing (fractional reserve), and you pay back $720,000 in real labor. This is the most accepted form of wealth extraction in existence.

              **Auto Loans:** Average new car loan is $40,000+ at 7+ years. The car depreciates immediately. You're underwater the moment you drive off the lot. But the payment is "affordable" — which is the design. Make the monthly number palatable so nobody questions the total cost.

              **The Pattern:**
              - Make essential things (education, housing, transportation, healthcare) expensive enough to REQUIRE debt
              - Make debt easy to access and hard to escape
              - Extract interest for decades
              - Repeat

              **The total US consumer debt is $17+ trillion.** That's not mismanagement by individuals. That's a system designed to keep the majority in perpetual debt service — working to pay interest, not to build wealth.

              🔥 **Debt isn't a personal failure. It's an engineered condition. The system needs debtors the way a factory needs workers. Understanding this changes how you make every financial decision.**
              """,
            keyInsight:
              "The debt system is architecturally designed to require debt for basic needs (education, housing, transport, health), make it easy to access and hard to escape, then extract interest for decades. $17+ trillion in US consumer debt isn't individual failure — it's systemic design.",
            practice:
              "List every debt you have. For each one, calculate the TOTAL cost including interest. How much of your lifetime labor is going to interest payments? This number is the price of not understanding the system."
          ),
        ]
      ),

      // ═══════════════════════════════════════════════════════════
      // MODULE 3: FINANCIAL SELF-DEFENSE
      // ═══════════════════════════════════════════════════════════

      ACModule(
        id: "md3", number: 3,
        title: "Financial Self-Defense",
        subtitle: "What they don't want you to know",
        icon: "shield.checkered",
        lessons: [
          ACLesson(
            id: "md3_1",
            title: "Paper vs Real: Understanding Asset Classes",
            content: """
              **There are two kinds of assets in this world: things that exist, and promises that something exists.**

              **PAPER ASSETS (promises):**
              - **Cash/Dollars:** A promise from the Federal Reserve that this paper has value. Backed by faith.
              - **Stocks:** A promise that you own a fraction of a company. You don't hold anything physical.
              - **Bonds:** A promise that a government or corporation will pay you back with interest.
              - **401k/IRA:** A collection of promises (stocks + bonds) that you can't touch without penalty until you're 59½.

              These work great — until they don't. In 1929, stocks lost 89%. In 2008, housing-backed securities became worthless overnight. Confederate dollars, Continental currency, Weimar marks, Zimbabwe dollars — all promises that evaporated.

              **REAL ASSETS (things that exist):**
              - **Precious metals (gold, silver):** Have held value for 5,000+ years. Central banks are buying record amounts RIGHT NOW.
              - **Land/Real estate you own:** Not a mortgage — actual ownership. Produces value regardless of currency.
              - **Skills:** No one can confiscate your ability to grow food, repair things, code, heal, or create.
              - **Tools of production:** Equipment, workshops, gardens, anything that produces tangible value.
              - **Community:** The oldest form of wealth. People who have your back when systems fail.

              **You don't need to choose one or the other.** The point is AWARENESS. If 100% of your wealth is in paper assets, you are 100% dependent on the system continuing exactly as it is. History says it won't.

              **The Rule of Thirds (simplified):**
              - ⅓ in the system (cash, retirement accounts, stocks — for daily life and growth)
              - ⅓ in real assets (precious metals, owned property, tools, stored essentials)
              - ⅓ in yourself (skills, health, education, relationships, community)

              This isn't financial advice. It's historical pattern recognition. Every monetary reset destroyed paper and preserved real.

              🔥 **Diversification isn't about getting rich. It's about making sure no single point of failure can wipe you out. Central banks diversify. Billionaires diversify. Why wouldn't you?**
              """,
            keyInsight:
              "Paper assets (cash, stocks, bonds, 401k) are promises that work until they don't. Real assets (precious metals, owned land, skills, tools, community) have survived every monetary reset in history. Diversification isn't about getting rich — it's about not having a single point of failure.",
            practice:
              "Honestly assess: what percentage of your wealth is paper (bank accounts, retirement, stocks) vs. real (owned property, metals, skills, tools)? You don't need to change anything yet — just KNOW where you stand.",
            interactiveElement: .comparison(
              left: "Paper Assets (Promises)",
              right: "Real Assets (Things)",
              rows: [
                (
                  leftVal: "Cash — backed by faith", rightVal: "Gold/Silver — backed by 5,000 years"
                ),
                (
                  leftVal: "Stocks — can lose 89% (1929)",
                  rightVal: "Land — produces regardless of markets"
                ),
                (
                  leftVal: "Bonds — dependent on issuer paying",
                  rightVal: "Skills — no one can confiscate these"
                ),
                (leftVal: "401k — locked until 59½", rightVal: "Tools — produce value immediately"),
                (
                  leftVal: "Crypto — volatile, hackable",
                  rightVal: "Community — oldest wealth on Earth"
                ),
              ]
            )
          ),
          ACLesson(
            id: "md3_2",
            title: "Practical Steps — Start Where You Are",
            content: """
              **This is not about becoming a financial guru overnight. It's about starting with awareness and building from there.**

              **LEVEL 1: AWARENESS (Week 1-2)**
              - Know your EXACT income and expenses (most people don't)
              - Calculate your actual savings rate (income minus ALL expenses, divided by income)
              - List every debt: amount, interest rate, monthly payment, total cost
              - Check your credit report (free at annualcreditreport.com)
              - Read your bank's terms of service (yes, really)

              **LEVEL 2: DEFENSE (Month 1-3)**
              - Build an emergency fund: 3-6 months of expenses in cash
              - Pay off highest-interest debt first (usually credit cards)
              - Stop taking on NEW consumer debt (the single most powerful thing you can do)
              - Understand the difference between a NEED and a WANT
              - Start tracking where every dollar goes

              **LEVEL 3: POSITIONING (Month 3-12)**
              - Research precious metals (start with a single silver coin if that's what you can afford)
              - Learn one skill that creates value independent of your job
              - Build relationships with your neighbors (this IS financial preparation)
              - Start a small emergency food supply (not prepping — just not being one crisis away from the grocery store)
              - If you have retirement accounts, understand what they're actually invested in

              **LEVEL 4: SOVEREIGNTY (Ongoing)**
              - Multiple income streams (even small ones)
              - Own at least ONE thing that produces value (a garden, a tool, a skill-based business)
              - Understand basic investing (not tips — principles)
              - Teach someone else what you've learned (this solidifies your knowledge)
              - Vote with your dollars: where you spend is who you support

              **CRITICAL RULE:** Don't make changes from FEAR. Make them from KNOWLEDGE. Panic-selling your 401k or buying gold bars with rent money is worse than doing nothing. Move deliberately. Think in years, not days.

              🔥 **Financial sovereignty doesn't mean being rich. It means no single entity — bank, government, employer, or algorithm — has total control over your economic life. That's freedom. Start building it one step at a time.**
              """,
            keyInsight:
              "Financial sovereignty is a progression, not a destination. Start with awareness (know your numbers), move to defense (emergency fund, kill high-interest debt), then positioning (real assets, skills, community), then sovereignty (multiple income streams, production capacity). Don't act from fear — act from knowledge.",
            practice:
              "Pick ONE action from Level 1 and do it TODAY. Just one. Know your exact monthly expenses. Or calculate your savings rate. Or look at your credit report. The first step is always awareness."
          ),
        ]
      ),

      // ═══════════════════════════════════════════════════════════
      // MODULE 4: THE MONEY THEY DON'T WANT YOU TO UNDERSTAND
      // ═══════════════════════════════════════════════════════════

      ACModule(
        id: "md4", number: 4,
        title: "Follow the Money",
        subtitle: "How money controls everything else",
        icon: "magnifyingglass",
        lessons: [
          ACLesson(
            id: "md4_1",
            title: "The Real Power Structure",
            content: """
              **Want to understand ANY political decision? Follow the money. It's never wrong.**

              **WHO ACTUALLY CONTROLS THE MONEY?**

              The Federal Reserve is owned by member banks. Its board is appointed by the President but operates independently. It is not audited in the way other government agencies are. It has never been fully audited. The one partial audit in 2011 revealed $16 trillion in secret bailout loans during the 2008 crisis — money that went to banks worldwide with no public knowledge or consent.

              **HOW LOBBYING WORKS:**

              1. Corporation identifies profitable legislation (tax break, deregulation, subsidy)
              2. Corporation donates to campaigns and funds Super PACs
              3. Corporation hires former Congress members as lobbyists (revolving door)
              4. Legislation passes — written by industry lawyers, voted on by funded politicians
              5. Corporation earns $200+ for every $1 spent on lobbying
              6. Repeat

              **WHO OWNS EVERYTHING?**

              Three asset management firms — BlackRock, Vanguard, and State Street — collectively manage $20+ TRILLION in assets. They are the largest shareholders in nearly every major corporation in America: Apple, Microsoft, Amazon, JPMorgan, ExxonMobil, Pfizer, all major media companies.

              They own significant stakes in companies that are supposed to be COMPETING with each other. This means the same owners sit behind Coca-Cola AND Pepsi, Boeing AND Lockheed, Fox AND Disney.

              Competition is theater. Ownership is real.

              **THE REVOLVING DOOR:**
              - Treasury Secretaries come from Goldman Sachs
              - FDA commissioners go to pharmaceutical companies
              - FCC commissioners go to telecom companies
              - Pentagon officials go to defense contractors

              The people regulating industries ARE the industry. Then they go back. Then they regulate again.

              🔥 **Understanding money isn't about becoming cynical. It's about seeing clearly. When you understand who controls the money, every headline makes more sense. Every policy makes more sense. Everything you thought was random starts looking like a pattern.**
              """,
            keyInsight:
              "Three firms (BlackRock, Vanguard, State Street) manage $20+ trillion and are the largest shareholders in nearly every major corporation. The revolving door between government and industry means the regulators ARE the industry. Following the money reveals the pattern behind every policy decision.",
            practice:
              "Pick any recent legislation that confused you. Search: 'Who lobbied for [bill name]' at OpenSecrets.org. The donor list will explain the vote better than any news analysis."
          ),
          ACLesson(
            id: "md4_2",
            title: "What Central Banks Are Doing Right Now",
            content: """
              **If you want to know where the economy is going, don't watch the news. Watch what central banks DO — not what they say.**

              **WHAT THEY'RE SAYING:**
              "The economy is resilient. Inflation is under control. The banking system is sound. There's no need for concern."

              **WHAT THEY'RE DOING:**
              - Buying gold at record rates (3,200+ tons in 2022-2024 — highest in decades)
              - China has been quietly increasing gold reserves every month
              - Russia moved to gold-backed trade for key commodities
              - Multiple nations repatriating gold from foreign vaults (Germany, Netherlands, Hungary, Poland)
              - BRICS nations building settlement systems that bypass the dollar

              **The cognitive dissonance is deafening:** If the dollar is strong and the economy is fine, why are the people who PRINT dollars converting them to gold?

              **What gold represents:**
              Gold has been money for 5,000 years. It cannot be printed. It cannot be created by typing numbers into a computer. It cannot be inflated away. It doesn't require trust in any institution. When central banks buy gold, they are hedging against the very system they manage.

              **This doesn't mean you should panic-buy gold.** It means you should pay attention to what the most powerful financial institutions on Earth are doing with their own money — and ask whether your strategy should at least partially overlap with theirs.

              **The Takeaway:**
              Words are cheap. Actions cost money. When someone's words and actions contradict each other, always trust the actions. Central banks are saying "everything is fine" while acting like something is coming. At minimum, this warrants your attention.

              🔥 **Don't do what they SAY. Do what they DO. When the people who create money start converting it to gold, that IS the signal.**
              """,
            keyInsight:
              "Central banks are saying 'everything is fine' while buying gold at record rates, repatriating reserves, and building dollar alternatives. When words and actions contradict, always trust the actions. The institutions that print money are hedging against the money they print.",
            practice:
              "Search: 'World Gold Council central bank demand [current year]' and read the actual report. Then search 'Federal Reserve balance sheet.' Compare what they say in press conferences with what the numbers show.",
            interactiveElement: .inversionTable(rows: [
              (told: "The economy is resilient", truth: "National debt growing $1T every 100 days"),
              (told: "Inflation is under control", truth: "Groceries up 25%+ since 2020"),
              (told: "The banking system is sound", truth: "3 major banks collapsed in 2023"),
              (told: "The dollar is strong", truth: "Central banks buying gold at record rates"),
              (
                told: "There's no need for concern",
                truth: "BRICS building dollar alternatives for 40%+ of world population"
              ),
            ])
          ),
        ]
      ),

      // ═══════════════════════════════════════════════════════════
      // MODULE 5: CONNECTING THE DOTS
      // ═══════════════════════════════════════════════════════════

      ACModule(
        id: "md5", number: 5,
        title: "The Bigger Picture",
        subtitle: "Money, consciousness, and freedom",
        icon: "sun.max.fill",
        lessons: [
          ACLesson(
            id: "md5_1",
            title: "Money Is a Consciousness Tool",
            content: """
              **Here's what most financial education misses: money is not just economics. It's consciousness.**

              **Money as Control:**
              The word "mortgage" comes from French: *mort* (death) + *gage* (pledge). A death pledge. You literally sign a death pledge to own a home. Language encodes truth.

              The word "currency" comes from Latin *currere* — to flow. Money is supposed to FLOW, not be hoarded. When it pools at the top and stops flowing, the system dies — like blood that stops circulating.

              **Money as Programming:**
              Your relationship with money was programmed before you were conscious of it:
              - "Money is the root of all evil" (misquote — the actual verse says "LOVE of money")
              - "Money doesn't grow on trees" (scarcity programming)
              - "You have to work hard for money" (labor = worth programming)
              - "Rich people are greedy" (anti-wealth programming that keeps you poor while the wealthy ignore it)

              These beliefs keep you in a specific relationship with money: afraid of it, ashamed of wanting it, guilty for having it, and ignorant of how it works. This is not accidental. People who understand money and feel empowered around it are harder to control.

              **Money as Sovereignty:**
              True financial sovereignty is a consciousness state. It's not about the number in your account — it's about:
              - Understanding the system you operate in
              - Making choices from knowledge, not fear
              - Producing value, not just consuming
              - Building resilience against systemic shocks
              - Sharing knowledge so others can be sovereign too

              **The Gnostic Connection:**
              The Gnostics taught that the Demiurge (false god) created a prison of matter to trap divine sparks. The modern financial system operates on the same principle: create a prison of debt to trap productive humans. The way out is the same in both cases — **gnosis**. Direct knowledge. Seeing the system clearly.

              The Federal Reserve is the financial Demiurge. Debt is the material prison. Financial literacy is gnosis. Sovereignty is liberation.

              🔥 **Money is the last taboo. People will talk about their sex life before they'll talk about their finances. Break the taboo. Learn the system. Teach others. That's how empires of control fall — one awakened mind at a time.**
              """,
            keyInsight:
              "Money operates as both a control mechanism and a consciousness tool. Your beliefs about money were programmed (scarcity, shame, ignorance) to keep you manageable. Financial literacy is a form of gnosis — seeing the prison clearly is the first step to freedom. The Demiurge parallel is exact: debt = matter trap, knowledge = liberation.",
            practice:
              "Write down every belief you have about money. Where did each one come from? Parents? School? Media? Church? For each belief, ask: does this belief serve ME, or does it serve the system that benefits from my ignorance?"
          )
        ]
      ),
    ],
    sources: [
      "Federal Reserve: federalreserve.gov (balance sheet, FOMC minutes)",
      "Congressional Budget Office: cbo.gov (debt projections, budget analysis)",
      "Bureau of Labor Statistics: bls.gov (inflation data, wage statistics)",
      "World Gold Council: gold.org (central bank demand reports)",
      "OpenSecrets.org (lobbying data, campaign finance)",
      "FRED (Federal Reserve Economic Data): fred.stlouisfed.org",
      "Economic Policy Institute: epi.org (productivity vs wage data)",
      "William Strauss & Neil Howe, 'The Fourth Turning' (1997) — companion course available in Alexandria",
      "G. Edward Griffin, 'The Creature from Jekyll Island' (history of the Federal Reserve)",
      "Richard Cantillon, 'Essay on the Nature of Commerce' (Cantillon Effect)",
    ],
    dragonComment:
      "They'll teach you the lifecycle of a frog before they teach you how money works. Because a frog that understands money asks questions. A frog that doesn't just keeps working."
  )
}
