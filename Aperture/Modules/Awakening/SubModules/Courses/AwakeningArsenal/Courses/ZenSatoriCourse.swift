// ZenSatoriCourse.swift
// Complete guide to Zen awakening
// Direct pointing to original nature

import SwiftUI

struct ZenSatoriCourse: View {
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                courseHeader
                
                ForEach(Array(lessons.enumerated()), id: \.offset) { index, lesson in
                    NavigationLink(destination: ZenLessonView(lesson: lesson, index: index + 1)) {
                        lessonRow(lesson, index: index)
                    }
                }
                
                zenWisdomSection
            }
        }
        .background(Color.black.ignoresSafeArea())
        .navigationTitle("Zen: Satori")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private var courseHeader: some View {
        VStack(spacing: 16) {
            // Enso circle
            ZStack {
                Circle()
                    .stroke(
                        LinearGradient(
                            colors: [.white, .gray],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        ),
                        lineWidth: 4
                    )
                    .frame(width: 100, height: 100)
                    .rotationEffect(.degrees(-45))
                
                Text("空")
                    .font(.system(size: 40, weight: .light))
                    .foregroundColor(.white)
            }
            
            Text("Zen: The Way of Satori")
                .font(.system(size: 28, weight: .black))
                .foregroundColor(.white)
            
            Text("Sudden Awakening Through Direct Seeing")
                .font(.system(size: 14))
                .foregroundColor(.gray)
            
            Text("Japan • Buddhism • Ch'an")
                .font(.system(size: 12))
                .foregroundColor(.gray)
            
            HStack(spacing: 20) {
                statBubble("10", "Lessons")
                statBubble("4", "Difficulty")
                statBubble("今", "Now")
            }
            
            Text("\"Not thinking about anything is Zen. Once you know this, walking, sitting, or lying down, everything you do is Zen.\" — Bodhidharma")
                .font(.system(size: 13))
                .foregroundColor(.white.opacity(0.8))
                .italic()
                .multilineTextAlignment(.center)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(12)
        }
        .padding()
    }
    
    private func statBubble(_ value: String, _ label: String) -> some View {
        VStack(spacing: 2) {
            Text(value)
                .font(.system(size: 18, weight: .black))
                .foregroundColor(.white)
            Text(label)
                .font(.system(size: 10))
                .foregroundColor(.gray)
        }
        .frame(width: 70)
        .padding(.vertical, 8)
        .background(Color.white.opacity(0.05))
        .cornerRadius(10)
    }
    
    private func lessonRow(_ lesson: ZenLesson, index: Int) -> some View {
        HStack(spacing: 16) {
            ZStack {
                Circle()
                    .fill(lesson.color.opacity(0.2))
                    .frame(width: 44, height: 44)
                Text("\(index + 1)")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(lesson.color)
            }
            
            VStack(alignment: .leading, spacing: 4) {
                Text(lesson.title)
                    .font(.system(size: 15, weight: .semibold))
                    .foregroundColor(.white)
                Text(lesson.subtitle)
                    .font(.system(size: 12))
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            if lesson.isPractice {
                Image(systemName: "figure.mind.and.body")
                    .foregroundColor(.cyan)
            }
            
            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
                .font(.system(size: 12))
        }
        .padding()
        .background(Color.white.opacity(0.03))
    }
    
    private var zenWisdomSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Image(systemName: "quote.bubble")
                    .foregroundColor(.white)
                Text("ZEN WISDOM")
                    .font(.system(size: 12, weight: .black))
                    .foregroundColor(.white)
            }
            
            VStack(spacing: 12) {
                quoteRow("Before enlightenment: chop wood, carry water.\nAfter enlightenment: chop wood, carry water.", "Zen saying")
                quoteRow("If you meet the Buddha on the road, kill him.", "Linji")
                quoteRow("The instant you speak about a thing, you miss the mark.", "Zen proverb")
                quoteRow("Sitting quietly, doing nothing,\nSpring comes, and the grass grows by itself.", "Zenrin Kushū")
            }
        }
        .padding()
        .background(Color.white.opacity(0.05))
        .cornerRadius(16)
        .padding()
    }
    
    private func quoteRow(_ quote: String, _ source: String) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(quote)
                .font(.system(size: 12))
                .foregroundColor(.white.opacity(0.9))
                .italic()
            Text("— \(source)")
                .font(.system(size: 10))
                .foregroundColor(.gray)
        }
        .padding(10)
        .background(Color.white.opacity(0.05))
        .cornerRadius(8)
    }
    
    // MARK: - Lessons
    
    private var lessons: [ZenLesson] {
        [
            ZenLesson(
                title: "What Is Zen?",
                subtitle: "Direct pointing to the mind",
                color: .white,
                isPractice: false,
                content: """
                # Zen: Beyond Words
                
                Zen (禅) is the Japanese pronunciation of Ch'an, which comes from Sanskrit Dhyana (meditation). But Zen is not just meditation—it's a direct path to seeing your true nature.
                
                ## The Transmission
                
                Zen traces its lineage to a moment when Buddha held up a flower. Only one disciple, Mahakasyapa, smiled—understanding without words. This "transmission outside the scriptures" is Zen's essence.
                
                The tradition came to China as Ch'an, then to Japan as Zen, Korea as Seon, Vietnam as Thiền.
                
                ## Core Principles
                
                **1. A special transmission outside scriptures**
                Not dependent on words or letters.
                
                **2. Direct pointing to the mind**
                No intermediaries—see directly.
                
                **3. Seeing one's nature and becoming Buddha**
                You already ARE Buddha-nature. Just see it.
                
                ## What Zen Is NOT
                
                - Philosophy (though it has philosophy)
                - Belief system (nothing to believe)
                - Achieving something (nothing to achieve)
                - Becoming something new (you already are it)
                - Feeling blissful (maybe, but not the point)
                - An escape from life (the opposite)
                
                ## What Zen IS
                
                - Direct seeing of reality
                - Cutting through concepts
                - Being present without mental commentary
                - Ordinary mind IS the way
                - Awakening to what was never lost
                
                ## The Paradox
                
                Zen is frustrating because:
                - You can't think your way there (but thinking is all we know)
                - You already have it (but you can't see it)
                - There's nothing to do (but you must practice intensively)
                - It's the simplest thing (yet most struggle for years)
                
                The mind that grasps cannot grasp the ungrasped.
                
                ## Satori vs Kensho
                
                **Kensho**: Initial glimpse of true nature. "Seeing nature." Often sudden, powerful.
                
                **Satori**: Deeper, more stable awakening. Integration of seeing into daily life.
                
                Both point to the same recognition—just different depths.
                
                ## The Zen Attitude
                
                - Don't know mind (beginner's mind)
                - Complete presence
                - Direct engagement
                - No seeking special states
                - Whatever is, is it
                
                As Shunryu Suzuki said: "In the beginner's mind there are many possibilities, in the expert's mind there are few."
                """,
                practiceSteps: [],
                keyTakeaway: "Zen is direct seeing of your true nature—not through concepts but immediate recognition. You already have Buddha-nature; practice is simply seeing what's always been here."
            ),
            
            ZenLesson(
                title: "Zazen: Just Sitting",
                subtitle: "The foundation of Zen practice",
                color: .gray,
                isPractice: true,
                content: """
                # Zazen: Seated Meditation
                
                Zazen means "seated meditation." It is the core practice of Zen—and it's deceptively simple.
                
                ## The Posture
                
                **Body:**
                
                1. **Sitting position**: Full lotus, half lotus, Burmese, seiza (kneeling), or chair
                2. **Spine**: Straight but not rigid. Natural S-curve.
                3. **Head**: Crown toward ceiling, chin slightly tucked
                4. **Hands**: Cosmic mudra—left hand on right, thumbs lightly touching, forming oval
                5. **Eyes**: Open, gaze lowered 45 degrees, unfocused
                6. **Mouth**: Closed, tongue on upper palate
                7. **Breath**: Natural, through nose
                
                **Face a wall** if possible (Soto tradition) or face into room (Rinzai).
                
                ## The Practice
                
                **What to do:**
                
                Sit. Nothing else.
                
                That's it. But let me explain what "nothing else" means:
                
                1. Don't try to stop thoughts
                2. Don't try to have special experiences
                3. Don't try to become enlightened
                4. Don't follow thoughts
                5. Don't push thoughts away
                6. Just sit
                
                **With breath (beginners):**
                
                Count breaths 1-10. When you lose count (you will), start over. This trains concentration.
                
                **Without counting (intermediate):**
                
                Just follow breath. No counting. When thoughts arise, return to breath.
                
                **Shikantaza (advanced):**
                
                "Just sitting." No object of meditation. Pure awareness. No technique. The hardest because the simplest.
                
                ## Common Mistakes
                
                **Trying too hard**: Zazen is not effort. It's dropping effort.
                
                **Fighting thoughts**: Thoughts are not the enemy. Let them be clouds passing.
                
                **Seeking experiences**: If you want enlightenment, you're moving away from it.
                
                **Judging the sitting**: "Good sit" or "bad sit" is just more thinking.
                
                **Physical tension**: Especially shoulders, face, hands. Relax.
                
                ## The Wall
                
                Facing a wall serves:
                - Reduces visual distraction
                - Symbolizes facing yourself
                - No escape from what arises
                - Tradition (Bodhidharma sat facing wall for 9 years)
                
                ## Duration
                
                **Beginning**: Start with 10 minutes. Build to 20-30.
                
                **Regular**: 25-40 minutes per sit.
                
                **Sesshin (retreat)**: 40-50 minute sits, many per day.
                
                Traditional timing uses incense—a stick burns about 40 minutes.
                
                ## When to Practice
                
                - Early morning (traditional)
                - Evening
                - Twice daily ideal
                - Consistency matters most
                
                ## Kinhin (Walking Meditation)
                
                Between sitting periods:
                - Stand slowly
                - Hands in shashu (fist covered by other hand at chest)
                - Walk very slowly, one half-step per breath
                - Complete presence in walking
                - Not a break—walking zazen
                
                ## The Point
                
                There is no point. That's the point.
                
                Zazen is not a means to an end. It IS the end. Buddha's practice.
                
                As Dogen said: "To practice zazen is itself enlightenment."
                """,
                practiceSteps: [
                    "Prepare space: quiet, clean, cushion facing wall",
                    "Set timer (start 10-20 minutes)",
                    "Sit in stable posture, spine straight",
                    "Form cosmic mudra with hands",
                    "Eyes open, gaze down 45 degrees",
                    "Begin breath counting (1-10) if beginner",
                    "When thoughts arise, let them pass, return to breath",
                    "When timer ends, sit still a moment before moving",
                    "Stand slowly, bow to cushion"
                ],
                keyTakeaway: "Zazen is the foundation: just sit, spine straight, eyes open, face wall. Not trying to achieve anything. Not stopping thoughts. Just sitting. The practice itself IS enlightenment."
            ),
            
            ZenLesson(
                title: "Working with Koans",
                subtitle: "Paradox as doorway",
                color: .purple,
                isPractice: true,
                content: """
                # Koan Practice
                
                A koan is a paradoxical statement, question, or story that cannot be resolved by logic. It's a tool to break through conceptual mind.
                
                ## Famous Koans
                
                **Mu**
                A monk asked Joshu: "Does a dog have Buddha-nature?"
                Joshu replied: "Mu" (No/Nothing)
                
                This is often the first koan given. The answer isn't intellectual—you must BECOME Mu.
                
                **One Hand**
                "What is the sound of one hand clapping?"
                — Hakuin
                
                **Original Face**
                "What was your face before your parents were born?"
                
                **Cypress Tree**
                A monk asked Joshu: "What is the meaning of Bodhidharma's coming from the West?"
                Joshu replied: "The cypress tree in the garden."
                
                ## How Koans Work
                
                Koans are NOT:
                - Riddles with clever answers
                - Intellectual puzzles
                - Tests of knowledge
                - Meaningless nonsense
                
                Koans ARE:
                - Tools to exhaust conceptual mind
                - Pointers to direct experience
                - Expressions of awakened mind
                - Living questions that work on you
                
                ## Working with a Koan
                
                **1. Receive the koan**
                Traditionally from a teacher. But you can begin with Mu.
                
                **2. Hold it constantly**
                Not just in meditation—walking, eating, sleeping. Let it become your entire world.
                
                **3. Don't analyze**
                The moment you think "maybe it means..." you've gone the wrong direction.
                
                **4. Become the koan**
                Don't look at Mu from outside. BE Mu. What IS Mu?
                
                **5. Great doubt**
                Let uncertainty grow until it's unbearable. This pressure is the path.
                
                **6. Breaking through**
                When conceptual mind is exhausted, something shifts. This is kensho.
                
                ## In Meditation
                
                During zazen with a koan:
                
                1. Sit in zazen posture
                2. Bring the koan to mind
                3. Don't think ABOUT it—sit WITH it
                4. Let it pervade your being
                5. When distracted, return to koan
                6. Feel the doubt, the not-knowing
                7. Don't seek answers—sit in the question
                
                ## In Daily Life
                
                Carry the koan:
                - While walking: "What is Mu?"
                - While working: "Mu"
                - Before sleep: "Mu"
                - Upon waking: "Mu"
                
                Let it work on you constantly.
                
                ## Dokusan (Interview)
                
                Traditionally, you present your understanding to a teacher in private interview. This is essential for koan practice.
                
                The teacher:
                - Tests your understanding
                - May accept or reject your response
                - Pushes you deeper
                - Confirms genuine insight
                
                Without a teacher, you can still work with koans, but be humble about claiming breakthrough.
                
                ## Beginning Koan: Mu
                
                **The Story:**
                A monk asked Zhaozhou (Joshu): "Does a dog have Buddha-nature?"
                Joshu said: "Wu" (Mu in Japanese, meaning "No" or "Nothing")
                
                **The Question:**
                All beings have Buddha-nature (Buddhist teaching). So why did Joshu say no?
                
                **The Practice:**
                Don't figure it out. BECOME Mu. What IS Mu? Not the concept—the reality.
                
                Breathe Mu. Walk Mu. Be Mu.
                
                When eating: "MU"
                When walking: "MU"
                When sitting: "MU MU MU MU MU MU..."
                
                Let everything become Mu until there is no you and no Mu—just THIS.
                
                ## Caution
                
                Koan practice can be intense. It's designed to frustrate the seeking mind until it gives up.
                
                Signs of progress:
                - Increased doubt and confusion (paradoxically good)
                - Moments of clarity
                - Conceptual answers feel hollow
                - The question becomes alive
                
                Signs of going off track:
                - Thinking you've "solved" it intellectually
                - Getting discouraged and abandoning
                - Using it as a distraction from simple sitting
                """,
                practiceSteps: [
                    "Choose a koan (Mu is traditional first koan)",
                    "In zazen, bring koan to mind",
                    "Don't analyze—sit WITH the question",
                    "When distracted, return to koan",
                    "Let doubt and not-knowing grow",
                    "Carry koan into daily life",
                    "Don't seek answers—let it work on you",
                    "If possible, work with a teacher for dokusan"
                ],
                keyTakeaway: "Koans break through conceptual mind through paradox. Don't analyze—become the koan. Mu is the classic first koan: carry it constantly until there's no you and no Mu, just this."
            ),
            
            ZenLesson(
                title: "Mindfulness in Action",
                subtitle: "Every act is Zen",
                color: .green,
                isPractice: true,
                content: """
                # Zen in Daily Life
                
                Zen doesn't end when you stand from the cushion. Every action is an opportunity for presence.
                
                ## The Zen of Ordinary Life
                
                **Master Ummon was asked: "What is Buddha?"
                He answered: "A dried shit-stick."**
                
                Nothing is excluded from Zen. Not the sacred, not the profane. Everything is it.
                
                ## Samu: Work Practice
                
                In Zen monasteries, work is as important as sitting. Samu (work practice) includes:
                - Cleaning
                - Cooking
                - Gardening
                - Building
                - Maintenance
                
                **The attitude:**
                Complete attention. No thinking "I'm working to get it done." Just working.
                
                ## Oryoki: Eating Practice
                
                Formal Zen meals (oryoki) involve:
                - Precise handling of bowls
                - Silent eating
                - Complete attention to food
                - Gratitude
                - Mindful washing
                
                **Informally:**
                When eating, just eat. Taste each bite. Don't eat while distracted.
                
                ## Walking Zen
                
                **Kinhin** (formal): Very slow, synchronized with breath.
                
                **Informal**: Walk with awareness. Feel feet on ground. Don't walk lost in thought.
                
                ## Everything Is Training
                
                **Drinking tea:**
                The whole of Zen is in a cup of tea. How you lift it, hold it, drink it, set it down.
                
                **Opening a door:**
                Complete attention. This door, this hand, this moment.
                
                **Washing dishes:**
                Just wash. The dish. The water. The soap. When done, done.
                
                ## The Practice
                
                **Choose one daily activity.** For one week, do it with complete attention:
                
                - Brushing teeth
                - Showering
                - Commuting
                - Eating breakfast
                - Making bed
                
                **Notice:**
                - How often mind wanders
                - What happens when you return to the activity
                - The richness of full attention
                
                ## Work as Practice
                
                Your job can be Zen practice:
                
                **When typing**: Just type. Feel keys. See words appear.
                
                **In meetings**: Actually listen. Not preparing response—listening.
                
                **Problem-solving**: Give full attention. Don't rush to solution.
                
                ## Relationships as Practice
                
                **Listening**: When someone speaks, just listen. Not thinking about what you'll say.
                
                **Speaking**: Say what's true. Say what's needed. No more.
                
                **Conflict**: See the other as Buddha (because they are). Even when difficult.
                
                ## Integration
                
                The gap between "practice" and "life" must close.
                
                Eventually:
                - Sitting is no different from walking
                - Working is no different from sitting
                - Everything is meditation
                - Everything is life
                - No separation
                
                ## Common Obstacles
                
                **"I'll be present later"**: No. Now. Only now exists.
                
                **"This task isn't spiritual"**: Everything is Buddha's activity. Even (especially) the mundane.
                
                **"I'm too busy"**: Busy-ness IS the practice. Not separate from it.
                
                **"I keep forgetting"**: Normal. Return. Again and again. That's the practice.
                
                ## The Test
                
                Zen master Rinzai said: "When hungry, eat. When tired, sleep."
                
                This sounds simple. But can you JUST eat? JUST sleep? Without the commentary?
                
                That's the practice. And it's endless.
                """,
                practiceSteps: [
                    "Choose one daily activity for focused practice",
                    "When doing it, give complete attention",
                    "When mind wanders, notice and return",
                    "Feel all sensations involved in the act",
                    "Don't judge performance—just do fully",
                    "Expand to more activities over time",
                    "Let the gap between 'practice' and 'life' close"
                ],
                keyTakeaway: "Zen extends beyond the cushion. Every activity—eating, walking, working—is practice. Complete attention to ordinary acts IS enlightenment. When eating, just eat. When walking, just walk."
            ),
            
            ZenLesson(
                title: "Sesshin: Intensive Retreat",
                subtitle: "Deepening through immersion",
                color: .blue,
                isPractice: false,
                content: """
                # Sesshin: Touching the Mind
                
                Sesshin (接心) means "touching the mind" or "gathering the heart-mind." It's an intensive retreat of multiple days, typically 3-7 days, sometimes longer.
                
                ## Structure
                
                A typical sesshin day:
                
                **4:00 AM** - Wake
                **4:30** - Zazen (40 min)
                **5:10** - Kinhin (walking, 10 min)
                **5:20** - Zazen (40 min)
                **6:00** - Service/chanting
                **6:30** - Breakfast (oryoki)
                **7:30** - Work period (samu)
                **9:00** - Zazen (40 min)
                **9:40** - Kinhin
                **9:50** - Zazen (40 min)
                **10:30** - Dokusan (private interviews)
                **11:30** - Lunch (oryoki)
                **12:30** - Rest
                **2:00** - Zazen
                **2:40** - Kinhin
                **2:50** - Zazen
                **3:30** - Dharma talk
                **4:30** - Zazen
                **5:10** - Kinhin
                **5:20** - Zazen
                **6:00** - Dinner
                **7:00** - Zazen
                **7:40** - Kinhin
                **7:50** - Zazen
                **8:30** - Close
                **9:00** - Sleep
                
                That's 8-10 hours of zazen per day.
                
                ## The Conditions
                
                **Noble Silence**: No speaking except during dokusan or necessary communication.
                
                **Minimal distraction**: No phones, books, writing (usually), eye contact.
                
                **Following schedule**: Moving with the group, no choosing.
                
                **Simplicity**: Plain food, simple routine, no entertainment.
                
                ## What Happens
                
                **Day 1**: Mind rebels. Boredom, restlessness, pain. "Why am I doing this?"
                
                **Day 2-3**: Settling... or crisis. Old patterns emerge. Emotional material surfaces.
                
                **Day 4-5**: Deepening. Thoughts slow. Presence increases. Glimpses of clarity.
                
                **Day 6-7**: Integration or breakthrough. The container has done its work.
                
                ## Physical Challenges
                
                **Pain**: Knees, back, ankles. Real and intense. Part of practice.
                
                **Sleepiness**: Fighting drowsiness at 4 AM (and 2 PM).
                
                **Restlessness**: Body wanting to move, mind wanting stimulation.
                
                **Advice**: Don't fight too hard. Don't give up too easily. Find the middle.
                
                ## Psychological Challenges
                
                **Boredom**: Extreme boredom is fertile ground. What is boredom?
                
                **Resistance**: Mind creates a thousand reasons to leave. Notice them.
                
                **Doubt**: "This is stupid. Nothing is happening." Classic obstacle.
                
                **Emotion**: Old material surfaces. Grief, anger, fear. Let it move through.
                
                ## The Container
                
                Sesshin creates conditions where ordinary escape routes are closed:
                - Can't distract with entertainment
                - Can't talk through discomfort
                - Can't leave easily
                - Must face what arises
                
                This pressure can catalyze breakthrough.
                
                ## Preparation
                
                Before sesshin:
                - Establish daily sitting practice
                - Build up duration gradually
                - Resolve logistics (work, family)
                - Inform people you'll be unreachable
                - Prepare body (comfortable with sitting posture)
                - Prepare mind (commitment to stay)
                
                ## First Sesshin
                
                Recommendations:
                - Start with 3-day or weekend
                - Choose established center with experienced teacher
                - Don't expect breakthrough
                - Expect difficulty
                - Complete it (don't leave early if possible)
                - Rest afterward
                
                ## After Sesshin
                
                The days after can be as important as the retreat:
                - Heightened sensitivity
                - World may seem vivid
                - Ordinary mind will reassert
                - Maintain practice
                - Let insights integrate naturally
                - Don't cling to "retreat high"
                
                ## Finding Sesshin
                
                Search for:
                - Zen centers near you
                - Soto or Rinzai centers
                - "Zen sesshin [your area]"
                - Major centers also offer sesshins (San Francisco Zen Center, Tassajara, etc.)
                """,
                practiceSteps: [],
                keyTakeaway: "Sesshin is intensive retreat (3-7 days) with 8-10 hours of zazen daily in noble silence. The pressure of sustained practice can catalyze breakthrough. Start with shorter retreats after establishing daily practice."
            ),
            
            ZenLesson(
                title: "The Four Great Vows",
                subtitle: "Zen's ethical foundation",
                color: .red,
                isPractice: true,
                content: """
                # The Bodhisattva Vows
                
                Zen isn't just about personal awakening. The Four Great Vows express the Bodhisattva path—awakening for the benefit of all.
                
                ## The Vows
                
                **衆生無辺誓願度**
                Sentient beings are numberless; I vow to save them all.
                
                **煩悩無尽誓願断**
                Desires are inexhaustible; I vow to end them all.
                
                **法門無量誓願学**
                Dharma gates are boundless; I vow to enter them all.
                
                **仏道無上誓願成**
                The Buddha way is unsurpassable; I vow to embody it fully.
                
                ## The Paradox
                
                These vows are impossible to complete:
                - You can't save ALL beings
                - You can't end ALL desires
                - You can't learn ALL teachings
                - You can't perfect the INFINITE way
                
                **That's the point.**
                
                The vows are not goals to achieve but directions to orient by. The commitment to the impossible is what matters.
                
                ## First Vow: Saving Beings
                
                Who are sentient beings?
                - All humans
                - All animals
                - All consciousness
                - All manifestation
                
                **Practice:**
                - Act with compassion
                - Reduce harm
                - Help where you can
                - Don't pass by suffering
                - Include all beings in meditation
                
                ## Second Vow: Ending Desires
                
                Desires (klesha) are endless:
                - Greed
                - Hatred
                - Delusion
                - Pride
                - Jealousy
                - And infinite subtle forms
                
                **Practice:**
                - Notice desires arising
                - Don't act blindly from them
                - See their empty nature
                - Not suppressing—seeing through
                
                ## Third Vow: Entering Dharma Gates
                
                Dharma gates = all teachings, all moments, all things.
                
                Everything teaches:
                - A falling leaf
                - A crying baby
                - A traffic jam
                - A difficult person
                - This breath
                
                **Practice:**
                - Stay curious
                - Learn from everything
                - Study the teachings
                - Study the world
                - Study this moment
                
                ## Fourth Vow: Embodying Buddha Way
                
                The Buddha way is already here. You are already Buddha. But to EMBODY it fully means living from awakening in every moment.
                
                **Practice:**
                - Keep practicing
                - Never declare arrival
                - Refine endlessly
                - Let awakening deepen
                - Express truth in action
                
                ## Chanting the Vows
                
                In Zen liturgy, vows are chanted daily, often three times:
                
                **In English:**
                Beings are numberless; I vow to awaken with them.
                Delusions are inexhaustible; I vow to end them.
                Dharma gates are boundless; I vow to enter them.
                Buddha's way is unsurpassable; I vow to become it.
                
                ## Daily Application
                
                **Morning:** Recall the vows. Set intention.
                
                **During day:** Let vows inform action. "How does this serve beings?"
                
                **Evening:** Reflect. Did I act from vow? Where did I miss?
                
                ## The Spirit
                
                The vows aren't guilt trips. They're reminders:
                - Awakening isn't selfish
                - Practice includes all beings
                - The path is endless (and that's okay)
                - Direction matters more than destination
                
                ## Taking Vows Formally
                
                In Zen practice, one may formally receive the vows (Jukai ceremony). This involves:
                - Study period
                - Sewing a rakusu (Zen garment)
                - Receiving the precepts
                - Receiving a dharma name
                - Commitment to the path
                
                This isn't required but marks deeper commitment.
                """,
                practiceSteps: [
                    "Memorize the Four Great Vows",
                    "Recite them each morning, setting intention",
                    "Let vows inform decisions during day",
                    "In difficulty, ask: 'What serves beings?'",
                    "Evening reflection on how vows were lived",
                    "Include all beings in meditation (metta)",
                    "Study the vows' deeper meaning over time"
                ],
                keyTakeaway: "The Four Great Vows orient practice toward the benefit of all beings. They're impossible to complete—that's the point. The commitment to endless practice for all beings is the Bodhisattva path. Direction, not destination."
            ),
            
            ZenLesson(
                title: "Zen Precepts",
                subtitle: "Ethical guidelines for awakened living",
                color: .yellow,
                isPractice: false,
                content: """
                # The Zen Precepts
                
                While Zen emphasizes direct seeing over rules, precepts (sila) provide ethical foundation. They're not commandments but expressions of awakened living.
                
                ## The Sixteen Bodhisattva Precepts
                
                ### Three Treasures (Taking Refuge)
                
                1. I take refuge in Buddha (awakened nature)
                2. I take refuge in Dharma (truth/teaching)
                3. I take refuge in Sangha (community)
                
                ### Three Pure Precepts
                
                4. I vow to avoid all action that creates suffering
                5. I vow to do all action that creates true happiness
                6. I vow to act for the benefit of all beings
                
                ### Ten Grave Precepts
                
                7. **Not killing** - Respect for life. Not only humans—all beings. Also: not killing spirit, potential, joy.
                
                8. **Not stealing** - Taking only what is given. Also: not stealing time, energy, attention, credit.
                
                9. **Not misusing sexuality** - Sexual ethics. Not using sex to manipulate, control, or harm.
                
                10. **Not lying** - Speaking truth. Also: not deceiving self. Authenticity.
                
                11. **Not intoxicating mind** - Keeping clarity. Original: no alcohol. Extended: all that clouds mind.
                
                12. **Not speaking of others' faults** - Not gossiping. Seeing Buddha nature in all.
                
                13. **Not praising self at others' expense** - Humility. Not elevating self by diminishing others.
                
                14. **Not being stingy** - Generosity. With material goods, with teaching, with self.
                
                15. **Not being angry** - Not indulging anger. Anger arises—don't act from it blindly.
                
                16. **Not disparaging Three Treasures** - Honoring Buddha, Dharma, Sangha. Not cynicism.
                
                ## How Precepts Function
                
                **Not rules but mirrors:**
                Precepts show where we're stuck. When you notice resistance to a precept, that's information.
                
                **Not restriction but freedom:**
                Following precepts naturally reduces suffering. Less entanglement, more clarity.
                
                **Not external authority but internal recognition:**
                The precepts describe what awakened beings naturally do. As insight deepens, precepts become effortless.
                
                ## Working with Precepts
                
                **Study:** Understand each precept deeply. What does it mean in your life?
                
                **Apply:** Use precepts as guidance in decisions.
                
                **Notice:** When you break a precept, see clearly. No guilt—just seeing.
                
                **Refine:** Let understanding deepen over time.
                
                ## Precepts in Daily Life
                
                **Not killing:**
                - Consider diet
                - Mind speech that "kills" others' spirit
                - Environmental impact
                
                **Not stealing:**
                - Fair dealings
                - Not taking credit that isn't yours
                - Respecting others' time
                
                **Not lying:**
                - Speak truth, even when uncomfortable
                - Don't deceive yourself
                - Authenticity in relationships
                
                **Not intoxicating:**
                - Consider relationship with substances
                - Also: media consumption, distraction
                - What clouds your mind?
                
                ## The Deeper Teaching
                
                At the deepest level, there's nothing to kill (no separate beings), nothing to steal (no separate ownership), no one to lie to (no separate selves).
                
                But this realization doesn't negate conventional ethics—it deepens them. Seeing oneness increases compassion, not carelessness.
                
                The precepts point both ways:
                - Relatively: guidelines for action
                - Absolutely: descriptions of how awakened mind functions
                
                ## Jukai
                
                Formal receiving of precepts (Jukai) marks entry into Zen community. It involves:
                - Study period
                - Sewing rakusu
                - Ceremony of receiving
                - Dharma name
                - Commitment to practice
                
                One can practice Zen without Jukai, but this ceremony deepens commitment.
                """,
                practiceSteps: [],
                keyTakeaway: "The Sixteen Bodhisattva Precepts aren't rules but descriptions of awakened living. They include taking refuge in Three Treasures, three pure precepts, and ten grave precepts. Study and apply them; notice where resistance arises."
            ),
            
            ZenLesson(
                title: "Doubt, Faith, and Determination",
                subtitle: "The three essentials",
                color: .orange,
                isPractice: false,
                content: """
                # The Three Essentials
                
                Zen master Hakuin taught that three things are essential for awakening: Great Doubt, Great Faith, and Great Determination.
                
                ## Great Doubt (大疑)
                
                Not skepticism, but existential uncertainty. The question "Who am I?" or "What is this?" held so intensely that everything becomes questionable.
                
                **What doubt does:**
                - Breaks certainties
                - Undermines assumptions
                - Creates crisis of meaning
                - Opens to not-knowing
                
                **How to cultivate:**
                - Work with a koan
                - Question your assumptions
                - Don't accept easy answers
                - Let uncertainty grow
                
                **The Great Doubt ball:**
                Zen describes doubt accumulating like a ball that grows until it fills the universe—then bursts.
                
                Without doubt, practice remains superficial.
                
                ## Great Faith (大信)
                
                Not belief in doctrine, but trust in the process, in Buddha-nature, in your own capacity to awaken.
                
                **Faith includes:**
                - Trust that awakening is possible
                - Trust that practice works
                - Trust in your own Buddha-nature
                - Trust in the lineage and teachings
                
                **How to cultivate:**
                - Remember that countless beings have awakened
                - Notice small shifts in clarity
                - Stay connected to teachers and sangha
                - Reflect on your own moments of presence
                
                Without faith, you give up too soon.
                
                ## Great Determination (大勇)
                
                The commitment to persist regardless of obstacles. Also called "great ferocity" or "great courage."
                
                **Determination means:**
                - Sitting even when you don't want to
                - Continuing when nothing seems to happen
                - Facing difficult emotions
                - Not giving up
                
                **How to cultivate:**
                - Make commitment
                - Keep to schedule regardless of mood
                - Recall your motivation
                - Connect with sangha for support
                
                Without determination, doubt and faith are ineffective.
                
                ## The Balance
                
                All three are needed:
                
                **Doubt without faith:** Nihilism, giving up
                **Faith without doubt:** Spiritual bypassing, complacency
                **Determination without doubt:** Stubbornness, forcing
                **Doubt + Faith without determination:** Good intentions, no follow-through
                
                When all three are present and strong, conditions are ripe for breakthrough.
                
                ## In Practice
                
                A sitting might look like:
                
                1. **Faith**: "I can do this. This works."
                2. **Sitting**: Present with breath or koan
                3. **Doubt arises**: "What is this? Who sits?"
                4. **Determination**: Stay with it when mind wants to wander
                5. **Deeper doubt**: The question intensifies
                6. **Faith**: Trust the process
                7. **Continue**: Determination to stay
                
                This isn't linear—they interweave.
                
                ## Checking In
                
                **Is doubt present?**
                Am I comfortable in assumptions? Is there genuine questioning?
                
                **Is faith present?**
                Do I trust the practice? Do I believe awakening is possible for me?
                
                **Is determination present?**
                Am I committed? Will I continue when it's hard?
                
                If any is weak, notice and cultivate.
                
                ## The Result
                
                When Great Doubt, Great Faith, and Great Determination come together at high intensity, the conditions are ripe.
                
                Doubt creates the tension.
                Faith holds you in it.
                Determination keeps you from escaping.
                
                Something must give. The giving is awakening.
                """,
                practiceSteps: [],
                keyTakeaway: "Three essentials for Zen awakening: Great Doubt (not-knowing), Great Faith (trust in practice and Buddha-nature), Great Determination (perseverance). All three together create conditions for breakthrough."
            ),
            
            ZenLesson(
                title: "Soto and Rinzai",
                subtitle: "Two streams of Zen",
                color: .cyan,
                isPractice: false,
                content: """
                # Two Schools of Zen
                
                Japanese Zen has two main schools: Soto and Rinzai. Both are authentic; they emphasize different aspects.
                
                ## Soto Zen (曹洞宗)
                
                **Founder:** Dogen Zenji (1200-1253)
                
                **Emphasis:** Shikantaza (just sitting)
                
                **Approach:** Practice IS enlightenment. No seeking—just manifest Buddha in sitting.
                
                **Characteristics:**
                - Emphasis on sitting practice (zazen)
                - Face the wall
                - Silent illumination
                - Gradual maturation
                - Everyday activities as practice
                - Less use of koans
                - "Continuous practice"
                
                **Key teaching:** "To study the Buddha Way is to study the self. To study the self is to forget the self. To forget the self is to be enlightened by all things." — Dogen
                
                ## Rinzai Zen (臨済宗)
                
                **Founders:** Rinzai Gigen (Linji, d. 866), brought to Japan by Eisai (1141-1215)
                
                **Emphasis:** Koan practice
                
                **Approach:** Break through to kensho. Direct, intense, confrontational.
                
                **Characteristics:**
                - Heavy use of koans
                - Face into room
                - Dokusan (private interview) central
                - Sudden awakening emphasis
                - Sometimes uses shouting, striking
                - More dramatic style
                - "Look directly at mind"
                
                **Key teaching:** "If you meet the Buddha, kill him." — Linji
                
                ## Comparison
                
                | Aspect | Soto | Rinzai |
                |--------|------|--------|
                | Main practice | Shikantaza | Koan |
                | Sitting direction | Face wall | Face room |
                | Style | Quiet, gradual | Intense, sudden |
                | Awakening view | Already here | Must break through |
                | Energy | Yin | Yang |
                | Teacher role | Supporting | Challenging |
                
                ## Which Is Better?
                
                Neither. They're complementary.
                
                **Soto may suit:**
                - Those drawn to simplicity
                - Those who find koans frustrating
                - Those who mature slowly
                - Those who prefer gentle approach
                
                **Rinzai may suit:**
                - Those who need structure
                - Those who thrive on challenge
                - Those who want dramatic breakthrough
                - Those with strong conceptual minds to break
                
                ## In Reality
                
                Most Zen practice today incorporates both:
                - Soto centers often use koans
                - Rinzai centers value shikantaza
                - Many teachers trained in both
                - The distinction is less rigid than portrayed
                
                ## Finding Your Fit
                
                Try both if possible. See what resonates.
                
                Questions to consider:
                - Does the style fit my temperament?
                - Do I connect with this teacher?
                - Is the sangha healthy?
                - Do I want to practice here long-term?
                
                The school matters less than the depth of your practice.
                
                ## Other Zen Schools
                
                Beyond Soto and Rinzai:
                
                **Obaku**: Third Japanese school, combines Zen with Pure Land
                
                **Korean Seon**: Single koan (Mu) emphasis, strong retreat tradition
                
                **Vietnamese Thiền**: Emphasis on mindfulness, engaged Buddhism
                
                **Chinese Ch'an**: Various schools, often integrated with other practices
                
                All valid, all pointing to same moon.
                """,
                practiceSteps: [],
                keyTakeaway: "Soto emphasizes shikantaza (just sitting)—practice IS enlightenment. Rinzai emphasizes koans and sudden breakthrough. Both are valid; most modern practice incorporates elements of both. Choose based on resonance."
            ),
            
            ZenLesson(
                title: "Finding a Teacher",
                subtitle: "The importance of guidance",
                color: .purple,
                isPractice: false,
                content: """
                # The Teacher in Zen
                
                While Zen points to direct experience, a teacher is traditionally essential. The role of the teacher is unique in Zen.
                
                ## Why a Teacher?
                
                **1. Transmission**
                Zen is transmitted "mind to mind." Something passes between awakened teacher and student that can't be captured in words.
                
                **2. Correction**
                Easy to fool yourself. Easy to mistake states for enlightenment. A teacher sees what you can't.
                
                **3. Confirmation**
                When awakening occurs, a teacher can confirm authenticity and guide integration.
                
                **4. Lineage**
                Connection to unbroken chain back to Buddha. Energetic support.
                
                **5. Koan work**
                Koans require dokusan (private interview) for full effectiveness.
                
                ## The Teacher's Role
                
                **What teachers do:**
                - Give teachings
                - Lead meditation
                - Conduct dokusan
                - Embody the practice
                - Challenge and support
                - Transmit dharma
                
                **What teachers don't do:**
                - Make you enlightened (only you can do that)
                - Have all the answers
                - Live perfectly (they're human)
                - Replace your own wisdom
                
                ## Finding a Teacher
                
                **Look for:**
                - Authentic lineage (verifiable)
                - Long practice (decades, not months)
                - Healthy students
                - Ethical conduct
                - Humility
                - Clear teaching
                - Resonance (do you feel drawn?)
                
                **Avoid:**
                - Claims of exclusive truth
                - Sexual or financial exploitation
                - Discouraging questions
                - Isolation from other sanghas
                - Grandiosity
                - Students who seem cult-like
                
                ## Types of Teachers
                
                **Roshi/Sensei/Zenji**: Authorized teacher, dharma transmission
                
                **Senior student**: Not authorized but experienced, can teach basics
                
                **Dharma heir**: Received transmission, can authorize others
                
                ## Starting the Relationship
                
                1. **Visit**: Attend public sits, lectures
                2. **Observe**: Watch how teacher interacts, how students are
                3. **Practice**: Sit with the sangha for a while
                4. **Ask**: Request to become a student if drawn
                5. **Deepen**: Over time, more responsibility, deeper teaching
                
                ## Dokusan
                
                Private interview with teacher. Essential in Zen.
                
                **Format:**
                - Ring bell to enter
                - Three prostrations (bow)
                - Present koan understanding or ask question
                - Teacher responds
                - Three prostrations
                - Exit
                
                **Frequency:** During sesshin: multiple times. Regular practice: weekly or monthly.
                
                ## Online Options
                
                Since COVID, more options for online:
                - Zoom dokusan
                - Online sangha membership
                - Virtual sesshin
                
                Not ideal but functional. Supplement with in-person when possible.
                
                ## If No Teacher Available
                
                You can still practice:
                - Study authentic books
                - Follow online teachers (with discernment)
                - Sit regularly
                - Attend retreats when possible
                - Be humble about your understanding
                - Eventually, find a teacher
                
                ## The Inner Teacher
                
                Ultimately, the outer teacher points to the inner teacher. As you mature:
                - Your own Buddha-nature guides
                - Wisdom arises naturally
                - Teacher becomes less necessary
                - But most keep connection
                
                The teacher is like a finger pointing at the moon. Don't worship the finger—but follow where it points.
                """,
                practiceSteps: [],
                keyTakeaway: "A teacher is essential in Zen for transmission, correction, and confirmation. Look for authentic lineage, healthy students, ethical conduct. The teacher points to your own Buddha-nature—eventually, the outer teacher awakens the inner teacher."
            )
        ]
    }
}

// MARK: - Models

struct ZenLesson: Identifiable {
    let id = UUID()
    let title: String
    let subtitle: String
    let color: Color
    let isPractice: Bool
    let content: String
    let practiceSteps: [String]
    let keyTakeaway: String
}

struct ZenLessonView: View {
    let lesson: ZenLesson
    let index: Int
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        Text("Lesson \(index)")
                            .font(.system(size: 12, weight: .medium))
                            .foregroundColor(lesson.color)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 4)
                            .background(lesson.color.opacity(0.2))
                            .cornerRadius(8)
                        
                        if lesson.isPractice {
                            Label("Practice", systemImage: "figure.mind.and.body")
                                .font(.system(size: 12, weight: .medium))
                                .foregroundColor(.cyan)
                                .padding(.horizontal, 10)
                                .padding(.vertical, 4)
                                .background(Color.cyan.opacity(0.2))
                                .cornerRadius(8)
                        }
                    }
                    
                    Text(lesson.title)
                        .font(.system(size: 26, weight: .bold))
                        .foregroundColor(.white)
                    
                    Text(lesson.subtitle)
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                }
                
                Divider().background(Color.white.opacity(0.2))
                
                if !lesson.practiceSteps.isEmpty {
                    VStack(alignment: .leading, spacing: 12) {
                        HStack {
                            Image(systemName: "list.number")
                                .foregroundColor(.cyan)
                            Text("PRACTICE STEPS")
                                .font(.system(size: 12, weight: .black))
                                .foregroundColor(.cyan)
                        }
                        
                        ForEach(Array(lesson.practiceSteps.enumerated()), id: \.offset) { idx, step in
                            HStack(alignment: .top, spacing: 10) {
                                Text("\(idx + 1)")
                                    .font(.system(size: 12, weight: .bold))
                                    .foregroundColor(.cyan)
                                    .frame(width: 20)
                                Text(step)
                                    .font(.system(size: 13))
                                    .foregroundColor(.white.opacity(0.9))
                            }
                        }
                    }
                    .padding()
                    .background(Color.cyan.opacity(0.1))
                    .cornerRadius(12)
                }
                
                Text(lesson.content)
                    .font(.system(size: 15))
                    .foregroundColor(.white.opacity(0.9))
                    .lineSpacing(6)
                
                VStack(alignment: .leading, spacing: 12) {
                    HStack {
                        Image(systemName: "lightbulb.fill")
                            .foregroundColor(lesson.color)
                        Text("Key Takeaway")
                            .font(.system(size: 14, weight: .bold))
                            .foregroundColor(lesson.color)
                    }
                    
                    Text(lesson.keyTakeaway)
                        .font(.system(size: 16, weight: .medium))
                        .foregroundColor(.white)
                }
                .padding()
                .background(lesson.color.opacity(0.1))
                .cornerRadius(16)
            }
            .padding()
        }
        .background(Color.black.ignoresSafeArea())
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        ZenSatoriCourse()
    }
}
