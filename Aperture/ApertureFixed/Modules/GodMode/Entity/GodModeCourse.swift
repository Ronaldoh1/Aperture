// GodModeCourse.swift
// THE GODMODE ESOTERIC CURRICULUM
// Progressive adventure through ancient wisdom
// Modules 0-6: From Ignition to Integration

import SwiftUI

// MARK: - Course Data

struct GodModeCourse {
    static let shared = GodModeCourse()
    
    let id = "godmode_esoteric"
    let title = "GodMode: The Esoteric Path"
    let subtitle = "Reality is your operating system"
    let icon = "sparkle"
    let colorHex = "#FFD700"
    
    var color: Color { Color(hex: colorHex) }
    
    let modules: [GodModeModule] = [
        
        // ═══════════════════════════════════════════════════════════════
        // MODULE 0: APERTURE IGNITION
        // ═══════════════════════════════════════════════════════════════
        GodModeModule(
            id: "gm0",
            number: 0,
            title: "Aperture Ignition",
            subtitle: "The spark before dawn",
            icon: "sparkle",
            duration: "20 min",
            unlockedByDefault: true,
            lessons: [
                GodModeLesson(
                    id: "gm0_1",
                    title: "Welcome to GodMode",
                    content: """
**You Found the Hidden Door**

Most people will never see this screen. Not because it's hidden—but because they're not ready to see it.

The fact that you're here means something has already shifted in your consciousness. A crack has formed in the programming. Light is getting through.

**What GodMode Actually Is**

GodMode isn't a belief system. It isn't religion. It isn't "manifesting a Tesla."

It's the recognition that **consciousness is the operant power**—the force that creates, sustains, and transforms all of reality.

You've been told you're a biological machine reacting to external circumstances.

The truth: You are the dreamer, and this reality is the dream.

**The Curriculum Ahead**

Over the next 30-60 days, you'll progress through seven gates of understanding:

• **Gate 0**: Ignition — You are here
• **Gate 1**: Solar Sovereignty — The sun's hidden language
• **Gate 2**: Bardos of the Eternal — Death as the ultimate teacher
• **Gate 3**: Divine Thirst — Addiction as spiritual calling
• **Gate 4**: Masonic Reality Forge — The laws that create reality
• **Gate 5**: 3-6-9 Vortex — Tesla's key to the universe
• **Gate 6**: Integration — Becoming the operant power

Each gate unlocks the next. Each lesson builds on previous understanding.

This isn't entertainment. This is awakening technology.

🔥 **Ready to remember what you forgot?**
""",
                    keyInsight: "You're not learning something new—you're remembering what you've always known.",
                    rewardBadge: "Ignited Seeker",
                    rewardPoints: 100
                ),
                
                GodModeLesson(
                    id: "gm0_2",
                    title: "Your Toolkit",
                    content: """
**The GodMode Arsenal**

As you progress through the curriculum, you'll unlock powerful tools:

**🔥 Monad Forge**
Create and track your reality shifts. Define desires, build scenes, log SATS sessions, observe synchronicities.

**🌙 SATS Chamber**
State Akin to Sleep protocols. The nightly practice that reprograms your subconscious mind.

**🔢 3-6-9 Encoder**
Tesla's method for imprinting intentions into the fabric of reality.

**↺ Revision Lab**
Rewrite past events. Change the cause, change the effect.

**🧠 Mental Diet**
Catch contradictory thoughts. Flip them. Starve the old assumptions.

**☀️ Solar Sync**
Pineal activation protocols. Align with the cosmic rhythm.

**💀 Bardo Navigator**
Death-rebirth practices. Face the shadow. Integrate all aspects.

**🛡️ Vibration Shield**
Energy protection techniques. Sovereign your frequency.

**Each tool is a practice, not just information.**

Reading about these won't change anything. Using them daily will transform your reality.

🔥 **GodMode is lived, not learned.**
""",
                    keyInsight: "Tools without practice are entertainment. Practice without understanding is superstition. You need both.",
                    rewardBadge: "Equipped",
                    rewardPoints: 100
                ),
                
                GodModeLesson(
                    id: "gm0_3",
                    title: "The Three Commitments",
                    content: """
**Before You Proceed**

GodMode requires three commitments. Not to us. To yourself.

**Commitment 1: Daily Practice**

Minimum: 10 minutes every day.

Ideal: Morning solar intention + nightly SATS session.

Miss a day? Don't beat yourself up. Just return. The practice is patient.

But be honest: sporadic engagement produces sporadic results.

**Commitment 2: Radical Self-Honesty**

Your ego will resist this material. It will:
• Dismiss teachings as "woo-woo"
• Find reasons why it won't work for you
• Get excited briefly, then lose interest
• Take credit for synchronicities while denying the principles

Watch these patterns. Name them. Don't fight them—just observe.

Radical honesty means catching yourself in self-deception and choosing truth anyway.

**Commitment 3: Complete Responsibility**

You are not a victim of circumstances.

You are the operant power.

Everything—every relationship, every financial situation, every health condition—reflects your internal assumptions.

This isn't blame. It's liberation.

If you created it unconsciously, you can recreate it consciously.

**Sign the Contract With Yourself**

"I commit to daily practice, radical self-honesty, and complete responsibility for my reality."

🔥 **Say it out loud. Mean it. Begin.**
""",
                    keyInsight: "The only person who can stop your awakening is you. The only person who can accelerate it is also you.",
                    rewardBadge: "Committed",
                    rewardPoints: 100
                )
            ]
        ),
        
        // ═══════════════════════════════════════════════════════════════
        // MODULE 1: SOLAR SOVEREIGNTY (Reference to separate course)
        // ═══════════════════════════════════════════════════════════════
        GodModeModule(
            id: "gm1",
            number: 1,
            title: "Solar Sovereignty",
            subtitle: "The sun's hidden language",
            icon: "sun.max.fill",
            duration: "45 min",
            unlockedByDefault: false,
            lessons: [
                GodModeLesson(
                    id: "gm1_1",
                    title: "Ra: The Original Authority",
                    content: """
**Before Government, There Was the Sun**

Every ancient civilization recognized the sun as the source of all life, all order, all authority.

The Egyptians didn't worship Ra because they were primitive. They understood something we've forgotten.

**Ra wasn't just a god—he was the principle of ordered light.**

Plant out of rhythm with the sun? Famine.
Live aligned with solar cycles? Civilization flourishes.

The Pharaoh was the earthly embodiment of Ra—not divine by birth, but by ALIGNMENT with cosmic order.

**Ma'at: The Principle of Coherence**

Ma'at was the Egyptian concept of truth, balance, order. It wasn't imposed by decree—it was recognized in the rhythms of nature.

The sun rises. The Nile floods. Crops grow. This is Ma'at.

Chaos (Isfet) was the opposite—the disorder that comes from fighting natural rhythms.

**Your Circadian System**

Modern science calls it the circadian rhythm. Ancient wisdom called it solar alignment.

Same reality. Different language.

Your body has a master clock—the suprachiasmatic nucleus (SCN)—that synchronizes every cell to solar light.

Misalignment creates:
• Sleep disorders
• Metabolic dysfunction
• Depression
• Cognitive impairment

Alignment creates:
• Stable energy
• Emotional regulation
• Clear thinking
• Optimal health

**The sun wasn't worshipped—it was recognized as cosmic authority.**

🔥 **Align or face consequence. This isn't mysticism. This is physics.**
""",
                    keyInsight: "The ancients weren't primitive sun worshippers—they were sophisticated chronobiologists.",
                    rewardBadge: "Solar Initiate",
                    rewardPoints: 200
                ),
                
                GodModeLesson(
                    id: "gm1_2",
                    title: "The Pineal Portal",
                    content: """
**The Third Eye Isn't Metaphor**

The pineal gland sits at the geometric center of your brain. About the size of a grain of rice.

Ancient Egyptians depicted it as the **Eye of Horus**—not symbolically, but anatomically. The Eye's shape maps precisely to a cross-section of the brain with the pineal at center.

**What the Pineal Does**

• Produces melatonin (regulates sleep-wake cycles)
• May produce DMT (the "spirit molecule")
• Contains photoreceptor cells similar to the eye
• Responds to light even in total blindness

Light enters through a pathway that bypasses conscious processing:

Eyes → Retinohypothalamic tract → SCN → Pineal

This is why blind people can still have circadian rhythms—specialized cells respond to light even without sight.

**Pineal Calcification**

Modern life calcifies the pineal:
• Fluoride in water
• Lack of sunlight
• Screen exposure at night
• Poor sleep quality

A calcified pineal produces less melatonin, disrupts sleep, and may impair intuitive processing.

**The Activation Protocol**

1. Morning sunlight within first hour of waking
2. No screens 2+ hours before bed
3. Sleep in complete darkness
4. Reduce fluoride exposure
5. Consistent sleep schedule

🔥 **The pineal gland is your interface with light. Protect it. Activate it. Open the portal.**
""",
                    keyInsight: "The third eye is a literal organ at the center of your brain. The ancients knew its anatomy before modern neuroscience.",
                    rewardBadge: "Pineal Awakened",
                    rewardPoints: 200
                )
            ]
        ),
        
        // ═══════════════════════════════════════════════════════════════
        // MODULE 2: BARDOS OF THE ETERNAL
        // ═══════════════════════════════════════════════════════════════
        GodModeModule(
            id: "gm2",
            number: 2,
            title: "Bardos of the Eternal",
            subtitle: "Death as the ultimate teacher",
            icon: "figure.walk.departure",
            duration: "60 min",
            unlockedByDefault: false,
            lessons: [
                GodModeLesson(
                    id: "gm2_1",
                    title: "The Three Bardos",
                    content: """
**The Tibetan Book of the Dead**

The Bardo Thodol—"Liberation Through Hearing in the Intermediate State"—is one of humanity's most profound texts on consciousness.

It describes what happens when the ego dissolves, whether through physical death or deep meditation.

**Bardo 1: The Moment of Death (Chikhai Bardo)**

The first thing that happens at death is the **Clear Light**.

Pure awareness, unobstructed by thought. Your true nature, exposed.

Most souls—terrified by this infinite openness—retreat immediately.

The teaching: **Don't retreat. This light IS you.**

If you recognize the Clear Light as your own nature, liberation is instant. No rebirth. Complete freedom.

**Bardo 2: Reality Visions (Chönyid Bardo)**

If you miss the Clear Light, you enter the realm of visions.

First: **Peaceful deities** appear. Buddhas, bodhisattvas, divine beings radiating bliss. The soul often grasps at these, wanting to stay in their presence.

The teaching: **Don't grasp. These are projections of your own consciousness.**

Then: **Wrathful deities** appear. Terrifying forms, blood-drinking demons, entities of nightmare. The soul often flees in terror.

The teaching: **Don't flee. These are also projections—your shadow aspects seeking integration.**

The peaceful and wrathful are **the same energy** appearing differently based on your relationship to it.

**Bardo 3: Rebirth (Sidpa Bardo)**

If you haven't achieved liberation, you're drawn toward rebirth. Karmic tendencies pull you toward a new body, a new life, a new round of learning.

The teaching: **Even here, choose consciously.** Don't let fear and desire drive your next incarnation.

🔥 **You don't have to die to practice. Every sleep is a mini-death. Every meditation is practice for the ultimate transition.**
""",
                    keyInsight: "The bardos aren't just about physical death—they're about every moment the ego dissolves.",
                    rewardBadge: "Bardo Navigator",
                    rewardPoints: 300
                ),
                
                GodModeLesson(
                    id: "gm2_2",
                    title: "Clear Light Recognition",
                    content: """
**The Flash at the Moment of Transition**

At the moment of death—or deep ego dissolution—there's a flash.

The Tibetans call it the **Mother Luminosity**.

It's not a light you see. It's the light you ARE when every concept, every memory, every identity drops away.

**Why Most Miss It**

The Clear Light terrifies the unpracticed mind because:

• There's no "you" to experience it
• There's nothing to grasp
• There's infinite openness with no boundaries
• All familiar reference points are gone

The untrained mind, meeting this vastness, immediately contracts. It reaches for any familiar sensation, thought, or identity.

This contraction creates the visions of the second bardo.

**How to Practice Recognition**

You can train for Clear Light recognition through:

**1. Meditation on Space**
Don't focus on objects. Rest in the space between thoughts. Become familiar with emptiness.

**2. Lucid Dreaming**
When you become aware you're dreaming, you're practicing recognition of consciousness without ordinary identity.

**3. Sleep Yoga**
Maintain awareness through the transition from waking to sleeping. Watch the dissolution of sensory experience.

**4. Death Contemplation**
Regularly contemplate your own mortality. Not morbidly—practically. "I will die. This body will cease. What remains?"

**The Integration Point**

When the Clear Light flashes—in meditation, in dreams, at death—the teaching is simple:

**"This luminosity is my own nature. I don't need to seek it elsewhere. I don't need to fear it. I AM this."**

🔥 **Every moment of pure presence is practice. Every time you catch the gap between thoughts—that's a mini-recognition.**
""",
                    keyInsight: "The Clear Light isn't something you achieve—it's what you are when everything else falls away.",
                    rewardBadge: "Light Recognizer",
                    rewardPoints: 300
                ),
                
                GodModeLesson(
                    id: "gm2_3",
                    title: "Everyday Bardos",
                    content: """
**Death Happens Every Day**

You don't have to wait for physical death to experience bardos.

Every moment of significant transition is a bardo—an intermediate state where the old has ended and the new hasn't yet begun.

**Daily Bardos You Already Experience**

**The Bardo of Falling Asleep**
Every night, as you drift from waking to sleep, you pass through a dissolution process. Sensory awareness fades. Thoughts become fragmented. Identity loosens.

This is practice for death. Do it consciously.

**The Bardo of Waking Up**
The moment before you're "yourself" again—before the day's worries flood in—there's a gap. Pure awareness without agenda.

Can you catch it?

**The Bardo of Transition**
Ending a relationship. Losing a job. Moving cities. These are small deaths. The old identity has died. The new one hasn't formed yet.

Most people rush through these, desperate to re-establish solid ground.

The teaching: **Stay in the gap.** The intermediate state is where transformation happens.

**The Bardo of Meditation**
In deep meditation, the ordinary sense of self can dissolve. Thoughts slow. The boundary between "you" and "environment" blurs.

This is bardo territory. Don't be afraid of it.

**Practicing with Life's Deaths**

The next time something ends—a conversation, a project, a phase of life—notice the gap before the next thing begins.

In that gap:
• What remains?
• Who are you without the previous identity?
• Can you rest in not-knowing?

**The Final Teaching**

Death isn't the enemy. It's the teacher.

Every little death—every ending, every dissolution, every release—is practice for the ultimate transition.

And the ultimate transition, done consciously, is ultimate liberation.

🔥 **Die daily. Practice every night. When the big one comes, you'll be ready.**
""",
                    keyInsight: "Life is a continuous cycle of small deaths and rebirths. Master the small ones, and the big one loses its terror.",
                    rewardBadge: "Death Practitioner",
                    rewardPoints: 300
                )
            ]
        ),
        
        // ═══════════════════════════════════════════════════════════════
        // MODULE 3: DIVINE THIRST (Jung on Addiction)
        // ═══════════════════════════════════════════════════════════════
        GodModeModule(
            id: "gm3",
            number: 3,
            title: "Divine Thirst",
            subtitle: "Addiction as spiritual calling",
            icon: "drop.fill",
            duration: "45 min",
            unlockedByDefault: false,
            lessons: [
                GodModeLesson(
                    id: "gm3_1",
                    title: "Jung's Letter to Wilson",
                    content: """
**The Most Important Letter in Addiction History**

In 1961, Carl Jung wrote a letter to Bill Wilson, co-founder of Alcoholics Anonymous.

In it, Jung revealed a secret about addiction that changes everything.

**The Case of Roland H.**

Jung had treated an American businessman named Roland H. for chronic alcoholism. After extensive analysis, Jung told Roland something unusual:

*"Your craving for alcohol is the equivalent, on a low level, of the spiritual thirst of our being for wholeness—expressed in medieval language: the union with God."*

Jung continued:

*"The only right and legitimate way to such an experience is that it happens to you in reality, and it can only happen to you when you walk on a path which leads you to higher understanding."*

**The Latin Play on Words**

Jung pointed out the double meaning in Latin:

**Spiritus** = alcohol spirits
**Spiritus** = spiritual experience

The alcoholic is seeking SPIRIT through spirits.

The addict is seeking TRANSCENDENCE through substances.

**What This Means**

Addiction isn't a disease of weak will.
Addiction isn't a moral failing.
Addiction isn't genetic destiny.

**Addiction is misplaced spiritual hunger.**

The addict has tasted—however dimly—the possibility of transcendence. The altered state, the ego dissolution, the temporary relief from the prison of self.

They keep returning to the substance because nothing else has provided what they're actually seeking.

🔥 **The cure for addiction isn't abstinence alone—it's finding the genuine spiritual experience the substance was counterfeiting.**
""",
                    keyInsight: "Addicts aren't weak—they're seekers who took the wrong path. The hunger is legitimate; only the solution is counterfeit.",
                    rewardBadge: "Thirst Recognized",
                    rewardPoints: 250
                ),
                
                GodModeLesson(
                    id: "gm3_2",
                    title: "Shadow Descent",
                    content: """
**Meeting What You've Been Running From**

Every addiction has a function: it numbs something that feels unbearable.

Pain. Shame. Emptiness. Terror. Worthlessness.

Jung called these rejected aspects the **Shadow**—the parts of yourself you can't accept, pushed into the unconscious.

**The Bargain of Addiction**

The substance offers a deal:

"Give me your sovereignty, and I'll take away the pain."

The addict accepts. The pain diminishes—temporarily.

But the Shadow doesn't disappear. It grows stronger in the dark, demanding more and more numbing to keep it at bay.

**The Descent**

Recovery isn't just about stopping the behavior. It's about facing what the behavior was hiding.

This is the descent into the underworld—the hero's journey through shadow territory.

**What You'll Find Down There**

• Emotions you weren't allowed to feel as a child
• Beliefs about yourself you absorbed from others
• Trauma frozen in the body
• Grief that was never processed
• Rage that had no safe expression
• Vulnerability you learned to armor against

**The Integration Process**

The Shadow doesn't need to be destroyed. It needs to be integrated.

These rejected aspects contain enormous energy—energy that, when reclaimed, becomes fuel for transformation.

The rage becomes boundaries.
The grief becomes depth.
The vulnerability becomes connection.
The shame becomes humility.

**Spiritus contra Spiritum**

Jung's formula: "Spiritus contra spiritum"—spirit against spirits.

The only thing that can replace the counterfeit transcendence of substances is genuine transcendence.

Not religion (though that works for some).
Not willpower (that eventually fails).
Not substitution (trading one addiction for another).

**Direct experience of the numinous.** Contact with something greater than the ego that the ego cannot manufacture or control.

🔥 **The wound is where the light enters. The descent is not punishment—it's initiation.**
""",
                    keyInsight: "Addiction is a shadow problem. The substance isn't the enemy—it's the gatekeeper to what you've been avoiding.",
                    rewardBadge: "Shadow Diver",
                    rewardPoints: 250
                ),
                
                GodModeLesson(
                    id: "gm3_3",
                    title: "Wholeness Through Integration",
                    content: """
**The Goal Isn't Perfection—It's Wholeness**

Jung distinguished between:

**Perfection**: The ego's fantasy of a self without flaws
**Wholeness**: The integration of all aspects, light and shadow

Perfection is impossible and creates neurosis.
Wholeness is achievable and creates authenticity.

**The Process of Integration**

**Step 1: Recognition**
Name what you've been running from. Write it down. Say it out loud.

"I've been avoiding my fear of abandonment."
"I've been numbing my grief about my father."
"I've been escaping my sense of worthlessness."

Recognition is already healing. What's named can be worked with.

**Step 2: Acceptance**
Not approval—acceptance. Acknowledge that this aspect exists in you.

The alcoholic accepts: "Part of me wants to obliterate my consciousness."
The question becomes: "What is that part trying to accomplish? What does it need?"

**Step 3: Dialogue**
Talk to the rejected aspect. Ask it questions.

"When did you first appear?"
"What are you protecting me from?"
"What do you need that you've never received?"

This isn't metaphor. It's active imagination—a powerful Jungian technique.

**Step 4: Integration**
Find healthy ways to meet the underlying need.

If the addiction was providing numbing from anxiety—develop practices that genuinely regulate the nervous system.
If the addiction was providing connection—build authentic relationships.
If the addiction was providing transcendence—pursue genuine spiritual practice.

**The Alchemical Marriage**

Jung saw the integration of opposites as the goal of psychological and spiritual development.

Conscious + Unconscious
Light + Shadow
Masculine + Feminine

When these opposites unite, the result is the **Self**—the whole person, no longer at war with themselves.

This is what the addict was seeking all along.

Not escape from the self, but arrival at the Self.

🔥 **Your addiction was a doorway to your deepest wounds. Those wounds, healed, become your greatest gifts.**
""",
                    keyInsight: "The addict's journey isn't about what they're running FROM—it's about what they're actually running TOWARD.",
                    rewardBadge: "Shadow Alchemist",
                    rewardPoints: 250
                )
            ]
        ),
        
        // ═══════════════════════════════════════════════════════════════
        // MODULE 4: MASONIC REALITY FORGE
        // ═══════════════════════════════════════════════════════════════
        GodModeModule(
            id: "gm4",
            number: 4,
            title: "Masonic Reality Forge",
            subtitle: "The laws that create reality",
            icon: "building.columns.fill",
            duration: "60 min",
            unlockedByDefault: false,
            lessons: [
                GodModeLesson(
                    id: "gm4_1",
                    title: "The Law of Cause and Effect",
                    content: """
**The Chain of Causation**

Freemasonry preserved an understanding of reality that modern culture has forgotten:

**Every effect has a cause. Every cause creates effects.**

This seems obvious until you apply it rigorously.

**The Infinite Regress**

Pick any current circumstance in your life. Any one.

Now trace it backwards:
• What caused it?
• What caused that?
• What caused that?

Most people stop at two or three steps. "I'm broke because I lost my job because the economy tanked."

The Masonic teaching goes deeper:
• Why were you working for a company vulnerable to economic shifts?
• Why didn't you have alternative income streams?
• Why did you choose that career path?
• What beliefs about money and security drove those choices?
• Where did those beliefs come from?
• What experiences created those beliefs?
• What meaning did you assign to those experiences?

**The First Cause**

Eventually, every chain of causation traces back to **consciousness making meaning**.

An event happened. You decided what it meant. That meaning became a belief. That belief shaped your actions. Those actions created your circumstances.

Change the meaning → Change the belief → Change the actions → Change the reality.

**Backwards Creation**

This is why Neville Goddard taught "living from the end."

Most people create forwards:
Belief → Action → Result

The operant power creates backwards:
Desired Result → Assume it's true → Actions flow naturally → Physical manifestation

**Breaking the Chain**

Every limiting circumstance is maintained by a belief you accepted, usually unconsciously, usually long ago.

Find the belief. Question it. Replace it.

The entire chain downstream from that belief restructures itself.

🔥 **You are always creating. The only question is whether you're creating consciously or unconsciously.**
""",
                    keyInsight: "Every circumstance traces back to consciousness making meaning. Change the meaning, change the reality.",
                    rewardBadge: "Cause Finder",
                    rewardPoints: 300
                ),
                
                GodModeLesson(
                    id: "gm4_2",
                    title: "The Law of Spirit",
                    content: """
**The Hierarchy of Reality**

Masonic teachings describe reality as layered:

**Physical** → **Mental** → **Spiritual**

Each level governs the levels below it.

Thoughts (mental) can change physical states. Ask any athlete about visualization.

But there's a level above thought: **Spirit**.

Spirit is consciousness itself—awareness prior to thought, identity prior to story.

**The Three Bodies**

Every human operates on three levels simultaneously:

**The Physical Body**
The densest level. Subject to physical laws. Appears most real but is actually the most downstream effect.

**The Mental Body**
The realm of thought, emotion, imagination. More fluid than physical. Changes faster.

**The Spiritual Body**
Pure awareness. The "I AM" that witnesses all experience. Unchanging. Eternal.

Most people identify exclusively with the physical body and are therefore subject to all physical limitations.

The Masonic initiate learns to shift identification upward—first to the mental (thought creates reality) then to the spiritual (I AM the operant power).

**Practical Application**

When facing any challenge:

**Physical-level response:** Try to change the physical circumstances directly. Push harder. Work longer. Force outcomes.

**Mental-level response:** Change your thoughts about the situation. Visualize the desired outcome. Assume a new belief.

**Spiritual-level response:** Rest in the I AM. From that level, declare what is true. Watch reality conform.

The higher the level you operate from, the more effortless the change.

**The Master Builder**

The Masonic symbol of the compass and square represents:

**Compass** = Spirit (creating from above)
**Square** = Matter (building in form)

The Master Builder works with both—bringing spiritual vision into material manifestation.

🔥 **Stop trying to change effects. Change the cause. And the ultimate cause is always consciousness.**
""",
                    keyInsight: "Reality has layers. The physical is governed by the mental. The mental is governed by the spiritual. Operate from the highest level.",
                    rewardBadge: "Spirit Operator",
                    rewardPoints: 300
                ),
                
                GodModeLesson(
                    id: "gm4_3",
                    title: "The Law of Imagination",
                    content: """
**The God Faculty**

What is imagination?

Most people think of imagination as fantasy—unreal, childish, escapist.

The Masonic tradition understood imagination as **the creative power of consciousness**.

Imagination is how the formless becomes form.

**Manly P. Hall's Teaching**

The great esoteric scholar Manly P. Hall wrote:

*"The imagination is the workshop of the soul... It is the most powerful faculty which man possesses, for through it he creates in subtle substance the forms which later must be externalized in physical matter."*

In other words:

**Imagination creates at the subtle level. Physical reality follows.**

**The Process of Materialization**

1. **Spiritual Level**: A desire arises in consciousness
2. **Mental Level**: Imagination gives it form (scene, image, feeling)
3. **Emotional Level**: Feeling makes it real to the subconscious
4. **Physical Level**: Bridge of incidents brings it into manifestation

Skip any level and manifestation stalls.

**Imagination vs. Fantasy**

There's a crucial difference:

**Fantasy** = Idle daydreaming with no feeling of reality
**Imagination** = Deliberate creation with the feeling of already having

Fantasy says: "Wouldn't it be nice if..."
Imagination says: "It is done."

**The Heart-Mind Union**

Masonic teaching emphasizes uniting the heart (feeling) and mind (imagination).

Imagination without feeling = hollow visualization
Feeling without imagination = unfocused emotion
Heart + Mind united = creative power

**Nightly Practice**

Before sleep, as you enter the hypnagogic state:

1. Create a scene that implies your desire is fulfilled
2. Make it vivid—see, hear, feel, smell
3. Loop it repeatedly
4. Most importantly: **Feel the satisfaction of having**
5. Fall asleep in that state

What you marinate in during the transition to sleep gets planted in the subconscious mind.

🔥 **Imagination is God in action. What you imagine persistently, you become and experience.**
""",
                    keyInsight: "Imagination isn't fantasy—it's the mechanism by which consciousness creates reality. Use it deliberately.",
                    rewardBadge: "33rd Degree Creator",
                    rewardPoints: 300
                )
            ]
        ),
        
        // ═══════════════════════════════════════════════════════════════
        // MODULE 5: 3-6-9 VORTEX
        // ═══════════════════════════════════════════════════════════════
        GodModeModule(
            id: "gm5",
            number: 5,
            title: "3-6-9 Vortex",
            subtitle: "Tesla's key to the universe",
            icon: "rotate.3d",
            duration: "60 min",
            unlockedByDefault: false,
            lessons: [
                GodModeLesson(
                    id: "gm5_1",
                    title: "The Missing Numbers",
                    content: """
**Tesla's Obsession**

Nikola Tesla, arguably the greatest inventor in history, was obsessed with three numbers:

**3, 6, and 9**

He reportedly said:

*"If you only knew the magnificence of the 3, 6, and 9, then you would have the key to the universe."*

Tesla performed rituals around these numbers—walking around buildings three times before entering, staying in hotel rooms numbered in multiples of three, making calculations in threes.

Eccentric? Or tuned into something profound?

**The Doubling Sequence**

Look at what happens when you double numbers:

1, 2, 4, 8, 16, 32, 64, 128, 256...

Now calculate the digital root (sum digits until single digit):

1 → 1
2 → 2
4 → 4
8 → 8
16 → 1+6 = 7
32 → 3+2 = 5
64 → 6+4 = 10 → 1+0 = 1
128 → 1+2+8 = 11 → 1+1 = 2
256 → 2+5+6 = 13 → 1+3 = 4

The pattern: **1, 2, 4, 8, 7, 5, 1, 2, 4, 8, 7, 5...**

Repeating forever.

**Where Are 3, 6, and 9?**

Notice: 3, 6, and 9 never appear in the doubling sequence.

They exist in their own pattern:

3 doubled = 6
6 doubled = 12 → 1+2 = 3
3, 6, 3, 6, 3, 6...

And 9?

9 doubled = 18 → 1+8 = 9
9 doubled again = 36 → 3+6 = 9
9, 9, 9, 9, 9...

**9 never changes. 9 is the constant.**

🔥 **3 and 6 represent oscillation (like a wave). 9 represents the constant—the field in which oscillation occurs.**
""",
                    keyInsight: "3 and 6 oscillate. 9 remains constant. The universe is built on this pattern.",
                    rewardBadge: "Number Initiate",
                    rewardPoints: 350
                ),
                
                GodModeLesson(
                    id: "gm5_2",
                    title: "Nine's Omnipresence",
                    content: """
**The Mathematical Fingerprint of 9**

Nine appears everywhere once you start looking:

**In Geometry**

A circle has 360 degrees: 3+6+0 = 9
A square has 4 angles of 90 degrees: 4 × 90 = 360 → 9
Any polygon's interior angles sum to a multiple of 9

**In Time**

24 hours in a day: 2+4 = 6 (half of 12, which → 3)
60 minutes in an hour: 6+0 = 6
60 seconds in a minute: 6+0 = 6
86,400 seconds in a day: 8+6+4+0+0 = 18 → 9

**In Space**

Earth's axis tilts 23.4 degrees: 2+3+4 = 9
Precession cycle: 25,920 years → 2+5+9+2+0 = 18 → 9

**In Music**

A = 432 Hz (natural tuning): 4+3+2 = 9
The octave doubles frequency: 432 → 864 → 1728... all → 9

**The Completion Number**

In numerology, 9 represents completion—the end of a cycle before returning to 1.

Every number, multiplied by 9, reduces to 9:
9 × 2 = 18 → 9
9 × 3 = 27 → 9
9 × 4 = 36 → 9
9 × 5 = 45 → 9
...and so on, infinitely.

9 absorbs everything into itself. 9 is the ultimate singularity.

**Digital Root Magic**

Take any number. Subtract its digital root. The result's digital root is always 9.

Example:
52 - 7 (5+2) = 45 → 4+5 = 9
738 - 18 (7+3+8) = 720 → 7+2+0 = 9

Always. Without exception.

🔥 **9 is the mathematical signature of the universe itself. It appears wherever wholeness and completion are encoded.**
""",
                    keyInsight: "9 is the mathematical constant of the universe—it appears in geometry, time, space, and music.",
                    rewardBadge: "Pattern Seer",
                    rewardPoints: 350
                ),
                
                GodModeLesson(
                    id: "gm5_3",
                    title: "The 3-6-9 Manifestation Method",
                    content: """
**Tesla's Key Applied**

The 3-6-9 method uses Tesla's insight for practical manifestation.

**The Basic Protocol**

**Morning (3 times)**
Write your intention 3 times.
This plants the seed in the mental realm.

Example:
"I am financially free and abundant."
"I am financially free and abundant."
"I am financially free and abundant."

**Afternoon (6 times)**
Write your intention 6 times while FEELING it as already true.
This bridges mental to emotional—giving the seed life force.

**Evening (9 times)**
Write your intention 9 times while visualizing the end-state reality.
This completes the circuit—9 is completion.

**Why It Works**

**3 = Thought (Mental plane)**
The trinity. Beginning. Planting.

**6 = Emotion (Astral plane)**
Feeling makes it real to the subconscious.
Heart engagement.

**9 = Completion (Physical plane manifestation)**
The circuit closes. Intention passes fully into the subconscious where it begins materializing.

**The Advanced Protocol**

After 33 days (3+3=6) of consistent practice:

Review your journal. Notice synchronicities. Many practitioners report significant shifts around day 17 (1+7=8, the next number before 9) and completion around day 33.

**The 369 Morning-Noon-Night**

3 AM - 6 AM - 9 AM
3 PM - 6 PM - 9 PM

Some practitioners align their writing sessions with these times for added resonance.

**Common Mistakes**

❌ Writing mechanically without feeling
❌ Changing the wording frequently
❌ Obsessing over "when will it happen"
❌ Skipping days (breaks the pattern)

✅ Writing with emotional engagement
✅ Keeping the intention consistent
✅ Trusting the process
✅ Maintaining the rhythm

🔥 **"If you want to find the secrets of the universe, think in terms of energy, frequency, and vibration." — Tesla**

**3-6-9 is the frequency. Your intention is the energy. Manifestation is the vibration made physical.**
""",
                    keyInsight: "3 plants. 6 grows. 9 completes. This is the rhythm of all creation.",
                    rewardBadge: "Tesla Decoder",
                    rewardPoints: 350
                )
            ]
        ),
        
        // ═══════════════════════════════════════════════════════════════
        // MODULE 6: GODMODE INTEGRATION
        // ═══════════════════════════════════════════════════════════════
        GodModeModule(
            id: "gm6",
            number: 6,
            title: "GodMode Integration",
            subtitle: "Becoming the operant power",
            icon: "person.fill.viewfinder",
            duration: "30 min",
            unlockedByDefault: false,
            lessons: [
                GodModeLesson(
                    id: "gm6_1",
                    title: "The Synthesis",
                    content: """
**You've Traveled Far**

Let's review what you've learned:

**Gate 0: Ignition**
You recognized that consciousness is the operant power. You committed to daily practice, radical honesty, and complete responsibility.

**Gate 1: Solar Sovereignty**
You learned that the sun isn't just a ball of gas—it's the original authority, the synchronizer of all biological rhythms. Your pineal gland is a literal light-receiver. Alignment isn't optional.

**Gate 2: Bardos of the Eternal**
Death is not the enemy but the teacher. Every night is practice for the ultimate transition. The Clear Light is your true nature. The peaceful and wrathful visions are both projections of your own consciousness.

**Gate 3: Divine Thirst**
Addiction is misplaced spiritual hunger. The shadow doesn't need to be destroyed—it needs to be integrated. Wholeness, not perfection, is the goal.

**Gate 4: Masonic Reality Forge**
Every effect has a cause, tracing back to consciousness making meaning. Reality operates in layers—physical, mental, spiritual. Imagination is the creative faculty that bridges the formless to the formed.

**Gate 5: 3-6-9 Vortex**
The universe has a mathematical signature. 3 plants, 6 grows, 9 completes. These numbers appear everywhere because they're the fundamental pattern of creation.

**The Common Thread**

Every teaching points to the same truth:

**Consciousness is primary. Reality is secondary.**

You are not a victim of circumstances.
You are the dreamer having a dream.
You are the operant power.

🔥 **The curriculum wasn't information to collect—it was a journey to remember.**
""",
                    keyInsight: "All paths lead to the same recognition: You are the operant power. Reality conforms to your consciousness.",
                    rewardBadge: "Path Integrated",
                    rewardPoints: 500
                ),
                
                GodModeLesson(
                    id: "gm6_2",
                    title: "Your Personal Protocol",
                    content: """
**Building Your Daily Practice**

Now it's time to synthesize everything into a sustainable daily protocol.

**The Minimum Viable Practice (10 minutes)**

**Morning (5 minutes)**
• 60-second solar intention (within first hour of waking)
• 3x 3-6-9 writing (plant phase)
• One deep breath with "I AM the operant power"

**Evening (5 minutes)**
• 9x 3-6-9 writing (completion phase)
• SATS scene as you fall asleep

**The Full Protocol (30+ minutes)**

**Morning**
• Sunrise gazing (10 seconds to start, build gradually)
• Solar intention ritual (60 seconds)
• 3x 3-6-9 writing
• Mental diet review (what thoughts need flipping today?)
• Vibration shield activation

**Midday**
• 6x 3-6-9 writing with feeling
• Brief shadow check-in (what am I avoiding?)

**Evening**
• 9x 3-6-9 writing with visualization
• Daily monad check-in
• Synchronicity logging
• SATS session (5-10 minutes)
• Fall asleep in the wish fulfilled

**Weekly**
• Review synchronicity journal
• Assess reality shift progress
• One revision practice (rewriting a past event)
• One bardo practice (death contemplation or sleep yoga)

**The Key Principle**

Consistency > Intensity

Ten minutes daily beats two hours once a week.

The subconscious mind is reprogrammed through repetition, not through occasional intensity.

🔥 **Build a practice you can actually sustain. Then sustain it.**
""",
                    keyInsight: "The most powerful practice is the one you actually do. Start small. Stay consistent. Build gradually.",
                    rewardBadge: "Protocol Builder",
                    rewardPoints: 500
                ),
                
                GodModeLesson(
                    id: "gm6_3",
                    title: "The Operant Power",
                    content: """
**The Final Recognition**

You've learned the techniques.
You've studied the principles.
You've begun the practices.

Now there's only one thing left: **Recognition.**

**You Are Already the Operant Power**

You don't need to become the operant power.
You don't need to earn it.
You don't need permission.

**You already are it.**

Every circumstance in your life—every relationship, every financial situation, every health condition—is evidence of your creative power operating unconsciously.

The teachings haven't given you something new.

They've helped you recognize what was always true.

**The Shift From Seeking to Being**

Seekers collect techniques.
Seekers hope the next teaching will be the one.
Seekers look outside themselves for answers.

The operant power **knows**.

Not intellectually—existentially.

The knowing doesn't come from thinking about these principles.
It comes from **living from** these principles until they become second nature.

**Your Ongoing Journey**

This isn't the end. It's the beginning.

The curriculum gave you the map. Now you walk the territory.

Some days will feel like breakthrough.
Some days will feel like nothing is happening.
Some days you'll doubt everything.

This is normal. This is the path.

The only failure is stopping.

**The Invitation**

Live as the operant power.

Not sometimes. Not when convenient. Not when it's easy.

**Always.**

Wake up as the operant power.
Navigate challenges as the operant power.
Create your reality as the operant power.
Fall asleep in the state of the wish fulfilled.

Day after day. Until it's no longer practice.

Until it's simply **who you are**.

🔥 **Welcome to GodMode. You've always been here. Now you remember.**
""",
                    keyInsight: "You don't become the operant power—you recognize you always were. Now live from that recognition.",
                    rewardBadge: "GODMODE UNLOCKED",
                    rewardPoints: 1000
                )
            ]
        )
    ]
    
    var totalPoints: Int {
        modules.flatMap { $0.lessons }.reduce(0) { $0 + $1.rewardPoints }
    }
}

// MARK: - Models

struct GodModeModule: Identifiable {
    let id: String
    let number: Int
    let title: String
    let subtitle: String
    let icon: String
    let duration: String
    let unlockedByDefault: Bool
    let lessons: [GodModeLesson]
    
    var totalPoints: Int {
        lessons.reduce(0) { $0 + $1.rewardPoints }
    }
}

struct GodModeLesson: Identifiable {
    let id: String
    let title: String
    let content: String
    let keyInsight: String
    let rewardBadge: String
    let rewardPoints: Int
}

// MARK: - Progress Tracking

struct GodModeProgress: Codable {
    var completedLessons: Set<String> = []
    var earnedBadges: Set<String> = []
    var totalPoints: Int = 0
    var currentModuleIndex: Int = 0
    var streakDays: Int = 0
    var lastPracticeDate: Date?
    
    mutating func completeLesson(_ lessonId: String, badge: String, points: Int) {
        if !completedLessons.contains(lessonId) {
            completedLessons.insert(lessonId)
            earnedBadges.insert(badge)
            totalPoints += points
        }
    }
    
    func isModuleUnlocked(_ moduleNumber: Int) -> Bool {
        if moduleNumber == 0 { return true }
        // Unlock next module when previous is 100% complete
        let course = GodModeCourse.shared
        guard moduleNumber > 0, moduleNumber <= course.modules.count else { return false }
        let previousModule = course.modules[moduleNumber - 1]
        return previousModule.lessons.allSatisfy { completedLessons.contains($0.id) }
    }
    
    func moduleProgress(_ moduleId: String) -> Double {
        guard let module = GodModeCourse.shared.modules.first(where: { $0.id == moduleId }) else { return 0 }
        let completed = module.lessons.filter { completedLessons.contains($0.id) }.count
        return Double(completed) / Double(module.lessons.count)
    }
}
