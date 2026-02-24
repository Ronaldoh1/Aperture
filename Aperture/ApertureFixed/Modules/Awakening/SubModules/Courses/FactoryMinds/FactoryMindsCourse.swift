// FactoryMindsCourse.swift
// SunFlow: Reignited — Aperture
//
// FACTORY MINDS: How School Was Built to Obey, Not Think
// A 6-Week Consciousness Education Course
// Course Script by Ron Hernandez — Senior Systems Architect & Consciousness Engineer
//
// "The audit never ends. Stay curious. Stay sovereign."

import SwiftUI

// MARK: - Data Models

struct FMLesson: Identifiable {
    let id: String
    let week: Int
    let title: String
    let subtitle: String
    let hook: String
    let body: String
    let personalTestimony: String?
    let exerciseTitle: String
    let exercisePrompt: String
    let keyTakeaway: String
    let patternToSpot: String
}

struct FMCourse: Identifiable {
    let id = "factory_minds"
    let title = "Factory Minds"
    let subtitle = "How School Was Built to Obey, Not Think"
    let tagline = "Audit any belief. Trace its origin. Determine if it's yours."
    let instructor = "Ron Hernandez — Senior Systems Architect & Consciousness Engineer"
    let totalWeeks = 6
    let accentColor = Color(red: 0.2, green: 0.85, blue: 0.65)   // teal-green
    let estimatedMinutes = 150
    let emoji = "🏭"
    let lessons: [FMLesson]
}

// MARK: - Course Content

let factoryMindsCourse = FMCourse(lessons: [

    // MARK: WEEK 1
    FMLesson(
        id: "fm_w1",
        week: 1,
        title: "The Blueprint",
        subtitle: "Where It All Came From",
        hook: "You ever wonder why school feels like a factory? Bells ring, you move. Sit in rows. Raise your hand to speak. Get graded on compliance as much as comprehension. That is not an accident. That is the original design specification — written almost 200 years ago.",
        body: """
**The Prussian Import (1830s–1840s)**

Horace Mann — the so-called father of American public education — traveled to Prussia in 1843 and came back with a model. Not a model for creating thinkers. A model for creating soldiers.

The Prussian system was designed to produce three things: obedient soldiers for the military, obedient workers for mines and factories, and civil servants who would not question the state. That is the DNA of the American school system.

Mann sold it as democratic reform. Free education for all. Sounds beautiful. But look at the architecture: mandatory attendance laws, age-based grouping, standardized curriculum, bells and schedules dictating movement. These are not features of intellectual liberation. These are features of institutional control. The system was not designed to unlock your mind. It was designed to make you predictable.

**The Industrialists Double Down (1900s–1920s)**

Fast forward to the early 1900s. Rockefeller, Carnegie, and the industrial titans pour massive funding into shaping the education system through the General Education Board.

Rockefeller's General Education Board stated in its founding documents — and this is not conspiracy, this is their own published mission — they did not want a nation of thinkers. They wanted a nation of workers. Efficient, compliant, specialized enough to operate machinery but not educated enough to question who owns it.

The assembly-line model of education — move students through on a conveyor belt, test them at checkpoints, stamp them at the end — was designed by people who also designed actual assembly lines. This is not metaphor. This is architecture.

**The Skeleton That Still Stands**

Rows. Bells. Periods. Grades. Standardized tests. Homework. The raise-your-hand-to-speak protocol.

None of this was designed for learning. It was designed for management. And it has never been fundamentally redesigned because it still serves its original purpose: producing people who follow instructions, tolerate boredom, accept hierarchy, and do not ask why.
""",
        personalTestimony: nil,
        exerciseTitle: "System Mapping",
        exercisePrompt: "List five rules or structures from your school experience that you accepted without question — dress codes, grading systems, attendance policies, curriculum choices, anything. For each one, answer: Who did this serve? If the answer is not clearly the student, you've found a control structure.",
        keyTakeaway: "The American education system wasn't designed for intellectual liberation. It was imported from a military model and engineered by industrialists to produce a compliant, predictable workforce. The architecture you sat inside every day was built to manage you, not free you.",
        patternToSpot: "Watch for any institution that frames compliance as virtue. 'Good students' who never question the framework — not just the content within it."
    ),

    // MARK: WEEK 2
    FMLesson(
        id: "fm_w2",
        week: 2,
        title: "The Public Trap",
        subtitle: "Obedience by Design",
        hook: "Ninety percent of American kids go to public school. You would think that means the system is built to serve them. It is not. It is built to sort them. The zip code you were born in predicts your educational outcome more accurately than your IQ, your effort, or your talent. That is not a failure. That is a feature.",
        body: """
**The Funding Trap**

Public schools are funded primarily through local property taxes. This means wealthy neighborhoods generate wealthy schools. Poor neighborhoods generate poor schools.

This is not a bug in the system. It is the system. The structural design ensures that economic inequality reproduces itself through education. A kid in a wealthy suburb gets updated textbooks, small class sizes, and AP courses. A kid ten miles away in the wrong zip code gets outdated materials, overcrowded classrooms, and metal detectors.

Nobody votes for this explicitly. But nobody fixes it either. Because the people with the power to fix it are the people whose children benefit from the current arrangement.

**Curriculum as Control**

What gets taught is as important as what does not. Public school curricula across the country teach students what to memorize, not how to evaluate. History is presented as settled narrative, not contested interpretation. Science is taught as a set of conclusions, not as a method of inquiry.

The deeper problem: students are never taught how to evaluate the process that produced the curriculum. Who decided what you learn? What got excluded and why? These questions are not part of the standard education because answering them would undermine the authority of the system delivering the answers.

**Testing as Sorting**

Standardized testing does not measure intelligence. It measures compliance with a specific framework. It measures how well you absorbed what you were told to absorb in the format you were told to absorb it.

Students who think differently — who question the premises, who approach problems from non-standard angles — those students are penalized. The system rewards reproduction of existing knowledge, not generation of new understanding.

And the test scores feed back into the funding trap: low scores mean less funding, less funding means worse schools, worse schools mean lower scores. The cycle is self-reinforcing by design.
""",
        personalTestimony: """
**Ron's Note:**

I came to this country at 12, did not speak English, and within a year I was in Talent and Gifted at Kenmoor Middle School. Not because the system was built for me. It was not. I was reverse-engineering the language through pattern recognition — catching phonetic structures, syntax rules, contextual shifts — the same way I would later reverse-engineer codebases.

The public system gave me the space to do that, and I am grateful. But I also watched kids with equal potential get crushed because they were in the wrong zip code with the wrong resources. My success does not validate the system. It highlights who the system is willing to lose.
""",
        exerciseTitle: "Resource Audit",
        exercisePrompt: "Look up the per-student spending in your childhood school district versus the wealthiest district in your state. Calculate the gap. Then ask: if education is a right, why is its quality determined by geography?",
        keyTakeaway: "The funding gap is not accidental. The sorting is intentional. When the zip code determines the outcome, the system is working exactly as designed — to reproduce class structure, not dismantle it.",
        patternToSpot: "Any argument that blames students or families for educational failure without examining the structural design that made that failure inevitable."
    ),

    // MARK: WEEK 3
    FMLesson(
        id: "fm_w3",
        week: 3,
        title: "The Private School Myth",
        subtitle: "Worse Than You Think",
        hook: "People think private school equals better education. That is the marketing. Here is the product: a controlled environment where critical thinking is optional, exclusion is policy, and the beliefs installed in you at age five are reinforced until graduation. That is not freedom. That is a premium cage.",
        body: """
**The Exclusion Machine**

Private schools are not accountable to the public. They do not have to accept every student. And they do not.

Students with learning disabilities are routinely excluded. ESL students are filtered out. Students whose families are the wrong religion — or whose identity does not align with the school's doctrine — are denied admission. This is documented and widespread.

When the voucher argument says "let parents choose," it really means: let the schools choose. Because the student never had the power. The institution did. And institutions built on exclusion will always exclude.

**Religious Schools: Installation, Not Education**

A religious school does not teach values. It installs them. There is a critical difference.

Teaching values means presenting ethical frameworks, exploring their origins, debating their applications, and allowing the student to arrive at their own conclusions. Installing values means declaring one framework as absolute truth, discouraging questions, and treating doubt as failure — or as sin.

A student who comes out of 12 years of religious education believing their faith is the only valid worldview has not been educated. They have been programmed. And the first time they encounter a real challenge to that worldview — in college, in a relationship, in a personal crisis — they have no tools to process it. Because the school never gave them tools. It gave them walls.

**The Financial Shell Game**

Private schools receiving public money through voucher programs operate with zero financial transparency. Public school budgets are open records — you can see every dollar. Private schools? Their books are closed.

So when your tax dollars flow into a voucher program, you have no way to verify how that money is spent. You cannot audit the institution. You cannot vote out its leadership. You have no democratic control over an entity that is spending democratic money.

And here is the constitutional issue that should end the conversation: the First Amendment establishes separation of church and state. Public money funding religious education is government entanglement with religion. If taxpayer dollars are paying for a school that teaches one religion as truth, the government is subsidizing the establishment of that religion.

**The Performance Question Nobody Asks**

What guarantee does anyone have that a private school produces a better education? By what metric?

If the school boxes you into a belief system, limits what you can question, and puts a ceiling on your curiosity — that is not better education. That is a smaller box with nicer furniture. Your brain never gets to expand. Your mind never gets to run free. And that is by design.
""",
        personalTestimony: nil,
        exerciseTitle: "Institutional Comparison",
        exercisePrompt: "Find the admissions criteria for three private religious schools in your area. Document what they exclude: disabilities, language, religion, sexual orientation, behavioral history. Then compare to your local public school's enrollment policy. Which one is practicing exclusion? Which one is mandated to accept every child?",
        keyTakeaway: "Private schools are not a solution to educational programming — they are often a more expensive, more exclusive version of the same problem. The cage looks better from the outside. The ceiling is still there.",
        patternToSpot: "\"School choice\" language that frames exclusion as freedom and ignores who gets excluded from the choice."
    ),

    // MARK: WEEK 4
    FMLesson(
        id: "fm_w4",
        week: 4,
        title: "The Programming Loop",
        subtitle: "Family, Church, School",
        hook: "Here is the hardest thing you will hear in this course: most of what you believe is not yours. It was installed before you had the ability to evaluate it. By your parents. By their church. By their parents before them. By a media ecosystem engineered to reinforce it. And the installation came with a defense mechanism: the absolute certainty that these beliefs are your own original thoughts. That certainty is part of the programming.",
        body: """
**The Inheritance Chain**

Your mother believes X because her mother believed X. Your father prays in a specific way because his father prayed that way. The political positions your family holds were not arrived at through independent research and critical analysis. They were absorbed through proximity, repetition, and emotional bonding.

This is how humans work. It is not a moral failing. It is cognitive architecture. But failing to recognize it is the trap.

Beliefs that are inherited feel foundational. They feel like bedrock — like truth, like identity itself. But they are not foundation. They are furniture in a house someone else built. You did not choose the layout. You did not pick the materials. You were born into the house and told it was yours.

**Identity Fusion: The Ego Trap**

This is where it gets dangerous. When your beliefs become your identity — when "I am Christian" or "I hold these values" is not something you have but something you are — any challenge to those beliefs registers as a threat to your existence.

The nervous system does not distinguish between a challenge to your worldview and a physical threat. This is why arguments about religion, politics, and values escalate so fast. The ego is not defending an idea. It is defending its survival.

Consider the student who asks why her tax money should not go to private schools. Her question was not about tax policy. It was her ego's immune response. She was not asking for information. She was asking for validation: Why is the world not confirming who I think I am? That is not education. That is identity preservation.

**The Reinforcement Loop**

The programming does not come from one source. It comes from a synchronized system:

Parents install the initial beliefs. Church reinforces them weekly with community and ritual. School either reinforces them further — if private and religious — or teaches obedience in a secular wrapper that does not challenge the home programming. Social media creates echo chambers that amplify confirmation bias. Political media weaponizes the beliefs for engagement. Friends and community apply social pressure to conform.

By the time someone reaches adulthood, they are running code that was installed by at least six different sources — none of which they chose — all of which they will defend as "my own personal values." The programming loop is complete.

**The Defense Mechanism**

The cruelest part of the installation is that it includes its own antivirus. If someone says you have been programmed, the program activates a response: "No, this is my faith. That is persecution. You are the one who is brainwashed."

The firewall is part of the package. You cannot uninstall something you cannot see.
""",
        personalTestimony: """
**Ron's Note:**

When I took biology in high school, my teacher had to disclose that she would not be arguing about religion in class. I remember thinking: why is that even a statement that needs to be made? Why would anyone's belief system get to limit what we can learn in a science classroom?

By then I was already questioning everything. The idea that someone could put a ceiling on my curiosity — that doctrine could override evidence — I rejected that at a core level. I did not want guardrails on my learning. I wanted to run through every wall and see what was on the other side. That instinct is what the programming is designed to suppress.
""",
        exerciseTitle: "Origin Trace",
        exercisePrompt: "List five beliefs you hold strongly — religious, political, moral, cultural, anything. For each belief: (1) Where did you first encounter it? Be specific. (2) Have you ever seriously challenged it yourself — not argued with someone about it, but tried to disprove it? (3) What would change in your life if it turned out to be wrong? Save your answers. They feed directly into Week 6.",
        keyTakeaway: "The programming loop is synchronized across family, church, school, and media. By the time it's complete, the installed beliefs feel like your own. The defense mechanism — the certainty that this is 'your' worldview — is itself part of the installation.",
        patternToSpot: "Any belief you hold where you cannot trace the origin beyond 'I just know it's true' or 'that's how I was raised.'"
    ),

    // MARK: WEEK 5
    FMLesson(
        id: "fm_w5",
        week: 5,
        title: "The Real Cost",
        subtitle: "Who Wins, Who Loses",
        hook: "Everything we have discussed so far has a cost. Not philosophical cost. Measurable cost. People cost. Dollar cost. Generational cost. This week we look at the numbers and trace who benefits from a system designed to produce compliance instead of capability.",
        body: """
**The Obedience Economy**

An obedient workforce is a cheap workforce. Workers who do not question their wages, do not organize, do not demand equity, and do not understand the systems that determine their compensation are the ideal labor force for concentrated capital.

This is not theory. This is observable in every metric: countries with stronger critical thinking education have stronger labor protections, higher wages relative to productivity, and more distributed wealth. The correlation is direct.

When the education system produces people who accept what they are given, the people who control what is given benefit enormously. The return on investment for underfunding public education is measured in trillions of dollars of labor value that flows upward instead of being distributed.

**The Voucher Pipeline**

School voucher programs are marketed as choice and freedom. Here is what they actually do:

Public money is extracted from the public school system and redirected to private institutions that have no public accountability. The public school loses funding and deteriorates further. The deterioration is then cited as evidence that public schools are failing, which generates more support for vouchers. It is a self-reinforcing cycle designed to dismantle public education by starving it and then pointing at the corpse.

The primary beneficiaries are not poor families finally getting access to better schools. They are families who were already paying for private school and now receive a public subsidy for a choice they already made. The wealth transfer goes upward, as it always does.

**The Innovation Gap**

The United States lags behind dozens of countries in educational outcomes. This is not because American students are less capable. It is because the system was never designed to maximize capability. It was designed to produce stratified outcomes: a small class of decision-makers and a large class of implementers.

The countries that consistently outperform the US in education are the ones that invested in universal quality — not in sorting mechanisms.

**The Mental Health Cost**

Students who are forced into rigid belief systems and then encounter reality experience measurable psychological damage. Rates of anxiety, depression, identity crisis, and relationship dysfunction are higher among adults who were raised in closed ideological environments and later had to reconcile those beliefs with observable reality.

The programming creates a time bomb. The deprogramming — when it happens — is painful. When it does not happen, the person spends their life defending a worldview that does not match the world they can see.
""",
        personalTestimony: """
**Ron's Note:**

At UVA, I had to do work-study just to be there. While I was working to fund my education, kids whose parents wrote a check had their only job be studying. They got better grades. Not because they were smarter. Because studying was literally all they had to do. I had two jobs: being a student and paying for being a student.

Then the system points at GPAs and says "these students performed better" — as if the playing field was ever level.

I could have finished my CS degree in two years if I only took what I actually needed. The other two years were filler that generated tuition revenue. The four-year model is not based on how long it takes to learn. It is based on how long they can keep you paying. Follow the money.
""",
        exerciseTitle: "Follow the Money",
        exercisePrompt: "Research your state's school voucher program if one exists. Find three data points: (1) How much public money is redirected annually? (2) What percentage of voucher recipients were already enrolled in private schools before the program? (3) Are voucher-receiving schools required to publish their financial records? Document what you find.",
        keyTakeaway: "Educational inequality is not an accident — it is the return on investment. Whoever benefits from compliance funds compliance. Follow the money from the General Education Board to modern voucher programs and you find the same architecture: wealth flowing upward through manufactured obedience.",
        patternToSpot: "Any reform marketed as 'choice' or 'freedom' that defunds public accountability while creating private profit with no oversight."
    ),

    // MARK: WEEK 6
    FMLesson(
        id: "fm_w6",
        week: 6,
        title: "Exit Strategy",
        subtitle: "The Belief Audit",
        hook: "You have spent five weeks looking at how the system was built, how it sorts and controls, how private schools manufacture compliance, how beliefs get installed before you can evaluate them, and what all of this costs. Now it is your turn. This week, you are not learning about the system. You are running a diagnostic on yourself.",
        body: """
**The Belief Audit: How It Works**

Take one belief from your Week 4 Origin Trace. Pick the one that felt most uncomfortable to examine. That discomfort is the signal. It means the ego has attached to that belief — which means it is the one most likely to be running unexamined code.

Run it through seven assessment parameters. Answer each one honestly. The audit is not here to judge your beliefs. It is here to judge your process.

**The Seven Parameters**

**1. Origin**
Where did this belief come from? Name the specific source. A parent? A pastor? A book? A community? Can you trace it beyond the person who gave it to you?

**2. Evidence**
What evidence supports this belief? What evidence contradicts it? Have you examined both, or only the confirming side?

**3. Stress Test**
What would need to be true for this belief to be wrong? Have you seriously engaged with that scenario — or have you dismissed it without examination?

**4. Stakes**
What would change in your life if this belief were false? Is maintaining this belief socially or emotionally costly to abandon?

**5. Logic**
Does this belief hold together under basic logical scrutiny? Can you state it as a testable claim — or does it require you to accept an unfalsifiable premise first?

**6. Counter-Position**
Can you steelman the strongest argument against this belief? If you cannot articulate the opposing view as well as its defenders can, you have not fully examined the territory.

**7. Identity Separation**
Can you evaluate this belief as a hypothesis — separate from who you are? Or does challenging the belief feel like challenging you?

**The Seven Bias Patterns to Watch For**

**Circular Reasoning** — Using the belief to justify the belief.
*"The Bible is true because God wrote it, and I know God wrote it because the Bible says so."*

**Authority Substitution** — Citing a person instead of evidence.
*"My pastor says this is true. My parents always taught me this."*

**Emotional Escalation** — Response shifts from analytical to defensive.
*"Why are you attacking my faith? This is who I am."*

**False Equivalence** — Treating evidence-based and faith-based claims as equally weighted.
*"Science has theories and religion has truths. Both are valid ways of knowing."*

**Selective Evidence** — Citing only confirming data while ignoring contradictions.

**Inherited Certainty** — Expressing absolute certainty about a belief that was received, not investigated.
*"I have always known this is true."*

**Tribal Signaling** — Defending the belief because abandoning it would mean leaving a group.
*"Everyone I know believes this."*

**Grading Your Process**

The grade does not measure what you believe. It measures how rigorously you examined it.

A person who holds a controversial belief but can trace its origin, cite evidence, engage counterarguments, and separate it from their identity will score higher than a person who holds a mainstream belief but cannot explain why they hold it.

The grade measures intellectual honesty — not ideological correctness.
""",
        personalTestimony: nil,
        exerciseTitle: "Run the Audit",
        exercisePrompt: "Select one belief from your Week 4 Origin Trace — the one that felt most uncomfortable. Answer all seven parameters in writing. For each bias pattern you detect in your own answers, write one follow-up question that pushes you deeper. This is not a test you pass once. This is a practice you build.",
        keyTakeaway: "The moment you ask 'Did I choose this belief or was it installed?' — the program loses its grip. You might keep the belief. You might modify it. You might throw it out entirely. What matters is that you chose. And choosing is exactly what the system was designed to prevent.",
        patternToSpot: "Any time you feel defensive about examining a belief — that defensiveness is the map. It tells you exactly where to look next."
    )
])
