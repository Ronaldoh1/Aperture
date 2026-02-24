// AlchemyCourse.swift
// SunFlow: Reignited — Aperture
// "Alchemy Unveiled" — Exposing the lies and mastering the true art of transformation

import SwiftUI

// MARK: - Data Model

struct AlchemyModule: Identifiable {
    let id: String
    let number: Int
    let title: String
    let icon: String
    let tagline: String
    let stage: AlchemyStage
    let readTime: Int
    let body: String
}

enum AlchemyStage: String, CaseIterable {
    case foundation = "Foundation"
    case nigredo    = "Nigredo"
    case albedo     = "Albedo"
    case citrinitas = "Citrinitas"
    case rubedo     = "Rubedo"
    case integration = "Integration"

    var color: Color {
        switch self {
        case .foundation:  return Color(hex: "#888888")
        case .nigredo:     return Color(hex: "#2C2C2C")
        case .albedo:      return Color(hex: "#B0C4DE")
        case .citrinitas:  return Color(hex: "#DAA520")
        case .rubedo:      return Color(hex: "#B22222")
        case .integration: return Color(hex: "#9B59B6")
        }
    }

    var emoji: String {
        switch self {
        case .foundation:  return "⬛"
        case .nigredo:     return "🖤"
        case .albedo:      return "🤍"
        case .citrinitas:  return "💛"
        case .rubedo:      return "❤️"
        case .integration: return "✨"
        }
    }
}

struct AlchemyProgress: Codable {
    var completedModules: Set<String> = []
    mutating func complete(_ id: String) { completedModules.insert(id) }
    func isComplete(_ id: String) -> Bool { completedModules.contains(id) }
    func save() { try? UserDefaults.standard.set(JSONEncoder().encode(self), forKey: "alchemy_progress") }
    static func load() -> AlchemyProgress {
        guard let data = UserDefaults.standard.data(forKey: "alchemy_progress"),
              let p = try? JSONDecoder().decode(AlchemyProgress.self, from: data) else { return AlchemyProgress() }
        return p
    }
}

// MARK: - Module Content

let alchemyModules: [AlchemyModule] = [

    AlchemyModule(
        id: "al_00",
        number: 0,
        title: "The Lies They've Told You About Alchemy",
        icon: "exclamationmark.shield.fill",
        tagline: "The three fabrications that buried one of humanity's most sophisticated systems.",
        stage: .foundation,
        readTime: 7,
        body: """
**Before We Begin: Three Lies to Burn**

Alchemy has been systematically misrepresented in modern education. Before you can receive what it actually is, you need to see what it isn't — and why those misrepresentations serve specific interests.

**Lie #1: Alchemy Was Primitive Pseudoscience**

The official story: ignorant medieval tinkerers failed to make gold, inadvertently inventing chemistry through their failures, and were eventually replaced by "real" science.

The truth: alchemy was a sophisticated proto-science *and* spiritual technology simultaneously. Alchemists developed real laboratory techniques that directly influenced modern chemistry — distillation, acids, alloys, early pharmacology. Figures like Isaac Newton, Robert Boyle, and Paracelsus practiced alchemy seriously. Experiments were often encoded in symbolic language not because the practitioners were delusional, but to protect knowledge from authorities who would suppress or weaponize it.

Recent scholarship — particularly Lawrence Principe's laboratory recreations at Johns Hopkins — shows that many alchemical recipes produced genuine and surprising results, including the growth of metallic "trees" that the texts described. These weren't metaphors. They were real procedures.

**Lie #2: Alchemy Was Only About Material Wealth**

The simplified story: alchemists were obsessed with turning lead into gold to get rich, or with creating immortality potions for elites.

The deeper truth, preserved in the primary texts themselves: the laboratory mirrored the psyche. Transmuting lead (base, unconscious matter) into gold (enlightened spirit) was *primarily* a metaphor for self-perfection. The outer work was inseparable from the inner work.

As the core alchemical principle states: *"The alchemist doesn't work to dominate nature. He works with it. And the greatest experiment isn't in the lab. It's in himself."*

**Lie #3: Alchemists Were Persecuted Mystics or Secret Cabals**

The popular mythology: Templars, Illuminati, secret societies, all suppressing and protecting alchemical secrets from the masses.

The historical record: most practicing alchemists held conventional religious views and worked openly — as monks, physicians, and scholars. There are no Inquisition records showing executions for alchemical *ideas*. The occasional bans that did occur were driven by economic fears — specifically counterfeiting currency — not spiritual persecution.

**What Alchemy Actually Is**

A universal map of transformation operating on three interconnected planes simultaneously:

→ **Material** — chemical processes, spagyrics, metallurgy, real laboratory work
→ **Psychological** — shadow integration, individuation, the Jungian lens
→ **Spiritual** — union of opposites, awakening the divine spark within matter and self

It teaches that *everything* is alive, evolving, and perfectible. Lead isn't "bad" — it's immature gold. You aren't broken — you're raw prima materia awaiting the Great Work.

**The Alchemist's Foundational Posture**

The universe is alive — a breathing intelligence of hidden patterns and sacred geometry. Matter sleeps, waiting to awaken through understanding. The alchemist is philosopher-mystic-dreamer — bridge between heaven and earth.

This isn't a romantic metaphor. It's a working orientation. The moment you approach your own life as prima materia — raw material awaiting conscious transformation — everything about how you engage with experience changes.

**Reflection**
> Which of the three lies most shaped your prior understanding of alchemy? What opens up when you release that framing?
"""
    ),

    AlchemyModule(
        id: "al_01",
        number: 1,
        title: "The Magnum Opus — The Great Work",
        icon: "flame.fill",
        tagline: "Not just turning lead into gold. A complete map of inner transformation.",
        stage: .foundation,
        readTime: 7,
        body: """
**The Beating Heart of Alchemy**

The Magnum Opus — the Great Work — is alchemy's central organizing principle. It is not a recipe. It is not a procedure. It is a complete map of transformation, from confusion to clarity, from base material to refined gold, from unconscious suffering to conscious mastery.

Traced to Zosimos of Panopolis (3rd century CE) and the legendary Mary the Jewess — who may have been alchemy's first documented practitioner — the Magnum Opus is death and rebirth repeated until perfection.

Not metaphorical death. The actual dissolution of who you were, so that something more refined can emerge.

**The Map Applied to Modern Life**

The Magnum Opus isn't historical. It's happening right now in your own experience. Every significant transformation in a human life follows the same pattern:

A relationship ends and you enter Nigredo — the blackening, the dissolution, the confrontation with what's been left unseen. Time passes. Clarity begins to emerge through Albedo. Wisdom crystallizes in Citrinitas. And if you stay with the process long enough, you arrive at Rubedo — genuine transformation, stable and integrated, that never reverts.

Most people abandon the process during Nigredo because it looks and feels like failure. They don't recognize dissolution as the first stage of transformation. They try to skip straight to Rubedo — to the gold — without passing through the fire.

That's the alchemical error. And it's why most personal growth remains superficial.

**Jung's Discovery**

Carl Jung spent decades studying alchemical texts and made a startling realization: the alchemists were unconsciously projecting the psychological process of individuation onto matter. They were doing depth psychology centuries before psychology existed as a discipline — using the laboratory as an externalized mirror of the psyche.

Jung's entire theory of individuation — the process of becoming whole, of integrating shadow, of moving toward the Self — maps precisely onto the stages of the Magnum Opus.

This convergence isn't coincidence. It's evidence that the alchemists were tracking something genuinely real about how human consciousness transforms.

**Collective Alchemy**

The Magnum Opus applies beyond individuals. Societies undergo collective Nigredo — periods of chaos, dissolution, and the exposure of what was previously hidden — before renewal becomes possible. Collective Albedo is the clearing that follows crisis. Rubedo is civilizational transformation.

We may be living through a collective Nigredo right now. Which makes understanding the map more urgent, not less.

**Reflection**
> Look back at a major transformation in your own life. Can you identify the stages of the Magnum Opus within it — the dissolution, the purification, the wisdom, the integration?
"""
    ),

    AlchemyModule(
        id: "al_02",
        number: 2,
        title: "Tria Prima — Soul, Spirit, Body",
        icon: "triangle.fill",
        tagline: "Paracelsus's three essences underlying all reality. And your personal imbalance.",
        stage: .foundation,
        readTime: 6,
        body: """
**The Holy Trinity of Existence**

Paracelsus (1493–1541) revolutionized alchemy with a single insight: all matter — and all life — consists of three essential principles. He called them the Tria Prima. They aren't elements in the periodic table sense. They're qualities, forces, modes of being.

**Sulfur — The Soul Principle**

Sulfur is the fiery force: will, passion, individuality, the driving energy that makes something uniquely itself. In a person, sulfur is your core drive, your ambition, your creative fire, your capacity for enthusiasm.

The danger of excess sulfur: it burns too hot. Ego inflation, arrogance, the inability to receive input from others. The person who is all sulfur is charismatic but consumed — unable to maintain, sustain, or connect.

**Mercury — The Spirit Principle**

Mercury is the fluid force: consciousness itself, adaptability, the capacity to move between worlds, to translate and transmit. Mercury is the bridge — between spirit and matter, between self and other, between inner vision and outer expression.

The danger of excess mercury: shapelessness. The person who is all mercury adapts so completely that they lose themselves. They're brilliant in connection but have no stable ground.

**Salt — The Body Principle**

Salt is the fixed force: structure, memory, endurance, the crystallized record of all that has been. In a person, salt is your accumulated experience, your physical presence, your capacity to maintain and stabilize.

The danger of excess salt: rigidity. The person who is all salt is reliable but stuck — unable to transform, unable to flow, preserving what should be released.

**The Equation of Life**

Soul dreams + Spirit connects + Body endures = the full equation of a functioning life.

The alchemist's task isn't to maximize any one of the three. It's to find the dynamic balance that allows all three to work together — the sulfur's fire channeled by mercury's adaptability, held in salt's stable container.

**Your Personal Inventory**

Where do you sit right now?

→ Excess sulfur: driven, intense, but burning out the people around you and potentially yourself
→ Excess mercury: brilliant, connective, but scattered, shapeless, unable to follow through
→ Excess salt: stable, reliable, but rigid, stuck, resistant to necessary change

The alchemical practice: identify your imbalance, then design daily practices to bring the deficient principle into greater expression.

**Practical Exercise**
On a scale of 1–10, rate your current expression of each:
— Sulfur (drive, passion, will)
— Mercury (adaptability, connection, communication)
— Salt (stability, consistency, follow-through)

Then: design one practice for the lowest-scoring principle and commit to it for the next lunar cycle.

**Reflection**
> What would it mean for you to be in dynamic balance among these three forces? What shifts would that require in how you're currently living?
"""
    ),

    AlchemyModule(
        id: "al_03",
        number: 3,
        title: "The Philosopher's Stone — The Real Goal",
        icon: "diamond.fill",
        tagline: "Not wealth. Not immortality. The perfected consciousness that transforms everything it touches.",
        stage: .foundation,
        readTime: 7,
        body: """
**Beyond the Literal**

The Philosopher's Stone is the most misunderstood symbol in all of alchemy. It has been portrayed as a magical object, a red powder, a chemical compound, a secret formula. All of these framings miss the central point.

The Philosopher's Stone is not something you *find*. It is something you *become*.

It is the perfect fusion of spirit and matter — the human being made whole. The alchemist who achieves the Stone has integrated every aspect of themselves: light and shadow, masculine and feminine, conscious and unconscious, temporal and eternal. They have passed through every stage of the Magnum Opus and arrived at a stable state of transformation.

And the remarkable property attributed to the Stone throughout alchemical literature — the ability to transmute base metals into gold through mere contact — is not about metallurgy. It describes what happens when a transformed person enters a room. What they touch transforms. Not through technique. Through presence.

**Jung's Integration**

Jung's interpretation is the most psychologically precise: the Philosopher's Stone represents the integrated Self — the full personality including both the conscious ego and the integrated shadow. When a person achieves this level of psychological wholeness, they acquire a kind of psychological immunity. They are no longer at the mercy of unconscious compulsions. They can choose their responses rather than being driven by hidden forces.

This is the alchemical gold. Not money. Not immortality. Psychological sovereignty.

**Historical Variations**

The Stone appears across alchemical traditions in multiple forms:
→ The Elixir of Life (longevity, vitality, healing)
→ The Universal Medicine or panacea (the capacity to heal all diseases)
→ The Red Powder (a specific material prepared through the Magnum Opus)
→ The internal state of Rubedo itself (the achieved stage, not a separate object)

What these variations share: they all describe a state of *completion* — of something that has passed through all transformations and arrived at its most refined expression.

**Modern Implications**

The "stone" as psychological wholeness manifests practically as:
→ **Resilience** — the capacity to encounter difficulty without being destroyed by it
→ **Creativity** — access to the full range of human experience as creative material
→ **Ethical power** — the capacity to act with integrity even under pressure
→ **Presence** — the ability to affect your environment through quality of being rather than manipulation of circumstances

These aren't mystical attributes. They're the documented outcomes of sustained psychological integration work.

**Meditative Practice**
Visualize your own Philosopher's Stone as a mandala — a complete image of yourself fully integrated. What does it look like? What qualities does it embody? What aspects of yourself does it include that you currently suppress?

**Reflection**
> What does "perfection" mean for you personally — not idealized human perfection, but *your* most refined expression? What would have to be integrated for you to embody that?
"""
    ),

    AlchemyModule(
        id: "al_04",
        number: 4,
        title: "The Four Elements + Quintessence",
        icon: "wind",
        tagline: "The archetypes of creation — and the fifth essence that unifies them.",
        stage: .foundation,
        readTime: 6,
        body: """
**The Language of Nature**

Before the periodic table, before atomic theory, alchemists worked with a different map of material reality: the four elements. These aren't meant to be taken literally as the building blocks of matter in the modern chemical sense. They're archetypes — fundamental qualities that appear at every level of existence, from matter to psyche to cosmos.

**Earth — Stability, Body, Roots**

Earth is density, groundedness, the capacity to hold form over time. In the psyche, earth is your body, your routines, your physical world, your relationship to material reality. The earth-dominant person is reliable, patient, and sustaining — but may resist necessary change.

Too little earth: scattered, ungrounded, unable to manifest ideas into form.
Too much earth: stuck, rigid, clinging to what should be released.

**Water — Emotion, Flow, Intuition**

Water is receptivity, fluidity, the intelligence of the body and heart. In the psyche, water is your emotional life, your intuitive capacity, your relationship to the unconscious. The water-dominant person feels deeply and connects easily — but may be overwhelmed by sensation.

Too little water: intellectually brilliant but emotionally tone-deaf.
Too much water: emotionally flooded, unable to act.

**Air — Thought, Communication, Freedom**

Air is movement, conceptualization, the capacity to see patterns and make connections. In the psyche, air is your intellectual life, your communication, your relationship to ideas and abstraction. The air-dominant person thinks clearly and communicates brilliantly — but may lose contact with body and feeling.

Too little air: concrete but unable to conceptualize or strategize.
Too much air: endlessly theorizing but never embodying.

**Fire — Will, Transformation, Passion**

Fire is intensity, initiation, the force of transformation itself. In the psyche, fire is your will, your passion, your capacity to initiate change and push through resistance. The fire-dominant person is magnetic and transformative — but may consume what they touch.

Too little fire: passive, waiting for permission, unable to begin.
Too much fire: destructive, burning through relationships and resources.

**Quintessence — The Fifth Element**

Above and beneath the four elements, alchemists recognized a fifth: the Quintessence, or Aether. The divine spirit that unifies all four — the "breath between them," the pure essence, the source of immortality and harmony.

In laboratory practice, the Quintessence was what was extracted from substances through repeated distillation — the most refined, most concentrated, most essential quality of the thing. The life force of the plant, the spirit of the metal.

In psychological terms: the Quintessence is the Self — the unified center that integrates all four elemental aspects of the psyche.

**Elemental Balancing Practice**

Spend one day consciously working with each element:
— Earth day: connect with your body, work with your hands, spend time in nature
— Water day: feel your emotions without judgment, practice intuitive listening
— Air day: study, write, have deep conversations, observe your thought patterns
— Fire day: exercise with intensity, make a decision you've been postponing, initiate something
— Quintessence day: meditate on the unity beneath all four, practice presence

**Reflection**
> Which element is most dominant in your current life? Which is most neglected? What specific practice would restore greater elemental balance?
"""
    ),

    AlchemyModule(
        id: "al_05",
        number: 5,
        title: "Nigredo — The Blackening",
        icon: "moon.fill",
        tagline: "The stage everyone wants to skip. The stage nothing real bypasses.",
        stage: .nigredo,
        readTime: 8,
        body: """
**The Stage Everything Real Passes Through**

Nigredo is the first and most terrifying stage of the Magnum Opus. The Latin word means blackening — and it describes exactly what happens in both the alchemical laboratory and the human psyche at the beginning of genuine transformation.

In the lab: matter is heated until it turns black, putrifies, dissolves. What existed before can no longer hold its form. Decomposition is not failure. It is preparation.

In the psyche: the structures you've built your identity upon begin to fail. Relationships end. Careers dissolve. Beliefs that once provided security reveal themselves as inadequate. The ego encounters what it cannot manage, cannot solve, cannot outrun.

This is not a mistake in your life. This is the beginning of your alchemy.

**The Shadow in Full View**

Jung identified Nigredo as the stage of shadow confrontation — the most challenging aspect of individuation. The shadow is everything you've pushed into the unconscious: the rage you were taught was unacceptable, the ambition you were told was shameful, the grief you never allowed yourself to feel, the aspects of yourself that didn't fit the person you constructed.

Nigredo brings the shadow into full view. Often involuntarily, through circumstances you didn't choose: a crisis that strips away your defenses, a loss that removes what you were using to avoid yourself, a failure that exposes the gap between who you present yourself as and who you actually are.

The alchemical instruction: do not run from this confrontation. Do not try to resolve it prematurely. The dissolution must be complete before purification can begin.

**"You Must Be Broken Before You Can Be Purified"**

This is the most consistently misunderstood alchemical principle. Breaking isn't the goal. But it is the inevitable and necessary precondition. You cannot build new structure in space occupied by old structure. The old must dissolve first.

The person who tries to skip Nigredo — who reaches for spiritual bypass, positive thinking, or premature resolution — doesn't avoid the stage. They delay it. And when it comes (and it always comes), it's more intense for having been suppressed.

**Signs You're in Nigredo**

→ A pervasive sense that what used to work no longer does
→ Loss of meaning or purpose in areas that previously felt clear
→ Confrontation with aspects of yourself you've been avoiding
→ External circumstances breaking down in ways that can't be controlled
→ A kind of productive despair — painful but somehow clarifying

**The Alchemist's Practice in Nigredo**

You don't fix Nigredo. You witness it. You stay present to the dissolution without collapsing it prematurely into premature resolution.

Journaling practice: write without editing. Confess — to yourself — what you're actually experiencing, not what you think you should be experiencing. This is Jung's "confession" stage.

The question to sit with: *What in me is dying, and why does part of me resist letting it go?*

**Reflection**
> Where in your current life are you experiencing Nigredo — dissolution, breakdown, the failure of old structures? Are you resisting the process or allowing it to complete?
"""
    ),

    AlchemyModule(
        id: "al_06",
        number: 6,
        title: "Albedo, Citrinitas & Rubedo — The Path to Gold",
        icon: "sun.max.fill",
        tagline: "Through purification and wisdom to the final integration.",
        stage: .rubedo,
        readTime: 9,
        body: """
**The Stages After the Fire**

Once Nigredo has completed its work — once the dissolution is genuine, not performed — the remaining stages of the Magnum Opus become possible. They cannot be forced. They cannot be entered through sheer will. They arise naturally from the completion of what preceded them.

**Albedo — The Whitening**

The laboratory work: the blackened, dissolved matter is washed, filtered, purified until white. What remains is the essential substance, stripped of everything impure.

The psychological work: the washing stage. After the confrontation of Nigredo — after the shadow has been seen clearly — a process of clarification begins. What you've acknowledged about yourself can now be understood, forgiven, and integrated rather than simply endured.

Albedo is the emergence of clarity. Not the false clarity of spiritual bypass — the genuine clarity that comes only after sustained encounter with what was previously avoided. The person in Albedo has looked honestly at their shadow and has begun to understand it rather than simply condemning it.

Jung called this stage illumination — the light that follows genuine darkness, not the artificial brightness of denial.

**Signs of Albedo:**
→ Increased compassion for yourself and others — because you now understand human fallibility from the inside
→ Clarity about what you want and why, undistorted by shadow compulsions
→ Ability to see situations without the distortion of heavy projection
→ A kind of inner spaciousness — as if something heavy has been set down

**Citrinitas — The Yellowing**

Often compressed into Albedo in later alchemical texts, Citrinitas represents the dawning of wisdom — the solar consciousness that follows purification. The color shift from white to gold.

In the psyche: the stage where the purified material of Albedo begins to generate genuine insight — not intellectual insight acquired from books, but lived wisdom earned through experience and integration. Intuition and intellect begin to work together rather than in competition.

Citrinitas is the moment the alchemist begins to understand *why* they went through what they went through. The suffering of Nigredo reveals its purpose. The purification of Albedo reveals what it was purifying toward.

**Rubedo — The Reddening**

The culminating stage. In the lab: the whitened, purified substance is heated once more — this time with fixed sulfur — producing the red Philosopher's Stone.

The psychological work: the union of opposites. The aspects of self that had been split — conscious and shadow, masculine and feminine, material and spiritual — integrate into a functioning whole.

Jung called this Transformation: the final stage of individuation in which the personality has been reorganized around the Self rather than the ego. The person is still fully human — still has preferences, emotions, the full range of experience — but is no longer at the mercy of unconscious compulsions. They have choice in how they meet their experience.

**Signs of Rubedo:**
→ A settled, stable relationship with yourself that isn't contingent on external circumstances
→ The capacity to hold paradox — to be with complexity without needing to collapse it
→ A quality of presence that affects others — the "transmuting" quality of the Philosopher's Stone
→ A sense of having arrived at your own nature, rather than performing someone else's

**Rubedo Does Not Mean the End**

The Magnum Opus is not a linear sequence you complete once. It's a spiral. After Rubedo comes new Nigredo — a new dissolution at a higher level of complexity. The alchemist who has completed one cycle enters the next at a more refined level.

This is why advanced practitioners aren't immune to crisis, loss, or dissolution. They encounter these with a fundamentally different relationship — not as catastrophes that negate their progress, but as the next invitation from the Magnum Opus.

**Reflection**
> Looking at your own life as a spiral of the Magnum Opus — where on the current spiral are you? And what would it mean to trust the stage you're in rather than rushing toward the one that seems more desirable?
"""
    ),

    AlchemyModule(
        id: "al_07",
        number: 7,
        title: "Transmutation in Daily Life",
        icon: "arrow.triangle.2.circlepath",
        tagline: "Turning lead into gold in your actual relationships, career, and inner life.",
        stage: .integration,
        readTime: 7,
        body: """
**The Real Application**

"Hate into compassion, fear into courage, pain into wisdom."

This is not poetic abstraction. This is the actual alchemical work available to every human being in every moment — the capacity to take base experience and, through conscious engagement with it, extract the gold it contains.

The alchemical secret that most personal development misses: the lead is not the obstacle to the gold. The lead *is* the material from which the gold is made.

Your anxiety isn't something to eliminate before you can live your life. It's prima materia — raw material awaiting conscious transformation. Your failed relationship isn't evidence that something is wrong with you. It's a Nigredo that contains genuine gold if you're willing to do the extraction.

**In Relationships**

The alchemical relationship is one in which both partners function as mirrors for each other's shadow work. What irritates you most about another person is almost always a projection of something you haven't yet integrated in yourself. The alchemical move: receive the irritation as information rather than evidence.

Practical: when a relationship triggers intense emotion, ask — before reacting — *what in me is being activated here? What does this person mirror back to me about myself that I haven't fully seen?*

This doesn't mean accepting mistreatment or suppressing legitimate responses. It means extracting the gold from the difficulty before responding from it.

**In Career and Creative Work**

The blocks you encounter in work — the procrastination, the self-sabotage, the fear of visibility — are shadow material in disguise. The alchemical approach: treat each block as a Nigredo to pass through rather than an obstacle to eliminate.

Identify the "lead" — the specific stuck place or fear — and design a 28-day transmutation protocol using the Tria Prima framework:
→ Sulfur practices: what would ignite your passion and will around this?
→ Mercury practices: what would allow you to flow through this with more flexibility?
→ Salt practices: what structure or routine would provide the stable container for the work?

**Environmental Alchemy**

The alchemists' concern wasn't only personal transformation — they understood the relationship between human consciousness and the material world. Modern application: the way we treat the outer world reflects the stage of our inner Magnum Opus.

Collective shadow work is required for collective transmutation. The environmental crisis is, in part, a collective Nigredo — the confrontation with the consequences of unconscious extraction and consumption.

**The 28-Day Transmutation Protocol**

Choose one "lead" in your current life — one area of persistent difficulty, stuck energy, or avoided experience.

Week 1 — Nigredo: Witness it fully. Journal without editing. Don't try to fix it. What is actually happening here?
Week 2 — Albedo: Begin to understand it. What is this protecting? What fear underlies it? Begin to see it with compassion rather than judgment.
Week 3 — Citrinitas: What wisdom does this difficulty contain? What has it been trying to teach you?
Week 4 — Rubedo: How will you be different when this is integrated? What decision, action, or change of orientation would complete the transmutation?

**Reflection**
> Choose one specific "lead" in your life right now. What stage of the Magnum Opus is it currently in? What would it mean to actively engage with the transmutation process rather than simply enduring the difficulty?
"""
    ),

    AlchemyModule(
        id: "al_08",
        number: 8,
        title: "Integration: Living as the Alchemist",
        icon: "sparkles",
        tagline: "You are now the crucible. The furnace is your inner fire.",
        stage: .integration,
        readTime: 8,
        body: """
**The Synthesis**

Megan Foster stood in her laboratory at 3 a.m., watching copper refuse to become gold despite following every ancient formula perfectly. Fifteen years of metallurgical mastery. Every technique in Thoth's alchemical texts. Yet the metals remained stubbornly unchanged.

Then something shifted. Not in her knowledge — in her entire way of being. The frustration dissolved into curiosity. The desperate need for results melted into patient understanding.

In that moment of inner transformation, the copper began to shimmer and change.

*"The metal didn't transform because of what I did. It transformed because of what I became."*

This is the culmination of alchemical education: you realize that all the outer techniques — the protocols, the stages, the elemental practices — were training wheels for something that cannot be taught directly. The capacity to *be* the transformation you seek to create.

**The Alchemist's Character**

After passing through the Magnum Opus — even partially, even in progress — certain qualities emerge that are characteristic of genuine alchemical development:

→ **The capacity to hold paradox.** To be with contradiction without needing to collapse it into false resolution. Certainty and uncertainty. Strength and vulnerability. Commitment and surrender. These are not opposites to be resolved but tensions to be inhabited.

→ **The crucible quality.** The alchemist becomes a container — for others' transformations, for difficult truths, for the intensity of the creative process. Not everyone can hold this. It's developed through the fire of their own Nigredo.

→ **The transmuting presence.** The Philosopher's Stone quality — not magic, but the real effect of genuine integration on the environment. Transformed people transform situations. Not through technique. Through what they've become.

**Contemporary Alchemy**

The alchemical impulse appears everywhere in modern life — often without being recognized as such:
→ Jungian analysis and depth psychology
→ Somatic experiencing and trauma integration
→ Psychedelic-assisted therapy (when done with genuine container and integration support)
→ Serious creative practice — art, music, writing as transformation
→ Conscious leadership that serves something larger than ego

The language changes. The underlying structure of the Magnum Opus remains.

**The Serious Warnings**

Alchemy attracts charlatans. It always has. Three contemporary failure modes to recognize and avoid:

**Spiritual bypass:** Using alchemical or spiritual language to avoid the actual work of shadow integration. The person who talks about transformation extensively while remaining immune to feedback, still running the same patterns, still reactive under pressure.

**Literal gold-seeking:** Modern practitioners who sell alchemical "formulas" for financial manifestation, claiming the same magical causation the medieval frauds claimed. If someone is selling you the Philosopher's Stone, they don't have it.

**Inflation of the unripened soul:** The hermetic texts' term for the person who has had genuine experiences but lacks the development to integrate them responsibly. Premature access to powerful states or practices without sufficient psychological foundation creates instability rather than wisdom.

**The Final Practice: Your Book of the Stone**

Create your personal alchemical record — a journal that tracks your Magnum Opus. Include:
→ Your current stage of the Great Work
→ The specific "lead" you're currently transmuting
→ Your Tria Prima balance and what needs correction
→ Your elemental strengths and deficiencies
→ Evidence of genuine transformation over time

Update it regularly. The Book of the Stone is not a spiritual achievement to display. It's a private laboratory record of your ongoing inner work.

**Closing**

The alchemists preserved one truth across every tradition, every century, every culture that practiced the Great Work:

*Man can become divine.*

Not as ego inflation. Not as spiritual narcissism. As humble participation in the eternal dance of fire, flow, and form. As the recognition that consciousness — your consciousness — is capable of extraordinary refinement, and that this refinement is not a luxury but an obligation to yourself and to the world you affect simply by being in it.

The lies dissolve when you step into the laboratory of your own being. The gold was never outside you.

Welcome to the Great Work.

**Reflection**
> Write the opening entry of your Book of the Stone. Where are you in the Magnum Opus right now, honestly? What is your current prima materia?
"""
    )
]

// MARK: - Hub View

struct AlchemyCourseView: View {
    @Environment(\.dismiss) var dismiss
    @State private var progress = AlchemyProgress.load()
    @State private var selectedModule: AlchemyModule?
    @State private var showModule = false
    @State private var filterStage: AlchemyStage? = nil

    private let accent = Color(hex: "#DAA520")
    private let bg     = Color(red: 0.04, green: 0.03, blue: 0.02)

    var body: some View {
        NavigationStack {
            ZStack {
                bg.ignoresSafeArea()
                alchemyCanvas

                ScrollView(showsIndicators: false) {
                    VStack(spacing: 22) {
                        heroHeader
                        progressCard
                        stageFilter
                        modulesList
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
                    Text("⚗️ Alchemy Unveiled").font(.system(size: 16, weight: .bold)).foregroundColor(.white)
                }
            }
            .fullScreenCover(isPresented: $showModule) {
                if let mod = selectedModule {
                    AlchemyModuleView(module: mod, accent: accent, progress: $progress)
                }
            }
        }
    }

    private var alchemyCanvas: some View {
        Canvas { ctx, size in
            let symbols = ["☿", "🜂", "🜁", "🜄", "🜃", "⊕", "◈", "∞", "△", "▽"]
            var rng = SystemRandomNumberGenerator()
            for _ in 0..<45 {
                let x = Double.random(in: 0...size.width, using: &rng)
                let y = Double.random(in: 0...size.height, using: &rng)
                let sym = symbols[Int.random(in: 0..<symbols.count, using: &rng)]
                ctx.opacity = Double.random(in: 0.04...0.12, using: &rng)
                ctx.draw(Text(sym).font(.system(size: CGFloat.random(in: 10...24, using: &rng))).foregroundColor(accent),
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
                // Ouroboros-inspired ring
                Circle().stroke(accent.opacity(0.15), lineWidth: 2).frame(width: 130, height: 130)
                Circle().stroke(accent.opacity(0.07), lineWidth: 2).frame(width: 155, height: 155)
                Text("⚗️").font(.system(size: 52))
            }
            VStack(spacing: 6) {
                Text("ALCHEMY UNVEILED").font(.system(size: 9, weight: .black)).tracking(3).foregroundColor(accent.opacity(0.6))
                Text("Exposing the Lies &\nMastering True Transformation").font(.system(size: 20, weight: .black)).foregroundColor(.white).multilineTextAlignment(.center)
                Text("9 modules · Nigredo to Rubedo · Jung, Paracelsus, the Great Work")
                    .font(.system(size: 11)).foregroundColor(.white.opacity(0.35)).multilineTextAlignment(.center)
            }
        }
    }

    private var progressCard: some View {
        let done = progress.completedModules.count
        let total = alchemyModules.count
        let pct = Double(done) / Double(total)
        return VStack(spacing: 8) {
            HStack {
                Text("\(done)/\(total) modules").font(.system(size: 12, weight: .bold)).foregroundColor(.white.opacity(0.6))
                Spacer()
                Text(done == total ? "⚗️ GREAT WORK COMPLETE" : "\(Int(pct * 100))% of the Opus").font(.system(size: 11, weight: .bold)).foregroundColor(accent)
            }
            GeometryReader { geo in
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 3).fill(Color.white.opacity(0.06)).frame(height: 5)
                    // Gradient through the alchemical color stages
                    RoundedRectangle(cornerRadius: 3)
                        .fill(LinearGradient(
                            colors: [Color(hex: "#2C2C2C"), Color(hex: "#B0C4DE"), Color(hex: "#DAA520"), Color(hex: "#B22222")],
                            startPoint: .leading, endPoint: .trailing))
                        .frame(width: geo.size.width * pct, height: 5)
                }
            }
            .frame(height: 5)
        }
        .padding(14)
        .background(RoundedRectangle(cornerRadius: 12).fill(Color.white.opacity(0.04)))
    }

    private var stageFilter: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 8) {
                FilterChip(label: "All", emoji: "⚗️", color: accent, isSelected: filterStage == nil) {
                    filterStage = nil
                }
                ForEach(AlchemyStage.allCases, id: \.self) { stage in
                    FilterChip(label: stage.rawValue, emoji: stage.emoji, color: stage.color, isSelected: filterStage == stage) {
                        filterStage = filterStage == stage ? nil : stage
                    }
                }
            }
            .padding(.horizontal, 2)
        }
    }

    private var modulesList: some View {
        let filtered = filterStage == nil ? alchemyModules : alchemyModules.filter { $0.stage == filterStage }
        return VStack(spacing: 10) {
            ForEach(filtered) { module in
                AlchemyModuleCard(module: module, accent: accent, isCompleted: progress.isComplete(module.id)) {
                    selectedModule = module
                    showModule = true
                }
            }
        }
    }
}

// MARK: - Filter Chip

struct FilterChip: View {
    let label: String
    let emoji: String
    let color: Color
    let isSelected: Bool
    let action: () -> Void

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

// MARK: - Module Card

struct AlchemyModuleCard: View {
    let module: AlchemyModule
    let accent: Color
    let isCompleted: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack(spacing: 14) {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(isCompleted ? module.stage.color.opacity(0.3) : module.stage.color.opacity(0.12))
                        .frame(width: 46, height: 46)
                    if isCompleted {
                        Image(systemName: "checkmark.circle.fill").font(.system(size: 20)).foregroundColor(module.stage.color)
                    } else {
                        Image(systemName: module.icon).font(.system(size: 17)).foregroundColor(module.stage.color)
                    }
                }
                VStack(alignment: .leading, spacing: 3) {
                    HStack(spacing: 6) {
                        Text(module.stage.emoji).font(.system(size: 10))
                        Text(module.stage.rawValue.uppercased()).font(.system(size: 9, weight: .black)).tracking(1.5).foregroundColor(module.stage.color.opacity(0.7))
                    }
                    Text("M\(module.number) · \(module.title)").font(.system(size: 13, weight: .bold)).foregroundColor(.white).lineLimit(2)
                    Text(module.tagline).font(.system(size: 11)).foregroundColor(.white.opacity(0.4)).lineLimit(1)
                    Text("\(module.readTime) min read").font(.system(size: 10)).foregroundColor(accent.opacity(0.5))
                }
                Spacer()
                Image(systemName: "chevron.right").font(.system(size: 12)).foregroundColor(.white.opacity(0.2))
            }
            .padding(14)
            .background(RoundedRectangle(cornerRadius: 14)
                .fill(isCompleted ? module.stage.color.opacity(0.06) : Color.white.opacity(0.03))
                .overlay(RoundedRectangle(cornerRadius: 14).stroke(
                    isCompleted ? module.stage.color.opacity(0.3) : Color.white.opacity(0.06), lineWidth: 1)))
        }
    }
}

// MARK: - Module Reader

struct AlchemyModuleView: View {
    let module: AlchemyModule
    let accent: Color
    @Binding var progress: AlchemyProgress
    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationStack {
            ZStack {
                Color(red: 0.04, green: 0.03, blue: 0.02).ignoresSafeArea()
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 24) {
                        // Stage badge + header
                        VStack(alignment: .leading, spacing: 10) {
                            HStack(spacing: 8) {
                                Text(module.stage.emoji).font(.system(size: 12))
                                Text(module.stage.rawValue.uppercased()).font(.system(size: 10, weight: .black)).tracking(2).foregroundColor(module.stage.color)
                                Spacer()
                                Text("MODULE \(module.number)").font(.system(size: 10, weight: .black)).tracking(2).foregroundColor(.white.opacity(0.25))
                            }
                            Text(module.title).font(.system(size: 21, weight: .black)).foregroundColor(.white)
                            Text(module.tagline).font(.system(size: 13)).foregroundColor(.white.opacity(0.5)).italic()
                            HStack(spacing: 5) {
                                Image(systemName: "clock").font(.system(size: 10))
                                Text("\(module.readTime) min read").font(.system(size: 11))
                            }
                            .foregroundColor(module.stage.color.opacity(0.6))
                        }

                        Divider().background(module.stage.color.opacity(0.3))

                        // Body
                        AlchemyBodyRenderer(text: module.body, accent: module.stage.color)

                        // Complete
                        Button {
                            progress.complete(module.id)
                            progress.save()
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) { dismiss() }
                        } label: {
                            HStack {
                                Image(systemName: progress.isComplete(module.id) ? "checkmark.circle.fill" : "checkmark.circle")
                                Text(progress.isComplete(module.id) ? "Module Complete" : "Mark Complete & Continue")
                                    .font(.system(size: 14, weight: .bold))
                            }
                            .foregroundColor(progress.isComplete(module.id) ? module.stage.color : .black)
                            .frame(maxWidth: .infinity).padding(.vertical, 14)
                            .background(progress.isComplete(module.id)
                                ? RoundedRectangle(cornerRadius: 14).fill(module.stage.color.opacity(0.15))
                                : RoundedRectangle(cornerRadius: 14).fill(module.stage.color))
                        }
                        .padding(.top, 8)

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
                    Text("⚗️ The Great Work").font(.system(size: 13, weight: .semibold)).foregroundColor(.white.opacity(0.5))
                }
            }
        }
    }
}

// MARK: - Body Renderer

struct AlchemyBodyRenderer: View {
    let text: String
    let accent: Color

    enum AlchemyBlockKind { case heading, subheading, quote, arrow, divider, body }
    struct AlchemyBlock: Identifiable { let id = UUID(); let kind: AlchemyBlockKind; let content: String }

    var body: some View {
        VStack(alignment: .leading, spacing: 14) {
            ForEach(parseBlocks()) { block in ablockView(block) }
        }
    }

    @ViewBuilder
    private func ablockView(_ block: AlchemyBlock) -> some View {
        switch block.kind {
        case .heading:
            Text(block.content).font(.system(size: 15, weight: .black)).foregroundColor(accent.opacity(0.9)).padding(.top, 6)
        case .subheading:
            Text(block.content).font(.system(size: 13, weight: .bold)).foregroundColor(accent.opacity(0.7)).padding(.top, 2)
        case .quote:
            HStack(spacing: 0) {
                Rectangle().fill(accent).frame(width: 3)
                Text(block.content).font(.system(size: 13)).foregroundColor(.white.opacity(0.75)).italic().padding(.leading, 12)
            }.padding(.vertical, 2)
        case .arrow:
            HStack(alignment: .top, spacing: 8) {
                Text("→").font(.system(size: 12)).foregroundColor(accent).padding(.top, 1)
                Text(block.content).font(.system(size: 13)).foregroundColor(.white.opacity(0.75)).fixedSize(horizontal: false, vertical: true)
            }
        case .divider:
            Divider().background(Color.white.opacity(0.08))
        case .body:
            Text(block.content).font(.system(size: 14)).foregroundColor(.white.opacity(0.8)).lineSpacing(5).fixedSize(horizontal: false, vertical: true)
        }
    }

    private func parseBlocks() -> [AlchemyBlock] {
        text.components(separatedBy: "\n")
            .map { $0.trimmingCharacters(in: .whitespaces) }
            .compactMap { line -> AlchemyBlock? in
                if line.isEmpty { return nil }
                if line == "---" { return AlchemyBlock(kind: .divider, content: "") }
                if line.hasPrefix("**") && line.hasSuffix("**") {
                    return AlchemyBlock(kind: .heading, content: line.replacingOccurrences(of: "**", with: ""))
                }
                if line.hasPrefix("*") && line.hasSuffix("*") {
                    return AlchemyBlock(kind: .quote, content: line.replacingOccurrences(of: "*", with: ""))
                }
                if line.hasPrefix("→ ") { return AlchemyBlock(kind: .arrow, content: String(line.dropFirst(2))) }
                if line.hasPrefix("— ") { return AlchemyBlock(kind: .arrow, content: String(line.dropFirst(2))) }
                let clean = line.replacingOccurrences(of: "**", with: "")
                return AlchemyBlock(kind: .body, content: clean)
            }
    }
}
