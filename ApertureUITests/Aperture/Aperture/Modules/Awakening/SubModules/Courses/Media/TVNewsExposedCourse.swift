// TVNewsExposedCourse.swift
// The truth about television "news"
// Who owns it, who profits, and why it's not journalism

import SwiftUI

struct TVNewsExposedCourse: View {
  var body: some View {
    ScrollView {
      VStack(spacing: 0) {
        // Header
        courseHeader

        // Key insight
        keyInsightCard

        // Lessons
        ForEach(Array(lessons.enumerated()), id: \.offset) { index, lesson in
          NavigationLink(destination: TVNewsLessonView(lesson: lesson, index: index + 1)) {
            lessonRow(lesson, index: index)
          }
        }

        // Quick reference
        quickReferenceCard
      }
    }
    .background(Color.black.ignoresSafeArea())
    .navigationTitle("TV News Exposed")
    .navigationBarTitleDisplayMode(.inline)
  }

  // MARK: - Header

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

      Text("TV News Exposed")
        .font(.system(size: 24, weight: .bold))
        .foregroundColor(.white)

      Text("It's not news. It's a business.")
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

  // MARK: - Key Insight

  private var keyInsightCard: some View {
    VStack(alignment: .leading, spacing: 12) {
      HStack {
        Image(systemName: "exclamationmark.triangle.fill")
          .foregroundColor(.orange)
        Text("The Core Truth")
          .font(.system(size: 14, weight: .bold))
          .foregroundColor(.orange)
      }

      Text(
        "TV news exists to sell advertising, not to inform you. Your attention is the product. Outrage keeps you watching. Fear keeps you tuned in. Truth is secondary to engagement."
      )
      .font(.system(size: 13))
      .foregroundColor(.white.opacity(0.9))

      Text(
        "Fox News has successfully argued in court that its opinion hosts are 'entertainment' and no 'reasonable viewer' would take them as fact."
      )
      .font(.system(size: 12, weight: .medium))
      .foregroundColor(.yellow)
    }
    .padding()
    .background(Color.orange.opacity(0.1))
    .cornerRadius(12)
    .padding()
  }

  // MARK: - Lesson Row

  private func lessonRow(_ lesson: TVNewsLesson, index: Int) -> some View {
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

  // MARK: - Quick Reference

  private var quickReferenceCard: some View {
    VStack(alignment: .leading, spacing: 16) {
      Text("Quick Reference: Who Owns What")
        .font(.system(size: 16, weight: .bold))
        .foregroundColor(.white)

      ownershipRow("Fox News", "Fox Corporation (Murdoch family)", .red)
      ownershipRow("CNN", "Warner Bros. Discovery", .red)
      ownershipRow("MSNBC", "Comcast/NBCUniversal", .blue)
      ownershipRow("ABC News", "Disney", .blue)
      ownershipRow("CBS News", "Paramount Global", .purple)
      ownershipRow("NBC News", "Comcast", .orange)

      Text("Six corporations control 90% of American media.")
        .font(.system(size: 12, weight: .medium))
        .foregroundColor(.orange)
        .padding(.top, 8)
    }
    .padding()
    .background(Color.white.opacity(0.05))
    .cornerRadius(12)
    .padding()
  }

  private func ownershipRow(_ network: String, _ owner: String, _ color: Color) -> some View {
    HStack {
      Text(network)
        .font(.system(size: 13, weight: .semibold))
        .foregroundColor(color)
        .frame(width: 80, alignment: .leading)

      Image(systemName: "arrow.right")
        .font(.system(size: 10))
        .foregroundColor(.gray)

      Text(owner)
        .font(.system(size: 12))
        .foregroundColor(.white.opacity(0.8))
    }
  }

  // MARK: - Lessons

  private var lessons: [TVNewsLesson] {
    [
      TVNewsLesson(
        title: "The Business Model",
        subtitle: "Why TV news exists",
        color: .green,
        content: """
          **You Are Not the Customer**

          Understanding TV news starts with understanding the business model.

          ---

          **The Product:**

          TV news doesn't sell news. It sells YOUR ATTENTION to advertisers.

          **The equation:**
          - More viewers = more ad revenue
          - More engagement = more viewers
          - Outrage = maximum engagement

          Therefore: **Outrage = Profit**

          ---

          **The Numbers:**

          **Fox News ad revenue:** ~$1.5 billion/year
          **MSNBC ad revenue:** ~$1 billion/year
          **CNN ad revenue:** ~$800 million/year

          *Source: S&P Global Market Intelligence*

          ---

          **What Drives Ratings:**

          Research shows viewers engage most with:

          1. **Fear:** "Is your family in danger?"
          2. **Anger:** "Look what THEY are doing!"
          3. **Tribal conflict:** "Us vs. Them"
          4. **Breaking news:** Even when nothing is breaking

          What doesn't drive ratings:
          - Nuance
          - Context
          - Good news
          - Complexity

          ---

          **The 24-Hour Problem:**

          Before 1980, TV news was 30 minutes/day.

          CNN launched 24-hour news. Now there's:
          - 24 hours to fill
          - Not 24 hours of news
          - Endless opinion to fill gaps
          - "Breaking news" that isn't

          ---

          **The Result:**

          TV news optimizes for:
          - Keeping you watching (not informing you)
          - Making you feel (not think)
          - Confirming your biases (not challenging them)
          - Creating drama (not explaining issues)

          **You are the product being sold.**
          """,
        keyTakeaway:
          "TV news sells your attention to advertisers. Outrage drives engagement. You are the product, not the customer. The business model requires keeping you emotional, not informed."
      ),
      TVNewsLesson(
        title: "Fox News: The Machine",
        subtitle: "Entertainment disguised as news",
        color: .red,
        content: """
          **Fox News: Not Actually News**

          Fox News has revolutionized propaganda in America—and their own lawyers have admitted it's not news.

          ---

          **The Legal Record:**

          **Tucker Carlson defamation case (2020):**

          Fox's lawyers argued in court:

          > "The general tenor of the show should inform a viewer that Carlson is not stating actual facts about the topics he discusses and is instead engaging in exaggeration and non-literal commentary."

          **Judge Mary Kay Vyskocil ruled:**

          > "Fox persuasively argues...that given Mr. Carlson's reputation, any reasonable viewer arrives with an appropriate amount of skepticism about the statements he makes."

          *Case: McDougal v. Fox News (2020)*

          **Translation:** No reasonable person should believe what Tucker Carlson says.

          ---

          **The $787.5 Million Lie:**

          **Dominion v. Fox News (2023):**

          - Fox settled for $787.5 million
          - Largest media defamation settlement ever
          - Internal texts showed hosts knew election claims were false
          - Aired them anyway for ratings

          **Internal messages revealed:**

          Tucker Carlson: "Sidney Powell is lying"
          Laura Ingraham: "Sidney is a complete nut"
          Rupert Murdoch: Called election fraud claims "really crazy stuff"

          **They knew. They lied anyway.**

          *Source: Court filings, Dominion v. Fox News*

          ---

          **The Hosts:**

          **Tucker Carlson (2016-2023):**
          - Highest-rated cable news host
          - Pushed "Great Replacement" theory
          - Defended Putin, attacked Ukraine
          - Fired after Dominion revelations

          **Sean Hannity:**
          - Direct line to Trump White House
          - Texted Mark Meadows during Jan 6
          - Called a "shadow chief of staff"

          **Laura Ingraham:**
          - Anti-immigrant rhetoric
          - COVID misinformation
          - Knew election claims were false, aired them

          ---

          **The Rupert Murdoch Empire:**

          Fox News is part of Murdoch's global propaganda network:

          **U.S.:** Fox News, Fox Business, Wall Street Journal
          **UK:** The Sun, The Times, formerly Sky News
          **Australia:** Sky News Australia, numerous newspapers

          Same playbook: right-wing populism, anti-immigrant, climate denial.

          ---

          **The Audience Effect:**

          Studies show Fox News viewers are:
          - Less informed on basic facts than non-news watchers
          - More likely to believe false claims
          - More distrustful of other sources

          *Source: Fairleigh Dickinson University, PIPA studies*

          ---

          **What Fox Actually Is:**

          - **Not journalism:** Opinion programming
          - **Not news:** Entertainment
          - **Not accountable:** Uses "no reasonable viewer" defense
          - **Profitable:** Billions in revenue
          """,
        keyTakeaway:
          "Fox's own lawyers argued no reasonable viewer should believe their hosts. They paid $787.5 million for knowingly airing election lies. Internal texts prove they knew the truth and lied anyway."
      ),
      TVNewsLesson(
        title: "MSNBC: The Liberal Mirror",
        subtitle: "Same model, different team",
        color: .blue,
        content: """
          **MSNBC: Fox's Liberal Twin**

          MSNBC uses the same business model as Fox—just for a different audience.

          ---

          **The Business Reality:**

          MSNBC discovered that outrage works for liberals too:

          - Rachel Maddow's ratings spiked with Trump coverage
          - "Resistance" content drove engagement
          - Same anger, different target

          **The formula:**
          - Fox tells conservatives: "They're destroying America!"
          - MSNBC tells liberals: "They're destroying America!"

          Both keep you watching. Both make money.

          ---

          **The Hosts:**

          **Rachel Maddow:**
          - Highest-rated MSNBC host
          - Smart, well-researched (compared to Fox)
          - But still entertainment, still selective
          - Russiagate coverage went beyond evidence at times

          **Joy Reid:**
          - Often inflammatory
          - Past blog posts were problematic
          - Tribal content over nuance

          **Morning Joe:**
          - Joe Scarborough: former Republican congressman
          - Mika Brzezinski: establishment connections (father was National Security Advisor)
          - Centrist establishment perspective

          ---

          **What MSNBC Gets Wrong:**

          **1. Russiagate Overcoverage:**
          - Years of "walls closing in" claims
          - Mueller report didn't deliver promised bombshells
          - Ratings-driven speculation

          **2. Establishment Bias:**
          - Dismissive of Bernie Sanders, progressive candidates
          - Pro-corporate Democratic perspective
          - Chris Matthews compared Sanders to Nazi invasion

          **3. Same Anger Model:**
          - Keeps viewers in perpetual outrage
          - Doesn't inform, inflames
          - "Can you BELIEVE what they did?"

          ---

          **Who Owns MSNBC:**

          **Comcast** owns NBCUniversal owns MSNBC.

          Comcast is:
          - Largest cable company in America
          - One of largest lobbyists
          - Has interests in net neutrality, telecom policy

          **You won't see MSNBC critique Comcast.**

          ---

          **The Comparison:**

          | | Fox News | MSNBC |
          |---|----------|-------|
          | Business model | Outrage | Outrage |
          | Target audience | Conservatives | Liberals |
          | Factual accuracy | Poor | Better, but flawed |
          | Opinion vs. news | Blurred | Blurred |
          | Corporate owner | Fox Corp | Comcast |

          ---

          **The Problem:**

          MSNBC being "better" than Fox is a low bar.

          Both:
          - Prioritize engagement over information
          - Keep viewers in emotional states
          - Reinforce tribal identity
          - Serve corporate interests
          - Fail to challenge power structures their owners benefit from
          """,
        keyTakeaway:
          "MSNBC uses Fox's business model for liberals—outrage drives ratings. Owned by Comcast, it has establishment/corporate bias. Being better than Fox is a very low bar."
      ),
      TVNewsLesson(
        title: "CNN: The Failing Middle",
        subtitle: "Neither journalism nor entertainment",
        color: .orange,
        content: """
          **CNN: Lost in the Middle**

          CNN pioneered 24-hour news, then lost its way trying to compete with opinion programming.

          ---

          **The History:**

          **1980:** Ted Turner launches CNN - first 24-hour news network
          **1991:** Gulf War coverage makes CNN essential
          **2001:** 9/11 coverage cements news reputation
          **2016:** Trump coverage becomes obsession
          **2022-23:** New ownership pivots to "both sides"

          ---

          **The Trump Problem:**

          CNN's Trump coverage was:

          **Good for ratings:**
          - Empty podium coverage (waiting for Trump)
          - Endless panels about tweets
          - "Breaking news" about nothing

          **Bad for journalism:**
          - Gave Trump billions in free airtime
          - Hired Trump loyalists for "balance"
          - Horse race coverage over policy

          **Les Moonves (CBS) said:**
          > "Trump may not be good for America, but he's damn good for CBS."

          CNN felt the same.

          ---

          **The "Both Sides" Problem:**

          CNN treats every issue as having two equal sides:

          - Climate change: Scientists vs. deniers
          - Election fraud: Reality vs. lies
          - Vaccines: Medicine vs. misinformation

          **False balance is not journalism.**

          Giving equal time to lies doesn't make you neutral—it makes you complicit.

          ---

          **The New Ownership (2022-):**

          Warner Bros. Discovery's Chris Licht:
          - Fired Brian Stelter (media critic)
          - Gave Trump a town hall (disaster)
          - Pivoted to "both sides" centrism
          - Was fired within a year

          CNN is now:
          - Hemorrhaging viewers
          - Identity crisis
          - Neither trusted by left nor right

          ---

          **The Hosts:**

          **Anderson Cooper:**
          - Generally respected
          - But still celebrity journalism
          - Vanderbilt heir (literally a billionaire heir)

          **Jake Tapper:**
          - Better than most
          - Still does "both sides" framing
          - Establishment perspective

          **Don Lemon (fired):**
          - Opinion host
          - Sometimes good, sometimes problematic
          - Fired after sexist comments

          ---

          **Who Owns CNN:**

          **Warner Bros. Discovery**

          Led by David Zaslav:
          - Massive cost-cutting
          - Canceled shows, fired journalists
          - Prioritizing profit over journalism

          ---

          **The Core Problem:**

          CNN tried to be:
          - Neutral (but isn't)
          - Entertainment (but not entertaining enough)
          - Journalism (but abandoned it for ratings)

          Result: Trusted by almost no one.
          """,
        keyTakeaway:
          "CNN pioneered 24-hour news, then lost its identity chasing ratings. False 'both sides' balance treats lies as equal to truth. Now owned by cost-cutting conglomerate, trusted by neither side."
      ),
      TVNewsLesson(
        title: "Local News: The Hidden Crisis",
        subtitle: "Sinclair and the death of local journalism",
        color: .purple,
        content: """
          **The Destruction of Local News**

          While you watch national cable news, local journalism has been gutted—and bought by right-wing conglomerates.

          ---

          **The Sinclair Broadcast Group:**

          You may not know Sinclair, but they control your local news.

          **Sinclair owns:**
          - 185+ TV stations
          - Reaches 40% of American households
          - Largest TV station owner in America

          ---

          **The "Must-Run" Segments:**

          Sinclair requires local stations to air corporate-produced segments:

          **2018 viral video:**
          Dozens of Sinclair anchors across the country reading the exact same script:

          > "The sharing of biased and false news has become all too common on social media...This is extremely dangerous to our democracy."

          Word. For. Word. Across the country.

          *Source: Deadspin compilation video (2018)*

          ---

          **The Political Agenda:**

          Sinclair has pushed:
          - Pro-Trump segments
          - Right-wing commentary
          - Anti-"mainstream media" messaging
          - COVID skepticism

          **Boris Epshteyn:**
          - Trump campaign advisor
          - Hired by Sinclair as "chief political analyst"
          - His segments are "must-run"

          **You think you're watching local news. You're watching political programming.**

          ---

          **The Death of Local Journalism:**

          **Newspapers closing:**
          - 2,500+ newspapers closed since 2005
          - 70 million Americans live in "news deserts"
          - 200 counties have no local news at all

          *Source: Northwestern Medill School, "State of Local News" report*

          **Local TV consolidation:**
          - Three companies own most local TV
          - Sinclair, Nexstar, Gray Television
          - Local journalists laid off
          - Content centralized

          ---

          **Why Local News Matters:**

          Local journalists:
          - Cover school boards
          - Investigate local corruption
          - Report on local police
          - Hold local power accountable

          Without them:
          - Corruption increases
          - Voter turnout decreases
          - Civic engagement drops
          - Communities suffer

          **Studies show:** Areas that lose local news see increased corruption and higher municipal borrowing costs.

          *Source: Journal of Financial Economics*

          ---

          **What Replaced Journalism:**

          As local news died:

          - Facebook became primary news source
          - Misinformation filled the gap
          - "Pink slime" fake local news sites emerged
          - Partisan operators created fake "newspapers"

          **1,300+ "pink slime" sites** exist, pretending to be local news but pushing political agendas.

          *Source: Columbia Journalism Review*

          ---

          **What You Can Do:**

          1. Subscribe to local newspapers (if any exist)
          2. Support local public radio
          3. Be aware of Sinclair ownership
          4. Check who owns your local TV station
          5. Support nonprofit local journalism
          """,
        keyTakeaway:
          "Sinclair owns 185+ local TV stations, requires right-wing 'must-run' segments. 2,500 newspapers have closed. 70 million Americans live in news deserts. Local journalism's death enables corruption."
      ),
      TVNewsLesson(
        title: "The Techniques of Manipulation",
        subtitle: "How they keep you watching",
        color: .yellow,
        content: """
          **The Tricks They Use**

          TV news uses specific psychological techniques to keep you watching and emotional.

          ---

          **1. BREAKING NEWS (That Isn't)**

          "Breaking news" used to mean: Something just happened.

          Now it means: We want you to keep watching.

          CNN has had "BREAKING NEWS" banners for stories that are days old.

          **The psychology:** Urgency creates anxiety, anxiety keeps you watching.

          ---

          **2. THE OUTRAGE CYCLE**

          The formula:

          1. Show something outrageous
          2. React with shock
          3. Bring on guests to react
          4. Ask viewers to react
          5. Repeat

          **Nothing is solved. Nothing is learned. Just endless reaction.**

          ---

          **3. THE PANEL OF PUNDITS**

          Why have experts when you can have arguments?

          TV news panels:
          - Create artificial conflict
          - Generate heat, not light
          - Make shouting seem like debate
          - Let bad-faith actors spread lies

          **One person telling lies + one person telling truth ≠ balance.**

          ---

          **4. THE COUNTDOWN/CRISIS FRAMING**

          - "CRISIS AT THE BORDER"
          - "SHOWDOWN IN WASHINGTON"
          - "COUNTDOWN TO..."

          Everything is urgent. Everything is a crisis. Nothing ever resolves.

          **The psychology:** Perpetual crisis = perpetual viewing.

          ---

          **5. THE FEAR APPEAL**

          Local news especially:
          - "What's in your food that could KILL you?"
          - "Is your neighborhood SAFE?"
          - "The danger in YOUR home"

          **The psychology:** Fear keeps you watching through the commercials.

          ---

          **6. TRIBAL IDENTITY REINFORCEMENT**

          Fox: "Real Americans" vs. "coastal elites"
          MSNBC: "Decent people" vs. "MAGA extremists"

          Both:
          - Create in-group/out-group
          - Make watching a tribal identity
          - Turn news into sports team loyalty

          **You're not getting informed. You're getting your identity validated.**

          ---

          **7. THE HORSE RACE**

          Political coverage focuses on:
          - Who's winning?
          - Who's up in polls?
          - Who made a gaffe?

          Not:
          - What are the policies?
          - Who benefits?
          - What would actually happen?

          **Politics as sport, not governance.**

          ---

          **8. THE MISSING CONTEXT**

          TV news rarely explains:
          - Historical background
          - Systemic causes
          - Complex factors
          - Long-term trends

          Just: This happened. React.

          ---

          **9. THE CELEBRITY JOURNALIST**

          News anchors become:
          - Celebrities themselves
          - The story
          - Brands to follow

          **You're watching personalities, not journalism.**

          ---

          **10. THE COMMERCIAL IMPERATIVE**

          Everything is structured around:
          - Getting you to the commercial
          - Getting you back from the commercial
          - Never letting you change the channel

          **The news is the content between advertisements.**
          """,
        keyTakeaway:
          "TV news uses deliberate psychological manipulation: false urgency, outrage cycles, tribal identity, fear appeals, and perpetual crisis framing. You're being manipulated to stay watching, not to be informed."
      ),
      TVNewsLesson(
        title: "The Missing Stories",
        subtitle: "What TV news doesn't cover",
        color: .gray,
        content: """
          **What You're Not Seeing**

          What TV news covers—and doesn't cover—reveals who it serves.

          ---

          **Undercovered:**

          **1. Labor/Workers**
          - Strikes barely covered
          - Union organizing ignored
          - Worker exploitation invisible
          - Amazon, Starbucks organizing: minimal coverage

          **2. Climate Change**
          - Wildfires, floods covered as "weather"
          - Root causes rarely discussed
          - Fossil fuel industry not held accountable
          - Solutions barely mentioned

          **3. Corporate Crime**
          - Wage theft (larger than all property crime)
          - Pollution
          - Price-fixing
          - Tax evasion

          **4. Poverty**
          - 38 million Americans in poverty
          - Rarely covered except as "welfare" debate
          - Working poor invisible

          **5. Foreign Policy Consequences**
          - Drone strikes
          - Civilian casualties
          - Countries we're sanctioning
          - Arms we're selling

          ---

          **Overcovered:**

          **1. Crime (Especially Violent Crime)**
          - Crime has declined for decades
          - Coverage makes it seem worse
          - "If it bleeds, it leads"

          **2. Political Theater**
          - Tweets and gaffes
          - Scandals and drama
          - Personality over policy

          **3. Missing White Women**
          - Disproportionate coverage
          - Missing Black/Brown people ignored
          - "Missing white woman syndrome"

          **4. Stock Market**
          - Daily market reports
          - Most Americans don't own significant stocks
          - Treated as economy indicator (it's not)

          ---

          **Why These Patterns?**

          **Advertisers:**
          - Don't want anti-corporate coverage
          - Target affluent viewers
          - Avoid controversy that hurts brands

          **Owners:**
          - Don't want coverage of their industries
          - Have class interests
          - Benefit from status quo

          **Access:**
          - Journalists need access to powerful people
          - Critical coverage = lost access
          - Soft coverage = maintained access

          ---

          **The Concentration Problem:**

          **Six companies control 90% of media:**
          - Comcast (NBC, MSNBC)
          - Disney (ABC)
          - Warner Bros. Discovery (CNN)
          - Paramount (CBS)
          - Fox Corporation
          - (Plus digital: Google, Meta)

          **In 1983:** 50 companies controlled most media.
          **Today:** 6 companies.

          ---

          **What This Means:**

          You will not see on TV news:
          - Serious critique of capitalism
          - Challenges to military spending
          - Corporate accountability
          - Systemic analysis of inequality
          - Stories that threaten advertiser interests

          **TV news operates within narrow acceptable boundaries.**

          As Noam Chomsky said:

          > "The smart way to keep people passive and obedient is to strictly limit the spectrum of acceptable opinion, but allow very lively debate within that spectrum."
          """,
        keyTakeaway:
          "TV news undercoverages labor, climate, corporate crime, and poverty while overcovering crime, political theater, and stock markets. Six companies control 90% of media. Coverage serves owner and advertiser interests."
      ),
      TVNewsLesson(
        title: "The Defamation Cases",
        subtitle: "When lies have consequences",
        color: .red,
        content: """
          **When They Got Caught**

          Defamation lawsuits have revealed what happens behind the scenes at TV news.

          ---

          **Dominion v. Fox News (2023)**

          **The largest media defamation settlement in history: $787.5 million**

          **The lies:**
          Fox hosts claimed Dominion voting machines:
          - Switched votes from Trump to Biden
          - Were controlled by Venezuela
          - Rigged the 2020 election

          **None of this was true.**

          ---

          **What Discovery Revealed:**

          Internal Fox communications showed hosts knew they were lying:

          **Tucker Carlson:**
          > "Sidney Powell is lying by the way. I caught her. It's insane."

          **Laura Ingraham:**
          > "Sidney is a complete nut. No one will work with her. Ditto with Rudy [Giuliani]."

          **Rupert Murdoch:**
          > Called election fraud claims "really crazy stuff" and "damaging"

          **They knew. They aired it anyway. For ratings.**

          *Source: Court filings, Dominion v. Fox News*

          ---

          **Smartmatic v. Fox News (Ongoing)**

          Another voting machine company is suing Fox for **$2.7 billion.**

          Similar claims: Fox knowingly spread lies about election fraud.

          This case is ongoing.

          ---

          **The Tucker Carlson Defense**

          **McDougal v. Fox News (2020):**

          Karen McDougal sued Tucker Carlson for defamation.

          **Fox's defense:**
          Tucker Carlson's statements are so obviously opinion that no reasonable viewer would believe them as fact.

          **The judge agreed:**
          > "The general tenor of the show should inform a viewer that Carlson is not stating actual facts."

          **Fox successfully argued their star host shouldn't be believed.**

          ---

          **The Rachel Maddow Defense**

          **OAN v. Maddow (2021):**

          Rachel Maddow said OAN was "paid Russian propaganda."

          **MSNBC's defense:**
          Her statement was opinion, not fact.

          **The court agreed.**

          **Both sides use the same defense:** We're entertainment, not news.

          ---

          **Nick Sandmann Cases**

          The Covington Catholic student sued:
          - CNN (settled, undisclosed)
          - Washington Post (settled, undisclosed)
          - NBC (settled, undisclosed)

          Over coverage of viral video encounter.

          **Lesson:** Rush to judgment has consequences.

          ---

          **What The Cases Reveal:**

          1. **Networks know they're lying** (sometimes)
          2. **Ratings trump truth** at decision points
          3. **Legal defense is "we're not news"**
          4. **Consequences are just costs of business**
          5. **Internal culture prioritizes engagement**

          ---

          **The Accountability Gap:**

          $787.5 million sounds like a lot, but:

          - Fox made ~$14 billion in revenue that year
          - No one was criminally charged
          - Hosts kept their jobs (initially)
          - Business model unchanged
          - Same lies continue on other topics

          **Financial penalty, no real accountability.**
          """,
        keyTakeaway:
          "Fox paid $787.5M after internal texts proved they knew election lies were false. Both Fox and MSNBC have used 'we're entertainment, not news' as legal defense. Financial penalties don't change the business model."
      ),
      TVNewsLesson(
        title: "The Networks Exposed",
        subtitle: "A guide to the major players",
        color: .blue,
        content: """
          **Know What You're Watching**

          A breakdown of every major TV news network—their ownership, bias, and blind spots.

          ---

          **FOX NEWS**

          **Owner:** Fox Corporation (Murdoch family)
          **Bias:** Right-wing
          **Audience:** Older, white, conservative
          **Business model:** Outrage entertainment

          **What they do well:** Nothing journalistically
          **Blind spots:** Reality
          **Red flags:** Court-proven liars, "entertainment" defense

          **Trust level:** ❌ Do not rely on for news

          ---

          **MSNBC**

          **Owner:** Comcast
          **Bias:** Liberal/center-left
          **Audience:** Older, white, liberal
          **Business model:** Liberal outrage

          **What they do well:** Some investigative work, fact-checking
          **Blind spots:** Corporate interests, establishment Democrats, labor issues
          **Red flags:** Russiagate overcoverage, corporate ownership conflicts

          **Trust level:** ⚠️ Better than Fox, still entertainment

          ---

          **CNN**

          **Owner:** Warner Bros. Discovery
          **Bias:** Establishment/centrist
          **Audience:** Shrinking
          **Business model:** Unclear (identity crisis)

          **What they do well:** Breaking news infrastructure
          **Blind spots:** "Both sides" false balance
          **Red flags:** Constant identity shifts, cost-cutting

          **Trust level:** ⚠️ Inconsistent

          ---

          **ABC NEWS (Disney)**

          **Owner:** Disney
          **Bias:** Mainstream/centrist
          **Audience:** Broadcast viewers
          **Business model:** Traditional advertising

          **What they do well:** Some solid reporting
          **Blind spots:** Anything affecting Disney interests
          **Red flags:** Won't criticize Disney, DeSantis coverage complicated

          **Trust level:** ⚠️ Moderate, watch for corporate conflicts

          ---

          **CBS NEWS (Paramount)**

          **Owner:** Paramount Global
          **Bias:** Mainstream/centrist
          **Audience:** Older broadcast viewers
          **Business model:** Traditional advertising

          **What they do well:** 60 Minutes still does investigations
          **Blind spots:** Corporate interests
          **Red flags:** Les Moonves scandal, changing ownership

          **Trust level:** ⚠️ Variable by program

          ---

          **NBC NEWS (Comcast)**

          **Owner:** Comcast (same as MSNBC)
          **Bias:** Mainstream/centrist
          **Audience:** Broadcast viewers
          **Business model:** Traditional advertising

          **What they do well:** Some solid journalism
          **Blind spots:** Comcast/telecom interests
          **Red flags:** Killed Ronan Farrow Weinstein story

          **Trust level:** ⚠️ Watch for corporate conflicts

          ---

          **PBS NEWSHOUR**

          **Owner:** Public Broadcasting Service
          **Bias:** Mainstream establishment
          **Audience:** Educated, older
          **Business model:** Public funding + corporate underwriting

          **What they do well:** Depth, context, less sensationalism
          **Blind spots:** Establishment perspective, "both sides"
          **Red flags:** Koch brothers funding, centrist framing

          **Trust level:** ✅ Better than most, but not perfect

          ---

          **NEWSMAX / OAN**

          **Owner:** Right-wing billionaires
          **Bias:** Far-right
          **Business model:** Outrage, MAGA audience

          **Trust level:** ❌❌ Active disinformation

          ---

          **THE BOTTOM LINE:**

          No TV news source should be your only source.

          All have:
          - Corporate ownership
          - Business model conflicts
          - Blind spots
          - Biases

          **Use TV news knowing what it is: a business selling your attention.**
          """,
        keyTakeaway:
          "Every TV network has corporate ownership and resulting conflicts. Fox is entertainment not news. MSNBC/CNN are better but still flawed. PBS is best of TV but still has limits. No single source is sufficient."
      ),
      TVNewsLesson(
        title: "How to Watch Critically",
        subtitle: "Protect yourself from manipulation",
        color: .green,
        content: """
          **Media Literacy for TV News**

          You can watch TV news without being manipulated—if you know what to watch for.

          ---

          **1. IDENTIFY THE BUSINESS MODEL**

          Always ask:
          - Who owns this?
          - Who advertises?
          - What are they selling?

          **Remember:** You are the product.

          ---

          **2. SEPARATE NEWS FROM OPINION**

          TV news blurs these deliberately.

          **Actual news:** This happened. Here are the facts.
          **Opinion:** Here's what I think about it.

          Most of what you see is opinion.

          ---

          **3. NOTICE THE FRAMING**

          How is the story being presented?

          - Who is the "good guy" and "bad guy"?
          - What words are being used?
          - What's being emphasized?
          - What's being left out?

          **Example:** "Protest" vs. "Riot" - same event, different framing.

          ---

          **4. CHECK THE SOURCES**

          When they cite sources:
          - Who is the source?
          - What's their interest?
          - Is it verified?
          - "Sources say" = often nothing

          ---

          **5. WATCH FOR MANIPULATION TECHNIQUES**

          Red flags:
          - "BREAKING NEWS" on old story
          - Endless speculation
          - Experts who are just pundits
          - "Some people say..." (who?)
          - Emotional music/graphics
          - Fear appeals before commercial

          ---

          **6. DIVERSIFY YOUR SOURCES**

          No single source is sufficient.

          Balance with:
          - Print journalism (deeper)
          - International perspectives
          - Independent media
          - Primary sources when possible

          ---

          **7. LIMIT YOUR INTAKE**

          Watching too much TV news:
          - Increases anxiety
          - Creates distorted worldview
          - Wastes time
          - Doesn't make you more informed

          **30 minutes of quality journalism > 3 hours of cable news**

          ---

          **8. ASK: WHAT ARE THEY NOT COVERING?**

          The absences tell you as much as the coverage.

          - Labor issues?
          - Corporate accountability?
          - Systemic problems?
          - International stories?

          ---

          **9. FOLLOW THE MONEY**

          - Check campaign contributions
          - Note advertiser influence
          - Research ownership
          - Look for conflicts of interest

          ---

          **10. TRUST YOUR DISCOMFORT**

          If coverage feels:
          - Manipulative
          - One-sided
          - Designed to enrage
          - Too simple

          It probably is.

          ---

          **THE GOAL:**

          Not to stop watching entirely, but to:

          - Watch with awareness
          - Recognize manipulation
          - Supplement with better sources
          - Never rely on a single source
          - Maintain your critical thinking

          **An informed citizen is a dangerous citizen—to those who profit from ignorance.**
          """,
        keyTakeaway:
          "Watch TV news knowing it's a business selling your attention. Separate news from opinion. Notice framing and manipulation. Diversify sources. Limit intake. What they don't cover is as important as what they do."
      ),
    ]
  }
}

// MARK: - Models

struct TVNewsLesson: Identifiable {
  let id = UUID()
  let title: String
  let subtitle: String
  let color: Color
  let content: String
  let keyTakeaway: String
}

struct TVNewsLessonView: View {
  let lesson: TVNewsLesson
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
    TVNewsExposedCourse()
  }
}
