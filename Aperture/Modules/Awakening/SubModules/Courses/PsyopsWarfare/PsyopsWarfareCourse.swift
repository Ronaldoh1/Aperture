// PsyopsWarfareCourse.swift
// SunFlow: Reignited — Aperture
// "Combating Psychological Warfare" — Detect. Defend. Reclaim.

import SwiftUI

// MARK: - Models

struct PsyopsLesson: Identifiable {
    let id: String
    let number: Int
    let title: String
    let icon: String
    let tagline: String
    let module: PsyopsModule
    let readTime: Int
    let body: String
    let hasInteractive: Bool
    let drillType: PsyopsDrillType?
}

enum PsyopsModule: String, CaseIterable {
    case understanding = "Understanding"
    case resilience    = "Resilience"
    case combat        = "Combat"
    case peace         = "Peace of Mind"
    case advanced      = "Advanced"

    var color: Color {
        switch self {
        case .understanding: return Color(hex: "#E74C3C")
        case .resilience:    return Color(hex: "#27AE60")
        case .combat:        return Color(hex: "#F39C12")
        case .peace:         return Color(hex: "#3498DB")
        case .advanced:      return Color(hex: "#9B59B6")
        }
    }
    var icon: String {
        switch self {
        case .understanding: return "eye.fill"
        case .resilience:    return "shield.fill"
        case .combat:        return "bolt.shield.fill"
        case .peace:         return "leaf.fill"
        case .advanced:      return "brain.head.profile"
        }
    }
    var emoji: String {
        switch self {
        case .understanding: return "🎯"
        case .resilience:    return "🛡️"
        case .combat:        return "⚡"
        case .peace:         return "🌿"
        case .advanced:      return "🧠"
        }
    }
}

enum PsyopsDrillType {
    case threatScanner      // Rate a headline for manipulation level
    case biasDetector       // Identify which bias is being exploited
    case breathingExercise  // Guided breathing
    case peaceAudit         // Stressor checklist
    case scenarioSim        // Identify the psyop tactic
}

struct PsyopsProgress: Codable {
    var completedLessons: Set<String> = []
    var drillsCompleted: Int = 0
    var resilience: Int = 0   // 0-100

    mutating func complete(_ id: String) {
        completedLessons.insert(id)
        resilience = min(100, resilience + 8)
    }
    mutating func completeDrill() {
        drillsCompleted += 1
        resilience = min(100, resilience + 5)
    }
    func isComplete(_ id: String) -> Bool { completedLessons.contains(id) }

    func save() { try? UserDefaults.standard.set(JSONEncoder().encode(self), forKey: "psyops_progress") }
    static func load() -> PsyopsProgress {
        guard let data = UserDefaults.standard.data(forKey: "psyops_progress"),
              let p = try? JSONDecoder().decode(PsyopsProgress.self, from: data) else { return PsyopsProgress() }
        return p
    }
}

// MARK: - Lesson Data

let psyopsLessons: [PsyopsLesson] = [

    PsyopsLesson(
        id: "pw_01", number: 1,
        title: "What Is Psychological Warfare?",
        icon: "waveform.path.ecg",
        tagline: "It's not just military. It's in your feed, your workplace, your relationship.",
        module: .understanding, readTime: 7,
        body: """
**Psychological warfare** is any deliberate action designed to affect your perceptions, emotions, and decisions without your awareness or consent.

It's not always bombs and propaganda leaflets. Most of the psyops targeting you right now are operating through:

— Your social media feed (algorithmic amplification of outrage)
— Your workplace (rumors, gaslighting, strategic exclusion)
— Your news cycle (fear loops, manufactured urgency)
— Your closest relationships (love bombing, guilt engineering)

**The Three Categories**

**Military/Political:** Propaganda during WWII. Fake news in elections. Manufactured consent for wars. These are the obvious ones — obvious precisely because they've been retired from active use. The current version is more elegant.

**Corporate/Interpersonal:** A partner who subtly undermines your confidence over months until you can't trust your own judgment. A manager who uses rumor to isolate high performers. These are often invisible because they look like "just how people are."

**Digital/Societal:** Cambridge Analytica used your Facebook data to map your psychological vulnerabilities and target you with specifically crafted content designed to move you. The 2016 operation reached 87 million people. They knew which emotional trigger — fear, anger, tribalism — would work on each individual.

**The Core Mechanism**

All psychological warfare, regardless of scale, exploits the same biological hardware:

Your amygdala (fear center) activates faster than your prefrontal cortex (rational thinking). By the time you're consciously evaluating information, your emotional response has already been triggered and is already shaping what you conclude.

This isn't a design flaw. It kept your ancestors alive when a rustle in the grass required instant threat assessment. But in a designed information environment, it makes you predictable.

**The First Question**

Before any other defense: learn to ask *"who benefits from me believing this?"* Not cynically. Analytically. Every piece of emotionally charged information is moving you toward a specific behavior. Identifying who profits from that behavior is your first act of genuine sovereignty.

**Reflection**
> Identify one information source in your daily life — news, social media, workplace communication — that consistently leaves you feeling fearful, angry, or helpless. Write down three questions: Who created this? Who benefits from my reaction? What do they want me to do?
""", hasInteractive: true, drillType: .threatScanner
    ),

    PsyopsLesson(
        id: "pw_02", number: 2,
        title: "Your Brain Is the Target",
        icon: "brain.fill",
        tagline: "The cognitive biases being weaponized against you right now.",
        module: .understanding, readTime: 8,
        body: """
**You have cognitive biases.** So does every human. They are evolutionary shortcuts — efficient, automatic, usually right. They also make you predictable.

Here are the ones most actively weaponized:

**Confirmation Bias**
You prefer information that confirms what you already believe. Operators know this. They don't try to change your mind — they amplify what you already think in increasingly extreme directions until you've drifted far from where you started without ever feeling like you moved.

This is how echo chambers work. Not through brainwashing. Through selection and amplification of your existing preferences.

**Availability Heuristic**
You estimate how likely or important something is based on how easily you can think of examples. If you see plane crash coverage for a week, you feel flying is more dangerous than driving — even though statistically it's far safer.

The news cycle is an availability machine. It doesn't lie about what happened. It selects what is repeated. Repetition creates perceived frequency. Perceived frequency creates perceived danger.

**Amygdala Hijack**
When threat is perceived — real or manufactured — the amygdala fires and sends the prefrontal cortex partially offline. Your capacity for nuance, long-term thinking, and evaluation of evidence all reduce. You become reactive.

Manufactured outrage works because an outraged person cannot think clearly. A population in sustained manufactured outrage is a population that cannot evaluate the information being used to outrage them.

**Groupthink and Social Proof**
Humans are social animals with biological aversion to exclusion from the group. If everyone around you believes something, disagreeing feels like a social risk. This is exploited through astroturfing — creating the appearance of widespread consensus on manufactured positions.

**The Neurological Bypass**

The most sophisticated modern psyops don't try to convince you through argumentation. They bypass the reasoning mind entirely by:

→ Triggering emotion first (before thinking begins)
→ Providing a pre-packaged conclusion attached to that emotion
→ Establishing social proof (everyone agrees)
→ Creating urgency (no time to verify)

By the time the reasoning mind comes online, the emotional conclusion has already been registered as "my own opinion."

**Your Defense Starts Here**

Pause between stimulus and response. That gap — even two seconds of conscious recognition that you're having an emotional reaction before drawing conclusions — is where your sovereignty lives.

**Reflection**
> Think of a belief you hold strongly. Can you trace back to when and how you formed it? Was there a moment of emotional charge attached to receiving that information? That emotional charge is the fingerprint of designed content.
""", hasInteractive: true, drillType: .biasDetector
    ),

    PsyopsLesson(
        id: "pw_03", number: 3,
        title: "Historical Operations You Need to Know",
        icon: "clock.arrow.circlepath",
        tagline: "COINTELPRO. Mockingbird. MKUltra. Declassified — and still running.",
        module: .understanding, readTime: 9,
        body: """
**The reason to study historical operations isn't nostalgia. It's pattern recognition.**

These programs were declassified because they ended — officially. The patterns they pioneered did not.

**COINTELPRO (FBI, 1956-1971)**

The FBI's Counter Intelligence Program targeted civil rights organizations, antiwar groups, feminist organizations, and anyone deemed politically threatening. Methods included:

— Sending anonymous letters to cause conflict within organizations
— Planting informants who would advocate illegal activities to justify crackdowns
— Creating fake publications to discredit leaders
— Forging documents to destroy relationships between groups
— Alerting employers to activists' beliefs to cause job loss

MLK Jr. received an anonymous letter (written by FBI agents) suggesting he commit suicide. The letter explicitly told him the bureau knew his "activities" and offered to give him 34 days to "do the right thing."

The goal was never to prosecute. It was to *demoralize, divide, and destroy* through psychological means.

**Operation Mockingbird (CIA, 1950s-1970s)**

The CIA cultivated relationships with major news organizations, placing agency-approved stories and controlling which information reached the public. Journalists worked directly with the CIA. Editors knew which stories to kill.

Senator Frank Church's 1975 investigation revealed the scope: over 400 journalists had worked directly with the CIA. Major publications were penetrated.

The Church Committee ended the program. The revolving door between intelligence agencies and media organizations did not end.

**MKUltra (CIA, 1953-1973)**

The CIA ran extensive experiments on unwitting American citizens — using LSD, hypnosis, isolation, and other techniques to explore whether consciousness could be controlled. Many subjects suffered permanent psychological damage.

The program was ordered destroyed. Boxes of documents survived by accident. What we know represents the portion they didn't successfully erase.

**The Takeaway**

These operations shared a common approach:
→ Deny they exist while operating
→ Acknowledge them only after their official end
→ Frame them as aberrations, not precedents

The aberration framing is the final operation. The tactics were proven effective. Effective tactics don't retire — they evolve.

**Post-2013: The Digital Upgrade**

Edward Snowden's 2013 revelations confirmed the NSA's PRISM program was collecting bulk communications data from millions of Americans without warrant. GCHQ (UK) ran "JTRIG" — a unit using social media to manipulate public opinion, discredit targets, and plant disinformation. Both programs were active for years before any public knowledge.

**Pentagon Social Media Operations (2022)**

Stanford Internet Observatory and the Washington Post documented the U.S. military running networks of fake personas across Twitter, Facebook, and Telegram from 2017–2022 — to influence opinion in the Middle East and Central Asia. The accounts were building toward 2022 before being suspended.

The Pentagon officially acknowledged the operations. No one was prosecuted.

**The Twitter Files (2022-2023)**

Journalist Matt Taibbi and others published internal Twitter communications showing active government agency requests — from FBI, DHS, CIA — to suppress specific accounts and content. Hundreds of accounts flagged for removal. The government didn't lie about what they wanted. Twitter complied.

Whether you agree with the content being suppressed is separate from the mechanism: government agencies with no legal authority making content moderation requests to private platforms, with high compliance rates.

**Frances Haugen & Meta (2021)**

Former Facebook data scientist Frances Haugen testified before Congress with internal research proving Facebook's own studies showed Instagram caused measurable mental health harm in teenage girls — and the company chose engagement metrics over user safety. The algorithm was deliberately amplifying divisive content because it generated more engagement.

This wasn't a third-party accusation. This was Meta's own internal research, suppressed internally.

**Modern Parallels**

The COINTELPRO playbook operates today on social media: fake accounts creating conflict within activist communities, manufactured screenshots spreading division, coordinated harassment campaigns targeting individuals.

The difference is scale. Automated. Cheaper. Deniable. And sometimes — documented.

**Reflection**
> Which of these operations surprises you most? Which one do you think has the most active modern equivalent? Sit with the discomfort of that question rather than dismissing it.
""", hasInteractive: false, drillType: nil
    ),

    PsyopsLesson(
        id: "pw_04", number: 4,
        title: "Building Your Mental Fortress",
        icon: "shield.fill",
        tagline: "Resilience is infrastructure. Viktor Frankl built his in a concentration camp.",
        module: .resilience, readTime: 8,
        body: """
**Viktor Frankl survived four Nazi concentration camps.** Not just survived — maintained his psychological integrity intact enough to emerge and immediately begin helping others.

His insight: *"Everything can be taken from a man but one thing — the last of the human freedoms — to choose one's attitude in any given set of circumstances."*

This is not positive thinking. This is the hardest possible form of psychological sovereignty: maintaining your capacity to respond rather than simply react, even when all external control has been removed.

You don't need a concentration camp to develop this. But you do need to understand what you're building.

**The Four Pillars of Resilience**

**Emotional Regulation**
The capacity to feel an emotion without being controlled by it. Not suppression — suppressed emotions don't disappear, they redirect. Not bypass — pretending emotions don't exist creates the shadow material that eventually overwhelms you.

Emotional regulation is the practice of feeling fully while choosing your response. This is a trainable skill.

**Cognitive Flexibility**
The ability to hold multiple interpretations of events simultaneously and update your view based on new evidence. Rigid thinking is psyops' best friend — a mind that cannot reframe is a mind that cannot recover from manipulated narratives.

Practice: When you encounter information that disturbs or angers you, before responding — generate two alternative interpretations of the same facts. Not to dismiss your original response. To keep the interpretive space open.

**Social Support**
Humans with strong social bonds are significantly more resistant to psychological manipulation. Isolation is psyops infrastructure. The tactics that precede the operation almost always include social isolation of the target — creating the conditions where the target's only source of information is the operator.

This is why community building is a defense, not a luxury.

**Purpose-Driven Living**

Frankl's research consistently showed that individuals with a clear sense of meaning — something they were living *for* — demonstrated dramatically higher psychological resilience than those without.

The reason: a person with clear purpose can contextualize suffering. It doesn't break the narrative of their life — it becomes part of it.

**Building Deliberately**

Resilience isn't accumulated through comfort. It's built through exposure — meeting difficulty and discovering you survived it, integrating that discovery into your self-concept.

Small consistent challenges build the capacity to meet large sudden ones.

**Reflection**
> What is the thing you're currently living for — the purpose that makes difficulty feel meaningful rather than simply painful? If you can't name it clearly, that's information. Naming it is one of the most powerful psyops defenses available.
""", hasInteractive: true, drillType: .breathingExercise
    ),

    PsyopsLesson(
        id: "pw_05", number: 5,
        title: "Detection Skills: Spotting the Operation",
        icon: "magnifyingglass.circle.fill",
        tagline: "The five signatures of designed content. Once seen, unseen-able.",
        module: .combat, readTime: 7,
        body: """
**Designed information has signatures.** Natural information — information that simply describes events without manipulation intent — rarely has all of them at once. When you see multiple signatures together, you're reading engineered content.

**Signature 1: Emotional Charge Before Facts**

The content triggers strong emotion (fear, outrage, disgust, tribal pride) before presenting verifiable claims. Natural reporting leads with events. Designed content leads with how you should feel about events.

Test: Cover the emotional framing. Do the facts still hold up? Do they even remain clear?

**Signature 2: Urgency and Time Pressure**

"Share before they delete this." "Act now." "You need to see this immediately." Urgency serves one function: preventing the cognitive pause that would allow evaluation.

Genuine information doesn't expire in the time it takes you to verify it.

**Signature 3: Perfect Villain / Perfect Victim**

Real events are messy. Real people are complex. When a narrative presents a completely evil villain with zero sympathetic qualities and a completely innocent victim with zero complexity, the narrative has been engineered.

This doesn't mean the event didn't happen. It means someone constructed a specific moral frame around it.

**Signature 4: Social Proof Pressure**

"Everyone knows..." "How can you not see..." "You'd have to be stupid/evil/brainwashed not to agree..." These framings activate the fear of exclusion without providing evidence. Genuine arguments don't need to make you afraid of disagreeing.

**Signature 5: Clean Us/Them Boundary**

Real social issues have complicated stakeholders with overlapping interests. Any narrative that presents a clean binary — good group vs. evil group, with no complexity or overlap — has been simplified for manipulation purposes.

The simplification isn't error. It's the mechanism.

**Your Detection Protocol**

When you encounter emotionally charged information:

1. Name the emotion being triggered. Make it explicit.
2. Separate the factual claims from the emotional framing.
3. Identify who benefits from your believing the conclusion.
4. Check one source in direct opposition to the narrative.
5. Wait 24 hours before sharing or acting.

The 24-hour rule alone eliminates most psyops-susceptibility, because manufactured urgency almost never survives a day of patient evaluation.

**Reflection**
> Apply this protocol right now to the last piece of content that made you feel outraged or afraid. Go through all five steps. What do you find?
""", hasInteractive: true, drillType: .threatScanner
    ),

    PsyopsLesson(
        id: "pw_06", number: 6,
        title: "Defensive Tactics: Information Hygiene",
        icon: "lock.shield.fill",
        tagline: "Gray rock. Curated feeds. Counter-narratives. Your daily defense stack.",
        module: .combat, readTime: 7,
        body: """
**Information hygiene is not censorship.** It's the deliberate curation of your cognitive environment the same way you curate your physical environment.

You don't leave toxic waste in your living space. Apply the same standard to your information diet.

**The Gray Rock Technique**

Originally designed for dealing with narcissistic personalities — be as emotionally uninteresting as possible. Manipulators require emotional reaction. Their techniques have no leverage on someone who doesn't react.

In information terms: when encountering blatant provocation — content whose entire design is to trigger outrage — the most powerful response is a shrug. Not because you don't care about the underlying issue. Because engaging the provocation on its own terms validates and amplifies the operation.

React to the substance. Refuse the emotional frame.

**Feed Curation: The 48-Hour Audit**

For two days, track every information source you consume. For each source, note:
→ Does it leave me better informed? Or only more agitated?
→ Can I verify its claims independently?
→ Is it consistent in its standards? (Does it apply the same scrutiny to all sides of an issue?)

Remove anything that consistently fails these tests. Not because the content is always wrong — because a source that reliably produces agitation without insight is functioning as emotional manipulation, regardless of intent.

**Counter-Narrative: Building Your Own Story**

Psyops create narratives. The defense is not absence of narrative — it's your own intentional story about your life, your values, and your interpretation of events.

Affirmations work not because they're magical but because they're a deliberate interruption of the automated narrative loop. When you actively construct and repeat your own framing — *"I determine my responses. My mind is my own. I choose what I amplify"* — you're doing the same thing manipulators do, but in service of your own clarity.

**Source Diversification**

Your information diet should include sources that disagree with each other. Not to create confusion — to prevent any single operator from becoming your primary interpreter of reality.

Practical protocol: For any major news story, read three sources — one that confirms your priors, one that challenges them, and one that is as close to primary source material as possible.

**Digital Security**

Encrypted communications protect your private information from becoming targeting data. Browser privacy tools reduce the profile used to serve you algorithmic content. VPNs mask location data.

This isn't paranoia. It's the same protective hygiene you apply to financial information.

**Reflection**
> Today: Audit your three most-used information sources against the four questions above. Remove or reduce one that fails the test. Just one — the practice matters more than the scale.
""", hasInteractive: false, drillType: nil
    ),

    PsyopsLesson(
        id: "pw_07", number: 7,
        title: "The Scenario Simulator",
        icon: "gamecontroller.fill",
        tagline: "Recognize the operation in the wild. Practice changes how your brain processes threat.",
        module: .combat, readTime: 6,
        body: """
**Pattern recognition is a trainable skill.** The more you consciously identify manipulation structures, the more automatically your brain flags them in real time.

This lesson is primarily the interactive drill — the reading is preparation.

**How Scenario Training Works**

Your brain learns pattern detection through repetition. Each time you successfully identify a manipulation tactic in a controlled scenario, you reinforce the neural pathway that flags the same pattern in real environments.

This is the same reason military and emergency responders run simulations. The cognitive load of recognition in the moment is reduced because the pattern is already pre-loaded.

**Five Common Psyops Structures**

**1. Fear-Then-Solution**
Create or amplify a fear, then present a specific solution that requires surrendering something (privacy, money, autonomy). The fear and the solution come from the same operator.

**2. False Dilemma**
Present two options as the only options, when many alternatives exist. "You're either with us or against us." "If you're not outraged, you're not paying attention."

**3. Manufactured Consensus**
Create the impression that a view is widely held when it isn't. Bots. Astroturf campaigns. Paid amplification. The impression of consensus is more powerful than consensus itself.

**4. Trojan Charity**
Package manipulation inside genuine concern. "We're only doing this to protect you." "This is for your safety." Genuine protective motivations exist — but so does the use of protective language to conceal control.

**5. Overton Window Shifting**
Gradually normalize extreme positions by introducing them incrementally, each step seeming small relative to the last. By the time the extreme position is reached, it no longer reads as extreme.

**The Drill Awaits**

The interactive scenario simulator gives you real examples to classify. Take your time. The goal isn't speed — it's recognition depth.

**Reflection**
> After completing the simulator, note which tactic was hardest to identify. That's your current blind spot — the one most likely to work on you in a real environment. Pay particular attention to it going forward.
""", hasInteractive: true, drillType: .scenarioSim
    ),

    PsyopsLesson(
        id: "pw_08", number: 8,
        title: "Stoicism & Buddhism: Ancient Psyops Armor",
        icon: "leaf.fill",
        tagline: "Marcus Aurelius was managing state propaganda. His tools still work.",
        module: .peace, readTime: 8,
        body: """
**Marcus Aurelius was the most powerful person in the world** — and spent his evenings writing private notes to himself about not being manipulated by people who wanted things from him.

The Meditations were not written for publication. They were a personal practice — an emperor reminding himself, daily, of what actually mattered versus what was performance, approval-seeking, and fear-driven reaction.

He understood that power is the most intense psyops environment possible. Everyone around him had interest in shaping his perceptions.

**The Stoic Framework**

The Stoics drew a hard line between two categories: what is *up to you* (your interpretations, responses, values, choices) and what is *not up to you* (external events, others' opinions, outcomes you don't control).

Psychological warfare targets the second category to manipulate the first. It works only to the extent you have not clearly separated them.

When you practice the Stoic distinction — deliberately asking "is this in my control?" — you locate the boundary where your sovereignty actually lives. Everything outside that boundary becomes information rather than threat.

**Marcus on Manipulation**

*"You have power over your mind, not outside events. Realize this, and you will find strength."*

*"When you wake up in the morning, tell yourself: The people I deal with today will be meddling, ungrateful, arrogant, dishonest, jealous and surly... But I have seen the beauty of good, and the ugliness of evil, and have recognized that the wrongdoer has a nature related to my own."*

He expected manipulation. He prepared for it. He responded rather than reacted.

**Buddhist Non-Attachment**

Buddhism identifies *tanha* — craving and aversion — as the root of suffering. Psychological warfare exploits both: it creates craving for specific outcomes and aversion to specific threats.

Non-attachment doesn't mean not caring. It means holding preferences without being controlled by them. A manipulator who cannot move you through fear or desire has lost their primary levers.

The Buddhist practice of *equanimity* — maintaining stability of mind amid changing conditions — is precisely the state that makes psychological manipulation ineffective.

**Practical Synthesis**

Stoicism gives you the *framework* (control/not-control). Buddhism gives you the *practice* (non-attachment, present-moment awareness). Together they produce the same result: a person who responds to designed information rather than reacting to it.

**The Daily Practice**

Morning: Identify one thing you're dreading. Ask: Is the dread about something in my control? If not, release it. If yes, make one small concrete action.

Evening: Identify one moment you reacted instead of responded. What triggered it? What would a measured response have looked like?

**Reflection**
> Write your personal "peace rules" — 3-5 core values or principles that remain constant regardless of external pressure. These are your reference points when designed information tries to move you.
""", hasInteractive: true, drillType: .peaceAudit
    ),

    PsyopsLesson(
        id: "pw_09", number: 9,
        title: "Digital Psyops & AI-Generated Reality",
        icon: "cpu.fill",
        tagline: "Deepfakes. Astroturfing. Algorithmic radicalization. The current frontier.",
        module: .advanced, readTime: 8,
        body: """
**The next phase of psychological operations is already active.** It is more sophisticated, cheaper, and more deniable than anything that came before.

**The COVID Infodemic (2020-2022)**

The WHO coined the term "infodemic" in February 2020 — a flood of information, both true and false, making it difficult to find trustworthy guidance. What emerged was one of the most studied real-time information warfare events in history:

Government messaging changed weekly. Lab-leak hypothesis — initially censored on multiple platforms at U.S. government request — was later acknowledged as credible by the FBI, CIA, and Energy Department. Lockdown protesters were labeled extremists. Lockdown skeptics were de-platformed.

The lesson wasn't who was right. It was that the same platforms suppressing "misinformation" were simultaneously suppressing legitimate scientific debate — based on government requests documented in the Missouri v. Biden case (2023), where a federal judge found "substantial evidence" that the government had coerced platforms into censoring speech.

**AI-Generated Content**

Deepfake technology can now generate realistic video of any person saying anything. Synthesis quality has crossed the threshold where casual observation cannot reliably distinguish generated from recorded.

The impact on psyops: events that never occurred can now be "documented." Statements that were never made can be "quoted." The evidentiary value of video — which was already compromised — is now approaching zero without technical verification.

Detection approach: Origin verification. Who first published this? Through what channel? Does the technical metadata match the claimed context? Reverse image/video search. Cross-platform verification. Primary source confirmation.

**TikTok Algorithm Studies (2023)**

Multiple researchers documented TikTok's algorithm suppressing content about Uyghur detention, Hong Kong protests, and Tiananmen Square for users inside and outside China. ByteDance (TikTok's Chinese parent) denied political suppression. Internal documents later leaked confirming "protected topics" that would receive reduced distribution.

Meanwhile, TikTok served its fastest-growing U.S. demographics content specifically calibrated to their emotional state — a feed uniquely designed for each user's psychological profile.

**Algorithmic Radicalization**

Research on YouTube's recommendation algorithm documented a consistent pattern: the algorithm reliably pushed users toward increasingly extreme content because extreme content generates more engagement, and engagement drives revenue.

The system wasn't designed to radicalize. It was designed to maximize watch time. Radicalization was the emergent result of optimization for engagement.

The algorithm doesn't care what it radicalizes you toward. It cares that you keep watching.

**Astroturfing at Scale**

Prior to social media, creating the impression of grassroots support required physical bodies. Now: one operator can maintain thousands of synthetic accounts generating coordinated content that appears organic.

Detection: Look for account patterns — age, follower ratios, posting volume, cross-posting similarity. Genuine grassroots movements have diversity. Coordinated synthetic movements have telltale uniformity.

**The Metaverse Frontier**

Immersive environments create new vulnerabilities: emotional engagement is higher in 3D environments, social norms are undefined, identity is partially externalized. The psyops playbook applied to immersive environments with higher emotional bandwidth hasn't been written yet. We're watching it being written.

**Your Digital Literacy Stack**

→ Reverse image search before sharing visual content
→ Origin verification before trusting any audio/video
→ Account analysis before trusting amplifiers
→ Algorithm awareness: know that your feed is not neutral curation
→ Primary source priority: bypass all intermediaries when possible

**The Fundamental Shift**

The question used to be: "Is this information true?" The new question is: "How was this information created, and what is it designed to make me do?"

Both questions matter. The second one is increasingly urgent.

**Reflection**
> Identify three pieces of content you've shared in the past month. Apply the origin verification and intent analysis framework to each. What do you find?
""", hasInteractive: false, drillType: nil
    ),

    PsyopsLesson(
        id: "pw_10", number: 10,
        title: "Unity Is the Ultimate Counter",
        icon: "person.3.fill",
        tagline: "Division is the product. Community is the defense. This is the endgame.",
        module: .advanced, readTime: 7,
        body: """
**Every sophisticated psyops operation has the same ultimate goal: prevent coordination.**

Coordinated people are difficult to control. Divided people are easy. Every tactic we've studied — manufactured outrage, false dilemmas, tribalism amplification, targeted harassment — serves this single strategic objective.

Which means the most powerful counter is its exact opposite.

**Why Division Is the Product**

A divided population:
— Cannot organize effectively around shared interests
— Spends energy fighting each other rather than examining the systems affecting them both
— Creates demand for strong authority to "restore order" (to the division the authority manufactured)
— Is more easily manipulated at the individual level because social support has been degraded

This is not conspiracy. It is documented political strategy with a 2000-year history. Philip II of Macedon (Alexander the Great's father) formalized *divide et impera* — divide and rule — as explicit doctrine.

**Building Unity Without Naivety**

Unity doesn't mean false consensus or suppression of genuine disagreement. Real communities have conflict. Healthy conflict, based on actual values and interests, is different from manufactured conflict designed to prevent collaboration.

The distinction: genuine disagreement produces synthesis over time. Manufactured conflict escalates.

Signs you're in manufactured conflict: the issue keeps intensifying without resolution, the same emotional charges recur, proposed solutions never address root causes, the most extreme voices on both sides amplify each other.

**Your Community as Defense Infrastructure**

A strong, trusted network of people who know each other well is the most resilient form of psyops defense:

— Shared reality checking (you can verify each other's perceptions)
— Mutual information sourcing (you bring diverse sources to common evaluation)
— Emotional support (you process reactions before they harden into beliefs)
— Collective discernment (you spot what individuals miss)

**How to Build It**

Start small: one or two people you trust to think clearly and call you out when you're being reactive. Practice reality-checking on low-stakes issues. Build the process before you need it for high-stakes ones.

Expand deliberately: add people who disagree with you on some things. Homogeneous groups — where everyone already agrees — don't sharpen discernment. They confirm bias at a group level.

**The Final Point**

You have now completed a map of how psychological operations work, how they exploit your neurology, and how to build defenses. The knowledge is real. The application is the work.

The most important thing you can do with this knowledge is share it — carefully, accurately, without its own manipulative frame. Teaching pattern recognition to one person multiplies the defense.

Unity is not naive. It is the most strategically sound response to a strategy that requires division to succeed.

**Final Reflection**
> Name three people in your life you would trust to form a reality-checking network. What would it take to make that explicit? What's one conversation that could begin that process?
""", hasInteractive: false, drillType: nil
    )
]

// MARK: - Hub View

struct PsyopsWarfareCourseView: View {
    @Environment(\.dismiss) var dismiss
    @State private var progress = PsyopsProgress.load()
    @State private var selectedLesson: PsyopsLesson?
    @State private var showLesson = false
    @State private var filterModule: PsyopsModule? = nil
    @State private var showResilienceDetail = false
    @State private var pulseAnim = false

    private let accent = Color(hex: "#E74C3C")
    private let bg = Color(red: 0.04, green: 0.02, blue: 0.02)

    var body: some View {
        NavigationStack {
            ZStack {
                bg.ignoresSafeArea()
                scanlineEffect

                ScrollView(showsIndicators: false) {
                    VStack(spacing: 20) {
                        heroSection
                        resilienceMeter
                        moduleFilter
                        lessonCards
                        Spacer(minLength: 60)
                    }
                    .padding(.horizontal, 18)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button { dismiss() } label: {
                        Image(systemName: "chevron.left").foregroundColor(.white)
                    }
                }
                ToolbarItem(placement: .principal) {
                    Text("⚡ Psyops Defense").font(.system(size: 16, weight: .bold)).foregroundColor(.white)
                }
            }
            .fullScreenCover(isPresented: $showLesson) {
                if let lesson = selectedLesson {
                    PsyopsLessonView(lesson: lesson, progress: $progress)
                }
            }
        }
        .onAppear { withAnimation(.easeInOut(duration: 2).repeatForever(autoreverses: true)) { pulseAnim = true } }
    }

    // Scanline CRT effect for "surveillance" feel
    private var scanlineEffect: some View {
        Canvas { ctx, size in
            var rng = SystemRandomNumberGenerator()
            for y in stride(from: 0.0, to: size.height, by: 4) {
                let opacity = Double.random(in: 0.008...0.025, using: &rng)
                ctx.fill(Path(CGRect(x: 0, y: y, width: size.width, height: 1)),
                         with: .color(Color.green.opacity(opacity)))
            }
        }
        .ignoresSafeArea()
        .allowsHitTesting(false)
    }

    private var heroSection: some View {
        VStack(spacing: 12) {
            Spacer().frame(height: 8)
            ZStack {
                // Pulsing radar
                ForEach(0..<3) { i in
                    Circle()
                        .stroke(accent.opacity(pulseAnim ? 0.05 : 0.15), lineWidth: 1)
                        .frame(width: CGFloat(80 + i * 40), height: CGFloat(80 + i * 40))
                        .scaleEffect(pulseAnim ? 1.2 : 1.0)
                        .animation(.easeInOut(duration: 2.5).delay(Double(i) * 0.4).repeatForever(autoreverses: true), value: pulseAnim)
                }
                Image(systemName: "eye.fill").font(.system(size: 36)).foregroundColor(accent)
            }
            .frame(height: 160)

            VStack(spacing: 6) {
                Text("PSYCHOLOGICAL WARFARE").font(.system(size: 9, weight: .black)).tracking(3).foregroundColor(accent.opacity(0.6))
                Text("Detect. Defend.\nReclaim Your Mind.").font(.system(size: 24, weight: .black)).foregroundColor(.white).multilineTextAlignment(.center)
                Text("10 lessons · Drills · Scenario Simulator · Resilience Meter")
                    .font(.system(size: 11)).foregroundColor(.white.opacity(0.35)).multilineTextAlignment(.center)
            }
        }
    }

    private var resilienceMeter: some View {
        let pct = Double(progress.resilience) / 100.0
        let label: String = {
            if progress.resilience < 20 { return "VULNERABLE" }
            if progress.resilience < 50 { return "DEVELOPING" }
            if progress.resilience < 80 { return "FORTIFIED" }
            return "SOVEREIGN"
        }()
        let meterColor: Color = {
            if progress.resilience < 20 { return .red }
            if progress.resilience < 50 { return .orange }
            if progress.resilience < 80 { return .yellow }
            return Color(hex: "#27AE60")
        }()

        return VStack(spacing: 10) {
            HStack {
                VStack(alignment: .leading, spacing: 3) {
                    Text("RESILIENCE LEVEL").font(.system(size: 9, weight: .black)).tracking(2).foregroundColor(.white.opacity(0.4))
                    Text(label).font(.system(size: 16, weight: .black)).foregroundColor(meterColor)
                }
                Spacer()
                VStack(alignment: .trailing, spacing: 3) {
                    Text("\(progress.resilience)").font(.system(size: 28, weight: .black)).foregroundColor(meterColor)
                    Text("\(progress.drillsCompleted) drills completed").font(.system(size: 10)).foregroundColor(.white.opacity(0.35))
                }
            }
            GeometryReader { geo in
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 4).fill(Color.white.opacity(0.05)).frame(height: 8)
                    RoundedRectangle(cornerRadius: 4)
                        .fill(LinearGradient(colors: [.red, .orange, .yellow, meterColor], startPoint: .leading, endPoint: .trailing))
                        .frame(width: geo.size.width * pct, height: 8)
                }
            }
            .frame(height: 8)
            Text("\(progress.completedLessons.count)/\(psyopsLessons.count) lessons complete · Drills and lessons both increase your resilience")
                .font(.system(size: 10)).foregroundColor(.white.opacity(0.3)).multilineTextAlignment(.center)
        }
        .padding(16)
        .background(RoundedRectangle(cornerRadius: 14)
            .fill(Color.white.opacity(0.04))
            .overlay(RoundedRectangle(cornerRadius: 14).stroke(meterColor.opacity(0.2), lineWidth: 1)))
    }

    private var moduleFilter: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 8) {
                PsyopsFilterChip(label: "All", emoji: "⚡", color: accent, isSelected: filterModule == nil) { filterModule = nil }
                ForEach(PsyopsModule.allCases, id: \.self) { mod in
                    PsyopsFilterChip(label: mod.rawValue, emoji: mod.emoji, color: mod.color, isSelected: filterModule == mod) {
                        filterModule = filterModule == mod ? nil : mod
                    }
                }
            }
            .padding(.horizontal, 2)
        }
    }

    private var lessonCards: some View {
        let filtered = filterModule == nil ? psyopsLessons : psyopsLessons.filter { $0.module == filterModule }
        return VStack(spacing: 10) {
            ForEach(filtered) { lesson in
                PsyopsLessonCard(lesson: lesson, isCompleted: progress.isComplete(lesson.id)) {
                    selectedLesson = lesson
                    showLesson = true
                }
            }
        }
    }
}

// MARK: - Filter Chip

struct PsyopsFilterChip: View {
    let label: String; let emoji: String; let color: Color
    let isSelected: Bool; let action: () -> Void
    var body: some View {
        Button(action: action) {
            HStack(spacing: 5) {
                Text(emoji).font(.system(size: 11))
                Text(label).font(.system(size: 11, weight: isSelected ? .bold : .medium))
            }
            .foregroundColor(isSelected ? .black : .white.opacity(0.5))
            .padding(.horizontal, 12).padding(.vertical, 7)
            .background(isSelected ? color : Color.white.opacity(0.06))
            .clipShape(Capsule())
        }
    }
}

// MARK: - Lesson Card

struct PsyopsLessonCard: View {
    let lesson: PsyopsLesson
    let isCompleted: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack(spacing: 14) {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(isCompleted ? lesson.module.color.opacity(0.25) : lesson.module.color.opacity(0.08))
                        .frame(width: 50, height: 50)
                    if isCompleted {
                        Image(systemName: "checkmark.circle.fill").font(.system(size: 22)).foregroundColor(lesson.module.color)
                    } else {
                        Image(systemName: lesson.icon).font(.system(size: 19)).foregroundColor(lesson.module.color)
                    }
                }
                VStack(alignment: .leading, spacing: 4) {
                    HStack(spacing: 6) {
                        Text(lesson.module.emoji).font(.system(size: 10))
                        Text(lesson.module.rawValue.uppercased()).font(.system(size: 9, weight: .black)).tracking(1.5).foregroundColor(lesson.module.color.opacity(0.8))
                        if lesson.hasInteractive {
                            Text("DRILL").font(.system(size: 8, weight: .black)).tracking(1)
                                .foregroundColor(.black)
                                .padding(.horizontal, 5).padding(.vertical, 2)
                                .background(lesson.module.color.opacity(0.9))
                                .clipShape(Capsule())
                        }
                    }
                    Text("L\(lesson.number) · \(lesson.title)").font(.system(size: 13, weight: .bold)).foregroundColor(.white).lineLimit(2)
                    Text(lesson.tagline).font(.system(size: 11)).foregroundColor(.white.opacity(0.4)).lineLimit(1)
                    Text("\(lesson.readTime) min read").font(.system(size: 10)).foregroundColor(lesson.module.color.opacity(0.6))
                }
                Spacer()
                Image(systemName: "chevron.right").font(.system(size: 12)).foregroundColor(.white.opacity(0.2))
            }
            .padding(14)
            .background(RoundedRectangle(cornerRadius: 16)
                .fill(isCompleted ? lesson.module.color.opacity(0.06) : Color.white.opacity(0.03))
                .overlay(RoundedRectangle(cornerRadius: 16).stroke(
                    isCompleted ? lesson.module.color.opacity(0.3) : Color.white.opacity(0.06), lineWidth: 1)))
        }
    }
}

// MARK: - Lesson Reader

struct PsyopsLessonView: View {
    let lesson: PsyopsLesson
    @Binding var progress: PsyopsProgress
    @Environment(\.dismiss) var dismiss
    @State private var drillDone = false

    var body: some View {
        NavigationStack {
            ZStack {
                Color(red: 0.04, green: 0.02, blue: 0.02).ignoresSafeArea()
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 22) {
                        lessonHeader
                        Divider().background(lesson.module.color.opacity(0.3))
                        PsyopsBodyRenderer(text: lesson.body, accent: lesson.module.color)
                        if lesson.hasInteractive, let dt = lesson.drillType { drillSection(dt) }
                        completeButton
                        Spacer(minLength: 60)
                    }
                    .padding(.horizontal, 20).padding(.top, 16)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button { dismiss() } label: {
                        Image(systemName: "xmark.circle.fill").foregroundStyle(.white.opacity(0.4))
                    }
                }
                ToolbarItem(placement: .principal) {
                    Text("⚡ Psyops Defense").font(.system(size: 13, weight: .semibold)).foregroundColor(.white.opacity(0.5))
                }
            }
        }
    }

    private var lessonHeader: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack(spacing: 8) {
                Text(lesson.module.emoji)
                Text(lesson.module.rawValue.uppercased())
                    .font(.system(size: 10, weight: .black)).tracking(2).foregroundColor(lesson.module.color)
                Spacer()
                Text("L\(lesson.number) of \(psyopsLessons.count)")
                    .font(.system(size: 10)).foregroundColor(.white.opacity(0.3))
            }
            Text(lesson.title).font(.system(size: 22, weight: .black)).foregroundColor(.white)
            Text(lesson.tagline).font(.system(size: 13)).foregroundColor(.white.opacity(0.5)).italic()
            HStack(spacing: 5) {
                Image(systemName: "clock").font(.system(size: 10))
                Text("\(lesson.readTime) min read").font(.system(size: 11))
                if lesson.hasInteractive {
                    Text("·").foregroundColor(.white.opacity(0.3))
                    Image(systemName: "hand.tap.fill").font(.system(size: 10)).foregroundColor(lesson.module.color)
                    Text("Interactive drill").font(.system(size: 11)).foregroundColor(lesson.module.color)
                }
            }
            .foregroundColor(.white.opacity(0.4))
        }
    }

    private func drillSection(_ drillType: PsyopsDrillType) -> some View {
        VStack(spacing: 0) {
            Divider().background(lesson.module.color.opacity(0.2))
            PsyopsDrillBlock(drillType: drillType, accent: lesson.module.color, isDone: drillDone) {
                drillDone = true
                progress.completeDrill()
                progress.save()
            }
        }
    }

    private var completeButton: some View {
        let done = progress.isComplete(lesson.id)
        return Button {
            progress.complete(lesson.id)
            progress.save()
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) { dismiss() }
        } label: {
            HStack {
                Image(systemName: done ? "checkmark.shield.fill" : "checkmark.shield")
                Text(done ? "Mission Complete" : "Mark Complete & Continue")
                    .font(.system(size: 14, weight: .bold))
            }
            .foregroundColor(done ? lesson.module.color : .black)
            .frame(maxWidth: .infinity).padding(.vertical, 14)
            .background(done
                ? RoundedRectangle(cornerRadius: 14).fill(lesson.module.color.opacity(0.15))
                : RoundedRectangle(cornerRadius: 14).fill(lesson.module.color))
        }
        .padding(.top, 8)
    }
}

// MARK: - Drill Block

struct PsyopsDrillBlock: View {
    let drillType: PsyopsDrillType
    let accent: Color
    let isDone: Bool
    let onComplete: () -> Void

    var body: some View {
        switch drillType {
        case .threatScanner:
            ThreatScannerDrill(accent: accent, isDone: isDone, onComplete: onComplete)
        case .biasDetector:
            BiasDetectorDrill(accent: accent, isDone: isDone, onComplete: onComplete)
        case .breathingExercise:
            BreathingDrill(accent: accent, isDone: isDone, onComplete: onComplete)
        case .peaceAudit:
            PeaceAuditDrill(accent: accent, isDone: isDone, onComplete: onComplete)
        case .scenarioSim:
            ScenarioSimDrill(accent: accent, isDone: isDone, onComplete: onComplete)
        }
    }
}

// MARK: - Threat Scanner Drill

struct ThreatScannerDrill: View {
    let accent: Color; let isDone: Bool; let onComplete: () -> Void
    @State private var sliderValue: Double = 0.5
    @State private var submitted = false
    @State private var selectedHeadline = 0

    // Real-world headlines: mix of manipulative and clean
    let headlines = [
        "BREAKING: Scientists Alarmed By Mysterious New Outbreak",
        "Local Food Bank Raises Record $2M in Weekend Drive",
        "URGENT: What Big Pharma Doesn't Want You to Know",
        "Study: 30 Minutes of Walking Reduces Depression Risk 26%",
        "They're Hiding This From You — Share Before Deleted",
        "City Council Approves $4M Road Repair Budget for 2025",
    ]
    let answers: [Double] = [0.72, 0.05, 0.90, 0.08, 0.98, 0.07]
    let explanations = [
        "\"BREAKING\" + \"Alarmed\" + vague \"scientists\" + \"mysterious\" = four manipulation signals. No named scientists, no specific threat, pure urgency architecture.",
        "Specific amount, specific timeframe, verifiable. No emotional manipulation signal. This is what clean reporting looks like.",
        "\"Big Pharma\" enemy framing + \"doesn't want you to know\" secrecy narrative = classic fear-then-reveal structure. No actual claim to verify.",
        "Specific percentage, verifiable study type, specific activity, specific benefit. Empirical claim — checkable and falsifiable.",
        "Direct threat frame (\"hiding\") + urgency (\"share before deleted\") + no actual content = pure psyops architecture. 98/100.",
        "Named body, specific dollar amount, specific year. Dry, verifiable, zero emotional manipulation. Clean civic reporting.",
    ]

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            drillHeader
            currentHeadline
            sliderSection
            if submitted { feedbackSection }
            actionButtons
        }
        .padding(16)
        .background(RoundedRectangle(cornerRadius: 14).fill(Color.white.opacity(0.04))
            .overlay(RoundedRectangle(cornerRadius: 14).stroke(accent.opacity(0.3), lineWidth: 1)))
    }

    private var drillHeader: some View {
        HStack {
            Image(systemName: "target").foregroundColor(accent)
            Text("DRILL: THREAT SCANNER").font(.system(size: 12, weight: .black)).tracking(2).foregroundColor(accent)
            Spacer()
            if isDone || submitted { Text("✓ +5 RESILIENCE").font(.system(size: 11, weight: .bold)).foregroundColor(.green) }
        }
    }

    private var currentHeadline: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text("Headline \(selectedHeadline + 1) of \(headlines.count)")
                    .font(.system(size: 10)).foregroundColor(.white.opacity(0.35))
                Spacer()
                Text("Rate the manipulation level:").font(.system(size: 12)).foregroundColor(.white.opacity(0.6))
            }
            Text(headlines[selectedHeadline])
                .font(.system(size: 15, weight: .bold)).foregroundColor(.white)
                .padding(12).frame(maxWidth: .infinity)
                .background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.06)))
        }
    }

    private var sliderSection: some View {
        VStack(spacing: 8) {
            HStack {
                Text("CLEAN").font(.system(size: 9, weight: .black)).tracking(1).foregroundColor(.green)
                Spacer()
                Text("\(Int(sliderValue * 100))").font(.system(size: 22, weight: .black))
                    .foregroundColor(sliderValue > 0.6 ? .red : sliderValue > 0.3 ? .orange : .green)
                Spacer()
                Text("PSYOP").font(.system(size: 9, weight: .black)).tracking(1).foregroundColor(.red)
            }
            Slider(value: $sliderValue, in: 0...1).accentColor(accent)
        }
    }

    private var feedbackSection: some View {
        let accurate = abs(sliderValue - answers[selectedHeadline]) < 0.25
        return VStack(alignment: .leading, spacing: 6) {
            Text(accurate ? "✓ Sharp read — you see the signals" : "Close — actual level: \(Int(answers[selectedHeadline] * 100))")
                .font(.system(size: 13, weight: .bold)).foregroundColor(accurate ? .green : .orange)
            Text(explanations[selectedHeadline]).font(.system(size: 12)).foregroundColor(.white.opacity(0.65)).lineSpacing(3)
        }
        .padding(12)
        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.04)))
    }

    private var actionButtons: some View {
        Group {
            if !submitted {
                Button {
                    submitted = true
                    if !isDone { onComplete() }
                } label: {
                    Text("SUBMIT ANALYSIS").font(.system(size: 13, weight: .black)).tracking(1)
                        .foregroundColor(.black).frame(maxWidth: .infinity).padding(.vertical, 12)
                        .background(accent).clipShape(RoundedRectangle(cornerRadius: 10))
                }
            } else if selectedHeadline < headlines.count - 1 {
                Button {
                    selectedHeadline += 1; sliderValue = 0.5; submitted = false
                } label: {
                    Text("NEXT HEADLINE →").font(.system(size: 13, weight: .bold))
                        .foregroundColor(accent).frame(maxWidth: .infinity).padding(.vertical, 12)
                        .background(accent.opacity(0.12)).clipShape(RoundedRectangle(cornerRadius: 10))
                }
            } else {
                Text("✓ All \(headlines.count) headlines analyzed. Your threat recognition is sharpening.")
                    .font(.system(size: 12, weight: .bold)).foregroundColor(.green)
            }
        }
    }
}

// MARK: - Bias Detector Drill

struct BiasDetectorDrill: View {
    let accent: Color; let isDone: Bool; let onComplete: () -> Void
    @State private var selectedAnswer: Int? = nil
    @State private var questionIndex = 0

    struct BiasQuestion {
        let scenario: String
        let options: [String]
        let correctIndex: Int
        let explanation: String
    }

    let questions = [
        BiasQuestion(
            scenario: "You see 10 news stories about plane crashes in a week and start feeling afraid to fly — even though statistics show it's far safer than driving.",
            options: ["Confirmation Bias", "Availability Heuristic", "Groupthink", "False Dilemma"],
            correctIndex: 1,
            explanation: "Availability Heuristic: you estimate likelihood based on how easily examples come to mind. Repeated plane crash coverage makes crashes feel more common than they are."
        ),
        BiasQuestion(
            scenario: "You only share articles that support your existing view on a political issue and dismiss opposing evidence as biased.",
            options: ["Availability Heuristic", "Amygdala Hijack", "Confirmation Bias", "Social Proof"],
            correctIndex: 2,
            explanation: "Confirmation Bias: seeking and favoring information that confirms your existing beliefs while ignoring contradicting evidence."
        ),
        BiasQuestion(
            scenario: "A post says 'Millions of people are switching to X — you should too!' and this makes you consider it more seriously.",
            options: ["Social Proof", "Confirmation Bias", "Availability Heuristic", "Overton Window"],
            correctIndex: 0,
            explanation: "Social Proof: the assumption that if many people do something, it must be correct. Often manufactured through bot networks and astroturfing."
        ),
    ]

    private var currentQuestion: BiasQuestion {
        questions[min(questionIndex, questions.count - 1)]
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 14) {
            biasHeader
            biasQuestionBlock
            biasOptionsList
            if selectedAnswer != nil { biasFeedback }
        }
        .padding(16)
        .background(RoundedRectangle(cornerRadius: 14).fill(Color.white.opacity(0.04))
            .overlay(RoundedRectangle(cornerRadius: 14).stroke(accent.opacity(0.3), lineWidth: 1)))
    }

    private var biasHeader: some View {
        HStack {
            Image(systemName: "brain.fill").foregroundColor(accent)
            Text("DRILL: BIAS DETECTOR").font(.system(size: 12, weight: .black)).tracking(2).foregroundColor(accent)
            Spacer()
            if isDone { Text("✓ +5 RESILIENCE").font(.system(size: 11, weight: .bold)).foregroundColor(.green) }
        }
    }

    private var biasQuestionBlock: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Q\(questionIndex + 1) of \(questions.count)").font(.system(size: 11)).foregroundColor(.white.opacity(0.35))
            Text(currentQuestion.scenario).font(.system(size: 13)).foregroundColor(.white.opacity(0.8)).lineSpacing(4)
                .padding(12).background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.04)))
            Text("Which bias is being exploited?").font(.system(size: 12, weight: .bold)).foregroundColor(.white.opacity(0.6))
        }
    }

    private var biasOptionsList: some View {
        ForEach(0..<currentQuestion.options.count, id: \.self) { i in
            biasOptionButton(i)
        }
    }

    private func biasOptionButton(_ i: Int) -> some View {
        let q = currentQuestion
        let hasAnswer = selectedAnswer != nil
        let isCorrect = i == q.correctIndex
        let isSelected = selectedAnswer == i

        let textColor: Color = {
            if !hasAnswer { return .white }
            if isCorrect { return .green }
            if isSelected { return .red }
            return .white.opacity(0.4)
        }()
        let bgColor: Color = {
            if !hasAnswer { return Color.white.opacity(0.04) }
            if isCorrect { return Color.green.opacity(0.1) }
            if isSelected { return Color.red.opacity(0.1) }
            return Color.white.opacity(0.02)
        }()

        return Button {
            if selectedAnswer == nil { selectedAnswer = i; if !isDone { onComplete() } }
        } label: {
            HStack {
                Text(q.options[i]).font(.system(size: 13, weight: isSelected ? .bold : .regular)).foregroundColor(textColor)
                Spacer()
                if hasAnswer {
                    if isCorrect { Image(systemName: "checkmark.circle.fill").foregroundColor(.green) }
                    else if isSelected { Image(systemName: "xmark.circle.fill").foregroundColor(.red) }
                }
            }
            .padding(12)
            .background(RoundedRectangle(cornerRadius: 10).fill(bgColor))
        }
    }

    private var biasFeedback: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(currentQuestion.explanation).font(.system(size: 12)).foregroundColor(.white.opacity(0.65)).lineSpacing(4)
                .padding(12).background(RoundedRectangle(cornerRadius: 10).fill(accent.opacity(0.08)))
            if questionIndex < questions.count - 1 {
                Button { questionIndex += 1; selectedAnswer = nil } label: {
                    Text("NEXT QUESTION →").font(.system(size: 13, weight: .bold))
                        .foregroundColor(accent).frame(maxWidth: .infinity).padding(.vertical, 10)
                        .background(accent.opacity(0.1)).clipShape(RoundedRectangle(cornerRadius: 10))
                }
            } else {
                Text("✓ Drill complete. Keep sharpening this.").font(.system(size: 12, weight: .bold)).foregroundColor(.green)
            }
        }
    }
}

// MARK: - Breathing Drill

struct BreathingDrill: View {
    let accent: Color; let isDone: Bool; let onComplete: () -> Void
    @State private var phase: BreathPhase = .idle
    @State private var timer: Timer? = nil
    @State private var countdown = 4
    @State private var cycles = 0
    @State private var scale: CGFloat = 1.0

    enum BreathPhase { case idle, inhale, hold, exhale, done }

    var body: some View {
        VStack(spacing: 16) {
            HStack {
                Image(systemName: "wind").foregroundColor(accent)
                Text("DRILL: REGULATED BREATHING").font(.system(size: 12, weight: .black)).tracking(2).foregroundColor(accent)
                Spacer()
                if isDone || phase == .done { Text("✓ +5 RESILIENCE").font(.system(size: 11, weight: .bold)).foregroundColor(.green) }
            }

            Text("Box breathing (4-4-4-4) resets the amygdala and restores prefrontal cortex function. This is physiological psyops armor.")
                .font(.system(size: 12)).foregroundColor(.white.opacity(0.6)).lineSpacing(3)

            ZStack {
                Circle().stroke(accent.opacity(0.15), lineWidth: 2).frame(width: 120, height: 120)
                Circle().fill(accent.opacity(0.1)).frame(width: 120, height: 120).scaleEffect(scale).animation(.easeInOut(duration: 0.5), value: scale)
                VStack(spacing: 4) {
                    Text(phaseLabel).font(.system(size: 13, weight: .bold)).foregroundColor(.white)
                    if phase != .idle && phase != .done {
                        Text("\(countdown)").font(.system(size: 28, weight: .black)).foregroundColor(accent)
                    }
                    Text("\(cycles)/3 cycles").font(.system(size: 10)).foregroundColor(.white.opacity(0.4))
                }
            }
            .frame(height: 140)

            if phase == .idle {
                Button { startBreathing() } label: {
                    Text("BEGIN").font(.system(size: 13, weight: .black)).tracking(2)
                        .foregroundColor(.black).frame(maxWidth: .infinity).padding(.vertical, 12)
                        .background(accent).clipShape(RoundedRectangle(cornerRadius: 10))
                }
            } else if phase == .done {
                Text("✓ Nervous system regulated. You are now less susceptible to emotional manipulation.").font(.system(size: 12)).foregroundColor(.green).lineSpacing(3)
            }
        }
        .padding(16)
        .background(RoundedRectangle(cornerRadius: 14).fill(Color.white.opacity(0.04))
            .overlay(RoundedRectangle(cornerRadius: 14).stroke(accent.opacity(0.3), lineWidth: 1)))
    }

    var phaseLabel: String {
        switch phase { case .idle: return "Ready"; case .inhale: return "Inhale"; case .hold: return "Hold"; case .exhale: return "Exhale"; case .done: return "Complete" }
    }

    func startBreathing() {
        cycles = 0
        runCycle()
    }

    func runCycle() {
        guard cycles < 3 else {
            phase = .done
            if !isDone { onComplete() }
            return
        }
        runPhase(.inhale, duration: 4) {
            runPhase(.hold, duration: 4) {
                runPhase(.exhale, duration: 4) {
                    cycles += 1
                    runCycle()
                }
            }
        }
    }

    func runPhase(_ p: BreathPhase, duration: Int, then: @escaping () -> Void) {
        phase = p
        countdown = duration
        scale = p == .inhale ? 1.3 : p == .exhale ? 0.85 : 1.1
        var count = duration
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { t in
            count -= 1
            countdown = count
            if count <= 0 { t.invalidate(); then() }
        }
    }
}

// MARK: - Peace Audit Drill

struct PeaceAuditDrill: View {
    let accent: Color; let isDone: Bool; let onComplete: () -> Void
    @State private var checked: Set<Int> = []
    @State private var submitted = false

    let stressors = [
        "News/social media creating anxiety",
        "A person in my life who drains energy",
        "Financial pressure or uncertainty",
        "Work/career expectations",
        "Physical health concerns",
        "Uncertainty about the future",
        "Information overload",
        "Feeling of powerlessness",
    ]

    let tools = [
        "24-hour news detox",
        "Set firm boundaries or reduce contact",
        "One concrete financial action (list, budget, call)",
        "Separate what I control from what I don't",
        "One small health action today",
        "Focus only on this week",
        "Curate one information source out",
        "Identify one thing I can actually do",
    ]

    var body: some View {
        VStack(alignment: .leading, spacing: 14) {
            peaceHeader
            Text("Check every stressor currently active in your life. You'll receive one targeted tool for each.").font(.system(size: 12)).foregroundColor(.white.opacity(0.6))
            stressorList
            if !submitted { getToolsButton } else { toolsResult }
        }
        .padding(16)
        .background(RoundedRectangle(cornerRadius: 14).fill(Color.white.opacity(0.04))
            .overlay(RoundedRectangle(cornerRadius: 14).stroke(accent.opacity(0.3), lineWidth: 1)))
    }

    private var peaceHeader: some View {
        HStack {
            Image(systemName: "leaf.fill").foregroundColor(accent)
            Text("DRILL: PEACE AUDIT").font(.system(size: 12, weight: .black)).tracking(2).foregroundColor(accent)
            Spacer()
            if isDone || submitted { Text("✓ +5 RESILIENCE").font(.system(size: 11, weight: .bold)).foregroundColor(.green) }
        }
    }

    private var stressorList: some View {
        ForEach(0..<stressors.count, id: \.self) { i in stressorRow(i) }
    }

    private func stressorRow(_ i: Int) -> some View {
        let isChecked = checked.contains(i)
        return Button {
            if isChecked { checked.remove(i) } else { checked.insert(i) }
        } label: {
            HStack(spacing: 10) {
                Image(systemName: isChecked ? "checkmark.square.fill" : "square")
                    .foregroundColor(isChecked ? accent : .white.opacity(0.3))
                Text(stressors[i]).font(.system(size: 13)).foregroundColor(.white.opacity(0.8))
                Spacer()
            }
        }.disabled(submitted)
    }

    private var getToolsButton: some View {
        Button {
            submitted = true
            if !isDone { onComplete() }
        } label: {
            Text("GET MY TOOLS")
                .font(.system(size: 13, weight: .black)).tracking(1)
                .foregroundColor(.black).frame(maxWidth: .infinity).padding(.vertical, 12)
                .background(accent).clipShape(RoundedRectangle(cornerRadius: 10))
        }
    }

    private var toolsResult: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("YOUR TOOLS:").font(.system(size: 11, weight: .black)).tracking(2).foregroundColor(accent)
            ForEach(Array(checked).sorted(), id: \.self) { i in
                HStack(alignment: .top, spacing: 8) {
                    Text("→").foregroundColor(accent).font(.system(size: 12))
                    VStack(alignment: .leading, spacing: 2) {
                        Text(stressors[i]).font(.system(size: 11)).foregroundColor(.white.opacity(0.4))
                        Text(tools[i]).font(.system(size: 13, weight: .bold)).foregroundColor(.white)
                    }
                }
            }
        }
        .padding(12)
        .background(RoundedRectangle(cornerRadius: 10).fill(accent.opacity(0.06)))
    }
}

// MARK: - Scenario Sim Drill

struct ScenarioSimDrill: View {
    let accent: Color; let isDone: Bool; let onComplete: () -> Void
    @State private var scenarioIndex = 0
    @State private var selectedAnswer: Int? = nil

    struct Scenario {
        let setup: String
        let question: String
        let options: [String]
        let correctIndex: Int
        let explanation: String
    }

    let scenarios = [
        Scenario(
            setup: "A social media campaign emerges claiming your city's water supply is contaminated. It spreads rapidly, features emotional photos of sick children, and urges you to buy a specific brand of water filter — with a link in every post.",
            question: "Which psyops structure is this?",
            options: ["False Dilemma", "Fear-Then-Solution", "Trojan Charity", "Manufactured Consensus"],
            correctIndex: 1,
            explanation: "Fear-Then-Solution: the same operator creates or amplifies the fear (contaminated water) and provides the solution (specific product). The fear is the marketing mechanism."
        ),
        Scenario(
            setup: "A political figure says: 'Either you support this bill completely, or you support letting our children suffer. There is no middle ground.'",
            question: "Which structure is operating here?",
            options: ["Overton Window Shifting", "Social Proof", "False Dilemma", "Manufactured Consensus"],
            correctIndex: 2,
            explanation: "False Dilemma: presenting two extreme options as the only choices when many positions exist between them. Forces you to choose within a frame the operator designed."
        ),
        Scenario(
            setup: "Thousands of accounts suddenly appear in your feed all expressing the same opinion on a new policy, all using nearly identical phrasing, from accounts created within the last month.",
            question: "What are you most likely looking at?",
            options: ["Trojan Charity", "Astroturfing / Manufactured Consensus", "Amygdala Hijack", "False Dilemma"],
            correctIndex: 1,
            explanation: "Manufactured Consensus through astroturfing: coordinated synthetic accounts creating the impression of grassroots support. Telltale signs: account age, posting patterns, identical phrasing."
        ),
    ]

    private var currentScenario: Scenario {
        scenarios[min(scenarioIndex, scenarios.count - 1)]
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 14) {
            simHeader
            simScenarioBlock
            simOptionsList
            if selectedAnswer != nil { simFeedback }
        }
        .padding(16)
        .background(RoundedRectangle(cornerRadius: 14).fill(Color.white.opacity(0.04))
            .overlay(RoundedRectangle(cornerRadius: 14).stroke(accent.opacity(0.3), lineWidth: 1)))
    }

    private var simHeader: some View {
        HStack {
            Image(systemName: "gamecontroller.fill").foregroundColor(accent)
            Text("DRILL: SCENARIO SIMULATOR").font(.system(size: 12, weight: .black)).tracking(2).foregroundColor(accent)
            Spacer()
            if isDone { Text("✓ +5 RESILIENCE").font(.system(size: 11, weight: .bold)).foregroundColor(.green) }
        }
    }

    private var simScenarioBlock: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Scenario \(scenarioIndex + 1) of \(scenarios.count)").font(.system(size: 11)).foregroundColor(.white.opacity(0.35))
            Text(currentScenario.setup).font(.system(size: 13)).foregroundColor(.white.opacity(0.8)).lineSpacing(4)
                .padding(12).background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.05)))
            Text(currentScenario.question).font(.system(size: 13, weight: .bold)).foregroundColor(.white.opacity(0.7))
        }
    }

    private var simOptionsList: some View {
        ForEach(0..<currentScenario.options.count, id: \.self) { i in simOptionButton(i) }
    }

    private func simOptionButton(_ i: Int) -> some View {
        let s = currentScenario
        let hasAnswer = selectedAnswer != nil
        let isCorrect = i == s.correctIndex
        let isSelected = selectedAnswer == i

        let textColor: Color = {
            if !hasAnswer { return .white }
            if isCorrect { return .green }
            if isSelected { return .red }
            return .white.opacity(0.4)
        }()
        let bgColor: Color = {
            if !hasAnswer { return Color.white.opacity(0.04) }
            if isCorrect { return Color.green.opacity(0.1) }
            if isSelected { return Color.red.opacity(0.1) }
            return Color.white.opacity(0.02)
        }()

        return Button {
            if selectedAnswer == nil { selectedAnswer = i; if !isDone { onComplete() } }
        } label: {
            HStack {
                Text(s.options[i]).font(.system(size: 13, weight: isSelected ? .bold : .regular)).foregroundColor(textColor)
                Spacer()
                if hasAnswer {
                    if isCorrect { Image(systemName: "checkmark.circle.fill").foregroundColor(.green) }
                    else if isSelected { Image(systemName: "xmark.circle.fill").foregroundColor(.red) }
                }
            }
            .padding(12)
            .background(RoundedRectangle(cornerRadius: 10).fill(bgColor))
        }
    }

    private var simFeedback: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(currentScenario.explanation).font(.system(size: 12)).foregroundColor(.white.opacity(0.65)).lineSpacing(4)
                .padding(12).background(RoundedRectangle(cornerRadius: 10).fill(accent.opacity(0.08)))
            if scenarioIndex < scenarios.count - 1 {
                Button { scenarioIndex += 1; selectedAnswer = nil } label: {
                    Text("NEXT SCENARIO →").font(.system(size: 13, weight: .bold))
                        .foregroundColor(accent).frame(maxWidth: .infinity).padding(.vertical, 10)
                        .background(accent.opacity(0.1)).clipShape(RoundedRectangle(cornerRadius: 10))
                }
            } else {
                Text("✓ All scenarios complete. Your pattern recognition is online.").font(.system(size: 12, weight: .bold)).foregroundColor(.green)
            }
        }
    }
}

// MARK: - Body Renderer

struct PsyopsBodyRenderer: View {
    let text: String
    let accent: Color

    enum PBodyKind { case heading, quote, arrow, divider, reflection, body }
    struct PBlock: Identifiable { let id = UUID(); let kind: PBodyKind; let content: String }

    var body: some View {
        VStack(alignment: .leading, spacing: 14) {
            ForEach(parseBlocks()) { block in pblockView(block) }
        }
    }

    @ViewBuilder
    private func pblockView(_ block: PBlock) -> some View {
        switch block.kind {
        case .heading:    Text(block.content).font(.system(size: 15, weight: .black)).foregroundColor(accent.opacity(0.9)).padding(.top, 4)
        case .quote:      pquoteView(block.content)
        case .arrow:      parrowView(block.content)
        case .divider:    Divider().background(Color.white.opacity(0.08))
        case .reflection: preflectionView(block.content)
        case .body:       Text(block.content).font(.system(size: 14)).foregroundColor(.white.opacity(0.8)).lineSpacing(5).fixedSize(horizontal: false, vertical: true)
        }
    }
    private func pquoteView(_ t: String) -> some View {
        HStack(spacing: 0) {
            Rectangle().fill(accent).frame(width: 3)
            Text(t).font(.system(size: 13)).foregroundColor(.white.opacity(0.75)).italic().padding(.leading, 12)
        }
    }
    private func parrowView(_ t: String) -> some View {
        HStack(alignment: .top, spacing: 8) {
            Text("→").font(.system(size: 12)).foregroundColor(accent).padding(.top, 1)
            Text(t).font(.system(size: 13)).foregroundColor(.white.opacity(0.75)).fixedSize(horizontal: false, vertical: true)
        }
    }
    private func preflectionView(_ t: String) -> some View {
        HStack(alignment: .top, spacing: 10) {
            Image(systemName: "bubble.left.fill").font(.system(size: 12)).foregroundColor(accent).padding(.top, 2)
            Text(t).font(.system(size: 13)).foregroundColor(.white.opacity(0.8)).italic().fixedSize(horizontal: false, vertical: true)
        }
        .padding(12)
        .background(RoundedRectangle(cornerRadius: 10).fill(accent.opacity(0.06))
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(accent.opacity(0.2), lineWidth: 1)))
    }

    private func parseBlocks() -> [PBlock] {
        text.components(separatedBy: "\n")
            .map { $0.trimmingCharacters(in: .whitespaces) }
            .compactMap { line -> PBlock? in
                if line.isEmpty { return nil }
                if line == "---" { return PBlock(kind: .divider, content: "") }
                if line.hasPrefix("**") && line.hasSuffix("**") { return PBlock(kind: .heading, content: line.replacingOccurrences(of: "**", with: "")) }
                if line.hasPrefix("*") && line.hasSuffix("*") { return PBlock(kind: .quote, content: line.replacingOccurrences(of: "*", with: "")) }
                if line.hasPrefix("→ ") { return PBlock(kind: .arrow, content: String(line.dropFirst(2))) }
                if line.hasPrefix("— ") { return PBlock(kind: .arrow, content: String(line.dropFirst(2))) }
                if line.hasPrefix("> ") { return PBlock(kind: .reflection, content: String(line.dropFirst(2))) }
                return PBlock(kind: .body, content: line.replacingOccurrences(of: "**", with: ""))
            }
    }
}
