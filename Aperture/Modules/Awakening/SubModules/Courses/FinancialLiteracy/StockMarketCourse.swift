// StockMarketCourse.swift
// Real stock market education - not "get rich quick"
// Understanding markets, investing, and not getting played

import Foundation
import SwiftUI

// MARK: - Stock Market Course

struct StockMarketCourse {
    
    static let id = "stock-market-fundamentals"
    static let title = "Stock Market Decoded"
    static let subtitle = "Investing vs gambling - know the difference"
    static let icon = "chart.xyaxis.line"
    static let color = Color.blue
    static let estimatedTime = "4-5 hours"
    static let premium = false
    
    static let modules: [StockModule] = [
        
        // MODULE 1: What Is The Stock Market?
        StockModule(
            id: "market-basics",
            title: "The Market Demystified",
            icon: "building.columns.fill",
            lessons: [
                StockLesson(
                    id: "what-is-stock",
                    title: "What Is A Stock, Really?",
                    content: """
**A stock is ownership in a company. That's it.**

## The Simple Truth

When you buy a stock, you buy a tiny piece of that company.

- **1 share of Apple** = You own ~0.0000000006% of Apple
- **Sounds small**, but you're entitled to that % of:
  - Company profits (dividends)
  - Company assets (if liquidated)
  - Voting rights (usually)

## Why Do Stock Prices Change?

### The Real Answer
**Supply and demand.** More buyers than sellers = price goes up.

### What Drives Supply/Demand

**Fundamentals** (long-term)
- Company earnings
- Revenue growth
- Industry trends
- Economic conditions

**Sentiment** (short-term)
- News (real and fake)
- Fear and greed
- Hype and trends
- Tweets from billionaires

## The Market Isn't A Casino (Unless You Make It One)

### Gambling
- Buying based on tips
- Day trading
- Options you don't understand
- "Feeling lucky"

### Investing
- Buying quality companies
- Holding long-term
- Understanding what you own
- Systematic approach

## The Ownership Mindset

Ask yourself: "Would I be happy owning this entire company?"

If you wouldn't want to own the whole business, why own a piece?
""",
                    duration: 10,
                    keyPoint: "Stocks are ownership in real businesses, not lottery tickets."
                ),
                StockLesson(
                    id: "market-structure",
                    title: "How The Market Actually Works",
                    content: """
**Understanding the game before you play.**

## The Players

### Retail Investors (You)
- Individual people investing their own money
- ~15-25% of market volume
- Often buy at the worst times (emotional)

### Institutional Investors
- Pension funds, mutual funds, hedge funds
- Move billions of dollars
- Have research teams, algorithms
- **75%+ of market volume**

### Market Makers
- Provide liquidity (always ready to buy/sell)
- Make money on the spread
- Keep markets functioning

### High-Frequency Traders (HFT)
- Algorithms trading in milliseconds
- Front-run orders
- ~50% of daily volume
- You can't compete with them on speed

## The Uncomfortable Truth

You are NOT competing on a level playing field.

Institutions have:
- Information faster than you
- Better analysis than you
- Lower fees than you
- More patience than you

## Your Advantages

1. **Time horizon** - You can hold forever, funds have redemption pressure
2. **Size** - Small positions let you buy what institutions can't
3. **No benchmark** - You don't need to beat the market every quarter
4. **Patience** - You can wait for the right opportunity

## The Edge

**Don't try to out-trade institutions. Out-patience them.**
""",
                    duration: 12,
                    keyPoint: "You can't beat institutions at their game. Play a different game."
                )
            ]
        ),
        
        // MODULE 2: Investment Approaches
        StockModule(
            id: "investment-approaches",
            title: "Investment Approaches",
            icon: "map.fill",
            lessons: [
                StockLesson(
                    id: "index-investing",
                    title: "Index Funds: The Boring Path To Wealth",
                    content: """
**Most professional fund managers can't beat the market. You probably can't either.**

## The Data

Over 15 years:
- **92% of large-cap fund managers** failed to beat the S&P 500
- **95% of mid-cap fund managers** failed
- **93% of small-cap fund managers** failed

After fees, active management is a losing game for most.

## What Is An Index Fund?

Instead of picking stocks, you buy a piece of EVERYTHING.

**S&P 500 Index Fund**
- Owns 500 largest US companies
- Automatically rebalances
- Very low fees (0.03-0.20%)
- Instant diversification

## The Power of Index Investing

$10,000 invested in S&P 500 index in 1980:
- Worth **$1,000,000+** today
- Just holding, reinvesting dividends
- Through crashes, recessions, panics

## Why Most People Fail

- Try to time the market
- Sell during downturns (buy high, sell low)
- Chase hot stocks/sectors
- Trade too much (fees + taxes)

## The Simple Strategy

1. Buy total market index funds
2. Invest consistently (every paycheck)
3. Don't sell when it drops
4. Wait decades
5. Retire wealthy

**This beats 90%+ of professional investors.**

## When Index Investing Falls Short

- If you can identify truly exceptional businesses
- If you have an edge in a specific industry
- If you enjoy researching companies (as a hobby, not YOLO)
""",
                    duration: 11,
                    keyPoint: "Index funds beat 90%+ of professionals. Boring works."
                ),
                StockLesson(
                    id: "value-investing",
                    title: "Value Investing: Buying Quality On Sale",
                    content: """
**"Price is what you pay. Value is what you get."** - Warren Buffett

## The Value Mindset

Imagine you're buying the whole business, not just a stock ticker.

Would you pay:
- $1 million for a business earning $10,000/year? (100 years to break even)
- $1 million for a business earning $200,000/year? (5 years to break even)

## Key Value Metrics

### Price-to-Earnings (P/E)
- Stock price ÷ Earnings per share
- Lower = potentially cheaper
- S&P 500 historical average: ~15-17
- Context matters (growth companies have higher P/E)

### Price-to-Book (P/B)
- Stock price ÷ Book value per share
- Book value = Assets - Liabilities
- Below 1 = Trading below liquidation value

### Free Cash Flow
- Cash left after expenses
- What the company can actually pay you
- More reliable than "earnings" (which can be manipulated)

## Margin of Safety

**Never pay full price.**

If you calculate a stock is worth $100:
- Don't buy at $100
- Wait for $70 or less
- Room for error + built-in profit

## Value Traps

Sometimes stocks are cheap for good reason:
- Industry dying
- Management problems
- Disruption coming
- Accounting fraud

**Cheap ≠ Good value**

## The Patience Required

- Value stocks can stay undervalued for YEARS
- You need conviction and time horizon
- Emotional discipline is the hardest part
""",
                    duration: 13,
                    keyPoint: "Value = Quality business + Reasonable price + Margin of safety"
                ),
                StockLesson(
                    id: "growth-investing",
                    title: "Growth Investing: The Double-Edged Sword",
                    content: """
**Growth investing works until it doesn't.**

## The Appeal

Buy companies growing fast → Stock price follows growth → Profit

**Examples of success:**
- Amazon 1997-2020: +100,000%+
- Tesla 2010-2021: +20,000%+
- Netflix 2002-2021: +30,000%+

## The Trap

For every Amazon, there are 100 companies that:
- Grew fast, then died
- Never became profitable
- Were disrupted by the next thing
- Overpromised and underdelivered

## What Growth Investors Pay For

- **Revenue growth** - Ideally 20%+ annually
- **Market opportunity** - How big can this get?
- **Competitive advantage** - Why won't competitors eat them?
- **Management** - Can they execute?

## The Valuation Problem

Growth stocks often trade at:
- P/E of 50, 100, 500, or "N/A" (no earnings)
- Price-to-Sales ratios of 20x+
- "Future value" that may never arrive

## When Growth Investing Works

✅ Early in a new industry
✅ Clear competitive moat
✅ Strong unit economics
✅ Long runway for growth

## When It Fails

❌ Growth slows (even slightly)
❌ Interest rates rise (future cash flows worth less)
❌ Competition increases
❌ The story changes

## The Reality Check

**Can you hold through a 50% drawdown?**

Growth stocks can drop 50-80% and still be "good" companies.
If you'll panic sell, stick to index funds.
""",
                    duration: 12,
                    keyPoint: "Growth investing requires conviction to hold through massive volatility."
                )
            ]
        ),
        
        // MODULE 3: The Psychology of Investing
        StockModule(
            id: "psychology",
            title: "The Psychology of Investing",
            icon: "brain.head.profile",
            lessons: [
                StockLesson(
                    id: "behavioral-traps",
                    title: "Behavioral Traps That Destroy Returns",
                    content: """
**Your brain is wired to lose money in the stock market.**

## The Data

Average stock fund return (2001-2020): **7.5%**
Average stock fund investor return: **5.7%**

**Where did 1.8% go?** Bad timing from emotional decisions.

## The Traps

### 1. Loss Aversion
Losses hurt 2x more than gains feel good.
→ You sell winners too early, hold losers too long

### 2. Recency Bias
Whatever happened recently will continue.
→ Buy after stocks rise, sell after they fall (opposite of correct)

### 3. Confirmation Bias
Seek info that confirms what you believe.
→ Ignore red flags in stocks you own

### 4. Herding
Safety in numbers, follow the crowd.
→ Buy hyped stocks at peaks, sell panics at bottoms

### 5. Overconfidence
A few wins = "I'm a genius!"
→ Take bigger risks, eventually blow up

### 6. Anchoring
Focused on purchase price, not current reality.
→ "I'll sell when it gets back to my buy price" (it may never)

## The Solutions

1. **Automate** - Dollar cost average, no decisions
2. **Write it down** - Investment thesis before buying
3. **Zoom out** - Look at 10-year charts, not daily
4. **Have rules** - When to buy, when to sell, predetermined
5. **Sleep on it** - 48-hour rule before any trade

## The Ultimate Test

**If stocks didn't show prices for 10 years, would you still want to own this company?**
""",
                    duration: 11,
                    keyPoint: "Most investor underperformance comes from emotional decisions."
                ),
                StockLesson(
                    id: "market-crashes",
                    title: "Market Crashes: The Test Of Character",
                    content: """
**Crashes are when investors are made or broken.**

## History's Crashes

| Crash | Drop | Recovery Time |
|-------|------|---------------|
| 1929 | -89% | 25 years |
| 1987 | -34% | 2 years |
| 2000-02 | -49% | 7 years |
| 2008-09 | -57% | 4 years |
| 2020 | -34% | 5 months |

## What Happens During Crashes

1. Initial drop - "Buying opportunity!"
2. More drop - "Hmm, concerning..."
3. Big drop - "This is different, the end is here"
4. Capitulation - "I can't take it anymore" (SELL)
5. Recovery - "I should have held" (too late)

## The Math of Recovery

If you sell at -50% and wait for "clarity," you miss the rebound.

**Missing the 10 best days** (1990-2020):
- S&P 500 return: 7.47%
- Without 10 best days: 3.35%

Best days often come during the worst times.

## What Actually Works

### During The Crash
- Don't check your portfolio obsessively
- Reread your investment thesis
- Remember: Paper losses aren't real losses
- If anything, buy MORE (if you have cash)

### Prepare Before Crashes
- Only invest money you won't need for 10+ years
- Have emergency fund separate from investments
- Know your risk tolerance BEFORE the test
- Write a "Crash Plan" now, follow it later

## Reframe The Crash

**Stocks are on sale.**

Would you be upset if your favorite store had 50% off everything?

Same products, lower prices. That's a crash for long-term investors.
""",
                    duration: 12,
                    keyPoint: "Crashes are when the biggest gains become available - if you don't sell."
                )
            ]
        ),
        
        // MODULE 4: Practical Investing
        StockModule(
            id: "practical",
            title: "Practical Investing",
            icon: "gearshape.fill",
            lessons: [
                StockLesson(
                    id: "getting-started",
                    title: "Actually Getting Started",
                    content: """
**Analysis paralysis kills more investment returns than bad picks.**

## Start Here

### Step 1: Choose A Brokerage
Low-cost, reputable options:
- Fidelity
- Vanguard
- Charles Schwab
- (These all have $0 commission)

Avoid: Robinhood's gamified interface encourages bad behavior

### Step 2: Open These Accounts

**Roth IRA** (if eligible)
- Tax-free growth forever
- Max: $6,500/year (2023)

**401(k)** (if employer offers)
- Pre-tax contributions
- Get full employer match (free money)

**Taxable Brokerage** (after maxing above)
- No tax advantages
- No contribution limits

### Step 3: Your First Investment

**Keep it simple:**
- VTI (Total US Stock Market)
- VXUS (Total International Stock Market)
- BND (Total Bond Market, if older/conservative)

One or all three. You now own thousands of companies.

### Step 4: Automate

Set up automatic investment:
- Every paycheck
- Same amount
- Same fund(s)
- Never think about it

### Step 5: Forget About It

Seriously. Check quarterly at most.

## What NOT To Do First

❌ Pick individual stocks
❌ Try options trading
❌ "Time" your entry
❌ Read financial news daily
❌ Watch CNBC

## The Power of Starting

$300/month at 7% return:
- After 10 years: $52,000
- After 20 years: $157,000
- After 30 years: $367,000
- After 40 years: $791,000

Start now. Perfect the strategy later.
""",
                    duration: 10,
                    keyPoint: "Starting imperfectly beats waiting for perfect conditions."
                ),
                StockLesson(
                    id: "portfolio-construction",
                    title: "Building Your Portfolio",
                    content: """
**Diversification is the only free lunch in investing.**

## The Core-Satellite Approach

### Core (70-90% of portfolio)
- Broad market index funds
- Set it and forget it
- Low fees, automatic diversification

### Satellite (10-30% of portfolio)
- Individual stocks you believe in
- Sector bets if you have an edge
- "Fun money" you can afford to lose

## Asset Allocation By Age

**Old Rule**: "100 minus your age = stocks"
- Age 25: 75% stocks, 25% bonds
- Age 50: 50% stocks, 50% bonds

**Modern View** (people live longer):
- Age 25: 90-100% stocks
- Age 50: 70-80% stocks
- Age 65+: 50-60% stocks

## Rebalancing

Annually, reset to target allocation.

If stocks grew and are now 80% (target: 70%):
- Sell some stocks
- Buy more bonds
- Back to 70/30

This forces "sell high, buy low."

## International Diversification

- US is ~60% of world stock market
- 40% of opportunities are elsewhere
- Reduces single-country risk

Suggested: 60-70% US, 30-40% International

## What About Bonds?

**Pros**
- Lower volatility
- Income
- Protection in stock crashes

**Cons**
- Lower long-term returns
- Interest rate risk
- May not keep up with inflation

**Young investors**: Can hold 100% stocks if stomach the volatility
**Approaching retirement**: Bonds reduce risk when you'll need the money
""",
                    duration: 11,
                    keyPoint: "Core index funds + small satellite positions = balanced approach."
                )
            ]
        )
    ]
}

// MARK: - Data Models

struct StockModule: Identifiable {
    let id: String
    let title: String
    let icon: String
    let lessons: [StockLesson]
}

struct StockLesson: Identifiable {
    let id: String
    let title: String
    let content: String
    let duration: Int
    let keyPoint: String
}
