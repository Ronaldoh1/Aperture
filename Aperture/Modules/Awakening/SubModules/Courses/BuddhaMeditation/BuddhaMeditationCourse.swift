// BuddhaMeditationCourse.swift
// AWAKENING THROUGH MEDITATION - Buddha's Original Teachings

import SwiftUI

// MARK: - Course Data

struct BuddhaMeditationCourse {
    static let shared = BuddhaMeditationCourse()
    
    let id = "buddha_meditation"
    let title = "Buddha's Path to Awakening"
    let subtitle = "The original technology of liberation"
    let icon = "figure.mind.and.body"
    let colorHex = "#FF9800"
    let totalMinutes = 180
    
    var color: Color { Color(hex: colorHex) }
    
    let modules: [BuddhaModule] = [
        
        // MODULE 1: THE FOUR NOBLE TRUTHS
        BuddhaModule(
            id: "buddha_1",
            number: 1,
            title: "The Four Noble Truths",
            subtitle: "The diagnosis and cure",
            icon: "4.circle.fill",
            lessons: [
                BuddhaLesson(
                    id: "b1_1",
                    title: "Dukkha: The Truth of Suffering",
                    duration: 8,
                    content: """
The Buddha's first teaching after enlightenment wasn't about bliss or transcendence—it was about suffering. This wasn't pessimism; it was radical honesty.

**What is Dukkha?**
Dukkha is often translated as "suffering," but it's subtler than that. It means unsatisfactoriness, dis-ease, the inability of conditioned phenomena to provide lasting fulfillment.

The Buddha identified three types:
• **Dukkha-dukkha**: Obvious suffering—pain, illness, loss
• **Viparinama-dukkha**: Suffering of change—even pleasure becomes suffering when it ends
• **Sankhara-dukkha**: The suffering of conditioned existence—the subtle unsatisfactoriness of being a separate self

**The Courage to Look**
Most people spend their lives running from dukkha through distraction, pleasure-seeking, or denial. The Buddha's radical move was to turn toward it, examine it, understand it completely.

This isn't masochism—it's the beginning of freedom. You cannot be liberated from what you refuse to see.

🔥 **Key Insight**: Suffering isn't a problem to be solved but a truth to be understood. Understanding it fully IS the beginning of its end.
""",
                    practice: "Sit quietly for 10 minutes. Notice any subtle dissatisfaction, restlessness, or wanting things to be different. Don't try to fix it—just see it clearly.",
                    keyPoints: [
                        "Dukkha means unsatisfactoriness, not just pain",
                        "Three types: obvious suffering, suffering of change, existential suffering",
                        "Liberation begins with honest acknowledgment"
                    ]
                ),
                
                BuddhaLesson(
                    id: "b1_2",
                    title: "Samudaya: The Origin of Suffering",
                    duration: 8,
                    content: """
The Second Noble Truth identifies the CAUSE of suffering: craving (tanha) and clinging (upadana).

**The Three Types of Craving**
• **Kama-tanha**: Craving for sensory pleasure
• **Bhava-tanha**: Craving for existence, becoming, being someone
• **Vibhava-tanha**: Craving for non-existence, escape, annihilation

Notice: even the desire to escape suffering is itself a form of craving that perpetuates suffering.

**The Chain of Dependent Origination**
The Buddha mapped how suffering arises through 12 links:
Ignorance → Mental formations → Consciousness → Mind-body → Six senses → Contact → Feeling → Craving → Clinging → Becoming → Birth → Aging and death

Each link conditions the next. Break any link, and the whole chain collapses.

**Why We Crave**
At the root is ignorance (avijja)—not seeing things as they are. We believe:
• That pleasure will satisfy permanently
• That we are a fixed, separate self
• That grasping can bring security

These delusions drive the endless cycle of craving and suffering.

🔥 **Key Insight**: You don't suffer because of what happens. You suffer because of craving for things to be different than they are.
""",
                    practice: "Throughout the day, notice moments of wanting or not-wanting. Don't judge—just observe. See how craving creates tension in the body and mind.",
                    keyPoints: [
                        "Craving (tanha) is the direct cause of suffering",
                        "Three cravings: for pleasure, for becoming, for non-existence",
                        "Ignorance of reality's true nature drives craving"
                    ]
                ),
                
                BuddhaLesson(
                    id: "b1_3",
                    title: "Nirodha: The Cessation of Suffering",
                    duration: 7,
                    content: """
The Third Noble Truth is the good news: suffering CAN end. Completely. This isn't wishful thinking—it's the Buddha's direct report from experience.

**What is Nibbana (Nirvana)?**
Nibbana literally means "extinguishing" or "blowing out"—like a flame going out. What's extinguished? Craving, aversion, and delusion.

It's NOT:
• Annihilation or nothingness
• A place you go after death
• Eternal bliss in some other realm
• Escapism or checking out

It IS:
• The end of craving and clinging
• Unconditional peace that doesn't depend on circumstances
• Available here and now, not after death
• The natural state when delusion falls away

**Nibbana is Not Produced**
Unlike everything else, Nibbana is not caused or created. It's not the result of practice—practice just removes the obstructions that hide it. It's what remains when craving ceases.

**The Taste of Freedom**
The Buddha described Nibbana as: "The unborn, unoriginated, uncreated, unformed." It's the one thing that isn't subject to arising and passing away.

🔥 **Key Insight**: Liberation isn't something you achieve. It's what's already here when you stop doing the things that create bondage.
""",
                    practice: "Find a moment of natural contentment—not excitement, just peace. Notice: nothing needs to be added or removed. This is a taste of the unconditioned.",
                    keyPoints: [
                        "Nibbana is the complete cessation of craving",
                        "It's not a place but a liberation available now",
                        "Not produced—revealed when obstructions fall away"
                    ]
                ),
                
                BuddhaLesson(
                    id: "b1_4",
                    title: "Magga: The Path to Liberation",
                    duration: 8,
                    content: """
The Fourth Noble Truth is the practical path: the Noble Eightfold Path. This is the Buddha's "how-to" manual for awakening.

**The Eightfold Path**

**Wisdom (Pañña)**
1. **Right View**: Understanding the Four Noble Truths, impermanence, no-self
2. **Right Intention**: Renunciation, goodwill, harmlessness

**Ethics (Sīla)**
3. **Right Speech**: Truthful, helpful, kind, timely
4. **Right Action**: Not killing, stealing, sexual misconduct
5. **Right Livelihood**: Work that doesn't cause harm

**Meditation (Samādhi)**
6. **Right Effort**: Cultivating wholesome states, abandoning unwholesome
7. **Right Mindfulness**: Clear awareness of body, feelings, mind, phenomena
8. **Right Concentration**: Unified, stable attention (jhanas)

**Not Sequential—Simultaneous**
These aren't steps to complete in order. They develop together, each supporting the others. Ethics supports meditation; meditation deepens wisdom; wisdom clarifies ethics.

**The Middle Way**
The Buddha called this the "Middle Way"—between self-indulgence and self-mortification. Neither suppressing experience nor drowning in it.

🔥 **Key Insight**: The path isn't about becoming someone else. It's about removing what obscures your natural clarity and compassion.
""",
                    practice: "Choose one aspect of the path to focus on this week. Notice how it connects to all the others.",
                    keyPoints: [
                        "Eight factors: wisdom, ethics, meditation",
                        "Developed simultaneously, not sequentially",
                        "The Middle Way between extremes"
                    ]
                )
            ]
        ),
        
        // MODULE 2: THE THREE MARKS OF EXISTENCE
        BuddhaModule(
            id: "buddha_2",
            number: 2,
            title: "The Three Marks of Existence",
            subtitle: "Seeing reality as it is",
            icon: "eye.fill",
            lessons: [
                BuddhaLesson(
                    id: "b2_1",
                    title: "Anicca: Impermanence",
                    duration: 8,
                    content: """
Everything that arises, passes away. This isn't philosophy—it's observable fact. The Buddha made this direct perception the foundation of insight.

**Levels of Impermanence**
• **Gross**: Seasons change, people die, empires fall
• **Subtle**: Each breath is unique, thoughts arise and vanish
• **Momentary**: At the deepest level, experience is a stream of discrete moments arising and passing many times per second

**Why This Matters**
When you truly see impermanence, clinging becomes obviously futile. Why grasp at what's already dissolving? This isn't sad—it's liberating.

**The Good News**
Impermanence means:
• No suffering is permanent
• You can change
• Every moment is fresh
• The past doesn't bind you

**Meditation on Impermanence**
In deep practice, you can observe the momentary arising and passing of phenomena directly. This isn't intellectual—it's felt in the body, seen in real-time.

🔥 **Key Insight**: The stability you seek by clinging is impossible. The freedom you want comes from releasing into the flow.
""",
                    practice: "For 10 minutes, watch sensations arise and pass in the body. Notice: nothing stays the same for even a moment.",
                    keyPoints: [
                        "All conditioned phenomena are impermanent",
                        "Impermanence operates at multiple levels—gross to momentary",
                        "Seeing impermanence deeply ends clinging"
                    ]
                ),
                
                BuddhaLesson(
                    id: "b2_2",
                    title: "Dukkha: Unsatisfactoriness",
                    duration: 7,
                    content: """
We covered dukkha as the First Noble Truth. Here we examine it as a characteristic of ALL conditioned experience.

**Why Everything Conditioned is Dukkha**
If something is impermanent, it cannot provide lasting satisfaction. This isn't pessimism—it's clear seeing.

Even pleasant experiences are dukkha because:
• They end
• They require maintenance
• They create fear of loss
• They're never quite enough

**The Subtle Dukkha**
Beyond obvious suffering is the unsatisfactoriness of trying to be a separate self in a flowing universe. The self is always slightly anxious, always needing more, always defending itself.

**This Isn't Nihilism**
Seeing dukkha clearly doesn't mean rejecting life. It means releasing the impossible demand that conditioned things provide unconditioned satisfaction.

Nibbana isn't dukkha. The unconditioned is not unsatisfactory. That's why it's worth seeking.

🔥 **Key Insight**: Pleasure isn't the problem. Expecting pleasure to be other than fleeting IS the problem.
""",
                    practice: "Observe something pleasant without trying to extend or hold it. Notice the peace in just letting it be what it is.",
                    keyPoints: [
                        "All conditioned phenomena have an inherent unsatisfactoriness",
                        "Even pleasure is dukkha when clung to",
                        "Only the unconditioned provides lasting peace"
                    ]
                ),
                
                BuddhaLesson(
                    id: "b2_3",
                    title: "Anattā: Not-Self",
                    duration: 10,
                    content: """
This is the Buddha's most radical teaching and the most misunderstood. Anattā doesn't mean "you don't exist"—it means there's no fixed, permanent, independent self.

**What the Buddha Actually Taught**
He didn't say "there is no self." He said: "All phenomena are not-self" (sabbe dhammā anattā). Nothing you can point to—body, feelings, perceptions, thoughts, consciousness—is the self.

**The Five Aggregates**
The Buddha analyzed "self" into five components (skandhas):
1. Form (body)
2. Feeling (pleasant/unpleasant/neutral)
3. Perception (recognition)
4. Mental formations (will, emotion, thought)
5. Consciousness (knowing)

Each aggregate is:
• Impermanent
• Not under your control
• Not "you"

**Who's Asking?**
If there's no self, who's reading this? Who meditates? The Buddha didn't deny conventional selfhood—he denied an ultimate, permanent self. There's a process, just not an owner of the process.

**Liberation Through Anattā**
When you stop defending a self that doesn't ultimately exist, suffering collapses. There's no one to be hurt, threatened, or disappointed.

🔥 **Key Insight**: You don't need to destroy the self—just see that it was never there in the way you believed.
""",
                    practice: "Look for the 'self' directly. Where is it? In the body? Thoughts? Feelings? Notice: everything you find is an object, not a subject.",
                    keyPoints: [
                        "No permanent, independent self can be found",
                        "Five aggregates: form, feeling, perception, formations, consciousness",
                        "Conventional self exists; ultimate self does not"
                    ]
                )
            ]
        ),
        
        // MODULE 3: MEDITATION PRACTICE
        BuddhaModule(
            id: "buddha_3",
            number: 3,
            title: "The Practice of Meditation",
            subtitle: "Training the mind",
            icon: "brain.head.profile",
            lessons: [
                BuddhaLesson(
                    id: "b3_1",
                    title: "Samatha: Concentration Meditation",
                    duration: 10,
                    content: """
Samatha means "calm" or "tranquility." It's the practice of one-pointed concentration that stabilizes the mind.

**The Purpose of Samatha**
• Calms mental turbulence
• Develops the jhanas (absorption states)
• Creates the stability needed for insight
• Temporarily suppresses hindrances

**Classic Objects of Concentration**
• **Breath** (ānāpānasati): Most common; always available
• **Kasinas**: Colored disks, elements, light
• **Brahmaviharas**: Loving-kindness, compassion, joy, equanimity
• **Body parts**: For disenchantment with the body
• **Death contemplation**: For urgency and perspective

**Breath Meditation Instructions**
1. Sit comfortably, spine upright
2. Find the breath at the nostrils or abdomen
3. Note the beginning, middle, end of each breath
4. When mind wanders (it will), gently return
5. Gradually, attention stabilizes and breath becomes pleasant

**Signs of Progress**
• Longer periods of stable attention
• Breath becomes subtle
• Light or pleasant sensations arise
• Mind feels unified, one-pointed

🔥 **Key Insight**: Don't fight the wandering mind. Each return is a rep. Patience and gentleness are more powerful than force.
""",
                    practice: "20 minutes of breath meditation. Count breaths 1-10, restart on distraction. Don't judge—just observe and return.",
                    keyPoints: [
                        "Samatha develops calm and concentration",
                        "Breath is the most common and accessible object",
                        "Progress comes through patient, gentle returning"
                    ]
                ),
                
                BuddhaLesson(
                    id: "b3_2",
                    title: "Vipassanā: Insight Meditation",
                    duration: 10,
                    content: """
Vipassanā means "clear seeing" or "insight." While samatha calms the mind, vipassanā sees into reality's true nature.

**What Is Insight?**
Direct, experiential understanding of:
• Impermanence (anicca)
• Suffering/unsatisfactoriness (dukkha)
• Not-self (anattā)

This isn't intellectual understanding—it's seeing these truths moment-to-moment in lived experience.

**The Method**
1. Establish some degree of concentration
2. Direct attention to present-moment experience
3. Note phenomena as they arise and pass
4. Observe the three characteristics in real-time
5. Don't try to change experience—just see it clearly

**What to Observe**
• Body sensations
• Feelings (pleasant/unpleasant/neutral)
• Mind states
• Mental phenomena (thoughts, emotions)

**The Progress of Insight**
Traditional maps describe stages:
1. Mind and body
2. Cause and effect
3. Three characteristics
4. Arising and passing
5. Dissolution
6. Dark night stages
7. Equanimity
8. Path and fruition (awakening)

**Vipassanā vs Samatha**
Samatha: temporary suppression of defilements
Vipassanā: permanent uprooting through wisdom

Both are needed. Samatha without vipassanā doesn't liberate. Vipassanā without samatha lacks power.

🔥 **Key Insight**: You don't create insight. You create conditions for insight to arise. The mind naturally sees truth when it's still and attentive enough.
""",
                    practice: "30 minutes of noting practice. Label each experience: 'rising, falling, thinking, hearing, itching, pleasant, unpleasant...' Keep notes simple and quick.",
                    keyPoints: [
                        "Vipassanā is direct seeing of impermanence, suffering, not-self",
                        "Note phenomena without trying to change them",
                        "Insight arises naturally when conditions are right"
                    ]
                ),
                
                BuddhaLesson(
                    id: "b3_3",
                    title: "The Jhanas: States of Absorption",
                    duration: 10,
                    content: """
The jhanas are profound states of meditative absorption. The Buddha praised them as "pleasant abidings" and used them as the foundation for his own awakening.

**The Four Form Jhanas**

**First Jhana**
Factors: Applied attention, sustained attention, rapture, happiness, one-pointedness
Experience: Strong pleasure, body feels energized, mind unified on object
What's abandoned: Five hindrances (desire, aversion, sloth, restlessness, doubt)

**Second Jhana**
Factors: Rapture, happiness, one-pointedness
Experience: More refined pleasure, less effort, deeper stillness
What's abandoned: Applied and sustained attention (attention becomes automatic)

**Third Jhana**
Factors: Happiness, one-pointedness
Experience: Contentment, less excitement, bodily bliss
What's abandoned: Rapture (seen as too coarse)

**Fourth Jhana**
Factors: Equanimity, one-pointedness
Experience: Perfect balance, neither pleasure nor pain, profound stillness
What's abandoned: Happiness (only equanimity remains)

**The Four Formless Jhanas**
5. Infinite space
6. Infinite consciousness
7. Nothingness
8. Neither perception nor non-perception

**Jhana and Insight**
Jhanas alone don't liberate—they're temporary states. But emerging from jhana, the mind is extremely clear and powerful. The Buddha used this clarity for insight.

🔥 **Key Insight**: The jhanas are not the goal, but they're incredibly useful tools. Don't bypass them; don't get stuck in them.
""",
                    practice: "In concentration practice, notice when pleasant sensations arise with breath. Gently encourage them to spread. This is the doorway to first jhana.",
                    keyPoints: [
                        "Four form jhanas, four formless jhanas",
                        "Each jhana is more refined than the previous",
                        "Jhanas support insight but don't replace it"
                    ]
                ),
                
                BuddhaLesson(
                    id: "b3_4",
                    title: "The Satipatthana: Four Foundations",
                    duration: 10,
                    content: """
The Satipatthana Sutta is called "the direct path to awakening." It maps four domains of mindfulness practice.

**1. Mindfulness of Body (Kāyānupassanā)**
• Breath awareness
• Four postures (sitting, standing, walking, lying)
• Clear comprehension of activities
• Body parts contemplation
• Elements (earth, water, fire, air)
• Cemetery contemplations (impermanence of body)

**2. Mindfulness of Feeling (Vedanānupassanā)**
• Pleasant feelings
• Unpleasant feelings
• Neutral feelings
• Worldly vs unworldly feelings

Note: "Feeling" here means the quality of pleasant/unpleasant/neutral—not emotion.

**3. Mindfulness of Mind (Cittānupassanā)**
• Mind with lust / without lust
• Mind with aversion / without aversion
• Mind with delusion / without delusion
• Contracted / distracted / concentrated / liberated

**4. Mindfulness of Dhammas (Dhammānupassanā)**
• Five hindrances
• Five aggregates
• Six sense bases
• Seven factors of awakening
• Four Noble Truths

**The Refrain**
For each domain, the meditator:
• Observes internally (in oneself)
• Observes externally (in others, conceptually)
• Observes both
• Observes arising, passing, both
• Establishes mindfulness for knowledge and continuous awareness
• Abides independent, not clinging to anything

🔥 **Key Insight**: The Satipatthana covers EVERYTHING. Whatever arises in experience fits one of these four categories. Nothing is left out.
""",
                    practice: "Practice each foundation for 10 minutes: body, feeling-tone, mind state, and mental phenomena. Notice how complete this framework is.",
                    keyPoints: [
                        "Four foundations: body, feelings, mind, phenomena",
                        "Each has multiple sub-practices",
                        "Together they cover all possible experience"
                    ]
                )
            ]
        ),
        
        // MODULE 4: STAGES OF AWAKENING
        BuddhaModule(
            id: "buddha_4",
            number: 4,
            title: "Stages of Awakening",
            subtitle: "The path to full liberation",
            icon: "arrow.up.circle.fill",
            lessons: [
                BuddhaLesson(
                    id: "b4_1",
                    title: "Stream Entry: The First Awakening",
                    duration: 8,
                    content: """
Stream Entry (Sotāpanna) is the first taste of Nibbana—the first permanent shift in consciousness. It's called "Stream Entry" because you've entered the stream that flows inevitably to full liberation.

**What Happens at Stream Entry**
• Direct, non-conceptual recognition of the unconditioned
• First "path moment" and "fruition"
• Three fetters are permanently broken

**The Three Fetters Destroyed**
1. **Self-view (sakkāya-ditthi)**: Belief in a permanent, fixed self
2. **Doubt (vicikicchā)**: Uncertainty about the path and teaching
3. **Clinging to rites and rituals (sīlabbata-parāmāsa)**: Belief that rituals alone lead to liberation

**What Stream Entry Feels Like**
Reports vary, but commonly:
• A moment of cessation (consciousness stops momentarily)
• Profound relief, often tears
• Absolute certainty about the path
• Sense of "coming home"
• Everything looks the same but different

**What Stream Entry ISN'T**
• Not a permanent state of bliss
• Not the end of suffering
• Not the end of negative emotions
• Not perfection

At most, 7 more lifetimes until full liberation. Usually faster.

🔥 **Key Insight**: Stream Entry isn't about gaining something—it's the first permanent loss of illusion.
""",
                    practice: "Don't try to 'achieve' Stream Entry. Focus on clear seeing, moment by moment. The path opens when conditions ripen.",
                    keyPoints: [
                        "Stream Entry is the first taste of Nibbana",
                        "Three fetters permanently broken: self-view, doubt, ritual attachment",
                        "At most 7 more lifetimes to full awakening"
                    ]
                ),
                
                BuddhaLesson(
                    id: "b4_2",
                    title: "The Higher Stages",
                    duration: 8,
                    content: """
After Stream Entry, three more stages lead to full awakening.

**Once-Returner (Sakadāgāmī)**
• Weakens (doesn't eliminate) sensual desire and aversion
• At most one more human rebirth
• Fetters 4-5 weakened: desire and aversion

**Non-Returner (Anāgāmī)**
• Eliminates sensual desire and aversion completely
• Will not return to human realm
• If not fully awakened this life, reborn in pure abodes
• Fetters 4-5 eliminated

**Arahant (Fully Awakened)**
Eliminates the final five fetters:
6. Desire for fine-material existence
7. Desire for immaterial existence
8. Conceit (subtle sense of "I am")
9. Restlessness
10. Ignorance

**The Arahant's Mind**
• No craving or aversion
• No sense of self
• Complete equanimity
• Actions arise from wisdom and compassion, not ego
• No more rebirth

**Important Note**
These aren't ego achievements to brag about. An Arahant wouldn't boast—there's no one there to boast. Genuine attainment comes with humility.

🔥 **Key Insight**: Each stage is a permanent, irreversible shift. Unlike temporary states, what's been seen cannot be unseen.
""",
                    practice: "Don't worry about stages. Focus on practice. The stages take care of themselves when conditions ripen.",
                    keyPoints: [
                        "Four stages: Stream Enterer, Once-Returner, Non-Returner, Arahant",
                        "Each stage breaks more fetters permanently",
                        "Arahant = complete liberation"
                    ]
                ),
                
                BuddhaLesson(
                    id: "b4_3",
                    title: "Integration: Living the Teaching",
                    duration: 8,
                    content: """
Awakening isn't the end—it's the beginning of a new way of living. Integration is the ongoing process of letting realization permeate all aspects of life.

**Before and After**
Before: Seeking liberation
After: Living AS liberation

The search ends, but life continues. Now the question becomes: How does awakeness show up in relationships, work, challenges?

**Common Integration Challenges**
• **Spiritual bypassing**: Using insights to avoid difficult emotions
• **Arrogance**: "I'm awakened, you're not"
• **Disengagement**: Checking out from life
• **Nihilism**: "Nothing matters"
• **Inconsistency**: Awakened in meditation, reactive in traffic

**Genuine Integration**
• Awakeness is available in every moment, not just on the cushion
• Emotions still arise but are met with spaciousness
• Action comes from clarity rather than compulsion
• Relationships become more authentic
• Compassion naturally increases

**The Bodhisattva Vow**
Some traditions emphasize awakening FOR the benefit of all beings. Liberation isn't solitary escape—it's becoming a clearer channel for wisdom and compassion.

**The Buddha's Post-Awakening Life**
After enlightenment, the Buddha spent 45 years teaching. He didn't retreat into bliss—he engaged with the world, establishing the Sangha, adapting teachings to different students.

🔥 **Key Insight**: Awakening isn't about leaving the world. It's about being fully present to it without the obscuration of self-centered craving.
""",
                    practice: "Bring meditative awareness into one everyday activity this week—washing dishes, walking, talking with someone. Notice when presence is lost and return.",
                    keyPoints: [
                        "Integration is as important as initial awakening",
                        "Watch for spiritual bypassing and arrogance",
                        "Liberation serves the world, not just the individual"
                    ]
                )
            ]
        )
    ]
}

// MARK: - Supporting Types

struct BuddhaModule: Identifiable {
    let id: String
    let number: Int
    let title: String
    let subtitle: String
    let icon: String
    let lessons: [BuddhaLesson]
    
    var totalDuration: Int { lessons.reduce(0) { $0 + $1.duration } }
}

struct BuddhaLesson: Identifiable {
    let id: String
    let title: String
    let duration: Int
    let content: String
    let practice: String
    let keyPoints: [String]
}

// MARK: - Progress Tracking

struct BuddhaProgress: Codable {
    var completedLessons: [String]
    var notes: [String: String]
    var lastAccessed: Date?
    
    static var `default`: BuddhaProgress {
        BuddhaProgress(completedLessons: [], notes: [:], lastAccessed: nil)
    }
}
