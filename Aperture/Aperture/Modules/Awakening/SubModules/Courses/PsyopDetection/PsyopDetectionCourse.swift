// PsyopDetectionCourse.swift
// HOW TO SPOT A PSYOP - The Mammalian Brain Hack
// Based on behavioral science frameworks
// ☀️ SunFlow: Reignited

import SwiftUI

// MARK: - Course Data

struct PsyopDetectionCourse {
  static let shared = PsyopDetectionCourse()

  let id = "psyop_detection"
  let title = "How to Spot a Psyop"
  let subtitle = "The science of mass manipulation decoded"
  let icon = "brain.head.profile"
  let colorHex = "#FF3B30"  // Alert red

  var color: Color {
    Color(hex: colorHex)
  }

  let modules: [PsyopModule] = [
    // ═══════════════════════════════════════════════════════════════
    // MODULE 1: THE UNCOMFORTABLE TRUTH
    // ═══════════════════════════════════════════════════════════════
    PsyopModule(
      id: "psy1",
      number: 1,
      title: "The Uncomfortable Truth",
      subtitle: "Why you're more vulnerable than you think",
      icon: "exclamationmark.shield.fill",
      lessons: [
        PsyopLesson(
          id: "psy1_1",
          title: "The Firewall Fallacy",
          content: """
            **Most people live their life as though they have some kind of firewall or antivirus system in their own brain.**

            They believe: "I'm going to know it when I see it. I'm going to know manipulation when I see it."

            # These are the most suggestible people.

            They're the easiest to manipulate.

            **Think about it:**

            If you went to Best Buy today and picked up a new Windows computer, and someone said "Hey, you should download an antivirus program," and you replied:

            "Nah, I don't believe in viruses, bro."

            That's EXACTLY what's happening with our brains. We're not alert to manipulation because we believe we're immune.

            **The Truth:**

            The people who teach this stuff for a living—behavioral experts, psyop specialists, interrogators—they are TERRIFIED of mass manipulation.

            Why? Because they understand:

            > **Technology has outpaced the human brain's ability to adapt to it.**

            The human brain has not changed in 200,000 years. But the tools to manipulate it have gone logarithmic.

            **Your brain versus a trillion-dollar algorithm.**

            You're not going to win by thinking you're immune.

            🔥 **The first step to protection is admitting vulnerability. The moment you think you can't be manipulated is the moment you already are.**
            """,
          keyInsight:
            "Those who believe they're immune to manipulation are the MOST suggestible. Protection begins with admitting vulnerability.",
          framework:
            "Suggestibility is FLUID, not fixed. It can be increased or decreased based on conditions."
        ),

        PsyopLesson(
          id: "psy1_2",
          title: "The Mammalian Target",
          content: """
            **When it comes to psyops, they're not targeting your human brain.**

            They're targeting your MAMMALIAN brain.

            **The mammalian brain (limbic system) makes ALL of your choices and decisions. It is absolutely in charge.**

            Think you can override it with logic? Try this:

            **Hold your breath until you die.**

            You can't. You can't will your way out of the mammalian part of your brain taking over.

            **Here's the key insight:**

            If you understand how to take control of a DOG, you understand how to take control of a HUMAN.

            Same thing for a horse. A dolphin. A killer whale at SeaWorld jumping through hoops.

            **The same mechanisms that train animals control human populations.**

            This isn't metaphor. This is neuroscience.

            The emotional regulatory part of our brain—the limbic system going back into the brain stem—responds to the same triggers across all mammals.

            **The question isn't:** "Am I smarter than this?"

            **The question is:** "Do I understand what's targeting me?"

            🔥 **They're not trying to outsmart your neocortex. They're hijacking your mammal. And your mammal doesn't care about facts.**
            """,
          keyInsight:
            "Psyops target the mammalian brain (limbic system), not the logical neocortex. The same techniques that train animals control humans.",
          framework:
            "Your emotional brain makes decisions FIRST. Logic comes after to justify what the mammal already chose."
        ),

        PsyopLesson(
          id: "psy1_3",
          title: "Suggestibility Is Fluid",
          content: """
            **One more uncomfortable truth:**

            Suggestibility is NOT a fixed trait.

            It's not like: "This person is suggestible, this person isn't."

            # Suggestibility is FLUID.

            It can be increased. It can be decreased. It changes based on:
            - Your emotional state
            - Your level of fatigue
            - Your sense of safety or threat
            - Your tribal affiliations
            - Your information diet

            **What this means:**

            You can take a completely rational, skeptical person and MAKE them suggestible through specific techniques.

            You can also take a highly suggestible person and train them to become more resistant.

            **The scary implication:**

            Mass media, social platforms, and institutional messaging are specifically designed to INCREASE your suggestibility over time.

            They're not just trying to convince you of one thing. They're trying to make you easier to convince of ANYTHING.

            **The good news:**

            If suggestibility can be increased, it can also be decreased. That's what this course is about—decreasing your suggestibility by understanding the mechanisms.

            🔥 **You're not born immune or vulnerable. You're being made more suggestible every day—unless you actively resist.**
            """,
          keyInsight:
            "Suggestibility is fluid, not fixed. The goal of mass manipulation is to make you easier to convince of ANYTHING.",
          framework:
            "Protection comes from understanding the mechanisms and actively maintaining low suggestibility."
        ),
      ]
    ),

    // ═══════════════════════════════════════════════════════════════
    // MODULE 2: F.A.T.E. - THE MAMMAL HACK
    // ═══════════════════════════════════════════════════════════════
    PsyopModule(
      id: "psy2",
      number: 2,
      title: "F.A.T.E.",
      subtitle: "The four triggers that control mammals",
      icon: "target",
      lessons: [
        PsyopLesson(
          id: "psy2_1",
          title: "The FATE Framework",
          content: """
            **There are four things that take control of the mammalian brain.**

            They spell the word: **F.A.T.E.**

            # F - Focus
            # A - Authority  
            # T - Tribe
            # E - Emotion

            **If someone uses these four things, they can:**
            - Control a dog
            - Train a dolphin
            - Teach a killer whale to jump through hoops
            - Control an entire population of human beings
            - Or control just one human

            **This isn't theory. This is operational.**

            Every psyop, every propaganda campaign, every mass manipulation event uses some combination of FATE.

            When you see FATE being deployed, you're seeing a psyop in action.

            **The Detection Rule:**

            Anytime you notice your:
            - **Focus** being directed
            - **Authority** being invoked
            - **Tribe** being referenced
            - **Emotions** being triggered

            ...within seconds of each other, you're likely being manipulated.

            🔥 **FATE is the formula. Learn to see it, and you'll see it everywhere.**
            """,
          keyInsight:
            "F.A.T.E. (Focus, Authority, Tribe, Emotion) is the formula for mammalian control. All psyops use some combination.",
          framework: "F = Focus, A = Authority, T = Tribe, E = Emotion"
        ),

        PsyopLesson(
          id: "psy2_2",
          title: "Focus & Authority",
          content: """
            **F - FOCUS**

            The first step in any manipulation is controlling what you pay attention to.

            **How Focus is controlled:**
            - Breaking news alerts
            - "URGENT" notifications
            - Repetition of specific images/phrases
            - Burying stories on page 4 while amplifying others
            - Algorithmic curation of your feed

            **The Focus Question:**
            > "Why am I being shown THIS right now? What am I NOT being shown?"

            When something dominates your attention, ask what's being hidden in the noise.

            ---

            **A - AUTHORITY**

            Humans have an ancestral response to authority figures. We evolved in hierarchies. The mammalian brain is wired to comply with perceived authority.

            **How Authority is triggered:**
            - Lab coats, uniforms, titles
            - "Experts say..."
            - Institutional endorsements
            - Celebrity/influencer promotion
            - Official-looking graphics and production

            **The Milgram Experiment:**

            In 1962, Yale researcher Stanley Milgram showed that 67% of ordinary people would administer what they believed were lethal electric shocks to strangers—simply because a man in a lab coat told them to continue.

            100% went to 250 volts (enough to kill).

            **No hypnosis. No manipulation techniques. Just a lab coat.**

            **The Authority Question:**
            > "Why should I trust this source? What makes them an authority? Who benefits from my compliance?"

            🔥 **Focus tells you WHAT to think about. Authority tells you WHO to believe. Together, they set the stage for the real manipulation.**
            """,
          keyInsight:
            "Focus controls what you think about. Authority controls who you believe. The Milgram experiment proved 100% of people will comply with perceived authority.",
          framework:
            "Focus Question: 'What am I NOT being shown?' — Authority Question: 'Who benefits from my compliance?'"
        ),

        PsyopLesson(
          id: "psy2_3",
          title: "Tribe & Emotion",
          content: """
            **T - TRIBE**

            Humans are tribal mammals. We evolved to survive in groups. Exclusion from the tribe meant death.

            **The mammalian brain will:**
            - Ignore facts to maintain tribal belonging
            - Agree to stupid things if the tribe agrees
            - Attack outsiders to prove loyalty
            - Adopt beliefs as IDENTITY, not ideas

            **How Tribe is weaponized:**
            - "People like you believe..."
            - Laugh tracks / audience reactions
            - Social proof ("Everyone is doing this")
            - In-group / out-group framing
            - Identity-based political messaging

            **The Tribal Question:**
            > "Am I believing this because it's TRUE, or because my tribe believes it?"

            ---

            **E - EMOTION**

            The final trigger. Emotion bypasses logic entirely.

            **An emotional brain cannot think critically.**

            Fear, anger, outrage, hope, belonging—when these are activated, the logical brain goes offline.

            **How Emotion is weaponized:**
            - Fear-based headlines
            - Outrage cycles
            - Hope/change campaigns
            - Nostalgia manipulation
            - Threat narratives

            **The Emotion Question:**
            > "What am I FEELING right now? Is this feeling helping me think clearly, or preventing it?"

            **The FATE Stack:**

            When Focus + Authority + Tribe + Emotion hit you in sequence—within seconds—you are being manipulated.

            🔥 **Tribe makes you BELONG to a belief. Emotion makes you FEEL the belief. Together, they make facts irrelevant.**
            """,
          keyInsight:
            "Tribe triggers belonging instincts. Emotion bypasses logic. When both activate, facts become irrelevant—only identity matters.",
          framework:
            "Tribe Question: 'Am I believing this because it's TRUE?' — Emotion Question: 'Is this feeling helping me think?'"
        ),
      ]
    ),

    // ═══════════════════════════════════════════════════════════════
    // MODULE 3: P.C.P. - THE CONTEXT SHIFT
    // ═══════════════════════════════════════════════════════════════
    PsyopModule(
      id: "psy3",
      number: 3,
      title: "P.C.P.",
      subtitle: "Perception, Context, Permission",
      icon: "eye.trianglebadge.exclamationmark",
      lessons: [
        PsyopLesson(
          id: "psy3_1",
          title: "The PCP Framework",
          content: """
            **If you want to get good at spotting psyops, remember: PCP.**

            Everything revolves around:

            # P - Perception
            # C - Context
            # P - Permission

            **The Chain:**

            1. If I can modify your **PERCEPTION** (how you see something)...
            2. I can automatically shift your **CONTEXT** (how you understand the situation)...
            3. And if I can shift your context, I can give you **PERMISSION** in your own head to do anything I want you to do.

            **This is how all manipulation works.**

            Not through force. Through shifting how you see reality until the action I want becomes the obvious, natural choice.

            **Example: The Hypnotist's Trick**

            A clinical hypnotist can get someone to undress in their office. How?

            They don't say "take off your clothes." That violates your rules.

            They say: "You just got home from a long drive. You throw your keys in the bowl. You turn on the nice hot water. The shower's ready for you. You're getting in the shower now."

            **Same action. Different context. Permission granted.**

            🔥 **PCP is the mechanism. Shift perception → shift context → grant permission. See it once, you'll see it everywhere.**
            """,
          keyInsight:
            "PCP: Perception → Context → Permission. All manipulation works by shifting how you see reality until the desired action feels natural.",
          framework:
            "P = Perception (how you see), C = Context (how you understand), P = Permission (what feels allowed)"
        ),

        PsyopLesson(
          id: "psy3_2",
          title: "Context Is Everything",
          content: """
            **The most dangerous manipulation doesn't change facts. It changes CONTEXT.**

            **Example: The Manchurian Candidate**

            You won't shoot someone in a room full of people. That's murder.

            But what if you believed everyone in that room was a zombie? An enemy combatant? A threat to your family?

            **Same action. Different context. Different permission.**

            This is how they create mass shooters. This is how they create riots. This is how they get populations to turn on each other.

            **They don't change the facts. They change how you SEE the facts.**

            **Mass Scale Context Shifting:**

            When a population starts seeing a different context, you can get them to:
            - Take violent action
            - Protest things that harm themselves
            - Riot against their own interests
            - Support policies that destroy them
            - Attack people who are trying to help them

            **The Context Detection:**

            When you're being told HOW to see something—not just WHAT to see—you're experiencing context manipulation.

            **Red Flags:**
            - "This is really about..."
            - "What they don't want you to know is..."
            - "The REAL reason..."
            - "If you look at it THIS way..."

            These phrases signal context shifting. The facts may be the same, but the framing changes everything.

            🔥 **Facts are neutral. Context gives them meaning. Control the context, control the response.**
            """,
          keyInsight:
            "The most dangerous manipulation changes context, not facts. Same facts + different context = completely different response.",
          framework:
            "Red flag phrases: 'This is really about...' 'The REAL reason...' — These signal context manipulation."
        ),

        PsyopLesson(
          id: "psy3_3",
          title: "The Permission Structure",
          content: """
            **Once perception and context are shifted, permission follows automatically.**

            You don't have to be TOLD to do something. You give yourself permission because the context makes it obvious.

            **How Permission Works:**

            In normal context: "I would never do X."

            In shifted context: "X is the only reasonable response."

            **The Permission Layers:**

            1. **Moral Permission** — "It's the right thing to do"
            2. **Social Permission** — "Everyone else is doing it"
            3. **Survival Permission** — "I have no choice"
            4. **Identity Permission** — "This is who I am"

            **Psyops stack these permissions.**

            They don't just make you THINK you should act. They make you feel MORALLY OBLIGATED, SOCIALLY EXPECTED, SURVIVAL NECESSARY, and IDENTITY CONSISTENT.

            **When all four permissions align, people will do ANYTHING.**

            The Milgram experiment didn't use hypnosis or tricks. It just created a context where:
            - Moral: "This is for science" (good cause)
            - Social: "The experimenter expects it" (compliance)
            - Survival: "I'm not in danger" (safe)
            - Identity: "I'm a helpful participant" (role)

            **100% shocked at 250 volts. 67% went lethal.**

            **The Permission Question:**

            When you feel compelled to act, ask:
            > "What permission am I giving myself? Who created this permission structure?"

            🔥 **You're never FORCED to comply. You're given PERMISSION to comply. See the permission structure, and the spell breaks.**
            """,
          keyInsight:
            "Permission follows context automatically. Psyops stack moral, social, survival, and identity permissions until action feels inevitable.",
          framework:
            "Permission Question: 'What permission am I giving myself? Who created this permission structure?'"
        ),
      ]
    ),

    // ═══════════════════════════════════════════════════════════════
    // MODULE 4: FRACTIONATION - THE EMOTIONAL HACK
    // ═══════════════════════════════════════════════════════════════
    PsyopModule(
      id: "psy4",
      number: 4,
      title: "Fractionation",
      subtitle: "How they increase your suggestibility",
      icon: "waveform.path.ecg",
      lessons: [
        PsyopLesson(
          id: "psy4_1",
          title: "The Hypnotic Technique",
          content: """
            **Fractionation is a clinical hypnosis technique. And it's being used on populations.**

            **How it works:**

            1. Take emotions WAY UP
            2. Pull emotions DOWN
            3. Take emotions UP again
            4. Pull DOWN again
            5. Each time you go down, you become MORE SUGGESTIBLE

            **In clinical hypnosis:**

            A hypnotist puts you into trance, then partially wakes you up:

            > "In a moment I'll count from 1 to 5, your awareness of the room is coming back, you're more aware of the sound of my voice, waking up just enough to open your eyes now... open your eyes... great... and SLEEP, all the way down, back again."

            Every time you go back into hypnosis, you go DEEPER.

            **The Brain Science:**

            Two things happen during fractionation:

            1. Your brain enters **Theta wave state** (4-7 Hz neural oscillations)
            2. Your brain floods with **GABA** (gamma-aminobutyric acid)

            GABA is the brain's "safety chemical." It calms everything down. It makes you feel safe and compliant.

            **This is what ALL hypnosis is:**
            - Theta brain wave state
            - Increased GABA levels
            - Suggestibility maximized

            🔥 **Fractionation doesn't just happen in a therapist's office. It's happening to you every day through media.**
            """,
          keyInsight:
            "Fractionation: emotional up/down cycling that increases suggestibility with each cycle. It's a clinical hypnosis technique used on populations.",
          framework:
            "Each emotional cycle → deeper suggestibility. Theta waves + GABA = maximum compliance."
        ),

        PsyopLesson(
          id: "psy4_2",
          title: "Mass Fractionation",
          content: """
            **Look at society over the last few years.**

            High points. Low points. High. Low.

            **Every low gets a little bit LOWER than the last low.**

            We become more suggestible. And more suggestible. And more compliant.

            **This has been demonstrated in study after study:**

            The more compliant we become:
            - We blindly follow the tribe
            - We ignore facts
            - We agree to things that are obviously stupid
            - We attack people who question the narrative

            **This is ENGINEERED SUGGESTIBILITY.**

            **How News Uses Fractionation:**

            Watch any news show or political talk show. You'll see:

            **Bad news → Joke → Good news → Bad news → Joke → Good news**

            Right on the little HIGH point, as they start pulling you DOWN, your brain has a lot of expectancy...

            **BOOM — Commercial.**

            Now you're more likely to:
            - Buy products
            - Spend money
            - Give to advertisers
            - Accept the next message

            **The Fractionation Pattern:**

            1. Emotional spike (outrage, fear, hope)
            2. Release (joke, resolution, comfort)
            3. Emotional spike (new topic)
            4. Release
            5. Commercial or call to action at the vulnerable point

            🔥 **They're not just showing you content. They're cycling your emotions to maximize your suggestibility for the next message.**
            """,
          keyInsight:
            "Mass fractionation: society's emotional highs and lows are engineered. Each cycle makes the population more compliant.",
          framework:
            "News pattern: Bad news → Joke → Commercial at the vulnerable point. Emotional cycling = suggestibility farming."
        ),

        PsyopLesson(
          id: "psy4_3",
          title: "The Talk Show Formula",
          content: """
            **Let's decode how political talk shows manipulate you.**

            Take any show. The formula is identical:

            **Step 1: Strange Fact**
            A claim that's hard to back up or has many counter-arguments. Presented as obvious truth.

            **Step 2: Emotional Trigger**
            Something to make you feel like you should hate someone, or someone is stupid, or someone did something bad.

            **Step 3: Before You Can Process — JOKE**

            The joke prevents logical processing of the claim.

            **Step 4: Audience Reaction**

            You hear 150 people laughing. This triggers your TRIBAL response:
            - "That line was funny"
            - "Everyone agrees"
            - "This is the correct response"

            **Step 5: Information Lodged**

            That unverified claim is now lodged in your head as more-or-less fact.

            **Why The Joke Matters:**

            The number one goal of manipulation is to **bypass the brain's critical factor.**

            The critical factor is the part of your brain that asks:
            - Is this information accurate?
            - Is this good for me?
            - Should I do this?

            **A joke immediately after a claim BYPASSES that critical factor.**

            You can't simultaneously laugh and critically evaluate. The mammalian brain doesn't work that way.

            **The Detection:**

            Whenever you see: **Claim → Joke → Tribal reaction**

            You're watching the critical factor bypass in real time.

            🔥 **They're not trying to convince you. They're preventing you from thinking. The joke is the weapon.**
            """,
          keyInsight:
            "Claim → Joke → Audience reaction = critical factor bypass. You can't laugh and critically evaluate simultaneously.",
          framework:
            "The joke prevents logical processing. The audience triggers tribal compliance. The claim lodges as fact."
        ),
      ]
    ),

    // ═══════════════════════════════════════════════════════════════
    // MODULE 5: P.D.S. - THE COMPLIANCE PIPELINE
    // ═══════════════════════════════════════════════════════════════
    PsyopModule(
      id: "psy5",
      number: 5,
      title: "P.D.S.",
      subtitle: "Pacify, Distract, Sedate",
      icon: "pills.fill",
      lessons: [
        PsyopLesson(
          id: "psy5_1",
          title: "The Psyop Goals",
          content: """
            **Most psyops have two primary goals:**

            # 1. Destroy Outrage
            # 2. Instill Apathy

            **High apathy + Very low outrage = Compliant population**

            **How Outrage Is Destroyed:**

            If I show you things all day that make you upset, that make you pissed off, soon enough you're going to say:

            > "I can't do this anymore. Here's another thing that's pissing me off. No. I'm just going to flip to the next video."

            **That's not accident. That's engineering.**

            The endless cycle of outrage isn't meant to activate you. It's meant to EXHAUST you until you stop caring.

            **How Apathy Is Installed:**

            Once outrage is destroyed, apathy fills the void:
            - "Nothing I do matters"
            - "They're all the same"
            - "It's too big to change"
            - "I'll just focus on my own life"

            **This is the desired state.**

            An apathetic population doesn't resist. Doesn't question. Doesn't organize. Doesn't threaten power.

            **The Detection:**

            If you find yourself feeling:
            - Exhausted by news
            - Hopeless about change
            - Cynical about everything
            - "Checked out"

            You're not broken. You've been successfully psyoped into apathy.

            🔥 **Outrage fatigue is the goal. Apathy is the product. A population that doesn't care is a population that's controlled.**
            """,
          keyInsight:
            "Psyop goal: destroy outrage through exhaustion, install apathy. A population that doesn't care can't resist.",
          framework:
            "Endless outrage → Exhaustion → Apathy → Compliance. This is engineered, not accidental."
        ),

        PsyopLesson(
          id: "psy5_2",
          title: "The PDS Pipeline",
          content: """
            **Once apathy is installed, the next phase begins: P.D.S.**

            # P - Pacify
            # D - Distract
            # S - Sedate

            **In that order.**

            ---

            **PACIFY**

            Engineer a culture of loneliness, then offer anesthetics.

            Sound familiar?

            - Social media replacing real connection
            - Parasocial relationships with influencers
            - Dating apps destroying organic meeting
            - Remote work isolating workers
            - Algorithms feeding you what keeps you passive

            **Lonely people are controllable people.**

            ---

            **DISTRACT**

            Pay attention to TIMING.

            When you see something that looks like a distraction, ask:
            - Is there an election coming up?
            - Is there a transition of power happening?
            - Is a politician about to be exposed?
            - What's on PAGE 4 of the news, not just the front page?

            **Examples that make you wonder:**
            - Gas leaks at factories
            - Train crashes shooting smoke into air
            - Helicopters running into planes
            - Drones appearing over cities
            - Celebrity scandals timed perfectly

            Maybe accidents. Maybe not. But the TIMING is always suspicious.

            ---

            **SEDATE**

            Overload with information. Exhaust the capacity to process.

            Then use fractionation to maximize suggestibility.

            🔥 **Pacify through loneliness. Distract through spectacle. Sedate through overload. The pipeline to compliance.**
            """,
          keyInsight:
            "PDS Pipeline: Pacify (loneliness/anesthetics), Distract (timed spectacles), Sedate (information overload + fractionation).",
          framework:
            "Always ask: What's the TIMING? What's on page 4? Who benefits from this distraction?"
        ),

        PsyopLesson(
          id: "psy5_3",
          title: "The Product Test",
          content: """
            **Here's a powerful detection tool:**

            > **If a product doesn't tell you the problem it's solving, you need to be TERRIFIED.**

            **Example: Amazon**

            Clear problem-solving:
            - "We're going to get stuff to you faster"
            - "Overnight delivery"
            - "Easy returns"
            - "You want that shirt? Tomorrow."

            The problems are clear. The solutions are clear.

            ---

            **Example: VR Goggles (Apple Vision Pro, Meta Quest, etc.)**

            Go try to find where they tell you what problem they're solving.

            **They don't.**

            Because the problem they're solving is LONELINESS.

            And they can't say that.

            These products are anesthetics for dissatisfaction with life. Pacification devices marketed as innovation.

            ---

            **The Detection Questions:**

            For any product, platform, or service:
            1. What problem does this solve?
            2. If they won't tell you, what problem does it ACTUALLY solve?
            3. Is the actual problem something they can't admit to?
            4. Who profits from my dissatisfaction/loneliness/apathy?

            **The Pacification Industry:**

            - Social media → Loneliness anesthetic
            - Streaming services → Reality escape
            - VR → Total dissociation
            - Endless content → Thought prevention
            - Algorithmic feeds → Autonomy removal

            🔥 **If they can't tell you the problem, you ARE the problem they're solving. Your attention, your time, your compliance.**
            """,
          keyInsight:
            "If a product won't tell you the problem it solves, the problem is probably YOU—your loneliness, dissatisfaction, or autonomy.",
          framework:
            "Product Test: What problem does this solve? If they won't say, what does it ACTUALLY solve? Who profits from my compliance?"
        ),
      ]
    ),

    // ═══════════════════════════════════════════════════════════════
    // MODULE 6: THE IMMUNITY PROTOCOL
    // ═══════════════════════════════════════════════════════════════
    PsyopModule(
      id: "psy6",
      number: 6,
      title: "The Immunity Protocol",
      subtitle: "How to protect yourself",
      icon: "shield.checkered",
      lessons: [
        PsyopLesson(
          id: "psy6_1",
          title: "The Detection Checklist",
          content: """
            **You now have the frameworks. Here's how to use them in real-time.**

            # THE FATE CHECK

            When consuming any media, ask:
            - ☐ **Focus:** Why am I being shown THIS? What's being hidden?
            - ☐ **Authority:** Why should I trust this source? Who benefits?
            - ☐ **Tribe:** Am I believing this because it's TRUE or because my tribe believes it?
            - ☐ **Emotion:** What am I FEELING? Is it helping me think or preventing it?

            # THE PCP CHECK

            When you feel compelled to act or believe:
            - ☐ **Perception:** How am I being told to SEE this?
            - ☐ **Context:** What context am I being placed in?
            - ☐ **Permission:** What permission am I giving myself? Who created this structure?

            # THE FRACTIONATION CHECK

            When consuming news/entertainment:
            - ☐ Is there a bad news → joke → reaction pattern?
            - ☐ Am I being emotionally cycled up and down?
            - ☐ Where are the commercials/calls-to-action placed?

            # THE PDS CHECK

            For platforms and products:
            - ☐ Is this pacifying me through pseudo-connection?
            - ☐ Is this distracting me from something important?
            - ☐ Is this sedating my ability to think?
            - ☐ What problem does this ACTUALLY solve?

            🔥 **Run these checks regularly. Eventually they become automatic. That's immunity.**
            """,
          keyInsight:
            "Detection becomes automatic with practice. Run FATE, PCP, Fractionation, and PDS checks until they're reflexive.",
          framework:
            "Checklists: FATE (Focus/Authority/Tribe/Emotion), PCP (Perception/Context/Permission), Fractionation, PDS"
        ),

        PsyopLesson(
          id: "psy6_2",
          title: "The Exposure Protocol",
          content: """
            **You cannot completely avoid manipulation. But you can minimize exposure and maximize recovery.**

            # MINIMIZE EXPOSURE

            **Set hard limits on social media.**
            - 60 seconds per day is recommended by behavioral experts
            - Yes, 60 SECONDS
            - The experts who teach this stuff are TERRIFIED of algorithms

            **Curate ruthlessly.**
            - Unfollow anything that triggers FATE without adding value
            - If it makes you angry without giving you actionable information, it's manipulation

            **Check the timing.**
            - When something "breaks," ask what else is happening
            - Look at page 4, not just the front page
            - Wait 48 hours before forming strong opinions

            # MAXIMIZE RECOVERY

            **After exposure to emotionally charged content:**
            - Physical movement (breaks the hypnotic state)
            - Nature exposure (resets the nervous system)
            - Face-to-face human contact (counters tribal manipulation)
            - Sleep (processes and clears emotional residue)

            **After realizing you've been manipulated:**
            - Don't shame yourself (that increases suggestibility)
            - Identify the specific technique used
            - Add it to your detection library
            - Move on

            🔥 **Exposure is inevitable. Recovery is a skill. Build the skill.**
            """,
          keyInsight:
            "Minimize exposure (hard limits, ruthless curation, timing awareness). Maximize recovery (movement, nature, human contact, sleep).",
          framework:
            "60-second social media limit. Wait 48 hours before opinions. Don't shame yourself—identify the technique and move on."
        ),

        PsyopLesson(
          id: "psy6_3",
          title: "The Final Truth",
          content: """
            **The greatest deception in modern history:**

            > **Convincing people that issues are about Left vs Right, Conservative vs Liberal, Democrat vs Republican.**

            # It's not.

            **The division IS the psyop.**

            If you're unable to find GOOD in a political opponent, something is wrong.

            If you're unable to see BAD in a politician you support, something is wrong.

            **Something has occurred in your brain where there's been a transition.**

            It's okay to admit it. The experts who teach this stuff admit they're just as susceptible.

            **The Identity Trap:**

            People adopt beliefs not as IDEAS but as IDENTITY.

            - "I believe X" becomes "I AM someone who believes X"
            - Questioning the belief becomes questioning the identity
            - The tribe reinforces the identity
            - Facts become threats to self

            **The Book "When Prophecy Fails":**

            A psychologist studied a cult that predicted the world would end on a specific date. 

            When the date passed and nothing happened, the cult members didn't leave. They DOUBLED DOWN.

            Why? Because they had adopted the belief as identity. To abandon it would be to abandon themselves.

            **The Final Protection:**

            Hold beliefs as IDEAS, not IDENTITY.

            Be willing to say:
            - "I was wrong"
            - "I was manipulated"
            - "I see good in my opponent"
            - "I see bad in my side"

            This is not weakness. This is immunity.

            🔥 **The division is the psyop. The identity trap is the mechanism. The exit is intellectual humility. Stay fluid. Stay free.**
            """,
          keyInsight:
            "The Left/Right division IS the psyop. If you can't see good in opponents or bad in your side, you've been captured.",
          framework:
            "Hold beliefs as IDEAS, not IDENTITY. The exit from manipulation is intellectual humility."
        ),
      ]
    ),

    // ═══════════════════════════════════════════════════════════════
    // MODULE 7: THE CRITICAL FACTOR
    // ═══════════════════════════════════════════════════════════════
    PsyopModule(
      id: "psy7",
      number: 7,
      title: "The Critical Factor",
      subtitle: "How they bypass your thinking brain",
      icon: "brain.fill",
      lessons: [
        PsyopLesson(
          id: "psy7_1",
          title: "The Brain's Gatekeeper",
          content: """
            **The number one goal of hypnosis is to BYPASS the brain's Critical Factor.**

            **What is the Critical Factor?**

            It's the part of your brain that asks:
            - Is this information accurate?
            - Is this good for me?
            - Should I do this?
            - Does this make sense?

            It's your internal gatekeeper. Your BS detector. Your logic filter.

            **How Hypnotists Bypass It:**

            Listen to what clinical hypnotists actually say:

            > "And as you listen to this voice, your conscious mind might just wander around all on its own... and the part of you that really needs to hear what we're going to do today can stay with me... while your conscious mind can drift and think of anything that it wants to think about."

            **Did you catch that?**

            They're literally telling your critical factor to go take a break. To wander off. To not pay attention.

            **And it works.**

            Because the critical factor isn't a wall—it's a tired security guard. Give it something else to do, and the back door opens.

            🔥 **Every media manipulation technique is designed to do ONE thing: distract, exhaust, or bypass your critical factor so information can lodge without examination.**
            """,
          keyInsight:
            "The critical factor is your brain's gatekeeper that evaluates information. All manipulation is designed to bypass, distract, or exhaust it.",
          framework:
            "Critical Factor = the part asking 'Is this accurate? Is this good for me?' When it's bypassed, information lodges uncritically."
        ),

        PsyopLesson(
          id: "psy7_2",
          title: "The Talk Show Formula",
          content: """
            **Here's exactly how TV shows bypass your critical factor in real-time.**

            Watch ANY political talk show. The formula is identical:

            **STEP 1: Controversial Statement**

            A claim that's hard to back up. Something where you could argue against it. A "fact" designed to make you feel like someone is stupid, evil, or should be hated.

            **STEP 2: Before You Can Process — JOKE**

            Immediately after the claim, before your brain can evaluate it, there's a joke.

            The joke is not entertainment. The joke is the WEAPON.

            **Why?**

            > **You cannot simultaneously laugh AND critically evaluate.**

            The mammalian brain doesn't work that way. Laughter and critical analysis use different neural pathways. One shuts off the other.

            **STEP 3: Audience Reaction**

            You hear 150 people laughing.

            This triggers your TRIBAL response:
            - "That was funny"
            - "Everyone agrees"
            - "This is the correct response"
            - "I should feel this way too"

            **STEP 4: Information Lodged**

            That unverified, controversial claim is now in your head as more-or-less fact.

            You didn't evaluate it. You laughed at it. Your tribe approved it. It's now part of your reality.

            **The Formula:**

            Claim → Joke → Tribal Reaction → Fact

            🔥 **The joke is not comic relief. The joke is the critical factor bypass. Every laugh is a logic shutdown.**
            """,
          keyInsight:
            "Claim → Joke → Tribal Reaction = Critical Factor Bypass. You cannot laugh and critically evaluate simultaneously.",
          framework:
            "The joke PREVENTS processing. The audience triggers tribal compliance. The claim lodges as fact without examination."
        ),

        PsyopLesson(
          id: "psy7_3",
          title: "The Neuroscience of Compliance",
          content: """
            **This isn't theory. This is measurable brain science.**

            **What happens during hypnosis / high-suggestibility states:**

            **1. Theta Wave State**

            Your brain enters the Theta wave frequency: 4-7 Hz neural oscillations.

            This is the drowsy, dreamy state between waking and sleeping. The state where the critical factor relaxes.

            **2. GABA Flood**

            Your brain floods with GABA (gamma-aminobutyric acid).

            GABA is the brain's number one INHIBITORY neurotransmitter. It's like a resident assistant walking around telling everyone to turn the music down.

            GABA is your "safety chemical." It makes you feel calm and safe.

            **When you feel safe, you stop questioning.**

            **3. The Compliant State**

            Theta waves + GABA = the hypnotic state.

            And here's the terrifying part:

            > **This is happening to populations at a MASS SCALE.**

            The emotional cycling of news, the tribal cues, the authority figures, the repetition—all of it is inducing population-wide states of increased suggestibility.

            **It is clear as day that it's being done.**

            What's obfuscated is the end goal. But the mechanism? It's visible to anyone who knows what to look for.

            🔥 **Mass media isn't informing you. It's inducing compliance states. Theta + GABA = suggestible population.**
            """,
          keyInsight:
            "Theta waves (4-7 Hz) + GABA flood = hypnotic compliance state. This is being induced at mass scale through media.",
          framework:
            "Theta = dreamy/drowsy state. GABA = safety/calm chemical. Together = critical factor offline, suggestibility maximized."
        ),
      ]
    ),

    // ═══════════════════════════════════════════════════════════════
    // MODULE 8: TARGET SELECTION
    // ═══════════════════════════════════════════════════════════════
    PsyopModule(
      id: "psy8",
      number: 8,
      title: "Target Selection",
      subtitle: "How they pick the perfect weapon",
      icon: "person.crop.circle.badge.exclamationmark",
      lessons: [
        PsyopLesson(
          id: "psy8_1",
          title: "The Manchurian Method",
          content: """
            **The true talent isn't in hypnosis. The true talent is in TARGET SELECTION.**

            You can learn extreme hypnotic techniques in a day. That's not the hard part.

            The hard part is picking the PERFECT person.

            **What makes a perfect target?**

            - Are they ALREADY angry or resentful?
            - Do they have deep-seated grievances?
            - Are they highly suggestible to begin with?
            - Are they susceptible to hypnosis?
            - Do they fit a narrative that will be useful AFTER?

            **The Case of Sirhan Sirhan:**

            Convicted of assassinating Senator Bobby Kennedy. To this day, he says he has no memory of the event.

            He was standing 7 feet in front of Kennedy, pointing a gun at him.

            Kennedy's fatal gunshot wounds? One in the BACK of the head, one under the armpit. FROM BEHIND.

            Sirhan was Palestinian. He had reason to be resentful. He was highly suggestible.

            **Perfect target.**

            The documentation suggests he was there. With a gun. But did he fire the fatal shots? The ballistics say no.

            **The Selection Criteria:**

            1. Pre-existing anger toward the target
            2. Background that fits the post-event narrative
            3. High baseline suggestibility
            4. Isolation / lack of support system
            5. Plausible motive that will hold up publicly

            🔥 **The weapon isn't the technique. The weapon is the person. Target selection is where the true skill lies.**
            """,
          keyInsight:
            "The true skill isn't hypnosis—it's target selection. Finding someone already angry, suggestible, and narratively useful.",
          framework:
            "Perfect Target = pre-existing anger + fitting narrative + high suggestibility + isolation + plausible motive"
        ),

        PsyopLesson(
          id: "psy8_2",
          title: "Ideas vs Identity",
          content: """
            **When watching any media, ask this question:**

            > **Am I being sold on IDEAS or IDENTITY?**

            These are two completely different pathways to influence.

            **Selling Ideas:**

            "Here's a fact. Here's the evidence. Evaluate it and decide."

            The appeal is to your logic. Your critical factor is invited to participate.

            **Selling Identity:**

            "I know you're a good person, so you're going to believe what I'm about to say."

            "People like YOU understand..."

            "Smart people know that..."

            "You're not one of THOSE people, are you?"

            **The identity pathway bypasses logic entirely.**

            It connects the belief to who you ARE. Which means:

            - Accepting the belief = good person
            - Rejecting the belief = bad person
            - Questioning the belief = questioning yourself

            **The Dangerous Transition:**

            Watch for this progression:
            1. "I like this idea" → 
            2. "I like this person who promotes this idea" →
            3. "I now believe this" →
            4. "Having this belief makes me a certain type of person" →
            5. "I am morally/intellectually superior because I believe this"

            **Once you reach stage 5, you're locked.**

            Facts become threats. Questions become attacks. You've joined a cult of identity.

            🔥 **Ideas can be evaluated and changed. Identity cannot. When beliefs become identity, manipulation becomes permanent.**
            """,
          keyInsight:
            "Ideas can be changed; identity cannot. Watch for the transition from 'I believe this' to 'I AM someone who believes this.'",
          framework:
            "Selling Identity = 'People like YOU...' / 'Smart people know...' — bypasses logic, connects belief to self-worth."
        ),

        PsyopLesson(
          id: "psy8_3",
          title: "The Quiet Ones",
          content: """
            **Here's an intelligence-level detection technique:**

            **When something major is happening, everyone focuses on the people making noise.**

            The protestors. The talking heads. The ones screaming on TV.

            That's where they WANT you to look.

            **But here's the real question:**

            > **Who just got very, very quiet?**

            When corruption is being exposed, when power is shifting, when something real is happening—pay attention to who STOPS talking.

            **The Loud Ones:**

            - They may be genuine
            - They may be performing
            - They may be distracting
            - They're definitely where attention is directed

            **The Quiet Ones:**

            - Something changed
            - They know something
            - They're protecting something
            - They're waiting for something

            **The Detection:**

            When major news breaks, don't just ask "What are people saying?"

            Ask:
            - Who suddenly went silent?
            - Who cancelled appearances?
            - Who stopped posting?
            - Who is conspicuously absent?

            **The truth is often found in the sudden silences, not the loud noises.**

            This works at every level:
            - Personal relationships
            - Corporate scandals  
            - Political events
            - International crises

            🔥 **Noise is cheap. Silence is expensive. When powerful people go quiet, something real is happening.**
            """,
          keyInsight:
            "When something real is happening, watch who suddenly goes QUIET. Silence from powerful people = something real.",
          framework:
            "The loud ones get attention. The quiet ones have information. Sudden silence from usually-loud voices = detection signal."
        ),
      ]
    ),

    // ═══════════════════════════════════════════════════════════════
    // MODULE 9: THE SIMULATION LAYER
    // ═══════════════════════════════════════════════════════════════
    PsyopModule(
      id: "psy9",
      number: 9,
      title: "The Simulation Layer",
      subtitle: "You're already in one",
      icon: "cube.transparent",
      lessons: [
        PsyopLesson(
          id: "psy9_1",
          title: "Simulacra and Simulation",
          content: """
            **You're already in a simulation. And it's not digital.**

            French philosopher Jean Baudrillard wrote about this in "Simulacra and Simulation."

            **What is a simulation?**

            A copy of something real. A representation. A stand-in.

            **What is a simulacrum?**

            A copy of something that HAS NO ORIGINAL.

            **Examples:**

            **Walmart** is a simulation of a market our ancestors would use. 

            The pictures on packaging are simulations of what's inside—and we KNOW they don't represent reality.

            **Burger King menu** shows a burger. We know that burger is a simulation. The real burger won't look like that.

            **Then it gets weird:**

            **Disney World** is full of people simulating SIMULATIONS of Disney characters that are themselves simulating things that have NO ORIGINAL.

            Mickey Mouse isn't based on a real mouse. The costume actor is simulating a simulation of a simulation.

            There is no original. It's simulacra all the way down.

            **Hyperreality:**

            When simulations become BETTER than reality, you get hyperreality.

            Disney's "Main Street USA" is cleaner, safer, and more pleasant than any actual American main street. The simulation is preferable to reality.

            **This is the world you live in.**

            Not digital. But already simulated.

            🔥 **Before we ever talked about digital simulation, we were already living in a world of copies, copies of copies, and copies with no original.**
            """,
          keyInsight:
            "Baudrillard: We already live in simulation. Simulacra = copies with no original. Hyperreality = simulations better than reality.",
          framework:
            "Simulation = copy of real. Simulacra = copy with no original. Hyperreality = simulation preferred to reality."
        ),

        PsyopLesson(
          id: "psy9_2",
          title: "The Five Levels of Exit",
          content: """
            **In video games, there are hackers who find ways to escape the intended boundaries.**

            They make videos about getting "out of bounds"—exploring areas you're not supposed to see.

            **The Five Levels of Exit:**

            **Level 1: Can I SEE into the out-of-bounds area?**

            Looking past the walls. Glimpsing what they don't want you to see.

            This is awakening. Noticing the edges of the simulation.

            **Level 2: Can I EXIT the playable area?**

            Getting beyond the intended boundaries while still in the game.

            This is questioning. Moving past acceptable discourse.

            **Level 3: Can I EXIT the map entirely?**

            Falling through the floor. Seeing the entire game from underneath. The skeleton of buildings. The wireframe of streets.

            This is pattern recognition. Seeing the structure beneath the surface.

            **Level 4: Can I jump to ANOTHER game?**

            Making your character leave one game and enter another.

            This is paradigm shifting. Moving between worldviews entirely.

            **Level 5: Can I EXIT the console?**

            Not just leaving one game for another, but leaving the entire system.

            This is... something else. The ineffable. What mystics describe.

            **The First Step:**

            Becoming aware of the boundaries. Noticing where the "walls" are.

            What thoughts are "not allowed"?
            What questions are "off limits"?
            What areas are "out of bounds"?

            **That's Level 1. That's where you start.**

            🔥 **The simulation has edges. The first step to freedom is finding them. Then you can decide whether to cross.**
            """,
          keyInsight:
            "Five Exit Levels: 1) See beyond walls 2) Exit playable area 3) Exit map entirely 4) Jump to another game 5) Exit the console.",
          framework:
            "Level 1 = awakening. Level 3 = pattern recognition. Level 5 = transcendence. Start by finding the boundaries."
        ),

        PsyopLesson(
          id: "psy9_3",
          title: "Locating Reality",
          content: """
            **The question isn't "Is this a simulation?"**

            **The question is: "Where is reality in all of this?"**

            When everything is a simulation of a simulation of a simulation, how do you find what's REAL?

            **Detection Method 1: Physicality**

            What can you touch? Smell? Taste? What has weight and texture?

            The body is the anchor. Physical sensation is harder to simulate than ideas.

            **Detection Method 2: First-Hand Experience**

            Did YOU see it? Did YOU experience it? Or did someone TELL you?

            The further from direct experience, the more simulated.

            **Detection Method 3: The Language Test**

            > **Our language is not capable of communicating ultimate reality.**

            If someone describes transcendent experience and it makes perfect sense, they're probably simulating.

            Real encounters with reality are INEFFABLE. They resist language.

            **Detection Method 4: The Certainty Test**

            > **The more certain someone is that they've got it figured out, the more suspicious you should be.**

            Reality is vast. Certainty is small. 

            Those who've glimpsed reality know how little they know.

            **Detection Method 5: Direct Knowing**

            Some things can't be told. They can only be experienced.

            If two people have both visited "the other side," they can recognize each other. No explanation needed.

            If one hasn't, no explanation is possible.

            **The Goal:**

            Not to escape the simulation. That might not be possible.

            But to LOCATE reality within it. To find the solid ground. To know what's real even when surrounded by copies of copies.

            🔥 **Reality exists. It's harder to find. But physicality, direct experience, ineffability, humility, and direct knowing are the compass points.**
            """,
          keyInsight:
            "Reality is findable: physicality, first-hand experience, ineffability, humility, and direct knowing are the compass points.",
          framework:
            "Certainty = suspicious. Ineffability = authentic. Direct experience > told experience. The body is the anchor."
        ),
      ]
    ),
  ]
}

// MARK: - Models

struct PsyopModule: Identifiable {
  let id: String
  let number: Int
  let title: String
  let subtitle: String
  let icon: String
  let lessons: [PsyopLesson]
}

struct PsyopLesson: Identifiable {
  let id: String
  let title: String
  let content: String
  let keyInsight: String
  let framework: String
}

/// Equatable
extension PsyopModule: Equatable {
  static func == (lhs: PsyopModule, rhs: PsyopModule) -> Bool {
    lhs.id == rhs.id
  }
}

extension PsyopLesson: Equatable {
  static func == (lhs: PsyopLesson, rhs: PsyopLesson) -> Bool {
    lhs.id == rhs.id
  }
}
