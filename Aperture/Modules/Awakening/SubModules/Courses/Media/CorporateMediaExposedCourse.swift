// CorporateMediaExposedCourse.swift
// Know who's talking to you - and who pays them
// TV News is not what you think

import SwiftUI

struct CorporateMediaExposedCourse: View {
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                // Header
                courseHeader
                
                // Warning
                warningCard
                
                // Lessons
                ForEach(Array(lessons.enumerated()), id: \.offset) { index, lesson in
                    NavigationLink(destination: MediaLessonView(lesson: lesson, index: index + 1)) {
                        lessonRow(lesson, index: index)
                    }
                }
                
                // Network profiles
                networkProfilesSection
            }
        }
        .background(Color.black.ignoresSafeArea())
        .navigationTitle("Corporate Media Exposed")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private var courseHeader: some View {
        VStack(spacing: 16) {
            ZStack {
                Circle()
                    .fill(Color.red.opacity(0.2))
                    .frame(width: 100, height: 100)
                
                Image(systemName: "tv.fill")
                    .font(.system(size: 44))
                    .foregroundColor(.red)
            }
            
            Text("Corporate Media Exposed")
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(.white)
            
            Text("TV News is a business, not a public service")
                .font(.system(size: 14))
                .foregroundColor(.gray)
            
            HStack {
                Text("10 Lessons")
                    .font(.system(size: 12, weight: .medium))
                    .foregroundColor(.gray)
                Spacer()
                Text("~75 min")
                    .font(.system(size: 12, weight: .medium))
                    .foregroundColor(.gray)
            }
            .padding(.horizontal)
        }
        .padding()
    }
    
    private var warningCard: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(systemName: "lightbulb.fill")
                    .foregroundColor(.yellow)
                Text("Media Literacy Matters")
                    .font(.system(size: 14, weight: .bold))
                    .foregroundColor(.yellow)
            }
            
            Text("This course examines how corporate media operates. Understanding media ownership, business models, and documented failures helps you become a more discerning news consumer.")
                .font(.system(size: 12))
                .foregroundColor(.white.opacity(0.8))
        }
        .padding()
        .background(Color.yellow.opacity(0.1))
        .cornerRadius(12)
        .padding()
    }
    
    private func lessonRow(_ lesson: MediaLesson, index: Int) -> some View {
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
    
    private var networkProfilesSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Quick Network Profiles")
                .font(.system(size: 18, weight: .bold))
                .foregroundColor(.white)
            
            NetworkProfileCard(
                name: "Fox News",
                owner: "Fox Corporation (Murdoch family)",
                classification: "ENTERTAINMENT",
                bias: "Far Right",
                biasColor: .red,
                keyFacts: [
                    "Legally argued Tucker Carlson is not news (court filing)",
                    "$787M Dominion defamation settlement (2023)",
                    "Highest-rated cable news but most misinformation",
                    "Hosts knew election lies were false (court documents)"
                ],
                revenueModel: "Advertising + Cable fees"
            )
            
            NetworkProfileCard(
                name: "MSNBC",
                owner: "NBCUniversal (Comcast)",
                classification: "OPINION",
                bias: "Left/Liberal",
                biasColor: .blue,
                keyFacts: [
                    "Primetime is opinion, not straight news",
                    "Parent company has business interests in policy",
                    "Fired hosts for crossing corporate lines",
                    "Russia coverage often overblown"
                ],
                revenueModel: "Advertising + Cable fees"
            )
            
            NetworkProfileCard(
                name: "CNN",
                owner: "Warner Bros. Discovery",
                classification: "NEWS/OPINION MIX",
                bias: "Center-Left to Center",
                biasColor: .purple,
                keyFacts: [
                    "Shifted right under new ownership (2022)",
                    "Laid off hundreds of journalists",
                    "Prioritizes conflict and drama for ratings",
                    "Town halls with Trump normalized extremism"
                ],
                revenueModel: "Advertising + Cable fees + Streaming"
            )
        }
        .padding()
    }
    
    private var lessons: [MediaLesson] {
        [
            MediaLesson(
                title: "The Business of News",
                subtitle: "Why TV news exists",
                color: .red,
                content: """
                **News Is a Product**
                
                The first thing to understand: TV news is a business. Its purpose is to make money.
                
                ---
                
                **The Business Model:**
                
                **Revenue sources:**
                1. **Advertising** ($40-70 billion/year industry)
                2. **Cable carriage fees** (paid by cable companies)
                3. **Streaming subscriptions** (growing)
                
                **What advertisers want:**
                - Eyeballs (viewers)
                - Engagement (you watching, not changing channel)
                - Specific demographics (age, income)
                
                **What this means:**
                
                News isn't optimized for truth or importance.
                News is optimized for **attention**.
                
                ---
                
                **Attention Economics:**
                
                What gets attention?
                
                ✅ Conflict and drama
                ✅ Fear and outrage
                ✅ Simple narratives (good vs evil)
                ✅ Breaking news alerts
                ✅ Controversy and scandal
                
                What doesn't get attention?
                
                ❌ Nuance and complexity
                ❌ Slow-moving important stories
                ❌ Context and history
                ❌ Stories without villains
                ❌ Good news
                
                ---
                
                **The Result:**
                
                You don't see:
                - Deep analysis of policy
                - International news (unless war/disaster)
                - Labor issues and workers
                - Environmental stories (unless catastrophe)
                - Corporate wrongdoing (advertisers!)
                
                You see constantly:
                - Political horse race coverage
                - Crime and violence
                - Celebrity scandals
                - Whatever sparks outrage today
                
                ---
                
                **Former CBS CEO Les Moonves on Trump (2016):**
                
                > "It may not be good for America, but it's damn good for CBS... The money's rolling in... this is going to be a very good year for us."
                
                He said the quiet part out loud.
                
                ---
                
                **The 24-Hour News Cycle:**
                
                Before cable news:
                - 30 minutes of news per day
                - Editors chose what mattered
                
                Now:
                - 24 hours to fill
                - Everything becomes "BREAKING"
                - Same story repeated endlessly
                - Punditry replaces reporting
                
                **More time doesn't mean more news. It means more filler.**
                """,
                keyTakeaway: "TV news is a business optimized for attention, not truth. Conflict, fear, and outrage get viewers. Nuance and context don't. The business model shapes the content."
            ),
            MediaLesson(
                title: "Who Owns the News",
                subtitle: "6 corporations control 90% of media",
                color: .purple,
                content: """
                **Media Consolidation**
                
                In 1983, 50 companies controlled 90% of American media.
                
                Today, it's **6 companies**.
                
                ---
                
                **The Big Six:**
                
                **1. Comcast**
                - NBCUniversal, MSNBC, CNBC
                - Universal Pictures
                - Also your internet provider (conflict of interest)
                
                **2. Disney**
                - ABC News
                - ESPN
                - Marvel, Star Wars, Pixar
                - Theme parks, cruise lines
                
                **3. Warner Bros. Discovery**
                - CNN
                - HBO
                - Discovery networks
                - DC Comics
                
                **4. Paramount Global (formerly Viacom/CBS)**
                - CBS News
                - MTV, Nickelodeon
                - Paramount Pictures
                
                **5. Fox Corporation**
                - Fox News
                - Fox Broadcasting
                - Local Fox stations
                - (Murdoch family controlled)
                
                **6. News Corp (also Murdoch)**
                - Wall Street Journal
                - New York Post
                - The Times (UK)
                - The Australian
                
                ---
                
                **What This Means:**
                
                **Conflicts of interest:**
                
                Disney owns ABC. Will ABC investigate:
                - Disney labor practices?
                - Disney's China business?
                - Disney's political lobbying?
                
                Comcast owns MSNBC. Will MSNBC investigate:
                - Net neutrality that affects Comcast?
                - Cable industry monopolies?
                - Comcast's political donations?
                
                **The answer is often no.**
                
                ---
                
                **Local News Is Worse:**
                
                **Sinclair Broadcast Group:**
                - Owns 185+ local TV stations
                - Reaches 40% of American households
                - Forces stations to air conservative commentary
                - "Must-run" segments required
                
                **The viral video (2018):**
                
                Dozens of Sinclair anchors reading identical script:
                > "This is extremely dangerous to our democracy."
                
                Word for word. Same script. Different cities.
                
                ---
                
                **Why Consolidation Matters:**
                
                - Fewer owners = fewer perspectives
                - Corporate interests protected
                - Local news gutted
                - Diversity of opinion shrinks
                - Democracy requires informed citizens
                
                ---
                
                **The Telecommunications Act of 1996:**
                
                Signed by Clinton, this law:
                - Removed ownership limits
                - Allowed massive consolidation
                - Promised "competition" (delivered monopoly)
                - Written by media lobbyists
                
                **Before:** Limits on how many stations one company could own
                **After:** Media empires consolidated
                
                This was a policy choice, not inevitable.
                """,
                keyTakeaway: "6 corporations control 90% of American media. Sinclair forces 185+ local stations to air the same scripts. Media consolidation means fewer perspectives and protected corporate interests."
            ),
            MediaLesson(
                title: "Fox News: The Entertainment Empire",
                subtitle: "Not legally news - by their own admission",
                color: .red,
                content: """
                **Fox News: A Case Study**
                
                Fox News is the most-watched cable news network. It's also not legally news—by its own admission in court.
                
                ---
                
                **The Court Cases:**
                
                **Karen McDougal v. Fox News (2020):**
                
                Fox's legal defense for Tucker Carlson:
                
                > "No reasonable viewer would conclude that Carlson was stating actual facts."
                
                The court agreed: Carlson's show is not factual reporting but "rhetorical hyperbole" and "opinion."
                
                **Fox won by arguing they're entertainment, not news.**
                
                ---
                
                **Dominion v. Fox News (2023):**
                
                Dominion Voting Systems sued for defamation over election lies.
                
                **Revealed in discovery:**
                
                Internal messages showed hosts knew claims were false:
                
                **Tucker Carlson:**
                > "Sidney Powell is lying by the way. I caught her. It's insane."
                > "We are very close to being able to ignore Trump most nights."
                
                **Laura Ingraham:**
                > "Sidney is a complete nut."
                
                **Rupert Murdoch:**
                > (On election claims) "Really crazy stuff. And damaging."
                
                **They knew. They broadcast it anyway.**
                
                **Settlement: $787.5 million**
                (Largest defamation settlement in U.S. history)
                
                ---
                
                **The Fox Business Model:**
                
                **Target audience:**
                - Older, white, conservative
                - High engagement (fear keeps people watching)
                - Valuable advertising demographic
                
                **Content strategy:**
                - Confirm existing beliefs
                - Create outrage
                - Us vs them narratives
                - Fear of "the other"
                
                **Results:**
                - Most-watched cable news
                - Viewers more misinformed than non-news watchers
                - (Multiple studies confirm this)
                
                ---
                
                **Documented Misinformation:**
                
                **COVID-19:**
                - Downplayed pandemic while executives mandated vaccines
                - Promoted unproven treatments
                - Attacked public health measures
                
                **2020 Election:**
                - Amplified fraud claims they knew were false
                - Lost advertisers, settled for $787M
                - Fired Tucker Carlson (eventually)
                
                **Climate Change:**
                - Consistent denial or minimization
                - Fossil fuel industry advertising
                
                ---
                
                **The Roger Ailes Legacy:**
                
                Fox News founder Roger Ailes:
                - Former Nixon media advisor
                - Created Fox in 1996 for Murdoch
                - Explicit goal: conservative media empire
                - Fired 2016 for serial sexual harassment
                - Multiple women paid settlements
                
                **The network was designed for political influence, not journalism.**
                
                ---
                
                **Key Personalities:**
                
                **Sean Hannity:**
                - Highest-paid cable host
                - Was in regular contact with Trump White House
                - Admitted: "I'm not a journalist"
                
                **Tucker Carlson (fired 2023):**
                - Most-watched show
                - White nationalist rhetoric documented
                - Text messages revealed contempt for Trump
                
                **Laura Ingraham:**
                - Previously told LeBron James to "shut up and dribble"
                - Lost advertisers after mocking Parkland survivor
                """,
                keyTakeaway: "Fox News legally argued in court that Tucker Carlson isn't presenting facts. Internal documents show hosts knew election claims were false. They paid $787M in defamation settlement. It's entertainment designed for political influence."
            ),
            MediaLesson(
                title: "MSNBC: The Liberal Counterpart",
                subtitle: "Opinion programming, not straight news",
                color: .blue,
                content: """
                **MSNBC: Left-Leaning But Still Corporate**
                
                MSNBC is often seen as "the liberal Fox News." The comparison is partly accurate—and reveals important truths about both.
                
                ---
                
                **Ownership:**
                
                **Comcast/NBCUniversal**
                
                Comcast is:
                - Largest cable company in America
                - Major internet service provider
                - Has massive lobbying interests
                - Donated to both parties
                
                **Parent company interests matter.**
                
                ---
                
                **What MSNBC Does Well:**
                
                ✅ Covers stories Fox ignores (voting rights, climate, labor)
                ✅ Platform for diverse voices
                ✅ Generally fact-based reporting in news hours
                ✅ Rachel Maddow's deep dives can be excellent
                
                **What MSNBC Does Poorly:**
                
                ❌ Primetime is opinion, not news
                ❌ Russia coverage was often overblown
                ❌ Won't seriously criticize corporate Democrats
                ❌ Parent company conflicts of interest
                ❌ Fired hosts who went too left
                
                ---
                
                **The Phil Donahue Firing (2003):**
                
                Donahue had MSNBC's highest-rated show.
                
                He was fired anyway.
                
                Internal memo revealed:
                > "A difficult public face for NBC in a time of war... He seems to delight in presenting guests who are anti-war, anti-Bush."
                
                **High ratings didn't matter. Anti-war views did.**
                
                ---
                
                **Ed Schultz Reveals (2017):**
                
                Former MSNBC host Ed Schultz said:
                - Told not to cover Bernie Sanders
                - "I was told not to cover this" regarding TPP
                - Corporate interests shaped coverage
                
                > "I think the Clintons have a strong hand in controlling what gets on and off [MSNBC]."
                
                ---
                
                **Russiagate: A Case Study**
                
                **What was true:**
                - Russia interfered in 2016 election (confirmed)
                - Trump campaign had Russian contacts (confirmed)
                - Trump obstructed investigation (documented)
                
                **What was overhyped:**
                - "Pee tape" speculation
                - Every story treated as smoking gun
                - Rachel Maddow covered little else for years
                - Mueller Report was anticlimactic
                
                **The coverage wasn't false, but it was disproportionate.**
                
                Viewers were led to expect a dramatic conclusion that didn't come.
                
                ---
                
                **The Business Reality:**
                
                Like Fox, MSNBC discovered outrage = ratings:
                
                - Trump coverage drove viewership
                - Fear and anger keep viewers engaged
                - "Resistance" became brand identity
                - Similar emotional manipulation, different politics
                
                ---
                
                **Key Personalities:**
                
                **Rachel Maddow:**
                - $30 million/year contract
                - Reduced to once weekly
                - Excellent researcher, sometimes overhypes
                
                **Morning Joe (Joe Scarborough):**
                - Former Republican congressman
                - Close to political establishment
                - Had direct line to Trump early in 2016
                
                **Lawrence O'Donnell:**
                - Former Senate staffer
                - Establishment Democrat perspective
                - Knows how politics actually works
                
                ---
                
                **The Difference from Fox:**
                
                MSNBC opinion is biased left.
                Fox News spreads documented misinformation.
                
                These are not equivalent:
                - MSNBC has not paid $787M for defamation
                - MSNBC has not argued hosts aren't presenting facts
                - MSNBC's misinformation is less frequent and severe
                
                **But both are corporate media with corporate interests.**
                """,
                keyTakeaway: "MSNBC is opinion programming owned by Comcast. Fired Phil Donahue for anti-war views despite high ratings. Russiagate coverage was often overhyped. Less misinformation than Fox, but still corporate media with corporate interests."
            ),
            MediaLesson(
                title: "CNN: The Middle That Isn't",
                subtitle: "Drama over substance",
                color: .orange,
                content: """
                **CNN: Conflict News Network**
                
                CNN pioneered 24-hour news. That's part of the problem.
                
                ---
                
                **The CNN Model:**
                
                **"Both sides" journalism:**
                - Put a Democrat and Republican in boxes
                - Let them yell at each other
                - Call it "balanced"
                - Truth becomes irrelevant
                
                **The problem:**
                
                If one side says the earth is round and the other says it's flat, "balance" isn't presenting both equally.
                
                **CNN treated obvious lies as "one perspective."**
                
                ---
                
                **The Trump Era:**
                
                CNN's Trump coverage was a masterclass in bad incentives:
                
                **2015-2016:**
                - Aired Trump rallies live, uninterrupted
                - Free advertising worth billions
                - Ratings soared
                - "Good for business"
                
                **2017-2020:**
                - "Breaking news" every hour
                - Panels of paid Trump defenders
                - Drama prioritized over substance
                - Normalized abnormal behavior
                
                **2023:**
                - Town hall with Trump
                - Audience stacked with supporters
                - CNN let him lie unchallenged
                - Massive backlash
                
                ---
                
                **The Chris Licht Era (2022-2023):**
                
                New CEO wanted to move CNN "back to center":
                
                - Laid off hundreds of journalists
                - Cancelled reliable hosts
                - Gave platform to election deniers
                - Trump town hall disaster
                - Fired after one year
                
                **"Centrism" meant: fewer facts, more access to power.**
                
                ---
                
                **Ownership Changes:**
                
                **Before (AT&T/WarnerMedia):**
                - Relatively hands-off
                - Jeff Zucker ran it for ratings
                
                **After (Warner Bros. Discovery):**
                - David Zaslav (CEO) is cost-cutter
                - Massive layoffs
                - Less investigative journalism
                - More "personality-driven" content
                
                ---
                
                **The CNN Formula:**
                
                **What CNN does:**
                
                ✅ Breaking news coverage (sometimes good)
                ✅ On-the-ground international reporting
                ✅ Some solid investigative work
                
                **What CNN does poorly:**
                
                ❌ Horse race political coverage
                ❌ "Both sides" false equivalence
                ❌ Panels of yelling pundits
                ❌ Breaking news that isn't breaking
                ❌ Prioritizes drama over substance
                
                ---
                
                **The Iraq War Failure:**
                
                CNN (like most media) failed catastrophically on Iraq:
                
                - Amplified Bush administration claims
                - Insufficient skepticism of WMD claims
                - Marginalized anti-war voices
                - Cheerleaded the invasion
                
                **No accountability.** Same people still have jobs.
                
                ---
                
                **Key Personalities:**
                
                **Anderson Cooper:**
                - Best anchor, generally fair
                - Vanderbilt heir (worth noting)
                
                **Jake Tapper:**
                - Does hold politicians accountable sometimes
                - Also falls into "both sides" trap
                
                **Wolf Blitzer:**
                - "Breaking news" personified
                - 40+ years, little substance
                
                ---
                
                **The Real Issue:**
                
                CNN isn't "fake news" in the way Trump meant.
                
                CNN's problem is **what it covers and how**:
                - Politics as sport
                - Conflict over substance
                - Access over accountability
                - Drama over importance
                
                **The truth is more boring than they can afford.**
                """,
                keyTakeaway: "CNN pioneered 24-hour news and 'both sides' journalism that treats lies as valid perspectives. Gave Trump billions in free airtime. Drama over substance. Not fake, but optimized for conflict over truth."
            ),
            MediaLesson(
                title: "Manufacturing Consent",
                subtitle: "How propaganda works in 'free' media",
                color: .purple,
                content: """
                **The Propaganda Model**
                
                Noam Chomsky and Edward Herman's "Manufacturing Consent" (1988) explains how media propaganda works in democracies.
                
                ---
                
                **The Five Filters:**
                
                Media content is filtered through:
                
                **1. Ownership**
                - Media owned by large corporations
                - Corporate interests protected
                - Profit motive shapes coverage
                
                **2. Advertising**
                - Advertisers are the real customers
                - Don't offend advertisers
                - Content shaped to attract ads
                
                **3. Sourcing**
                - Reliance on official sources
                - Government and corporate PR
                - "Experts" with conflicts of interest
                - Stenography, not journalism
                
                **4. Flak**
                - Organized attacks on critical reporting
                - Threats, complaints, lawsuits
                - Makes reporters self-censor
                - Right-wing "media watchdogs"
                
                **5. Common Enemy**
                - Communism (Cold War)
                - Terrorism (War on Terror)
                - [Current enemy] unifies coverage
                - Dissent becomes unpatriotic
                
                ---
                
                **How It Works (Not Conspiracy):**
                
                This is NOT a conspiracy. No one meets in dark rooms.
                
                It's **structural**:
                
                - Journalists who challenge power get fired
                - Journalists who support power get promoted
                - Eventually, newsrooms select for compliance
                - People genuinely believe what serves their interests
                
                **You don't need a conspiracy when incentives align.**
                
                ---
                
                **Case Study: Iraq War**
                
                **Media before Iraq invasion:**
                - 393 Iraq stories on ABC, CBS, NBC
                - Only 6 were skeptical of Bush claims
                - Anti-war voices marginalized
                - Phil Donahue fired for opposition
                
                **After no WMDs found:**
                - "Intelligence failure" blamed
                - Media's role ignored
                - Same journalists kept jobs
                - No accountability
                
                *Source: FAIR media study*
                
                ---
                
                **What Gets Covered (and What Doesn't):**
                
                **Covered extensively:**
                - Crimes by official enemies
                - Terrorism against Americans
                - Stock market movements
                - Political horse races
                
                **Covered minimally:**
                - U.S. military civilian casualties
                - Corporate crimes
                - Labor movements
                - Poverty and inequality
                - Climate (until recently)
                
                ---
                
                **The Overton Window:**
                
                Media defines what's "acceptable" to discuss:
                
                **Inside the window:**
                - Tax cuts vs modest tax increases
                - More military vs slightly less military
                - Private healthcare vs slightly regulated private
                
                **Outside the window (until recently):**
                - Wealth taxes
                - Medicare for All
                - Military budget cuts
                - Socialism
                
                **Media decides what's "mainstream" and what's "fringe."**
                
                ---
                
                **How to See Through It:**
                
                Ask yourself:
                
                1. **Who owns this outlet?**
                2. **Who advertises here?**
                3. **Who are the sources?**
                4. **Who would be upset by this story?**
                5. **What's NOT being covered?**
                
                **The propaganda isn't in what they lie about.**
                **It's in what they don't cover at all.**
                """,
                keyTakeaway: "Chomsky's 'Manufacturing Consent': Media is filtered through ownership, advertising, sources, flak, and common enemies. Not conspiracy—structural incentives. Iraq War showed how 'free' media can enable catastrophic lies."
            ),
            MediaLesson(
                title: "Local News Collapse",
                subtitle: "The death of accountability journalism",
                color: .orange,
                content: """
                **The Local News Crisis**
                
                While we debate Fox vs MSNBC, local news is dying. This may be the bigger threat to democracy.
                
                ---
                
                **The Numbers:**
                
                Since 2005:
                - **2,500+ newspapers closed**
                - **Half of all local journalism jobs gone**
                - **1,800 communities** are now "news deserts"
                - **70 million Americans** live in areas with limited local news
                
                *Source: Northwestern Medill School research*
                
                ---
                
                **Why It Matters:**
                
                Local news covers:
                - City council meetings
                - School boards
                - Local corruption
                - Police misconduct
                - Court proceedings
                - What affects your daily life
                
                **Without local news:**
                - Corruption increases (documented)
                - Civic engagement drops
                - Local politicians unaccountable
                - National outlets fill the void (poorly)
                
                ---
                
                **What Killed Local News:**
                
                **1. Craigslist and Facebook**
                - Classified ads were 40% of newspaper revenue
                - Craigslist took classifieds
                - Facebook took display ads
                - Revenue model collapsed
                
                **2. Private Equity Vampires**
                - Hedge funds buy struggling papers
                - Cut staff to extract profit
                - Sell real estate
                - Let papers die
                - **Alden Global Capital** is the worst
                
                **3. Chain Ownership**
                - Gannett owns 200+ papers
                - Centralized, homogenized
                - Local coverage cut
                - "Local" papers written elsewhere
                
                ---
                
                **Sinclair Broadcasting:**
                
                Owns 185+ local TV stations.
                
                **"Must-run" segments:**
                - Conservative commentary required
                - Same script read by different anchors
                - Fake "local" news
                - Viewers don't realize it's national content
                
                **The viral video (2018):**
                
                Dozens of anchors reading identical script about "fake news."
                
                This is propaganda masquerading as local news.
                
                ---
                
                **The Consequences:**
                
                **Research findings:**
                
                - Counties that lose newspapers see **increased government borrowing costs**
                - Voter turnout drops
                - Fewer candidates run for office
                - Corporate misconduct increases
                - Police are less accountable
                
                *Source: Multiple academic studies*
                
                ---
                
                **What's Replacing Local News:**
                
                **"Pink slime" sites:**
                - Look like local news
                - Actually partisan propaganda
                - Names like "The Houston Reporter"
                - Hundreds of these sites exist
                - Often funded by political operatives
                
                **NextDoor and Facebook Groups:**
                - Unverified rumors
                - No editorial standards
                - Misinformation spreads
                - Not journalism
                
                ---
                
                **What Can Help:**
                
                **Nonprofit news:**
                - ProPublica (investigative)
                - Texas Tribune
                - Voice of San Diego
                - Growing but underfunded
                
                **Public support:**
                - Subscribe to local papers
                - Donate to nonprofit news
                - Support public media (NPR member stations)
                
                **Policy solutions:**
                - Tax credits for local news
                - Antitrust enforcement
                - Public funding (like BBC model)
                
                **This requires recognizing local news as public infrastructure, not just business.**
                """,
                keyTakeaway: "2,500+ newspapers closed since 2005. 70 million Americans live in 'news deserts.' Local corruption increases without local news. Sinclair forces identical propaganda across 185+ 'local' stations. Local news is dying—democracy suffers."
            ),
            MediaLesson(
                title: "The Social Media Trap",
                subtitle: "Algorithms don't want you informed",
                color: .blue,
                content: """
                **Social Media Is Not News**
                
                Many people get "news" from social media. This is dangerous.
                
                ---
                
                **The Algorithm Problem:**
                
                Social media algorithms optimize for:
                
                ✅ Engagement (clicks, shares, comments)
                ✅ Time on platform
                ✅ Emotional reactions
                
                They do NOT optimize for:
                
                ❌ Truth
                ❌ Importance
                ❌ Context
                ❌ Your wellbeing
                
                ---
                
                **What Goes Viral:**
                
                Research shows viral content is often:
                
                - Emotionally arousing (anger, fear, outrage)
                - Simple and tribal (us vs them)
                - False or misleading (novel = shareable)
                
                **MIT study found:**
                False news spreads 6x faster than true news on Twitter.
                
                *Source: Vosoughi et al., Science (2018)*
                
                ---
                
                **The Filter Bubble:**
                
                Algorithms show you what you already believe:
                
                1. You engage with certain content
                2. Algorithm shows you more of that
                3. Your feed becomes echo chamber
                4. You think everyone agrees with you
                5. Other perspectives seem crazy
                
                **You're not seeing reality. You're seeing your filter.**
                
                ---
                
                **Platform Specifics:**
                
                **Facebook:**
                - Older demographic
                - Family and friends sharing news
                - Misinformation spreads through trust networks
                - Algorithm prioritized engagement over accuracy
                - Internal research showed harm, ignored it
                
                **Twitter/X:**
                - Under Musk: less moderation
                - Verification now meaningless (paid)
                - Bots and propaganda accounts
                - Breaking news and misinformation spread fast
                - Journalists still use it (problematic)
                
                **TikTok:**
                - Younger demographic
                - Very short content
                - Context impossible
                - Emotional manipulation optimized
                - Some good information, buried in noise
                
                **YouTube:**
                - Rabbit holes to extremism documented
                - Algorithm promotes longer watch time
                - Conspiracy content keeps you watching
                - "Just asking questions" manipulation
                
                ---
                
                **The Attention Merchants:**
                
                Tim Wu's book: Your attention is the product.
                
                **The business model:**
                
                1. Attract your attention
                2. Sell it to advertisers
                3. Keep you engaged (addicted)
                4. Repeat
                
                **Informed citizens are not the goal. Engaged users are.**
                
                ---
                
                **Misinformation Superspreaders:**
                
                Studies show most misinfo comes from:
                - Small number of accounts
                - Often political figures
                - Amplified by algorithms
                - Rarely face consequences
                
                **The platforms know who spreads misinfo. They choose not to act.**
                
                ---
                
                **How to Use Social Media Better:**
                
                1. **Don't get news primarily from feeds**
                2. **Go directly to sources**
                3. **Check before sharing**
                4. **Notice emotional manipulation**
                5. **Diversify your sources**
                6. **Use chronological feeds when possible**
                7. **Take breaks**
                
                **Social media can alert you to stories. Then go find real reporting.**
                """,
                keyTakeaway: "Algorithms optimize for engagement, not truth. False news spreads 6x faster than true news. Filter bubbles create echo chambers. Social media is designed to manipulate your emotions, not inform you."
            ),
            MediaLesson(
                title: "Spotting Manipulation",
                subtitle: "Media literacy in practice",
                color: .green,
                content: """
                **Practical Media Literacy**
                
                Now that you understand the system, here's how to navigate it.
                
                ---
                
                **Red Flags in Headlines:**
                
                ⚠️ "SLAMMED" / "DESTROYED" / "OBLITERATES"
                - Emotional language designed to hook you
                
                ⚠️ Questions as headlines
                - "Is [bad thing] happening?" (Usually: no)
                - Betteridge's law: Headlines ending in "?" can be answered "no"
                
                ⚠️ "Some people say..." / "Critics argue..."
                - Who? Be specific or be suspicious
                
                ⚠️ "Breaking" on something hours old
                - Not actually breaking
                
                ⚠️ Unnamed sources for explosive claims
                - Sometimes necessary; often misused
                
                ---
                
                **The SIFT Method:**
                
                Quick verification approach:
                
                **S - Stop**
                Don't share immediately. Pause.
                
                **I - Investigate the source**
                Who made this? What's their credibility?
                
                **F - Find better coverage**
                What do other sources say?
                
                **T - Trace claims**
                Where did this originate?
                
                ---
                
                **Questions to Ask:**
                
                **About the source:**
                - Who owns this outlet?
                - Who funds it?
                - What's their track record?
                - Is this news or opinion?
                
                **About the content:**
                - Is this verifiable?
                - Are sources named?
                - Is there another perspective?
                - What's NOT being said?
                
                **About yourself:**
                - Do I want this to be true?
                - Am I feeling strong emotions?
                - Have I checked this?
                
                ---
                
                **Types of Bias to Watch For:**
                
                **Selection bias:**
                What stories are chosen? What's ignored?
                
                **Framing bias:**
                "Tax relief" vs "tax cuts for rich"
                "Pro-life" vs "anti-abortion"
                Language shapes perception.
                
                **Source bias:**
                Whose voices are included?
                Whose are excluded?
                
                **Omission bias:**
                What context is missing?
                What would change your understanding?
                
                ---
                
                **Building a News Diet:**
                
                **Diversify:**
                - Mix of sources
                - Different perspectives
                - International outlets
                - Local + national
                
                **Verify:**
                - Check important claims
                - Use fact-checkers (Snopes, PolitiFact)
                - Go to primary sources when possible
                
                **Prioritize:**
                - Depth over speed
                - Reporting over opinion
                - Local over national for local issues
                
                ---
                
                **What Actually Informs:**
                
                **More valuable:**
                - Long-form journalism
                - Investigative reporting
                - Books (yes, books)
                - Documentary (vetted ones)
                - Primary sources
                - Academic research (accessible versions)
                
                **Less valuable:**
                - Cable news panels
                - Hot takes on Twitter
                - Viral outrage
                - Breaking news speculation
                - Headlines without reading articles
                
                ---
                
                **The Goal:**
                
                Not to find "unbiased" news (doesn't exist).
                
                Not to "do your own research" into conspiracy holes.
                
                **The goal is to:**
                - Understand who's talking to you
                - Know their interests and biases
                - Verify important claims
                - Seek diverse perspectives
                - Maintain healthy skepticism
                - Stay informed without being manipulated
                
                **Media literacy is a skill. It takes practice.**
                """,
                keyTakeaway: "Use the SIFT method: Stop, Investigate source, Find other coverage, Trace claims. Watch for selection, framing, and omission bias. Prioritize depth over speed, reporting over opinion. Media literacy is a skill that takes practice."
            ),
            MediaLesson(
                title: "Building Your Information Diet",
                subtitle: "What to consume instead",
                color: .cyan,
                content: """
                **Reclaiming Your Information**
                
                You've learned what's broken. Here's how to build something better.
                
                ---
                
                **Tier 1: Wire Services (Just Facts)**
                
                **Associated Press (AP)**
                - Nonprofit cooperative
                - Straight news, minimal opinion
                - Used by all other outlets
                
                **Reuters**
                - International wire service
                - Factual reporting
                - Financial focus but broad coverage
                
                **These are what newspapers rewrite. Go to the source.**
                
                ---
                
                **Tier 2: Quality Journalism**
                
                **Investigative:**
                - ProPublica (nonprofit investigative)
                - The Intercept (national security, civil liberties)
                - Reveal (Center for Investigative Reporting)
                
                **International:**
                - BBC (British perspective)
                - Al Jazeera English (Middle East perspective)
                - The Guardian (UK, strong US coverage)
                - Deutsche Welle (German, good analysis)
                
                **Business/Economics:**
                - Financial Times (quality, paywalled)
                - Bloomberg (business focus)
                - Wall Street Journal news pages (opinion pages are different)
                
                ---
                
                **Tier 3: Good Newspapers**
                
                **Still doing real journalism:**
                - New York Times (news pages, not opinion)
                - Washington Post (politics, investigations)
                - LA Times
                - Local nonprofit news in your area
                
                **Remember:** Even good outlets have biases. Mix them.
                
                ---
                
                **Tier 4: Thoughtful Analysis**
                
                **Magazines and long-form:**
                - The Atlantic
                - New Yorker
                - Harper's
                - n+1
                - Current Affairs
                
                **Podcasts:**
                - NPR (various shows)
                - On The Media (media criticism)
                - Longform (interviews with journalists)
                - Your local public radio
                
                ---
                
                **Tier 5: Fact-Checking**
                
                Use these to verify claims:
                
                - **Snopes** (general)
                - **PolitiFact** (political claims)
                - **FactCheck.org** (political)
                - **AP Fact Check**
                - **Full Fact** (UK-based, international)
                
                ---
                
                **What to Avoid or Limit:**
                
                **Reduce:**
                - Cable news (any channel)
                - Social media as news source
                - Outrage-driven content
                - Punditry and hot takes
                
                **Be skeptical of:**
                - Anything that confirms your existing beliefs too perfectly
                - Sources that never criticize "your side"
                - Anonymous social media accounts
                - Content designed to make you angry
                
                ---
                
                **The Daily Practice:**
                
                **Morning:**
                1. Check one wire service (AP or Reuters)
                2. Scan one quality newspaper
                3. Done. 15-20 minutes.
                
                **Weekly:**
                - One long-form article
                - One podcast episode
                - Something from outside your usual perspective
                
                **Avoid:**
                - Doom scrolling
                - Breaking news addiction
                - Outrage consumption
                
                ---
                
                **The Mindset Shift:**
                
                **Old approach:** Consume all the news
                **New approach:** Curate your information
                
                **Old approach:** Speed (gotta know now!)
                **New approach:** Depth (understand it well)
                
                **Old approach:** Be informed about everything
                **New approach:** Be deeply informed about what matters
                
                ---
                
                **Final Thought:**
                
                **The goal isn't to find "the truth" from one source.**
                
                The goal is to:
                - Understand multiple perspectives
                - Identify your own biases
                - Verify before believing
                - Stay informed without being manipulated
                - Maintain mental health while staying engaged
                
                **You are what you consume. Choose wisely.**
                """,
                keyTakeaway: "Build a healthy news diet: Wire services (AP, Reuters) for facts, investigative outlets (ProPublica) for depth, international sources for perspective, fact-checkers for verification. 15-20 minutes of quality beats hours of cable noise."
            )
        ]
    }
}

// MARK: - Network Profile Card

struct NetworkProfileCard: View {
    let name: String
    let owner: String
    let classification: String
    let bias: String
    let biasColor: Color
    let keyFacts: [String]
    let revenueModel: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            // Header
            HStack {
                Text(name)
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(.white)
                
                Spacer()
                
                Text(classification)
                    .font(.system(size: 10, weight: .black))
                    .foregroundColor(.yellow)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(Color.yellow.opacity(0.2))
                    .cornerRadius(4)
            }
            
            // Owner and bias
            HStack {
                Text("Owner: \(owner)")
                    .font(.system(size: 12))
                    .foregroundColor(.gray)
                
                Spacer()
                
                Text(bias)
                    .font(.system(size: 11, weight: .semibold))
                    .foregroundColor(biasColor)
            }
            
            Divider().background(Color.white.opacity(0.2))
            
            // Key facts
            VStack(alignment: .leading, spacing: 6) {
                ForEach(keyFacts, id: \.self) { fact in
                    HStack(alignment: .top, spacing: 8) {
                        Image(systemName: "exclamationmark.circle.fill")
                            .foregroundColor(.orange)
                            .font(.system(size: 10))
                        Text(fact)
                            .font(.system(size: 12))
                            .foregroundColor(.white.opacity(0.8))
                    }
                }
            }
            
            // Revenue
            HStack {
                Image(systemName: "dollarsign.circle")
                    .foregroundColor(.green)
                    .font(.system(size: 10))
                Text("Revenue: \(revenueModel)")
                    .font(.system(size: 11))
                    .foregroundColor(.gray)
            }
        }
        .padding()
        .background(Color.white.opacity(0.05))
        .cornerRadius(12)
    }
}

// MARK: - Models

struct MediaLesson: Identifiable {
    let id = UUID()
    let title: String
    let subtitle: String
    let color: Color
    let content: String
    let keyTakeaway: String
}

struct MediaLessonView: View {
    let lesson: MediaLesson
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
        CorporateMediaExposedCourse()
    }
}
