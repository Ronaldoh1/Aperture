// FourthTurningCourse.swift
// THE FOURTH TURNING — Winter Is Here
// ☀️ SunFlow: Reignited
//
// Based on William Strauss & Neil Howe's "The Fourth Turning" (1997)
// A course that walks users through the 80-year cycle theory,
// generational archetypes, and practical navigation of the current crisis.
//
// "History doesn't repeat, but it rhymes in 80-year cycles."

import SwiftUI

struct FourthTurningCourse {
    
    static let course = AlexandriaCourse(
        id: "fourth_turning",
        title: "The Fourth Turning",
        subtitle: "Winter Is Here — The 80-Year Cycle",
        icon: "clock.arrow.2.circlepath",
        colorHex: "#2C3E50",
        tier: 2,
        isPremium: false,
        isUltraPremium: false,
        modules: [
            
            // ═══════════════════════════════════════════════════════════
            // MODULE 1: THE CYCLE
            // ═══════════════════════════════════════════════════════════
            
            ACModule(
                id: "ft1", number: 1,
                title: "The 80-Year Clock",
                subtitle: "History doesn't repeat — it rhymes",
                icon: "clock.arrow.2.circlepath",
                lessons: [
                    ACLesson(
                        id: "ft1_1",
                        title: "The Pattern Nobody Teaches You",
                        content: """
**In 1997, two historians named William Strauss and Neil Howe published a book that predicted — with eerie accuracy — the world you're living in right now.**

The book was called *The Fourth Turning*. Its thesis is simple and devastating:

**History moves in cycles of roughly 80 years — the length of a long human life.** Each cycle (called a *saeculum*) has four phases, like seasons:

☀️ **SPRING — The High** (~20 years)
Post-crisis renewal. Institutions are strong. Conformity is high. Optimism everywhere. Think: the 1950s after WWII. Suburbs, baby boom, "we can do anything."

🌸 **SUMMER — The Awakening** (~20 years)
The children of Spring rebel. Spiritual seeking. Individualism. Culture wars begin. Think: the 1960s-70s. Counterculture, civil rights, Woodstock, "question everything."

🍂 **FALL — The Unraveling** (~20 years)
Institutions weaken. Trust collapses. Individualism peaks. Culture fragments. Think: the 1990s-2000s. Culture wars, political gridlock, "bowling alone."

❄️ **WINTER — The Crisis (Fourth Turning)** (~20 years)
Everything breaks. Institutions are destroyed and rebuilt. Society faces an existential test. Think: Revolutionary War, Civil War, Great Depression/WWII.

**And right now? We're in Winter.**

The Fourth Turning began around 2008 (financial crisis) and is predicted to climax between 2025-2033. Look around. Does this feel like Spring to you?

🔥 **This isn't doom. Every Winter ends. But how you navigate it determines whether you emerge in a new Spring — or get buried in the snow.**
""",
                        keyInsight: "History moves in 80-year cycles with four seasons. We're currently in Winter (the Fourth Turning), a crisis phase predicted to climax 2025-2033. This has happened before — and every time, society was rebuilt stronger.",
                        practice: "Count back 80 years from major crises: 2008 → 1929 (Depression), 1860 (Civil War), 1776 (Revolution). The pattern is real. What does that mean for what comes next?"
                    ),
                    ACLesson(
                        id: "ft1_2",
                        title: "The Evidence Is Everywhere",
                        content: """
**Every Fourth Turning in Anglo-American history looks the same.** Not the details — the *pattern*:

**American Revolution (1773-1794)**
- Catalyst: Tea Act / Stamp Act (economic squeeze)
- Crisis: Colonial institutions destroyed, new ones built
- Resolution: Constitution. New republic. New currency.
- Reset: Continental dollars → US Dollar

**Civil War (1860-1865)**
- Catalyst: Bleeding Kansas / Dred Scott (moral + political crisis)
- Crisis: Nation literally splits. 600,000+ dead.
- Resolution: Union preserved. Slavery abolished. Industrial age begins.
- Reset: Greenbacks. National banking system.

**Great Depression / WWII (1929-1945)**
- Catalyst: Stock market crash (financial system collapses)
- Crisis: Global depression. Rise of fascism. World war.
- Resolution: UN, Bretton Woods, Marshall Plan. American superpower era.
- Reset: Gold standard → Bretton Woods. Dollar becomes world reserve currency.

**Current Fourth Turning (2008-~2033)**
- Catalyst: Financial crash. Housing crisis. Trust evaporates.
- Crisis: Pandemic. Political polarization. Institutional collapse. AI disruption. Wars.
- Resolution: ???
- Reset: Dollar → ???

Notice the pattern:
1. A financial/moral catalyst
2. Institutional destruction
3. A generation forged in the fire
4. **A monetary reset every single time**

**The question isn't IF this is happening. It's: what will YOU do during Winter?**
""",
                        keyInsight: "Every Fourth Turning ends with institutional destruction AND rebuilding, including a complete monetary reset. Continental dollars, Greenbacks, Bretton Woods — each crisis created a new financial system. The current system was built in 1944. It's 80 years old.",
                        practice: "Open your Timeline in Aperture. Find: Federal Reserve (1913), Gold Standard End (1971), Reaganomics (1980). These aren't random events — they're the Unraveling that led to the current Winter.",
                        interactiveElement: .timeline(events: [
                            (year: "1773", event: "Tea Act sparks Revolution", significance: "Economic squeeze → political crisis → new nation"),
                            (year: "1860", event: "Lincoln elected, South secedes", significance: "Moral crisis → civil war → institutional rebirth"),
                            (year: "1929", event: "Stock market crash", significance: "Financial collapse → world war → Bretton Woods reset"),
                            (year: "2008", event: "Housing crash, bank bailouts", significance: "Financial collapse → ??? → monetary reset coming"),
                        ])
                    ),
                ]
            ),
            
            // ═══════════════════════════════════════════════════════════
            // MODULE 2: THE GENERATIONS
            // ═══════════════════════════════════════════════════════════
            
            ACModule(
                id: "ft2", number: 2,
                title: "The Four Archetypes",
                subtitle: "Which generation are you?",
                icon: "person.3.fill",
                lessons: [
                    ACLesson(
                        id: "ft2_1",
                        title: "Why Generations Matter",
                        content: """
**Strauss and Howe didn't just identify the seasons. They identified WHO drives each season — and why the cycle keeps repeating.**

The answer: **generational memory fades.** The people who lived through the LAST crisis die, and with them dies the visceral memory of what it felt like. New generations make the same mistakes because they've never felt the consequences.

Four generational archetypes repeat in the same order, every cycle:

**🔮 PROPHET (Boomers today)**
Born in Spring. Raised in comfort and optimism. Become idealistic rebels in Summer (1960s counterculture). In Winter, they're the elder visionaries — either wise guides or stubborn moralists who can't let go of their culture wars.

**⚔️ NOMAD (Gen X today)**
Born in Summer. Raised in chaos — latchkey kids, divorce epidemic, "figure it out yourself." Become pragmatic survivors. In Winter, they're the middle-aged leaders who actually get things done because they've been self-reliant their whole lives.

**🛡️ HERO (Millennials today)**
Born in the Unraveling. Overprotected as kids ("helicopter parents"). In Winter, they're the young adults who FIGHT — the generation that storms the beach, builds the new institutions, makes the sacrifices. The GI Generation of WWII was the last Hero archetype.

**🎨 ARTIST (Gen Z today)**
Born IN the crisis. Overprotected during turmoil. They grow up sensitive, adaptive, process-oriented. After Winter, they become the facilitators who humanize whatever the Heroes built. The Silent Generation was the last Artist archetype.

**You are not random. Your generation has a role. The question is whether you play it consciously or get swept along.**
""",
                        keyInsight: "Generational archetypes repeat every 80 years in the same order: Prophet → Nomad → Hero → Artist. Each has a specific role during crisis. Millennials are the current Hero generation — destined to rebuild, just like the GI Generation rebuilt after WWII.",
                        practice: "Identify your archetype. Boomer? You're the Prophet — your role is wisdom, not culture wars. Gen X? You're the Nomad — lead with pragmatism. Millennial? You're the Hero — build. Gen Z? You're the Artist — observe, adapt, humanize.",
                        interactiveElement: .comparison(
                            left: "Last Cycle (1940s)",
                            right: "This Cycle (2020s)",
                            rows: [
                                (leftVal: "Missionary Gen (Prophets/elders)", rightVal: "Baby Boomers (Prophets/elders)"),
                                (leftVal: "Lost Generation (Nomads/midlife)", rightVal: "Gen X (Nomads/midlife)"),
                                (leftVal: "GI Generation (Heroes/young)", rightVal: "Millennials (Heroes/young)"),
                                (leftVal: "Silent Gen (Artists/children)", rightVal: "Gen Z (Artists/children)"),
                            ]
                        )
                    ),
                    ACLesson(
                        id: "ft2_2",
                        title: "The Behavioral Sink",
                        content: """
**In the 1960s, scientist John B. Calhoun built a "mouse utopia" — a perfect habitat with unlimited food, water, and shelter. No predators. No scarcity. Paradise.**

The mice thrived... at first. Population boomed. Then something terrible happened.

**Phase 1: Overcrowding.** Mice began competing for social roles even though resources were abundant.

**Phase 2: Withdrawal.** Some mice stopped engaging entirely — Calhoun called them "the beautiful ones." They groomed themselves obsessively but never fought, never mated, never engaged with society. Sound familiar?

**Phase 3: Collapse.** Birth rates plummeted. Aggression spiked. Social bonds disintegrated. The population crashed to extinction — not from scarcity, but from **the death of purpose.**

Calhoun called this the "behavioral sink."

**Now look at today:**
- Record anxiety and depression, especially in youth
- Birth rates collapsing across developed nations
- Social media creating "beautiful ones" who perform but don't connect
- Trust in every institution at historic lows
- Loneliness epidemic despite being more "connected" than ever

**This isn't a coincidence.** Strauss and Howe predicted exactly this — the Unraveling creates social decay that makes the Crisis both necessary and purposeful.

The crisis isn't the disease. **The crisis is the cure.** It forces reconnection, purpose, sacrifice, and cooperation — the very things the behavioral sink destroyed.

**Winter doesn't just break things. It burns away what was already dead.**
""",
                        keyInsight: "Calhoun's mouse utopia experiment shows that abundance without purpose leads to societal collapse — 'beautiful ones' who disengage entirely. Today's anxiety epidemic, birth rate decline, and social disconnection mirror this pattern exactly. The Fourth Turning crisis forces re-engagement.",
                        practice: "Honest self-assessment: are you engaging with real community, or performing for algorithms? Are you building something, or just consuming? The behavioral sink is optional — but only if you choose to opt out."
                    ),
                ]
            ),
            
            // ═══════════════════════════════════════════════════════════
            // MODULE 3: THE ECONOMY
            // ═══════════════════════════════════════════════════════════
            
            ACModule(
                id: "ft3", number: 3,
                title: "While You Were Distracted",
                subtitle: "The economic reality nobody's covering",
                icon: "banknote.fill",
                lessons: [
                    ACLesson(
                        id: "ft3_1",
                        title: "The Monetary Reset Is Coming",
                        content: """
**Every Fourth Turning ends with a monetary reset.** Not maybe. Not sometimes. EVERY. SINGLE. TIME.

Here's what happened to money during each American crisis:

**Revolution (1780s):** Continental dollars became worthless. New currency system created.

**Civil War (1860s):** Greenbacks issued. National banking system established. Money fundamentally restructured.

**WWII (1940s):** Bretton Woods agreement. Dollar pegged to gold. Dollar becomes world reserve currency. Every other currency pegged to the dollar.

**Now (2020s-2030s):** The Bretton Woods system is 80 years old — one full saeculum. And it's showing cracks everywhere:

💰 **National debt: $36+ trillion** and accelerating. The interest alone exceeds the defense budget.

💰 **Central banks hoarding gold:** 3,200+ tons purchased 2022-2024. The highest rate in decades. They're not buying gold because they think the dollar is fine.

💰 **BRICS nations building alternatives:** China, Russia, India, Brazil, South Africa actively creating dollar alternatives. De-dollarization is not conspiracy — it's published policy.

💰 **Dollar purchasing power:** Has lost 98% since 1971 (when Nixon ended gold backing). Your grandparents' $1 buys $0.02 today.

💰 **Real wages stagnant since 1971:** Productivity went up 250%. Wages went up 16%. Where did the difference go? Follow the money.

**While you argue about left vs. right, the monetary system that governs your ENTIRE economic life is being restructured. The people restructuring it are not asking your opinion.**

🔥 **This is not fear-mongering. This is documented history repeating on schedule. The question isn't IF a reset happens — it's what form it takes and whether you're positioned for it.**
""",
                        keyInsight: "Every Fourth Turning produces a monetary reset. The current dollar system (Bretton Woods, 1944) is 80 years old — one full cycle. Central banks are hoarding gold at record rates. BRICS nations are building dollar alternatives. The reset is not coming — it's already started.",
                        practice: "Check: how much of your wealth is in 'paper promises' (dollars, stocks, bonds) vs. real assets (skills, land, precious metals, community)? You don't need to panic-sell anything. Just know where you stand."
                    ),
                    ACLesson(
                        id: "ft3_2",
                        title: "What They Don't Want You Watching",
                        content: """
**While the news cycle keeps you angry about tweets, these things are happening RIGHT NOW:**

📊 **The Federal Reserve** — An unelected institution controls the money supply, interest rates, and effectively the entire economy. Created in 1913 (your Timeline has this). They printed $4.5 trillion during COVID. Where did it go? Asset prices soared — making the wealthy wealthier while your groceries got more expensive.

📊 **Corporate consolidation** — In the 1980s, 50 companies controlled most U.S. media. Today: 6. In healthcare, banking, agriculture, tech — the same pattern. Fewer companies means less competition means higher prices means you pay more for everything.

📊 **Lobbying** — For every $1 spent on lobbying, corporations see $200+ in favorable legislation. The pharmaceutical industry alone spends $300M+ annually. This determines drug prices, patent laws, and healthcare policy more than any election.

📊 **Housing** — Corporate investors now own 25%+ of single-family home purchases in some markets. BlackRock, Vanguard, and others are converting the American Dream into a subscription model. You'll rent from corporations forever.

📊 **Your pension and 401k** — These are invested in the same markets that crashed in 1929, 2000, and 2008. When the next correction comes (every Fourth Turning has one), the people closest to retirement get hit hardest.

📊 **CBDC (Central Bank Digital Currency)** — Multiple countries are developing or piloting digital currencies that give central authorities complete visibility and control over every transaction. This isn't science fiction — China's already running it.

**None of this is partisan.** Both parties benefit from you being distracted by culture wars. Culture wars are FREE. Fixing the economy costs money that goes to donors.

🔥 **The economy isn't broken. It's working EXACTLY as designed — just not for you. Understanding this is the first step to navigating it.**
""",
                        keyInsight: "While media keeps you focused on partisan theater, the actual economy is being restructured: unprecedented money printing, corporate consolidation, lobbying ROI of 200:1, housing financialization, and CBDC development. None of this is partisan — both parties benefit from your distraction.",
                        practice: "This week, spend 30 minutes reading about ONE of these topics from a primary source (Fed statements, SEC filings, CBO reports) instead of from someone's reaction tweet. Primary sources change everything."
                    ),
                ]
            ),
            
            // ═══════════════════════════════════════════════════════════
            // MODULE 4: WHAT TO DO
            // ═══════════════════════════════════════════════════════════
            
            ACModule(
                id: "ft4", number: 4,
                title: "Navigating Winter",
                subtitle: "The must-do's and must-don'ts",
                icon: "shield.checkered",
                lessons: [
                    ACLesson(
                        id: "ft4_1",
                        title: "The 6 Things You MUST Do",
                        content: """
**This is not about prepping bunkers or buying gold coins from TV ads. This is about historically-informed positioning for the cycle you're already in.**

**1. DIVERSIFY INTO REAL ASSETS**
Every monetary reset destroys paper wealth. Continental dollars, Confederate money, Weimar marks, Zimbabwe dollars — paper promises burn. Real assets survive: precious metals, productive land, essential businesses, practical tools. You don't need to go all-in. Even 10-20% in real assets is insurance against the reset.

Central banks bought 3,200+ tons of gold in 2022-2024. Ask yourself: if the dollar is fine, why are the people who print dollars buying gold?

**2. BUILD COMMUNITY**
The GI Generation survived the Depression because neighbors helped neighbors. Isolation kills — Calhoun's mice proved it, and today's loneliness epidemic confirms it. Invest in relationships. Know your neighbors. Join local organizations. During every crisis, the people with strong networks survive. The individuals don't.

**3. DEVELOP REAL SKILLS**
Credentials expire. Skills don't. Learn to grow food, repair things, manage your health, understand basic finance, create something useful. During WWII, the home front produced victory gardens, repaired equipment, and mobilized communities. What can YOU produce if the supply chain hiccups?

**4. STAY INFORMED BUT GROUNDED**
Use Signal vs Noise (you have this tool in Aperture). Read primary sources, not reactions. Understand the difference between information and fear-mongering. The person selling you panic is usually selling you something else too.

**5. PLANT SEEDS FOR RENEWAL**
Every Winter ends. The people who planted seeds DURING the crisis shaped the Spring that followed. What do you want the world to look like after this? Start building it now. Start small. Start local. But START.

**6. HEDGE PRUDENTLY**
Position yourself for multiple outcomes. Don't bet everything on collapse. Don't bet everything on continuation. Diversify across scenarios. The future is uncertain — your preparation doesn't have to be.

🔥 **Preparation isn't paranoia. It's pattern recognition. And the pattern is 400 years old.**
""",
                        keyInsight: "Six historically-informed actions: diversify into real assets, build community, develop skills, stay informed, plant seeds for renewal, and hedge across scenarios. These aren't doomsday prep — they're what worked in every previous Fourth Turning.",
                        practice: "Rate yourself 1-5 on each of the six areas. Where are you weakest? That's your starting point. Pick ONE and take a concrete step this week."
                    ),
                    ACLesson(
                        id: "ft4_2",
                        title: "The 6 Things You Must NOT Do",
                        content: """
**What you DON'T do during a Fourth Turning matters as much as what you DO.**

**1. DON'T PANIC**
Panic is the mind-killer. Panic makes you sell at the bottom, buy at the top, hoard things you don't need, and push away people you DO need. The Fourth Turning is not the apocalypse — it's a phase. Every previous one ended. Society didn't collapse. It was REBUILT. Stronger.

**2. DON'T KEEP ALL WEALTH IN PAPER**
This is different from panic-selling. It's strategic diversification. If 100% of your wealth is in dollars, stocks, and bonds — you are 100% dependent on the current system continuing unchanged. History says it won't. Even 10-20% in alternatives is prudent.

**3. DON'T ISOLATE**
This is the "beautiful ones" from Calhoun's experiment — retreating into your apartment, your phone, your feed, your anxiety. Isolation is the behavioral sink. It feels safe. It's actually lethal. The people who survive crises are connected. Period.

**4. DON'T FALL FOR FEAR-MONGERING**
There is an entire economy built on scaring you into buying gold coins, survival supplies, and premium newsletters. Strauss and Howe were academics, not salesmen. Base your decisions on historical patterns, not YouTube thumbnails with red arrows.

**5. DON'T BE PASSIVE**
"I'll just ride it out" is the most dangerous attitude in a Fourth Turning. Passivity during crisis is how you end up in whatever system the ACTIVE people build — and they might not build it with your interests in mind. Participate. Vote locally. Build locally. Create.

**6. DON'T APPLY ONE-SIZE-FITS-ALL**
Your situation is unique. A 25-year-old with no dependents navigates differently than a 55-year-old approaching retirement. Someone in a strong community has different needs than someone isolated in a city. Take the principles and ADAPT them to YOUR life.

🔥 **Fear is the real crisis. Not the economy, not the politics, not the institutions. If you can manage your fear, you can manage anything Winter throws at you.**
""",
                        keyInsight: "Six critical mistakes to avoid: panicking, keeping all wealth in paper assets, isolating (becoming Calhoun's 'beautiful ones'), falling for fear-mongering salesmen, being passive, and applying generic advice without adapting to your situation.",
                        practice: "Which of these six traps are you closest to falling into? Be brutally honest. That's your biggest vulnerability right now.",
                        interactiveElement: .reflectionPrompt(prompts: [
                            "Am I making decisions from fear or from pattern recognition?",
                            "How connected am I to my physical community (not online)?",
                            "What percentage of my wealth is in 'paper promises'?",
                            "Am I building something, or just consuming and reacting?",
                            "If the economy shifted dramatically tomorrow, what would I do in the first week?",
                        ])
                    ),
                ]
            ),
            
            // ═══════════════════════════════════════════════════════════
            // MODULE 5: THE SPRING
            // ═══════════════════════════════════════════════════════════
            
            ACModule(
                id: "ft5", number: 5,
                title: "After Winter Comes Spring",
                subtitle: "Why this is actually good news",
                icon: "sun.max.fill",
                lessons: [
                    ACLesson(
                        id: "ft5_1",
                        title: "The Regeneration",
                        content: """
**Every Fourth Turning in history produced something extraordinary on the other side.**

After the Revolution → The United States of America. The Constitution. The Bill of Rights. The most radical experiment in self-governance in human history.

After the Civil War → The abolition of slavery. The transcontinental railroad. The industrial revolution. America becomes a global power.

After WWII → The United Nations. The middle class. The Space Race. The greatest period of shared prosperity in human history.

**The Fourth Turning doesn't just destroy. It destroys what NEEDS to die so something better can be born.**

What needs to die RIGHT NOW?
- A healthcare system that bankrupts the sick
- An education system that creates debt slaves
- A media ecosystem that profits from division
- A financial system that extracts from the many to enrich the few
- Political institutions captured by donors instead of serving citizens

**These aren't sustainable.** Everyone knows it. Left, right, center — everyone can feel that the current system is broken. The disagreement is about WHAT to replace it with.

That's where YOU come in. Millennials are the Hero generation of this cycle. Gen X provides pragmatic leadership. Gen Z will humanize whatever gets built. Even Boomers — the Prophets — have a role: wisdom, not control.

**The crisis is the chrysalis.** Inside it feels like destruction. From outside, it's metamorphosis.

**The people who plant seeds during Winter harvest in Spring.** What are you planting?

🔥 **You are alive during one of the most transformative moments in the 80-year cycle. This is not a punishment. It's an invitation. Build something worthy of the Spring that's coming.**
""",
                        keyInsight: "Every Fourth Turning produced extraordinary renewal: the Constitution, abolition, the middle class. The current crisis will destroy broken systems (healthcare, education, media, finance) and create space for something better. The question is who builds it — and whether you're one of the builders.",
                        practice: "Write down three things about the current world you'd want to see rebuilt differently. Then ask: what can I do THIS WEEK — even something tiny — to plant a seed toward that future?"
                    ),
                ]
            ),
        ],
        sources: [
            "William Strauss & Neil Howe, 'The Fourth Turning: An American Prophecy' (1997)",
            "William Strauss & Neil Howe, 'Generations: The History of America's Future' (1991)",
            "Neil Howe, 'The Fourth Turning Is Here' (2023)",
            "John B. Calhoun, 'Death Squared: The Explosive Growth and Demise of a Mouse Population' (1973)",
            "Wikipedia: Strauss-Howe Generational Theory",
            "World Gold Council: Central Bank Gold Demand Reports (2022-2024)",
            "Congressional Budget Office: Federal Debt Reports",
        ],
        dragonComment: "1776. 1860. 1929. 2008. Count the gaps. 84 years. 69 years. 79 years. The clock doesn't care about your politics. Winter is here. Plant seeds or freeze."
    )
}
