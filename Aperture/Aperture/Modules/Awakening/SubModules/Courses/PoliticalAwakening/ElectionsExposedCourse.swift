// ElectionsExposedCourse.swift
// How elections REALLY work - beyond the theater

import SwiftUI

struct ElectionsExposedCourse: View {
  @State private var currentLesson = 0
  @State private var showQuiz = false

  var body: some View {
    ScrollView {
      VStack(spacing: 0) {
        // Course Header
        courseHeader

        // Lessons
        ForEach(Array(lessons.enumerated()), id: \.offset) { index, lesson in
          lessonRow(lesson, index: index)
        }
      }
    }
    .background(Color.black.ignoresSafeArea())
    .navigationTitle("How Elections Work")
    .navigationBarTitleDisplayMode(.inline)
  }

  private var courseHeader: some View {
    VStack(spacing: 16) {
      ZStack {
        Circle()
          .fill(Color.purple.opacity(0.2))
          .frame(width: 80, height: 80)
        Image(systemName: "checkmark.seal.fill")
          .font(.system(size: 36))
          .foregroundColor(.purple)
      }

      Text("How Elections Really Work")
        .font(.system(size: 22, weight: .bold))
        .foregroundColor(.white)

      Text("Beyond the theater. See the system for what it is.")
        .font(.system(size: 14))
        .foregroundColor(.gray)
        .multilineTextAlignment(.center)

      // Progress
      HStack {
        Text("8 Lessons")
          .font(.system(size: 12, weight: .medium))
          .foregroundColor(.gray)
        Spacer()
        Text("~45 min")
          .font(.system(size: 12, weight: .medium))
          .foregroundColor(.gray)
      }
      .padding(.horizontal)
    }
    .padding()
  }

  private func lessonRow(_ lesson: ElectionLesson, index: Int) -> some View {
    NavigationLink(destination: ElectionLessonView(lesson: lesson)) {
      HStack(spacing: 16) {
        ZStack {
          Circle()
            .fill(Color.white.opacity(0.1))
            .frame(width: 44, height: 44)
          Text("\(index + 1)")
            .font(.system(size: 16, weight: .bold))
            .foregroundColor(.white)
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
  }

  private var lessons: [ElectionLesson] {
    [
      ElectionLesson(
        title: "The Illusion of Choice",
        subtitle: "How the two-party system limits your options",
        content: """
          **The Two-Party Trap**

          The United States operates under a two-party system that creates the illusion of choice while severely limiting actual options.

          **How It Works:**

          • **Ballot Access Laws**: Third parties face extreme barriers to even appear on ballots
          • **Debate Commission**: Controlled by the two major parties, excluding third-party candidates
          • **Media Coverage**: Mainstream media treats elections as a two-horse race
          • **"Spoiler" Narrative**: Anyone who votes third party is blamed for the "worse" candidate winning

          **The Reality:**

          By the time you vote in a general election, the choices have already been narrowed down through:

          1. Primary elections (where turnout is typically 20-30%)
          2. Party establishment endorsements
          3. Donor class approval
          4. Media coverage decisions

          **What You Can Do:**

          • Vote in PRIMARIES - this is where real choices happen
          • Research candidates before they get party endorsements
          • Support ranked-choice voting initiatives
          • Don't accept the "lesser evil" framing without question

          > "The smart way to keep people passive and obedient is to strictly limit the spectrum of acceptable opinion, but allow very lively debate within that spectrum." - Noam Chomsky
          """,
        keyTakeaway: "Your vote matters most in primaries, not general elections."
      ),
      ElectionLesson(
        title: "Gerrymandering Decoded",
        subtitle: "How districts are drawn to predetermine winners",
        content: """
          **What is Gerrymandering?**

          Gerrymandering is the manipulation of electoral district boundaries to favor one party over another. It's named after Elbridge Gerry, whose 1812 Massachusetts district was said to resemble a salamander.

          **Two Main Techniques:**

          **1. Packing**
          Concentrate opposing voters into a few districts so they win those by huge margins but have no influence elsewhere.

          **2. Cracking**
          Spread opposing voters across many districts so they never have a majority anywhere.

          **The Math of Manipulation:**

          Imagine a state with 1 million voters:
          - 600,000 vote Party A
          - 400,000 vote Party B

          Fair districts might give Party A 6 seats, Party B 4 seats.

          But with gerrymandering, Party B could win 7 seats by:
          - Packing 500,000 Party A voters into 3 districts (landslide wins)
          - Spreading remaining 100,000 across 7 districts where Party B barely wins each

          **Real Examples:**

          • North Carolina: Republicans won 10 of 13 seats with only 50% of the vote
          • Maryland: Democrats drew a district so convoluted it was called "a broken-winged pterodactyl"

          **Why It Matters:**

          Gerrymandering means:
          - Politicians choose their voters, not the other way around
          - "Safe" districts reduce accountability
          - Extreme candidates win because only primaries are competitive
          - Your vote may literally not matter in a pre-determined district

          **Solutions:**

          • Independent redistricting commissions
          • Algorithmic/mathematical redistricting
          • Multi-member districts with proportional representation
          """,
        keyTakeaway: "In gerrymandered districts, elections are decided by map drawers, not voters."
      ),
      ElectionLesson(
        title: "The Money Primary",
        subtitle: "How donors filter candidates before you vote",
        content: """
          **The Invisible Primary**

          Before any votes are cast, there's an invisible "money primary" where candidates compete for donor approval.

          **How It Works:**

          1. **Donor Networks**: Wealthy individuals and PACs signal who they'll fund
          2. **Media Coverage**: Candidates with money get coverage; coverage brings more money
          3. **Viability Narrative**: Candidates without big donors are declared "not viable"
          4. **Early Dropouts**: Candidates can't afford to compete without donor support

          **Who Gets Filtered Out:**

          Candidates who threaten donor interests:
          - Those proposing higher taxes on the wealthy
          - Those challenging corporate power
          - Those supporting public financing of elections
          - Those opposing donor-approved policies

          **The Numbers:**

          • Winning House races average $2+ million
          • Winning Senate races average $15+ million
          • Presidential campaigns: $1+ billion

          Where does this money come from?

          • Less than 0.5% of Americans give more than $200 to campaigns
          • Less than 0.1% max out contributions
          • This tiny group has outsized influence on who can even run

          **Case Study: 2020 Democratic Primary**

          When candidates started threatening corporate power:
          - Media coverage shifted
          - Donor-approved candidates were promoted
          - "Electability" became the talking point
          - The field consolidated rapidly around the safe choice

          **What You Can Do:**

          • Support small-donor candidates
          • Look at funding sources before policy positions
          • Donate small amounts to shift the incentive structure
          • Support public financing of elections
          """,
        keyTakeaway: "The donor class pre-approves your choices before you ever see a ballot."
      ),
      ElectionLesson(
        title: "Media Manufacturing Consent",
        subtitle: "How coverage shapes who's 'viable'",
        content: """
          **The Media Filter**

          Media coverage doesn't just report on elections - it shapes them through the "viability" narrative.

          **Herman & Chomsky's Propaganda Model:**

          Five filters shape mainstream media:

          1. **Ownership**: 6 corporations control 90% of media
          2. **Advertising**: Advertisers influence what gets covered
          3. **Sourcing**: Reliance on official/corporate sources
          4. **Flak**: Organized pushback against unfavorable coverage
          5. **Common Enemy**: Framing around shared threats

          **How This Affects Elections:**

          • **Blackouts**: Candidates can be ignored into obscurity
          • **Horse Race Coverage**: Focus on polls, not policy
          • **Electability Framing**: Circular logic (we won't cover them because they can't win; they can't win because we won't cover them)
          • **False Balance**: Treating corporate positions as "centrist"

          **Real Examples:**

          • 2016: One candidate got $5 billion in free media coverage
          • 2020: Some candidates got fraction of coverage despite polling well
          • Policy coverage: Typically <10% of election coverage is about actual policy

          **The "Serious Candidate" Filter:**

          To be treated as "serious," candidates must:
          - Have establishment credentials
          - Avoid challenging fundamental power structures
          - Speak in approved policy language
          - Have early money and endorsements

          **How to See Through It:**

          • Track coverage amounts vs. polling numbers
          • Note whose policies get detailed coverage
          • Watch for loaded framing ("radical," "moderate," "electable")
          • Diversify your news sources
          • Seek out primary sources (actual speeches, policies)
          """,
        keyTakeaway: "Media doesn't tell you what to think, but it tells you what to think about."
      ),
      ElectionLesson(
        title: "The Electoral College",
        subtitle: "Why some votes count more than others",
        content: """
          **Understanding the Electoral College**

          Americans don't directly elect their president. Instead, they vote for electors who then vote for president.

          **How It Works:**

          • Each state gets electors equal to their Congressional representation
          • 48 states use winner-take-all allocation
          • You need 270 electoral votes to win
          • A candidate can win the presidency while losing the popular vote

          **Why It Was Created:**

          The founding fathers created the Electoral College because:

          1. They didn't trust direct democracy
          2. It was part of the Connecticut Compromise
          3. The 3/5 Compromise boosted slave state power
          4. Communication/information limitations of the 1700s

          **Modern Problems:**

          **1. Unequal Representation**
          - Wyoming: 1 elector per 192,000 people
          - California: 1 elector per 719,000 people
          - Wyoming voters have 3.7x more influence

          **2. Swing State Focus**
          - Most states are "safe" and ignored
          - 94% of 2020 campaign events were in 12 states
          - Issues that matter to "safe" state voters are deprioritized

          **3. Popular Vote Losers**
          - 2000: Gore won popular vote, lost election
          - 2016: Clinton won by 3 million votes, lost election
          - 5 of 45 presidents lost the popular vote

          **The Battleground Reality:**

          Your vote matters significantly more if you live in:
          - Pennsylvania, Michigan, Wisconsin
          - Arizona, Georgia, Nevada
          - Florida, North Carolina

          If you live in California, Texas, New York, or most other states, the outcome is essentially predetermined.

          **Potential Reforms:**

          • National Popular Vote Interstate Compact
          • Proportional electoral vote allocation
          • Congressional district allocation
          • Constitutional amendment (extremely difficult)
          """,
        keyTakeaway:
          "The Electoral College means not all votes are equal, and most voters are ignored."
      ),
      ElectionLesson(
        title: "Voter Suppression Tactics",
        subtitle: "How eligible voters are prevented from voting",
        content: """
          **Modern Voter Suppression**

          After the Voting Rights Act was gutted in 2013 (Shelby County v. Holder), voter suppression tactics have expanded dramatically.

          **Common Tactics:**

          **1. Voter ID Laws**
          - 36 states require some form of ID
          - 11% of Americans lack government-issued photo ID
          - Disproportionately affects minorities, elderly, low-income
          - Studies show these laws reduce turnout 2-3%

          **2. Purging Voter Rolls**
          - Removing voters for not voting recently
          - "Exact match" requirements
          - Georgia purged 340,000 voters in 2019
          - Often done without notification

          **3. Reducing Polling Places**
          - Closing locations in minority neighborhoods
          - Texas closed 750 polling places 2012-2018
          - Creates long lines, discourages voting

          **4. Limiting Early/Absentee Voting**
          - Reducing early voting days
          - Restricting mail-in ballot access
          - Ballot drop box limitations

          **5. Felony Disenfranchisement**
          - 5.2 million Americans can't vote due to felony convictions
          - 1 in 13 Black Americans affected
          - Some states restore rights, others don't

          **6. Gerrymandering** (covered in Lesson 2)

          **The Strategy:**

          These tactics aren't random. They're designed to:
          - Reduce turnout among opposition voters
          - Create barriers that discourage participation
          - Shift close elections by small margins

          **Protecting Your Vote:**

          • Check your registration well before elections
          • Know your state's ID requirements
          • Vote early if possible
          • Know your rights at the polling place
          • Report any issues to voter protection hotlines
          • Help others navigate the system
          """,
        keyTakeaway:
          "Voter suppression is designed to be just difficult enough to discourage participation."
      ),
      ElectionLesson(
        title: "The Debate Theater",
        subtitle: "Why presidential debates are controlled performances",
        content: """
          **The Commission on Presidential Debates**

          Presidential debates aren't civic events - they're controlled performances managed by the two parties.

          **Who Controls the Debates:**

          The Commission on Presidential Debates (CPD):
          - Founded in 1987 by the RNC and DNC
          - Replaced the League of Women Voters
          - Board members are party loyalists
          - Sets rules that exclude third parties

          **Why the League of Women Voters Quit:**

          In 1988, the League withdrew, stating the debates had become "a fraud on the American voter."

          They cited:
          - Candidate campaigns controlling the format
          - Pre-negotiated conditions
          - Exclusion of questions on key issues

          **The 15% Rule:**

          To participate, candidates must poll at 15% nationally.

          The catch: You can't poll at 15% if media won't cover you, and media won't cover you if you're not in the debates.

          **What's Pre-Negotiated:**

          Before each debate, campaigns agree on:
          - Topics to avoid
          - Camera angles
          - Whether candidates can interact
          - Time limits and format
          - Whether audience reactions are allowed

          **What You Don't See:**

          • Questions from actual voters (usually pre-screened)
          • Follow-up questions that challenge answers
          • Topics that both parties agree to ignore
          • Third-party perspectives

          **How to Watch Critically:**

          • Notice what topics are never raised
          • Watch for agreed-upon "lines" both candidates don't cross
          • See who gets more time and follow-ups
          • Research whether claims are fact-checked
          • Ask: What would a candidate outside the two parties say?
          """,
        keyTakeaway:
          "Debates are performances negotiated between parties, not genuine civic discourse."
      ),
      ElectionLesson(
        title: "Taking Back Power",
        subtitle: "How to actually make your voice heard",
        content: """
          **Beyond the Theater**

          Now that you see how the system works, what can you actually do?

          **Where Your Vote Actually Matters:**

          **1. Primary Elections**
          - Turnout is typically 20-30%
          - Your vote has 3-5x more impact
          - This is where candidates are actually chosen
          - Party establishments can be challenged here

          **2. Local Elections**
          - Often decided by hundreds or even dozens of votes
          - Directly affects your daily life
          - School boards, city councils, judges
          - Farm system for higher office

          **3. Ballot Initiatives**
          - Direct democracy on specific issues
          - Can bypass legislative gridlock
          - Examples: minimum wage, marijuana, redistricting

          **Beyond Voting:**

          **1. Follow the Money**
          - Research candidates on OpenSecrets.org
          - Share what you find with others
          - Support small-donor candidates

          **2. Participate in Primaries**
          - Know your state's registration deadlines
          - Some states have open primaries
          - Show up and bring others

          **3. Support Structural Reforms**
          - Ranked-choice voting
          - Independent redistricting
          - Public financing of elections
          - National Popular Vote Compact

          **4. Build Power Outside Elections**
          - Join or support community organizations
          - Engage in direct action
          - Build alternative information networks
          - Don't wait for politicians to save you

          **The Real Lesson:**

          Elections are one tool, not the only tool. The system is designed to make you feel powerless and accept limited choices.

          When you see through the theater, you can:
          - Make strategic choices about where to invest your energy
          - Stop being manipulated by false choices
          - Build power in ways the system doesn't control
          - Help others see clearly too

          > "If voting changed anything, they'd make it illegal." - Actually, they've tried. That's why we have voter suppression.
          """,
        keyTakeaway:
          "Your power is greatest in primaries, local races, and building power outside the electoral system."
      ),
    ]
  }
}

// MARK: - Lesson Model

struct ElectionLesson: Identifiable {
  let id = UUID()
  let title: String
  let subtitle: String
  let content: String
  let keyTakeaway: String
}

// MARK: - Lesson View

struct ElectionLessonView: View {
  let lesson: ElectionLesson

  var body: some View {
    ScrollView {
      VStack(alignment: .leading, spacing: 24) {
        // Header
        VStack(alignment: .leading, spacing: 8) {
          Text(lesson.title)
            .font(.system(size: 24, weight: .bold))
            .foregroundColor(.white)
          Text(lesson.subtitle)
            .font(.system(size: 16))
            .foregroundColor(.gray)
        }

        Divider()
          .background(Color.white.opacity(0.2))

        // Content (Markdown-style rendering would be ideal)
        Text(lesson.content)
          .font(.system(size: 15))
          .foregroundColor(.white.opacity(0.9))
          .lineSpacing(6)

        // Key Takeaway
        VStack(alignment: .leading, spacing: 8) {
          HStack {
            Image(systemName: "lightbulb.fill")
              .foregroundColor(.yellow)
            Text("Key Takeaway")
              .font(.system(size: 14, weight: .bold))
              .foregroundColor(.yellow)
          }

          Text(lesson.keyTakeaway)
            .font(.system(size: 15, weight: .medium))
            .foregroundColor(.white)
        }
        .padding()
        .background(Color.yellow.opacity(0.1))
        .cornerRadius(12)
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
    ElectionsExposedCourse()
  }
}
