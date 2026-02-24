// ThothHiddenTeachingsCourse.swift
// SunFlow: Reignited — Aperture
// "Thoth's Hidden Teachings" — Consciousness, manifestation, and the hermetic path

import SwiftUI

// MARK: - Data Model

struct THiddenLesson: Identifiable {
    let id: String
    let number: Int
    let title: String
    let icon: String
    let tagline: String
    let readTime: Int
    let body: String
}

struct THiddenProgress: Codable {
    var completedLessons: Set<String> = []
    mutating func complete(_ id: String) { completedLessons.insert(id) }
    func isComplete(_ id: String) -> Bool { completedLessons.contains(id) }
    func save() { try? UserDefaults.standard.set(JSONEncoder().encode(self), forKey: "thoth_progress") }
    static func load() -> THiddenProgress {
        guard let data = UserDefaults.standard.data(forKey: "thoth_progress"),
              let p = try? JSONDecoder().decode(THiddenProgress.self, from: data) else { return THiddenProgress() }
        return p
    }
}

// MARK: - Lessons

let thothHiddenLessons: [THiddenLesson] = [

    THiddenLesson(
        id: "th_01",
        number: 1,
        title: "Consciousness Is the Fabric — Not the Product",
        icon: "eye.fill",
        tagline: "Modern manifestation culture has the fundamental principle backwards.",
        readTime: 7,
        body: """
**The Single Inversion That Explains Everything**

Modern science tells you consciousness is produced by the brain — a byproduct of neural activity happening inside your skull. An effect, not a cause. Something that emerges *from* matter.

Thoth understood the opposite, and it changes everything:

Consciousness is the fundamental fabric from which everything else emerges. Matter, energy, time, space — these are all *expressions* of consciousness, not the other way around.

This isn't just ancient philosophy. Examine your direct experience carefully: you never actually encounter matter independent of consciousness. Every sensation, every thought, every perception happens *within* awareness. You've never experienced a world outside of consciousness. Yet we've been conditioned to believe consciousness is the secondary phenomenon.

**As Above, So Below — Made Practical**

Thoth's teaching *"as above, so below"* is frequently quoted and almost never correctly understood. It isn't mystical poetry. It's a precise observation: the outer world is literally a mirror of inner consciousness states.

Jessica, the Damascus merchant described in Thothian accounts, discovered this the hard way. She approached the texts expecting techniques to manifest gold for her trading business. What she found instead fundamentally restructured her understanding of causation.

She had been trying to change her reflection by manipulating the mirror.

When she stopped trying to use her mind to manipulate external circumstances and started recognizing that her external circumstances were *already* a perfect reflection of her internal consciousness state — the external circumstances began shifting without direct effort.

**Why Most Manifestation Attempts Fail**

The catastrophic failure mode of modern manifestation culture:

People try to create abundance while operating from a consciousness of lack. They visualize wealth while feeling poor. They affirm love while experiencing deep unworthiness. They attempt to manifest connection while internally isolated.

This is the core error. You cannot transmit one signal while broadcasting another. The consciousness state you're *in* always overrides the intention you're *thinking*.

**The Roman Scholar**

A Roman scholar sought Thoth's writings during the height of the empire. He desperately wanted to manifest political influence. He found the fragments. Performed the rituals. Spoke the incantations. Nothing materialized.

Years later, after losing everything and spending time in genuine self-reflection, he encountered the same text again. This time, instead of seeking power over others, he sought understanding of his own nature. The text revealed entirely different layers of meaning. Synchronicities began flowing effortlessly.

The difference wasn't in the text or techniques. The difference was in his state of consciousness when approaching them.

**Reflection**
> What are you currently trying to manifest through external effort that might be a mirror of an internal consciousness state? What would change if you addressed the internal state first?
"""
    ),

    THiddenLesson(
        id: "th_02",
        number: 2,
        title: "The Unified Field of Consciousness",
        icon: "sparkles",
        tagline: "Why individual and universal awareness are the same fundamental reality.",
        readTime: 8,
        body: """
**The Recognition That Changes Everything**

Thoth's most advanced teaching: individual consciousness and universal consciousness are not separate phenomena. What we experience as personal awareness is actually infinite consciousness expressing through a unique focal point.

Think about how a single light passing through a prism creates a spectrum of different colors. Each color appears distinct and separate. Yet they're all expressions of the same light. Similarly, what appears as your individual consciousness is universal consciousness refracting through the prism of your particular nervous system, life experiences, and configuration.

**Soul Requirements vs. Ego Desires**

When you're aligned with the understanding of unified consciousness, manifestation becomes as natural as breathing. Because you're no longer trying to *get* something from outside yourself — you're allowing what already exists in consciousness to take form.

But Thoth drew a sharp distinction between two categories of desire:

**Ego-driven desires** arise from the illusion of separation — from the belief that you are a separate individual who must compete for and extract resources from an external world. These desires are typically for security, validation, or control.

**Soul requirements** arise from your deepest authentic nature. They feel different — less desperate, more inevitable. Like something your entire being is organized around, rather than something you want.

Ego-driven manifestation often backfires because it's based on the foundational error of separation. Soul-aligned creation flows effortlessly because it recognizes that consciousness is already whole and complete, simply allowing different aspects of itself to emerge.

**Three Signs You're in the Right Consciousness State**

Thoth described these unmistakable indicators:

→ **You feel complete before receiving anything.** No desperate grasping. No attachment to outcomes. You would genuinely be okay with or without the thing you're intending.

→ **You experience genuine gratitude in advance** — not as a technique, but as a natural response to recognizing what's already present in the field.

→ **Your desires feel completely natural and obvious**, like water flowing downhill rather than water being forced uphill by a pump.

**The Lottery Winner Problem — The Thothian Explanation**

Consider why lottery winners so frequently lose everything within a few years. External circumstances changed dramatically. The internal consciousness state did not.

The universe — operating as a perfect mirror of consciousness — cannot sustain a mismatch between the inner and outer worlds. It experiences the mismatch as an error. It corrects the error by bringing external circumstances back into alignment with the internal state.

This isn't punishment. It isn't spiritual revenge. It's simply how the mirror operates.

**Reflection**
> In your current life, where do you experience ego-driven desires (grasping, desperate, attached to specific outcomes) versus soul requirements (inevitable, complete, flowing naturally)? What's different about how those two categories feel in your body?
"""
    ),

    THiddenLesson(
        id: "th_03",
        number: 3,
        title: "The Four Stages of Readiness",
        icon: "chart.line.uptrend.xyaxis",
        tagline: "Consciousness cannot be forced into higher states. Thoth identified exactly why.",
        readTime: 9,
        body: """
**The Law of Spiritual Readiness**

Brandon the blacksmith spent years wrestling molten metal into shapes by force. His pieces were functional but lifeless. Then he watched molten metal flow naturally into a mold, and realized he had been fighting the very essence of what he was trying to create.

The metal wanted to flow into its perfect form. He just needed to create the right conditions and get out of the way.

Thoth encoded this same principle into every genuine spiritual teaching: consciousness cannot be forced into higher states anymore than Brandon could force metal into beauty. Every attempt to rush, push, or artificially accelerate spiritual growth creates resistance within the psyche itself. You destroy what you're trying to nurture.

**The Four Stages**

Thoth identified four specific stages that consciousness moves through as it becomes ready for deeper truth. These cannot be hacked, rushed, or bypassed without creating what the Hermetic texts call *spiritual imbalance* — access to experiences or insights you're not developmentally ready to integrate.

**Stage 1 — Dissolution of Ego Attachments**

Not destruction of the ego. Not detachment as a spiritual performance. The gradual recognition that your identity isn't actually built from your achievements, your roles, or your spiritual experiences.

Most people try to force this stage by adopting spiritual identities or practices that make them feel above ordinary human concerns. This is forced detachment — which is just another form of ego protection disguised as wisdom.

True dissolution happens when life itself shows you where you're still clinging to false identities. You can't accelerate it. You can only stop fighting it when it arrives.

**Stage 2 — Development of Genuine Humility**

Not self-deprecation. Not the spiritual humility that's really just pride in disguise. Something more profound: the recognition that consciousness itself is far vaster and more mysterious than anything your individual mind can grasp.

This kind of humility can't be cultivated through affirmation. It emerges naturally when you've had enough genuine encounters with the mystery to recognize how little you actually know. The difference between intellectual understanding and lived wisdom.

**Stage 3 — Cultivation of Inner Stillness**

Not the temporary quiet of a meditation session. A fundamental shift in how consciousness relates to its own movement.

Michelle the astronomer strained with increasingly powerful telescopes, trying to see what couldn't be seen that way. Only when she stopped forcing her physical eyes to perceive what required different faculties — only when she stopped forcing the stillness — could she perceive with what the mystics call the eye of the heart.

Her breakthrough came not from trying harder, but from learning to receive what was already being offered.

**Stage 4 — Capacity to Receive Without Grasping**

The ability to be open to spiritual insight, guidance, or experience without immediately trying to possess it, understand it, or use it to enhance your spiritual identity.

This is where modern spiritual seeking most consistently fails. People read about enlightenment and immediately want to recreate the experience. They develop elaborate practices to achieve specific states. They hear about spiritual gifts and wonder why they haven't manifested in their own lives.

This is grasping disguised as seeking. And it blocks exactly what it's reaching for.

**Spiritual Ambition vs. Spiritual Aspiration**

Spiritual ambition is ego-driven. It wants experiences to enhance self-image or escape ordinary challenges.

Spiritual aspiration comes from a deeper place — the soul's natural movement toward greater wholeness. You can tell the difference by the quality of your seeking:

Are you seeking to *become* someone special? That's ambition.
Are you moving toward truth because you genuinely can't not? That's aspiration.

Authentic aspiration feels like a plant growing toward light — natural, gradual, in harmony with actual life circumstances. It doesn't try to escape your humanity. It brings greater consciousness to it.

**Reflection**
> Which of the four stages feels most active in your current life? Where do you notice the impulse to rush or force your development?
"""
    ),

    THiddenLesson(
        id: "th_04",
        number: 4,
        title: "Surrender as the Most Advanced Power",
        icon: "water.waves",
        tagline: "Thoth's most counterintuitive teaching — and the one the ego most resists.",
        readTime: 8,
        body: """
**The Paradox at the Heart of Thothian Power**

The master blacksmith Kenty finally laid down his hammer after years of trying to dominate metal through force. He watched. He noticed how the metal wanted to flow, where it naturally bent, how it responded to gentle heat rather than brutal force.

When he worked *with* the metal's inherent nature instead of against it, the resulting alloy was stronger than anything he'd ever created through force alone.

*"The metal didn't transform because of what I did. It transformed because of what I became."*

Thoth taught that true power emerges not from control, but from complete alignment with universal forces through surrender. And before you dismiss this as passive weakness — Thoth's concept of surrender represents the most sophisticated form of power dynamics ever conceived.

**Why Forcing Creates the Opposite**

Think about trying to remember someone's name. The harder you strain, the more elusive it becomes. The moment you stop trying and turn your attention elsewhere, the name surfaces effortlessly.

Thoth understood this on a cosmic scale. The ego's frantic attempts to control outcomes actually create the very resistance that blocks those outcomes from manifesting. The consciousness frequency that matches what you seek to manifest cannot be achieved through force. It emerges naturally when you stop fighting the current of universal intelligence and allow it to flow through you instead.

**The Four Types of Surrender**

**Type 1 — Surrender of Outcomes**
Trusting the process even when you can't see the destination. This doesn't mean abandoning your desires — it means holding them lightly enough that you remain open to something even better than what your limited perspective could imagine.

**Type 2 — Surrender of Timing**
The most powerful manifestations often require periods of invisible preparation your surface mind cannot perceive. Seeds don't grow faster when you dig them up to check their progress. Timothy Walker's healing practice showed consistently that patients who surrendered attachment to predetermined timelines recovered in ways that surprised even Walker himself.

**Type 3 — Surrender of Methods**
Your ego wants to control not just what happens, but exactly how it happens. This creates tunnel vision that blinds you to the infinite pathways through which what you need might arrive. The most extraordinary opportunities in life frequently arrive disguised as problems, setbacks, or completely unexpected detours.

**Type 4 — Surrender of Identity**
The most profound. Releasing attachment to who you think you should be.

The ego believes your constructed identity is keeping you safe. Thoth taught that this false self is actually a prison that prevents you from accessing your true capabilities. When you stop defending a limited version of yourself, you create space for authentic power to emerge.

**This Is Not Passivity**

This is where almost everyone misunderstands surrender completely. They equate it with resignation or giving up. Nothing could be further from Thoth's meaning.

True surrender is the most powerful action you can take because it aligns your personal will with cosmic will. Instead of swimming against the current, you learn to navigate with such skill that the river's power becomes your own.

The athlete who performs best when they stop trying so hard. The artist whose greatest works emerge when they get out of their own way. The leader whose quiet confidence moves mountains while others exhaust themselves shouting.

**Practical Entry Point**

Notice where you're gripping too tightly in your daily life. A conversation you're trying to control. A solution you're forcing. A timeline you're demanding.

What happens when you consciously relax that grip while maintaining clear intention about what you truly want?

**Reflection**
> Where in your life are you swimming against the current right now? What would it mean to surrender the method while holding the intention?
"""
    ),

    THiddenLesson(
        id: "th_05",
        number: 5,
        title: "Inner Vision: Seeing the Causal Layer",
        icon: "eye.trianglebadge.exclamationmark",
        tagline: "Physical sight shows only effects. Inner vision reveals causes.",
        readTime: 8,
        body: """
**The Astronomer and the Star**

Michelle Campbell spent months with her telescope, mapping constellations, calculating planetary movements, analyzing every speck of light in the sky. Nothing.

After months of surrender-based practice, she looked up at the same patch of sky she'd examined hundreds of times. There it was — brilliant, unmistakable, exactly where the ancient texts said it would be.

When she rushed to show her astronomy colleagues through the same telescope, pointing to exact coordinates, they saw nothing but empty space.

This wasn't hallucination. Michelle had encountered one of Thoth's most profound teachings about perception: **physical sight shows us only effects — the end results of deeper causes. Inner vision reveals the causal realm where true understanding becomes possible.**

**The Mirror Problem**

Most human suffering, according to Thothian wisdom, stems from a single fundamental misunderstanding: we see someone's angry behavior and try to change their actions. We see financial problems and focus only on increasing income. We see relationship conflict and attempt to modify external dynamics.

You're trying to change a movie by manipulating the images on the screen instead of addressing what's happening in the projector.

Inner vision transforms this entire approach. Instead of reacting to someone's personality or defensive behaviors, you begin to perceive the fear or pain underneath that's driving their actions. Instead of fighting financial circumstances, you perceive the consciousness pattern generating them.

**Developing Inner Vision**

Thoth was precise about distinguishing between ego-driven psychic phenomena and authentic spiritual vision. Psychic abilities often serve personal desires or the need to feel special. True inner vision serves universal purpose — it reveals what needs to be understood for genuine healing and growth.

Developing this doesn't require special gifts. It requires specific practices that quiet the analytical mind's constant interpretation:

**Contemplative Gazing:** Select a natural object — a flame, a stone, a plant. Look at it with soft, receptive attention. You're not trying to see anything special. You're allowing your perception to become more fluid, less rigid in its interpretations. After weeks of this practice, many students report that objects begin to reveal deeper layers of meaning.

**Soft Focus in Conversation:** When speaking with someone, practice expanding your attention beyond their words to what's underneath — the emotional current, the unspoken need, the soul-level context. Without analysis. Just reception.

**Signs of Authentic Inner Vision**

Thoth outlined how to distinguish genuine inner vision from projection or wishful thinking:

→ It reveals information that serves healing or understanding — not information that flatters your ego or confirms what you already believe.
→ It often contradicts your personal preferences or expectations.
→ It brings a sense of recognition rather than surprise — as if you're remembering something you already knew at a deeper level.

**The Practical Transformation**

In daily life, inner vision changes everything about how you navigate relationships and challenges. You respond from a place of understanding that addresses root causes instead of surface symptoms.

A conflict with a coworker might reveal itself as an opportunity to heal an ancient wound related to personal power. A financial challenge might be your soul's way of teaching you about trust and abundance consciousness.

The key is learning to trust what you perceive beyond the obvious — while maintaining discernment about when and how to act on these deeper insights.

**Reflection**
> In a current conflict or challenge in your life, what might be the deeper cause beneath the surface behavior? What would change about how you're engaging with it if you addressed that layer?
"""
    ),

    THiddenLesson(
        id: "th_06",
        number: 6,
        title: "Divine Timing: Working with Cosmic Rhythm",
        icon: "moon.stars.fill",
        tagline: "Time is cyclical, not linear. And fighting the cycle is the primary cause of exhaustion.",
        readTime: 8,
        body: """
**Rachel and the Tapestry**

Rachel Phillips spent years forcing specific patterns into her tapestries, fighting the natural flow of threads, becoming increasingly frustrated as her work grew tangled and chaotic.

The moment she surrendered to the rhythm of the weaving itself — allowing each thread to find its proper place in its own time — the most extraordinary patterns began to emerge. Patterns that seemed to come from beyond her conscious mind.

Thoth understood this at the deepest level: the universe operates according to perfect timing and natural rhythms that simply cannot be rushed or forced. And most modern suffering stems from fighting those rhythms.

**The Cycles Thoth Identified**

**Daily Cycles:** Your brain naturally moves through different frequencies throughout the day. Early morning hours just after waking often provide access to theta states — ideal for creative visualization and intuitive insights. Late evening brings another theta window. Yet most people schedule their most demanding mental work during these naturally receptive periods.

**Lunar Cycles:** Thoth understood lunar rhythms as powerful influences on emotional and intuitive processes:
→ New Moon — setting intentions, beginning new projects
→ Waxing Moon — building energy, taking action
→ Full Moon — heightened sensitivity, revelation, breakthroughs
→ Waning Moon — release, completion, clearing

**Seasonal Cycles:** Spring supports new beginnings. Summer brings expansion and active development. Autumn is harvest — when projects naturally come to fruition. Winter calls for rest, planning, and inner work. Fighting seasonal rhythms is like planting tomatoes in December — technically possible with enough intervention, but unnecessarily difficult and unsustainable.

**Karma of Forcing — The Spiritual Imbalance**

Thoth identified what happens when you push too hard too fast: you create tension in the natural flow of energy. This tension must eventually resolve — often through difficult experiences that force you to slow down and realign.

The pattern: someone discovers meditation or energy work, immediately tries to achieve enlightenment in six months, pushes through intensive practices, has some dramatic experiences... then crashes. Burns out. Becomes disillusioned. Or worse: develops spiritual ego because they've gained some abilities without the wisdom to use them properly.

**Distinguishing Procrastination from Divine Timing**

This is crucial and often misunderstood. There is a real difference between:

**Procrastination** — avoidance rooted in fear or resistance. Feels anxious, guilty, heavy. Creates mounting pressure.

**Natural timing** — genuine waiting that emerges from attunement to rhythm. Feels peaceful even while waiting. Clear internal knowing that now is not the time.

The difference is felt in the body, not thought in the mind. Fear-based delay feels constricted. Divine timing feels like a held breath before a dive — still, but ready.

**Developing Rhythm Sensitivity**

→ Notice when ideas flow easily versus when they feel forced.
→ Observe how your energy naturally fluctuates throughout day, week, and season.
→ Learn to distinguish between the two categories above — by feeling, not by reasoning.
→ Trust the process especially when progress seems invisible. Seeds germinate in darkness before they break through soil. Butterflies dissolve completely into undifferentiated cellular soup before reorganizing into their winged form.

**When Alignment Happens**

When you master alignment with divine timing, something remarkable occurs. You stop fighting the current and start surfing the waves of cosmic energy. Projects complete themselves with surprising ease. The right people appear at exactly the right moments. Opportunities open just when you're prepared to receive them.

This is what Thoth meant by working in harmony with divine timing — not passive waiting, but active participation in the eternal dance between intention and surrender, effort and flow, human will and cosmic wisdom.

**Reflection**
> Where are you currently fighting a natural rhythm? Is it a relationship, a project, a life stage? What would it look like to work with that rhythm rather than against it?
"""
    ),

    THiddenLesson(
        id: "th_07",
        number: 7,
        title: "Ego Transparency: The Power That Flows Through Emptiness",
        icon: "person.crop.circle.badge.questionmark",
        tagline: "Daniel at the temple: how the ego both seeks and blocks spiritual power.",
        readTime: 9,
        body: """
**The Temple Test**

Daniel Hayes approached the temple guardian's tests with the confidence of someone who'd finally cracked the code. Months of studying ancient texts. Intensive meditation practice. He visualized himself commanding spiritual forces, dissolving obstacles through sheer will, proving his worthiness through demonstration of accumulated abilities.

The guardian's first test crushed him completely. Every technique failed. Every visualization crumbled. The harder he pushed, the more impenetrable the barrier became.

It wasn't until his third attempt — exhausted, humbled, with nothing left to prove — that something shifted. He approached not as Daniel the seeker of power, but as simple awareness encountering mystery.

The barrier dissolved like morning mist.

**The Fundamental Paradox**

The very ego that seeks spiritual power is the primary obstacle to accessing it.

This is Thoth's foundational paradox — and it explains why so many sincere, disciplined, intelligent spiritual seekers remain stuck: they're using the very mechanism that must eventually become transparent as the tool for achieving transparency.

**Ego Is Not the Enemy**

Thoth was precise here. The ego isn't a demonic force to be destroyed. It's a sophisticated psychological tool evolved over millions of years to help consciousness navigate physical reality. Your ego helps you remember your name, maintain relationships, make decisions, and function in the world.

The problem isn't that you have an ego. It's that you've forgotten you're not your ego.

Your ego is like a character you're playing in an immersive experience. The character has a backstory, personality, preferences, fears, and ambitions — all useful for navigating the game world. But somewhere you forgot you're the player, not the character. You started believing you actually *are* this limited, separate self struggling for survival and recognition.

**The Great Inversion**

This misidentification creates what Thoth called the great inversion: instead of consciousness using ego as a tool, ego begins using consciousness as fuel for its own perpetuation. Every spiritual experience gets filtered through *"what does this mean for me?"* Every insight becomes ammunition for the ego's story about being special or advanced. Every moment of peace gets claimed as "my achievement" rather than recognized as the natural state temporarily uncovered.

**The Four Stages of Ego Dissolution**

**Stage 1 — Recognition:** Becoming aware of ego patterns without immediately trying to change them. Sarah Martinez discovered her spiritual practice had become a performance — meditating to feel special, studying ancient texts to impress others, collecting experiences to build an identity as a spiritual person. Recognition is not judgment. It's developing the witness consciousness that can observe patterns with curiosity rather than condemnation.

**Stage 2 — Non-identification:** Learning to recognize that you are the space in which thoughts and emotions arise, not the thoughts and emotions themselves. Michael Chen observed anxiety and self-doubt during meditation not by fighting them or taking them personally, but like watching weather patterns move through an open sky.

**Stage 3 — Releasing the Need to Be Special:** The stage where most people get stuck. Spiritual pride is more binding than ordinary ego attachments precisely because it masquerades as wisdom. Jennifer Walsh had to confront using spiritual insights as subtle weapons — maintaining her identity as "the awakened one" by putting others down.

**Stage 4 — Natural Emergence:** Authentic self begins expressing through personality without being constrained by ego identification. Spiritual abilities and insights flow most freely when there's no separate self trying to claim credit for them. Exactly what Daniel discovered at the temple.

**Ego Transparency — Not Destruction**

Thoth wasn't teaching ego destruction but ego transparency. A transparent ego functions perfectly for practical purposes while allowing spiritual essence to shine through unobstructed.

The difference between ego-driven and soul-guided action:
→ Ego-driven practice feels effortful, competitive, results-oriented. Underlying current: *what's in this for me?*
→ Soul-guided practice feels like play — curious, open, arising without force.

True power emerges from emptiness rather than accumulation. The more space you create by releasing false identifications, the more room there is for authentic spiritual power to flow through.

**Reflection**
> Where in your spiritual or personal life are you using accumulation (experiences, insights, practices, identity) as the primary strategy? What would it mean to create space instead?
"""
    ),

    THiddenLesson(
        id: "th_08",
        number: 8,
        title: "Unity Consciousness: The Ultimate Teaching",
        icon: "infinity",
        tagline: "Not the end of individuality — the beginning of authentic expression.",
        readTime: 9,
        body: """
**Steven's Tuesday Morning**

Steven Phillips had studied Thoth's teachings for fifteen years. He'd mastered the Hermetic principles, learned to work with consciousness frequencies, dissolved layers of ego identification. He could access profound meditation states and manifest specific experiences.

But something still felt incomplete.

The breakthrough came during what seemed like an ordinary Tuesday morning. Sitting in his garden, frustrated because a major life situation wasn't unfolding according to his carefully crafted intentions. He'd applied every technique. Aligned his frequency perfectly. The universe seemed to be ignoring his requests entirely.

In that moment of complete surrender, something shifted. The desperate need to control dissolved. And suddenly Steven realized he wasn't separate from the intelligence orchestrating everything around him.

*"I don't need to convince the universe to cooperate with me. Because I am the universe experiencing what it's like to be Steven."*

**The Recognition**

Unity consciousness is not a philosophical concept. It's a lived recognition that transforms everything about how you experience existence.

Thoth taught that the entire journey of spiritual evolution leads to one fundamental understanding: individual consciousness and universal consciousness are not separate phenomena. What we experience as personal awareness is actually infinite consciousness expressing through a unique focal point.

The sense of separation isn't a problem to be solved. It's a temporary perspective that allows the one consciousness to experience itself from countless angles simultaneously.

**What Unity Consciousness Actually Means for Daily Life**

This is where people most often get it wrong — concluding that recognizing oneness means losing individuality or becoming passive. Thoth taught the exact opposite.

True individuality *emerges more clearly* when you stop defending false personality constructs and allow authentic essence to express freely. Like a master musician: understanding that they're part of the larger symphony of music doesn't erase their unique style. Recognizing their connection to universal principles of harmony allows their individual expression to become more authentic and powerful.

**In Relationships**

Sarah Chen, in a difficult conversation with her teenage daughter, suddenly recognized her daughter as consciousness exploring what it's like to be a rebellious 16-year-old — while she herself was consciousness experiencing motherhood. The shift was immediate. Defensive barriers dissolved. What had been a power struggle became a dance of mutual understanding.

When you truly understand unity consciousness, you can't help but treat others as extensions of yourself — because at the deepest level, they are.

**In Manifestation**

Manifestation transforms completely. Instead of trying to *get* things from the universe, it becomes the natural expression of what consciousness wants to experience through your particular form. You're not manipulating external forces. You're allowing the creative intelligence that you actually are to express more freely through your life circumstances.

**The Practice**

Unity consciousness starts with moments of recognition throughout ordinary daily activities.

→ Washing dishes: instead of seeing yourself as separate from the water, soap, and plates — recognize the seamless flow of awareness moving through the entire experience.
→ In conversation: notice the one intelligence speaking through multiple voices.
→ During meditation: not trying to achieve special states, but resting in the awareness that's already present — the consciousness already aware of all your experiences, including the desire for enlightenment itself.

**The Culmination of All Hermetic Principles**

— The Principle of Mentalism reveals that everything is mind — and mind is what you are.
— The Principle of Correspondence shows the unity between inner and outer — because there's ultimately no boundary between them.
— The Principle of Vibration demonstrates that all frequencies are variations of one fundamental energy: consciousness itself.

Unity consciousness doesn't eliminate the relative world of form and experience. It transforms your relationship to that world from struggle to dance, from resistance to flow, from separation to love.

The goal was never spiritual powers or esoteric knowledge. Every technique, every principle, every practice was designed to support one fundamental remembering: **you are individualized infinite consciousness temporarily experiencing what it's like to be human.**

When you truly understand this, spiritual seeking transforms into spiritual being.

**Reflection**
> In this moment, can you recognize the awareness that's observing these words? That awareness — the one reading this — is it located in a specific place? Does it have a boundary? That borderless, location-free awareness is what Thoth was pointing to.
"""
    )
]

// MARK: - Hub View

struct ThothHiddenTeachingsCourseView: View {
    @Environment(\.dismiss) var dismiss
    @State private var progress = THiddenProgress.load()
    @State private var selectedLesson: THiddenLesson?
    @State private var showLesson = false

    private let accent = Color(hex: "#64B5F6")     // celestial blue
    private let gold   = Color(hex: "#FFD700")
    private let bg     = Color(red: 0.02, green: 0.02, blue: 0.06)

    var body: some View {
        NavigationStack {
            ZStack {
                bg.ignoresSafeArea()
                cosmicCanvas

                ScrollView(showsIndicators: false) {
                    VStack(spacing: 22) {
                        heroHeader
                        progressCard
                        lessonsGrid
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
                    Text("🔮 Thoth's Hidden Teachings").font(.system(size: 15, weight: .bold)).foregroundColor(.white)
                }
            }
            .fullScreenCover(isPresented: $showLesson) {
                if let lesson = selectedLesson {
                    THiddenLessonView(lesson: lesson, accent: accent, progress: $progress)
                }
            }
        }
    }

    private var cosmicCanvas: some View {
        Canvas { ctx, size in
            let symbols = ["𓂀", "𓆙", "𓉐", "∞", "◈", "·", "○", "◇"]
            var rng = SystemRandomNumberGenerator()
            for _ in 0..<50 {
                let x = Double.random(in: 0...size.width, using: &rng)
                let y = Double.random(in: 0...size.height, using: &rng)
                let sym = symbols[Int.random(in: 0..<symbols.count, using: &rng)]
                ctx.opacity = Double.random(in: 0.03...0.12, using: &rng)
                ctx.draw(Text(sym).font(.system(size: CGFloat.random(in: 10...22, using: &rng))).foregroundColor(accent),
                         at: CGPoint(x: x, y: y))
            }
        }
        .ignoresSafeArea()
        .allowsHitTesting(false)
    }

    private var heroHeader: some View {
        VStack(spacing: 14) {
            Spacer().frame(height: 8)
            ZStack {
                Circle().fill(accent.opacity(0.08)).frame(width: 130, height: 130)
                Circle().fill(accent.opacity(0.04)).frame(width: 160, height: 160)
                VStack(spacing: 4) {
                    Text("𓂀").font(.system(size: 48))
                }
            }
            VStack(spacing: 6) {
                Text("THOTH'S HIDDEN TEACHINGS").font(.system(size: 9, weight: .black)).tracking(3).foregroundColor(accent.opacity(0.6))
                Text("Consciousness, Manifestation\n& The Hermetic Path").font(.system(size: 22, weight: .black)).foregroundColor(.white).multilineTextAlignment(.center)
                Text("8 lessons · Unity consciousness · The Emerald Tablets decoded")
                    .font(.system(size: 11)).foregroundColor(.white.opacity(0.35)).multilineTextAlignment(.center)
            }
        }
    }

    private var progressCard: some View {
        let done = progress.completedLessons.count
        let total = thothHiddenLessons.count
        let pct = Double(done) / Double(total)
        return VStack(spacing: 8) {
            HStack {
                Text("\(done)/\(total) lessons").font(.system(size: 12, weight: .bold)).foregroundColor(.white.opacity(0.6))
                Spacer()
                Text(done == total ? "𓂀 COMPLETE" : "\(Int(pct * 100))%").font(.system(size: 11, weight: .bold)).foregroundColor(accent)
            }
            GeometryReader { geo in
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 3).fill(Color.white.opacity(0.06)).frame(height: 5)
                    RoundedRectangle(cornerRadius: 3)
                        .fill(LinearGradient(colors: [accent, gold], startPoint: .leading, endPoint: .trailing))
                        .frame(width: geo.size.width * pct, height: 5)
                }
            }
            .frame(height: 5)
        }
        .padding(14)
        .background(RoundedRectangle(cornerRadius: 12).fill(Color.white.opacity(0.04)))
    }

    private var lessonsGrid: some View {
        VStack(spacing: 10) {
            ForEach(thothHiddenLessons) { lesson in
                THiddenLessonCard(lesson: lesson, accent: accent, isCompleted: progress.isComplete(lesson.id)) {
                    selectedLesson = lesson
                    showLesson = true
                }
            }
        }
    }
}

// MARK: - Card

struct THiddenLessonCard: View {
    let lesson: THiddenLesson
    let accent: Color
    let isCompleted: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack(spacing: 14) {
                ZStack {
                    RoundedRectangle(cornerRadius: 10).fill(isCompleted ? accent.opacity(0.15) : Color.white.opacity(0.05)).frame(width: 44, height: 44)
                    if isCompleted {
                        Image(systemName: "checkmark.circle.fill").font(.system(size: 20)).foregroundColor(accent)
                    } else {
                        Image(systemName: lesson.icon).font(.system(size: 17)).foregroundColor(accent.opacity(0.7))
                    }
                }
                VStack(alignment: .leading, spacing: 3) {
                    Text("L\(lesson.number) · \(lesson.title)").font(.system(size: 13, weight: .bold)).foregroundColor(.white).lineLimit(2)
                    Text(lesson.tagline).font(.system(size: 11)).foregroundColor(.white.opacity(0.4)).lineLimit(1)
                    Text("\(lesson.readTime) min read").font(.system(size: 10)).foregroundColor(accent.opacity(0.5))
                }
                Spacer()
                Image(systemName: "chevron.right").font(.system(size: 12)).foregroundColor(.white.opacity(0.2))
            }
            .padding(14)
            .background(RoundedRectangle(cornerRadius: 14)
                .fill(isCompleted ? accent.opacity(0.05) : Color.white.opacity(0.03))
                .overlay(RoundedRectangle(cornerRadius: 14).stroke(isCompleted ? accent.opacity(0.3) : Color.white.opacity(0.06), lineWidth: 1)))
        }
    }
}

// MARK: - Reader

struct THiddenLessonView: View {
    let lesson: THiddenLesson
    let accent: Color
    @Binding var progress: THiddenProgress
    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationStack {
            ZStack {
                Color(red: 0.02, green: 0.02, blue: 0.06).ignoresSafeArea()
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 24) {
                        readerHeader
                        Divider().background(Color.white.opacity(0.08))
                        THiddenBodyRenderer(text: lesson.body, accent: accent)
                        completeButton()
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
                    Text("𓂀 Thoth's Teachings")
                        .font(.system(size: 13, weight: .semibold)).foregroundColor(.white.opacity(0.5))
                }
            }
        }
    }

    private var readerHeader: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("LESSON \(lesson.number) OF \(thothHiddenLessons.count)")
                .font(.system(size: 10, weight: .black)).tracking(3).foregroundColor(accent.opacity(0.5))
            Text(lesson.title).font(.system(size: 21, weight: .black)).foregroundColor(.white)
            Text(lesson.tagline).font(.system(size: 13)).foregroundColor(.white.opacity(0.5)).italic()
            HStack(spacing: 5) {
                Image(systemName: "clock").font(.system(size: 10))
                Text("\(lesson.readTime) min read").font(.system(size: 11))
            }
            .foregroundColor(accent.opacity(0.5))
        }
    }

    @ViewBuilder
    private func completeButton() -> some View {
        if progress.isComplete(lesson.id) {
            Button {
                progress.complete(lesson.id)
                progress.save()
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) { dismiss() }
            } label: {
                HStack {
                    Image(systemName: "checkmark.circle.fill")
                    Text("Completed").font(.system(size: 14, weight: .bold))
                }
                .foregroundColor(accent)
                .frame(maxWidth: .infinity).padding(.vertical, 14)
                .background(RoundedRectangle(cornerRadius: 14).fill(accent.opacity(0.15)))
            }
            .padding(.top, 8)
        } else {
            Button {
                progress.complete(lesson.id)
                progress.save()
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) { dismiss() }
            } label: {
                HStack {
                    Image(systemName: "checkmark.circle")
                    Text("Mark Complete & Continue").font(.system(size: 14, weight: .bold))
                }
                .foregroundColor(Color(red: 0.02, green: 0.02, blue: 0.06))
                .frame(maxWidth: .infinity).padding(.vertical, 14)
                .background(
                    LinearGradient(colors: [accent, Color(hex: "#FFD700")], startPoint: .leading, endPoint: .trailing)
                        .clipShape(RoundedRectangle(cornerRadius: 14))
                )
            }
            .padding(.top, 8)
        }
    }
}

// MARK: - Body Renderer

struct THiddenBodyRenderer: View {
    let text: String
    let accent: Color

    // Nested types scoped to this struct
    enum THBRBlockKind { case heading, quote, arrow, divider, body }
    struct THBRBlock: Identifiable { let id = UUID(); let kind: THBRBlockKind; let content: String }

    var body: some View {
        VStack(alignment: .leading, spacing: 14) {
            ForEach(parseBlocks()) { block in
                blockView(block)
            }
        }
    }

    @ViewBuilder
    private func blockView(_ block: THBRBlock) -> some View {
        switch block.kind {
        case .heading:  headingView(block.content)
        case .quote:    quoteView(block.content)
        case .arrow:    arrowView(block.content)
        case .divider:  Divider().background(Color.white.opacity(0.08))
        case .body:     bodyView(block.content)
        }
    }

    private func headingView(_ t: String) -> some View {
        Text(t).font(.system(size: 15, weight: .black))
            .foregroundColor(accent.opacity(0.9)).padding(.top, 6)
    }

    private func quoteView(_ t: String) -> some View {
        HStack(spacing: 12) {
            Rectangle().fill(accent).frame(width: 3)
            Text(t).font(.system(size: 13)).foregroundColor(.white.opacity(0.75)).italic()
        }
        .padding(.vertical, 4)
    }

    private func arrowView(_ t: String) -> some View {
        HStack(alignment: .top, spacing: 8) {
            Text("→").font(.system(size: 12)).foregroundColor(accent).padding(.top, 1)
            Text(t).font(.system(size: 13)).foregroundColor(.white.opacity(0.75))
                .fixedSize(horizontal: false, vertical: true)
        }
    }

    private func bodyView(_ t: String) -> some View {
        Text(t).font(.system(size: 14)).foregroundColor(.white.opacity(0.8))
            .lineSpacing(5).fixedSize(horizontal: false, vertical: true)
    }

    private func parseBlocks() -> [THBRBlock] {
        text.components(separatedBy: "\n")
            .map { $0.trimmingCharacters(in: .whitespaces) }
            .compactMap { line -> THBRBlock? in
                if line.isEmpty { return nil }
                if line == "---" { return THBRBlock(kind: .divider, content: "") }
                if line.hasPrefix("**") && line.hasSuffix("**") {
                    return THBRBlock(kind: .heading, content: line.replacingOccurrences(of: "**", with: ""))
                }
                if line.hasPrefix("*") && line.hasSuffix("*") {
                    return THBRBlock(kind: .quote, content: line.replacingOccurrences(of: "*", with: ""))
                }
                if line.hasPrefix("→ ") { return THBRBlock(kind: .arrow, content: String(line.dropFirst(2))) }
                if line.hasPrefix("— ") { return THBRBlock(kind: .arrow, content: String(line.dropFirst(2))) }
                return THBRBlock(kind: .body, content: line.replacingOccurrences(of: "**", with: ""))
            }
    }
}
