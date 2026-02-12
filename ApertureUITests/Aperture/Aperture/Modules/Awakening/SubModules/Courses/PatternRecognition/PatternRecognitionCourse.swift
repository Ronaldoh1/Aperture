// PatternRecognitionCourse.swift
// PATTERN RECOGNITION - The Core Awakening Skill

import SwiftUI

struct PatternRecognitionCourse {
    static let shared = PatternRecognitionCourse()
    
    let id = "pattern_recognition"
    let title = "Pattern Recognition"
    let subtitle = "The skill that changes everything"
    let icon = "eye.trianglebadge.exclamationmark"
    let colorHex = "#FF6D00"
    
    var color: Color { Color(hex: colorHex) }
    
    let modules: [PatternModule] = [
        
        // ═══════════════════════════════════════════════════════════════
        // MODULE 1: WHAT IS PATTERN RECOGNITION?
        // ═══════════════════════════════════════════════════════════════
        
        PatternModule(
            id: "pr_1",
            number: 1,
            title: "The Awakened Eye",
            subtitle: "Seeing what others miss",
            lessons: [
                PatternLesson(
                    id: "pr1_1",
                    title: "Pattern Recognition Is The Superpower",
                    content: """
**Why This Skill Matters More Than Any Other**

Pattern recognition is the ability to see connections, repetitions, and structures that others miss. It's the difference between:

• Seeing individual events vs. seeing the system
• Reacting to symptoms vs. understanding causes
• Being manipulated vs. seeing the manipulation
• Living in confusion vs. living in clarity

**What Pattern Recognition Gives You:**

🔥 **Prediction**: Once you see the pattern, you can predict what comes next

🔥 **Protection**: You can't be fooled by the same trick twice

🔥 **Power**: Understanding systems lets you navigate or exit them

🔥 **Peace**: Chaos becomes order when you see the pattern

**The Dragon Ball Example:**
Goku doesn't just fight—he READS his opponents. He sees their patterns, anticipates their moves, and adapts. Ultra Instinct is pattern recognition so fast it bypasses conscious thought.

**The Matrix Example:**
Neo doesn't see the Matrix as reality. He sees the CODE—the patterns underneath. That's why he can bend the rules.

**Your Life:**
Every system trying to control you runs on patterns:
• Media uses the same emotional triggers
• Politicians use the same manipulation tactics
• Corporations use the same extraction methods
• History repeats because the patterns repeat

🔥 **The Skill**: Learn to see patterns, and you see through everything.
""",
                    dragonWisdom: "Ultra Instinct isn't about speed—it's about reading patterns so fast your body moves before your mind thinks."
                ),
                
                PatternLesson(
                    id: "pr1_2",
                    title: "How Patterns Work",
                    content: """
**The Anatomy of a Pattern**

A pattern is a repeating structure. It has:

**1. Elements**
The individual pieces that repeat
• In music: notes
• In history: events
• In manipulation: tactics

**2. Relationships**
How elements connect to each other
• Cause → Effect
• Before → After
• If → Then

**3. Rhythm**
The timing and spacing of repetition
• Daily cycles
• Generational cycles
• Market cycles

**4. Variations**
How the pattern adapts while staying the same
• Same tactic, different context
• Same structure, different content
• Same goal, different method

**Example - The "Problem-Reaction-Solution" Pattern:**

**Elements:**
• A problem (real or manufactured)
• Public reaction (fear, outrage)
• A solution (pre-planned)

**Relationships:**
• Problem creates reaction
• Reaction demands solution
• Solution was the goal all along

**Rhythm:**
• 9/11 → Patriot Act
• 2008 crash → Bank bailouts
• [Crisis] → [Desired policy]

**Variations:**
• Different problems, same structure
• Different nations, same playbook
• Different eras, same pattern

🔥 **Once You See It**: You can't unsee it. Every new "crisis" you'll ask: "What solution were they waiting to implement?"
""",
                    dragonWisdom: "Vegeta kept using the same attacks against Goku. Goku adapted. That's why Goku kept winning."
                ),
                
                PatternLesson(
                    id: "pr1_3",
                    title: "Why Most People Don't See Patterns",
                    content: """
**The Barriers to Pattern Recognition**

If pattern recognition is so powerful, why doesn't everyone do it?

**1. Short-Term Focus**
• News cycle: 24 hours
• Memory: What happened last week?
• History: "That was a long time ago"

Patterns require LONG-TERM observation. The system keeps you focused on NOW.

**2. Compartmentalization**
• "That's politics"
• "That's economics"
• "That's history"
• "That's health"

Patterns cross categories. The system teaches you to keep things separate.

**3. Authority Trust**
• "Experts say..."
• "Studies show..."
• "Officials report..."

Pattern recognition requires questioning sources. The system teaches you to trust authority.

**4. Emotional Reactivity**
• Fear → Can't think clearly
• Outrage → Reacting, not analyzing
• Hope → Wanting to believe

Patterns require CALM observation. The system keeps you emotionally activated.

**5. Social Pressure**
• "That's a conspiracy theory"
• "Don't be paranoid"
• "Everyone believes this"

Pattern recognition can isolate you. The system punishes divergent thinking.

**6. Cognitive Load**
• Work
• Bills
• Family
• Entertainment

Pattern recognition requires mental bandwidth. The system keeps you busy and tired.

🔥 **The Design**: It's not that people CAN'T see patterns. The system is designed to prevent pattern recognition. That's the meta-pattern.
""",
                    dragonWisdom: "Frieza couldn't see Goku's potential because he was blinded by his own superiority. Ego blocks pattern recognition."
                )
            ]
        ),
        
        // ═══════════════════════════════════════════════════════════════
        // MODULE 2: CORE PATTERNS
        // ═══════════════════════════════════════════════════════════════
        
        PatternModule(
            id: "pr_2",
            number: 2,
            title: "Core Patterns",
            subtitle: "The patterns behind everything",
            lessons: [
                PatternLesson(
                    id: "pr2_1",
                    title: "The Hegelian Dialectic",
                    content: """
**Thesis → Antithesis → Synthesis**

The most important pattern in social manipulation.

**The Structure:**
1. **Thesis**: An existing state or idea
2. **Antithesis**: An opposing force or idea
3. **Synthesis**: A new state combining elements of both

**How It's Weaponized:**

**Problem-Reaction-Solution:**
• Create/allow a PROBLEM (thesis)
• Generate public REACTION (antithesis)
• Implement pre-planned SOLUTION (synthesis)

**The Left-Right Paradigm:**
• LEFT position (thesis)
• RIGHT position (antithesis)
• ESTABLISHMENT wins either way (synthesis)

You think you're choosing. The outcome was predetermined.

**Historical Examples:**

**9/11 Pattern:**
• Problem: Terrorist attack
• Reaction: Fear, demand for security
• Solution: Patriot Act, surveillance state, endless wars

**2008 Pattern:**
• Problem: Financial collapse
• Reaction: Panic, fear of depression
• Solution: Bank bailouts, money printing, wealth transfer

**COVID Pattern:**
• Problem: Pandemic
• Reaction: Fear, demand for safety
• Solution: Lockdowns, mandates, digital infrastructure

**The Tell:**
The "solution" is always:
• Ready suspiciously fast
• Expands power/control
• Would have been rejected without the "problem"
• Benefits specific interests

🔥 **The Defense**: When you see Problem-Reaction, PAUSE before accepting the Solution. Ask: Who wrote this solution? When? Who benefits?
""",
                    dragonWisdom: "Cell created the Cell Games (problem), forced the world to react (fear), to prove his superiority (solution). Gohan broke the pattern."
                ),
                
                PatternLesson(
                    id: "pr2_2",
                    title: "Divide and Conquer",
                    content: """
**Keep Them Fighting Each Other**

The oldest control pattern in human history.

**The Structure:**
1. Identify or create divisions
2. Amplify both sides
3. Keep them fighting
4. Rule undisturbed

**The Divisions They Create:**

**Political:**
• Left vs. Right
• Democrat vs. Republican
• Liberal vs. Conservative

**While:** Both parties serve the same donors

**Racial:**
• White vs. Black
• Native vs. Immigrant
• Us vs. Them

**While:** Class is the real division

**Generational:**
• Boomers vs. Millennials
• Old vs. Young

**While:** Wealth extraction affects all ages

**Gender:**
• Men vs. Women
• Traditional vs. Progressive

**While:** Both are exploited by the same system

**How Amplification Works:**
• Media gives platform to extremes
• Algorithms promote outrage
• Moderate voices drowned out
• Nuance becomes impossible

**The Tell:**
• Division is AMPLIFIED (not organic)
• Both "sides" are promoted by same media
• The real issue is obscured
• Unity is treated as naive

**Who Benefits?**
While you fight your neighbor over politics:
• Banks extract wealth from both of you
• Corporations pollute both your neighborhoods
• Politicians serve donors, not either of you
• The system continues undisturbed

🔥 **The Defense**: When you feel pulled into us-vs-them, ask: Who benefits from this fight? What are we NOT talking about while we argue?
""",
                    dragonWisdom: "Frieza kept his army fighting for rank and position. United, they could have overthrown him. Divided, they served him."
                ),
                
                PatternLesson(
                    id: "pr2_3",
                    title: "The Overton Window",
                    content: """
**Controlling What's "Thinkable"**

You don't have to censor ideas if you can make them unthinkable.

**The Window:**
```
UNTHINKABLE
    ↓
  Radical
    ↓
  Acceptable
    ↓
  Sensible
    ↓
  Popular
    ↓
  POLICY
```

Ideas outside the window aren't debated—they're dismissed as crazy.

**How The Window Moves:**

**1. Think Tanks**
• Policy papers
• "Expert" opinions
• Academic studies (funded)

**2. Media**
• What's covered vs. ignored
• How it's framed
• Who's interviewed

**3. Politicians**
• What they're "willing to consider"
• What's "off the table"

**4. Social Pressure**
• What gets you cancelled
• What's "respectable"

**Examples of Window Shifts:**

**Gay Marriage:**
• 1990: Unthinkable
• 2000: Radical
• 2010: Acceptable
• 2015: Policy

**Mass Surveillance:**
• Pre-2001: Unthinkable
• Post-9/11: Acceptable
• Post-Snowden: Just reality

**Universal Healthcare (US):**
• Radical in US
• Policy in every other developed nation
• The window is different in different places

**The Control:**
You think you're freely debating. But the RANGE of debate is controlled. What you can't even suggest is more important than what you can argue about.

🔥 **The Defense**: Ask what's OUTSIDE the window. The fact that something is "unthinkable" tells you nothing about whether it's TRUE.
""",
                    dragonWisdom: "In the Saiyan worldview, mercy was unthinkable. Goku's mercy was outside their Overton Window—and it was his greatest strength."
                ),
                
                PatternLesson(
                    id: "pr2_4",
                    title: "Controlled Opposition",
                    content: """
**Lead Your Own Resistance**

The best way to control opposition is to lead it yourself.

**The Structure:**
1. Anticipate resistance to your agenda
2. Create or co-opt the opposition
3. Lead it somewhere harmless
4. Real opposition is marginalized as "extreme"

**How It Works:**

**Political Opposition:**
• Both parties funded by same donors
• "Outsider" candidates absorbed by system
• Revolution channeled into voting

**Media Opposition:**
• "Alternative" media still within limits
• Allowed criticism that doesn't threaten power
• Real threats: deplatformed

**Social Movements:**
• Genuine movements get co-opted
• Leadership replaced or bought
• Demands watered down
• Energy dissipated

**The Tell:**
• The "opposition" never actually wins
• Leaders get rich, movement gets nothing
• Acceptable opposition gets platform
• Dangerous opposition gets silenced

**Historical Example:**
The FBI's COINTELPRO didn't just surveil movements—they INFILTRATED them. Agents became leaders. They steered movements into dead ends or violence that discredited them.

**Modern Example:**
How many "resistance" movements have achieved structural change? 
• Occupy Wall Street: Dissipated
• Tea Party: Absorbed by GOP
• BLM: Corporate sponsors, nothing changed

Meanwhile, the same banks, same corporations, same policies continue.

🔥 **The Defense**: Judge movements by RESULTS, not rhetoric. If the opposition never wins, ask if it's designed to lose.
""",
                    dragonWisdom: "Zamasu posed as an ally before revealing his true plan. The most dangerous enemy is the one you think is on your side."
                ),
                
                PatternLesson(
                    id: "pr2_5",
                    title: "The Ratchet Effect",
                    content: """
**Power Only Moves One Direction**

A ratchet turns one way. Government/corporate power works the same.

**The Pattern:**
1. Crisis occurs (or is created)
2. Emergency powers granted
3. Crisis ends
4. Powers remain
5. Repeat

**The Ratchet Never Reverses:**

**Surveillance:**
• Pre-9/11: Limited
• Post-9/11: Massive expansion (Patriot Act)
• 2024: Still expanding
• Has it EVER been rolled back?

**Executive Power:**
• Each president expands it
• Congress doesn't reclaim it
• Courts rarely limit it
• Power accumulates

**Corporate Consolidation:**
• 1983: 50 companies owned most media
• 2024: 6 companies own 90%
• The trend only goes one direction

**Emergency Powers:**
• Granted "temporarily"
• Extended repeatedly
• Become permanent
• New emergencies add more

**COVID Example:**
• Emergency powers granted
• Two weeks to flatten the curve
• Then months
• Then years
• Many powers remain

**The Tell:**
Ask: When was the last time government/corporate power was REDUCED? Not promised to be reduced—actually reduced?

**Why It Works:**
• Those with power don't voluntarily give it up
• Crisis always justifies "temporary" expansion
• Normal becomes the new baseline
• Reversing is "radical"

🔥 **The Pattern**: Every crisis expands power. No crisis reduces it. The ratchet only turns one way.
""",
                    dragonWisdom: "Frieza's empire only expanded. It never voluntarily gave up a conquered planet. Until Goku broke the pattern."
                )
            ]
        ),
        
        // ═══════════════════════════════════════════════════════════════
        // MODULE 3: PRACTICING PATTERN RECOGNITION
        // ═══════════════════════════════════════════════════════════════
        
        PatternModule(
            id: "pr_3",
            number: 3,
            title: "Developing The Skill",
            subtitle: "Training your pattern recognition",
            lessons: [
                PatternLesson(
                    id: "pr3_1",
                    title: "The Questions To Ask",
                    content: """
**Your Pattern Recognition Toolkit**

When consuming any information, run it through these questions:

**🔍 CUI BONO? (Who Benefits?)**
• Who profits if I believe this?
• Who profits if I act on this?
• Who funded this study/article/program?
• Follow the money—always.

**🔍 WHAT'S THE HISTORY?**
• Has this pattern happened before?
• What was the outcome last time?
• Who said what before previous crises?
• History doesn't repeat, but it rhymes.

**🔍 WHAT'S NOT BEING SAID?**
• What questions aren't being asked?
• What perspectives are excluded?
• What would the "other side" say?
• Silence is information.

**🔍 WHAT'S THE TIMING?**
• Why is this story appearing NOW?
• What else is happening that this distracts from?
• Is there an upcoming vote, decision, event?
• Timing is rarely coincidental.

**🔍 WHAT'S THE SOURCE?**
• Who is the original source (not who's reporting it)?
• What's that source's track record?
• What's that source's funding/ownership?
• Trace it back to origin.

**🔍 WHAT AM I BEING MADE TO FEEL?**
• Fear? Outrage? Urgency?
• Why do they want me to feel this?
• Can I analyze this WITHOUT the emotion?
• Emotional activation blocks pattern recognition.

**🔍 WHAT'S THE PROPOSED SOLUTION?**
• Was the solution ready suspiciously fast?
• Does it expand power/control?
• Who wrote it? When?
• The solution reveals the agenda.

🔥 **Practice**: Run every major news story through these questions for one week. You'll never see media the same way.
""",
                    dragonWisdom: "Piccolo taught Gohan to think, not just react. The questions are your training."
                ),
                
                PatternLesson(
                    id: "pr3_2",
                    title: "Cross-Domain Pattern Matching",
                    content: """
**The Same Patterns Appear Everywhere**

Once you see a pattern in one domain, look for it in others.

**The Extraction Pattern:**

**In Finance:**
Banks create money from nothing → charge you interest → extract wealth

**In Healthcare:**
Create chronic patients → sell ongoing treatment → extract wealth

**In Education:**
Create debt-funded degrees → limited job market → extract wealth

**In Social Media:**
Create addiction → sell attention to advertisers → extract wealth

**SAME PATTERN, DIFFERENT DOMAIN.**

**The Gatekeeping Pattern:**

**In Medicine:**
Only approved treatments are "real medicine"

**In Science:**
Only peer-reviewed (gatekept) research is "real science"

**In Media:**
Only mainstream outlets are "real journalism"

**In Finance:**
Only banks can create "real money"

**SAME PATTERN: Control the gate, control the domain.**

**The Inversion Pattern:**

**"Defense" Department:**
Conducts offense worldwide

**"Patriot" Act:**
Removes patriotic freedoms

**"Affordable" Care Act:**
Healthcare still unaffordable

**"Federal" Reserve:**
Not federal, no reserves

**SAME PATTERN: Name it the opposite of what it does.**

**Practice Exercise:**
1. Pick a pattern you've recognized
2. Ask: Where else does this appear?
3. Look in: Politics, business, relationships, nature
4. The same patterns are EVERYWHERE

🔥 **The Skill**: Pattern recognition isn't domain-specific. Once you see a pattern, you'll see it everywhere.
""",
                    dragonWisdom: "Whis saw that Goku's weakness (dropping guard) appeared in fighting AND in life. Same pattern, different domains."
                ),
                
                PatternLesson(
                    id: "pr3_3",
                    title: "Avoiding False Patterns",
                    content: """
**Pattern Recognition Gone Wrong**

The same skill that liberates can imprison if misused.

**Pareidolia: Seeing Patterns That Aren't There**
• Faces in clouds
• Connections between random events
• Meaning in coincidence
• "Everything is connected" (but not everything is)

**Confirmation Bias:**
• Seeing patterns that confirm what you believe
• Ignoring evidence that contradicts
• Collecting "proof" while dismissing counterevidence

**Apophenia:**
• Finding meaningful connections in random data
• Numerology that "proves" theories
• Connecting events that aren't connected

**How To Avoid False Patterns:**

**1. Falsifiability**
Ask: What evidence would DISPROVE this pattern?
If nothing could disprove it, it's not a pattern—it's a belief.

**2. Predictive Power**
A real pattern lets you PREDICT.
If your pattern can't predict, it might not be real.

**3. Alternative Explanations**
What ELSE could explain this?
Always consider simpler explanations.

**4. Source Criticism**
Where did I learn this pattern?
Who benefits from me believing it?

**5. Emotional Check**
Do I WANT this pattern to be true?
Am I seeing it because it's there or because I need it?

**The Balance:**
• Too little pattern recognition = naive, manipulated
• Too much pattern recognition = paranoid, disconnected
• The goal: accurate pattern recognition, held lightly

🔥 **The Discipline**: See patterns clearly. Hold them loosely. Update when evidence changes. This is intellectual honesty.
""",
                    dragonWisdom: "Vegeta saw Goku as an eternal rival—a pattern that limited him. When he let go, he finally grew."
                ),
                
                PatternLesson(
                    id: "pr3_4",
                    title: "From Seeing To Being",
                    content: """
**Pattern Recognition Is Just The Beginning**

Seeing patterns is not enough. What do you DO with the seeing?

**Stage 1: Unconscious Incompetence**
• Don't see patterns
• Fully manipulated
• "Why does this keep happening to me?"

**Stage 2: Conscious Incompetence**
• Start to see patterns
• Overwhelmed, angry, scared
• "Everything is a lie!"

**Stage 3: Conscious Competence**
• See patterns clearly
• Analyze without emotional overwhelm
• "I see what's happening here."

**Stage 4: Unconscious Competence**
• Pattern recognition is automatic
• Calm discernment
• "Of course. Now what?"

**What To Do With Pattern Recognition:**

**1. Protect Yourself**
• Don't fall for the same tricks
• Make decisions from clarity
• Exit systems that don't serve you

**2. Protect Others**
• Help people see (without preaching)
• Ask questions that open eyes
• Model clear thinking

**3. Build Alternatives**
• Parallel structures
• New systems based on different patterns
• The old patterns don't have to be your patterns

**4. Stay Sane**
• Don't let pattern recognition become paranoia
• Enjoy life—you can see through manipulation AND be happy
• The goal is freedom, not anxiety

**The Ultimate Pattern:**
The system runs on unconsciousness.
Your consciousness is the exit.
They need you asleep.
Waking up is the revolution.

🔥 **The Integration**: Pattern recognition isn't a destination—it's a tool. Use it to build a free life, not just to see the prison.
""",
                    dragonWisdom: "Goku doesn't just see his opponents' patterns—he transcends them. That's the difference between observation and mastery."
                )
            ]
        )
    ]
}

// MARK: - Supporting Types

struct PatternModule: Identifiable {
    let id: String
    let number: Int
    let title: String
    let subtitle: String
    let lessons: [PatternLesson]
}

struct PatternLesson: Identifiable {
    let id: String
    let title: String
    let content: String
    let dragonWisdom: String
}

struct PatternProgress: Codable {
    var completedLessons: [String]
    var lastAccessed: Date?
    static var `default`: PatternProgress { PatternProgress(completedLessons: [], lastAccessed: nil) }
}
