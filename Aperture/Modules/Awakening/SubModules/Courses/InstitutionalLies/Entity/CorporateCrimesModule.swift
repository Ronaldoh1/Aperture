// CorporateCrimesModule.swift
// Documented corporate crimes with primary sources

import SwiftUI

struct CorporateCrimesModule: Identifiable {

    let id: String
    let title: String
    let subtitle: String
    let icon: String
    let content: String
    let sources: [String]
    let keyFacts: [String]

}

extension CorporateCrimesModule {

    static let all: [CorporateCrimesModule] = [

        CorporateCrimesModule(
            id: "purdue_opioids",
            title: "Purdue Pharma & The Opioid Crisis",
            subtitle: "500,000+ Deaths for Profit",
            icon: "pills.fill",
            content: """
Purdue Pharma knowingly created an addiction epidemic that has killed over 500,000 Americans, while executives made billions.

**What They Did:**
• Marketed OxyContin as "less addictive" despite knowing it was highly addictive
• Paid doctors to prescribe opioids
• Funded "pain advocacy" groups to push opioid use
• Targeted high-prescribing doctors ("whale hunting")
• Continued aggressive marketing even as deaths mounted

**The Evidence:**
• Internal documents show executives knew about addiction rates
• Sales reps trained to downplay addiction risks
• Company pleaded guilty to federal felony charges in 2020
• Agreed to $8 billion settlement

**The Sackler Family:**
• Made $10-12 billion from OxyContin
• Transferred billions out of Purdue before bankruptcy
• Sought immunity from lawsuits in bankruptcy deal
• No family member has gone to prison

**The Death Toll:**
• 500,000+ opioid overdose deaths since 1999
• 75,000 deaths in 2021 alone
• Millions more addicted
• Communities devastated

**Why It Matters:**
This is not a "drug problem" - it's a crime scene. A corporation deliberately created an addiction crisis for profit, and the architects walked away billionaires.
""",
            sources: [
                "DOJ Press Release: Purdue Pharma Guilty Plea, 2020",
                "State of Massachusetts Complaint Against Purdue",
                "JAMA: Origins of the Opioid Crisis"
            ],
            keyFacts: [
                "500,000+ Americans dead",
                "Purdue pleaded guilty to federal felonies",
                "Sacklers made $10-12 billion",
                "No executives imprisoned"
            ]
        ),

        CorporateCrimesModule(
            id: "vioxx",
            title: "Vioxx Scandal",
            subtitle: "Merck Knew It Killed People",
            icon: "heart.slash.fill",
            content: """
Merck's painkiller Vioxx caused an estimated 27,785 heart attacks and sudden cardiac deaths before being withdrawn - and Merck knew about the risks for years.

**The Timeline:**
• 1999: Vioxx approved by FDA
• 1999: Merck's own study shows doubled heart attack risk
• 2000: Internal Merck emails discuss hiding cardiovascular data
• 2001-2004: Merck continues marketing while deaths mount
• 2004: Vioxx finally withdrawn after 5 years on market

**What Merck Did:**
• Suppressed research showing heart risks
• Trained sales reps with "Dodge Ball Vioxx" guide to deflect safety questions
• Created fake medical journals to publish favorable studies
• Intimidated researchers who raised concerns

**Internal Documents:**
• "The cardiovascular events are clearly there" - internal Merck memo, 2000
• Company created hit list of doctors critical of Vioxx
• Scientists pressured to alter negative study results

**The Settlements:**
• $4.85 billion to settle 27,000 lawsuits
• $950 million criminal and civil settlement
• No executive went to prison

**Why It Matters:**
The "system" worked - eventually. But only after years of deaths while Merck made billions and knew their drug was killing people.
""",
            sources: [
                "FDA Q&A on Vioxx",
                "NEJM: Vioxx Cardiovascular Safety Study",
                "DOJ: Merck Settlement Announcement"
            ],
            keyFacts: [
                "27,785 estimated heart attacks/deaths",
                "Merck knew about risks since 1999",
                "Company trained reps to deflect safety questions",
                "5 years on market after known risks"
            ]
        ),

        CorporateCrimesModule(
            id: "tobacco",
            title: "Big Tobacco's 50-Year Lie",
            subtitle: "They Knew Cigarettes Killed",
            icon: "smoke.fill",
            content: """
For over 50 years, tobacco companies knew cigarettes caused cancer and addiction - and spent billions convincing you they didn't.

**What They Knew:**
• 1950s: Internal research proves cancer link
• 1963: Tobacco execs meet and agree to deny health risks publicly
• 1994: Executives testify to Congress that nicotine is not addictive
• 2006: Federal court rules tobacco companies engaged in 50+ year fraud

**The Playbook They Invented:**
• "Doubt is our product" - internal tobacco memo
• Fund fake "research institutes" to question science
• Create artificial controversy where none exists
• Attack scientists who speak out
• Lobby politicians to block regulation

**This Playbook Is Still Used Today:**
• Climate denial uses same PR firms
• Same strategy: manufacture doubt
• Same tactics: fund friendly "experts"
• Same goal: delay regulation while profits flow

**The Death Toll:**
• 480,000 Americans die from smoking annually
• 8 million worldwide
• Leading cause of preventable death

**Why It Matters:**
Tobacco invented modern corporate propaganda. When you see "experts disagree" on any health or environmental issue, check if the same playbook is running.
""",
            sources: [
                "Surgeon General Report, 1964",
                "Legacy Tobacco Documents Library (UCSF)",
                "United States v. Philip Morris (RICO case, 2006)"
            ],
            keyFacts: [
                "50+ years of deliberate deception",
                "Executives lied under oath to Congress",
                "Created the doubt-manufacturing playbook",
                "480,000 Americans die annually"
            ]
        ),

        CorporateCrimesModule(
            id: "insurance_scam",
            title: "The Insurance Industry",
            subtitle: "Designed to Deny",
            icon: "doc.text.fill",
            content: """
Insurance is not protection. It's a wealth extraction system designed to collect premiums and deny claims.

**How The System Works:**
• You pay premiums monthly/yearly
• Insurance company invests YOUR money
• When you file a claim, they find reasons to deny
• Every dollar paid in claims = less profit
• Their entire model depends on not paying you

**The Math They Don't Want You To Know:**
• 20-30% of premiums go to admin/overhead/profit
• That's your money NOT going to healthcare
• You're collectively paying for each other's care
• Insurance company takes a cut for... existing

**Documented Denial Tactics:**
• Pre-existing condition exclusions
• Claim processing delays until you give up
• Requiring "prior authorization" for emergencies
• "Out of network" surprise billing
• Retrospective claim denials

**Why You Can't Opt Out:**
• Medical care is so expensive you need insurance
• Employers tie health insurance to jobs
• Creates dependency and control
• Lose your job = lose your healthcare

**Why It Doesn't Change:**
• Insurance industry employs millions
• Generates billions in profits
• Profits go to shareholders (including politicians)
• Regulators come from industry (revolving door)

**Why It Matters:**
Health insurance is a system designed to take your money and not give it back. The incentives are explicitly against your interests.
""",
            sources: [
                "Congressional Budget Office: Insurance Market Analysis",
                "Kaiser Family Foundation: Insurance Denial Studies",
                "ProPublica: Insurance Industry Investigations"
            ],
            keyFacts: [
                "20-30% of premiums go to admin/profit",
                "Business model depends on denying claims",
                "Industry creates dependency via employment",
                "Regulators often come from industry"
            ]
        ),

        CorporateCrimesModule(
            id: "1971",
            title: "WTF Happened in 1971",
            subtitle: "When The American Dream Died",
            icon: "chart.line.downtrend.xyaxis",
            content: """
In August 1971, two events fundamentally restructured the American economy - and nobody told you.

**Event 1: The Nixon Shock**
Nixon took America off the gold standard. Before 1971, dollars were backed by gold. After, the government could print unlimited money.

**The Results:**
• 1971 dollar = 14 cents today
• Inflation benefits asset owners, punishes workers
• Wages decoupled from productivity
• Productivity up 60% since 1971, wages up only 16%

**Event 2: The Powell Memo**
Same month, lawyer Lewis Powell wrote a confidential memo to the Chamber of Commerce - a blueprint for corporate takeover of American institutions.

**Powell's Plan:**
• Take over universities
• Take over media
• Take over courts
• Create think tanks to produce "research"
• Get corporate people into government

Two months later, Nixon appointed Powell to the Supreme Court.

**What Died:**
• Single-income families (60% before → impossible now)
• Affordable housing (2x income → 8x income)
• Pensions (company responsibility → your 401k risk)
• The social contract

**Why You Don't Know:**
The people who broke the system own the media, fund the universities, and control the think tanks. They need you to blame yourself.

Visit: WTFhappenedin1971.com - see the charts yourself.
""",
            sources: [
                "WTFhappenedin1971.com",
                "Powell Memo (Lewis F. Powell Jr., 1971)",
                "Federal Reserve Economic Data (FRED)"
            ],
            keyFacts: [
                "Productivity up 60%, wages up 16% since 1971",
                "Nixon Shock enabled unlimited money printing",
                "Powell Memo blueprint for corporate takeover",
                "Housing: 2x income (1971) → 8x income (today)"
            ]
        )

    ]

}
