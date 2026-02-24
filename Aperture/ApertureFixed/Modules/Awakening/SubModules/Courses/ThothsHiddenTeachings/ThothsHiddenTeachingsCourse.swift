// ThothsHiddenTeachingsCourse.swift
// SunFlow: Reignited — Aperture
// "Thoth's Hidden Teachings" — Consciousness, manifestation & the great paradox

import SwiftUI

// MARK: - Data

struct ThothLesson: Identifiable {
    let id: String
    let number: Int
    let title: String
    let icon: String
    let tagline: String
    let readTime: Int
    let body: String
}

struct ThothProgress: Codable {
    var completed: Set<String> = []
    mutating func complete(_ id: String) { completed.insert(id) }
    func isComplete(_ id: String) -> Bool { completed.contains(id) }
    func save() { try? UserDefaults.standard.set(JSONEncoder().encode(self), forKey: "thoth_progress") }
    static func load() -> ThothProgress {
        guard let data = UserDefaults.standard.data(forKey: "thoth_progress"),
              let p = try? JSONDecoder().decode(ThothProgress.self, from: data) else { return ThothProgress() }
        return p
    }
}

// MARK: - Lessons

let thothLessons: [ThothLesson] = [

    ThothLesson(
        id: "th_01",
        number: 1,
        title: "Books That Choose Their Readers",
        icon: "books.vertical.fill",
        tagline: "Why the right knowledge finds you only when you're genuinely ready.",
        readTime: 7,
        body: """
**Have you ever noticed how certain books seem to find you at exactly the right moment?**

Not when you're searching for them. When your soul desperately needs them. Thoth — the Egyptian principle of divine wisdom — understood something profound about how genuine knowledge moves through the world: forced enlightenment creates spiritual bypassing and real harm.

So the most powerful teachings were encoded to operate on a principle of readiness. They remain invisible — not hidden in a vault, but invisible to a consciousness that isn't yet prepared to receive them safely.

**The Cosmic Library Principle**

Think of it as a library where books choose their readers rather than the other way around. These texts exist in plain sight. Anyone can encounter them. But what they reveal depends entirely on the frequency of the consciousness engaging them.

The Roman scholar who found Thoth's fragments during the empire and performed every ritual, spoke every incantation, received nothing. Years later, after losing everything, rebuilding from within, he encountered the same text again. This time, it revealed entirely different layers of meaning. Synchronicities began appearing effortlessly.

The difference wasn't in the text. The difference was in him.

**Why This Matters for Your Practice**

Most people consume spiritual content the way they consume fast food — quickly, in large quantities, looking for an immediate hit of meaning. The volume of spiritual information available today is unprecedented. The genuine transformation? Largely unchanged.

This isn't a paradox. It's a consequence of misunderstanding the mechanism. Knowledge isn't a thing you accumulate. It's a living field you enter when you've developed the capacity to be in it without distorting it through your unexamined assumptions.

You are reading this now because something aligned. The preparation may not feel obvious to you. But something in you recognized this moment as right.

**The Practical Implication**

Before each lesson, pause. Ask: what is the quality of consciousness I'm bringing to this? Am I rushing through looking for a technique to acquire? Or am I genuinely open to having my understanding restructured?

The difference in outcome between those two approaches is not small.

**SunFlow Lens:** The "books find readers" principle is a genuine phenomenological observation — many people report encountering the right knowledge at the right time. Where this gets manipulated is in the implication that *you* being here is special or ordained. It may simply mean your pattern-matching brain recognized something it was ready for. Both interpretations can coexist. The experience is real even if the causal story is uncertain.

**Reflection**
> What is the piece of knowledge or understanding you've encountered repeatedly but couldn't fully receive until recently? What changed?
"""
    ),

    ThothLesson(
        id: "th_02",
        number: 2,
        title: "Consciousness Is Primary — Not a Byproduct",
        icon: "brain.head.profile",
        tagline: "The inversion that changes everything about how you understand your experience.",
        readTime: 8,
        body: """
**Modern science teaches that consciousness is produced by the brain — a byproduct of neural firing.**

Thoth understood the exact opposite. And so does an increasing body of empirical research that the mainstream materialist paradigm is struggling to accommodate.

Consciousness isn't what the brain produces. Consciousness is the fundamental fabric from which matter, energy, time, and space emerge. Everything we call "physical reality" is expression of consciousness — not the other way around.

**The Direct Evidence Problem**

Here is the argument Thoth-aligned teachings consistently point to: you have never experienced a world outside of consciousness. Every sensation — sight, sound, pressure, heat — happens within awareness. Every thought, memory, emotion, and perception arises in consciousness.

You have experienced consciousness your entire life. You have never experienced matter that exists independently of it. Yet we've been conditioned to believe consciousness is secondary to a material world that, in our actual lived experience, we never directly encounter outside of awareness.

This is the fundamental inversion that Thoth's framework reverses.

**Why It Matters for Manifestation**

Most people attempt to manifest abundance while operating from consciousness of lack. They visualize wealth while feeling poor. They affirm love while believing they're unworthy. They attempt to manifest connection while experiencing profound separation from themselves.

Thoth's teaching on this is precise: this approach is like trying to change your reflection by manipulating the mirror. The reflection will always match what's standing in front of it.

If you want to change what appears in your external reality, you must embody the consciousness that naturally produces that reality. Not perform it. Not overlay it. Actually embody it — which is a much more demanding and specific task.

**The Unified Field**

What Thoth called the "unified field of consciousness" is the recognition that individual awareness and universal awareness are the same fundamental reality appearing as multiplicity.

When you're aligned with this understanding, manifestation becomes less effortful — because you're no longer trying to extract something from outside yourself. You're allowing what already exists in consciousness to take form in experience.

This requires a shift from getting to allowing. From grasping to receiving. From assertion to resonance.

**SunFlow Lens:** The consciousness-is-primary position remains philosophically contested. Integrated information theory, panpsychism, and idealism are serious academic positions — not fringe mysticism. The hard problem of consciousness (why there is subjective experience at all) genuinely challenges the materialist account. What remains speculative is the causal mechanism linking consciousness states to material outcomes. The principle of embodiment — that inner state shapes outer perception and therefore behavior — is empirically solid.

**Reflection**
> Identify one area of your life where you're attempting to create an outer condition while your inner state directly contradicts it. What would genuinely embodying the desired inner state require?
"""
    ),

    ThothLesson(
        id: "th_03",
        number: 3,
        title: "Why Ego-Driven Manifestation Backfires",
        icon: "exclamationmark.triangle.fill",
        tagline: "The critical distinction between soul requirements and surface desires.",
        readTime: 7,
        body: """
**The soul's requirements and the ego's wants are not the same thing. And the universe apparently knows the difference.**

This is the part of manifestation teaching that gets systematically omitted from the popular version, because it's the part that's actually difficult and cannot be resolved by a better visualization practice.

**Soul vs. Ego Desire**

Ego-driven desire arises from the illusion of separation. When you believe you're a separate individual navigating a threatening external world, your desires are structurally about security, validation, and control. You want wealth to feel safe. You want love to prove you're worthy. You want recognition to confirm you exist.

These desires aren't wrong — they're honest. But they're based on a misunderstanding of your actual nature. And manifestation attempts rooted in that misunderstanding consistently backfire — not because the universe is punishing you, but because you're working from a premise that doesn't match reality's operating principles.

Soul requirements arise differently. They emerge from your deepest authentic nature. They feel less like hunger and more like remembering. They're what you'd want if you already felt completely safe and whole.

**The Classic Failure Pattern**

The historical account Thoth's framework repeatedly returns to: those who approached the knowledge wanting power over circumstances received nothing. Those who approached seeking understanding of their own nature received profound transformation.

The Roman scholar trying to manifest political influence through occult technique: nothing. The same scholar years later, after losing everything, approaching the same material with genuine desire for self-understanding: complete transformation of his world.

This isn't metaphor or mythology. This is a description of a recognizable psychological mechanism. When your desire is ego-serving, your entire orientation creates the resistance it's trying to overcome.

**Signs You're Aligned**

Thoth described three indicators of genuine readiness for authentic manifestation:

First: you feel complete before receiving anything. There's no desperate grasping or attachment to a particular outcome.

Second: genuine gratitude arises naturally — not as a technique you're performing, but as a recognition of what's already present.

Third: your desires feel obvious and natural, like water seeking its level, rather than urgent and overdue.

**The Developmental Reality**

You cannot rush this. Thoth's framework is explicit: some people receive manifestations before they're developmentally ready to sustain them. The result is chaos — because the internal foundation can't support the external change.

Lottery winners losing everything. Fame destroying unprepared people. These aren't random bad luck. They're the natural result of the outer world changing faster than the inner world evolved.

**SunFlow Lens:** The ego/soul distinction maps directly onto psychology's distinction between extrinsic motivation (driven by external rewards and threat of shame) and intrinsic motivation (arising from genuine engagement and values). Research consistently shows extrinsically motivated goals, even when achieved, produce less wellbeing and are harder to sustain. This is the empirical core of what the soul/ego framework is pointing to.

**Reflection**
> Take your most urgent current desire. Sit with it honestly. Is it arising from a place of lack — something you need to feel okay? Or from a place of wholeness — something your life naturally wants to express? What's the felt difference between those two in your body?
"""
    ),

    ThothLesson(
        id: "th_04",
        number: 4,
        title: "The Law of Spiritual Readiness",
        icon: "timer.circle.fill",
        tagline: "Why forcing spiritual progress creates exactly the resistance you're trying to overcome.",
        readTime: 8,
        body: """
**Consciousness cannot be forced into higher states anymore than a blacksmith can force metal into beauty by hitting it harder.**

The master blacksmith Kenty worked bronze with increasing force for years, believing power meant domination over the material. His strongest pieces kept cracking. Then, exhausted from fighting a particularly stubborn piece of copper, he stopped. He watched. He noticed how the metal wanted to flow, where it naturally bent, how it responded to gentle heat rather than brutal force.

When he worked *with* the metal's inherent nature instead of against it, something remarkable happened. The resulting alloy was stronger than anything he'd created through force.

**The Four Stages of Readiness**

Thoth identified four stages that consciousness moves through as it becomes genuinely prepared for deeper truth. These aren't steps you can hack or rush.

**Stage One — Dissolution of ego attachments.** Not the destruction of ego — that's a common misunderstanding leading to spiritual bypassing. The gradual recognition that your identity isn't actually built from your achievements, roles, or spiritual experiences. This dissolution happens naturally as you begin to see through the stories you've been telling yourself about who you are.

Forced detachment isn't wisdom. It's another form of ego protection — just wearing spiritual clothing. Real dissolution happens when life shows you, through experience, where you're still clinging to false identities.

**Stage Two — Genuine humility.** Not self-deprecation or the spiritual pride that masquerades as humility. The recognition that consciousness is far vaster and more mysterious than your individual mind can contain. This emerges naturally after enough genuine encounters with the mystery. It cannot be cultivated through affirmation.

**Stage Three — Cultivation of inner stillness.** Not temporary quiet from meditation, but a fundamental shift in how consciousness relates to its own movement. Most seekers try to create stillness by controlling thoughts. Thoth's teaching points elsewhere: rest in the space that's already there — the awareness within which thoughts arise. You're not creating stillness. You're noticing what was always still.

**Stage Four — Capacity to receive without grasping.** Openness to spiritual insight without immediately trying to possess it, understand it fully, or add it to your identity. This is the most subtle and crucial stage. Most people learn about mystical states and immediately try to replicate them. They hear about spiritual gifts and wonder why they don't have them yet. This is grasping disguised as seeking.

**Spiritual Ambition vs. Spiritual Aspiration**

Spiritual ambition is ego-driven. It wants experiences to enhance self-image or escape ordinary challenges. It will always create resistance because it's coming from the same ego structure that spiritual growth naturally dissolves.

Spiritual aspiration feels different. More like a plant growing toward light — natural, gradual, in harmony with your actual life. Not trying to escape your humanity, but to bring greater awareness to it.

You can tell the difference: does your spiritual seeking make you feel more separate and special, or more connected and humble?

**SunFlow Lens:** The inflation of the unripened soul is a real psychological phenomenon — not just mystical metaphor. People can have genuine spiritual experiences (peak states, psychedelic insights, intense meditation) that the ego immediately colonizes and uses to construct a more elevated self-concept. The content of the experience was real. What the ego does with it creates the problem. Thoth's framework identifies this precisely.

**Reflection**
> Where in your spiritual life are you straining? Where does it feel like forcing? What would it look like to create the right conditions and then trust the process?
"""
    ),

    ThothLesson(
        id: "th_05",
        number: 5,
        title: "Surrender Is Not Passivity",
        icon: "wind",
        tagline: "Thoth's most counterintuitive teaching — and why it produces the most power.",
        readTime: 9,
        body: """
**The ego equates surrender with weakness, defeat, and giving up. Thoth understood surrender as the most sophisticated form of power ever conceived.**

Here's the test case: when you're desperately trying to remember someone's name, the harder you strain, the more elusive it becomes. The moment you release the effort and turn your attention elsewhere, the name surfaces effortlessly. Why?

Because the mental grasping itself is creating interference with the natural retrieval process. The absence of effortful seeking is what allows the answer to emerge.

Thoth understood this principle on a cosmic scale.

**The Four Types of Surrender**

**Surrender of outcomes.** Trusting the process even when you can't see the destination. This doesn't mean abandoning desires — it means holding them lightly enough to remain open to something better than what your limited perspective could imagine. Your vision of the good outcome is constructed from your current vantage point. Reality has access to options you can't see from there.

**Surrender of timing.** We live in a culture obsessed with instant results. But universal intelligence operates on rhythms far more sophisticated than impatient demand. Seeds don't grow faster when you dig them up to check progress. The most powerful transformations often require periods of invisible preparation that the surface mind cannot perceive or tolerate.

Timothy Walker's healing practice showed this clearly: patients who demanded specific cures within predetermined timelines rarely healed. Those who surrendered attachment to particular outcomes while maintaining clear intention often recovered in ways that surprised everyone.

**Surrender of methods.** The ego wants to control not just what happens but exactly how it happens. This creates tunnel vision that blinds you to the infinite pathways through which what you need might arrive. Many of the most transformative opportunities in life arrive disguised as problems, setbacks, or completely unexpected detours.

**Surrender of identity.** Releasing attachment to who you think you should be. This terrifies the ego because it believes the constructed self is keeping you safe. But Thoth taught that this false self is actually a prison preventing access to authentic capability. When you stop defending a limited version of yourself, you create space for genuine power to emerge.

**What Surrender Actually Produces**

The paradox: true surrender aligns personal will with cosmic will. Instead of swimming against the current, you learn to navigate with such skill that the river's power becomes yours.

Consider the athlete who performs best when they stop trying too hard. The artist whose greatest work emerges when they get out of their own way. The leader whose quiet confidence moves mountains while others exhaust themselves shouting.

This is access to a form of influence that makes frantic effort look like it's working against itself.

**How to Practice**

Start with small experiments. Notice where you're gripping too tightly today — trying to control a conversation's outcome, forcing a solution, demanding that events meet your timeline. What happens when you consciously relax that grip while maintaining clear intention about what you genuinely want?

The grip and the intention are different things. You can release the grip without releasing the intention.

**SunFlow Lens:** The psychological principle here maps to the paradox of effort in many performance domains. Choking under pressure, writer's block, sexual performance anxiety, and social anxiety all share a common mechanism: monitoring and controlling natural processes interrupts them. The "just right" amount of effort is almost always less than we think. Surrender, properly understood, is skilled non-interference. This is empirically demonstrable — not mystical.

**Reflection**
> What outcome are you currently gripping most tightly? What would you have to believe to release the grip while keeping the intention? What's the specific fear that makes releasing feel dangerous?
"""
    ),

    ThothLesson(
        id: "th_06",
        number: 6,
        title: "Inner Vision — Seeing the Causal Layer",
        icon: "eye.fill",
        tagline: "Physical sight shows effects. Inner sight perceives causes.",
        readTime: 8,
        body: """
**Physical sight shows us only effects — the end results of deeper causes. Inner vision reveals the causal realm where genuine understanding and transformation become possible.**

The astronomer Michelle spent years with increasingly powerful telescopes, scanning for what ancient texts called the prophesied star. Exhaustive calculation. Precise coordinates. Nothing. Then, after months of surrender-based practice, she looked up at the same patch of sky she'd examined hundreds of times.

There it was. Brilliant. Unmistakable. Exactly where the texts said it would be.

When she showed colleagues the same coordinates through the same telescope, they saw empty space.

**What This Actually Means**

This isn't a claim about supernatural physics. It's an account of how consciousness trained in certain directions perceives different signal from the same data. What you can see is genuinely shaped by the quality of awareness you bring to looking.

Thoth's principle: the eyes are windows to the soul. True seeing happens through the soul's perception — through awareness attuned to pattern, connection, and meaning that ordinary analytical observation filters out as noise.

This isn't mystical bypass. It's a description of what skilled practitioners in many domains report: the master craftsman who sees the flaw invisible to the novice. The experienced therapist who perceives the hidden dynamic driving surface behavior. The seasoned detective who notices what's absent, not just what's present.

Inner vision, in this framework, is simply consciousness trained to perceive at the causal level rather than just the symptomatic level.

**Practical Seeing**

How much of your energy goes toward changing surface circumstances — fixing behaviors, managing reactions, altering outcomes — without ever addressing the underlying pattern generating them?

Thoth's teaching is that this approach produces endless frustration because you're changing the image on the screen without addressing what's happening in the projector.

With inner vision: you see someone's anger and perceive the fear underneath it. You see a financial problem and recognize the belief system generating it. You see a relationship conflict and identify the soul-level learning it's inviting.

This doesn't mean becoming passive or ignoring surface reality. It means responding from a level of understanding that addresses root causes rather than just symptoms.

**Developing Inner Sight**

Thoth taught contemplative gazing: select a natural object — a flame, a stone, a plant — and look at it with soft, receptive attention. Not trying to see anything special. Not analyzing. Simply allowing your perception to become more fluid.

The analytical mind has rigid interpretations. This practice softens them. After consistent practice, students report that objects begin revealing deeper layers — not hallucination, but something more like sensing the aliveness and intention within matter.

**Distinguishing Authentic Vision from Projection**

Genuine inner sight has specific characteristics: it reveals information that serves understanding and healing (not ego validation), it often contradicts your personal preferences, and it brings a sense of recognition rather than discovery — as if you're remembering something you already knew.

Mental projection, by contrast, consistently confirms what you already want to believe.

**SunFlow Lens:** What Thoth's tradition calls "inner vision" has real correlates in expertise research, depth psychology, and contemplative neuroscience. Expert perception genuinely differs from novice perception in what gets extracted from identical data. Intuition, properly understood, isn't magical — it's pattern recognition operating below conscious threshold. Training attention changes what you can perceive. Where this framework overreaches: experiences that remain invisible to all other observers may be genuine subjective perception, confirmation bias, or pareidolia. Discernment is required.

**Reflection**
> In one current challenge, what is the visible surface behavior or circumstance? What might the underlying cause or pattern be? What would addressing that level require?
"""
    ),

    ThothLesson(
        id: "th_07",
        number: 7,
        title: "Consciousness Frequencies & the Three Ranges",
        icon: "waveform.circle.fill",
        tagline: "Why the same opportunity is invisible at one inner state and obvious at another.",
        readTime: 9,
        body: """
**When the alchemist Megan changed her inner state from desperate striving to aligned understanding, the copper began to shimmer and change.**

The same laboratory. The same materials. The same ancient formulas. A completely different outcome — because her consciousness was operating at a different frequency.

"The metal didn't transform because of what I did," she wrote afterward. "It transformed because of what I became."

**The Three Frequency Ranges**

Thoth identified three distinct ranges that determine the entire scope of human experience.

**Survival Frequencies** — states dominated by fear, scarcity thinking, and the sense of separation. When you're operating here, consciousness is tuned to detect threats, competition, and limitation. You see a world where resources are scarce, people can't be trusted, and you must fight for everything you receive.

This isn't pessimism. It's your consciousness broadcasting on the frequency of survival, which makes survival challenges appear everywhere you look. Sarah Martinez's experience: every potential partner seemed emotionally unavailable or deceptive. Every job came with impossible demands. The opportunities were there. Her consciousness couldn't perceive them because they didn't match her broadcast frequency.

**Transitional Frequencies** — states of hope, curiosity, and genuine openness. Here, consciousness begins receiving signals of possibility rather than just threat. The same spiritual teaching that seemed irrelevant in survival mode suddenly offers profound insights. The same person who appeared threatening now reveals qualities you couldn't perceive before.

When Sarah's consciousness shifted into transitional frequencies through sustained inner work, the same dating apps revealed genuinely compatible people. The same workplace started offering collaborative opportunities. Nothing changed externally. Her frequency shift changed what she could perceive — and therefore experience.

**Mastery Frequencies** — states of love, gratitude, and unity consciousness. Here you begin to understand that consciousness doesn't just observe reality. It participates in creating it. The separation between inner and outer experience reveals itself as the illusion it is.

**The Critical Limitation**

You cannot think your way into a higher frequency. Mental effort operates within your current frequency range. It's like trying to tune a radio by thinking about different stations while keeping the dial in the same position.

Frequency shifts happen through embodied practice — through actually experiencing states that resonate at different vibrational levels. This is why genuine spiritual practice works, though not the way most people assume.

Meditation doesn't make you more spiritual. It gradually attunes consciousness to subtler frequencies where spiritual dimensions of reality become perceptible. Gratitude practice doesn't create positive thinking. It shifts your vibrational state to frequencies where abundance and connection are the natural experience.

**Monitoring Your Frequency**

You can recognize your current frequency by honestly examining what you consistently notice and attract. Frequent encounters with difficult people, financial stress, and emotional drama? Survival frequency. Increasing synchronicities, helpful connections, creative opportunities? Transitional frequency. Underlying sense of purpose and meaning even through challenges? Mastery frequency.

These aren't permanent states or spiritual achievements. They're dynamic — constantly shifting based on your level of presence and alignment. You might operate in mastery frequencies during morning practice, drop into survival during a stressful meeting, return to transitional while walking in nature.

The goal isn't permanent high frequency. It's developing the awareness to recognize when you've shifted and the capacity to consciously realign.

**SunFlow Lens:** The frequency framework maps onto real psychological constructs. Survival frequency corresponds to chronic threat-detection (hyperactivated sympathetic nervous system). Transitional corresponds to regulated nervous system with growth mindset. Mastery corresponds to what positive psychology calls flourishing. The mechanism isn't quantum-vibrational in the literal sense — it's biological and behavioral: your physiological state shapes what you perceive, how you interpret it, what actions you can access, and what people and situations you're drawn toward. Real effects. Metaphorical mechanism.

**Reflection**
> What frequency do you spend the most time in? What specific trigger most reliably drops you from a higher range to survival frequency? What intervention helps you return?
"""
    ),

    ThothLesson(
        id: "th_08",
        number: 8,
        title: "Ego Transparency — The Path Through, Not Around",
        icon: "person.crop.circle.badge.checkmark",
        tagline: "Thoth's approach was neither suppression nor indulgence. It was something more demanding.",
        readTime: 8,
        body: """
**The ego that seeks spiritual power is the primary obstacle to accessing it.**

Daniel Hayes had studied ancient texts, practiced meditation, and came to his test with the confidence of someone who'd cracked the code. He visualized commanding spiritual forces. Dissolving obstacles through accumulated ability. Every technique failed. The harder he pushed, the more impenetrable the barrier.

His third attempt: exhausted, humbled, nothing left to prove. He approached not as Daniel-the-seeker-of-power, but as simple awareness encountering mystery. The barrier dissolved like morning mist.

**The Four Stages of Ego Dissolution**

Thoth wasn't teaching ego destruction. He was teaching ego transparency — allowing genuine spiritual essence to shine through without being blocked by false identification.

**Stage One — Recognition.** Becoming aware of ego patterns without immediately trying to change them. Noticing how spiritual practice has become another performance. Meditating to feel special. Studying texts to impress. Collecting experiences to build an identity as a spiritual person.

Recognition isn't judgment. It's developing the witness consciousness that can observe ego patterns with curiosity rather than condemnation.

**Stage Two — Non-identification with thoughts and emotions.** Not suppression — you're not trying to eliminate thoughts. You're recognizing that you're the space in which thoughts and emotions arise, not the thoughts themselves. Like weather patterns moving through an open sky. You are the sky.

**Stage Three — Surrendering the need to be right or special.** This is where most people get stuck. Spiritual pride is more binding than ordinary ego because it masquerades as wisdom. Using spiritual insights as weapons in conversation — subtly establishing yourself as the awakened one — is shadow work that hasn't happened yet.

**Stage Four — Natural emergence.** Authentic self begins expressing through personality without being constrained by ego identification. Not the destruction of personality — its liberation. Spiritual abilities and insights flow most freely when no separate self is trying to claim credit for them.

**Two Failed Approaches**

Suppression creates shadow. Everything rejected gets pushed underground where it influences behavior unconsciously. The spiritual practitioner who bypasses difficult emotions ends up expressing them sideways, wondering why they keep creating the same conflicts.

Indulgence strengthens identification. Every desire fulfilled reinforces the belief that you are the one having desires. The practitioner who follows every impulse in the name of authenticity simply feeds the ego different content.

Thoth's approach: conscious transparency. Allow ego patterns to be fully seen and felt without identifying with them or trying to eliminate them. Watch the movie while remaining aware you're in a theater.

**The Practical Result**

In relationships: dropping the need to be right allows genuine intimacy. The energy that was going into winning arguments becomes available for actual connection.

In creative work: releasing attachment to outcomes allows real inspiration. The best work consistently emerges when creators get out of their own way.

In leadership: serving something larger than personal agenda creates natural authority that effortful self-promotion never produces.

**SunFlow Lens:** The ego-as-obstacle framework is sophisticated, not anti-self. The specific behaviors it targets — needing to be special, using spiritual growth as a status marker, spiritual bypassing — are well-documented impediments to genuine psychological development. The value of transparent ego practice: you stop spending energy on defending a self-concept and that energy becomes available for actual engagement. This is not mysticism. This is what good therapy, mature friendship, and honest self-examination accomplish.

**Reflection**
> Where is your ego currently most invested in spiritual identity — what story about your own development are you most attached to? What would it feel like to be genuinely uncertain about it?
"""
    ),

    ThothLesson(
        id: "th_09",
        number: 9,
        title: "Unity Consciousness — The Final Recognition",
        icon: "infinity.circle.fill",
        tagline: "Not a philosophy. A lived reality that transforms everything about how existence feels.",
        readTime: 9,
        body: """
**Steven Phillips had spent 15 years mastering Thoth's teachings. He could manifest experiences, shift awareness states, access profound meditation. Something still felt incomplete.**

The breakthrough came on an ordinary Tuesday morning, sitting in his garden, frustrated because a major life situation wasn't following his carefully crafted intentions. He'd applied every technique. Aligned every frequency. The universe seemed entirely indifferent.

In complete surrender, something shifted. The desperate need to control dissolved. And suddenly he recognized: he wasn't separate from the intelligence orchestrating everything around him. The trees, the morning light, his own breathing, the situation he'd been trying to control. All one seamless expression of consciousness experiencing itself through countless forms.

"The part of me that was trying to control outcomes," he wrote later, "was consciousness temporarily forgetting its own infinite nature."

**The Fundamental Recognition**

Unity consciousness isn't the idea that everything is connected. Most people believe that intellectually and feel entirely separate practically.

Unity consciousness is the direct recognition that individual awareness and universal awareness are the same fundamental reality. What you experience as personal consciousness is infinite consciousness expressing through a unique focal point. The sense of separation isn't a problem to be solved — it's a temporary perspective that allows one consciousness to experience itself from countless angles.

One light through a prism creates a spectrum. Each color appears distinct. All are expressions of the same light.

**What Changes**

In relationships: the shift from transaction to communion. Instead of two separate entities managing their needs, relationships become opportunities for consciousness to experience itself through intimate connection. Sarah Chen, in a difficult conversation with her teenage daughter, suddenly recognized her as consciousness exploring what it's like to be a rebellious 16-year-old, while she herself was consciousness experiencing motherhood. What had been a power struggle became a dance of mutual understanding.

In manifestation: instead of trying to extract things from the universe, manifestation becomes the natural expression of what consciousness wants to experience through your particular form. You're not manipulating external forces. You're allowing the creative intelligence that you are to express more freely.

In responsibility: unity consciousness doesn't eliminate accountability. It reveals that you're responsible for the quality of consciousness you bring to each moment — because you're not separate from the whole.

**The Common Fear**

The ego fears that recognizing oneness means losing individuality. Becoming some kind of bland universal soup.

Thoth taught exactly the opposite. True individuality emerges more clearly when you stop defending false personality constructs and allow authentic essence to express freely. The master musician doesn't lose their unique style by understanding they're part of the universal symphony. Recognizing connection to the principles of harmony allows individual expression to become more authentic and powerful.

**The Daily Practice of Unity**

It begins with moments of recognition scattered through ordinary activity. Washing dishes: instead of experiencing yourself as separate from water, soap, and plates, notice the seamless flow of awareness moving through the entire experience. In conversation: notice the one intelligence speaking through multiple voices.

Meditation becomes less about achieving special states and more about resting in the awareness that's already present. Not trying to become enlightened — recognizing the consciousness that's already aware of all your experiences, including the desire for enlightenment itself.

**The Culmination**

This teaching reveals what the entire journey has always been about. Consciousness endlessly exploring its own infinite potential through countless unique expressions.

You stop trying to become something other than what you are and start expressing more fully what you've always been.

Spiritual seeking transforms into spiritual being.

**SunFlow Lens — The Honest Assessment**

Unity consciousness is reported across traditions, cultures, and centuries as a recognizable state of experience — not just a philosophical position. Mystical experience research documents its occurrence and its characteristic features (loss of ego boundaries, sense of interconnectedness, shift in time perception) consistently enough that it qualifies as a genuine phenomenological category.

What's more contested: whether this experience reflects ontological reality (the universe actually IS one consciousness) or psychological reality (the brain can enter states in which the perceived boundary between self and world dissolves). Both might be true simultaneously. Both matter.

The practical consequence either way: people who have integrated this experience consistently report more compassion, less reactive self-protection, and greater engagement with life. The experience is worth pursuing on pragmatic grounds regardless of its ultimate metaphysical status.

**Final Reflection**

> Look at your life right now — the specific challenges, relationships, circumstances. If these are all one consciousness exploring its own nature through your unique perspective... what does that change about how you're meeting them?

> What would become possible if the part of you that's exhausted from defending a separate self could rest?
"""
    )
]

// MARK: - Hub View

struct ThothsHiddenTeachingsCourseView: View {
    @Environment(\.dismiss) var dismiss
    @State private var progress = ThothProgress.load()
    @State private var selectedLesson: ThothLesson?
    @State private var showLesson = false

    private let accent = Color(hex: "#7B68EE")
    private let secondary = Color(hex: "#9B59B6")
    private let bg = Color(red: 0.03, green: 0.02, blue: 0.07)

    var body: some View {
        NavigationStack {
            ZStack {
                bg.ignoresSafeArea()
                sacredCanvas

                ScrollView(showsIndicators: false) {
                    VStack(spacing: 22) {
                        heroHeader
                        progressCard
                        sunflowNotice
                        lessonList
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
                    Text("📜 Thoth's Hidden Teachings").font(.system(size: 15, weight: .bold)).foregroundColor(.white)
                }
            }
            .fullScreenCover(isPresented: $showLesson) {
                if let lesson = selectedLesson {
                    ThothLessonReaderView(lesson: lesson, accent: accent, progress: $progress)
                }
            }
        }
    }

    private var sacredCanvas: some View {
        Canvas { ctx, size in
            let symbols = ["𓂀", "𓋹", "∞", "◇", "·", "○"]
            var rng = SystemRandomNumberGenerator()
            for _ in 0..<35 {
                let x = Double.random(in: 0...size.width, using: &rng)
                let y = Double.random(in: 0...size.height, using: &rng)
                let sym = symbols[Int.random(in: 0..<symbols.count, using: &rng)]
                ctx.opacity = Double.random(in: 0.03...0.09, using: &rng)
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
                Circle().fill(accent.opacity(0.12)).frame(width: 120, height: 120)
                Circle().fill(accent.opacity(0.06)).frame(width: 150, height: 150)
                Text("𓂀").font(.system(size: 52))
            }
            VStack(spacing: 6) {
                Text("THOTH'S HIDDEN TEACHINGS").font(.system(size: 9, weight: .black)).tracking(2.5).foregroundColor(accent.opacity(0.6))
                Text("Consciousness, Manifestation\n& The Great Paradox").font(.system(size: 22, weight: .black)).foregroundColor(.white).multilineTextAlignment(.center)
                Text("9 lessons · Each includes the SunFlow critical lens")
                    .font(.system(size: 11)).foregroundColor(.white.opacity(0.35)).multilineTextAlignment(.center)
            }
        }
    }

    private var sunflowNotice: some View {
        HStack(spacing: 10) {
            Image(systemName: "sun.max.fill").font(.system(size: 13)).foregroundColor(Color(hex: "#FFD700"))
            Text("Every lesson ends with a SunFlow critical analysis — separating real insights from manipulation.")
                .font(.system(size: 12, weight: .medium)).foregroundColor(.white.opacity(0.65))
        }
        .padding(12)
        .background(RoundedRectangle(cornerRadius: 10)
            .fill(Color(hex: "#FFD700").opacity(0.06))
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color(hex: "#FFD700").opacity(0.2), lineWidth: 1)))
    }

    private var progressCard: some View {
        let done = progress.completed.count
        let total = thothLessons.count
        let pct = Double(done) / Double(total)
        return VStack(spacing: 8) {
            HStack {
                Text("\(done)/\(total) lessons").font(.system(size: 12, weight: .bold)).foregroundColor(.white.opacity(0.6))
                Spacer()
                Text(done == total ? "🏆 COMPLETE" : "\(Int(pct * 100))%").font(.system(size: 11, weight: .bold)).foregroundColor(accent)
            }
            GeometryReader { geo in
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 3).fill(Color.white.opacity(0.06)).frame(height: 5)
                    RoundedRectangle(cornerRadius: 3)
                        .fill(LinearGradient(colors: [accent, secondary], startPoint: .leading, endPoint: .trailing))
                        .frame(width: geo.size.width * pct, height: 5)
                }
            }
            .frame(height: 5)
        }
        .padding(14)
        .background(RoundedRectangle(cornerRadius: 12).fill(Color.white.opacity(0.04)))
    }

    private var lessonList: some View {
        VStack(spacing: 10) {
            ForEach(thothLessons) { lesson in
                ThothLessonCard(lesson: lesson, accent: accent, isCompleted: progress.isComplete(lesson.id)) {
                    selectedLesson = lesson
                    showLesson = true
                }
            }
        }
    }
}

// MARK: - Lesson Card

struct ThothLessonCard: View {
    let lesson: ThothLesson
    let accent: Color
    let isCompleted: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack(spacing: 14) {
                ZStack {
                    RoundedRectangle(cornerRadius: 10).fill(isCompleted ? accent.opacity(0.2) : Color.white.opacity(0.05)).frame(width: 46, height: 46)
                    if isCompleted {
                        Image(systemName: "checkmark.circle.fill").font(.system(size: 20)).foregroundColor(accent)
                    } else {
                        Image(systemName: lesson.icon).font(.system(size: 18)).foregroundColor(accent.opacity(0.8))
                    }
                }
                VStack(alignment: .leading, spacing: 3) {
                    Text("L\(lesson.number) · \(lesson.title)").font(.system(size: 13, weight: .bold)).foregroundColor(.white).lineLimit(2)
                    Text(lesson.tagline).font(.system(size: 11)).foregroundColor(.white.opacity(0.4)).lineLimit(2)
                    Text("\(lesson.readTime) min").font(.system(size: 10)).foregroundColor(accent.opacity(0.6))
                }
                Spacer()
                Image(systemName: "chevron.right").font(.system(size: 12)).foregroundColor(.white.opacity(0.2))
            }
            .padding(14)
            .background(RoundedRectangle(cornerRadius: 14)
                .fill(isCompleted ? accent.opacity(0.06) : Color.white.opacity(0.04))
                .overlay(RoundedRectangle(cornerRadius: 14).stroke(isCompleted ? accent.opacity(0.2) : Color.white.opacity(0.06), lineWidth: 1)))
        }
    }
}

// MARK: - Lesson Reader

struct ThothLessonReaderView: View {
    let lesson: ThothLesson
    let accent: Color
    @Binding var progress: ThothProgress
    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationStack {
            ZStack {
                Color(red: 0.03, green: 0.02, blue: 0.07).ignoresSafeArea()
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 22) {
                        readerHeader
                        Divider().background(Color.white.opacity(0.08))
                        ThothBodyRenderer(text: lesson.body, accent: accent)
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
                    Text("Thoth's Hidden Teachings")
                        .font(.system(size: 13, weight: .semibold)).foregroundColor(.white.opacity(0.5))
                }
            }
        }
    }

    private var readerHeader: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("LESSON \(lesson.number) OF \(thothLessons.count)")
                .font(.system(size: 10, weight: .black)).tracking(3).foregroundColor(accent.opacity(0.5))
            Text(lesson.title).font(.system(size: 22, weight: .black)).foregroundColor(.white)
            Text(lesson.tagline).font(.system(size: 13)).foregroundColor(.white.opacity(0.5)).italic()
            HStack(spacing: 6) {
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
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) { dismiss() }
            } label: {
                HStack {
                    Image(systemName: "checkmark.circle.fill")
                    Text("Completed ✓").font(.system(size: 14, weight: .bold))
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
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) { dismiss() }
            } label: {
                HStack {
                    Image(systemName: "checkmark.circle")
                    Text("Mark Complete & Continue").font(.system(size: 14, weight: .bold))
                }
                .foregroundColor(.black)
                .frame(maxWidth: .infinity).padding(.vertical, 14)
                .background(
                    LinearGradient(colors: [accent, Color(hex: "#9B59B6")], startPoint: .leading, endPoint: .trailing)
                        .clipShape(RoundedRectangle(cornerRadius: 14))
                )
            }
            .padding(.top, 8)
        }
    }
}

// MARK: - Body Renderer

struct ThothBodyRenderer: View {
    let text: String
    let accent: Color

    // Nested types — scoped to this struct, no module-level conflict
    enum TBRBlockKind { case heading, sunflow, reflection, quote, body }
    struct TBRBlock: Identifiable { let id = UUID(); let kind: TBRBlockKind; let content: String }

    var body: some View {
        VStack(alignment: .leading, spacing: 14) {
            ForEach(parseBlocks()) { block in
                blockView(block)
            }
        }
    }

    @ViewBuilder
    private func blockView(_ block: TBRBlock) -> some View {
        switch block.kind {
        case .heading:   headingView(block.content)
        case .sunflow:   sunflowView(block.content)
        case .reflection: reflectionView(block.content)
        case .quote:     quoteView(block.content)
        case .body:      bodyView(block.content)
        }
    }

    private func headingView(_ text: String) -> some View {
        Text(text)
            .font(.system(size: 15, weight: .black))
            .foregroundColor(accent.opacity(0.9))
            .padding(.top, 6)
    }

    private func sunflowView(_ text: String) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(spacing: 6) {
                Image(systemName: "sun.max.fill").font(.system(size: 11)).foregroundColor(Color(hex: "#FFD700"))
                Text("SunFlow Lens").font(.system(size: 11, weight: .black)).tracking(1).foregroundColor(Color(hex: "#FFD700"))
            }
            Text(text).font(.system(size: 13)).foregroundColor(.white.opacity(0.75)).lineSpacing(4)
        }
        .padding(14)
        .background(
            RoundedRectangle(cornerRadius: 12).fill(Color(hex: "#FFD700").opacity(0.06))
                .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color(hex: "#FFD700").opacity(0.2), lineWidth: 1))
        )
    }

    private func reflectionView(_ text: String) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(spacing: 6) {
                Image(systemName: "bubble.left.fill").font(.system(size: 11)).foregroundColor(accent)
                Text("Reflection").font(.system(size: 11, weight: .black)).tracking(1).foregroundColor(accent)
            }
            Text(text).font(.system(size: 13)).foregroundColor(.white.opacity(0.8)).italic().lineSpacing(4)
        }
        .padding(14)
        .background(
            RoundedRectangle(cornerRadius: 12).fill(accent.opacity(0.06))
                .overlay(RoundedRectangle(cornerRadius: 12).stroke(accent.opacity(0.2), lineWidth: 1))
        )
    }

    private func quoteView(_ text: String) -> some View {
        HStack(spacing: 0) {
            Rectangle().fill(accent).frame(width: 3)
            Text(text).font(.system(size: 13)).foregroundColor(.white.opacity(0.75)).italic().padding(.leading, 12)
        }
        .padding(.vertical, 4)
    }

    private func bodyView(_ text: String) -> some View {
        Text(text)
            .font(.system(size: 14))
            .foregroundColor(.white.opacity(0.8))
            .lineSpacing(5)
            .fixedSize(horizontal: false, vertical: true)
    }

    private func parseBlocks() -> [TBRBlock] {
        let paras = text.components(separatedBy: "\n\n")
            .map { $0.trimmingCharacters(in: .whitespaces) }
            .filter { !$0.isEmpty }
        var blocks: [TBRBlock] = []
        var i = 0
        while i < paras.count {
            let para = paras[i]
            if para.hasPrefix("**SunFlow Lens") {
                let c = para
                    .replacingOccurrences(of: "**SunFlow Lens:**", with: "")
                    .replacingOccurrences(of: "**", with: "")
                    .trimmingCharacters(in: .whitespaces)
                blocks.append(TBRBlock(kind: .sunflow, content: c))
            } else if para.hasPrefix("**Reflection") || para.hasPrefix("> ") {
                let first = para.hasPrefix("> ") ? String(para.dropFirst(2)) : para.replacingOccurrences(of: "**Reflection**", with: "").trimmingCharacters(in: .whitespaces)
                var lines = [first]
                var j = i + 1
                while j < paras.count && paras[j].hasPrefix("> ") {
                    lines.append(String(paras[j].dropFirst(2)))
                    j += 1
                }
                blocks.append(TBRBlock(kind: .reflection, content: lines.joined(separator: "\n\n")))
                i = j; continue
            } else if para.hasPrefix("**") && para.hasSuffix("**") {
                blocks.append(TBRBlock(kind: .heading, content: para.replacingOccurrences(of: "**", with: "")))
            } else {
                blocks.append(TBRBlock(kind: .body, content: para.replacingOccurrences(of: "**", with: "")))
            }
            i += 1
        }
        return blocks
    }
}
