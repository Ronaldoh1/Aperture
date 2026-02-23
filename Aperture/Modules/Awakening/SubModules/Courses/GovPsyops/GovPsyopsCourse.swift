// GovPsyopsCourse.swift
// SunFlow: Reignited — Aperture
// "Defending Against Government Psyops" — Division, Control & Reclaiming Unity

import SwiftUI

// MARK: - Models

struct GovPsyopsLesson: Identifiable {
    let id: String
    let number: Int
    let title: String
    let icon: String
    let tagline: String
    let module: GovModule
    let readTime: Int
    let body: String
    let drillType: GovDrillType?
}

enum GovModule: String, CaseIterable {
    case foundations = "Foundations"
    case history     = "History"
    case detection   = "Detection"
    case counter     = "Counter"
    case unity       = "Unity"

    var color: Color {
        switch self {
        case .foundations: return Color(hex: "#C0392B")
        case .history:     return Color(hex: "#E67E22")
        case .detection:   return Color(hex: "#8E44AD")
        case .counter:     return Color(hex: "#27AE60")
        case .unity:       return Color(hex: "#2980B9")
        }
    }
    var icon: String {
        switch self {
        case .foundations: return "building.columns.fill"
        case .history:     return "scroll.fill"
        case .detection:   return "magnifyingglass"
        case .counter:     return "shield.lefthalf.filled"
        case .unity:       return "person.3.fill"
        }
    }
    var emoji: String {
        switch self {
        case .foundations: return "🏛️"
        case .history:     return "📜"
        case .detection:   return "🔍"
        case .counter:     return "🛡️"
        case .unity:       return "🤝"
        }
    }
}

enum GovDrillType { case headlineAudit, timelineSort, divisionMap, unityPlan }

struct GovPsyopsProgress: Codable {
    var completedLessons: Set<String> = []
    var drillsCompleted: Int = 0
    var awarenessScore: Int = 0

    mutating func complete(_ id: String) { completedLessons.insert(id); awarenessScore = min(100, awarenessScore + 10) }
    mutating func completeDrill() { drillsCompleted += 1; awarenessScore = min(100, awarenessScore + 5) }
    func isComplete(_ id: String) -> Bool { completedLessons.contains(id) }
    func save() { try? UserDefaults.standard.set(JSONEncoder().encode(self), forKey: "gov_psyops_progress") }
    static func load() -> GovPsyopsProgress {
        guard let d = UserDefaults.standard.data(forKey: "gov_psyops_progress"),
              let p = try? JSONDecoder().decode(GovPsyopsProgress.self, from: d) else { return GovPsyopsProgress() }
        return p
    }
}

// MARK: - Lessons

let govPsyopsLessons: [GovPsyopsLesson] = [
    GovPsyopsLesson(
        id: "gp_01", number: 1,
        title: "Why Governments Divide Their Own People",
        icon: "building.columns.fill",
        tagline: "Control is easier when the controlled are fighting each other.",
        module: .foundations, readTime: 8,
        body: """
**The question is not whether governments use psychological operations against their own citizens.** That is documented, declassified fact. The question is: why, and how?

The core logic is simple and ancient:

*A unified population can hold power accountable. A divided population fights itself.*

This principle has governed political strategy for 2,500 years, from Philip II of Macedon's *divide et impera* to modern algorithmic content strategy. The mechanism changes. The goal does not.

**Five Reasons Governments Divide**

**Distraction from systemic failure.** When economic policy fails — when housing becomes unaffordable, wages stagnate, inequality widens — sustained division along racial, religious, or political lines redirects public attention. Citizens fighting each other over cultural issues cannot simultaneously organize around economic ones.

**Suppression of dissent.** Unified movements threaten concentrated power. Divided movements collapse. COINTELPRO — the FBI's domestic counterintelligence program — explicitly targeted the potential for Black nationalist groups, antiwar organizations, and labor movements to form coalitions. The files said it clearly: prevent the rise of a *"messianic"* figure who might *"unite and electrify"* the movement.

**Manufactured consent.** When a government wants to pursue a policy the public might oppose — a war, surveillance expansion, austerity — fear-based division creates the conditions. An enemy, internal or external, justifies emergency measures that would otherwise be unacceptable.

**Maintaining power asymmetry.** Concentrated wealth and political power require a population that does not coordinate effectively to challenge them. Division is the system's immune response to threats to its structure.

**Electoral engineering.** Targeted division of the electorate — amplifying wedge issues that produce high-emotion low-information voting behavior — serves electoral interests regardless of party. The goal is reliable emotional triggers, not informed civic participation.

**The Crucial Distinction**

Recognizing government psyops is not conspiracy thinking. It is the reading of primary documents. COINTELPRO files are public record. Operation Mockingbird was the subject of congressional hearings. MKUltra documents survived an attempted destruction order.

The error is not in seeing the operations. The error is in seeing them everywhere, attributing everything to deliberate design, and losing the capacity to distinguish documented reality from speculation.

Your job: read primary sources. Read declassified documents. Build your understanding on evidence, not inference.

**Reflection**
> Identify one major political divide currently consuming public attention in your country. Ask: What specific policy or structural issue gets less attention because of this divide? That's the question the divide was designed to prevent you from asking.
""", drillType: .divisionMap
    ),
    GovPsyopsLesson(
        id: "gp_02", number: 2,
        title: "COINTELPRO: The Blueprint That Never Retired",
        icon: "doc.text.magnifyingglass",
        tagline: "The FBI's war on its own citizens. Declassified. Still relevant.",
        module: .history, readTime: 9,
        body: """
**COINTELPRO** ran from 1956 to 1971. When it was exposed — by citizens who broke into an FBI field office in Media, Pennsylvania in 1971 and mailed the documents to journalists — its scale shocked even seasoned civil liberties advocates.

The Church Committee's 1975-76 congressional investigation documented what was found. These are not allegations. They are official government records.

**What They Actually Did**

The program targeted: the Communist Party USA, the Socialist Workers Party, the Ku Klux Klan, the Puerto Rican independence movement, the American Indian Movement, the Black Panther Party, the Student Nonviolent Coordinating Committee (SNCC), Martin Luther King Jr., and numerous other groups.

**Documented methods:**

*Forged documents and letters* — The FBI sent fabricated letters to Black Panther chapters claiming other chapters were plotting against them, triggering internal paranoia and violence between chapters.

*Anonymous tip letters to employers* — Activists were reported to their employers with fabricated allegations, destroying livelihoods.

*Planting informants as agent provocateurs* — Informants were instructed to push groups toward illegal activities, creating the pretext for arrest and prosecution.

*Targeting King specifically* — The FBI sent King an anonymous letter urging him to commit suicide, along with what they claimed was evidence of his extramarital affairs. The letter read: *"The American public... will know you for what you are—an evil, abnormal beast."* It instructed him to kill himself before *"your filthy, abnormal, fraudulent self is bared to the nation."* This was official FBI correspondence.

*Infiltrating legal proceedings* — Informants provided false testimony. Evidence was fabricated. Convictions resulted from planted evidence.

**The Specific Goal Stated in FBI Documents**

Internal memos described the goals of the Black Panther portion explicitly. They wanted to:

— *"Prevent the rise of a 'Messiah' who could unify and electrify the militant black nationalist movement."*
— *"Prevent militant black nationalist groups and leaders from gaining respectability."*
— *"Prevent the long-range growth of militant black organizations."*

This was not counter-terrorism. The Black Panther Party ran free breakfast programs, health clinics, and schools. The FBI's own files show they were targeted because they were *building power* — not because they were planning violence.

**Why It Matters Now**

COINTELPRO officially ended in 1971. The tactics didn't. They became the manual.

Every element of the COINTELPRO toolkit — informant infiltration, provocateur tactics, reputational attacks, fragmentation of coalitions, targeting of leadership — has documented modern applications. The Church Committee's final report explicitly warned: *"The United States government, including the White House, has set in motion forces that, in the name of national security, have violated the constitutional rights of citizens."*

The recommendation: robust congressional oversight, strict legal accountability, and explicit protections against domestic intelligence targeting citizens for their political beliefs.

Most of those recommendations were not implemented.

**Reflection**
> Read one primary source document from COINTELPRO (the Church Committee Final Report, Vol. 3, is publicly available). What is one specific tactic documented there that you can identify an apparent modern analog to?
""", drillType: .timelineSort
    ),
    GovPsyopsLesson(
        id: "gp_03", number: 3,
        title: "The Media Infrastructure: Mockingbird's Legacy",
        icon: "tv.fill",
        tagline: "When the CIA ran newsrooms. The relationship that never fully ended.",
        module: .history, readTime: 8,
        body: """
**Operation Mockingbird** was the CIA's program to cultivate relationships with major American media organizations and journalists, using them to disseminate agency-approved narratives and suppress stories the agency considered harmful to national interests.

What we know comes from the Church Committee and from Carl Bernstein's landmark 1977 *Rolling Stone* investigation: "The CIA and the Media."

**The Scale**

Bernstein's reporting documented over 400 American journalists who had carried out assignments for the CIA. The list included some of the most prominent names in American journalism and executives at the most respected publications and networks.

The CIA had operatives working as journalists at major wire services, television networks, newspapers, and magazines. These were not all aware they were being used — some were willing, some were not. Some were CIA officers under journalistic cover. Some were journalists who provided information and occasionally assistance without realizing the full picture.

**The Method**

The operation worked through several channels:

*Placed stories* — CIA officers drafted stories that were then published as independent journalism under reporters' bylines.

*Story suppression* — Editors who had CIA relationships killed stories that the agency flagged.

*Selective sourcing* — Journalists were steered toward CIA-friendly sources and away from others.

*Foreign placement* — Stories were planted in foreign publications and then "discovered" and amplified by domestic media, creating the impression of independent international reporting confirming U.S. narratives.

**The Official End**

CIA Director William Colby testified before the Church Committee and officially ended the use of journalists as intelligence assets — with exceptions so broad they arguably swallowed the rule: the agency could still use freelance journalists, stringers, journalists employed by organizations the CIA "does not consider to be in the mainstream of American media," and journalists overseas.

**What Ended and What Didn't**

The formal program: officially ended.
The infrastructure of relationships: could not be "ended" by declaration.
The revolving door between intelligence agencies and media organizations: continues.
The practice of information management through media access control: standard government practice.

This is not a claim that modern media is CIA-controlled. It is the accurate statement that:
1. The program existed and was documented
2. The full extent of its influence was never fully established
3. The structural relationships that enabled it were not structurally dismantled
4. Governments continue to manage information flow through media access, background briefings, and strategic leaks

**Your Practice**

For any major national security story: identify who the sources are. Are they named? Are they anonymous government officials? What does the reporter stand to lose by challenging those sources? What does the publication stand to lose?

These are not paranoid questions. They are standard source analysis.

**Reflection**
> Take a current major news story involving national security. Map: Who are the sources? What is their institutional relationship to the government? What story would look different if you sourced it from people with different institutional relationships?
""", drillType: nil
    ),
    GovPsyopsLesson(
        id: "gp_04", number: 4,
        title: "The Modern Toolkit: Algorithms, Bots & Digital Ops",
        icon: "antenna.radiowaves.left.and.right",
        tagline: "COINTELPRO at scale. Automated. Deniable. Cheaper per person than a stamp.",
        module: .detection, readTime: 8,
        body: """
**The difference between 1970 and now is not the intent or the tactics.** It's the leverage. A single coordinated digital operation can now reach millions of people with individually targeted content for a fraction of the cost of printing a single propaganda leaflet.

**Documented Modern Operations**

*Russian Internet Research Agency (2016):* The Senate Intelligence Committee documented an operation that created over 80,000 pieces of content reaching an estimated 126 million Facebook users, along with operations on Twitter (3,814 accounts, 10.4 million tweets), Instagram (120 million interactions), and YouTube. The operation targeted specific communities — particularly Black Americans, veterans, and swing-state voters — with content designed not primarily to support a candidate but to amplify divisions that already existed.

The goal, as documented, was not to create division from nothing. It was to find existing fractures in American society and pour fuel into them.

*Cambridge Analytica (2018):* The political consulting firm harvested data from approximately 87 million Facebook profiles without consent and used psychological profiling to target voters with individually customized content designed to trigger specific emotional responses based on personality vulnerabilities.

The innovation was not targeting. Advertisers had targeted for decades. The innovation was psychological targeting — using personality data to determine which emotional trigger (fear, anger, tribalism, disgust) would be most effective for each individual, then delivering the corresponding content.

**The Algorithmic Amplifier**

Neither of these operations would have reached the scale they did without a pre-existing infrastructure: the recommendation algorithm.

Social media platforms discovered that content producing high emotional engagement — particularly outrage and fear — produced more clicks, shares, and time-on-platform than content producing calm interest. The algorithm optimized for engagement. Engagement correlated with emotional arousal. Emotional arousal was highest with content that triggered fear and tribal identity.

The algorithm was not designed to radicalize. It was designed to maximize attention. Radicalization was the emergent property of attention-maximization applied to emotionally-charged content.

This creates a structural problem: even without deliberate psyops operations, the information environment is optimized for division, because division is engaging, and engagement is revenue.

**Detection Protocol**

When you see content producing strong emotional responses, apply these four checks:

→ **Account age/history:** Bot and astroturf accounts often have recent creation dates, unusually high posting volume, and little personal detail.

→ **Coordination patterns:** Organic grassroots opinions are diverse in phrasing. Coordinated campaigns use similar language, often posting within narrow time windows.

→ **Amplification asymmetry:** Check whether the number of shares significantly outpaces engagement. Coordinated amplification produces high share counts with low organic engagement.

→ **Cui bono at the narrative level:** Who benefits if you believe this? Not the poster — the intended *conclusion* of the content.

**Reflection**
> Identify one recurring piece of divisive content in your feed. Apply all four detection checks. What do you find?
""", drillType: .headlineAudit
    ),
    GovPsyopsLesson(
        id: "gp_05", number: 5,
        title: "Inside the Divide: How Tribalism Is Engineered",
        icon: "person.2.slash",
        tagline: "Your group loyalty is not a flaw. It's the exploit.",
        module: .detection, readTime: 7,
        body: """
**Tribalism is not a flaw in human psychology.** It is an adaptive feature — evolved over hundreds of thousands of years in small groups where in-group cooperation and out-group differentiation were survival mechanisms.

It becomes a vulnerability when it can be activated deliberately, at scale, to override the part of your brain that can evaluate evidence.

**The Exploit**

Social psychologist Henri Tajfel demonstrated in the 1970s that the human tendency toward in-group favoritism can be triggered with minimal — even arbitrary — group assignment. Groups formed around coin flips showed in-group bias within minutes.

In practice: you don't need a coherent ideology to create tribalism. You need a boundary. The boundary can be a flag, a label, a political affiliation, a dietary choice, a team. Once the boundary exists and is emotionally charged, the in-group/out-group dynamic activates automatically.

Divide tactics don't need to create the boundary. They need to charge it.

**The Four-Step Engineering Process**

**Step 1: Identify existing social fault lines.** All societies have them — race, class, religion, political affiliation, region. The fault lines exist naturally. The operation locates the ones with the highest emotional volatility.

**Step 2: Amplify the most extreme voices on each side.** You don't represent the average member of any group — you represent the most inflammatory member and frame them as representative. This makes the other group appear more extreme than it is, and makes your own group's defense feel more urgent.

**Step 3: Create incidents that confirm the narrative.** Real incidents are selected and amplified. Invented incidents are seeded. The goal is a continuous stream of confirming evidence that the other group poses an existential threat.

**Step 4: Close off any possibility of reconsidering.** Anyone who questions the narrative is marked as a traitor, a plant, or brainwashed. This creates self-sealing logic: evidence against the division validates the division.

**The Counter**

The most important thing to know about engineered tribalism: it requires your participation to function.

The question is not whether you have tribal loyalties — you do, as does every human. The question is whether those loyalties are activated by design in contexts that serve someone else's interests rather than your own.

Test: Is this identity conflict *about something concrete* — a specific policy, a specific material interest — or is it primarily about *who is right/wrong/good/evil?* The more the conflict is about pure moral status and less about concrete shared interests, the more likely it's been engineered.

**Reflection**
> Identify one in-group you belong to. Name three specific policy positions or material interests that group actually shares. Then name three ways the framing of that group — from outside and inside — emphasizes moral status over those concrete interests. What's missing in the moral-status framing?
""", drillType: nil
    ),
    GovPsyopsLesson(
        id: "gp_06", number: 6,
        title: "Building Counter-Intelligence: Personal Protocols",
        icon: "lock.shield.fill",
        tagline: "Media literacy. Source mapping. The 24-hour rule. Your practical stack.",
        module: .counter, readTime: 7,
        body: """
**Awareness without protocol is just frustration.** This lesson gives you the actual practice — what to do with the knowledge you've built.

**Protocol 1: Primary Source Priority**

For any claim that triggers strong emotion, find the primary source. Not the article about the study. The study. Not the article about the document. The document.

Most information in a media ecosystem travels through multiple layers of interpretation before it reaches you, and each layer adds framing. The primary source is where you can evaluate the underlying reality without the framing.

Practice: The next time you read a headline citing "a study," find the actual study. Note what the study actually says versus what the headline implies.

**Protocol 2: Source Mapping**

Before trusting a source, map it:

→ Who funds the publication or channel?
→ What is the institutional relationship between reporters and their primary sources?
→ What stories does this source consistently amplify? What does it consistently minimize?
→ When this source has been wrong in the past, has it corrected?

This is not about finding "unbiased" sources — those don't exist. It's about knowing the bias of each source so you can apply appropriate adjustments and triangulate between sources with different biases toward the same event.

**Protocol 3: The 24-Hour Rule**

Breaking news that triggers intense emotion — outrage, fear, urgent moral clarity — has a high rate of being wrong, incomplete, or manipulated. The first 24 hours after a major event is when the most misinformation circulates and when you are most emotionally vulnerable to it.

Delay sharing. Delay concluding. The most important things you can do in the first 24 hours of a major event are: consume less information, not more, and apply more skepticism, not less.

**Protocol 4: Decrypt the Frame**

Every piece of information is framed. The frame includes: what is selected to include, what is selected to exclude, whose interpretation is treated as primary, what emotional tone is established.

Practice: Identify the frame of one piece of news content per day. Describe what the frame includes, excludes, and implies. Then describe what a different frame of the same underlying events would look like.

**Protocol 5: Disaggregate the Coalition**

When you find yourself part of a large emotional coalition — many people who agree with you about an outrage — disaggregate. What specific concrete claims does this coalition share? What specific concrete actions does it support? Often emotional coalitions have very diffuse goals and very high internal diversity once you look past the shared emotional charge.

Emotional coalitions are easy to assemble and easy to redirect. Concrete coalitions — organized around specific shared interests and specific demands — are harder to build but much harder to manipulate.

**Reflection**
> Apply Protocol 2 to your most trusted news source. Map it. What do you find?
""", drillType: .headlineAudit
    ),
    GovPsyopsLesson(
        id: "gp_07", number: 7,
        title: "Unity as Strategic Counter-Intelligence",
        icon: "person.3.fill",
        tagline: "Division is the operation. Unity across difference is the counter-operation.",
        module: .unity, readTime: 8,
        body: """
**Unity does not mean agreement.** This is the most important distinction in this entire course.

The goal of division operations is not to make you agree with someone you'd otherwise fight. The goal is to make you unable to recognize shared concrete interests with people who think differently about some things.

Counter-unity means: building the capacity to cooperate around shared material interests with people who disagree with you on other things.

**The Shared Interest Framework**

COINTELPRO's deepest fear — stated explicitly in its own documents — was coalition formation. Specifically, the potential for Black nationalist groups, antiwar groups, labor movements, and student movements to recognize shared interests and coordinate.

They weren't aligned on everything. They disagreed significantly on tactics, philosophy, religion, and culture. But they shared concrete interests around poverty, police violence, and the concentration of economic power.

The operation worked to prevent them from ever sitting in the same room long enough to identify those overlaps.

**Modern Application**

The same structural fear operates today. The moment labor movements and civil rights movements, or environmental groups and rural farming communities, or veterans organizations and social justice organizations begin identifying shared interests — watch for the content that amplifies the differences between them.

This content will be real: genuine differences exist. The operation doesn't manufacture them. It amplifies them to the point where the differences feel insuperable, even when the shared interests are large.

**Building Genuine Cross-Difference Coalition**

The process:

→ **Find the concrete overlap.** Not the philosophical agreement — the specific shared material interest. "We both want X policy" is more durable than "we both share values Y and Z."

→ **Separate the surface conflict from the underlying need.** Two groups fighting over a cultural issue may both have economic anxieties driving the intensity. Address the underlying need, not just the surface conflict.

→ **Build relationships before you need them.** Cross-difference coalitions that form in response to a crisis are fragile. Relationships built in non-crisis conditions are the foundation for crisis coordination.

→ **Protect the coalition from infiltration.** COINTELPRO's most effective tactic was identifying the most trusted members of a group and either flipping them or discrediting them. Strong, diverse coalitions with good process for handling disagreement internally are more resistant to this.

**The Malala Principle**

Malala Yousafzai's effectiveness was not primarily about media sophistication or messaging. It was about clarity of purpose (every child deserves education) and genuine cross-difference relationships built over time. She was hard to discredit because her coalition was wide enough and her purpose was concrete enough that manufactured division couldn't find a seam.

**Reflection**
> Identify one group that you politically disagree with significantly. Now identify one concrete material interest you might share with them — not a value, but a specific policy or outcome you both might want. What would it take to have one real conversation organized around that shared interest?
""", drillType: .unityPlan
    ),
    GovPsyopsLesson(
        id: "gp_08", number: 8,
        title: "Future Threats & The Long Game",
        icon: "cpu.fill",
        tagline: "AI deepfakes. Synthetic communities. The next phase is already running.",
        module: .unity, readTime: 7,
        body: """
**The operations we've studied were built with the technology of their era.** COINTELPRO used typewriters, informants, and postal mail. Mockingbird used telephone networks and newsroom relationships. The Internet Research Agency used social media platforms and advertising tools.

The next phase uses AI.

**What's Already Deployed**

*Synthetic media (deepfakes):* The technology to generate realistic video of any person saying anything you want them to say crossed the threshold of casual undetectability in 2023. Events that never occurred can now be "documented" in video form. The evidentiary value of video has been functionally compromised.

*AI-generated personas:* Large language models can now sustain consistent, believable social media personas at scale — responding to real users, building follower networks, generating content indistinguishable from human-authored content. A single operator can now maintain a synthetic community of thousands.

*Personalized narrative targeting:* AI models can generate individually customized versions of a narrative — same underlying message, adapted to each individual's known psychological profile, language patterns, and social context. Mass personalization.

*Automated coalition disruption:* AI systems can be deployed to identify emerging cross-difference coalitions, analyze their communication patterns, identify points of vulnerability, and generate targeted content to amplify their internal disagreements at the moment of maximum impact.

**The Deepfake Problem**

When video can be fabricated, the question shifts from "is this true?" to "how do I verify origin?" The answers:

→ Blockchain-based content authentication (content is signed at creation point; modifications are detectable)
→ Metadata analysis (technical fingerprints of generation)
→ Cross-reference with multiple independent sources at the moment of capture
→ Primary source verification — did anyone who was actually there confirm it?

Digital literacy now requires familiarity with these technical tools, not just evaluative judgment about content.

**The Structural Response**

Individual defenses have limits against operations running at this scale. Structural responses matter:

→ **Transparency legislation:** Mandatory disclosure of AI-generated content, political advertising sources, and data use in targeting.
→ **Platform accountability:** Structural requirements for algorithmic transparency and content amplification disclosure.
→ **Open-source verification tools:** Widely accessible tools for deepfake detection and content authentication.
→ **Civic education:** Digital literacy as core curriculum — not "be careful online" but actual technical understanding of how synthetic media is created and detected.

**The Underlying Constant**

The technology changes. The underlying logic doesn't. As long as concentrated power benefits from a divided, disorganized, mutually suspicious population, operations will be designed and funded to produce that outcome.

Your defense is understanding that logic — and choosing, deliberately, to organize your relationships and your information consumption in ways that serve your actual interests rather than someone else's operational goals.

**Final Reflection**
> Write a personal "counter-intelligence protocol" — 5 specific practices you will implement based on this course. Keep it short enough to actually follow. The goal is sustainable habits, not aspirational lists.
""", drillType: nil
    )
]

// MARK: - Hub View

struct GovPsyopsCourseView: View {
    @Environment(\.dismiss) var dismiss
    @State private var progress = GovPsyopsProgress.load()
    @State private var selectedLesson: GovPsyopsLesson?
    @State private var showLesson = false
    @State private var filterModule: GovModule? = nil
    @State private var scanAnim = false

    private let bg = Color(red: 0.03, green: 0.03, blue: 0.05)
    private let accent = Color(hex: "#C0392B")

    var body: some View {
        NavigationStack {
            ZStack {
                bg.ignoresSafeArea()
                gridOverlay

                ScrollView(showsIndicators: false) {
                    VStack(spacing: 20) {
                        heroSection
                        awarenessMeter
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
                    Text("🏛️ Gov Psyops Defense").font(.system(size: 15, weight: .bold)).foregroundColor(.white)
                }
            }
            .fullScreenCover(isPresented: $showLesson) {
                if let lesson = selectedLesson {
                    GovPsyopsLessonView(lesson: lesson, progress: $progress)
                }
            }
        }
        .onAppear { withAnimation(.linear(duration: 3).repeatForever(autoreverses: false)) { scanAnim = true } }
    }

    private var gridOverlay: some View {
        Canvas { ctx, size in
            var rng = SystemRandomNumberGenerator()
            let step: CGFloat = 44
            for x in stride(from: 0.0, to: size.width, by: step) {
                for y in stride(from: 0.0, to: size.height, by: step) {
                    let opacity = Double.random(in: 0.01...0.04, using: &rng)
                    ctx.fill(Path(CGRect(x: x, y: y, width: 1, height: 1)), with: .color(.white.opacity(opacity)))
                }
            }
        }
        .ignoresSafeArea().allowsHitTesting(false)
    }

    private var heroSection: some View {
        VStack(spacing: 14) {
            Spacer().frame(height: 8)
            ZStack {
                RoundedRectangle(cornerRadius: 18).fill(accent.opacity(0.08)).frame(width: 100, height: 100)
                    .overlay(RoundedRectangle(cornerRadius: 18).stroke(accent.opacity(0.25), lineWidth: 1))
                Image(systemName: "building.columns.fill").font(.system(size: 40)).foregroundColor(accent)
            }
            VStack(spacing: 6) {
                Text("GOVERNMENT PSYOPS").font(.system(size: 9, weight: .black)).tracking(3).foregroundColor(accent.opacity(0.6))
                Text("Detect. Counter.\nReclaim Unity.").font(.system(size: 24, weight: .black)).foregroundColor(.white).multilineTextAlignment(.center)
                Text("8 lessons · Drills · Primary Source Analysis · Awareness Meter")
                    .font(.system(size: 11)).foregroundColor(.white.opacity(0.35)).multilineTextAlignment(.center)
                Text("Based on declassified operations & congressional records")
                    .font(.system(size: 10)).foregroundColor(accent.opacity(0.5)).italic()
            }
        }
    }

    private var awarenessMeter: some View {
        let pct = Double(progress.awarenessScore) / 100.0
        let label: String = {
            if progress.awarenessScore < 25 { return "UNINITIATED" }
            if progress.awarenessScore < 50 { return "AWARE" }
            if progress.awarenessScore < 75 { return "ANALYST" }
            return "COUNTER-INTEL"
        }()
        let meterColor: Color = progress.awarenessScore < 25 ? .gray : progress.awarenessScore < 50 ? .orange : progress.awarenessScore < 75 ? .yellow : Color(hex: "#27AE60")

        return VStack(spacing: 10) {
            HStack {
                VStack(alignment: .leading, spacing: 3) {
                    Text("AWARENESS LEVEL").font(.system(size: 9, weight: .black)).tracking(2).foregroundColor(.white.opacity(0.4))
                    Text(label).font(.system(size: 16, weight: .black)).foregroundColor(meterColor)
                }
                Spacer()
                VStack(alignment: .trailing, spacing: 3) {
                    Text("\(progress.awarenessScore)").font(.system(size: 28, weight: .black)).foregroundColor(meterColor)
                    Text("\(progress.completedLessons.count)/\(govPsyopsLessons.count) lessons").font(.system(size: 10)).foregroundColor(.white.opacity(0.35))
                }
            }
            GeometryReader { geo in
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 4).fill(Color.white.opacity(0.05)).frame(height: 7)
                    RoundedRectangle(cornerRadius: 4).fill(LinearGradient(colors: [.gray, .orange, .yellow, meterColor], startPoint: .leading, endPoint: .trailing))
                        .frame(width: geo.size.width * pct, height: 7)
                }
            }.frame(height: 7)
        }
        .padding(16)
        .background(RoundedRectangle(cornerRadius: 14).fill(Color.white.opacity(0.04))
            .overlay(RoundedRectangle(cornerRadius: 14).stroke(meterColor.opacity(0.2), lineWidth: 1)))
    }

    private var moduleFilter: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 8) {
                GovFilterChip(label: "All", emoji: "⚡", color: accent, isSelected: filterModule == nil) { filterModule = nil }
                ForEach(GovModule.allCases, id: \.self) { mod in
                    GovFilterChip(label: mod.rawValue, emoji: mod.emoji, color: mod.color, isSelected: filterModule == mod) {
                        filterModule = filterModule == mod ? nil : mod
                    }
                }
            }.padding(.horizontal, 2)
        }
    }

    private var lessonCards: some View {
        let filtered = filterModule == nil ? govPsyopsLessons : govPsyopsLessons.filter { $0.module == filterModule }
        return VStack(spacing: 10) {
            ForEach(filtered) { lesson in
                GovPsyopsLessonCard(lesson: lesson, isCompleted: progress.isComplete(lesson.id)) {
                    selectedLesson = lesson; showLesson = true
                }
            }
        }
    }
}

// MARK: - Filter Chip

struct GovFilterChip: View {
    let label: String; let emoji: String; let color: Color; let isSelected: Bool; let action: () -> Void
    var body: some View {
        Button(action: action) {
            HStack(spacing: 5) {
                Text(emoji).font(.system(size: 11))
                Text(label).font(.system(size: 11, weight: isSelected ? .bold : .medium))
            }
            .foregroundColor(isSelected ? .black : .white.opacity(0.5))
            .padding(.horizontal, 12).padding(.vertical, 7)
            .background(isSelected ? color : Color.white.opacity(0.06)).clipShape(Capsule())
        }
    }
}

// MARK: - Lesson Card

struct GovPsyopsLessonCard: View {
    let lesson: GovPsyopsLesson; let isCompleted: Bool; let action: () -> Void
    var body: some View {
        Button(action: action) {
            HStack(spacing: 14) {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(isCompleted ? lesson.module.color.opacity(0.25) : lesson.module.color.opacity(0.08))
                        .frame(width: 50, height: 50)
                    if isCompleted { Image(systemName: "checkmark.circle.fill").font(.system(size: 22)).foregroundColor(lesson.module.color) }
                    else { Image(systemName: lesson.icon).font(.system(size: 19)).foregroundColor(lesson.module.color) }
                }
                VStack(alignment: .leading, spacing: 4) {
                    HStack(spacing: 6) {
                        Text(lesson.module.emoji).font(.system(size: 10))
                        Text(lesson.module.rawValue.uppercased()).font(.system(size: 9, weight: .black)).tracking(1.5).foregroundColor(lesson.module.color.opacity(0.8))
                        if lesson.drillType != nil {
                            Text("DRILL").font(.system(size: 8, weight: .black)).tracking(1).foregroundColor(.black)
                                .padding(.horizontal, 5).padding(.vertical, 2).background(lesson.module.color.opacity(0.9)).clipShape(Capsule())
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
                .overlay(RoundedRectangle(cornerRadius: 16).stroke(isCompleted ? lesson.module.color.opacity(0.3) : Color.white.opacity(0.06), lineWidth: 1)))
        }
    }
}

// MARK: - Lesson View

struct GovPsyopsLessonView: View {
    let lesson: GovPsyopsLesson
    @Binding var progress: GovPsyopsProgress
    @Environment(\.dismiss) var dismiss
    @State private var drillDone = false

    var body: some View {
        NavigationStack {
            ZStack {
                Color(red: 0.03, green: 0.03, blue: 0.05).ignoresSafeArea()
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 22) {
                        VStack(alignment: .leading, spacing: 10) {
                            HStack(spacing: 8) {
                                Text(lesson.module.emoji)
                                Text(lesson.module.rawValue.uppercased()).font(.system(size: 10, weight: .black)).tracking(2).foregroundColor(lesson.module.color)
                                Spacer()
                                Text("L\(lesson.number) of \(govPsyopsLessons.count)").font(.system(size: 10)).foregroundColor(.white.opacity(0.3))
                            }
                            Text(lesson.title).font(.system(size: 22, weight: .black)).foregroundColor(.white)
                            Text(lesson.tagline).font(.system(size: 13)).foregroundColor(.white.opacity(0.5)).italic()
                            HStack(spacing: 5) {
                                Image(systemName: "clock").font(.system(size: 10))
                                Text("\(lesson.readTime) min").font(.system(size: 11))
                                if lesson.drillType != nil {
                                    Text("·")
                                    Image(systemName: "hand.tap.fill").font(.system(size: 10)).foregroundColor(lesson.module.color)
                                    Text("Interactive drill").font(.system(size: 11)).foregroundColor(lesson.module.color)
                                }
                            }.foregroundColor(.white.opacity(0.4))
                        }

                        Divider().background(lesson.module.color.opacity(0.3))
                        GovBodyRenderer(text: lesson.body, accent: lesson.module.color)

                        if let drill = lesson.drillType {
                            Divider().background(lesson.module.color.opacity(0.2))
                            GovDrillBlock(drillType: drill, accent: lesson.module.color, isDone: drillDone) {
                                drillDone = true; progress.completeDrill(); progress.save()
                            }
                        }

                        Button {
                            progress.complete(lesson.id); progress.save()
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) { dismiss() }
                        } label: {
                            HStack {
                                Image(systemName: progress.isComplete(lesson.id) ? "checkmark.shield.fill" : "checkmark.shield")
                                Text(progress.isComplete(lesson.id) ? "Lesson Complete" : "Mark Complete & Continue").font(.system(size: 14, weight: .bold))
                            }
                            .foregroundColor(progress.isComplete(lesson.id) ? lesson.module.color : .black)
                            .frame(maxWidth: .infinity).padding(.vertical, 14)
                            .background(progress.isComplete(lesson.id)
                                ? RoundedRectangle(cornerRadius: 14).fill(lesson.module.color.opacity(0.15))
                                : RoundedRectangle(cornerRadius: 14).fill(lesson.module.color))
                        }.padding(.top, 8)

                        Spacer(minLength: 60)
                    }
                    .padding(.horizontal, 20).padding(.top, 16)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button { dismiss() } label: { Image(systemName: "xmark.circle.fill").foregroundStyle(.white.opacity(0.4)) }
                }
                ToolbarItem(placement: .principal) {
                    Text("🏛️ Gov Psyops").font(.system(size: 13, weight: .semibold)).foregroundColor(.white.opacity(0.5))
                }
            }
        }
    }
}

// MARK: - Drills

struct GovDrillBlock: View {
    let drillType: GovDrillType; let accent: Color; let isDone: Bool; let onComplete: () -> Void
    var body: some View {
        switch drillType {
        case .headlineAudit:   GovHeadlineAudit(accent: accent, isDone: isDone, onComplete: onComplete)
        case .timelineSort:    GovTimelineDrill(accent: accent, isDone: isDone, onComplete: onComplete)
        case .divisionMap:     GovDivisionMapDrill(accent: accent, isDone: isDone, onComplete: onComplete)
        case .unityPlan:       GovUnityPlanDrill(accent: accent, isDone: isDone, onComplete: onComplete)
        }
    }
}

struct GovHeadlineAudit: View {
    let accent: Color; let isDone: Bool; let onComplete: () -> Void
    @State private var index = 0
    @State private var selected: Int? = nil

    struct Question {
        let headline: String
        let options: [String]
        let correct: Int
        let explanation: String
    }

    let questions = [
        Question(
            headline: "EXCLUSIVE: Government Source Confirms SHOCKING New Policy — Experts Are Furious",
            options: ["Probably legitimate breaking news", "Manufactured urgency + anonymous authority + emotional loading", "A balanced investigative report", "Evidence-based policy analysis"],
            correct: 1,
            explanation: "Multiple red flags: 'EXCLUSIVE' (urgency), 'government source' (anonymous, unverifiable), 'SHOCKING' (emotional loading), 'experts are furious' (manufactured consensus). This is the full psyops signature."
        ),
        Question(
            headline: "Study: Moderate Exercise Three Times Weekly Linked to Improved Cognitive Function",
            options: ["Could be legitimate research reporting", "Manufactured fear campaign", "Government division tactic", "Astroturfed misinformation"],
            correct: 0,
            explanation: "This has none of the manipulation signatures: no urgency framing, no anonymous authority, no emotional loading, no clear 'enemy.' This reads like straightforward research reporting. Always calibrate — not everything is psyops."
        ),
        Question(
            headline: "Are [Group X] Destroying Our Way of Life? What They Don't Want You to Know",
            options: ["Honest investigative journalism", "Tribal activation + conspiracy framing", "Evidence-based policy critique", "Balanced cultural analysis"],
            correct: 1,
            explanation: "The question format activates tribal defensiveness before making any claim. 'Our way of life' establishes in-group. '[Group X]' is the threat. 'What they don't want you to know' adds conspiracy frame. Full tribal activation sequence."
        ),
    ]

    private var currentQuestion: Question {
        questions[min(index, questions.count - 1)]
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 14) {
            auditHeader
            questionBlock
            optionsList
            if selected != nil { feedbackBlock }
        }
        .padding(16)
        .background(RoundedRectangle(cornerRadius: 14).fill(Color.white.opacity(0.04))
            .overlay(RoundedRectangle(cornerRadius: 14).stroke(accent.opacity(0.3), lineWidth: 1)))
    }

    private var auditHeader: some View {
        HStack {
            Image(systemName: "doc.text.magnifyingglass").foregroundColor(accent)
            Text("DRILL: HEADLINE AUDIT").font(.system(size: 12, weight: .black)).tracking(2).foregroundColor(accent)
            Spacer()
            if isDone { Text("✓ +5").font(.system(size: 11, weight: .bold)).foregroundColor(.green) }
        }
    }

    private var questionBlock: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Q\(index + 1)/\(questions.count)").font(.system(size: 11)).foregroundColor(.white.opacity(0.35))
            Text("Classify this headline:").font(.system(size: 12)).foregroundColor(.white.opacity(0.6))
            Text("\"\(currentQuestion.headline)\"")
                .font(.system(size: 14, weight: .bold)).foregroundColor(.white).italic()
                .padding(12).background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.05)))
        }
    }

    private var optionsList: some View {
        ForEach(0..<currentQuestion.options.count, id: \.self) { i in
            optionButton(i)
        }
    }

    private func optionButton(_ i: Int) -> some View {
        let q = currentQuestion
        let isCorrect = i == q.correct
        let isSelected = selected == i
        let hasSelected = selected != nil

        let textColor: Color = {
            if !hasSelected { return .white }
            if isCorrect { return .green }
            if isSelected { return .red }
            return .white.opacity(0.4)
        }()
        let bgColor: Color = {
            if !hasSelected { return Color.white.opacity(0.04) }
            if isCorrect { return Color.green.opacity(0.1) }
            if isSelected { return Color.red.opacity(0.1) }
            return Color.clear
        }()

        return Button {
            if selected == nil { selected = i; if !isDone { onComplete() } }
        } label: {
            HStack {
                Text(q.options[i])
                    .font(.system(size: 12, weight: isSelected ? .bold : .regular))
                    .foregroundColor(textColor)
                Spacer()
                if hasSelected {
                    if isCorrect { Image(systemName: "checkmark.circle.fill").foregroundColor(.green) }
                    else if isSelected { Image(systemName: "xmark.circle.fill").foregroundColor(.red) }
                }
            }
            .padding(10)
            .background(RoundedRectangle(cornerRadius: 8).fill(bgColor))
        }
    }

    private var feedbackBlock: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(currentQuestion.explanation)
                .font(.system(size: 12)).foregroundColor(.white.opacity(0.65)).lineSpacing(3)
                .padding(10).background(RoundedRectangle(cornerRadius: 8).fill(accent.opacity(0.08)))
            if index < questions.count - 1 {
                Button { index += 1; selected = nil } label: {
                    Text("NEXT →").font(.system(size: 12, weight: .bold)).foregroundColor(accent)
                        .frame(maxWidth: .infinity).padding(.vertical, 10)
                        .background(accent.opacity(0.1)).clipShape(RoundedRectangle(cornerRadius: 8))
                }
            } else {
                Text("✓ Audit complete.").font(.system(size: 12, weight: .bold)).foregroundColor(.green)
            }
        }
    }
}

struct GovTimelineDrill: View {
    let accent: Color; let isDone: Bool; let onComplete: () -> Void
    @State private var submitted = false

    let events: [(year: String, event: String)] = [
        ("1956", "COINTELPRO launched — FBI begins domestic counterintelligence program"),
        ("1964", "FBI sends anonymous suicide letter to Martin Luther King Jr."),
        ("1971", "Citizens break into Media PA FBI office, leak COINTELPRO documents"),
        ("1975", "Church Committee hearings — congressional investigation of intelligence abuses"),
        ("1977", "Bernstein publishes CIA and the Media — Operation Mockingbird exposed"),
        ("2013", "Snowden revelations — NSA bulk collection of American communications"),
        ("2018", "Senate Intel Committee releases findings on Russian IRA operations"),
    ]

    var body: some View {
        VStack(alignment: .leading, spacing: 14) {
            HStack {
                Image(systemName: "scroll.fill").foregroundColor(accent)
                Text("DRILL: OPERATION TIMELINE").font(.system(size: 12, weight: .black)).tracking(2).foregroundColor(accent)
                Spacer()
                if isDone || submitted { Text("✓ +5").font(.system(size: 11, weight: .bold)).foregroundColor(.green) }
            }
            Text("Every entry below is documented historical fact. Read and note which one surprises you most.").font(.system(size: 12)).foregroundColor(.white.opacity(0.6))
            ForEach(events, id: \.year) { e in
                HStack(alignment: .top, spacing: 12) {
                    Text(e.year).font(.system(size: 11, weight: .black)).foregroundColor(accent).frame(width: 38, alignment: .leading)
                    Rectangle().fill(accent.opacity(0.3)).frame(width: 1)
                    Text(e.event).font(.system(size: 12)).foregroundColor(.white.opacity(0.8)).fixedSize(horizontal: false, vertical: true)
                }
            }
            if !submitted {
                Button {
                    submitted = true
                    if !isDone { onComplete() }
                } label: {
                    Text("I'VE READ THE TIMELINE")
                        .font(.system(size: 12, weight: .black)).tracking(1).foregroundColor(.black)
                        .frame(maxWidth: .infinity).padding(.vertical, 11).background(accent).clipShape(RoundedRectangle(cornerRadius: 10))
                }
            } else {
                Text("These operations were approved at the highest levels of government, ran for years, and only became public through leaks and congressional investigation. The question is not whether this happened. It's what the pattern tells you about what may be operating now.").font(.system(size: 12)).foregroundColor(.white.opacity(0.6)).lineSpacing(3)
                    .padding(10).background(RoundedRectangle(cornerRadius: 8).fill(accent.opacity(0.08)))
            }
        }
        .padding(16)
        .background(RoundedRectangle(cornerRadius: 14).fill(Color.white.opacity(0.04))
            .overlay(RoundedRectangle(cornerRadius: 14).stroke(accent.opacity(0.3), lineWidth: 1)))
    }
}

struct GovDivisionMapDrill: View {
    let accent: Color; let isDone: Bool; let onComplete: () -> Void
    @State private var selected: Set<Int> = []
    @State private var submitted = false

    let dividers = [
        "Race / ethnicity", "Political party affiliation", "Immigration status",
        "Religious belief", "Economic class", "Urban vs rural geography",
        "Gun ownership", "Vaccine status", "Sexual orientation / gender identity"
    ]
    let distractors = [
        "What unites these groups economically?",
        "Who benefits from keeping them fighting?"
    ]

    var body: some View {
        VStack(alignment: .leading, spacing: 14) {
            divisionHeader
            Text("Check every division that is actively amplified in your country's current media/political discourse:").font(.system(size: 12)).foregroundColor(.white.opacity(0.6))
            divisionList
            if !submitted { analyzeButton } else { divisionResult }
        }
        .padding(16)
        .background(RoundedRectangle(cornerRadius: 14).fill(Color.white.opacity(0.04))
            .overlay(RoundedRectangle(cornerRadius: 14).stroke(accent.opacity(0.3), lineWidth: 1)))
    }

    private var divisionHeader: some View {
        HStack {
            Image(systemName: "person.2.slash").foregroundColor(accent)
            Text("DRILL: DIVISION MAP").font(.system(size: 12, weight: .black)).tracking(2).foregroundColor(accent)
            Spacer()
            if isDone || submitted { Text("✓ +5").font(.system(size: 11, weight: .bold)).foregroundColor(.green) }
        }
    }

    private var divisionList: some View {
        ForEach(0..<dividers.count, id: \.self) { i in
            dividerRow(i)
        }
    }

    private func dividerRow(_ i: Int) -> some View {
        let isSelected = selected.contains(i)
        return Button {
            if isSelected { selected.remove(i) } else { selected.insert(i) }
        } label: {
            HStack {
                Image(systemName: isSelected ? "checkmark.square.fill" : "square")
                    .foregroundColor(isSelected ? accent : .white.opacity(0.3))
                Text(dividers[i]).font(.system(size: 13)).foregroundColor(.white.opacity(0.8))
                Spacer()
            }
        }.disabled(submitted)
    }

    private var analyzeButton: some View {
        Button {
            submitted = true
            if !isDone { onComplete() }
        } label: {
            Text("ANALYZE (\(selected.count) selected)")
                .font(.system(size: 12, weight: .black)).tracking(1).foregroundColor(.black)
                .frame(maxWidth: .infinity).padding(.vertical, 11).background(accent).clipShape(RoundedRectangle(cornerRadius: 10))
        }
    }

    private var divisionResult: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("You identified \(selected.count) active divisions.").font(.system(size: 13, weight: .bold)).foregroundColor(.white)
            Text("Now the real questions:").font(.system(size: 12, weight: .bold)).foregroundColor(accent)
            ForEach(distractors, id: \.self) { d in
                HStack(alignment: .top, spacing: 8) {
                    Text("→").foregroundColor(accent)
                    Text(d).font(.system(size: 13)).foregroundColor(.white.opacity(0.8))
                }
            }
            Text("Every division you checked costs someone money to amplify. That cost is an investment. The return on investment is your attention, your vote, or your inability to coordinate with someone on your side of a real economic issue.")
                .font(.system(size: 12)).foregroundColor(.white.opacity(0.6)).lineSpacing(3)
        }
        .padding(12).background(RoundedRectangle(cornerRadius: 10).fill(accent.opacity(0.06)))
    }
}

struct GovUnityPlanDrill: View {
    let accent: Color; let isDone: Bool; let onComplete: () -> Void
    @State private var step = 0
    @State private var committed = false

    let steps = [
        ("Name one group you politically oppose", "Not demonize — just name them clearly."),
        ("Name one concrete shared material interest", "Not a value. A specific policy outcome you both might want."),
        ("Name one person from that group you could talk to", "An actual person, not a hypothetical."),
        ("Name one concrete first step", "One action you could take in the next 7 days."),
    ]

    var body: some View {
        VStack(alignment: .leading, spacing: 14) {
            HStack {
                Image(systemName: "person.3.fill").foregroundColor(accent)
                Text("DRILL: UNITY PLAN").font(.system(size: 12, weight: .black)).tracking(2).foregroundColor(accent)
                Spacer()
                if isDone || committed { Text("✓ +5").font(.system(size: 11, weight: .bold)).foregroundColor(.green) }
            }
            Text("The counter to division operations is concrete coalition. This drill builds one small piece of it.").font(.system(size: 12)).foregroundColor(.white.opacity(0.6))
            ForEach(0..<steps.count, id: \.self) { i in
                HStack(alignment: .top, spacing: 12) {
                    ZStack {
                        Circle().fill(i <= step ? accent : Color.white.opacity(0.08)).frame(width: 28, height: 28)
                        if i < step {
                            Image(systemName: "checkmark").font(.system(size: 11, weight: .bold)).foregroundColor(.black)
                        } else {
                            Text("\(i+1)").font(.system(size: 12, weight: .bold)).foregroundColor(i == step ? .black : .white.opacity(0.3))
                        }
                    }
                    VStack(alignment: .leading, spacing: 3) {
                        Text(steps[i].0).font(.system(size: 13, weight: .bold)).foregroundColor(i <= step ? .white : .white.opacity(0.3))
                        Text(steps[i].1).font(.system(size: 11)).foregroundColor(i <= step ? .white.opacity(0.5) : .white.opacity(0.2))
                    }
                }
                .opacity(i <= step ? 1.0 : 0.5)
            }
            if !committed {
                Button {
                    if step < steps.count - 1 { step += 1 }
                    else { committed = true; if !isDone { onComplete() } }
                } label: {
                    Text(step < steps.count - 1 ? "NEXT STEP →" : "COMMIT TO THIS PLAN")
                        .font(.system(size: 12, weight: .black)).tracking(1).foregroundColor(.black)
                        .frame(maxWidth: .infinity).padding(.vertical, 11).background(accent).clipShape(RoundedRectangle(cornerRadius: 10))
                }
            } else {
                Text("✓ You now have a concrete unity plan. The operation requires you to never build this. You just did.").font(.system(size: 12, weight: .bold)).foregroundColor(.green).lineSpacing(3)
            }
        }
        .padding(16)
        .background(RoundedRectangle(cornerRadius: 14).fill(Color.white.opacity(0.04))
            .overlay(RoundedRectangle(cornerRadius: 14).stroke(accent.opacity(0.3), lineWidth: 1)))
    }
}

// MARK: - Body Renderer

struct GovBodyRenderer: View {
    let text: String; let accent: Color

    enum GBRKind { case heading, quote, arrow, reflection, body, divider }
    struct GBRBlock: Identifiable { let id = UUID(); let kind: GBRKind; let content: String }

    var body: some View {
        VStack(alignment: .leading, spacing: 14) {
            ForEach(parseBlocks()) { block in blockView(block) }
        }
    }

    @ViewBuilder
    private func blockView(_ block: GBRBlock) -> some View {
        switch block.kind {
        case .heading:    headingView(block.content)
        case .quote:      quoteView(block.content)
        case .arrow:      arrowView(block.content)
        case .reflection: reflectionView(block.content)
        case .body:       bodyView(block.content)
        case .divider:    Divider().background(Color.white.opacity(0.08))
        }
    }

    private func headingView(_ t: String) -> some View {
        Text(t).font(.system(size: 15, weight: .black)).foregroundColor(accent.opacity(0.9)).padding(.top, 4)
    }
    private func quoteView(_ t: String) -> some View {
        HStack(spacing: 0) {
            Rectangle().fill(accent).frame(width: 3)
            Text(t).font(.system(size: 13)).foregroundColor(.white.opacity(0.75)).italic().padding(.leading, 12)
        }
    }
    private func arrowView(_ t: String) -> some View {
        HStack(alignment: .top, spacing: 8) {
            Text("→").font(.system(size: 12)).foregroundColor(accent).padding(.top, 1)
            Text(t).font(.system(size: 13)).foregroundColor(.white.opacity(0.75)).fixedSize(horizontal: false, vertical: true)
        }
    }
    private func reflectionView(_ t: String) -> some View {
        HStack(alignment: .top, spacing: 10) {
            Image(systemName: "bubble.left.fill").font(.system(size: 12)).foregroundColor(accent).padding(.top, 2)
            Text(t).font(.system(size: 13)).foregroundColor(.white.opacity(0.8)).italic().fixedSize(horizontal: false, vertical: true)
        }
        .padding(12).background(RoundedRectangle(cornerRadius: 10).fill(accent.opacity(0.06))
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(accent.opacity(0.2), lineWidth: 1)))
    }
    private func bodyView(_ t: String) -> some View {
        Text(t).font(.system(size: 14)).foregroundColor(.white.opacity(0.8)).lineSpacing(5).fixedSize(horizontal: false, vertical: true)
    }

    private func parseBlocks() -> [GBRBlock] {
        text.components(separatedBy: "\n").map { $0.trimmingCharacters(in: .whitespaces) }.compactMap { line -> GBRBlock? in
            if line.isEmpty { return nil }
            if line == "---" { return GBRBlock(kind: .divider, content: "") }
            if line.hasPrefix("**") && line.hasSuffix("**") { return GBRBlock(kind: .heading, content: line.replacingOccurrences(of: "**", with: "")) }
            if line.hasPrefix("*") && line.hasSuffix("*") { return GBRBlock(kind: .quote, content: line.replacingOccurrences(of: "*", with: "")) }
            if line.hasPrefix("→ ") { return GBRBlock(kind: .arrow, content: String(line.dropFirst(2))) }
            if line.hasPrefix("> ") { return GBRBlock(kind: .reflection, content: String(line.dropFirst(2))) }
            return GBRBlock(kind: .body, content: line.replacingOccurrences(of: "**", with: ""))
        }
    }
}
