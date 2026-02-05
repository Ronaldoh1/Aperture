// CryptoCourse.swift
// Cryptocurrency: Understanding without the hype
// The technology, the risks, and the reality

import Foundation
import SwiftUI

// MARK: - Crypto Course

struct CryptoCourse {
    
    static let id = "crypto-fundamentals"
    static let title = "Crypto Without The Hype"
    static let subtitle = "Understanding blockchain, not gambling"
    static let icon = "bitcoinsign.circle.fill"
    static let color = Color.orange
    static let estimatedTime = "4-5 hours"
    static let premium = false
    
    static let modules: [CryptoModule] = [
        
        // MODULE 1: What Is Cryptocurrency?
        CryptoModule(
            id: "crypto-basics",
            title: "What Is Cryptocurrency?",
            icon: "doc.text.magnifyingglass",
            lessons: [
                CryptoLesson(
                    id: "blockchain-explained",
                    title: "Blockchain Explained (No Buzzwords)",
                    content: """
**Strip away the hype. What is this actually?**

## The Core Problem It Solves

How do you prove something happened without trusting a middleman?

**Traditional way**: Banks keep the ledger. We trust them (or have to).
**Blockchain way**: Everyone keeps a copy. No single point of trust needed.

## What Is A Blockchain?

A blockchain is a **ledger** (list of transactions) that is:

1. **Distributed** - Thousands of computers have copies
2. **Immutable** - Can't change old entries
3. **Transparent** - Anyone can verify
4. **Decentralized** - No single controller

## How It Works (Simplified)

1. You send crypto to someone
2. Transaction goes to network
3. Computers (nodes) verify it's valid
4. Transaction added to "block"
5. Block added to "chain"
6. Everyone's copy updated
7. Transaction is permanent

## Why Can't It Be Hacked?

To change a transaction, you'd need to:
- Control 51%+ of all computing power
- Redo all work since that transaction
- Do this faster than the honest network

**Economically and practically impossible** for established chains.

## What Blockchain Is NOT

❌ Not inherently fast (often slower than Visa)
❌ Not private (most are public ledgers)
❌ Not free (transaction fees can be high)
❌ Not the solution to everything

## When Blockchain Makes Sense

✅ When trust is a problem
✅ When intermediaries are extractive
✅ When censorship is a concern
✅ When global, permissionless access matters
""",
                    duration: 12,
                    honestTake: "Blockchain is genuinely innovative technology. Most crypto projects abuse the term without delivering the benefits."
                ),
                CryptoLesson(
                    id: "bitcoin-basics",
                    title: "Bitcoin: The Original",
                    content: """
**Bitcoin is not just another crypto. It's the foundation.**

## What Makes Bitcoin Different

- **First** - Created 2009, has the longest track record
- **Most decentralized** - No company, no CEO, no foundation with real power
- **Fixed supply** - Only 21 million will ever exist
- **Most secure** - Highest hash rate (computing power securing it)

## The Original Vision

Satoshi Nakamoto's whitepaper goal:
"A purely peer-to-peer version of electronic cash"

No banks. No intermediaries. No censorship.

## What Bitcoin Actually Is Today

**Digital Gold** (Store of value)
- Limited supply
- Hard to confiscate
- Global, borderless
- 24/7 market

**Not great for payments** (yet)
- Slow (7 transactions/second vs Visa's 24,000)
- High fees during congestion
- Layer 2 solutions (Lightning Network) improving this

## The Investment Case

### Bull Case
- Digital gold for the internet age
- Hedge against currency debasement
- Institutional adoption growing
- Finite supply vs infinite money printing

### Bear Case
- No intrinsic value (doesn't produce anything)
- Environmental concerns (energy use)
- Regulatory risk
- Volatility makes it unusable as currency

## The Honest Reality

Bitcoin has:
- Survived 14+ years and every attack
- Gone through multiple 80%+ crashes and recovered
- Gained institutional legitimacy
- NOT become mainstream payment system

**It may succeed as digital gold while failing as digital cash.**
""",
                    duration: 13,
                    honestTake: "Bitcoin's value is real but speculative. It's survived 14 years but still might fail. Position size should reflect uncertainty."
                ),
                CryptoLesson(
                    id: "altcoins-reality",
                    title: "Altcoins: The Harsh Reality",
                    content: """
**99% of altcoins will go to zero. That's not hyperbole.**

## What Are Altcoins?

Everything that isn't Bitcoin:
- Ethereum (ETH)
- Solana, Cardano, etc. (Layer 1s)
- Thousands of tokens
- Memecoins

## The Data

Of the top 100 coins in 2017:
- Only ~20 are still in the top 100
- Many have lost 90%+ even in bull markets
- Some have literally gone to zero

## Categories of Altcoins

### Layer 1 Blockchains (Ethereum, Solana, etc.)
- Trying to be "better Bitcoin" or platform for apps
- Some have real usage and development
- High risk, but legitimate technology plays

### DeFi Tokens (Uniswap, Aave, etc.)
- Governance tokens for protocols
- Often have real revenue and usage
- Still very risky, unproven long-term

### Memecoins (Dogecoin, Shiba, etc.)
- No utility, purely speculative
- Gambling, not investing
- Some have made money; many more have lost everything

### Scam/Cash Grab Tokens (95% of launches)
- Created to enrich founders
- Pump and dump vehicles
- Will go to zero

## The VC Game

How altcoins really work:
1. VCs invest at $0.01/token
2. Hype machine activates
3. Public buys at $1.00/token
4. VCs dump on retail
5. Price crashes
6. Retail holds bags

**You are the exit liquidity.**

## If You Still Want Altcoins

- Stick to top 10-20 by market cap
- Understand the technology
- Position size = money you can lose 100%
- Take profits on the way up
- Don't believe the hype
""",
                    duration: 14,
                    honestTake: "Most altcoin investors lose money. The few who get rich are either early insiders or extremely lucky. The house usually wins."
                )
            ]
        ),
        
        // MODULE 2: The Risks
        CryptoModule(
            id: "crypto-risks",
            title: "The Real Risks",
            icon: "exclamationmark.triangle.fill",
            lessons: [
                CryptoLesson(
                    id: "volatility",
                    title: "Volatility: Can You Handle It?",
                    content: """
**If 80% losses would make you sell, you shouldn't be here.**

## Bitcoin's Drawdowns

| Period | Drop |
|--------|------|
| 2011 | -94% |
| 2013-2015 | -84% |
| 2017-2018 | -83% |
| 2021-2022 | -77% |

And Bitcoin is the "safe" one.

## The Psychological Reality

Imagine this:
- You invest $10,000
- It grows to $50,000 (feels amazing)
- It drops to $10,000 (now it feels like you LOST $40,000)
- You can't sleep, constantly checking price
- You sell at $8,000 (can't take it)
- It rebounds to $30,000 (without you)

**This is what actually happens to most people.**

## Why Volatility Exists

- Small market (compared to stocks)
- 24/7 trading
- High leverage available
- Emotional, retail-driven market
- No fundamentals to anchor to
- Whales (big holders) can move market

## Protecting Yourself

### Position Sizing
Only invest what you can watch go to zero without changing your life.
- 1-5% of portfolio = reasonable
- 50%+ of portfolio = gambling addiction

### Time Horizon
- Short-term: Pure gambling
- 4+ years: Captures full cycles (historically)

### No Leverage
Leverage + volatility = liquidation
80% drop × 2x leverage = You're wiped out before recovery

### Dollar Cost Average
Buy same amount weekly/monthly regardless of price
Removes timing decisions and emotional trading
""",
                    duration: 11,
                    honestTake: "If you're checking prices hourly or losing sleep, you own too much. Reduce position until you can ignore it for months."
                ),
                CryptoLesson(
                    id: "security-risks",
                    title: "Security: Not Your Keys, Not Your Coins",
                    content: """
**Unlike banks, there's no customer service. Mistakes are permanent.**

## Exchange Risks

### Exchanges That Have Failed
- Mt. Gox (2014) - 850,000 BTC lost
- QuadrigaCX (2019) - $190 million inaccessible
- FTX (2022) - $8 billion+ missing

### When You Leave Crypto On An Exchange
- The exchange holds your coins
- You have an IOU
- If they get hacked or go bankrupt, you might lose everything

## Self-Custody

**"Not your keys, not your coins"**

### Hot Wallets (Software)
- On your phone/computer
- Convenient
- Connected to internet = hackable

### Cold Wallets (Hardware)
- Dedicated device (Ledger, Trezor)
- Offline until you use it
- Much more secure
- Recommended for significant amounts

## Security Best Practices

### Must Do
- Hardware wallet for anything you can't afford to lose
- Write down seed phrase on paper (NOT digital)
- Store seed phrase in safe/safety deposit box
- Never share seed phrase with anyone
- Use unique, strong passwords
- Enable 2FA everywhere

### Common Mistakes
- Storing seed phrase in cloud/email/photos
- Using SMS for 2FA (can be SIM swapped)
- Clicking links in DMs
- "Customer support" asking for credentials
- Entering seed phrase anywhere online

## If Something Goes Wrong

**No recovery.** Unlike a bank:
- No password reset
- No fraud protection  
- No customer service
- No reversals

**Your security is your responsibility.**
""",
                    duration: 12,
                    honestTake: "The freedom of self-custody comes with total responsibility. Most hacks are user error, not blockchain failures."
                ),
                CryptoLesson(
                    id: "regulatory-risk",
                    title: "Regulatory & Legal Risks",
                    content: """
**Governments are still figuring out what to do with crypto.**

## Current Regulatory Landscape

### United States
- SEC: Many tokens are unregistered securities
- IRS: Crypto is property, every trade is taxable
- Increasing enforcement actions
- No clear framework yet

### Globally
- China: Banned
- El Salvador: Legal tender
- EU: MiCA regulation incoming
- Most countries: Gray area

## What Could Happen

### Positive Scenarios
- Clear, favorable regulation
- Bitcoin ETF approval (happened 2024)
- Institutional adoption framework

### Negative Scenarios
- Stricter KYC requirements
- Heavy taxation
- Bans on self-custody
- DeFi regulation/restrictions

## Tax Reality

**In the US, every transaction is taxable:**
- Selling crypto for fiat = taxable
- Trading crypto for crypto = taxable
- Buying things with crypto = taxable
- Receiving crypto as payment = taxable

### Common Tax Mistakes
- Not tracking cost basis
- Assuming losses can offset unlimited gains (there are limits)
- Not reporting (IRS is watching)
- Using foreign exchanges to avoid KYC

### What You Need
- Track every transaction
- Use crypto tax software
- Consult a crypto-savvy CPA
- Report everything

## The Uncomfortable Truth

Crypto exists in regulatory limbo. What's legal today might not be tomorrow.

**This is real risk.** Factor it into your investment thesis.
""",
                    duration: 11,
                    honestTake: "Regulatory risk is real and underappreciated. The rules could change dramatically in either direction."
                )
            ]
        ),
        
        // MODULE 3: Investing Responsibly
        CryptoModule(
            id: "responsible-investing",
            title: "If You Choose To Invest",
            icon: "checkmark.seal.fill",
            lessons: [
                CryptoLesson(
                    id: "due-diligence",
                    title: "How To Research (Actually)",
                    content: """
**Hype and hope are not research.**

## What To Actually Look At

### 1. The Team
- Who built this?
- Real identities or anonymous?
- Track record?
- Tokens they hold and vesting schedule?

### 2. The Technology
- What problem does this solve?
- Why does it need a blockchain?
- Is the code open source?
- Has it been audited?

### 3. Tokenomics
- Total supply and distribution
- How much do insiders hold?
- Is there inflation?
- What gives the token value?

### 4. Adoption
- Are real people using this?
- Transaction volume (real or wash trading?)
- Developer activity (GitHub commits)
- Ecosystem growth

### 5. Competition
- Who else solves this problem?
- What's the competitive advantage?
- Is this technology or marketing?

## Red Flags

🚩 Anonymous team
🚩 Unrealistic promises
🚩 No working product
🚩 Heavy celebrity promotion
🚩 Concentrated token ownership
🚩 No clear use case
🚩 "Revolutionary" everything

## Where To Research

**Good Sources**
- Project whitepaper
- GitHub (code activity)
- Messari, CoinGecko (data)
- Developer forums

**Bad Sources**
- YouTube influencers (often paid)
- Twitter hype
- Telegram groups
- "Research reports" from project itself

## The Honest Question

**"If this project disappeared tomorrow, would anyone notice or care?"**

If the answer is no, it's probably not worth investing in.
""",
                    duration: 12,
                    honestTake: "99% of people in crypto skip research and gamble based on hype. Be in the 1% who actually understand what they own."
                ),
                CryptoLesson(
                    id: "portfolio-approach",
                    title: "Portfolio Approach To Crypto",
                    content: """
**Treat crypto like a volatile asset class, not a get-rich-quick scheme.**

## Sizing Your Crypto Allocation

### Conservative (1-5% of portfolio)
- Appropriate for most people
- Meaningful upside if crypto succeeds
- Won't destroy you if it fails

### Aggressive (5-15% of portfolio)
- Higher risk tolerance
- Longer time horizon
- Can handle volatility emotionally

### Gambling (15%+ of portfolio)
- You better know what you're doing
- Accept potential total loss
- Not recommended for most

## Within Crypto: Allocation

### If you're conservative:
- 70-100% Bitcoin
- 0-30% Ethereum
- No small caps

### If you're moderate:
- 50-60% Bitcoin
- 20-30% Ethereum
- 10-20% Major altcoins

### If you're aggressive:
- 30-50% Bitcoin
- 20-30% Ethereum
- 20-50% Altcoins (diversified)

## Dollar Cost Averaging

**The only strategy that consistently works:**
- Same amount every week/month
- Regardless of price
- Regardless of news
- For years, not months

This removes emotion and timing.

## Taking Profits

**The #1 mistake: Never selling.**

Consider:
- Taking original investment out after 2-3x
- Selling 25% at predetermined targets
- Rebalancing back to target allocation

No one went broke taking profits.

## Rebalancing

If crypto moons and becomes 25% of your portfolio (target was 5%):
- Sell some crypto
- Buy other assets
- Return to target allocation

Locks in gains. Reduces risk.
""",
                    duration: 11,
                    honestTake: "Most crypto fortunes exist only on paper because people never sell. Have a plan for taking profits."
                ),
                CryptoLesson(
                    id: "avoiding-mistakes",
                    title: "Common Mistakes To Avoid",
                    content: """
**Learn from others' expensive lessons.**

## Mistake #1: FOMO Buying
**Pattern**: Price goes up → You buy → Price dumps → You hold bags

**Fix**: 
- DCA regardless of price
- If you didn't want it at $10k, why want it at $50k?
- FOMO is a sell signal, not buy signal

## Mistake #2: Panic Selling
**Pattern**: Price dumps → Fear → Sell at bottom → Price recovers

**Fix**:
- Position size you can stomach
- Written plan before volatility
- Don't check price during crashes

## Mistake #3: Overtrading
**Pattern**: Trying to "buy low, sell high" repeatedly

**Reality**:
- Trading fees add up
- Taxes on every gain
- Emotional exhaustion
- Statistically worse returns than holding

## Mistake #4: Using Leverage
**Pattern**: "This can't go lower" → Uses leverage → Gets liquidated

**Reality**:
- Leverage + volatility = destroyed
- Even right direction can liquidate you (wicks)
- Never use leverage in crypto

## Mistake #5: Shilling/Social Media
**Pattern**: Influencer says "buy X" → You buy → They dump on you

**Reality**:
- Influencers are often paid
- By the time you hear it, it's too late
- Do your own research

## Mistake #6: Not Tracking Taxes
**Pattern**: Make money → Don't track → IRS comes calling → Owe more than you have

**Fix**:
- Track every transaction
- Set aside tax money
- Use crypto tax software
- File correctly

## Mistake #7: Keeping Everything On Exchange
**Pattern**: Use exchange → Exchange fails → Lose everything

**Fix**:
- Self-custody significant amounts
- Hardware wallet
- Only keep trading amounts on exchange

## The Summary

1. DCA, don't time
2. Never leverage
3. Take profits
4. Self-custody
5. Track taxes
6. Ignore influencers
7. Size positions correctly
""",
                    duration: 10,
                    honestTake: "Every experienced crypto investor has made these mistakes. The difference is surviving them and learning."
                )
            ]
        ),
        
        // MODULE 4: The Bigger Picture
        CryptoModule(
            id: "bigger-picture",
            title: "The Bigger Picture",
            icon: "globe.americas.fill",
            lessons: [
                CryptoLesson(
                    id: "real-use-cases",
                    title: "Real Use Cases vs Hype",
                    content: """
**Separate what crypto actually does from what people hope it does.**

## Actually Working Use Cases

### 1. Cross-Border Payments
- Remittances without 10%+ fees
- Settlement in minutes, not days
- No banking relationship needed

### 2. Censorship Resistance
- Can't be frozen by governments
- Useful for dissidents, refugees
- Financial access without permission

### 3. Programmable Money (DeFi)
- Lending/borrowing without banks
- 24/7, permissionless
- High risk, but functional

### 4. Digital Ownership (NFTs... sort of)
- Provable ownership of digital items
- Gaming use cases emerging
- Art market is mostly speculation

### 5. Store of Value (Contested)
- Bitcoin as digital gold
- Unproven but possible
- Requires continued adoption

## Overhyped/Not Working

### "Banking the unbanked"
- Most unbanked need stable income, not crypto
- Volatility makes it worse for the poor
- Requires smartphone and internet

### "Replacing fiat currency"
- Governments won't allow it
- Volatility makes it unusable
- Legal tender status rare

### "Everything on blockchain"
- Most things don't need blockchain
- Databases are usually better
- Decentralization has costs

### "Web3"
- Mostly rebranding of existing things
- Real decentralization rare
- Often slower and more expensive

## The Honest Assessment

Crypto has real uses, but they're narrower than promised:
- Financial freedom for some
- Speculation for many
- Scams for too many

**The technology is real. The hype usually isn't.**
""",
                    duration: 12,
                    honestTake: "Blockchain solves specific problems. Most projects just use the buzzword without delivering the benefits."
                ),
                CryptoLesson(
                    id: "final-thoughts",
                    title: "Final Thoughts: Eyes Wide Open",
                    content: """
**If you invest in crypto, do it with full awareness.**

## The Bull Case (Why It Could Work)

- Money is being printed infinitely
- Trust in institutions declining
- Digital native generation prefers digital assets
- Network effects are powerful
- Technology continues improving
- Institutional adoption growing

## The Bear Case (Why It Might Fail)

- Could be regulated into irrelevance
- Something better could replace it
- Adoption might plateau
- Security/usability never improves enough
- Environmental concerns persist
- It was all speculation all along

## The Most Likely Scenario

**Somewhere in between:**
- Bitcoin survives as digital gold
- A few smart contract platforms persist
- Most altcoins go to zero
- Regulation creates clarity
- Crypto becomes boring (which would be bullish)

## What To Do With This Knowledge

### If You're Skeptical
- Don't invest
- You're not missing out if you're uncomfortable
- There are plenty of other investments

### If You're Interested
- Start small (1-5% of portfolio)
- Bitcoin + maybe Ethereum only
- Self-custody
- 4+ year time horizon
- Don't check prices

### If You're A True Believer
- Still don't go all in
- Have exit criteria
- Take profits on the way up
- Remember: The best traders in crypto... also trade

## The Final Word

**Crypto is an asymmetric bet:**
- Could go to zero: Lose what you invested
- Could succeed: 10x, 100x returns possible

**Only bet what you can afford to lose entirely.**

The worst outcome is losing money you needed.
The best outcome is life-changing returns.
Size your bet accordingly.
""",
                    duration: 10,
                    honestTake: "I've tried to give you an honest picture. What you do with it is your choice. Just don't bet more than you can afford to lose."
                )
            ]
        )
    ]
}

// MARK: - Data Models

struct CryptoModule: Identifiable {
    let id: String
    let title: String
    let icon: String
    let lessons: [CryptoLesson]
}

struct CryptoLesson: Identifiable {
    let id: String
    let title: String
    let content: String
    let duration: Int
    let honestTake: String // Each lesson ends with honest perspective
}
