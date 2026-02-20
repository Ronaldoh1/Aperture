// ConsumerPsyopsCourse.swift
// Exposes the psychological manipulation tactics companies use to trigger purchases.
// Anchoring, loss framing, artificial urgency, social proof hacking, and more.
// ☀️ SunFlow: Reignited

import SwiftUI

// MARK: - ═══════════════════════════════════════════════════
// CONSUMER PSYOPS COURSE — "The Invisible Hand in Your Wallet"
// ═══════════════════════════════════════════════════════════

struct ConsumerPsyopsCourse {
    
    static let courseId = "consumer_psyops"
    static let title = "The Invisible Hand in Your Wallet"
    static let subtitle = "How companies hack your brain to make you buy"
    static let emoji = "🧠💰"
    
    static let lessons: [ConsumerPsyopsLesson] = [
        // Lesson 1: Anchoring
        ConsumerPsyopsLesson(
            id: "cp_anchoring",
            number: 1,
            title: "The Anchor Trap",
            subtitle: "Why $100 feels like a deal when it was always $100",
            emoji: "⚓",
            sections: [
                .init(heading: "The Trick", body: "\"Was $125, NOW just $100 — you save $25!\" Your brain hears \"save\" and releases dopamine. But here's what they don't tell you: that item was ALWAYS meant to sell at $100. The $125 was never real. It existed solely as a psychological anchor — a reference point to make $100 feel like a win.\n\nYou didn't save $25. You spent $100. You know what actually saves you $100? Not buying it."),
                .init(heading: "The Science", body: "Anchoring bias was documented by Kahneman and Tversky in 1974. The first number you see literally rewires how you evaluate everything after it. Retailers exploit this with \"original prices,\" \"compare at\" tags, and crossed-out numbers. JCPenney tried honest pricing once — no fake sales, just fair prices. They nearly went bankrupt. Not because the prices were wrong, but because customers were addicted to the FEELING of getting a deal."),
                .init(heading: "Real Examples", body: "• \"Compare at $250\" on a $89 jacket — the $250 item doesn't exist\n• Restaurant wine lists put a $200 bottle first so the $50 bottle feels \"reasonable\"\n• Car dealers show you the loaded $65K model first, then the $45K feels like a steal\n• Apple announces a $999 monitor stand so $1,599 AirPods Max seems normal\n• \"Save $50\" signs are everywhere at outlet malls — on items made specifically for outlets"),
                .init(heading: "Your Defense", body: "Before any purchase, ask: \"Would I buy this if there was NO sale price, NO original price, NO comparison?\" If the answer is no, the anchor did the selling, not the product. You don't need to save money on things you don't need."),
            ]
        ),
        
        // Lesson 2: Artificial Urgency
        ConsumerPsyopsLesson(
            id: "cp_urgency",
            number: 2,
            title: "Manufactured Panic",
            subtitle: "ONLY 2 LEFT! SALE ENDS IN 4:59!",
            emoji: "⏰",
            sections: [
                .init(heading: "The Trick", body: "Countdown timers. \"Only 3 left in stock.\" \"17 people are viewing this right now.\" \"Sale ends tonight!\" These create artificial scarcity — the primal fear that if you don't act NOW, you'll miss out forever.\n\nExcept the timer resets when you refresh. The stock number is generated randomly. The sale \"ends\" and starts again next week. They're manufacturing panic to bypass your rational brain."),
                .init(heading: "The Science", body: "This exploits loss aversion — we feel losses roughly twice as intensely as equivalent gains. Losing a \"deal\" triggers the same brain regions as physical pain. Booking.com was fined in multiple EU countries for fake urgency messages. The \"only 1 room left\" often meant 1 room at THAT price — there were 50 other rooms available."),
                .init(heading: "Real Examples", body: "• Amazon's \"Lightning Deals\" with progress bars showing items \"claiming fast\"\n• Airline sites: \"Prices went up $30 since you last looked\" (often cookie-based manipulation)\n• \"Limited edition\" drops that get restocked 3 months later\n• Flash sales that happen every single week\n• \"Your cart is about to expire\" — your cart doesn't expire"),
                .init(heading: "Your Defense", body: "The 24-hour rule: If you wouldn't have bought it yesterday (before seeing the urgency), don't buy it today. Real scarcity doesn't need a countdown timer. If something is truly rare, they don't need to TELL you it's rare."),
            ]
        ),
        
        // Lesson 3: Loss Framing
        ConsumerPsyopsLesson(
            id: "cp_loss_framing",
            number: 3,
            title: "The Fear of Missing Out",
            subtitle: "Why \"Don't miss out\" is more powerful than \"Buy now\"",
            emoji: "😰",
            sections: [
                .init(heading: "The Trick", body: "\"Don't miss this deal.\" \"You're leaving money on the table.\" \"Free shipping expires at midnight.\" Every word is designed to frame NOT buying as a loss. They never say \"spend $50\" — they say \"save $20.\" They never say \"buy this\" — they say \"don't miss this.\"\n\nYour brain processes these as threats, not opportunities. The amygdala fires. Cortisol rises. You click \"buy\" to make the anxiety stop."),
                .init(heading: "The Science", body: "Loss framing activates threat-detection circuits that evolved for survival, not shopping. When Spotify says \"Your premium trial ends tomorrow,\" your brain hears \"You're about to LOSE something.\" Even though you never had it. Subscription companies have perfected this — the \"cancel\" flow is deliberately painful because they know the fear of loss is stronger than the desire for gain."),
                .init(heading: "Real Examples", body: "• \"Spend $35 more for FREE shipping\" — you spend $35 to \"save\" $5.99\n• \"You've earned 500 points — don't let them expire!\" — manufactured loyalty\n• Gym memberships bank on loss aversion — you keep paying because \"I might go\"\n• Buy-one-get-one: You buy something you didn't need to \"get\" something \"free\"\n• Credit card rewards that require spending thousands to \"earn\" a flight"),
                .init(heading: "Your Defense", body: "Reframe every \"save\" as \"spend.\" Every time an ad says \"save $25,\" replace it with \"spend $75.\" If \"spend $75 on this item\" doesn't excite you, the framing was doing the selling."),
            ]
        ),
        
        // Lesson 4: Social Proof Hacking
        ConsumerPsyopsLesson(
            id: "cp_social_proof",
            number: 4,
            title: "Everyone's Buying It (They're Not)",
            subtitle: "Fake reviews, bot followers, and manufactured consensus",
            emoji: "👥",
            sections: [
                .init(heading: "The Trick", body: "\"47,382 five-star reviews!\" \"Bestseller!\" \"As seen on...\" \"Join 2 million happy customers!\" Social proof is the most powerful psychological trigger — we evolved to follow the crowd because it kept us alive. Now that instinct is being weaponized by Amazon review farms, paid influencers, and manufactured popularity."),
                .init(heading: "The Science", body: "Solomon Asch proved in 1951 that people will deny their own eyes to conform with a group. If 7 out of 8 people say a short line is long, most subjects agree — against clear evidence. Now scale that to millions of fake reviews. An FTC study found that 30-40% of online reviews are fake. On Amazon, certain categories hit 60%+."),
                .init(heading: "Real Examples", body: "• Amazon \"verified purchase\" reviews from accounts that received the item free\n• TikTok \"viral\" products boosted by paid creator networks\n• \"As featured in Forbes\" — many of these are paid contributor articles, not editorial\n• Restaurant reviews on Yelp/Google manipulated by reputation management firms\n• \"Bestseller\" tags on products that sold well for one hour in a niche category"),
                .init(heading: "Your Defense", body: "Read the 3-star reviews — they're the most honest. Look for specific details over generic praise. Check Fakespot or ReviewMeta for Amazon products. And remember: a million people buying something doesn't make it good for YOU. A million people also eat at McDonald's every day."),
            ]
        ),
        
        // Lesson 5: The Decoy Effect
        ConsumerPsyopsLesson(
            id: "cp_decoy",
            number: 5,
            title: "The Decoy They Want You to Ignore",
            subtitle: "How a bad option makes a good option look great",
            emoji: "🎯",
            sections: [
                .init(heading: "The Trick", body: "Small: $3. Medium: $6.50. Large: $7.\n\nNobody wants the medium. That's the point. The medium exists solely to make the large look like an incredible deal. This is the decoy effect — a deliberately bad option that exists to push you toward the one they actually want to sell.\n\nWithout the medium, you'd compare $3 vs $7 and probably pick $3. WITH the medium, you compare $6.50 vs $7 and think \"only 50 cents more for large!\""),
                .init(heading: "The Science", body: "Dan Ariely demonstrated this with The Economist's subscription: Print only ($59), Digital ($125), Print + Digital ($125). The digital-only option was the decoy. When it was removed, 68% chose print-only. When the decoy was present, 84% chose the combo. Same product, same price — the decoy changed everything."),
                .init(heading: "Real Examples", body: "• iPhone storage tiers: 128GB ($799), 256GB ($899), 512GB ($1099) — the 256 is the real target\n• SaaS pricing: Basic ($9), Pro ($29), Enterprise ($49) — Pro is designed to look perfect\n• Movie theater popcorn: small, medium, large sizes designed to push large sales\n• Real estate agents show you a bad house first to make the next one feel amazing\n• Car trim levels: the middle one is always the target"),
                .init(heading: "Your Defense", body: "Cover up all options except the one you'd naturally choose. Evaluate each option in isolation. Ask: \"If this was the ONLY option available, would I still want it at this price?\" If not, a decoy is doing the work."),
            ]
        ),
        
        // Lesson 6: Dark Patterns
        ConsumerPsyopsLesson(
            id: "cp_dark_patterns",
            number: 6,
            title: "The Maze They Built",
            subtitle: "Unsubscribe buttons, hidden fees, and shame clicks",
            emoji: "🌀",
            sections: [
                .init(heading: "The Trick", body: "\"Are you sure you want to cancel? You'll lose ALL your progress!\" \"No thanks, I don't want to save money.\" Tiny gray unsubscribe links. 7-step cancellation flows. Pre-checked boxes that sign you up for newsletters.\n\nThese are dark patterns — user interface designs deliberately created to trick you. They make it easy to subscribe and nearly impossible to leave."),
                .init(heading: "The Science", body: "Dark patterns exploit decision fatigue and status quo bias. Every extra step in a cancellation flow reduces completion by 20%. By step 4, most people give up. The FTC has started taking action — Amazon was sued over its deliberately confusing Prime cancellation process, internally called \"Project Iliad\" (an odyssey to cancel)."),
                .init(heading: "Real Examples", body: "• \"No thanks, I prefer paying full price\" — shaming you for declining\n• Cancellation flows that require calling a phone number during business hours\n• Free trials that require a credit card and auto-renew\n• Cookie consent popups where \"Accept All\" is bright green and \"Manage Preferences\" is tiny gray text\n• Apps that require 5 confirmation screens to delete your account"),
                .init(heading: "Your Defense", body: "Use virtual credit cards (Privacy.com) for free trials — they can't charge what doesn't exist. Screenshot every subscription start date. Set calendar reminders 3 days before trials end. And when a company makes it hard to leave, that tells you everything about how they view you: not as a customer, but as revenue to be trapped."),
            ]
        ),
        
        // Lesson 7: Dopamine Design
        ConsumerPsyopsLesson(
            id: "cp_dopamine",
            number: 7,
            title: "Your Brain on Shopping",
            subtitle: "The neurochemistry they're exploiting",
            emoji: "🧪",
            sections: [
                .init(heading: "The Trick", body: "The dopamine hit from buying something peaks at the moment of purchase — not when you use it. Companies know this. That's why unboxing videos exist. That's why \"Add to Cart\" buttons are bright orange. That's why same-day delivery exists. They want to shrink the gap between impulse and purchase to zero."),
                .init(heading: "The Science", body: "MRI studies show the nucleus accumbens (reward center) activates when you SEE something you want. The insula (pain center) activates when you see the price. If desire > pain, you buy. Companies fight to increase desire and decrease price pain: payment plans, \"4 easy payments,\" Apple Pay's single-click. The less friction, the less your brain registers the cost."),
                .init(heading: "Real Examples", body: "• Amazon 1-Click: eliminates ALL friction between impulse and purchase\n• In-app purchases using virtual currency (hiding real cost behind gems/coins)\n• \"Buy Now, Pay Later\" (Klarna, Affirm) — shifts pain to future self\n• Subscription models that charge monthly to hide annual cost\n• Mobile game reward loops designed by former casino designers"),
                .init(heading: "Your Defense", body: "Add friction back. Remove saved credit cards from sites. Use cash for discretionary purchases — physical money activates pain centers more than digital. Wait 24 hours. And calculate annual cost of subscriptions — \"only $9.99/month\" is $120/year. \"Only $4.99\" for 5 apps is $300/year."),
            ]
        ),
        
        // Lesson 8: Synthesis
        ConsumerPsyopsLesson(
            id: "cp_synthesis",
            number: 8,
            title: "The Awakened Consumer",
            subtitle: "Now you see the strings",
            emoji: "👁️",
            sections: [
                .init(heading: "The Full Picture", body: "Every purchase decision you make is being influenced by teams of psychologists, behavioral economists, data scientists, and UX designers — all working to make you spend more, more often, with less thought. This isn't a conspiracy theory. It's their job description.\n\nBut now you see the patterns. Anchoring, urgency, loss framing, social proof, decoys, dark patterns, dopamine design — these are the tools. Awareness is the antidote."),
                .init(heading: "Your New Framework", body: "Before any purchase:\n\n1. Is there an anchor? (Compare-at prices, crossed-out numbers)\n2. Is there urgency? (Timers, \"limited stock\")\n3. Is it framed as a loss? (\"Don't miss,\" \"save\")\n4. Is social proof doing the selling? (Reviews, popularity)\n5. Is there a decoy? (An option that exists to push you elsewhere)\n6. Are dark patterns at play? (Difficulty canceling, shame clicks)\n7. Am I buying for the dopamine or the utility?\n\nIf you can't pass at least 5 of 7, the system is buying — not you."),
                .init(heading: "Connection: Revelations", body: "This course connects directly to the Revelations section of Aperture. Now that you understand HOW they manipulate, go see WHICH apps and companies are the worst offenders. The same psychological tricks you learned here are running 24/7 in apps on your phone right now.\n\n→ Check out: Revelations > App Tracking Exposé\n→ Check out: Subscription Awakening"),
            ]
        ),
    ]
}

struct ConsumerPsyopsLesson: Identifiable {
    let id: String
    let number: Int
    let title: String
    let subtitle: String
    let emoji: String
    let sections: [ConsumerPsyopsSection]
}

struct ConsumerPsyopsSection: Identifiable {
    let id = UUID()
    let heading: String
    let body: String
}

// MARK: - ═══════════════════════════════════════════════════
// SUBSCRIPTION AWAKENING COURSE
// ═══════════════════════════════════════════════════════════

struct SubscriptionAwakeningCourse {
    
    static let courseId = "subscription_awakening"
    static let title = "The Subscription Trap"
    static let subtitle = "Cable was probably cheaper"
    static let emoji = "💳🔄"
    
    static let lessons: [ConsumerPsyopsLesson] = [
        ConsumerPsyopsLesson(
            id: "sub_reality",
            number: 1,
            title: "The Subscription Reality Check",
            subtitle: "Add it all up. We dare you.",
            emoji: "🧮",
            sections: [
                .init(heading: "The New Cable Bundle", body: "Netflix ($15.49). Hulu ($17.99). Disney+ ($13.99). Max ($16.99). Paramount+ ($11.99). Peacock ($7.99). Apple TV+ ($9.99). Amazon Prime ($14.99). YouTube Premium ($13.99).\n\nThat's $123.41/month for streaming alone. Cable was $89.99 for everything.\n\nBut it's not just streaming. Spotify ($10.99), iCloud ($2.99), gym ($40), meal kit ($60), VPN ($12), password manager ($5), cloud storage ($10), news ($15)... The average American now spends $219/month on subscriptions — $2,628/year — and underestimates by 2.5x."),
                .init(heading: "The Psychology", body: "Subscriptions exploit three biases: status quo bias (you keep what you have), loss aversion (canceling feels like losing), and the pain of paying (monthly is less painful than annual). Companies moved to subscriptions because a $10/month customer paying for 3 years ($360) is worth more than a $200 one-time purchase — and less likely to leave."),
                .init(heading: "The Audit", body: "Right now, check your bank statement for the last 30 days. Circle every recurring charge. Add them up. The number will shock you. Most people find 2-4 subscriptions they forgot they had.\n\nThen ask for each one: \"Did I use this in the last 7 days? Would I re-subscribe if it canceled today?\" If the answer to both is no, it's a zombie subscription draining your account."),
            ]
        ),
        
        ConsumerPsyopsLesson(
            id: "sub_psychology",
            number: 2,
            title: "Why You Can't Cancel",
            subtitle: "The psychology of subscription loyalty",
            emoji: "🔒",
            sections: [
                .init(heading: "Sunk Cost Fallacy", body: "\"I've already paid for 6 months of this gym membership...\" So you keep paying for month 7 even though you haven't gone in 4 weeks. The money you already spent is gone. It's not coming back whether you cancel or not. But your brain treats past payments as an investment that you need to \"get your money's worth\" from — by spending MORE money."),
                .init(heading: "The Endowment Effect", body: "Once you have something, you value it more than before you had it. That's why free trials work — they give you temporary ownership. After 7 days of Spotify Premium, going back to ads feels like LOSING something, not returning to normal. You didn't lose anything. You just had something temporarily and your brain got attached."),
                .init(heading: "Decision Fatigue", body: "They count on you being too tired, too busy, or too overwhelmed to review your subscriptions. That's by design. The cancellation flow is long and confusing on purpose. They know that every extra click reduces cancellation by 20%. By the time you've navigated to the cancel page, you're exhausted and think \"I'll do it next month.\" You won't."),
                .init(heading: "The Fix", body: "Set a recurring monthly calendar event: \"Subscription Audit Sunday.\" 10 minutes. Check bank statements. Cancel anything unused. Use a service like Truebill/Rocket Money to track them all in one place. Or better yet — cancel everything and only re-subscribe to what you genuinely miss after 2 weeks. You'll be surprised how few you miss."),
            ]
        ),
        
        ConsumerPsyopsLesson(
            id: "sub_alternatives",
            number: 3,
            title: "The Free Alternatives They Don't Want You to Know",
            subtitle: "Almost everything has a free or one-time-purchase version",
            emoji: "🆓",
            sections: [
                .init(heading: "Streaming", body: "YouTube (free with ads), Tubi (free), Pluto TV (free), Kanopy (free with library card), your local library (free DVDs and digital streaming). Most libraries offer Hoopla, Libby, and Kanopy — that's thousands of movies, audiobooks, and ebooks for $0."),
                .init(heading: "Music", body: "YouTube Music (free with ads), Spotify (free tier), SoundCloud, Bandcamp, Internet Archive (free). For offline music, buying albums outright ($10-15 each) is cheaper than a year of streaming if you listen to fewer than 12 albums a year."),
                .init(heading: "Productivity", body: "Google Docs (free), LibreOffice (free), Notion (free tier), Obsidian (free), GIMP instead of Photoshop, DaVinci Resolve instead of Premiere. Almost every $20/month creative tool has a free alternative that does 90% of what you need."),
                .init(heading: "News", body: "AP News (free, minimal bias), Reuters (free), NPR (free), PBS (free), AllSides (free, shows bias). You don't need 3 news subscriptions to be informed. You need one good source and the awareness to identify propaganda."),
                .init(heading: "The Math", body: "If you replace even half your subscriptions with free alternatives, you save $100+/month. That's $1,200/year. In 10 years, invested at 7% average return, that's over $17,000. They're not just taking your money — they're taking your financial future, $9.99 at a time."),
            ]
        ),
        
        ConsumerPsyopsLesson(
            id: "sub_connection",
            number: 4,
            title: "The Revelation",
            subtitle: "It's all connected",
            emoji: "🔮",
            sections: [
                .init(heading: "Subscriptions + Tracking = Control", body: "Every subscription isn't just a payment — it's a surveillance contract. Netflix knows what you watch, when, and for how long. Spotify knows your emotional states through music choices. Fitness apps know your health data. News subscriptions know your political leanings.\n\nYou're not just paying with money. You're paying with data that's sold to advertisers who use it to sell you MORE subscriptions."),
                .init(heading: "The Subscription-to-Revelation Pipeline", body: "This course connects directly to Aperture's Revelations section. Now that you understand the subscription trap, go see exactly which apps are tracking you the most and using behavioral patterns to keep you paying.\n\n→ Revelations > App Tracking Exposé\n→ Consumer Psyops Course (how they trigger purchases)\n\nThe awakened consumer isn't anti-spending. They're anti-manipulation. Spend on what genuinely enriches your life. Cut everything that enriches shareholders at your expense."),
            ]
        ),
    ]
}
