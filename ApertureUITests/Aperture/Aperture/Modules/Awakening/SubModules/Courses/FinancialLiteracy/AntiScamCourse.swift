// AntiScamCourse.swift
// Protecting yourself from financial manipulation and scams
// Because people lose billions every year to predators

import Foundation
import SwiftUI

// MARK: - Anti-Scam Course

enum AntiScamCourse {
  static let id = "anti-scam-awareness"
  static let title = "Don't Fall For The Vibes"
  static let subtitle = "Protecting yourself from manipulation & scams"
  static let icon = "exclamationmark.shield.fill"
  static let color = Color.red
  static let estimatedTime = "3-4 hours"
  static let premium = false

  static let modules: [AntiScamModule] = [
    // MODULE 1: Psychology of Scams
    AntiScamModule(
      id: "scam-psychology",
      title: "Why Smart People Get Scammed",
      icon: "brain.head.profile",
      lessons: [
        AntiScamLesson(
          id: "anyone-can-fall",
          title: "It Can Happen To Anyone",
          content: """
            **"I would never fall for that."**

            That's exactly what every scam victim thought before it happened to them.

            ## The Uncomfortable Truth

            - **1 in 10 Americans** lose money to scams yearly
            - Average loss: **$500-$1,000** (much higher for some)
            - **Educated people are MORE likely** to fall for sophisticated scams
            - Age doesn't protect you - different scams target different demographics

            ## Why Smart People Get Scammed

            ### 1. Overconfidence
            "I'm too smart for this" = You let your guard down

            ### 2. Emotional State
            Scammers strike when you're:
            - Lonely
            - Desperate (financial pressure)
            - Excited (too good to be true)
            - Grieving
            - In love

            ### 3. Social Proof
            "My friend is doing it" / "Look at all these testimonials"
            (Testimonials can be faked or paid for)

            ### 4. Authority Bias
            Official-looking emails, badges, titles
            We're trained to trust authority

            ### 5. Scarcity/Urgency
            "Limited time!" / "Act now!" / "Only 3 spots left!"
            Pressure prevents rational thinking

            ## The Golden Rule

            **Legitimate opportunities don't require instant decisions.**

            If someone is pressuring you to decide RIGHT NOW, that's the biggest red flag of all.
            """,
          duration: 10,
          redFlags: [
            "Urgency and pressure to decide immediately",
            "Appeals to emotion over logic",
            "Claims that you're 'special' or 'selected'",
            "Requests for secrecy ('don't tell anyone')",
          ],
          realExample:
            "In 2022, a Stanford professor lost $50,000 to a 'Geek Squad' refund scam. Intelligence doesn't protect you."
        ),
        AntiScamLesson(
          id: "manipulation-tactics",
          title: "Manipulation Tactics 101",
          content: """
            **Learn the playbook so you can spot it.**

            ## The Tactics

            ### 1. FOMO (Fear Of Missing Out)
            "Everyone is making money on this!"
            "Bitcoin went up 10x, don't miss the next one!"

            **Reality**: By the time "everyone" knows, you're the exit liquidity.

            ### 2. Social Proof Manipulation
            - Fake followers/subscribers
            - Paid testimonials
            - Photoshopped screenshots
            - Rented luxury items for photos

            **Reality**: Success aesthetics can be completely fabricated.

            ### 3. The Foot-In-The-Door
            Start small, escalate gradually:
            - "Just $50 to start"
            - "Since that worked, invest $500"
            - "You've made money! Now put in $5,000"
            - Then they disappear with everything

            ### 4. Reciprocity Exploitation
            "I'm giving you this free course/info"
            "Now you should join my paid program to return the favor"

            ### 5. False Authority
            - Fake credentials
            - Paid-for awards
            - "As seen on" logos (easily obtained)
            - Borrowed/rented credibility

            ### 6. Sunk Cost Exploitation
            "You've already invested $1,000. Just $500 more to unlock the profits."
            (This is how people lose their life savings)

            ## The Test

            Ask yourself:
            1. Would this work if I had a week to decide?
            2. What does this person gain if I say yes?
            3. Can I verify the claims independently?
            4. Am I being told what I WANT to hear?
            """,
          duration: 12,
          redFlags: [
            "Emphasis on urgency and scarcity",
            "Lifestyle flexing with unverifiable wealth",
            "Requests that start small and escalate",
            "Guilt-tripping or reciprocity pressure",
          ],
          realExample:
            "Fake guru screenshots: Many use trading simulators or paper trading to show 'profits' that aren't real money."
        ),
        AntiScamLesson(
          id: "emotional-exploitation",
          title: "Emotional Exploitation",
          content: """
            **Scammers don't hack computers. They hack emotions.**

            ## Romance Scams

            ### The Pattern
            1. Meet online (dating apps, social media)
            2. Intense connection, "love bombing"
            3. Always a reason they can't meet in person
            4. Eventually: Emergency, needs money

            ### Red Flags
            - Model-level photos (often stolen)
            - Falls in love unusually fast
            - Asks for money before meeting
            - Military/overseas worker (classic cover)
            - Video calls always have "technical issues"

            **2022 losses**: Over **$1.3 billion** to romance scams

            ## Grief Exploitation

            After someone dies, scammers:
            - Call claiming the deceased owed money
            - Offer "inheritance" for a fee
            - Pose as charities related to cause of death

            ## Loneliness Exploitation

            - Fake friends who eventually pitch schemes
            - "Community" that requires buy-in
            - Cults that demand financial commitment

            ## Fear Exploitation

            - IRS scam calls
            - "Your computer has a virus" calls
            - "Your grandchild is in jail" calls
            - "Your account will be closed" emails

            ## The Defense

            **Never make financial decisions when emotional.**

            Wait 24-72 hours. Real opportunities survive the pause.
            """,
          duration: 11,
          redFlags: [
            "Intense emotional connection very quickly",
            "Cannot meet in person or video call",
            "Money requests before trust is established",
            "Appeals to fear, love, or grief",
          ],
          realExample:
            "The 'Tinder Swindler' stole an estimated $10 million from multiple women by posing as a wealthy businessman."
        ),
      ]
    ),

    // MODULE 2: Investment Scams
    AntiScamModule(
      id: "investment-scams",
      title: "Investment Scams",
      icon: "chart.line.downtrend.xyaxis",
      lessons: [
        AntiScamLesson(
          id: "ponzi-pyramid",
          title: "Ponzi Schemes & Pyramids",
          content: """
            **If the money comes from new investors, not actual profits, it WILL collapse.**

            ## Ponzi Scheme

            ### How It Works
            1. Promise high returns
            2. Pay early investors with new investor money
            3. Show "profits" to build trust
            4. Get more money invested
            5. Eventually: Not enough new money → Collapse

            ### Why They "Work" Initially
            Early investors DO get paid. They tell friends. More people join.
            The math is unsustainable. Always.

            ### Famous Examples
            - **Bernie Madoff**: $65 billion, largest in history
            - **Allen Stanford**: $8 billion
            - **Bitconnect**: Crypto Ponzi, billions lost

            ## Pyramid Schemes

            ### How To Identify
            - Income primarily from recruiting, not selling products
            - Required to buy inventory/starter kits
            - Emphasis on "building your downline"
            - Complex commission structures

            ### MLM Red Flags
            - 99% of MLM participants lose money (FTC data)
            - Products are overpriced vs. market
            - Recruitment is more important than sales
            - "Be your own boss" messaging

            ### The Math Problem
            If each person recruits 5 people:
            - Level 1: 5
            - Level 5: 3,125
            - Level 13: 1.2 billion (more than exist)

            **Pyramid math is impossible.** Late joiners always lose.

            ## The Test

            "Where does the money actually come from?"

            If new investors → Ponzi/Pyramid
            If actual business revenue → Might be legitimate
            """,
          duration: 12,
          redFlags: [
            "Guaranteed or unusually high returns",
            "Secretive or complex investment strategy",
            "Difficulty withdrawing funds",
            "Emphasis on recruitment over product",
          ],
          realExample:
            "Madoff's fund showed steady 10-12% returns for DECADES, through market crashes. That should have been impossible - and it was."
        ),
        AntiScamLesson(
          id: "crypto-scams",
          title: "Crypto Scams & Rug Pulls",
          content: """
            **The crypto space is the Wild West of financial fraud.**

            ## Common Crypto Scams

            ### 1. Rug Pulls
            - Create new token/project
            - Hype it up, get people to buy
            - Developers dump their tokens
            - Price crashes to zero, devs disappear

            **$7.7 billion** lost to rug pulls in 2021-2022

            ### 2. Pump and Dump
            - Coordinated buying to raise price
            - Social media hype
            - Insiders sell at the top
            - Retail buyers left holding worthless coins

            ### 3. Fake Exchanges
            - Looks legitimate
            - You deposit, can't withdraw
            - "Customer service" asks for more money to unlock

            ### 4. Giveaway Scams
            "Send 1 ETH, get 2 back!"
            (You get nothing back. Ever.)

            ### 5. Impersonation
            Fake Elon Musk, Vitalik, etc. accounts
            "I'm giving away Bitcoin!"

            ## Red Flags for Crypto Projects

            - Anonymous team
            - Unrealistic promises
            - No clear use case
            - Celebrities shilling it
            - "Get in early" pressure
            - Token allocation heavily to insiders
            - Audit? What audit?

            ## The Test

            1. Can you explain what the project actually does?
            2. Is the team public and verifiable?
            3. Has the code been audited?
            4. Is there real adoption or just hype?
            5. What happens if this goes to zero?

            **If you can't answer these, you're gambling, not investing.**
            """,
          duration: 13,
          redFlags: [
            "Anonymous development team",
            "Promises of guaranteed returns",
            "Celebrity endorsements (often fake or paid)",
            "No working product, just hype",
          ],
          realExample:
            "Squid Game Token: Rose 75,000% then crashed 99.99% in minutes. Investors couldn't sell - the code prevented it."
        ),
        AntiScamLesson(
          id: "guru-scams",
          title: "Fake Gurus & Course Scams",
          content: """
            **Most people selling courses on how to get rich... got rich selling courses.**

            ## The Fake Guru Playbook

            ### Stage 1: The Flex
            - Rented Lamborghinis
            - Airbnb mansions for photos
            - Screenshots (easily faked)
            - Designer clothes (sometimes knockoffs)

            ### Stage 2: The Hook
            "I was broke, then I discovered this ONE secret..."
            "The wealthy don't want you to know this..."

            ### Stage 3: Free Value (The Trap)
            Give real but basic information for free
            Build trust and following

            ### Stage 4: The Upsell
            - $997 course
            - Then $3,997 "advanced" course
            - Then $10,000 "mastermind"
            - Then $25,000 "inner circle"

            ### Stage 5: Testimonials
            - Pay students to give testimonials
            - Cherry-pick success stories
            - Success is from promoting the course, not the strategy

            ## Red Flags

            ❌ Emphasis on lifestyle over substance
            ❌ Vague about actual methodology
            ❌ Success stories are from promoting THEIR course
            ❌ Constantly launching new courses
            ❌ No verifiable track record
            ❌ Guarantees of income

            ## Legitimate Educators

            ✅ Teach from actual experience
            ✅ Transparent about their income sources
            ✅ Don't need to flex
            ✅ Provide value without pressure
            ✅ Have verifiable credentials
            ✅ Don't guarantee results

            ## The Test

            "How did this person make their money BEFORE selling courses?"

            If the answer is unclear or "selling courses" → Red flag
            """,
          duration: 11,
          redFlags: [
            "Lifestyle flexing (cars, mansions, travel)",
            "Vague about how they made money",
            "Multiple escalating price tiers",
            "Success testimonials are about promoting the course",
          ],
          realExample:
            "Multiple 'Amazon FBA' gurus were caught teaching outdated strategies that no longer work while making millions from course sales."
        ),
      ]
    ),

    // MODULE 3: Digital & Identity Scams
    AntiScamModule(
      id: "digital-scams",
      title: "Digital & Identity Threats",
      icon: "lock.shield",
      lessons: [
        AntiScamLesson(
          id: "phishing",
          title: "Phishing & Impersonation",
          content: """
            **The fake email from your "bank" could cost you everything.**

            ## Phishing Attacks

            ### Email Phishing
            - Looks like it's from Amazon, PayPal, your bank
            - "Your account has been suspended"
            - Link goes to fake login page
            - They capture your credentials

            ### Spear Phishing
            - Targeted at you specifically
            - Uses personal info (from social media, data breaches)
            - More convincing because it's personalized

            ### Smishing (SMS Phishing)
            - Text messages with malicious links
            - "Package delivery" notifications
            - "Verify your account" messages

            ## How To Spot Phishing

            ### Check The Sender
            - Real: support@amazon.com
            - Fake: support@amaz0n-secure.com

            ### Hover Over Links (Don't Click)
            Shows actual URL destination

            ### Look For
            - Urgency ("Your account will be closed!")
            - Generic greetings ("Dear Customer")
            - Grammar/spelling errors
            - Requests for personal info

            ### When In Doubt
            - Don't click links in emails
            - Go directly to the website
            - Call the company using official number (not from the email)

            ## Impersonation Scams

            - Fake customer service (calling YOU)
            - Fake tech support
            - Fake IRS/government
            - Fake utility companies

            **Real companies don't call asking for immediate payment via gift cards.**
            """,
          duration: 10,
          redFlags: [
            "Urgent action required",
            "Sender address doesn't match company",
            "Links that don't go to official domains",
            "Requests for passwords or personal info",
          ],
          realExample:
            "In 2022, a phishing campaign impersonating Microsoft stole credentials from over 10,000 organizations."
        ),
        AntiScamLesson(
          id: "identity-theft",
          title: "Identity Theft Protection",
          content: """
            **Your identity is more valuable than your wallet.**

            ## What Thieves Can Do With Your Identity

            - Open credit cards in your name
            - Take out loans
            - File fake tax returns (steal your refund)
            - Get medical care (ruins YOUR records)
            - Commit crimes (using YOUR identity)

            ## How Identity Gets Stolen

            ### Data Breaches
            - Company databases hacked
            - Your info sold on dark web
            - Nothing you can do to prevent

            ### Social Engineering
            - Phishing emails
            - Phone scams
            - Fake websites

            ### Physical Theft
            - Mail theft
            - Wallet/purse theft
            - Dumpster diving

            ### Social Media
            - Posting too much personal info
            - Birthdate, address, mother's maiden name
            - Vacation posts = "My house is empty"

            ## Protection Steps

            ### Freeze Your Credit (FREE)
            - Equifax, Experian, TransUnion
            - Prevents anyone from opening accounts
            - Unfreeze when YOU need credit
            - **Most important protection**

            ### Monitor
            - Annual free credit reports
            - Bank/credit card alerts
            - Consider paid monitoring service

            ### Secure Your Data
            - Shred financial documents
            - Strong, unique passwords
            - Two-factor authentication
            - Limit social media sharing

            ### What To Do If Compromised
            1. Place fraud alerts
            2. Freeze credit
            3. Report to FTC (identitytheft.gov)
            4. File police report
            5. Contact affected companies

            ## The Cost

            Average victim spends **200+ hours** resolving identity theft.
            Average financial loss: **$1,500+** (can be much more)
            """,
          duration: 12,
          redFlags: [
            "Unexpected bills or collection notices",
            "Unfamiliar accounts on credit report",
            "IRS says you already filed (when you didn't)",
            "Medical bills for services you didn't receive",
          ],
          realExample:
            "The 2017 Equifax breach exposed 147 million Americans' Social Security numbers. If you had credit, you were likely affected."
        ),
      ]
    ),

    // MODULE 4: Protecting Yourself
    AntiScamModule(
      id: "protection",
      title: "Your Protection Playbook",
      icon: "checkmark.shield.fill",
      lessons: [
        AntiScamLesson(
          id: "verification-habits",
          title: "Verification Habits",
          content: """
            **Trust but verify. Actually, just verify.**

            ## The Verification Checklist

            ### Before Giving Money

            ☐ **Sleep on it** - Wait 24-72 hours minimum
            ☐ **Independent research** - Don't use links they provide
            ☐ **Multiple sources** - One positive review isn't enough
            ☐ **Search "[Name/Company] + scam"** - See what comes up
            ☐ **Check BBB/Trustpilot** - With skepticism (can be manipulated)
            ☐ **Verify identity** - Reverse image search photos
            ☐ **Consult someone you trust** - Outside perspective

            ### Before Clicking Links

            ☐ **Hover first** - Check actual destination
            ☐ **Go direct** - Type URL yourself instead
            ☐ **Check for HTTPS** - Though scammers use this too now
            ☐ **When in doubt, don't** - Contact company directly

            ### Before Sharing Info

            ☐ **Who is asking and why?**
            ☐ **Did you initiate the contact?**
            ☐ **Would a legitimate company ask this way?**
            ☐ **What's the worst case if this is a scam?**

            ## Red Flag Review

            🚩 Urgency/pressure to act now
            🚩 Too good to be true
            🚩 Request for unusual payment (gift cards, crypto, wire)
            🚩 Secrecy requested
            🚩 Emotional manipulation
            🚩 Can't be verified independently
            🚩 "Trust me" without evidence

            ## The 24-Hour Rule

            **No legitimate opportunity requires an instant decision.**

            "I need to think about this. I'll get back to you tomorrow."

            If they can't wait, they're not legitimate.
            """,
          duration: 10,
          redFlags: [
            "Resistance to you taking time to decide",
            "Discouraging you from outside research",
            "Only providing their own testimonials",
            "Unusual payment methods requested",
          ],
          realExample:
            "A simple Google search of '[Company] + scam' has saved countless people from losing money. Make it a habit."
        ),
        AntiScamLesson(
          id: "recovery-reporting",
          title: "If You've Been Scammed",
          content: """
            **Getting scammed doesn't make you stupid. Not reporting it helps the scammer continue.**

            ## Immediate Steps

            ### 1. Stop All Contact
            - Block the scammer
            - Don't try to "get your money back" through them
            - They may try "recovery scams" next

            ### 2. Document Everything
            - Save all messages, emails, transactions
            - Screenshot everything
            - Note dates, times, amounts

            ### 3. Report The Scam

            **FTC (Federal Trade Commission)**
            - ReportFraud.ftc.gov
            - Helps track patterns

            **FBI Internet Crime Complaint Center (IC3)**
            - ic3.gov
            - For online scams

            **Your State Attorney General**
            - Consumer protection division

            **CFPB (Consumer Financial Protection Bureau)**
            - For financial product scams

            ### 4. Contact Your Bank/Credit Card

            - Dispute fraudulent charges
            - Cancel compromised cards
            - Enable fraud alerts

            ### 5. Protect Your Identity

            - Change passwords
            - Freeze credit
            - Monitor accounts closely

            ## Money Recovery

            ### Realistic Expectations
            - **Credit card**: Best chance of recovery (chargeback)
            - **Bank wire**: Very difficult to recover
            - **Cryptocurrency**: Almost never recoverable
            - **Gift cards**: Almost never recoverable
            - **Cash**: Gone

            ### Recovery Scams

            ⚠️ **Warning**: After being scammed, you may be targeted by "recovery specialists" who promise to get your money back... for a fee.

            These are ALSO scams. Government agencies don't charge to help you.

            ## Emotional Recovery

            - It's not your fault
            - You were targeted by professionals
            - Shame keeps scammers in business
            - Talking about it helps others avoid the same fate
            """,
          duration: 11,
          redFlags: [
            "Anyone charging money to 'recover' your losses",
            "Promises of guaranteed money recovery",
            "Requests for more money to process recovery",
            "Government agencies don't charge fees",
          ],
          realExample:
            "Reporting scams is critical - the FTC uses reports to identify patterns and shut down scam operations. Your report could save someone else."
        ),
      ]
    ),
  ]
}

// MARK: - Data Models

struct AntiScamModule: Identifiable {
  let id: String
  let title: String
  let icon: String
  let lessons: [AntiScamLesson]
}

struct AntiScamLesson: Identifiable {
  let id: String
  let title: String
  let content: String
  let duration: Int
  let redFlags: [String]
  let realExample: String
}
