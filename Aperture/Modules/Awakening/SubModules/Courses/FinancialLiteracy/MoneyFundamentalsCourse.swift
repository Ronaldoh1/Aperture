// MoneyFundamentalsCourse.swift
// Real financial education they should have taught you in school
// Understanding money, debt, and building actual wealth

import Foundation
import SwiftUI

// MARK: - Money Fundamentals Course

struct MoneyFundamentalsCourse {
    
    static let id = "money-fundamentals"
    static let title = "Money Fundamentals"
    static let subtitle = "What they should have taught you in school"
    static let icon = "dollarsign.circle.fill"
    static let color = Color(red: 0.2, green: 0.7, blue: 0.3) // Money green
    static let estimatedTime = "4-5 hours"
    static let premium = false
    
    static let modules: [MoneyModule] = [
        
        // MODULE 1: What Is Money Really?
        MoneyModule(
            id: "money-truth",
            title: "What Is Money Really?",
            icon: "questionmark.circle.fill",
            lessons: [
                MoneyLesson(
                    id: "money-history",
                    title: "The History They Don't Teach",
                    content: """
**Money is NOT what you think it is.**

## The Lie You Were Told
"Money is a medium of exchange backed by gold/government."

## The Truth
Since 1971, the US dollar is backed by **nothing but belief**. Nixon ended the gold standard. Every dollar is created from **debt**.

## How Money Is Actually Created

1. **Banks don't lend existing money** - they create it from thin air when you take a loan
2. **The Federal Reserve is not federal** - it's a private banking cartel
3. **Inflation is a hidden tax** - your savings lose 2-7% value yearly

## The Fractional Reserve Scam

Banks only keep ~10% of deposits. They lend out 90%+.

$100 deposited → Bank can lend $900 (created from nothing)

This is why bank runs happen. The money doesn't exist.

## Why This Matters

- Your labor is exchanged for currency that's constantly losing value
- The system requires infinite growth (impossible on a finite planet)
- Those who understand money accumulate it; those who don't work for it forever

**Awareness is the first step to not being a pawn in someone else's game.**
""",
                    duration: 12,
                    keyTakeaways: [
                        "Money is created from debt, not backed by anything tangible",
                        "The Federal Reserve is a private institution, not government",
                        "Inflation steals your purchasing power silently",
                        "Banks create money when they issue loans"
                    ]
                ),
                MoneyLesson(
                    id: "inflation-theft",
                    title: "Inflation: The Silent Theft",
                    content: """
**Your money is being stolen while you sleep.**

## The Math They Hope You Never Do

If inflation averages 3% per year:
- $10,000 today = **$7,374** in 10 years (purchasing power)
- $10,000 today = **$5,537** in 20 years
- $10,000 today = **$4,120** in 30 years

## Who Benefits From Inflation?

✅ **Debtors** - Pay back loans with cheaper dollars
✅ **Asset owners** - Stocks, real estate rise with inflation  
✅ **The government** - Taxes "gains" that are just inflation
✅ **Banks** - Create money, collect interest

❌ **Savers** - Lose purchasing power
❌ **Workers** - Wages don't keep up
❌ **Fixed income** - Retirees get poorer

## The 2% Target Is A Lie

Central banks target 2% inflation. Why?

Because 0% inflation would mean:
- Debt becomes harder to repay
- Banks make less money
- Government debt becomes a bigger problem

**2% inflation is a policy choice that transfers wealth from workers to asset holders.**

## What To Do

1. **Don't hoard cash** - It's guaranteed to lose value
2. **Own assets** - Things that rise with inflation
3. **Understand that "saving" in dollars is losing**
4. **Debt can be strategic** - If asset grows faster than interest rate
""",
                    duration: 10,
                    keyTakeaways: [
                        "Inflation erodes purchasing power exponentially",
                        "The system is designed to benefit debtors and asset owners",
                        "Cash savings lose value every single day",
                        "2% inflation is a deliberate policy, not natural"
                    ]
                ),
                MoneyLesson(
                    id: "debt-system",
                    title: "The Debt System Explained",
                    content: """
**All money is debt. This changes everything.**

## How The System Works

1. Government needs money → Issues Treasury bonds (IOUs)
2. Federal Reserve "buys" bonds → Creates dollars from nothing
3. Banks receive reserves → Can lend 10x that amount
4. You borrow → Bank creates new money
5. You must repay principal + INTEREST
6. But interest money was never created...

## The Impossible Math

If all money is created as debt with interest, but the interest money doesn't exist, there's ALWAYS more debt than money.

**Someone must always default.** The game is musical chairs.

## Good Debt vs Bad Debt

### Bad Debt (Makes you poorer)
- Credit card debt (15-25% interest)
- Car loans on depreciating assets
- Consumer debt for stuff you don't need
- Payday loans (predatory)

### Strategic Debt (Can make you wealthier)
- Mortgage on appreciating property
- Business loan that generates more than interest
- Education that increases earning power
- Low-interest debt when inflation is higher

## The Credit Score Trap

Your credit score measures **how good you are at being in debt**.
- High score = You've borrowed and repaid (made banks money)
- No debt history = Low score (you haven't played their game)

**They want you in manageable, perpetual debt.**
""",
                    duration: 12,
                    keyTakeaways: [
                        "All money enters circulation as debt",
                        "Interest money is never created - someone must default",
                        "Not all debt is bad - understand the difference",
                        "Credit scores reward being in debt, not being wealthy"
                    ]
                )
            ]
        ),
        
        // MODULE 2: Building Real Wealth
        MoneyModule(
            id: "building-wealth",
            title: "Building Real Wealth",
            icon: "chart.line.uptrend.xyaxis",
            lessons: [
                MoneyLesson(
                    id: "assets-vs-liabilities",
                    title: "Assets vs Liabilities",
                    content: """
**Rich people buy assets. Poor people buy liabilities they think are assets.**

## The Rich Dad Definition

**Asset**: Puts money IN your pocket
**Liability**: Takes money OUT of your pocket

## Common "Assets" That Are Actually Liabilities

### Your House (Primary Residence)
- Takes money: Mortgage, taxes, insurance, maintenance
- Doesn't produce income
- Only "profit" if you sell (and where will you live?)
- **It's a liability disguised as an asset**

### Your Car
- Loses 20% value driving off the lot
- Insurance, gas, maintenance
- Most people buy more car than they need
- **Pure liability**

### Expensive Education
- $100k+ in loans
- No guarantee of income increase
- Interest accruing while studying
- **Can be liability or asset depending on ROI**

## Real Assets

### Cash-flowing Real Estate
- Rent > Mortgage + Expenses = Positive cash flow
- Someone else pays your mortgage
- Appreciates over time + tax benefits

### Businesses
- Systems that make money while you sleep
- Can start small, scale up
- You own the means of production

### Dividend Stocks
- Get paid to own companies
- Compounds over time
- Passive income

### Intellectual Property
- Books, courses, software
- Create once, sell forever

## The Wealth Formula

**Wealth = Assets - Liabilities**

Most people: High income, high liabilities, no assets = Not wealthy
Wealthy people: Income from assets > Expenses = Freedom
""",
                    duration: 14,
                    keyTakeaways: [
                        "Assets put money in your pocket, liabilities take it out",
                        "Your house and car are usually liabilities",
                        "Focus on acquiring cash-flowing assets",
                        "High income ≠ wealth; assets = wealth"
                    ]
                ),
                MoneyLesson(
                    id: "compound-interest",
                    title: "The 8th Wonder of the World",
                    content: """
**"Compound interest is the 8th wonder of the world. He who understands it, earns it; he who doesn't, pays it."** - Often attributed to Einstein

## The Math That Changes Everything

$10,000 invested at 7% annual return:
- Year 10: **$19,672**
- Year 20: **$38,697**
- Year 30: **$76,123**
- Year 40: **$149,745**

## Time Is The Secret Weapon

### Starting at 25 vs 35

**Sarah starts at 25:** $300/month for 10 years, then stops
Total invested: $36,000
At 65: **$472,000**

**Mike starts at 35:** $300/month for 30 years
Total invested: $108,000
At 65: **$340,000**

**Sarah invested 3x LESS but has MORE money.**

## The Rule of 72

Quick mental math: 72 ÷ Interest Rate = Years to double

- 7% return → Doubles in ~10 years
- 10% return → Doubles in ~7 years
- 3% inflation → Purchasing power halves in 24 years

## Working Against You: Credit Card Interest

$5,000 balance at 20% APR, paying minimums:
- Time to pay off: **25+ years**
- Total paid: **$12,000+**
- Interest paid: **$7,000** (more than the original debt!)

## The Lesson

1. Start investing as early as possible
2. Avoid high-interest debt at all costs
3. Let time do the heavy lifting
4. Small amounts matter when they compound
""",
                    duration: 10,
                    keyTakeaways: [
                        "Time is more important than amount when compounding",
                        "Starting 10 years earlier can double your wealth",
                        "The Rule of 72 helps calculate doubling time",
                        "Credit card interest compounds AGAINST you"
                    ]
                ),
                MoneyLesson(
                    id: "emergency-fund",
                    title: "Your Financial Foundation",
                    content: """
**Before investing a single dollar, build your foundation.**

## The Emergency Fund

### Why It's Non-Negotiable

- Job loss happens (average job search: 5 months)
- Medical emergencies
- Car breakdowns
- Life happens

Without it: You go into debt → Pay interest → Fall further behind

### How Much?

**Minimum**: 3 months of expenses
**Ideal**: 6 months of expenses
**High security**: 12 months

### Where To Keep It

- High-yield savings account (NOT regular savings)
- Money market account
- Short-term Treasury bills

**NOT** in investments - you need it accessible, not volatile

## The Hierarchy of Financial Priorities

1. **Survival** - Food, shelter, utilities, basic transport
2. **Employer 401k match** - Free money, always take it
3. **High-interest debt** - Pay off anything over 7%
4. **Emergency fund** - 3-6 months
5. **Investing** - Only after above is solid

## Common Mistakes

❌ Investing before paying off 20% credit card debt
❌ No emergency fund, then crisis hits → more debt
❌ Keeping emergency fund in checking (too accessible)
❌ "Investing" emergency fund (too volatile)

## The Peace of Mind

An emergency fund isn't just money - it's **freedom**.

- Negotiate salary from strength, not desperation
- Walk away from toxic jobs
- Handle life's curveballs without panic
- Sleep better at night

**Financial security is the foundation of all other security.**
""",
                    duration: 8,
                    keyTakeaways: [
                        "Emergency fund comes BEFORE investing",
                        "3-6 months of expenses minimum",
                        "Keep it liquid and accessible, not invested",
                        "Financial security enables all other freedoms"
                    ]
                )
            ]
        ),
        
        // MODULE 3: Income & Career
        MoneyModule(
            id: "income-career",
            title: "Maximizing Your Income",
            icon: "briefcase.fill",
            lessons: [
                MoneyLesson(
                    id: "salary-negotiation",
                    title: "Negotiation: Money You're Leaving On The Table",
                    content: """
**Most people lose $500,000+ over their career by not negotiating.**

## Why People Don't Negotiate

- Fear of rejection
- Don't want to seem greedy
- Think salary is fixed
- Don't know their worth

## The Truth

- **73% of employers expect negotiation**
- First offer is almost never the best offer
- Not negotiating signals you undervalue yourself
- Companies budget for negotiation

## How To Negotiate

### 1. Research First
- Glassdoor, Levels.fyi, LinkedIn Salary
- Know the range for your role/location
- Talk to people in similar positions

### 2. Let Them Go First
"I'm flexible on compensation. What's the range for this role?"

### 3. Anchor High (But Reasonable)
Ask for 10-20% above your target
They'll negotiate down to your actual goal

### 4. Use Silence
After they make an offer, pause. Count to 10 silently.
Uncomfortable silence often gets a better offer.

### 5. Negotiate Beyond Salary
- Signing bonus
- Extra vacation days
- Remote work options
- Stock options/equity
- Professional development budget

### 6. Get It In Writing
Verbal offers mean nothing. Always get the final offer in writing.

## The Math

Starting salary: $70,000 vs $75,000 (one negotiation)
Over 40 years at 3% raises:
- Lower: $3.7 million lifetime
- Higher: **$4.0 million lifetime**

**One conversation = $300,000+**
""",
                    duration: 12,
                    keyTakeaways: [
                        "73% of employers expect you to negotiate",
                        "Not negotiating costs hundreds of thousands over a career",
                        "Always research market rates first",
                        "Negotiate total compensation, not just salary"
                    ]
                ),
                MoneyLesson(
                    id: "multiple-income",
                    title: "The Myth of One Income",
                    content: """
**Relying on one income source is the riskiest financial position possible.**

## Types of Income

### 1. Active Income (Trading time for money)
- Salary/wages
- Freelance/consulting
- Gig work

**Problem**: Limited by hours in a day

### 2. Passive Income (Money working for you)
- Dividends from stocks
- Rental income
- Business profits (when systematized)
- Royalties (books, music, patents)
- Interest income

### 3. Portfolio Income
- Capital gains from selling investments
- Not truly "passive" but not hourly either

## Building Multiple Streams

### Phase 1: Maximize Active Income
- Get really good at something valuable
- Negotiate, job hop strategically
- Build skills that compound

### Phase 2: Save & Invest Aggressively
- 20-50% of income if possible
- Index funds for most people
- Let compound interest work

### Phase 3: Add Side Income
- Freelance your skills
- Create content (YouTube, courses, books)
- Build small businesses

### Phase 4: True Passive Income
- Dividend portfolio
- Rental properties
- Automated businesses

## The Goal: Financial Independence

When passive income > expenses, you're free.

Not "retire and do nothing" - but **work becomes optional**.

## Warning Signs You're Too Dependent

- Panic when thinking about job loss
- Can't take risks because of bills
- Feel trapped in a job you hate
- One client/employer = 100% of income
""",
                    duration: 11,
                    keyTakeaways: [
                        "One income source is high risk",
                        "Build skills before building passive income",
                        "Financial independence = passive income > expenses",
                        "Multiple streams provide security and options"
                    ]
                )
            ]
        ),
        
        // MODULE 4: Taxes & Protection
        MoneyModule(
            id: "taxes-protection",
            title: "Taxes & Protecting Wealth",
            icon: "shield.lefthalf.filled",
            lessons: [
                MoneyLesson(
                    id: "tax-basics",
                    title: "Taxes: The Game Is Rigged (Learn The Rules)",
                    content: """
**The tax code is 6,000+ pages. It's written for those who read it.**

## How The Rich Pay Less

Middle class: Earns salary → Pays taxes → Spends what's left
Wealthy: Earns → Spends through business → Pays taxes on what's left

### Legal Tax Strategies

**1. 401(k) / IRA**
- Money goes in pre-tax
- Grows tax-free
- Pay taxes later (hopefully at lower rate)

**2. Roth IRA**
- Money goes in after-tax
- Grows tax-free
- Withdrawals tax-free forever

**3. Health Savings Account (HSA)**
- Triple tax advantage
- Deductible going in
- Grows tax-free
- Tax-free for medical expenses

**4. Real Estate**
- Depreciation (paper losses)
- 1031 exchanges (defer gains forever)
- Mortgage interest deduction

**5. Business Expenses**
- Home office deduction
- Vehicle expenses
- Education/training
- Equipment

## Tax Buckets

**Taxable accounts**: Pay taxes every year on gains
**Tax-deferred** (401k, traditional IRA): Pay later
**Tax-free** (Roth, HSA): Never pay again

## The Lesson

- Max out tax-advantaged accounts first
- Understand which bucket your money is in
- Legal tax avoidance ≠ illegal tax evasion
- Rich people hire accountants; you should too (eventually)
""",
                    duration: 12,
                    keyTakeaways: [
                        "The tax code rewards those who understand it",
                        "Tax-advantaged accounts are powerful wealth tools",
                        "Business owners have more deduction options",
                        "Tax avoidance is legal; tax evasion is not"
                    ]
                ),
                MoneyLesson(
                    id: "protecting-wealth",
                    title: "Protecting What You Build",
                    content: """
**Building wealth means nothing if you can't keep it.**

## Insurance: Boring But Essential

### Must-Have Insurance
- **Health insurance** - #1 cause of bankruptcy is medical bills
- **Auto insurance** - Required, get enough liability
- **Renter's/Homeowner's** - Protect your stuff
- **Disability insurance** - Your ability to earn is your biggest asset

### As You Build Wealth
- **Umbrella insurance** - Extra liability protection
- **Term life insurance** - If others depend on your income
- **Long-term care** - For later in life

### Insurance Scams
- Whole life insurance (usually bad deal)
- Extended warranties (profit centers for stores)
- Insurance on small purchases

## Estate Planning

### Basic Documents Everyone Needs
- **Will** - Who gets what when you die
- **Power of Attorney** - Who manages affairs if incapacitated
- **Healthcare Directive** - Medical wishes
- **Beneficiary designations** - Check all accounts

### As Wealth Grows
- Trusts (avoid probate, protect assets)
- Tax planning for inheritance
- Business succession planning

## Digital Security

- Unique passwords for financial accounts
- Two-factor authentication everywhere
- Check credit reports regularly
- Freeze credit if not actively using

## The Mindset

**Offense** (making money) gets attention.
**Defense** (protecting money) builds lasting wealth.

Most people ignore protection until it's too late.
""",
                    duration: 10,
                    keyTakeaways: [
                        "Health and disability insurance are non-negotiable",
                        "Basic estate documents protect your family",
                        "Digital security prevents theft",
                        "Defense (protection) is as important as offense (earning)"
                    ]
                )
            ]
        )
    ]
}

// MARK: - Data Models

struct MoneyModule: Identifiable {
    let id: String
    let title: String
    let icon: String
    let lessons: [MoneyLesson]
}

struct MoneyLesson: Identifiable {
    let id: String
    let title: String
    let content: String
    let duration: Int // minutes
    let keyTakeaways: [String]
}
