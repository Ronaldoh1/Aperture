// LeftRightProgrammingCourse.swift
// THE POLITICAL ILLUSION - How They Keep Us Divided

import SwiftUI

struct LeftRightProgrammingCourse {
  static let shared = LeftRightProgrammingCourse()

  let id = "left_right_programming"
  let title = "Left vs Right"
  let subtitle = "The divide-and-conquer programming"
  let icon = "arrow.left.arrow.right"
  let colorHex = "#9E9E9E"

  var color: Color {
    Color(hex: colorHex)
  }

  let modules: [LRModule] = [
    // ═══════════════════════════════════════════════════════════════
    // MODULE 1: THE MANUFACTURED DIVIDE
    // ═══════════════════════════════════════════════════════════════

    LRModule(
      id: "lr_divide",
      number: 1,
      title: "The Manufactured Divide",
      subtitle: "Why they need you fighting each other",
      lessons: [
        LRLesson(
          id: "lr1_1",
          title: "Divide and Conquer",
          content: """
            **The Oldest Strategy in the Book**

            "Divide and conquer" (divide et impera) has been used by empires for thousands of years. It's simple: Keep the people fighting each other so they never unite against you.

            **How It Works:**
            1. Create two opposing teams
            2. Give each team an identity
            3. Make them hate each other
            4. Sit back while they fight
            5. Rule without opposition

            **The American Implementation:**
            - Two parties that serve the same donors
            - Media that amplifies division
            - Social media algorithms that feed outrage
            - Wedge issues that never get resolved

            **What Left and Right BOTH Agree On:**
            - Politicians are corrupt (80%+ agree)
            - The system is rigged (70%+ agree)
            - Corporations have too much power (70%+ agree)
            - Healthcare is too expensive (85%+ agree)
            - Wages are too low (65%+ agree)

            **What They Keep You Fighting About:**
            - Abortion
            - Guns
            - Immigration
            - Trans rights
            - Critical Race Theory

            Notice: These are all emotional identity issues, not economic ones. They cost the elite nothing to debate endlessly.

            🔥 **The Pattern**: When you're screaming at your neighbor about pronouns, you're not organizing against the billionaires who own both parties.
            """,
          keyPoints: [
            "Divide and conquer is ancient empire strategy",
            "Americans agree on most economic issues",
            "Wedge issues are emotional, not economic",
            "Fighting each other = not fighting the elite",
          ]
        ),

        LRLesson(
          id: "lr1_2",
          title: "The Uniparty Reality",
          content: """
            **One Party, Two Masks**

            Watch what they DO, not what they SAY.

            **What Both Parties Consistently Support:**
            - Military spending increases (always passes)
            - Bank bailouts (always passes)
            - Corporate subsidies (always passes)
            - Surveillance expansion (always passes)
            - War (both parties start them)
            - Wall Street deregulation (both parties do it)

            **What Neither Party Delivers:**
            - Universal healthcare (promised for decades)
            - Living wages (always "not the right time")
            - Money out of politics (they all take it)
            - Breaking up monopolies (they get bigger)
            - Affordable housing (gets worse)
            - Student debt relief (mostly broken promises)

            **The Donors Are the Same:**
            Top donors to BOTH parties:
            - Goldman Sachs
            - JPMorgan Chase
            - Citigroup
            - Google
            - Microsoft
            - Defense contractors

            **The Revolving Door:**
            - Politicians become lobbyists
            - Lobbyists become politicians
            - Wall Street becomes Treasury Department
            - Treasury becomes Wall Street

            **The Kabuki Theater:**
            They fight passionately on camera about:
            - Abortion (never resolved despite decades of control)
            - Guns (never resolved)
            - Immigration (never resolved)

            Then they pass:
            - Military budgets (unanimous)
            - Bank bailouts (bipartisan)
            - Corporate tax cuts (bipartisan)

            🔥 **The Truth**: There is one party - the Money Party. It has two marketing departments for different audiences.
            """,
          keyPoints: [
            "Both parties serve the same corporate donors",
            "Military spending and bailouts always pass",
            "Popular policies never pass",
            "One Money Party with two marketing departments",
          ]
        ),

        LRLesson(
          id: "lr1_3",
          title: "The Media Machine",
          content: """
            **Manufacturing Outrage**

            The media's job isn't to inform you. It's to keep you engaged and angry.

            **Who Owns the Media:**
            - 6 corporations control 90% of US media
            - Same corporations own "left" AND "right" outlets
            - They profit from conflict
            - Calm, informed citizens don't watch

            **The Business Model:**
            Outrage = Engagement = Advertising revenue

            Studies show:
            - Negative content gets 3x more engagement
            - Anger spreads faster than any other emotion
            - People share what makes them mad

            **The Algorithm:**
            Social media is designed to:
            - Show you what triggers you
            - Connect you with people who agree
            - Hide opposing views (unless they're extreme)
            - Create echo chambers
            - Maximize time on platform = maximize ads

            **Fox News and MSNBC:**
            - Same owners (massive corporations)
            - Same goal (keep you watching)
            - Different scripts (same play)
            - Both present a false reality
            - Both tell you the OTHER side is the enemy

            **The Missing Stories:**
            While you're watching political theater:
            - Wealth inequality reaches record highs
            - Corporate consolidation continues
            - Worker rights erode
            - Climate crisis worsens
            - Healthcare costs explode

            None of these are "left" or "right" issues. They affect everyone. That's why they're not covered.

            🔥 **The Design**: The media exists to keep you angry at each other, not informed about what's actually happening. Your attention is the product being sold.
            """,
          keyPoints: [
            "6 corporations own 90% of media",
            "Outrage = engagement = profit",
            "Algorithms create echo chambers deliberately",
            "Real issues affecting everyone aren't covered",
          ]
        ),
      ]
    ),

    // ═══════════════════════════════════════════════════════════════
    // MODULE 2: THE IDENTITY TRAP
    // ═══════════════════════════════════════════════════════════════

    LRModule(
      id: "lr_identity",
      number: 2,
      title: "The Identity Trap",
      subtitle: "When politics becomes who you are",
      lessons: [
        LRLesson(
          id: "lr2_1",
          title: "Politics as Identity",
          content: """
            **When Your Team Becomes You**

            The most effective control isn't force - it's making people WANT to be controlled.

            **How Identity Politics Works:**
            1. "Are you a conservative or liberal?"
            2. You pick a team
            3. You adopt ALL the team's positions
            4. Opposing any position feels like betraying yourself
            5. You defend the team even when it's wrong

            **The Psychology:**
            - Tribal identity is ancient (survival mechanism)
            - Modern politics hijacks this instinct
            - Attacking your political position feels like attacking YOU
            - People will deny facts to protect identity

            **The Red/Blue Programming:**
            Conservative Identity Package:
            - Pro-gun, pro-life, anti-immigration, Christian, traditional values, pro-military, anti-regulation, climate skeptic

            Liberal Identity Package:
            - Pro-choice, pro-gun control, pro-immigration, secular, progressive values, anti-military, pro-regulation, climate concerned

            **The Problem:**
            These packages are ARBITRARY. There's no logical reason:
            - Why does gun opinion correlate with climate opinion?
            - Why does abortion stance predict economic views?
            - Why does religion align with tax policy?

            Because they're not ideas - they're TEAM UNIFORMS.

            **The Test:**
            Can you hold ANY position from the "other" team without feeling like a traitor?

            If not, you're not thinking - you're BELONGING.

            🔥 **The Trap**: When politics becomes identity, thinking becomes treason. You stop evaluating ideas and start defending your team.
            """,
          keyPoints: [
            "Political identity hijacks tribal instincts",
            "Position packages are arbitrary, not logical",
            "Attacking your politics feels like attacking you",
            "If you can't hold 'enemy' positions, you're not thinking",
          ]
        ),

        LRLesson(
          id: "lr2_2",
          title: "The False Choices",
          content: """
            **The Options They Don't Show You**

            Every political debate is framed as binary. It never is.

            **Immigration:**
            They say: "Open borders OR build a wall"
            Reality: Most Americans want reasonable immigration reform
            Hidden: Neither party wants to solve it - it's too useful as a wedge issue

            **Healthcare:**
            They say: "Government takeover OR keep the current system"
            Reality: Every other developed nation has universal care
            Hidden: Insurance companies donate to BOTH parties

            **Economics:**
            They say: "Capitalism OR socialism"
            Reality: Every economy is mixed
            Hidden: The debate keeps you from asking "who owns everything?"

            **Abortion:**
            They say: "Murder OR women's rights"
            Reality: Most Americans support legal abortion with some restrictions
            Hidden: Neither party WANTS to resolve it - it drives votes

            **The Questions They Never Ask:**
            - Why do we work more than medieval peasants?
            - Why does productivity rise but wages don't?
            - Why do we have homeless veterans and billionaires?
            - Why is insulin $300 here and $30 everywhere else?
            - Why do we spend more on "defense" than the next 10 countries combined?

            These questions have no "left" or "right" answer. They're class questions. And class unity is what they fear most.

            🔥 **The Technique**: Frame every issue as binary. Hide the options that would actually help people. Keep them fighting over false choices.
            """,
          keyPoints: [
            "Every issue is framed as binary when it's not",
            "Real solutions are hidden from the debate",
            "Both parties benefit from unresolved wedge issues",
            "Class questions have no left/right answer",
          ]
        ),

        LRLesson(
          id: "lr2_3",
          title: "Breaking the Spell",
          content: """
            **Waking Up From the Program**

            How do you escape the left/right trap?

            **Step 1: Notice the Programming**
            Every time you feel triggered by "the other side," ask:
            - Who benefits from my anger?
            - Is this a real threat or manufactured outrage?
            - What am I NOT paying attention to while I'm focused on this?

            **Step 2: Find Common Ground**
            Talk to "the other side" about:
            - Corruption in politics
            - Corporate power
            - Healthcare costs
            - Housing affordability
            - Working conditions

            Watch the agreement emerge.

            **Step 3: Follow the Money**
            On any issue, ask:
            - Who funds the "conservative" position?
            - Who funds the "liberal" position?
            - Often it's the same people

            **Step 4: Refuse the Package Deal**
            You're allowed to:
            - Be pro-gun AND pro-environment
            - Be religious AND pro-choice
            - Want border security AND support immigrants
            - Support police AND want accountability
            - Be ANY combination that makes sense to YOU

            **Step 5: Focus on Class, Not Culture**
            The 99% have more in common with each other than with ANY billionaire.
            The billionaire class has more in common with EACH OTHER than with ANY of us.

            Left vs. Right keeps you fighting horizontally.
            Up vs. Down would unite you.

            🔥 **The Way Out**: Stop identifying with a team. Start thinking for yourself. Find common ground with "enemies." Unite against the actual system keeping everyone down.
            """,
          keyPoints: [
            "Notice when you're being triggered deliberately",
            "Find common ground on class issues",
            "Refuse the arbitrary position packages",
            "The real divide is up vs down, not left vs right",
          ]
        ),
      ]
    ),

    // ═══════════════════════════════════════════════════════════════
    // MODULE 3: THE DEEPER TRUTH
    // ═══════════════════════════════════════════════════════════════

    LRModule(
      id: "lr_deeper",
      number: 3,
      title: "The Deeper Truth",
      subtitle: "What the division is really hiding",
      lessons: [
        LRLesson(
          id: "lr3_1",
          title: "The Real Structure of Power",
          content: """
            **Who Actually Runs Things**

            While you debate whether Republicans or Democrats are worse:

            **The Permanent Government:**
            - Intelligence agencies continue regardless of who's president
            - Military policy doesn't change with elections
            - Wall Street writes its own regulations
            - Corporations write the laws that "regulate" them

            **The Billionaire Class:**
            - 700+ billionaires in the US
            - Own more wealth than the bottom 50%
            - Fund BOTH parties
            - Control media narrative
            - Write tax laws (that benefit them)
            - Don't care which party wins

            **The Deep State (Real Version):**
            Not a conspiracy - just bureaucratic reality:
            - Career officials outlast politicians
            - Agencies have institutional momentum
            - Lobbyists have permanent relationships
            - The system perpetuates itself

            **What Changes With Elections:**
            - Rhetoric
            - Social media tone
            - Which cultural issues are emphasized
            - Who gets blamed

            **What DOESN'T Change:**
            - Military budget
            - Bank profits
            - Healthcare costs
            - Wealth inequality
            - Corporate power
            - Surveillance state

            **The Puppet Show:**
            Left puppet. Right puppet. Same hands.

            🔥 **The Reality**: Elections determine the flavor of the empire, not its direction. The system runs regardless of which figurehead is installed.
            """,
          keyPoints: [
            "Intelligence and military policy doesn't change with elections",
            "700+ billionaires own more than the bottom 50%",
            "The same things don't change regardless of who wins",
            "Left and right puppets, same hands controlling them",
          ]
        ),

        LRLesson(
          id: "lr3_2",
          title: "What Unity Would Look Like",
          content: """
            **The Nightmare Scenario (For Elites)**

            Imagine if left and right united on what they AGREE about:

            **Shared Demands:**
            1. Money out of politics (80%+ support)
            2. End corporate personhood
            3. Break up monopolies
            4. Healthcare that doesn't bankrupt people
            5. Politicians can't become lobbyists
            6. Transparent government
            7. End forever wars
            8. Living wages
            9. Affordable housing
            10. Accountable police

            **Why This Never Happens:**
            - Media keeps stoking division
            - Politicians prioritize wedge issues
            - Social media amplifies extremes
            - Identity politics creates enemies
            - Economic issues get no airtime

            **Historical Precedents:**
            When left and right DID unite:
            - Populist movement (1890s) - crushed by both parties
            - Labor movement (early 1900s) - violently suppressed
            - Occupy Wall Street (2011) - co-opted and divided
            - Tea Party + Occupy had same enemy (banks) - kept apart

            **The Occupy Lesson:**
            For a moment, people said: "The 99% vs the 1%"
            - Media immediately made it about "dirty hippies"
            - Both parties distanced themselves
            - Identity divisions were reinjected
            - Movement was destroyed
            - Nothing changed

            **What They Fear:**
            A multiracial, cross-political working class movement focused on economic justice.

            This is why they ALWAYS redirect to identity. Identity divides. Class unites.

            🔥 **The Possibility**: The power structure isn't afraid of left or right. It's afraid of UNITED. That's why it works so hard to keep you fighting each other.
            """,
          keyPoints: [
            "80%+ agree on money out of politics",
            "Occupy showed what unity looks like - it was crushed",
            "They always redirect to identity because class unites",
            "United working class is the elite's nightmare",
          ]
        ),
      ]
    ),
  ]
}

// MARK: - Supporting Types

struct LRModule: Identifiable {
  let id: String
  let number: Int
  let title: String
  let subtitle: String
  let lessons: [LRLesson]
}

struct LRLesson: Identifiable {
  let id: String
  let title: String
  let content: String
  let keyPoints: [String]
}
