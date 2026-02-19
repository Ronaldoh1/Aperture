// SunFlowEducationCourse.swift
// EDUCATION PHILOSOPHY - Learning as Training
// Why people hate learning and how to fix it
// The SunFlow approach to knowledge transmission

import Foundation
import SwiftUI

// MARK: - SunFlow Education Course

struct SunFlowEducationCourse {
    static let shared = SunFlowEducationCourse()
    
    let id = "sunflow_education"
    let title = "Education Philosophy"
    let subtitle = "Learning as Training, Not Conditioning"
    let icon = "brain.head.profile"
    let colorHex = "#00CED1"
    let totalMinutes = 60
    
    var color: Color { Color(hex: colorHex) }
    
    // MARK: - Modules
    
    let modules: [EducationModule] = [
        
        // ═══════════════════════════════════════════════════════════════
        // MODULE 1: THE PROBLEM
        // ═══════════════════════════════════════════════════════════════
        
        EducationModule(
            id: "edu_1",
            number: 1,
            title: "Why People Hate Learning",
            subtitle: "It's not learning they hate",
            lessons: [
                SunFlowLesson(
                    id: "e1_1",
                    title: "The Real Problem",
                    content: """
**Most people don't hate learning — they hate how they were taught.**

They were:

❌ **Shamed for wrong answers**
"That's wrong. Weren't you paying attention?"
The message: Mistakes are shameful. Don't take risks.

❌ **Punished for curiosity that deviated from curriculum**
"We're not talking about that right now."
The message: Your interests don't matter. Follow the script.

❌ **Taught abstraction before intuition**
"Here's the equation. Memorize it."
The message: Understanding is optional. Just perform.

❌ **Graded on compliance, not mastery**
"Turn it in on time or lose points."
The message: Obedience matters more than learning.

❌ **Forced to memorize facts without seeing patterns**
"Columbus sailed in 1492. The mitochondria is the powerhouse of the cell."
The message: Learning is accumulating disconnected facts.

**This isn't education. This is conditioning.**

And it works — it produces obedient workers who doubt their intelligence and seek external validation.

The system isn't broken. It's working exactly as designed.

**SunFlow rejects this model entirely.**
""",
                    principle: nil
                ),
                
                SunFlowLesson(
                    id: "e1_2",
                    title: "The Conditioning Machine",
                    content: """
**What the Traditional System Actually Teaches:**

📚 **Explicit Curriculum:**
Reading, writing, math, history, science

🧠 **Hidden Curriculum (what's actually learned):**

• **Sit still and obey** — Bodies aren't meant to be stationary for 8 hours. But you learn to suppress your impulses.

• **Time is not yours** — Bells tell you when to move, eat, speak. You learn that your time belongs to authority.

• **External validation is truth** — Grades, gold stars, approval. You learn to look outside yourself for confirmation you're doing well.

• **Competition over cooperation** — Grading on a curve. Class rank. You learn others' success threatens yours.

• **Experts know better** — Don't question the teacher. Don't challenge the textbook. Authority = truth.

• **Your interests are irrelevant** — The curriculum is fixed. Your passion for dinosaurs doesn't fit the lesson plan.

**The Output:**

Adults who:
• Wait for permission
• Doubt their intelligence
• Fear making mistakes
• Can't learn without a teacher
• Think curiosity is childish
• Believe learning stops at graduation

**The system produces employees, not creators.**

That's not a bug. That's the feature.
""",
                    principle: nil
                )
            ]
        ),
        
        // ═══════════════════════════════════════════════════════════════
        // MODULE 2: CORE PRINCIPLES
        // ═══════════════════════════════════════════════════════════════
        
        EducationModule(
            id: "edu_2",
            number: 2,
            title: "How SunFlow Teaches Differently",
            subtitle: "Five core principles",
            lessons: [
                SunFlowLesson(
                    id: "e2_1",
                    title: "Curiosity Before Symbols",
                    content: """
**TRADITIONAL:**
"Here's the quadratic formula. Memorize it. You'll need it for the test."

**SUNFLOW:**
"You want to know how far a ball travels when you throw it? Let's figure out the arc. Oh, that's a parabola. Here's the pattern. Once you see it, here's the shortcut (the formula)."

**THE PRINCIPLE:**
Intuition first, formalization second.

You can't memorize your way to understanding. You have to **see the pattern**.

The symbol (equation, formula, definition) is just a compression of something real. If you understand the real thing, the symbol becomes a convenient shorthand.

If you only know the symbol, you have nothing.

**EXAMPLE: Teaching Velocity**

❌ Traditional: "v = d/t. Velocity equals distance over time. Got it? Moving on."

✅ SunFlow: "Run across the room. Now walk. Feel the difference? That's velocity — how much ground you cover per unit of time. Fast = lots of distance in little time. Slow = less distance, same time. Now here's the symbol for what you just felt: v = d/t. You already know this. The equation just compresses what you experienced."

**The body knows before the mind names.**
""",
                    principle: SunFlowPrinciple(
                        number: 1,
                        name: "Curiosity Before Symbols",
                        summary: "Intuition first, formalization second"
                    )
                ),
                
                SunFlowLesson(
                    id: "e2_2",
                    title: "No Punishment Loops",
                    content: """
**TRADITIONAL:**
Wrong answer → Bad grade → Shame → "I'm bad at math" → Avoid math forever

**SUNFLOW:**
Wrong answer → Information → "This didn't work. Why? What would?" → Iteration without judgment

**THE PRINCIPLE:**
Learning is debugging, not performance. Mistakes are data, not failures.

Every mistake tells you something. It's information about what doesn't work. That information is valuable — it narrows the space of possibilities.

But when mistakes are punished, you stop taking risks. You stop experimenting. You optimize for safety, not learning.

**THE DEBUGGING MINDSET:**

When code breaks, programmers don't feel shame. They:
1. Look at the error message (information)
2. Form a hypothesis (what might be wrong)
3. Test the hypothesis (try a fix)
4. Iterate (if it doesn't work, try again)

No judgment. Just problem-solving.

**That's how learning should work.**

"I got the wrong answer" becomes "I got information about what doesn't work."

"I failed" becomes "I learned something."

**The fear of being wrong is the biggest obstacle to learning.**

SunFlow removes the punishment. What remains is pure iteration.
""",
                    principle: SunFlowPrinciple(
                        number: 2,
                        name: "No Punishment Loops",
                        summary: "Mistakes are data, not failures"
                    )
                ),
                
                SunFlowLesson(
                    id: "e2_3",
                    title: "Visible Progress, Not Arbitrary Grades",
                    content: """
**TRADITIONAL:**
87% on a test.

What does that mean? Which 13% did you miss? Can you fix it? Does it matter? Who knows.

**SUNFLOW:**
"You've mastered pattern recognition. You're working on spatial reasoning. Here's your progress map. Here's what unlocks next."

**THE PRINCIPLE:**
Learning is leveling up, not GPA farming. You see exactly where you are and what's next.

**THE GAME DESIGN MODEL:**

Video games are incredible teaching machines. Why?

• **Clear objectives** — You know what you're trying to do
• **Immediate feedback** — You know instantly if you succeeded
• **Visible progress** — XP bars, levels, unlocks
• **Meaningful choices** — Different paths, different builds
• **Failure isn't terminal** — You respawn and try again

**Why don't schools work this way?**

Because schools aren't designed for learning. They're designed for sorting.

Grades create a hierarchy. GPA ranks students. The system needs winners and losers.

**SunFlow doesn't rank you against others.**

You're on your own path. The only question is: Where are you now, and what's the next step?

```
PROGRESS MAP:
[████████░░] Pattern Recognition — 80%
[██████░░░░] Spatial Reasoning — 60%
[████░░░░░░] Systems Thinking — 40%
[██░░░░░░░░] Meta-Learning — 20%

NEXT UNLOCK: Advanced Pattern Recognition
PREREQUISITES: Complete 2 more exercises
```

**You always know where you are.**
""",
                    principle: SunFlowPrinciple(
                        number: 3,
                        name: "Visible Progress",
                        summary: "Leveling up, not GPA farming"
                    )
                ),
                
                SunFlowLesson(
                    id: "e2_4",
                    title: "Embodiment Before Abstraction",
                    content: """
**TRADITIONAL:**
"The mitochondria is the powerhouse of the cell."

Memorize it. You don't need to understand it. It'll be on the test.

**SUNFLOW:**
"Feel tired? Feel energetic? That's your mitochondria doing their job — or not. They're the power plants in every cell, converting food into energy your body can use. When they work well, you feel alive. When they don't, you feel like garbage. Now let's see what they actually look like and how they work..."

**THE PRINCIPLE:**
Body first, symbols second. You can't abstract what you haven't experienced.

**THE ABSTRACTION LADDER:**

```
Level 4: Equation (E = mc²)
Level 3: Concept (mass-energy equivalence)
Level 2: Analogy (matter is frozen energy)
Level 1: Experience (feel the sun's warmth)
```

Traditional education starts at Level 4 and wonders why students don't understand.

SunFlow starts at Level 1 and builds up.

**EXAMPLE: Teaching Fractions**

❌ Traditional: "1/2 + 1/4 = 3/4. Find common denominators..."

✅ SunFlow: "Cut this pizza in half. Now cut this one in quarters. If you eat half of one pizza and a quarter of another, how much pizza did you eat? Okay, now let's write that down: 1/2 + 1/4 = ..."

**The body understands before the mind names.**

You knew fractions the first time you shared food with a sibling. The math just formalizes what you already knew.

**Abstract concepts are compressions of concrete experiences.**

Without the experience, the abstraction is empty — just symbols moving around.
""",
                    principle: SunFlowPrinciple(
                        number: 4,
                        name: "Embodiment Before Abstraction",
                        summary: "Body first, symbols second"
                    )
                ),
                
                SunFlowLesson(
                    id: "e2_5",
                    title: "No Busy Work, Only Upgrades",
                    content: """
**TRADITIONAL:**
"Complete problems 1-50, odd numbers only."

Why? Because it's assigned. Does it matter if you already understand? No. Do the problems.

**SUNFLOW:**
"You've demonstrated mastery of this concept. Here's the next level. Or, if you want to go deeper into this one, here's an advanced application..."

**THE PRINCIPLE:**
Every exercise should unlock something. If it doesn't upgrade you, it's waste.

**THE BUSY WORK PROBLEM:**

Traditional education is full of tasks that exist to fill time:
• Copying definitions
• Repetitive drills on concepts already mastered
• "Showing your work" in exactly the prescribed way
• Essays that will never be read

This teaches students that their time has no value.

**SUNFLOW'S FILTER:**

Before any task, ask:
1. Does this build a skill I don't have?
2. Does this deepen understanding I already have?
3. Does this unlock something new?

If the answer to all three is NO → The task is busy work. Skip it.

**THE UPGRADE MINDSET:**

Every action should be an investment that yields returns:

• Reading → New mental models
• Practice → Stronger skills
• Projects → Portfolio pieces
• Discussion → Refined thinking

If you can't identify the upgrade, don't do the work.

**Your time is not unlimited. Spend it on growth.**
""",
                    principle: SunFlowPrinciple(
                        number: 5,
                        name: "No Busy Work",
                        summary: "Every exercise should upgrade you"
                    )
                )
            ]
        ),
        
        // ═══════════════════════════════════════════════════════════════
        // MODULE 3: SUBJECT REFRAMES
        // ═══════════════════════════════════════════════════════════════
        
        EducationModule(
            id: "edu_3",
            number: 3,
            title: "Subject Reframes",
            subtitle: "Math, Science, Engineering as Liberation Tools",
            lessons: [
                SunFlowLesson(
                    id: "e3_1",
                    title: "Math as Pattern Sight",
                    content: """
**Traditional Frame:**
"Math is about getting the right answer."

**SunFlow Frame:**
"Math is the language of patterns. Learn it, and you can see what others can't."

**MATH ISN'T CALCULATION**

Computers calculate. You don't need to.

Math is pattern recognition formalized:
• Algebra = Pattern relationships (if this, then that)
• Geometry = Pattern in space
• Calculus = Patterns of change
• Statistics = Patterns in data
• Number theory = Patterns in numbers themselves

**WHY MATH WAS MADE BORING:**

If you understood math, you could:
• See through financial manipulation
• Model systems before they break
• Predict outcomes
• Call bullshit on statistics
• Build things

An mathematically literate population is hard to control.

So math was made into:
• Tedious calculation (kill the joy)
• Abstract symbols (disconnect from reality)
• Competitive ranking (create math anxiety)
• "You're either a math person or you're not" (identity gatekeeping)

**THE TRUTH:**

You're already doing math. Every time you:
• Estimate time to arrive
• Calculate a tip
• Compare prices
• Plan a budget
• Judge if something will fit

You're doing math. You just weren't told it counts.

**Math is pattern sight. You already have it. Now let's sharpen it.**
""",
                    principle: nil
                ),
                
                SunFlowLesson(
                    id: "e3_2",
                    title: "Science as Curiosity Discipline",
                    content: """
**Traditional Frame:**
"Science is memorizing facts about the natural world."

**SunFlow Frame:**
"Science is formalized curiosity — a method for turning 'I wonder...' into 'I know.'"

**SCIENCE ISN'T A BODY OF KNOWLEDGE**

Science is a METHOD:
1. Observe something
2. Wonder why
3. Form a guess (hypothesis)
4. Test the guess
5. Update based on results
6. Repeat

That's it. That's science.

**THE SCIENTIFIC METHOD IS A DEBUGGING PROTOCOL:**

```
Observation: The code doesn't work
Hypothesis: Maybe this variable is wrong
Experiment: Change the variable, run the code
Result: Still broken
Update: Not that variable — try something else
Iterate: Until it works
```

Same process. Same mindset.

**WHY SCIENCE WAS MADE BORING:**

If you could think scientifically, you could:
• Question authority with evidence
• Test claims yourself
• Build your own understanding
• Reject dogma that fails testing

So science was turned into:
• Facts to memorize
• Labs with predetermined outcomes
• "Trust the experts" mentality
• Separation from everyday life

**THE TRUTH:**

You're already a scientist. Every time you:
• Try a new recipe and adjust
• Figure out why your car makes that sound
• Test which route is faster
• Experiment with your sleep

You're doing science.

**Science is curiosity with rigor. You already have the curiosity. Now let's add the rigor.**
""",
                    principle: nil
                ),
                
                SunFlowLesson(
                    id: "e3_3",
                    title: "Engineering as Empowerment",
                    content: """
**Traditional Frame:**
"Engineering is for specialists with advanced degrees."

**SunFlow Frame:**
"Engineering is the art of building things that work. It's how you shape reality."

**ENGINEERING ISN'T COMPLICATED**

Engineering is:
1. Identify a problem
2. Design a solution
3. Build it
4. Test it
5. Iterate

That's it. Degrees formalize this. But the process is human.

**THE ENGINEERING MINDSET:**

• **Problems are solvable** — Maybe not easily, but with enough iteration
• **Constraints are features** — They focus creativity
• **Failure is information** — Each failure narrows the space
• **Working beats perfect** — Ship, then improve

**WHY ENGINEERING WAS GATEKEPT:**

If you could engineer, you could:
• Build your own tools
• Solve your own problems
• Create economic value
• Not depend on corporations

So engineering was positioned as:
• Requiring expensive education
• Needing credentials to practice
• Too complex for ordinary people
• A career, not a skill

**THE TRUTH:**

You're already engineering. Every time you:
• Fix something that's broken
• Build furniture from IKEA
• Create a system for organizing
• Hack a solution together

You're engineering.

**Engineering is building solutions. You already do it. Now let's make you better.**

**The Pattern:**
• Math → See patterns
• Science → Test patterns  
• Engineering → Build with patterns

Together: The complete toolkit for shaping reality.
""",
                    principle: nil
                )
            ]
        ),
        
        // ═══════════════════════════════════════════════════════════════
        // MODULE 4: WHY THIS WORKS
        // ═══════════════════════════════════════════════════════════════
        
        EducationModule(
            id: "edu_4",
            number: 4,
            title: "Why This Works",
            subtitle: "Aligning with how brains actually learn",
            lessons: [
                SunFlowLesson(
                    id: "e4_1",
                    title: "Neuroscience of Learning",
                    content: """
**The brain doesn't work like schools assume.**

**WHAT SCHOOLS ASSUME:**

• Learning = information transfer
• More hours = more learning
• Testing proves mastery
• Everyone learns at the same pace
• Sitting still aids concentration

**WHAT NEUROSCIENCE SHOWS:**

**1. Learning requires emotional engagement**
The amygdala gates memory formation. No emotion → weak memory.
Bored students don't learn. Curious students do.

**2. Sleep consolidates memory**
Information moves from short-term to long-term memory during sleep.
Sleep-deprived students can't retain material.

**3. Stress impairs learning**
Cortisol blocks memory formation and recall.
Test anxiety actively prevents demonstrating knowledge.

**4. Movement aids cognition**
Physical activity increases BDNF (brain-derived neurotrophic factor).
Sitting all day impairs thinking.

**5. Spaced repetition beats cramming**
Distributed practice creates stronger neural pathways.
All-nighters feel productive but don't stick.

**6. Retrieval practice beats re-reading**
Actively recalling information strengthens memory.
Highlighting textbooks does almost nothing.

**SUNFLOW ALIGNMENT:**

• Curiosity-driven → Emotional engagement ✓
• No punishment → Low stress ✓
• Embodied learning → Movement ✓
• Visible progress → Spaced repetition ✓
• Interactive exercises → Retrieval practice ✓

**We're not inventing new methods. We're finally aligning with how brains work.**
""",
                    principle: nil
                ),
                
                SunFlowLesson(
                    id: "e4_2",
                    title: "Learning Is Your Birthright",
                    content: """
**You were born to learn.**

Watch a toddler:
• Relentlessly curious
• No fear of failure
• Learns through play
• Asks "why?" constantly
• Experiments with everything

That's natural learning. You came with it pre-installed.

**What happened?**

School happened.
• Curiosity was channeled into curriculum
• Failure became shameful
• Play was separated from learning
• Questions became disruptions
• Experimentation became rule-breaking

**You didn't lose your ability to learn. It was suppressed.**

**THE RECOVERY:**

1. **Remember you're a natural learner**
   Before school, you learned to walk, talk, navigate social situations — the hardest things you'll ever learn — with no curriculum, no grades, no teachers.

2. **Reconnect learning with curiosity**
   What do you actually want to know? Start there. Not what you "should" learn. What you want to.

3. **Remove the shame**
   You're not stupid. You were never stupid. You were just taught badly. The shame isn't yours.

4. **Make it play**
   If it feels like obligation, you'll resist. If it feels like play, you'll persist.

5. **Trust the process**
   You don't need a teacher to validate your progress. You'll know when you're growing.

**Learning isn't a privilege granted by institutions.**

**It's your birthright as a conscious being.**

The institutions tried to make you forget. Now you remember.

Go learn whatever the fuck you want.
""",
                    principle: nil
                )
            ]
        )
    ]
}

// MARK: - Supporting Types

struct EducationModule: Identifiable {
    let id: String
    let number: Int
    let title: String
    let subtitle: String
    let lessons: [SunFlowLesson]
}

struct SunFlowLesson: Identifiable {
    let id: String
    let title: String
    let content: String
    let principle: SunFlowPrinciple?
}

struct SunFlowPrinciple: Identifiable {
    var id: Int { number }
    let number: Int
    let name: String
    let summary: String
}

// MARK: - Five Principles Summary

struct SunFlowEducationPrinciples {
    static let all: [SunFlowPrinciple] = [
        SunFlowPrinciple(
            number: 1,
            name: "Curiosity Before Symbols",
            summary: "Intuition first, formalization second. You can't memorize your way to understanding."
        ),
        SunFlowPrinciple(
            number: 2,
            name: "No Punishment Loops",
            summary: "Learning is debugging, not performance. Mistakes are data, not failures."
        ),
        SunFlowPrinciple(
            number: 3,
            name: "Visible Progress",
            summary: "Learning is leveling up, not GPA farming. You always know where you are."
        ),
        SunFlowPrinciple(
            number: 4,
            name: "Embodiment Before Abstraction",
            summary: "Body first, symbols second. You can't abstract what you haven't experienced."
        ),
        SunFlowPrinciple(
            number: 5,
            name: "No Busy Work",
            summary: "Every exercise should upgrade you. If it doesn't, skip it."
        )
    ]
}
